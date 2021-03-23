Content-Type: multipart/mixed; boundary="===============0983516436127237194=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/h8300/kernel/setup.c:72:26: warning: Unused variable: region
Date: Tue, 23 Mar 2021 18:37:19 +0800
Message-ID: <202103231816.uz2dCulZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0983516436127237194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mike Rapoport <rppt@linux.ibm.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   84196390620ac0e5070ae36af84c137c6216a7dc
commit: 80c4574417ae42fe2ba6978772854dc67cfc5331 h8300, nds32, openrisc: si=
mplify detection of memory extents
date:   5 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 5 months ago
compiler: h8300-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/h8300/kernel/setup.c:72:26: warning: Unused variable: region [unuse=
dVariable]
    struct memblock_region *region;
                            ^

vim +72 arch/h8300/kernel/setup.c

d8b0bdb444ed0e Yoshinori Sato 2015-05-11  69  =

d8b0bdb444ed0e Yoshinori Sato 2015-05-11  70  static void __init bootmem_in=
it(void)
d8b0bdb444ed0e Yoshinori Sato 2015-05-11  71  {
d8b0bdb444ed0e Yoshinori Sato 2015-05-11 @72  	struct memblock_region *regi=
on;
d8b0bdb444ed0e Yoshinori Sato 2015-05-11  73  =

d8b0bdb444ed0e Yoshinori Sato 2015-05-11  74  	memory_end =3D memory_start =
=3D 0;
d8b0bdb444ed0e Yoshinori Sato 2015-05-11  75  =

d8b0bdb444ed0e Yoshinori Sato 2015-05-11  76  	/* Find main memory where is=
 the kernel */
80c4574417ae42 Mike Rapoport  2020-10-13  77  	memory_start =3D memblock_st=
art_of_DRAM();
80c4574417ae42 Mike Rapoport  2020-10-13  78  	memory_end =3D memblock_end_=
of_DRAM();
d8b0bdb444ed0e Yoshinori Sato 2015-05-11  79  =

d8b0bdb444ed0e Yoshinori Sato 2015-05-11  80  	if (!memory_end)
d8b0bdb444ed0e Yoshinori Sato 2015-05-11  81  		panic("No memory!");
d8b0bdb444ed0e Yoshinori Sato 2015-05-11  82  =

c489dfefe739d3 Rob Herring    2018-03-16  83  	/* setup bootmem globals (we=
 use no_bootmem, but mm still depends on this) */
c489dfefe739d3 Rob Herring    2018-03-16  84  	min_low_pfn =3D PFN_UP(memor=
y_start);
80c4574417ae42 Mike Rapoport  2020-10-13  85  	max_low_pfn =3D PFN_DOWN(mem=
ory_end);
c489dfefe739d3 Rob Herring    2018-03-16  86  	max_pfn =3D max_low_pfn;
d8b0bdb444ed0e Yoshinori Sato 2015-05-11  87  =

c489dfefe739d3 Rob Herring    2018-03-16  88  	memblock_reserve(__pa(_stext=
), _end - _stext);
d8b0bdb444ed0e Yoshinori Sato 2015-05-11  89  =

c489dfefe739d3 Rob Herring    2018-03-16  90  	early_init_fdt_reserve_self(=
);
c489dfefe739d3 Rob Herring    2018-03-16  91  	early_init_fdt_scan_reserved=
_mem();
d8b0bdb444ed0e Yoshinori Sato 2015-05-11  92  =

c489dfefe739d3 Rob Herring    2018-03-16  93  	memblock_dump_all();
d8b0bdb444ed0e Yoshinori Sato 2015-05-11  94  }
d8b0bdb444ed0e Yoshinori Sato 2015-05-11  95  =


:::::: The code at line 72 was first introduced by commit
:::::: d8b0bdb444ed0e2bd5f9d3ea7412cb90bdec58cf h8300: kernel startup

:::::: TO: Yoshinori Sato <ysato@users.sourceforge.jp>
:::::: CC: Yoshinori Sato <ysato@users.sourceforge.jp>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0983516436127237194==--

