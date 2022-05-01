Content-Type: multipart/mixed; boundary="===============4186857401863118593=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [android-common:android13-5.15 2/3] mm/page_alloc.c:3094:4: warning: Value stored to 'batch' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 02 May 2022 02:21:55 +0800
Message-ID: <202205020216.zVx6jM1t-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4186857401863118593==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   d7355d4294df16fb28db636786705574a7d6f533
commit: 37b2d597bb542ea753f4f11604ce2c35868271ba [2/3] ANDROID: mm: add cma=
 pcp list
:::::: branch date: 2 days ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20502/202205020216.zVx6jM1t-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 400775=
649969b9baf3bc2a510266e7912bb16ae9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kern=
el/common
        git fetch --no-tags android-common android13-5.15
        git checkout 37b2d597bb542ea753f4f11604ce2c35868271ba
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   mm/page_alloc.c:1458:10: note: '?' condition is false
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
   mm/page_alloc.c:1459:9: note: Assuming 'count' is <=3D 0
           while (count > 0) {
                  ^~~~~~~~~
   mm/page_alloc.c:1459:2: note: Loop condition is false. Execution continu=
es on line 1513
           while (count > 0) {
           ^
   mm/page_alloc.c:1526:2: note: Left side of '&&' is false
           list_for_each_entry_safe(page, tmp, &head, lru) {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   mm/page_alloc.c:1526:2: note: Taking false branch
           list_for_each_entry_safe(page, tmp, &head, lru) {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   mm/page_alloc.c:1526:2: note: Loop condition is false.  Exiting loop
           list_for_each_entry_safe(page, tmp, &head, lru) {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   mm/page_alloc.c:1526:2: note: Assigned value is garbage or undefined
           list_for_each_entry_safe(page, tmp, &head, lru) {
           ^
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:494:2: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^              ~~~~~~~~~~~~~
>> mm/page_alloc.c:3094:4: warning: Value stored to 'batch' is never read [=
clang-analyzer-deadcode.DeadStores]
                           batch =3D max(batch >> order, 2);
                           ^
   mm/page_alloc.c:3094:4: note: Value stored to 'batch' is never read
   mm/page_alloc.c:5348:29: warning: Array access (from variable 'page_arra=
y') results in a null pointer dereference [clang-analyzer-core.NullDerefere=
nce]
                           page_array[nr_populated] =3D page;
                           ~~~~~~~~~~               ^
   mm/page_alloc.c:5255:9: note: Assuming 'page_array' is null
           while (page_array && nr_populated < nr_pages && page_array[nr_po=
pulated])
                  ^~~~~~~~~~
   mm/page_alloc.c:5255:20: note: Left side of '&&' is false
           while (page_array && nr_populated < nr_pages && page_array[nr_po=
pulated])
                             ^
   mm/page_alloc.c:5259:15: note: Assuming 'nr_pages' is > 0
           if (unlikely(nr_pages <=3D 0))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   mm/page_alloc.c:5259:2: note: Taking false branch
           if (unlikely(nr_pages <=3D 0))
           ^
   mm/page_alloc.c:5263:15: note: 'page_array' is null
           if (unlikely(page_array && nr_pages - nr_populated =3D=3D 0))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   mm/page_alloc.c:5263:26: note: Left side of '&&' is false
           if (unlikely(page_array && nr_pages - nr_populated =3D=3D 0))
                                   ^
   mm/page_alloc.c:5263:2: note: Taking false branch
           if (unlikely(page_array && nr_pages - nr_populated =3D=3D 0))
           ^
   mm/page_alloc.c:5267:27: note: Left side of '&&' is false
           if (memcg_kmem_enabled() && (gfp & __GFP_ACCOUNT))
                                    ^
   mm/page_alloc.c:5271:6: note: Assuming the condition is false
           if (nr_pages - nr_populated =3D=3D 1)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:5271:2: note: Taking false branch
           if (nr_pages - nr_populated =3D=3D 1)
           ^
   mm/page_alloc.c:5289:2: note: Taking false branch
           if (!prepare_alloc_pages(gfp, 0, preferred_nid, nodemask, &ac, &=
alloc_gfp, &alloc_flags))
           ^
   mm/page_alloc.c:5294:2: note: Loop condition is true.  Entering loop body
           for_each_zone_zonelist_nodemask(zone, z, ac.zonelist, ac.highest=
_zoneidx, ac.nodemask) {
           ^
   include/linux/mmzone.h:1199:2: note: expanded from macro 'for_each_zone_=
zonelist_nodemask'
           for (z =3D first_zones_zonelist(zlist, highidx, nodemask), zone =
=3D zonelist_zone(z);       \
           ^
   mm/page_alloc.c:5297:25: note: Left side of '&&' is false
                   if (cpusets_enabled() && (alloc_flags & ALLOC_CPUSET) &&
                                         ^
   mm/page_alloc.c:5302:7: note: Nr_online_nodes is <=3D 1
                   if (nr_online_nodes > 1 && zone !=3D ac.preferred_zonere=
f->zone &&
                       ^
   include/linux/nodemask.h:490:26: note: expanded from macro 'nr_online_no=
des'
   #define nr_online_nodes         1U
                                   ^~
   mm/page_alloc.c:5302:27: note: Left side of '&&' is false
                   if (nr_online_nodes > 1 && zone !=3D ac.preferred_zonere=
f->zone &&
                                           ^
   mm/page_alloc.c:5308:3: note: Taking true branch
                   if (zone_watermark_fast(zone, 0,  mark,
                   ^
   mm/page_alloc.c:5311:4: note:  Execution continues on line 5319
                           break;
                           ^
   mm/page_alloc.c:5319:16: note: 'zone' is non-null
           if (unlikely(!zone))
                         ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   mm/page_alloc.c:5319:2: note: Taking false branch
           if (unlikely(!zone))
           ^
   mm/page_alloc.c:5323:2: note: Loop condition is false.  Exiting loop
           local_lock_irqsave(&pagesets.lock, flags);
           ^
   include/linux/local_lock.h:31:2: note: expanded from macro 'local_lock_i=
rqsave'
           __local_lock_irqsave(lock, flags)
           ^
   include/linux/local_lock_internal.h:79:3: note: expanded from macro '__l=
ocal_lock_irqsave'
                   local_irq_save(flags);                          \
                   ^
   include/linux/irqflags.h:214:3: note: expanded from macro 'local_irq_sav=
e'
                   raw_local_irq_save(flags);              \
                   ^
   include/linux/irqflags.h:169:2: note: expanded from macro 'raw_local_irq=
_save'
           do {                                            \
           ^
   mm/page_alloc.c:5323:2: note: Taking false branch
           local_lock_irqsave(&pagesets.lock, flags);
           ^
   include/linux/local_lock.h:31:2: note: expanded from macro 'local_lock_i=
rqsave'
           __local_lock_irqsave(lock, flags)
           ^
   include/linux/local_lock_internal.h:79:3: note: expanded from macro '__l=
ocal_lock_irqsave'

vim +/batch +3094 mm/page_alloc.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  3070  =

37b2d597bb542e Chris Goldsworthy 2020-11-16  3071  /*
37b2d597bb542e Chris Goldsworthy 2020-11-16  3072   * Return the pcp list t=
hat corresponds to the migrate type if that list isn't
37b2d597bb542e Chris Goldsworthy 2020-11-16  3073   * empty.
37b2d597bb542e Chris Goldsworthy 2020-11-16  3074   * If the list is empty =
return NULL.
37b2d597bb542e Chris Goldsworthy 2020-11-16  3075   */
37b2d597bb542e Chris Goldsworthy 2020-11-16  3076  static struct list_head =
*get_populated_pcp_list(struct zone *zone,
37b2d597bb542e Chris Goldsworthy 2020-11-16  3077  			unsigned int order, s=
truct per_cpu_pages *pcp,
37b2d597bb542e Chris Goldsworthy 2020-11-16  3078  			int migratetype, unsi=
gned int alloc_flags)
37b2d597bb542e Chris Goldsworthy 2020-11-16  3079  {
37b2d597bb542e Chris Goldsworthy 2020-11-16  3080  	struct list_head *list =
=3D &pcp->lists[order_to_pindex(migratetype, order)];
37b2d597bb542e Chris Goldsworthy 2020-11-16  3081  =

37b2d597bb542e Chris Goldsworthy 2020-11-16  3082  	if (list_empty(list)) {
37b2d597bb542e Chris Goldsworthy 2020-11-16  3083  		int batch =3D READ_ONC=
E(pcp->batch);
37b2d597bb542e Chris Goldsworthy 2020-11-16  3084  		int alloced;
37b2d597bb542e Chris Goldsworthy 2020-11-16  3085  =

37b2d597bb542e Chris Goldsworthy 2020-11-16  3086  		/*
37b2d597bb542e Chris Goldsworthy 2020-11-16  3087  		 * Scale batch relativ=
e to order if batch implies
37b2d597bb542e Chris Goldsworthy 2020-11-16  3088  		 * free pages can be s=
tored on the PCP. Batch can
37b2d597bb542e Chris Goldsworthy 2020-11-16  3089  		 * be 1 for small zone=
s or for boot pagesets which
37b2d597bb542e Chris Goldsworthy 2020-11-16  3090  		 * should never store =
free pages as the pages may
37b2d597bb542e Chris Goldsworthy 2020-11-16  3091  		 * belong to arbitrary=
 zones.
37b2d597bb542e Chris Goldsworthy 2020-11-16  3092  		 */
37b2d597bb542e Chris Goldsworthy 2020-11-16  3093  		if (batch > 1)
37b2d597bb542e Chris Goldsworthy 2020-11-16 @3094  			batch =3D max(batch >=
> order, 2);
37b2d597bb542e Chris Goldsworthy 2020-11-16  3095  		alloced =3D rmqueue_bu=
lk(zone, order, pcp->batch, list, migratetype, alloc_flags);
37b2d597bb542e Chris Goldsworthy 2020-11-16  3096  =

37b2d597bb542e Chris Goldsworthy 2020-11-16  3097  		pcp->count +=3D alloce=
d << order;
37b2d597bb542e Chris Goldsworthy 2020-11-16  3098  		if (list_empty(list))
37b2d597bb542e Chris Goldsworthy 2020-11-16  3099  			list =3D NULL;
37b2d597bb542e Chris Goldsworthy 2020-11-16  3100  	}
37b2d597bb542e Chris Goldsworthy 2020-11-16  3101  	return list;
37b2d597bb542e Chris Goldsworthy 2020-11-16  3102  }
37b2d597bb542e Chris Goldsworthy 2020-11-16  3103  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4186857401863118593==--

