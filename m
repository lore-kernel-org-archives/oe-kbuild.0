Content-Type: multipart/mixed; boundary="===============5747634603270536764=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:next/linux-next/master 111/370] arch/arm64/mm/mmap.c:105 arm64_arch_vm_get_page_prot() warn: bitwise AND condition is false here
Date: Mon, 28 Feb 2022 08:04:14 +0800
Message-ID: <202202280824.dFcPJfKY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5747634603270536764==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Anshuman Khandual <anshuman.khandual@arm.com>
CC: Mark Brown <broonie@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://github.com/ammarfaizi2/linux-block next/linux-next/master
head:   06aeb1495c39c86ccfaf1adadc1d2200179f16eb
commit: 7090dbe0b837b67ecb1b454e868f90797f0a69bc [111/370] arm64/mm: enable=
 ARCH_HAS_VM_GET_PAGE_PROT
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-m031-20220227 (https://download.01.org/0day-ci/arc=
hive/20220228/202202280824.dFcPJfKY-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/arm64/mm/mmap.c:105 arm64_arch_vm_get_page_prot() warn: bitwise AND co=
ndition is false here

vim +105 arch/arm64/mm/mmap.c

7090dbe0b837b6 Anshuman Khandual 2022-02-26   87  =

7090dbe0b837b6 Anshuman Khandual 2022-02-26   88  static pgprot_t arm64_arc=
h_vm_get_page_prot(unsigned long vm_flags)
7090dbe0b837b6 Anshuman Khandual 2022-02-26   89  {
7090dbe0b837b6 Anshuman Khandual 2022-02-26   90  	pteval_t prot =3D 0;
7090dbe0b837b6 Anshuman Khandual 2022-02-26   91  =

7090dbe0b837b6 Anshuman Khandual 2022-02-26   92  	if (vm_flags & VM_ARM64_=
BTI)
7090dbe0b837b6 Anshuman Khandual 2022-02-26   93  		prot |=3D PTE_GP;
7090dbe0b837b6 Anshuman Khandual 2022-02-26   94  =

7090dbe0b837b6 Anshuman Khandual 2022-02-26   95  	/*
7090dbe0b837b6 Anshuman Khandual 2022-02-26   96  	 * There are two conditi=
ons required for returning a Normal Tagged
7090dbe0b837b6 Anshuman Khandual 2022-02-26   97  	 * memory type: (1) the =
user requested it via PROT_MTE passed to
7090dbe0b837b6 Anshuman Khandual 2022-02-26   98  	 * mmap() or mprotect() =
and (2) the corresponding vma supports MTE. We
7090dbe0b837b6 Anshuman Khandual 2022-02-26   99  	 * register (1) as VM_MT=
E in the vma->vm_flags and (2) as
7090dbe0b837b6 Anshuman Khandual 2022-02-26  100  	 * VM_MTE_ALLOWED. Note =
that the latter can only be set during the
7090dbe0b837b6 Anshuman Khandual 2022-02-26  101  	 * mmap() call since mpr=
otect() does not accept MAP_* flags.
7090dbe0b837b6 Anshuman Khandual 2022-02-26  102  	 * Checking for VM_MTE o=
nly is sufficient since arch_validate_flags()
7090dbe0b837b6 Anshuman Khandual 2022-02-26  103  	 * does not permit (VM_M=
TE & !VM_MTE_ALLOWED).
7090dbe0b837b6 Anshuman Khandual 2022-02-26  104  	 */
7090dbe0b837b6 Anshuman Khandual 2022-02-26 @105  	if (vm_flags & VM_MTE)
7090dbe0b837b6 Anshuman Khandual 2022-02-26  106  		prot |=3D PTE_ATTRINDX(=
MT_NORMAL_TAGGED);
7090dbe0b837b6 Anshuman Khandual 2022-02-26  107  =

7090dbe0b837b6 Anshuman Khandual 2022-02-26  108  	return __pgprot(prot);
7090dbe0b837b6 Anshuman Khandual 2022-02-26  109  }
7090dbe0b837b6 Anshuman Khandual 2022-02-26  110  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5747634603270536764==--

