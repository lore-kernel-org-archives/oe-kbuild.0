Content-Type: multipart/mixed; boundary="===============4912150018339348469=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/math64.h:92:15: warning: The result of the '>>' expression is undefined [clang-analyzer-core.UndefinedBinaryOperatorResult]
Date: Fri, 09 Sep 2022 19:23:37 +0800
Message-ID: <202209091948.YHIgWPYB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4912150018339348469==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/linux/math64.h:92:15: warning: The result of the '>>' expression i=
s undefined [clang-analyzer-core.UndefinedBinaryOperatorResult]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   506357871c18e06565840d71c2ef9f818e19f460
commit: e1edc277e6f6dfb372216522dfc57f9381c39e35 linux/container_of.h: swit=
ch to static_assert
date:   10 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220904 (https://download.01.org/0day-ci/archi=
ve/20220909/202209091948.YHIgWPYB-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41=
d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De1edc277e6f6dfb372216522dfc57f9381c39e35
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e1edc277e6f6dfb372216522dfc57f9381c39e35
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
                                      ^
   drivers/pci/setup-bus.c:1923:2: note: Calling 'adjust_bridge_window'
           adjust_bridge_window(bridge, io_res, add_list, resource_size(&io=
));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/pci/setup-bus.c:1867:6: note: Assuming field 'parent' is null
           if (res->parent)
               ^~~~~~~~~~~
   drivers/pci/setup-bus.c:1867:2: note: Taking false branch
           if (res->parent)
           ^
   drivers/pci/setup-bus.c:1870:6: note: Assuming 'new_size' is not equal t=
o 0
           if (!new_size)
               ^~~~~~~~~
   drivers/pci/setup-bus.c:1870:2: note: Taking false branch
           if (!new_size)
           ^
   drivers/pci/setup-bus.c:1873:6: note: Assuming 'new_size' is <=3D 'size'
           if (new_size > size) {
               ^~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1873:2: note: Taking false branch
           if (new_size > size) {
           ^
   drivers/pci/setup-bus.c:1877:13: note: Assuming 'new_size' is >=3D 'size'
           } else if (new_size < size) {
                      ^~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1877:9: note: Taking false branch
           } else if (new_size < size) {
                  ^
   drivers/pci/setup-bus.c:1884:2: note: Calling 'remove_from_list'
           remove_from_list(add_list, res);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:87:2: note: Loop condition is true.  Entering lo=
op body
           list_for_each_entry_safe(dev_res, tmp, head, list) {
           ^
   include/linux/list.h:717:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   drivers/pci/setup-bus.c:88:7: note: Assuming 'res' is equal to field 're=
s'
                   if (dev_res->res =3D=3D res) {
                       ^~~~~~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:88:3: note: Taking true branch
                   if (dev_res->res =3D=3D res) {
                   ^
   drivers/pci/setup-bus.c:90:4: note: Memory is released
                           kfree(dev_res);
                           ^~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:91:4: note:  Execution continues on line 90
                           break;
                           ^
   drivers/pci/setup-bus.c:1884:2: note: Returning; memory was released
           remove_from_list(add_list, res);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1923:2: note: Returning; memory was released
           adjust_bridge_window(bridge, io_res, add_list, resource_size(&io=
));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/pci/setup-bus.c:1924:2: note: Calling 'adjust_bridge_window'
           adjust_bridge_window(bridge, mmio_res, add_list, resource_size(&=
mmio));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/pci/setup-bus.c:1867:6: note: Assuming field 'parent' is null
           if (res->parent)
               ^~~~~~~~~~~
   drivers/pci/setup-bus.c:1867:2: note: Taking false branch
           if (res->parent)
           ^
   drivers/pci/setup-bus.c:1870:6: note: Assuming 'new_size' is not equal t=
o 0
           if (!new_size)
               ^~~~~~~~~
   drivers/pci/setup-bus.c:1870:2: note: Taking false branch
           if (!new_size)
           ^
   drivers/pci/setup-bus.c:1873:6: note: Assuming 'new_size' is <=3D 'size'
           if (new_size > size) {
               ^~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1873:2: note: Taking false branch
           if (new_size > size) {
           ^
   drivers/pci/setup-bus.c:1877:13: note: Assuming 'new_size' is >=3D 'size'
           } else if (new_size < size) {
                      ^~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1877:9: note: Taking false branch
           } else if (new_size < size) {
                  ^
   drivers/pci/setup-bus.c:1884:2: note: Calling 'remove_from_list'
           remove_from_list(add_list, res);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:87:2: note: Use of memory after it is freed
           list_for_each_entry_safe(dev_res, tmp, head, list) {
           ^
   include/linux/list.h:718:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:557:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:513:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
>> include/linux/math64.h:92:15: warning: The result of the '>>' expression=
 is undefined [clang-analyzer-core.UndefinedBinaryOperatorResult]
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:234:25: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                                  ^
   drivers/pci/setup-bus.c:2069:2: note: Calling 'pci_bridge_distribute_ava=
ilable_resources'
           pci_bridge_distribute_available_resources(bridge, &add_list);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:2036:6: note: Assuming field 'is_hotplug_bridge'=
 is not equal to 0
           if (!bridge->is_hotplug_bridge)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:2036:2: note: Taking false branch
           if (!bridge->is_hotplug_bridge)
           ^
   drivers/pci/setup-bus.c:2044:2: note: Calling 'pci_bus_distribute_availa=
ble_resources'
           pci_bus_distribute_available_resources(bridge->subordinate,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1907:6: note: Assuming field 'parent' is non-null
           if (!io_res->parent && align)
               ^~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1907:22: note: Left side of '&&' is false
           if (!io_res->parent && align)
                               ^
   drivers/pci/setup-bus.c:1911:6: note: Assuming field 'parent' is non-null
           if (!mmio_res->parent && align)
               ^~~~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1911:24: note: Left side of '&&' is false
           if (!mmio_res->parent && align)
                                 ^
   drivers/pci/setup-bus.c:1915:6: note: Assuming field 'parent' is non-null
           if (!mmio_pref_res->parent && align)
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1915:29: note: Left side of '&&' is false
           if (!mmio_pref_res->parent && align)
                                      ^
   drivers/pci/setup-bus.c:1933:2: note: Loop condition is true.  Entering =
loop body
           for_each_pci_bridge(dev, bus) {
           ^
   include/linux/pci.h:693:2: note: expanded from macro 'for_each_pci_bridg=
e'
           list_for_each_entry(dev, &bus->devices, bus_list)       \
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/pci/setup-bus.c:1933:2: note: Taking false branch
           for_each_pci_bridge(dev, bus) {
           ^
   include/linux/pci.h:694:3: note: expanded from macro 'for_each_pci_bridg=
e'
                   if (!pci_is_bridge(dev)) {} else
                   ^
   drivers/pci/setup-bus.c:1934:7: note: Assuming field 'is_hotplug_bridge'=
 is 0
                   if (dev->is_hotplug_bridge)
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1934:3: note: Taking false branch
                   if (dev->is_hotplug_bridge)
                   ^
   drivers/pci/setup-bus.c:1933:2: note: Loop condition is true.  Entering =
loop body
           for_each_pci_bridge(dev, bus) {
           ^
   include/linux/pci.h:693:2: note: expanded from macro 'for_each_pci_bridg=
e'
           list_for_each_entry(dev, &bus->devices, bus_list)       \
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/pci/setup-bus.c:1933:2: note: Taking false branch
           for_each_pci_bridge(dev, bus) {
           ^
   include/linux/pci.h:694:3: note: expanded from macro 'for_each_pci_bridg=
e'
                   if (!pci_is_bridge(dev)) {} else
                   ^
   drivers/pci/setup-bus.c:1934:7: note: Assuming field 'is_hotplug_bridge'=
 is not equal to 0
                   if (dev->is_hotplug_bridge)
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1934:3: note: Taking true branch
                   if (dev->is_hotplug_bridge)
                   ^
   drivers/pci/setup-bus.c:1933:2: note: Loop condition is false. Execution=
 continues on line 1945
           for_each_pci_bridge(dev, bus) {
           ^
   include/linux/pci.h:693:2: note: expanded from macro 'for_each_pci_bridg=
e'
           list_for_each_entry(dev, &bus->devices, bus_list)       \
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/pci/setup-bus.c:1945:2: note: Taking false branch
           if (hotplug_bridges + normal_bridges =3D=3D 1) {
           ^
   drivers/pci/setup-bus.c:1953:6: note: 'hotplug_bridges' is not equal to 0
           if (hotplug_bridges =3D=3D 0)
               ^~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1953:2: note: Taking false branch
           if (hotplug_bridges =3D=3D 0)
           ^
   drivers/pci/setup-bus.c:1962:2: note: Loop condition is false. Execution=
 continues on line 1997
           for_each_pci_bridge(dev, bus) {
           ^
   include/linux/pci.h:693:2: note: expanded from macro 'for_each_pci_bridg=
e'
           list_for_each_entry(dev, &bus->devices, bus_list)       \
--
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:322:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:312:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/base/regmap/regmap.c:1524:11: note: Assuming 'pos__' is not equa=
l to 'head__'
                   async =3D list_first_entry_or_null(&map->async_free,
                           ^
   include/linux/list.h:548:2: note: expanded from macro 'list_first_entry_=
or_null'
           pos__ !=3D head__ ? list_entry(pos__, type, member) : NULL; \
           ^~~~~~~~~~~~~~~
   drivers/base/regmap/regmap.c:1524:11: note: '?' condition is true
                   async =3D list_first_entry_or_null(&map->async_free,
                           ^
   include/linux/list.h:548:2: note: expanded from macro 'list_first_entry_=
or_null'
           pos__ !=3D head__ ? list_entry(pos__, type, member) : NULL; \
           ^
   drivers/base/regmap/regmap.c:1527:3: note: Calling 'list_del'
                   list_del(&async->list);
                   ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/md/dm-kcopyd.c:246:10: warning: Access to field 'next' results i=
n a dereference of a null pointer (loaded from variable 'pl') [clang-analyz=
er-core.NullDereference]
                   next =3D pl->next;
                          ^
   drivers/md/dm-kcopyd.c:913:6: note: Assuming 'kc' is non-null
           if (!kc)
               ^~~
   drivers/md/dm-kcopyd.c:913:2: note: Taking false branch
           if (!kc)
           ^
   drivers/md/dm-kcopyd.c:916:2: note: Loop condition is false.  Exiting lo=
op
           spin_lock_init(&kc->job_lock);
           ^
   include/linux/spinlock.h:352:34: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(_lock)                  \
                                                   ^
   drivers/md/dm-kcopyd.c:924:6: note: Assuming 'r' is 0
           if (r)
               ^
   drivers/md/dm-kcopyd.c:924:2: note: Taking false branch
           if (r)
           ^
   drivers/md/dm-kcopyd.c:927:2: note: Loop condition is false.  Exiting lo=
op
           INIT_WORK(&kc->kcopyd_work, do_work);
           ^
   include/linux/workqueue.h:245:2: note: expanded from macro 'INIT_WORK'
           __INIT_WORK((_work), (_func), 0)
           ^
   include/linux/workqueue.h:236:2: note: expanded from macro '__INIT_WORK'
           do {                                                            \
           ^
   drivers/md/dm-kcopyd.c:929:6: note: Assuming field 'kcopyd_wq' is non-nu=
ll
           if (!kc->kcopyd_wq) {
               ^~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:929:2: note: Taking false branch
           if (!kc->kcopyd_wq) {
           ^
   drivers/md/dm-kcopyd.c:939:6: note: Calling 'client_reserve_pages'
           r =3D client_reserve_pages(kc, reserve_pages);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:309:20: note: 'pl' initialized to a null pointer =
value
           struct page_list *pl =3D NULL, *next;
                             ^~
   drivers/md/dm-kcopyd.c:311:14: note: Assuming 'i' is >=3D 'nr_pages'
           for (i =3D 0; i < nr_pages; i++) {
                       ^~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:311:2: note: Loop condition is false. Execution c=
ontinues on line 322
           for (i =3D 0; i < nr_pages; i++) {
           ^
   drivers/md/dm-kcopyd.c:323:23: note: Passing null pointer value via 2nd =
parameter 'pl'
           kcopyd_put_pages(kc, pl);
                                ^~
   drivers/md/dm-kcopyd.c:323:2: note: Calling 'kcopyd_put_pages'
           kcopyd_put_pages(kc, pl);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:246:10: note: Access to field 'next' results in a=
 dereference of a null pointer (loaded from variable 'pl')
                   next =3D pl->next;
                          ^~
>> drivers/md/dm-kcopyd.c:494:3: warning: Use of memory after it is freed [=
clang-analyzer-unix.Malloc]
                   kcopyd_put_pages(kc, job->pages);
                   ^
   drivers/md/dm-kcopyd.c:662:2: note: Calling 'process_jobs'
           process_jobs(&kc->complete_jobs, kc, run_complete_job);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:611:2: note: Loop condition is true.  Entering lo=
op body
           while ((job =3D pop(jobs, kc))) {
           ^
   drivers/md/dm-kcopyd.c:613:7: note: Calling 'run_complete_job'
                   r =3D fn(job);
                       ^~~~~~~
   drivers/md/dm-kcopyd.c:493:6: note: Assuming field 'pages' is non-null
           if (job->pages && job->pages !=3D &zero_page_list)
               ^~~~~~~~~~
   drivers/md/dm-kcopyd.c:493:6: note: Left side of '&&' is true
   drivers/md/dm-kcopyd.c:493:20: note: Assuming the condition is true
           if (job->pages && job->pages !=3D &zero_page_list)
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:493:2: note: Taking true branch
           if (job->pages && job->pages !=3D &zero_page_list)
           ^
   drivers/md/dm-kcopyd.c:494:3: note: Calling 'kcopyd_put_pages'
                   kcopyd_put_pages(kc, job->pages);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:248:7: note: Assuming field 'nr_free_pages' is >=
=3D field 'nr_reserved_pages'
                   if (kc->nr_free_pages >=3D kc->nr_reserved_pages)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:248:3: note: Taking true branch
                   if (kc->nr_free_pages >=3D kc->nr_reserved_pages)
                   ^
   drivers/md/dm-kcopyd.c:249:4: note: Calling 'free_pl'
                           free_pl(pl);
                           ^~~~~~~~~~~
   drivers/md/dm-kcopyd.c:234:2: note: Memory is released
           kfree(pl);
           ^~~~~~~~~
   drivers/md/dm-kcopyd.c:249:4: note: Returning; memory was released via 1=
st parameter
                           free_pl(pl);
                           ^~~~~~~~~~~
   drivers/md/dm-kcopyd.c:245:2: note: Loop condition is false.  Exiting lo=
op
           do {
           ^
   drivers/md/dm-kcopyd.c:494:3: note: Returning; memory was released via 2=
nd parameter
                   kcopyd_put_pages(kc, job->pages);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:499:6: note: Assuming 'job' is not equal to field=
 'master_job'
           if (job->master_job =3D=3D job) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:499:2: note: Taking false branch
           if (job->master_job =3D=3D job) {
           ^
   drivers/md/dm-kcopyd.c:505:2: note: Taking false branch
           if (atomic_dec_and_test(&kc->nr_jobs))
           ^
   drivers/md/dm-kcopyd.c:613:7: note: Returning; memory was released
                   r =3D fn(job);
                       ^~~~~~~
   drivers/md/dm-kcopyd.c:615:7: note: 'r' is >=3D 0
                   if (r < 0) {
                       ^
   drivers/md/dm-kcopyd.c:615:3: note: Taking false branch
                   if (r < 0) {
                   ^
   drivers/md/dm-kcopyd.c:626:7: note: 'r' is <=3D 0
                   if (r > 0) {
                       ^
   drivers/md/dm-kcopyd.c:626:3: note: Taking false branch
                   if (r > 0) {
                   ^
   drivers/md/dm-kcopyd.c:611:2: note: Loop condition is true.  Entering lo=
op body
           while ((job =3D pop(jobs, kc))) {
           ^
   drivers/md/dm-kcopyd.c:613:7: note: Calling 'run_complete_job'
                   r =3D fn(job);
                       ^~~~~~~
   drivers/md/dm-kcopyd.c:493:11: note: Field 'pages' is non-null
           if (job->pages && job->pages !=3D &zero_page_list)
                    ^
   drivers/md/dm-kcopyd.c:493:6: note: Left side of '&&' is true
           if (job->pages && job->pages !=3D &zero_page_list)
               ^
   drivers/md/dm-kcopyd.c:493:20: note: Assuming the condition is true
           if (job->pages && job->pages !=3D &zero_page_list)
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:493:2: note: Taking true branch
           if (job->pages && job->pages !=3D &zero_page_list)
           ^
   drivers/md/dm-kcopyd.c:494:3: note: Use of memory after it is freed
                   kcopyd_put_pages(kc, job->pages);
                   ^                    ~~~~~~~~~~
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
--
           ^     ~
   sound/pci/riptide/riptide.c:860:2: note: Value stored to 'err' is never =
read
           err =3D 0;
           ^     ~
   sound/pci/riptide/riptide.c:947:15: warning: The left operand of '<' is =
a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (sink[i] < E2SINK_MAX) {
                       ~~~~~~~ ^
   sound/pci/riptide/riptide.c:945:7: note: The value 0 is assigned to 'i'
           for (i =3D 0; i < E2SINK_MAX; i++) {
                ^~~~~
   sound/pci/riptide/riptide.c:945:2: note: Loop condition is true.  Enteri=
ng loop body
           for (i =3D 0; i < E2SINK_MAX; i++) {
           ^
   sound/pci/riptide/riptide.c:946:3: note: Calling 'getsourcesink'
                   getsourcesink(cif, i, i, &src[i], &sink[i]);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/riptide/riptide.c:961:6: note: Assuming the condition is true
           if (SEND_RSSV(cif, source, sink, &rptr) &&
               ^
   sound/pci/riptide/riptide.c:249:36: note: expanded from macro 'SEND_RSSV'
   #define SEND_RSSV(p,b,c,d)         sendcmd(p,PARM|RESP,RSSV,BYTE2(b)|BYT=
E3(c),RET(d))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
   sound/pci/riptide/riptide.c:961:6: note: Left side of '&&' is true
           if (SEND_RSSV(cif, source, sink, &rptr) &&
               ^
   sound/pci/riptide/riptide.c:249:36: note: expanded from macro 'SEND_RSSV'
   #define SEND_RSSV(p,b,c,d)         sendcmd(p,PARM|RESP,RSSV,BYTE2(b)|BYT=
E3(c),RET(d))
                                      ^
   sound/pci/riptide/riptide.c:962:6: note: Assuming the condition is true
               SEND_RSSV(cif, source, sink, &rptr))
               ^
   sound/pci/riptide/riptide.c:249:36: note: expanded from macro 'SEND_RSSV'
   #define SEND_RSSV(p,b,c,d)         sendcmd(p,PARM|RESP,RSSV,BYTE2(b)|BYT=
E3(c),RET(d))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
   sound/pci/riptide/riptide.c:961:2: note: Taking true branch
           if (SEND_RSSV(cif, source, sink, &rptr) &&
           ^
   sound/pci/riptide/riptide.c:963:3: note: Returning without writing to '*=
b'
                   return -EIO;
                   ^
   sound/pci/riptide/riptide.c:946:3: note: Returning from 'getsourcesink'
                   getsourcesink(cif, i, i, &src[i], &sink[i]);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/riptide/riptide.c:947:15: note: The left operand of '<' is a g=
arbage value
                   if (sink[i] < E2SINK_MAX) {
                       ~~~~~~~ ^
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/usb/storage/sierra_ms.c:133:2: warning: Value stored to 'retries=
' is never read [clang-analyzer-deadcode.DeadStores]
           retries =3D 3;
           ^         ~
   drivers/usb/storage/sierra_ms.c:133:2: note: Value stored to 'retries' i=
s never read
           retries =3D 3;
           ^         ~
   drivers/usb/storage/sierra_ms.c:134:2: warning: Value stored to 'result'=
 is never read [clang-analyzer-deadcode.DeadStores]
           result =3D 0;
           ^        ~
   drivers/usb/storage/sierra_ms.c:134:2: note: Value stored to 'result' is=
 never read
           result =3D 0;
           ^        ~
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (2 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   sound/drivers/opl3/opl3_lib.c:502:2: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(hw->name, hw->id);
           ^~~~~~
   sound/drivers/opl3/opl3_lib.c:502:2: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
           strcpy(hw->name, hw->id);
           ^~~~~~
   sound/drivers/opl3/opl3_lib.c:529:3: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(opl3->seq_dev->name, hw->name);
                   ^~~~~~
   sound/drivers/opl3/opl3_lib.c:529:3: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
                   strcpy(opl3->seq_dev->name, hw->name);
                   ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
>> drivers/md/dm-stats.c:174:2: warning: Attempt to free released memory [c=
lang-analyzer-unix.Malloc]
           kfree(s->histogram_boundaries);
           ^
   drivers/md/dm-stats.c:212:2: note: Loop condition is true.  Entering loo=
p body
           while (!list_empty(&stats->list)) {
           ^
   drivers/md/dm-stats.c:215:16: note: Assuming 'ni' is >=3D field 'n_entri=
es'
                   for (ni =3D 0; ni < s->n_entries; ni++) {
                                ^~~~~~~~~~~~~~~~~
   drivers/md/dm-stats.c:215:3: note: Loop condition is false. Execution co=
ntinues on line 228
                   for (ni =3D 0; ni < s->n_entries; ni++) {
                   ^
   drivers/md/dm-stats.c:228:3: note: Calling 'dm_stat_free'
                   dm_stat_free(&s->rcu_head);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-stats.c:174:2: note: Memory is released
           kfree(s->histogram_boundaries);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-stats.c:177:2: note: Loop condition is true.  Entering loo=
p body
           for_each_possible_cpu(cpu) {
           ^
   include/linux/cpumask.h:788:36: note: expanded from macro 'for_each_poss=
ible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
                                      ^
   include/linux/cpumask.h:179:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   drivers/md/dm-stats.c:177:2: note: Loop condition is false. Execution co=
ntinues on line 181
           for_each_possible_cpu(cpu) {
           ^
   include/linux/cpumask.h:788:36: note: expanded from macro 'for_each_poss=
ible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
                                      ^
   include/linux/cpumask.h:179:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   drivers/md/dm-stats.c:228:3: note: Returning; memory was released
                   dm_stat_free(&s->rcu_head);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-stats.c:212:2: note: Loop condition is true.  Entering loo=
p body
           while (!list_empty(&stats->list)) {
           ^
   drivers/md/dm-stats.c:215:3: note: Loop condition is false. Execution co=
ntinues on line 228
                   for (ni =3D 0; ni < s->n_entries; ni++) {
                   ^
   drivers/md/dm-stats.c:228:3: note: Calling 'dm_stat_free'
                   dm_stat_free(&s->rcu_head);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-stats.c:174:2: note: Attempt to free released memory
           kfree(s->histogram_boundaries);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/thermal/thermal_hwmon.c:96:3: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(type, tz->type);
                   ^~~~~~
   drivers/thermal/thermal_hwmon.c:96:3: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
                   strcpy(type, tz->type);
                   ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +92 include/linux/math64.h

f910381a55cdaa Sasha Levin  2012-03-15  88  =

2418f4f28f8467 Roman Zippel 2008-05-01  89  #ifndef div_u64_rem
2418f4f28f8467 Roman Zippel 2008-05-01  90  static inline u64 div_u64_rem(u=
64 dividend, u32 divisor, u32 *remainder)
2418f4f28f8467 Roman Zippel 2008-05-01  91  {
2418f4f28f8467 Roman Zippel 2008-05-01 @92  	*remainder =3D do_div(dividend=
, divisor);
2418f4f28f8467 Roman Zippel 2008-05-01  93  	return dividend;
2418f4f28f8467 Roman Zippel 2008-05-01  94  }
2418f4f28f8467 Roman Zippel 2008-05-01  95  #endif
2418f4f28f8467 Roman Zippel 2008-05-01  96  =


:::::: The code at line 92 was first introduced by commit
:::::: 2418f4f28f8467b92a6177af32d05737ebf6206c introduce explicit signed/u=
nsigned 64bit divide

:::::: TO: Roman Zippel <zippel@linux-m68k.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4912150018339348469==--

