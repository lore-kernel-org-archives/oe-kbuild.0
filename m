Content-Type: multipart/mixed; boundary="===============9020089897066974018=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rppt:cet/kvm 15/49] arch/x86/mm/fault.c:1116 access_error() warn: bitwise AND condition is false here
Date: Fri, 18 Feb 2022 04:18:40 +0800
Message-ID: <202202180429.D5MGtr7R-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9020089897066974018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Mike Rapoport <rppt@kernel.org>
CC: linux-kernel(a)vger.kernel.org
TO: "Yu-cheng Yu" <yu-cheng.yu@intel.com>
CC: Mike Rapoport <rppt@linux.ibm.com>
CC: Kees Cook <keescook@chromium.org>
CC: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
CC: Rick Edgecombe <rick.p.edgecombe@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git cet/=
kvm
head:   e2f9808bd7530f44cd5d95332036bb660b66b8db
commit: b5bfd6df3c1fb925b14d03211e4a9fed46f0a211 [15/49] x86/mm: Check Shad=
ow Stack page fault errors
:::::: branch date: 25 hours ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20218/202202180429.D5MGtr7R-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/x86/mm/fault.c:1116 access_error() warn: bitwise AND condition is fals=
e here

vim +1116 arch/x86/mm/fault.c

^1da177e4c3f415 arch/x86_64/mm/fault.c Linus Torvalds      2005-04-16  1074=
  =

2d4a71676f4d894 arch/x86/mm/fault.c    Ingo Molnar         2009-02-20  1075=
  static inline int
68da336a14e16c2 arch/x86/mm/fault.c    Michel Lespinasse   2010-10-26  1076=
  access_error(unsigned long error_code, struct vm_area_struct *vma)
92181f190b649f7 arch/x86/mm/fault.c    Nicholas Piggin     2009-01-20  1077=
  {
07f146f53e8de82 arch/x86/mm/fault.c    Dave Hansen         2016-02-12  1078=
  	/* This is only called for the current mm, so: */
07f146f53e8de82 arch/x86/mm/fault.c    Dave Hansen         2016-02-12  1079=
  	bool foreign =3D false;
e8c6226d483cb28 arch/x86/mm/fault.c    Dave Hansen         2016-07-29  1080=
  =

e8c6226d483cb28 arch/x86/mm/fault.c    Dave Hansen         2016-07-29  1081=
  	/*
e8c6226d483cb28 arch/x86/mm/fault.c    Dave Hansen         2016-07-29  1082=
  	 * Read or write was blocked by protection keys.  This is
e8c6226d483cb28 arch/x86/mm/fault.c    Dave Hansen         2016-07-29  1083=
  	 * always an unconditional error and can never result in
e8c6226d483cb28 arch/x86/mm/fault.c    Dave Hansen         2016-07-29  1084=
  	 * a follow-up action to resolve the fault, like a COW.
e8c6226d483cb28 arch/x86/mm/fault.c    Dave Hansen         2016-07-29  1085=
  	 */
1067f030994c69c arch/x86/mm/fault.c    Ricardo Neri        2017-10-27  1086=
  	if (error_code & X86_PF_PK)
e8c6226d483cb28 arch/x86/mm/fault.c    Dave Hansen         2016-07-29  1087=
  		return 1;
e8c6226d483cb28 arch/x86/mm/fault.c    Dave Hansen         2016-07-29  1088=
  =

74faeee06db81a0 arch/x86/mm/fault.c    Sean Christopherson 2020-11-13  1089=
  	/*
74faeee06db81a0 arch/x86/mm/fault.c    Sean Christopherson 2020-11-13  1090=
  	 * SGX hardware blocked the access.  This usually happens
74faeee06db81a0 arch/x86/mm/fault.c    Sean Christopherson 2020-11-13  1091=
  	 * when the enclave memory contents have been destroyed, like
74faeee06db81a0 arch/x86/mm/fault.c    Sean Christopherson 2020-11-13  1092=
  	 * after a suspend/resume cycle. In any case, the kernel can't
74faeee06db81a0 arch/x86/mm/fault.c    Sean Christopherson 2020-11-13  1093=
  	 * fix the cause of the fault.  Handle the fault as an access
74faeee06db81a0 arch/x86/mm/fault.c    Sean Christopherson 2020-11-13  1094=
  	 * error even in cases where no actual access violation
74faeee06db81a0 arch/x86/mm/fault.c    Sean Christopherson 2020-11-13  1095=
  	 * occurred.  This allows userspace to rebuild the enclave in
74faeee06db81a0 arch/x86/mm/fault.c    Sean Christopherson 2020-11-13  1096=
  	 * response to the signal.
74faeee06db81a0 arch/x86/mm/fault.c    Sean Christopherson 2020-11-13  1097=
  	 */
74faeee06db81a0 arch/x86/mm/fault.c    Sean Christopherson 2020-11-13  1098=
  	if (unlikely(error_code & X86_PF_SGX))
74faeee06db81a0 arch/x86/mm/fault.c    Sean Christopherson 2020-11-13  1099=
  		return 1;
74faeee06db81a0 arch/x86/mm/fault.c    Sean Christopherson 2020-11-13  1100=
  =

07f146f53e8de82 arch/x86/mm/fault.c    Dave Hansen         2016-02-12  1101=
  	/*
07f146f53e8de82 arch/x86/mm/fault.c    Dave Hansen         2016-02-12  1102=
  	 * Make sure to check the VMA so that we do not perform
1067f030994c69c arch/x86/mm/fault.c    Ricardo Neri        2017-10-27  1103=
  	 * faults just to hit a X86_PF_PK as soon as we fill in a
07f146f53e8de82 arch/x86/mm/fault.c    Dave Hansen         2016-02-12  1104=
  	 * page.
07f146f53e8de82 arch/x86/mm/fault.c    Dave Hansen         2016-02-12  1105=
  	 */
1067f030994c69c arch/x86/mm/fault.c    Ricardo Neri        2017-10-27  1106=
  	if (!arch_vma_access_permitted(vma, (error_code & X86_PF_WRITE),
1067f030994c69c arch/x86/mm/fault.c    Ricardo Neri        2017-10-27  1107=
  				       (error_code & X86_PF_INSTR), foreign))
07f146f53e8de82 arch/x86/mm/fault.c    Dave Hansen         2016-02-12  1108=
  		return 1;
33a709b25a760b9 arch/x86/mm/fault.c    Dave Hansen         2016-02-12  1109=
  =

b5bfd6df3c1fb92 arch/x86/mm/fault.c    Yu-cheng Yu         2022-01-30  1110=
  	/*
b5bfd6df3c1fb92 arch/x86/mm/fault.c    Yu-cheng Yu         2022-01-30  1111=
  	 * Verify a shadow stack access is within a shadow stack VMA.
b5bfd6df3c1fb92 arch/x86/mm/fault.c    Yu-cheng Yu         2022-01-30  1112=
  	 * It is always an error otherwise.  Normal data access to a
b5bfd6df3c1fb92 arch/x86/mm/fault.c    Yu-cheng Yu         2022-01-30  1113=
  	 * shadow stack area is checked in the case followed.
b5bfd6df3c1fb92 arch/x86/mm/fault.c    Yu-cheng Yu         2022-01-30  1114=
  	 */
b5bfd6df3c1fb92 arch/x86/mm/fault.c    Yu-cheng Yu         2022-01-30  1115=
  	if (error_code & X86_PF_SHSTK) {
b5bfd6df3c1fb92 arch/x86/mm/fault.c    Yu-cheng Yu         2022-01-30 @1116=
  		if (!(vma->vm_flags & VM_SHADOW_STACK))
b5bfd6df3c1fb92 arch/x86/mm/fault.c    Yu-cheng Yu         2022-01-30  1117=
  			return 1;
b5bfd6df3c1fb92 arch/x86/mm/fault.c    Yu-cheng Yu         2022-01-30  1118=
  		return 0;
b5bfd6df3c1fb92 arch/x86/mm/fault.c    Yu-cheng Yu         2022-01-30  1119=
  	}
b5bfd6df3c1fb92 arch/x86/mm/fault.c    Yu-cheng Yu         2022-01-30  1120=
  =

1067f030994c69c arch/x86/mm/fault.c    Ricardo Neri        2017-10-27  1121=
  	if (error_code & X86_PF_WRITE) {
2d4a71676f4d894 arch/x86/mm/fault.c    Ingo Molnar         2009-02-20  1122=
  		/* write, present and write, not present: */
92181f190b649f7 arch/x86/mm/fault.c    Nicholas Piggin     2009-01-20  1123=
  		if (unlikely(!(vma->vm_flags & VM_WRITE)))
92181f190b649f7 arch/x86/mm/fault.c    Nicholas Piggin     2009-01-20  1124=
  			return 1;
2d4a71676f4d894 arch/x86/mm/fault.c    Ingo Molnar         2009-02-20  1125=
  		return 0;
2d4a71676f4d894 arch/x86/mm/fault.c    Ingo Molnar         2009-02-20  1126=
  	}
2d4a71676f4d894 arch/x86/mm/fault.c    Ingo Molnar         2009-02-20  1127=
  =

2d4a71676f4d894 arch/x86/mm/fault.c    Ingo Molnar         2009-02-20  1128=
  	/* read, present: */
1067f030994c69c arch/x86/mm/fault.c    Ricardo Neri        2017-10-27  1129=
  	if (unlikely(error_code & X86_PF_PROT))
92181f190b649f7 arch/x86/mm/fault.c    Nicholas Piggin     2009-01-20  1130=
  		return 1;
2d4a71676f4d894 arch/x86/mm/fault.c    Ingo Molnar         2009-02-20  1131=
  =

2d4a71676f4d894 arch/x86/mm/fault.c    Ingo Molnar         2009-02-20  1132=
  	/* read, not present: */
3122e80efc0faf4 arch/x86/mm/fault.c    Anshuman Khandual   2020-04-06  1133=
  	if (unlikely(!vma_is_accessible(vma)))
92181f190b649f7 arch/x86/mm/fault.c    Nicholas Piggin     2009-01-20  1134=
  		return 1;
92181f190b649f7 arch/x86/mm/fault.c    Nicholas Piggin     2009-01-20  1135=
  =

92181f190b649f7 arch/x86/mm/fault.c    Nicholas Piggin     2009-01-20  1136=
  	return 0;
92181f190b649f7 arch/x86/mm/fault.c    Nicholas Piggin     2009-01-20  1137=
  }
92181f190b649f7 arch/x86/mm/fault.c    Nicholas Piggin     2009-01-20  1138=
  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9020089897066974018==--

