   1              		.cpu cortex-a72
   2              		.eabi_attribute 28, 1
   3              		.eabi_attribute 23, 1
   4              		.eabi_attribute 24, 1
   5              		.eabi_attribute 25, 1
   6              		.eabi_attribute 26, 2
   7              		.eabi_attribute 30, 2
   8              		.eabi_attribute 34, 1
   9              		.eabi_attribute 18, 4
  10              		.file	"main.c"
  11              		.text
  12              	.Ltext0:
  13              		.cfi_sections	.debug_frame
  14              		.align	2
  15              		.global	init_data
  16              		.arch armv8-a
  17              		.arch_extension crc
  18              		.syntax unified
  19              		.arm
  20              		.fpu crypto-neon-fp-armv8
  22              	init_data:
  23              	.LFB2084:
  24              		.file 1 "main.c"
   1:main.c        **** /*----------------------------------------------------------------------------
   2:main.c        ****  *----------------------------------------------------------------------------*/
   3:main.c        **** #include <math.h>
   4:main.c        **** #include <stdio.h>
   5:main.c        **** #include <stdint.h>
   6:main.c        **** #include <stdlib.h>
   7:main.c        **** #include <string.h>
   8:main.c        **** #include <time.h>
   9:main.c        **** #include <arm_neon.h>
  10:main.c        **** #include <arm_acle.h>
  11:main.c        **** 
  12:main.c        **** #define N_TESTS (100000UL) // (1000000UL) // With >1 test, compiler super-optimizes unsafely?
  13:main.c        **** #define N_ELEMENTS (10000UL) // (1024UL)
  14:main.c        **** 
  15:main.c        **** #define CYCLES_PER_NS (1.5)
  16:main.c        **** 
  17:main.c        **** extern void enable_runfast(void);
  18:main.c        **** 
  19:main.c        **** /*----------------------------------------------------------------------------
  20:main.c        ****   MAIN function
  21:main.c        ****  *----------------------------------------------------------------------------*/
  22:main.c        **** int x[N_ELEMENTS], y[N_ELEMENTS], z[N_ELEMENTS];
  23:main.c        **** 
  24:main.c        **** void init_data(void) {
  25              		.loc 1 24 22 view -0
  26              		.cfi_startproc
  27              		@ args = 0, pretend = 0, frame = 0
  28              		@ frame_needed = 0, uses_anonymous_args = 0
  29              		@ link register save eliminated.
  25:main.c        ****   int i;
  30              		.loc 1 25 3 view .LVU1
  26:main.c        **** 
  27:main.c        ****   for (i=0; i<N_ELEMENTS; i++) {
  31              		.loc 1 27 3 view .LVU2
  32              	.LVL0:
  24:main.c        ****   int i;
  33              		.loc 1 24 22 is_stmt 0 view .LVU3
  34 0000 1A0BDFED 		vldr	d16, .L7
  35 0004 1B1BDFED 		vldr	d17, .L7+8
  36 0008 5460C0F2 		vmov.i32	q11, #4  @ v4si
  37 000c 003000E3 		movw	r3, #:lower16:x
  38 0010 003040E3 		movt	r3, #:upper16:x
  28:main.c        ****     x[i] = N_ELEMENTS/2 - i;
  39              		.loc 1 28 25 view .LVU4
  40 0014 194BDFED 		vldr	d20, .L7+16
  41 0018 1A5BDFED 		vldr	d21, .L7+24
  42 001c 6C209FE5 		ldr	r2, .L7+32
  43              	.LVL1:
  44              	.L2:
  45              		.loc 1 28 5 is_stmt 1 view .LVU5
  46              		.loc 1 28 25 is_stmt 0 view .LVU6
  47 0020 E02864F3 		vsub.i32	q9, q10, q8
  48 0024 E60860F2 		vadd.i32	q8, q8, q11
  49              		.loc 1 28 10 view .LVU7
  50 0028 8D2A43F4 		vst1.32	{q9}, [r3]!
  29:main.c        ****     y[i] = i;
  51              		.loc 1 29 5 is_stmt 1 view .LVU8
  30:main.c        ****     z[i] = 0;
  52              		.loc 1 30 5 view .LVU9
  53              		.loc 1 30 5 is_stmt 0 view .LVU10
  54 002c 020053E1 		cmp	r3, r2
  55 0030 FAFFFF1A 		bne	.L2
  28:main.c        ****     x[i] = N_ELEMENTS/2 - i;
  56              		.loc 1 28 10 view .LVU11
  57 0034 0D0BDFED 		vldr	d16, .L7
  58 0038 0E1BDFED 		vldr	d17, .L7+8
  59 003c 5420C0F2 		vmov.i32	q9, #4  @ v4si
  60 0040 003000E3 		movw	r3, #:lower16:y
  61 0044 003040E3 		movt	r3, #:upper16:y
  62 0048 44209FE5 		ldr	r2, .L7+36
  63              	.L3:
  28:main.c        ****     x[i] = N_ELEMENTS/2 - i;
  64              		.loc 1 28 5 is_stmt 1 view .LVU12
  29:main.c        ****     y[i] = i;
  65              		.loc 1 29 5 view .LVU13
  29:main.c        ****     y[i] = i;
  66              		.loc 1 29 10 is_stmt 0 view .LVU14
  67 004c 8D0A43F4 		vst1.32	{q8}, [r3]!
  68              		.loc 1 30 5 is_stmt 1 view .LVU15
  69              		.loc 1 30 5 is_stmt 0 view .LVU16
  70 0050 030052E1 		cmp	r2, r3
  71 0054 E20860F2 		vadd.i32	q8, q8, q9
  72 0058 FBFFFF1A 		bne	.L3
  73 005c 000000E3 		movw	r0, #:lower16:z
  74 0060 000040E3 		movt	r0, #:upper16:z
  75 0064 402C09E3 		movw	r2, #40000
  76 0068 0010A0E3 		mov	r1, #0
  77 006c FEFFFFEA 		b	memset
  78              	.LVL2:
  79              	.L8:
  80              		.align	3
  81              	.L7:
  82 0070 00000000 		.word	0
  83 0074 01000000 		.word	1
  84 0078 02000000 		.word	2
  85 007c 03000000 		.word	3
  86 0080 88130000 		.word	5000
  87 0084 88130000 		.word	5000
  88 0088 88130000 		.word	5000
  89 008c 88130000 		.word	5000
  90 0090 409C0000 		.word	x+40000
  91 0094 409C0000 		.word	y+40000
  92              		.cfi_endproc
  93              	.LFE2084:
  95              		.align	2
  96              		.global	mult_ints
  97              		.syntax unified
  98              		.arm
  99              		.fpu crypto-neon-fp-armv8
 101              	mult_ints:
 102              	.LVL3:
 103              	.LFB2085:
  31:main.c        ****   }
  32:main.c        **** }
  33:main.c        **** 
  34:main.c        **** int mult_ints(int * ax, int * ay, int * az, int n)
  35:main.c        **** {
 104              		.loc 1 35 1 is_stmt 1 view -0
 105              		.cfi_startproc
 106              		@ args = 0, pretend = 0, frame = 0
 107              		@ frame_needed = 0, uses_anonymous_args = 0
  36:main.c        ****   int prod_sum = 0;
 108              		.loc 1 36 3 view .LVU18
  37:main.c        ****   for (int i=0; i < n; i++) {
 109              		.loc 1 37 3 view .LVU19
 110              	.LBB7:
 111              		.loc 1 37 8 view .LVU20
 112              		.loc 1 37 3 is_stmt 0 view .LVU21
 113 0098 000053E3 		cmp	r3, #0
 114              		.loc 1 37 3 view .LVU22
 115 009c 580000DA 		ble	.L17
 116 00a0 10C082E2 		add	ip, r2, #16
 117              	.LBE7:
  35:main.c        ****   int prod_sum = 0;
 118              		.loc 1 35 1 view .LVU23
 119 00a4 F4416DE1 		strd	r4, [sp, #-20]!
 120              		.cfi_def_cfa_offset 20
 121              		.cfi_offset 4, -20
 122              		.cfi_offset 5, -16
 123              		.cfi_offset 6, -12
 124              		.cfi_offset 7, -8
 125              		.cfi_offset 14, -4
 126 00a8 104081E2 		add	r4, r1, #16
 127 00ac 0050A0E1 		mov	r5, r0
 128 00b0 0C0051E1 		cmp	r1, ip
 129 00b4 04005231 		cmpcc	r2, r4
 130 00b8 F860CDE1 		strd	r6, [sp, #8]
 131 00bc 10E08DE5 		str	lr, [sp, #16]
 132 00c0 10E085E2 		add	lr, r5, #16
 133 00c4 0140A023 		movcs	r4, #1
 134 00c8 0040A033 		movcc	r4, #0
 135 00cc 0C0055E1 		cmp	r5, ip
 136 00d0 0E005231 		cmpcc	r2, lr
 137 00d4 01E0A023 		movcs	lr, #1
 138 00d8 00E0A033 		movcc	lr, #0
 139 00dc 010043E2 		sub	r0, r3, #1
 140              	.LVL4:
  35:main.c        ****   int prod_sum = 0;
 141              		.loc 1 35 1 view .LVU24
 142 00e0 04E00EE0 		and	lr, lr, r4
 143 00e4 030050E3 		cmp	r0, #3
 144 00e8 00C0A093 		movls	ip, #0
 145 00ec 01C00E82 		andhi	ip, lr, #1
 146 00f0 00005CE3 		cmp	ip, #0
 147 00f4 3200000A 		beq	.L11
 148 00f8 2301A0E1 		lsr	r0, r3, #2
 149              	.LBB8:
 150              		.loc 1 37 3 view .LVU25
 151 00fc 5020C0F2 		vmov.i32	q9, #0  @ v4si
 152 0100 02C0A0E1 		mov	ip, r2
 153 0104 0540A0E1 		mov	r4, r5
 154 0108 01E0A0E1 		mov	lr, r1
 155 010c 000282E0 		add	r0, r2, r0, lsl #4
 156              	.LVL5:
 157              	.L12:
  38:main.c        ****     az[i] += ax[i]*ay[i];
 158              		.loc 1 38 5 is_stmt 1 discriminator 3 view .LVU26
 159              		.loc 1 38 16 is_stmt 0 discriminator 3 view .LVU27
 160 0110 8D6A64F4 		vld1.32	{q11}, [r4]!
 161              		.loc 1 38 22 discriminator 3 view .LVU28
 162 0114 8D4A6EF4 		vld1.32	{q10}, [lr]!
 163              		.loc 1 38 11 discriminator 3 view .LVU29
 164 0118 8F0A6CF4 		vld1.32	{q8}, [ip]
 165 011c E40966F2 		vmla.i32	q8, q11, q10
 166 0120 8D0A4CF4 		vst1.32	{q8}, [ip]!
  39:main.c        ****     prod_sum += az[i];
 167              		.loc 1 39 5 is_stmt 1 discriminator 3 view .LVU30
 168 0124 00005CE1 		cmp	ip, r0
 169              		.loc 1 39 14 is_stmt 0 discriminator 3 view .LVU31
 170 0128 E02862F2 		vadd.i32	q9, q9, q8
 171              		.loc 1 39 14 discriminator 3 view .LVU32
 172 012c F7FFFF1A 		bne	.L12
 173 0130 A32862F2 		vadd.i32	d18, d18, d19
 174 0134 03C0C3E3 		bic	ip, r3, #3
 175 0138 0C0053E1 		cmp	r3, ip
 176 013c B22B62F2 		vpadd.i32	d18, d18, d18
 177 0140 900B12EE 		vmov.32	r0, d18[0]
 178 0144 1A00000A 		beq	.L9
 179              	.LVL6:
  38:main.c        ****     az[i] += ax[i]*ay[i];
 180              		.loc 1 38 5 is_stmt 1 view .LVU33
  38:main.c        ****     az[i] += ax[i]*ay[i];
 181              		.loc 1 38 19 is_stmt 0 view .LVU34
 182 0148 0C4195E7 		ldr	r4, [r5, ip, lsl #2]
  37:main.c        ****     az[i] += ax[i]*ay[i];
 183              		.loc 1 37 25 view .LVU35
 184 014c 01E08CE2 		add	lr, ip, #1
  37:main.c        ****     az[i] += ax[i]*ay[i];
 185              		.loc 1 37 3 view .LVU36
 186 0150 0E0053E1 		cmp	r3, lr
  38:main.c        ****     az[i] += ax[i]*ay[i];
 187              		.loc 1 38 11 view .LVU37
 188 0154 0CE1A0E1 		lsl	lr, ip, #2
  38:main.c        ****     az[i] += ax[i]*ay[i];
 189              		.loc 1 38 19 view .LVU38
 190 0158 0C7191E7 		ldr	r7, [r1, ip, lsl #2]
  38:main.c        ****     az[i] += ax[i]*ay[i];
 191              		.loc 1 38 11 view .LVU39
 192 015c 0C6192E7 		ldr	r6, [r2, ip, lsl #2]
 193 0160 976424E0 		mla	r4, r7, r4, r6
 194              		.loc 1 39 14 view .LVU40
 195 0164 040080E0 		add	r0, r0, r4
 196              	.LVL7:
  38:main.c        ****     az[i] += ax[i]*ay[i];
 197              		.loc 1 38 11 view .LVU41
 198 0168 0C4182E7 		str	r4, [r2, ip, lsl #2]
 199              		.loc 1 39 5 is_stmt 1 view .LVU42
 200              	.LVL8:
  37:main.c        ****     az[i] += ax[i]*ay[i];
 201              		.loc 1 37 3 is_stmt 0 view .LVU43
 202 016c 100000DA 		ble	.L9
  38:main.c        ****     az[i] += ax[i]*ay[i];
 203              		.loc 1 38 11 view .LVU44
 204 0170 04408EE2 		add	r4, lr, #4
  38:main.c        ****     az[i] += ax[i]*ay[i];
 205              		.loc 1 38 5 is_stmt 1 view .LVU45
  37:main.c        ****     az[i] += ax[i]*ay[i];
 206              		.loc 1 37 25 is_stmt 0 view .LVU46
 207 0174 02C08CE2 		add	ip, ip, #2
 208              	.LVL9:
  37:main.c        ****     az[i] += ax[i]*ay[i];
 209              		.loc 1 37 3 view .LVU47
 210 0178 0C0053E1 		cmp	r3, ip
  38:main.c        ****     az[i] += ax[i]*ay[i];
 211              		.loc 1 38 19 view .LVU48
 212 017c 046095E7 		ldr	r6, [r5, r4]
 213 0180 04C091E7 		ldr	ip, [r1, r4]
 214              	.LVL10:
  38:main.c        ****     az[i] += ax[i]*ay[i];
 215              		.loc 1 38 11 view .LVU49
 216 0184 043092E7 		ldr	r3, [r2, r4]
 217              	.LVL11:
  38:main.c        ****     az[i] += ax[i]*ay[i];
 218              		.loc 1 38 11 view .LVU50
 219 0188 9C3623E0 		mla	r3, ip, r6, r3
 220              		.loc 1 39 14 view .LVU51
 221 018c 030080E0 		add	r0, r0, r3
 222              	.LVL12:
  38:main.c        ****     az[i] += ax[i]*ay[i];
 223              		.loc 1 38 11 view .LVU52
 224 0190 043082E7 		str	r3, [r2, r4]
 225              	.LVL13:
 226              		.loc 1 39 5 is_stmt 1 view .LVU53
  37:main.c        ****     az[i] += ax[i]*ay[i];
 227              		.loc 1 37 3 is_stmt 0 view .LVU54
 228 0194 060000DA 		ble	.L9
  38:main.c        ****     az[i] += ax[i]*ay[i];
 229              		.loc 1 38 11 view .LVU55
 230 0198 08308EE2 		add	r3, lr, #8
  38:main.c        ****     az[i] += ax[i]*ay[i];
 231              		.loc 1 38 5 is_stmt 1 view .LVU56
  38:main.c        ****     az[i] += ax[i]*ay[i];
 232              		.loc 1 38 19 is_stmt 0 view .LVU57
 233 019c 03E091E7 		ldr	lr, [r1, r3]
 234 01a0 03C095E7 		ldr	ip, [r5, r3]
  38:main.c        ****     az[i] += ax[i]*ay[i];
 235              		.loc 1 38 11 view .LVU58
 236 01a4 031092E7 		ldr	r1, [r2, r3]
 237              	.LVL14:
  38:main.c        ****     az[i] += ax[i]*ay[i];
 238              		.loc 1 38 11 view .LVU59
 239 01a8 9E1C21E0 		mla	r1, lr, ip, r1
 240              		.loc 1 39 14 view .LVU60
 241 01ac 010080E0 		add	r0, r0, r1
 242              	.LVL15:
  38:main.c        ****     az[i] += ax[i]*ay[i];
 243              		.loc 1 38 11 view .LVU61
 244 01b0 031082E7 		str	r1, [r2, r3]
 245              		.loc 1 39 5 is_stmt 1 view .LVU62
 246              	.LVL16:
 247              	.L9:
 248              		.loc 1 39 5 is_stmt 0 view .LVU63
 249              	.LBE8:
  40:main.c        ****   }
  41:main.c        ****   return prod_sum;
  42:main.c        **** }
 250              		.loc 1 42 1 view .LVU64
 251 01b4 D040CDE1 		ldrd	r4, [sp]
 252              		.cfi_remember_state
 253              		.cfi_restore 5
 254              		.cfi_restore 4
 255 01b8 D860CDE1 		ldrd	r6, [sp, #8]
 256              		.cfi_restore 7
 257              		.cfi_restore 6
 258 01bc 10D08DE2 		add	sp, sp, #16
 259              		.cfi_def_cfa_offset 4
 260 01c0 04F09DE4 		ldr	pc, [sp], #4
 261              		.cfi_restore 15
 262              		.cfi_def_cfa_offset 0
 263              	.LVL17:
 264              	.L11:
 265              		.cfi_restore_state
 266              		.loc 1 42 1 view .LVU65
 267 01c4 033182E0 		add	r3, r2, r3, lsl #2
 268              	.LVL18:
 269              		.loc 1 42 1 view .LVU66
 270 01c8 045045E2 		sub	r5, r5, #4
 271              	.LVL19:
 272              		.loc 1 42 1 view .LVU67
 273 01cc 041041E2 		sub	r1, r1, #4
 274              	.LVL20:
  36:main.c        ****   for (int i=0; i < n; i++) {
 275              		.loc 1 36 7 view .LVU68
 276 01d0 0C00A0E1 		mov	r0, ip
 277              	.LVL21:
 278              	.L15:
 279              	.LBB9:
  38:main.c        ****     prod_sum += az[i];
 280              		.loc 1 38 5 is_stmt 1 view .LVU69
  38:main.c        ****     prod_sum += az[i];
 281              		.loc 1 38 19 is_stmt 0 view .LVU70
 282 01d4 04C0B5E5 		ldr	ip, [r5, #4]!
 283 01d8 0440B1E5 		ldr	r4, [r1, #4]!
  38:main.c        ****     prod_sum += az[i];
 284              		.loc 1 38 11 view .LVU71
 285 01dc 00E092E5 		ldr	lr, [r2]
 286 01e0 94EC2CE0 		mla	ip, r4, ip, lr
 287 01e4 04C082E4 		str	ip, [r2], #4
  39:main.c        ****   }
 288              		.loc 1 39 5 is_stmt 1 view .LVU72
  37:main.c        ****     az[i] += ax[i]*ay[i];
 289              		.loc 1 37 3 is_stmt 0 view .LVU73
 290 01e8 030052E1 		cmp	r2, r3
  39:main.c        ****   }
 291              		.loc 1 39 14 view .LVU74
 292 01ec 0C0080E0 		add	r0, r0, ip
 293              	.LVL22:
  37:main.c        ****     az[i] += ax[i]*ay[i];
 294              		.loc 1 37 3 view .LVU75
 295 01f0 F7FFFF1A 		bne	.L15
 296              	.LBE9:
 297              		.loc 1 42 1 view .LVU76
 298 01f4 D040CDE1 		ldrd	r4, [sp]
 299              		.cfi_restore 5
 300              		.cfi_restore 4
 301 01f8 D860CDE1 		ldrd	r6, [sp, #8]
 302              		.cfi_restore 7
 303              		.cfi_restore 6
 304 01fc 10D08DE2 		add	sp, sp, #16
 305              		.cfi_def_cfa_offset 4
 306 0200 04F09DE4 		ldr	pc, [sp], #4
 307              		.cfi_restore 15
 308              		.cfi_def_cfa_offset 0
 309              	.LVL23:
 310              	.L17:
 311              		.cfi_restore 14
  36:main.c        ****   for (int i=0; i < n; i++) {
 312              		.loc 1 36 7 view .LVU77
 313 0204 0000A0E3 		mov	r0, #0
 314              	.LVL24:
  41:main.c        **** }
 315              		.loc 1 41 3 is_stmt 1 view .LVU78
 316              		.loc 1 42 1 is_stmt 0 view .LVU79
 317 0208 1EFF2FE1 		bx	lr
 318              		.cfi_endproc
 319              	.LFE2085:
 321              		.align	2
 322              		.global	sum_ints
 323              		.syntax unified
 324              		.arm
 325              		.fpu crypto-neon-fp-armv8
 327              	sum_ints:
 328              	.LVL25:
 329              	.LFB2086:
  43:main.c        **** 
  44:main.c        **** int sum_ints(int * aa, int n) {
 330              		.loc 1 44 31 is_stmt 1 view -0
 331              		.cfi_startproc
 332              		@ args = 0, pretend = 0, frame = 0
 333              		@ frame_needed = 0, uses_anonymous_args = 0
  45:main.c        ****   int i, sum_val = 0;
 334              		.loc 1 45 3 view .LVU81
  46:main.c        **** 
  47:main.c        ****   for (i=0; i < n; i++) {
 335              		.loc 1 47 3 view .LVU82
 336              		.loc 1 47 3 is_stmt 0 view .LVU83
 337 020c 000051E3 		cmp	r1, #0
 338              		.loc 1 47 3 view .LVU84
 339 0210 260000DA 		ble	.L30
 340 0214 013041E2 		sub	r3, r1, #1
 341 0218 030053E3 		cmp	r3, #3
 342 021c 2600009A 		bls	.L31
 343 0220 2121A0E1 		lsr	r2, r1, #2
 344 0224 5000C0F2 		vmov.i32	q8, #0  @ v4si
 345 0228 0030A0E1 		mov	r3, r0
 346 022c 022280E0 		add	r2, r0, r2, lsl #4
 347              	.LVL26:
 348              	.L27:
  48:main.c        ****     sum_val += aa[i];
 349              		.loc 1 48 5 is_stmt 1 discriminator 3 view .LVU85
 350              		.loc 1 48 18 is_stmt 0 discriminator 3 view .LVU86
 351 0230 8D2A63F4 		vld1.32	{q9}, [r3]!
 352 0234 020053E1 		cmp	r3, r2
 353              		.loc 1 48 13 discriminator 3 view .LVU87
 354 0238 E20860F2 		vadd.i32	q8, q8, q9
 355              		.loc 1 48 13 discriminator 3 view .LVU88
 356 023c FBFFFF1A 		bne	.L27
 357 0240 A10860F2 		vadd.i32	d16, d16, d17
 358 0244 0320C1E3 		bic	r2, r1, #3
 359 0248 020051E1 		cmp	r1, r2
 360 024c B00B60F2 		vpadd.i32	d16, d16, d16
 361 0250 903B10EE 		vmov.32	r3, d16[0]
 362 0254 1600000A 		beq	.L34
 363              	.L26:
 364              	.LVL27:
 365              		.loc 1 48 5 is_stmt 1 view .LVU89
 366              		.loc 1 48 13 is_stmt 0 view .LVU90
 367 0258 02C190E7 		ldr	ip, [r0, r2, lsl #2]
  44:main.c        ****   int i, sum_val = 0;
 368              		.loc 1 44 31 view .LVU91
 369 025c 04E02DE5 		str	lr, [sp, #-4]!
 370              		.cfi_def_cfa_offset 4
 371              		.cfi_offset 14, -4
  47:main.c        ****     sum_val += aa[i];
 372              		.loc 1 47 21 view .LVU92
 373 0260 01E082E2 		add	lr, r2, #1
  47:main.c        ****     sum_val += aa[i];
 374              		.loc 1 47 3 view .LVU93
 375 0264 0E0051E1 		cmp	r1, lr
 376              		.loc 1 48 18 view .LVU94
 377 0268 02E1A0E1 		lsl	lr, r2, #2
 378              		.loc 1 48 13 view .LVU95
 379 026c 0C3083E0 		add	r3, r3, ip
 380              	.LVL28:
  47:main.c        ****     sum_val += aa[i];
 381              		.loc 1 47 3 view .LVU96
 382 0270 0C0000DA 		ble	.L24
 383              		.loc 1 48 5 is_stmt 1 view .LVU97
 384              		.loc 1 48 18 is_stmt 0 view .LVU98
 385 0274 0E0080E0 		add	r0, r0, lr
 386              	.LVL29:
  47:main.c        ****     sum_val += aa[i];
 387              		.loc 1 47 21 view .LVU99
 388 0278 02C082E2 		add	ip, r2, #2
 389              		.loc 1 48 13 view .LVU100
 390 027c 04E090E5 		ldr	lr, [r0, #4]
  47:main.c        ****     sum_val += aa[i];
 391              		.loc 1 47 3 view .LVU101
 392 0280 0C0051E1 		cmp	r1, ip
 393              		.loc 1 48 13 view .LVU102
 394 0284 0E3083E0 		add	r3, r3, lr
 395              	.LVL30:
  47:main.c        ****     sum_val += aa[i];
 396              		.loc 1 47 3 view .LVU103
 397 0288 060000DA 		ble	.L24
 398              		.loc 1 48 5 is_stmt 1 view .LVU104
 399              		.loc 1 48 13 is_stmt 0 view .LVU105
 400 028c 08C090E5 		ldr	ip, [r0, #8]
 401              	.LVL31:
  47:main.c        ****     sum_val += aa[i];
 402              		.loc 1 47 21 view .LVU106
 403 0290 032082E2 		add	r2, r2, #3
 404              	.LVL32:
  47:main.c        ****     sum_val += aa[i];
 405              		.loc 1 47 3 view .LVU107
 406 0294 020051E1 		cmp	r1, r2
 407              		.loc 1 48 13 view .LVU108
 408 0298 0C3083E0 		add	r3, r3, ip
 409              	.LVL33:
  47:main.c        ****     sum_val += aa[i];
 410              		.loc 1 47 3 view .LVU109
 411 029c 010000DA 		ble	.L24
 412              		.loc 1 48 5 is_stmt 1 view .LVU110
 413              		.loc 1 48 13 is_stmt 0 view .LVU111
 414 02a0 0C2090E5 		ldr	r2, [r0, #12]
 415 02a4 023083E0 		add	r3, r3, r2
 416              	.LVL34:
 417              	.L24:
  49:main.c        ****   }
  50:main.c        ****   return sum_val;
  51:main.c        **** }
 418              		.loc 1 51 1 view .LVU112
 419 02a8 0300A0E1 		mov	r0, r3
 420 02ac 04F09DE4 		ldr	pc, [sp], #4
 421              	.LVL35:
 422              	.L30:
 423              		.cfi_def_cfa_offset 0
 424              		.cfi_restore 14
  45:main.c        **** 
 425              		.loc 1 45 10 view .LVU113
 426 02b0 0030A0E3 		mov	r3, #0
  50:main.c        **** }
 427              		.loc 1 50 3 is_stmt 1 view .LVU114
 428              	.LVL36:
 429              	.L34:
 430              		.loc 1 51 1 is_stmt 0 view .LVU115
 431 02b4 0300A0E1 		mov	r0, r3
 432              	.LVL37:
 433              		.loc 1 51 1 view .LVU116
 434 02b8 1EFF2FE1 		bx	lr
 435              	.LVL38:
 436              	.L31:
  45:main.c        **** 
 437              		.loc 1 45 10 view .LVU117
 438 02bc 0030A0E3 		mov	r3, #0
  47:main.c        ****     sum_val += aa[i];
 439              		.loc 1 47 9 view .LVU118
 440 02c0 0320A0E1 		mov	r2, r3
 441 02c4 E3FFFFEA 		b	.L26
 442              		.cfi_endproc
 443              	.LFE2086:
 445              		.global	__aeabi_l2f
 446              		.section	.text.startup,"ax",%progbits
 447              		.align	2
 448              		.global	main
 449              		.syntax unified
 450              		.arm
 451              		.fpu crypto-neon-fp-armv8
 453              	main:
 454              	.LVL39:
 455              	.LFB2087:
  52:main.c        **** 
  53:main.c        **** int main (int argc, char * * argv) {
 456              		.loc 1 53 36 is_stmt 1 view -0
 457              		.cfi_startproc
 458              		@ args = 0, pretend = 0, frame = 24
 459              		@ frame_needed = 0, uses_anonymous_args = 0
  54:main.c        ****   struct timespec start, end, pre;
 460              		.loc 1 54 3 view .LVU120
  55:main.c        ****   long long diff;
 461              		.loc 1 55 3 view .LVU121
  56:main.c        ****   int sum = 0;
 462              		.loc 1 56 3 view .LVU122
  57:main.c        ****   float  el_time;
 463              		.loc 1 57 3 view .LVU123
  58:main.c        ****   int n;
 464              		.loc 1 58 3 view .LVU124
  59:main.c        **** 
  60:main.c        ****   init_data();
 465              		.loc 1 60 3 view .LVU125
 466              	.LBB10:
 467              	.LBI10:
  24:main.c        ****   int i;
 468              		.loc 1 24 6 view .LVU126
 469              	.LBB11:
  25:main.c        **** 
 470              		.loc 1 25 3 view .LVU127
  27:main.c        ****     x[i] = N_ELEMENTS/2 - i;
 471              		.loc 1 27 3 view .LVU128
  27:main.c        ****     x[i] = N_ELEMENTS/2 - i;
 472              		.loc 1 27 3 is_stmt 0 view .LVU129
 473              	.LBE11:
 474              	.LBE10:
  53:main.c        ****   struct timespec start, end, pre;
 475              		.loc 1 53 36 view .LVU130
 476 0000 6C0BDFED 		vldr	d16, .L46
 477 0004 6D1BDFED 		vldr	d17, .L46+8
 478 0008 5460C0F2 		vmov.i32	q11, #4  @ v4si
 479 000c FC416DE1 		strd	r4, [sp, #-28]!
 480              		.cfi_def_cfa_offset 28
 481              		.cfi_offset 4, -28
 482              		.cfi_offset 5, -24
 483              		.cfi_offset 6, -20
 484              		.cfi_offset 7, -16
 485              		.cfi_offset 8, -12
 486              		.cfi_offset 9, -8
 487              		.cfi_offset 14, -4
 488              	.LBB14:
 489              	.LBB12:
  28:main.c        ****     y[i] = i;
 490              		.loc 1 28 25 view .LVU131
 491 0010 6C4BDFED 		vldr	d20, .L46+16
 492 0014 6D5BDFED 		vldr	d21, .L46+24
 493              	.LBE12:
 494              	.LBE14:
  53:main.c        ****   struct timespec start, end, pre;
 495              		.loc 1 53 36 view .LVU132
 496 0018 F860CDE1 		strd	r6, [sp, #8]
 497 001c 006000E3 		movw	r6, #:lower16:x
 498 0020 006040E3 		movt	r6, #:upper16:x
 499 0024 B0219FE5 		ldr	r2, .L46+36
 500 0028 0630A0E1 		mov	r3, r6
 501 002c F081CDE1 		strd	r8, [sp, #16]
 502 0030 18E08DE5 		str	lr, [sp, #24]
 503 0034 2CD04DE2 		sub	sp, sp, #44
 504              		.cfi_def_cfa_offset 72
 505              	.LVL40:
 506              	.L37:
 507              	.LBB15:
 508              	.LBB13:
  28:main.c        ****     y[i] = i;
 509              		.loc 1 28 5 is_stmt 1 view .LVU133
  28:main.c        ****     y[i] = i;
 510              		.loc 1 28 25 is_stmt 0 view .LVU134
 511 0038 E02864F3 		vsub.i32	q9, q10, q8
 512 003c E60860F2 		vadd.i32	q8, q8, q11
  28:main.c        ****     y[i] = i;
 513              		.loc 1 28 10 view .LVU135
 514 0040 8D2A43F4 		vst1.32	{q9}, [r3]!
  29:main.c        ****     z[i] = 0;
 515              		.loc 1 29 5 is_stmt 1 view .LVU136
  30:main.c        ****   }
 516              		.loc 1 30 5 view .LVU137
  30:main.c        ****   }
 517              		.loc 1 30 5 is_stmt 0 view .LVU138
 518 0044 020053E1 		cmp	r3, r2
 519 0048 FAFFFF1A 		bne	.L37
  28:main.c        ****     y[i] = i;
 520              		.loc 1 28 10 view .LVU139
 521 004c 590BDFED 		vldr	d16, .L46
 522 0050 5A1BDFED 		vldr	d17, .L46+8
 523 0054 5420C0F2 		vmov.i32	q9, #4  @ v4si
 524 0058 007000E3 		movw	r7, #:lower16:y
 525 005c 007040E3 		movt	r7, #:upper16:y
 526 0060 78219FE5 		ldr	r2, .L46+40
 527 0064 0730A0E1 		mov	r3, r7
 528              	.L38:
  28:main.c        ****     y[i] = i;
 529              		.loc 1 28 5 is_stmt 1 view .LVU140
  29:main.c        ****     z[i] = 0;
 530              		.loc 1 29 5 view .LVU141
  29:main.c        ****     z[i] = 0;
 531              		.loc 1 29 10 is_stmt 0 view .LVU142
 532 0068 8D0A43F4 		vst1.32	{q8}, [r3]!
  30:main.c        ****   }
 533              		.loc 1 30 5 is_stmt 1 view .LVU143
  30:main.c        ****   }
 534              		.loc 1 30 5 is_stmt 0 view .LVU144
 535 006c 030052E1 		cmp	r2, r3
 536 0070 E20860F2 		vadd.i32	q8, q8, q9
 537 0074 FBFFFF1A 		bne	.L38
 538 0078 402C09E3 		movw	r2, #40000
 539 007c 0010A0E3 		mov	r1, #0
 540              	.LVL41:
  30:main.c        ****   }
 541              		.loc 1 30 5 view .LVU145
 542 0080 000000E3 		movw	r0, #:lower16:z
 543              	.LVL42:
  30:main.c        ****   }
 544              		.loc 1 30 5 view .LVU146
 545 0084 000040E3 		movt	r0, #:upper16:z
 546 0088 FEFFFFEB 		bl	memset
 547              	.LVL43:
  30:main.c        ****   }
 548              		.loc 1 30 5 view .LVU147
 549              	.LBE13:
 550              	.LBE15:
  61:main.c        ****   clock_gettime(CLOCK_THREAD_CPUTIME_ID, &pre);
 551              		.loc 1 61 3 is_stmt 1 view .LVU148
 552 008c 20108DE2 		add	r1, sp, #32
 553 0090 0300A0E3 		mov	r0, #3
 554 0094 FEFFFFEB 		bl	clock_gettime
 555              	.LVL44:
  62:main.c        ****   clock_gettime(CLOCK_THREAD_CPUTIME_ID, &start);
 556              		.loc 1 62 3 view .LVU149
 557 0098 10108DE2 		add	r1, sp, #16
 558 009c 0300A0E3 		mov	r0, #3
 559 00a0 FEFFFFEB 		bl	clock_gettime
 560              	.LVL45:
  63:main.c        **** 
  64:main.c        ****   for (n=0; n<N_TESTS; n++) {
 561              		.loc 1 64 3 view .LVU150
 562              		.loc 1 64 3 is_stmt 0 view .LVU151
 563 00a4 38019FE5 		ldr	r0, .L46+44
  62:main.c        ****   clock_gettime(CLOCK_THREAD_CPUTIME_ID, &start);
 564              		.loc 1 62 3 view .LVU152
 565 00a8 A04608E3 		movw	r4, #34464
 566 00ac 014040E3 		movt	r4, 1
  56:main.c        ****   float  el_time;
 567              		.loc 1 56 7 view .LVU153
 568 00b0 0050A0E3 		mov	r5, #0
 569              	.LVL46:
 570              	.L40:
  56:main.c        ****   float  el_time;
 571              		.loc 1 56 7 view .LVU154
 572 00b4 5020C0F2 		vmov.i32	q9, #0  @ v4si
 573 00b8 003000E3 		movw	r3, #:lower16:z
 574 00bc 003040E3 		movt	r3, #:upper16:z
 575 00c0 0710A0E1 		mov	r1, r7
 576 00c4 0620A0E1 		mov	r2, r6
 577              	.L39:
 578              	.LBB16:
 579              	.LBB17:
 580              	.LBB18:
  38:main.c        ****     prod_sum += az[i];
 581              		.loc 1 38 5 is_stmt 1 view .LVU155
  38:main.c        ****     prod_sum += az[i];
 582              		.loc 1 38 11 is_stmt 0 view .LVU156
 583 00c8 8F0A63F4 		vld1.32	{q8}, [r3]
  38:main.c        ****     prod_sum += az[i];
 584              		.loc 1 38 22 view .LVU157
 585 00cc 8D6A61F4 		vld1.32	{q11}, [r1]!
  38:main.c        ****     prod_sum += az[i];
 586              		.loc 1 38 16 view .LVU158
 587 00d0 8D4A62F4 		vld1.32	{q10}, [r2]!
  38:main.c        ****     prod_sum += az[i];
 588              		.loc 1 38 11 view .LVU159
 589 00d4 E40966F2 		vmla.i32	q8, q11, q10
 590 00d8 8D0A43F4 		vst1.32	{q8}, [r3]!
  39:main.c        ****   }
 591              		.loc 1 39 5 is_stmt 1 view .LVU160
 592 00dc 030050E1 		cmp	r0, r3
  39:main.c        ****   }
 593              		.loc 1 39 14 is_stmt 0 view .LVU161
 594 00e0 E02862F2 		vadd.i32	q9, q9, q8
 595              	.LVL47:
  39:main.c        ****   }
 596              		.loc 1 39 14 view .LVU162
 597 00e4 F7FFFF1A 		bne	.L39
 598 00e8 A32862F2 		vadd.i32	d18, d18, d19
 599              	.LBE18:
 600              	.LBE17:
 601              	.LBE16:
 602              		.loc 1 64 3 view .LVU163
 603 00ec 014054E2 		subs	r4, r4, #1
 604 00f0 B22B62F2 		vpadd.i32	d18, d18, d18
 605 00f4 903B12EE 		vmov.32	r3, d18[0]
 606              	.LBB20:
 607              	.LBB19:
  41:main.c        **** }
 608              		.loc 1 41 3 is_stmt 1 view .LVU164
  41:main.c        **** }
 609              		.loc 1 41 3 is_stmt 0 view .LVU165
 610              	.LBE19:
 611              	.LBE20:
  65:main.c        ****     // sum += sum_ints(x, N_ELEMENTS);
  66:main.c        ****     sum += mult_ints(x, y, z, N_ELEMENTS);
 612              		.loc 1 66 9 view .LVU166
 613 00f8 035085E0 		add	r5, r5, r3
 614              	.LVL48:
  64:main.c        ****     // sum += sum_ints(x, N_ELEMENTS);
 615              		.loc 1 64 3 view .LVU167
 616 00fc ECFFFF1A 		bne	.L40
  67:main.c        ****   }
  68:main.c        **** 
  69:main.c        ****   clock_gettime(CLOCK_THREAD_CPUTIME_ID, &end);
 617              		.loc 1 69 3 is_stmt 1 view .LVU168
 618 0100 18108DE2 		add	r1, sp, #24
 619 0104 0300A0E3 		mov	r0, #3
 620 0108 FEFFFFEB 		bl	clock_gettime
 621              	.LVL49:
  70:main.c        ****   diff = ((long long) 1000000000) * (end.tv_sec - start.tv_sec) +
 622              		.loc 1 70 3 view .LVU169
  71:main.c        ****     (end.tv_nsec - start.tv_nsec);
  72:main.c        ****   // Remove overhead of clock_gettime call
  73:main.c        ****   diff -= ((long long) 1000000000) * (start.tv_sec - pre.tv_sec) +
  74:main.c        ****     (start.tv_nsec - pre.tv_nsec);
  75:main.c        **** 
  76:main.c        ****   printf("Sum = %d\n", sum);
 623              		.loc 1 76 3 is_stmt 0 view .LVU170
 624 010c 0510A0E1 		mov	r1, r5
  70:main.c        ****   diff = ((long long) 1000000000) * (end.tv_sec - start.tv_sec) +
 625              		.loc 1 70 56 view .LVU171
 626 0110 10C09DE5 		ldr	ip, [sp, #16]
  70:main.c        ****   diff = ((long long) 1000000000) * (end.tv_sec - start.tv_sec) +
 627              		.loc 1 70 8 view .LVU172
 628 0114 CAECA0E3 		mov	lr, #51712
 629 0118 9AEB43E3 		movt	lr, 15258
 630              		.loc 1 76 3 view .LVU173
 631 011c 000000E3 		movw	r0, #:lower16:.LC0
 632 0120 000040E3 		movt	r0, #:upper16:.LC0
  71:main.c        ****     (end.tv_nsec - start.tv_nsec);
 633              		.loc 1 71 25 view .LVU174
 634 0124 14309DE5 		ldr	r3, [sp, #20]
  71:main.c        ****     (end.tv_nsec - start.tv_nsec);
 635              		.loc 1 71 18 view .LVU175
 636 0128 1C209DE5 		ldr	r2, [sp, #28]
  74:main.c        **** 
 637              		.loc 1 74 20 view .LVU176
 638 012c 24609DE5 		ldr	r6, [sp, #36]
  70:main.c        ****   diff = ((long long) 1000000000) * (end.tv_sec - start.tv_sec) +
 639              		.loc 1 70 49 view .LVU177
 640 0130 18509DE5 		ldr	r5, [sp, #24]
 641              	.LVL50:
  71:main.c        ****     (end.tv_nsec - start.tv_nsec);
 642              		.loc 1 71 18 view .LVU178
 643 0134 032042E0 		sub	r2, r2, r3
  73:main.c        ****     (start.tv_nsec - pre.tv_nsec);
 644              		.loc 1 73 52 view .LVU179
 645 0138 20809DE5 		ldr	r8, [sp, #32]
  74:main.c        **** 
 646              		.loc 1 74 20 view .LVU180
 647 013c 066043E0 		sub	r6, r3, r6
  70:main.c        ****     (end.tv_nsec - start.tv_nsec);
 648              		.loc 1 70 8 view .LVU181
 649 0140 C23FA0E1 		asr	r3, r2, #31
  73:main.c        ****     (start.tv_nsec - pre.tv_nsec);
 650              		.loc 1 73 66 view .LVU182
 651 0144 C67FA0E1 		asr	r7, r6, #31
  70:main.c        ****     (end.tv_nsec - start.tv_nsec);
 652              		.loc 1 70 49 view .LVU183
 653 0148 0C5045E0 		sub	r5, r5, ip
  73:main.c        ****     (start.tv_nsec - pre.tv_nsec);
 654              		.loc 1 73 52 view .LVU184
 655 014c 08C04CE0 		sub	ip, ip, r8
  70:main.c        ****     (end.tv_nsec - start.tv_nsec);
 656              		.loc 1 70 8 view .LVU185
 657 0150 9E25E3E0 		smlal	r2, r3, lr, r5
 658              	.LVL51:
  73:main.c        ****     (start.tv_nsec - pre.tv_nsec);
 659              		.loc 1 73 3 is_stmt 1 view .LVU186
  73:main.c        ****     (start.tv_nsec - pre.tv_nsec);
 660              		.loc 1 73 66 is_stmt 0 view .LVU187
 661 0154 9E6CE7E0 		smlal	r6, r7, lr, ip
  73:main.c        ****     (start.tv_nsec - pre.tv_nsec);
 662              		.loc 1 73 8 view .LVU188
 663 0158 062052E0 		subs	r2, r2, r6
 664 015c 0730C3E0 		sbc	r3, r3, r7
 665              	.LVL52:
  73:main.c        ****     (start.tv_nsec - pre.tv_nsec);
 666              		.loc 1 73 8 view .LVU189
 667 0160 0280A0E1 		mov	r8, r2
 668 0164 0390A0E1 		mov	r9, r3
 669              	.LVL53:
 670              		.loc 1 76 3 is_stmt 1 view .LVU190
 671 0168 FEFFFFEB 		bl	printf
 672              	.LVL54:
  77:main.c        ****   el_time =  ((float) diff)/(N_ELEMENTS*N_TESTS);
 673              		.loc 1 77 3 view .LVU191
 674              		.loc 1 77 15 is_stmt 0 view .LVU192
 675 016c 0910A0E1 		mov	r1, r9
 676 0170 0800A0E1 		mov	r0, r8
 677 0174 FEFFFFEB 		bl	__aeabi_l2f
 678              	.LVL55:
 679              		.loc 1 77 11 view .LVU193
 680 0178 900A06EE 		vmov	s13, r0
  78:main.c        ****   printf("Average %.3f ns (%.3f cycles) per element (%ld)\n", el_time,
  79:main.c        **** 	 el_time*CYCLES_PER_NS, N_ELEMENTS);
 681              		.loc 1 79 10 view .LVU194
 682 017c 087AF7EE 		vmov.f32	s15, #1.5e+0
  78:main.c        ****   printf("Average %.3f ns (%.3f cycles) per element (%ld)\n", el_time,
 683              		.loc 1 78 3 view .LVU195
 684 0180 103702E3 		movw	r3, #10000
  77:main.c        ****   el_time =  ((float) diff)/(N_ELEMENTS*N_TESTS);
 685              		.loc 1 77 11 view .LVU196
 686 0184 137A9FED 		vldr.32	s14, .L46+32
  78:main.c        ****   printf("Average %.3f ns (%.3f cycles) per element (%ld)\n", el_time,
 687              		.loc 1 78 3 view .LVU197
 688 0188 000000E3 		movw	r0, #:lower16:.LC1
 689 018c 000040E3 		movt	r0, #:upper16:.LC1
 690 0190 08308DE5 		str	r3, [sp, #8]
  77:main.c        ****   el_time =  ((float) diff)/(N_ELEMENTS*N_TESTS);
 691              		.loc 1 77 11 view .LVU198
 692 0194 877A26EE 		vmul.f32	s14, s13, s14
 693              	.LVL56:
  78:main.c        ****   printf("Average %.3f ns (%.3f cycles) per element (%ld)\n", el_time,
 694              		.loc 1 78 3 is_stmt 1 view .LVU199
 695 0198 C70AF7EE 		vcvt.f64.f32	d16, s14
 696              		.loc 1 79 10 is_stmt 0 view .LVU200
 697 019c 277A67EE 		vmul.f32	s15, s14, s15
  78:main.c        ****   printf("Average %.3f ns (%.3f cycles) per element (%ld)\n", el_time,
 698              		.loc 1 78 3 view .LVU201
 699 01a0 302B53EC 		vmov	r2, r3, d16
 700 01a4 E70AF7EE 		vcvt.f64.f32	d16, s15
 701 01a8 000BCDED 		vstr.64	d16, [sp]
 702 01ac FEFFFFEB 		bl	printf
 703              	.LVL57:
  80:main.c        ****   exit(0);
 704              		.loc 1 80 3 is_stmt 1 view .LVU202
 705 01b0 0400A0E1 		mov	r0, r4
 706 01b4 FEFFFFEB 		bl	exit
 707              	.LVL58:
 708              	.L47:
 709              		.align	3
 710              	.L46:
 711 01b8 00000000 		.word	0
 712 01bc 01000000 		.word	1
 713 01c0 02000000 		.word	2
 714 01c4 03000000 		.word	3
 715 01c8 88130000 		.word	5000
 716 01cc 88130000 		.word	5000
 717 01d0 88130000 		.word	5000
 718 01d4 88130000 		.word	5000
 719 01d8 5F708930 		.word	814313567
 720 01dc 409C0000 		.word	x+40000
 721 01e0 409C0000 		.word	y+40000
 722 01e4 409C0000 		.word	z+40000
 723              		.cfi_endproc
 724              	.LFE2087:
 726              		.comm	z,40000,4
 727              		.comm	y,40000,4
 728              		.comm	x,40000,4
 729              		.section	.rodata.str1.4,"aMS",%progbits,1
 730              		.align	2
 731              	.LC0:
 732 0000 53756D20 		.ascii	"Sum = %d\012\000"
 732      3D202564 
 732      0A00
 733 000a 0000     		.space	2
 734              	.LC1:
 735 000c 41766572 		.ascii	"Average %.3f ns (%.3f cycles) per element (%ld)\012"
 735      61676520 
 735      252E3366 
 735      206E7320 
 735      28252E33 
 736 003c 00       		.ascii	"\000"
 737              		.text
 738              	.Letext0:
 739              		.file 2 "/usr/include/arm-linux-gnueabihf/bits/types.h"
 740              		.file 3 "/usr/lib/gcc/arm-linux-gnueabihf/8/include/stddef.h"
 741              		.file 4 "/usr/include/arm-linux-gnueabihf/bits/types/struct_FILE.h"
 742              		.file 5 "/usr/include/arm-linux-gnueabihf/bits/types/FILE.h"
 743              		.file 6 "/usr/include/math.h"
 744              		.file 7 "/usr/include/stdio.h"
 745              		.file 8 "/usr/include/arm-linux-gnueabihf/bits/sys_errlist.h"
 746              		.file 9 "/usr/include/arm-linux-gnueabihf/bits/types/struct_timespec.h"
 747              		.file 10 "/usr/include/time.h"
 748              		.file 11 "/usr/include/stdlib.h"
 749              		.file 12 "<built-in>"
