Content-Type: multipart/mixed; boundary="===============3237227910097625614=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/bluetooth/hci_sync.c:1635:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Sat, 03 Sep 2022 23:34:52 +0800
Message-ID: <202209032319.MUlTdxFy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3237227910097625614==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: net/bluet=
ooth/hci_sync.c:1635:2: warning: Undefined or garbage value returned to cal=
ler [clang-analyzer-core.uninitialized.UndefReturn]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
CC: Marcel Holtmann <marcel@holtmann.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d895ec7938c431fe61a731939da76a6461bc6133
commit: ad383c2c65a5baf16e334cd40a013cc302176891 Bluetooth: hci_sync: Enabl=
e advertising when LL privacy is enabled
date:   10 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220901 (https://download.01.org/0day-ci/archi=
ve/20220903/202209032319.MUlTdxFy-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41=
d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dad383c2c65a5baf16e334cd40a013cc302176891
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ad383c2c65a5baf16e334cd40a013cc302176891
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
                   ^
   fs/gfs2/super.c:371:10: note: Loop condition is false.  Exiting loop
                   lfcc =3D list_first_entry(&list, struct lfcc, list);
                          ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
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
   fs/gfs2/super.c:374:3: note: Memory is released
                   kfree(lfcc);
                   ^~~~~~~~~~~
   fs/gfs2/super.c:370:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(&list)) {
           ^
   fs/gfs2/super.c:371:10: note: Left side of '&&' is false
                   lfcc =3D list_first_entry(&list, struct lfcc, list);
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
   fs/gfs2/super.c:371:10: note: Taking false branch
                   lfcc =3D list_first_entry(&list, struct lfcc, list);
                          ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
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
   fs/gfs2/super.c:371:10: note: Loop condition is false.  Exiting loop
                   lfcc =3D list_first_entry(&list, struct lfcc, list);
                          ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
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
   fs/gfs2/super.c:372:3: note: Calling 'list_del'
                   list_del(&lfcc->list);
                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:146:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:132:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:135:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> net/bluetooth/hci_sync.c:1635:2: warning: Undefined or garbage value ret=
urned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return err;
           ^
   net/bluetooth/hci_sync.c:2027:9: note: Calling 'hci_update_passive_scan_=
sync'
           return hci_update_passive_scan_sync(hdev);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/hci_sync.c:1960:6: note: Assuming the condition is false
           if (!test_bit(HCI_UP, &hdev->flags) ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/hci_sync.c:1960:6: note: Left side of '||' is false
   net/bluetooth/hci_sync.c:1961:6: note: Assuming the condition is false
               test_bit(HCI_INIT, &hdev->flags) ||
               ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   net/bluetooth/hci_sync.c:1960:6: note: Left side of '||' is false
           if (!test_bit(HCI_UP, &hdev->flags) ||
               ^
   net/bluetooth/hci_sync.c:1962:6: note: Assuming the condition is false
               hci_dev_test_flag(hdev, HCI_SETUP) ||
               ^
   include/net/bluetooth/hci_core.h:774:48: note: expanded from macro 'hci_=
dev_test_flag'
   #define hci_dev_test_flag(hdev, nr)            test_bit((nr), (hdev)->de=
v_flags)
                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   net/bluetooth/hci_sync.c:1960:6: note: Left side of '||' is false
           if (!test_bit(HCI_UP, &hdev->flags) ||
               ^
   net/bluetooth/hci_sync.c:1963:6: note: Assuming the condition is false
               hci_dev_test_flag(hdev, HCI_CONFIG) ||
               ^
   include/net/bluetooth/hci_core.h:774:48: note: expanded from macro 'hci_=
dev_test_flag'
   #define hci_dev_test_flag(hdev, nr)            test_bit((nr), (hdev)->de=
v_flags)
                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   net/bluetooth/hci_sync.c:1960:6: note: Left side of '||' is false
           if (!test_bit(HCI_UP, &hdev->flags) ||
               ^
   net/bluetooth/hci_sync.c:1964:6: note: Assuming the condition is false
               hci_dev_test_flag(hdev, HCI_AUTO_OFF) ||
               ^
   include/net/bluetooth/hci_core.h:774:48: note: expanded from macro 'hci_=
dev_test_flag'
   #define hci_dev_test_flag(hdev, nr)            test_bit((nr), (hdev)->de=
v_flags)
                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   net/bluetooth/hci_sync.c:1960:6: note: Left side of '||' is false
           if (!test_bit(HCI_UP, &hdev->flags) ||
               ^
   net/bluetooth/hci_sync.c:1965:6: note: Assuming the condition is false
               hci_dev_test_flag(hdev, HCI_UNREGISTER))
               ^
   include/net/bluetooth/hci_core.h:774:48: note: expanded from macro 'hci_=
dev_test_flag'
   #define hci_dev_test_flag(hdev, nr)            test_bit((nr), (hdev)->de=
v_flags)
                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   net/bluetooth/hci_sync.c:1960:2: note: Taking false branch
           if (!test_bit(HCI_UP, &hdev->flags) ||
           ^
   net/bluetooth/hci_sync.c:1969:6: note: Assuming the condition is false
           if (!hci_dev_test_flag(hdev, HCI_LE_ENABLED))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/hci_sync.c:1969:2: note: Taking false branch
           if (!hci_dev_test_flag(hdev, HCI_LE_ENABLED))
           ^
   net/bluetooth/hci_sync.c:1973:6: note: Assuming field 'state' is equal t=
o DISCOVERY_STOPPED
           if (hdev->discovery.state !=3D DISCOVERY_STOPPED)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/hci_sync.c:1973:2: note: Taking false branch
           if (hdev->discovery.state !=3D DISCOVERY_STOPPED)
           ^
   net/bluetooth/hci_sync.c:1983:2: note: Calling 'hci_discovery_filter_cle=
ar'
           hci_discovery_filter_clear(hdev);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/bluetooth/hci_core.h:832:1: note: Returning without writing =
to 'hdev->advertising_paused', which participates in a condition later
   }
   ^
   net/bluetooth/hci_sync.c:1983:2: note: Returning from 'hci_discovery_fil=
ter_clear'
           hci_discovery_filter_clear(hdev);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/hci_sync.c:1985:2: note: Taking false branch
           bt_dev_dbg(hdev, "ADV monitoring is %s",
           ^
   include/net/bluetooth/bluetooth.h:214:2: note: expanded from macro 'bt_d=
ev_dbg'
           BT_DBG("%s: " fmt, (hdev)->name, ##__VA_ARGS__)
           ^
   include/net/bluetooth/bluetooth.h:204:26: note: expanded from macro 'BT_=
DBG'
   #define BT_DBG(fmt, ...)        pr_debug(fmt "\n", ##__VA_ARGS__)
                                   ^
   include/linux/printk.h:570:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:162:2: note: expanded from macro 'dynamic_=
pr_debug'
--
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
   net/bluetooth/hci_sync.c:1614:3: note: Loop condition is false.  Exiting=
 loop
                   list_for_each_entry_safe(adv, tmp, &hdev->adv_instances,=
 list) {
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
   net/bluetooth/hci_sync.c:1614:3: note: Left side of '&&' is false
                   list_for_each_entry_safe(adv, tmp, &hdev->adv_instances,=
 list) {
                   ^
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   net/bluetooth/hci_sync.c:1614:3: note: Taking false branch
                   list_for_each_entry_safe(adv, tmp, &hdev->adv_instances,=
 list) {
                   ^
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
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
   net/bluetooth/hci_sync.c:1614:3: note: Loop condition is false.  Exiting=
 loop
                   list_for_each_entry_safe(adv, tmp, &hdev->adv_instances,=
 list) {
                   ^
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
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
   net/bluetooth/hci_sync.c:1614:3: note: Loop condition is false. Executio=
n continues on line 1633
                   list_for_each_entry_safe(adv, tmp, &hdev->adv_instances,=
 list) {
                   ^
   include/linux/list.h:715:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   net/bluetooth/hci_sync.c:1635:2: note: Undefined or garbage value return=
ed to caller
           return err;
           ^      ~~~
>> net/bluetooth/hci_sync.c:1744:3: warning: Value stored to 'err' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   err =3D -EINVAL;
                   ^     ~~~~~~~
   net/bluetooth/hci_sync.c:1744:3: note: Value stored to 'err' is never re=
ad
                   err =3D -EINVAL;
                   ^     ~~~~~~~
   Suppressed 4 warnings (2 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/gpu/drm/bridge/tc358768.c:217:13: warning: The left operand of '=
&' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           tmp =3D orig & ~mask;
                      ^
   drivers/gpu/drm/bridge/tc358768.c:850:6: note: Assuming field 'enabled' =
is not equal to 0
           if (!priv->enabled) {
               ^~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358768.c:850:2: note: Taking false branch
           if (!priv->enabled) {
           ^
   drivers/gpu/drm/bridge/tc358768.c:856:2: note: Calling 'tc358768_update_=
bits'
           tc358768_update_bits(priv, TC358768_PP_MISC, 0x3 << 14, 0);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358768.c:214:11: note: 'orig' declared without =
an initial value
           u32 tmp, orig;
                    ^~~~
   drivers/gpu/drm/bridge/tc358768.c:216:2: note: Calling 'tc358768_read'
           tc358768_read(priv, reg, &orig);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358768.c:199:6: note: Assuming field 'error' is=
 not equal to 0
           if (priv->error)
               ^~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358768.c:199:2: note: Taking true branch
           if (priv->error)
           ^
   drivers/gpu/drm/bridge/tc358768.c:200:3: note: Returning without writing=
 to '*val'
                   return;
                   ^
   drivers/gpu/drm/bridge/tc358768.c:216:2: note: Returning from 'tc358768_=
read'
           tc358768_read(priv, reg, &orig);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358768.c:217:13: note: The left operand of '&' =
is a garbage value
           tmp =3D orig & ~mask;
                 ~~~~ ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   lib/842/842_compress.c:534:4: warning: Value stored to 'ret' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                           ret =3D add_repeat_template(p, repeat_count);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/842/842_compress.c:534:4: note: Value stored to 'ret' is never read
                           ret =3D add_repeat_template(p, repeat_count);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/dma-buf/dma-resv.c:485:26: warning: Array access (from variable =
'shared') results in a null pointer dereference [clang-analyzer-core.NullDe=
reference]
                   shared[shared_count++] =3D fence_excl;
                   ~~~~~~                 ^
   drivers/dma-buf/dma-resv.c:415:2: note: 'shared' initialized to a null p=
ointer value
           struct dma_fence **shared =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-resv.c:428:9: note: Loop condition is false. Executi=
on continues on line 428
                   seq =3D read_seqcount_begin(&obj->seq);
                         ^
   include/linux/seqlock.h:363:2: note: expanded from macro 'read_seqcount_=
begin'
           raw_read_seqcount_begin(s);                                     \
           ^
   include/linux/seqlock.h:348:18: note: expanded from macro 'raw_read_seqc=
ount_begin'
           unsigned _seq =3D __read_seqcount_begin(s);                     =
  \
                           ^
   include/linux/seqlock.h:333:2: note: expanded from macro '__read_seqcoun=
t_begin'
           while ((__seq =3D seqprop_sequence(s)) & 1)                     =
  \
           ^
   drivers/dma-buf/dma-resv.c:431:7: note: Assuming 'fence_excl' is non-null
                   if (fence_excl && !dma_fence_get_rcu(fence_excl))
                       ^~~~~~~~~~
   drivers/dma-buf/dma-resv.c:431:7: note: Left side of '&&' is true
   drivers/dma-buf/dma-resv.c:431:3: note: Taking false branch
                   if (fence_excl && !dma_fence_get_rcu(fence_excl))
                   ^
   drivers/dma-buf/dma-resv.c:435:7: note: Assuming 'fobj' is non-null
                   if (fobj)
                       ^~~~
   drivers/dma-buf/dma-resv.c:435:3: note: Taking true branch
                   if (fobj)
                   ^

vim +1635 net/bluetooth/hci_sync.c

ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1599  =

ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1600  /* This function di=
sables all user advertising instances (excluding 0x00) */
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1601  static int hci_resu=
me_advertising_sync(struct hci_dev *hdev)
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1602  {
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1603  	struct adv_info *a=
dv, *tmp;
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1604  	int err;
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1605  =

ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1606  	/* If advertising =
has not been paused there is nothing  to do. */
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1607  	if (!hdev->adverti=
sing_paused)
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1608  		return 0;
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1609  =

ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1610  	bt_dev_dbg(hdev, "=
Resuming advertising instances");
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1611  =

ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1612  	if (ext_adv_capabl=
e(hdev)) {
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1613  		/* Call for each =
tracked instance to be re-enabled */
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1614  		list_for_each_ent=
ry_safe(adv, tmp, &hdev->adv_instances, list) {
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1615  			err =3D hci_enab=
le_ext_advertising_sync(hdev,
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1616  							      adv->i=
nstance);
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1617  			if (!err)
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1618  				continue;
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1619  =

ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1620  			/* If the instan=
ce cannot be resumed remove it */
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1621  			hci_remove_ext_a=
dv_instance_sync(hdev, adv->instance,
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1622  							 NULL);
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1623  		}
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1624  	} else {
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1625  		/* Schedule for m=
ost recent instance to be restarted and begin
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1626  		 * the software r=
otation loop
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1627  		 */
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1628  		err =3D hci_sched=
ule_adv_instance_sync(hdev,
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1629  						     hdev->cu=
r_adv_instance,
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1630  						     true);
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1631  	}
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1632  =

ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1633  	hdev->advertising_=
paused =3D false;
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1634  =

ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27 @1635  	return err;
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1636  }
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1637  =

ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1638  /* Device must not =
be scanning when updating the accept list.
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1639   *
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1640   * Update is done u=
sing the following sequence:
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1641   *
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1642   * use_ll_privacy((=
Disable Advertising) -> Disable Resolving List) ->
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1643   * Remove Devices F=
rom Accept List ->
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1644   * (has IRK && use_=
ll_privacy(Remove Devices From Resolving List))->
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1645   * Add Devices to A=
ccept List ->
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1646   * (has IRK && use_=
ll_privacy(Remove Devices From Resolving List)) ->
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1647   * use_ll_privacy(E=
nable Resolving List -> (Enable Advertising)) ->
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1648   * Enable Scanning
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1649   *
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1650   * In case of failu=
re advertising shall be restored to its original state and
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1651   * return would dis=
able accept list since either accept or resolving list could
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1652   * not be programme=
d.
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1653   *
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1654   */
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1655  static u8 hci_updat=
e_accept_list_sync(struct hci_dev *hdev)
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1656  {
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1657  	struct hci_conn_pa=
rams *params;
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1658  	struct bdaddr_list=
 *b, *t;
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1659  	u8 num_entries =3D=
 0;
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1660  	bool pend_conn, pe=
nd_report;
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1661  	int err;
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1662  =

ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1663  	/* Pause advertisi=
ng if resolving list can be used as controllers are
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1664  	 * cannot accept r=
esolving list modifications while advertising.
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1665  	 */
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1666  	if (use_ll_privacy=
(hdev)) {
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1667  		err =3D hci_pause=
_advertising_sync(hdev);
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1668  		if (err) {
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1669  			bt_dev_err(hdev,=
 "pause advertising failed: %d", err);
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1670  			return 0x00;
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1671  		}
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1672  	}
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1673  =

ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1674  	/* Disable address=
 resolution while reprogramming accept list since
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1675  	 * devices that do=
 have an IRK will be programmed in the resolving list
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1676  	 * when LL Privacy=
 is enabled.
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1677  	 */
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1678  	err =3D hci_le_set=
_addr_resolution_enable_sync(hdev, 0x00);
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1679  	if (err) {
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1680  		bt_dev_err(hdev, =
"Unable to disable LL privacy: %d", err);
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1681  		goto done;
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1682  	}
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1683  =

e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1684  	/* Go through the =
current accept list programmed into the
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1685  	 * controller one =
by one and check if that address is still
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1686  	 * in the list of =
pending connections or list of devices to
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1687  	 * report. If not =
present in either list, then remove it from
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1688  	 * the controller.
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1689  	 */
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1690  	list_for_each_entr=
y_safe(b, t, &hdev->le_accept_list, list) {
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1691  		pend_conn =3D hci=
_pend_le_action_lookup(&hdev->pend_le_conns,
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1692  						      &b->bda=
ddr,
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1693  						      b->bdad=
dr_type);
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1694  		pend_report =3D h=
ci_pend_le_action_lookup(&hdev->pend_le_reports,
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1695  							&b->bdaddr,
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1696  							b->bdaddr_ty=
pe);
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1697  =

e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1698  		/* If the device =
is not likely to connect or report,
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1699  		 * remove it from=
 the acceptlist.
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1700  		 */
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1701  		if (!pend_conn &&=
 !pend_report) {
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1702  			hci_le_del_accep=
t_list_sync(hdev, &b->bdaddr,
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1703  						    b->bdaddr=
_type);
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1704  			continue;
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1705  		}
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1706  =

e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1707  		num_entries++;
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1708  	}
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1709  =

e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1710  	/* Since all no lo=
nger valid accept list entries have been
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1711  	 * removed, walk t=
hrough the list of pending connections
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1712  	 * and ensure that=
 any new device gets programmed into
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1713  	 * the controller.
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1714  	 *
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1715  	 * If the list of =
the devices is larger than the list of
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1716  	 * available accep=
t list entries in the controller, then
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1717  	 * just abort and =
return filer policy value to not use the
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1718  	 * accept list.
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1719  	 */
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1720  	list_for_each_entr=
y(params, &hdev->pend_le_conns, action) {
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1721  		err =3D hci_le_ad=
d_accept_list_sync(hdev, params, &num_entries);
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1722  		if (err)
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1723  			goto done;
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1724  	}
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1725  =

e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1726  	/* After adding al=
l new pending connections, walk through
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1727  	 * the list of pen=
ding reports and also add these to the
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1728  	 * accept list if =
there is still space. Abort if space runs out.
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1729  	 */
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1730  	list_for_each_entr=
y(params, &hdev->pend_le_reports, action) {
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1731  		err =3D hci_le_ad=
d_accept_list_sync(hdev, params, &num_entries);
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1732  		if (err)
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1733  			goto done;
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1734  	}
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1735  =

e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1736  	/* Use the allowli=
st unless the following conditions are all true:
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1737  	 * - We are not cu=
rrently suspending
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1738  	 * - There are 1 o=
r more ADV monitors registered and it's not offloaded
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1739  	 * - Interleaved s=
canning is not currently using the allowlist
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1740  	 */
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1741  	if (!idr_is_empty(=
&hdev->adv_monitors_idr) && !hdev->suspended &&
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1742  	    hci_get_adv_mo=
nitor_offload_ext(hdev) =3D=3D HCI_ADV_MONITOR_EXT_NONE &&
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1743  	    hdev->interlea=
ve_scan_state !=3D INTERLEAVE_SCAN_ALLOWLIST)
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27 @1744  		err =3D -EINVAL;
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1745  =

ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1746  done:
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1747  	/* Enable address =
resolution when LL Privacy is enabled. */
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1748  	err =3D hci_le_set=
_addr_resolution_enable_sync(hdev, 0x01);
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1749  	if (err)
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1750  		bt_dev_err(hdev, =
"Unable to enable LL privacy: %d", err);
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1751  =

ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1752  	/* Resume advertis=
ing if it was paused */
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1753  	if (use_ll_privacy=
(hdev))
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1754  		hci_resume_advert=
ising_sync(hdev);
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1755  =

e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1756  	/* Select filter p=
olicy to use accept list */
ad383c2c65a5ba Luiz Augusto von Dentz 2021-10-27  1757  	return err ? 0x00 =
: 0x01;
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1758  }
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  1759  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3237227910097625614==--

