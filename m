Content-Type: multipart/mixed; boundary="===============8729646238455786272=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [yyu168-linux_cet:cet 30/47] arch/x86/include/asm/fpu/internal.h:485:1: sparse: sparse: missing identifier in declaration
Date: Wed, 29 Apr 2020 21:52:16 +0800
Message-ID: <202004292149.HJWhSYY7%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8729646238455786272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: "Yu-cheng Yu" <yu-cheng.yu@intel.com>

tree:   https://github.com/yyu168/linux_cet.git cet
head:   80138cab012f983a4395ac70e3804739eaff02eb
commit: 0087ee9f497dcb2ae98a00a0b6c95994848c9943 [30/47] x86/cet/shstk: Han=
dle signals for shadow stack
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        git checkout 0087ee9f497dcb2ae98a00a0b6c95994848c9943
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> arch/x86/include/asm/fpu/internal.h:485:1: sparse: sparse: missing ident=
ifier in declaration
   arch/x86/include/asm/fpu/internal.h:485:1: sparse: sparse: Expected ; at=
 the end of type declaration
   arch/x86/include/asm/fpu/internal.h:485:1: sparse: sparse: got {
   arch/x86/include/asm/fpu/internal.h:487:1: sparse: sparse: Expected ; at=
 the end of type declaration
   arch/x86/include/asm/fpu/internal.h:487:1: sparse: sparse: got }
--
>> arch/x86/include/asm/fpu/internal.h:485:1: sparse: sparse: missing ident=
ifier in declaration
   arch/x86/include/asm/fpu/internal.h:485:1: sparse: sparse: Expected ; at=
 the end of type declaration
   arch/x86/include/asm/fpu/internal.h:485:1: sparse: sparse: got {
   arch/x86/include/asm/fpu/internal.h:487:1: sparse: sparse: Expected ; at=
 the end of type declaration
   arch/x86/include/asm/fpu/internal.h:487:1: sparse: sparse: got }
   arch/x86/kernel/signal.c:282:15: sparse: sparse: undefined identifier 'c=
opy_fpstate_to_sigframe'

# https://github.com/yyu168/linux_cet/commit/0087ee9f497dcb2ae98a00a0b6c959=
94848c9943
git remote add yyu168-linux_cet https://github.com/yyu168/linux_cet.git
git remote update yyu168-linux_cet
git checkout 0087ee9f497dcb2ae98a00a0b6c95994848c9943
vim +485 arch/x86/include/asm/fpu/internal.h

1361b83a13d4d9 arch/x86/include/asm/fpu-internal.h Linus Torvalds 2012-02-2=
1  478  =

0087ee9f497dcb arch/x86/include/asm/fpu/internal.h Yu-cheng Yu    2017-01-0=
5  479  #ifdef CONFIG_X86_INTEL_CET
0087ee9f497dcb arch/x86/include/asm/fpu/internal.h Yu-cheng Yu    2017-01-0=
5  480  extern int save_cet_to_sigframe(int ia32, void __user *fp,
0087ee9f497dcb arch/x86/include/asm/fpu/internal.h Yu-cheng Yu    2017-01-0=
5  481  				unsigned long restorer);
0087ee9f497dcb arch/x86/include/asm/fpu/internal.h Yu-cheng Yu    2017-01-0=
5  482  #else
0087ee9f497dcb arch/x86/include/asm/fpu/internal.h Yu-cheng Yu    2017-01-0=
5  483  static inline int save_cet_to_sigframe(int ia32, void __user *fp,
0087ee9f497dcb arch/x86/include/asm/fpu/internal.h Yu-cheng Yu    2017-01-0=
5  484  				unsigned long restorer);
0087ee9f497dcb arch/x86/include/asm/fpu/internal.h Yu-cheng Yu    2017-01-0=
5 @485  {
0087ee9f497dcb arch/x86/include/asm/fpu/internal.h Yu-cheng Yu    2017-01-0=
5  486  	return 0;
0087ee9f497dcb arch/x86/include/asm/fpu/internal.h Yu-cheng Yu    2017-01-0=
5  487  }
0087ee9f497dcb arch/x86/include/asm/fpu/internal.h Yu-cheng Yu    2017-01-0=
5  488  #endif
87dafd41a4423c arch/x86/include/asm/fpu/internal.h Ingo Molnar    2015-05-2=
5  489  extern int copy_fpstate_to_sigframe(void __user *buf, void __user *=
fp, int size);
b1b64dc3558b7b arch/x86/include/asm/fpu/internal.h Ingo Molnar    2015-05-0=
5  490  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8729646238455786272==--

