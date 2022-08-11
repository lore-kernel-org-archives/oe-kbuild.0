Content-Type: multipart/mixed; boundary="===============3247353388419853118=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x41: call to context_tracking_enabled_this_cpu() leaves .noinstr.text section
Date: Fri, 12 Aug 2022 01:37:06 +0800
Message-ID: <202208120134.sgvaheFm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3247353388419853118==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x41: call to context_tra=
cking_enabled_this_cpu() leaves .noinstr.text section"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2ae08b36c06ea8df73a79f6b80ff7964e006e9e3
commit: 656d054e0a15ec327bd82801ccd58201e59f6896 jump_label,noinstr: Avoid =
instrumentation for JUMP_LABEL=3Dn builds
date:   3 months ago
:::::: branch date: 70 minutes ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-s022-20220808 (https://download.01.org/0day-ci/ar=
chive/20220812/202208120134.sgvaheFm-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D656d054e0a15ec327bd82801ccd58201e59f6896
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 656d054e0a15ec327bd82801ccd58201e59f6896
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x41: call to context_t=
racking_enabled_this_cpu() leaves .noinstr.text section


objdump-func vmlinux.o vmx_vcpu_enter_exit:
0000 0000000000001300 <vmx_vcpu_enter_exit>:
0000     1300:	55                   	push   %rbp
0001     1301:	48 89 e5             	mov    %rsp,%rbp
0004     1304:	41 56                	push   %r14
0006     1306:	41 55                	push   %r13
0008     1308:	41 54                	push   %r12
000a     130a:	49 89 f4             	mov    %rsi,%r12
000d     130d:	53                   	push   %rbx
000e     130e:	48 89 fb             	mov    %rdi,%rbx
0011     1311:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1312: R_X86_64=
_NONE	__sanitizer_cov_trace_pc-0x4
0016     1316:	90                   	nop
0017     1317:	e8 00 00 00 00       	call   131c <vmx_vcpu_enter_exit+0x1c>=
	1318: R_X86_64_PLT32	trace_hardirqs_on_prepare-0x4
001c     131c:	e8 00 00 00 00       	call   1321 <vmx_vcpu_enter_exit+0x21>=
	131d: R_X86_64_PLT32	lockdep_hardirqs_on_prepare-0x4
0021     1321:	90                   	nop
0022     1322:	44 8b 2d 00 00 00 00 	mov    0x0(%rip),%r13d        # 1329 <=
vmx_vcpu_enter_exit+0x29>	1325: R_X86_64_PC32	context_tracking_key-0x4
0029     1329:	31 ff                	xor    %edi,%edi
002b     132b:	44 89 ee             	mov    %r13d,%esi
002e     132e:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	132f: R_X86_64=
_NONE	__sanitizer_cov_trace_const_cmp4-0x4
0033     1333:	45 85 ed             	test   %r13d,%r13d
0036     1336:	0f 8f f5 00 00 00    	jg     1431 <vmx_vcpu_enter_exit+0x131>
003c     133c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	133d: R_X86_64=
_NONE	__sanitizer_cov_trace_pc-0x4
0041     1341:	e8 00 00 00 00       	call   1346 <vmx_vcpu_enter_exit+0x46>=
	1342: R_X86_64_PC32	.text+0x1e89bc
0046     1346:	31 ff                	xor    %edi,%edi
0048     1348:	41 89 c5             	mov    %eax,%r13d
004b     134b:	89 c6                	mov    %eax,%esi
004d     134d:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	134e: R_X86_64=
_NONE	__sanitizer_cov_trace_const_cmp1-0x4
0052     1352:	45 84 ed             	test   %r13b,%r13b
0055     1355:	75 07                	jne    135e <vmx_vcpu_enter_exit+0x5e>
0057     1357:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1358: R_X86_64=
_NONE	__sanitizer_cov_trace_pc-0x4
005c     135c:	90                   	nop
005d     135d:	90                   	nop
005e     135e:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	135f: R_X86_64=
_NONE	__sanitizer_cov_trace_pc-0x4
0063     1363:	48 8b 7d 08          	mov    0x8(%rbp),%rdi
0067     1367:	e8 00 00 00 00       	call   136c <vmx_vcpu_enter_exit+0x6c>=
	1368: R_X86_64_PLT32	lockdep_hardirqs_on-0x4
006c     136c:	44 8b 2d 00 00 00 00 	mov    0x0(%rip),%r13d        # 1373 <=
vmx_vcpu_enter_exit+0x73>	136f: R_X86_64_PC32	.bss+0x5dbc
0073     1373:	31 ff                	xor    %edi,%edi
0075     1375:	44 89 ee             	mov    %r13d,%esi
0078     1378:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1379: R_X86_64=
_NONE	__sanitizer_cov_trace_const_cmp4-0x4
007d     137d:	45 85 ed             	test   %r13d,%r13d
0080     1380:	0f 8f bf 00 00 00    	jg     1445 <vmx_vcpu_enter_exit+0x145>
0086     1386:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1387: R_X86_64=
_NONE	__sanitizer_cov_trace_pc-0x4
008b     138b:	44 8b 2d 00 00 00 00 	mov    0x0(%rip),%r13d        # 1392 <=
vmx_vcpu_enter_exit+0x92>	138e: R_X86_64_PC32	mds_user_clear-0x4
0092     1392:	31 ff                	xor    %edi,%edi
0094     1394:	44 89 ee             	mov    %r13d,%esi
0097     1397:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1398: R_X86_64=
_NONE	__sanitizer_cov_trace_const_cmp4-0x4
009c     139c:	45 85 ed             	test   %r13d,%r13d
009f     139f:	0f 8f c3 00 00 00    	jg     1468 <vmx_vcpu_enter_exit+0x168>
00a5     13a5:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	13a6: R_X86_64=
_NONE	__sanitizer_cov_trace_pc-0x4
00aa     13aa:	4c 8b ab 58 02 00 00 	mov    0x258(%rbx),%r13
00b1     13b1:	41 0f 20 d6          	mov    %cr2,%r14
00b5     13b5:	4c 89 f6             	mov    %r14,%rsi
00b8     13b8:	4c 89 ef             	mov    %r13,%rdi
00bb     13bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	13bc: R_X86_64=
_NONE	__sanitizer_cov_trace_cmp8-0x4
00c0     13c0:	4d 39 f5             	cmp    %r14,%r13
00c3     13c3:	74 09                	je     13ce <vmx_vcpu_enter_exit+0xce>
00c5     13c5:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	13c6: R_X86_64=
_NONE	__sanitizer_cov_trace_pc-0x4
00ca     13ca:	41 0f 22 d5          	mov    %r13,%cr2
00ce     13ce:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	13cf: R_X86_64=
_NONE	__sanitizer_cov_trace_pc-0x4
00d3     13d3:	49 8b 84 24 80 25 00 00 	mov    0x2580(%r12),%rax
00db     13db:	48 8d b3 b8 01 00 00 	lea    0x1b8(%rbx),%rsi
00e2     13e2:	4c 89 e7             	mov    %r12,%rdi
00e5     13e5:	0f b6 50 14          	movzbl 0x14(%rax),%edx
00e9     13e9:	e8 00 00 00 00       	call   13ee <vmx_vcpu_enter_exit+0xee>=
	13ea: R_X86_64_PLT32	__vmx_vcpu_run-0x4
00ee     13ee:	41 88 84 24 f8 23 00 00 	mov    %al,0x23f8(%r12)
00f6     13f6:	0f 20 d0             	mov    %cr2,%rax
00f9     13f9:	48 89 83 58 02 00 00 	mov    %rax,0x258(%rbx)
0100     1400:	48 8b 7d 08          	mov    0x8(%rbp),%rdi
0104     1404:	e8 00 00 00 00       	call   1409 <vmx_vcpu_enter_exit+0x109=
>	1405: R_X86_64_PLT32	lockdep_hardirqs_off-0x4
0109     1409:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 140f <v=
mx_vcpu_enter_exit+0x10f>	140b: R_X86_64_PC32	context_tracking_key-0x4
010f     140f:	31 ff                	xor    %edi,%edi
0111     1411:	89 de                	mov    %ebx,%esi
0113     1413:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1414: R_X86_64=
_NONE	__sanitizer_cov_trace_const_cmp4-0x4
0118     1418:	85 db                	test   %ebx,%ebx
011a     141a:	7f 3b                	jg     1457 <vmx_vcpu_enter_exit+0x157>
011c     141c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	141d: R_X86_64=
_NONE	__sanitizer_cov_trace_pc-0x4
0121     1421:	90                   	nop
0122     1422:	e8 00 00 00 00       	call   1427 <vmx_vcpu_enter_exit+0x127=
>	1423: R_X86_64_PLT32	trace_hardirqs_off_finish-0x4
0127     1427:	90                   	nop
0128     1428:	5b                   	pop    %rbx
0129     1429:	41 5c                	pop    %r12
012b     142b:	41 5d                	pop    %r13
012d     142d:	41 5e                	pop    %r14
012f     142f:	5d                   	pop    %rbp
0130     1430:	c3                   	ret    =

0131     1431:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1432: R_X86_64=
_NONE	__sanitizer_cov_trace_pc-0x4
0136     1436:	bf 02 00 00 00       	mov    $0x2,%edi
013b     143b:	e8 00 00 00 00       	call   1440 <vmx_vcpu_enter_exit+0x140=
>	143c: R_X86_64_PLT32	__context_tracking_enter-0x4
0140     1440:	e9 f7 fe ff ff       	jmp    133c <vmx_vcpu_enter_exit+0x3c>
0145     1445:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1446: R_X86_64=
_NONE	__sanitizer_cov_trace_pc-0x4
014a     144a:	48 89 df             	mov    %rbx,%rdi
014d     144d:	e8 ae fd ff ff       	call   1200 <vmx_l1d_flush>
0152     1452:	e9 4e ff ff ff       	jmp    13a5 <vmx_vcpu_enter_exit+0xa5>
0157     1457:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1458: R_X86_64=
_NONE	__sanitizer_cov_trace_pc-0x4
015c     145c:	bf 02 00 00 00       	mov    $0x2,%edi
0161     1461:	e8 00 00 00 00       	call   1466 <vmx_vcpu_enter_exit+0x166=
>	1462: R_X86_64_PLT32	__context_tracking_exit-0x4
0166     1466:	eb b4                	jmp    141c <vmx_vcpu_enter_exit+0x11c>
0168     1468:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1469: R_X86_64=
_NONE	__sanitizer_cov_trace_pc-0x4
016d     146d:	0f 00 2d 00 00 00 00 	verw   0x0(%rip)        # 1474 <vmx_vc=
pu_enter_exit+0x174>	1470: R_X86_64_PC32	.rodata+0x48a9c
0174     1474:	e9 2c ff ff ff       	jmp    13a5 <vmx_vcpu_enter_exit+0xa5>
0179     1479:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3247353388419853118==--

