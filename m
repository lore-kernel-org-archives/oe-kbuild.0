Content-Type: multipart/mixed; boundary="===============4346199358495684075=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rppt:cet/kvm 18/49] arch/x86/mm/mmap.c:271 vm_start_gap() warn: bitwise AND condition is false here
Date: Fri, 18 Feb 2022 05:30:13 +0800
Message-ID: <202202180510.dIE7tQ59-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4346199358495684075==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Mike Rapoport <rppt@kernel.org>
CC: linux-kernel(a)vger.kernel.org
TO: "Yu-cheng Yu" <yu-cheng.yu@intel.com>
CC: Mike Rapoport <rppt@linux.ibm.com>
CC: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
CC: Rick Edgecombe <rick.p.edgecombe@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git cet/=
kvm
head:   e2f9808bd7530f44cd5d95332036bb660b66b8db
commit: 280ad6edcdca10e519d23349b18fa3e46330654c [18/49] mm: Add guard page=
s around a shadow stack.
:::::: branch date: 26 hours ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20218/202202180510.dIE7tQ59-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
arch/x86/mm/mmap.c:271 vm_start_gap() warn: bitwise AND condition is false =
here
arch/x86/mm/mmap.c:289 vm_end_gap() warn: bitwise AND condition is false he=
re

Old smatch warnings:
arch/x86/mm/mmap.c:168 arch_vma_name() warn: bitwise AND condition is false=
 here

vim +271 arch/x86/mm/mmap.c

280ad6edcdca10e Yu-cheng Yu 2022-01-30  263  =

280ad6edcdca10e Yu-cheng Yu 2022-01-30  264  unsigned long vm_start_gap(str=
uct vm_area_struct *vma)
280ad6edcdca10e Yu-cheng Yu 2022-01-30  265  {
280ad6edcdca10e Yu-cheng Yu 2022-01-30  266  	unsigned long vm_start =3D vm=
a->vm_start;
280ad6edcdca10e Yu-cheng Yu 2022-01-30  267  	unsigned long gap =3D 0;
280ad6edcdca10e Yu-cheng Yu 2022-01-30  268  =

280ad6edcdca10e Yu-cheng Yu 2022-01-30  269  	if (vma->vm_flags & VM_GROWSD=
OWN)
280ad6edcdca10e Yu-cheng Yu 2022-01-30  270  		gap =3D stack_guard_gap;
280ad6edcdca10e Yu-cheng Yu 2022-01-30 @271  	else if (vma->vm_flags & VM_S=
HADOW_STACK)
280ad6edcdca10e Yu-cheng Yu 2022-01-30  272  		gap =3D SHADOW_STACK_GUARD_G=
AP;
280ad6edcdca10e Yu-cheng Yu 2022-01-30  273  =

280ad6edcdca10e Yu-cheng Yu 2022-01-30  274  	if (gap !=3D 0) {
280ad6edcdca10e Yu-cheng Yu 2022-01-30  275  		vm_start -=3D gap;
280ad6edcdca10e Yu-cheng Yu 2022-01-30  276  		if (vm_start > vma->vm_start)
280ad6edcdca10e Yu-cheng Yu 2022-01-30  277  			vm_start =3D 0;
280ad6edcdca10e Yu-cheng Yu 2022-01-30  278  	}
280ad6edcdca10e Yu-cheng Yu 2022-01-30  279  	return vm_start;
280ad6edcdca10e Yu-cheng Yu 2022-01-30  280  }
280ad6edcdca10e Yu-cheng Yu 2022-01-30  281  =

280ad6edcdca10e Yu-cheng Yu 2022-01-30  282  unsigned long vm_end_gap(struc=
t vm_area_struct *vma)
280ad6edcdca10e Yu-cheng Yu 2022-01-30  283  {
280ad6edcdca10e Yu-cheng Yu 2022-01-30  284  	unsigned long vm_end =3D vma-=
>vm_end;
280ad6edcdca10e Yu-cheng Yu 2022-01-30  285  	unsigned long gap =3D 0;
280ad6edcdca10e Yu-cheng Yu 2022-01-30  286  =

280ad6edcdca10e Yu-cheng Yu 2022-01-30  287  	if (vma->vm_flags & VM_GROWSU=
P)
280ad6edcdca10e Yu-cheng Yu 2022-01-30  288  		gap =3D stack_guard_gap;
280ad6edcdca10e Yu-cheng Yu 2022-01-30 @289  	else if (vma->vm_flags & VM_S=
HADOW_STACK)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4346199358495684075==--

