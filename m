Content-Type: multipart/mixed; boundary="===============5392173506142180313=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hnaz-mm:master 420/435] net/mctp/route.c:156:3: warning: Attempt to free released memory [clang-analyzer-unix.Malloc]
Date: Sat, 15 Jan 2022 22:11:18 +0800
Message-ID: <202201152250.uZ6shWKA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5392173506142180313==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Johannes Weiner <hannes@cmpxchg.org>

Hi Andrew,

First bad commit (maybe !=3D root cause):

tree:   https://github.com/hnaz/linux-mm master
head:   b8280145cf2a894c873fdf91fb2af474c52ac6cc
commit: 467f11828258634df98bade42c10d6660b319f35 [420/435] mm-filemap-check=
-if-thp-has-hwpoisoned-subpage-for-pmd-page-fault-vs-folios
:::::: branch date: 3 months ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20115/202201152250.uZ6shWKA-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 82c8ac=
a93488730ce8f66101e0f3538f14b551dd)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/hnaz/linux-mm/commit/467f11828258634df98bade42=
c10d6660b319f35
        git remote add hnaz-mm https://github.com/hnaz/linux-mm
        git fetch --no-tags hnaz-mm master
        git checkout 467f11828258634df98bade42c10d6660b319f35
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           if (id)
               ^~
   drivers/power/supply/bq2415x_charger.c:1577:2: note: Taking true branch
           if (id)
           ^
   drivers/power/supply/bq2415x_charger.c:1587:6: note: 'np' is null
           if (np || ACPI_HANDLE(bq->dev)) {
               ^~
   drivers/power/supply/bq2415x_charger.c:1587:6: note: Left side of '||' i=
s false
   drivers/power/supply/bq2415x_charger.c:1587:12: note: Assuming the condi=
tion is false
           if (np || ACPI_HANDLE(bq->dev)) {
                     ^
   include/linux/acpi.h:46:46: note: expanded from macro 'ACPI_HANDLE'
   #define ACPI_HANDLE(dev)                acpi_device_handle(ACPI_COMPANIO=
N(dev))
                                                              ^~~~~~~~~~~~~=
~~~~~~
   include/linux/acpi.h:43:30: note: expanded from macro 'ACPI_COMPANION'
   #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnod=
e)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/acpi/acpi_bus.h:417:3: note: expanded from macro 'to_acpi_device=
_node'
                   is_acpi_device_node(__to_acpi_device_node_fwnode) ?     \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/bq2415x_charger.c:1587:12: note: '?' condition is f=
alse
           if (np || ACPI_HANDLE(bq->dev)) {
                     ^
   include/linux/acpi.h:46:46: note: expanded from macro 'ACPI_HANDLE'
   #define ACPI_HANDLE(dev)                acpi_device_handle(ACPI_COMPANIO=
N(dev))
                                                              ^
   include/linux/acpi.h:43:30: note: expanded from macro 'ACPI_COMPANION'
   #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnod=
e)
                                           ^
   include/acpi/acpi_bus.h:417:3: note: expanded from macro 'to_acpi_device=
_node'
                   is_acpi_device_node(__to_acpi_device_node_fwnode) ?     \
                   ^
   drivers/power/supply/bq2415x_charger.c:1587:12: note: Calling 'acpi_devi=
ce_handle'
           if (np || ACPI_HANDLE(bq->dev)) {
                     ^
   include/linux/acpi.h:46:27: note: expanded from macro 'ACPI_HANDLE'
   #define ACPI_HANDLE(dev)                acpi_device_handle(ACPI_COMPANIO=
N(dev))
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   include/linux/acpi.h:40:9: note: 'adev' is null
           return adev ? adev->handle : NULL;
                  ^~~~
   include/linux/acpi.h:40:9: note: '?' condition is false
   include/linux/acpi.h:40:2: note: Returning null pointer, which participa=
tes in a condition later
           return adev ? adev->handle : NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/bq2415x_charger.c:1587:12: note: Returning from 'ac=
pi_device_handle'
           if (np || ACPI_HANDLE(bq->dev)) {
                     ^
   include/linux/acpi.h:46:27: note: expanded from macro 'ACPI_HANDLE'
   #define ACPI_HANDLE(dev)                acpi_device_handle(ACPI_COMPANIO=
N(dev))
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/power/supply/bq2415x_charger.c:1587:2: note: Taking false branch
           if (np || ACPI_HANDLE(bq->dev)) {
           ^
   drivers/power/supply/bq2415x_charger.c:1622:3: note: Null pointer passed=
 as 2nd argument to memory copy function
                   memcpy(&bq->init_data, pdata, sizeof(bq->init_data));
                   ^                      ~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   net/mptcp/sockopt.c:595:3: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(msk->ca_name, name);
                   ^~~~~~
   net/mptcp/sockopt.c:595:3: note: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119
                   strcpy(msk->ca_name, name);
                   ^~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   net/mctp/device.c:125:11: warning: Assigned value is garbage or undefine=
d [clang-analyzer-core.uninitialized.Assign]
           mcb->idx =3D idx;
                    ^ ~~~
   net/mctp/device.c:95:6: note: 'idx' declared without an initial value
           int idx, rc;
               ^~~
   net/mctp/device.c:102:9: note: Assuming the condition is false
           for (; mcb->h < NETDEV_HASHENTRIES; mcb->h++, mcb->idx =3D 0) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mctp/device.c:102:2: note: Loop condition is false. Execution contin=
ues on line 124
           for (; mcb->h < NETDEV_HASHENTRIES; mcb->h++, mcb->idx =3D 0) {
           ^
   net/mctp/device.c:125:11: note: Assigned value is garbage or undefined
           mcb->idx =3D idx;
                    ^ ~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
>> net/mctp/route.c:156:3: warning: Attempt to free released memory [clang-=
analyzer-unix.Malloc]
                   kfree(key);
                   ^
   net/mctp/route.c:281:6: note: Assuming the condition is false
           if (skb->len < sizeof(struct mctp_hdr) + 1)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mctp/route.c:281:2: note: Taking false branch
           if (skb->len < sizeof(struct mctp_hdr) + 1)
           ^
   net/mctp/route.c:288:6: note: Assuming field 'ver' is equal to 1
           if (mh->ver !=3D 1)
               ^~~~~~~~~~~~
   net/mctp/route.c:288:2: note: Taking false branch
           if (mh->ver !=3D 1)
           ^
   net/mctp/route.c:299:8: note: Calling 'mctp_lookup_key'
           key =3D mctp_lookup_key(net, skb, mh->src, &f);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mctp/route.c:107:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&net->mctp.keys_lock, flags);
           ^
   include/linux/spinlock.h:397:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:253:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   net/mctp/route.c:107:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&net->mctp.keys_lock, flags);
           ^
   include/linux/spinlock.h:395:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   net/mctp/route.c:109:2: note: Assuming '____ptr' is non-null
           hlist_for_each_entry(key, &net->mctp.keys, hlist) {
           ^
   include/linux/list.h:995:13: note: expanded from macro 'hlist_for_each_e=
ntry'
           for (pos =3D hlist_entry_safe((head)->first, typeof(*(pos)), mem=
ber);\
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/list.h:985:5: note: expanded from macro 'hlist_entry_safe'
              ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
              ^~~~~~~
   net/mctp/route.c:109:2: note: '?' condition is true
           hlist_for_each_entry(key, &net->mctp.keys, hlist) {
           ^
   include/linux/list.h:995:13: note: expanded from macro 'hlist_for_each_e=
ntry'
           for (pos =3D hlist_entry_safe((head)->first, typeof(*(pos)), mem=
ber);\
                      ^
   include/linux/list.h:985:5: note: expanded from macro 'hlist_entry_safe'
              ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
              ^
   net/mctp/route.c:109:2: note: Loop condition is true.  Entering loop body
           hlist_for_each_entry(key, &net->mctp.keys, hlist) {
           ^
   include/linux/list.h:995:2: note: expanded from macro 'hlist_for_each_en=
try'
           for (pos =3D hlist_entry_safe((head)->first, typeof(*(pos)), mem=
ber);\
           ^
   net/mctp/route.c:110:3: note: Taking false branch
                   if (!mctp_key_match(key, mh->dest, peer, tag))
                   ^
   net/mctp/route.c:114:7: note: Assuming field 'valid' is true
                   if (key->valid) {
                       ^~~~~~~~~~
   net/mctp/route.c:114:3: note: Taking true branch
                   if (key->valid) {
                   ^
   net/mctp/route.c:117:4: note:  Execution continues on line 122
                           break;
                           ^
   net/mctp/route.c:122:6: note: 'ret' is non-null
           if (ret) {
               ^~~
   net/mctp/route.c:122:2: note: Taking true branch
           if (ret) {
           ^
   net/mctp/route.c:299:8: note: Returning from 'mctp_lookup_key'
           key =3D mctp_lookup_key(net, skb, mh->src, &f);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mctp/route.c:301:6: note: Assuming the condition is true
           if (flags & MCTP_HDR_FLAG_SOM) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/mctp/route.c:301:2: note: Taking true branch
           if (flags & MCTP_HDR_FLAG_SOM) {
           ^
   net/mctp/route.c:302:7: note: 'key' is non-null
                   if (key) {
                       ^~~
   net/mctp/route.c:302:3: note: Taking true branch
                   if (key) {
                   ^
   net/mctp/route.c:320:8: note: 'key' is non-null
                   if (!key && !msk && (tag & MCTP_HDR_FLAG_TO))
                        ^~~
   net/mctp/route.c:320:12: note: Left side of '&&' is false
                   if (!key && !msk && (tag & MCTP_HDR_FLAG_TO))
                            ^
   net/mctp/route.c:323:7: note: Assuming 'msk' is non-null
                   if (!msk) {
                       ^~~~
   net/mctp/route.c:323:3: note: Taking false branch
                   if (!msk) {

vim +156 net/mctp/route.c

4a992bbd365094 Jeremy Kerr   2021-07-29  152  =

2ce5eeadf5d8d9 Andrew Morton 2021-10-28  153  void mctp_key_unref(struct mc=
tp_sk_key *key)
2ce5eeadf5d8d9 Andrew Morton 2021-10-28  154  {
2ce5eeadf5d8d9 Andrew Morton 2021-10-28  155  	if (refcount_dec_and_test(&k=
ey->refs))
2ce5eeadf5d8d9 Andrew Morton 2021-10-28 @156  		kfree(key);
2ce5eeadf5d8d9 Andrew Morton 2021-10-28  157  }
2ce5eeadf5d8d9 Andrew Morton 2021-10-28  158  =


:::::: The code at line 156 was first introduced by commit
:::::: 2ce5eeadf5d8d942274eab25142c309ff63c80ba linux-next

:::::: TO: Andrew Morton <akpm@linux-foundation.org>
:::::: CC: Johannes Weiner <hannes@cmpxchg.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5392173506142180313==--

