Content-Type: multipart/mixed; boundary="===============2374855855594138106=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rppt:cet/kvm 16/49] arch/x86/mm/pgtable.c:617 maybe_mkwrite() warn: bitwise AND condition is false here
Date: Fri, 18 Feb 2022 04:49:29 +0800
Message-ID: <202202180427.fwI1SVyE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2374855855594138106==
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
commit: c4cd555bfd9f80a5d2cdc9993d05f3b5bcb8ccae [16/49] x86/mm: Update may=
be_mkwrite() for shadow stack
:::::: branch date: 25 hours ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20218/202202180427.fwI1SVyE-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
arch/x86/mm/pgtable.c:617 maybe_mkwrite() warn: bitwise AND condition is fa=
lse here

Old smatch warnings:
arch/x86/mm/pgtable.c:281 pgd_mop_up_pmds() warn: we never enter this loop

vim +617 arch/x86/mm/pgtable.c

db3eb96f4e6281b Andrea Arcangeli 2011-01-13  612  =

c4cd555bfd9f80a Yu-cheng Yu      2022-01-30  613  pte_t maybe_mkwrite(pte_t=
 pte, struct vm_area_struct *vma)
c4cd555bfd9f80a Yu-cheng Yu      2022-01-30  614  {
c4cd555bfd9f80a Yu-cheng Yu      2022-01-30  615  	if (vma->vm_flags & VM_W=
RITE)
c4cd555bfd9f80a Yu-cheng Yu      2022-01-30  616  		pte =3D pte_mkwrite(pte=
);
c4cd555bfd9f80a Yu-cheng Yu      2022-01-30 @617  	else if (vma->vm_flags &=
 VM_SHADOW_STACK)
c4cd555bfd9f80a Yu-cheng Yu      2022-01-30  618  		pte =3D pte_mkwrite_shs=
tk(pte);
c4cd555bfd9f80a Yu-cheng Yu      2022-01-30  619  	return pte;
c4cd555bfd9f80a Yu-cheng Yu      2022-01-30  620  }
c4cd555bfd9f80a Yu-cheng Yu      2022-01-30  621  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2374855855594138106==--

