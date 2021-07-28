Content-Type: multipart/mixed; boundary="===============2298313920006887371=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rppt-memblock:for-kernelci 1/1] arch/x86/mm/init.c:608:16: warning: Unused variable: addr [unusedVariable]
Date: Thu, 29 Jul 2021 06:02:39 +0800
Message-ID: <202107290634.0kIwHvbB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2298313920006887371==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Mike Rapoport <rppt@kernel.org>
CC: linux-kernel(a)vger.kernel.org
TO: Mike Rapoport <rppt@linux.ibm.com>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git for=
-kernelci
head:   a7952e9b7cc1a4fef2969ce182dabbc08aa9dbed
commit: a7952e9b7cc1a4fef2969ce182dabbc08aa9dbed [1/1] memblock: make membl=
ock_find_in_range method private
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
compiler: gcc-10 (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/x86/mm/init.c:608:16: warning: Unused variable: addr [unusedVariabl=
e]
    unsigned long addr;
                  ^

vim +608 arch/x86/mm/init.c

6979287a7df66a9 Yinghai Lu    2013-09-06  592  =

0167d7d8b0beb4c Tang Chen     2013-11-12  593  /**
0167d7d8b0beb4c Tang Chen     2013-11-12  594   * memory_map_top_down - Map=
 [map_start, map_end) top down
0167d7d8b0beb4c Tang Chen     2013-11-12  595   * @map_start: start address=
 of the target memory range
0167d7d8b0beb4c Tang Chen     2013-11-12  596   * @map_end: end address of =
the target memory range
0167d7d8b0beb4c Tang Chen     2013-11-12  597   *
0167d7d8b0beb4c Tang Chen     2013-11-12  598   * This function will setup =
direct mapping for memory range
0167d7d8b0beb4c Tang Chen     2013-11-12  599   * [map_start, map_end) in t=
op-down. That said, the page tables
0167d7d8b0beb4c Tang Chen     2013-11-12  600   * will be allocated at the =
end of the memory, and we map the
0167d7d8b0beb4c Tang Chen     2013-11-12  601   * memory in top-down.
0167d7d8b0beb4c Tang Chen     2013-11-12  602   */
0167d7d8b0beb4c Tang Chen     2013-11-12  603  static void __init memory_ma=
p_top_down(unsigned long map_start,
0167d7d8b0beb4c Tang Chen     2013-11-12  604  				       unsigned long map=
_end)
c14fa0b63b5b423 Yinghai Lu    2012-11-16  605  {
bab202ab87ba4da Lukas Bulwahn 2020-09-28  606  	unsigned long real_end, las=
t_start;
8d57470d8f85963 Yinghai Lu    2012-11-16  607  	unsigned long step_size;
8d57470d8f85963 Yinghai Lu    2012-11-16 @608  	unsigned long addr;
8d57470d8f85963 Yinghai Lu    2012-11-16  609  	unsigned long mapped_ram_si=
ze =3D 0;
ab9519376e86fbb Yinghai Lu    2012-11-16  610  =


:::::: The code at line 608 was first introduced by commit
:::::: 8d57470d8f859635deffe3919d7d4867b488b85a x86, mm: setup page table i=
n top-down

:::::: TO: Yinghai Lu <yinghai@kernel.org>
:::::: CC: H. Peter Anvin <hpa@linux.intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2298313920006887371==--

