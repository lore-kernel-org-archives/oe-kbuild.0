Content-Type: multipart/mixed; boundary="===============6101077714481512194=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hnaz-mm:master 47/386] mm/sparse-vmemmap.c:709:17: warning: Value stored to 'next' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 25 Feb 2022 10:08:22 +0800
Message-ID: <202202251025.0VydFBPN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6101077714481512194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Joao Martins <joao.m.martins@oracle.com>
CC: Johannes Weiner <hannes@cmpxchg.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://github.com/hnaz/linux-mm master
head:   218d3ca9c0ea1c35f1bc5099325b7df54b52bbdd
commit: 853d35e4e8f54be8038523720a7b26119db9adca [47/386] mm/sparse-vmemmap=
: improve memory savings for compound devmaps
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20225/202202251025.0VydFBPN-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/hnaz/linux-mm/commit/853d35e4e8f54be8038523720=
a7b26119db9adca
        git remote add hnaz-mm https://github.com/hnaz/linux-mm
        git fetch --no-tags hnaz-mm master
        git checkout 853d35e4e8f54be8038523720a7b26119db9adca
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                     ^~   ~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:533:28: note: Value stored to 'ci' during its initializati=
on is never read
           struct swap_cluster_info *ci =3D si->cluster_info + idx;
                                     ^~   ~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:1322:2: warning: Value stored to 'count' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           count =3D p->swap_map[offset];
           ^       ~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:1322:2: note: Value stored to 'count' is never read
           count =3D p->swap_map[offset];
           ^       ~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   mm/sparse-vmemmap.c:346:2: warning: Assigned value is garbage or undefin=
ed [clang-analyzer-core.uninitialized.Assign]
           list_for_each_entry_safe(page, next, list, lru)
           ^
   include/linux/list.h:726:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/container_of.h:18:2: note: expanded from macro 'container_=
of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^
   mm/sparse-vmemmap.c:375:9: note: Assuming the condition is false
           BUG_ON(start - reuse !=3D PAGE_SIZE);
                  ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   mm/sparse-vmemmap.c:375:2: note: Taking false branch
           BUG_ON(start - reuse !=3D PAGE_SIZE);
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   mm/sparse-vmemmap.c:375:2: note: Loop condition is false.  Exiting loop
           BUG_ON(start - reuse !=3D PAGE_SIZE);
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   mm/sparse-vmemmap.c:377:6: note: Calling 'alloc_vmemmap_page_list'
           if (alloc_vmemmap_page_list(start, end, gfp_mask, &vmemmap_pages=
))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/sparse-vmemmap.c:337:2: note: Loop condition is true.  Entering loop =
body
           while (nr_pages--) {
           ^
   mm/sparse-vmemmap.c:338:10: note: Calling 'alloc_pages_node'
                   page =3D alloc_pages_node(nid, gfp_mask, 0);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/gfp.h:592:2: note: Taking false branch
           if (nid =3D=3D NUMA_NO_NODE)
           ^
   include/linux/gfp.h:595:2: note: Returning pointer, which participates i=
n a condition later
           return __alloc_pages_node(nid, gfp_mask, order);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/sparse-vmemmap.c:338:10: note: Returning from 'alloc_pages_node'
                   page =3D alloc_pages_node(nid, gfp_mask, 0);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/sparse-vmemmap.c:339:7: note: Assuming 'page' is null
                   if (!page)
                       ^~~~~
   mm/sparse-vmemmap.c:339:3: note: Taking true branch
                   if (!page)
                   ^
   mm/sparse-vmemmap.c:340:4: note: Control jumps to line 346
                           goto out;
                           ^
   mm/sparse-vmemmap.c:346:2: note: Assigned value is garbage or undefined
           list_for_each_entry_safe(page, next, list, lru)
           ^
   include/linux/list.h:726:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:2: note: expanded from macro 'container_=
of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^              ~~~~~~~~~~~~~
>> mm/sparse-vmemmap.c:709:17: warning: Value stored to 'next' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
                   unsigned long next =3D addr, last =3D addr + size;
                                 ^~~~   ~~~~
   mm/sparse-vmemmap.c:709:17: note: Value stored to 'next' during its init=
ialization is never read
                   unsigned long next =3D addr, last =3D addr + size;
                                 ^~~~   ~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   arch/x86/include/asm/paravirt.h:55:2: warning: Assigned value is garbage=
 or undefined [clang-analyzer-core.uninitialized.Assign]
           PVOP_VCALL0(cpu.io_delay);
           ^
   arch/x86/include/asm/paravirt_types.h:512:2: note: expanded from macro '=
PVOP_VCALL0'
           __PVOP_VCALL(op)
           ^
   arch/x86/include/asm/paravirt_types.h:492:8: note: expanded from macro '=
__PVOP_VCALL'
           (void)____PVOP_CALL(, op, CLBR_ANY, PVOP_VCALL_CLOBBERS,        \
                 ^
   arch/x86/include/asm/paravirt_types.h:447:3: note: expanded from macro '=
____PVOP_CALL'
                   PVOP_CALL_ARGS;                                         \
                   ^
   arch/x86/include/asm/paravirt_types.h:405:16: note: expanded from macro =
'PVOP_CALL_ARGS'
           unsigned long __edi =3D __edi, __esi =3D __esi,             \
                         ^
   drivers/hwmon/abituguru3.c:659:16: note: Calling 'inb_p'
           while (!((x =3D inb_p(data->addr + ABIT_UGURU3_DATA)) &
                         ^
   arch/x86/include/asm/io.h:327:15: note: expanded from macro 'inb_p'
   #define inb_p inb_p
                 ^
   arch/x86/include/asm/io.h:320:1: note: Calling 'slow_down_io'
   BUILDIO(b, b, char)
   ^
   arch/x86/include/asm/io.h:284:2: note: expanded from macro 'BUILDIO'
           slow_down_io();                                                 \
           ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:55:2: note: Assigned value is garbage or=
 undefined
           PVOP_VCALL0(cpu.io_delay);
           ^
   arch/x86/include/asm/paravirt_types.h:512:2: note: expanded from macro '=
PVOP_VCALL0'
           __PVOP_VCALL(op)
           ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:492:8: note: expanded from macro '=
__PVOP_VCALL'
           (void)____PVOP_CALL(, op, CLBR_ANY, PVOP_VCALL_CLOBBERS,        \
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:447:3: note: expanded from macro '=
____PVOP_CALL'
                   PVOP_CALL_ARGS;                                         \
                   ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:405:16: note: expanded from macro =
'PVOP_CALL_ARGS'
           unsigned long __edi =3D __edi, __esi =3D __esi,             \
                         ^       ~~~~~
   drivers/hwmon/abituguru3.c:720:10: warning: Although the value stored to=
 'x' is used in the enclosing expression, the value is never actually read =
from 'x' [clang-analyzer-deadcode.DeadStores]
           while ((x =3D inb(data->addr + ABIT_UGURU3_CMD)) !=3D 0xAC) {
                   ^
   drivers/hwmon/abituguru3.c:720:10: note: Although the value stored to 'x=
' is used in the enclosing expression, the value is never actually read fro=
m 'x'
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/nvdimm/security.c:55:17: warning: Value stored to 'dev' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &nvdimm->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/nvdimm/security.c:55:17: note: Value stored to 'dev' during its =
initialization is never read
           struct device *dev =3D &nvdimm->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/nvdimm/security.c:96:17: warning: Value stored to 'dev' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &nvdimm->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/nvdimm/security.c:96:17: note: Value stored to 'dev' during its =
initialization is never read
           struct device *dev =3D &nvdimm->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/nvdimm/security.c:226:17: warning: Value stored to 'dev' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &nvdimm->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/nvdimm/security.c:226:17: note: Value stored to 'dev' during its=
 initialization is never read
           struct device *dev =3D &nvdimm->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/nvdimm/security.c:532:8: warning: 2nd function call argument is =
an uninitialized value [clang-analyzer-core.CallAndMessage]
                   rc =3D security_disable(nvdimm, key);
                        ^                        ~~~
   drivers/nvdimm/security.c:506:15: note: 'key' declared without an initia=
l value
           unsigned int key, newkey;
                        ^~~
   drivers/nvdimm/security.c:513:6: note: Assuming 'rc' is >=3D 1

vim +/next +709 mm/sparse-vmemmap.c

853d35e4e8f54b Joao Martins      2022-02-24  685  =

853d35e4e8f54b Joao Martins      2022-02-24  686  static int __meminit vmem=
map_populate_compound_pages(unsigned long start_pfn,
853d35e4e8f54b Joao Martins      2022-02-24  687  						     unsigned long =
start,
853d35e4e8f54b Joao Martins      2022-02-24  688  						     unsigned long =
end, int node,
853d35e4e8f54b Joao Martins      2022-02-24  689  						     struct dev_pag=
emap *pgmap)
853d35e4e8f54b Joao Martins      2022-02-24  690  {
853d35e4e8f54b Joao Martins      2022-02-24  691  	unsigned long size, addr;
853d35e4e8f54b Joao Martins      2022-02-24  692  	pte_t *pte;
853d35e4e8f54b Joao Martins      2022-02-24  693  	int rc;
853d35e4e8f54b Joao Martins      2022-02-24  694  =

853d35e4e8f54b Joao Martins      2022-02-24  695  	if (reuse_compound_secti=
on(start_pfn, pgmap)) {
853d35e4e8f54b Joao Martins      2022-02-24  696  		pte =3D compound_sectio=
n_tail_page(start);
dae402b517d2a3 Joao Martins      2022-02-24  697  		if (!pte)
dae402b517d2a3 Joao Martins      2022-02-24  698  			return -ENOMEM;
853d35e4e8f54b Joao Martins      2022-02-24  699  =

853d35e4e8f54b Joao Martins      2022-02-24  700  		/*
853d35e4e8f54b Joao Martins      2022-02-24  701  		 * Reuse the page that =
was populated in the prior iteration
853d35e4e8f54b Joao Martins      2022-02-24  702  		 * with just tail struc=
t pages.
853d35e4e8f54b Joao Martins      2022-02-24  703  		 */
853d35e4e8f54b Joao Martins      2022-02-24  704  		return vmemmap_populate=
_range(start, end, node, pte_page(*pte));
853d35e4e8f54b Joao Martins      2022-02-24  705  	}
853d35e4e8f54b Joao Martins      2022-02-24  706  =

853d35e4e8f54b Joao Martins      2022-02-24  707  	size =3D min(end - start=
, pgmap_vmemmap_nr(pgmap) * sizeof(struct page));
853d35e4e8f54b Joao Martins      2022-02-24  708  	for (addr =3D start; add=
r < end; addr +=3D size) {
853d35e4e8f54b Joao Martins      2022-02-24 @709  		unsigned long next =3D =
addr, last =3D addr + size;
853d35e4e8f54b Joao Martins      2022-02-24  710  =

853d35e4e8f54b Joao Martins      2022-02-24  711  		/* Populate the head pa=
ge vmemmap page */
853d35e4e8f54b Joao Martins      2022-02-24  712  		pte =3D vmemmap_populat=
e_address(addr, node, NULL, NULL);
853d35e4e8f54b Joao Martins      2022-02-24  713  		if (!pte)
853d35e4e8f54b Joao Martins      2022-02-24  714  			return -ENOMEM;
853d35e4e8f54b Joao Martins      2022-02-24  715  =

853d35e4e8f54b Joao Martins      2022-02-24  716  		/* Populate the tail pa=
ges vmemmap page */
853d35e4e8f54b Joao Martins      2022-02-24  717  		next =3D addr + PAGE_SI=
ZE;
853d35e4e8f54b Joao Martins      2022-02-24  718  		pte =3D vmemmap_populat=
e_address(next, node, NULL, NULL);
853d35e4e8f54b Joao Martins      2022-02-24  719  		if (!pte)
853d35e4e8f54b Joao Martins      2022-02-24  720  			return -ENOMEM;
853d35e4e8f54b Joao Martins      2022-02-24  721  =

853d35e4e8f54b Joao Martins      2022-02-24  722  		/*
853d35e4e8f54b Joao Martins      2022-02-24  723  		 * Reuse the previous p=
age for the rest of tail pages
853d35e4e8f54b Joao Martins      2022-02-24  724  		 * See layout diagram i=
n Documentation/vm/vmemmap_dedup.rst
853d35e4e8f54b Joao Martins      2022-02-24  725  		 */
853d35e4e8f54b Joao Martins      2022-02-24  726  		next +=3D PAGE_SIZE;
853d35e4e8f54b Joao Martins      2022-02-24  727  		rc =3D vmemmap_populate=
_range(next, last, node, pte_page(*pte));
853d35e4e8f54b Joao Martins      2022-02-24  728  		if (rc)
853d35e4e8f54b Joao Martins      2022-02-24  729  			return -ENOMEM;
8f6aac419bd590 Christoph Lameter 2007-10-16  730  	}
29c71111d05573 Andy Whitcroft    2007-10-16  731  =

29c71111d05573 Andy Whitcroft    2007-10-16  732  	return 0;
8f6aac419bd590 Christoph Lameter 2007-10-16  733  }
8f6aac419bd590 Christoph Lameter 2007-10-16  734  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============6101077714481512194==--

