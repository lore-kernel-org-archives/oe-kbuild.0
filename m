Content-Type: multipart/mixed; boundary="===============3961386570131850410=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [daniel-thompson:clang-analyzer/initial_review 7/7] block/sed-opal.c:1499:18: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Wed, 11 May 2022 04:32:26 +0800
Message-ID: <202205110459.UgpnUIH2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3961386570131850410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Thompson <daniel.thompson@linaro.org>

tree:   https://git.linaro.org/people/daniel.thompson/linux.git clang-analy=
zer/initial_review
head:   ad6525bf355a301ca52b1dc3639fa340409c79b9
commit: ad6525bf355a301ca52b1dc3639fa340409c79b9 [7/7] [RFC] linux/err.h: R=
efactor IS_ERR_VALUE(x) to improve clang reasoning
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20511/202205110459.UgpnUIH2-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004f=
b787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add daniel-thompson https://git.linaro.org/people/daniel=
.thompson/linux.git
        git fetch --no-tags daniel-thompson clang-analyzer/initial_review
        git checkout ad6525bf355a301ca52b1dc3639fa340409c79b9
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:402:10: note: Returning from 'opal_discovery0_step'
           error =3D opal_discovery0_step(dev);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:403:6: note: 'error' is 0
           if (error)
               ^~~~~
   block/sed-opal.c:403:2: note: Taking false branch
           if (error)
           ^
   block/sed-opal.c:406:2: note: Loop condition is true.  Entering loop body
           for (state =3D 0; state < n_steps; state++) {
           ^
   block/sed-opal.c:407:11: note: Calling 'execute_step'
                   error =3D execute_step(dev, &steps[state], state);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:384:28: note: Passing null pointer value via 2nd parame=
ter 'data'
           int error =3D step->fn(dev, step->data);
                                     ^~~~~~~~~~
   block/sed-opal.c:384:14: note: Calling 'start_SIDASP_opal_session'
           int error =3D step->fn(dev, step->data);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:1458:6: note: Assuming 'key' is null
           if (!key) {
               ^~~~
   block/sed-opal.c:1458:2: note: Taking true branch
           if (!key) {
           ^
   block/sed-opal.c:1459:3: note: 'okey' initialized to a null pointer value
                   const struct opal_key *okey =3D data;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:1464:8: note: Access to field 'key_len' results in a de=
reference of a null pointer (loaded from variable 'okey')
                                                    okey->key_len);
                                                    ^~~~
   block/sed-opal.c:1492:8: warning: Access to field 'key_len' results in a=
 dereference of a null pointer (loaded from variable 'okey') [clang-analyze=
r-core.NullDereference]
                                             okey->key_len);
                                             ^
   block/sed-opal.c:2628:6: note: Assuming the condition is false
           if (!capable(CAP_SYS_ADMIN))
               ^~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:2628:2: note: Taking false branch
           if (!capable(CAP_SYS_ADMIN))
           ^
   block/sed-opal.c:2630:6: note: Assuming 'dev' is non-null
           if (!dev)
               ^~~~
   block/sed-opal.c:2630:2: note: Taking false branch
           if (!dev)
           ^
   block/sed-opal.c:2632:6: note: Assuming field 'supported' is true
           if (!dev->supported)
               ^~~~~~~~~~~~~~~
   block/sed-opal.c:2632:2: note: Taking false branch
           if (!dev->supported)
           ^
   block/sed-opal.c:2636:2: note: Taking false branch
           if (IS_ERR(p))
           ^
   block/sed-opal.c:2639:2: note: Control jumps to 'case 1091072232:'  at l=
ine 2682
           switch (cmd) {
           ^
   block/sed-opal.c:2683:9: note: Calling 'opal_reverttper'
                   ret =3D opal_reverttper(dev, p, true);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:2337:2: note: field 'data' initialized to a null pointe=
r value
           const struct opal_step psid_revert_steps[] =3D {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:2346:6: note: 'psid' is true
           if (psid)
               ^~~~
   block/sed-opal.c:2346:2: note: Taking true branch
           if (psid)
           ^
   block/sed-opal.c:2347:9: note: Calling 'execute_steps'
                   ret =3D execute_steps(dev, psid_revert_steps,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:403:6: note: 'error' is 0
           if (error)
               ^~~~~
   block/sed-opal.c:403:2: note: Taking false branch
           if (error)
           ^
   block/sed-opal.c:406:2: note: Loop condition is true.  Entering loop body
           for (state =3D 0; state < n_steps; state++) {
           ^
   block/sed-opal.c:407:11: note: Calling 'execute_step'
                   error =3D execute_step(dev, &steps[state], state);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:384:28: note: Passing null pointer value via 2nd parame=
ter 'data'
           int error =3D step->fn(dev, step->data);
                                     ^~~~~~~~~~
   block/sed-opal.c:384:14: note: Calling 'start_PSID_opal_session'
           int error =3D step->fn(dev, step->data);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:1487:2: note: 'okey' initialized to a null pointer value
           const struct opal_key *okey =3D data;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:1492:8: note: Access to field 'key_len' results in a de=
reference of a null pointer (loaded from variable 'okey')
                                             okey->key_len);
                                             ^~~~
>> block/sed-opal.c:1499:18: warning: Dereference of null pointer [clang-an=
alyzer-core.NullDereference]
           size_t keylen =3D session->opal_key.key_len;
                           ^
   block/sed-opal.c:2628:6: note: Assuming the condition is false
           if (!capable(CAP_SYS_ADMIN))
               ^~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:2628:2: note: Taking false branch
           if (!capable(CAP_SYS_ADMIN))
           ^
   block/sed-opal.c:2630:6: note: Assuming 'dev' is non-null
           if (!dev)
               ^~~~
   block/sed-opal.c:2630:2: note: Taking false branch
           if (!dev)
           ^
   block/sed-opal.c:2632:6: note: Assuming field 'supported' is true
           if (!dev->supported)
               ^~~~~~~~~~~~~~~
   block/sed-opal.c:2632:2: note: Taking false branch
           if (!dev->supported)
           ^
   block/sed-opal.c:2636:2: note: Taking false branch
           if (IS_ERR(p))
           ^
   block/sed-opal.c:2639:2: note: Control jumps to 'case 1091596518:'  at l=
ine 2676
           switch (cmd) {
           ^
   block/sed-opal.c:2677:9: note: Calling 'opal_erase_locking_range'
                   ret =3D opal_erase_locking_range(dev, p);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:2185:2: note: field 'data' initialized to a null pointe=
r value
           const struct opal_step erase_steps[] =3D {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:2194:8: note: Calling 'execute_steps'
           ret =3D execute_steps(dev, erase_steps, ARRAY_SIZE(erase_steps));
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:403:6: note: 'error' is 0
           if (error)
               ^~~~~
   block/sed-opal.c:403:2: note: Taking false branch
           if (error)
           ^
   block/sed-opal.c:406:2: note: Loop condition is true.  Entering loop body
           for (state =3D 0; state < n_steps; state++) {
           ^
   block/sed-opal.c:407:11: note: Calling 'execute_step'
                   error =3D execute_step(dev, &steps[state], state);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:384:28: note: Passing null pointer value via 2nd parame=
ter 'data'
           int error =3D step->fn(dev, step->data);
                                     ^~~~~~~~~~
   block/sed-opal.c:384:14: note: Calling 'start_auth_opal_session'
           int error =3D step->fn(dev, step->data);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:1497:2: note: 'session' initialized to a null pointer v=
alue
           struct opal_session_info *session =3D data;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:1499:18: note: Dereference of null pointer
           size_t keylen =3D session->opal_key.key_len;
                           ^~~~~~~~~~~~~~~~~~~~~~~~~
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
--
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   kernel/events/core.c:10339:29: note: Left side of '||' is true
           struct task_struct *task =3D READ_ONCE(event->ctx->task);
                                      ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                                               ^
   kernel/events/core.c:10339:29: note: Taking false branch
           struct task_struct *task =3D READ_ONCE(event->ctx->task);
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
   kernel/events/core.c:10339:29: note: Loop condition is false.  Exiting l=
oop
           struct task_struct *task =3D READ_ONCE(event->ctx->task);
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
   kernel/events/core.c:10341:2: note: 'mm' initialized to a null pointer v=
alue
           struct mm_struct *mm =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:10349:6: note: Assuming the condition is false
           if (task =3D=3D TASK_TOMBSTONE)
               ^~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:10349:2: note: Taking false branch
           if (task =3D=3D TASK_TOMBSTONE)
           ^
   kernel/events/core.c:10352:6: note: Assuming field 'nr_file_filters' is 0
           if (ifh->nr_file_filters) {
               ^~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:10352:2: note: Taking false branch
           if (ifh->nr_file_filters) {
           ^
   kernel/events/core.c:10360:2: note: Loop condition is false.  Exiting lo=
op
           raw_spin_lock_irqsave(&ifh->lock, flags);
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   kernel/events/core.c:10361:2: note: Loop condition is true.  Entering lo=
op body
           list_for_each_entry(filter, &ifh->list, entry) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   kernel/events/core.c:10362:7: note: Assuming field 'dentry' is non-null
                   if (filter->path.dentry) {
                       ^~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:10362:3: note: Taking true branch
                   if (filter->path.dentry) {
                   ^
   kernel/events/core.c:10370:35: note: Passing null pointer value via 2nd =
parameter 'mm'
                           perf_addr_filter_apply(filter, mm, &event->addr_=
filter_ranges[count]);
                                                          ^~
   kernel/events/core.c:10370:4: note: Calling 'perf_addr_filter_apply'
                           perf_addr_filter_apply(filter, mm, &event->addr_=
filter_ranges[count]);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:10323:13: note: Dereference of null pointer
           for (vma =3D mm->mmap; vma; vma =3D vma->vm_next) {
                      ^~~~~~~~
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/net/phy/mdio_bus.c:497:2: warning: Null pointer passed as 1st ar=
gument to string copy function [clang-analyzer-unix.cstring.NullArg]
           strncpy(mdiodev->modalias, bi->modalias,
           ^       ~~~~~~~~~~~~~~~~~
   drivers/net/phy/mdio_bus.c:494:2: note: Taking false branch
           if (IS_ERR(mdiodev))
           ^
   drivers/net/phy/mdio_bus.c:497:2: note: Null pointer passed as 1st argum=
ent to string copy function
           strncpy(mdiodev->modalias, bi->modalias,
           ^       ~~~~~~~~~~~~~~~~~
   drivers/net/phy/mdio_bus.c:689:21: warning: Value stored to 'phydev' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct phy_device *phydev =3D ERR_PTR(-ENODEV);
                              ^~~~~~   ~~~~~~~~~~~~~~~~
   drivers/net/phy/mdio_bus.c:689:21: note: Value stored to 'phydev' during=
 its initialization is never read
           struct phy_device *phydev =3D ERR_PTR(-ENODEV);
                              ^~~~~~   ~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/net/phy/sfp-bus.c:510:2: warning: Access to field 'attach' resul=
ts in a dereference of a null pointer (loaded from field 'upstream_ops') [c=
lang-analyzer-core.NullDereference]
           bus->upstream_ops->attach(bus->upstream, bus);
           ^
   drivers/net/phy/sfp-bus.c:694:6: note: Assuming 'bus' is non-null
           if (!bus)
               ^~~~
   drivers/net/phy/sfp-bus.c:694:2: note: Taking false branch
           if (!bus)
           ^
   drivers/net/phy/sfp-bus.c:699:2: note: Value assigned to field 'upstream=
_ops'
           bus->upstream_ops =3D ops;
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/sfp-bus.c:702:6: note: Assuming field 'sfp' is non-null
           if (bus->sfp) {
               ^~~~~~~~
   drivers/net/phy/sfp-bus.c:702:2: note: Taking true branch
           if (bus->sfp) {
           ^
   drivers/net/phy/sfp-bus.c:703:9: note: Calling 'sfp_register_bus'
                   ret =3D sfp_register_bus(bus);
                         ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/sfp-bus.c:497:6: note: Assuming 'ops' is null
           if (ops) {
               ^~~
   drivers/net/phy/sfp-bus.c:497:2: note: Taking false branch
           if (ops) {
           ^
   drivers/net/phy/sfp-bus.c:508:6: note: Assuming field 'started' is false
           if (bus->started)
               ^~~~~~~~~~~~
   drivers/net/phy/sfp-bus.c:508:2: note: Taking false branch
           if (bus->started)
           ^
   drivers/net/phy/sfp-bus.c:510:2: note: Access to field 'attach' results =
in a dereference of a null pointer (loaded from field 'upstream_ops')
           bus->upstream_ops->attach(bus->upstream, bus);
           ^    ~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   include/linux/list.h:137:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   fs/ceph/snap.c:1181:2: note: Loop condition is true.  Entering loop body
           while ((p =3D rb_first(&mdsc->snapid_map_tree))) {
           ^
   fs/ceph/snap.c:1181:2: note: Loop condition is false. Execution continue=
s on line 1187
   fs/ceph/snap.c:1189:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(&to_free)) {
           ^
   fs/ceph/snap.c:1193:7: note: Assuming the condition is true
                   if (WARN_ON_ONCE(atomic_read(&sm->ref))) {
                       ^
   include/asm-generic/bug.h:104:23: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                ^~~~~~~~~~~~
   fs/ceph/snap.c:1193:7: note: Taking false branch
                   if (WARN_ON_ONCE(atomic_read(&sm->ref))) {
                       ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   fs/ceph/snap.c:1193:3: note: Taking false branch
                   if (WARN_ON_ONCE(atomic_read(&sm->ref))) {
                   ^
   fs/ceph/snap.c:1197:3: note: Memory is released
                   kfree(sm);
                   ^~~~~~~~~
   fs/ceph/snap.c:1189:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(&to_free)) {
           ^
   fs/ceph/snap.c:1191:3: note: Calling 'list_del'
                   list_del(&sm->lru);
                   ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:6: note: Assuming the condition is false
--
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/quota_local.c:696:10: note: Returning from 'kmalloc'
           oinfo =3D kmalloc(sizeof(struct ocfs2_mem_dqinfo), GFP_NOFS);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/quota_local.c:697:6: note: Assuming 'oinfo' is non-null
           if (!oinfo) {
               ^~~~~~
   fs/ocfs2/quota_local.c:697:2: note: Taking false branch
           if (!oinfo) {
           ^
   fs/ocfs2/quota_local.c:712:6: note: Assuming 'status' is >=3D 0
           if (status < 0)
               ^~~~~~~~~~
   fs/ocfs2/quota_local.c:712:2: note: Taking false branch
           if (status < 0)
           ^
   fs/ocfs2/quota_local.c:716:6: note: Assuming 'status' is >=3D 0
           if (status < 0) {
               ^~~~~~~~~~
   fs/ocfs2/quota_local.c:716:2: note: Taking false branch
           if (status < 0) {
           ^
   fs/ocfs2/quota_local.c:723:11: note: Calling 'ocfs2_read_quota_block'
           status =3D ocfs2_read_quota_block(lqinode, 0, &bh);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/quota_local.c:140:6: note: Assuming the condition is true
           if (i_size_read(inode) >> inode->i_sb->s_blocksize_bits <=3D v_b=
lock)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/ocfs2/quota_local.c:140:2: note: Taking true branch
           if (i_size_read(inode) >> inode->i_sb->s_blocksize_bits <=3D v_b=
lock)
           ^
   fs/ocfs2/quota_local.c:141:3: note: Returning without writing to '*bh'
                   return ocfs2_error(inode->i_sb,
                   ^
   fs/ocfs2/quota_local.c:141:3: note: Returning value, which participates =
in a condition later
                   return ocfs2_error(inode->i_sb,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/quota_local.c:723:11: note: Returning from 'ocfs2_read_quota_bl=
ock'
           status =3D ocfs2_read_quota_block(lqinode, 0, &bh);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/quota_local.c:724:6: note: Assuming 'status' is 0
           if (status) {
               ^~~~~~
   fs/ocfs2/quota_local.c:724:2: note: Taking false branch
           if (status) {
           ^
   fs/ocfs2/quota_local.c:730:46: note: Access to field 'b_data' results in=
 a dereference of a null pointer (loaded from variable 'bh')
           ldinfo =3D (struct ocfs2_local_disk_dqinfo *)(bh->b_data +
                                                       ^~
   fs/ocfs2/quota_local.c:1243:2: warning: Value stored to 'status' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           status =3D ocfs2_extent_map_get_blocks(lqinode,
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/quota_local.c:1243:2: note: Value stored to 'status' is never r=
ead
           status =3D ocfs2_extent_map_get_blocks(lqinode,
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   kernel/trace/trace_events.c:1363:3: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, "*");
                   ^~~~~~
   kernel/trace/trace_events.c:1363:3: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
                   strcat(buf, "*");
                   ^~~~~~
   kernel/trace/trace_events.c:1365:2: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(buf, "\n");
           ^~~~~~
   kernel/trace/trace_events.c:1365:2: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
           strcat(buf, "\n");
           ^~~~~~
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
   26 warnings generated.
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
>> kernel/bpf/syscall.c:747:2: warning: Null pointer passed as 1st argument=
 to memory set function [clang-analyzer-unix.cstring.NullArg]
           memset(dst, 0, size);
           ^
   kernel/bpf/syscall.c:4758:2: note: Control jumps to 'case BPF_MAP_CREATE=
:'  at line 4759
           switch (cmd) {
           ^
   kernel/bpf/syscall.c:4764:3: note:  Execution continues on line 4771
                   break;
                   ^
   kernel/bpf/syscall.c:4771:9: note: Calling '__sys_bpf'
           return __sys_bpf(cmd, KERNEL_BPFPTR(attr), attr_size);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:4600:6: note: Assuming 'sysctl_unprivileged_bpf_dis=
abled' is 0
           if (sysctl_unprivileged_bpf_disabled && !bpf_capable())
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:4600:39: note: Left side of '&&' is false
           if (sysctl_unprivileged_bpf_disabled && !bpf_capable())
                                                ^
   kernel/bpf/syscall.c:4604:6: note: 'err' is 0
           if (err)
               ^~~
   kernel/bpf/syscall.c:4604:2: note: Taking false branch
           if (err)
           ^
   kernel/bpf/syscall.c:4606:9: note: Assuming '__UNIQUE_ID___x903' is >=3D=
 '__UNIQUE_ID___y904'
           size =3D min_t(u32, size, sizeof(attr));
                  ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   kernel/bpf/syscall.c:4606:9: note: '?' condition is false
           size =3D min_t(u32, size, sizeof(attr));
                  ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
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
   kernel/bpf/syscall.c:4610:6: note: Calling 'copy_from_bpfptr'
           if (copy_from_bpfptr(&attr, uattr, size) !=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bpfptr.h:57:9: note: Calling 'copy_from_bpfptr_offset'
           return copy_from_bpfptr_offset(dst, src, 0, size);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bpfptr.h:52:9: note: Calling 'copy_from_sockptr_offset'
           return copy_from_sockptr_offset(dst, (sockptr_t) src, offset, si=
ze);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/sockptr.h:47:2: note: Taking false branch
           if (!sockptr_is_kernel(src))
           ^
   include/linux/bpfptr.h:52:9: note: Returning from 'copy_from_sockptr_off=
set'
           return copy_from_sockptr_offset(dst, (sockptr_t) src, offset, si=
ze);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/bpfptr.h:57:9: note: Returning from 'copy_from_bpfptr_offs=
et'
           return copy_from_bpfptr_offset(dst, src, 0, size);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:4610:6: note: Returning from 'copy_from_bpfptr'
           if (copy_from_bpfptr(&attr, uattr, size) !=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:4610:2: note: Taking false branch
           if (copy_from_bpfptr(&attr, uattr, size) !=3D 0)
           ^
   kernel/bpf/syscall.c:4614:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   kernel/bpf/syscall.c:4614:2: note: Taking false branch
           if (err < 0)
           ^
   kernel/bpf/syscall.c:4617:2: note: Control jumps to 'case BPF_MAP_CREATE=
:' @line 4618
           switch (cmd) {
           ^
   kernel/bpf/syscall.c:4619:9: note: Calling 'map_create'
                   err =3D map_create(&attr);
                         ^~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:839:8: note: Assuming the condition is false
           err =3D CHECK_ATTR(BPF_MAP_CREATE);
                 ^
   kernel/bpf/syscall.c:733:2: note: expanded from macro 'CHECK_ATTR'
           memchr_inv((void *) &attr->CMD##_LAST_FIELD + \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:840:6: note: 'err' is 0
           if (err)
               ^~~
   kernel/bpf/syscall.c:840:2: note: Taking false branch
           if (err)
--
                                                                           ^
   drivers/net/wireless/wl3501_cs.c:281:2: note: Returning from 'insb'
           insb(this->base_addr + WL3501_NIC_IODPA, dest, size);
           ^
   arch/x86/include/asm/io.h:330:14: note: expanded from macro 'insb'
   #define insb insb
                ^
   drivers/net/wireless/wl3501_cs.c:282:1: note: Returning without writing =
to 'dest->status'
   }
   ^
   drivers/net/wireless/wl3501_cs.c:1025:2: note: Returning from 'wl3501_ge=
t_from_wla'
           wl3501_get_from_wla(this, addr, &sig, sizeof(sig));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/wl3501_cs.c:1027:17: note: The left operand of '=3D=
=3D' is a garbage value
           if (sig.status =3D=3D WL3501_STATUS_SUCCESS)
               ~~~~~~~~~~ ^
   drivers/net/wireless/wl3501_cs.c:1039:17: warning: The left operand of '=
=3D=3D' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResu=
lt]
           if (sig.status =3D=3D WL3501_STATUS_SUCCESS)
               ~~~~~~~~~~ ^
   drivers/net/wireless/wl3501_cs.c:1036:2: note: Taking true branch
           pr_debug("entry");
           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (__is_defined(CC_IS_STATIC_ANALYZER))        \
           ^
   drivers/net/wireless/wl3501_cs.c:1036:2: note: Loop condition is false. =
 Exiting loop
           pr_debug("entry");
           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:132:3: note: expanded from macro 'no_printk'
                   printk(fmt, ##__VA_ARGS__);             \
                   ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/net/wireless/wl3501_cs.c:1037:2: note: Calling 'wl3501_get_from_=
wla'
           wl3501_get_from_wla(this, addr, &sig, sizeof(sig));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/wl3501_cs.c:274:28: note: Assuming the condition is=
 false
           wl3501_switch_page(this, (src & 0x8000) ? WL3501_BSS_SPAGE1 :
                                     ^~~~~~~~~~~~
   drivers/net/wireless/wl3501_cs.c:274:27: note: '?' condition is false
           wl3501_switch_page(this, (src & 0x8000) ? WL3501_BSS_SPAGE1 :
                                    ^
   drivers/net/wireless/wl3501_cs.c:281:2: note: Calling 'insb'
           insb(this->base_addr + WL3501_NIC_IODPA, dest, size);
           ^
   arch/x86/include/asm/io.h:330:14: note: expanded from macro 'insb'
   #define insb insb
                ^
   arch/x86/include/asm/io.h:320:1: note: Taking false branch
   BUILDIO(b, b, char)
   ^
   arch/x86/include/asm/io.h:306:2: note: expanded from macro 'BUILDIO'
           if (cc_platform_has(CC_ATTR_GUEST_UNROLL_STRING_IO)) {          \
           ^
   arch/x86/include/asm/io.h:320:1: note: Returning without writing to 'add=
r->status'
   BUILDIO(b, b, char)
   ^
   arch/x86/include/asm/io.h:317:11: note: expanded from macro 'BUILDIO'
           }                                                               \
                                                                           ^
   drivers/net/wireless/wl3501_cs.c:281:2: note: Returning from 'insb'
           insb(this->base_addr + WL3501_NIC_IODPA, dest, size);
           ^
   arch/x86/include/asm/io.h:330:14: note: expanded from macro 'insb'
   #define insb insb
                ^
   drivers/net/wireless/wl3501_cs.c:282:1: note: Returning without writing =
to 'dest->status'
   }
   ^
   drivers/net/wireless/wl3501_cs.c:1037:2: note: Returning from 'wl3501_ge=
t_from_wla'
           wl3501_get_from_wla(this, addr, &sig, sizeof(sig));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/wl3501_cs.c:1039:17: note: The left operand of '=3D=
=3D' is a garbage value
           if (sig.status =3D=3D WL3501_STATUS_SUCCESS)
               ~~~~~~~~~~ ^
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/scsi/scsi_lib.c:1129:2: warning: Null pointer passed as 1st argu=
ment to memory set function [clang-analyzer-unix.cstring.NullArg]
           memset(req->__cmd, 0, sizeof(req->__cmd));
           ^
   drivers/scsi/scsi_lib.c:2287:12: note: Calling 'scsi_execute_req'
                   result =3D scsi_execute_req(sdev, cmd, DMA_NONE, NULL, 0=
, sshdr,
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   include/scsi/scsi_device.h:469:9: note: Null is equal to null
           return scsi_execute(sdev, cmd, data_direction, buffer,
                  ^
   include/scsi/scsi_device.h:458:15: note: expanded from macro 'scsi_execu=
te'
           BUILD_BUG_ON((sense) !=3D NULL &&                               =
  \
           ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:19: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   include/linux/compiler_types.h:346:22: note: expanded from macro 'compil=
etime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   include/linux/compiler_types.h:334:23: note: expanded from macro '_compi=
letime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:326:9: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   include/scsi/scsi_device.h:469:9: note: Left side of '&&' is false
           return scsi_execute(sdev, cmd, data_direction, buffer,
                  ^
   include/scsi/scsi_device.h:458:31: note: expanded from macro 'scsi_execu=
te'
           BUILD_BUG_ON((sense) !=3D NULL &&                               =
  \
                                        ^
   include/scsi/scsi_device.h:469:9: note: Taking false branch
           return scsi_execute(sdev, cmd, data_direction, buffer,
                  ^
   include/scsi/scsi_device.h:458:2: note: expanded from macro 'scsi_execut=
e'
           BUILD_BUG_ON((sense) !=3D NULL &&                               =
  \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
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
   include/scsi/scsi_device.h:469:9: note: Loop condition is false.  Exitin=
g loop
           return scsi_execute(sdev, cmd, data_direction, buffer,
                  ^
   include/scsi/scsi_device.h:458:2: note: expanded from macro 'scsi_execut=
e'
           BUILD_BUG_ON((sense) !=3D NULL &&                               =
  \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
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
   include/scsi/scsi_device.h:469:9: note: Calling '__scsi_execute'
           return scsi_execute(sdev, cmd, data_direction, buffer,
                  ^
   include/scsi/scsi_device.h:460:2: note: expanded from macro 'scsi_execut=
e'
           __scsi_execute(sdev, cmd, data_direction, buffer, bufflen,      \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_lib.c:220:4: note: 'data_direction' is not equal to DM=
A_TO_DEVICE
                           data_direction =3D=3D DMA_TO_DEVICE ?
                           ^~~~~~~~~~~~~~
   drivers/scsi/scsi_lib.c:220:4: note: '?' condition is false
   drivers/scsi/scsi_lib.c:222:4: note: '?' condition is false
                           rq_flags & RQF_PM ? BLK_MQ_REQ_PM : 0);
                           ^
   drivers/scsi/scsi_lib.c:219:8: note: Calling 'scsi_alloc_request'
           req =3D scsi_alloc_request(sdev->request_queue,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_lib.c:1145:2: note: Taking true branch
           if (!IS_ERR(rq))
           ^
   drivers/scsi/scsi_lib.c:1146:3: note: Calling 'scsi_initialize_rq'
                   scsi_initialize_rq(rq);
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_lib.c:1129:2: note: Null pointer passed as 1st argumen=
t to memory set function
           memset(req->__cmd, 0, sizeof(req->__cmd));
           ^      ~~~~~~~~~~
   include/scsi/scsi_common.h:66:31: warning: The left operand of '&' is a =
garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
--
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
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
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
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
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
   drivers/hwmon/adm9240.c:143:2: warning: Value stored to 'old' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           old =3D (reg >> shift) & 3;
           ^     ~~~~~~~~~~~~~~~~~~
   drivers/hwmon/adm9240.c:143:2: note: Value stored to 'old' is never read
           old =3D (reg >> shift) & 3;
           ^     ~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
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
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
>> drivers/hwmon/applesmc.c:415:7: warning: Null pointer passed as 1st argu=
ment to string comparison function [clang-analyzer-unix.cstring.NullArg]
                   if (strcmp(entry->key, key) < 0)
                       ^
   drivers/hwmon/applesmc.c:1313:6: note: Assuming the condition is false
           if (!dmi_check_system(applesmc_whitelist)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:1313:2: note: Taking false branch
           if (!dmi_check_system(applesmc_whitelist)) {
           ^
   drivers/hwmon/applesmc.c:1319:6: note: Assuming the condition is false
           if (!request_region(APPLESMC_DATA_PORT, APPLESMC_NR_PORTS,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:1319:2: note: Taking false branch
           if (!request_region(APPLESMC_DATA_PORT, APPLESMC_NR_PORTS,
           ^
   drivers/hwmon/applesmc.c:1326:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/hwmon/applesmc.c:1326:2: note: Taking false branch
           if (ret)
           ^
   drivers/hwmon/applesmc.c:1331:2: note: Taking false branch
           if (IS_ERR(pdev)) {
           ^
   drivers/hwmon/applesmc.c:1337:8: note: Calling 'applesmc_init_smcreg'
           ret =3D applesmc_init_smcreg();
                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:656:2: note: Loop condition is true.  Entering =
loop body
           for (ms =3D 0; ms < INIT_TIMEOUT_MSECS; ms +=3D INIT_WAIT_MSECS)=
 {
           ^
   drivers/hwmon/applesmc.c:657:9: note: Calling 'applesmc_init_smcreg_try'
                   ret =3D applesmc_init_smcreg_try();
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:573:6: note: Assuming field 'init_complete' is =
false
           if (s->init_complete)
               ^~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:573:2: note: Taking false branch
           if (s->init_complete)
           ^
   drivers/hwmon/applesmc.c:577:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/hwmon/applesmc.c:577:2: note: Taking false branch
           if (ret)
           ^
   drivers/hwmon/applesmc.c:580:6: note: Assuming field 'cache' is null
           if (s->cache && s->key_count !=3D count) {
               ^~~~~~~~
   drivers/hwmon/applesmc.c:580:15: note: Left side of '&&' is false
           if (s->cache && s->key_count !=3D count) {
                        ^
   drivers/hwmon/applesmc.c:588:10: note: Field 'cache' is null
           if (!s->cache)
                   ^
   drivers/hwmon/applesmc.c:588:2: note: Taking true branch
           if (!s->cache)
           ^
   drivers/hwmon/applesmc.c:590:6: note: Assuming field 'cache' is non-null
           if (!s->cache)
               ^~~~~~~~~
   drivers/hwmon/applesmc.c:590:2: note: Taking false branch
           if (!s->cache)
           ^
   drivers/hwmon/applesmc.c:594:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/hwmon/applesmc.c:594:2: note: Taking false branch
           if (ret)
           ^
   drivers/hwmon/applesmc.c:597:6: note: Assuming field 'fan_count' is <=3D=
 10
           if (s->fan_count > 10)
               ^~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:597:2: note: Taking false branch
           if (s->fan_count > 10)
           ^
   drivers/hwmon/applesmc.c:600:8: note: Calling 'applesmc_get_lower_bound'
           ret =3D applesmc_get_lower_bound(&s->temp_begin, "T");
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:408:9: note: Assuming 'begin' is not equal to '=
end'
           while (begin !=3D end) {
                  ^~~~~~~~~~~~
   drivers/hwmon/applesmc.c:408:2: note: Loop condition is true.  Entering =
loop body
           while (begin !=3D end) {
           ^
   drivers/hwmon/applesmc.c:411:3: note: Taking false branch
                   if (IS_ERR(entry)) {
                   ^
   drivers/hwmon/applesmc.c:415:7: note: Null pointer passed as 1st argumen=
t to string comparison function
                   if (strcmp(entry->key, key) < 0)
                       ^      ~~~~~~~~~~
>> drivers/hwmon/applesmc.c:437:7: warning: Null pointer passed as 2nd argu=
ment to string comparison function [clang-analyzer-unix.cstring.NullArg]
                   if (strcmp(key, entry->key) < 0)
                       ^
   drivers/hwmon/applesmc.c:989:8: note: Calling 'applesmc_read_key'
           ret =3D applesmc_read_key(KEY_COUNT_KEY, buffer, 4);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:468:10: note: Calling 'applesmc_get_entry_by_ke=
y'
           entry =3D applesmc_get_entry_by_key(key);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:453:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/hwmon/applesmc.c:453:2: note: Taking false branch
           if (ret)
           ^
   drivers/hwmon/applesmc.c:455:8: note: Calling 'applesmc_get_upper_bound'
           ret =3D applesmc_get_upper_bound(&end, key);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:430:9: note: Assuming 'begin' is not equal to '=
end'
           while (begin !=3D end) {
                  ^~~~~~~~~~~~
   drivers/hwmon/applesmc.c:430:2: note: Loop condition is true.  Entering =
loop body
           while (begin !=3D end) {
           ^
   drivers/hwmon/applesmc.c:433:3: note: Taking false branch
                   if (IS_ERR(entry)) {
                   ^
   drivers/hwmon/applesmc.c:437:7: note: Null pointer passed as 2nd argumen=
t to string comparison function
                   if (strcmp(key, entry->key) < 0)
                       ^           ~~~~~~~~~~
   drivers/hwmon/applesmc.c:510:27: warning: The left operand of '<<' is a =
garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           *value =3D ((s16)buffer[0] << 8) | buffer[1];
                                    ^
   drivers/hwmon/applesmc.c:959:2: note: Calling 'applesmc_calibrate'
           applesmc_calibrate();
           ^~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:719:2: note: Calling 'applesmc_read_s16'
           applesmc_read_s16(MOTION_SENSOR_X_KEY, &rest_x);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:506:8: note: Calling 'applesmc_read_key'
           ret =3D applesmc_read_key(key, buffer, 2);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:469:6: note: Calling 'IS_ERR'
           if (IS_ERR(entry))
               ^~~~~~~~~~~~~
   include/linux/err.h:89:9: note: Assuming '_l' is not equal to 0, which p=
articipates in a condition later
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:3: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
                   ^~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:89:9: note: Left side of '&&' is true
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:3: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
                   ^
   include/linux/err.h:89:9: note: Assuming the condition is true
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:14: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/hwmon/applesmc.c:469:6: note: Returning from 'IS_ERR'
           if (IS_ERR(entry))
               ^~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:469:2: note: Taking true branch
           if (IS_ERR(entry))
           ^
   drivers/hwmon/applesmc.c:470:3: note: Returning without writing to '*buf=
fer'
                   return PTR_ERR(entry);
                   ^
   drivers/hwmon/applesmc.c:470:3: note: Returning value, which participate=
s in a condition later
                   return PTR_ERR(entry);
                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:506:8: note: Returning from 'applesmc_read_key'
           ret =3D applesmc_read_key(key, buffer, 2);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:507:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/hwmon/applesmc.c:507:2: note: Taking false branch
           if (ret)
           ^
   drivers/hwmon/applesmc.c:510:27: note: The left operand of '<<' is a gar=
bage value
           *value =3D ((s16)buffer[0] << 8) | buffer[1];
                          ~~~~~~~~~ ^
   drivers/hwmon/applesmc.c:527:16: warning: The left operand of '!=3D' is =
a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                                   (buffer[0] !=3D 0x00 || buffer[1] !=3D 0=
x00))
                                              ^
   drivers/hwmon/applesmc.c:696:2: note: Calling 'applesmc_device_init'
           applesmc_device_init();
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:522:6: note: Assuming field 'has_accelerometer'=
 is true
           if (!smcreg.has_accelerometer)
--
               ^~~~~~~~~~~~
   net/wireless/nl80211.c:948:2: note: Taking true branch
           if (!cb->args[0]) {
           ^
   net/wireless/nl80211.c:951:8: note: 'attrbuf' is non-null, which partici=
pates in a condition later
                   if (!attrbuf) {
                        ^~~~~~~
   net/wireless/nl80211.c:951:3: note: Taking false branch
                   if (!attrbuf) {
                   ^
   net/wireless/nl80211.c:959:9: note: Calling 'nlmsg_parse_deprecated'
                   err =3D nlmsg_parse_deprecated(cb->nlh,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:772:9: note: Calling '__nlmsg_parse'
           return __nlmsg_parse(nlh, hdrlen, tb, maxtype, policy,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:728:6: note: Assuming the condition is false
           if (nlh->nlmsg_len < nlmsg_msg_size(hdrlen)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:728:2: note: Taking false branch
           if (nlh->nlmsg_len < nlmsg_msg_size(hdrlen)) {
           ^
   include/net/netlink.h:733:2: note: Returning value, which participates i=
n a condition later
           return __nla_parse(tb, maxtype, nlmsg_attrdata(nlh, hdrlen),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:772:9: note: Returning from '__nlmsg_parse'
           return __nlmsg_parse(nlh, hdrlen, tb, maxtype, policy,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:772:2: note: Returning value, which participates i=
n a condition later
           return __nlmsg_parse(nlh, hdrlen, tb, maxtype, policy,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:959:9: note: Returning from 'nlmsg_parse_deprecat=
ed'
                   err =3D nlmsg_parse_deprecated(cb->nlh,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:963:7: note: Assuming 'err' is 0
                   if (err) {
                       ^~~
   net/wireless/nl80211.c:963:3: note: Taking false branch
                   if (err) {
                   ^
   net/wireless/nl80211.c:972:7: note: Calling 'IS_ERR'
                   if (IS_ERR(*wdev)) {
                       ^~~~~~~~~~~~~
   include/linux/err.h:89:9: note: Assuming '_l' is not equal to 0, which p=
articipates in a condition later
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:3: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
                   ^~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:89:9: note: Left side of '&&' is true
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:3: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
                   ^
   include/linux/err.h:89:9: note: Assuming the condition is true
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:14: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/wireless/nl80211.c:972:7: note: Returning from 'IS_ERR'
                   if (IS_ERR(*wdev)) {
                       ^~~~~~~~~~~~~
   net/wireless/nl80211.c:972:3: note: Taking true branch
                   if (IS_ERR(*wdev)) {
                   ^
   net/wireless/nl80211.c:974:4: note: Returning without writing to '*rdev'
                           return PTR_ERR(*wdev);
                           ^
   net/wireless/nl80211.c:974:4: note: Returning value, which participates =
in a condition later
                           return PTR_ERR(*wdev);
                           ^~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:9890:8: note: Returning from 'nl80211_prepare_wde=
v_dump'
           res =3D nl80211_prepare_wdev_dump(cb, &rdev, &wdev, attrbuf);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:9891:6: note: Assuming 'res' is 0
           if (res) {
               ^~~
   net/wireless/nl80211.c:9891:2: note: Taking false branch
           if (res) {
           ^
   net/wireless/nl80211.c:9901:6: note: Assuming field 'netdev' is null
           if (!wdev->netdev) {
               ^~~~~~~~~~~~~
   net/wireless/nl80211.c:9901:2: note: Taking true branch
           if (!wdev->netdev) {
           ^
   net/wireless/nl80211.c:9903:3: note: Control jumps to line 9937
                   goto out_err;
                   ^
   net/wireless/nl80211.c:9938:2: note: 1st function call argument is an un=
initialized value
           wiphy_unlock(&rdev->wiphy);
           ^            ~~~~~~~~~~~~
>> net/wireless/nl80211.c:14150:18: warning: Dereference of null pointer [c=
lang-analyzer-core.NullDereference]
           for (i =3D 0; i < (*rdev)->wiphy.n_vendor_commands; i++) {
                           ^
   net/wireless/nl80211.c:14212:8: note: Calling 'nl80211_prepare_vendor_du=
mp'
           err =3D nl80211_prepare_vendor_dump(skb, cb, &rdev, &wdev);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:14097:6: note: Assuming the condition is false
           if (cb->args[0]) {
               ^~~~~~~~~~~
   net/wireless/nl80211.c:14097:2: note: Taking false branch
           if (cb->args[0]) {
           ^
   net/wireless/nl80211.c:14120:12: note: Calling 'kcalloc'
           attrbuf =3D kcalloc(NUM_NL80211_ATTR, sizeof(*attrbuf), GFP_KERN=
EL);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:652:9: note: Calling 'kmalloc_array'
           return kmalloc_array(n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:617:2: note: Taking false branch
           if (unlikely(check_mul_overflow(n, size, &bytes)))
           ^
   include/linux/slab.h:619:30: note: Left side of '&&' is false
           if (__builtin_constant_p(n) && __builtin_constant_p(size))
                                       ^
   include/linux/slab.h:621:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(bytes, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:652:9: note: Returning from 'kmalloc_array'
           return kmalloc_array(n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:652:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc_array(n, size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:14120:12: note: Returning from 'kcalloc'
           attrbuf =3D kcalloc(NUM_NL80211_ATTR, sizeof(*attrbuf), GFP_KERN=
EL);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:14121:6: note: Assuming 'attrbuf' is non-null
           if (!attrbuf)
               ^~~~~~~~
   net/wireless/nl80211.c:14121:2: note: Taking false branch
           if (!attrbuf)
           ^
   net/wireless/nl80211.c:14124:8: note: Calling 'nlmsg_parse_deprecated'
           err =3D nlmsg_parse_deprecated(cb->nlh,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:772:9: note: Calling '__nlmsg_parse'
           return __nlmsg_parse(nlh, hdrlen, tb, maxtype, policy,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:728:6: note: Assuming the condition is false
           if (nlh->nlmsg_len < nlmsg_msg_size(hdrlen)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:728:2: note: Taking false branch
           if (nlh->nlmsg_len < nlmsg_msg_size(hdrlen)) {
           ^
   include/net/netlink.h:733:9: note: Assigning value, which participates i=
n a condition later
           return __nla_parse(tb, maxtype, nlmsg_attrdata(nlh, hdrlen),
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:733:2: note: Returning value, which participates i=
n a condition later
           return __nla_parse(tb, maxtype, nlmsg_attrdata(nlh, hdrlen),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:772:9: note: Returning from '__nlmsg_parse'
           return __nlmsg_parse(nlh, hdrlen, tb, maxtype, policy,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:772:2: note: Returning value, which participates i=
n a condition later
           return __nlmsg_parse(nlh, hdrlen, tb, maxtype, policy,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:14124:8: note: Returning from 'nlmsg_parse_deprec=
ated'
           err =3D nlmsg_parse_deprecated(cb->nlh,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:14128:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   net/wireless/nl80211.c:14128:2: note: Taking false branch
           if (err)
           ^
   net/wireless/nl80211.c:14131:6: note: Assuming the condition is false
           if (!attrbuf[NL80211_ATTR_VENDOR_ID] ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:14131:6: note: Left side of '||' is false
   net/wireless/nl80211.c:14132:6: note: Assuming the condition is false
               !attrbuf[NL80211_ATTR_VENDOR_SUBCMD]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:14131:2: note: Taking false branch
           if (!attrbuf[NL80211_ATTR_VENDOR_ID] ||
           ^
   net/wireless/nl80211.c:14138:2: note: Taking false branch
           if (IS_ERR(*wdev))
           ^
   net/wireless/nl80211.c:14141:2: note: Value assigned to 'rdev'
           *rdev =3D __cfg80211_rdev_from_attrs(sock_net(skb->sk), attrbuf);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:14142:6: note: Calling 'IS_ERR'
           if (IS_ERR(*rdev)) {
               ^~~~~~~~~~~~~
   include/linux/err.h:89:9: note: Assuming '_l' is equal to 0
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:3: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
                   ^~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'

vim +1499 block/sed-opal.c

5e4c7cf60ec3cad Revanth Rajashekar 2019-06-27  1494  =

eed64951f15d63b Jon Derrick        2017-02-22  1495  static int start_auth_=
opal_session(struct opal_dev *dev, void *data)
455a7b238cd6bc6 Scott Bauer        2017-02-03  1496  {
eed64951f15d63b Jon Derrick        2017-02-22  1497  	struct opal_session_i=
nfo *session =3D data;
455a7b238cd6bc6 Scott Bauer        2017-02-03  1498  	u8 lk_ul_user[OPAL_UI=
D_LENGTH];
eed64951f15d63b Jon Derrick        2017-02-22 @1499  	size_t keylen =3D ses=
sion->opal_key.key_len;
455a7b238cd6bc6 Scott Bauer        2017-02-03  1500  	int err =3D 0;
455a7b238cd6bc6 Scott Bauer        2017-02-03  1501  =

455a7b238cd6bc6 Scott Bauer        2017-02-03  1502  	u8 *key =3D session->=
opal_key.key;
455a7b238cd6bc6 Scott Bauer        2017-02-03  1503  	u32 hsn =3D GENERIC_H=
OST_SESSION_NUM;
455a7b238cd6bc6 Scott Bauer        2017-02-03  1504  =

e8b2922459cf151 David Kozub        2019-02-14  1505  	if (session->sum)
455a7b238cd6bc6 Scott Bauer        2017-02-03  1506  		err =3D build_lockin=
g_user(lk_ul_user, sizeof(lk_ul_user),
455a7b238cd6bc6 Scott Bauer        2017-02-03  1507  					 session->opal_ke=
y.lr);
e8b2922459cf151 David Kozub        2019-02-14  1508  	else if (session->who=
 !=3D OPAL_ADMIN1 && !session->sum)
455a7b238cd6bc6 Scott Bauer        2017-02-03  1509  		err =3D build_lockin=
g_user(lk_ul_user, sizeof(lk_ul_user),
455a7b238cd6bc6 Scott Bauer        2017-02-03  1510  					 session->who - 1=
);
e8b2922459cf151 David Kozub        2019-02-14  1511  	else
e8b2922459cf151 David Kozub        2019-02-14  1512  		memcpy(lk_ul_user, o=
paluid[OPAL_ADMIN1_UID], OPAL_UID_LENGTH);
e8b2922459cf151 David Kozub        2019-02-14  1513  =

455a7b238cd6bc6 Scott Bauer        2017-02-03  1514  	if (err)
455a7b238cd6bc6 Scott Bauer        2017-02-03  1515  		return err;
455a7b238cd6bc6 Scott Bauer        2017-02-03  1516  =

e8b2922459cf151 David Kozub        2019-02-14  1517  	err =3D cmd_start(dev=
, opaluid[OPAL_SMUID_UID],
e8b2922459cf151 David Kozub        2019-02-14  1518  			opalmethod[OPAL_STA=
RTSESSION]);
455a7b238cd6bc6 Scott Bauer        2017-02-03  1519  =

455a7b238cd6bc6 Scott Bauer        2017-02-03  1520  	add_token_u64(&err, d=
ev, hsn);
455a7b238cd6bc6 Scott Bauer        2017-02-03  1521  	add_token_bytestring(=
&err, dev, opaluid[OPAL_LOCKINGSP_UID],
455a7b238cd6bc6 Scott Bauer        2017-02-03  1522  			     OPAL_UID_LENGT=
H);
455a7b238cd6bc6 Scott Bauer        2017-02-03  1523  	add_token_u8(&err, de=
v, 1);
455a7b238cd6bc6 Scott Bauer        2017-02-03  1524  	add_token_u8(&err, de=
v, OPAL_STARTNAME);
455a7b238cd6bc6 Scott Bauer        2017-02-03  1525  	add_token_u8(&err, de=
v, 0);
455a7b238cd6bc6 Scott Bauer        2017-02-03  1526  	add_token_bytestring(=
&err, dev, key, keylen);
455a7b238cd6bc6 Scott Bauer        2017-02-03  1527  	add_token_u8(&err, de=
v, OPAL_ENDNAME);
455a7b238cd6bc6 Scott Bauer        2017-02-03  1528  	add_token_u8(&err, de=
v, OPAL_STARTNAME);
455a7b238cd6bc6 Scott Bauer        2017-02-03  1529  	add_token_u8(&err, de=
v, 3);
455a7b238cd6bc6 Scott Bauer        2017-02-03  1530  	add_token_bytestring(=
&err, dev, lk_ul_user, OPAL_UID_LENGTH);
455a7b238cd6bc6 Scott Bauer        2017-02-03  1531  	add_token_u8(&err, de=
v, OPAL_ENDNAME);
455a7b238cd6bc6 Scott Bauer        2017-02-03  1532  =

455a7b238cd6bc6 Scott Bauer        2017-02-03  1533  	if (err) {
591c59d18f72c98 Scott Bauer        2017-04-07  1534  		pr_debug("Error buil=
ding STARTSESSION command.\n");
455a7b238cd6bc6 Scott Bauer        2017-02-03  1535  		return err;
455a7b238cd6bc6 Scott Bauer        2017-02-03  1536  	}
455a7b238cd6bc6 Scott Bauer        2017-02-03  1537  =

455a7b238cd6bc6 Scott Bauer        2017-02-03  1538  	return finalize_and_s=
end(dev, start_opal_session_cont);
455a7b238cd6bc6 Scott Bauer        2017-02-03  1539  }
455a7b238cd6bc6 Scott Bauer        2017-02-03  1540  =


:::::: The code at line 1499 was first introduced by commit
:::::: eed64951f15d63beac75e0f848ac03c14f8a4a6c block/sed: Embed function d=
ata into the function sequence

:::::: TO: Jon Derrick <jonathan.derrick@intel.com>
:::::: CC: Jens Axboe <axboe@fb.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3961386570131850410==--

