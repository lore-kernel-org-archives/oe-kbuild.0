Content-Type: multipart/mixed; boundary="===============0641297080840987485=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-tdx:guest-unaccepted-memory 3/15] mm/page_alloc.c:1183:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Sun, 15 May 2022 04:29:36 +0800
Message-ID: <202205150421.5zBU2Z3i-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0641297080840987485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

tree:   https://github.com/intel/tdx.git guest-unaccepted-memory
head:   83a8442434ff3bbf432df7508f1fefd447ca2c86
commit: 0845556ccd9555f5245d3bdd6cb646c2ea3fa9c2 [3/15] mm: Add support for=
 unaccepted memory
:::::: branch date: 4 days ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20515/202205150421.5zBU2Z3i-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 381894=
38b69ca27b4c6ce707c52dbd217583d046)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/0845556ccd9555f5245d3bdd6cb64=
6c2ea3fa9c2
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-unaccepted-memory
        git checkout 0845556ccd9555f5245d3bdd6cb646c2ea3fa9c2
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   19 warnings generated.
   Suppressed 19 warnings (19 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   drivers/clk/clk.c:1972:3: warning: Value stored to 'best_parent_rate' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   best_parent_rate =3D parent->rate;
                   ^                  ~~~~~~~~~~~~
   drivers/clk/clk.c:1972:3: note: Value stored to 'best_parent_rate' is ne=
ver read
                   best_parent_rate =3D parent->rate;
                   ^                  ~~~~~~~~~~~~
   drivers/clk/clk.c:2793:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&core->duty, &core->parent->duty, sizeof(core->du=
ty));
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/clk/clk.c:2793:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(&core->duty, &core->parent->duty, sizeof(core->du=
ty));
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/clk/clk.c:2821:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&core->duty, duty, sizeof(*duty));
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/clk/clk.c:2821:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(&core->duty, duty, sizeof(*duty));
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/clk/clk.c:2836:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&core->duty, &core->parent->duty, sizeof(core->du=
ty));
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/clk/clk.c:2836:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(&core->duty, &core->parent->duty, sizeof(core->du=
ty));
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   64 warnings generated.
>> mm/page_alloc.c:1183:6: warning: Branch condition evaluates to a garbage=
 value [clang-analyzer-core.uninitialized.Branch]
           if (!page_needs_acceptance && (fpi_flags & FPI_UNACCEPTED_SLOWPA=
TH))
               ^
   mm/page_alloc.c:8453:2: note: Calling 'drain_pages'
           drain_pages(cpu);
           ^~~~~~~~~~~~~~~~
   mm/page_alloc.c:3211:2: note: Loop condition is true.  Entering loop body
           for_each_populated_zone(zone) {
           ^
   include/linux/mmzone.h:1145:2: note: expanded from macro 'for_each_popul=
ated_zone'
           for (zone =3D (first_online_pgdat())->node_zones; \
           ^
   mm/page_alloc.c:3211:2: note: Assuming the condition is false
           for_each_populated_zone(zone) {
           ^
   include/linux/mmzone.h:1148:7: note: expanded from macro 'for_each_popul=
ated_zone'
                   if (!populated_zone(zone))              \
                       ^~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:3211:2: note: Taking false branch
           for_each_populated_zone(zone) {
           ^
   include/linux/mmzone.h:1148:3: note: expanded from macro 'for_each_popul=
ated_zone'
                   if (!populated_zone(zone))              \
                   ^
   mm/page_alloc.c:3212:3: note: Calling 'drain_pages_zone'
                   drain_pages_zone(cpu, zone);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:3191:2: note: Loop condition is false.  Exiting loop
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
   include/linux/irqflags.h:221:3: note: expanded from macro 'local_irq_sav=
e'
                   raw_local_irq_save(flags);              \
                   ^
   include/linux/irqflags.h:176:2: note: expanded from macro 'raw_local_irq=
_save'
           do {                                            \
           ^
   mm/page_alloc.c:3191:2: note: Taking true branch
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
   include/linux/irqflags.h:222:3: note: expanded from macro 'local_irq_sav=
e'
                   if (!raw_irqs_disabled_flags(flags))    \
                   ^
   mm/page_alloc.c:3191:2: note: Loop condition is false.  Exiting loop
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
   include/linux/irqflags.h:220:2: note: expanded from macro 'local_irq_sav=
e'
           do {                                            \
           ^
   mm/page_alloc.c:3191:2: note: Loop condition is false.  Exiting loop
           local_lock_irqsave(&pagesets.lock, flags);
           ^
   include/linux/local_lock.h:31:2: note: expanded from macro 'local_lock_i=
rqsave'
           __local_lock_irqsave(lock, flags)
           ^
   include/linux/local_lock_internal.h:80:22: note: expanded from macro '__=
local_lock_irqsave'
                   local_lock_acquire(this_cpu_ptr(lock));         \
                                      ^
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                             ^
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   mm/page_alloc.c:3191:2: note: Loop condition is false.  Exiting loop
           local_lock_irqsave(&pagesets.lock, flags);
           ^
   include/linux/local_lock.h:31:2: note: expanded from macro 'local_lock_i=
rqsave'
           __local_lock_irqsave(lock, flags)
           ^
   include/linux/local_lock_internal.h:78:2: note: expanded from macro '__l=
ocal_lock_irqsave'
           do {                                                    \
           ^
   mm/page_alloc.c:3193:8: note: Loop condition is false.  Exiting loop
           pcp =3D per_cpu_ptr(zone->per_cpu_pageset, cpu);
                 ^
   include/linux/percpu-defs.h:235:2: note: expanded from macro 'per_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \

vim +1183 mm/page_alloc.c

0845556ccd9555f Kirill A. Shutemov      2021-08-25  1056  =

^1da177e4c3f415 Linus Torvalds          2005-04-16  1057  /*
^1da177e4c3f415 Linus Torvalds          2005-04-16  1058   * Freeing functi=
on for a buddy system allocator.
^1da177e4c3f415 Linus Torvalds          2005-04-16  1059   *
^1da177e4c3f415 Linus Torvalds          2005-04-16  1060   * The concept of=
 a buddy system is to maintain direct-mapped table
^1da177e4c3f415 Linus Torvalds          2005-04-16  1061   * (containing bi=
t values) for memory blocks of various "orders".
^1da177e4c3f415 Linus Torvalds          2005-04-16  1062   * The bottom lev=
el table contains the map for the smallest allocatable
^1da177e4c3f415 Linus Torvalds          2005-04-16  1063   * units of memor=
y (here, pages), and each level above it describes
^1da177e4c3f415 Linus Torvalds          2005-04-16  1064   * pairs of units=
 from the levels below, hence, "buddies".
^1da177e4c3f415 Linus Torvalds          2005-04-16  1065   * At a high leve=
l, all that happens here is marking the table entry
^1da177e4c3f415 Linus Torvalds          2005-04-16  1066   * at the bottom =
level available, and propagating the changes upward
^1da177e4c3f415 Linus Torvalds          2005-04-16  1067   * as necessary, =
plus some accounting needed to play nicely with other
^1da177e4c3f415 Linus Torvalds          2005-04-16  1068   * parts of the V=
M system.
^1da177e4c3f415 Linus Torvalds          2005-04-16  1069   * At each level,=
 we keep a list of pages, which are heads of continuous
6e292b9be7f4358 Matthew Wilcox          2018-06-07  1070   * free pages of =
length of (1 << order) and marked with PageBuddy.
6e292b9be7f4358 Matthew Wilcox          2018-06-07  1071   * Page's order i=
s recorded in page_private(page) field.
^1da177e4c3f415 Linus Torvalds          2005-04-16  1072   * So when we are=
 allocating or freeing one, we can derive the state of the
^1da177e4c3f415 Linus Torvalds          2005-04-16  1073   * other.  That i=
s, if we allocate a small block, and both were
^1da177e4c3f415 Linus Torvalds          2005-04-16  1074   * free, the rema=
inder of the region must be split into blocks.
^1da177e4c3f415 Linus Torvalds          2005-04-16  1075   * If a block is =
freed, and its buddy is also free, then this
^1da177e4c3f415 Linus Torvalds          2005-04-16  1076   * triggers coale=
scing into a block of larger size.
^1da177e4c3f415 Linus Torvalds          2005-04-16  1077   *
6d49e352ae9aed3 Nadia Yvette Chambers   2012-12-06  1078   * -- nyc
^1da177e4c3f415 Linus Torvalds          2005-04-16  1079   */
^1da177e4c3f415 Linus Torvalds          2005-04-16  1080  =

48db57f8ff10eb0 Nicholas Piggin         2006-01-08  1081  static inline voi=
d __free_one_page(struct page *page,
dc4b0caff24d9b2 Mel Gorman              2014-06-04  1082  		unsigned long p=
fn,
ed0ae21dc5fe3b9 Mel Gorman              2009-06-16  1083  		struct zone *zo=
ne, unsigned int order,
f04a5d5d913fa81 David Hildenbrand       2020-10-15  1084  		int migratetype=
, fpi_t fpi_flags)
^1da177e4c3f415 Linus Torvalds          2005-04-16  1085  {
a2129f24798a993 Alexander Duyck         2020-04-06  1086  	struct capture_c=
ontrol *capc =3D task_capc(zone);
b3d40a2b6d10c9d David Hildenbrand       2022-03-22  1087  	unsigned int max=
_order =3D pageblock_order;
3f649ab728cda80 Kees Cook               2020-06-03  1088  	unsigned long bu=
ddy_pfn;
a2129f24798a993 Alexander Duyck         2020-04-06  1089  	unsigned long co=
mbined_pfn;
a2129f24798a993 Alexander Duyck         2020-04-06  1090  	struct page *bud=
dy;
a2129f24798a993 Alexander Duyck         2020-04-06  1091  	bool to_tail;
0845556ccd9555f Kirill A. Shutemov      2021-08-25  1092  	bool page_needs_=
acceptance;
d9dddbf556674bf Vlastimil Babka         2016-03-25  1093  =

d29bb9782d22063 Cody P Schafer          2013-02-22  1094  	VM_BUG_ON(!zone_=
is_initialized(zone));
6e9f0d582dde095 Kirill A. Shutemov      2015-02-11  1095  	VM_BUG_ON_PAGE(p=
age->flags & PAGE_FLAGS_CHECK_AT_PREP, page);
^1da177e4c3f415 Linus Torvalds          2005-04-16  1096  =

ed0ae21dc5fe3b9 Mel Gorman              2009-06-16  1097  	VM_BUG_ON(migrat=
etype =3D=3D -1);
d9dddbf556674bf Vlastimil Babka         2016-03-25  1098  	if (likely(!is_m=
igrate_isolate(migratetype)))
8f82b55dd558a74 Joonsoo Kim             2014-11-13  1099  		__mod_zone_free=
page_state(zone, 1 << order, migratetype);
ed0ae21dc5fe3b9 Mel Gorman              2009-06-16  1100  =

76741e776a37973 Vlastimil Babka         2017-02-22  1101  	VM_BUG_ON_PAGE(p=
fn & ((1 << order) - 1), page);
309381feaee5642 Sasha Levin             2014-01-23  1102  	VM_BUG_ON_PAGE(b=
ad_range(zone, page), page);
^1da177e4c3f415 Linus Torvalds          2005-04-16  1103  =

0845556ccd9555f Kirill A. Shutemov      2021-08-25  1104  	if (PageUnaccept=
ed(page)) {
0845556ccd9555f Kirill A. Shutemov      2021-08-25  1105  		page_needs_acce=
ptance =3D true;
0845556ccd9555f Kirill A. Shutemov      2021-08-25  1106  		__ClearPageUnac=
cepted(page);
0845556ccd9555f Kirill A. Shutemov      2021-08-25  1107  	}
0845556ccd9555f Kirill A. Shutemov      2021-08-25  1108  =

d9dddbf556674bf Vlastimil Babka         2016-03-25  1109  continue_merging:
7ad69832f37e3ce Muchun Song             2020-12-14  1110  	while (order < m=
ax_order) {
5e1f0f098b4649f Mel Gorman              2019-03-05  1111  		if (compaction_=
capture(capc, page, order, migratetype)) {
5e1f0f098b4649f Mel Gorman              2019-03-05  1112  			__mod_zone_fre=
epage_state(zone, -(1 << order),
5e1f0f098b4649f Mel Gorman              2019-03-05  1113  								migratety=
pe);
5e1f0f098b4649f Mel Gorman              2019-03-05  1114  			return;
5e1f0f098b4649f Mel Gorman              2019-03-05  1115  		}
76741e776a37973 Vlastimil Babka         2017-02-22  1116  		buddy_pfn =3D _=
_find_buddy_pfn(pfn, order);
76741e776a37973 Vlastimil Babka         2017-02-22  1117  		buddy =3D page =
+ (buddy_pfn - pfn);
13ad59df67f1978 Vlastimil Babka         2017-02-22  1118  =

cb2b95e1c6b56e3 Andy Whitcroft          2006-06-23  1119  		if (!page_is_bu=
ddy(page, buddy, order))
d9dddbf556674bf Vlastimil Babka         2016-03-25  1120  			goto done_merg=
ing;
c0a32fc5a2e470d Stanislaw Gruszka       2012-01-10  1121  		/*
c0a32fc5a2e470d Stanislaw Gruszka       2012-01-10  1122  		 * Our buddy is=
 free or it is CONFIG_DEBUG_PAGEALLOC guard page,
c0a32fc5a2e470d Stanislaw Gruszka       2012-01-10  1123  		 * merge with i=
t and move up one order.
c0a32fc5a2e470d Stanislaw Gruszka       2012-01-10  1124  		 */
b03641af680959d Dan Williams            2019-05-14  1125  		if (page_is_gua=
rd(buddy))
2847cf95c68fa5f Joonsoo Kim             2014-12-12  1126  			clear_page_gua=
rd(zone, buddy, order, migratetype);
b03641af680959d Dan Williams            2019-05-14  1127  		else
6ab0136310961eb Alexander Duyck         2020-04-06  1128  			del_page_from_=
free_list(buddy, zone, order);
0845556ccd9555f Kirill A. Shutemov      2021-08-25  1129  =

0845556ccd9555f Kirill A. Shutemov      2021-08-25  1130  		/* Mark page un=
accepted if any of merged pages were unaccepted */
0845556ccd9555f Kirill A. Shutemov      2021-08-25  1131  		if (PageUnaccep=
ted(buddy)) {
0845556ccd9555f Kirill A. Shutemov      2021-08-25  1132  			page_needs_acc=
eptance =3D true;
0845556ccd9555f Kirill A. Shutemov      2021-08-25  1133  			__ClearPageUna=
ccepted(buddy);
0845556ccd9555f Kirill A. Shutemov      2021-08-25  1134  		}
0845556ccd9555f Kirill A. Shutemov      2021-08-25  1135  =

76741e776a37973 Vlastimil Babka         2017-02-22  1136  		combined_pfn =
=3D buddy_pfn & pfn;
76741e776a37973 Vlastimil Babka         2017-02-22  1137  		page =3D page +=
 (combined_pfn - pfn);
76741e776a37973 Vlastimil Babka         2017-02-22  1138  		pfn =3D combine=
d_pfn;
^1da177e4c3f415 Linus Torvalds          2005-04-16  1139  		order++;
^1da177e4c3f415 Linus Torvalds          2005-04-16  1140  	}
7ad69832f37e3ce Muchun Song             2020-12-14  1141  	if (order < MAX_=
ORDER - 1) {
d9dddbf556674bf Vlastimil Babka         2016-03-25  1142  		/* If we are he=
re, it means order is >=3D pageblock_order.
1dd214b8f21ca46 Zi Yan                  2022-03-22  1143  		 * We want to p=
revent merge between freepages on pageblock
1dd214b8f21ca46 Zi Yan                  2022-03-22  1144  		 * without fall=
backs and normal pageblock. Without this,
1dd214b8f21ca46 Zi Yan                  2022-03-22  1145  		 * pageblock is=
olation could cause incorrect freepage or CMA
1dd214b8f21ca46 Zi Yan                  2022-03-22  1146  		 * accounting o=
r HIGHATOMIC accounting.
d9dddbf556674bf Vlastimil Babka         2016-03-25  1147  		 *
d9dddbf556674bf Vlastimil Babka         2016-03-25  1148  		 * We don't wan=
t to hit this code for the more frequent
d9dddbf556674bf Vlastimil Babka         2016-03-25  1149  		 * low-order me=
rging.
d9dddbf556674bf Vlastimil Babka         2016-03-25  1150  		 */
d9dddbf556674bf Vlastimil Babka         2016-03-25  1151  		int buddy_mt;
d9dddbf556674bf Vlastimil Babka         2016-03-25  1152  =

76741e776a37973 Vlastimil Babka         2017-02-22  1153  		buddy_pfn =3D _=
_find_buddy_pfn(pfn, order);
76741e776a37973 Vlastimil Babka         2017-02-22  1154  		buddy =3D page =
+ (buddy_pfn - pfn);
787af64d05cd528 Zi Yan                  2022-03-30  1155  =

787af64d05cd528 Zi Yan                  2022-03-30  1156  		if (!page_is_bu=
ddy(page, buddy, order))
787af64d05cd528 Zi Yan                  2022-03-30  1157  			goto done_merg=
ing;
d9dddbf556674bf Vlastimil Babka         2016-03-25  1158  		buddy_mt =3D ge=
t_pageblock_migratetype(buddy);
d9dddbf556674bf Vlastimil Babka         2016-03-25  1159  =

d9dddbf556674bf Vlastimil Babka         2016-03-25  1160  		if (migratetype=
 !=3D buddy_mt
1dd214b8f21ca46 Zi Yan                  2022-03-22  1161  				&& (!migratet=
ype_is_mergeable(migratetype) ||
1dd214b8f21ca46 Zi Yan                  2022-03-22  1162  					!migratetype=
_is_mergeable(buddy_mt)))
d9dddbf556674bf Vlastimil Babka         2016-03-25  1163  			goto done_merg=
ing;
7ad69832f37e3ce Muchun Song             2020-12-14  1164  		max_order =3D o=
rder + 1;
d9dddbf556674bf Vlastimil Babka         2016-03-25  1165  		goto continue_m=
erging;
d9dddbf556674bf Vlastimil Babka         2016-03-25  1166  	}
d9dddbf556674bf Vlastimil Babka         2016-03-25  1167  =

d9dddbf556674bf Vlastimil Babka         2016-03-25  1168  done_merging:
ab130f9108dcf20 Matthew Wilcox (Oracle  2020-10-15  1169) 	set_buddy_order(=
page, order);
6dda9d55bf54501 Corrado Zoccolo         2010-05-24  1170  =

0845556ccd9555f Kirill A. Shutemov      2021-08-25  1171  	/*
0845556ccd9555f Kirill A. Shutemov      2021-08-25  1172  	 * The page gets=
 marked as PageUnaccepted() if any of merged-in pages
0845556ccd9555f Kirill A. Shutemov      2021-08-25  1173  	 * is PageUnacce=
pted().
0845556ccd9555f Kirill A. Shutemov      2021-08-25  1174  	 *
0845556ccd9555f Kirill A. Shutemov      2021-08-25  1175  	 * New pages, ju=
st being added to buddy allocator, do not have
0845556ccd9555f Kirill A. Shutemov      2021-08-25  1176  	 * PageUnaccepte=
d() set. FPI_UNACCEPTED_SLOWPATH indicates that the
0845556ccd9555f Kirill A. Shutemov      2021-08-25  1177  	 * page is new a=
nd page_is_unaccepted() check is required to
0845556ccd9555f Kirill A. Shutemov      2021-08-25  1178  	 * determinate i=
f acceptance is required.
0845556ccd9555f Kirill A. Shutemov      2021-08-25  1179  	 *
0845556ccd9555f Kirill A. Shutemov      2021-08-25  1180  	 * Avoid calling=
 page_is_unaccepted() if it is known that the page
0845556ccd9555f Kirill A. Shutemov      2021-08-25  1181  	 * needs accepta=
nce. It can be costly.
0845556ccd9555f Kirill A. Shutemov      2021-08-25  1182  	 */
0845556ccd9555f Kirill A. Shutemov      2021-08-25 @1183  	if (!page_needs_=
acceptance && (fpi_flags & FPI_UNACCEPTED_SLOWPATH))
0845556ccd9555f Kirill A. Shutemov      2021-08-25  1184  		page_needs_acce=
ptance =3D page_is_unaccepted(page, order);
0845556ccd9555f Kirill A. Shutemov      2021-08-25  1185  	if (page_needs_a=
cceptance)
0845556ccd9555f Kirill A. Shutemov      2021-08-25  1186  		__SetPageUnacce=
pted(page);
0845556ccd9555f Kirill A. Shutemov      2021-08-25  1187  =

47b6a24a23825ae David Hildenbrand       2020-10-15  1188  	if (fpi_flags & =
FPI_TO_TAIL)
47b6a24a23825ae David Hildenbrand       2020-10-15  1189  		to_tail =3D tru=
e;
47b6a24a23825ae David Hildenbrand       2020-10-15  1190  	else if (is_shuf=
fle_order(order))
a2129f24798a993 Alexander Duyck         2020-04-06  1191  		to_tail =3D shu=
ffle_pick_tail();
97500a4a54876d3 Dan Williams            2019-05-14  1192  	else
a2129f24798a993 Alexander Duyck         2020-04-06  1193  		to_tail =3D bud=
dy_merge_likely(pfn, buddy_pfn, page, order);
97500a4a54876d3 Dan Williams            2019-05-14  1194  =

a2129f24798a993 Alexander Duyck         2020-04-06  1195  	if (to_tail)
6ab0136310961eb Alexander Duyck         2020-04-06  1196  		add_to_free_lis=
t_tail(page, zone, order, migratetype);
a2129f24798a993 Alexander Duyck         2020-04-06  1197  	else
6ab0136310961eb Alexander Duyck         2020-04-06  1198  		add_to_free_lis=
t(page, zone, order, migratetype);
36e66c554b5c6a9 Alexander Duyck         2020-04-06  1199  =

36e66c554b5c6a9 Alexander Duyck         2020-04-06  1200  	/* Notify page r=
eporting subsystem of freed page */
f04a5d5d913fa81 David Hildenbrand       2020-10-15  1201  	if (!(fpi_flags =
& FPI_SKIP_REPORT_NOTIFY))
36e66c554b5c6a9 Alexander Duyck         2020-04-06  1202  		page_reporting_=
notify_free(order);
^1da177e4c3f415 Linus Torvalds          2005-04-16  1203  }
^1da177e4c3f415 Linus Torvalds          2005-04-16  1204  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0641297080840987485==--

