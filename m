Content-Type: multipart/mixed; boundary="===============0070974663891708189=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rppt:gfp-unmapped/v0 1/3] mm/page_alloc.c:2656:16: warning: Value stored to 'start_addr' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 22 Jan 2022 06:47:39 +0800
Message-ID: <202201220612.bMAwh2Bt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0070974663891708189==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Mike Rapoport <rppt@kernel.org>
CC: linux-kernel(a)vger.kernel.org
TO: Mike Rapoport <rppt@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-=
unmapped/v0
head:   53acd000a0eef1457aaa4930c0d2003d7785f799
commit: 253f456a5cb652a16a59cc4ac2e18669997d79cd [1/3] mm/page_alloc: intro=
duce __GFP_UNMAPPED and MIGRETE_UNMAPPED
:::::: branch date: 34 hours ago
:::::: commit date: 35 hours ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20122/202201220612.bMAwh2Bt-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d4baf3=
b1322b84816aa623d8e8cb45a49cb68b84)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/co=
mmit/?id=3D253f456a5cb652a16a59cc4ac2e18669997d79cd
        git remote add rppt https://git.kernel.org/pub/scm/linux/kernel/git=
/rppt/linux.git
        git fetch --no-tags rppt gfp-unmapped/v0
        git checkout 253f456a5cb652a16a59cc4ac2e18669997d79cd
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
            ^
   mm/page_alloc.c:1512:20: note: Left side of '||' is true
           int prefetch_nr =3D READ_ONCE(pcp->batch);
                             ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:314:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   mm/page_alloc.c:1512:20: note: Taking false branch
           int prefetch_nr =3D READ_ONCE(pcp->batch);
                             ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   mm/page_alloc.c:1512:20: note: Loop condition is false.  Exiting loop
           int prefetch_nr =3D READ_ONCE(pcp->batch);
                             ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   mm/page_alloc.c:1521:10: note: '__UNIQUE_ID___x910' is >=3D '__UNIQUE_ID=
___y911'
           count =3D min(pcp->count, count);
                   ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   mm/page_alloc.c:1521:10: note: '?' condition is false
           count =3D min(pcp->count, count);
                   ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   mm/page_alloc.c:1522:9: note: Assuming 'count' is <=3D 0
           while (count > 0) {
                  ^~~~~~~~~
   mm/page_alloc.c:1522:2: note: Loop condition is false. Execution continu=
es on line 1576
           while (count > 0) {
           ^
   mm/page_alloc.c:1589:2: note: Assigned value is garbage or undefined
           list_for_each_entry_safe(page, tmp, &head, lru) {
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
>> mm/page_alloc.c:2656:16: warning: Value stored to 'start_addr' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned long start_addr =3D PFN_PHYS(start_pfn);
                         ^~~~~~~~~~
   mm/page_alloc.c:2656:16: note: Value stored to 'start_addr' during its i=
nitialization is never read
           unsigned long start_addr =3D PFN_PHYS(start_pfn);
                         ^~~~~~~~~~
>> mm/page_alloc.c:2657:16: warning: Value stored to 'end_addr' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned long end_addr =3D PFN_PHYS(end_pfn);
                         ^~~~~~~~
   mm/page_alloc.c:2657:16: note: Value stored to 'end_addr' during its ini=
tialization is never read
           unsigned long end_addr =3D PFN_PHYS(end_pfn);
                         ^~~~~~~~
   mm/page_alloc.c:5462:29: warning: Array access (from variable 'page_arra=
y') results in a null pointer dereference [clang-analyzer-core.NullDerefere=
nce]
                           page_array[nr_populated] =3D page;
                           ~~~~~~~~~~               ^
   mm/page_alloc.c:5364:9: note: Assuming 'page_array' is null
           while (page_array && nr_populated < nr_pages && page_array[nr_po=
pulated])
                  ^~~~~~~~~~
   mm/page_alloc.c:5364:20: note: Left side of '&&' is false
           while (page_array && nr_populated < nr_pages && page_array[nr_po=
pulated])
                             ^
   mm/page_alloc.c:5368:15: note: Assuming 'nr_pages' is > 0
           if (unlikely(nr_pages <=3D 0))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   mm/page_alloc.c:5368:2: note: Taking false branch
           if (unlikely(nr_pages <=3D 0))
           ^
   mm/page_alloc.c:5372:15: note: 'page_array' is null
           if (unlikely(page_array && nr_pages - nr_populated =3D=3D 0))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   mm/page_alloc.c:5372:26: note: Left side of '&&' is false
           if (unlikely(page_array && nr_pages - nr_populated =3D=3D 0))
                                   ^
   mm/page_alloc.c:5372:2: note: Taking false branch
           if (unlikely(page_array && nr_pages - nr_populated =3D=3D 0))
           ^
   mm/page_alloc.c:5376:6: note: Calling 'memcg_kmem_enabled'
           if (memcg_kmem_enabled() && (gfp & __GFP_ACCOUNT))
               ^~~~~~~~~~~~~~~~~~~~
   include/linux/memcontrol.h:1747:2: note: Returning zero, which participa=
tes in a condition later
           return false;
           ^~~~~~~~~~~~
   mm/page_alloc.c:5376:6: note: Returning from 'memcg_kmem_enabled'
           if (memcg_kmem_enabled() && (gfp & __GFP_ACCOUNT))
               ^~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:5376:27: note: Left side of '&&' is false
           if (memcg_kmem_enabled() && (gfp & __GFP_ACCOUNT))
                                    ^
   mm/page_alloc.c:5380:6: note: Assuming the condition is false
           if (nr_pages - nr_populated =3D=3D 1)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:5380:2: note: Taking false branch
           if (nr_pages - nr_populated =3D=3D 1)
           ^
   mm/page_alloc.c:5384:6: note: Assuming the condition is false
           if (gfp & __GFP_UNMAPPED)
               ^~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:5384:2: note: Taking false branch
           if (gfp & __GFP_UNMAPPED)
           ^
   mm/page_alloc.c:5402:7: note: Calling 'prepare_alloc_pages'
           if (!prepare_alloc_pages(gfp, 0, preferred_nid, nodemask, &ac, &=
alloc_gfp, &alloc_flags))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:5288:2: note: Taking false branch
           if (cpusets_enabled()) {
           ^
   mm/page_alloc.c:5303:2: note: Taking true branch
           might_sleep_if(gfp_mask & __GFP_DIRECT_RECLAIM);
           ^
   include/linux/kernel.h:188:35: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                     ^
   mm/page_alloc.c:5303:2: note: Loop condition is false.  Exiting loop
           might_sleep_if(gfp_mask & __GFP_DIRECT_RECLAIM);
           ^
   include/linux/kernel.h:188:45: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                               ^
   include/linux/kernel.h:138:2: note: expanded from macro 'might_sleep'
           do { __might_sleep(__FILE__, __LINE__); might_resched(); } while=
 (0)
           ^
   mm/page_alloc.c:5303:2: note: Loop condition is false.  Exiting loop
           might_sleep_if(gfp_mask & __GFP_DIRECT_RECLAIM);
           ^
   include/linux/kernel.h:188:30: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                ^
   mm/page_alloc.c:5305:2: note: Taking false branch
           if (should_fail_alloc_page(gfp_mask, order))
           ^
   mm/page_alloc.c:5321:2: note: Returning the value 1, which participates =
in a condition later
           return true;
           ^~~~~~~~~~~
   mm/page_alloc.c:5402:7: note: Returning from 'prepare_alloc_pages'
           if (!prepare_alloc_pages(gfp, 0, preferred_nid, nodemask, &ac, &=
alloc_gfp, &alloc_flags))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:5402:2: note: Taking false branch
           if (!prepare_alloc_pages(gfp, 0, preferred_nid, nodemask, &ac, &=
alloc_gfp, &alloc_flags))
           ^
   mm/page_alloc.c:5407:2: note: Loop condition is true.  Entering loop body
           for_each_zone_zonelist_nodemask(zone, z, ac.zonelist, ac.highest=
_zoneidx, ac.nodemask) {

vim +/start_addr +2656 mm/page_alloc.c

c361be55b31284 Mel Gorman    2007-10-16  2649  =

253f456a5cb652 Mike Rapoport 2022-01-04  2650  static int set_pageblock_unm=
apped(struct zone *zone, struct page *page,
253f456a5cb652 Mike Rapoport 2022-01-04  2651  				  unsigned int order)
253f456a5cb652 Mike Rapoport 2022-01-04  2652  {
253f456a5cb652 Mike Rapoport 2022-01-04  2653  #ifdef CONFIG_ARCH_WANTS_GFP=
_UNMAPPED
253f456a5cb652 Mike Rapoport 2022-01-04  2654  	unsigned long start_pfn =3D=
 page_to_pfn(page) & ~(pageblock_nr_pages - 1);
253f456a5cb652 Mike Rapoport 2022-01-04  2655  	unsigned long end_pfn =3D s=
tart_pfn + pageblock_nr_pages;
253f456a5cb652 Mike Rapoport 2022-01-04 @2656  	unsigned long start_addr =
=3D PFN_PHYS(start_pfn);
253f456a5cb652 Mike Rapoport 2022-01-04 @2657  	unsigned long end_addr =3D =
PFN_PHYS(end_pfn);
253f456a5cb652 Mike Rapoport 2022-01-04  2658  	unsigned long pfn, err;
253f456a5cb652 Mike Rapoport 2022-01-04  2659  =

253f456a5cb652 Mike Rapoport 2022-01-04  2660  	BUILD_BUG_ON(pageblock_orde=
r !=3D PMD_ORDER);
253f456a5cb652 Mike Rapoport 2022-01-04  2661  =

253f456a5cb652 Mike Rapoport 2022-01-04  2662  	if (is_migrate_unmapped_pag=
e(page))
253f456a5cb652 Mike Rapoport 2022-01-04  2663  		return 0;
253f456a5cb652 Mike Rapoport 2022-01-04  2664  =

253f456a5cb652 Mike Rapoport 2022-01-04  2665  	/*
253f456a5cb652 Mike Rapoport 2022-01-04  2666  	 * Calling set_direct_map_i=
nvalid_noflush() for the first page in a
253f456a5cb652 Mike Rapoport 2022-01-04  2667  	 * pageblock will split PMD=
 entry and it may fail to allocat the
253f456a5cb652 Mike Rapoport 2022-01-04  2668  	 * PMD page. Subsequent cal=
ls will only update the PTEs, so they
253f456a5cb652 Mike Rapoport 2022-01-04  2669  	 * cannot fail.
253f456a5cb652 Mike Rapoport 2022-01-04  2670  	 */
253f456a5cb652 Mike Rapoport 2022-01-04  2671  	err =3D set_direct_map_inva=
lid_noflush(page);
253f456a5cb652 Mike Rapoport 2022-01-04  2672  	if (err) {
253f456a5cb652 Mike Rapoport 2022-01-04  2673  		int migratetype =3D get_pa=
geblock_migratetype(page);
253f456a5cb652 Mike Rapoport 2022-01-04  2674  =

253f456a5cb652 Mike Rapoport 2022-01-04  2675  		move_to_free_list(page, zo=
ne, order, migratetype);
253f456a5cb652 Mike Rapoport 2022-01-04  2676  		return err;
253f456a5cb652 Mike Rapoport 2022-01-04  2677  	}
253f456a5cb652 Mike Rapoport 2022-01-04  2678  =

253f456a5cb652 Mike Rapoport 2022-01-04  2679  	for (pfn =3D start_pfn; pfn=
 < end_pfn; pfn++) {
253f456a5cb652 Mike Rapoport 2022-01-04  2680                 page =3D pfn_=
to_page(pfn);
253f456a5cb652 Mike Rapoport 2022-01-04  2681                 if (PageBuddy=
(page))
253f456a5cb652 Mike Rapoport 2022-01-04  2682                         set_d=
irect_map_invalid_noflush(page);
253f456a5cb652 Mike Rapoport 2022-01-04  2683  	}
253f456a5cb652 Mike Rapoport 2022-01-04  2684  =

253f456a5cb652 Mike Rapoport 2022-01-04  2685  	flush_tlb_kernel_range(star=
t_addr, end_addr);
253f456a5cb652 Mike Rapoport 2022-01-04  2686  	set_pageblock_migratetype(p=
age, MIGRATE_UNMAPPED);
253f456a5cb652 Mike Rapoport 2022-01-04  2687  	move_freepages_block(zone, =
page, MIGRATE_UNMAPPED, NULL);
253f456a5cb652 Mike Rapoport 2022-01-04  2688  #endif
253f456a5cb652 Mike Rapoport 2022-01-04  2689  =

253f456a5cb652 Mike Rapoport 2022-01-04  2690  	return 0;
253f456a5cb652 Mike Rapoport 2022-01-04  2691  }
253f456a5cb652 Mike Rapoport 2022-01-04  2692  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============0070974663891708189==--

