Content-Type: multipart/mixed; boundary="===============0332791573656066283=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm64/mm/mmap.c:77 vm_get_page_prot() warn: bitwise AND condition is false here
Date: Thu, 16 Jun 2022 03:14:17 +0800
Message-ID: <202206160306.zkaxKedS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0332791573656066283==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Anshuman Khandual <anshuman.khandual@arm.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Catalin Marinas <catalin.marinas@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   979086f5e0066b4eff66e1eee123da228489985c
commit: b3aca728fb276782ab3c851aedaf3d19b33faabe arm64/mm: enable ARCH_HAS_=
VM_GET_PAGE_PROT
date:   7 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 weeks ago
config: arm64-randconfig-m031-20220615 (https://download.01.org/0day-ci/arc=
hive/20220616/202206160306.zkaxKedS-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/arm64/mm/mmap.c:77 vm_get_page_prot() warn: bitwise AND condition is f=
alse here

vim +77 arch/arm64/mm/mmap.c

b3aca728fb2767 Anshuman Khandual 2022-04-28  58  =

b3aca728fb2767 Anshuman Khandual 2022-04-28  59  pgprot_t vm_get_page_prot(=
unsigned long vm_flags)
b3aca728fb2767 Anshuman Khandual 2022-04-28  60  {
b3aca728fb2767 Anshuman Khandual 2022-04-28  61  	pteval_t prot =3D pgprot_=
val(protection_map[vm_flags &
b3aca728fb2767 Anshuman Khandual 2022-04-28  62  				   (VM_READ|VM_WRITE|V=
M_EXEC|VM_SHARED)]);
b3aca728fb2767 Anshuman Khandual 2022-04-28  63  =

b3aca728fb2767 Anshuman Khandual 2022-04-28  64  	if (vm_flags & VM_ARM64_B=
TI)
b3aca728fb2767 Anshuman Khandual 2022-04-28  65  		prot |=3D PTE_GP;
b3aca728fb2767 Anshuman Khandual 2022-04-28  66  =

b3aca728fb2767 Anshuman Khandual 2022-04-28  67  	/*
b3aca728fb2767 Anshuman Khandual 2022-04-28  68  	 * There are two conditio=
ns required for returning a Normal Tagged
b3aca728fb2767 Anshuman Khandual 2022-04-28  69  	 * memory type: (1) the u=
ser requested it via PROT_MTE passed to
b3aca728fb2767 Anshuman Khandual 2022-04-28  70  	 * mmap() or mprotect() a=
nd (2) the corresponding vma supports MTE. We
b3aca728fb2767 Anshuman Khandual 2022-04-28  71  	 * register (1) as VM_MTE=
 in the vma->vm_flags and (2) as
b3aca728fb2767 Anshuman Khandual 2022-04-28  72  	 * VM_MTE_ALLOWED. Note t=
hat the latter can only be set during the
b3aca728fb2767 Anshuman Khandual 2022-04-28  73  	 * mmap() call since mpro=
tect() does not accept MAP_* flags.
b3aca728fb2767 Anshuman Khandual 2022-04-28  74  	 * Checking for VM_MTE on=
ly is sufficient since arch_validate_flags()
b3aca728fb2767 Anshuman Khandual 2022-04-28  75  	 * does not permit (VM_MT=
E & !VM_MTE_ALLOWED).
b3aca728fb2767 Anshuman Khandual 2022-04-28  76  	 */
b3aca728fb2767 Anshuman Khandual 2022-04-28 @77  	if (vm_flags & VM_MTE)

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0332791573656066283==--

