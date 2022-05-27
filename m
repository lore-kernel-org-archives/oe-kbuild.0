Content-Type: multipart/mixed; boundary="===============1301392675572140302=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rppt:cet/kvm 18/51] arch/x86/mm/mmap.c:271 vm_start_gap() warn: bitwise AND condition is false here
Date: Fri, 27 May 2022 19:40:54 +0800
Message-ID: <202205271921.EBBhuC3J-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1301392675572140302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Mike Rapoport <rppt@kernel.org>
CC: linux-kernel(a)vger.kernel.org
TO: "Yu-cheng Yu" <yu-cheng.yu@intel.com>
CC: Mike Rapoport <rppt@kernel.org>
CC: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
CC: Rick Edgecombe <rick.p.edgecombe@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git cet/=
kvm
head:   6c13d37e6c4ff3a7f86c5490b3d0f4f12d0a40da
commit: 280ad6edcdca10e519d23349b18fa3e46330654c [18/51] mm: Add guard page=
s around a shadow stack.
:::::: branch date: 25 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
527/202205271921.EBBhuC3J-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
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

280ad6edcdca10 Yu-cheng Yu 2022-01-30  263  =

280ad6edcdca10 Yu-cheng Yu 2022-01-30  264  unsigned long vm_start_gap(stru=
ct vm_area_struct *vma)
280ad6edcdca10 Yu-cheng Yu 2022-01-30  265  {
280ad6edcdca10 Yu-cheng Yu 2022-01-30  266  	unsigned long vm_start =3D vma=
->vm_start;
280ad6edcdca10 Yu-cheng Yu 2022-01-30  267  	unsigned long gap =3D 0;
280ad6edcdca10 Yu-cheng Yu 2022-01-30  268  =

280ad6edcdca10 Yu-cheng Yu 2022-01-30  269  	if (vma->vm_flags & VM_GROWSDO=
WN)
280ad6edcdca10 Yu-cheng Yu 2022-01-30  270  		gap =3D stack_guard_gap;
280ad6edcdca10 Yu-cheng Yu 2022-01-30 @271  	else if (vma->vm_flags & VM_SH=
ADOW_STACK)
280ad6edcdca10 Yu-cheng Yu 2022-01-30  272  		gap =3D SHADOW_STACK_GUARD_GA=
P;
280ad6edcdca10 Yu-cheng Yu 2022-01-30  273  =

280ad6edcdca10 Yu-cheng Yu 2022-01-30  274  	if (gap !=3D 0) {
280ad6edcdca10 Yu-cheng Yu 2022-01-30  275  		vm_start -=3D gap;
280ad6edcdca10 Yu-cheng Yu 2022-01-30  276  		if (vm_start > vma->vm_start)
280ad6edcdca10 Yu-cheng Yu 2022-01-30  277  			vm_start =3D 0;
280ad6edcdca10 Yu-cheng Yu 2022-01-30  278  	}
280ad6edcdca10 Yu-cheng Yu 2022-01-30  279  	return vm_start;
280ad6edcdca10 Yu-cheng Yu 2022-01-30  280  }
280ad6edcdca10 Yu-cheng Yu 2022-01-30  281  =

280ad6edcdca10 Yu-cheng Yu 2022-01-30  282  unsigned long vm_end_gap(struct=
 vm_area_struct *vma)
280ad6edcdca10 Yu-cheng Yu 2022-01-30  283  {
280ad6edcdca10 Yu-cheng Yu 2022-01-30  284  	unsigned long vm_end =3D vma->=
vm_end;
280ad6edcdca10 Yu-cheng Yu 2022-01-30  285  	unsigned long gap =3D 0;
280ad6edcdca10 Yu-cheng Yu 2022-01-30  286  =

280ad6edcdca10 Yu-cheng Yu 2022-01-30  287  	if (vma->vm_flags & VM_GROWSUP)
280ad6edcdca10 Yu-cheng Yu 2022-01-30  288  		gap =3D stack_guard_gap;
280ad6edcdca10 Yu-cheng Yu 2022-01-30 @289  	else if (vma->vm_flags & VM_SH=
ADOW_STACK)

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1301392675572140302==--

