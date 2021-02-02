
ledflash:     file format elf32-littlearm


Disassembly of section .init:

000103fc <_init>:
   103fc:	e92d4008 	push	{r3, lr}
   10400:	eb000078 	bl	105e8 <call_weak_fn>
   10404:	e8bd8008 	pop	{r3, pc}

Disassembly of section .plt:

00010408 <.plt>:
   10408:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
   1040c:	e59fe004 	ldr	lr, [pc, #4]	; 10418 <.plt+0x10>
   10410:	e08fe00e 	add	lr, pc, lr
   10414:	e5bef008 	ldr	pc, [lr, #8]!
   10418:	00010be8 	.word	0x00010be8

0001041c <printf@plt>:
   1041c:	e28fc600 	add	ip, pc, #0, 12
   10420:	e28cca10 	add	ip, ip, #16, 20	; 0x10000
   10424:	e5bcfbe8 	ldr	pc, [ip, #3048]!	; 0xbe8

00010428 <getuid@plt>:
   10428:	e28fc600 	add	ip, pc, #0, 12
   1042c:	e28cca10 	add	ip, ip, #16, 20	; 0x10000
   10430:	e5bcfbe0 	ldr	pc, [ip, #3040]!	; 0xbe0

00010434 <puts@plt>:
   10434:	e28fc600 	add	ip, pc, #0, 12
   10438:	e28cca10 	add	ip, ip, #16, 20	; 0x10000
   1043c:	e5bcfbd8 	ldr	pc, [ip, #3032]!	; 0xbd8

00010440 <__libc_start_main@plt>:
   10440:	e28fc600 	add	ip, pc, #0, 12
   10444:	e28cca10 	add	ip, ip, #16, 20	; 0x10000
   10448:	e5bcfbd0 	ldr	pc, [ip, #3024]!	; 0xbd0

0001044c <strerror@plt>:
   1044c:	e28fc600 	add	ip, pc, #0, 12
   10450:	e28cca10 	add	ip, ip, #16, 20	; 0x10000
   10454:	e5bcfbc8 	ldr	pc, [ip, #3016]!	; 0xbc8

00010458 <__gmon_start__@plt>:
   10458:	e28fc600 	add	ip, pc, #0, 12
   1045c:	e28cca10 	add	ip, ip, #16, 20	; 0x10000
   10460:	e5bcfbc0 	ldr	pc, [ip, #3008]!	; 0xbc0

00010464 <open@plt>:
   10464:	e28fc600 	add	ip, pc, #0, 12
   10468:	e28cca10 	add	ip, ip, #16, 20	; 0x10000
   1046c:	e5bcfbb8 	ldr	pc, [ip, #3000]!	; 0xbb8

00010470 <mmap@plt>:
   10470:	e28fc600 	add	ip, pc, #0, 12
   10474:	e28cca10 	add	ip, ip, #16, 20	; 0x10000
   10478:	e5bcfbb0 	ldr	pc, [ip, #2992]!	; 0xbb0

0001047c <getpagesize@plt>:
   1047c:	e28fc600 	add	ip, pc, #0, 12
   10480:	e28cca10 	add	ip, ip, #16, 20	; 0x10000
   10484:	e5bcfba8 	ldr	pc, [ip, #2984]!	; 0xba8

00010488 <__errno_location@plt>:
   10488:	e28fc600 	add	ip, pc, #0, 12
   1048c:	e28cca10 	add	ip, ip, #16, 20	; 0x10000
   10490:	e5bcfba0 	ldr	pc, [ip, #2976]!	; 0xba0

00010494 <abort@plt>:
   10494:	e28fc600 	add	ip, pc, #0, 12
   10498:	e28cca10 	add	ip, ip, #16, 20	; 0x10000
   1049c:	e5bcfb98 	ldr	pc, [ip, #2968]!	; 0xb98

000104a0 <close@plt>:
   104a0:	e28fc600 	add	ip, pc, #0, 12
   104a4:	e28cca10 	add	ip, ip, #16, 20	; 0x10000
   104a8:	e5bcfb90 	ldr	pc, [ip, #2960]!	; 0xb90

Disassembly of section .text:

000104ac <main>:
#define GPSET0       0x1c         // from Figure 6-X
#define GPCLR0       0x28
#define GPLVL0       0x34
static volatile uint32_t *gpio;   // pointer to the gpio (*int)

int main() {
   104ac:	e92d4030 	push	{r4, r5, lr}
   104b0:	e24dd00c 	sub	sp, sp, #12
   int fd, x;
   printf("Start of GPIO memory-manipulation test program.\n");
   104b4:	e59f00d4 	ldr	r0, [pc, #212]	; 10590 <main+0xe4>
   104b8:	ebffffdd 	bl	10434 <puts@plt>
   if(getuid()!=0) {
   104bc:	ebffffd9 	bl	10428 <getuid@plt>
   104c0:	e2505000 	subs	r5, r0, #0
   104c4:	1a000025 	bne	10560 <main+0xb4>
      printf("You must run this program as root. Exiting.\n");
      return -EPERM;
   }
   if ((fd = open("/dev/mem", O_RDWR | O_SYNC)) < 0) {
   104c8:	e59f10c4 	ldr	r1, [pc, #196]	; 10594 <main+0xe8>
   104cc:	e59f00c4 	ldr	r0, [pc, #196]	; 10598 <main+0xec>
   104d0:	ebffffe3 	bl	10464 <open@plt>
   104d4:	e2504000 	subs	r4, r0, #0
   104d8:	ba000024 	blt	10570 <main+0xc4>
      printf("Unable to open /dev/mem: %s\n", strerror(errno));
      return -EBUSY;
   }
   // get a pointer that points to the peripheral base for the GPIOs
   gpio = (uint32_t *) mmap(0, getpagesize(), PROT_READ|PROT_WRITE,
   104dc:	ebffffe6 	bl	1047c <getpagesize@plt>
   104e0:	e59f30b4 	ldr	r3, [pc, #180]	; 1059c <main+0xf0>
   104e4:	e3a02003 	mov	r2, #3
   104e8:	e58d3004 	str	r3, [sp, #4]
   104ec:	e58d4000 	str	r4, [sp]
   104f0:	e3a03001 	mov	r3, #1
   104f4:	e1a01000 	mov	r1, r0
   104f8:	e1a00005 	mov	r0, r5
   104fc:	ebffffdb 	bl	10470 <mmap@plt>
   *(gpio + 2) = (*(gpio + 2) & ~(7 << 21) | (0 << 21));
   // writing the 000 is not necessary but is there for clarity
#if 1
   do {
      // turn the LED on using the bit 17 on the GPSET0 register
      *(gpio + (GPSET0/4)) = 1 << 17;  // Turn the LED on
   10500:	e3a03802 	mov	r3, #131072	; 0x20000
   *(gpio + 1) = (*(gpio + 1) & ~(7 << 21) | (1 << 21));
   10504:	e5902004 	ldr	r2, [r0, #4]
   10508:	e3c2260e 	bic	r2, r2, #14680064	; 0xe00000
   1050c:	e3822602 	orr	r2, r2, #2097152	; 0x200000
   10510:	e5802004 	str	r2, [r0, #4]
   *(gpio + 2) = (*(gpio + 2) & ~(7 << 21) | (0 << 21));
   10514:	e5902008 	ldr	r2, [r0, #8]
   10518:	e3c2260e 	bic	r2, r2, #14680064	; 0xe00000
   1051c:	e5802008 	str	r2, [r0, #8]
      *(gpio + (GPSET0/4)) = 1 << 17;  // Turn the LED on
   10520:	e580301c 	str	r3, [r0, #28]
      for(x=0;x<TOG_DELAY;x++){}  // delay hack -- balanced for while()
      *(gpio + (GPCLR0/4)) = 1 << 17;  // turn the LED off
   10524:	e5803028 	str	r3, [r0, #40]	; 0x28
      for(x=0;x<TOG_DELAY;x++){}  // delay hack -- balanced for while()
      *(gpio + (GPSET0/4)) = 1 << 17;  // Turn the LED on
   10528:	e580301c 	str	r3, [r0, #28]
      for(x=0;x<TOG_DELAY;x++){}  // delay hack -- balanced for while()
      *(gpio + (GPCLR0/4)) = 1 << 17;  // turn the LED off
   1052c:	e5803028 	str	r3, [r0, #40]	; 0x28
      for(x=0;x<TOG_DELAY;x++){}  // delay hack -- balanced for while()
      *(gpio + (GPSET0/4)) = 1 << 17;  // Turn the LED on
   10530:	e580301c 	str	r3, [r0, #28]
      for(x=0;x<TOG_DELAY;x++){}  // delay hack -- balanced for while()
      *(gpio + (GPCLR0/4)) = 1 << 17;  // turn the LED off
   10534:	e5803028 	str	r3, [r0, #40]	; 0x28
      for(x=0;x<1000;x++){}  // delay hack -- balanced for while()
   }
   while((*(gpio+(GPLVL0/4))&(1<<27))==0); // only true if bit 27 high#else
   10538:	e5902034 	ldr	r2, [r0, #52]	; 0x34
   1053c:	e3120302 	tst	r2, #134217728	; 0x8000000
   10540:	0afffff6 	beq	10520 <main+0x74>
      for(x=0;x<49;x++){}  // delay hack -- balanced for while()
   }
   while((*(gpio+(GPLVL0/4))&(1<<27))==0); // only true if bit 27 high
#endif

   printf("Button was pressed - end of example program.\n");
   10544:	e59f0054 	ldr	r0, [pc, #84]	; 105a0 <main+0xf4>
   10548:	ebffffb9 	bl	10434 <puts@plt>
   close(fd);
   1054c:	e1a00004 	mov	r0, r4
   10550:	ebffffd2 	bl	104a0 <close@plt>
   return 0;
   10554:	e3a00000 	mov	r0, #0
}
   10558:	e28dd00c 	add	sp, sp, #12
   1055c:	e8bd8030 	pop	{r4, r5, pc}
      printf("You must run this program as root. Exiting.\n");
   10560:	e59f003c 	ldr	r0, [pc, #60]	; 105a4 <main+0xf8>
   10564:	ebffffb2 	bl	10434 <puts@plt>
      return -EPERM;
   10568:	e3e00000 	mvn	r0, #0
   1056c:	eafffff9 	b	10558 <main+0xac>
      printf("Unable to open /dev/mem: %s\n", strerror(errno));
   10570:	ebffffc4 	bl	10488 <__errno_location@plt>
   10574:	e5900000 	ldr	r0, [r0]
   10578:	ebffffb3 	bl	1044c <strerror@plt>
   1057c:	e1a01000 	mov	r1, r0
   10580:	e59f0020 	ldr	r0, [pc, #32]	; 105a8 <main+0xfc>
   10584:	ebffffa4 	bl	1041c <printf@plt>
      return -EBUSY;
   10588:	e3e0000f 	mvn	r0, #15
   1058c:	eafffff1 	b	10558 <main+0xac>
   10590:	0001070c 	.word	0x0001070c
   10594:	00101002 	.word	0x00101002
   10598:	00010768 	.word	0x00010768
   1059c:	fe200000 	.word	0xfe200000
   105a0:	00010794 	.word	0x00010794
   105a4:	0001073c 	.word	0x0001073c
   105a8:	00010774 	.word	0x00010774

000105ac <_start>:
   105ac:	e3a0b000 	mov	fp, #0
   105b0:	e3a0e000 	mov	lr, #0
   105b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
   105b8:	e1a0200d 	mov	r2, sp
   105bc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
   105c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
   105c4:	e59fc010 	ldr	ip, [pc, #16]	; 105dc <_start+0x30>
   105c8:	e52dc004 	push	{ip}		; (str ip, [sp, #-4]!)
   105cc:	e59f000c 	ldr	r0, [pc, #12]	; 105e0 <_start+0x34>
   105d0:	e59f300c 	ldr	r3, [pc, #12]	; 105e4 <_start+0x38>
   105d4:	ebffff99 	bl	10440 <__libc_start_main@plt>
   105d8:	ebffffad 	bl	10494 <abort@plt>
   105dc:	000106fc 	.word	0x000106fc
   105e0:	000104ac 	.word	0x000104ac
   105e4:	0001069c 	.word	0x0001069c

000105e8 <call_weak_fn>:
   105e8:	e59f3014 	ldr	r3, [pc, #20]	; 10604 <call_weak_fn+0x1c>
   105ec:	e59f2014 	ldr	r2, [pc, #20]	; 10608 <call_weak_fn+0x20>
   105f0:	e08f3003 	add	r3, pc, r3
   105f4:	e7932002 	ldr	r2, [r3, r2]
   105f8:	e3520000 	cmp	r2, #0
   105fc:	012fff1e 	bxeq	lr
   10600:	eaffff94 	b	10458 <__gmon_start__@plt>
   10604:	00010a08 	.word	0x00010a08
   10608:	0000003c 	.word	0x0000003c

0001060c <deregister_tm_clones>:
   1060c:	e59f0018 	ldr	r0, [pc, #24]	; 1062c <deregister_tm_clones+0x20>
   10610:	e59f3018 	ldr	r3, [pc, #24]	; 10630 <deregister_tm_clones+0x24>
   10614:	e1530000 	cmp	r3, r0
   10618:	012fff1e 	bxeq	lr
   1061c:	e59f3010 	ldr	r3, [pc, #16]	; 10634 <deregister_tm_clones+0x28>
   10620:	e3530000 	cmp	r3, #0
   10624:	012fff1e 	bxeq	lr
   10628:	e12fff13 	bx	r3
   1062c:	00021048 	.word	0x00021048
   10630:	00021048 	.word	0x00021048
   10634:	00000000 	.word	0x00000000

00010638 <register_tm_clones>:
   10638:	e59f0024 	ldr	r0, [pc, #36]	; 10664 <register_tm_clones+0x2c>
   1063c:	e59f1024 	ldr	r1, [pc, #36]	; 10668 <register_tm_clones+0x30>
   10640:	e0411000 	sub	r1, r1, r0
   10644:	e1a01141 	asr	r1, r1, #2
   10648:	e0811fa1 	add	r1, r1, r1, lsr #31
   1064c:	e1b010c1 	asrs	r1, r1, #1
   10650:	012fff1e 	bxeq	lr
   10654:	e59f3010 	ldr	r3, [pc, #16]	; 1066c <register_tm_clones+0x34>
   10658:	e3530000 	cmp	r3, #0
   1065c:	012fff1e 	bxeq	lr
   10660:	e12fff13 	bx	r3
   10664:	00021048 	.word	0x00021048
   10668:	00021048 	.word	0x00021048
   1066c:	00000000 	.word	0x00000000

00010670 <__do_global_dtors_aux>:
   10670:	e92d4010 	push	{r4, lr}
   10674:	e59f4018 	ldr	r4, [pc, #24]	; 10694 <__do_global_dtors_aux+0x24>
   10678:	e5d43000 	ldrb	r3, [r4]
   1067c:	e3530000 	cmp	r3, #0
   10680:	18bd8010 	popne	{r4, pc}
   10684:	ebffffe0 	bl	1060c <deregister_tm_clones>
   10688:	e3a03001 	mov	r3, #1
   1068c:	e5c43000 	strb	r3, [r4]
   10690:	e8bd8010 	pop	{r4, pc}
   10694:	00021048 	.word	0x00021048

00010698 <frame_dummy>:
   10698:	eaffffe6 	b	10638 <register_tm_clones>

0001069c <__libc_csu_init>:
   1069c:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
   106a0:	e1a07000 	mov	r7, r0
   106a4:	e59f6048 	ldr	r6, [pc, #72]	; 106f4 <__libc_csu_init+0x58>
   106a8:	e59f5048 	ldr	r5, [pc, #72]	; 106f8 <__libc_csu_init+0x5c>
   106ac:	e08f6006 	add	r6, pc, r6
   106b0:	e08f5005 	add	r5, pc, r5
   106b4:	e0466005 	sub	r6, r6, r5
   106b8:	e1a08001 	mov	r8, r1
   106bc:	e1a09002 	mov	r9, r2
   106c0:	ebffff4d 	bl	103fc <_init>
   106c4:	e1b06146 	asrs	r6, r6, #2
   106c8:	08bd87f0 	popeq	{r4, r5, r6, r7, r8, r9, sl, pc}
   106cc:	e3a04000 	mov	r4, #0
   106d0:	e2844001 	add	r4, r4, #1
   106d4:	e4953004 	ldr	r3, [r5], #4
   106d8:	e1a02009 	mov	r2, r9
   106dc:	e1a01008 	mov	r1, r8
   106e0:	e1a00007 	mov	r0, r7
   106e4:	e12fff33 	blx	r3
   106e8:	e1560004 	cmp	r6, r4
   106ec:	1afffff7 	bne	106d0 <__libc_csu_init+0x34>
   106f0:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
   106f4:	00010860 	.word	0x00010860
   106f8:	00010858 	.word	0x00010858

000106fc <__libc_csu_fini>:
   106fc:	e12fff1e 	bx	lr

Disassembly of section .fini:

00010700 <_fini>:
   10700:	e92d4008 	push	{r3, lr}
   10704:	e8bd8008 	pop	{r3, pc}
