BOARD_HARDWARE_PATH="/home/algernon/Arduino/hardware" /home/algernon/Arduino/hardware/keyboardio/avr/libraries/Kaleidoscope/bin//kaleidoscope-builder disassemble
Building ./Splitography 0.0.0 into /tmp/kaleidoscope-algernon/sketch/4038469-Splitography.ino/output

/tmp/kaleidoscope-algernon/sketch/4038469-Splitography.ino/output/Splitography-0.0.0.elf:     file format elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
       0:	0c 94 1c 01 	jmp	0x238	; 0x238 <__ctors_end>
       4:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
       8:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
       c:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      10:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      14:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      18:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      1c:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      20:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      24:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      28:	0c 94 dd 10 	jmp	0x21ba	; 0x21ba <__vector_10>
      2c:	0c 94 80 0f 	jmp	0x1f00	; 0x1f00 <__vector_11>
      30:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      34:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      38:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      3c:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      40:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      44:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      48:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      4c:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      50:	0c 94 a6 06 	jmp	0xd4c	; 0xd4c <__vector_20>
      54:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      58:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      5c:	0c 94 56 0a 	jmp	0x14ac	; 0x14ac <__vector_23>
      60:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      64:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      68:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      6c:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      70:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      74:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      78:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      7c:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      80:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      84:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      88:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      8c:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      90:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      94:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      98:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      9c:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      a0:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      a4:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>
      a8:	0c 94 44 01 	jmp	0x288	; 0x288 <__bad_interrupt>

000000ac <__trampolines_end>:
      ac:	2e d1       	rcall	.+604    	; 0x30a <setup+0xe>
      ae:	2f d1       	rcall	.+606    	; 0x30e <setup+0x12>
      b0:	30 d1       	rcall	.+608    	; 0x312 <setup+0x16>
      b2:	31 d1       	rcall	.+610    	; 0x316 <setup+0x1a>
      b4:	32 d1       	rcall	.+612    	; 0x31a <setup+0x1e>
      b6:	33 d1       	rcall	.+614    	; 0x31e <setup+0x22>
      b8:	50 d1       	rcall	.+672    	; 0x35a <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0xc>
      ba:	51 d1       	rcall	.+674    	; 0x35e <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x10>
      bc:	52 d1       	rcall	.+676    	; 0x362 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x14>
      be:	53 d1       	rcall	.+678    	; 0x366 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x18>
      c0:	54 d1       	rcall	.+680    	; 0x36a <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x1c>
      c2:	55 d1       	rcall	.+682    	; 0x36e <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x20>
      c4:	00 00       	nop
      c6:	34 d1       	rcall	.+616    	; 0x330 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::setup() [clone .isra.21]+0x2>
      c8:	36 d1       	rcall	.+620    	; 0x336 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::setup() [clone .isra.21]+0x8>
      ca:	38 d1       	rcall	.+624    	; 0x33c <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::setup() [clone .isra.21]+0xe>
      cc:	3a d1       	rcall	.+628    	; 0x342 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::setup() [clone .isra.21]+0x14>
      ce:	3e d1       	rcall	.+636    	; 0x34c <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::setup() [clone .isra.21]+0x1e>
      d0:	43 d1       	rcall	.+646    	; 0x358 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0xa>
      d2:	47 d1       	rcall	.+654    	; 0x362 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x14>
      d4:	49 d1       	rcall	.+658    	; 0x368 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x1a>
      d6:	4b d1       	rcall	.+662    	; 0x36e <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x20>
      d8:	4d d1       	rcall	.+666    	; 0x374 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x26>
      da:	4f d1       	rcall	.+670    	; 0x37a <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x2c>
      dc:	00 00       	nop
      de:	35 d1       	rcall	.+618    	; 0x34a <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::setup() [clone .isra.21]+0x1c>
      e0:	37 d1       	rcall	.+622    	; 0x350 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x2>
      e2:	39 d1       	rcall	.+626    	; 0x356 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x8>
      e4:	3b d1       	rcall	.+630    	; 0x35c <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0xe>
      e6:	3f d1       	rcall	.+638    	; 0x366 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x18>
      e8:	44 d1       	rcall	.+648    	; 0x372 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x24>
      ea:	48 d1       	rcall	.+656    	; 0x37c <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x2e>
      ec:	4a d1       	rcall	.+660    	; 0x382 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x34>
      ee:	4c d1       	rcall	.+664    	; 0x388 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x3a>
      f0:	4e d1       	rcall	.+668    	; 0x38e <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x40>
      f2:	56 d1       	rcall	.+684    	; 0x3a0 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x52>
	...
      fc:	3c d1       	rcall	.+632    	; 0x376 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x28>
      fe:	3d d1       	rcall	.+634    	; 0x37a <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x2c>
     100:	45 d1       	rcall	.+650    	; 0x38c <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x3e>
     102:	46 d1       	rcall	.+652    	; 0x390 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x42>
	...

0000010c <_hidReportDescriptorKeyboard>:
     10c:	05 01 09 06 a1 01 05 07 19 e0 29 e7 15 00 25 01     ..........)...%.
     11c:	75 01 95 08 81 02 95 01 75 08 81 01 95 05 75 01     u.......u.....u.
     12c:	05 08 19 01 29 05 91 02 95 01 75 03 91 01 95 06     ....).....u.....
     13c:	75 08 15 00 25 ff 05 07 19 00 29 ff 81 00 c0        u...%.....)....

0000014b <_hidMultiReportDescriptorConsumer>:
     14b:	05 0c 09 01 a1 01 85 04 15 00 26 ff 03 19 00 2a     ..........&....*
     15b:	ff 03 95 04 75 10 81 00 c0                          ....u....

00000164 <_hidMultiReportDescriptorKeyboard>:
     164:	05 01 09 06 a1 01 85 08 05 07 19 e0 29 e7 15 00     ............)...
     174:	25 01 75 01 95 08 81 02 05 08 19 01 29 08 95 08     %.u.........)...
     184:	75 01 91 02 05 07 75 04 95 01 81 01 19 04 29 dd     u.....u.......).
     194:	15 00 25 01 75 01 95 d9 81 02 75 03 95 01 81 01     ..%.u.....u.....
     1a4:	c0                                                  .

000001a5 <_hidMultiReportDescriptorSystem>:
     1a5:	05 01 09 80 a1 01 85 05 15 00 26 ff 00 19 00 29     ..........&....)
     1b5:	ff 95 01 75 08 81 00 c0                             ...u....

000001bd <_cdcInterface>:
     1bd:	08 0b 00 02 02 02 01 00 09 04 00 00 01 02 02 00     ................
     1cd:	00 05 24 00 10 01 05 24 01 01 01 04 24 02 06 05     ..$....$....$...
     1dd:	24 06 00 01 07 05 81 03 10 00 40 09 04 01 00 02     $.........@.....
     1ed:	0a 00 00 00 07 05 02 02 40 00 00 07 05 83 02 40     ........@......@
	...

000001ff <USB_DeviceDescriptorIAD>:
     1ff:	12 01 00 02 ef 02 01 40 ed fe 60 60 00 01 01 02     .......@..``....
     20f:	03 01                                               ..

00000211 <STRING_MANUFACTURER>:
     211:	53 4f 46 54 2f 48 52 55 46 00                       SOFT/HRUF.

0000021b <STRING_PRODUCT>:
     21b:	53 70 6c 69 74 6f 67 72 61 70 68 79 00              Splitography.

00000228 <STRING_LANGUAGE>:
     228:	04 03 09 04                                         ....

0000022c <__ctors_start>:
     22c:	0d 07       	cpc	r16, r29
     22e:	94 08       	sbc	r9, r4
     230:	05 09       	sbc	r16, r5
     232:	f3 09       	sbc	r31, r3
     234:	52 0a       	sbc	r5, r18
     236:	6a 0c       	add	r6, r10

00000238 <__ctors_end>:
     238:	11 24       	eor	r1, r1
     23a:	1f be       	out	0x3f, r1	; 63
     23c:	cf ef       	ldi	r28, 0xFF	; 255
     23e:	da e0       	ldi	r29, 0x0A	; 10
     240:	de bf       	out	0x3e, r29	; 62
     242:	cd bf       	out	0x3d, r28	; 61

00000244 <__do_copy_data>:
     244:	11 e0       	ldi	r17, 0x01	; 1
     246:	a0 e0       	ldi	r26, 0x00	; 0
     248:	b1 e0       	ldi	r27, 0x01	; 1
     24a:	ec ef       	ldi	r30, 0xFC	; 252
     24c:	f8 e2       	ldi	r31, 0x28	; 40
     24e:	02 c0       	rjmp	.+4      	; 0x254 <__do_copy_data+0x10>
     250:	05 90       	lpm	r0, Z+
     252:	0d 92       	st	X+, r0
     254:	a0 36       	cpi	r26, 0x60	; 96
     256:	b1 07       	cpc	r27, r17
     258:	d9 f7       	brne	.-10     	; 0x250 <__do_copy_data+0xc>

0000025a <__do_clear_bss>:
     25a:	23 e0       	ldi	r18, 0x03	; 3
     25c:	a0 e6       	ldi	r26, 0x60	; 96
     25e:	b1 e0       	ldi	r27, 0x01	; 1
     260:	01 c0       	rjmp	.+2      	; 0x264 <.do_clear_bss_start>

00000262 <.do_clear_bss_loop>:
     262:	1d 92       	st	X+, r1

00000264 <.do_clear_bss_start>:
     264:	a9 37       	cpi	r26, 0x79	; 121
     266:	b2 07       	cpc	r27, r18
     268:	e1 f7       	brne	.-8      	; 0x262 <.do_clear_bss_loop>

0000026a <__do_global_ctors>:
     26a:	11 e0       	ldi	r17, 0x01	; 1
     26c:	cc e1       	ldi	r28, 0x1C	; 28
     26e:	d1 e0       	ldi	r29, 0x01	; 1
     270:	04 c0       	rjmp	.+8      	; 0x27a <__do_global_ctors+0x10>
     272:	21 97       	sbiw	r28, 0x01	; 1
     274:	fe 01       	movw	r30, r28
     276:	0e 94 69 14 	call	0x28d2	; 0x28d2 <__tablejump2__>
     27a:	c6 31       	cpi	r28, 0x16	; 22
     27c:	d1 07       	cpc	r29, r17
     27e:	c9 f7       	brne	.-14     	; 0x272 <__do_global_ctors+0x8>
     280:	0e 94 47 01 	call	0x28e	; 0x28e <main>
     284:	0c 94 7c 14 	jmp	0x28f8	; 0x28f8 <_exit>

00000288 <__bad_interrupt>:
     288:	0c 94 00 00 	jmp	0	; 0x0 <__vectors>

0000028c <initVariant>:
     28c:	08 95       	ret

0000028e <main>:
     28e:	0e 94 0a 0b 	call	0x1614	; 0x1614 <init>
     292:	0e 94 46 01 	call	0x28c	; 0x28c <initVariant>
     296:	82 e5       	ldi	r24, 0x52	; 82
     298:	93 e0       	ldi	r25, 0x03	; 3
     29a:	0e 94 55 11 	call	0x22aa	; 0x22aa <USBDevice_::attach()>
     29e:	0e 94 7e 01 	call	0x2fc	; 0x2fc <setup>
     2a2:	c0 e0       	ldi	r28, 0x00	; 0
     2a4:	d0 e0       	ldi	r29, 0x00	; 0
     2a6:	0e 94 91 01 	call	0x322	; 0x322 <loop>
     2aa:	20 97       	sbiw	r28, 0x00	; 0
     2ac:	e1 f3       	breq	.-8      	; 0x2a6 <main+0x18>
     2ae:	0e 94 00 00 	call	0	; 0x0 <__vectors>
     2b2:	f9 cf       	rjmp	.-14     	; 0x2a6 <main+0x18>

000002b4 <kaleidoscope::sketch_exploration::pluginsExploreSketch()>:
     2b4:	08 95       	ret

000002b6 <HID_::getShortName(char*)>:
     2b6:	8c e0       	ldi	r24, 0x0C	; 12
     2b8:	e6 e1       	ldi	r30, 0x16	; 22
     2ba:	f1 e0       	ldi	r31, 0x01	; 1
     2bc:	db 01       	movw	r26, r22
     2be:	01 90       	ld	r0, Z+
     2c0:	0d 92       	st	X+, r0
     2c2:	8a 95       	dec	r24
     2c4:	e1 f7       	brne	.-8      	; 0x2be <HID_::getShortName(char*)+0x8>
     2c6:	8c e0       	ldi	r24, 0x0C	; 12
     2c8:	08 95       	ret

000002ca <kaleidoscope::Hooks::onSetup()>:
     2ca:	90 e0       	ldi	r25, 0x00	; 0
     2cc:	80 e0       	ldi	r24, 0x00	; 0
     2ce:	08 95       	ret

000002d0 <kaleidoscope::Hooks::beforeEachCycle()>:
     2d0:	90 e0       	ldi	r25, 0x00	; 0
     2d2:	80 e0       	ldi	r24, 0x00	; 0
     2d4:	08 95       	ret

000002d6 <kaleidoscope::Hooks::onKeyswitchEvent(kaleidoscope::Key&, unsigned char, unsigned char, unsigned char)>:
     2d6:	90 e0       	ldi	r25, 0x00	; 0
     2d8:	80 e0       	ldi	r24, 0x00	; 0
     2da:	08 95       	ret

000002dc <kaleidoscope::Hooks::onKeyswitchEvent(kaleidoscope::Key&, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)>:
     2dc:	24 2f       	mov	r18, r20
     2de:	46 2f       	mov	r20, r22
     2e0:	bc 01       	movw	r22, r24
     2e2:	82 e4       	ldi	r24, 0x42	; 66
     2e4:	92 e0       	ldi	r25, 0x02	; 2
     2e6:	0c 94 b5 06 	jmp	0xd6a	; 0xd6a <kaleidoscope::plugin::steno::GeminiPR::onKeyswitchEvent(kaleidoscope::Key&, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)>

000002ea <kaleidoscope::Hooks::onLayerChange()>:
     2ea:	90 e0       	ldi	r25, 0x00	; 0
     2ec:	80 e0       	ldi	r24, 0x00	; 0
     2ee:	08 95       	ret

000002f0 <kaleidoscope::Hooks::beforeReportingState()>:
     2f0:	90 e0       	ldi	r25, 0x00	; 0
     2f2:	80 e0       	ldi	r24, 0x00	; 0
     2f4:	08 95       	ret

000002f6 <kaleidoscope::Hooks::afterEachCycle()>:
     2f6:	90 e0       	ldi	r25, 0x00	; 0
     2f8:	80 e0       	ldi	r24, 0x00	; 0
     2fa:	08 95       	ret

000002fc <setup>:
     2fc:	cf 93       	push	r28
     2fe:	df 93       	push	r29
     300:	c0 91 23 01 	lds	r28, 0x0123	; 0x800123 <Kaleidoscope>
     304:	d0 91 24 01 	lds	r29, 0x0124	; 0x800124 <Kaleidoscope+0x1>
     308:	40 e8       	ldi	r20, 0x80	; 128
     30a:	55 e2       	ldi	r21, 0x25	; 37
     30c:	60 e0       	ldi	r22, 0x00	; 0
     30e:	70 e0       	ldi	r23, 0x00	; 0
     310:	85 ef       	ldi	r24, 0xF5	; 245
     312:	92 e0       	ldi	r25, 0x02	; 2
     314:	0e 94 64 0c 	call	0x18c8	; 0x18c8 <Serial_::begin(unsigned long)>
     318:	ce 01       	movw	r24, r28
     31a:	df 91       	pop	r29
     31c:	cf 91       	pop	r28
     31e:	0c 94 e9 03 	jmp	0x7d2	; 0x7d2 <kaleidoscope::Runtime_::setup()>

00000322 <loop>:
     322:	80 91 23 01 	lds	r24, 0x0123	; 0x800123 <Kaleidoscope>
     326:	90 91 24 01 	lds	r25, 0x0124	; 0x800124 <Kaleidoscope+0x1>
     32a:	0c 94 f5 04 	jmp	0x9ea	; 0x9ea <kaleidoscope::Runtime_::loop()>

0000032e <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::setup() [clone .isra.21]>:
     32e:	88 e5       	ldi	r24, 0x58	; 88
     330:	92 e0       	ldi	r25, 0x02	; 2
     332:	0e 94 84 08 	call	0x1108	; 0x1108 <BootKeyboard_::begin()>
     336:	85 e9       	ldi	r24, 0x95	; 149
     338:	92 e0       	ldi	r25, 0x02	; 2
     33a:	0e 94 e9 09 	call	0x13d2	; 0x13d2 <Keyboard_::begin()>
     33e:	87 e7       	ldi	r24, 0x77	; 119
     340:	92 e0       	ldi	r25, 0x02	; 2
     342:	0e 94 03 09 	call	0x1206	; 0x1206 <ConsumerControl_::begin()>
     346:	8d ed       	ldi	r24, 0xDD	; 221
     348:	92 e0       	ldi	r25, 0x02	; 2
     34a:	0c 94 36 0a 	jmp	0x146c	; 0x146c <SystemControl_::begin()>

0000034e <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]>:
     34e:	ef 92       	push	r14
     350:	ff 92       	push	r15
     352:	1f 93       	push	r17
     354:	cf 93       	push	r28
     356:	df 93       	push	r29
     358:	ca e3       	ldi	r28, 0x3A	; 58
     35a:	d2 e0       	ldi	r29, 0x02	; 2
     35c:	72 e3       	ldi	r23, 0x32	; 50
     35e:	e7 2e       	mov	r14, r23
     360:	72 e0       	ldi	r23, 0x02	; 2
     362:	f7 2e       	mov	r15, r23
     364:	1b e0       	ldi	r17, 0x0B	; 11
     366:	28 81       	ld	r18, Y
     368:	39 81       	ldd	r19, Y+1	; 0x01
     36a:	f7 01       	movw	r30, r14
     36c:	80 81       	ld	r24, Z
     36e:	91 81       	ldd	r25, Z+1	; 0x01
     370:	48 2f       	mov	r20, r24
     372:	44 0f       	add	r20, r20
     374:	42 70       	andi	r20, 0x02	; 2
     376:	52 2f       	mov	r21, r18
     378:	51 70       	andi	r21, 0x01	; 1
     37a:	45 2b       	or	r20, r21
     37c:	09 f0       	breq	.+2      	; 0x380 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x32>
     37e:	16 c1       	rjmp	.+556    	; 0x5ac <__LOCK_REGION_LENGTH__+0x1ac>
     380:	ac 01       	movw	r20, r24
     382:	56 95       	lsr	r21
     384:	47 95       	ror	r20
     386:	44 0f       	add	r20, r20
     388:	42 70       	andi	r20, 0x02	; 2
     38a:	21 fb       	bst	r18, 1
     38c:	55 27       	eor	r21, r21
     38e:	50 f9       	bld	r21, 0
     390:	45 2b       	or	r20, r21
     392:	09 f0       	breq	.+2      	; 0x396 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x48>
     394:	ff c0       	rjmp	.+510    	; 0x594 <__LOCK_REGION_LENGTH__+0x194>
     396:	ac 01       	movw	r20, r24
     398:	56 95       	lsr	r21
     39a:	47 95       	ror	r20
     39c:	56 95       	lsr	r21
     39e:	47 95       	ror	r20
     3a0:	44 0f       	add	r20, r20
     3a2:	42 70       	andi	r20, 0x02	; 2
     3a4:	22 fb       	bst	r18, 2
     3a6:	55 27       	eor	r21, r21
     3a8:	50 f9       	bld	r21, 0
     3aa:	45 2b       	or	r20, r21
     3ac:	09 f0       	breq	.+2      	; 0x3b0 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x62>
     3ae:	e6 c0       	rjmp	.+460    	; 0x57c <__LOCK_REGION_LENGTH__+0x17c>
     3b0:	ac 01       	movw	r20, r24
     3b2:	56 95       	lsr	r21
     3b4:	47 95       	ror	r20
     3b6:	56 95       	lsr	r21
     3b8:	47 95       	ror	r20
     3ba:	56 95       	lsr	r21
     3bc:	47 95       	ror	r20
     3be:	44 0f       	add	r20, r20
     3c0:	42 70       	andi	r20, 0x02	; 2
     3c2:	23 fb       	bst	r18, 3
     3c4:	55 27       	eor	r21, r21
     3c6:	50 f9       	bld	r21, 0
     3c8:	45 2b       	or	r20, r21
     3ca:	09 f0       	breq	.+2      	; 0x3ce <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x80>
     3cc:	cb c0       	rjmp	.+406    	; 0x564 <__LOCK_REGION_LENGTH__+0x164>
     3ce:	ac 01       	movw	r20, r24
     3d0:	52 95       	swap	r21
     3d2:	42 95       	swap	r20
     3d4:	4f 70       	andi	r20, 0x0F	; 15
     3d6:	45 27       	eor	r20, r21
     3d8:	5f 70       	andi	r21, 0x0F	; 15
     3da:	45 27       	eor	r20, r21
     3dc:	44 0f       	add	r20, r20
     3de:	42 70       	andi	r20, 0x02	; 2
     3e0:	24 fb       	bst	r18, 4
     3e2:	55 27       	eor	r21, r21
     3e4:	50 f9       	bld	r21, 0
     3e6:	45 2b       	or	r20, r21
     3e8:	09 f0       	breq	.+2      	; 0x3ec <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x9e>
     3ea:	b0 c0       	rjmp	.+352    	; 0x54c <__LOCK_REGION_LENGTH__+0x14c>
     3ec:	ac 01       	movw	r20, r24
     3ee:	56 95       	lsr	r21
     3f0:	47 95       	ror	r20
     3f2:	52 95       	swap	r21
     3f4:	42 95       	swap	r20
     3f6:	4f 70       	andi	r20, 0x0F	; 15
     3f8:	45 27       	eor	r20, r21
     3fa:	5f 70       	andi	r21, 0x0F	; 15
     3fc:	45 27       	eor	r20, r21
     3fe:	44 0f       	add	r20, r20
     400:	42 70       	andi	r20, 0x02	; 2
     402:	25 fb       	bst	r18, 5
     404:	55 27       	eor	r21, r21
     406:	50 f9       	bld	r21, 0
     408:	45 2b       	or	r20, r21
     40a:	09 f0       	breq	.+2      	; 0x40e <__LOCK_REGION_LENGTH__+0xe>
     40c:	93 c0       	rjmp	.+294    	; 0x534 <__LOCK_REGION_LENGTH__+0x134>
     40e:	ac 01       	movw	r20, r24
     410:	00 24       	eor	r0, r0
     412:	44 0f       	add	r20, r20
     414:	55 1f       	adc	r21, r21
     416:	00 1c       	adc	r0, r0
     418:	44 0f       	add	r20, r20
     41a:	55 1f       	adc	r21, r21
     41c:	00 1c       	adc	r0, r0
     41e:	45 2f       	mov	r20, r21
     420:	50 2d       	mov	r21, r0
     422:	44 0f       	add	r20, r20
     424:	42 70       	andi	r20, 0x02	; 2
     426:	26 fb       	bst	r18, 6
     428:	55 27       	eor	r21, r21
     42a:	50 f9       	bld	r21, 0
     42c:	45 2b       	or	r20, r21
     42e:	09 f0       	breq	.+2      	; 0x432 <__LOCK_REGION_LENGTH__+0x32>
     430:	75 c0       	rjmp	.+234    	; 0x51c <__LOCK_REGION_LENGTH__+0x11c>
     432:	ac 01       	movw	r20, r24
     434:	44 0f       	add	r20, r20
     436:	45 2f       	mov	r20, r21
     438:	44 1f       	adc	r20, r20
     43a:	55 0b       	sbc	r21, r21
     43c:	51 95       	neg	r21
     43e:	44 0f       	add	r20, r20
     440:	42 70       	andi	r20, 0x02	; 2
     442:	27 fb       	bst	r18, 7
     444:	22 27       	eor	r18, r18
     446:	20 f9       	bld	r18, 0
     448:	42 2b       	or	r20, r18
     44a:	09 f0       	breq	.+2      	; 0x44e <__LOCK_REGION_LENGTH__+0x4e>
     44c:	5c c0       	rjmp	.+184    	; 0x506 <__LOCK_REGION_LENGTH__+0x106>
     44e:	49 2f       	mov	r20, r25
     450:	44 0f       	add	r20, r20
     452:	42 70       	andi	r20, 0x02	; 2
     454:	23 2f       	mov	r18, r19
     456:	21 70       	andi	r18, 0x01	; 1
     458:	42 2b       	or	r20, r18
     45a:	09 f0       	breq	.+2      	; 0x45e <__LOCK_REGION_LENGTH__+0x5e>
     45c:	49 c0       	rjmp	.+146    	; 0x4f0 <__LOCK_REGION_LENGTH__+0xf0>
     45e:	31 fb       	bst	r19, 1
     460:	22 27       	eor	r18, r18
     462:	20 f9       	bld	r18, 0
     464:	49 2f       	mov	r20, r25
     466:	42 70       	andi	r20, 0x02	; 2
     468:	42 2b       	or	r20, r18
     46a:	b9 f5       	brne	.+110    	; 0x4da <__LOCK_REGION_LENGTH__+0xda>
     46c:	49 2f       	mov	r20, r25
     46e:	46 95       	lsr	r20
     470:	42 70       	andi	r20, 0x02	; 2
     472:	32 fb       	bst	r19, 2
     474:	22 27       	eor	r18, r18
     476:	20 f9       	bld	r18, 0
     478:	42 2b       	or	r20, r18
     47a:	21 f5       	brne	.+72     	; 0x4c4 <__LOCK_REGION_LENGTH__+0xc4>
     47c:	29 2f       	mov	r18, r25
     47e:	26 95       	lsr	r18
     480:	26 95       	lsr	r18
     482:	22 70       	andi	r18, 0x02	; 2
     484:	33 fb       	bst	r19, 3
     486:	44 27       	eor	r20, r20
     488:	40 f9       	bld	r20, 0
     48a:	42 2b       	or	r20, r18
     48c:	79 f4       	brne	.+30     	; 0x4ac <__LOCK_REGION_LENGTH__+0xac>
     48e:	89 93       	st	Y+, r24
     490:	99 93       	st	Y+, r25
     492:	f2 e0       	ldi	r31, 0x02	; 2
     494:	ef 0e       	add	r14, r31
     496:	f1 1c       	adc	r15, r1
     498:	14 5f       	subi	r17, 0xF4	; 244
     49a:	1b 33       	cpi	r17, 0x3B	; 59
     49c:	09 f0       	breq	.+2      	; 0x4a0 <__LOCK_REGION_LENGTH__+0xa0>
     49e:	63 cf       	rjmp	.-314    	; 0x366 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x18>
     4a0:	df 91       	pop	r29
     4a2:	cf 91       	pop	r28
     4a4:	1f 91       	pop	r17
     4a6:	ff 90       	pop	r15
     4a8:	ef 90       	pop	r14
     4aa:	08 95       	ret
     4ac:	61 2f       	mov	r22, r17
     4ae:	80 e0       	ldi	r24, 0x00	; 0
     4b0:	90 e0       	ldi	r25, 0x00	; 0
     4b2:	0e 94 a4 06 	call	0xd48	; 0xd48 <kaleidoscope::driver::keyscanner::Base<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)>
     4b6:	f7 01       	movw	r30, r14
     4b8:	81 91       	ld	r24, Z+
     4ba:	91 91       	ld	r25, Z+
     4bc:	7f 01       	movw	r14, r30
     4be:	89 93       	st	Y+, r24
     4c0:	99 93       	st	Y+, r25
     4c2:	ea cf       	rjmp	.-44     	; 0x498 <__LOCK_REGION_LENGTH__+0x98>
     4c4:	6f ef       	ldi	r22, 0xFF	; 255
     4c6:	61 0f       	add	r22, r17
     4c8:	80 e0       	ldi	r24, 0x00	; 0
     4ca:	90 e0       	ldi	r25, 0x00	; 0
     4cc:	0e 94 a4 06 	call	0xd48	; 0xd48 <kaleidoscope::driver::keyscanner::Base<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)>
     4d0:	39 81       	ldd	r19, Y+1	; 0x01
     4d2:	f7 01       	movw	r30, r14
     4d4:	80 81       	ld	r24, Z
     4d6:	91 81       	ldd	r25, Z+1	; 0x01
     4d8:	d1 cf       	rjmp	.-94     	; 0x47c <__LOCK_REGION_LENGTH__+0x7c>
     4da:	6e ef       	ldi	r22, 0xFE	; 254
     4dc:	61 0f       	add	r22, r17
     4de:	80 e0       	ldi	r24, 0x00	; 0
     4e0:	90 e0       	ldi	r25, 0x00	; 0
     4e2:	0e 94 a4 06 	call	0xd48	; 0xd48 <kaleidoscope::driver::keyscanner::Base<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)>
     4e6:	39 81       	ldd	r19, Y+1	; 0x01
     4e8:	f7 01       	movw	r30, r14
     4ea:	80 81       	ld	r24, Z
     4ec:	91 81       	ldd	r25, Z+1	; 0x01
     4ee:	be cf       	rjmp	.-132    	; 0x46c <__LOCK_REGION_LENGTH__+0x6c>
     4f0:	6d ef       	ldi	r22, 0xFD	; 253
     4f2:	61 0f       	add	r22, r17
     4f4:	80 e0       	ldi	r24, 0x00	; 0
     4f6:	90 e0       	ldi	r25, 0x00	; 0
     4f8:	0e 94 a4 06 	call	0xd48	; 0xd48 <kaleidoscope::driver::keyscanner::Base<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)>
     4fc:	39 81       	ldd	r19, Y+1	; 0x01
     4fe:	f7 01       	movw	r30, r14
     500:	80 81       	ld	r24, Z
     502:	91 81       	ldd	r25, Z+1	; 0x01
     504:	ac cf       	rjmp	.-168    	; 0x45e <__LOCK_REGION_LENGTH__+0x5e>
     506:	6c ef       	ldi	r22, 0xFC	; 252
     508:	61 0f       	add	r22, r17
     50a:	80 e0       	ldi	r24, 0x00	; 0
     50c:	90 e0       	ldi	r25, 0x00	; 0
     50e:	0e 94 a4 06 	call	0xd48	; 0xd48 <kaleidoscope::driver::keyscanner::Base<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)>
     512:	39 81       	ldd	r19, Y+1	; 0x01
     514:	f7 01       	movw	r30, r14
     516:	80 81       	ld	r24, Z
     518:	91 81       	ldd	r25, Z+1	; 0x01
     51a:	99 cf       	rjmp	.-206    	; 0x44e <__LOCK_REGION_LENGTH__+0x4e>
     51c:	6b ef       	ldi	r22, 0xFB	; 251
     51e:	61 0f       	add	r22, r17
     520:	80 e0       	ldi	r24, 0x00	; 0
     522:	90 e0       	ldi	r25, 0x00	; 0
     524:	0e 94 a4 06 	call	0xd48	; 0xd48 <kaleidoscope::driver::keyscanner::Base<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)>
     528:	28 81       	ld	r18, Y
     52a:	39 81       	ldd	r19, Y+1	; 0x01
     52c:	f7 01       	movw	r30, r14
     52e:	80 81       	ld	r24, Z
     530:	91 81       	ldd	r25, Z+1	; 0x01
     532:	7f cf       	rjmp	.-258    	; 0x432 <__LOCK_REGION_LENGTH__+0x32>
     534:	6a ef       	ldi	r22, 0xFA	; 250
     536:	61 0f       	add	r22, r17
     538:	80 e0       	ldi	r24, 0x00	; 0
     53a:	90 e0       	ldi	r25, 0x00	; 0
     53c:	0e 94 a4 06 	call	0xd48	; 0xd48 <kaleidoscope::driver::keyscanner::Base<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)>
     540:	28 81       	ld	r18, Y
     542:	39 81       	ldd	r19, Y+1	; 0x01
     544:	f7 01       	movw	r30, r14
     546:	80 81       	ld	r24, Z
     548:	91 81       	ldd	r25, Z+1	; 0x01
     54a:	61 cf       	rjmp	.-318    	; 0x40e <__LOCK_REGION_LENGTH__+0xe>
     54c:	69 ef       	ldi	r22, 0xF9	; 249
     54e:	61 0f       	add	r22, r17
     550:	80 e0       	ldi	r24, 0x00	; 0
     552:	90 e0       	ldi	r25, 0x00	; 0
     554:	0e 94 a4 06 	call	0xd48	; 0xd48 <kaleidoscope::driver::keyscanner::Base<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)>
     558:	28 81       	ld	r18, Y
     55a:	39 81       	ldd	r19, Y+1	; 0x01
     55c:	f7 01       	movw	r30, r14
     55e:	80 81       	ld	r24, Z
     560:	91 81       	ldd	r25, Z+1	; 0x01
     562:	44 cf       	rjmp	.-376    	; 0x3ec <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x9e>
     564:	68 ef       	ldi	r22, 0xF8	; 248
     566:	61 0f       	add	r22, r17
     568:	80 e0       	ldi	r24, 0x00	; 0
     56a:	90 e0       	ldi	r25, 0x00	; 0
     56c:	0e 94 a4 06 	call	0xd48	; 0xd48 <kaleidoscope::driver::keyscanner::Base<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)>
     570:	28 81       	ld	r18, Y
     572:	39 81       	ldd	r19, Y+1	; 0x01
     574:	f7 01       	movw	r30, r14
     576:	80 81       	ld	r24, Z
     578:	91 81       	ldd	r25, Z+1	; 0x01
     57a:	29 cf       	rjmp	.-430    	; 0x3ce <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x80>
     57c:	67 ef       	ldi	r22, 0xF7	; 247
     57e:	61 0f       	add	r22, r17
     580:	80 e0       	ldi	r24, 0x00	; 0
     582:	90 e0       	ldi	r25, 0x00	; 0
     584:	0e 94 a4 06 	call	0xd48	; 0xd48 <kaleidoscope::driver::keyscanner::Base<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)>
     588:	28 81       	ld	r18, Y
     58a:	39 81       	ldd	r19, Y+1	; 0x01
     58c:	f7 01       	movw	r30, r14
     58e:	80 81       	ld	r24, Z
     590:	91 81       	ldd	r25, Z+1	; 0x01
     592:	0e cf       	rjmp	.-484    	; 0x3b0 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x62>
     594:	66 ef       	ldi	r22, 0xF6	; 246
     596:	61 0f       	add	r22, r17
     598:	80 e0       	ldi	r24, 0x00	; 0
     59a:	90 e0       	ldi	r25, 0x00	; 0
     59c:	0e 94 a4 06 	call	0xd48	; 0xd48 <kaleidoscope::driver::keyscanner::Base<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)>
     5a0:	28 81       	ld	r18, Y
     5a2:	39 81       	ldd	r19, Y+1	; 0x01
     5a4:	f7 01       	movw	r30, r14
     5a6:	80 81       	ld	r24, Z
     5a8:	91 81       	ldd	r25, Z+1	; 0x01
     5aa:	f5 ce       	rjmp	.-534    	; 0x396 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x48>
     5ac:	65 ef       	ldi	r22, 0xF5	; 245
     5ae:	61 0f       	add	r22, r17
     5b0:	80 e0       	ldi	r24, 0x00	; 0
     5b2:	90 e0       	ldi	r25, 0x00	; 0
     5b4:	0e 94 a4 06 	call	0xd48	; 0xd48 <kaleidoscope::driver::keyscanner::Base<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)>
     5b8:	28 81       	ld	r18, Y
     5ba:	39 81       	ldd	r19, Y+1	; 0x01
     5bc:	f7 01       	movw	r30, r14
     5be:	80 81       	ld	r24, Z
     5c0:	91 81       	ldd	r25, Z+1	; 0x01
     5c2:	de ce       	rjmp	.-580    	; 0x380 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]+0x32>

000005c4 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readCols() [clone .isra.27]>:
     5c4:	e5 e2       	ldi	r30, 0x25	; 37
     5c6:	f1 e0       	ldi	r31, 0x01	; 1
     5c8:	50 e0       	ldi	r21, 0x00	; 0
     5ca:	40 e0       	ldi	r20, 0x00	; 0
     5cc:	70 e0       	ldi	r23, 0x00	; 0
     5ce:	60 e0       	ldi	r22, 0x00	; 0
     5d0:	00 00       	nop
     5d2:	91 91       	ld	r25, Z+
     5d4:	a9 2f       	mov	r26, r25
     5d6:	b0 e0       	ldi	r27, 0x00	; 0
     5d8:	84 e0       	ldi	r24, 0x04	; 4
     5da:	b5 95       	asr	r27
     5dc:	a7 95       	ror	r26
     5de:	8a 95       	dec	r24
     5e0:	e1 f7       	brne	.-8      	; 0x5da <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readCols() [clone .isra.27]+0x16>
     5e2:	90 96       	adiw	r26, 0x20	; 32
     5e4:	2c 91       	ld	r18, X
     5e6:	30 e0       	ldi	r19, 0x00	; 0
     5e8:	9f 70       	andi	r25, 0x0F	; 15
     5ea:	02 c0       	rjmp	.+4      	; 0x5f0 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readCols() [clone .isra.27]+0x2c>
     5ec:	35 95       	asr	r19
     5ee:	27 95       	ror	r18
     5f0:	9a 95       	dec	r25
     5f2:	e2 f7       	brpl	.-8      	; 0x5ec <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readCols() [clone .isra.27]+0x28>
     5f4:	20 95       	com	r18
     5f6:	30 95       	com	r19
     5f8:	21 70       	andi	r18, 0x01	; 1
     5fa:	33 27       	eor	r19, r19
     5fc:	04 2e       	mov	r0, r20
     5fe:	02 c0       	rjmp	.+4      	; 0x604 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readCols() [clone .isra.27]+0x40>
     600:	22 0f       	add	r18, r18
     602:	33 1f       	adc	r19, r19
     604:	0a 94       	dec	r0
     606:	e2 f7       	brpl	.-8      	; 0x600 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readCols() [clone .isra.27]+0x3c>
     608:	62 2b       	or	r22, r18
     60a:	73 2b       	or	r23, r19
     60c:	4f 5f       	subi	r20, 0xFF	; 255
     60e:	5f 4f       	sbci	r21, 0xFF	; 255
     610:	4c 30       	cpi	r20, 0x0C	; 12
     612:	51 05       	cpc	r21, r1
     614:	e9 f6       	brne	.-70     	; 0x5d0 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readCols() [clone .isra.27]+0xc>
     616:	cb 01       	movw	r24, r22
     618:	08 95       	ret

0000061a <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::pressRawKey(kaleidoscope::Key) [clone .isra.24]>:
     61a:	cf 93       	push	r28
     61c:	c8 2f       	mov	r28, r24
     61e:	88 e5       	ldi	r24, 0x58	; 88
     620:	92 e0       	ldi	r25, 0x02	; 2
     622:	0e 94 df 07 	call	0xfbe	; 0xfbe <BootKeyboard_::getProtocol()>
     626:	6c 2f       	mov	r22, r28
     628:	81 11       	cpse	r24, r1
     62a:	05 c0       	rjmp	.+10     	; 0x636 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::pressRawKey(kaleidoscope::Key) [clone .isra.24]+0x1c>
     62c:	88 e5       	ldi	r24, 0x58	; 88
     62e:	92 e0       	ldi	r25, 0x02	; 2
     630:	cf 91       	pop	r28
     632:	0c 94 1e 08 	jmp	0x103c	; 0x103c <BootKeyboard_::press(unsigned char)>
     636:	85 e9       	ldi	r24, 0x95	; 149
     638:	92 e0       	ldi	r25, 0x02	; 2
     63a:	cf 91       	pop	r28
     63c:	0c 94 93 09 	jmp	0x1326	; 0x1326 <Keyboard_::press(unsigned char)>

00000640 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::sendReport()>:
     640:	1f 93       	push	r17
     642:	cf 93       	push	r28
     644:	df 93       	push	r29
     646:	ec 01       	movw	r28, r24
     648:	1d 81       	ldd	r17, Y+5	; 0x05
     64a:	8c 81       	ldd	r24, Y+4	; 0x04
     64c:	18 23       	and	r17, r24
     64e:	13 ff       	sbrs	r17, 3
     650:	03 c0       	rjmp	.+6      	; 0x658 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::sendReport()+0x18>
     652:	81 ee       	ldi	r24, 0xE1	; 225
     654:	0e 94 0d 03 	call	0x61a	; 0x61a <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::pressRawKey(kaleidoscope::Key) [clone .isra.24]>
     658:	10 ff       	sbrs	r17, 0
     65a:	03 c0       	rjmp	.+6      	; 0x662 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::sendReport()+0x22>
     65c:	80 ee       	ldi	r24, 0xE0	; 224
     65e:	0e 94 0d 03 	call	0x61a	; 0x61a <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::pressRawKey(kaleidoscope::Key) [clone .isra.24]>
     662:	11 ff       	sbrs	r17, 1
     664:	03 c0       	rjmp	.+6      	; 0x66c <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::sendReport()+0x2c>
     666:	82 ee       	ldi	r24, 0xE2	; 226
     668:	0e 94 0d 03 	call	0x61a	; 0x61a <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::pressRawKey(kaleidoscope::Key) [clone .isra.24]>
     66c:	12 ff       	sbrs	r17, 2
     66e:	03 c0       	rjmp	.+6      	; 0x676 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::sendReport()+0x36>
     670:	86 ee       	ldi	r24, 0xE6	; 230
     672:	0e 94 0d 03 	call	0x61a	; 0x61a <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::pressRawKey(kaleidoscope::Key) [clone .isra.24]>
     676:	14 ff       	sbrs	r17, 4
     678:	03 c0       	rjmp	.+6      	; 0x680 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::sendReport()+0x40>
     67a:	83 ee       	ldi	r24, 0xE3	; 227
     67c:	0e 94 0d 03 	call	0x61a	; 0x61a <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::pressRawKey(kaleidoscope::Key) [clone .isra.24]>
     680:	88 e5       	ldi	r24, 0x58	; 88
     682:	92 e0       	ldi	r25, 0x02	; 2
     684:	0e 94 df 07 	call	0xfbe	; 0xfbe <BootKeyboard_::getProtocol()>
     688:	6e 81       	ldd	r22, Y+6	; 0x06
     68a:	81 11       	cpse	r24, r1
     68c:	17 c0       	rjmp	.+46     	; 0x6bc <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::sendReport()+0x7c>
     68e:	66 23       	and	r22, r22
     690:	71 f0       	breq	.+28     	; 0x6ae <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::sendReport()+0x6e>
     692:	88 e5       	ldi	r24, 0x58	; 88
     694:	92 e0       	ldi	r25, 0x02	; 2
     696:	0e 94 45 08 	call	0x108a	; 0x108a <BootKeyboard_::release(unsigned char)>
     69a:	88 e5       	ldi	r24, 0x58	; 88
     69c:	92 e0       	ldi	r25, 0x02	; 2
     69e:	0e 94 e2 07 	call	0xfc4	; 0xfc4 <BootKeyboard_::sendReport()>
     6a2:	6e 81       	ldd	r22, Y+6	; 0x06
     6a4:	88 e5       	ldi	r24, 0x58	; 88
     6a6:	92 e0       	ldi	r25, 0x02	; 2
     6a8:	0e 94 1e 08 	call	0x103c	; 0x103c <BootKeyboard_::press(unsigned char)>
     6ac:	1e 82       	std	Y+6, r1	; 0x06
     6ae:	88 e5       	ldi	r24, 0x58	; 88
     6b0:	92 e0       	ldi	r25, 0x02	; 2
     6b2:	df 91       	pop	r29
     6b4:	cf 91       	pop	r28
     6b6:	1f 91       	pop	r17
     6b8:	0c 94 e2 07 	jmp	0xfc4	; 0xfc4 <BootKeyboard_::sendReport()>
     6bc:	66 23       	and	r22, r22
     6be:	71 f0       	breq	.+28     	; 0x6dc <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::sendReport()+0x9c>
     6c0:	85 e9       	ldi	r24, 0x95	; 149
     6c2:	92 e0       	ldi	r25, 0x02	; 2
     6c4:	0e 94 ba 09 	call	0x1374	; 0x1374 <Keyboard_::release(unsigned char)>
     6c8:	85 e9       	ldi	r24, 0x95	; 149
     6ca:	92 e0       	ldi	r25, 0x02	; 2
     6cc:	0e 94 33 09 	call	0x1266	; 0x1266 <Keyboard_::sendReport()>
     6d0:	6e 81       	ldd	r22, Y+6	; 0x06
     6d2:	85 e9       	ldi	r24, 0x95	; 149
     6d4:	92 e0       	ldi	r25, 0x02	; 2
     6d6:	0e 94 93 09 	call	0x1326	; 0x1326 <Keyboard_::press(unsigned char)>
     6da:	1e 82       	std	Y+6, r1	; 0x06
     6dc:	85 e9       	ldi	r24, 0x95	; 149
     6de:	92 e0       	ldi	r25, 0x02	; 2
     6e0:	0e 94 33 09 	call	0x1266	; 0x1266 <Keyboard_::sendReport()>
     6e4:	87 e7       	ldi	r24, 0x77	; 119
     6e6:	92 e0       	ldi	r25, 0x02	; 2
     6e8:	df 91       	pop	r29
     6ea:	cf 91       	pop	r28
     6ec:	1f 91       	pop	r17
     6ee:	0c 94 dd 08 	jmp	0x11ba	; 0x11ba <ConsumerControl_::sendReport()>

000006f2 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::releaseAllKeys()>:
     6f2:	fc 01       	movw	r30, r24
     6f4:	16 82       	std	Z+6, r1	; 0x06
     6f6:	15 82       	std	Z+5, r1	; 0x05
     6f8:	88 e5       	ldi	r24, 0x58	; 88
     6fa:	92 e0       	ldi	r25, 0x02	; 2
     6fc:	0e 94 df 07 	call	0xfbe	; 0xfbe <BootKeyboard_::getProtocol()>
     700:	81 11       	cpse	r24, r1
     702:	04 c0       	rjmp	.+8      	; 0x70c <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::releaseAllKeys()+0x1a>
     704:	88 e5       	ldi	r24, 0x58	; 88
     706:	92 e0       	ldi	r25, 0x02	; 2
     708:	0c 94 7d 08 	jmp	0x10fa	; 0x10fa <BootKeyboard_::releaseAll()>
     70c:	85 e9       	ldi	r24, 0x95	; 149
     70e:	92 e0       	ldi	r25, 0x02	; 2
     710:	0e 94 e3 09 	call	0x13c6	; 0x13c6 <Keyboard_::releaseAll()>
     714:	87 e7       	ldi	r24, 0x77	; 119
     716:	92 e0       	ldi	r25, 0x02	; 2
     718:	0c 94 ca 08 	jmp	0x1194	; 0x1194 <ConsumerControl_::releaseAll()>

0000071c <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::setup()>:
     71c:	cf 93       	push	r28
     71e:	0f b6       	in	r0, 0x3f	; 63
     720:	f8 94       	cli
     722:	a8 95       	wdr
     724:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <__TEXT_REGION_LENGTH__+0x7e0060>
     728:	88 61       	ori	r24, 0x18	; 24
     72a:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <__TEXT_REGION_LENGTH__+0x7e0060>
     72e:	10 92 60 00 	sts	0x0060, r1	; 0x800060 <__TEXT_REGION_LENGTH__+0x7e0060>
     732:	0f be       	out	0x3f, r0	; 63
     734:	a5 e2       	ldi	r26, 0x25	; 37
     736:	b1 e0       	ldi	r27, 0x01	; 1
     738:	41 e3       	ldi	r20, 0x31	; 49
     73a:	51 e0       	ldi	r21, 0x01	; 1
     73c:	61 e0       	ldi	r22, 0x01	; 1
     73e:	70 e0       	ldi	r23, 0x00	; 0
     740:	8d 91       	ld	r24, X+
     742:	e8 2f       	mov	r30, r24
     744:	f0 e0       	ldi	r31, 0x00	; 0
     746:	24 e0       	ldi	r18, 0x04	; 4
     748:	f5 95       	asr	r31
     74a:	e7 95       	ror	r30
     74c:	2a 95       	dec	r18
     74e:	e1 f7       	brne	.-8      	; 0x748 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::setup()+0x2c>
     750:	c1 a1       	ldd	r28, Z+33	; 0x21
     752:	8f 70       	andi	r24, 0x0F	; 15
     754:	9b 01       	movw	r18, r22
     756:	01 c0       	rjmp	.+2      	; 0x75a <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::setup()+0x3e>
     758:	22 0f       	add	r18, r18
     75a:	8a 95       	dec	r24
     75c:	ea f7       	brpl	.-6      	; 0x758 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::setup()+0x3c>
     75e:	92 2f       	mov	r25, r18
     760:	90 95       	com	r25
     762:	9c 23       	and	r25, r28
     764:	91 a3       	std	Z+33, r25	; 0x21
     766:	82 a1       	ldd	r24, Z+34	; 0x22
     768:	82 2b       	or	r24, r18
     76a:	82 a3       	std	Z+34, r24	; 0x22
     76c:	4a 17       	cp	r20, r26
     76e:	5b 07       	cpc	r21, r27
     770:	39 f7       	brne	.-50     	; 0x740 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::setup()+0x24>
     772:	a1 e3       	ldi	r26, 0x31	; 49
     774:	b1 e0       	ldi	r27, 0x01	; 1
     776:	45 e3       	ldi	r20, 0x35	; 53
     778:	51 e0       	ldi	r21, 0x01	; 1
     77a:	61 e0       	ldi	r22, 0x01	; 1
     77c:	70 e0       	ldi	r23, 0x00	; 0
     77e:	8d 91       	ld	r24, X+
     780:	e8 2f       	mov	r30, r24
     782:	f0 e0       	ldi	r31, 0x00	; 0
     784:	94 e0       	ldi	r25, 0x04	; 4
     786:	f5 95       	asr	r31
     788:	e7 95       	ror	r30
     78a:	9a 95       	dec	r25
     78c:	e1 f7       	brne	.-8      	; 0x786 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::setup()+0x6a>
     78e:	91 a1       	ldd	r25, Z+33	; 0x21
     790:	8f 70       	andi	r24, 0x0F	; 15
     792:	9b 01       	movw	r18, r22
     794:	01 c0       	rjmp	.+2      	; 0x798 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::setup()+0x7c>
     796:	22 0f       	add	r18, r18
     798:	8a 95       	dec	r24
     79a:	ea f7       	brpl	.-6      	; 0x796 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::setup()+0x7a>
     79c:	92 2b       	or	r25, r18
     79e:	91 a3       	std	Z+33, r25	; 0x21
     7a0:	82 a1       	ldd	r24, Z+34	; 0x22
     7a2:	82 2b       	or	r24, r18
     7a4:	82 a3       	std	Z+34, r24	; 0x22
     7a6:	4a 17       	cp	r20, r26
     7a8:	5b 07       	cpc	r21, r27
     7aa:	49 f7       	brne	.-46     	; 0x77e <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::setup()+0x62>
     7ac:	80 e1       	ldi	r24, 0x10	; 16
     7ae:	80 93 81 00 	sts	0x0081, r24	; 0x800081 <__TEXT_REGION_LENGTH__+0x7e0081>
     7b2:	10 92 80 00 	sts	0x0080, r1	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
     7b6:	80 e2       	ldi	r24, 0x20	; 32
     7b8:	95 e3       	ldi	r25, 0x35	; 53
     7ba:	90 93 87 00 	sts	0x0087, r25	; 0x800087 <__TEXT_REGION_LENGTH__+0x7e0087>
     7be:	80 93 86 00 	sts	0x0086, r24	; 0x800086 <__TEXT_REGION_LENGTH__+0x7e0086>
     7c2:	81 e1       	ldi	r24, 0x11	; 17
     7c4:	80 93 81 00 	sts	0x0081, r24	; 0x800081 <__TEXT_REGION_LENGTH__+0x7e0081>
     7c8:	81 e0       	ldi	r24, 0x01	; 1
     7ca:	80 93 6f 00 	sts	0x006F, r24	; 0x80006f <__TEXT_REGION_LENGTH__+0x7e006f>
     7ce:	cf 91       	pop	r28
     7d0:	08 95       	ret

000007d2 <kaleidoscope::Runtime_::setup()>:
     7d2:	cf 93       	push	r28
     7d4:	40 e8       	ldi	r20, 0x80	; 128
     7d6:	55 e2       	ldi	r21, 0x25	; 37
     7d8:	60 e0       	ldi	r22, 0x00	; 0
     7da:	70 e0       	ldi	r23, 0x00	; 0
     7dc:	85 ef       	ldi	r24, 0xF5	; 245
     7de:	92 e0       	ldi	r25, 0x02	; 2
     7e0:	0e 94 64 0c 	call	0x18c8	; 0x18c8 <Serial_::begin(unsigned long)>
     7e4:	0e 94 5a 01 	call	0x2b4	; 0x2b4 <kaleidoscope::sketch_exploration::pluginsExploreSketch()>
     7e8:	0e 94 65 01 	call	0x2ca	; 0x2ca <kaleidoscope::Hooks::onSetup()>
     7ec:	85 b7       	in	r24, 0x35	; 53
     7ee:	80 68       	ori	r24, 0x80	; 128
     7f0:	85 bf       	out	0x35, r24	; 53
     7f2:	85 b7       	in	r24, 0x35	; 53
     7f4:	80 68       	ori	r24, 0x80	; 128
     7f6:	85 bf       	out	0x35, r24	; 53
     7f8:	0e 94 97 01 	call	0x32e	; 0x32e <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::setup() [clone .isra.21]>
     7fc:	83 e5       	ldi	r24, 0x53	; 83
     7fe:	92 e0       	ldi	r25, 0x02	; 2
     800:	0e 94 8e 03 	call	0x71c	; 0x71c <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::setup()>
     804:	0e 94 84 05 	call	0xb08	; 0xb08 <kaleidoscope::Layer_::updateActiveLayers()>
     808:	c0 e0       	ldi	r28, 0x00	; 0
     80a:	8c 2f       	mov	r24, r28
     80c:	0e 94 2a 05 	call	0xa54	; 0xa54 <kaleidoscope::Layer_::updateLiveCompositeKeymap(kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>)>
     810:	cf 5f       	subi	r28, 0xFF	; 255
     812:	c0 33       	cpi	r28, 0x30	; 48
     814:	d1 f7       	brne	.-12     	; 0x80a <kaleidoscope::Runtime_::setup()+0x38>
     816:	cf 91       	pop	r28
     818:	08 95       	ret

0000081a <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()>:
     81a:	3f 92       	push	r3
     81c:	4f 92       	push	r4
     81e:	5f 92       	push	r5
     820:	6f 92       	push	r6
     822:	7f 92       	push	r7
     824:	8f 92       	push	r8
     826:	9f 92       	push	r9
     828:	af 92       	push	r10
     82a:	bf 92       	push	r11
     82c:	cf 92       	push	r12
     82e:	df 92       	push	r13
     830:	ef 92       	push	r14
     832:	ff 92       	push	r15
     834:	0f 93       	push	r16
     836:	1f 93       	push	r17
     838:	cf 93       	push	r28
     83a:	df 93       	push	r29
     83c:	ca ef       	ldi	r28, 0xFA	; 250
     83e:	d1 e0       	ldi	r29, 0x01	; 1
     840:	22 e3       	ldi	r18, 0x32	; 50
     842:	82 2e       	mov	r8, r18
     844:	22 e0       	ldi	r18, 0x02	; 2
     846:	92 2e       	mov	r9, r18
     848:	31 e3       	ldi	r19, 0x31	; 49
     84a:	a3 2e       	mov	r10, r19
     84c:	31 e0       	ldi	r19, 0x01	; 1
     84e:	b3 2e       	mov	r11, r19
     850:	4a e2       	ldi	r20, 0x2A	; 42
     852:	44 2e       	mov	r4, r20
     854:	42 e0       	ldi	r20, 0x02	; 2
     856:	54 2e       	mov	r5, r20
     858:	66 24       	eor	r6, r6
     85a:	63 94       	inc	r6
     85c:	71 2c       	mov	r7, r1
     85e:	63 e0       	ldi	r22, 0x03	; 3
     860:	36 2e       	mov	r3, r22
     862:	88 81       	ld	r24, Y
     864:	03 e0       	ldi	r16, 0x03	; 3
     866:	10 e0       	ldi	r17, 0x00	; 0
     868:	21 e0       	ldi	r18, 0x01	; 1
     86a:	88 23       	and	r24, r24
     86c:	29 f0       	breq	.+10     	; 0x878 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0x5e>
     86e:	81 50       	subi	r24, 0x01	; 1
     870:	88 83       	st	Y, r24
     872:	02 e0       	ldi	r16, 0x02	; 2
     874:	10 e0       	ldi	r17, 0x00	; 0
     876:	20 e0       	ldi	r18, 0x00	; 0
     878:	90 e0       	ldi	r25, 0x00	; 0
     87a:	89 81       	ldd	r24, Y+1	; 0x01
     87c:	88 23       	and	r24, r24
     87e:	21 f0       	breq	.+8      	; 0x888 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0x6e>
     880:	81 50       	subi	r24, 0x01	; 1
     882:	89 83       	std	Y+1, r24	; 0x01
     884:	02 2f       	mov	r16, r18
     886:	19 2f       	mov	r17, r25
     888:	8a 81       	ldd	r24, Y+2	; 0x02
     88a:	81 11       	cpse	r24, r1
     88c:	ab c0       	rjmp	.+342    	; 0x9e4 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0x1ca>
     88e:	04 60       	ori	r16, 0x04	; 4
     890:	8b 81       	ldd	r24, Y+3	; 0x03
     892:	81 11       	cpse	r24, r1
     894:	a4 c0       	rjmp	.+328    	; 0x9de <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0x1c4>
     896:	08 60       	ori	r16, 0x08	; 8
     898:	8c 81       	ldd	r24, Y+4	; 0x04
     89a:	81 11       	cpse	r24, r1
     89c:	9d c0       	rjmp	.+314    	; 0x9d8 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0x1be>
     89e:	00 61       	ori	r16, 0x10	; 16
     8a0:	8d 81       	ldd	r24, Y+5	; 0x05
     8a2:	81 11       	cpse	r24, r1
     8a4:	96 c0       	rjmp	.+300    	; 0x9d2 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0x1b8>
     8a6:	00 62       	ori	r16, 0x20	; 32
     8a8:	8e 81       	ldd	r24, Y+6	; 0x06
     8aa:	81 11       	cpse	r24, r1
     8ac:	8f c0       	rjmp	.+286    	; 0x9cc <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0x1b2>
     8ae:	00 64       	ori	r16, 0x40	; 64
     8b0:	8f 81       	ldd	r24, Y+7	; 0x07
     8b2:	81 11       	cpse	r24, r1
     8b4:	88 c0       	rjmp	.+272    	; 0x9c6 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0x1ac>
     8b6:	00 68       	ori	r16, 0x80	; 128
     8b8:	88 85       	ldd	r24, Y+8	; 0x08
     8ba:	81 11       	cpse	r24, r1
     8bc:	81 c0       	rjmp	.+258    	; 0x9c0 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0x1a6>
     8be:	11 60       	ori	r17, 0x01	; 1
     8c0:	89 85       	ldd	r24, Y+9	; 0x09
     8c2:	81 11       	cpse	r24, r1
     8c4:	7a c0       	rjmp	.+244    	; 0x9ba <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0x1a0>
     8c6:	12 60       	ori	r17, 0x02	; 2
     8c8:	8a 85       	ldd	r24, Y+10	; 0x0a
     8ca:	81 11       	cpse	r24, r1
     8cc:	73 c0       	rjmp	.+230    	; 0x9b4 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0x19a>
     8ce:	14 60       	ori	r17, 0x04	; 4
     8d0:	8b 85       	ldd	r24, Y+11	; 0x0b
     8d2:	81 11       	cpse	r24, r1
     8d4:	6c c0       	rjmp	.+216    	; 0x9ae <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0x194>
     8d6:	18 60       	ori	r17, 0x08	; 8
     8d8:	f5 01       	movw	r30, r10
     8da:	81 91       	ld	r24, Z+
     8dc:	5f 01       	movw	r10, r30
     8de:	e8 2e       	mov	r14, r24
     8e0:	f1 2c       	mov	r15, r1
     8e2:	f5 94       	asr	r15
     8e4:	e7 94       	ror	r14
     8e6:	f5 94       	asr	r15
     8e8:	e7 94       	ror	r14
     8ea:	f5 94       	asr	r15
     8ec:	e7 94       	ror	r14
     8ee:	f5 94       	asr	r15
     8f0:	e7 94       	ror	r14
     8f2:	f7 01       	movw	r30, r14
     8f4:	92 a1       	ldd	r25, Z+34	; 0x22
     8f6:	8f 70       	andi	r24, 0x0F	; 15
     8f8:	63 01       	movw	r12, r6
     8fa:	01 c0       	rjmp	.+2      	; 0x8fe <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0xe4>
     8fc:	cc 0c       	add	r12, r12
     8fe:	8a 95       	dec	r24
     900:	ea f7       	brpl	.-6      	; 0x8fc <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0xe2>
     902:	89 2f       	mov	r24, r25
     904:	8c 25       	eor	r24, r12
     906:	82 a3       	std	Z+34, r24	; 0x22
     908:	0e 94 e2 02 	call	0x5c4	; 0x5c4 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readCols() [clone .isra.27]>
     90c:	f4 01       	movw	r30, r8
     90e:	20 81       	ld	r18, Z
     910:	31 81       	ldd	r19, Z+1	; 0x01
     912:	82 27       	eor	r24, r18
     914:	93 27       	eor	r25, r19
     916:	08 23       	and	r16, r24
     918:	19 23       	and	r17, r25
     91a:	02 27       	eor	r16, r18
     91c:	13 27       	eor	r17, r19
     91e:	f7 01       	movw	r30, r14
     920:	82 a1       	ldd	r24, Z+34	; 0x22
     922:	c8 26       	eor	r12, r24
     924:	c2 a2       	std	Z+34, r12	; 0x22
     926:	f4 01       	movw	r30, r8
     928:	20 81       	ld	r18, Z
     92a:	31 81       	ldd	r19, Z+1	; 0x01
     92c:	20 27       	eor	r18, r16
     92e:	31 27       	eor	r19, r17
     930:	20 fd       	sbrc	r18, 0
     932:	38 82       	st	Y, r3
     934:	21 fd       	sbrc	r18, 1
     936:	39 82       	std	Y+1, r3	; 0x01
     938:	22 fd       	sbrc	r18, 2
     93a:	3a 82       	std	Y+2, r3	; 0x02
     93c:	23 fd       	sbrc	r18, 3
     93e:	3b 82       	std	Y+3, r3	; 0x03
     940:	24 fd       	sbrc	r18, 4
     942:	3c 82       	std	Y+4, r3	; 0x04
     944:	25 fd       	sbrc	r18, 5
     946:	3d 82       	std	Y+5, r3	; 0x05
     948:	26 fd       	sbrc	r18, 6
     94a:	3e 82       	std	Y+6, r3	; 0x06
     94c:	27 fd       	sbrc	r18, 7
     94e:	3f 82       	std	Y+7, r3	; 0x07
     950:	30 fd       	sbrc	r19, 0
     952:	38 86       	std	Y+8, r3	; 0x08
     954:	31 fd       	sbrc	r19, 1
     956:	39 86       	std	Y+9, r3	; 0x09
     958:	32 fd       	sbrc	r19, 2
     95a:	3a 86       	std	Y+10, r3	; 0x0a
     95c:	33 ff       	sbrs	r19, 3
     95e:	1d c0       	rjmp	.+58     	; 0x99a <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0x180>
     960:	3b 86       	std	Y+11, r3	; 0x0b
     962:	f4 01       	movw	r30, r8
     964:	01 93       	st	Z+, r16
     966:	11 93       	st	Z+, r17
     968:	4f 01       	movw	r8, r30
     96a:	2c 96       	adiw	r28, 0x0c	; 12
     96c:	f2 e0       	ldi	r31, 0x02	; 2
     96e:	ca 32       	cpi	r28, 0x2A	; 42
     970:	df 07       	cpc	r29, r31
     972:	09 f0       	breq	.+2      	; 0x976 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0x15c>
     974:	76 cf       	rjmp	.-276    	; 0x862 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0x48>
     976:	df 91       	pop	r29
     978:	cf 91       	pop	r28
     97a:	1f 91       	pop	r17
     97c:	0f 91       	pop	r16
     97e:	ff 90       	pop	r15
     980:	ef 90       	pop	r14
     982:	df 90       	pop	r13
     984:	cf 90       	pop	r12
     986:	bf 90       	pop	r11
     988:	af 90       	pop	r10
     98a:	9f 90       	pop	r9
     98c:	8f 90       	pop	r8
     98e:	7f 90       	pop	r7
     990:	6f 90       	pop	r6
     992:	5f 90       	pop	r5
     994:	4f 90       	pop	r4
     996:	3f 90       	pop	r3
     998:	08 95       	ret
     99a:	f4 01       	movw	r30, r8
     99c:	01 93       	st	Z+, r16
     99e:	11 93       	st	Z+, r17
     9a0:	4f 01       	movw	r8, r30
     9a2:	2c 96       	adiw	r28, 0x0c	; 12
     9a4:	4c 16       	cp	r4, r28
     9a6:	5d 06       	cpc	r5, r29
     9a8:	09 f0       	breq	.+2      	; 0x9ac <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0x192>
     9aa:	5b cf       	rjmp	.-330    	; 0x862 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0x48>
     9ac:	e4 cf       	rjmp	.-56     	; 0x976 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0x15c>
     9ae:	81 50       	subi	r24, 0x01	; 1
     9b0:	8b 87       	std	Y+11, r24	; 0x0b
     9b2:	92 cf       	rjmp	.-220    	; 0x8d8 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0xbe>
     9b4:	81 50       	subi	r24, 0x01	; 1
     9b6:	8a 87       	std	Y+10, r24	; 0x0a
     9b8:	8b cf       	rjmp	.-234    	; 0x8d0 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0xb6>
     9ba:	81 50       	subi	r24, 0x01	; 1
     9bc:	89 87       	std	Y+9, r24	; 0x09
     9be:	84 cf       	rjmp	.-248    	; 0x8c8 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0xae>
     9c0:	81 50       	subi	r24, 0x01	; 1
     9c2:	88 87       	std	Y+8, r24	; 0x08
     9c4:	7d cf       	rjmp	.-262    	; 0x8c0 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0xa6>
     9c6:	81 50       	subi	r24, 0x01	; 1
     9c8:	8f 83       	std	Y+7, r24	; 0x07
     9ca:	76 cf       	rjmp	.-276    	; 0x8b8 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0x9e>
     9cc:	81 50       	subi	r24, 0x01	; 1
     9ce:	8e 83       	std	Y+6, r24	; 0x06
     9d0:	6f cf       	rjmp	.-290    	; 0x8b0 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0x96>
     9d2:	81 50       	subi	r24, 0x01	; 1
     9d4:	8d 83       	std	Y+5, r24	; 0x05
     9d6:	68 cf       	rjmp	.-304    	; 0x8a8 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0x8e>
     9d8:	81 50       	subi	r24, 0x01	; 1
     9da:	8c 83       	std	Y+4, r24	; 0x04
     9dc:	61 cf       	rjmp	.-318    	; 0x8a0 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0x86>
     9de:	81 50       	subi	r24, 0x01	; 1
     9e0:	8b 83       	std	Y+3, r24	; 0x03
     9e2:	5a cf       	rjmp	.-332    	; 0x898 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0x7e>
     9e4:	81 50       	subi	r24, 0x01	; 1
     9e6:	8a 83       	std	Y+2, r24	; 0x02
     9e8:	53 cf       	rjmp	.-346    	; 0x890 <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()+0x76>

000009ea <kaleidoscope::Runtime_::loop()>:
     9ea:	0e 94 a0 0a 	call	0x1540	; 0x1540 <millis>
     9ee:	60 93 61 01 	sts	0x0161, r22	; 0x800161 <kaleidoscope::Runtime_::millis_at_cycle_start_>
     9f2:	70 93 62 01 	sts	0x0162, r23	; 0x800162 <kaleidoscope::Runtime_::millis_at_cycle_start_+0x1>
     9f6:	80 93 63 01 	sts	0x0163, r24	; 0x800163 <kaleidoscope::Runtime_::millis_at_cycle_start_+0x2>
     9fa:	90 93 64 01 	sts	0x0164, r25	; 0x800164 <kaleidoscope::Runtime_::millis_at_cycle_start_+0x3>
     9fe:	0e 94 68 01 	call	0x2d0	; 0x2d0 <kaleidoscope::Hooks::beforeEachCycle()>
     a02:	80 91 53 02 	lds	r24, 0x0253	; 0x800253 <kaleidoscope_internal::device+0x9>
     a06:	88 23       	and	r24, r24
     a08:	31 f0       	breq	.+12     	; 0xa16 <kaleidoscope::Runtime_::loop()+0x2c>
     a0a:	10 92 53 02 	sts	0x0253, r1	; 0x800253 <kaleidoscope_internal::device+0x9>
     a0e:	83 e5       	ldi	r24, 0x53	; 83
     a10:	92 e0       	ldi	r25, 0x02	; 2
     a12:	0e 94 0d 04 	call	0x81a	; 0x81a <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::readMatrix()>
     a16:	0e 94 a7 01 	call	0x34e	; 0x34e <kaleidoscope::driver::keyscanner::ATmega<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::actOnMatrixScan() [clone .isra.23]>
     a1a:	0e 94 78 01 	call	0x2f0	; 0x2f0 <kaleidoscope::Hooks::beforeReportingState()>
     a1e:	8a e4       	ldi	r24, 0x4A	; 74
     a20:	92 e0       	ldi	r25, 0x02	; 2
     a22:	0e 94 20 03 	call	0x640	; 0x640 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::sendReport()>
     a26:	8a e4       	ldi	r24, 0x4A	; 74
     a28:	92 e0       	ldi	r25, 0x02	; 2
     a2a:	0e 94 79 03 	call	0x6f2	; 0x6f2 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::releaseAllKeys()>
     a2e:	0c 94 7b 01 	jmp	0x2f6	; 0x2f6 <kaleidoscope::Hooks::afterEachCycle()>

00000a32 <kaleidoscope::Layer_::getKeyFromPROGMEM(unsigned char, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>)>:
     a32:	70 e0       	ldi	r23, 0x00	; 0
     a34:	90 e3       	ldi	r25, 0x30	; 48
     a36:	89 9f       	mul	r24, r25
     a38:	60 0d       	add	r22, r0
     a3a:	71 1d       	adc	r23, r1
     a3c:	11 24       	eor	r1, r1
     a3e:	66 0f       	add	r22, r22
     a40:	77 1f       	adc	r23, r23
     a42:	fb 01       	movw	r30, r22
     a44:	e4 55       	subi	r30, 0x54	; 84
     a46:	ff 4f       	sbci	r31, 0xFF	; 255
     a48:	84 91       	lpm	r24, Z
     a4a:	fb 01       	movw	r30, r22
     a4c:	e3 55       	subi	r30, 0x53	; 83
     a4e:	ff 4f       	sbci	r31, 0xFF	; 255
     a50:	94 91       	lpm	r25, Z
     a52:	08 95       	ret

00000a54 <kaleidoscope::Layer_::updateLiveCompositeKeymap(kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>)>:
     a54:	cf 93       	push	r28
     a56:	df 93       	push	r29
     a58:	28 2f       	mov	r18, r24
     a5a:	30 e0       	ldi	r19, 0x00	; 0
     a5c:	e9 01       	movw	r28, r18
     a5e:	cc 0f       	add	r28, r28
     a60:	dd 1f       	adc	r29, r29
     a62:	cb 56       	subi	r28, 0x6B	; 107
     a64:	de 4f       	sbci	r29, 0xFE	; 254
     a66:	2b 59       	subi	r18, 0x9B	; 155
     a68:	3e 4f       	sbci	r19, 0xFE	; 254
     a6a:	e0 91 01 01 	lds	r30, 0x0101	; 0x800101 <kaleidoscope::Layer_::getKey>
     a6e:	f0 91 02 01 	lds	r31, 0x0102	; 0x800102 <kaleidoscope::Layer_::getKey+0x1>
     a72:	68 2f       	mov	r22, r24
     a74:	d9 01       	movw	r26, r18
     a76:	8c 91       	ld	r24, X
     a78:	09 95       	icall
     a7a:	99 83       	std	Y+1, r25	; 0x01
     a7c:	88 83       	st	Y, r24
     a7e:	df 91       	pop	r29
     a80:	cf 91       	pop	r28
     a82:	08 95       	ret

00000a84 <kaleidoscope::Layer_::updateTopActiveLayer()>:
     a84:	cf 92       	push	r12
     a86:	df 92       	push	r13
     a88:	ef 92       	push	r14
     a8a:	ff 92       	push	r15
     a8c:	c0 90 f6 01 	lds	r12, 0x01F6	; 0x8001f6 <kaleidoscope::Layer_::layer_state_>
     a90:	d0 90 f7 01 	lds	r13, 0x01F7	; 0x8001f7 <kaleidoscope::Layer_::layer_state_+0x1>
     a94:	e0 90 f8 01 	lds	r14, 0x01F8	; 0x8001f8 <kaleidoscope::Layer_::layer_state_+0x2>
     a98:	f0 90 f9 01 	lds	r15, 0x01F9	; 0x8001f9 <kaleidoscope::Layer_::layer_state_+0x3>
     a9c:	80 91 00 01 	lds	r24, 0x0100	; 0x800100 <__data_start>
     aa0:	81 50       	subi	r24, 0x01	; 1
     aa2:	90 e0       	ldi	r25, 0x00	; 0
     aa4:	28 2f       	mov	r18, r24
     aa6:	00 97       	sbiw	r24, 0x00	; 0
     aa8:	a1 f0       	breq	.+40     	; 0xad2 <kaleidoscope::Layer_::updateTopActiveLayer()+0x4e>
     aaa:	b7 01       	movw	r22, r14
     aac:	a6 01       	movw	r20, r12
     aae:	08 2e       	mov	r0, r24
     ab0:	04 c0       	rjmp	.+8      	; 0xaba <kaleidoscope::Layer_::updateTopActiveLayer()+0x36>
     ab2:	76 95       	lsr	r23
     ab4:	67 95       	ror	r22
     ab6:	57 95       	ror	r21
     ab8:	47 95       	ror	r20
     aba:	0a 94       	dec	r0
     abc:	d2 f7       	brpl	.-12     	; 0xab2 <kaleidoscope::Layer_::updateTopActiveLayer()+0x2e>
     abe:	01 97       	sbiw	r24, 0x01	; 1
     ac0:	40 ff       	sbrs	r20, 0
     ac2:	f0 cf       	rjmp	.-32     	; 0xaa4 <kaleidoscope::Layer_::updateTopActiveLayer()+0x20>
     ac4:	20 93 f5 01 	sts	0x01F5, r18	; 0x8001f5 <kaleidoscope::Layer_::top_active_layer_>
     ac8:	ff 90       	pop	r15
     aca:	ef 90       	pop	r14
     acc:	df 90       	pop	r13
     ace:	cf 90       	pop	r12
     ad0:	08 95       	ret
     ad2:	10 92 f5 01 	sts	0x01F5, r1	; 0x8001f5 <kaleidoscope::Layer_::top_active_layer_>
     ad6:	f8 cf       	rjmp	.-16     	; 0xac8 <kaleidoscope::Layer_::updateTopActiveLayer()+0x44>

00000ad8 <kaleidoscope::Layer_::isActive(unsigned char)>:
     ad8:	0f 93       	push	r16
     ada:	1f 93       	push	r17
     adc:	40 91 f6 01 	lds	r20, 0x01F6	; 0x8001f6 <kaleidoscope::Layer_::layer_state_>
     ae0:	50 91 f7 01 	lds	r21, 0x01F7	; 0x8001f7 <kaleidoscope::Layer_::layer_state_+0x1>
     ae4:	60 91 f8 01 	lds	r22, 0x01F8	; 0x8001f8 <kaleidoscope::Layer_::layer_state_+0x2>
     ae8:	70 91 f9 01 	lds	r23, 0x01F9	; 0x8001f9 <kaleidoscope::Layer_::layer_state_+0x3>
     aec:	8a 01       	movw	r16, r20
     aee:	9b 01       	movw	r18, r22
     af0:	04 c0       	rjmp	.+8      	; 0xafa <kaleidoscope::Layer_::isActive(unsigned char)+0x22>
     af2:	36 95       	lsr	r19
     af4:	27 95       	ror	r18
     af6:	17 95       	ror	r17
     af8:	07 95       	ror	r16
     afa:	8a 95       	dec	r24
     afc:	d2 f7       	brpl	.-12     	; 0xaf2 <kaleidoscope::Layer_::isActive(unsigned char)+0x1a>
     afe:	c8 01       	movw	r24, r16
     b00:	81 70       	andi	r24, 0x01	; 1
     b02:	1f 91       	pop	r17
     b04:	0f 91       	pop	r16
     b06:	08 95       	ret

00000b08 <kaleidoscope::Layer_::updateActiveLayers()>:
     b08:	0f 93       	push	r16
     b0a:	1f 93       	push	r17
     b0c:	cf 93       	push	r28
     b0e:	df 93       	push	r29
     b10:	e5 e6       	ldi	r30, 0x65	; 101
     b12:	f1 e0       	ldi	r31, 0x01	; 1
     b14:	80 e3       	ldi	r24, 0x30	; 48
     b16:	df 01       	movw	r26, r30
     b18:	1d 92       	st	X+, r1
     b1a:	8a 95       	dec	r24
     b1c:	e9 f7       	brne	.-6      	; 0xb18 <kaleidoscope::Layer_::updateActiveLayers()+0x10>
     b1e:	8f 01       	movw	r16, r30
     b20:	d0 e0       	ldi	r29, 0x00	; 0
     b22:	d0 33       	cpi	r29, 0x30	; 48
     b24:	e1 f0       	breq	.+56     	; 0xb5e <kaleidoscope::Layer_::updateActiveLayers()+0x56>
     b26:	c0 91 f5 01 	lds	r28, 0x01F5	; 0x8001f5 <kaleidoscope::Layer_::top_active_layer_>
     b2a:	1c 16       	cp	r1, r28
     b2c:	94 f4       	brge	.+36     	; 0xb52 <kaleidoscope::Layer_::updateActiveLayers()+0x4a>
     b2e:	8c 2f       	mov	r24, r28
     b30:	0e 94 6c 05 	call	0xad8	; 0xad8 <kaleidoscope::Layer_::isActive(unsigned char)>
     b34:	88 23       	and	r24, r24
     b36:	89 f0       	breq	.+34     	; 0xb5a <kaleidoscope::Layer_::updateActiveLayers()+0x52>
     b38:	e0 91 01 01 	lds	r30, 0x0101	; 0x800101 <kaleidoscope::Layer_::getKey>
     b3c:	f0 91 02 01 	lds	r31, 0x0102	; 0x800102 <kaleidoscope::Layer_::getKey+0x1>
     b40:	6d 2f       	mov	r22, r29
     b42:	8c 2f       	mov	r24, r28
     b44:	09 95       	icall
     b46:	8f 3f       	cpi	r24, 0xFF	; 255
     b48:	11 f4       	brne	.+4      	; 0xb4e <kaleidoscope::Layer_::updateActiveLayers()+0x46>
     b4a:	9f 3f       	cpi	r25, 0xFF	; 255
     b4c:	31 f0       	breq	.+12     	; 0xb5a <kaleidoscope::Layer_::updateActiveLayers()+0x52>
     b4e:	f8 01       	movw	r30, r16
     b50:	c0 83       	st	Z, r28
     b52:	df 5f       	subi	r29, 0xFF	; 255
     b54:	0f 5f       	subi	r16, 0xFF	; 255
     b56:	1f 4f       	sbci	r17, 0xFF	; 255
     b58:	e4 cf       	rjmp	.-56     	; 0xb22 <kaleidoscope::Layer_::updateActiveLayers()+0x1a>
     b5a:	c1 50       	subi	r28, 0x01	; 1
     b5c:	e6 cf       	rjmp	.-52     	; 0xb2a <kaleidoscope::Layer_::updateActiveLayers()+0x22>
     b5e:	df 91       	pop	r29
     b60:	cf 91       	pop	r28
     b62:	1f 91       	pop	r17
     b64:	0f 91       	pop	r16
     b66:	08 95       	ret

00000b68 <kaleidoscope::Layer_::move(unsigned char)>:
     b68:	28 2f       	mov	r18, r24
     b6a:	80 91 00 01 	lds	r24, 0x0100	; 0x800100 <__data_start>
     b6e:	28 17       	cp	r18, r24
     b70:	08 f0       	brcs	.+2      	; 0xb74 <kaleidoscope::Layer_::move(unsigned char)+0xc>
     b72:	20 e0       	ldi	r18, 0x00	; 0
     b74:	81 e0       	ldi	r24, 0x01	; 1
     b76:	90 e0       	ldi	r25, 0x00	; 0
     b78:	a0 e0       	ldi	r26, 0x00	; 0
     b7a:	b0 e0       	ldi	r27, 0x00	; 0
     b7c:	04 c0       	rjmp	.+8      	; 0xb86 <kaleidoscope::Layer_::move(unsigned char)+0x1e>
     b7e:	88 0f       	add	r24, r24
     b80:	99 1f       	adc	r25, r25
     b82:	aa 1f       	adc	r26, r26
     b84:	bb 1f       	adc	r27, r27
     b86:	2a 95       	dec	r18
     b88:	d2 f7       	brpl	.-12     	; 0xb7e <kaleidoscope::Layer_::move(unsigned char)+0x16>
     b8a:	80 93 f6 01 	sts	0x01F6, r24	; 0x8001f6 <kaleidoscope::Layer_::layer_state_>
     b8e:	90 93 f7 01 	sts	0x01F7, r25	; 0x8001f7 <kaleidoscope::Layer_::layer_state_+0x1>
     b92:	a0 93 f8 01 	sts	0x01F8, r26	; 0x8001f8 <kaleidoscope::Layer_::layer_state_+0x2>
     b96:	b0 93 f9 01 	sts	0x01F9, r27	; 0x8001f9 <kaleidoscope::Layer_::layer_state_+0x3>
     b9a:	0e 94 42 05 	call	0xa84	; 0xa84 <kaleidoscope::Layer_::updateTopActiveLayer()>
     b9e:	0e 94 84 05 	call	0xb08	; 0xb08 <kaleidoscope::Layer_::updateActiveLayers()>
     ba2:	0c 94 75 01 	jmp	0x2ea	; 0x2ea <kaleidoscope::Hooks::onLayerChange()>

00000ba6 <kaleidoscope::Layer_::deactivate(unsigned char)>:
     ba6:	0f 93       	push	r16
     ba8:	1f 93       	push	r17
     baa:	00 91 f6 01 	lds	r16, 0x01F6	; 0x8001f6 <kaleidoscope::Layer_::layer_state_>
     bae:	10 91 f7 01 	lds	r17, 0x01F7	; 0x8001f7 <kaleidoscope::Layer_::layer_state_+0x1>
     bb2:	20 91 f8 01 	lds	r18, 0x01F8	; 0x8001f8 <kaleidoscope::Layer_::layer_state_+0x2>
     bb6:	30 91 f9 01 	lds	r19, 0x01F9	; 0x8001f9 <kaleidoscope::Layer_::layer_state_+0x3>
     bba:	b9 01       	movw	r22, r18
     bbc:	a8 01       	movw	r20, r16
     bbe:	08 2e       	mov	r0, r24
     bc0:	04 c0       	rjmp	.+8      	; 0xbca <kaleidoscope::Layer_::deactivate(unsigned char)+0x24>
     bc2:	76 95       	lsr	r23
     bc4:	67 95       	ror	r22
     bc6:	57 95       	ror	r21
     bc8:	47 95       	ror	r20
     bca:	0a 94       	dec	r0
     bcc:	d2 f7       	brpl	.-12     	; 0xbc2 <kaleidoscope::Layer_::deactivate(unsigned char)+0x1c>
     bce:	40 ff       	sbrs	r20, 0
     bd0:	28 c0       	rjmp	.+80     	; 0xc22 <kaleidoscope::Layer_::deactivate(unsigned char)+0x7c>
     bd2:	41 e0       	ldi	r20, 0x01	; 1
     bd4:	50 e0       	ldi	r21, 0x00	; 0
     bd6:	60 e0       	ldi	r22, 0x00	; 0
     bd8:	70 e0       	ldi	r23, 0x00	; 0
     bda:	08 2e       	mov	r0, r24
     bdc:	04 c0       	rjmp	.+8      	; 0xbe6 <kaleidoscope::Layer_::deactivate(unsigned char)+0x40>
     bde:	44 0f       	add	r20, r20
     be0:	55 1f       	adc	r21, r21
     be2:	66 1f       	adc	r22, r22
     be4:	77 1f       	adc	r23, r23
     be6:	0a 94       	dec	r0
     be8:	d2 f7       	brpl	.-12     	; 0xbde <kaleidoscope::Layer_::deactivate(unsigned char)+0x38>
     bea:	40 95       	com	r20
     bec:	50 95       	com	r21
     bee:	60 95       	com	r22
     bf0:	70 95       	com	r23
     bf2:	40 23       	and	r20, r16
     bf4:	51 23       	and	r21, r17
     bf6:	62 23       	and	r22, r18
     bf8:	73 23       	and	r23, r19
     bfa:	40 93 f6 01 	sts	0x01F6, r20	; 0x8001f6 <kaleidoscope::Layer_::layer_state_>
     bfe:	50 93 f7 01 	sts	0x01F7, r21	; 0x8001f7 <kaleidoscope::Layer_::layer_state_+0x1>
     c02:	60 93 f8 01 	sts	0x01F8, r22	; 0x8001f8 <kaleidoscope::Layer_::layer_state_+0x2>
     c06:	70 93 f9 01 	sts	0x01F9, r23	; 0x8001f9 <kaleidoscope::Layer_::layer_state_+0x3>
     c0a:	90 91 f5 01 	lds	r25, 0x01F5	; 0x8001f5 <kaleidoscope::Layer_::top_active_layer_>
     c0e:	98 13       	cpse	r25, r24
     c10:	02 c0       	rjmp	.+4      	; 0xc16 <kaleidoscope::Layer_::deactivate(unsigned char)+0x70>
     c12:	0e 94 42 05 	call	0xa84	; 0xa84 <kaleidoscope::Layer_::updateTopActiveLayer()>
     c16:	0e 94 84 05 	call	0xb08	; 0xb08 <kaleidoscope::Layer_::updateActiveLayers()>
     c1a:	1f 91       	pop	r17
     c1c:	0f 91       	pop	r16
     c1e:	0c 94 75 01 	jmp	0x2ea	; 0x2ea <kaleidoscope::Hooks::onLayerChange()>
     c22:	1f 91       	pop	r17
     c24:	0f 91       	pop	r16
     c26:	08 95       	ret

00000c28 <kaleidoscope::Layer_::activate(unsigned char)>:
     c28:	cf 93       	push	r28
     c2a:	90 91 00 01 	lds	r25, 0x0100	; 0x800100 <__data_start>
     c2e:	89 17       	cp	r24, r25
     c30:	80 f5       	brcc	.+96     	; 0xc92 <kaleidoscope::Layer_::activate(unsigned char)+0x6a>
     c32:	c8 2f       	mov	r28, r24
     c34:	0e 94 6c 05 	call	0xad8	; 0xad8 <kaleidoscope::Layer_::isActive(unsigned char)>
     c38:	81 11       	cpse	r24, r1
     c3a:	2b c0       	rjmp	.+86     	; 0xc92 <kaleidoscope::Layer_::activate(unsigned char)+0x6a>
     c3c:	81 e0       	ldi	r24, 0x01	; 1
     c3e:	90 e0       	ldi	r25, 0x00	; 0
     c40:	a0 e0       	ldi	r26, 0x00	; 0
     c42:	b0 e0       	ldi	r27, 0x00	; 0
     c44:	0c 2e       	mov	r0, r28
     c46:	04 c0       	rjmp	.+8      	; 0xc50 <kaleidoscope::Layer_::activate(unsigned char)+0x28>
     c48:	88 0f       	add	r24, r24
     c4a:	99 1f       	adc	r25, r25
     c4c:	aa 1f       	adc	r26, r26
     c4e:	bb 1f       	adc	r27, r27
     c50:	0a 94       	dec	r0
     c52:	d2 f7       	brpl	.-12     	; 0xc48 <kaleidoscope::Layer_::activate(unsigned char)+0x20>
     c54:	40 91 f6 01 	lds	r20, 0x01F6	; 0x8001f6 <kaleidoscope::Layer_::layer_state_>
     c58:	50 91 f7 01 	lds	r21, 0x01F7	; 0x8001f7 <kaleidoscope::Layer_::layer_state_+0x1>
     c5c:	60 91 f8 01 	lds	r22, 0x01F8	; 0x8001f8 <kaleidoscope::Layer_::layer_state_+0x2>
     c60:	70 91 f9 01 	lds	r23, 0x01F9	; 0x8001f9 <kaleidoscope::Layer_::layer_state_+0x3>
     c64:	84 2b       	or	r24, r20
     c66:	95 2b       	or	r25, r21
     c68:	a6 2b       	or	r26, r22
     c6a:	b7 2b       	or	r27, r23
     c6c:	80 93 f6 01 	sts	0x01F6, r24	; 0x8001f6 <kaleidoscope::Layer_::layer_state_>
     c70:	90 93 f7 01 	sts	0x01F7, r25	; 0x8001f7 <kaleidoscope::Layer_::layer_state_+0x1>
     c74:	a0 93 f8 01 	sts	0x01F8, r26	; 0x8001f8 <kaleidoscope::Layer_::layer_state_+0x2>
     c78:	b0 93 f9 01 	sts	0x01F9, r27	; 0x8001f9 <kaleidoscope::Layer_::layer_state_+0x3>
     c7c:	80 91 f5 01 	lds	r24, 0x01F5	; 0x8001f5 <kaleidoscope::Layer_::top_active_layer_>
     c80:	8c 17       	cp	r24, r28
     c82:	10 f4       	brcc	.+4      	; 0xc88 <kaleidoscope::Layer_::activate(unsigned char)+0x60>
     c84:	0e 94 42 05 	call	0xa84	; 0xa84 <kaleidoscope::Layer_::updateTopActiveLayer()>
     c88:	0e 94 84 05 	call	0xb08	; 0xb08 <kaleidoscope::Layer_::updateActiveLayers()>
     c8c:	cf 91       	pop	r28
     c8e:	0c 94 75 01 	jmp	0x2ea	; 0x2ea <kaleidoscope::Hooks::onLayerChange()>
     c92:	cf 91       	pop	r28
     c94:	08 95       	ret

00000c96 <kaleidoscope::Layer_::activateNext()>:
     c96:	80 91 f5 01 	lds	r24, 0x01F5	; 0x8001f5 <kaleidoscope::Layer_::top_active_layer_>
     c9a:	8f 5f       	subi	r24, 0xFF	; 255
     c9c:	0c 94 14 06 	jmp	0xc28	; 0xc28 <kaleidoscope::Layer_::activate(unsigned char)>

00000ca0 <kaleidoscope::Layer_::deactivateTop()>:
     ca0:	80 91 f5 01 	lds	r24, 0x01F5	; 0x8001f5 <kaleidoscope::Layer_::top_active_layer_>
     ca4:	0c 94 d3 05 	jmp	0xba6	; 0xba6 <kaleidoscope::Layer_::deactivate(unsigned char)>

00000ca8 <kaleidoscope::Layer_::handleKeymapKeyswitchEvent(kaleidoscope::Key, unsigned char)>:
     ca8:	cf 93       	push	r28
     caa:	96 2f       	mov	r25, r22
     cac:	92 70       	andi	r25, 0x02	; 2
     cae:	84 35       	cpi	r24, 0x54	; 84
     cb0:	40 f0       	brcs	.+16     	; 0xcc2 <kaleidoscope::Layer_::handleKeymapKeyswitchEvent(kaleidoscope::Key, unsigned char)+0x1a>
     cb2:	99 23       	and	r25, r25
     cb4:	e1 f1       	breq	.+120    	; 0xd2e <kaleidoscope::Layer_::handleKeymapKeyswitchEvent(kaleidoscope::Key, unsigned char)+0x86>
     cb6:	60 fd       	sbrc	r22, 0
     cb8:	3a c0       	rjmp	.+116    	; 0xd2e <kaleidoscope::Layer_::handleKeymapKeyswitchEvent(kaleidoscope::Key, unsigned char)+0x86>
     cba:	84 55       	subi	r24, 0x54	; 84
     cbc:	cf 91       	pop	r28
     cbe:	0c 94 b4 05 	jmp	0xb68	; 0xb68 <kaleidoscope::Layer_::move(unsigned char)>
     cc2:	c8 2f       	mov	r28, r24
     cc4:	8a 32       	cpi	r24, 0x2A	; 42
     cc6:	30 f1       	brcs	.+76     	; 0xd14 <kaleidoscope::Layer_::handleKeymapKeyswitchEvent(kaleidoscope::Key, unsigned char)+0x6c>
     cc8:	ca 52       	subi	r28, 0x2A	; 42
     cca:	c1 32       	cpi	r28, 0x21	; 33
     ccc:	51 f0       	breq	.+20     	; 0xce2 <kaleidoscope::Layer_::handleKeymapKeyswitchEvent(kaleidoscope::Key, unsigned char)+0x3a>
     cce:	c2 32       	cpi	r28, 0x22	; 34
     cd0:	81 f4       	brne	.+32     	; 0xcf2 <kaleidoscope::Layer_::handleKeymapKeyswitchEvent(kaleidoscope::Key, unsigned char)+0x4a>
     cd2:	61 70       	andi	r22, 0x01	; 1
     cd4:	99 23       	and	r25, r25
     cd6:	49 f1       	breq	.+82     	; 0xd2a <kaleidoscope::Layer_::handleKeymapKeyswitchEvent(kaleidoscope::Key, unsigned char)+0x82>
     cd8:	61 11       	cpse	r22, r1
     cda:	29 c0       	rjmp	.+82     	; 0xd2e <kaleidoscope::Layer_::handleKeymapKeyswitchEvent(kaleidoscope::Key, unsigned char)+0x86>
     cdc:	cf 91       	pop	r28
     cde:	0c 94 4b 06 	jmp	0xc96	; 0xc96 <kaleidoscope::Layer_::activateNext()>
     ce2:	61 70       	andi	r22, 0x01	; 1
     ce4:	99 23       	and	r25, r25
     ce6:	29 f1       	breq	.+74     	; 0xd32 <kaleidoscope::Layer_::handleKeymapKeyswitchEvent(kaleidoscope::Key, unsigned char)+0x8a>
     ce8:	61 11       	cpse	r22, r1
     cea:	21 c0       	rjmp	.+66     	; 0xd2e <kaleidoscope::Layer_::handleKeymapKeyswitchEvent(kaleidoscope::Key, unsigned char)+0x86>
     cec:	cf 91       	pop	r28
     cee:	0c 94 50 06 	jmp	0xca0	; 0xca0 <kaleidoscope::Layer_::deactivateTop()>
     cf2:	99 23       	and	r25, r25
     cf4:	49 f0       	breq	.+18     	; 0xd08 <kaleidoscope::Layer_::handleKeymapKeyswitchEvent(kaleidoscope::Key, unsigned char)+0x60>
     cf6:	8c 2f       	mov	r24, r28
     cf8:	0e 94 6c 05 	call	0xad8	; 0xad8 <kaleidoscope::Layer_::isActive(unsigned char)>
     cfc:	81 11       	cpse	r24, r1
     cfe:	17 c0       	rjmp	.+46     	; 0xd2e <kaleidoscope::Layer_::handleKeymapKeyswitchEvent(kaleidoscope::Key, unsigned char)+0x86>
     d00:	8c 2f       	mov	r24, r28
     d02:	cf 91       	pop	r28
     d04:	0c 94 14 06 	jmp	0xc28	; 0xc28 <kaleidoscope::Layer_::activate(unsigned char)>
     d08:	60 ff       	sbrs	r22, 0
     d0a:	11 c0       	rjmp	.+34     	; 0xd2e <kaleidoscope::Layer_::handleKeymapKeyswitchEvent(kaleidoscope::Key, unsigned char)+0x86>
     d0c:	8c 2f       	mov	r24, r28
     d0e:	cf 91       	pop	r28
     d10:	0c 94 d3 05 	jmp	0xba6	; 0xba6 <kaleidoscope::Layer_::deactivate(unsigned char)>
     d14:	99 23       	and	r25, r25
     d16:	59 f0       	breq	.+22     	; 0xd2e <kaleidoscope::Layer_::handleKeymapKeyswitchEvent(kaleidoscope::Key, unsigned char)+0x86>
     d18:	60 fd       	sbrc	r22, 0
     d1a:	09 c0       	rjmp	.+18     	; 0xd2e <kaleidoscope::Layer_::handleKeymapKeyswitchEvent(kaleidoscope::Key, unsigned char)+0x86>
     d1c:	0e 94 6c 05 	call	0xad8	; 0xad8 <kaleidoscope::Layer_::isActive(unsigned char)>
     d20:	88 23       	and	r24, r24
     d22:	71 f3       	breq	.-36     	; 0xd00 <kaleidoscope::Layer_::handleKeymapKeyswitchEvent(kaleidoscope::Key, unsigned char)+0x58>
     d24:	cc 23       	and	r28, r28
     d26:	61 f3       	breq	.-40     	; 0xd00 <kaleidoscope::Layer_::handleKeymapKeyswitchEvent(kaleidoscope::Key, unsigned char)+0x58>
     d28:	f1 cf       	rjmp	.-30     	; 0xd0c <kaleidoscope::Layer_::handleKeymapKeyswitchEvent(kaleidoscope::Key, unsigned char)+0x64>
     d2a:	61 11       	cpse	r22, r1
     d2c:	df cf       	rjmp	.-66     	; 0xcec <kaleidoscope::Layer_::handleKeymapKeyswitchEvent(kaleidoscope::Key, unsigned char)+0x44>
     d2e:	cf 91       	pop	r28
     d30:	08 95       	ret
     d32:	66 23       	and	r22, r22
     d34:	e1 f3       	breq	.-8      	; 0xd2e <kaleidoscope::Layer_::handleKeymapKeyswitchEvent(kaleidoscope::Key, unsigned char)+0x86>
     d36:	d2 cf       	rjmp	.-92     	; 0xcdc <kaleidoscope::Layer_::handleKeymapKeyswitchEvent(kaleidoscope::Key, unsigned char)+0x34>

00000d38 <kaleidoscope::Layer_::eventHandler(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)>:
     d38:	94 34       	cpi	r25, 0x44	; 68
     d3a:	29 f4       	brne	.+10     	; 0xd46 <kaleidoscope::Layer_::eventHandler(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0xe>
     d3c:	64 2f       	mov	r22, r20
     d3e:	0e 94 54 06 	call	0xca8	; 0xca8 <kaleidoscope::Layer_::handleKeymapKeyswitchEvent(kaleidoscope::Key, unsigned char)>
     d42:	80 e0       	ldi	r24, 0x00	; 0
     d44:	90 e0       	ldi	r25, 0x00	; 0
     d46:	08 95       	ret

00000d48 <kaleidoscope::driver::keyscanner::Base<kaleidoscope::device::softhruf::SplitographyProps::KeyScannerProps>::handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)>:
     d48:	0c 94 e9 11 	jmp	0x23d2	; 0x23d2 <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)>

00000d4c <__vector_20>:
     d4c:	1f 92       	push	r1
     d4e:	0f 92       	push	r0
     d50:	0f b6       	in	r0, 0x3f	; 63
     d52:	0f 92       	push	r0
     d54:	11 24       	eor	r1, r1
     d56:	8f 93       	push	r24
     d58:	81 e0       	ldi	r24, 0x01	; 1
     d5a:	80 93 53 02 	sts	0x0253, r24	; 0x800253 <kaleidoscope_internal::device+0x9>
     d5e:	8f 91       	pop	r24
     d60:	0f 90       	pop	r0
     d62:	0f be       	out	0x3f, r0	; 63
     d64:	0f 90       	pop	r0
     d66:	1f 90       	pop	r1
     d68:	18 95       	reti

00000d6a <kaleidoscope::plugin::steno::GeminiPR::onKeyswitchEvent(kaleidoscope::Key&, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)>:
     d6a:	db 01       	movw	r26, r22
     d6c:	11 96       	adiw	r26, 0x01	; 1
     d6e:	8c 91       	ld	r24, X
     d70:	11 97       	sbiw	r26, 0x01	; 1
     d72:	48 2f       	mov	r20, r24
     d74:	50 e0       	ldi	r21, 0x00	; 0
     d76:	54 2f       	mov	r21, r20
     d78:	44 27       	eor	r20, r20
     d7a:	8c 91       	ld	r24, X
     d7c:	84 0f       	add	r24, r20
     d7e:	95 2f       	mov	r25, r21
     d80:	91 1d       	adc	r25, r1
     d82:	ac 01       	movw	r20, r24
     d84:	4d 52       	subi	r20, 0x2D	; 45
     d86:	51 4d       	sbci	r21, 0xD1	; 209
     d88:	4a 32       	cpi	r20, 0x2A	; 42
     d8a:	51 05       	cpc	r21, r1
     d8c:	28 f5       	brcc	.+74     	; 0xdd8 <kaleidoscope::plugin::steno::GeminiPR::onKeyswitchEvent(kaleidoscope::Key&, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x6e>
     d8e:	32 2f       	mov	r19, r18
     d90:	31 70       	andi	r19, 0x01	; 1
     d92:	21 ff       	sbrs	r18, 1
     d94:	24 c0       	rjmp	.+72     	; 0xdde <kaleidoscope::plugin::steno::GeminiPR::onKeyswitchEvent(kaleidoscope::Key&, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x74>
     d96:	31 11       	cpse	r19, r1
     d98:	1c c0       	rjmp	.+56     	; 0xdd2 <kaleidoscope::plugin::steno::GeminiPR::onKeyswitchEvent(kaleidoscope::Key&, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x68>
     d9a:	8d 52       	subi	r24, 0x2D	; 45
     d9c:	90 91 49 02 	lds	r25, 0x0249	; 0x800249 <kaleidoscope::plugin::steno::GeminiPR::keys_held_>
     da0:	9f 5f       	subi	r25, 0xFF	; 255
     da2:	90 93 49 02 	sts	0x0249, r25	; 0x800249 <kaleidoscope::plugin::steno::GeminiPR::keys_held_>
     da6:	67 e0       	ldi	r22, 0x07	; 7
     da8:	0e 94 5d 14 	call	0x28ba	; 0x28ba <__udivmodqi4>
     dac:	e8 2f       	mov	r30, r24
     dae:	f0 e0       	ldi	r31, 0x00	; 0
     db0:	ed 5b       	subi	r30, 0xBD	; 189
     db2:	fd 4f       	sbci	r31, 0xFD	; 253
     db4:	26 e0       	ldi	r18, 0x06	; 6
     db6:	30 e0       	ldi	r19, 0x00	; 0
     db8:	29 1b       	sub	r18, r25
     dba:	31 09       	sbc	r19, r1
     dbc:	81 e0       	ldi	r24, 0x01	; 1
     dbe:	90 e0       	ldi	r25, 0x00	; 0
     dc0:	ac 01       	movw	r20, r24
     dc2:	02 c0       	rjmp	.+4      	; 0xdc8 <kaleidoscope::plugin::steno::GeminiPR::onKeyswitchEvent(kaleidoscope::Key&, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x5e>
     dc4:	44 0f       	add	r20, r20
     dc6:	55 1f       	adc	r21, r21
     dc8:	2a 95       	dec	r18
     dca:	e2 f7       	brpl	.-8      	; 0xdc4 <kaleidoscope::plugin::steno::GeminiPR::onKeyswitchEvent(kaleidoscope::Key&, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x5a>
     dcc:	80 81       	ld	r24, Z
     dce:	84 2b       	or	r24, r20
     dd0:	80 83       	st	Z, r24
     dd2:	81 e0       	ldi	r24, 0x01	; 1
     dd4:	90 e0       	ldi	r25, 0x00	; 0
     dd6:	08 95       	ret
     dd8:	90 e0       	ldi	r25, 0x00	; 0
     dda:	80 e0       	ldi	r24, 0x00	; 0
     ddc:	08 95       	ret
     dde:	33 23       	and	r19, r19
     de0:	c1 f3       	breq	.-16     	; 0xdd2 <kaleidoscope::plugin::steno::GeminiPR::onKeyswitchEvent(kaleidoscope::Key&, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x68>
     de2:	80 91 49 02 	lds	r24, 0x0249	; 0x800249 <kaleidoscope::plugin::steno::GeminiPR::keys_held_>
     de6:	81 50       	subi	r24, 0x01	; 1
     de8:	80 93 49 02 	sts	0x0249, r24	; 0x800249 <kaleidoscope::plugin::steno::GeminiPR::keys_held_>
     dec:	81 11       	cpse	r24, r1
     dee:	f1 cf       	rjmp	.-30     	; 0xdd2 <kaleidoscope::plugin::steno::GeminiPR::onKeyswitchEvent(kaleidoscope::Key&, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x68>
     df0:	80 91 43 02 	lds	r24, 0x0243	; 0x800243 <kaleidoscope::plugin::steno::GeminiPR::state_>
     df4:	80 68       	ori	r24, 0x80	; 128
     df6:	80 93 43 02 	sts	0x0243, r24	; 0x800243 <kaleidoscope::plugin::steno::GeminiPR::state_>
     dfa:	46 e0       	ldi	r20, 0x06	; 6
     dfc:	50 e0       	ldi	r21, 0x00	; 0
     dfe:	63 e4       	ldi	r22, 0x43	; 67
     e00:	72 e0       	ldi	r23, 0x02	; 2
     e02:	85 ef       	ldi	r24, 0xF5	; 245
     e04:	92 e0       	ldi	r25, 0x02	; 2
     e06:	0e 94 ac 0b 	call	0x1758	; 0x1758 <Serial_::write(unsigned char const*, unsigned int)>
     e0a:	e3 e4       	ldi	r30, 0x43	; 67
     e0c:	f2 e0       	ldi	r31, 0x02	; 2
     e0e:	86 e0       	ldi	r24, 0x06	; 6
     e10:	df 01       	movw	r26, r30
     e12:	1d 92       	st	X+, r1
     e14:	8a 95       	dec	r24
     e16:	e9 f7       	brne	.-6      	; 0xe12 <kaleidoscope::plugin::steno::GeminiPR::onKeyswitchEvent(kaleidoscope::Key&, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0xa8>
     e18:	dc cf       	rjmp	.-72     	; 0xdd2 <kaleidoscope::plugin::steno::GeminiPR::onKeyswitchEvent(kaleidoscope::Key&, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x68>

00000e1a <_GLOBAL__sub_I__ZN21kaleidoscope_internal6deviceE>:
     e1a:	ea e4       	ldi	r30, 0x4A	; 74
     e1c:	f2 e0       	ldi	r31, 0x02	; 2
     e1e:	14 82       	std	Z+4, r1	; 0x04
     e20:	15 82       	std	Z+5, r1	; 0x05
     e22:	16 82       	std	Z+6, r1	; 0x06
     e24:	08 95       	ret

00000e26 <PluggableUSBModule::getShortName(char*)>:
     e26:	fc 01       	movw	r30, r24
     e28:	82 81       	ldd	r24, Z+2	; 0x02
     e2a:	8f 5b       	subi	r24, 0xBF	; 191
     e2c:	fb 01       	movw	r30, r22
     e2e:	80 83       	st	Z, r24
     e30:	81 e0       	ldi	r24, 0x01	; 1
     e32:	08 95       	ret

00000e34 <BootKeyboard_::getInterface(unsigned char*)>:
     e34:	cf 93       	push	r28
     e36:	df 93       	push	r29
     e38:	cd b7       	in	r28, 0x3d	; 61
     e3a:	de b7       	in	r29, 0x3e	; 62
     e3c:	69 97       	sbiw	r28, 0x19	; 25
     e3e:	0f b6       	in	r0, 0x3f	; 63
     e40:	f8 94       	cli
     e42:	de bf       	out	0x3e, r29	; 62
     e44:	0f be       	out	0x3f, r0	; 63
     e46:	cd bf       	out	0x3d, r28	; 61
     e48:	fc 01       	movw	r30, r24
     e4a:	db 01       	movw	r26, r22
     e4c:	9c 91       	ld	r25, X
     e4e:	9f 5f       	subi	r25, 0xFF	; 255
     e50:	9c 93       	st	X, r25
     e52:	9e 01       	movw	r18, r28
     e54:	2d 5f       	subi	r18, 0xFD	; 253
     e56:	3f 4f       	sbci	r19, 0xFF	; 255
     e58:	81 e1       	ldi	r24, 0x11	; 17
     e5a:	d9 01       	movw	r26, r18
     e5c:	1d 92       	st	X+, r1
     e5e:	8a 95       	dec	r24
     e60:	e9 f7       	brne	.-6      	; 0xe5c <BootKeyboard_::getInterface(unsigned char*)+0x28>
     e62:	29 e0       	ldi	r18, 0x09	; 9
     e64:	29 83       	std	Y+1, r18	; 0x01
     e66:	84 e0       	ldi	r24, 0x04	; 4
     e68:	8a 83       	std	Y+2, r24	; 0x02
     e6a:	91 e0       	ldi	r25, 0x01	; 1
     e6c:	9d 83       	std	Y+5, r25	; 0x05
     e6e:	83 e0       	ldi	r24, 0x03	; 3
     e70:	8e 83       	std	Y+6, r24	; 0x06
     e72:	9f 83       	std	Y+7, r25	; 0x07
     e74:	98 87       	std	Y+8, r25	; 0x08
     e76:	2a 87       	std	Y+10, r18	; 0x0a
     e78:	21 e2       	ldi	r18, 0x21	; 33
     e7a:	2b 87       	std	Y+11, r18	; 0x0b
     e7c:	9c 87       	std	Y+12, r25	; 0x0c
     e7e:	9d 87       	std	Y+13, r25	; 0x0d
     e80:	9f 87       	std	Y+15, r25	; 0x0f
     e82:	22 e2       	ldi	r18, 0x22	; 34
     e84:	28 8b       	std	Y+16, r18	; 0x10
     e86:	2f e3       	ldi	r18, 0x3F	; 63
     e88:	29 8b       	std	Y+17, r18	; 0x11
     e8a:	27 e0       	ldi	r18, 0x07	; 7
     e8c:	2b 8b       	std	Y+19, r18	; 0x13
     e8e:	25 e0       	ldi	r18, 0x05	; 5
     e90:	2c 8b       	std	Y+20, r18	; 0x14
     e92:	8e 8b       	std	Y+22, r24	; 0x16
     e94:	20 e4       	ldi	r18, 0x40	; 64
     e96:	30 e0       	ldi	r19, 0x00	; 0
     e98:	38 8f       	std	Y+24, r19	; 0x18
     e9a:	2f 8b       	std	Y+23, r18	; 0x17
     e9c:	99 8f       	std	Y+25, r25	; 0x19
     e9e:	82 81       	ldd	r24, Z+2	; 0x02
     ea0:	8b 83       	std	Y+3, r24	; 0x03
     ea2:	83 81       	ldd	r24, Z+3	; 0x03
     ea4:	80 68       	ori	r24, 0x80	; 128
     ea6:	8d 8b       	std	Y+21, r24	; 0x15
     ea8:	49 e1       	ldi	r20, 0x19	; 25
     eaa:	50 e0       	ldi	r21, 0x00	; 0
     eac:	be 01       	movw	r22, r28
     eae:	6f 5f       	subi	r22, 0xFF	; 255
     eb0:	7f 4f       	sbci	r23, 0xFF	; 255
     eb2:	80 e0       	ldi	r24, 0x00	; 0
     eb4:	0e 94 2f 0f 	call	0x1e5e	; 0x1e5e <USB_SendControl(unsigned char, void const*, int)>
     eb8:	69 96       	adiw	r28, 0x19	; 25
     eba:	0f b6       	in	r0, 0x3f	; 63
     ebc:	f8 94       	cli
     ebe:	de bf       	out	0x3e, r29	; 62
     ec0:	0f be       	out	0x3f, r0	; 63
     ec2:	cd bf       	out	0x3d, r28	; 61
     ec4:	df 91       	pop	r29
     ec6:	cf 91       	pop	r28
     ec8:	08 95       	ret

00000eca <BootKeyboard_::getDescriptor(USBSetup&)>:
     eca:	fc 01       	movw	r30, r24
     ecc:	db 01       	movw	r26, r22
     ece:	8c 91       	ld	r24, X
     ed0:	81 38       	cpi	r24, 0x81	; 129
     ed2:	a9 f4       	brne	.+42     	; 0xefe <BootKeyboard_::getDescriptor(USBSetup&)+0x34>
     ed4:	13 96       	adiw	r26, 0x03	; 3
     ed6:	8c 91       	ld	r24, X
     ed8:	13 97       	sbiw	r26, 0x03	; 3
     eda:	82 32       	cpi	r24, 0x22	; 34
     edc:	81 f4       	brne	.+32     	; 0xefe <BootKeyboard_::getDescriptor(USBSetup&)+0x34>
     ede:	22 81       	ldd	r18, Z+2	; 0x02
     ee0:	14 96       	adiw	r26, 0x04	; 4
     ee2:	8d 91       	ld	r24, X+
     ee4:	9c 91       	ld	r25, X
     ee6:	28 17       	cp	r18, r24
     ee8:	19 06       	cpc	r1, r25
     eea:	49 f4       	brne	.+18     	; 0xefe <BootKeyboard_::getDescriptor(USBSetup&)+0x34>
     eec:	82 85       	ldd	r24, Z+10	; 0x0a
     eee:	84 8f       	std	Z+28, r24	; 0x1c
     ef0:	4f e3       	ldi	r20, 0x3F	; 63
     ef2:	50 e0       	ldi	r21, 0x00	; 0
     ef4:	6c e0       	ldi	r22, 0x0C	; 12
     ef6:	71 e0       	ldi	r23, 0x01	; 1
     ef8:	80 e8       	ldi	r24, 0x80	; 128
     efa:	0c 94 2f 0f 	jmp	0x1e5e	; 0x1e5e <USB_SendControl(unsigned char, void const*, int)>
     efe:	90 e0       	ldi	r25, 0x00	; 0
     f00:	80 e0       	ldi	r24, 0x00	; 0
     f02:	08 95       	ret

00000f04 <BootKeyboard_::setup(USBSetup&)>:
     f04:	fc 01       	movw	r30, r24
     f06:	db 01       	movw	r26, r22
     f08:	22 81       	ldd	r18, Z+2	; 0x02
     f0a:	14 96       	adiw	r26, 0x04	; 4
     f0c:	8d 91       	ld	r24, X+
     f0e:	9c 91       	ld	r25, X
     f10:	15 97       	sbiw	r26, 0x05	; 5
     f12:	28 17       	cp	r18, r24
     f14:	19 06       	cpc	r1, r25
     f16:	81 f5       	brne	.+96     	; 0xf78 <BootKeyboard_::setup(USBSetup&)+0x74>
     f18:	11 96       	adiw	r26, 0x01	; 1
     f1a:	8c 91       	ld	r24, X
     f1c:	11 97       	sbiw	r26, 0x01	; 1
     f1e:	9c 91       	ld	r25, X
     f20:	91 3a       	cpi	r25, 0xA1	; 161
     f22:	69 f4       	brne	.+26     	; 0xf3e <BootKeyboard_::setup(USBSetup&)+0x3a>
     f24:	81 30       	cpi	r24, 0x01	; 1
     f26:	29 f0       	breq	.+10     	; 0xf32 <BootKeyboard_::setup(USBSetup&)+0x2e>
     f28:	83 30       	cpi	r24, 0x03	; 3
     f2a:	29 f4       	brne	.+10     	; 0xf36 <BootKeyboard_::setup(USBSetup&)+0x32>
     f2c:	84 8d       	ldd	r24, Z+28	; 0x1c
     f2e:	80 93 f1 00 	sts	0x00F1, r24	; 0x8000f1 <__TEXT_REGION_LENGTH__+0x7e00f1>
     f32:	81 e0       	ldi	r24, 0x01	; 1
     f34:	08 95       	ret
     f36:	82 30       	cpi	r24, 0x02	; 2
     f38:	f9 f4       	brne	.+62     	; 0xf78 <BootKeyboard_::setup(USBSetup&)+0x74>
     f3a:	85 8d       	ldd	r24, Z+29	; 0x1d
     f3c:	f8 cf       	rjmp	.-16     	; 0xf2e <BootKeyboard_::setup(USBSetup&)+0x2a>
     f3e:	91 32       	cpi	r25, 0x21	; 33
     f40:	d9 f4       	brne	.+54     	; 0xf78 <BootKeyboard_::setup(USBSetup&)+0x74>
     f42:	8b 30       	cpi	r24, 0x0B	; 11
     f44:	21 f4       	brne	.+8      	; 0xf4e <BootKeyboard_::setup(USBSetup&)+0x4a>
     f46:	12 96       	adiw	r26, 0x02	; 2
     f48:	8c 91       	ld	r24, X
     f4a:	84 8f       	std	Z+28, r24	; 0x1c
     f4c:	f2 cf       	rjmp	.-28     	; 0xf32 <BootKeyboard_::setup(USBSetup&)+0x2e>
     f4e:	8a 30       	cpi	r24, 0x0A	; 10
     f50:	11 f4       	brne	.+4      	; 0xf56 <BootKeyboard_::setup(USBSetup&)+0x52>
     f52:	15 8e       	std	Z+29, r1	; 0x1d
     f54:	ee cf       	rjmp	.-36     	; 0xf32 <BootKeyboard_::setup(USBSetup&)+0x2e>
     f56:	89 30       	cpi	r24, 0x09	; 9
     f58:	79 f4       	brne	.+30     	; 0xf78 <BootKeyboard_::setup(USBSetup&)+0x74>
     f5a:	cf 01       	movw	r24, r30
     f5c:	16 96       	adiw	r26, 0x06	; 6
     f5e:	2d 91       	ld	r18, X+
     f60:	3c 91       	ld	r19, X
     f62:	17 97       	sbiw	r26, 0x07	; 7
     f64:	13 96       	adiw	r26, 0x03	; 3
     f66:	4c 91       	ld	r20, X
     f68:	42 30       	cpi	r20, 0x02	; 2
     f6a:	41 f4       	brne	.+16     	; 0xf7c <BootKeyboard_::setup(USBSetup&)+0x78>
     f6c:	61 e0       	ldi	r22, 0x01	; 1
     f6e:	70 e0       	ldi	r23, 0x00	; 0
     f70:	4e 96       	adiw	r24, 0x1e	; 30
     f72:	21 30       	cpi	r18, 0x01	; 1
     f74:	31 05       	cpc	r19, r1
     f76:	51 f0       	breq	.+20     	; 0xf8c <BootKeyboard_::setup(USBSetup&)+0x88>
     f78:	80 e0       	ldi	r24, 0x00	; 0
     f7a:	08 95       	ret
     f7c:	41 30       	cpi	r20, 0x01	; 1
     f7e:	e1 f7       	brne	.-8      	; 0xf78 <BootKeyboard_::setup(USBSetup&)+0x74>
     f80:	28 30       	cpi	r18, 0x08	; 8
     f82:	31 05       	cpc	r19, r1
     f84:	c9 f7       	brne	.-14     	; 0xf78 <BootKeyboard_::setup(USBSetup&)+0x74>
     f86:	68 e0       	ldi	r22, 0x08	; 8
     f88:	70 e0       	ldi	r23, 0x00	; 0
     f8a:	0b 96       	adiw	r24, 0x0b	; 11
     f8c:	0e 94 55 0f 	call	0x1eaa	; 0x1eaa <USB_RecvControl(void*, int)>
     f90:	d0 cf       	rjmp	.-96     	; 0xf32 <BootKeyboard_::setup(USBSetup&)+0x2e>

00000f92 <BootKeyboard_::BootKeyboard_()>:
     f92:	fc 01       	movw	r30, r24
     f94:	81 e0       	ldi	r24, 0x01	; 1
     f96:	84 83       	std	Z+4, r24	; 0x04
     f98:	85 83       	std	Z+5, r24	; 0x05
     f9a:	9f 01       	movw	r18, r30
     f9c:	25 5e       	subi	r18, 0xE5	; 229
     f9e:	3f 4f       	sbci	r19, 0xFF	; 255
     fa0:	37 83       	std	Z+7, r19	; 0x07
     fa2:	26 83       	std	Z+6, r18	; 0x06
     fa4:	11 86       	std	Z+9, r1	; 0x09
     fa6:	10 86       	std	Z+8, r1	; 0x08
     fa8:	29 e3       	ldi	r18, 0x39	; 57
     faa:	31 e0       	ldi	r19, 0x01	; 1
     fac:	31 83       	std	Z+1, r19	; 0x01
     fae:	20 83       	st	Z, r18
     fb0:	82 87       	std	Z+10, r24	; 0x0a
     fb2:	84 8f       	std	Z+28, r24	; 0x1c
     fb4:	85 8f       	std	Z+29, r24	; 0x1d
     fb6:	16 8e       	std	Z+30, r1	; 0x1e
     fb8:	81 ec       	ldi	r24, 0xC1	; 193
     fba:	83 8f       	std	Z+27, r24	; 0x1b
     fbc:	08 95       	ret

00000fbe <BootKeyboard_::getProtocol()>:
     fbe:	fc 01       	movw	r30, r24
     fc0:	84 8d       	ldd	r24, Z+28	; 0x1c
     fc2:	08 95       	ret

00000fc4 <BootKeyboard_::sendReport()>:
     fc4:	ef 92       	push	r14
     fc6:	ff 92       	push	r15
     fc8:	0f 93       	push	r16
     fca:	1f 93       	push	r17
     fcc:	cf 93       	push	r28
     fce:	df 93       	push	r29
     fd0:	8c 01       	movw	r16, r24
     fd2:	ec 01       	movw	r28, r24
     fd4:	2b 96       	adiw	r28, 0x0b	; 11
     fd6:	7c 01       	movw	r14, r24
     fd8:	83 e1       	ldi	r24, 0x13	; 19
     fda:	e8 0e       	add	r14, r24
     fdc:	f1 1c       	adc	r15, r1
     fde:	48 e0       	ldi	r20, 0x08	; 8
     fe0:	50 e0       	ldi	r21, 0x00	; 0
     fe2:	be 01       	movw	r22, r28
     fe4:	c7 01       	movw	r24, r14
     fe6:	0e 94 6f 14 	call	0x28de	; 0x28de <memcmp>
     fea:	89 2b       	or	r24, r25
     fec:	21 f1       	breq	.+72     	; 0x1036 <BootKeyboard_::sendReport()+0x72>
     fee:	f8 01       	movw	r30, r16
     ff0:	83 81       	ldd	r24, Z+3	; 0x03
     ff2:	48 e0       	ldi	r20, 0x08	; 8
     ff4:	50 e0       	ldi	r21, 0x00	; 0
     ff6:	be 01       	movw	r22, r28
     ff8:	80 64       	ori	r24, 0x40	; 64
     ffa:	0e 94 7e 0e 	call	0x1cfc	; 0x1cfc <USB_Send(unsigned char, void const*, int)>
     ffe:	8c 01       	movw	r16, r24
    1000:	e0 91 77 03 	lds	r30, 0x0377	; 0x800377 <HIDReportObserver::send_report_hook_>
    1004:	f0 91 78 03 	lds	r31, 0x0378	; 0x800378 <HIDReportObserver::send_report_hook_+0x1>
    1008:	30 97       	sbiw	r30, 0x00	; 0
    100a:	31 f0       	breq	.+12     	; 0x1018 <BootKeyboard_::sendReport()+0x54>
    100c:	9c 01       	movw	r18, r24
    100e:	48 e0       	ldi	r20, 0x08	; 8
    1010:	50 e0       	ldi	r21, 0x00	; 0
    1012:	be 01       	movw	r22, r28
    1014:	82 e0       	ldi	r24, 0x02	; 2
    1016:	09 95       	icall
    1018:	88 e0       	ldi	r24, 0x08	; 8
    101a:	fe 01       	movw	r30, r28
    101c:	d7 01       	movw	r26, r14
    101e:	01 90       	ld	r0, Z+
    1020:	0d 92       	st	X+, r0
    1022:	8a 95       	dec	r24
    1024:	e1 f7       	brne	.-8      	; 0x101e <BootKeyboard_::sendReport()+0x5a>
    1026:	c8 01       	movw	r24, r16
    1028:	df 91       	pop	r29
    102a:	cf 91       	pop	r28
    102c:	1f 91       	pop	r17
    102e:	0f 91       	pop	r16
    1030:	ff 90       	pop	r15
    1032:	ef 90       	pop	r14
    1034:	08 95       	ret
    1036:	0f ef       	ldi	r16, 0xFF	; 255
    1038:	1f ef       	ldi	r17, 0xFF	; 255
    103a:	f5 cf       	rjmp	.-22     	; 0x1026 <BootKeyboard_::sendReport()+0x62>

0000103c <BootKeyboard_::press(unsigned char)>:
    103c:	fc 01       	movw	r30, r24
    103e:	80 e2       	ldi	r24, 0x20	; 32
    1040:	86 0f       	add	r24, r22
    1042:	88 30       	cpi	r24, 0x08	; 8
    1044:	70 f4       	brcc	.+28     	; 0x1062 <BootKeyboard_::press(unsigned char)+0x26>
    1046:	60 5e       	subi	r22, 0xE0	; 224
    1048:	77 0b       	sbc	r23, r23
    104a:	21 e0       	ldi	r18, 0x01	; 1
    104c:	30 e0       	ldi	r19, 0x00	; 0
    104e:	01 c0       	rjmp	.+2      	; 0x1052 <BootKeyboard_::press(unsigned char)+0x16>
    1050:	22 0f       	add	r18, r18
    1052:	6a 95       	dec	r22
    1054:	ea f7       	brpl	.-6      	; 0x1050 <BootKeyboard_::press(unsigned char)+0x14>
    1056:	83 85       	ldd	r24, Z+11	; 0x0b
    1058:	82 2b       	or	r24, r18
    105a:	83 87       	std	Z+11, r24	; 0x0b
    105c:	81 e0       	ldi	r24, 0x01	; 1
    105e:	90 e0       	ldi	r25, 0x00	; 0
    1060:	08 95       	ret
    1062:	df 01       	movw	r26, r30
    1064:	1d 96       	adiw	r26, 0x0d	; 13
    1066:	90 e0       	ldi	r25, 0x00	; 0
    1068:	80 e0       	ldi	r24, 0x00	; 0
    106a:	2d 91       	ld	r18, X+
    106c:	26 17       	cp	r18, r22
    106e:	b1 f3       	breq	.-20     	; 0x105c <BootKeyboard_::press(unsigned char)+0x20>
    1070:	21 11       	cpse	r18, r1
    1072:	04 c0       	rjmp	.+8      	; 0x107c <BootKeyboard_::press(unsigned char)+0x40>
    1074:	e8 0f       	add	r30, r24
    1076:	f9 1f       	adc	r31, r25
    1078:	65 87       	std	Z+13, r22	; 0x0d
    107a:	f0 cf       	rjmp	.-32     	; 0x105c <BootKeyboard_::press(unsigned char)+0x20>
    107c:	01 96       	adiw	r24, 0x01	; 1
    107e:	86 30       	cpi	r24, 0x06	; 6
    1080:	91 05       	cpc	r25, r1
    1082:	99 f7       	brne	.-26     	; 0x106a <BootKeyboard_::press(unsigned char)+0x2e>
    1084:	90 e0       	ldi	r25, 0x00	; 0
    1086:	80 e0       	ldi	r24, 0x00	; 0
    1088:	08 95       	ret

0000108a <BootKeyboard_::release(unsigned char)>:
    108a:	cf 93       	push	r28
    108c:	df 93       	push	r29
    108e:	20 e2       	ldi	r18, 0x20	; 32
    1090:	26 0f       	add	r18, r22
    1092:	28 30       	cpi	r18, 0x08	; 8
    1094:	90 f4       	brcc	.+36     	; 0x10ba <BootKeyboard_::release(unsigned char)+0x30>
    1096:	60 5e       	subi	r22, 0xE0	; 224
    1098:	77 0b       	sbc	r23, r23
    109a:	21 e0       	ldi	r18, 0x01	; 1
    109c:	30 e0       	ldi	r19, 0x00	; 0
    109e:	01 c0       	rjmp	.+2      	; 0x10a2 <BootKeyboard_::release(unsigned char)+0x18>
    10a0:	22 0f       	add	r18, r18
    10a2:	6a 95       	dec	r22
    10a4:	ea f7       	brpl	.-6      	; 0x10a0 <BootKeyboard_::release(unsigned char)+0x16>
    10a6:	20 95       	com	r18
    10a8:	fc 01       	movw	r30, r24
    10aa:	33 85       	ldd	r19, Z+11	; 0x0b
    10ac:	23 23       	and	r18, r19
    10ae:	23 87       	std	Z+11, r18	; 0x0b
    10b0:	81 e0       	ldi	r24, 0x01	; 1
    10b2:	90 e0       	ldi	r25, 0x00	; 0
    10b4:	df 91       	pop	r29
    10b6:	cf 91       	pop	r28
    10b8:	08 95       	ret
    10ba:	dc 01       	movw	r26, r24
    10bc:	1d 96       	adiw	r26, 0x0d	; 13
    10be:	9c 01       	movw	r18, r24
    10c0:	2d 5e       	subi	r18, 0xED	; 237
    10c2:	3f 4f       	sbci	r19, 0xFF	; 255
    10c4:	fd 01       	movw	r30, r26
    10c6:	41 91       	ld	r20, Z+
    10c8:	46 13       	cpse	r20, r22
    10ca:	03 c0       	rjmp	.+6      	; 0x10d2 <BootKeyboard_::release(unsigned char)+0x48>
    10cc:	ef 01       	movw	r28, r30
    10ce:	21 97       	sbiw	r28, 0x01	; 1
    10d0:	18 82       	st	Y, r1
    10d2:	e2 17       	cp	r30, r18
    10d4:	f3 07       	cpc	r31, r19
    10d6:	b9 f7       	brne	.-18     	; 0x10c6 <BootKeyboard_::release(unsigned char)+0x3c>
    10d8:	20 e0       	ldi	r18, 0x00	; 0
    10da:	3d 91       	ld	r19, X+
    10dc:	33 23       	and	r19, r19
    10de:	49 f0       	breq	.+18     	; 0x10f2 <BootKeyboard_::release(unsigned char)+0x68>
    10e0:	ec 01       	movw	r28, r24
    10e2:	c2 0f       	add	r28, r18
    10e4:	d1 1d       	adc	r29, r1
    10e6:	4d 85       	ldd	r20, Y+13	; 0x0d
    10e8:	3d 87       	std	Y+13, r19	; 0x0d
    10ea:	ed 01       	movw	r28, r26
    10ec:	21 97       	sbiw	r28, 0x01	; 1
    10ee:	48 83       	st	Y, r20
    10f0:	2f 5f       	subi	r18, 0xFF	; 255
    10f2:	ae 17       	cp	r26, r30
    10f4:	bf 07       	cpc	r27, r31
    10f6:	89 f7       	brne	.-30     	; 0x10da <BootKeyboard_::release(unsigned char)+0x50>
    10f8:	db cf       	rjmp	.-74     	; 0x10b0 <BootKeyboard_::release(unsigned char)+0x26>

000010fa <BootKeyboard_::releaseAll()>:
    10fa:	0b 96       	adiw	r24, 0x0b	; 11
    10fc:	28 e0       	ldi	r18, 0x08	; 8
    10fe:	fc 01       	movw	r30, r24
    1100:	11 92       	st	Z+, r1
    1102:	2a 95       	dec	r18
    1104:	e9 f7       	brne	.-6      	; 0x1100 <BootKeyboard_::releaseAll()+0x6>
    1106:	08 95       	ret

00001108 <BootKeyboard_::begin()>:
    1108:	cf 93       	push	r28
    110a:	df 93       	push	r29
    110c:	ec 01       	movw	r28, r24
    110e:	0e 94 47 0d 	call	0x1a8e	; 0x1a8e <PluggableUSB()>
    1112:	be 01       	movw	r22, r28
    1114:	0e 94 03 0d 	call	0x1a06	; 0x1a06 <PluggableUSB_::plug(PluggableUSBModule*)>
    1118:	ce 01       	movw	r24, r28
    111a:	0e 94 7d 08 	call	0x10fa	; 0x10fa <BootKeyboard_::releaseAll()>
    111e:	ce 01       	movw	r24, r28
    1120:	df 91       	pop	r29
    1122:	cf 91       	pop	r28
    1124:	0c 94 e2 07 	jmp	0xfc4	; 0xfc4 <BootKeyboard_::sendReport()>

00001128 <_GLOBAL__sub_I__ZN13BootKeyboard_C2Ev>:
    1128:	88 e5       	ldi	r24, 0x58	; 88
    112a:	92 e0       	ldi	r25, 0x02	; 2
    112c:	0c 94 c9 07 	jmp	0xf92	; 0xf92 <BootKeyboard_::BootKeyboard_()>

00001130 <ConsumerControl_::ConsumerControl_()>:
    1130:	80 91 87 02 	lds	r24, 0x0287	; 0x800287 <guard variable for ConsumerControl_::ConsumerControl_()::node>
    1134:	81 11       	cpse	r24, r1
    1136:	13 c0       	rjmp	.+38     	; 0x115e <ConsumerControl_::ConsumerControl_()+0x2e>
    1138:	10 92 90 02 	sts	0x0290, r1	; 0x800290 <ConsumerControl_::ConsumerControl_()::node+0x1>
    113c:	10 92 8f 02 	sts	0x028F, r1	; 0x80028f <ConsumerControl_::ConsumerControl_()::node>
    1140:	8b e4       	ldi	r24, 0x4B	; 75
    1142:	91 e0       	ldi	r25, 0x01	; 1
    1144:	90 93 92 02 	sts	0x0292, r25	; 0x800292 <ConsumerControl_::ConsumerControl_()::node+0x3>
    1148:	80 93 91 02 	sts	0x0291, r24	; 0x800291 <ConsumerControl_::ConsumerControl_()::node+0x2>
    114c:	89 e1       	ldi	r24, 0x19	; 25
    114e:	90 e0       	ldi	r25, 0x00	; 0
    1150:	90 93 94 02 	sts	0x0294, r25	; 0x800294 <ConsumerControl_::ConsumerControl_()::node+0x5>
    1154:	80 93 93 02 	sts	0x0293, r24	; 0x800293 <ConsumerControl_::ConsumerControl_()::node+0x4>
    1158:	81 e0       	ldi	r24, 0x01	; 1
    115a:	80 93 87 02 	sts	0x0287, r24	; 0x800287 <guard variable for ConsumerControl_::ConsumerControl_()::node>
    115e:	0e 94 4d 14 	call	0x289a	; 0x289a <HID()>
    1162:	6f e8       	ldi	r22, 0x8F	; 143
    1164:	72 e0       	ldi	r23, 0x02	; 2
    1166:	0c 94 ba 13 	jmp	0x2774	; 0x2774 <HID_::AppendDescriptor(HIDSubDescriptor*)>

0000116a <ConsumerControl_::press(unsigned int)>:
    116a:	fc 01       	movw	r30, r24
    116c:	30 e0       	ldi	r19, 0x00	; 0
    116e:	20 e0       	ldi	r18, 0x00	; 0
    1170:	41 91       	ld	r20, Z+
    1172:	51 91       	ld	r21, Z+
    1174:	45 2b       	or	r20, r21
    1176:	41 f4       	brne	.+16     	; 0x1188 <ConsumerControl_::press(unsigned int)+0x1e>
    1178:	22 0f       	add	r18, r18
    117a:	33 1f       	adc	r19, r19
    117c:	28 0f       	add	r18, r24
    117e:	39 1f       	adc	r19, r25
    1180:	f9 01       	movw	r30, r18
    1182:	71 83       	std	Z+1, r23	; 0x01
    1184:	60 83       	st	Z, r22
    1186:	08 95       	ret
    1188:	2f 5f       	subi	r18, 0xFF	; 255
    118a:	3f 4f       	sbci	r19, 0xFF	; 255
    118c:	24 30       	cpi	r18, 0x04	; 4
    118e:	31 05       	cpc	r19, r1
    1190:	79 f7       	brne	.-34     	; 0x1170 <ConsumerControl_::press(unsigned int)+0x6>
    1192:	08 95       	ret

00001194 <ConsumerControl_::releaseAll()>:
    1194:	28 e0       	ldi	r18, 0x08	; 8
    1196:	fc 01       	movw	r30, r24
    1198:	11 92       	st	Z+, r1
    119a:	2a 95       	dec	r18
    119c:	e9 f7       	brne	.-6      	; 0x1198 <ConsumerControl_::releaseAll()+0x4>
    119e:	08 95       	ret

000011a0 <ConsumerControl_::sendReportUnchecked()>:
    11a0:	cf 93       	push	r28
    11a2:	df 93       	push	r29
    11a4:	ec 01       	movw	r28, r24
    11a6:	0e 94 4d 14 	call	0x289a	; 0x289a <HID()>
    11aa:	28 e0       	ldi	r18, 0x08	; 8
    11ac:	30 e0       	ldi	r19, 0x00	; 0
    11ae:	ae 01       	movw	r20, r28
    11b0:	64 e0       	ldi	r22, 0x04	; 4
    11b2:	df 91       	pop	r29
    11b4:	cf 91       	pop	r28
    11b6:	0c 94 0a 14 	jmp	0x2814	; 0x2814 <HID_::SendReport(unsigned char, void const*, int)>

000011ba <ConsumerControl_::sendReport()>:
    11ba:	0f 93       	push	r16
    11bc:	1f 93       	push	r17
    11be:	cf 93       	push	r28
    11c0:	df 93       	push	r29
    11c2:	ec 01       	movw	r28, r24
    11c4:	8c 01       	movw	r16, r24
    11c6:	08 5f       	subi	r16, 0xF8	; 248
    11c8:	1f 4f       	sbci	r17, 0xFF	; 255
    11ca:	48 e0       	ldi	r20, 0x08	; 8
    11cc:	50 e0       	ldi	r21, 0x00	; 0
    11ce:	bc 01       	movw	r22, r24
    11d0:	c8 01       	movw	r24, r16
    11d2:	0e 94 6f 14 	call	0x28de	; 0x28de <memcmp>
    11d6:	89 2b       	or	r24, r25
    11d8:	51 f0       	breq	.+20     	; 0x11ee <ConsumerControl_::sendReport()+0x34>
    11da:	ce 01       	movw	r24, r28
    11dc:	0e 94 d0 08 	call	0x11a0	; 0x11a0 <ConsumerControl_::sendReportUnchecked()>
    11e0:	88 e0       	ldi	r24, 0x08	; 8
    11e2:	fe 01       	movw	r30, r28
    11e4:	d8 01       	movw	r26, r16
    11e6:	01 90       	ld	r0, Z+
    11e8:	0d 92       	st	X+, r0
    11ea:	8a 95       	dec	r24
    11ec:	e1 f7       	brne	.-8      	; 0x11e6 <ConsumerControl_::sendReport()+0x2c>
    11ee:	df 91       	pop	r29
    11f0:	cf 91       	pop	r28
    11f2:	1f 91       	pop	r17
    11f4:	0f 91       	pop	r16
    11f6:	08 95       	ret

000011f8 <ConsumerControl_::end()>:
    11f8:	28 e0       	ldi	r18, 0x08	; 8
    11fa:	fc 01       	movw	r30, r24
    11fc:	11 92       	st	Z+, r1
    11fe:	2a 95       	dec	r18
    1200:	e9 f7       	brne	.-6      	; 0x11fc <ConsumerControl_::end()+0x4>
    1202:	0c 94 dd 08 	jmp	0x11ba	; 0x11ba <ConsumerControl_::sendReport()>

00001206 <ConsumerControl_::begin()>:
    1206:	0c 94 fc 08 	jmp	0x11f8	; 0x11f8 <ConsumerControl_::end()>

0000120a <_GLOBAL__sub_I__ZN16ConsumerControl_C2Ev>:
    120a:	87 e7       	ldi	r24, 0x77	; 119
    120c:	92 e0       	ldi	r25, 0x02	; 2
    120e:	0c 94 98 08 	jmp	0x1130	; 0x1130 <ConsumerControl_::ConsumerControl_()>

00001212 <Keyboard_::Keyboard_()>:
    1212:	80 91 cf 02 	lds	r24, 0x02CF	; 0x8002cf <guard variable for Keyboard_::Keyboard_()::node>
    1216:	81 11       	cpse	r24, r1
    1218:	13 c0       	rjmp	.+38     	; 0x1240 <Keyboard_::Keyboard_()+0x2e>
    121a:	10 92 d8 02 	sts	0x02D8, r1	; 0x8002d8 <Keyboard_::Keyboard_()::node+0x1>
    121e:	10 92 d7 02 	sts	0x02D7, r1	; 0x8002d7 <Keyboard_::Keyboard_()::node>
    1222:	84 e6       	ldi	r24, 0x64	; 100
    1224:	91 e0       	ldi	r25, 0x01	; 1
    1226:	90 93 da 02 	sts	0x02DA, r25	; 0x8002da <Keyboard_::Keyboard_()::node+0x3>
    122a:	80 93 d9 02 	sts	0x02D9, r24	; 0x8002d9 <Keyboard_::Keyboard_()::node+0x2>
    122e:	81 e4       	ldi	r24, 0x41	; 65
    1230:	90 e0       	ldi	r25, 0x00	; 0
    1232:	90 93 dc 02 	sts	0x02DC, r25	; 0x8002dc <Keyboard_::Keyboard_()::node+0x5>
    1236:	80 93 db 02 	sts	0x02DB, r24	; 0x8002db <Keyboard_::Keyboard_()::node+0x4>
    123a:	81 e0       	ldi	r24, 0x01	; 1
    123c:	80 93 cf 02 	sts	0x02CF, r24	; 0x8002cf <guard variable for Keyboard_::Keyboard_()::node>
    1240:	0e 94 4d 14 	call	0x289a	; 0x289a <HID()>
    1244:	67 ed       	ldi	r22, 0xD7	; 215
    1246:	72 e0       	ldi	r23, 0x02	; 2
    1248:	0c 94 ba 13 	jmp	0x2774	; 0x2774 <HID_::AppendDescriptor(HIDSubDescriptor*)>

0000124c <Keyboard_::sendReportUnchecked()>:
    124c:	cf 93       	push	r28
    124e:	df 93       	push	r29
    1250:	ec 01       	movw	r28, r24
    1252:	0e 94 4d 14 	call	0x289a	; 0x289a <HID()>
    1256:	2d e1       	ldi	r18, 0x1D	; 29
    1258:	30 e0       	ldi	r19, 0x00	; 0
    125a:	ae 01       	movw	r20, r28
    125c:	68 e0       	ldi	r22, 0x08	; 8
    125e:	df 91       	pop	r29
    1260:	cf 91       	pop	r28
    1262:	0c 94 0a 14 	jmp	0x2814	; 0x2814 <HID_::SendReport(unsigned char, void const*, int)>

00001266 <Keyboard_::sendReport()>:
    1266:	ef 92       	push	r14
    1268:	ff 92       	push	r15
    126a:	0f 93       	push	r16
    126c:	1f 93       	push	r17
    126e:	cf 93       	push	r28
    1270:	df 93       	push	r29
    1272:	ec 01       	movw	r28, r24
    1274:	7c 01       	movw	r14, r24
    1276:	8d e1       	ldi	r24, 0x1D	; 29
    1278:	e8 0e       	add	r14, r24
    127a:	f1 1c       	adc	r15, r1
    127c:	4d e1       	ldi	r20, 0x1D	; 29
    127e:	50 e0       	ldi	r21, 0x00	; 0
    1280:	be 01       	movw	r22, r28
    1282:	c7 01       	movw	r24, r14
    1284:	0e 94 6f 14 	call	0x28de	; 0x28de <memcmp>
    1288:	89 2b       	or	r24, r25
    128a:	09 f4       	brne	.+2      	; 0x128e <Keyboard_::sendReport()+0x28>
    128c:	49 c0       	rjmp	.+146    	; 0x1320 <Keyboard_::sendReport()+0xba>
    128e:	0d 8d       	ldd	r16, Y+29	; 0x1d
    1290:	18 81       	ld	r17, Y
    1292:	80 2f       	mov	r24, r16
    1294:	80 95       	com	r24
    1296:	81 23       	and	r24, r17
    1298:	49 f1       	breq	.+82     	; 0x12ec <Keyboard_::sendReport()+0x86>
    129a:	4c e1       	ldi	r20, 0x1C	; 28
    129c:	50 e0       	ldi	r21, 0x00	; 0
    129e:	be 01       	movw	r22, r28
    12a0:	6f 5f       	subi	r22, 0xFF	; 255
    12a2:	7f 4f       	sbci	r23, 0xFF	; 255
    12a4:	ce 01       	movw	r24, r28
    12a6:	4e 96       	adiw	r24, 0x1e	; 30
    12a8:	0e 94 6f 14 	call	0x28de	; 0x28de <memcmp>
    12ac:	89 2b       	or	r24, r25
    12ae:	f1 f0       	breq	.+60     	; 0x12ec <Keyboard_::sendReport()+0x86>
    12b0:	1d 8f       	std	Y+29, r17	; 0x1d
    12b2:	0e 94 4d 14 	call	0x289a	; 0x289a <HID()>
    12b6:	2d e1       	ldi	r18, 0x1D	; 29
    12b8:	30 e0       	ldi	r19, 0x00	; 0
    12ba:	a7 01       	movw	r20, r14
    12bc:	68 e0       	ldi	r22, 0x08	; 8
    12be:	0e 94 0a 14 	call	0x2814	; 0x2814 <HID_::SendReport(unsigned char, void const*, int)>
    12c2:	0d 8f       	std	Y+29, r16	; 0x1d
    12c4:	ce 01       	movw	r24, r28
    12c6:	0e 94 26 09 	call	0x124c	; 0x124c <Keyboard_::sendReportUnchecked()>
    12ca:	18 16       	cp	r1, r24
    12cc:	19 06       	cpc	r1, r25
    12ce:	3c f4       	brge	.+14     	; 0x12de <Keyboard_::sendReport()+0x78>
    12d0:	2d e1       	ldi	r18, 0x1D	; 29
    12d2:	fe 01       	movw	r30, r28
    12d4:	d7 01       	movw	r26, r14
    12d6:	01 90       	ld	r0, Z+
    12d8:	0d 92       	st	X+, r0
    12da:	2a 95       	dec	r18
    12dc:	e1 f7       	brne	.-8      	; 0x12d6 <Keyboard_::sendReport()+0x70>
    12de:	df 91       	pop	r29
    12e0:	cf 91       	pop	r28
    12e2:	1f 91       	pop	r17
    12e4:	0f 91       	pop	r16
    12e6:	ff 90       	pop	r15
    12e8:	ef 90       	pop	r14
    12ea:	08 95       	ret
    12ec:	81 2f       	mov	r24, r17
    12ee:	80 95       	com	r24
    12f0:	80 23       	and	r24, r16
    12f2:	41 f3       	breq	.-48     	; 0x12c4 <Keyboard_::sendReport()+0x5e>
    12f4:	4c e1       	ldi	r20, 0x1C	; 28
    12f6:	50 e0       	ldi	r21, 0x00	; 0
    12f8:	be 01       	movw	r22, r28
    12fa:	6f 5f       	subi	r22, 0xFF	; 255
    12fc:	7f 4f       	sbci	r23, 0xFF	; 255
    12fe:	ce 01       	movw	r24, r28
    1300:	4e 96       	adiw	r24, 0x1e	; 30
    1302:	0e 94 6f 14 	call	0x28de	; 0x28de <memcmp>
    1306:	89 2b       	or	r24, r25
    1308:	e9 f2       	breq	.-70     	; 0x12c4 <Keyboard_::sendReport()+0x5e>
    130a:	08 83       	st	Y, r16
    130c:	0e 94 4d 14 	call	0x289a	; 0x289a <HID()>
    1310:	2d e1       	ldi	r18, 0x1D	; 29
    1312:	30 e0       	ldi	r19, 0x00	; 0
    1314:	ae 01       	movw	r20, r28
    1316:	68 e0       	ldi	r22, 0x08	; 8
    1318:	0e 94 0a 14 	call	0x2814	; 0x2814 <HID_::SendReport(unsigned char, void const*, int)>
    131c:	18 83       	st	Y, r17
    131e:	d2 cf       	rjmp	.-92     	; 0x12c4 <Keyboard_::sendReport()+0x5e>
    1320:	8f ef       	ldi	r24, 0xFF	; 255
    1322:	9f ef       	ldi	r25, 0xFF	; 255
    1324:	dc cf       	rjmp	.-72     	; 0x12de <Keyboard_::sendReport()+0x78>

00001326 <Keyboard_::press(unsigned char)>:
    1326:	6e 3d       	cpi	r22, 0xDE	; 222
    1328:	a0 f4       	brcc	.+40     	; 0x1352 <Keyboard_::press(unsigned char)+0x2c>
    132a:	e6 2f       	mov	r30, r22
    132c:	e6 95       	lsr	r30
    132e:	e6 95       	lsr	r30
    1330:	e6 95       	lsr	r30
    1332:	e8 0f       	add	r30, r24
    1334:	f9 2f       	mov	r31, r25
    1336:	f1 1d       	adc	r31, r1
    1338:	67 70       	andi	r22, 0x07	; 7
    133a:	21 e0       	ldi	r18, 0x01	; 1
    133c:	30 e0       	ldi	r19, 0x00	; 0
    133e:	01 c0       	rjmp	.+2      	; 0x1342 <Keyboard_::press(unsigned char)+0x1c>
    1340:	22 0f       	add	r18, r18
    1342:	6a 95       	dec	r22
    1344:	ea f7       	brpl	.-6      	; 0x1340 <Keyboard_::press(unsigned char)+0x1a>
    1346:	81 81       	ldd	r24, Z+1	; 0x01
    1348:	82 2b       	or	r24, r18
    134a:	81 83       	std	Z+1, r24	; 0x01
    134c:	81 e0       	ldi	r24, 0x01	; 1
    134e:	90 e0       	ldi	r25, 0x00	; 0
    1350:	08 95       	ret
    1352:	60 5e       	subi	r22, 0xE0	; 224
    1354:	68 30       	cpi	r22, 0x08	; 8
    1356:	58 f4       	brcc	.+22     	; 0x136e <Keyboard_::press(unsigned char)+0x48>
    1358:	41 e0       	ldi	r20, 0x01	; 1
    135a:	50 e0       	ldi	r21, 0x00	; 0
    135c:	01 c0       	rjmp	.+2      	; 0x1360 <Keyboard_::press(unsigned char)+0x3a>
    135e:	44 0f       	add	r20, r20
    1360:	6a 95       	dec	r22
    1362:	ea f7       	brpl	.-6      	; 0x135e <Keyboard_::press(unsigned char)+0x38>
    1364:	fc 01       	movw	r30, r24
    1366:	20 81       	ld	r18, Z
    1368:	24 2b       	or	r18, r20
    136a:	20 83       	st	Z, r18
    136c:	ef cf       	rjmp	.-34     	; 0x134c <Keyboard_::press(unsigned char)+0x26>
    136e:	90 e0       	ldi	r25, 0x00	; 0
    1370:	80 e0       	ldi	r24, 0x00	; 0
    1372:	08 95       	ret

00001374 <Keyboard_::release(unsigned char)>:
    1374:	6e 3d       	cpi	r22, 0xDE	; 222
    1376:	a8 f4       	brcc	.+42     	; 0x13a2 <Keyboard_::release(unsigned char)+0x2e>
    1378:	e6 2f       	mov	r30, r22
    137a:	e6 95       	lsr	r30
    137c:	e6 95       	lsr	r30
    137e:	e6 95       	lsr	r30
    1380:	e8 0f       	add	r30, r24
    1382:	f9 2f       	mov	r31, r25
    1384:	f1 1d       	adc	r31, r1
    1386:	67 70       	andi	r22, 0x07	; 7
    1388:	21 e0       	ldi	r18, 0x01	; 1
    138a:	30 e0       	ldi	r19, 0x00	; 0
    138c:	01 c0       	rjmp	.+2      	; 0x1390 <Keyboard_::release(unsigned char)+0x1c>
    138e:	22 0f       	add	r18, r18
    1390:	6a 95       	dec	r22
    1392:	ea f7       	brpl	.-6      	; 0x138e <Keyboard_::release(unsigned char)+0x1a>
    1394:	20 95       	com	r18
    1396:	81 81       	ldd	r24, Z+1	; 0x01
    1398:	28 23       	and	r18, r24
    139a:	21 83       	std	Z+1, r18	; 0x01
    139c:	81 e0       	ldi	r24, 0x01	; 1
    139e:	90 e0       	ldi	r25, 0x00	; 0
    13a0:	08 95       	ret
    13a2:	60 5e       	subi	r22, 0xE0	; 224
    13a4:	68 30       	cpi	r22, 0x08	; 8
    13a6:	60 f4       	brcc	.+24     	; 0x13c0 <Keyboard_::release(unsigned char)+0x4c>
    13a8:	21 e0       	ldi	r18, 0x01	; 1
    13aa:	30 e0       	ldi	r19, 0x00	; 0
    13ac:	01 c0       	rjmp	.+2      	; 0x13b0 <Keyboard_::release(unsigned char)+0x3c>
    13ae:	22 0f       	add	r18, r18
    13b0:	6a 95       	dec	r22
    13b2:	ea f7       	brpl	.-6      	; 0x13ae <Keyboard_::release(unsigned char)+0x3a>
    13b4:	20 95       	com	r18
    13b6:	fc 01       	movw	r30, r24
    13b8:	30 81       	ld	r19, Z
    13ba:	23 23       	and	r18, r19
    13bc:	20 83       	st	Z, r18
    13be:	ee cf       	rjmp	.-36     	; 0x139c <Keyboard_::release(unsigned char)+0x28>
    13c0:	90 e0       	ldi	r25, 0x00	; 0
    13c2:	80 e0       	ldi	r24, 0x00	; 0
    13c4:	08 95       	ret

000013c6 <Keyboard_::releaseAll()>:
    13c6:	2d e1       	ldi	r18, 0x1D	; 29
    13c8:	fc 01       	movw	r30, r24
    13ca:	11 92       	st	Z+, r1
    13cc:	2a 95       	dec	r18
    13ce:	e9 f7       	brne	.-6      	; 0x13ca <Keyboard_::releaseAll()+0x4>
    13d0:	08 95       	ret

000013d2 <Keyboard_::begin()>:
    13d2:	cf 93       	push	r28
    13d4:	df 93       	push	r29
    13d6:	ec 01       	movw	r28, r24
    13d8:	0e 94 e3 09 	call	0x13c6	; 0x13c6 <Keyboard_::releaseAll()>
    13dc:	ce 01       	movw	r24, r28
    13de:	df 91       	pop	r29
    13e0:	cf 91       	pop	r28
    13e2:	0c 94 26 09 	jmp	0x124c	; 0x124c <Keyboard_::sendReportUnchecked()>

000013e6 <_GLOBAL__sub_I__ZN9Keyboard_C2Ev>:
    13e6:	85 e9       	ldi	r24, 0x95	; 149
    13e8:	92 e0       	ldi	r25, 0x02	; 2
    13ea:	0c 94 09 09 	jmp	0x1212	; 0x1212 <Keyboard_::Keyboard_()>

000013ee <SystemControl_::SystemControl_()>:
    13ee:	80 91 de 02 	lds	r24, 0x02DE	; 0x8002de <guard variable for SystemControl_::SystemControl_()::node>
    13f2:	81 11       	cpse	r24, r1
    13f4:	13 c0       	rjmp	.+38     	; 0x141c <SystemControl_::SystemControl_()+0x2e>
    13f6:	10 92 e7 02 	sts	0x02E7, r1	; 0x8002e7 <SystemControl_::SystemControl_()::node+0x1>
    13fa:	10 92 e6 02 	sts	0x02E6, r1	; 0x8002e6 <SystemControl_::SystemControl_()::node>
    13fe:	85 ea       	ldi	r24, 0xA5	; 165
    1400:	91 e0       	ldi	r25, 0x01	; 1
    1402:	90 93 e9 02 	sts	0x02E9, r25	; 0x8002e9 <SystemControl_::SystemControl_()::node+0x3>
    1406:	80 93 e8 02 	sts	0x02E8, r24	; 0x8002e8 <SystemControl_::SystemControl_()::node+0x2>
    140a:	88 e1       	ldi	r24, 0x18	; 24
    140c:	90 e0       	ldi	r25, 0x00	; 0
    140e:	90 93 eb 02 	sts	0x02EB, r25	; 0x8002eb <SystemControl_::SystemControl_()::node+0x5>
    1412:	80 93 ea 02 	sts	0x02EA, r24	; 0x8002ea <SystemControl_::SystemControl_()::node+0x4>
    1416:	81 e0       	ldi	r24, 0x01	; 1
    1418:	80 93 de 02 	sts	0x02DE, r24	; 0x8002de <guard variable for SystemControl_::SystemControl_()::node>
    141c:	0e 94 4d 14 	call	0x289a	; 0x289a <HID()>
    1420:	66 ee       	ldi	r22, 0xE6	; 230
    1422:	72 e0       	ldi	r23, 0x02	; 2
    1424:	0c 94 ba 13 	jmp	0x2774	; 0x2774 <HID_::AppendDescriptor(HIDSubDescriptor*)>

00001428 <SystemControl_::sendReport(void*, int)>:
    1428:	0f 93       	push	r16
    142a:	1f 93       	push	r17
    142c:	cf 93       	push	r28
    142e:	df 93       	push	r29
    1430:	eb 01       	movw	r28, r22
    1432:	8a 01       	movw	r16, r20
    1434:	0e 94 4d 14 	call	0x289a	; 0x289a <HID()>
    1438:	98 01       	movw	r18, r16
    143a:	ae 01       	movw	r20, r28
    143c:	65 e0       	ldi	r22, 0x05	; 5
    143e:	df 91       	pop	r29
    1440:	cf 91       	pop	r28
    1442:	1f 91       	pop	r17
    1444:	0f 91       	pop	r16
    1446:	0c 94 0a 14 	jmp	0x2814	; 0x2814 <HID_::SendReport(unsigned char, void const*, int)>

0000144a <SystemControl_::end()>:
    144a:	cf 93       	push	r28
    144c:	df 93       	push	r29
    144e:	1f 92       	push	r1
    1450:	cd b7       	in	r28, 0x3d	; 61
    1452:	de b7       	in	r29, 0x3e	; 62
    1454:	19 82       	std	Y+1, r1	; 0x01
    1456:	41 e0       	ldi	r20, 0x01	; 1
    1458:	50 e0       	ldi	r21, 0x00	; 0
    145a:	be 01       	movw	r22, r28
    145c:	6f 5f       	subi	r22, 0xFF	; 255
    145e:	7f 4f       	sbci	r23, 0xFF	; 255
    1460:	0e 94 14 0a 	call	0x1428	; 0x1428 <SystemControl_::sendReport(void*, int)>
    1464:	0f 90       	pop	r0
    1466:	df 91       	pop	r29
    1468:	cf 91       	pop	r28
    146a:	08 95       	ret

0000146c <SystemControl_::begin()>:
    146c:	0c 94 25 0a 	jmp	0x144a	; 0x144a <SystemControl_::end()>

00001470 <SystemControl_::release()>:
    1470:	0c 94 25 0a 	jmp	0x144a	; 0x144a <SystemControl_::end()>

00001474 <SystemControl_::press(unsigned char)>:
    1474:	cf 93       	push	r28
    1476:	df 93       	push	r29
    1478:	1f 92       	push	r1
    147a:	cd b7       	in	r28, 0x3d	; 61
    147c:	de b7       	in	r29, 0x3e	; 62
    147e:	69 83       	std	Y+1, r22	; 0x01
    1480:	63 38       	cpi	r22, 0x83	; 131
    1482:	41 f4       	brne	.+16     	; 0x1494 <SystemControl_::press(unsigned char)+0x20>
    1484:	82 e5       	ldi	r24, 0x52	; 82
    1486:	93 e0       	ldi	r25, 0x03	; 3
    1488:	0e 94 68 11 	call	0x22d0	; 0x22d0 <USBDevice_::wakeupHost()>
    148c:	0f 90       	pop	r0
    148e:	df 91       	pop	r29
    1490:	cf 91       	pop	r28
    1492:	08 95       	ret
    1494:	41 e0       	ldi	r20, 0x01	; 1
    1496:	50 e0       	ldi	r21, 0x00	; 0
    1498:	be 01       	movw	r22, r28
    149a:	6f 5f       	subi	r22, 0xFF	; 255
    149c:	7f 4f       	sbci	r23, 0xFF	; 255
    149e:	0e 94 14 0a 	call	0x1428	; 0x1428 <SystemControl_::sendReport(void*, int)>
    14a2:	f4 cf       	rjmp	.-24     	; 0x148c <SystemControl_::press(unsigned char)+0x18>

000014a4 <_GLOBAL__sub_I__ZN14SystemControl_C2Ev>:
    14a4:	8d ed       	ldi	r24, 0xDD	; 221
    14a6:	92 e0       	ldi	r25, 0x02	; 2
    14a8:	0c 94 f7 09 	jmp	0x13ee	; 0x13ee <SystemControl_::SystemControl_()>

000014ac <__vector_23>:
    14ac:	1f 92       	push	r1
    14ae:	0f 92       	push	r0
    14b0:	0f b6       	in	r0, 0x3f	; 63
    14b2:	0f 92       	push	r0
    14b4:	11 24       	eor	r1, r1
    14b6:	2f 93       	push	r18
    14b8:	3f 93       	push	r19
    14ba:	8f 93       	push	r24
    14bc:	9f 93       	push	r25
    14be:	af 93       	push	r26
    14c0:	bf 93       	push	r27
    14c2:	80 91 ed 02 	lds	r24, 0x02ED	; 0x8002ed <timer0_millis>
    14c6:	90 91 ee 02 	lds	r25, 0x02EE	; 0x8002ee <timer0_millis+0x1>
    14ca:	a0 91 ef 02 	lds	r26, 0x02EF	; 0x8002ef <timer0_millis+0x2>
    14ce:	b0 91 f0 02 	lds	r27, 0x02F0	; 0x8002f0 <timer0_millis+0x3>
    14d2:	30 91 ec 02 	lds	r19, 0x02EC	; 0x8002ec <timer0_fract>
    14d6:	23 e0       	ldi	r18, 0x03	; 3
    14d8:	23 0f       	add	r18, r19
    14da:	2d 37       	cpi	r18, 0x7D	; 125
    14dc:	58 f5       	brcc	.+86     	; 0x1534 <__vector_23+0x88>
    14de:	01 96       	adiw	r24, 0x01	; 1
    14e0:	a1 1d       	adc	r26, r1
    14e2:	b1 1d       	adc	r27, r1
    14e4:	20 93 ec 02 	sts	0x02EC, r18	; 0x8002ec <timer0_fract>
    14e8:	80 93 ed 02 	sts	0x02ED, r24	; 0x8002ed <timer0_millis>
    14ec:	90 93 ee 02 	sts	0x02EE, r25	; 0x8002ee <timer0_millis+0x1>
    14f0:	a0 93 ef 02 	sts	0x02EF, r26	; 0x8002ef <timer0_millis+0x2>
    14f4:	b0 93 f0 02 	sts	0x02F0, r27	; 0x8002f0 <timer0_millis+0x3>
    14f8:	80 91 f1 02 	lds	r24, 0x02F1	; 0x8002f1 <timer0_overflow_count>
    14fc:	90 91 f2 02 	lds	r25, 0x02F2	; 0x8002f2 <timer0_overflow_count+0x1>
    1500:	a0 91 f3 02 	lds	r26, 0x02F3	; 0x8002f3 <timer0_overflow_count+0x2>
    1504:	b0 91 f4 02 	lds	r27, 0x02F4	; 0x8002f4 <timer0_overflow_count+0x3>
    1508:	01 96       	adiw	r24, 0x01	; 1
    150a:	a1 1d       	adc	r26, r1
    150c:	b1 1d       	adc	r27, r1
    150e:	80 93 f1 02 	sts	0x02F1, r24	; 0x8002f1 <timer0_overflow_count>
    1512:	90 93 f2 02 	sts	0x02F2, r25	; 0x8002f2 <timer0_overflow_count+0x1>
    1516:	a0 93 f3 02 	sts	0x02F3, r26	; 0x8002f3 <timer0_overflow_count+0x2>
    151a:	b0 93 f4 02 	sts	0x02F4, r27	; 0x8002f4 <timer0_overflow_count+0x3>
    151e:	bf 91       	pop	r27
    1520:	af 91       	pop	r26
    1522:	9f 91       	pop	r25
    1524:	8f 91       	pop	r24
    1526:	3f 91       	pop	r19
    1528:	2f 91       	pop	r18
    152a:	0f 90       	pop	r0
    152c:	0f be       	out	0x3f, r0	; 63
    152e:	0f 90       	pop	r0
    1530:	1f 90       	pop	r1
    1532:	18 95       	reti
    1534:	26 e8       	ldi	r18, 0x86	; 134
    1536:	23 0f       	add	r18, r19
    1538:	02 96       	adiw	r24, 0x02	; 2
    153a:	a1 1d       	adc	r26, r1
    153c:	b1 1d       	adc	r27, r1
    153e:	d2 cf       	rjmp	.-92     	; 0x14e4 <__vector_23+0x38>

00001540 <millis>:
    1540:	2f b7       	in	r18, 0x3f	; 63
    1542:	f8 94       	cli
    1544:	60 91 ed 02 	lds	r22, 0x02ED	; 0x8002ed <timer0_millis>
    1548:	70 91 ee 02 	lds	r23, 0x02EE	; 0x8002ee <timer0_millis+0x1>
    154c:	80 91 ef 02 	lds	r24, 0x02EF	; 0x8002ef <timer0_millis+0x2>
    1550:	90 91 f0 02 	lds	r25, 0x02F0	; 0x8002f0 <timer0_millis+0x3>
    1554:	2f bf       	out	0x3f, r18	; 63
    1556:	08 95       	ret

00001558 <micros>:
    1558:	3f b7       	in	r19, 0x3f	; 63
    155a:	f8 94       	cli
    155c:	80 91 f1 02 	lds	r24, 0x02F1	; 0x8002f1 <timer0_overflow_count>
    1560:	90 91 f2 02 	lds	r25, 0x02F2	; 0x8002f2 <timer0_overflow_count+0x1>
    1564:	a0 91 f3 02 	lds	r26, 0x02F3	; 0x8002f3 <timer0_overflow_count+0x2>
    1568:	b0 91 f4 02 	lds	r27, 0x02F4	; 0x8002f4 <timer0_overflow_count+0x3>
    156c:	26 b5       	in	r18, 0x26	; 38
    156e:	a8 9b       	sbis	0x15, 0	; 21
    1570:	05 c0       	rjmp	.+10     	; 0x157c <micros+0x24>
    1572:	2f 3f       	cpi	r18, 0xFF	; 255
    1574:	19 f0       	breq	.+6      	; 0x157c <micros+0x24>
    1576:	01 96       	adiw	r24, 0x01	; 1
    1578:	a1 1d       	adc	r26, r1
    157a:	b1 1d       	adc	r27, r1
    157c:	3f bf       	out	0x3f, r19	; 63
    157e:	ba 2f       	mov	r27, r26
    1580:	a9 2f       	mov	r26, r25
    1582:	98 2f       	mov	r25, r24
    1584:	88 27       	eor	r24, r24
    1586:	bc 01       	movw	r22, r24
    1588:	cd 01       	movw	r24, r26
    158a:	62 0f       	add	r22, r18
    158c:	71 1d       	adc	r23, r1
    158e:	81 1d       	adc	r24, r1
    1590:	91 1d       	adc	r25, r1
    1592:	42 e0       	ldi	r20, 0x02	; 2
    1594:	66 0f       	add	r22, r22
    1596:	77 1f       	adc	r23, r23
    1598:	88 1f       	adc	r24, r24
    159a:	99 1f       	adc	r25, r25
    159c:	4a 95       	dec	r20
    159e:	d1 f7       	brne	.-12     	; 0x1594 <micros+0x3c>
    15a0:	08 95       	ret

000015a2 <delay>:
    15a2:	8f 92       	push	r8
    15a4:	9f 92       	push	r9
    15a6:	af 92       	push	r10
    15a8:	bf 92       	push	r11
    15aa:	cf 92       	push	r12
    15ac:	df 92       	push	r13
    15ae:	ef 92       	push	r14
    15b0:	ff 92       	push	r15
    15b2:	6b 01       	movw	r12, r22
    15b4:	7c 01       	movw	r14, r24
    15b6:	0e 94 ac 0a 	call	0x1558	; 0x1558 <micros>
    15ba:	4b 01       	movw	r8, r22
    15bc:	5c 01       	movw	r10, r24
    15be:	c1 14       	cp	r12, r1
    15c0:	d1 04       	cpc	r13, r1
    15c2:	e1 04       	cpc	r14, r1
    15c4:	f1 04       	cpc	r15, r1
    15c6:	e9 f0       	breq	.+58     	; 0x1602 <delay+0x60>
    15c8:	0e 94 5c 14 	call	0x28b8	; 0x28b8 <yield>
    15cc:	0e 94 ac 0a 	call	0x1558	; 0x1558 <micros>
    15d0:	68 19       	sub	r22, r8
    15d2:	79 09       	sbc	r23, r9
    15d4:	8a 09       	sbc	r24, r10
    15d6:	9b 09       	sbc	r25, r11
    15d8:	68 3e       	cpi	r22, 0xE8	; 232
    15da:	73 40       	sbci	r23, 0x03	; 3
    15dc:	81 05       	cpc	r24, r1
    15de:	91 05       	cpc	r25, r1
    15e0:	70 f3       	brcs	.-36     	; 0x15be <delay+0x1c>
    15e2:	21 e0       	ldi	r18, 0x01	; 1
    15e4:	c2 1a       	sub	r12, r18
    15e6:	d1 08       	sbc	r13, r1
    15e8:	e1 08       	sbc	r14, r1
    15ea:	f1 08       	sbc	r15, r1
    15ec:	88 ee       	ldi	r24, 0xE8	; 232
    15ee:	88 0e       	add	r8, r24
    15f0:	83 e0       	ldi	r24, 0x03	; 3
    15f2:	98 1e       	adc	r9, r24
    15f4:	a1 1c       	adc	r10, r1
    15f6:	b1 1c       	adc	r11, r1
    15f8:	c1 14       	cp	r12, r1
    15fa:	d1 04       	cpc	r13, r1
    15fc:	e1 04       	cpc	r14, r1
    15fe:	f1 04       	cpc	r15, r1
    1600:	29 f7       	brne	.-54     	; 0x15cc <delay+0x2a>
    1602:	ff 90       	pop	r15
    1604:	ef 90       	pop	r14
    1606:	df 90       	pop	r13
    1608:	cf 90       	pop	r12
    160a:	bf 90       	pop	r11
    160c:	af 90       	pop	r10
    160e:	9f 90       	pop	r9
    1610:	8f 90       	pop	r8
    1612:	08 95       	ret

00001614 <init>:
    1614:	78 94       	sei
    1616:	84 b5       	in	r24, 0x24	; 36
    1618:	82 60       	ori	r24, 0x02	; 2
    161a:	84 bd       	out	0x24, r24	; 36
    161c:	84 b5       	in	r24, 0x24	; 36
    161e:	81 60       	ori	r24, 0x01	; 1
    1620:	84 bd       	out	0x24, r24	; 36
    1622:	85 b5       	in	r24, 0x25	; 37
    1624:	82 60       	ori	r24, 0x02	; 2
    1626:	85 bd       	out	0x25, r24	; 37
    1628:	85 b5       	in	r24, 0x25	; 37
    162a:	81 60       	ori	r24, 0x01	; 1
    162c:	85 bd       	out	0x25, r24	; 37
    162e:	ee e6       	ldi	r30, 0x6E	; 110
    1630:	f0 e0       	ldi	r31, 0x00	; 0
    1632:	80 81       	ld	r24, Z
    1634:	81 60       	ori	r24, 0x01	; 1
    1636:	80 83       	st	Z, r24
    1638:	e1 e8       	ldi	r30, 0x81	; 129
    163a:	f0 e0       	ldi	r31, 0x00	; 0
    163c:	10 82       	st	Z, r1
    163e:	80 81       	ld	r24, Z
    1640:	82 60       	ori	r24, 0x02	; 2
    1642:	80 83       	st	Z, r24
    1644:	80 81       	ld	r24, Z
    1646:	81 60       	ori	r24, 0x01	; 1
    1648:	80 83       	st	Z, r24
    164a:	e0 e8       	ldi	r30, 0x80	; 128
    164c:	f0 e0       	ldi	r31, 0x00	; 0
    164e:	80 81       	ld	r24, Z
    1650:	81 60       	ori	r24, 0x01	; 1
    1652:	80 83       	st	Z, r24
    1654:	e1 e9       	ldi	r30, 0x91	; 145
    1656:	f0 e0       	ldi	r31, 0x00	; 0
    1658:	80 81       	ld	r24, Z
    165a:	82 60       	ori	r24, 0x02	; 2
    165c:	80 83       	st	Z, r24
    165e:	80 81       	ld	r24, Z
    1660:	81 60       	ori	r24, 0x01	; 1
    1662:	80 83       	st	Z, r24
    1664:	e0 e9       	ldi	r30, 0x90	; 144
    1666:	f0 e0       	ldi	r31, 0x00	; 0
    1668:	80 81       	ld	r24, Z
    166a:	81 60       	ori	r24, 0x01	; 1
    166c:	80 83       	st	Z, r24
    166e:	e1 ec       	ldi	r30, 0xC1	; 193
    1670:	f0 e0       	ldi	r31, 0x00	; 0
    1672:	80 81       	ld	r24, Z
    1674:	84 60       	ori	r24, 0x04	; 4
    1676:	80 83       	st	Z, r24
    1678:	80 81       	ld	r24, Z
    167a:	82 60       	ori	r24, 0x02	; 2
    167c:	80 83       	st	Z, r24
    167e:	80 81       	ld	r24, Z
    1680:	81 60       	ori	r24, 0x01	; 1
    1682:	80 83       	st	Z, r24
    1684:	e3 ec       	ldi	r30, 0xC3	; 195
    1686:	f0 e0       	ldi	r31, 0x00	; 0
    1688:	80 81       	ld	r24, Z
    168a:	81 60       	ori	r24, 0x01	; 1
    168c:	80 83       	st	Z, r24
    168e:	e0 ec       	ldi	r30, 0xC0	; 192
    1690:	f0 e0       	ldi	r31, 0x00	; 0
    1692:	80 81       	ld	r24, Z
    1694:	82 60       	ori	r24, 0x02	; 2
    1696:	80 83       	st	Z, r24
    1698:	e2 ec       	ldi	r30, 0xC2	; 194
    169a:	f0 e0       	ldi	r31, 0x00	; 0
    169c:	80 81       	ld	r24, Z
    169e:	81 60       	ori	r24, 0x01	; 1
    16a0:	80 83       	st	Z, r24
    16a2:	ea e7       	ldi	r30, 0x7A	; 122
    16a4:	f0 e0       	ldi	r31, 0x00	; 0
    16a6:	80 81       	ld	r24, Z
    16a8:	84 60       	ori	r24, 0x04	; 4
    16aa:	80 83       	st	Z, r24
    16ac:	80 81       	ld	r24, Z
    16ae:	82 60       	ori	r24, 0x02	; 2
    16b0:	80 83       	st	Z, r24
    16b2:	80 81       	ld	r24, Z
    16b4:	81 60       	ori	r24, 0x01	; 1
    16b6:	80 83       	st	Z, r24
    16b8:	80 81       	ld	r24, Z
    16ba:	80 68       	ori	r24, 0x80	; 128
    16bc:	80 83       	st	Z, r24
    16be:	08 95       	ret

000016c0 <Serial_::write(unsigned char)>:
    16c0:	cf 93       	push	r28
    16c2:	df 93       	push	r29
    16c4:	1f 92       	push	r1
    16c6:	cd b7       	in	r28, 0x3d	; 61
    16c8:	de b7       	in	r29, 0x3e	; 62
    16ca:	69 83       	std	Y+1, r22	; 0x01
    16cc:	dc 01       	movw	r26, r24
    16ce:	ed 91       	ld	r30, X+
    16d0:	fc 91       	ld	r31, X
    16d2:	02 80       	ldd	r0, Z+2	; 0x02
    16d4:	f3 81       	ldd	r31, Z+3	; 0x03
    16d6:	e0 2d       	mov	r30, r0
    16d8:	41 e0       	ldi	r20, 0x01	; 1
    16da:	50 e0       	ldi	r21, 0x00	; 0
    16dc:	be 01       	movw	r22, r28
    16de:	6f 5f       	subi	r22, 0xFF	; 255
    16e0:	7f 4f       	sbci	r23, 0xFF	; 255
    16e2:	09 95       	icall
    16e4:	0f 90       	pop	r0
    16e6:	df 91       	pop	r29
    16e8:	cf 91       	pop	r28
    16ea:	08 95       	ret

000016ec <Serial_::peek()>:
    16ec:	cf 93       	push	r28
    16ee:	df 93       	push	r29
    16f0:	ec 01       	movw	r28, r24
    16f2:	8c 85       	ldd	r24, Y+12	; 0x0c
    16f4:	9d 85       	ldd	r25, Y+13	; 0x0d
    16f6:	97 ff       	sbrs	r25, 7
    16f8:	05 c0       	rjmp	.+10     	; 0x1704 <Serial_::peek()+0x18>
    16fa:	82 e0       	ldi	r24, 0x02	; 2
    16fc:	0e 94 4d 0e 	call	0x1c9a	; 0x1c9a <USB_Recv(unsigned char)>
    1700:	9d 87       	std	Y+13, r25	; 0x0d
    1702:	8c 87       	std	Y+12, r24	; 0x0c
    1704:	8c 85       	ldd	r24, Y+12	; 0x0c
    1706:	9d 85       	ldd	r25, Y+13	; 0x0d
    1708:	df 91       	pop	r29
    170a:	cf 91       	pop	r28
    170c:	08 95       	ret

0000170e <Serial_::availableForWrite()>:
    170e:	83 e0       	ldi	r24, 0x03	; 3
    1710:	0e 94 64 0e 	call	0x1cc8	; 0x1cc8 <USB_SendSpace(unsigned char)>
    1714:	90 e0       	ldi	r25, 0x00	; 0
    1716:	08 95       	ret

00001718 <Serial_::flush()>:
    1718:	83 e0       	ldi	r24, 0x03	; 3
    171a:	0c 94 d3 10 	jmp	0x21a6	; 0x21a6 <USB_Flush(unsigned char)>

0000171e <Serial_::available()>:
    171e:	fc 01       	movw	r30, r24
    1720:	84 85       	ldd	r24, Z+12	; 0x0c
    1722:	95 85       	ldd	r25, Z+13	; 0x0d
    1724:	97 fd       	sbrc	r25, 7
    1726:	06 c0       	rjmp	.+12     	; 0x1734 <Serial_::available()+0x16>
    1728:	82 e0       	ldi	r24, 0x02	; 2
    172a:	0e 94 fd 0d 	call	0x1bfa	; 0x1bfa <USB_Available(unsigned char)>
    172e:	90 e0       	ldi	r25, 0x00	; 0
    1730:	01 96       	adiw	r24, 0x01	; 1
    1732:	08 95       	ret
    1734:	82 e0       	ldi	r24, 0x02	; 2
    1736:	0e 94 fd 0d 	call	0x1bfa	; 0x1bfa <USB_Available(unsigned char)>
    173a:	90 e0       	ldi	r25, 0x00	; 0
    173c:	08 95       	ret

0000173e <Serial_::read()>:
    173e:	fc 01       	movw	r30, r24
    1740:	84 85       	ldd	r24, Z+12	; 0x0c
    1742:	95 85       	ldd	r25, Z+13	; 0x0d
    1744:	97 fd       	sbrc	r25, 7
    1746:	05 c0       	rjmp	.+10     	; 0x1752 <Serial_::read()+0x14>
    1748:	2f ef       	ldi	r18, 0xFF	; 255
    174a:	3f ef       	ldi	r19, 0xFF	; 255
    174c:	35 87       	std	Z+13, r19	; 0x0d
    174e:	24 87       	std	Z+12, r18	; 0x0c
    1750:	08 95       	ret
    1752:	82 e0       	ldi	r24, 0x02	; 2
    1754:	0c 94 4d 0e 	jmp	0x1c9a	; 0x1c9a <USB_Recv(unsigned char)>

00001758 <Serial_::write(unsigned char const*, unsigned int)>:
    1758:	cf 93       	push	r28
    175a:	df 93       	push	r29
    175c:	ec 01       	movw	r28, r24
    175e:	80 91 0e 01 	lds	r24, 0x010E	; 0x80010e <_usbLineInfo+0x7>
    1762:	88 23       	and	r24, r24
    1764:	31 f0       	breq	.+12     	; 0x1772 <Serial_::write(unsigned char const*, unsigned int)+0x1a>
    1766:	83 e0       	ldi	r24, 0x03	; 3
    1768:	0e 94 7e 0e 	call	0x1cfc	; 0x1cfc <USB_Send(unsigned char, void const*, int)>
    176c:	18 16       	cp	r1, r24
    176e:	19 06       	cpc	r1, r25
    1770:	34 f0       	brlt	.+12     	; 0x177e <Serial_::write(unsigned char const*, unsigned int)+0x26>
    1772:	81 e0       	ldi	r24, 0x01	; 1
    1774:	90 e0       	ldi	r25, 0x00	; 0
    1776:	9b 83       	std	Y+3, r25	; 0x03
    1778:	8a 83       	std	Y+2, r24	; 0x02
    177a:	80 e0       	ldi	r24, 0x00	; 0
    177c:	90 e0       	ldi	r25, 0x00	; 0
    177e:	df 91       	pop	r29
    1780:	cf 91       	pop	r28
    1782:	08 95       	ret

00001784 <isLUFAbootloader()>:
    1784:	ee ef       	ldi	r30, 0xFE	; 254
    1786:	ff e7       	ldi	r31, 0x7F	; 127
    1788:	25 91       	lpm	r18, Z+
    178a:	34 91       	lpm	r19, Z
    178c:	81 e0       	ldi	r24, 0x01	; 1
    178e:	2b 3f       	cpi	r18, 0xFB	; 251
    1790:	3c 4d       	sbci	r19, 0xDC	; 220
    1792:	09 f0       	breq	.+2      	; 0x1796 <isLUFAbootloader()+0x12>
    1794:	80 e0       	ldi	r24, 0x00	; 0
    1796:	08 95       	ret

00001798 <CDC_GetInterface(unsigned char*)>:
    1798:	fc 01       	movw	r30, r24
    179a:	90 81       	ld	r25, Z
    179c:	9e 5f       	subi	r25, 0xFE	; 254
    179e:	90 83       	st	Z, r25
    17a0:	42 e4       	ldi	r20, 0x42	; 66
    17a2:	50 e0       	ldi	r21, 0x00	; 0
    17a4:	6d eb       	ldi	r22, 0xBD	; 189
    17a6:	71 e0       	ldi	r23, 0x01	; 1
    17a8:	80 e8       	ldi	r24, 0x80	; 128
    17aa:	0c 94 2f 0f 	jmp	0x1e5e	; 0x1e5e <USB_SendControl(unsigned char, void const*, int)>

000017ae <CDC_Setup(USBSetup&)>:
    17ae:	fc 01       	movw	r30, r24
    17b0:	81 81       	ldd	r24, Z+1	; 0x01
    17b2:	90 81       	ld	r25, Z
    17b4:	91 3a       	cpi	r25, 0xA1	; 161
    17b6:	61 f4       	brne	.+24     	; 0x17d0 <CDC_Setup(USBSetup&)+0x22>
    17b8:	81 32       	cpi	r24, 0x21	; 33
    17ba:	09 f0       	breq	.+2      	; 0x17be <CDC_Setup(USBSetup&)+0x10>
    17bc:	83 c0       	rjmp	.+262    	; 0x18c4 <CDC_Setup(USBSetup&)+0x116>
    17be:	47 e0       	ldi	r20, 0x07	; 7
    17c0:	50 e0       	ldi	r21, 0x00	; 0
    17c2:	67 e0       	ldi	r22, 0x07	; 7
    17c4:	71 e0       	ldi	r23, 0x01	; 1
    17c6:	80 e0       	ldi	r24, 0x00	; 0
    17c8:	0e 94 2f 0f 	call	0x1e5e	; 0x1e5e <USB_SendControl(unsigned char, void const*, int)>
    17cc:	81 e0       	ldi	r24, 0x01	; 1
    17ce:	08 95       	ret
    17d0:	91 32       	cpi	r25, 0x21	; 33
    17d2:	09 f0       	breq	.+2      	; 0x17d6 <CDC_Setup(USBSetup&)+0x28>
    17d4:	77 c0       	rjmp	.+238    	; 0x18c4 <CDC_Setup(USBSetup&)+0x116>
    17d6:	83 32       	cpi	r24, 0x23	; 35
    17d8:	69 f4       	brne	.+26     	; 0x17f4 <CDC_Setup(USBSetup&)+0x46>
    17da:	82 81       	ldd	r24, Z+2	; 0x02
    17dc:	93 81       	ldd	r25, Z+3	; 0x03
    17de:	b0 e0       	ldi	r27, 0x00	; 0
    17e0:	a0 e0       	ldi	r26, 0x00	; 0
    17e2:	80 93 03 01 	sts	0x0103, r24	; 0x800103 <breakValue>
    17e6:	90 93 04 01 	sts	0x0104, r25	; 0x800104 <breakValue+0x1>
    17ea:	a0 93 05 01 	sts	0x0105, r26	; 0x800105 <breakValue+0x2>
    17ee:	b0 93 06 01 	sts	0x0106, r27	; 0x800106 <breakValue+0x3>
    17f2:	ec cf       	rjmp	.-40     	; 0x17cc <CDC_Setup(USBSetup&)+0x1e>
    17f4:	80 32       	cpi	r24, 0x20	; 32
    17f6:	39 f4       	brne	.+14     	; 0x1806 <CDC_Setup(USBSetup&)+0x58>
    17f8:	67 e0       	ldi	r22, 0x07	; 7
    17fa:	70 e0       	ldi	r23, 0x00	; 0
    17fc:	87 e0       	ldi	r24, 0x07	; 7
    17fe:	91 e0       	ldi	r25, 0x01	; 1
    1800:	0e 94 55 0f 	call	0x1eaa	; 0x1eaa <USB_RecvControl(void*, int)>
    1804:	e3 cf       	rjmp	.-58     	; 0x17cc <CDC_Setup(USBSetup&)+0x1e>
    1806:	82 32       	cpi	r24, 0x22	; 34
    1808:	09 f7       	brne	.-62     	; 0x17cc <CDC_Setup(USBSetup&)+0x1e>
    180a:	82 81       	ldd	r24, Z+2	; 0x02
    180c:	80 93 0e 01 	sts	0x010E, r24	; 0x80010e <_usbLineInfo+0x7>
    1810:	0e 94 c2 0b 	call	0x1784	; 0x1784 <isLUFAbootloader()>
    1814:	e0 e0       	ldi	r30, 0x00	; 0
    1816:	f8 e0       	ldi	r31, 0x08	; 8
    1818:	88 23       	and	r24, r24
    181a:	11 f0       	breq	.+4      	; 0x1820 <CDC_Setup(USBSetup&)+0x72>
    181c:	ee ef       	ldi	r30, 0xFE	; 254
    181e:	fa e0       	ldi	r31, 0x0A	; 10
    1820:	80 91 07 01 	lds	r24, 0x0107	; 0x800107 <_usbLineInfo>
    1824:	90 91 08 01 	lds	r25, 0x0108	; 0x800108 <_usbLineInfo+0x1>
    1828:	a0 91 09 01 	lds	r26, 0x0109	; 0x800109 <_usbLineInfo+0x2>
    182c:	b0 91 0a 01 	lds	r27, 0x010A	; 0x80010a <_usbLineInfo+0x3>
    1830:	80 3b       	cpi	r24, 0xB0	; 176
    1832:	94 40       	sbci	r25, 0x04	; 4
    1834:	a1 05       	cpc	r26, r1
    1836:	b1 05       	cpc	r27, r1
    1838:	d9 f4       	brne	.+54     	; 0x1870 <CDC_Setup(USBSetup&)+0xc2>
    183a:	80 91 0e 01 	lds	r24, 0x010E	; 0x80010e <_usbLineInfo+0x7>
    183e:	80 fd       	sbrc	r24, 0
    1840:	17 c0       	rjmp	.+46     	; 0x1870 <CDC_Setup(USBSetup&)+0xc2>
    1842:	ee 3f       	cpi	r30, 0xFE	; 254
    1844:	8a e0       	ldi	r24, 0x0A	; 10
    1846:	f8 07       	cpc	r31, r24
    1848:	71 f5       	brne	.+92     	; 0x18a6 <CDC_Setup(USBSetup&)+0xf8>
    184a:	87 e7       	ldi	r24, 0x77	; 119
    184c:	97 e7       	ldi	r25, 0x77	; 119
    184e:	91 83       	std	Z+1, r25	; 0x01
    1850:	80 83       	st	Z, r24
    1852:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <__TEXT_REGION_LENGTH__+0x7e0060>
    1856:	80 93 45 03 	sts	0x0345, r24	; 0x800345 <wdtcsr_save>
    185a:	88 e1       	ldi	r24, 0x18	; 24
    185c:	9b e0       	ldi	r25, 0x0B	; 11
    185e:	0f b6       	in	r0, 0x3f	; 63
    1860:	f8 94       	cli
    1862:	a8 95       	wdr
    1864:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <__TEXT_REGION_LENGTH__+0x7e0060>
    1868:	0f be       	out	0x3f, r0	; 63
    186a:	90 93 60 00 	sts	0x0060, r25	; 0x800060 <__TEXT_REGION_LENGTH__+0x7e0060>
    186e:	ae cf       	rjmp	.-164    	; 0x17cc <CDC_Setup(USBSetup&)+0x1e>
    1870:	80 81       	ld	r24, Z
    1872:	91 81       	ldd	r25, Z+1	; 0x01
    1874:	87 37       	cpi	r24, 0x77	; 119
    1876:	97 47       	sbci	r25, 0x77	; 119
    1878:	09 f0       	breq	.+2      	; 0x187c <CDC_Setup(USBSetup&)+0xce>
    187a:	a8 cf       	rjmp	.-176    	; 0x17cc <CDC_Setup(USBSetup&)+0x1e>
    187c:	a8 95       	wdr
    187e:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <__TEXT_REGION_LENGTH__+0x7e0060>
    1882:	88 61       	ori	r24, 0x18	; 24
    1884:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <__TEXT_REGION_LENGTH__+0x7e0060>
    1888:	80 91 45 03 	lds	r24, 0x0345	; 0x800345 <wdtcsr_save>
    188c:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <__TEXT_REGION_LENGTH__+0x7e0060>
    1890:	ee 3f       	cpi	r30, 0xFE	; 254
    1892:	8a e0       	ldi	r24, 0x0A	; 10
    1894:	f8 07       	cpc	r31, r24
    1896:	89 f0       	breq	.+34     	; 0x18ba <CDC_Setup(USBSetup&)+0x10c>
    1898:	80 91 fe 0a 	lds	r24, 0x0AFE	; 0x800afe <__bss_end+0x785>
    189c:	90 91 ff 0a 	lds	r25, 0x0AFF	; 0x800aff <__bss_end+0x786>
    18a0:	91 83       	std	Z+1, r25	; 0x01
    18a2:	80 83       	st	Z, r24
    18a4:	93 cf       	rjmp	.-218    	; 0x17cc <CDC_Setup(USBSetup&)+0x1e>
    18a6:	80 81       	ld	r24, Z
    18a8:	91 81       	ldd	r25, Z+1	; 0x01
    18aa:	87 37       	cpi	r24, 0x77	; 119
    18ac:	98 07       	cpc	r25, r24
    18ae:	69 f2       	breq	.-102    	; 0x184a <CDC_Setup(USBSetup&)+0x9c>
    18b0:	90 93 ff 0a 	sts	0x0AFF, r25	; 0x800aff <__bss_end+0x786>
    18b4:	80 93 fe 0a 	sts	0x0AFE, r24	; 0x800afe <__bss_end+0x785>
    18b8:	c8 cf       	rjmp	.-112    	; 0x184a <CDC_Setup(USBSetup&)+0x9c>
    18ba:	10 92 ff 0a 	sts	0x0AFF, r1	; 0x800aff <__bss_end+0x786>
    18be:	10 92 fe 0a 	sts	0x0AFE, r1	; 0x800afe <__bss_end+0x785>
    18c2:	84 cf       	rjmp	.-248    	; 0x17cc <CDC_Setup(USBSetup&)+0x1e>
    18c4:	80 e0       	ldi	r24, 0x00	; 0
    18c6:	08 95       	ret

000018c8 <Serial_::begin(unsigned long)>:
    18c8:	2f ef       	ldi	r18, 0xFF	; 255
    18ca:	3f ef       	ldi	r19, 0xFF	; 255
    18cc:	fc 01       	movw	r30, r24
    18ce:	35 87       	std	Z+13, r19	; 0x0d
    18d0:	24 87       	std	Z+12, r18	; 0x0c
    18d2:	08 95       	ret

000018d4 <_GLOBAL__sub_I__cdcInterface>:
    18d4:	e5 ef       	ldi	r30, 0xF5	; 245
    18d6:	f2 e0       	ldi	r31, 0x02	; 2
    18d8:	13 82       	std	Z+3, r1	; 0x03
    18da:	12 82       	std	Z+2, r1	; 0x02
    18dc:	88 ee       	ldi	r24, 0xE8	; 232
    18de:	93 e0       	ldi	r25, 0x03	; 3
    18e0:	a0 e0       	ldi	r26, 0x00	; 0
    18e2:	b0 e0       	ldi	r27, 0x00	; 0
    18e4:	84 83       	std	Z+4, r24	; 0x04
    18e6:	95 83       	std	Z+5, r25	; 0x05
    18e8:	a6 83       	std	Z+6, r26	; 0x06
    18ea:	b7 83       	std	Z+7, r27	; 0x07
    18ec:	85 e4       	ldi	r24, 0x45	; 69
    18ee:	91 e0       	ldi	r25, 0x01	; 1
    18f0:	91 83       	std	Z+1, r25	; 0x01
    18f2:	80 83       	st	Z, r24
    18f4:	8f ef       	ldi	r24, 0xFF	; 255
    18f6:	9f ef       	ldi	r25, 0xFF	; 255
    18f8:	95 87       	std	Z+13, r25	; 0x0d
    18fa:	84 87       	std	Z+12, r24	; 0x0c
    18fc:	08 95       	ret

000018fe <PluggableUSB_::getInterface(unsigned char*)>:
    18fe:	ef 92       	push	r14
    1900:	ff 92       	push	r15
    1902:	0f 93       	push	r16
    1904:	1f 93       	push	r17
    1906:	cf 93       	push	r28
    1908:	df 93       	push	r29
    190a:	7b 01       	movw	r14, r22
    190c:	fc 01       	movw	r30, r24
    190e:	c2 81       	ldd	r28, Z+2	; 0x02
    1910:	d3 81       	ldd	r29, Z+3	; 0x03
    1912:	10 e0       	ldi	r17, 0x00	; 0
    1914:	00 e0       	ldi	r16, 0x00	; 0
    1916:	20 97       	sbiw	r28, 0x00	; 0
    1918:	91 f0       	breq	.+36     	; 0x193e <PluggableUSB_::getInterface(unsigned char*)+0x40>
    191a:	e8 81       	ld	r30, Y
    191c:	f9 81       	ldd	r31, Y+1	; 0x01
    191e:	02 80       	ldd	r0, Z+2	; 0x02
    1920:	f3 81       	ldd	r31, Z+3	; 0x03
    1922:	e0 2d       	mov	r30, r0
    1924:	b7 01       	movw	r22, r14
    1926:	ce 01       	movw	r24, r28
    1928:	09 95       	icall
    192a:	97 fd       	sbrc	r25, 7
    192c:	06 c0       	rjmp	.+12     	; 0x193a <PluggableUSB_::getInterface(unsigned char*)+0x3c>
    192e:	08 0f       	add	r16, r24
    1930:	19 1f       	adc	r17, r25
    1932:	08 84       	ldd	r0, Y+8	; 0x08
    1934:	d9 85       	ldd	r29, Y+9	; 0x09
    1936:	c0 2d       	mov	r28, r0
    1938:	ee cf       	rjmp	.-36     	; 0x1916 <PluggableUSB_::getInterface(unsigned char*)+0x18>
    193a:	0f ef       	ldi	r16, 0xFF	; 255
    193c:	1f ef       	ldi	r17, 0xFF	; 255
    193e:	c8 01       	movw	r24, r16
    1940:	df 91       	pop	r29
    1942:	cf 91       	pop	r28
    1944:	1f 91       	pop	r17
    1946:	0f 91       	pop	r16
    1948:	ff 90       	pop	r15
    194a:	ef 90       	pop	r14
    194c:	08 95       	ret

0000194e <PluggableUSB_::getDescriptor(USBSetup&)>:
    194e:	0f 93       	push	r16
    1950:	1f 93       	push	r17
    1952:	cf 93       	push	r28
    1954:	df 93       	push	r29
    1956:	8b 01       	movw	r16, r22
    1958:	fc 01       	movw	r30, r24
    195a:	c2 81       	ldd	r28, Z+2	; 0x02
    195c:	d3 81       	ldd	r29, Z+3	; 0x03
    195e:	20 97       	sbiw	r28, 0x00	; 0
    1960:	71 f0       	breq	.+28     	; 0x197e <PluggableUSB_::getDescriptor(USBSetup&)+0x30>
    1962:	e8 81       	ld	r30, Y
    1964:	f9 81       	ldd	r31, Y+1	; 0x01
    1966:	04 80       	ldd	r0, Z+4	; 0x04
    1968:	f5 81       	ldd	r31, Z+5	; 0x05
    196a:	e0 2d       	mov	r30, r0
    196c:	b8 01       	movw	r22, r16
    196e:	ce 01       	movw	r24, r28
    1970:	09 95       	icall
    1972:	00 97       	sbiw	r24, 0x00	; 0
    1974:	31 f4       	brne	.+12     	; 0x1982 <PluggableUSB_::getDescriptor(USBSetup&)+0x34>
    1976:	08 84       	ldd	r0, Y+8	; 0x08
    1978:	d9 85       	ldd	r29, Y+9	; 0x09
    197a:	c0 2d       	mov	r28, r0
    197c:	f0 cf       	rjmp	.-32     	; 0x195e <PluggableUSB_::getDescriptor(USBSetup&)+0x10>
    197e:	90 e0       	ldi	r25, 0x00	; 0
    1980:	80 e0       	ldi	r24, 0x00	; 0
    1982:	df 91       	pop	r29
    1984:	cf 91       	pop	r28
    1986:	1f 91       	pop	r17
    1988:	0f 91       	pop	r16
    198a:	08 95       	ret

0000198c <PluggableUSB_::getShortName(char*)>:
    198c:	0f 93       	push	r16
    198e:	1f 93       	push	r17
    1990:	cf 93       	push	r28
    1992:	df 93       	push	r29
    1994:	8b 01       	movw	r16, r22
    1996:	fc 01       	movw	r30, r24
    1998:	c2 81       	ldd	r28, Z+2	; 0x02
    199a:	d3 81       	ldd	r29, Z+3	; 0x03
    199c:	20 97       	sbiw	r28, 0x00	; 0
    199e:	71 f0       	breq	.+28     	; 0x19bc <PluggableUSB_::getShortName(char*)+0x30>
    19a0:	e8 81       	ld	r30, Y
    19a2:	f9 81       	ldd	r31, Y+1	; 0x01
    19a4:	06 80       	ldd	r0, Z+6	; 0x06
    19a6:	f7 81       	ldd	r31, Z+7	; 0x07
    19a8:	e0 2d       	mov	r30, r0
    19aa:	b8 01       	movw	r22, r16
    19ac:	ce 01       	movw	r24, r28
    19ae:	09 95       	icall
    19b0:	08 0f       	add	r16, r24
    19b2:	11 1d       	adc	r17, r1
    19b4:	08 84       	ldd	r0, Y+8	; 0x08
    19b6:	d9 85       	ldd	r29, Y+9	; 0x09
    19b8:	c0 2d       	mov	r28, r0
    19ba:	f0 cf       	rjmp	.-32     	; 0x199c <PluggableUSB_::getShortName(char*)+0x10>
    19bc:	f8 01       	movw	r30, r16
    19be:	10 82       	st	Z, r1
    19c0:	df 91       	pop	r29
    19c2:	cf 91       	pop	r28
    19c4:	1f 91       	pop	r17
    19c6:	0f 91       	pop	r16
    19c8:	08 95       	ret

000019ca <PluggableUSB_::setup(USBSetup&)>:
    19ca:	0f 93       	push	r16
    19cc:	1f 93       	push	r17
    19ce:	cf 93       	push	r28
    19d0:	df 93       	push	r29
    19d2:	8b 01       	movw	r16, r22
    19d4:	fc 01       	movw	r30, r24
    19d6:	c2 81       	ldd	r28, Z+2	; 0x02
    19d8:	d3 81       	ldd	r29, Z+3	; 0x03
    19da:	20 97       	sbiw	r28, 0x00	; 0
    19dc:	71 f0       	breq	.+28     	; 0x19fa <PluggableUSB_::setup(USBSetup&)+0x30>
    19de:	e8 81       	ld	r30, Y
    19e0:	f9 81       	ldd	r31, Y+1	; 0x01
    19e2:	01 90       	ld	r0, Z+
    19e4:	f0 81       	ld	r31, Z
    19e6:	e0 2d       	mov	r30, r0
    19e8:	b8 01       	movw	r22, r16
    19ea:	ce 01       	movw	r24, r28
    19ec:	09 95       	icall
    19ee:	81 11       	cpse	r24, r1
    19f0:	05 c0       	rjmp	.+10     	; 0x19fc <PluggableUSB_::setup(USBSetup&)+0x32>
    19f2:	08 84       	ldd	r0, Y+8	; 0x08
    19f4:	d9 85       	ldd	r29, Y+9	; 0x09
    19f6:	c0 2d       	mov	r28, r0
    19f8:	f0 cf       	rjmp	.-32     	; 0x19da <PluggableUSB_::setup(USBSetup&)+0x10>
    19fa:	80 e0       	ldi	r24, 0x00	; 0
    19fc:	df 91       	pop	r29
    19fe:	cf 91       	pop	r28
    1a00:	1f 91       	pop	r17
    1a02:	0f 91       	pop	r16
    1a04:	08 95       	ret

00001a06 <PluggableUSB_::plug(PluggableUSBModule*)>:
    1a06:	cf 93       	push	r28
    1a08:	df 93       	push	r29
    1a0a:	fc 01       	movw	r30, r24
    1a0c:	db 01       	movw	r26, r22
    1a0e:	21 81       	ldd	r18, Z+1	; 0x01
    1a10:	14 96       	adiw	r26, 0x04	; 4
    1a12:	8c 91       	ld	r24, X
    1a14:	14 97       	sbiw	r26, 0x04	; 4
    1a16:	82 0f       	add	r24, r18
    1a18:	99 27       	eor	r25, r25
    1a1a:	99 1f       	adc	r25, r25
    1a1c:	08 97       	sbiw	r24, 0x08	; 8
    1a1e:	8c f5       	brge	.+98     	; 0x1a82 <PluggableUSB_::plug(PluggableUSBModule*)+0x7c>
    1a20:	c2 81       	ldd	r28, Z+2	; 0x02
    1a22:	d3 81       	ldd	r29, Z+3	; 0x03
    1a24:	20 97       	sbiw	r28, 0x00	; 0
    1a26:	31 f5       	brne	.+76     	; 0x1a74 <PluggableUSB_::plug(PluggableUSBModule*)+0x6e>
    1a28:	73 83       	std	Z+3, r23	; 0x03
    1a2a:	62 83       	std	Z+2, r22	; 0x02
    1a2c:	90 81       	ld	r25, Z
    1a2e:	12 96       	adiw	r26, 0x02	; 2
    1a30:	9c 93       	st	X, r25
    1a32:	12 97       	sbiw	r26, 0x02	; 2
    1a34:	13 96       	adiw	r26, 0x03	; 3
    1a36:	2c 93       	st	X, r18
    1a38:	13 97       	sbiw	r26, 0x03	; 3
    1a3a:	15 96       	adiw	r26, 0x05	; 5
    1a3c:	8c 91       	ld	r24, X
    1a3e:	15 97       	sbiw	r26, 0x05	; 5
    1a40:	89 0f       	add	r24, r25
    1a42:	80 83       	st	Z, r24
    1a44:	80 e0       	ldi	r24, 0x00	; 0
    1a46:	14 96       	adiw	r26, 0x04	; 4
    1a48:	9c 91       	ld	r25, X
    1a4a:	14 97       	sbiw	r26, 0x04	; 4
    1a4c:	89 17       	cp	r24, r25
    1a4e:	e8 f4       	brcc	.+58     	; 0x1a8a <PluggableUSB_::plug(PluggableUSBModule*)+0x84>
    1a50:	16 96       	adiw	r26, 0x06	; 6
    1a52:	cd 91       	ld	r28, X+
    1a54:	dc 91       	ld	r29, X
    1a56:	17 97       	sbiw	r26, 0x07	; 7
    1a58:	c8 0f       	add	r28, r24
    1a5a:	d1 1d       	adc	r29, r1
    1a5c:	98 81       	ld	r25, Y
    1a5e:	c1 81       	ldd	r28, Z+1	; 0x01
    1a60:	d0 e0       	ldi	r29, 0x00	; 0
    1a62:	c1 5f       	subi	r28, 0xF1	; 241
    1a64:	de 4f       	sbci	r29, 0xFE	; 254
    1a66:	98 83       	st	Y, r25
    1a68:	91 81       	ldd	r25, Z+1	; 0x01
    1a6a:	9f 5f       	subi	r25, 0xFF	; 255
    1a6c:	91 83       	std	Z+1, r25	; 0x01
    1a6e:	8f 5f       	subi	r24, 0xFF	; 255
    1a70:	ea cf       	rjmp	.-44     	; 0x1a46 <PluggableUSB_::plug(PluggableUSBModule*)+0x40>
    1a72:	ec 01       	movw	r28, r24
    1a74:	88 85       	ldd	r24, Y+8	; 0x08
    1a76:	99 85       	ldd	r25, Y+9	; 0x09
    1a78:	00 97       	sbiw	r24, 0x00	; 0
    1a7a:	d9 f7       	brne	.-10     	; 0x1a72 <PluggableUSB_::plug(PluggableUSBModule*)+0x6c>
    1a7c:	b9 87       	std	Y+9, r27	; 0x09
    1a7e:	a8 87       	std	Y+8, r26	; 0x08
    1a80:	d5 cf       	rjmp	.-86     	; 0x1a2c <PluggableUSB_::plug(PluggableUSBModule*)+0x26>
    1a82:	80 e0       	ldi	r24, 0x00	; 0
    1a84:	df 91       	pop	r29
    1a86:	cf 91       	pop	r28
    1a88:	08 95       	ret
    1a8a:	81 e0       	ldi	r24, 0x01	; 1
    1a8c:	fb cf       	rjmp	.-10     	; 0x1a84 <PluggableUSB_::plug(PluggableUSBModule*)+0x7e>

00001a8e <PluggableUSB()>:
    1a8e:	80 91 46 03 	lds	r24, 0x0346	; 0x800346 <guard variable for PluggableUSB()::obj>
    1a92:	81 11       	cpse	r24, r1
    1a94:	0d c0       	rjmp	.+26     	; 0x1ab0 <PluggableUSB()+0x22>
    1a96:	82 e0       	ldi	r24, 0x02	; 2
    1a98:	80 93 4e 03 	sts	0x034E, r24	; 0x80034e <PluggableUSB()::obj>
    1a9c:	84 e0       	ldi	r24, 0x04	; 4
    1a9e:	80 93 4f 03 	sts	0x034F, r24	; 0x80034f <PluggableUSB()::obj+0x1>
    1aa2:	10 92 51 03 	sts	0x0351, r1	; 0x800351 <PluggableUSB()::obj+0x3>
    1aa6:	10 92 50 03 	sts	0x0350, r1	; 0x800350 <PluggableUSB()::obj+0x2>
    1aaa:	81 e0       	ldi	r24, 0x01	; 1
    1aac:	80 93 46 03 	sts	0x0346, r24	; 0x800346 <guard variable for PluggableUSB()::obj>
    1ab0:	8e e4       	ldi	r24, 0x4E	; 78
    1ab2:	93 e0       	ldi	r25, 0x03	; 3
    1ab4:	08 95       	ret

00001ab6 <SendControl(unsigned char)>:
    1ab6:	40 91 55 03 	lds	r20, 0x0355	; 0x800355 <_cmark>
    1aba:	50 91 56 03 	lds	r21, 0x0356	; 0x800356 <_cmark+0x1>
    1abe:	20 91 53 03 	lds	r18, 0x0353	; 0x800353 <_cend>
    1ac2:	30 91 54 03 	lds	r19, 0x0354	; 0x800354 <_cend+0x1>
    1ac6:	42 17       	cp	r20, r18
    1ac8:	53 07       	cpc	r21, r19
    1aca:	b4 f4       	brge	.+44     	; 0x1af8 <SendControl(unsigned char)+0x42>
    1acc:	90 91 e8 00 	lds	r25, 0x00E8	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    1ad0:	95 70       	andi	r25, 0x05	; 5
    1ad2:	e1 f3       	breq	.-8      	; 0x1acc <SendControl(unsigned char)+0x16>
    1ad4:	90 91 e8 00 	lds	r25, 0x00E8	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    1ad8:	92 fd       	sbrc	r25, 2
    1ada:	19 c0       	rjmp	.+50     	; 0x1b0e <SendControl(unsigned char)+0x58>
    1adc:	80 93 f1 00 	sts	0x00F1, r24	; 0x8000f1 <__TEXT_REGION_LENGTH__+0x7e00f1>
    1ae0:	80 91 55 03 	lds	r24, 0x0355	; 0x800355 <_cmark>
    1ae4:	90 91 56 03 	lds	r25, 0x0356	; 0x800356 <_cmark+0x1>
    1ae8:	01 96       	adiw	r24, 0x01	; 1
    1aea:	8f 73       	andi	r24, 0x3F	; 63
    1aec:	99 27       	eor	r25, r25
    1aee:	89 2b       	or	r24, r25
    1af0:	19 f4       	brne	.+6      	; 0x1af8 <SendControl(unsigned char)+0x42>
    1af2:	8e ef       	ldi	r24, 0xFE	; 254
    1af4:	80 93 e8 00 	sts	0x00E8, r24	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    1af8:	80 91 55 03 	lds	r24, 0x0355	; 0x800355 <_cmark>
    1afc:	90 91 56 03 	lds	r25, 0x0356	; 0x800356 <_cmark+0x1>
    1b00:	01 96       	adiw	r24, 0x01	; 1
    1b02:	90 93 56 03 	sts	0x0356, r25	; 0x800356 <_cmark+0x1>
    1b06:	80 93 55 03 	sts	0x0355, r24	; 0x800355 <_cmark>
    1b0a:	81 e0       	ldi	r24, 0x01	; 1
    1b0c:	08 95       	ret
    1b0e:	80 e0       	ldi	r24, 0x00	; 0
    1b10:	08 95       	ret

00001b12 <USB_SendStringDescriptor(unsigned char const*, unsigned char, unsigned char)>:
    1b12:	ef 92       	push	r14
    1b14:	ff 92       	push	r15
    1b16:	0f 93       	push	r16
    1b18:	1f 93       	push	r17
    1b1a:	cf 93       	push	r28
    1b1c:	df 93       	push	r29
    1b1e:	f8 2e       	mov	r15, r24
    1b20:	19 2f       	mov	r17, r25
    1b22:	e6 2e       	mov	r14, r22
    1b24:	04 2f       	mov	r16, r20
    1b26:	81 e0       	ldi	r24, 0x01	; 1
    1b28:	86 0f       	add	r24, r22
    1b2a:	88 0f       	add	r24, r24
    1b2c:	0e 94 5b 0d 	call	0x1ab6	; 0x1ab6 <SendControl(unsigned char)>
    1b30:	83 e0       	ldi	r24, 0x03	; 3
    1b32:	0e 94 5b 0d 	call	0x1ab6	; 0x1ab6 <SendControl(unsigned char)>
    1b36:	cf 2d       	mov	r28, r15
    1b38:	d1 2f       	mov	r29, r17
    1b3a:	ec 0e       	add	r14, r28
    1b3c:	fd 2e       	mov	r15, r29
    1b3e:	f1 1c       	adc	r15, r1
    1b40:	ce 15       	cp	r28, r14
    1b42:	df 05       	cpc	r29, r15
    1b44:	b9 f0       	breq	.+46     	; 0x1b74 <USB_SendStringDescriptor(unsigned char const*, unsigned char, unsigned char)+0x62>
    1b46:	07 ff       	sbrs	r16, 7
    1b48:	13 c0       	rjmp	.+38     	; 0x1b70 <USB_SendStringDescriptor(unsigned char const*, unsigned char, unsigned char)+0x5e>
    1b4a:	fe 01       	movw	r30, r28
    1b4c:	84 91       	lpm	r24, Z
    1b4e:	0e 94 5b 0d 	call	0x1ab6	; 0x1ab6 <SendControl(unsigned char)>
    1b52:	18 2f       	mov	r17, r24
    1b54:	80 e0       	ldi	r24, 0x00	; 0
    1b56:	0e 94 5b 0d 	call	0x1ab6	; 0x1ab6 <SendControl(unsigned char)>
    1b5a:	81 23       	and	r24, r17
    1b5c:	21 96       	adiw	r28, 0x01	; 1
    1b5e:	81 11       	cpse	r24, r1
    1b60:	ef cf       	rjmp	.-34     	; 0x1b40 <USB_SendStringDescriptor(unsigned char const*, unsigned char, unsigned char)+0x2e>
    1b62:	df 91       	pop	r29
    1b64:	cf 91       	pop	r28
    1b66:	1f 91       	pop	r17
    1b68:	0f 91       	pop	r16
    1b6a:	ff 90       	pop	r15
    1b6c:	ef 90       	pop	r14
    1b6e:	08 95       	ret
    1b70:	88 81       	ld	r24, Y
    1b72:	ed cf       	rjmp	.-38     	; 0x1b4e <USB_SendStringDescriptor(unsigned char const*, unsigned char, unsigned char)+0x3c>
    1b74:	81 e0       	ldi	r24, 0x01	; 1
    1b76:	f5 cf       	rjmp	.-22     	; 0x1b62 <USB_SendStringDescriptor(unsigned char const*, unsigned char, unsigned char)+0x50>

00001b78 <USB_ClockEnable()>:
    1b78:	80 91 d7 00 	lds	r24, 0x00D7	; 0x8000d7 <__TEXT_REGION_LENGTH__+0x7e00d7>
    1b7c:	81 60       	ori	r24, 0x01	; 1
    1b7e:	80 93 d7 00 	sts	0x00D7, r24	; 0x8000d7 <__TEXT_REGION_LENGTH__+0x7e00d7>
    1b82:	80 ea       	ldi	r24, 0xA0	; 160
    1b84:	80 93 d8 00 	sts	0x00D8, r24	; 0x8000d8 <__TEXT_REGION_LENGTH__+0x7e00d8>
    1b88:	89 b5       	in	r24, 0x29	; 41
    1b8a:	80 61       	ori	r24, 0x10	; 16
    1b8c:	89 bd       	out	0x29, r24	; 41
    1b8e:	89 b5       	in	r24, 0x29	; 41
    1b90:	82 60       	ori	r24, 0x02	; 2
    1b92:	89 bd       	out	0x29, r24	; 41
    1b94:	09 b4       	in	r0, 0x29	; 41
    1b96:	00 fe       	sbrs	r0, 0
    1b98:	fd cf       	rjmp	.-6      	; 0x1b94 <USB_ClockEnable()+0x1c>
    1b9a:	61 e0       	ldi	r22, 0x01	; 1
    1b9c:	70 e0       	ldi	r23, 0x00	; 0
    1b9e:	80 e0       	ldi	r24, 0x00	; 0
    1ba0:	90 e0       	ldi	r25, 0x00	; 0
    1ba2:	0e 94 d1 0a 	call	0x15a2	; 0x15a2 <delay>
    1ba6:	80 91 d8 00 	lds	r24, 0x00D8	; 0x8000d8 <__TEXT_REGION_LENGTH__+0x7e00d8>
    1baa:	8f 7c       	andi	r24, 0xCF	; 207
    1bac:	80 61       	ori	r24, 0x10	; 16
    1bae:	80 93 d8 00 	sts	0x00D8, r24	; 0x8000d8 <__TEXT_REGION_LENGTH__+0x7e00d8>
    1bb2:	80 91 e0 00 	lds	r24, 0x00E0	; 0x8000e0 <__TEXT_REGION_LENGTH__+0x7e00e0>
    1bb6:	80 7f       	andi	r24, 0xF0	; 240
    1bb8:	80 93 e0 00 	sts	0x00E0, r24	; 0x8000e0 <__TEXT_REGION_LENGTH__+0x7e00e0>
    1bbc:	08 95       	ret

00001bbe <SendInterfaces()>:
    1bbe:	cf 93       	push	r28
    1bc0:	df 93       	push	r29
    1bc2:	1f 92       	push	r1
    1bc4:	cd b7       	in	r28, 0x3d	; 61
    1bc6:	de b7       	in	r29, 0x3e	; 62
    1bc8:	19 82       	std	Y+1, r1	; 0x01
    1bca:	ce 01       	movw	r24, r28
    1bcc:	01 96       	adiw	r24, 0x01	; 1
    1bce:	0e 94 cc 0b 	call	0x1798	; 0x1798 <CDC_GetInterface(unsigned char*)>
    1bd2:	0e 94 47 0d 	call	0x1a8e	; 0x1a8e <PluggableUSB()>
    1bd6:	be 01       	movw	r22, r28
    1bd8:	6f 5f       	subi	r22, 0xFF	; 255
    1bda:	7f 4f       	sbci	r23, 0xFF	; 255
    1bdc:	0e 94 7f 0c 	call	0x18fe	; 0x18fe <PluggableUSB_::getInterface(unsigned char*)>
    1be0:	89 81       	ldd	r24, Y+1	; 0x01
    1be2:	0f 90       	pop	r0
    1be4:	df 91       	pop	r29
    1be6:	cf 91       	pop	r28
    1be8:	08 95       	ret

00001bea <LockEP::LockEP(unsigned char)>:
    1bea:	2f b7       	in	r18, 0x3f	; 63
    1bec:	fc 01       	movw	r30, r24
    1bee:	20 83       	st	Z, r18
    1bf0:	f8 94       	cli
    1bf2:	67 70       	andi	r22, 0x07	; 7
    1bf4:	60 93 e9 00 	sts	0x00E9, r22	; 0x8000e9 <__TEXT_REGION_LENGTH__+0x7e00e9>
    1bf8:	08 95       	ret

00001bfa <USB_Available(unsigned char)>:
    1bfa:	cf 93       	push	r28
    1bfc:	df 93       	push	r29
    1bfe:	1f 92       	push	r1
    1c00:	cd b7       	in	r28, 0x3d	; 61
    1c02:	de b7       	in	r29, 0x3e	; 62
    1c04:	68 2f       	mov	r22, r24
    1c06:	ce 01       	movw	r24, r28
    1c08:	01 96       	adiw	r24, 0x01	; 1
    1c0a:	0e 94 f5 0d 	call	0x1bea	; 0x1bea <LockEP::LockEP(unsigned char)>
    1c0e:	80 91 f2 00 	lds	r24, 0x00F2	; 0x8000f2 <__TEXT_REGION_LENGTH__+0x7e00f2>
    1c12:	99 81       	ldd	r25, Y+1	; 0x01
    1c14:	9f bf       	out	0x3f, r25	; 63
    1c16:	0f 90       	pop	r0
    1c18:	df 91       	pop	r29
    1c1a:	cf 91       	pop	r28
    1c1c:	08 95       	ret

00001c1e <USB_Recv(unsigned char, void*, int)>:
    1c1e:	ef 92       	push	r14
    1c20:	ff 92       	push	r15
    1c22:	0f 93       	push	r16
    1c24:	1f 93       	push	r17
    1c26:	cf 93       	push	r28
    1c28:	df 93       	push	r29
    1c2a:	1f 92       	push	r1
    1c2c:	cd b7       	in	r28, 0x3d	; 61
    1c2e:	de b7       	in	r29, 0x3e	; 62
    1c30:	90 91 59 03 	lds	r25, 0x0359	; 0x800359 <_usbConfiguration>
    1c34:	99 23       	and	r25, r25
    1c36:	71 f1       	breq	.+92     	; 0x1c94 <USB_Recv(unsigned char, void*, int)+0x76>
    1c38:	57 fd       	sbrc	r21, 7
    1c3a:	2c c0       	rjmp	.+88     	; 0x1c94 <USB_Recv(unsigned char, void*, int)+0x76>
    1c3c:	8a 01       	movw	r16, r20
    1c3e:	7b 01       	movw	r14, r22
    1c40:	68 2f       	mov	r22, r24
    1c42:	ce 01       	movw	r24, r28
    1c44:	01 96       	adiw	r24, 0x01	; 1
    1c46:	0e 94 f5 0d 	call	0x1bea	; 0x1bea <LockEP::LockEP(unsigned char)>
    1c4a:	80 91 f2 00 	lds	r24, 0x00F2	; 0x8000f2 <__TEXT_REGION_LENGTH__+0x7e00f2>
    1c4e:	90 e0       	ldi	r25, 0x00	; 0
    1c50:	08 17       	cp	r16, r24
    1c52:	19 07       	cpc	r17, r25
    1c54:	0c f4       	brge	.+2      	; 0x1c58 <USB_Recv(unsigned char, void*, int)+0x3a>
    1c56:	c8 01       	movw	r24, r16
    1c58:	28 2f       	mov	r18, r24
    1c5a:	f7 01       	movw	r30, r14
    1c5c:	44 e6       	ldi	r20, 0x64	; 100
    1c5e:	21 50       	subi	r18, 0x01	; 1
    1c60:	30 f0       	brcs	.+12     	; 0x1c6e <USB_Recv(unsigned char, void*, int)+0x50>
    1c62:	40 93 5a 03 	sts	0x035A, r20	; 0x80035a <RxLEDPulse>
    1c66:	30 91 f1 00 	lds	r19, 0x00F1	; 0x8000f1 <__TEXT_REGION_LENGTH__+0x7e00f1>
    1c6a:	31 93       	st	Z+, r19
    1c6c:	f8 cf       	rjmp	.-16     	; 0x1c5e <USB_Recv(unsigned char, void*, int)+0x40>
    1c6e:	00 97       	sbiw	r24, 0x00	; 0
    1c70:	39 f0       	breq	.+14     	; 0x1c80 <USB_Recv(unsigned char, void*, int)+0x62>
    1c72:	20 91 f2 00 	lds	r18, 0x00F2	; 0x8000f2 <__TEXT_REGION_LENGTH__+0x7e00f2>
    1c76:	21 11       	cpse	r18, r1
    1c78:	03 c0       	rjmp	.+6      	; 0x1c80 <USB_Recv(unsigned char, void*, int)+0x62>
    1c7a:	2b e6       	ldi	r18, 0x6B	; 107
    1c7c:	20 93 e8 00 	sts	0x00E8, r18	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    1c80:	29 81       	ldd	r18, Y+1	; 0x01
    1c82:	2f bf       	out	0x3f, r18	; 63
    1c84:	0f 90       	pop	r0
    1c86:	df 91       	pop	r29
    1c88:	cf 91       	pop	r28
    1c8a:	1f 91       	pop	r17
    1c8c:	0f 91       	pop	r16
    1c8e:	ff 90       	pop	r15
    1c90:	ef 90       	pop	r14
    1c92:	08 95       	ret
    1c94:	8f ef       	ldi	r24, 0xFF	; 255
    1c96:	9f ef       	ldi	r25, 0xFF	; 255
    1c98:	f5 cf       	rjmp	.-22     	; 0x1c84 <USB_Recv(unsigned char, void*, int)+0x66>

00001c9a <USB_Recv(unsigned char)>:
    1c9a:	cf 93       	push	r28
    1c9c:	df 93       	push	r29
    1c9e:	1f 92       	push	r1
    1ca0:	cd b7       	in	r28, 0x3d	; 61
    1ca2:	de b7       	in	r29, 0x3e	; 62
    1ca4:	41 e0       	ldi	r20, 0x01	; 1
    1ca6:	50 e0       	ldi	r21, 0x00	; 0
    1ca8:	be 01       	movw	r22, r28
    1caa:	6f 5f       	subi	r22, 0xFF	; 255
    1cac:	7f 4f       	sbci	r23, 0xFF	; 255
    1cae:	0e 94 0f 0e 	call	0x1c1e	; 0x1c1e <USB_Recv(unsigned char, void*, int)>
    1cb2:	01 97       	sbiw	r24, 0x01	; 1
    1cb4:	31 f4       	brne	.+12     	; 0x1cc2 <USB_Recv(unsigned char)+0x28>
    1cb6:	89 81       	ldd	r24, Y+1	; 0x01
    1cb8:	90 e0       	ldi	r25, 0x00	; 0
    1cba:	0f 90       	pop	r0
    1cbc:	df 91       	pop	r29
    1cbe:	cf 91       	pop	r28
    1cc0:	08 95       	ret
    1cc2:	8f ef       	ldi	r24, 0xFF	; 255
    1cc4:	9f ef       	ldi	r25, 0xFF	; 255
    1cc6:	f9 cf       	rjmp	.-14     	; 0x1cba <USB_Recv(unsigned char)+0x20>

00001cc8 <USB_SendSpace(unsigned char)>:
    1cc8:	cf 93       	push	r28
    1cca:	df 93       	push	r29
    1ccc:	1f 92       	push	r1
    1cce:	cd b7       	in	r28, 0x3d	; 61
    1cd0:	de b7       	in	r29, 0x3e	; 62
    1cd2:	68 2f       	mov	r22, r24
    1cd4:	ce 01       	movw	r24, r28
    1cd6:	01 96       	adiw	r24, 0x01	; 1
    1cd8:	0e 94 f5 0d 	call	0x1bea	; 0x1bea <LockEP::LockEP(unsigned char)>
    1cdc:	90 91 e8 00 	lds	r25, 0x00E8	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    1ce0:	89 2f       	mov	r24, r25
    1ce2:	80 72       	andi	r24, 0x20	; 32
    1ce4:	95 ff       	sbrs	r25, 5
    1ce6:	04 c0       	rjmp	.+8      	; 0x1cf0 <USB_SendSpace(unsigned char)+0x28>
    1ce8:	90 91 f2 00 	lds	r25, 0x00F2	; 0x8000f2 <__TEXT_REGION_LENGTH__+0x7e00f2>
    1cec:	80 e4       	ldi	r24, 0x40	; 64
    1cee:	89 1b       	sub	r24, r25
    1cf0:	99 81       	ldd	r25, Y+1	; 0x01
    1cf2:	9f bf       	out	0x3f, r25	; 63
    1cf4:	0f 90       	pop	r0
    1cf6:	df 91       	pop	r29
    1cf8:	cf 91       	pop	r28
    1cfa:	08 95       	ret

00001cfc <USB_Send(unsigned char, void const*, int)>:
    1cfc:	5f 92       	push	r5
    1cfe:	6f 92       	push	r6
    1d00:	7f 92       	push	r7
    1d02:	8f 92       	push	r8
    1d04:	9f 92       	push	r9
    1d06:	af 92       	push	r10
    1d08:	bf 92       	push	r11
    1d0a:	cf 92       	push	r12
    1d0c:	df 92       	push	r13
    1d0e:	ef 92       	push	r14
    1d10:	ff 92       	push	r15
    1d12:	0f 93       	push	r16
    1d14:	1f 93       	push	r17
    1d16:	cf 93       	push	r28
    1d18:	df 93       	push	r29
    1d1a:	1f 92       	push	r1
    1d1c:	cd b7       	in	r28, 0x3d	; 61
    1d1e:	de b7       	in	r29, 0x3e	; 62
    1d20:	98 2e       	mov	r9, r24
    1d22:	6b 01       	movw	r12, r22
    1d24:	b4 2e       	mov	r11, r20
    1d26:	05 2f       	mov	r16, r21
    1d28:	80 91 59 03 	lds	r24, 0x0359	; 0x800359 <_usbConfiguration>
    1d2c:	81 11       	cpse	r24, r1
    1d2e:	13 c0       	rjmp	.+38     	; 0x1d56 <USB_Send(unsigned char, void const*, int)+0x5a>
    1d30:	8f ef       	ldi	r24, 0xFF	; 255
    1d32:	9f ef       	ldi	r25, 0xFF	; 255
    1d34:	0f 90       	pop	r0
    1d36:	df 91       	pop	r29
    1d38:	cf 91       	pop	r28
    1d3a:	1f 91       	pop	r17
    1d3c:	0f 91       	pop	r16
    1d3e:	ff 90       	pop	r15
    1d40:	ef 90       	pop	r14
    1d42:	df 90       	pop	r13
    1d44:	cf 90       	pop	r12
    1d46:	bf 90       	pop	r11
    1d48:	af 90       	pop	r10
    1d4a:	9f 90       	pop	r9
    1d4c:	8f 90       	pop	r8
    1d4e:	7f 90       	pop	r7
    1d50:	6f 90       	pop	r6
    1d52:	5f 90       	pop	r5
    1d54:	08 95       	ret
    1d56:	80 91 57 03 	lds	r24, 0x0357	; 0x800357 <_usbSuspendState>
    1d5a:	80 ff       	sbrs	r24, 0
    1d5c:	05 c0       	rjmp	.+10     	; 0x1d68 <USB_Send(unsigned char, void const*, int)+0x6c>
    1d5e:	80 91 e0 00 	lds	r24, 0x00E0	; 0x8000e0 <__TEXT_REGION_LENGTH__+0x7e00e0>
    1d62:	82 60       	ori	r24, 0x02	; 2
    1d64:	80 93 e0 00 	sts	0x00E0, r24	; 0x8000e0 <__TEXT_REGION_LENGTH__+0x7e00e0>
    1d68:	eb 2c       	mov	r14, r11
    1d6a:	f0 2e       	mov	r15, r16
    1d6c:	a1 2c       	mov	r10, r1
    1d6e:	8a ef       	ldi	r24, 0xFA	; 250
    1d70:	88 2e       	mov	r8, r24
    1d72:	89 2d       	mov	r24, r9
    1d74:	80 72       	andi	r24, 0x20	; 32
    1d76:	68 2e       	mov	r6, r24
    1d78:	89 2d       	mov	r24, r9
    1d7a:	80 74       	andi	r24, 0x40	; 64
    1d7c:	58 2e       	mov	r5, r24
    1d7e:	9a e3       	ldi	r25, 0x3A	; 58
    1d80:	79 2e       	mov	r7, r25
    1d82:	e1 14       	cp	r14, r1
    1d84:	f1 04       	cpc	r15, r1
    1d86:	19 f4       	brne	.+6      	; 0x1d8e <USB_Send(unsigned char, void const*, int)+0x92>
    1d88:	aa 20       	and	r10, r10
    1d8a:	09 f4       	brne	.+2      	; 0x1d8e <USB_Send(unsigned char, void const*, int)+0x92>
    1d8c:	57 c0       	rjmp	.+174    	; 0x1e3c <USB_Send(unsigned char, void const*, int)+0x140>
    1d8e:	89 2d       	mov	r24, r9
    1d90:	0e 94 64 0e 	call	0x1cc8	; 0x1cc8 <USB_SendSpace(unsigned char)>
    1d94:	18 2f       	mov	r17, r24
    1d96:	81 11       	cpse	r24, r1
    1d98:	0a c0       	rjmp	.+20     	; 0x1dae <USB_Send(unsigned char, void const*, int)+0xb2>
    1d9a:	8a 94       	dec	r8
    1d9c:	88 20       	and	r8, r8
    1d9e:	41 f2       	breq	.-112    	; 0x1d30 <USB_Send(unsigned char, void const*, int)+0x34>
    1da0:	61 e0       	ldi	r22, 0x01	; 1
    1da2:	70 e0       	ldi	r23, 0x00	; 0
    1da4:	80 e0       	ldi	r24, 0x00	; 0
    1da6:	90 e0       	ldi	r25, 0x00	; 0
    1da8:	0e 94 d1 0a 	call	0x15a2	; 0x15a2 <delay>
    1dac:	ea cf       	rjmp	.-44     	; 0x1d82 <USB_Send(unsigned char, void const*, int)+0x86>
    1dae:	8e 15       	cp	r24, r14
    1db0:	1f 04       	cpc	r1, r15
    1db2:	11 f0       	breq	.+4      	; 0x1db8 <USB_Send(unsigned char, void const*, int)+0xbc>
    1db4:	0c f0       	brlt	.+2      	; 0x1db8 <USB_Send(unsigned char, void const*, int)+0xbc>
    1db6:	1e 2d       	mov	r17, r14
    1db8:	69 2d       	mov	r22, r9
    1dba:	ce 01       	movw	r24, r28
    1dbc:	01 96       	adiw	r24, 0x01	; 1
    1dbe:	0e 94 f5 0d 	call	0x1bea	; 0x1bea <LockEP::LockEP(unsigned char)>
    1dc2:	80 91 e8 00 	lds	r24, 0x00E8	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    1dc6:	85 fd       	sbrc	r24, 5
    1dc8:	03 c0       	rjmp	.+6      	; 0x1dd0 <USB_Send(unsigned char, void const*, int)+0xd4>
    1dca:	89 81       	ldd	r24, Y+1	; 0x01
    1dcc:	8f bf       	out	0x3f, r24	; 63
    1dce:	d9 cf       	rjmp	.-78     	; 0x1d82 <USB_Send(unsigned char, void const*, int)+0x86>
    1dd0:	81 2f       	mov	r24, r17
    1dd2:	90 e0       	ldi	r25, 0x00	; 0
    1dd4:	e8 1a       	sub	r14, r24
    1dd6:	f9 0a       	sbc	r15, r25
    1dd8:	66 20       	and	r6, r6
    1dda:	29 f0       	breq	.+10     	; 0x1de6 <USB_Send(unsigned char, void const*, int)+0xea>
    1ddc:	11 50       	subi	r17, 0x01	; 1
    1dde:	a0 f0       	brcs	.+40     	; 0x1e08 <USB_Send(unsigned char, void const*, int)+0x10c>
    1de0:	10 92 f1 00 	sts	0x00F1, r1	; 0x8000f1 <__TEXT_REGION_LENGTH__+0x7e00f1>
    1de4:	fb cf       	rjmp	.-10     	; 0x1ddc <USB_Send(unsigned char, void const*, int)+0xe0>
    1de6:	f6 01       	movw	r30, r12
    1de8:	97 fc       	sbrc	r9, 7
    1dea:	0a c0       	rjmp	.+20     	; 0x1e00 <USB_Send(unsigned char, void const*, int)+0x104>
    1dec:	11 50       	subi	r17, 0x01	; 1
    1dee:	50 f0       	brcs	.+20     	; 0x1e04 <USB_Send(unsigned char, void const*, int)+0x108>
    1df0:	21 91       	ld	r18, Z+
    1df2:	20 93 f1 00 	sts	0x00F1, r18	; 0x8000f1 <__TEXT_REGION_LENGTH__+0x7e00f1>
    1df6:	fa cf       	rjmp	.-12     	; 0x1dec <USB_Send(unsigned char, void const*, int)+0xf0>
    1df8:	24 91       	lpm	r18, Z
    1dfa:	20 93 f1 00 	sts	0x00F1, r18	; 0x8000f1 <__TEXT_REGION_LENGTH__+0x7e00f1>
    1dfe:	31 96       	adiw	r30, 0x01	; 1
    1e00:	11 50       	subi	r17, 0x01	; 1
    1e02:	d0 f7       	brcc	.-12     	; 0x1df8 <USB_Send(unsigned char, void const*, int)+0xfc>
    1e04:	c8 0e       	add	r12, r24
    1e06:	d9 1e       	adc	r13, r25
    1e08:	aa 20       	and	r10, r10
    1e0a:	21 f0       	breq	.+8      	; 0x1e14 <USB_Send(unsigned char, void const*, int)+0x118>
    1e0c:	70 92 e8 00 	sts	0x00E8, r7	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    1e10:	a1 2c       	mov	r10, r1
    1e12:	db cf       	rjmp	.-74     	; 0x1dca <USB_Send(unsigned char, void const*, int)+0xce>
    1e14:	80 91 e8 00 	lds	r24, 0x00E8	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    1e18:	85 fd       	sbrc	r24, 5
    1e1a:	08 c0       	rjmp	.+16     	; 0x1e2c <USB_Send(unsigned char, void const*, int)+0x130>
    1e1c:	70 92 e8 00 	sts	0x00E8, r7	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    1e20:	aa 24       	eor	r10, r10
    1e22:	a3 94       	inc	r10
    1e24:	e1 14       	cp	r14, r1
    1e26:	f1 04       	cpc	r15, r1
    1e28:	81 f2       	breq	.-96     	; 0x1dca <USB_Send(unsigned char, void const*, int)+0xce>
    1e2a:	f2 cf       	rjmp	.-28     	; 0x1e10 <USB_Send(unsigned char, void const*, int)+0x114>
    1e2c:	e1 14       	cp	r14, r1
    1e2e:	f1 04       	cpc	r15, r1
    1e30:	61 f6       	brne	.-104    	; 0x1dca <USB_Send(unsigned char, void const*, int)+0xce>
    1e32:	55 20       	and	r5, r5
    1e34:	51 f2       	breq	.-108    	; 0x1dca <USB_Send(unsigned char, void const*, int)+0xce>
    1e36:	70 92 e8 00 	sts	0x00E8, r7	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    1e3a:	c7 cf       	rjmp	.-114    	; 0x1dca <USB_Send(unsigned char, void const*, int)+0xce>
    1e3c:	84 e6       	ldi	r24, 0x64	; 100
    1e3e:	80 93 5b 03 	sts	0x035B, r24	; 0x80035b <TxLEDPulse>
    1e42:	8b 2d       	mov	r24, r11
    1e44:	90 2f       	mov	r25, r16
    1e46:	76 cf       	rjmp	.-276    	; 0x1d34 <USB_Send(unsigned char, void const*, int)+0x38>

00001e48 <InitControl(int)>:
    1e48:	10 92 e9 00 	sts	0x00E9, r1	; 0x8000e9 <__TEXT_REGION_LENGTH__+0x7e00e9>
    1e4c:	10 92 56 03 	sts	0x0356, r1	; 0x800356 <_cmark+0x1>
    1e50:	10 92 55 03 	sts	0x0355, r1	; 0x800355 <_cmark>
    1e54:	90 93 54 03 	sts	0x0354, r25	; 0x800354 <_cend+0x1>
    1e58:	80 93 53 03 	sts	0x0353, r24	; 0x800353 <_cend>
    1e5c:	08 95       	ret

00001e5e <USB_SendControl(unsigned char, void const*, int)>:
    1e5e:	df 92       	push	r13
    1e60:	ef 92       	push	r14
    1e62:	ff 92       	push	r15
    1e64:	0f 93       	push	r16
    1e66:	1f 93       	push	r17
    1e68:	cf 93       	push	r28
    1e6a:	df 93       	push	r29
    1e6c:	d8 2e       	mov	r13, r24
    1e6e:	8a 01       	movw	r16, r20
    1e70:	eb 01       	movw	r28, r22
    1e72:	7b 01       	movw	r14, r22
    1e74:	e4 0e       	add	r14, r20
    1e76:	f5 1e       	adc	r15, r21
    1e78:	ce 15       	cp	r28, r14
    1e7a:	df 05       	cpc	r29, r15
    1e7c:	59 f0       	breq	.+22     	; 0x1e94 <USB_SendControl(unsigned char, void const*, int)+0x36>
    1e7e:	d7 fe       	sbrs	r13, 7
    1e80:	12 c0       	rjmp	.+36     	; 0x1ea6 <USB_SendControl(unsigned char, void const*, int)+0x48>
    1e82:	fe 01       	movw	r30, r28
    1e84:	84 91       	lpm	r24, Z
    1e86:	0e 94 5b 0d 	call	0x1ab6	; 0x1ab6 <SendControl(unsigned char)>
    1e8a:	21 96       	adiw	r28, 0x01	; 1
    1e8c:	81 11       	cpse	r24, r1
    1e8e:	f4 cf       	rjmp	.-24     	; 0x1e78 <USB_SendControl(unsigned char, void const*, int)+0x1a>
    1e90:	0f ef       	ldi	r16, 0xFF	; 255
    1e92:	1f ef       	ldi	r17, 0xFF	; 255
    1e94:	c8 01       	movw	r24, r16
    1e96:	df 91       	pop	r29
    1e98:	cf 91       	pop	r28
    1e9a:	1f 91       	pop	r17
    1e9c:	0f 91       	pop	r16
    1e9e:	ff 90       	pop	r15
    1ea0:	ef 90       	pop	r14
    1ea2:	df 90       	pop	r13
    1ea4:	08 95       	ret
    1ea6:	88 81       	ld	r24, Y
    1ea8:	ee cf       	rjmp	.-36     	; 0x1e86 <USB_SendControl(unsigned char, void const*, int)+0x28>

00001eaa <USB_RecvControl(void*, int)>:
    1eaa:	cf 93       	push	r28
    1eac:	df 93       	push	r29
    1eae:	ec 01       	movw	r28, r24
    1eb0:	9b 01       	movw	r18, r22
    1eb2:	b4 e6       	ldi	r27, 0x64	; 100
    1eb4:	ab ef       	ldi	r26, 0xFB	; 251
    1eb6:	21 15       	cp	r18, r1
    1eb8:	31 05       	cpc	r19, r1
    1eba:	f1 f0       	breq	.+60     	; 0x1ef8 <USB_RecvControl(void*, int)+0x4e>
    1ebc:	a9 01       	movw	r20, r18
    1ebe:	21 34       	cpi	r18, 0x41	; 65
    1ec0:	31 05       	cpc	r19, r1
    1ec2:	14 f0       	brlt	.+4      	; 0x1ec8 <USB_RecvControl(void*, int)+0x1e>
    1ec4:	40 e4       	ldi	r20, 0x40	; 64
    1ec6:	50 e0       	ldi	r21, 0x00	; 0
    1ec8:	80 91 e8 00 	lds	r24, 0x00E8	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    1ecc:	82 ff       	sbrs	r24, 2
    1ece:	fc cf       	rjmp	.-8      	; 0x1ec8 <USB_RecvControl(void*, int)+0x1e>
    1ed0:	94 2f       	mov	r25, r20
    1ed2:	fb 01       	movw	r30, r22
    1ed4:	e2 1b       	sub	r30, r18
    1ed6:	f3 0b       	sbc	r31, r19
    1ed8:	ec 0f       	add	r30, r28
    1eda:	fd 1f       	adc	r31, r29
    1edc:	91 50       	subi	r25, 0x01	; 1
    1ede:	28 f0       	brcs	.+10     	; 0x1eea <USB_RecvControl(void*, int)+0x40>
    1ee0:	80 91 f1 00 	lds	r24, 0x00F1	; 0x8000f1 <__TEXT_REGION_LENGTH__+0x7e00f1>
    1ee4:	80 83       	st	Z, r24
    1ee6:	31 96       	adiw	r30, 0x01	; 1
    1ee8:	f9 cf       	rjmp	.-14     	; 0x1edc <USB_RecvControl(void*, int)+0x32>
    1eea:	b0 93 5a 03 	sts	0x035A, r27	; 0x80035a <RxLEDPulse>
    1eee:	a0 93 e8 00 	sts	0x00E8, r26	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    1ef2:	24 1b       	sub	r18, r20
    1ef4:	35 0b       	sbc	r19, r21
    1ef6:	df cf       	rjmp	.-66     	; 0x1eb6 <USB_RecvControl(void*, int)+0xc>
    1ef8:	cb 01       	movw	r24, r22
    1efa:	df 91       	pop	r29
    1efc:	cf 91       	pop	r28
    1efe:	08 95       	ret

00001f00 <__vector_11>:
    1f00:	1f 92       	push	r1
    1f02:	0f 92       	push	r0
    1f04:	0f b6       	in	r0, 0x3f	; 63
    1f06:	0f 92       	push	r0
    1f08:	11 24       	eor	r1, r1
    1f0a:	cf 92       	push	r12
    1f0c:	df 92       	push	r13
    1f0e:	ff 92       	push	r15
    1f10:	0f 93       	push	r16
    1f12:	1f 93       	push	r17
    1f14:	2f 93       	push	r18
    1f16:	3f 93       	push	r19
    1f18:	4f 93       	push	r20
    1f1a:	5f 93       	push	r21
    1f1c:	6f 93       	push	r22
    1f1e:	7f 93       	push	r23
    1f20:	8f 93       	push	r24
    1f22:	9f 93       	push	r25
    1f24:	af 93       	push	r26
    1f26:	bf 93       	push	r27
    1f28:	ef 93       	push	r30
    1f2a:	ff 93       	push	r31
    1f2c:	cf 93       	push	r28
    1f2e:	df 93       	push	r29
    1f30:	cd b7       	in	r28, 0x3d	; 61
    1f32:	de b7       	in	r29, 0x3e	; 62
    1f34:	6c 97       	sbiw	r28, 0x1c	; 28
    1f36:	de bf       	out	0x3e, r29	; 62
    1f38:	cd bf       	out	0x3d, r28	; 61
    1f3a:	10 92 e9 00 	sts	0x00E9, r1	; 0x8000e9 <__TEXT_REGION_LENGTH__+0x7e00e9>
    1f3e:	80 91 e8 00 	lds	r24, 0x00E8	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    1f42:	83 ff       	sbrs	r24, 3
    1f44:	2f c0       	rjmp	.+94     	; 0x1fa4 <__vector_11+0xa4>
    1f46:	89 e0       	ldi	r24, 0x09	; 9
    1f48:	fe 01       	movw	r30, r28
    1f4a:	75 96       	adiw	r30, 0x15	; 21
    1f4c:	fe 2e       	mov	r15, r30
    1f4e:	0f 2f       	mov	r16, r31
    1f50:	81 50       	subi	r24, 0x01	; 1
    1f52:	29 f0       	breq	.+10     	; 0x1f5e <__vector_11+0x5e>
    1f54:	90 91 f1 00 	lds	r25, 0x00F1	; 0x8000f1 <__TEXT_REGION_LENGTH__+0x7e00f1>
    1f58:	90 83       	st	Z, r25
    1f5a:	31 96       	adiw	r30, 0x01	; 1
    1f5c:	f9 cf       	rjmp	.-14     	; 0x1f50 <__vector_11+0x50>
    1f5e:	84 e6       	ldi	r24, 0x64	; 100
    1f60:	80 93 5a 03 	sts	0x035A, r24	; 0x80035a <RxLEDPulse>
    1f64:	82 ef       	ldi	r24, 0xF2	; 242
    1f66:	80 93 e8 00 	sts	0x00E8, r24	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    1f6a:	8d 89       	ldd	r24, Y+21	; 0x15
    1f6c:	87 ff       	sbrs	r24, 7
    1f6e:	38 c0       	rjmp	.+112    	; 0x1fe0 <__vector_11+0xe0>
    1f70:	90 91 e8 00 	lds	r25, 0x00E8	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    1f74:	90 ff       	sbrs	r25, 0
    1f76:	fc cf       	rjmp	.-8      	; 0x1f70 <__vector_11+0x70>
    1f78:	98 2f       	mov	r25, r24
    1f7a:	90 76       	andi	r25, 0x60	; 96
    1f7c:	09 f0       	breq	.+2      	; 0x1f80 <__vector_11+0x80>
    1f7e:	00 c1       	rjmp	.+512    	; 0x2180 <__vector_11+0x280>
    1f80:	9e 89       	ldd	r25, Y+22	; 0x16
    1f82:	4f 89       	ldd	r20, Y+23	; 0x17
    1f84:	58 8d       	ldd	r21, Y+24	; 0x18
    1f86:	2f 89       	ldd	r18, Y+23	; 0x17
    1f88:	18 8d       	ldd	r17, Y+24	; 0x18
    1f8a:	91 11       	cpse	r25, r1
    1f8c:	30 c0       	rjmp	.+96     	; 0x1fee <__vector_11+0xee>
    1f8e:	80 38       	cpi	r24, 0x80	; 128
    1f90:	59 f5       	brne	.+86     	; 0x1fe8 <__vector_11+0xe8>
    1f92:	80 91 58 03 	lds	r24, 0x0358	; 0x800358 <_usbCurrentStatus>
    1f96:	80 93 f1 00 	sts	0x00F1, r24	; 0x8000f1 <__TEXT_REGION_LENGTH__+0x7e00f1>
    1f9a:	10 92 f1 00 	sts	0x00F1, r1	; 0x8000f1 <__TEXT_REGION_LENGTH__+0x7e00f1>
    1f9e:	8e ef       	ldi	r24, 0xFE	; 254
    1fa0:	80 93 e8 00 	sts	0x00E8, r24	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    1fa4:	6c 96       	adiw	r28, 0x1c	; 28
    1fa6:	0f b6       	in	r0, 0x3f	; 63
    1fa8:	f8 94       	cli
    1faa:	de bf       	out	0x3e, r29	; 62
    1fac:	0f be       	out	0x3f, r0	; 63
    1fae:	cd bf       	out	0x3d, r28	; 61
    1fb0:	df 91       	pop	r29
    1fb2:	cf 91       	pop	r28
    1fb4:	ff 91       	pop	r31
    1fb6:	ef 91       	pop	r30
    1fb8:	bf 91       	pop	r27
    1fba:	af 91       	pop	r26
    1fbc:	9f 91       	pop	r25
    1fbe:	8f 91       	pop	r24
    1fc0:	7f 91       	pop	r23
    1fc2:	6f 91       	pop	r22
    1fc4:	5f 91       	pop	r21
    1fc6:	4f 91       	pop	r20
    1fc8:	3f 91       	pop	r19
    1fca:	2f 91       	pop	r18
    1fcc:	1f 91       	pop	r17
    1fce:	0f 91       	pop	r16
    1fd0:	ff 90       	pop	r15
    1fd2:	df 90       	pop	r13
    1fd4:	cf 90       	pop	r12
    1fd6:	0f 90       	pop	r0
    1fd8:	0f be       	out	0x3f, r0	; 63
    1fda:	0f 90       	pop	r0
    1fdc:	1f 90       	pop	r1
    1fde:	18 95       	reti
    1fe0:	9e ef       	ldi	r25, 0xFE	; 254
    1fe2:	90 93 e8 00 	sts	0x00E8, r25	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    1fe6:	c8 cf       	rjmp	.-112    	; 0x1f78 <__vector_11+0x78>
    1fe8:	10 92 f1 00 	sts	0x00F1, r1	; 0x8000f1 <__TEXT_REGION_LENGTH__+0x7e00f1>
    1fec:	d6 cf       	rjmp	.-84     	; 0x1f9a <__vector_11+0x9a>
    1fee:	91 30       	cpi	r25, 0x01	; 1
    1ff0:	59 f4       	brne	.+22     	; 0x2008 <__vector_11+0x108>
    1ff2:	81 11       	cpse	r24, r1
    1ff4:	d4 cf       	rjmp	.-88     	; 0x1f9e <__vector_11+0x9e>
    1ff6:	41 30       	cpi	r20, 0x01	; 1
    1ff8:	51 05       	cpc	r21, r1
    1ffa:	89 f6       	brne	.-94     	; 0x1f9e <__vector_11+0x9e>
    1ffc:	80 91 58 03 	lds	r24, 0x0358	; 0x800358 <_usbCurrentStatus>
    2000:	8d 7f       	andi	r24, 0xFD	; 253
    2002:	80 93 58 03 	sts	0x0358, r24	; 0x800358 <_usbCurrentStatus>
    2006:	cb cf       	rjmp	.-106    	; 0x1f9e <__vector_11+0x9e>
    2008:	93 30       	cpi	r25, 0x03	; 3
    200a:	49 f4       	brne	.+18     	; 0x201e <__vector_11+0x11e>
    200c:	81 11       	cpse	r24, r1
    200e:	c7 cf       	rjmp	.-114    	; 0x1f9e <__vector_11+0x9e>
    2010:	41 30       	cpi	r20, 0x01	; 1
    2012:	51 05       	cpc	r21, r1
    2014:	21 f6       	brne	.-120    	; 0x1f9e <__vector_11+0x9e>
    2016:	80 91 58 03 	lds	r24, 0x0358	; 0x800358 <_usbCurrentStatus>
    201a:	82 60       	ori	r24, 0x02	; 2
    201c:	f2 cf       	rjmp	.-28     	; 0x2002 <__vector_11+0x102>
    201e:	95 30       	cpi	r25, 0x05	; 5
    2020:	41 f4       	brne	.+16     	; 0x2032 <__vector_11+0x132>
    2022:	80 91 e8 00 	lds	r24, 0x00E8	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    2026:	80 ff       	sbrs	r24, 0
    2028:	fc cf       	rjmp	.-8      	; 0x2022 <__vector_11+0x122>
    202a:	20 68       	ori	r18, 0x80	; 128
    202c:	20 93 e3 00 	sts	0x00E3, r18	; 0x8000e3 <__TEXT_REGION_LENGTH__+0x7e00e3>
    2030:	b6 cf       	rjmp	.-148    	; 0x1f9e <__vector_11+0x9e>
    2032:	96 30       	cpi	r25, 0x06	; 6
    2034:	09 f0       	breq	.+2      	; 0x2038 <__vector_11+0x138>
    2036:	76 c0       	rjmp	.+236    	; 0x2124 <__vector_11+0x224>
    2038:	cb 8c       	ldd	r12, Y+27	; 0x1b
    203a:	dc 8c       	ldd	r13, Y+28	; 0x1c
    203c:	12 30       	cpi	r17, 0x02	; 2
    203e:	39 f5       	brne	.+78     	; 0x208e <__vector_11+0x18e>
    2040:	90 e0       	ldi	r25, 0x00	; 0
    2042:	80 e0       	ldi	r24, 0x00	; 0
    2044:	0e 94 24 0f 	call	0x1e48	; 0x1e48 <InitControl(int)>
    2048:	0e 94 df 0d 	call	0x1bbe	; 0x1bbe <SendInterfaces()>
    204c:	1f 82       	std	Y+7, r1	; 0x07
    204e:	99 e0       	ldi	r25, 0x09	; 9
    2050:	99 83       	std	Y+1, r25	; 0x01
    2052:	1a 83       	std	Y+2, r17	; 0x02
    2054:	91 e0       	ldi	r25, 0x01	; 1
    2056:	9e 83       	std	Y+6, r25	; 0x06
    2058:	90 ea       	ldi	r25, 0xA0	; 160
    205a:	98 87       	std	Y+8, r25	; 0x08
    205c:	9a ef       	ldi	r25, 0xFA	; 250
    205e:	99 87       	std	Y+9, r25	; 0x09
    2060:	20 91 55 03 	lds	r18, 0x0355	; 0x800355 <_cmark>
    2064:	30 91 56 03 	lds	r19, 0x0356	; 0x800356 <_cmark+0x1>
    2068:	27 5f       	subi	r18, 0xF7	; 247
    206a:	3f 4f       	sbci	r19, 0xFF	; 255
    206c:	3c 83       	std	Y+4, r19	; 0x04
    206e:	2b 83       	std	Y+3, r18	; 0x03
    2070:	8d 83       	std	Y+5, r24	; 0x05
    2072:	c6 01       	movw	r24, r12
    2074:	0e 94 24 0f 	call	0x1e48	; 0x1e48 <InitControl(int)>
    2078:	49 e0       	ldi	r20, 0x09	; 9
    207a:	50 e0       	ldi	r21, 0x00	; 0
    207c:	be 01       	movw	r22, r28
    207e:	6f 5f       	subi	r22, 0xFF	; 255
    2080:	7f 4f       	sbci	r23, 0xFF	; 255
    2082:	80 e0       	ldi	r24, 0x00	; 0
    2084:	0e 94 2f 0f 	call	0x1e5e	; 0x1e5e <USB_SendControl(unsigned char, void const*, int)>
    2088:	0e 94 df 0d 	call	0x1bbe	; 0x1bbe <SendInterfaces()>
    208c:	88 cf       	rjmp	.-240    	; 0x1f9e <__vector_11+0x9e>
    208e:	c6 01       	movw	r24, r12
    2090:	0e 94 24 0f 	call	0x1e48	; 0x1e48 <InitControl(int)>
    2094:	0e 94 47 0d 	call	0x1a8e	; 0x1a8e <PluggableUSB()>
    2098:	6f 2d       	mov	r22, r15
    209a:	70 2f       	mov	r23, r16
    209c:	0e 94 a7 0c 	call	0x194e	; 0x194e <PluggableUSB_::getDescriptor(USBSetup&)>
    20a0:	00 97       	sbiw	r24, 0x00	; 0
    20a2:	31 f0       	breq	.+12     	; 0x20b0 <__vector_11+0x1b0>
    20a4:	0c f0       	brlt	.+2      	; 0x20a8 <__vector_11+0x1a8>
    20a6:	7b cf       	rjmp	.-266    	; 0x1f9e <__vector_11+0x9e>
    20a8:	81 e2       	ldi	r24, 0x21	; 33
    20aa:	80 93 eb 00 	sts	0x00EB, r24	; 0x8000eb <__TEXT_REGION_LENGTH__+0x7e00eb>
    20ae:	7a cf       	rjmp	.-268    	; 0x1fa4 <__vector_11+0xa4>
    20b0:	11 30       	cpi	r17, 0x01	; 1
    20b2:	61 f1       	breq	.+88     	; 0x210c <__vector_11+0x20c>
    20b4:	13 30       	cpi	r17, 0x03	; 3
    20b6:	c1 f7       	brne	.-16     	; 0x20a8 <__vector_11+0x1a8>
    20b8:	8f 89       	ldd	r24, Y+23	; 0x17
    20ba:	88 23       	and	r24, r24
    20bc:	81 f1       	breq	.+96     	; 0x211e <__vector_11+0x21e>
    20be:	82 30       	cpi	r24, 0x02	; 2
    20c0:	49 f4       	brne	.+18     	; 0x20d4 <__vector_11+0x1d4>
    20c2:	40 e8       	ldi	r20, 0x80	; 128
    20c4:	6c e0       	ldi	r22, 0x0C	; 12
    20c6:	8b e1       	ldi	r24, 0x1B	; 27
    20c8:	92 e0       	ldi	r25, 0x02	; 2
    20ca:	0e 94 89 0d 	call	0x1b12	; 0x1b12 <USB_SendStringDescriptor(unsigned char const*, unsigned char, unsigned char)>
    20ce:	88 23       	and	r24, r24
    20d0:	59 f3       	breq	.-42     	; 0x20a8 <__vector_11+0x1a8>
    20d2:	65 cf       	rjmp	.-310    	; 0x1f9e <__vector_11+0x9e>
    20d4:	81 30       	cpi	r24, 0x01	; 1
    20d6:	29 f4       	brne	.+10     	; 0x20e2 <__vector_11+0x1e2>
    20d8:	40 e8       	ldi	r20, 0x80	; 128
    20da:	69 e0       	ldi	r22, 0x09	; 9
    20dc:	81 e1       	ldi	r24, 0x11	; 17
    20de:	92 e0       	ldi	r25, 0x02	; 2
    20e0:	f4 cf       	rjmp	.-24     	; 0x20ca <__vector_11+0x1ca>
    20e2:	83 30       	cpi	r24, 0x03	; 3
    20e4:	09 f7       	brne	.-62     	; 0x20a8 <__vector_11+0x1a8>
    20e6:	0e 94 47 0d 	call	0x1a8e	; 0x1a8e <PluggableUSB()>
    20ea:	8e 01       	movw	r16, r28
    20ec:	0f 5f       	subi	r16, 0xFF	; 255
    20ee:	1f 4f       	sbci	r17, 0xFF	; 255
    20f0:	b8 01       	movw	r22, r16
    20f2:	0e 94 c6 0c 	call	0x198c	; 0x198c <PluggableUSB_::getShortName(char*)>
    20f6:	f8 01       	movw	r30, r16
    20f8:	01 90       	ld	r0, Z+
    20fa:	00 20       	and	r0, r0
    20fc:	e9 f7       	brne	.-6      	; 0x20f8 <__vector_11+0x1f8>
    20fe:	31 97       	sbiw	r30, 0x01	; 1
    2100:	bf 01       	movw	r22, r30
    2102:	60 1b       	sub	r22, r16
    2104:	71 0b       	sbc	r23, r17
    2106:	40 e0       	ldi	r20, 0x00	; 0
    2108:	c8 01       	movw	r24, r16
    210a:	df cf       	rjmp	.-66     	; 0x20ca <__vector_11+0x1ca>
    210c:	6f ef       	ldi	r22, 0xFF	; 255
    210e:	71 e0       	ldi	r23, 0x01	; 1
    2110:	fb 01       	movw	r30, r22
    2112:	44 91       	lpm	r20, Z
    2114:	50 e0       	ldi	r21, 0x00	; 0
    2116:	80 e8       	ldi	r24, 0x80	; 128
    2118:	0e 94 2f 0f 	call	0x1e5e	; 0x1e5e <USB_SendControl(unsigned char, void const*, int)>
    211c:	40 cf       	rjmp	.-384    	; 0x1f9e <__vector_11+0x9e>
    211e:	68 e2       	ldi	r22, 0x28	; 40
    2120:	72 e0       	ldi	r23, 0x02	; 2
    2122:	f6 cf       	rjmp	.-20     	; 0x2110 <__vector_11+0x210>
    2124:	97 30       	cpi	r25, 0x07	; 7
    2126:	09 f4       	brne	.+2      	; 0x212a <__vector_11+0x22a>
    2128:	bf cf       	rjmp	.-130    	; 0x20a8 <__vector_11+0x1a8>
    212a:	98 30       	cpi	r25, 0x08	; 8
    212c:	21 f4       	brne	.+8      	; 0x2136 <__vector_11+0x236>
    212e:	81 e0       	ldi	r24, 0x01	; 1
    2130:	80 93 f1 00 	sts	0x00F1, r24	; 0x8000f1 <__TEXT_REGION_LENGTH__+0x7e00f1>
    2134:	34 cf       	rjmp	.-408    	; 0x1f9e <__vector_11+0x9e>
    2136:	99 30       	cpi	r25, 0x09	; 9
    2138:	09 f0       	breq	.+2      	; 0x213c <__vector_11+0x23c>
    213a:	31 cf       	rjmp	.-414    	; 0x1f9e <__vector_11+0x9e>
    213c:	83 70       	andi	r24, 0x03	; 3
    213e:	09 f0       	breq	.+2      	; 0x2142 <__vector_11+0x242>
    2140:	b3 cf       	rjmp	.-154    	; 0x20a8 <__vector_11+0x1a8>
    2142:	e0 e1       	ldi	r30, 0x10	; 16
    2144:	f1 e0       	ldi	r31, 0x01	; 1
    2146:	81 e0       	ldi	r24, 0x01	; 1
    2148:	31 e0       	ldi	r19, 0x01	; 1
    214a:	96 e3       	ldi	r25, 0x36	; 54
    214c:	21 91       	ld	r18, Z+
    214e:	22 23       	and	r18, r18
    2150:	71 f0       	breq	.+28     	; 0x216e <__vector_11+0x26e>
    2152:	80 93 e9 00 	sts	0x00E9, r24	; 0x8000e9 <__TEXT_REGION_LENGTH__+0x7e00e9>
    2156:	30 93 eb 00 	sts	0x00EB, r19	; 0x8000eb <__TEXT_REGION_LENGTH__+0x7e00eb>
    215a:	df 01       	movw	r26, r30
    215c:	11 97       	sbiw	r26, 0x01	; 1
    215e:	2c 91       	ld	r18, X
    2160:	20 93 ec 00 	sts	0x00EC, r18	; 0x8000ec <__TEXT_REGION_LENGTH__+0x7e00ec>
    2164:	90 93 ed 00 	sts	0x00ED, r25	; 0x8000ed <__TEXT_REGION_LENGTH__+0x7e00ed>
    2168:	8f 5f       	subi	r24, 0xFF	; 255
    216a:	87 30       	cpi	r24, 0x07	; 7
    216c:	79 f7       	brne	.-34     	; 0x214c <__vector_11+0x24c>
    216e:	8e e7       	ldi	r24, 0x7E	; 126
    2170:	80 93 ea 00 	sts	0x00EA, r24	; 0x8000ea <__TEXT_REGION_LENGTH__+0x7e00ea>
    2174:	10 92 ea 00 	sts	0x00EA, r1	; 0x8000ea <__TEXT_REGION_LENGTH__+0x7e00ea>
    2178:	8f 89       	ldd	r24, Y+23	; 0x17
    217a:	80 93 59 03 	sts	0x0359, r24	; 0x800359 <_usbConfiguration>
    217e:	0f cf       	rjmp	.-482    	; 0x1f9e <__vector_11+0x9e>
    2180:	8b 8d       	ldd	r24, Y+27	; 0x1b
    2182:	9c 8d       	ldd	r25, Y+28	; 0x1c
    2184:	0e 94 24 0f 	call	0x1e48	; 0x1e48 <InitControl(int)>
    2188:	89 8d       	ldd	r24, Y+25	; 0x19
    218a:	81 11       	cpse	r24, r1
    218c:	05 c0       	rjmp	.+10     	; 0x2198 <__vector_11+0x298>
    218e:	8f 2d       	mov	r24, r15
    2190:	90 2f       	mov	r25, r16
    2192:	0e 94 d7 0b 	call	0x17ae	; 0x17ae <CDC_Setup(USBSetup&)>
    2196:	9b cf       	rjmp	.-202    	; 0x20ce <__vector_11+0x1ce>
    2198:	0e 94 47 0d 	call	0x1a8e	; 0x1a8e <PluggableUSB()>
    219c:	6f 2d       	mov	r22, r15
    219e:	70 2f       	mov	r23, r16
    21a0:	0e 94 e5 0c 	call	0x19ca	; 0x19ca <PluggableUSB_::setup(USBSetup&)>
    21a4:	94 cf       	rjmp	.-216    	; 0x20ce <__vector_11+0x1ce>

000021a6 <USB_Flush(unsigned char)>:
    21a6:	80 93 e9 00 	sts	0x00E9, r24	; 0x8000e9 <__TEXT_REGION_LENGTH__+0x7e00e9>
    21aa:	80 91 f2 00 	lds	r24, 0x00F2	; 0x8000f2 <__TEXT_REGION_LENGTH__+0x7e00f2>
    21ae:	88 23       	and	r24, r24
    21b0:	19 f0       	breq	.+6      	; 0x21b8 <USB_Flush(unsigned char)+0x12>
    21b2:	8a e3       	ldi	r24, 0x3A	; 58
    21b4:	80 93 e8 00 	sts	0x00E8, r24	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    21b8:	08 95       	ret

000021ba <__vector_10>:
    21ba:	1f 92       	push	r1
    21bc:	0f 92       	push	r0
    21be:	0f b6       	in	r0, 0x3f	; 63
    21c0:	0f 92       	push	r0
    21c2:	11 24       	eor	r1, r1
    21c4:	2f 93       	push	r18
    21c6:	3f 93       	push	r19
    21c8:	4f 93       	push	r20
    21ca:	5f 93       	push	r21
    21cc:	6f 93       	push	r22
    21ce:	7f 93       	push	r23
    21d0:	8f 93       	push	r24
    21d2:	9f 93       	push	r25
    21d4:	af 93       	push	r26
    21d6:	bf 93       	push	r27
    21d8:	cf 93       	push	r28
    21da:	ef 93       	push	r30
    21dc:	ff 93       	push	r31
    21de:	c0 91 e1 00 	lds	r28, 0x00E1	; 0x8000e1 <__TEXT_REGION_LENGTH__+0x7e00e1>
    21e2:	80 91 e1 00 	lds	r24, 0x00E1	; 0x8000e1 <__TEXT_REGION_LENGTH__+0x7e00e1>
    21e6:	83 7f       	andi	r24, 0xF3	; 243
    21e8:	80 93 e1 00 	sts	0x00E1, r24	; 0x8000e1 <__TEXT_REGION_LENGTH__+0x7e00e1>
    21ec:	c3 ff       	sbrs	r28, 3
    21ee:	0f c0       	rjmp	.+30     	; 0x220e <__vector_10+0x54>
    21f0:	10 92 e9 00 	sts	0x00E9, r1	; 0x8000e9 <__TEXT_REGION_LENGTH__+0x7e00e9>
    21f4:	81 e0       	ldi	r24, 0x01	; 1
    21f6:	80 93 eb 00 	sts	0x00EB, r24	; 0x8000eb <__TEXT_REGION_LENGTH__+0x7e00eb>
    21fa:	10 92 ec 00 	sts	0x00EC, r1	; 0x8000ec <__TEXT_REGION_LENGTH__+0x7e00ec>
    21fe:	82 e3       	ldi	r24, 0x32	; 50
    2200:	80 93 ed 00 	sts	0x00ED, r24	; 0x8000ed <__TEXT_REGION_LENGTH__+0x7e00ed>
    2204:	10 92 59 03 	sts	0x0359, r1	; 0x800359 <_usbConfiguration>
    2208:	88 e0       	ldi	r24, 0x08	; 8
    220a:	80 93 f0 00 	sts	0x00F0, r24	; 0x8000f0 <__TEXT_REGION_LENGTH__+0x7e00f0>
    220e:	c2 ff       	sbrs	r28, 2
    2210:	15 c0       	rjmp	.+42     	; 0x223c <__vector_10+0x82>
    2212:	83 e0       	ldi	r24, 0x03	; 3
    2214:	0e 94 d3 10 	call	0x21a6	; 0x21a6 <USB_Flush(unsigned char)>
    2218:	80 91 5b 03 	lds	r24, 0x035B	; 0x80035b <TxLEDPulse>
    221c:	88 23       	and	r24, r24
    221e:	29 f0       	breq	.+10     	; 0x222a <__vector_10+0x70>
    2220:	80 91 5b 03 	lds	r24, 0x035B	; 0x80035b <TxLEDPulse>
    2224:	81 50       	subi	r24, 0x01	; 1
    2226:	80 93 5b 03 	sts	0x035B, r24	; 0x80035b <TxLEDPulse>
    222a:	80 91 5a 03 	lds	r24, 0x035A	; 0x80035a <RxLEDPulse>
    222e:	88 23       	and	r24, r24
    2230:	29 f0       	breq	.+10     	; 0x223c <__vector_10+0x82>
    2232:	80 91 5a 03 	lds	r24, 0x035A	; 0x80035a <RxLEDPulse>
    2236:	81 50       	subi	r24, 0x01	; 1
    2238:	80 93 5a 03 	sts	0x035A, r24	; 0x80035a <RxLEDPulse>
    223c:	c4 ff       	sbrs	r28, 4
    223e:	23 c0       	rjmp	.+70     	; 0x2286 <__vector_10+0xcc>
    2240:	80 91 e2 00 	lds	r24, 0x00E2	; 0x8000e2 <__TEXT_REGION_LENGTH__+0x7e00e2>
    2244:	8e 7e       	andi	r24, 0xEE	; 238
    2246:	81 60       	ori	r24, 0x01	; 1
    2248:	80 93 e2 00 	sts	0x00E2, r24	; 0x8000e2 <__TEXT_REGION_LENGTH__+0x7e00e2>
    224c:	80 91 e1 00 	lds	r24, 0x00E1	; 0x8000e1 <__TEXT_REGION_LENGTH__+0x7e00e1>
    2250:	8f 7e       	andi	r24, 0xEF	; 239
    2252:	80 93 e1 00 	sts	0x00E1, r24	; 0x8000e1 <__TEXT_REGION_LENGTH__+0x7e00e1>
    2256:	80 91 57 03 	lds	r24, 0x0357	; 0x800357 <_usbSuspendState>
    225a:	8e 7e       	andi	r24, 0xEE	; 238
    225c:	80 61       	ori	r24, 0x10	; 16
    225e:	80 93 57 03 	sts	0x0357, r24	; 0x800357 <_usbSuspendState>
    2262:	ff 91       	pop	r31
    2264:	ef 91       	pop	r30
    2266:	cf 91       	pop	r28
    2268:	bf 91       	pop	r27
    226a:	af 91       	pop	r26
    226c:	9f 91       	pop	r25
    226e:	8f 91       	pop	r24
    2270:	7f 91       	pop	r23
    2272:	6f 91       	pop	r22
    2274:	5f 91       	pop	r21
    2276:	4f 91       	pop	r20
    2278:	3f 91       	pop	r19
    227a:	2f 91       	pop	r18
    227c:	0f 90       	pop	r0
    227e:	0f be       	out	0x3f, r0	; 63
    2280:	0f 90       	pop	r0
    2282:	1f 90       	pop	r1
    2284:	18 95       	reti
    2286:	c0 ff       	sbrs	r28, 0
    2288:	ec cf       	rjmp	.-40     	; 0x2262 <__vector_10+0xa8>
    228a:	80 91 e2 00 	lds	r24, 0x00E2	; 0x8000e2 <__TEXT_REGION_LENGTH__+0x7e00e2>
    228e:	8e 7e       	andi	r24, 0xEE	; 238
    2290:	80 61       	ori	r24, 0x10	; 16
    2292:	80 93 e2 00 	sts	0x00E2, r24	; 0x8000e2 <__TEXT_REGION_LENGTH__+0x7e00e2>
    2296:	80 91 e1 00 	lds	r24, 0x00E1	; 0x8000e1 <__TEXT_REGION_LENGTH__+0x7e00e1>
    229a:	8e 7e       	andi	r24, 0xEE	; 238
    229c:	80 93 e1 00 	sts	0x00E1, r24	; 0x8000e1 <__TEXT_REGION_LENGTH__+0x7e00e1>
    22a0:	80 91 57 03 	lds	r24, 0x0357	; 0x800357 <_usbSuspendState>
    22a4:	8e 7e       	andi	r24, 0xEE	; 238
    22a6:	81 60       	ori	r24, 0x01	; 1
    22a8:	da cf       	rjmp	.-76     	; 0x225e <__vector_10+0xa4>

000022aa <USBDevice_::attach()>:
    22aa:	10 92 59 03 	sts	0x0359, r1	; 0x800359 <_usbConfiguration>
    22ae:	10 92 58 03 	sts	0x0358, r1	; 0x800358 <_usbCurrentStatus>
    22b2:	10 92 57 03 	sts	0x0357, r1	; 0x800357 <_usbSuspendState>
    22b6:	0e 94 bc 0d 	call	0x1b78	; 0x1b78 <USB_ClockEnable()>
    22ba:	e1 ee       	ldi	r30, 0xE1	; 225
    22bc:	f0 e0       	ldi	r31, 0x00	; 0
    22be:	80 81       	ld	r24, Z
    22c0:	8e 7e       	andi	r24, 0xEE	; 238
    22c2:	80 83       	st	Z, r24
    22c4:	8d e0       	ldi	r24, 0x0D	; 13
    22c6:	80 93 e2 00 	sts	0x00E2, r24	; 0x8000e2 <__TEXT_REGION_LENGTH__+0x7e00e2>
    22ca:	55 9a       	sbi	0x0a, 5	; 10
    22cc:	20 9a       	sbi	0x04, 0	; 4
    22ce:	08 95       	ret

000022d0 <USBDevice_::wakeupHost()>:
    22d0:	80 91 e0 00 	lds	r24, 0x00E0	; 0x8000e0 <__TEXT_REGION_LENGTH__+0x7e00e0>
    22d4:	8d 7f       	andi	r24, 0xFD	; 253
    22d6:	80 93 e0 00 	sts	0x00E0, r24	; 0x8000e0 <__TEXT_REGION_LENGTH__+0x7e00e0>
    22da:	80 91 e0 00 	lds	r24, 0x00E0	; 0x8000e0 <__TEXT_REGION_LENGTH__+0x7e00e0>
    22de:	81 fd       	sbrc	r24, 1
    22e0:	11 c0       	rjmp	.+34     	; 0x2304 <USBDevice_::wakeupHost()+0x34>
    22e2:	80 91 57 03 	lds	r24, 0x0357	; 0x800357 <_usbSuspendState>
    22e6:	80 ff       	sbrs	r24, 0
    22e8:	0d c0       	rjmp	.+26     	; 0x2304 <USBDevice_::wakeupHost()+0x34>
    22ea:	80 91 58 03 	lds	r24, 0x0358	; 0x800358 <_usbCurrentStatus>
    22ee:	81 ff       	sbrs	r24, 1
    22f0:	09 c0       	rjmp	.+18     	; 0x2304 <USBDevice_::wakeupHost()+0x34>
    22f2:	0e 94 bc 0d 	call	0x1b78	; 0x1b78 <USB_ClockEnable()>
    22f6:	80 91 e0 00 	lds	r24, 0x00E0	; 0x8000e0 <__TEXT_REGION_LENGTH__+0x7e00e0>
    22fa:	82 60       	ori	r24, 0x02	; 2
    22fc:	80 93 e0 00 	sts	0x00E0, r24	; 0x8000e0 <__TEXT_REGION_LENGTH__+0x7e00e0>
    2300:	81 e0       	ldi	r24, 0x01	; 1
    2302:	08 95       	ret
    2304:	80 e0       	ldi	r24, 0x00	; 0
    2306:	08 95       	ret

00002308 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::releaseRawKey(kaleidoscope::Key) [clone .isra.17]>:
    2308:	cf 93       	push	r28
    230a:	c8 2f       	mov	r28, r24
    230c:	88 e5       	ldi	r24, 0x58	; 88
    230e:	92 e0       	ldi	r25, 0x02	; 2
    2310:	0e 94 df 07 	call	0xfbe	; 0xfbe <BootKeyboard_::getProtocol()>
    2314:	6c 2f       	mov	r22, r28
    2316:	81 11       	cpse	r24, r1
    2318:	05 c0       	rjmp	.+10     	; 0x2324 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::releaseRawKey(kaleidoscope::Key) [clone .isra.17]+0x1c>
    231a:	88 e5       	ldi	r24, 0x58	; 88
    231c:	92 e0       	ldi	r25, 0x02	; 2
    231e:	cf 91       	pop	r28
    2320:	0c 94 45 08 	jmp	0x108a	; 0x108a <BootKeyboard_::release(unsigned char)>
    2324:	85 e9       	ldi	r24, 0x95	; 149
    2326:	92 e0       	ldi	r25, 0x02	; 2
    2328:	cf 91       	pop	r28
    232a:	0c 94 ba 09 	jmp	0x1374	; 0x1374 <Keyboard_::release(unsigned char)>

0000232e <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::pressRawKey(kaleidoscope::Key) [clone .isra.14]>:
    232e:	cf 93       	push	r28
    2330:	c8 2f       	mov	r28, r24
    2332:	88 e5       	ldi	r24, 0x58	; 88
    2334:	92 e0       	ldi	r25, 0x02	; 2
    2336:	0e 94 df 07 	call	0xfbe	; 0xfbe <BootKeyboard_::getProtocol()>
    233a:	6c 2f       	mov	r22, r28
    233c:	81 11       	cpse	r24, r1
    233e:	05 c0       	rjmp	.+10     	; 0x234a <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::pressRawKey(kaleidoscope::Key) [clone .isra.14]+0x1c>
    2340:	88 e5       	ldi	r24, 0x58	; 88
    2342:	92 e0       	ldi	r25, 0x02	; 2
    2344:	cf 91       	pop	r28
    2346:	0c 94 1e 08 	jmp	0x103c	; 0x103c <BootKeyboard_::press(unsigned char)>
    234a:	85 e9       	ldi	r24, 0x95	; 149
    234c:	92 e0       	ldi	r25, 0x02	; 2
    234e:	cf 91       	pop	r28
    2350:	0c 94 93 09 	jmp	0x1326	; 0x1326 <Keyboard_::press(unsigned char)>

00002354 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::pressKey(kaleidoscope::Key, bool)>:
    2354:	cf 93       	push	r28
    2356:	df 93       	push	r29
    2358:	fc 01       	movw	r30, r24
    235a:	d6 2f       	mov	r29, r22
    235c:	c7 2f       	mov	r28, r23
    235e:	97 2f       	mov	r25, r23
    2360:	90 7c       	andi	r25, 0xC0	; 192
    2362:	44 23       	and	r20, r20
    2364:	71 f0       	breq	.+28     	; 0x2382 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::pressKey(kaleidoscope::Key, bool)+0x2e>
    2366:	86 81       	ldd	r24, Z+6	; 0x06
    2368:	81 11       	cpse	r24, r1
    236a:	01 c0       	rjmp	.+2      	; 0x236e <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::pressKey(kaleidoscope::Key, bool)+0x1a>
    236c:	14 82       	std	Z+4, r1	; 0x04
    236e:	84 81       	ldd	r24, Z+4	; 0x04
    2370:	8c 2b       	or	r24, r28
    2372:	84 83       	std	Z+4, r24	; 0x04
    2374:	91 11       	cpse	r25, r1
    2376:	04 c0       	rjmp	.+8      	; 0x2380 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::pressKey(kaleidoscope::Key, bool)+0x2c>
    2378:	80 e2       	ldi	r24, 0x20	; 32
    237a:	8d 0f       	add	r24, r29
    237c:	88 30       	cpi	r24, 0x08	; 8
    237e:	18 f0       	brcs	.+6      	; 0x2386 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::pressKey(kaleidoscope::Key, bool)+0x32>
    2380:	d6 83       	std	Z+6, r29	; 0x06
    2382:	91 11       	cpse	r25, r1
    2384:	22 c0       	rjmp	.+68     	; 0x23ca <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::pressKey(kaleidoscope::Key, bool)+0x76>
    2386:	80 e2       	ldi	r24, 0x20	; 32
    2388:	8d 0f       	add	r24, r29
    238a:	88 30       	cpi	r24, 0x08	; 8
    238c:	f0 f4       	brcc	.+60     	; 0x23ca <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::pressKey(kaleidoscope::Key, bool)+0x76>
    238e:	c3 ff       	sbrs	r28, 3
    2390:	03 c0       	rjmp	.+6      	; 0x2398 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::pressKey(kaleidoscope::Key, bool)+0x44>
    2392:	81 ee       	ldi	r24, 0xE1	; 225
    2394:	0e 94 97 11 	call	0x232e	; 0x232e <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::pressRawKey(kaleidoscope::Key) [clone .isra.14]>
    2398:	c0 ff       	sbrs	r28, 0
    239a:	03 c0       	rjmp	.+6      	; 0x23a2 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::pressKey(kaleidoscope::Key, bool)+0x4e>
    239c:	80 ee       	ldi	r24, 0xE0	; 224
    239e:	0e 94 97 11 	call	0x232e	; 0x232e <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::pressRawKey(kaleidoscope::Key) [clone .isra.14]>
    23a2:	c1 ff       	sbrs	r28, 1
    23a4:	03 c0       	rjmp	.+6      	; 0x23ac <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::pressKey(kaleidoscope::Key, bool)+0x58>
    23a6:	82 ee       	ldi	r24, 0xE2	; 226
    23a8:	0e 94 97 11 	call	0x232e	; 0x232e <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::pressRawKey(kaleidoscope::Key) [clone .isra.14]>
    23ac:	c2 ff       	sbrs	r28, 2
    23ae:	03 c0       	rjmp	.+6      	; 0x23b6 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::pressKey(kaleidoscope::Key, bool)+0x62>
    23b0:	86 ee       	ldi	r24, 0xE6	; 230
    23b2:	0e 94 97 11 	call	0x232e	; 0x232e <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::pressRawKey(kaleidoscope::Key) [clone .isra.14]>
    23b6:	c4 ff       	sbrs	r28, 4
    23b8:	03 c0       	rjmp	.+6      	; 0x23c0 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::pressKey(kaleidoscope::Key, bool)+0x6c>
    23ba:	83 ee       	ldi	r24, 0xE3	; 227
    23bc:	0e 94 97 11 	call	0x232e	; 0x232e <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::pressRawKey(kaleidoscope::Key) [clone .isra.14]>
    23c0:	8d 2f       	mov	r24, r29
    23c2:	df 91       	pop	r29
    23c4:	cf 91       	pop	r28
    23c6:	0c 94 97 11 	jmp	0x232e	; 0x232e <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::pressRawKey(kaleidoscope::Key) [clone .isra.14]>
    23ca:	85 81       	ldd	r24, Z+5	; 0x05
    23cc:	c8 2b       	or	r28, r24
    23ce:	c5 83       	std	Z+5, r28	; 0x05
    23d0:	f7 cf       	rjmp	.-18     	; 0x23c0 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::pressKey(kaleidoscope::Key, bool)+0x6c>

000023d2 <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)>:
    23d2:	ff 92       	push	r15
    23d4:	0f 93       	push	r16
    23d6:	1f 93       	push	r17
    23d8:	cf 93       	push	r28
    23da:	df 93       	push	r29
    23dc:	00 d0       	rcall	.+0      	; 0x23de <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0xc>
    23de:	cd b7       	in	r28, 0x3d	; 61
    23e0:	de b7       	in	r29, 0x3e	; 62
    23e2:	9a 83       	std	Y+2, r25	; 0x02
    23e4:	89 83       	std	Y+1, r24	; 0x01
    23e6:	16 2f       	mov	r17, r22
    23e8:	04 2f       	mov	r16, r20
    23ea:	60 33       	cpi	r22, 0x30	; 48
    23ec:	08 f0       	brcs	.+2      	; 0x23f0 <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x1e>
    23ee:	4d c0       	rjmp	.+154    	; 0x248a <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0xb8>
    23f0:	84 2f       	mov	r24, r20
    23f2:	82 70       	andi	r24, 0x02	; 2
    23f4:	f8 2e       	mov	r15, r24
    23f6:	41 ff       	sbrs	r20, 1
    23f8:	0b c0       	rjmp	.+22     	; 0x2410 <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x3e>
    23fa:	40 fd       	sbrc	r20, 0
    23fc:	09 c0       	rjmp	.+18     	; 0x2410 <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x3e>
    23fe:	89 81       	ldd	r24, Y+1	; 0x01
    2400:	81 11       	cpse	r24, r1
    2402:	83 c0       	rjmp	.+262    	; 0x250a <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x138>
    2404:	9a 81       	ldd	r25, Y+2	; 0x02
    2406:	91 11       	cpse	r25, r1
    2408:	80 c0       	rjmp	.+256    	; 0x250a <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x138>
    240a:	81 2f       	mov	r24, r17
    240c:	0e 94 2a 05 	call	0xa54	; 0xa54 <kaleidoscope::Layer_::updateLiveCompositeKeymap(kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>)>
    2410:	81 2f       	mov	r24, r17
    2412:	6c e0       	ldi	r22, 0x0C	; 12
    2414:	0e 94 5d 14 	call	0x28ba	; 0x28ba <__udivmodqi4>
    2418:	49 2f       	mov	r20, r25
    241a:	e8 2f       	mov	r30, r24
    241c:	f0 e0       	ldi	r31, 0x00	; 0
    241e:	ee 0f       	add	r30, r30
    2420:	ff 1f       	adc	r31, r31
    2422:	e6 5d       	subi	r30, 0xD6	; 214
    2424:	fd 4f       	sbci	r31, 0xFD	; 253
    2426:	20 81       	ld	r18, Z
    2428:	31 81       	ldd	r19, Z+1	; 0x01
    242a:	c9 01       	movw	r24, r18
    242c:	04 2e       	mov	r0, r20
    242e:	02 c0       	rjmp	.+4      	; 0x2434 <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x62>
    2430:	96 95       	lsr	r25
    2432:	87 95       	ror	r24
    2434:	0a 94       	dec	r0
    2436:	e2 f7       	brpl	.-8      	; 0x2430 <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x5e>
    2438:	80 ff       	sbrs	r24, 0
    243a:	17 c0       	rjmp	.+46     	; 0x246a <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x98>
    243c:	00 ff       	sbrs	r16, 0
    243e:	5d c0       	rjmp	.+186    	; 0x24fa <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x128>
    2440:	f1 10       	cpse	r15, r1
    2442:	5b c0       	rjmp	.+182    	; 0x24fa <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x128>
    2444:	81 e0       	ldi	r24, 0x01	; 1
    2446:	90 e0       	ldi	r25, 0x00	; 0
    2448:	a0 e0       	ldi	r26, 0x00	; 0
    244a:	b0 e0       	ldi	r27, 0x00	; 0
    244c:	04 c0       	rjmp	.+8      	; 0x2456 <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x84>
    244e:	88 0f       	add	r24, r24
    2450:	99 1f       	adc	r25, r25
    2452:	aa 1f       	adc	r26, r26
    2454:	bb 1f       	adc	r27, r27
    2456:	4a 95       	dec	r20
    2458:	d2 f7       	brpl	.-12     	; 0x244e <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x7c>
    245a:	80 95       	com	r24
    245c:	90 95       	com	r25
    245e:	a0 95       	com	r26
    2460:	b0 95       	com	r27
    2462:	82 23       	and	r24, r18
    2464:	93 23       	and	r25, r19
    2466:	91 83       	std	Z+1, r25	; 0x01
    2468:	80 83       	st	Z, r24
    246a:	89 81       	ldd	r24, Y+1	; 0x01
    246c:	81 11       	cpse	r24, r1
    246e:	0d c0       	rjmp	.+26     	; 0x248a <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0xb8>
    2470:	8a 81       	ldd	r24, Y+2	; 0x02
    2472:	81 11       	cpse	r24, r1
    2474:	0a c0       	rjmp	.+20     	; 0x248a <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0xb8>
    2476:	e1 2f       	mov	r30, r17
    2478:	f0 e0       	ldi	r31, 0x00	; 0
    247a:	ee 0f       	add	r30, r30
    247c:	ff 1f       	adc	r31, r31
    247e:	eb 56       	subi	r30, 0x6B	; 107
    2480:	fe 4f       	sbci	r31, 0xFE	; 254
    2482:	81 81       	ldd	r24, Z+1	; 0x01
    2484:	90 81       	ld	r25, Z
    2486:	99 83       	std	Y+1, r25	; 0x01
    2488:	8a 83       	std	Y+2, r24	; 0x02
    248a:	40 2f       	mov	r20, r16
    248c:	61 2f       	mov	r22, r17
    248e:	ce 01       	movw	r24, r28
    2490:	01 96       	adiw	r24, 0x01	; 1
    2492:	0e 94 6e 01 	call	0x2dc	; 0x2dc <kaleidoscope::Hooks::onKeyswitchEvent(kaleidoscope::Key&, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)>
    2496:	89 2b       	or	r24, r25
    2498:	81 f5       	brne	.+96     	; 0x24fa <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x128>
    249a:	81 2f       	mov	r24, r17
    249c:	6c e0       	ldi	r22, 0x0C	; 12
    249e:	0e 94 5d 14 	call	0x28ba	; 0x28ba <__udivmodqi4>
    24a2:	20 2f       	mov	r18, r16
    24a4:	49 2f       	mov	r20, r25
    24a6:	68 2f       	mov	r22, r24
    24a8:	ce 01       	movw	r24, r28
    24aa:	01 96       	adiw	r24, 0x01	; 1
    24ac:	0e 94 6b 01 	call	0x2d6	; 0x2d6 <kaleidoscope::Hooks::onKeyswitchEvent(kaleidoscope::Key&, unsigned char, unsigned char, unsigned char)>
    24b0:	89 2b       	or	r24, r25
    24b2:	19 f5       	brne	.+70     	; 0x24fa <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x128>
    24b4:	40 2f       	mov	r20, r16
    24b6:	61 2f       	mov	r22, r17
    24b8:	89 81       	ldd	r24, Y+1	; 0x01
    24ba:	9a 81       	ldd	r25, Y+2	; 0x02
    24bc:	0e 94 9c 06 	call	0xd38	; 0xd38 <kaleidoscope::Layer_::eventHandler(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)>
    24c0:	89 83       	std	Y+1, r24	; 0x01
    24c2:	9a 83       	std	Y+2, r25	; 0x02
    24c4:	f8 2e       	mov	r15, r24
    24c6:	81 11       	cpse	r24, r1
    24c8:	02 c0       	rjmp	.+4      	; 0x24ce <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0xfc>
    24ca:	99 23       	and	r25, r25
    24cc:	b1 f0       	breq	.+44     	; 0x24fa <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x128>
    24ce:	69 81       	ldd	r22, Y+1	; 0x01
    24d0:	7a 81       	ldd	r23, Y+2	; 0x02
    24d2:	1a 81       	ldd	r17, Y+2	; 0x02
    24d4:	16 ff       	sbrs	r17, 6
    24d6:	33 c0       	rjmp	.+102    	; 0x253e <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x16c>
    24d8:	17 fd       	sbrc	r17, 7
    24da:	0f c0       	rjmp	.+30     	; 0x24fa <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x128>
    24dc:	13 ff       	sbrs	r17, 3
    24de:	21 c0       	rjmp	.+66     	; 0x2522 <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x150>
    24e0:	01 ff       	sbrs	r16, 1
    24e2:	0b c0       	rjmp	.+22     	; 0x24fa <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x128>
    24e4:	61 2f       	mov	r22, r17
    24e6:	70 e0       	ldi	r23, 0x00	; 0
    24e8:	76 2f       	mov	r23, r22
    24ea:	66 27       	eor	r22, r22
    24ec:	6f 0d       	add	r22, r15
    24ee:	71 1d       	adc	r23, r1
    24f0:	73 70       	andi	r23, 0x03	; 3
    24f2:	87 e7       	ldi	r24, 0x77	; 119
    24f4:	92 e0       	ldi	r25, 0x02	; 2
    24f6:	0e 94 b5 08 	call	0x116a	; 0x116a <ConsumerControl_::press(unsigned int)>
    24fa:	0f 90       	pop	r0
    24fc:	0f 90       	pop	r0
    24fe:	df 91       	pop	r29
    2500:	cf 91       	pop	r28
    2502:	1f 91       	pop	r17
    2504:	0f 91       	pop	r16
    2506:	ff 90       	pop	r15
    2508:	08 95       	ret
    250a:	06 fd       	sbrc	r16, 6
    250c:	7e cf       	rjmp	.-260    	; 0x240a <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x38>
    250e:	9a 81       	ldd	r25, Y+2	; 0x02
    2510:	e1 2f       	mov	r30, r17
    2512:	f0 e0       	ldi	r31, 0x00	; 0
    2514:	ee 0f       	add	r30, r30
    2516:	ff 1f       	adc	r31, r31
    2518:	eb 56       	subi	r30, 0x6B	; 107
    251a:	fe 4f       	sbci	r31, 0xFE	; 254
    251c:	80 83       	st	Z, r24
    251e:	91 83       	std	Z+1, r25	; 0x01
    2520:	77 cf       	rjmp	.-274    	; 0x2410 <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x3e>
    2522:	10 ff       	sbrs	r17, 0
    2524:	ea cf       	rjmp	.-44     	; 0x24fa <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x128>
    2526:	80 2f       	mov	r24, r16
    2528:	81 70       	andi	r24, 0x01	; 1
    252a:	01 ff       	sbrs	r16, 1
    252c:	4c c0       	rjmp	.+152    	; 0x25c6 <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x1f4>
    252e:	81 11       	cpse	r24, r1
    2530:	e4 cf       	rjmp	.-56     	; 0x24fa <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x128>
    2532:	6f 2d       	mov	r22, r15
    2534:	8d ed       	ldi	r24, 0xDD	; 221
    2536:	92 e0       	ldi	r25, 0x02	; 2
    2538:	0e 94 3a 0a 	call	0x1474	; 0x1474 <SystemControl_::press(unsigned char)>
    253c:	de cf       	rjmp	.-68     	; 0x24fa <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x128>
    253e:	80 2f       	mov	r24, r16
    2540:	81 70       	andi	r24, 0x01	; 1
    2542:	01 ff       	sbrs	r16, 1
    2544:	08 c0       	rjmp	.+16     	; 0x2556 <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x184>
    2546:	41 e0       	ldi	r20, 0x01	; 1
    2548:	81 11       	cpse	r24, r1
    254a:	40 e0       	ldi	r20, 0x00	; 0
    254c:	8a e4       	ldi	r24, 0x4A	; 74
    254e:	92 e0       	ldi	r25, 0x02	; 2
    2550:	0e 94 aa 11 	call	0x2354	; 0x2354 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::pressKey(kaleidoscope::Key, bool)>
    2554:	d2 cf       	rjmp	.-92     	; 0x24fa <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x128>
    2556:	88 23       	and	r24, r24
    2558:	81 f2       	breq	.-96     	; 0x24fa <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x128>
    255a:	07 ff       	sbrs	r16, 7
    255c:	ce cf       	rjmp	.-100    	; 0x24fa <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x128>
    255e:	80 91 4e 02 	lds	r24, 0x024E	; 0x80024e <kaleidoscope_internal::device+0x4>
    2562:	81 27       	eor	r24, r17
    2564:	80 93 4e 02 	sts	0x024E, r24	; 0x80024e <kaleidoscope_internal::device+0x4>
    2568:	81 2f       	mov	r24, r17
    256a:	80 7c       	andi	r24, 0xC0	; 192
    256c:	21 f4       	brne	.+8      	; 0x2576 <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x1a4>
    256e:	80 e2       	ldi	r24, 0x20	; 32
    2570:	8f 0d       	add	r24, r15
    2572:	88 30       	cpi	r24, 0x08	; 8
    2574:	58 f0       	brcs	.+22     	; 0x258c <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x1ba>
    2576:	80 91 50 02 	lds	r24, 0x0250	; 0x800250 <kaleidoscope_internal::device+0x6>
    257a:	f8 12       	cpse	r15, r24
    257c:	02 c0       	rjmp	.+4      	; 0x2582 <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x1b0>
    257e:	10 92 50 02 	sts	0x0250, r1	; 0x800250 <kaleidoscope_internal::device+0x6>
    2582:	80 91 4f 02 	lds	r24, 0x024F	; 0x80024f <kaleidoscope_internal::device+0x5>
    2586:	81 27       	eor	r24, r17
    2588:	80 93 4f 02 	sts	0x024F, r24	; 0x80024f <kaleidoscope_internal::device+0x5>
    258c:	13 ff       	sbrs	r17, 3
    258e:	03 c0       	rjmp	.+6      	; 0x2596 <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x1c4>
    2590:	81 ee       	ldi	r24, 0xE1	; 225
    2592:	0e 94 84 11 	call	0x2308	; 0x2308 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::releaseRawKey(kaleidoscope::Key) [clone .isra.17]>
    2596:	10 ff       	sbrs	r17, 0
    2598:	03 c0       	rjmp	.+6      	; 0x25a0 <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x1ce>
    259a:	80 ee       	ldi	r24, 0xE0	; 224
    259c:	0e 94 84 11 	call	0x2308	; 0x2308 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::releaseRawKey(kaleidoscope::Key) [clone .isra.17]>
    25a0:	11 ff       	sbrs	r17, 1
    25a2:	03 c0       	rjmp	.+6      	; 0x25aa <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x1d8>
    25a4:	82 ee       	ldi	r24, 0xE2	; 226
    25a6:	0e 94 84 11 	call	0x2308	; 0x2308 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::releaseRawKey(kaleidoscope::Key) [clone .isra.17]>
    25aa:	12 ff       	sbrs	r17, 2
    25ac:	03 c0       	rjmp	.+6      	; 0x25b4 <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x1e2>
    25ae:	86 ee       	ldi	r24, 0xE6	; 230
    25b0:	0e 94 84 11 	call	0x2308	; 0x2308 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::releaseRawKey(kaleidoscope::Key) [clone .isra.17]>
    25b4:	14 ff       	sbrs	r17, 4
    25b6:	03 c0       	rjmp	.+6      	; 0x25be <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x1ec>
    25b8:	83 ee       	ldi	r24, 0xE3	; 227
    25ba:	0e 94 84 11 	call	0x2308	; 0x2308 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::releaseRawKey(kaleidoscope::Key) [clone .isra.17]>
    25be:	8f 2d       	mov	r24, r15
    25c0:	0e 94 84 11 	call	0x2308	; 0x2308 <kaleidoscope::driver::hid::base::Keyboard<kaleidoscope::driver::hid::keyboardio::KeyboardProps>::releaseRawKey(kaleidoscope::Key) [clone .isra.17]>
    25c4:	9a cf       	rjmp	.-204    	; 0x24fa <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x128>
    25c6:	88 23       	and	r24, r24
    25c8:	09 f4       	brne	.+2      	; 0x25cc <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x1fa>
    25ca:	97 cf       	rjmp	.-210    	; 0x24fa <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x128>
    25cc:	8d ed       	ldi	r24, 0xDD	; 221
    25ce:	92 e0       	ldi	r25, 0x02	; 2
    25d0:	0e 94 38 0a 	call	0x1470	; 0x1470 <SystemControl_::release()>
    25d4:	92 cf       	rjmp	.-220    	; 0x24fa <handleKeyswitchEvent(kaleidoscope::Key, kaleidoscope::MatrixAddr<(unsigned char)4, (unsigned char)12>, unsigned char)+0x128>

000025d6 <HID_::getInterface(unsigned char*)>:
    25d6:	cf 93       	push	r28
    25d8:	df 93       	push	r29
    25da:	cd b7       	in	r28, 0x3d	; 61
    25dc:	de b7       	in	r29, 0x3e	; 62
    25de:	69 97       	sbiw	r28, 0x19	; 25
    25e0:	0f b6       	in	r0, 0x3f	; 63
    25e2:	f8 94       	cli
    25e4:	de bf       	out	0x3e, r29	; 62
    25e6:	0f be       	out	0x3f, r0	; 63
    25e8:	cd bf       	out	0x3d, r28	; 61
    25ea:	fc 01       	movw	r30, r24
    25ec:	db 01       	movw	r26, r22
    25ee:	8c 91       	ld	r24, X
    25f0:	8f 5f       	subi	r24, 0xFF	; 255
    25f2:	8c 93       	st	X, r24
    25f4:	9e 01       	movw	r18, r28
    25f6:	2d 5f       	subi	r18, 0xFD	; 253
    25f8:	3f 4f       	sbci	r19, 0xFF	; 255
    25fa:	8d e0       	ldi	r24, 0x0D	; 13
    25fc:	d9 01       	movw	r26, r18
    25fe:	1d 92       	st	X+, r1
    2600:	8a 95       	dec	r24
    2602:	e9 f7       	brne	.-6      	; 0x25fe <HID_::getInterface(unsigned char*)+0x28>
    2604:	29 e0       	ldi	r18, 0x09	; 9
    2606:	29 83       	std	Y+1, r18	; 0x01
    2608:	84 e0       	ldi	r24, 0x04	; 4
    260a:	8a 83       	std	Y+2, r24	; 0x02
    260c:	91 e0       	ldi	r25, 0x01	; 1
    260e:	9d 83       	std	Y+5, r25	; 0x05
    2610:	83 e0       	ldi	r24, 0x03	; 3
    2612:	8e 83       	std	Y+6, r24	; 0x06
    2614:	2a 87       	std	Y+10, r18	; 0x0a
    2616:	21 e2       	ldi	r18, 0x21	; 33
    2618:	2b 87       	std	Y+11, r18	; 0x0b
    261a:	9c 87       	std	Y+12, r25	; 0x0c
    261c:	9d 87       	std	Y+13, r25	; 0x0d
    261e:	9f 87       	std	Y+15, r25	; 0x0f
    2620:	22 e2       	ldi	r18, 0x22	; 34
    2622:	28 8b       	std	Y+16, r18	; 0x10
    2624:	27 e0       	ldi	r18, 0x07	; 7
    2626:	2b 8b       	std	Y+19, r18	; 0x13
    2628:	25 e0       	ldi	r18, 0x05	; 5
    262a:	2c 8b       	std	Y+20, r18	; 0x14
    262c:	8e 8b       	std	Y+22, r24	; 0x16
    262e:	20 e4       	ldi	r18, 0x40	; 64
    2630:	30 e0       	ldi	r19, 0x00	; 0
    2632:	38 8f       	std	Y+24, r19	; 0x18
    2634:	2f 8b       	std	Y+23, r18	; 0x17
    2636:	99 8f       	std	Y+25, r25	; 0x19
    2638:	82 81       	ldd	r24, Z+2	; 0x02
    263a:	8b 83       	std	Y+3, r24	; 0x03
    263c:	95 85       	ldd	r25, Z+13	; 0x0d
    263e:	86 85       	ldd	r24, Z+14	; 0x0e
    2640:	99 8b       	std	Y+17, r25	; 0x11
    2642:	8a 8b       	std	Y+18, r24	; 0x12
    2644:	83 81       	ldd	r24, Z+3	; 0x03
    2646:	80 68       	ori	r24, 0x80	; 128
    2648:	8d 8b       	std	Y+21, r24	; 0x15
    264a:	49 e1       	ldi	r20, 0x19	; 25
    264c:	50 e0       	ldi	r21, 0x00	; 0
    264e:	be 01       	movw	r22, r28
    2650:	6f 5f       	subi	r22, 0xFF	; 255
    2652:	7f 4f       	sbci	r23, 0xFF	; 255
    2654:	80 e0       	ldi	r24, 0x00	; 0
    2656:	0e 94 2f 0f 	call	0x1e5e	; 0x1e5e <USB_SendControl(unsigned char, void const*, int)>
    265a:	69 96       	adiw	r28, 0x19	; 25
    265c:	0f b6       	in	r0, 0x3f	; 63
    265e:	f8 94       	cli
    2660:	de bf       	out	0x3e, r29	; 62
    2662:	0f be       	out	0x3f, r0	; 63
    2664:	cd bf       	out	0x3d, r28	; 61
    2666:	df 91       	pop	r29
    2668:	cf 91       	pop	r28
    266a:	08 95       	ret

0000266c <HID_::getDescriptor(USBSetup&)>:
    266c:	ef 92       	push	r14
    266e:	ff 92       	push	r15
    2670:	0f 93       	push	r16
    2672:	1f 93       	push	r17
    2674:	cf 93       	push	r28
    2676:	df 93       	push	r29
    2678:	fb 01       	movw	r30, r22
    267a:	20 81       	ld	r18, Z
    267c:	21 38       	cpi	r18, 0x81	; 129
    267e:	a1 f5       	brne	.+104    	; 0x26e8 <HID_::getDescriptor(USBSetup&)+0x7c>
    2680:	23 81       	ldd	r18, Z+3	; 0x03
    2682:	22 32       	cpi	r18, 0x22	; 34
    2684:	89 f5       	brne	.+98     	; 0x26e8 <HID_::getDescriptor(USBSetup&)+0x7c>
    2686:	dc 01       	movw	r26, r24
    2688:	12 96       	adiw	r26, 0x02	; 2
    268a:	4c 91       	ld	r20, X
    268c:	24 81       	ldd	r18, Z+4	; 0x04
    268e:	35 81       	ldd	r19, Z+5	; 0x05
    2690:	42 17       	cp	r20, r18
    2692:	13 06       	cpc	r1, r19
    2694:	49 f5       	brne	.+82     	; 0x26e8 <HID_::getDescriptor(USBSetup&)+0x7c>
    2696:	ec 01       	movw	r28, r24
    2698:	81 e0       	ldi	r24, 0x01	; 1
    269a:	0e 94 5b 14 	call	0x28b6	; 0x28b6 <USB_PackMessages(bool)>
    269e:	0b 85       	ldd	r16, Y+11	; 0x0b
    26a0:	1c 85       	ldd	r17, Y+12	; 0x0c
    26a2:	f1 2c       	mov	r15, r1
    26a4:	e1 2c       	mov	r14, r1
    26a6:	01 15       	cp	r16, r1
    26a8:	11 05       	cpc	r17, r1
    26aa:	89 f0       	breq	.+34     	; 0x26ce <HID_::getDescriptor(USBSetup&)+0x62>
    26ac:	f8 01       	movw	r30, r16
    26ae:	44 81       	ldd	r20, Z+4	; 0x04
    26b0:	55 81       	ldd	r21, Z+5	; 0x05
    26b2:	62 81       	ldd	r22, Z+2	; 0x02
    26b4:	73 81       	ldd	r23, Z+3	; 0x03
    26b6:	80 e8       	ldi	r24, 0x80	; 128
    26b8:	0e 94 2f 0f 	call	0x1e5e	; 0x1e5e <USB_SendControl(unsigned char, void const*, int)>
    26bc:	8f 3f       	cpi	r24, 0xFF	; 255
    26be:	98 07       	cpc	r25, r24
    26c0:	61 f0       	breq	.+24     	; 0x26da <HID_::getDescriptor(USBSetup&)+0x6e>
    26c2:	e8 0e       	add	r14, r24
    26c4:	f9 1e       	adc	r15, r25
    26c6:	d8 01       	movw	r26, r16
    26c8:	0d 91       	ld	r16, X+
    26ca:	1c 91       	ld	r17, X
    26cc:	ec cf       	rjmp	.-40     	; 0x26a6 <HID_::getDescriptor(USBSetup&)+0x3a>
    26ce:	81 e0       	ldi	r24, 0x01	; 1
    26d0:	8f 87       	std	Y+15, r24	; 0x0f
    26d2:	80 e0       	ldi	r24, 0x00	; 0
    26d4:	0e 94 5b 14 	call	0x28b6	; 0x28b6 <USB_PackMessages(bool)>
    26d8:	c7 01       	movw	r24, r14
    26da:	df 91       	pop	r29
    26dc:	cf 91       	pop	r28
    26de:	1f 91       	pop	r17
    26e0:	0f 91       	pop	r16
    26e2:	ff 90       	pop	r15
    26e4:	ef 90       	pop	r14
    26e6:	08 95       	ret
    26e8:	90 e0       	ldi	r25, 0x00	; 0
    26ea:	80 e0       	ldi	r24, 0x00	; 0
    26ec:	f6 cf       	rjmp	.-20     	; 0x26da <HID_::getDescriptor(USBSetup&)+0x6e>

000026ee <HID_::setup(USBSetup&)>:
    26ee:	cf 93       	push	r28
    26f0:	df 93       	push	r29
    26f2:	ec 01       	movw	r28, r24
    26f4:	db 01       	movw	r26, r22
    26f6:	2a 81       	ldd	r18, Y+2	; 0x02
    26f8:	14 96       	adiw	r26, 0x04	; 4
    26fa:	8d 91       	ld	r24, X+
    26fc:	9c 91       	ld	r25, X
    26fe:	15 97       	sbiw	r26, 0x05	; 5
    2700:	28 17       	cp	r18, r24
    2702:	19 06       	cpc	r1, r25
    2704:	59 f4       	brne	.+22     	; 0x271c <HID_::setup(USBSetup&)+0x2e>
    2706:	11 96       	adiw	r26, 0x01	; 1
    2708:	8c 91       	ld	r24, X
    270a:	11 97       	sbiw	r26, 0x01	; 1
    270c:	9c 91       	ld	r25, X
    270e:	91 3a       	cpi	r25, 0xA1	; 161
    2710:	39 f4       	brne	.+14     	; 0x2720 <HID_::setup(USBSetup&)+0x32>
    2712:	98 2f       	mov	r25, r24
    2714:	9d 7f       	andi	r25, 0xFD	; 253
    2716:	81 e0       	ldi	r24, 0x01	; 1
    2718:	91 30       	cpi	r25, 0x01	; 1
    271a:	51 f0       	breq	.+20     	; 0x2730 <HID_::setup(USBSetup&)+0x42>
    271c:	80 e0       	ldi	r24, 0x00	; 0
    271e:	08 c0       	rjmp	.+16     	; 0x2730 <HID_::setup(USBSetup&)+0x42>
    2720:	91 32       	cpi	r25, 0x21	; 33
    2722:	e1 f7       	brne	.-8      	; 0x271c <HID_::setup(USBSetup&)+0x2e>
    2724:	8b 30       	cpi	r24, 0x0B	; 11
    2726:	39 f4       	brne	.+14     	; 0x2736 <HID_::setup(USBSetup&)+0x48>
    2728:	12 96       	adiw	r26, 0x02	; 2
    272a:	8c 91       	ld	r24, X
    272c:	8f 87       	std	Y+15, r24	; 0x0f
    272e:	81 e0       	ldi	r24, 0x01	; 1
    2730:	df 91       	pop	r29
    2732:	cf 91       	pop	r28
    2734:	08 95       	ret
    2736:	8a 30       	cpi	r24, 0x0A	; 10
    2738:	21 f4       	brne	.+8      	; 0x2742 <HID_::setup(USBSetup&)+0x54>
    273a:	12 96       	adiw	r26, 0x02	; 2
    273c:	8c 91       	ld	r24, X
    273e:	88 8b       	std	Y+16, r24	; 0x10
    2740:	f6 cf       	rjmp	.-20     	; 0x272e <HID_::setup(USBSetup&)+0x40>
    2742:	89 30       	cpi	r24, 0x09	; 9
    2744:	59 f7       	brne	.-42     	; 0x271c <HID_::setup(USBSetup&)+0x2e>
    2746:	16 96       	adiw	r26, 0x06	; 6
    2748:	8d 91       	ld	r24, X+
    274a:	9c 91       	ld	r25, X
    274c:	82 30       	cpi	r24, 0x02	; 2
    274e:	91 05       	cpc	r25, r1
    2750:	39 f4       	brne	.+14     	; 0x2760 <HID_::setup(USBSetup&)+0x72>
    2752:	62 e0       	ldi	r22, 0x02	; 2
    2754:	70 e0       	ldi	r23, 0x00	; 0
    2756:	ce 01       	movw	r24, r28
    2758:	41 96       	adiw	r24, 0x11	; 17
    275a:	0e 94 55 0f 	call	0x1eaa	; 0x1eaa <USB_RecvControl(void*, int)>
    275e:	de cf       	rjmp	.-68     	; 0x271c <HID_::setup(USBSetup&)+0x2e>
    2760:	01 97       	sbiw	r24, 0x01	; 1
    2762:	e1 f6       	brne	.-72     	; 0x271c <HID_::setup(USBSetup&)+0x2e>
    2764:	61 e0       	ldi	r22, 0x01	; 1
    2766:	70 e0       	ldi	r23, 0x00	; 0
    2768:	ce 01       	movw	r24, r28
    276a:	42 96       	adiw	r24, 0x12	; 18
    276c:	0e 94 55 0f 	call	0x1eaa	; 0x1eaa <USB_RecvControl(void*, int)>
    2770:	19 8a       	std	Y+17, r1	; 0x11
    2772:	d4 cf       	rjmp	.-88     	; 0x271c <HID_::setup(USBSetup&)+0x2e>

00002774 <HID_::AppendDescriptor(HIDSubDescriptor*)>:
    2774:	fc 01       	movw	r30, r24
    2776:	a3 85       	ldd	r26, Z+11	; 0x0b
    2778:	b4 85       	ldd	r27, Z+12	; 0x0c
    277a:	10 97       	sbiw	r26, 0x00	; 0
    277c:	71 f4       	brne	.+28     	; 0x279a <HID_::AppendDescriptor(HIDSubDescriptor*)+0x26>
    277e:	74 87       	std	Z+12, r23	; 0x0c
    2780:	63 87       	std	Z+11, r22	; 0x0b
    2782:	85 85       	ldd	r24, Z+13	; 0x0d
    2784:	96 85       	ldd	r25, Z+14	; 0x0e
    2786:	db 01       	movw	r26, r22
    2788:	14 96       	adiw	r26, 0x04	; 4
    278a:	2d 91       	ld	r18, X+
    278c:	3c 91       	ld	r19, X
    278e:	82 0f       	add	r24, r18
    2790:	93 1f       	adc	r25, r19
    2792:	96 87       	std	Z+14, r25	; 0x0e
    2794:	85 87       	std	Z+13, r24	; 0x0d
    2796:	08 95       	ret
    2798:	dc 01       	movw	r26, r24
    279a:	8d 91       	ld	r24, X+
    279c:	9c 91       	ld	r25, X
    279e:	11 97       	sbiw	r26, 0x01	; 1
    27a0:	00 97       	sbiw	r24, 0x00	; 0
    27a2:	d1 f7       	brne	.-12     	; 0x2798 <HID_::AppendDescriptor(HIDSubDescriptor*)+0x24>
    27a4:	6d 93       	st	X+, r22
    27a6:	7c 93       	st	X, r23
    27a8:	ec cf       	rjmp	.-40     	; 0x2782 <HID_::AppendDescriptor(HIDSubDescriptor*)+0xe>

000027aa <HID_::SendReport_(unsigned char, void const*, int)>:
    27aa:	af 92       	push	r10
    27ac:	bf 92       	push	r11
    27ae:	cf 92       	push	r12
    27b0:	df 92       	push	r13
    27b2:	ef 92       	push	r14
    27b4:	ff 92       	push	r15
    27b6:	0f 93       	push	r16
    27b8:	1f 93       	push	r17
    27ba:	cf 93       	push	r28
    27bc:	df 93       	push	r29
    27be:	1f 92       	push	r1
    27c0:	cd b7       	in	r28, 0x3d	; 61
    27c2:	de b7       	in	r29, 0x3e	; 62
    27c4:	7c 01       	movw	r14, r24
    27c6:	69 83       	std	Y+1, r22	; 0x01
    27c8:	6a 01       	movw	r12, r20
    27ca:	59 01       	movw	r10, r18
    27cc:	41 e0       	ldi	r20, 0x01	; 1
    27ce:	50 e0       	ldi	r21, 0x00	; 0
    27d0:	be 01       	movw	r22, r28
    27d2:	6f 5f       	subi	r22, 0xFF	; 255
    27d4:	7f 4f       	sbci	r23, 0xFF	; 255
    27d6:	fc 01       	movw	r30, r24
    27d8:	83 81       	ldd	r24, Z+3	; 0x03
    27da:	0e 94 7e 0e 	call	0x1cfc	; 0x1cfc <USB_Send(unsigned char, void const*, int)>
    27de:	8c 01       	movw	r16, r24
    27e0:	97 fd       	sbrc	r25, 7
    27e2:	0b c0       	rjmp	.+22     	; 0x27fa <HID_::SendReport_(unsigned char, void const*, int)+0x50>
    27e4:	f7 01       	movw	r30, r14
    27e6:	83 81       	ldd	r24, Z+3	; 0x03
    27e8:	a5 01       	movw	r20, r10
    27ea:	b6 01       	movw	r22, r12
    27ec:	80 64       	ori	r24, 0x40	; 64
    27ee:	0e 94 7e 0e 	call	0x1cfc	; 0x1cfc <USB_Send(unsigned char, void const*, int)>
    27f2:	08 0f       	add	r16, r24
    27f4:	19 1f       	adc	r17, r25
    27f6:	97 fd       	sbrc	r25, 7
    27f8:	8c 01       	movw	r16, r24
    27fa:	c8 01       	movw	r24, r16
    27fc:	0f 90       	pop	r0
    27fe:	df 91       	pop	r29
    2800:	cf 91       	pop	r28
    2802:	1f 91       	pop	r17
    2804:	0f 91       	pop	r16
    2806:	ff 90       	pop	r15
    2808:	ef 90       	pop	r14
    280a:	df 90       	pop	r13
    280c:	cf 90       	pop	r12
    280e:	bf 90       	pop	r11
    2810:	af 90       	pop	r10
    2812:	08 95       	ret

00002814 <HID_::SendReport(unsigned char, void const*, int)>:
    2814:	cf 92       	push	r12
    2816:	df 92       	push	r13
    2818:	ef 92       	push	r14
    281a:	ff 92       	push	r15
    281c:	1f 93       	push	r17
    281e:	cf 93       	push	r28
    2820:	df 93       	push	r29
    2822:	16 2f       	mov	r17, r22
    2824:	7a 01       	movw	r14, r20
    2826:	69 01       	movw	r12, r18
    2828:	0e 94 d5 13 	call	0x27aa	; 0x27aa <HID_::SendReport_(unsigned char, void const*, int)>
    282c:	ec 01       	movw	r28, r24
    282e:	e0 91 77 03 	lds	r30, 0x0377	; 0x800377 <HIDReportObserver::send_report_hook_>
    2832:	f0 91 78 03 	lds	r31, 0x0378	; 0x800378 <HIDReportObserver::send_report_hook_+0x1>
    2836:	30 97       	sbiw	r30, 0x00	; 0
    2838:	29 f0       	breq	.+10     	; 0x2844 <HID_::SendReport(unsigned char, void const*, int)+0x30>
    283a:	9c 01       	movw	r18, r24
    283c:	a6 01       	movw	r20, r12
    283e:	b7 01       	movw	r22, r14
    2840:	81 2f       	mov	r24, r17
    2842:	09 95       	icall
    2844:	ce 01       	movw	r24, r28
    2846:	df 91       	pop	r29
    2848:	cf 91       	pop	r28
    284a:	1f 91       	pop	r17
    284c:	ff 90       	pop	r15
    284e:	ef 90       	pop	r14
    2850:	df 90       	pop	r13
    2852:	cf 90       	pop	r12
    2854:	08 95       	ret

00002856 <HID_::HID_()>:
    2856:	cf 93       	push	r28
    2858:	df 93       	push	r29
    285a:	ec 01       	movw	r28, r24
    285c:	81 e0       	ldi	r24, 0x01	; 1
    285e:	8c 83       	std	Y+4, r24	; 0x04
    2860:	8d 83       	std	Y+5, r24	; 0x05
    2862:	9e 01       	movw	r18, r28
    2864:	26 5f       	subi	r18, 0xF6	; 246
    2866:	3f 4f       	sbci	r19, 0xFF	; 255
    2868:	3f 83       	std	Y+7, r19	; 0x07
    286a:	2e 83       	std	Y+6, r18	; 0x06
    286c:	19 86       	std	Y+9, r1	; 0x09
    286e:	18 86       	std	Y+8, r1	; 0x08
    2870:	27 e5       	ldi	r18, 0x57	; 87
    2872:	31 e0       	ldi	r19, 0x01	; 1
    2874:	39 83       	std	Y+1, r19	; 0x01
    2876:	28 83       	st	Y, r18
    2878:	1c 86       	std	Y+12, r1	; 0x0c
    287a:	1b 86       	std	Y+11, r1	; 0x0b
    287c:	1e 86       	std	Y+14, r1	; 0x0e
    287e:	1d 86       	std	Y+13, r1	; 0x0d
    2880:	8f 87       	std	Y+15, r24	; 0x0f
    2882:	88 8b       	std	Y+16, r24	; 0x10
    2884:	19 8a       	std	Y+17, r1	; 0x11
    2886:	1a 8a       	std	Y+18, r1	; 0x12
    2888:	81 ec       	ldi	r24, 0xC1	; 193
    288a:	8a 87       	std	Y+10, r24	; 0x0a
    288c:	0e 94 47 0d 	call	0x1a8e	; 0x1a8e <PluggableUSB()>
    2890:	be 01       	movw	r22, r28
    2892:	df 91       	pop	r29
    2894:	cf 91       	pop	r28
    2896:	0c 94 03 0d 	jmp	0x1a06	; 0x1a06 <PluggableUSB_::plug(PluggableUSBModule*)>

0000289a <HID()>:
    289a:	80 91 5c 03 	lds	r24, 0x035C	; 0x80035c <guard variable for HID()::obj>
    289e:	81 11       	cpse	r24, r1
    28a0:	07 c0       	rjmp	.+14     	; 0x28b0 <HID()+0x16>
    28a2:	84 e6       	ldi	r24, 0x64	; 100
    28a4:	93 e0       	ldi	r25, 0x03	; 3
    28a6:	0e 94 2b 14 	call	0x2856	; 0x2856 <HID_::HID_()>
    28aa:	81 e0       	ldi	r24, 0x01	; 1
    28ac:	80 93 5c 03 	sts	0x035C, r24	; 0x80035c <guard variable for HID()::obj>
    28b0:	84 e6       	ldi	r24, 0x64	; 100
    28b2:	93 e0       	ldi	r25, 0x03	; 3
    28b4:	08 95       	ret

000028b6 <USB_PackMessages(bool)>:
    28b6:	08 95       	ret

000028b8 <yield>:
    28b8:	08 95       	ret

000028ba <__udivmodqi4>:
    28ba:	99 1b       	sub	r25, r25
    28bc:	79 e0       	ldi	r23, 0x09	; 9
    28be:	04 c0       	rjmp	.+8      	; 0x28c8 <__udivmodqi4_ep>

000028c0 <__udivmodqi4_loop>:
    28c0:	99 1f       	adc	r25, r25
    28c2:	96 17       	cp	r25, r22
    28c4:	08 f0       	brcs	.+2      	; 0x28c8 <__udivmodqi4_ep>
    28c6:	96 1b       	sub	r25, r22

000028c8 <__udivmodqi4_ep>:
    28c8:	88 1f       	adc	r24, r24
    28ca:	7a 95       	dec	r23
    28cc:	c9 f7       	brne	.-14     	; 0x28c0 <__udivmodqi4_loop>
    28ce:	80 95       	com	r24
    28d0:	08 95       	ret

000028d2 <__tablejump2__>:
    28d2:	ee 0f       	add	r30, r30
    28d4:	ff 1f       	adc	r31, r31
    28d6:	05 90       	lpm	r0, Z+
    28d8:	f4 91       	lpm	r31, Z
    28da:	e0 2d       	mov	r30, r0
    28dc:	09 94       	ijmp

000028de <memcmp>:
    28de:	fb 01       	movw	r30, r22
    28e0:	dc 01       	movw	r26, r24
    28e2:	04 c0       	rjmp	.+8      	; 0x28ec <memcmp+0xe>
    28e4:	8d 91       	ld	r24, X+
    28e6:	01 90       	ld	r0, Z+
    28e8:	80 19       	sub	r24, r0
    28ea:	21 f4       	brne	.+8      	; 0x28f4 <memcmp+0x16>
    28ec:	41 50       	subi	r20, 0x01	; 1
    28ee:	50 40       	sbci	r21, 0x00	; 0
    28f0:	c8 f7       	brcc	.-14     	; 0x28e4 <memcmp+0x6>
    28f2:	88 1b       	sub	r24, r24
    28f4:	99 0b       	sbc	r25, r25
    28f6:	08 95       	ret

000028f8 <_exit>:
    28f8:	f8 94       	cli

000028fa <__stop_program>:
    28fa:	ff cf       	rjmp	.-2      	; 0x28fa <__stop_program>
