Content-Type: multipart/mixed; boundary="===============8073721207867041594=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rppt:cet/kvm 16/51] arch/x86/mm/pgtable.c:617 maybe_mkwrite() warn: bitwise AND condition is false here
Date: Fri, 27 May 2022 18:41:13 +0800
Message-ID: <202205271831.Tb2kH9zS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8073721207867041594==
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
commit: c4cd555bfd9f80a5d2cdc9993d05f3b5bcb8ccae [16/51] x86/mm: Update may=
be_mkwrite() for shadow stack
:::::: branch date: 24 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
527/202205271831.Tb2kH9zS-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
arch/x86/mm/pgtable.c:617 maybe_mkwrite() warn: bitwise AND condition is fa=
lse here
arch/x86/mm/pgtable.c:627 maybe_pmd_mkwrite() warn: bitwise AND condition i=
s false here

Old smatch warnings:
arch/x86/mm/pgtable.c:281 pgd_mop_up_pmds() warn: we never enter this loop

vim +617 arch/x86/mm/pgtable.c

db3eb96f4e6281 Andrea Arcangeli 2011-01-13  612  =

c4cd555bfd9f80 Yu-cheng Yu      2022-01-30  613  pte_t maybe_mkwrite(pte_t =
pte, struct vm_area_struct *vma)
c4cd555bfd9f80 Yu-cheng Yu      2022-01-30  614  {
c4cd555bfd9f80 Yu-cheng Yu      2022-01-30  615  	if (vma->vm_flags & VM_WR=
ITE)
c4cd555bfd9f80 Yu-cheng Yu      2022-01-30  616  		pte =3D pte_mkwrite(pte);
c4cd555bfd9f80 Yu-cheng Yu      2022-01-30 @617  	else if (vma->vm_flags & =
VM_SHADOW_STACK)
c4cd555bfd9f80 Yu-cheng Yu      2022-01-30  618  		pte =3D pte_mkwrite_shst=
k(pte);
c4cd555bfd9f80 Yu-cheng Yu      2022-01-30  619  	return pte;
c4cd555bfd9f80 Yu-cheng Yu      2022-01-30  620  }
c4cd555bfd9f80 Yu-cheng Yu      2022-01-30  621  =

c4cd555bfd9f80 Yu-cheng Yu      2022-01-30  622  #ifdef CONFIG_TRANSPARENT_=
HUGEPAGE
c4cd555bfd9f80 Yu-cheng Yu      2022-01-30  623  pmd_t maybe_pmd_mkwrite(pm=
d_t pmd, struct vm_area_struct *vma)
c4cd555bfd9f80 Yu-cheng Yu      2022-01-30  624  {
c4cd555bfd9f80 Yu-cheng Yu      2022-01-30  625  	if (vma->vm_flags & VM_WR=
ITE)
c4cd555bfd9f80 Yu-cheng Yu      2022-01-30  626  		pmd =3D pmd_mkwrite(pmd);
c4cd555bfd9f80 Yu-cheng Yu      2022-01-30 @627  	else if (vma->vm_flags & =
VM_SHADOW_STACK)
c4cd555bfd9f80 Yu-cheng Yu      2022-01-30  628  		pmd =3D pmd_mkwrite_shst=
k(pmd);
c4cd555bfd9f80 Yu-cheng Yu      2022-01-30  629  	return pmd;
c4cd555bfd9f80 Yu-cheng Yu      2022-01-30  630  }
c4cd555bfd9f80 Yu-cheng Yu      2022-01-30  631  #endif /* CONFIG_TRANSPARE=
NT_HUGEPAGE */
c4cd555bfd9f80 Yu-cheng Yu      2022-01-30  632  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8073721207867041594==--

