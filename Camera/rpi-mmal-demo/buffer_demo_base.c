/* 
 * File:   buffer_demo.c
 * Author: Tasanakorn
 *
 * Created on May 22, 2013, 1:52 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <math.h>
#include <stdint.h>

#include "bcm_host.h"
#include "interface/vcos/vcos.h"

#include "interface/mmal/mmal.h"
#include "interface/mmal/util/mmal_default_components.h"
#include "interface/mmal/util/mmal_connection.h"

// Realtime
#include <sched.h>


#include "is_options.h"
#include "video_callback.h"
#include "keyboard.h"
#include "PCA9685_servo_driver.h"

// GPIO
#ifdef LOG_TIMES
 FILE * fp;
#endif

#define MMAL_CAMERA_PREVIEW_PORT 0
#define MMAL_CAMERA_VIDEO_PORT 1
#define MMAL_CAMERA_CAPTURE_PORT 2

MMAL_POOL_T *camera_video_port_pool;
MMAL_POOL_T *preview_input_port_pool;
MMAL_PORT_T *preview_input_port = NULL;

#define MY_RT_PRIORITY 50 // MAX_USER_RT_PRIO /* Highest possible */

static void preview_buffer_callback(MMAL_PORT_T *port, MMAL_BUFFER_HEADER_T *buffer) {
  //printf("INFO:preview_buffer_callback buffer->length = %d\n", buffer->length);  
  mmal_buffer_header_release(buffer);
}


int main(int argc, char** argv) {
    MMAL_COMPONENT_T *camera = 0;
    MMAL_COMPONENT_T *preview = 0;
    MMAL_ES_FORMAT_T *format;
    MMAL_STATUS_T status;
    MMAL_PORT_T *camera_preview_port = NULL, *camera_video_port = NULL, *camera_still_port = NULL;

    MMAL_CONNECTION_T *camera_preview_connection = 0;

    int rc, old_scheduler_policy;
    struct sched_param my_params;

    PCA9685_init(I2C_ADDR);
    PCA9685_setPWMFreq(60);  // Analog servos run at ~60 Hz updates
    setServoDegree(SERVO_TILT_CH, ServoTiltDegree);
    setServoDegree(SERVO_PAN_CH, ServoPanDegree);
    
    
#ifdef LOG_TIMES
    fp = fopen("log.csv", "w");
#endif
    printf("Running...\n");

#if 0    // Does not work - locks up program
    printf("Raising priority\n");
    /* Passing zero specifies caller's (our) policy */
    old_scheduler_policy = sched_getscheduler(0);
    my_params.sched_priority = MY_RT_PRIORITY;
    /* Passing zero specifies callers (our) pid */
    rc = sched_setscheduler(0, SCHED_RR, &my_params);
    if ( rc == -1 ) {
      printf("failed.\n");
      return -1;
    } else
      printf("succeeded.\n");
#endif
    
    bcm_host_init();

    status = mmal_component_create(MMAL_COMPONENT_DEFAULT_CAMERA, &camera);
    if (status != MMAL_SUCCESS) {
        printf("Error: create camera %x\n", status);
        return -1;
    }

    camera_preview_port = camera->output[MMAL_CAMERA_PREVIEW_PORT];
    camera_video_port = camera->output[MMAL_CAMERA_VIDEO_PORT];
    camera_still_port = camera->output[MMAL_CAMERA_CAPTURE_PORT];

    {
        MMAL_PARAMETER_CAMERA_CONFIG_T cam_config = {
            { MMAL_PARAMETER_CAMERA_CONFIG, sizeof (cam_config)},
            .max_stills_w = 1280,
            .max_stills_h = 720,
            .stills_yuv422 = 0,
            .one_shot_stills = 1,
            .max_preview_video_w = 1280,
            .max_preview_video_h = 720,
            .num_preview_video_frames = 3,
            .stills_capture_circular_buffer_height = 0,
            .fast_preview_resume = 0,
            .use_stc_timestamp = MMAL_PARAM_TIMESTAMP_MODE_RESET_STC
        };
        mmal_port_parameter_set(camera->control, &cam_config.hdr);
    }

    // Setup camera preview port format 
    format = camera_preview_port->format;

    format->encoding = MMAL_ENCODING_OPAQUE;
    format->encoding_variant = MMAL_ENCODING_I420;

    format->es->video.width = 1280;
    format->es->video.height = 720;
    format->es->video.crop.x = 0;
    format->es->video.crop.y = 0;
    format->es->video.crop.width = 1280;
    format->es->video.crop.height = 720;

    status = mmal_port_format_commit(camera_preview_port);

    if (status != MMAL_SUCCESS) {
        printf("Error: camera viewfinder format couldn't be set\n");
        return -1;
    }

    // Setup camera video port format
    //mmal_format_copy(camera_video_port->format, camera_preview_port->format);

    format = camera_video_port->format;

    format->encoding = MMAL_ENCODING_I420;
    format->encoding_variant = MMAL_ENCODING_I420;

    format->es->video.width = 1280;
    format->es->video.height = 720;
    format->es->video.crop.x = 0;
    format->es->video.crop.y = 0;
    format->es->video.crop.width = 1280;
    format->es->video.crop.height = 720;
    format->es->video.frame_rate.num = 30; // Change frame rate here if needed
    format->es->video.frame_rate.den = 1;


    camera_video_port->buffer_size = camera_video_port->buffer_size_recommended;
    camera_video_port->buffer_num = 2;

    status = mmal_port_format_commit(camera_video_port);

    printf(" camera video buffer_size = %d\n", camera_video_port->buffer_size);
    printf(" camera video buffer_num = %d\n", camera_video_port->buffer_num);
    if (status != MMAL_SUCCESS) {
        printf("Error: unable to commit camera video port format (%u)\n", status);
        return -1;
    }

    // crate pool form camera video port
    camera_video_port_pool = (MMAL_POOL_T *)mmal_port_pool_create(camera_video_port, camera_video_port->buffer_num, camera_video_port->buffer_size);
    camera_video_port->userdata = (struct MMAL_PORT_USERDATA_T *) camera_video_port_pool;

    status = mmal_port_enable(camera_video_port, video_buffer_callback);
    if (status != MMAL_SUCCESS) {
        printf("Error: unable to enable camera video port (%u)\n", status);
        return -1;
    }

    status = mmal_component_enable(camera);


    status = mmal_component_create(MMAL_COMPONENT_DEFAULT_VIDEO_RENDERER, &preview);
    if (status != MMAL_SUCCESS) {
        printf("Error: unable to create preview (%u)\n", status);
        return -1;
    }

    preview_input_port = preview->input[0];
    {
        MMAL_DISPLAYREGION_T param;
        param.hdr.id = MMAL_PARAMETER_DISPLAYREGION;
        param.hdr.size = sizeof (MMAL_DISPLAYREGION_T);
        param.set = MMAL_DISPLAY_SET_LAYER;
        param.layer = 0;
        param.set |= MMAL_DISPLAY_SET_FULLSCREEN;
        param.fullscreen = 1;
        status = mmal_port_parameter_set(preview_input_port, &param.hdr);
        if (status != MMAL_SUCCESS && status != MMAL_ENOSYS) {
            printf("Error: unable to set preview port parameters (%u)\n", status);
            return -1;
        }
    }
    mmal_format_copy(preview_input_port->format, camera_video_port->format);

    format = preview_input_port->format;

    format->encoding = MMAL_ENCODING_I420;
    format->encoding_variant = MMAL_ENCODING_I420;

    format->es->video.width = 1280;
    format->es->video.height = 720;
    format->es->video.crop.x = 0;
    format->es->video.crop.y = 0;
    format->es->video.crop.width = 1280;
    format->es->video.crop.height = 720;
    format->es->video.frame_rate.num = 30; // 30;
    format->es->video.frame_rate.den = 1;

    preview_input_port->buffer_size = camera_video_port->buffer_size_recommended;
    preview_input_port->buffer_num = 4;

    printf(" preview buffer_size = %d\n", preview_input_port->buffer_size);
    printf(" preview buffer_num = %d\n", preview_input_port->buffer_num);
    
    status = mmal_port_format_commit(preview_input_port);

    preview_input_port_pool = (MMAL_POOL_T *)mmal_port_pool_create(preview_input_port, preview_input_port->buffer_num, preview_input_port->buffer_size);

    preview_input_port->userdata = (struct MMAL_PORT_USERDATA_T *) preview_input_port_pool;
    status = mmal_port_enable(preview_input_port, preview_buffer_callback);
    if (status != MMAL_SUCCESS) {
        printf("Error: unable to enable preview input port (%u)\n", status);
        return -1;
    }

    /*
    status = mmal_connection_create(&camera_preview_connection, camera_preview_port, preview_input_port, MMAL_CONNECTION_FLAG_TUNNELLING | MMAL_CONNECTION_FLAG_ALLOCATION_ON_INPUT);
    if (status != MMAL_SUCCESS) {
        printf("Error: unable to create connection (%u)\n", status);
        return -1;
    }

    status = mmal_connection_enable(camera_preview_connection);
    if (status != MMAL_SUCCESS) {
        printf("Error: unable to enable connection (%u)\n", status);
        return -1;
    }
     */

    if (1) {
        // Send all the buffers to the encoder output port
        int num = mmal_queue_length(camera_video_port_pool->queue);
        int q;

        for (q = 0; q < num; q++) {
            MMAL_BUFFER_HEADER_T *buffer = mmal_queue_get(camera_video_port_pool->queue);

            if (!buffer)
                printf("Unable to get a required buffer %d from pool queue\n", q);

            if (mmal_port_send_buffer(camera_video_port, buffer) != MMAL_SUCCESS)
                printf("Unable to send a buffer to encoder output port (%d)\n", q);
        }


    }

    if (mmal_port_parameter_set_boolean(camera_video_port, MMAL_PARAMETER_CAPTURE, 1) != MMAL_SUCCESS) {
        printf("%s: Failed to start capture\n", __func__);
    }

    while (run) {
      processKeyboardEvent();
    };

    return 0;
}

