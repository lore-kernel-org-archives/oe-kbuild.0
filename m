Content-Type: multipart/mixed; boundary="===============4746929219260493907=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [luxis1999-iommufd:iommufd-v5.17-rc6 29/29] drivers/iommu/iommufd/io_pagetable.c:346:11: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Mon, 18 Apr 2022 04:44:29 +0800
Message-ID: <202204180421.FNtLAHXO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4746929219260493907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Liu Yi L <yi.l.liu@intel.com>

tree:   https://github.com/luxis1999/iommufd iommufd-v5.17-rc6
head:   d764f3288de0fd52c578684788a437701ec31b2d
commit: d764f3288de0fd52c578684788a437701ec31b2d [29/29] iommufd/io_pagetab=
le: Support unmap fully contained areas
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20418/202204180421.FNtLAHXO-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ef9460=
9d6ebe981767788e6877b0b3b731d425af)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/luxis1999/iommufd/commit/d764f3288de0fd52c5786=
84788a437701ec31b2d
        git remote add luxis1999-iommufd https://github.com/luxis1999/iommu=
fd
        git fetch --no-tags luxis1999-iommufd iommufd-v5.17-rc6
        git checkout d764f3288de0fd52c578684788a437701ec31b2d
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/md/md-bitmap.c:2155:11: note: Assuming '__UNIQUE_ID___x689' is >=
=3D '__UNIQUE_ID___y690'
           blocks =3D min(old_counts.chunks << old_counts.chunkshift,
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
                            ^~~~~~~~~~
   drivers/md/md-bitmap.c:2155:11: note: '?' condition is false
           blocks =3D min(old_counts.chunks << old_counts.chunkshift,
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
   drivers/md/md-bitmap.c:2159:2: note: Taking false branch
           if (mddev_is_clustered(bitmap->mddev)) {
           ^
   drivers/md/md-bitmap.c:2188:18: note: Assuming 'block' is < 'blocks'
           for (block =3D 0; block < blocks; ) {
                           ^~~~~~~~~~~~~~
   drivers/md/md-bitmap.c:2188:2: note: Loop condition is true.  Entering l=
oop body
           for (block =3D 0; block < blocks; ) {
           ^
   drivers/md/md-bitmap.c:2193:9: note: 'bmc_old' is non-null
                   set =3D bmc_old && NEEDED(*bmc_old);
                         ^~~~~~~
   drivers/md/md-bitmap.c:2193:9: note: Left side of '&&' is true
   drivers/md/md-bitmap.c:2195:7: note: Assuming 'set' is not equal to 0
                   if (set) {
                       ^~~
   drivers/md/md-bitmap.c:2195:3: note: Taking true branch
                   if (set) {
                   ^
   drivers/md/md-bitmap.c:2197:8: note: Assuming the condition is true
                           if (*bmc_new =3D=3D 0) {
                               ^~~~~~~~~~~~~
   drivers/md/md-bitmap.c:2197:4: note: Taking true branch
                           if (*bmc_new =3D=3D 0) {
                           ^
   drivers/md/md-bitmap.c:2202:12: note: Assuming 'start' is >=3D 'end'
                                   while (start < end) {
                                          ^~~~~~~~~~~
   drivers/md/md-bitmap.c:2202:5: note: Loop condition is false. Execution =
continues on line 2206
                                   while (start < end) {
                                   ^
   drivers/md/md-bitmap.c:2207:5: note: Calling 'md_bitmap_count_page'
                                   md_bitmap_count_page(&bitmap->counts, bl=
ock, 1);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/md/md-bitmap.c:1203:2: note: Calling 'md_bitmap_checkfree'
           md_bitmap_checkfree(bitmap, page);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/md-bitmap.c:123:6: note: Assuming field 'count' is 0
           if (bitmap->bp[page].count) /* page is still busy */
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/md/md-bitmap.c:123:2: note: Taking false branch
           if (bitmap->bp[page].count) /* page is still busy */
           ^
   drivers/md/md-bitmap.c:128:23: note: Field 'hijacked' is 0
           if (bitmap->bp[page].hijacked) { /* page was hijacked, undo this=
 now */
                                ^
   drivers/md/md-bitmap.c:128:2: note: Taking false branch
           if (bitmap->bp[page].hijacked) { /* page was hijacked, undo this=
 now */
           ^
   drivers/md/md-bitmap.c:136:3: note: Memory is released
                   kfree(ptr);
                   ^~~~~~~~~~
   drivers/md/md-bitmap.c:1203:2: note: Returning; memory was released
           md_bitmap_checkfree(bitmap, page);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/md-bitmap.c:2207:5: note: Returning; memory was released
                                   md_bitmap_count_page(&bitmap->counts, bl=
ock, 1);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/md/md-bitmap.c:2210:13: note: Use of memory after it is freed
                           *bmc_new |=3D NEEDED_MASK;
                           ~~~~~~~~ ^
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
>> drivers/iommu/iommufd/io_pagetable.c:346:11: warning: Use of memory afte=
r it is freed [clang-analyzer-unix.Malloc]
                   start =3D iopt_area_last_iova(area) + 1;
                           ^
   drivers/iommu/iommufd/io_pagetable.c:389:9: note: Calling '__iopt_unmap_=
iova_range'
           return __iopt_unmap_iova_range(iopt, 0, ULONG_MAX, unmapped);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/io_pagetable.c:329:2: note: Loop condition is true=
.  Entering loop body
           while ((area =3D iopt_area_iter_first(iopt, start, end))) {
           ^
   drivers/iommu/iommufd/io_pagetable.c:332:7: note: Assuming field 'pages'=
 is non-null
                   if (!area->pages || iopt_area_iova(area) < start ||
                       ^~~~~~~~~~~~
   drivers/iommu/iommufd/io_pagetable.c:332:7: note: Left side of '||' is f=
alse
   drivers/iommu/iommufd/io_pagetable.c:332:7: note: Left side of '||' is f=
alse
   drivers/iommu/iommufd/io_pagetable.c:332:3: note: Taking false branch
                   if (!area->pages || iopt_area_iova(area) < start ||
                   ^
   drivers/iommu/iommufd/io_pagetable.c:342:8: note: Calling '__iopt_unmap_=
iova'
                   rc =3D __iopt_unmap_iova(iopt, area, pages);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/io_pagetable.c:308:6: note: Assuming the condition=
 is true
           if (WARN_ON(atomic_read(&area->num_users)))
               ^
   include/asm-generic/bug.h:121:23: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                ^~~~~~~~~~~~
   drivers/iommu/iommufd/io_pagetable.c:308:6: note: Taking false branch
           if (WARN_ON(atomic_read(&area->num_users)))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/iommu/iommufd/io_pagetable.c:308:2: note: Taking false branch
           if (WARN_ON(atomic_read(&area->num_users)))
           ^
   drivers/iommu/iommufd/io_pagetable.c:312:2: note: Assuming the condition=
 is true
           WARN_ON(atomic_read(&area->num_users));
           ^
   include/asm-generic/bug.h:121:23: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                ^~~~~~~~~~~~
   drivers/iommu/iommufd/io_pagetable.c:312:2: note: Taking false branch
           WARN_ON(atomic_read(&area->num_users));
           ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/iommu/iommufd/io_pagetable.c:313:2: note: Calling 'iopt_abort_ar=
ea'
           iopt_abort_area(area);
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/io_pagetable.c:194:2: note: Memory is released
           kfree(area);
           ^~~~~~~~~~~
   drivers/iommu/iommufd/io_pagetable.c:313:2: note: Returning; memory was =
released via 1st parameter
           iopt_abort_area(area);
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/io_pagetable.c:342:8: note: Returning; memory was =
released via 2nd parameter
                   rc =3D __iopt_unmap_iova(iopt, area, pages);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/io_pagetable.c:343:7: note: 'rc' is 0
                   if (rc)
                       ^~
   drivers/iommu/iommufd/io_pagetable.c:343:3: note: Taking false branch
                   if (rc)
                   ^
   drivers/iommu/iommufd/io_pagetable.c:346:11: note: Use of memory after i=
t is freed
                   start =3D iopt_area_last_iova(area) + 1;
                           ^                   ~~~~
   Suppressed 4 warnings (4 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/net/phy/mscc/mscc_main.c:344:2: warning: Value stored to 'reg_va=
l' is never read [clang-analyzer-deadcode.DeadStores]
           reg_val =3D phy_read(phydev, MII_VSC85XX_INT_STATUS);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
               ^~~
   drivers/firmware/dmi-sysfs.c:460:2: note: Taking true branch
           if (ret)
           ^
   drivers/firmware/dmi-sysfs.c:461:3: note: Control jumps to line 472
                   goto out_free;
                   ^
   drivers/firmware/dmi-sysfs.c:472:2: note: Memory is released
           kfree(entry->child);
           ^~~~~~~~~~~~~~~~~~~
   drivers/firmware/dmi-sysfs.c:619:10: note: Returning; memory was released
                   *ret =3D dmi_system_event_log(entry);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/dmi-sysfs.c:620:3: note:  Execution continues on line 6=
25
                   break;
                   ^
   drivers/firmware/dmi-sysfs.c:625:2: note: Taking true branch
           if (*ret)
           ^
   drivers/firmware/dmi-sysfs.c:626:3: note: Control jumps to line 635
                   goto out_err;
                   ^
   drivers/firmware/dmi-sysfs.c:635:2: note: Use of memory after it is freed
           kobject_put(entry->child);
           ^           ~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   sound/core/timer.c:1260:9: warning: Access to field 'number' results in =
a dereference of a null pointer (loaded from field 'card') [clang-analyzer-=
core.NullDereference]
                                       timer->card->number, timer->tmr_devi=
ce);
                                       ^
   include/sound/info.h:107:54: note: expanded from macro 'snd_iprintf'
           seq_printf((struct seq_file *)(buf)->buffer, fmt, ##args)
                                                               ^~~~
   sound/core/timer.c:1251:2: note: Loop condition is true.  Entering loop =
body
           list_for_each_entry(timer, &snd_timer_list, device_list) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   sound/core/timer.c:1252:7: note: Assuming field 'card' is null
                   if (timer->card && timer->card->shutdown)
                       ^~~~~~~~~~~
   sound/core/timer.c:1252:19: note: Left side of '&&' is false
                   if (timer->card && timer->card->shutdown)
                                   ^
   sound/core/timer.c:1254:3: note: Control jumps to 'case SNDRV_TIMER_CLAS=
S_CARD:'  at line 1258
                   switch (timer->tmr_class) {
                   ^
   sound/core/timer.c:1260:9: note: Access to field 'number' results in a d=
ereference of a null pointer (loaded from field 'card')
                                       timer->card->number, timer->tmr_devi=
ce);
                                       ^
   include/sound/info.h:107:54: note: expanded from macro 'snd_iprintf'
           seq_printf((struct seq_file *)(buf)->buffer, fmt, ##args)
                                                               ^~~~
   sound/core/timer.c:1263:39: warning: Access to field 'number' results in=
 a dereference of a null pointer (loaded from field 'card') [clang-analyzer=
-core.NullDereference]
                           snd_iprintf(buffer, "P%i-%i-%i: ", timer->card->=
number,
                                                              ^
   include/sound/info.h:107:54: note: expanded from macro 'snd_iprintf'
           seq_printf((struct seq_file *)(buf)->buffer, fmt, ##args)
                                                               ^~~~
   sound/core/timer.c:1251:2: note: Loop condition is true.  Entering loop =
body
           list_for_each_entry(timer, &snd_timer_list, device_list) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   sound/core/timer.c:1252:7: note: Assuming field 'card' is null
                   if (timer->card && timer->card->shutdown)
                       ^~~~~~~~~~~
   sound/core/timer.c:1252:19: note: Left side of '&&' is false
                   if (timer->card && timer->card->shutdown)
                                   ^
   sound/core/timer.c:1254:3: note: Control jumps to 'case SNDRV_TIMER_CLAS=
S_PCM:'  at line 1262
                   switch (timer->tmr_class) {
                   ^
   sound/core/timer.c:1263:39: note: Access to field 'number' results in a =
dereference of a null pointer (loaded from field 'card')
                           snd_iprintf(buffer, "P%i-%i-%i: ", timer->card->=
number,
                                                              ^
   include/sound/info.h:107:54: note: expanded from macro 'snd_iprintf'
           seq_printf((struct seq_file *)(buf)->buffer, fmt, ##args)
                                                               ^~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/iommu/iommufd/ioas.c:252:14: warning: Assigned value is garbage =
or undefined [clang-analyzer-core.uninitialized.Assign]
           cmd->length =3D unmapped;
                       ^ ~~~~~~~~
   drivers/iommu/iommufd/ioas.c:233:2: note: 'unmapped' declared without an=
 initial value
           unsigned long unmapped;
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/ioas.c:237:2: note: Taking false branch
           if (IS_ERR(ioas))
           ^
   drivers/iommu/iommufd/ioas.c:240:6: note: Assuming field 'iova' is not e=
qual to 0
           if (cmd->iova =3D=3D 0 && cmd->length =3D=3D U64_MAX) {
               ^~~~~~~~~~~~~~
   drivers/iommu/iommufd/ioas.c:240:21: note: Left side of '&&' is false
           if (cmd->iova =3D=3D 0 && cmd->length =3D=3D U64_MAX) {
                              ^
   drivers/iommu/iommufd/ioas.c:243:7: note: Assuming the condition is true
                   if (cmd->iova >=3D ULONG_MAX || cmd->length >=3D ULONG_M=
AX) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/ioas.c:243:30: note: Left side of '||' is true
                   if (cmd->iova >=3D ULONG_MAX || cmd->length >=3D ULONG_M=
AX) {
                                              ^
   drivers/iommu/iommufd/ioas.c:245:4: note: Control jumps to line 251
                           goto out_put;
                           ^
   drivers/iommu/iommufd/ioas.c:252:14: note: Assigned value is garbage or =
undefined
           cmd->length =3D unmapped;
                       ^ ~~~~~~~~
   Suppressed 6 warnings (4 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/iommu/iommufd/pages.c:91:2: warning: Value stored to 'rc' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           rc =3D check_add_overflow(pages->npinned, npages, &pages->npinne=
d);
           ^
   drivers/iommu/iommufd/pages.c:91:2: note: Value stored to 'rc' is never =
read
   drivers/iommu/iommufd/pages.c:100:2: warning: Value stored to 'rc' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           rc =3D check_sub_overflow(pages->npinned, npages, &pages->npinne=
d);
           ^
   drivers/iommu/iommufd/pages.c:100:2: note: Value stored to 'rc' is never=
 read
   drivers/iommu/iommufd/pages.c:413:25: warning: The left operand of '>' i=
s a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (batch->npfns[cur] > offset)
                                         ^
   drivers/iommu/iommufd/pages.c:1310:15: note: 'user' is non-null
           if (WARN_ON(!user))
                        ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/iommu/iommufd/pages.c:1310:6: note: Taking false branch
           if (WARN_ON(!user))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/iommu/iommufd/pages.c:1310:2: note: Taking false branch
           if (WARN_ON(!user))
           ^
   drivers/iommu/iommufd/pages.c:1313:2: note: Taking false branch
           if (!refcount_dec_and_test(&user->refcount))
           ^
   drivers/iommu/iommufd/pages.c:1317:2: note: Calling 'iopt_pages_unfill_x=
array'
           iopt_pages_unfill_xarray(pages, start, last);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/pages.c:1090:2: note: Assuming 'debug_locks' is 0
           lockdep_assert_held(&pages->mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:310:15: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                        ^~~~~~~~~~~
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/iommu/iommufd/pages.c:1090:2: note: Left side of '&&' is false
           lockdep_assert_held(&pages->mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:27: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                                    ^
   drivers/iommu/iommufd/pages.c:1090:2: note: Taking false branch
           lockdep_assert_held(&pages->mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:7: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/iommu/iommufd/pages.c:1090:2: note: Loop condition is false.  Ex=
iting loop
           lockdep_assert_held(&pages->mutex);
           ^

vim +346 drivers/iommu/iommufd/io_pagetable.c

1af524ce30ddf8 Jason Gunthorpe 2021-11-11  317  =

d764f3288de0fd Yi Liu          2022-04-17  318  static int __iopt_unmap_iov=
a_range(struct io_pagetable *iopt,
d764f3288de0fd Yi Liu          2022-04-17  319  				   unsigned long start,
d764f3288de0fd Yi Liu          2022-04-17  320  				   unsigned long end,
d764f3288de0fd Yi Liu          2022-04-17  321  				   unsigned long *unmap=
ped)
1af524ce30ddf8 Jason Gunthorpe 2021-11-11  322  {
1af524ce30ddf8 Jason Gunthorpe 2021-11-11  323  	struct iopt_area *area;
d764f3288de0fd Yi Liu          2022-04-17  324  	unsigned long unmapped_byt=
es =3D 0;
1af524ce30ddf8 Jason Gunthorpe 2021-11-11  325  	int rc;
1af524ce30ddf8 Jason Gunthorpe 2021-11-11  326  =

1af524ce30ddf8 Jason Gunthorpe 2021-11-11  327  	down_read(&iopt->domains_r=
wsem);
1af524ce30ddf8 Jason Gunthorpe 2021-11-11  328  	down_write(&iopt->iova_rws=
em);
d764f3288de0fd Yi Liu          2022-04-17  329  	while ((area =3D iopt_area=
_iter_first(iopt, start, end))) {
1af524ce30ddf8 Jason Gunthorpe 2021-11-11  330  		struct iopt_pages *pages;
1af524ce30ddf8 Jason Gunthorpe 2021-11-11  331  =

d764f3288de0fd Yi Liu          2022-04-17  332  		if (!area->pages || iopt_=
area_iova(area) < start ||
d764f3288de0fd Yi Liu          2022-04-17  333  		    iopt_area_last_iova(a=
rea) > end) {
d764f3288de0fd Yi Liu          2022-04-17  334  			rc =3D -ENOENT;
1af524ce30ddf8 Jason Gunthorpe 2021-11-11  335  			goto out_unlock_iova;
1af524ce30ddf8 Jason Gunthorpe 2021-11-11  336  		}
d764f3288de0fd Yi Liu          2022-04-17  337  =

1af524ce30ddf8 Jason Gunthorpe 2021-11-11  338  		pages =3D area->pages;
1af524ce30ddf8 Jason Gunthorpe 2021-11-11  339  		area->pages =3D NULL;
1af524ce30ddf8 Jason Gunthorpe 2021-11-11  340  		up_write(&iopt->iova_rwse=
m);
1af524ce30ddf8 Jason Gunthorpe 2021-11-11  341  =

1af524ce30ddf8 Jason Gunthorpe 2021-11-11  342  		rc =3D __iopt_unmap_iova(=
iopt, area, pages);
1af524ce30ddf8 Jason Gunthorpe 2021-11-11  343  		if (rc)
1af524ce30ddf8 Jason Gunthorpe 2021-11-11  344  			goto out_unlock_domains;
1af524ce30ddf8 Jason Gunthorpe 2021-11-11  345  =

d764f3288de0fd Yi Liu          2022-04-17 @346  		start =3D iopt_area_last_=
iova(area) + 1;
d764f3288de0fd Yi Liu          2022-04-17  347  		unmapped_bytes +=3D
d764f3288de0fd Yi Liu          2022-04-17  348  			iopt_area_last_iova(area=
) - iopt_area_iova(area) + 1;
d764f3288de0fd Yi Liu          2022-04-17  349  =

1af524ce30ddf8 Jason Gunthorpe 2021-11-11  350  		down_write(&iopt->iova_rw=
sem);
1af524ce30ddf8 Jason Gunthorpe 2021-11-11  351  	}
1af524ce30ddf8 Jason Gunthorpe 2021-11-11  352  	rc =3D 0;
1af524ce30ddf8 Jason Gunthorpe 2021-11-11  353  =

1af524ce30ddf8 Jason Gunthorpe 2021-11-11  354  out_unlock_iova:
1af524ce30ddf8 Jason Gunthorpe 2021-11-11  355  	up_write(&iopt->iova_rwsem=
);
1af524ce30ddf8 Jason Gunthorpe 2021-11-11  356  out_unlock_domains:
1af524ce30ddf8 Jason Gunthorpe 2021-11-11  357  	up_read(&iopt->domains_rws=
em);
d764f3288de0fd Yi Liu          2022-04-17  358  	if (unmapped)
d764f3288de0fd Yi Liu          2022-04-17  359  		*unmapped =3D unmapped_by=
tes;
1af524ce30ddf8 Jason Gunthorpe 2021-11-11  360  	return rc;
1af524ce30ddf8 Jason Gunthorpe 2021-11-11  361  }
1af524ce30ddf8 Jason Gunthorpe 2021-11-11  362  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4746929219260493907==--

