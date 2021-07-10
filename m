Content-Type: multipart/mixed; boundary="===============9179168291832785483=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/nds32/kernel/setup.c:247:26: warning: Unused variable: region [unusedVariable]
Date: Sat, 10 Jul 2021 13:07:51 +0800
Message-ID: <202107101341.iLqbmT8w-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9179168291832785483==
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
head:   50be9417e23af5a8ac860d998e1e3f06b8fd79d7
commit: 80c4574417ae42fe2ba6978772854dc67cfc5331 h8300, nds32, openrisc: si=
mplify detection of memory extents
date:   9 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 9 months ago
compiler: nds32le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/nds32/kernel/setup.c:247:26: warning: Unused variable: region [unus=
edVariable]
    struct memblock_region *region;
                            ^

vim +247 arch/nds32/kernel/setup.c

001d953ede35df Greentime Hu  2017-10-24  241  =

001d953ede35df Greentime Hu  2017-10-24  242  static void __init setup_memo=
ry(void)
001d953ede35df Greentime Hu  2017-10-24  243  {
001d953ede35df Greentime Hu  2017-10-24  244  	unsigned long ram_start_pfn;
001d953ede35df Greentime Hu  2017-10-24  245  	unsigned long free_ram_start=
_pfn;
001d953ede35df Greentime Hu  2017-10-24  246  	phys_addr_t memory_start, me=
mory_end;
001d953ede35df Greentime Hu  2017-10-24 @247  	struct memblock_region *regi=
on;
001d953ede35df Greentime Hu  2017-10-24  248  =

001d953ede35df Greentime Hu  2017-10-24  249  	memory_end =3D memory_start =
=3D 0;
001d953ede35df Greentime Hu  2017-10-24  250  =

001d953ede35df Greentime Hu  2017-10-24  251  	/* Find main memory where is=
 the kernel */
80c4574417ae42 Mike Rapoport 2020-10-13  252  	memory_start =3D memblock_st=
art_of_DRAM();
80c4574417ae42 Mike Rapoport 2020-10-13  253  	memory_end =3D memblock_end_=
of_DRAM();
001d953ede35df Greentime Hu  2017-10-24  254  =

001d953ede35df Greentime Hu  2017-10-24  255  	if (!memory_end) {
001d953ede35df Greentime Hu  2017-10-24  256  		panic("No memory!");
001d953ede35df Greentime Hu  2017-10-24  257  	}
001d953ede35df Greentime Hu  2017-10-24  258  =

001d953ede35df Greentime Hu  2017-10-24  259  	ram_start_pfn =3D PFN_UP(mem=
block_start_of_DRAM());
001d953ede35df Greentime Hu  2017-10-24  260  	/* free_ram_start_pfn is fir=
st page after kernel */
001d953ede35df Greentime Hu  2017-10-24  261  	free_ram_start_pfn =3D PFN_U=
P(__pa(&_end));
001d953ede35df Greentime Hu  2017-10-24  262  	max_pfn =3D PFN_DOWN(membloc=
k_end_of_DRAM());
001d953ede35df Greentime Hu  2017-10-24  263  	/* it could update max_pfn */
001d953ede35df Greentime Hu  2017-10-24  264  	if (max_pfn - ram_start_pfn =
<=3D MAXMEM_PFN)
001d953ede35df Greentime Hu  2017-10-24  265  		max_low_pfn =3D max_pfn;
001d953ede35df Greentime Hu  2017-10-24  266  	else {
001d953ede35df Greentime Hu  2017-10-24  267  		max_low_pfn =3D MAXMEM_PFN =
+ ram_start_pfn;
001d953ede35df Greentime Hu  2017-10-24  268  		if (!IS_ENABLED(CONFIG_HIGH=
MEM))
001d953ede35df Greentime Hu  2017-10-24  269  			max_pfn =3D MAXMEM_PFN + r=
am_start_pfn;
001d953ede35df Greentime Hu  2017-10-24  270  	}
001d953ede35df Greentime Hu  2017-10-24  271  	/* high_memory is related wi=
th VMALLOC */
001d953ede35df Greentime Hu  2017-10-24  272  	high_memory =3D (void *)__va=
(max_low_pfn * PAGE_SIZE);
001d953ede35df Greentime Hu  2017-10-24  273  	min_low_pfn =3D free_ram_sta=
rt_pfn;
001d953ede35df Greentime Hu  2017-10-24  274  =

001d953ede35df Greentime Hu  2017-10-24  275  	/*
001d953ede35df Greentime Hu  2017-10-24  276  	 * initialize the boot-time =
allocator (with low memory only).
001d953ede35df Greentime Hu  2017-10-24  277  	 *
001d953ede35df Greentime Hu  2017-10-24  278  	 * This makes the memory fro=
m the end of the kernel to the end of
001d953ede35df Greentime Hu  2017-10-24  279  	 * RAM usable.
001d953ede35df Greentime Hu  2017-10-24  280  	 */
001d953ede35df Greentime Hu  2017-10-24  281  	memblock_set_bottom_up(true);
001d953ede35df Greentime Hu  2017-10-24  282  	memblock_reserve(PFN_PHYS(ra=
m_start_pfn), PFN_PHYS(free_ram_start_pfn - ram_start_pfn));
001d953ede35df Greentime Hu  2017-10-24  283  =

001d953ede35df Greentime Hu  2017-10-24  284  	early_init_fdt_reserve_self(=
);
001d953ede35df Greentime Hu  2017-10-24  285  	early_init_fdt_scan_reserved=
_mem();
001d953ede35df Greentime Hu  2017-10-24  286  =

001d953ede35df Greentime Hu  2017-10-24  287  	memblock_dump_all();
001d953ede35df Greentime Hu  2017-10-24  288  }
001d953ede35df Greentime Hu  2017-10-24  289  =


:::::: The code@line 247 was first introduced by commit
:::::: 001d953ede35dfb135e636af4b41d5dd20a09471 nds32: Kernel booting and i=
nitialization

:::::: TO: Greentime Hu <greentime@andestech.com>
:::::: CC: Greentime Hu <greentime@andestech.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9179168291832785483==--

