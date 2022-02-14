Content-Type: multipart/mixed; boundary="===============7275752375089496324=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 5/5] iio: accel: add ADXL367 driver
Date: Mon, 14 Feb 2022 11:07:52 +0800
Message-ID: <202202141008.Nq8V22Yr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7275752375089496324==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220206211307.1564647-6-cosmin.tanislav@analog.com>
References: <20220206211307.1564647-6-cosmin.tanislav@analog.com>
TO: Cosmin Tanislav <demonsingur@gmail.com>
CC: cosmin.tanislav(a)analog.com
CC: demonsingur(a)gmail.com
CC: "Lars-Peter Clausen" <lars@metafoo.de>
CC: Michael Hennerich <Michael.Hennerich@analog.com>
CC: Rob Herring <robh+dt@kernel.org>
CC: linux-iio(a)vger.kernel.org
CC: devicetree(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Cosmin,

I love your patch! Perhaps something to improve:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on robh/for-next linus/master v5.17-rc4 next-20220=
211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Cosmin-Tanislav/Add-ADXL36=
7-driver/20220207-051424
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm-randconfig-c002-20220209 (https://download.01.org/0day-ci/archi=
ve/20220214/202202141008.Nq8V22Yr-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9=
ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/598203f0ba563c39a04a781c2=
c6acd9375b3b01c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Cosmin-Tanislav/Add-ADXL367-driver=
/20220207-051424
        git checkout 598203f0ba563c39a04a781c2c6acd9375b3b01c
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           for_each_net_rcu(net) {
           ^
   include/net/net_namespace.h:339:2: note: expanded from macro 'for_each_n=
et_rcu'
           list_for_each_entry_rcu(VAR, &net_namespace_list, list)
           ^
   include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   net/netlink/genetlink.c:1445:2: note: Left side of '||' is true
           for_each_net_rcu(net) {
           ^
   include/net/net_namespace.h:339:2: note: expanded from macro 'for_each_n=
et_rcu'
           list_for_each_entry_rcu(VAR, &net_namespace_list, list)
           ^
   include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:303:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   net/netlink/genetlink.c:1445:2: note: Taking false branch
           for_each_net_rcu(net) {
           ^
   include/net/net_namespace.h:339:2: note: expanded from macro 'for_each_n=
et_rcu'
           list_for_each_entry_rcu(VAR, &net_namespace_list, list)
           ^
   include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:315:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   net/netlink/genetlink.c:1445:2: note: Loop condition is false.  Exiting =
loop
           for_each_net_rcu(net) {
           ^
   include/net/net_namespace.h:339:2: note: expanded from macro 'for_each_n=
et_rcu'
           list_for_each_entry_rcu(VAR, &net_namespace_list, list)
           ^
   include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   net/netlink/genetlink.c:1445:2: note: Loop condition is false. Execution=
 continues on line 1463
           for_each_net_rcu(net) {
           ^
   include/net/net_namespace.h:339:2: note: expanded from macro 'for_each_n=
et_rcu'
           list_for_each_entry_rcu(VAR, &net_namespace_list, list)
           ^
   include/linux/rculist.h:390:2: note: expanded from macro 'list_for_each_=
entry_rcu'
           for (__list_check_rcu(dummy, ## cond, 0),                       \
           ^
   net/netlink/genetlink.c:1463:24: note: Access to field 'genl_sock' resul=
ts in a dereference of a null pointer (loaded from variable 'prev')
           err =3D nlmsg_multicast(prev->genl_sock, skb, portid, group, fla=
gs);
                                 ^~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/iio/accel/adxl367.c:156:8: warning: Excessive padding in 'struct=
 adxl367_state' (51 padding bytes, where 19 is optimal). =

   Optimal fields order: =

   fifo_buf, =

   ops, =

   context, =

   dev, =

   regmap, =

   odr, =

   range, =

   act_threshold, =

   act_time_ms, =

   inact_threshold, =

   inact_time_ms, =

   fifo_set_size, =

   fifo_watermark, =

   regulators, =

   lock, =

   sample_buf, =

   act_threshold_buf, =

   inact_time_buf, =

   status_buf, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct adxl367_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/accel/adxl367.c:156:8: note: Excessive padding in 'struct ad=
xl367_state' (51 padding bytes, where 19 is optimal). Optimal fields order:=
 fifo_buf, ops, context, dev, regmap, odr, range, act_threshold, act_time_m=
s, inact_threshold, inact_time_ms, fifo_set_size, fifo_watermark, regulator=
s, lock, sample_buf, act_threshold_buf, inact_time_buf, status_buf, conside=
r reordering the fields or adding explicit padding members
   struct adxl367_state {
   ~~~~~~~^~~~~~~~~~~~~~~
>> drivers/iio/accel/adxl367.c:884:10: warning: The left expression of the =
compound assignment is an uninitialized value. The computed value will also=
 be garbage [clang-analyzer-core.uninitialized.Assign]
           handled |=3D adxl367_push_event(indio_dev, status);
           ~~~~~~~ ^
   drivers/iio/accel/adxl367.c:876:2: note: 'handled' declared without an i=
nitial value
           bool handled;
           ^~~~~~~~~~~~
   drivers/iio/accel/adxl367.c:880:8: note: Calling 'adxl367_get_status'
           ret =3D adxl367_get_status(st, &status, &fifo_entries);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/adxl367.c:817:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/iio/accel/adxl367.c:817:2: note: Taking false branch
           if (ret)
           ^
   drivers/iio/accel/adxl367.c:825:2: note: Returning zero, which participa=
tes in a condition later
           return 0;
           ^~~~~~~~
   drivers/iio/accel/adxl367.c:880:8: note: Returning from 'adxl367_get_sta=
tus'
           ret =3D adxl367_get_status(st, &status, &fifo_entries);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/adxl367.c:881:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/iio/accel/adxl367.c:881:2: note: Taking false branch
           if (ret)
           ^
   drivers/iio/accel/adxl367.c:884:10: note: The left expression of the com=
pound assignment is an uninitialized value. The computed value will also be=
 garbage
           handled |=3D adxl367_push_event(indio_dev, status);
           ~~~~~~~ ^
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
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
   7 warnings generated.
   net/bluetooth/hci_request.c:2342:2: warning: 2nd function call argument =
is an uninitialized value [clang-analyzer-core.CallAndMessage]
           mgmt_set_connectable_complete(hdev, status);
           ^                                   ~~~~~~
   net/bluetooth/hci_request.c:2339:2: note: 'status' declared without an i=
nitial value
           u8 status;
           ^~~~~~~~~
   net/bluetooth/hci_request.c:2341:2: note: Calling 'hci_req_sync'
           hci_req_sync(hdev, connectable_update, 0, HCI_CMD_TIMEOUT, &stat=
us);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   net/bluetooth/hci_request.c:282:6: note: Assuming the condition is false
           if (test_bit(HCI_UP, &hdev->flags))
               ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   net/bluetooth/hci_request.c:282:2: note: Taking false branch
           if (test_bit(HCI_UP, &hdev->flags))
           ^
   net/bluetooth/hci_request.c:288:2: note: Returning without writing to '*=
hci_status'
           return ret;
           ^
   net/bluetooth/hci_request.c:2341:2: note: Returning from 'hci_req_sync'
           hci_req_sync(hdev, connectable_update, 0, HCI_CMD_TIMEOUT, &stat=
us);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   net/bluetooth/hci_request.c:2342:2: note: 2nd function call argument is =
an uninitialized value
           mgmt_set_connectable_complete(hdev, status);
           ^                                   ~~~~~~
   net/bluetooth/hci_request.c:2455:2: warning: 2nd function call argument =
is an uninitialized value [clang-analyzer-core.CallAndMessage]
           mgmt_set_discoverable_complete(hdev, status);
           ^                                    ~~~~~~
   net/bluetooth/hci_request.c:2452:2: note: 'status' declared without an i=
nitial value
           u8 status;
           ^~~~~~~~~
   net/bluetooth/hci_request.c:2454:2: note: Calling 'hci_req_sync'
           hci_req_sync(hdev, discoverable_update, 0, HCI_CMD_TIMEOUT, &sta=
tus);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   net/bluetooth/hci_request.c:282:6: note: Assuming the condition is false
           if (test_bit(HCI_UP, &hdev->flags))
               ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   net/bluetooth/hci_request.c:282:2: note: Taking false branch
           if (test_bit(HCI_UP, &hdev->flags))
           ^
   net/bluetooth/hci_request.c:288:2: note: Returning without writing to '*=
hci_status'
           return ret;
           ^
   net/bluetooth/hci_request.c:2454:2: note: Returning from 'hci_req_sync'
           hci_req_sync(hdev, discoverable_update, 0, HCI_CMD_TIMEOUT, &sta=
tus);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   net/bluetooth/hci_request.c:2455:2: note: 2nd function call argument is =
an uninitialized value
           mgmt_set_discoverable_complete(hdev, status);
           ^                                    ~~~~~~
   net/bluetooth/hci_request.c:2575:3: warning: 2nd function call argument =
is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   hci_le_conn_failed(conn, status);
                   ^                        ~~~~~~
   net/bluetooth/hci_request.c:2564:2: note: 'status' declared without an i=
nitial value
           u8 status;
           ^~~~~~~~~
   net/bluetooth/hci_request.c:2567:8: note: Calling 'hci_req_sync'
           err =3D hci_req_sync(hdev, update_bg_scan, 0, HCI_CMD_TIMEOUT, &=
status);
--
                   ^
   drivers/vhost/net.c:1162:6: note: Assuming 'mergeable' is not equal to 0
                                           likely(mergeable) ? UIO_MAXIOV :=
 1);
                                           ^
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^~~~
   drivers/vhost/net.c:1162:6: note: '?' condition is true
                                           likely(mergeable) ? UIO_MAXIOV :=
 1);
                                           ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^
   drivers/vhost/net.c:1160:15: note: Calling 'get_rx_bufs'
                   headcount =3D get_rx_bufs(vq, vq->heads + nvq->done_idx,
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/net.c:1054:2: note: 'len' declared without an initial value
           u32 len;
           ^~~~~~~
   drivers/vhost/net.c:1056:9: note: Assuming 'datalen' is <=3D 0
           while (datalen > 0 && headcount < quota) {
                  ^~~~~~~~~~~
   drivers/vhost/net.c:1056:21: note: Left side of '&&' is false
           while (datalen > 0 && headcount < quota) {
                              ^
   drivers/vhost/net.c:1089:52: note: The left operand of '+' is a garbage =
value
           heads[headcount - 1].len =3D cpu_to_vhost32(vq, len + datalen);
                                                         ~~~ ^
   drivers/vhost/net.c:1186:4: warning: Value stored to 'err' is never read=
 [clang-analyzer-deadcode.DeadStores]
                           err =3D sock->ops->recvmsg(sock, &msg,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/net.c:1186:4: note: Value stored to 'err' is never read
                           err =3D sock->ops->recvmsg(sock, &msg,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   5 warnings generated.
   kernel/printk/printk.c:156:3: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(devkmsg_log_str, "on");
                   ^~~~~~
   kernel/printk/printk.c:156:3: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
                   strcpy(devkmsg_log_str, "on");
                   ^~~~~~
   kernel/printk/printk.c:158:3: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(devkmsg_log_str, "off");
                   ^~~~~~
   kernel/printk/printk.c:158:3: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
                   strcpy(devkmsg_log_str, "off");
                   ^~~~~~
   kernel/printk/printk.c:2633:2: warning: Value stored to 'do_cond_resched=
' is never read [clang-analyzer-deadcode.DeadStores]
           do_cond_resched =3D console_may_schedule;
           ^                 ~~~~~~~~~~~~~~~~~~~~
   kernel/printk/printk.c:2633:2: note: Value stored to 'do_cond_resched' i=
s never read
           do_cond_resched =3D console_may_schedule;
           ^                 ~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
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
   4 warnings generated.
>> drivers/iio/accel/adxl367.c:156:8: warning: Excessive padding in 'struct=
 adxl367_state' (51 padding bytes, where 19 is optimal). =

   Optimal fields order: =

   fifo_buf, =

   ops, =

   context, =

   dev, =

   regmap, =

   odr, =

   range, =

   act_threshold, =

   act_time_ms, =

   inact_threshold, =

   inact_time_ms, =

   fifo_set_size, =

   fifo_watermark, =

   regulators, =

   lock, =

   sample_buf, =

   act_threshold_buf, =

   inact_time_buf, =

   status_buf, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct adxl367_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/accel/adxl367.c:156:8: note: Excessive padding in 'struct ad=
xl367_state' (51 padding bytes, where 19 is optimal). Optimal fields order:=
 fifo_buf, ops, context, dev, regmap, odr, range, act_threshold, act_time_m=
s, inact_threshold, inact_time_ms, fifo_set_size, fifo_watermark, regulator=
s, lock, sample_buf, act_threshold_buf, inact_time_buf, status_buf, conside=
r reordering the fields or adding explicit padding members
   struct adxl367_state {
   ~~~~~~~^~~~~~~~~~~~~~~
>> drivers/iio/accel/adxl367.c:884:10: warning: The left expression of the =
compound assignment is an uninitialized value. The computed value will also=
 be garbage [clang-analyzer-core.uninitialized.Assign]
           handled |=3D adxl367_push_event(indio_dev, status);
           ~~~~~~~ ^
   drivers/iio/accel/adxl367.c:876:2: note: 'handled' declared without an i=
nitial value
           bool handled;
           ^~~~~~~~~~~~
   drivers/iio/accel/adxl367.c:880:8: note: Calling 'adxl367_get_status'
           ret =3D adxl367_get_status(st, &status, &fifo_entries);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/adxl367.c:817:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/iio/accel/adxl367.c:817:2: note: Taking false branch
           if (ret)
           ^
   drivers/iio/accel/adxl367.c:825:2: note: Returning zero, which participa=
tes in a condition later
           return 0;
           ^~~~~~~~
   drivers/iio/accel/adxl367.c:880:8: note: Returning from 'adxl367_get_sta=
tus'
           ret =3D adxl367_get_status(st, &status, &fifo_entries);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/adxl367.c:881:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/iio/accel/adxl367.c:881:2: note: Taking false branch
           if (ret)
           ^
   drivers/iio/accel/adxl367.c:884:10: note: The left expression of the com=
pound assignment is an uninitialized value. The computed value will also be=
 garbage
           handled |=3D adxl367_push_event(indio_dev, status);
           ~~~~~~~ ^
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   fs/orangefs/inode.c:836:3: warning: Value stored to 'ret' is never read =
[clang-analyzer-deadcode.DeadStores]
                   ret =3D posix_acl_chmod(&init_user_ns, inode, inode->i_m=
ode);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/orangefs/inode.c:836:3: note: Value stored to 'ret' is never read
                   ret =3D posix_acl_chmod(&init_user_ns, inode, inode->i_m=
ode);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
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
   drivers/input/touchscreen/max11801_ts.c:107:3: warning: Value stored to =
'status' is never read [clang-analyzer-deadcode.DeadStores]
                   status =3D read_register(data->client, GENERNAL_STATUS_R=
EG);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/max11801_ts.c:107:3: note: Value stored to 'st=
atus' is never read
                   status =3D read_register(data->client, GENERNAL_STATUS_R=
EG);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/net/can/dev/rx-offload.c:84:3: warning: Value stored to 'cb_pos'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   cb_pos =3D can_rx_offload_get_cb(pos);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/dev/rx-offload.c:84:3: note: Value stored to 'cb_pos' is=
 never read

vim +156 drivers/iio/accel/adxl367.c

598203f0ba563c Cosmin Tanislav 2022-02-06  155  =

598203f0ba563c Cosmin Tanislav 2022-02-06 @156  struct adxl367_state {
598203f0ba563c Cosmin Tanislav 2022-02-06  157  	const struct adxl367_ops	*=
ops;
598203f0ba563c Cosmin Tanislav 2022-02-06  158  	void				*context;
598203f0ba563c Cosmin Tanislav 2022-02-06  159  =

598203f0ba563c Cosmin Tanislav 2022-02-06  160  	struct device			*dev;
598203f0ba563c Cosmin Tanislav 2022-02-06  161  	struct regmap			*regmap;
598203f0ba563c Cosmin Tanislav 2022-02-06  162  =

598203f0ba563c Cosmin Tanislav 2022-02-06  163  	struct regulator_bulk_data=
	regulators[2];
598203f0ba563c Cosmin Tanislav 2022-02-06  164  =

598203f0ba563c Cosmin Tanislav 2022-02-06  165  	/*
598203f0ba563c Cosmin Tanislav 2022-02-06  166  	 * Synchronize access to m=
embers of driver state, and ensure atomicity
598203f0ba563c Cosmin Tanislav 2022-02-06  167  	 * of consecutive regmap o=
perations.
598203f0ba563c Cosmin Tanislav 2022-02-06  168  	 */
598203f0ba563c Cosmin Tanislav 2022-02-06  169  	struct mutex		lock;
598203f0ba563c Cosmin Tanislav 2022-02-06  170  =

598203f0ba563c Cosmin Tanislav 2022-02-06  171  	enum adxl367_odr	odr;
598203f0ba563c Cosmin Tanislav 2022-02-06  172  	enum adxl367_range	range;
598203f0ba563c Cosmin Tanislav 2022-02-06  173  =

598203f0ba563c Cosmin Tanislav 2022-02-06  174  	unsigned int	act_threshold;
598203f0ba563c Cosmin Tanislav 2022-02-06  175  	unsigned int	act_time_ms;
598203f0ba563c Cosmin Tanislav 2022-02-06  176  	unsigned int	inact_thresho=
ld;
598203f0ba563c Cosmin Tanislav 2022-02-06  177  	unsigned int	inact_time_ms;
598203f0ba563c Cosmin Tanislav 2022-02-06  178  =

598203f0ba563c Cosmin Tanislav 2022-02-06  179  	unsigned int	fifo_set_size;
598203f0ba563c Cosmin Tanislav 2022-02-06  180  	unsigned int	fifo_watermar=
k;
598203f0ba563c Cosmin Tanislav 2022-02-06  181  =

598203f0ba563c Cosmin Tanislav 2022-02-06  182  	__be16		fifo_buf[ADXL367_F=
IFO_SIZE] ____cacheline_aligned;
598203f0ba563c Cosmin Tanislav 2022-02-06  183  	__be16		sample_buf;
598203f0ba563c Cosmin Tanislav 2022-02-06  184  	u8		act_threshold_buf[2];
598203f0ba563c Cosmin Tanislav 2022-02-06  185  	u8		inact_time_buf[2];
598203f0ba563c Cosmin Tanislav 2022-02-06  186  	u8		status_buf[3];
598203f0ba563c Cosmin Tanislav 2022-02-06  187  };
598203f0ba563c Cosmin Tanislav 2022-02-06  188  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7275752375089496324==--

