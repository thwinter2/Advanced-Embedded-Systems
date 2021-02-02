	.arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	test
	.arch armv6
	.syntax unified
	.arm
	.fpu vfp
	.type	test, %function
test:
.LVL0:
.LFB11:
	.file 1 "main.c"
	.loc 1 8 88 view -0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 9 3 view .LVU1
	.loc 1 10 3 view .LVU2
	.loc 1 11 3 view .LVU3
	.loc 1 13 3 view .LVU4
	.loc 1 8 88 is_stmt 0 view .LVU5
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	sub	sp, sp, #16
	.cfi_def_cfa_offset 32
	.loc 1 8 88 view .LVU6
	mov	r6, r2
	mov	r5, r0
	mov	r4, r1
	.loc 1 13 3 view .LVU7
	mov	r0, #3
.LVL1:
	.loc 1 13 3 view .LVU8
	mov	r1, sp
.LVL2:
	.loc 1 13 3 view .LVU9
	bl	clock_gettime
.LVL3:
	.loc 1 14 3 is_stmt 1 view .LVU10
.LBB4:
	.loc 1 14 8 view .LVU11
	.loc 1 14 3 is_stmt 0 view .LVU12
	cmp	r6, #0
	beq	.L2
	cmp	r5, #0
	beq	.L2
	.loc 1 14 12 view .LVU13
	mov	r1, #0
.LVL4:
.L3:
	.loc 1 14 12 view .LVU14
.LBE4:
	.loc 1 8 88 view .LVU15
	mov	r3, #0
.LVL5:
.L4:
.LBB6:
.LBB5:
	.loc 1 16 7 is_stmt 1 discriminator 3 view .LVU16
	.loc 1 16 7 is_stmt 0 discriminator 3 view .LVU17
	add	r3, r3, r4
.LVL6:
	.loc 1 15 5 discriminator 3 view .LVU18
	cmp	r5, r3
	bhi	.L4
.LBE5:
	.loc 1 14 42 discriminator 2 view .LVU19
	add	r1, r1, #1
.LVL7:
	.loc 1 14 3 discriminator 2 view .LVU20
	cmp	r1, r6
	bne	.L3
.LVL8:
.L2:
	.loc 1 14 3 discriminator 2 view .LVU21
.LBE6:
	.loc 1 18 3 is_stmt 1 view .LVU22
	add	r1, sp, #8
	mov	r0, #3
	bl	clock_gettime
.LVL9:
	.loc 1 19 3 view .LVU23
	.loc 1 21 3 view .LVU24
	.loc 1 19 36 is_stmt 0 view .LVU25
	ldr	r2, [sp]
	ldr	r3, [sp, #8]
	.loc 1 19 22 view .LVU26
	ldr	r1, .L14+8
	.loc 1 19 36 view .LVU27
	sub	r3, r3, r2
	.loc 1 19 53 view .LVU28
	ldr	r2, [sp, #12]
	.loc 1 21 32 view .LVU29
	mul	r4, r4, r5
.LVL10:
	.loc 1 21 14 view .LVU30
	vldr.64	d5, .L14
	.loc 1 19 53 view .LVU31
	mla	r3, r1, r3, r2
	.loc 1 20 17 view .LVU32
	ldr	r2, [sp, #4]
	.loc 1 21 21 view .LVU33
	vmov	s15, r4	@ int
	.loc 1 20 17 view .LVU34
	sub	r3, r3, r2
	vmov	s12, r3	@ int
	.loc 1 21 21 view .LVU35
	vcvt.f64.u32	d7, s15
	.loc 1 21 14 view .LVU36
	vcvt.f64.u32	d6, s12
	vmul.f64	d6, d6, d5
	.loc 1 21 21 view .LVU37
	vdiv.f64	d5, d6, d7
	.loc 1 22 1 view .LVU38
	vcvt.u32.f64	s15, d5
	vmov	r0, s15	@ int
	add	sp, sp, #16
	.cfi_def_cfa_offset 16
.LVL11:
	.loc 1 22 1 view .LVU39
	@ sp needed
	pop	{r4, r5, r6, pc}
.LVL12:
.L15:
	.loc 1 22 1 view .LVU40
	.align	3
.L14:
	.word	0
	.word	1083129856
	.word	1000000000
	.cfi_endproc
.LFE11:
	.size	test, .-test
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
.LVL13:
.LFB12:
	.loc 1 24 35 is_stmt 1 view -0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 25 3 view .LVU42
	.loc 1 26 3 view .LVU43
	.loc 1 28 3 view .LVU44
	.loc 1 24 35 is_stmt 0 view .LVU45
	push	{r4, r5, r6, r7, r8, lr}
	.cfi_def_cfa_offset 24
	.cfi_offset 4, -24
	.cfi_offset 5, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 8, -8
	.cfi_offset 14, -4
	vpush.64	{d8}
	.cfi_def_cfa_offset 32
	.cfi_offset 80, -32
	.cfi_offset 81, -28
.LBB11:
.LBB12:
	.loc 1 21 14 view .LVU46
	vldr.64	d8, .L24
	.loc 1 19 22 view .LVU47
	ldr	r8, .L24+8
.LBE12:
.LBE11:
	.loc 1 31 7 view .LVU48
	ldr	r7, .L24+12
	ldr	r6, .L24+16
	.loc 1 24 35 view .LVU49
	sub	sp, sp, #16
	.cfi_def_cfa_offset 48
.LBB21:
.LBB16:
	.loc 1 13 3 view .LVU50
	mov	r5, #11
.LBE16:
.LBE21:
	.loc 1 28 13 view .LVU51
	mov	r4, #16384
.LVL14:
.L17:
	.loc 1 30 7 is_stmt 1 view .LVU52
.LBB22:
.LBI11:
	.loc 1 8 15 view .LVU53
.LBB17:
	.loc 1 9 3 view .LVU54
	.loc 1 10 3 view .LVU55
	.loc 1 11 3 view .LVU56
	.loc 1 13 3 view .LVU57
	mov	r1, sp
	mov	r0, #3
	bl	clock_gettime
.LVL15:
	.loc 1 14 3 view .LVU58
.LBB13:
	.loc 1 14 8 view .LVU59
	.loc 1 14 8 is_stmt 0 view .LVU60
.LBE13:
	.loc 1 13 3 view .LVU61
	mov	r2, #100
.LVL16:
.L21:
	.loc 1 13 3 view .LVU62
.LBE17:
.LBE22:
	.loc 1 24 35 view .LVU63
	mov	r3, #0
.LVL17:
.L18:
.LBB23:
.LBB18:
.LBB15:
.LBB14:
	.loc 1 16 7 is_stmt 1 view .LVU64
	.loc 1 16 7 is_stmt 0 view .LVU65
	add	r3, r3, #4
.LVL18:
	.loc 1 15 5 view .LVU66
	cmp	r3, r4
	bcc	.L18
	.loc 1 15 5 view .LVU67
.LBE14:
	.loc 1 14 3 view .LVU68
	subs	r2, r2, #1
	bne	.L21
.LBE15:
	.loc 1 18 3 is_stmt 1 view .LVU69
	add	r1, sp, #8
	mov	r0, #3
	bl	clock_gettime
.LVL19:
	.loc 1 19 3 view .LVU70
	.loc 1 21 3 view .LVU71
	.loc 1 19 36 is_stmt 0 view .LVU72
	ldr	r2, [sp]
	ldr	r3, [sp, #8]
	.loc 1 19 53 view .LVU73
	ldr	r1, [sp, #12]
	.loc 1 19 36 view .LVU74
	sub	r3, r3, r2
	.loc 1 20 17 view .LVU75
	ldr	r2, [sp, #4]
	.loc 1 19 53 view .LVU76
	mla	r3, r8, r3, r1
	.loc 1 21 32 view .LVU77
	lsl	r1, r4, #2
	.loc 1 20 17 view .LVU78
	sub	r3, r3, r2
	.loc 1 21 32 view .LVU79
	vmov	s10, r1	@ int
	.loc 1 20 17 view .LVU80
	vmov	s14, r3	@ int
.LBE18:
.LBE23:
	.loc 1 31 7 view .LVU81
	mov	r1, r4
	mov	r2, #4
.LBB24:
.LBB19:
	.loc 1 21 21 view .LVU82
	vcvt.f64.s32	d5, s10
	.loc 1 21 14 view .LVU83
	vcvt.f64.u32	d7, s14
.LBE19:
.LBE24:
	.loc 1 31 7 view .LVU84
	mov	r0, r6
	.loc 1 28 65 view .LVU85
	lsl	r4, r4, #1
.LVL20:
.LBB25:
.LBB20:
	.loc 1 21 14 view .LVU86
	vmul.f64	d7, d7, d8
	.loc 1 21 21 view .LVU87
	vdiv.f64	d6, d7, d5
	vcvt.u32.f64	s15, d6
	vmov	r3, s15	@ int
.LVL21:
	.loc 1 21 21 view .LVU88
.LBE20:
.LBE25:
	.loc 1 31 7 is_stmt 1 view .LVU89
	umull	ip, r3, r7, r3
.LVL22:
	.loc 1 31 7 is_stmt 0 view .LVU90
	lsr	r3, r3, #5
	bl	printf
.LVL23:
	.loc 1 28 3 view .LVU91
	subs	r5, r5, #1
	bne	.L17
	.loc 1 34 1 view .LVU92
	mov	r0, r5
	add	sp, sp, #16
	.cfi_def_cfa_offset 32
	@ sp needed
	vldm	sp!, {d8}
	.cfi_restore 80
	.cfi_restore 81
	.cfi_def_cfa_offset 24
	pop	{r4, r5, r6, r7, r8, pc}
.LVL24:
.L25:
	.loc 1 34 1 view .LVU93
	.align	3
.L24:
	.word	0
	.word	1083129856
	.word	1000000000
	.word	1374389535
	.word	.LC0
	.cfi_endproc
.LFE12:
	.size	main, .-main
	.comm	A,268435456,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Size %u Stride %u Time %lu\012\000"
	.text
.Letext0:
	.file 2 "/usr/lib/gcc/arm-linux-gnueabihf/8/include/stddef.h"
	.file 3 "/usr/include/arm-linux-gnueabihf/bits/types.h"
	.file 4 "/usr/include/arm-linux-gnueabihf/bits/types/struct_FILE.h"
	.file 5 "/usr/include/arm-linux-gnueabihf/bits/types/FILE.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "/usr/include/arm-linux-gnueabihf/bits/sys_errlist.h"
	.file 8 "/usr/include/arm-linux-gnueabihf/bits/types/struct_timespec.h"
	.file 9 "/usr/include/time.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x696
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF79
	.byte	0xc
	.4byte	.LASF80
	.4byte	.LASF81
	.4byte	.Ldebug_ranges0+0x68
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF8
	.byte	0x2
	.byte	0xd8
	.byte	0x17
	.4byte	0x31
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x4
	.byte	0x4
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x2
	.4byte	.LASF9
	.byte	0x3
	.byte	0x41
	.byte	0x25
	.4byte	0x64
	.uleb128 0x2
	.4byte	.LASF10
	.byte	0x3
	.byte	0x96
	.byte	0x19
	.4byte	0x8a
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF11
	.uleb128 0x2
	.4byte	.LASF12
	.byte	0x3
	.byte	0x97
	.byte	0x1b
	.4byte	0x72
	.uleb128 0x2
	.4byte	.LASF13
	.byte	0x3
	.byte	0x9e
	.byte	0x1a
	.4byte	0x8a
	.uleb128 0x2
	.4byte	.LASF14
	.byte	0x3
	.byte	0xc2
	.byte	0x21
	.4byte	0x8a
	.uleb128 0x6
	.byte	0x4
	.4byte	0xbb
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF15
	.uleb128 0x7
	.4byte	0xbb
	.uleb128 0x8
	.4byte	.LASF54
	.byte	0x98
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.4byte	0x24e
	.uleb128 0x9
	.4byte	.LASF16
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.4byte	0x5d
	.byte	0
	.uleb128 0x9
	.4byte	.LASF17
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.4byte	0xb5
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF18
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.4byte	0xb5
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF19
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.4byte	0xb5
	.byte	0xc
	.uleb128 0x9
	.4byte	.LASF20
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.4byte	0xb5
	.byte	0x10
	.uleb128 0x9
	.4byte	.LASF21
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.4byte	0xb5
	.byte	0x14
	.uleb128 0x9
	.4byte	.LASF22
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.4byte	0xb5
	.byte	0x18
	.uleb128 0x9
	.4byte	.LASF23
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.4byte	0xb5
	.byte	0x1c
	.uleb128 0x9
	.4byte	.LASF24
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.4byte	0xb5
	.byte	0x20
	.uleb128 0x9
	.4byte	.LASF25
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.4byte	0xb5
	.byte	0x24
	.uleb128 0x9
	.4byte	.LASF26
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.4byte	0xb5
	.byte	0x28
	.uleb128 0x9
	.4byte	.LASF27
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.4byte	0xb5
	.byte	0x2c
	.uleb128 0x9
	.4byte	.LASF28
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.4byte	0x267
	.byte	0x30
	.uleb128 0x9
	.4byte	.LASF29
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.4byte	0x26d
	.byte	0x34
	.uleb128 0x9
	.4byte	.LASF30
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.4byte	0x5d
	.byte	0x38
	.uleb128 0x9
	.4byte	.LASF31
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.4byte	0x5d
	.byte	0x3c
	.uleb128 0x9
	.4byte	.LASF32
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.4byte	0x7e
	.byte	0x40
	.uleb128 0x9
	.4byte	.LASF33
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.4byte	0x41
	.byte	0x44
	.uleb128 0x9
	.4byte	.LASF34
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.4byte	0x4f
	.byte	0x46
	.uleb128 0x9
	.4byte	.LASF35
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.4byte	0x273
	.byte	0x47
	.uleb128 0x9
	.4byte	.LASF36
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.4byte	0x283
	.byte	0x48
	.uleb128 0x9
	.4byte	.LASF37
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.4byte	0x91
	.byte	0x50
	.uleb128 0x9
	.4byte	.LASF38
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.4byte	0x28e
	.byte	0x58
	.uleb128 0x9
	.4byte	.LASF39
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.4byte	0x299
	.byte	0x5c
	.uleb128 0x9
	.4byte	.LASF40
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.4byte	0x26d
	.byte	0x60
	.uleb128 0x9
	.4byte	.LASF41
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.4byte	0x38
	.byte	0x64
	.uleb128 0x9
	.4byte	.LASF42
	.byte	0x4
	.byte	0x5f
	.byte	0xa
	.4byte	0x25
	.byte	0x68
	.uleb128 0x9
	.4byte	.LASF43
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.4byte	0x5d
	.byte	0x6c
	.uleb128 0x9
	.4byte	.LASF44
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.4byte	0x29f
	.byte	0x70
	.byte	0
	.uleb128 0x2
	.4byte	.LASF45
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.4byte	0xc7
	.uleb128 0xa
	.4byte	.LASF82
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0xb
	.4byte	.LASF46
	.uleb128 0x6
	.byte	0x4
	.4byte	0x262
	.uleb128 0x6
	.byte	0x4
	.4byte	0xc7
	.uleb128 0xc
	.4byte	0xbb
	.4byte	0x283
	.uleb128 0xd
	.4byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x25a
	.uleb128 0xb
	.4byte	.LASF47
	.uleb128 0x6
	.byte	0x4
	.4byte	0x289
	.uleb128 0xb
	.4byte	.LASF48
	.uleb128 0x6
	.byte	0x4
	.4byte	0x294
	.uleb128 0xc
	.4byte	0xbb
	.4byte	0x2af
	.uleb128 0xd
	.4byte	0x31
	.byte	0x27
	.byte	0
	.uleb128 0xe
	.4byte	.LASF49
	.byte	0x6
	.byte	0x89
	.byte	0xe
	.4byte	0x2bb
	.uleb128 0x6
	.byte	0x4
	.4byte	0x24e
	.uleb128 0xe
	.4byte	.LASF50
	.byte	0x6
	.byte	0x8a
	.byte	0xe
	.4byte	0x2bb
	.uleb128 0xe
	.4byte	.LASF51
	.byte	0x6
	.byte	0x8b
	.byte	0xe
	.4byte	0x2bb
	.uleb128 0xe
	.4byte	.LASF52
	.byte	0x7
	.byte	0x1a
	.byte	0xc
	.4byte	0x5d
	.uleb128 0xc
	.4byte	0x2fb
	.4byte	0x2f0
	.uleb128 0xf
	.byte	0
	.uleb128 0x7
	.4byte	0x2e5
	.uleb128 0x6
	.byte	0x4
	.4byte	0xc2
	.uleb128 0x7
	.4byte	0x2f5
	.uleb128 0xe
	.4byte	.LASF53
	.byte	0x7
	.byte	0x1b
	.byte	0x1a
	.4byte	0x2f0
	.uleb128 0x8
	.4byte	.LASF55
	.byte	0x8
	.byte	0x8
	.byte	0x9
	.byte	0x8
	.4byte	0x334
	.uleb128 0x9
	.4byte	.LASF56
	.byte	0x8
	.byte	0xb
	.byte	0xc
	.4byte	0x9d
	.byte	0
	.uleb128 0x9
	.4byte	.LASF57
	.byte	0x8
	.byte	0xc
	.byte	0x15
	.4byte	0xa9
	.byte	0x4
	.byte	0
	.uleb128 0xc
	.4byte	0xb5
	.4byte	0x344
	.uleb128 0xd
	.4byte	0x31
	.byte	0x1
	.byte	0
	.uleb128 0xe
	.4byte	.LASF58
	.byte	0x9
	.byte	0x9f
	.byte	0xe
	.4byte	0x334
	.uleb128 0xe
	.4byte	.LASF59
	.byte	0x9
	.byte	0xa0
	.byte	0xc
	.4byte	0x5d
	.uleb128 0xe
	.4byte	.LASF60
	.byte	0x9
	.byte	0xa1
	.byte	0x11
	.4byte	0x8a
	.uleb128 0xe
	.4byte	.LASF61
	.byte	0x9
	.byte	0xa6
	.byte	0xe
	.4byte	0x334
	.uleb128 0xe
	.4byte	.LASF62
	.byte	0x9
	.byte	0xae
	.byte	0xc
	.4byte	0x5d
	.uleb128 0xe
	.4byte	.LASF63
	.byte	0x9
	.byte	0xaf
	.byte	0x11
	.4byte	0x8a
	.uleb128 0xc
	.4byte	0x5d
	.4byte	0x39f
	.uleb128 0x10
	.4byte	0x31
	.4byte	0x3ffffff
	.byte	0
	.uleb128 0x11
	.ascii	"A\000"
	.byte	0x1
	.byte	0x6
	.byte	0x5
	.4byte	0x38c
	.uleb128 0x5
	.byte	0x3
	.4byte	A
	.uleb128 0x12
	.4byte	.LASF83
	.byte	0x1
	.byte	0x18
	.byte	0x5
	.4byte	0x5d
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x527
	.uleb128 0x13
	.4byte	.LASF64
	.byte	0x1
	.byte	0x18
	.byte	0xe
	.4byte	0x5d
	.4byte	.LLST7
	.4byte	.LVUS7
	.uleb128 0x13
	.4byte	.LASF65
	.byte	0x1
	.byte	0x18
	.byte	0x1b
	.4byte	0x527
	.4byte	.LLST8
	.4byte	.LVUS8
	.uleb128 0x14
	.4byte	.LASF66
	.byte	0x1
	.byte	0x19
	.byte	0x10
	.4byte	0x31
	.4byte	.LLST9
	.4byte	.LVUS9
	.uleb128 0x14
	.4byte	.LASF67
	.byte	0x1
	.byte	0x19
	.byte	0x16
	.4byte	0x31
	.4byte	.LLST10
	.4byte	.LVUS10
	.uleb128 0x15
	.4byte	.LASF84
	.byte	0x1
	.byte	0x19
	.byte	0x1e
	.4byte	0x31
	.byte	0x64
	.uleb128 0x14
	.4byte	.LASF68
	.byte	0x1
	.byte	0x1a
	.byte	0x11
	.4byte	0x48
	.4byte	.LLST11
	.4byte	.LVUS11
	.uleb128 0x16
	.4byte	0x52d
	.4byte	.LBI11
	.byte	.LVU53
	.4byte	.Ldebug_ranges0+0x18
	.byte	0x1
	.byte	0x1e
	.byte	0x11
	.4byte	0x511
	.uleb128 0x17
	.4byte	0x556
	.4byte	.LLST12
	.4byte	.LVUS12
	.uleb128 0x17
	.4byte	0x54a
	.4byte	.LLST13
	.4byte	.LVUS13
	.uleb128 0x17
	.4byte	0x53e
	.4byte	.LLST14
	.4byte	.LVUS14
	.uleb128 0x18
	.4byte	.Ldebug_ranges0+0x18
	.uleb128 0x19
	.4byte	0x562
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x19
	.4byte	0x56e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1a
	.4byte	0x57a
	.4byte	.LLST15
	.4byte	.LVUS15
	.uleb128 0x1b
	.4byte	0x586
	.byte	0
	.uleb128 0x1a
	.4byte	0x592
	.4byte	.LLST16
	.4byte	.LVUS16
	.uleb128 0x1c
	.4byte	0x623
	.4byte	.Ldebug_ranges0+0x50
	.4byte	0x4e1
	.uleb128 0x1a
	.4byte	0x59f
	.4byte	.LLST17
	.4byte	.LVUS17
	.uleb128 0x1d
	.4byte	0x639
	.4byte	.LBB14
	.4byte	.LBE14-.LBB14
	.uleb128 0x1a
	.4byte	0x5ac
	.4byte	.LLST18
	.4byte	.LVUS18
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL15
	.4byte	0x680
	.4byte	0x4fa
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x33
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x20
	.4byte	.LVL19
	.4byte	0x680
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x33
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x20
	.4byte	.LVL23
	.4byte	0x68c
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x34
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xb5
	.uleb128 0x21
	.4byte	.LASF85
	.byte	0x1
	.byte	0x8
	.byte	0xf
	.4byte	0x48
	.byte	0x1
	.4byte	0x5b9
	.uleb128 0x22
	.4byte	.LASF69
	.byte	0x1
	.byte	0x8
	.byte	0x21
	.4byte	0x31
	.uleb128 0x22
	.4byte	.LASF70
	.byte	0x1
	.byte	0x8
	.byte	0x39
	.4byte	0x31
	.uleb128 0x22
	.4byte	.LASF71
	.byte	0x1
	.byte	0x8
	.byte	0x4e
	.4byte	0x31
	.uleb128 0x23
	.4byte	.LASF72
	.byte	0x1
	.byte	0x9
	.byte	0x13
	.4byte	0x30c
	.uleb128 0x24
	.ascii	"end\000"
	.byte	0x1
	.byte	0x9
	.byte	0x1a
	.4byte	0x30c
	.uleb128 0x23
	.4byte	.LASF73
	.byte	0x1
	.byte	0xa
	.byte	0x11
	.4byte	0x48
	.uleb128 0x23
	.4byte	.LASF74
	.byte	0x1
	.byte	0xa
	.byte	0x17
	.4byte	0x48
	.uleb128 0x23
	.4byte	.LASF75
	.byte	0x1
	.byte	0xb
	.byte	0x7
	.4byte	0x5d
	.uleb128 0x25
	.uleb128 0x23
	.4byte	.LASF76
	.byte	0x1
	.byte	0xe
	.byte	0xc
	.4byte	0x5d
	.uleb128 0x25
	.uleb128 0x24
	.ascii	"i\000"
	.byte	0x1
	.byte	0xf
	.byte	0xe
	.4byte	0x5d
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x26
	.4byte	0x52d
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x680
	.uleb128 0x17
	.4byte	0x53e
	.4byte	.LLST0
	.4byte	.LVUS0
	.uleb128 0x17
	.4byte	0x54a
	.4byte	.LLST1
	.4byte	.LVUS1
	.uleb128 0x17
	.4byte	0x556
	.4byte	.LLST2
	.4byte	.LVUS2
	.uleb128 0x19
	.4byte	0x562
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x19
	.4byte	0x56e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.4byte	0x57a
	.4byte	.LLST3
	.4byte	.LVUS3
	.uleb128 0x1b
	.4byte	0x586
	.byte	0
	.uleb128 0x1a
	.4byte	0x592
	.4byte	.LLST4
	.4byte	.LVUS4
	.uleb128 0x27
	.4byte	.Ldebug_ranges0+0
	.4byte	0x651
	.uleb128 0x1a
	.4byte	0x59f
	.4byte	.LLST5
	.4byte	.LVUS5
	.uleb128 0x28
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.uleb128 0x1a
	.4byte	0x5ac
	.4byte	.LLST6
	.4byte	.LVUS6
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL3
	.4byte	0x680
	.4byte	0x66a
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x33
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x20
	.4byte	.LVL9
	.4byte	0x680
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x33
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.byte	0
	.uleb128 0x29
	.4byte	.LASF77
	.4byte	.LASF77
	.byte	0x9
	.byte	0xdb
	.byte	0xc
	.uleb128 0x2a
	.4byte	.LASF78
	.4byte	.LASF78
	.byte	0x6
	.2byte	0x14c
	.byte	0xc
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0xb
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LVUS7:
	.uleb128 0
	.uleb128 .LVU52
	.uleb128 .LVU52
	.uleb128 0
.LLST7:
	.4byte	.LVL13
	.4byte	.LVL14
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL14
	.4byte	.LFE12
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS8:
	.uleb128 0
	.uleb128 .LVU52
	.uleb128 .LVU52
	.uleb128 0
.LLST8:
	.4byte	.LVL13
	.4byte	.LVL14
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL14
	.4byte	.LFE12
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS9:
	.uleb128 .LVU45
	.uleb128 .LVU52
	.uleb128 .LVU52
	.uleb128 .LVU86
	.uleb128 .LVU86
	.uleb128 .LVU91
	.uleb128 .LVU91
	.uleb128 .LVU93
.LLST9:
	.4byte	.LVL13
	.4byte	.LVL14
	.2byte	0x4
	.byte	0xa
	.2byte	0x4000
	.byte	0x9f
	.4byte	.LVL14
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL20
	.4byte	.LVL23-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL23
	.4byte	.LVL24
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LVUS10:
	.uleb128 .LVU52
	.uleb128 .LVU91
	.uleb128 .LVU91
	.uleb128 0
.LLST10:
	.4byte	.LVL14
	.4byte	.LVL23
	.2byte	0x2
	.byte	0x34
	.byte	0x9f
	.4byte	.LVL23
	.4byte	.LFE12
	.2byte	0x2
	.byte	0x38
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS11:
	.uleb128 .LVU88
	.uleb128 .LVU90
	.uleb128 .LVU90
	.uleb128 .LVU91
.LLST11:
	.4byte	.LVL21
	.4byte	.LVL22
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL22
	.4byte	.LVL23-1
	.2byte	0x2
	.byte	0x90
	.uleb128 0x4f
	.4byte	0
	.4byte	0
.LVUS12:
	.uleb128 .LVU54
	.uleb128 .LVU88
.LLST12:
	.4byte	.LVL14
	.4byte	.LVL21
	.2byte	0x3
	.byte	0x8
	.byte	0x64
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS13:
	.uleb128 .LVU53
	.uleb128 .LVU88
.LLST13:
	.4byte	.LVL14
	.4byte	.LVL21
	.2byte	0x2
	.byte	0x34
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS14:
	.uleb128 .LVU53
	.uleb128 .LVU86
	.uleb128 .LVU86
	.uleb128 .LVU88
.LLST14:
	.4byte	.LVL14
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL20
	.4byte	.LVL21
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LVUS15:
	.uleb128 .LVU71
	.uleb128 .LVU88
.LLST15:
	.4byte	.LVL19
	.4byte	.LVL21
	.2byte	0x16
	.byte	0x91
	.sleb128 -48
	.byte	0x6
	.byte	0x7d
	.sleb128 0
	.byte	0x6
	.byte	0x1c
	.byte	0xc
	.4byte	0x3b9aca00
	.byte	0x1e
	.byte	0x91
	.sleb128 -52
	.byte	0x6
	.byte	0x1c
	.byte	0x91
	.sleb128 -44
	.byte	0x6
	.byte	0x22
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS16:
	.uleb128 .LVU65
	.uleb128 .LVU70
.LLST16:
	.4byte	.LVL17
	.4byte	.LVL19-1
	.2byte	0x5
	.byte	0x3
	.4byte	A
	.4byte	0
	.4byte	0
.LVUS17:
	.uleb128 .LVU60
	.uleb128 .LVU62
.LLST17:
	.4byte	.LVL15
	.4byte	.LVL16
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS18:
	.uleb128 .LVU62
	.uleb128 .LVU65
	.uleb128 .LVU65
	.uleb128 .LVU66
	.uleb128 .LVU66
	.uleb128 .LVU70
.LLST18:
	.4byte	.LVL16
	.4byte	.LVL17
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL17
	.4byte	.LVL18
	.2byte	0x3
	.byte	0x73
	.sleb128 4
	.byte	0x9f
	.4byte	.LVL18
	.4byte	.LVL19-1
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LVUS0:
	.uleb128 0
	.uleb128 .LVU8
	.uleb128 .LVU8
	.uleb128 .LVU40
	.uleb128 .LVU40
	.uleb128 0
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL1
	.4byte	.LVL12
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL12
	.4byte	.LFE11
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS1:
	.uleb128 0
	.uleb128 .LVU9
	.uleb128 .LVU9
	.uleb128 .LVU30
	.uleb128 .LVU30
	.uleb128 0
.LLST1:
	.4byte	.LVL0
	.4byte	.LVL2
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL2
	.4byte	.LVL10
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL10
	.4byte	.LFE11
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS2:
	.uleb128 0
	.uleb128 .LVU10
	.uleb128 .LVU10
	.uleb128 .LVU40
	.uleb128 .LVU40
	.uleb128 0
.LLST2:
	.4byte	.LVL0
	.4byte	.LVL3-1
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL3-1
	.4byte	.LVL12
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL12
	.4byte	.LFE11
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS3:
	.uleb128 .LVU24
	.uleb128 .LVU39
	.uleb128 .LVU39
	.uleb128 0
.LLST3:
	.4byte	.LVL9
	.4byte	.LVL11
	.2byte	0x16
	.byte	0x91
	.sleb128 -32
	.byte	0x6
	.byte	0x7d
	.sleb128 0
	.byte	0x6
	.byte	0x1c
	.byte	0xc
	.4byte	0x3b9aca00
	.byte	0x1e
	.byte	0x91
	.sleb128 -36
	.byte	0x6
	.byte	0x1c
	.byte	0x91
	.sleb128 -28
	.byte	0x6
	.byte	0x22
	.byte	0x9f
	.4byte	.LVL11
	.4byte	.LFE11
	.2byte	0x16
	.byte	0x91
	.sleb128 -32
	.byte	0x6
	.byte	0x91
	.sleb128 -40
	.byte	0x6
	.byte	0x1c
	.byte	0xc
	.4byte	0x3b9aca00
	.byte	0x1e
	.byte	0x91
	.sleb128 -36
	.byte	0x6
	.byte	0x1c
	.byte	0x91
	.sleb128 -28
	.byte	0x6
	.byte	0x22
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS4:
	.uleb128 .LVU17
	.uleb128 .LVU21
.LLST4:
	.4byte	.LVL5
	.4byte	.LVL8
	.2byte	0x5
	.byte	0x3
	.4byte	A
	.4byte	0
	.4byte	0
.LVUS5:
	.uleb128 .LVU12
	.uleb128 .LVU14
	.uleb128 .LVU14
	.uleb128 .LVU21
.LLST5:
	.4byte	.LVL3
	.4byte	.LVL4
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL4
	.4byte	.LVL8
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LVUS6:
	.uleb128 .LVU14
	.uleb128 .LVU17
	.uleb128 .LVU17
	.uleb128 .LVU18
	.uleb128 .LVU18
	.uleb128 .LVU21
.LLST6:
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL5
	.4byte	.LVL6
	.2byte	0x6
	.byte	0x74
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	.LVL6
	.4byte	.LVL8
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x24
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LBB4
	.4byte	.LBE4
	.4byte	.LBB6
	.4byte	.LBE6
	.4byte	0
	.4byte	0
	.4byte	.LBB11
	.4byte	.LBE11
	.4byte	.LBB21
	.4byte	.LBE21
	.4byte	.LBB22
	.4byte	.LBE22
	.4byte	.LBB23
	.4byte	.LBE23
	.4byte	.LBB24
	.4byte	.LBE24
	.4byte	.LBB25
	.4byte	.LBE25
	.4byte	0
	.4byte	0
	.4byte	.LBB13
	.4byte	.LBE13
	.4byte	.LBB15
	.4byte	.LBE15
	.4byte	0
	.4byte	0
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.LFB12
	.4byte	.LFE12
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF78:
	.ascii	"printf\000"
.LASF10:
	.ascii	"__off_t\000"
.LASF17:
	.ascii	"_IO_read_ptr\000"
.LASF29:
	.ascii	"_chain\000"
.LASF8:
	.ascii	"size_t\000"
.LASF35:
	.ascii	"_shortbuf\000"
.LASF23:
	.ascii	"_IO_buf_base\000"
.LASF7:
	.ascii	"long long unsigned int\000"
.LASF71:
	.ascii	"MaxTimes\000"
.LASF84:
	.ascii	"tests\000"
.LASF73:
	.ascii	"diff\000"
.LASF85:
	.ascii	"test\000"
.LASF79:
	.ascii	"GNU C17 8.3.0 -mfloat-abi=hard -mfpu=vfp -mtls-dial"
	.ascii	"ect=gnu -marm -march=armv6+fp -g -O3\000"
.LASF77:
	.ascii	"clock_gettime\000"
.LASF38:
	.ascii	"_codecvt\000"
.LASF60:
	.ascii	"__timezone\000"
.LASF6:
	.ascii	"long long int\000"
.LASF4:
	.ascii	"signed char\000"
.LASF30:
	.ascii	"_fileno\000"
.LASF18:
	.ascii	"_IO_read_end\000"
.LASF9:
	.ascii	"__quad_t\000"
.LASF11:
	.ascii	"long int\000"
.LASF16:
	.ascii	"_flags\000"
.LASF24:
	.ascii	"_IO_buf_end\000"
.LASF33:
	.ascii	"_cur_column\000"
.LASF47:
	.ascii	"_IO_codecvt\000"
.LASF81:
	.ascii	"/home/pi/AES-2020/Speed/Scalar/memex\000"
.LASF32:
	.ascii	"_old_offset\000"
.LASF37:
	.ascii	"_offset\000"
.LASF63:
	.ascii	"timezone\000"
.LASF75:
	.ascii	"dummy\000"
.LASF46:
	.ascii	"_IO_marker\000"
.LASF49:
	.ascii	"stdin\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF41:
	.ascii	"_freeres_buf\000"
.LASF69:
	.ascii	"ArraySize\000"
.LASF3:
	.ascii	"long unsigned int\000"
.LASF21:
	.ascii	"_IO_write_ptr\000"
.LASF52:
	.ascii	"sys_nerr\000"
.LASF66:
	.ascii	"size\000"
.LASF2:
	.ascii	"short unsigned int\000"
.LASF25:
	.ascii	"_IO_save_base\000"
.LASF80:
	.ascii	"main.c\000"
.LASF36:
	.ascii	"_lock\000"
.LASF31:
	.ascii	"_flags2\000"
.LASF43:
	.ascii	"_mode\000"
.LASF50:
	.ascii	"stdout\000"
.LASF57:
	.ascii	"tv_nsec\000"
.LASF56:
	.ascii	"tv_sec\000"
.LASF14:
	.ascii	"__syscall_slong_t\000"
.LASF22:
	.ascii	"_IO_write_end\000"
.LASF82:
	.ascii	"_IO_lock_t\000"
.LASF54:
	.ascii	"_IO_FILE\000"
.LASF59:
	.ascii	"__daylight\000"
.LASF68:
	.ascii	"time_ps\000"
.LASF53:
	.ascii	"sys_errlist\000"
.LASF28:
	.ascii	"_markers\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF5:
	.ascii	"short int\000"
.LASF48:
	.ascii	"_IO_wide_data\000"
.LASF55:
	.ascii	"timespec\000"
.LASF34:
	.ascii	"_vtable_offset\000"
.LASF61:
	.ascii	"tzname\000"
.LASF45:
	.ascii	"FILE\000"
.LASF67:
	.ascii	"stride\000"
.LASF62:
	.ascii	"daylight\000"
.LASF15:
	.ascii	"char\000"
.LASF70:
	.ascii	"Stride\000"
.LASF12:
	.ascii	"__off64_t\000"
.LASF19:
	.ascii	"_IO_read_base\000"
.LASF27:
	.ascii	"_IO_save_end\000"
.LASF74:
	.ascii	"total\000"
.LASF42:
	.ascii	"__pad5\000"
.LASF13:
	.ascii	"__time_t\000"
.LASF44:
	.ascii	"_unused2\000"
.LASF51:
	.ascii	"stderr\000"
.LASF65:
	.ascii	"argv\000"
.LASF26:
	.ascii	"_IO_backup_base\000"
.LASF76:
	.ascii	"times\000"
.LASF64:
	.ascii	"argc\000"
.LASF40:
	.ascii	"_freeres_list\000"
.LASF39:
	.ascii	"_wide_data\000"
.LASF72:
	.ascii	"start\000"
.LASF58:
	.ascii	"__tzname\000"
.LASF83:
	.ascii	"main\000"
.LASF20:
	.ascii	"_IO_write_base\000"
	.ident	"GCC: (Raspbian 8.3.0-6+rpi1) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
