Content-Type: multipart/mixed; boundary="===============0787932734255916911=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/sched/sch_ets.c:680:23: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Mon, 11 Jul 2022 10:52:59 +0800
Message-ID: <202207111005.dzzNPyUa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0787932734255916911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: net/sched=
/sch_ets.c:680:23: warning: Assigned value is garbage or undefined [clang-a=
nalyzer-core.uninitialized.Assign]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Davide Caratti <dcaratti@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   32346491ddf24599decca06190ebca03ff9de7f8
commit: cd9b50adc6bb9ad3f7d244590a389522215865c4 net/sched: ets: fix crash =
when flipping from 'strict' to 'quantum'
date:   11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220702 (https://download.01.org/0day-ci/archi=
ve/20220711/202207111005.dzzNPyUa-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f7a80c=
3d08d4821e621fc88d6a2e435291f82dff)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dcd9b50adc6bb9ad3f7d244590a389522215865c4
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout cd9b50adc6bb9ad3f7d244590a389522215865c4
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   net/bluetooth/hci_request.c:3109:25: note: Taking false branch
           struct hci_dev *hdev =3D container_of(work, struct hci_dev,
                                  ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   net/bluetooth/hci_request.c:3109:25: note: Loop condition is false.  Exi=
ting loop
           struct hci_dev *hdev =3D container_of(work, struct hci_dev,
                                  ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   net/bluetooth/hci_request.c:3112:2: note: 'status' declared without an i=
nitial value
           u8 status;
           ^~~~~~~~~
   net/bluetooth/hci_request.c:3116:2: note: Calling 'hci_req_sync'
           hci_req_sync(hdev, le_scan_restart, 0, HCI_CMD_TIMEOUT, &status);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/hci_request.c:281:6: note: Assuming the condition is false
           if (test_bit(HCI_UP, &hdev->flags))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/hci_request.c:281:2: note: Taking false branch
           if (test_bit(HCI_UP, &hdev->flags))
           ^
   net/bluetooth/hci_request.c:287:2: note: Returning without writing to '*=
hci_status'
           return ret;
           ^
   net/bluetooth/hci_request.c:3116:2: note: Returning from 'hci_req_sync'
           hci_req_sync(hdev, le_scan_restart, 0, HCI_CMD_TIMEOUT, &status);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/hci_request.c:3117:6: note: Branch condition evaluates to =
a garbage value
           if (status) {
               ^~~~~~
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   net/sched/sch_teql.c:249:4: warning: Value stored to 'err' is never read=
 [clang-analyzer-deadcode.DeadStores]
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   net/sched/sch_teql.c:249:4: note: Value stored to 'err' is never read
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   net/sched/sch_atm.c:89:25: warning: Value stored to 'p' during its initi=
alization is never read [clang-analyzer-deadcode.DeadStores]
           struct atm_qdisc_data *p =3D qdisc_priv(sch);
                                  ^   ~~~~~~~~~~~~~~~
   net/sched/sch_atm.c:89:25: note: Value stored to 'p' during its initiali=
zation is never read
           struct atm_qdisc_data *p =3D qdisc_priv(sch);
                                  ^   ~~~~~~~~~~~~~~~
   net/sched/sch_atm.c:388:2: warning: Value stored to 'result' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           result =3D TC_ACT_OK;     /* be nice to gcc */
           ^
   net/sched/sch_atm.c:388:2: note: Value stored to 'result' is never read
   net/sched/sch_atm.c:604:25: warning: Value stored to 'p' during its init=
ialization is never read [clang-analyzer-deadcode.DeadStores]
           struct atm_qdisc_data *p =3D qdisc_priv(sch);
                                  ^   ~~~~~~~~~~~~~~~
   net/sched/sch_atm.c:604:25: note: Value stored to 'p' during its initial=
ization is never read
           struct atm_qdisc_data *p =3D qdisc_priv(sch);
                                  ^   ~~~~~~~~~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
>> net/sched/sch_ets.c:680:23: warning: Assigned value is garbage or undefi=
ned [clang-analyzer-core.uninitialized.Assign]
                   q->classes[i].qdisc =3D queues[i];
                                       ^
   net/sched/sch_ets.c:701:6: note: Assuming 'opt' is non-null
           if (!opt)
               ^~~~
   net/sched/sch_ets.c:701:2: note: Taking false branch
           if (!opt)
           ^
   net/sched/sch_ets.c:704:8: note: Value assigned to field 'nbands'
           err =3D tcf_block_get(&q->block, &q->filter_list, sch, extack);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_ets.c:705:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   net/sched/sch_ets.c:705:2: note: Taking false branch
           if (err)
           ^
   net/sched/sch_ets.c:709:9: note: Calling 'ets_qdisc_change'
           return ets_qdisc_change(sch, opt, extack);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_ets.c:591:2: note: 'oldbands' initialized here
           unsigned int oldbands =3D q->nbands;
           ^~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_ets.c:598:7: note: 'opt' is non-null
           if (!opt) {
                ^~~
   net/sched/sch_ets.c:598:2: note: Taking false branch
           if (!opt) {
           ^
   net/sched/sch_ets.c:603:8: note: Calling 'nla_parse_nested'
           err =3D nla_parse_nested(tb, TCA_ETS_MAX, opt, ets_policy, extac=
k);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1207:6: note: Assuming the condition is false
           if (!(nla->nla_type & NLA_F_NESTED)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1207:2: note: Taking false branch
           if (!(nla->nla_type & NLA_F_NESTED)) {
           ^
   include/net/netlink.h:1212:9: note: Assigning value, which participates =
in a condition later
           return __nla_parse(tb, maxtype, nla_data(nla), nla_len(nla), pol=
icy,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   net/sched/sch_ets.c:603:8: note: Returning from 'nla_parse_nested'
           err =3D nla_parse_nested(tb, TCA_ETS_MAX, opt, ets_policy, extac=
k);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_ets.c:604:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/sch_ets.c:604:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/sch_ets.c:607:6: note: Assuming the condition is false
           if (!tb[TCA_ETS_NBANDS]) {
               ^~~~~~~~~~~~~~~~~~~
   net/sched/sch_ets.c:607:2: note: Taking false branch
           if (!tb[TCA_ETS_NBANDS]) {
           ^
   net/sched/sch_ets.c:612:6: note: Assuming 'nbands' is >=3D 1
           if (nbands < 1 || nbands > TCQ_ETS_MAX_BANDS) {
               ^~~~~~~~~~
   net/sched/sch_ets.c:612:6: note: Left side of '||' is false
   net/sched/sch_ets.c:612:20: note: Assuming 'nbands' is <=3D TCQ_ETS_MAX_=
BANDS
           if (nbands < 1 || nbands > TCQ_ETS_MAX_BANDS) {
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_ets.c:612:2: note: Taking false branch
           if (nbands < 1 || nbands > TCQ_ETS_MAX_BANDS) {
           ^
   net/sched/sch_ets.c:619:6: note: Assuming the condition is false
           if (tb[TCA_ETS_NSTRICT]) {
               ^~~~~~~~~~~~~~~~~~~
   net/sched/sch_ets.c:619:2: note: Taking false branch
           if (tb[TCA_ETS_NSTRICT]) {
           ^
   net/sched/sch_ets.c:627:6: note: Assuming the condition is false
           if (tb[TCA_ETS_PRIOMAP]) {
               ^~~~~~~~~~~~~~~~~~~
   net/sched/sch_ets.c:627:2: note: Taking false branch
           if (tb[TCA_ETS_PRIOMAP]) {
           ^
   net/sched/sch_ets.c:634:6: note: Assuming the condition is false
           if (tb[TCA_ETS_QUANTA]) {
               ^~~~~~~~~~~~~~~~~~
   net/sched/sch_ets.c:634:2: note: Taking false branch
           if (tb[TCA_ETS_QUANTA]) {
           ^
   net/sched/sch_ets.c:643:20: note: 'i' is < 'nbands'
           for (i =3D nstrict; i < nbands; i++) {
                             ^
   net/sched/sch_ets.c:643:2: note: Loop condition is true.  Entering loop =
body
           for (i =3D nstrict; i < nbands; i++) {
           ^
   net/sched/sch_ets.c:644:3: note: Taking true branch
                   if (!quanta[i])
                   ^
   net/sched/sch_ets.c:643:20: note: Assuming 'i' is >=3D 'nbands'
           for (i =3D nstrict; i < nbands; i++) {
                             ^~~~~~~~~~
   net/sched/sch_ets.c:643:2: note: Loop condition is false. Execution cont=
inues on line 649
           for (i =3D nstrict; i < nbands; i++) {
           ^
   net/sched/sch_ets.c:649:21: note: Assuming 'i' is >=3D 'nbands'
--
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   net/bluetooth/hci_request.c:3109:25: note: Taking false branch
           struct hci_dev *hdev =3D container_of(work, struct hci_dev,
                                  ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   net/bluetooth/hci_request.c:3109:25: note: Loop condition is false.  Exi=
ting loop
           struct hci_dev *hdev =3D container_of(work, struct hci_dev,
                                  ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   net/bluetooth/hci_request.c:3112:2: note: 'status' declared without an i=
nitial value
           u8 status;
           ^~~~~~~~~
   net/bluetooth/hci_request.c:3116:2: note: Calling 'hci_req_sync'
           hci_req_sync(hdev, le_scan_restart, 0, HCI_CMD_TIMEOUT, &status);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/hci_request.c:281:6: note: Assuming the condition is false
           if (test_bit(HCI_UP, &hdev->flags))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/hci_request.c:281:2: note: Taking false branch
           if (test_bit(HCI_UP, &hdev->flags))
           ^
   net/bluetooth/hci_request.c:287:2: note: Returning without writing to '*=
hci_status'
           return ret;
           ^
   net/bluetooth/hci_request.c:3116:2: note: Returning from 'hci_req_sync'
           hci_req_sync(hdev, le_scan_restart, 0, HCI_CMD_TIMEOUT, &status);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/hci_request.c:3117:6: note: Branch condition evaluates to =
a garbage value
           if (status) {
               ^~~~~~
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   net/sched/sch_teql.c:249:4: warning: Value stored to 'err' is never read=
 [clang-analyzer-deadcode.DeadStores]
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   net/sched/sch_teql.c:249:4: note: Value stored to 'err' is never read
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   net/sched/sch_atm.c:89:25: warning: Value stored to 'p' during its initi=
alization is never read [clang-analyzer-deadcode.DeadStores]
           struct atm_qdisc_data *p =3D qdisc_priv(sch);
                                  ^   ~~~~~~~~~~~~~~~
   net/sched/sch_atm.c:89:25: note: Value stored to 'p' during its initiali=
zation is never read
           struct atm_qdisc_data *p =3D qdisc_priv(sch);
                                  ^   ~~~~~~~~~~~~~~~
   net/sched/sch_atm.c:388:2: warning: Value stored to 'result' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           result =3D TC_ACT_OK;     /* be nice to gcc */
           ^
   net/sched/sch_atm.c:388:2: note: Value stored to 'result' is never read
   net/sched/sch_atm.c:604:25: warning: Value stored to 'p' during its init=
ialization is never read [clang-analyzer-deadcode.DeadStores]
           struct atm_qdisc_data *p =3D qdisc_priv(sch);
                                  ^   ~~~~~~~~~~~~~~~
   net/sched/sch_atm.c:604:25: note: Value stored to 'p' during its initial=
ization is never read
           struct atm_qdisc_data *p =3D qdisc_priv(sch);
                                  ^   ~~~~~~~~~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
>> net/sched/sch_ets.c:680:23: warning: Assigned value is garbage or undefi=
ned [clang-analyzer-core.uninitialized.Assign]
                   q->classes[i].qdisc =3D queues[i];
                                       ^
   net/sched/sch_ets.c:701:6: note: Assuming 'opt' is non-null
           if (!opt)
               ^~~~
   net/sched/sch_ets.c:701:2: note: Taking false branch
           if (!opt)
           ^
   net/sched/sch_ets.c:704:8: note: Value assigned to field 'nbands'
           err =3D tcf_block_get(&q->block, &q->filter_list, sch, extack);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_ets.c:705:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   net/sched/sch_ets.c:705:2: note: Taking false branch
           if (err)
           ^
   net/sched/sch_ets.c:709:9: note: Calling 'ets_qdisc_change'
           return ets_qdisc_change(sch, opt, extack);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_ets.c:591:2: note: 'oldbands' initialized here
           unsigned int oldbands =3D q->nbands;
           ^~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_ets.c:598:7: note: 'opt' is non-null
           if (!opt) {
                ^~~
   net/sched/sch_ets.c:598:2: note: Taking false branch
           if (!opt) {
           ^
   net/sched/sch_ets.c:603:8: note: Calling 'nla_parse_nested'
           err =3D nla_parse_nested(tb, TCA_ETS_MAX, opt, ets_policy, extac=
k);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1207:6: note: Assuming the condition is false
           if (!(nla->nla_type & NLA_F_NESTED)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1207:2: note: Taking false branch
           if (!(nla->nla_type & NLA_F_NESTED)) {
           ^
   include/net/netlink.h:1212:9: note: Assigning value, which participates =
in a condition later
           return __nla_parse(tb, maxtype, nla_data(nla), nla_len(nla), pol=
icy,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   net/sched/sch_ets.c:603:8: note: Returning from 'nla_parse_nested'
           err =3D nla_parse_nested(tb, TCA_ETS_MAX, opt, ets_policy, extac=
k);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_ets.c:604:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/sch_ets.c:604:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/sch_ets.c:607:6: note: Assuming the condition is false
           if (!tb[TCA_ETS_NBANDS]) {
               ^~~~~~~~~~~~~~~~~~~
   net/sched/sch_ets.c:607:2: note: Taking false branch
           if (!tb[TCA_ETS_NBANDS]) {
           ^
   net/sched/sch_ets.c:612:6: note: Assuming 'nbands' is >=3D 1
           if (nbands < 1 || nbands > TCQ_ETS_MAX_BANDS) {
               ^~~~~~~~~~
   net/sched/sch_ets.c:612:6: note: Left side of '||' is false
   net/sched/sch_ets.c:612:20: note: Assuming 'nbands' is <=3D TCQ_ETS_MAX_=
BANDS
           if (nbands < 1 || nbands > TCQ_ETS_MAX_BANDS) {
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_ets.c:612:2: note: Taking false branch
           if (nbands < 1 || nbands > TCQ_ETS_MAX_BANDS) {
           ^
   net/sched/sch_ets.c:619:6: note: Assuming the condition is false
           if (tb[TCA_ETS_NSTRICT]) {
               ^~~~~~~~~~~~~~~~~~~
   net/sched/sch_ets.c:619:2: note: Taking false branch
           if (tb[TCA_ETS_NSTRICT]) {
           ^
   net/sched/sch_ets.c:627:6: note: Assuming the condition is false
           if (tb[TCA_ETS_PRIOMAP]) {
               ^~~~~~~~~~~~~~~~~~~
   net/sched/sch_ets.c:627:2: note: Taking false branch
           if (tb[TCA_ETS_PRIOMAP]) {
           ^
   net/sched/sch_ets.c:634:6: note: Assuming the condition is false
           if (tb[TCA_ETS_QUANTA]) {
               ^~~~~~~~~~~~~~~~~~
   net/sched/sch_ets.c:634:2: note: Taking false branch
           if (tb[TCA_ETS_QUANTA]) {
           ^
   net/sched/sch_ets.c:643:20: note: 'i' is < 'nbands'
           for (i =3D nstrict; i < nbands; i++) {
                             ^
   net/sched/sch_ets.c:643:2: note: Loop condition is true.  Entering loop =
body
           for (i =3D nstrict; i < nbands; i++) {
           ^
   net/sched/sch_ets.c:644:3: note: Taking true branch
                   if (!quanta[i])
                   ^
   net/sched/sch_ets.c:643:20: note: Assuming 'i' is >=3D 'nbands'
           for (i =3D nstrict; i < nbands; i++) {
                             ^~~~~~~~~~
   net/sched/sch_ets.c:643:2: note: Loop condition is false. Execution cont=
inues on line 649
           for (i =3D nstrict; i < nbands; i++) {
           ^
   net/sched/sch_ets.c:649:21: note: Assuming 'i' is >=3D 'nbands'

vim +680 net/sched/sch_ets.c

dcc68b4d8084e1 Petr Machata   2019-12-18  583  =

dcc68b4d8084e1 Petr Machata   2019-12-18  584  static int ets_qdisc_change(=
struct Qdisc *sch, struct nlattr *opt,
dcc68b4d8084e1 Petr Machata   2019-12-18  585  			    struct netlink_ext_ac=
k *extack)
dcc68b4d8084e1 Petr Machata   2019-12-18  586  {
dcc68b4d8084e1 Petr Machata   2019-12-18  587  	unsigned int quanta[TCQ_ETS=
_MAX_BANDS] =3D {0};
dcc68b4d8084e1 Petr Machata   2019-12-18  588  	struct Qdisc *queues[TCQ_ET=
S_MAX_BANDS];
dcc68b4d8084e1 Petr Machata   2019-12-18  589  	struct ets_sched *q =3D qdi=
sc_priv(sch);
dcc68b4d8084e1 Petr Machata   2019-12-18  590  	struct nlattr *tb[TCA_ETS_M=
AX + 1];
dcc68b4d8084e1 Petr Machata   2019-12-18  591  	unsigned int oldbands =3D q=
->nbands;
dcc68b4d8084e1 Petr Machata   2019-12-18  592  	u8 priomap[TC_PRIO_MAX + 1];
dcc68b4d8084e1 Petr Machata   2019-12-18  593  	unsigned int nstrict =3D 0;
dcc68b4d8084e1 Petr Machata   2019-12-18  594  	unsigned int nbands;
dcc68b4d8084e1 Petr Machata   2019-12-18  595  	unsigned int i;
dcc68b4d8084e1 Petr Machata   2019-12-18  596  	int err;
dcc68b4d8084e1 Petr Machata   2019-12-18  597  =

dcc68b4d8084e1 Petr Machata   2019-12-18  598  	if (!opt) {
dcc68b4d8084e1 Petr Machata   2019-12-18  599  		NL_SET_ERR_MSG(extack, "ET=
S options are required for this operation");
dcc68b4d8084e1 Petr Machata   2019-12-18  600  		return -EINVAL;
dcc68b4d8084e1 Petr Machata   2019-12-18  601  	}
dcc68b4d8084e1 Petr Machata   2019-12-18  602  =

dcc68b4d8084e1 Petr Machata   2019-12-18  603  	err =3D nla_parse_nested(tb=
, TCA_ETS_MAX, opt, ets_policy, extack);
dcc68b4d8084e1 Petr Machata   2019-12-18  604  	if (err < 0)
dcc68b4d8084e1 Petr Machata   2019-12-18  605  		return err;
dcc68b4d8084e1 Petr Machata   2019-12-18  606  =

dcc68b4d8084e1 Petr Machata   2019-12-18  607  	if (!tb[TCA_ETS_NBANDS]) {
dcc68b4d8084e1 Petr Machata   2019-12-18  608  		NL_SET_ERR_MSG_MOD(extack,=
 "Number of bands is a required argument");
dcc68b4d8084e1 Petr Machata   2019-12-18  609  		return -EINVAL;
dcc68b4d8084e1 Petr Machata   2019-12-18  610  	}
dcc68b4d8084e1 Petr Machata   2019-12-18  611  	nbands =3D nla_get_u8(tb[TC=
A_ETS_NBANDS]);
dcc68b4d8084e1 Petr Machata   2019-12-18  612  	if (nbands < 1 || nbands > =
TCQ_ETS_MAX_BANDS) {
dcc68b4d8084e1 Petr Machata   2019-12-18  613  		NL_SET_ERR_MSG_MOD(extack,=
 "Invalid number of bands");
dcc68b4d8084e1 Petr Machata   2019-12-18  614  		return -EINVAL;
dcc68b4d8084e1 Petr Machata   2019-12-18  615  	}
dcc68b4d8084e1 Petr Machata   2019-12-18  616  	/* Unless overridden, traff=
ic goes to the last band. */
dcc68b4d8084e1 Petr Machata   2019-12-18  617  	memset(priomap, nbands - 1,=
 sizeof(priomap));
dcc68b4d8084e1 Petr Machata   2019-12-18  618  =

dcc68b4d8084e1 Petr Machata   2019-12-18  619  	if (tb[TCA_ETS_NSTRICT]) {
dcc68b4d8084e1 Petr Machata   2019-12-18  620  		nstrict =3D nla_get_u8(tb[=
TCA_ETS_NSTRICT]);
dcc68b4d8084e1 Petr Machata   2019-12-18  621  		if (nstrict > nbands) {
dcc68b4d8084e1 Petr Machata   2019-12-18  622  			NL_SET_ERR_MSG_MOD(extack=
, "Invalid number of strict bands");
dcc68b4d8084e1 Petr Machata   2019-12-18  623  			return -EINVAL;
dcc68b4d8084e1 Petr Machata   2019-12-18  624  		}
dcc68b4d8084e1 Petr Machata   2019-12-18  625  	}
dcc68b4d8084e1 Petr Machata   2019-12-18  626  =

dcc68b4d8084e1 Petr Machata   2019-12-18  627  	if (tb[TCA_ETS_PRIOMAP]) {
dcc68b4d8084e1 Petr Machata   2019-12-18  628  		err =3D ets_qdisc_priomap_=
parse(tb[TCA_ETS_PRIOMAP],
dcc68b4d8084e1 Petr Machata   2019-12-18  629  					      nbands, priomap, =
extack);
dcc68b4d8084e1 Petr Machata   2019-12-18  630  		if (err)
dcc68b4d8084e1 Petr Machata   2019-12-18  631  			return err;
dcc68b4d8084e1 Petr Machata   2019-12-18  632  	}
dcc68b4d8084e1 Petr Machata   2019-12-18  633  =

dcc68b4d8084e1 Petr Machata   2019-12-18  634  	if (tb[TCA_ETS_QUANTA]) {
dcc68b4d8084e1 Petr Machata   2019-12-18  635  		err =3D ets_qdisc_quanta_p=
arse(sch, tb[TCA_ETS_QUANTA],
dcc68b4d8084e1 Petr Machata   2019-12-18  636  					     nbands, nstrict, q=
uanta, extack);
dcc68b4d8084e1 Petr Machata   2019-12-18  637  		if (err)
dcc68b4d8084e1 Petr Machata   2019-12-18  638  			return err;
dcc68b4d8084e1 Petr Machata   2019-12-18  639  	}
dcc68b4d8084e1 Petr Machata   2019-12-18  640  	/* If there are more bands =
than strict + quanta provided, the remaining
dcc68b4d8084e1 Petr Machata   2019-12-18  641  	 * ones are ETS with quantu=
m of MTU. Initialize the missing values here.
dcc68b4d8084e1 Petr Machata   2019-12-18  642  	 */
dcc68b4d8084e1 Petr Machata   2019-12-18  643  	for (i =3D nstrict; i < nba=
nds; i++) {
dcc68b4d8084e1 Petr Machata   2019-12-18  644  		if (!quanta[i])
dcc68b4d8084e1 Petr Machata   2019-12-18  645  			quanta[i] =3D psched_mtu(=
qdisc_dev(sch));
dcc68b4d8084e1 Petr Machata   2019-12-18  646  	}
dcc68b4d8084e1 Petr Machata   2019-12-18  647  =

dcc68b4d8084e1 Petr Machata   2019-12-18  648  	/* Before commit, make sure=
 we can allocate all new qdiscs */
dcc68b4d8084e1 Petr Machata   2019-12-18  649  	for (i =3D oldbands; i < nb=
ands; i++) {
dcc68b4d8084e1 Petr Machata   2019-12-18  650  		queues[i] =3D qdisc_create=
_dflt(sch->dev_queue, &pfifo_qdisc_ops,
dcc68b4d8084e1 Petr Machata   2019-12-18  651  					      ets_class_id(sch,=
 &q->classes[i]),
dcc68b4d8084e1 Petr Machata   2019-12-18  652  					      extack);
dcc68b4d8084e1 Petr Machata   2019-12-18  653  		if (!queues[i]) {
dcc68b4d8084e1 Petr Machata   2019-12-18  654  			while (i > oldbands)
dcc68b4d8084e1 Petr Machata   2019-12-18  655  				qdisc_put(queues[--i]);
dcc68b4d8084e1 Petr Machata   2019-12-18  656  			return -ENOMEM;
dcc68b4d8084e1 Petr Machata   2019-12-18  657  		}
dcc68b4d8084e1 Petr Machata   2019-12-18  658  	}
dcc68b4d8084e1 Petr Machata   2019-12-18  659  =

dcc68b4d8084e1 Petr Machata   2019-12-18  660  	sch_tree_lock(sch);
dcc68b4d8084e1 Petr Machata   2019-12-18  661  =

dcc68b4d8084e1 Petr Machata   2019-12-18  662  	q->nbands =3D nbands;
cd9b50adc6bb9a Davide Caratti 2021-08-25  663  	for (i =3D nstrict; i < q->=
nstrict; i++) {
cd9b50adc6bb9a Davide Caratti 2021-08-25  664  		INIT_LIST_HEAD(&q->classes=
[i].alist);
cd9b50adc6bb9a Davide Caratti 2021-08-25  665  		if (q->classes[i].qdisc->q=
.qlen) {
cd9b50adc6bb9a Davide Caratti 2021-08-25  666  			list_add_tail(&q->classes=
[i].alist, &q->active);
cd9b50adc6bb9a Davide Caratti 2021-08-25  667  			q->classes[i].deficit =3D=
 quanta[i];
cd9b50adc6bb9a Davide Caratti 2021-08-25  668  		}
cd9b50adc6bb9a Davide Caratti 2021-08-25  669  	}
dcc68b4d8084e1 Petr Machata   2019-12-18  670  	q->nstrict =3D nstrict;
dcc68b4d8084e1 Petr Machata   2019-12-18  671  	memcpy(q->prio2band, prioma=
p, sizeof(priomap));
dcc68b4d8084e1 Petr Machata   2019-12-18  672  =

dcc68b4d8084e1 Petr Machata   2019-12-18  673  	for (i =3D q->nbands; i < o=
ldbands; i++)
dcc68b4d8084e1 Petr Machata   2019-12-18  674  		qdisc_tree_flush_backlog(q=
->classes[i].qdisc);
dcc68b4d8084e1 Petr Machata   2019-12-18  675  =

dcc68b4d8084e1 Petr Machata   2019-12-18  676  	for (i =3D 0; i < q->nbands=
; i++)
dcc68b4d8084e1 Petr Machata   2019-12-18  677  		q->classes[i].quantum =3D =
quanta[i];
dcc68b4d8084e1 Petr Machata   2019-12-18  678  =

dcc68b4d8084e1 Petr Machata   2019-12-18  679  	for (i =3D oldbands; i < q-=
>nbands; i++) {
dcc68b4d8084e1 Petr Machata   2019-12-18 @680  		q->classes[i].qdisc =3D qu=
eues[i];
dcc68b4d8084e1 Petr Machata   2019-12-18  681  		if (q->classes[i].qdisc !=
=3D &noop_qdisc)
dcc68b4d8084e1 Petr Machata   2019-12-18  682  			qdisc_hash_add(q->classes=
[i].qdisc, true);
dcc68b4d8084e1 Petr Machata   2019-12-18  683  	}
dcc68b4d8084e1 Petr Machata   2019-12-18  684  =

dcc68b4d8084e1 Petr Machata   2019-12-18  685  	sch_tree_unlock(sch);
dcc68b4d8084e1 Petr Machata   2019-12-18  686  =

d35eb52bd2ac75 Petr Machata   2019-12-18  687  	ets_offload_change(sch);
dcc68b4d8084e1 Petr Machata   2019-12-18  688  	for (i =3D q->nbands; i < o=
ldbands; i++) {
dcc68b4d8084e1 Petr Machata   2019-12-18  689  		qdisc_put(q->classes[i].qd=
isc);
dcc68b4d8084e1 Petr Machata   2019-12-18  690  		memset(&q->classes[i], 0, =
sizeof(q->classes[i]));
dcc68b4d8084e1 Petr Machata   2019-12-18  691  	}
dcc68b4d8084e1 Petr Machata   2019-12-18  692  	return 0;
dcc68b4d8084e1 Petr Machata   2019-12-18  693  }
dcc68b4d8084e1 Petr Machata   2019-12-18  694  =


:::::: The code at line 680 was first introduced by commit
:::::: dcc68b4d8084e1ac9af0d4022d6b1aff6a139a33 net: sch_ets: Add a new Qdi=
sc

:::::: TO: Petr Machata <petrm@mellanox.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0787932734255916911==--

