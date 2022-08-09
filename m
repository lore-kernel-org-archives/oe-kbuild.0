Content-Type: multipart/mixed; boundary="===============5262427746498648384=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: vmlinux.o: warning: objtool: __ct_user_exit+0x9b: call to __kasan_check_write() leaves .noinstr.text section
Date: Tue, 09 Aug 2022 23:53:50 +0800
Message-ID: <202208092359.XRt1zmRq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5262427746498648384==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 vmlinux.o: warning: objtool: __ct_user_exit+0x9b: call to __kasan_check_wr=
ite() leaves .noinstr.text section"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>
CC: Marco Elver <elver@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eb555cb5b794f4e12a9897f3d46d5a72104cd4a7
commit: 1dcaa3b462265f688613163a1562a65ee53a3311 context_tracking: Use arch=
_atomic_read() in __ct_state for KASAN
date:   5 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 5 weeks ago
config: x86_64-randconfig-s022-20220808 (https://download.01.org/0day-ci/ar=
chive/20220809/202208092359.XRt1zmRq-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D1dcaa3b462265f688613163a1562a65ee53a3311
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1dcaa3b462265f688613163a1562a65ee53a3311
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x41: call to context_t=
racking_enabled_this_cpu() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __ct_user_exit+0x9b: call to __kasan_check_=
write() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __ct_user_enter+0xdf: call to __kasan_check=
_write() leaves .noinstr.text section


objdump-func vmlinux.o __ct_user_exit:
0000 0000000000007340 <__ct_user_exit>:
0000     7340:	f3 0f 1e fa          	endbr64 =

0004     7344:	55                   	push   %rbp
0005     7345:	48 89 e5             	mov    %rsp,%rbp
0008     7348:	41 54                	push   %r12
000a     734a:	41 89 fc             	mov    %edi,%r12d
000d     734d:	53                   	push   %rbx
000e     734e:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	734f: R_X86_64=
_NONE	__sanitizer_cov_trace_pc-0x4
0013     7353:	e8 28 ff ff ff       	call   7280 <context_tracking_recursio=
n_enter>
0018     7358:	31 ff                	xor    %edi,%edi
001a     735a:	89 c3                	mov    %eax,%ebx
001c     735c:	89 c6                	mov    %eax,%esi
001e     735e:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	735f: R_X86_64=
_NONE	__sanitizer_cov_trace_const_cmp1-0x4
0023     7363:	84 db                	test   %bl,%bl
0025     7365:	74 28                	je     738f <__ct_user_exit+0x4f>
0027     7367:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	7368: R_X86_64=
_NONE	__sanitizer_cov_trace_pc-0x4
002c     736c:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 7372 <_=
_ct_user_exit+0x32>	736e: R_X86_64_PC32	context_tracking+0x4
0032     7372:	44 89 e7             	mov    %r12d,%edi
0035     7375:	83 e3 03             	and    $0x3,%ebx
0038     7378:	89 de                	mov    %ebx,%esi
003a     737a:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	737b: R_X86_64=
_NONE	__sanitizer_cov_trace_cmp4-0x4
003f     737f:	41 39 dc             	cmp    %ebx,%r12d
0042     7382:	74 15                	je     7399 <__ct_user_exit+0x59>
0044     7384:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	7385: R_X86_64=
_NONE	__sanitizer_cov_trace_pc-0x4
0049     7389:	ff 0d 00 00 00 00    	decl   0x0(%rip)        # 738f <__ct_u=
ser_exit+0x4f>	738b: R_X86_64_PC32	context_tracking
004f     738f:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	7390: R_X86_64=
_NONE	__sanitizer_cov_trace_pc-0x4
0054     7394:	5b                   	pop    %rbx
0055     7395:	41 5c                	pop    %r12
0057     7397:	5d                   	pop    %rbp
0058     7398:	c3                   	ret    =

0059     7399:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	739a: R_X86_64=
_NONE	__sanitizer_cov_trace_pc-0x4
005e     739e:	0f b6 1d 00 00 00 00 	movzbl 0x0(%rip),%ebx        # 73a5 <_=
_ct_user_exit+0x65>	73a1: R_X86_64_PC32	context_tracking-0x4
0065     73a5:	31 ff                	xor    %edi,%edi
0067     73a7:	89 de                	mov    %ebx,%esi
0069     73a9:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	73aa: R_X86_64=
_NONE	__sanitizer_cov_trace_const_cmp1-0x4
006e     73ae:	84 db                	test   %bl,%bl
0070     73b0:	74 18                	je     73ca <__ct_user_exit+0x8a>
0072     73b2:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	73b3: R_X86_64=
_NONE	__sanitizer_cov_trace_pc-0x4
0077     73b7:	44 89 e6             	mov    %r12d,%esi
007a     73ba:	bf 02 00 00 00       	mov    $0x2,%edi
007f     73bf:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	73c0: R_X86_64=
_NONE	__sanitizer_cov_trace_const_cmp4-0x4
0084     73c4:	41 83 fc 02          	cmp    $0x2,%r12d
0088     73c8:	74 22                	je     73ec <__ct_user_exit+0xac>
008a     73ca:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	73cb: R_X86_64=
_NONE	__sanitizer_cov_trace_pc-0x4
008f     73cf:	be 04 00 00 00       	mov    $0x4,%esi
0094     73d4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	73d7: R_X86_64_32S	co=
ntext_tracking+0x8
009b     73db:	e8 00 00 00 00       	call   73e0 <__ct_user_exit+0xa0>	73dc=
: R_X86_64_PLT32	__kasan_check_write-0x4
00a0     73e0:	c7 05 00 00 00 00 00 00 00 00 	movl   $0x0,0x0(%rip)        =
# 73ea <__ct_user_exit+0xaa>	73e2: R_X86_64_PC32	context_tracking
00aa     73ea:	eb 98                	jmp    7384 <__ct_user_exit+0x44>
00ac     73ec:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	73ed: R_X86_64=
_NONE	__sanitizer_cov_trace_pc-0x4
00b1     73f1:	90                   	nop
00b2     73f2:	48 8b 3c 25 00 00 00 00 	mov    0x0,%rdi	73f6: R_X86_64_32S	=
current_task
00ba     73fa:	e8 00 00 00 00       	call   73ff <__ct_user_exit+0xbf>	73fb=
: R_X86_64_PLT32	vtime_user_exit-0x4
00bf     73ff:	e8 00 00 00 00       	call   7404 <__ct_user_exit+0xc4>	7400=
: R_X86_64_PC32	.text+0x7e823c
00c4     7404:	90                   	nop
00c5     7405:	eb c3                	jmp    73ca <__ct_user_exit+0x8a>
00c7     7407:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%r=
ax,1)
00d2     7412:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%r=
ax,1)
00dd     741d:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%r=
ax,1)
00e8     7428:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%r=
ax,1)
00f3     7433:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%r=
ax,1)
00fe     743e:	66 90                	xchg   %ax,%ax

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5262427746498648384==--

