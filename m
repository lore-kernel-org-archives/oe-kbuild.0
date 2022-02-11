Content-Type: multipart/mixed; boundary="===============8767801121818546538=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 5/5] iio: accel: add ADXL367 driver
Date: Sat, 12 Feb 2022 03:42:05 +0800
Message-ID: <202202120337.rqmB1dvB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8767801121818546538==
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
[also build test WARNING on robh/for-next linus/master v5.17-rc3 next-20220=
211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Cosmin-Tanislav/Add-ADXL36=
7-driver/20220207-051424
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-c002-20220209 (https://download.01.org/0day-ci/archi=
ve/20220212/202202120337.rqmB1dvB-lkp(a)intel.com/config)
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
   drivers/crypto/caam/caamalg.c:1505:2: note: 3rd function call argument i=
s an uninitialized value
           init_authenc_job(req, edesc, all_contig, encrypt);
           ^                            ~~~~~~~~~~
   drivers/crypto/caam/caamalg.c:1561:2: warning: 3rd function call argumen=
t is an uninitialized value [clang-analyzer-core.CallAndMessage]
           init_gcm_job(req, edesc, all_contig, encrypt);
           ^
   drivers/crypto/caam/caamalg.c:1587:9: note: '?' condition is false
           return crypto_ipsec_check_assoclen(req->assoclen) ? : gcm_decryp=
t(req);
                  ^
   drivers/crypto/caam/caamalg.c:1587:56: note: Calling 'gcm_decrypt'
           return crypto_ipsec_check_assoclen(req->assoclen) ? : gcm_decryp=
t(req);
                                                                 ^~~~~~~~~~=
~~~~~~
   drivers/crypto/caam/caamalg.c:1577:9: note: Calling 'gcm_crypt'
           return gcm_crypt(req, false);
                  ^~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/caam/caamalg.c:1552:2: note: 'all_contig' declared withou=
t an initial value
           bool all_contig;
           ^~~~~~~~~~~~~~~
   drivers/crypto/caam/caamalg.c:1555:10: note: Calling 'aead_edesc_alloc'
           edesc =3D aead_edesc_alloc(req, GCM_DESC_JOB_IO_LEN, &all_contig,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/caam/caamalg.c:1296:17: note: Assuming the condition is t=
rue
           gfp_t flags =3D (req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP) ?
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/caam/caamalg.c:1296:16: note: '?' condition is true
           gfp_t flags =3D (req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP) ?
                         ^
   drivers/crypto/caam/caamalg.c:1304:15: note: Assuming field 'dst' is equ=
al to field 'src'
           if (unlikely(req->dst !=3D req->src)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/crypto/caam/caamalg.c:1304:2: note: Taking false branch
           if (unlikely(req->dst !=3D req->src)) {
           ^
   drivers/crypto/caam/caamalg.c:1323:7: note: 'encrypt' is false
                             (encrypt ? authsize : 0);
                              ^~~~~~~
   drivers/crypto/caam/caamalg.c:1323:7: note: '?' condition is false
   drivers/crypto/caam/caamalg.c:1326:16: note: Assuming 'src_nents' is < 0
                   if (unlikely(src_nents < 0)) {
                                ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/crypto/caam/caamalg.c:1326:3: note: Taking true branch
                   if (unlikely(src_nents < 0)) {
                   ^
   drivers/crypto/caam/caamalg.c:1327:4: note: Loop condition is false.  Ex=
iting loop
                           dev_err(jrdev, "Insufficient bytes (%d) in src S=
/G\n",
                           ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:417:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:396:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/crypto/caam/caamalg.c:1329:4: note: Returning without writing to=
 '*all_contig_ptr'
                           return ERR_PTR(src_nents);
                           ^
   drivers/crypto/caam/caamalg.c:1555:10: note: Returning from 'aead_edesc_=
alloc'
           edesc =3D aead_edesc_alloc(req, GCM_DESC_JOB_IO_LEN, &all_contig,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/caam/caamalg.c:1557:6: note: Calling 'IS_ERR'
           if (IS_ERR(edesc))
               ^~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/caam/caamalg.c:1557:6: note: Returning from 'IS_ERR'
           if (IS_ERR(edesc))
               ^~~~~~~~~~~~~
   drivers/crypto/caam/caamalg.c:1557:2: note: Taking false branch
           if (IS_ERR(edesc))
           ^
   drivers/crypto/caam/caamalg.c:1561:2: note: 3rd function call argument i=
s an uninitialized value
           init_gcm_job(req, edesc, all_contig, encrypt);
           ^                        ~~~~~~~~~~
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
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
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   net/vmw_vsock/virtio_transport_common.c:437:20: note: '?' condition is f=
alse
                           bytes_to_copy =3D min(user_buf_len, pkt_len);
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
   net/vmw_vsock/virtio_transport_common.c:439:8: note: Assuming 'bytes_to_=
copy' is not equal to 0
                           if (bytes_to_copy) {
                               ^~~~~~~~~~~~~
   net/vmw_vsock/virtio_transport_common.c:439:4: note: Taking true branch
                           if (bytes_to_copy) {
                           ^
   net/vmw_vsock/virtio_transport_common.c:448:9: note: 'err' is -14
                                   if (err) {
                                       ^~~
   net/vmw_vsock/virtio_transport_common.c:448:5: note: Taking true branch
                                   if (err) {
                                   ^
   net/vmw_vsock/virtio_transport_common.c:460:8: note: 'dequeued_len' is <=
 0
                           if (dequeued_len >=3D 0)
                               ^~~~~~~~~~~~
   net/vmw_vsock/virtio_transport_common.c:460:4: note: Taking false branch
                           if (dequeued_len >=3D 0)
                           ^
   net/vmw_vsock/virtio_transport_common.c:464:7: note: Assuming the condit=
ion is false
                   if (le32_to_cpu(pkt->hdr.flags) & VIRTIO_VSOCK_SEQ_EOM) {
                       ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:34:26: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                            ^
   net/vmw_vsock/virtio_transport_common.c:464:3: note: Taking false branch
                   if (le32_to_cpu(pkt->hdr.flags) & VIRTIO_VSOCK_SEQ_EOM) {
                   ^
   net/vmw_vsock/virtio_transport_common.c:429:2: note: Loop condition is t=
rue.  Entering loop body
           while (!msg_ready) {
           ^
   net/vmw_vsock/virtio_transport_common.c:432:7: note: 'dequeued_len' is <=
 0
                   if (dequeued_len >=3D 0) {
                       ^~~~~~~~~~~~
   net/vmw_vsock/virtio_transport_common.c:432:3: note: Taking false branch
                   if (dequeued_len >=3D 0) {
                   ^
   net/vmw_vsock/virtio_transport_common.c:464:7: note: Assuming the condit=
ion is false
                   if (le32_to_cpu(pkt->hdr.flags) & VIRTIO_VSOCK_SEQ_EOM) {
                       ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:34:26: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                            ^
   net/vmw_vsock/virtio_transport_common.c:464:3: note: Taking false branch
                   if (le32_to_cpu(pkt->hdr.flags) & VIRTIO_VSOCK_SEQ_EOM) {
                   ^
   net/vmw_vsock/virtio_transport_common.c:474:3: note: Calling 'virtio_tra=
nsport_free_pkt'
                   virtio_transport_free_pkt(pkt);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/vmw_vsock/virtio_transport_common.c:1345:2: note: Memory is released
           kfree(pkt);
           ^~~~~~~~~~
   net/vmw_vsock/virtio_transport_common.c:474:3: note: Returning; memory w=
as released
                   virtio_transport_free_pkt(pkt);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/vmw_vsock/virtio_transport_common.c:429:2: note: Loop condition is t=
rue.  Entering loop body
           while (!msg_ready) {
           ^
   net/vmw_vsock/virtio_transport_common.c:432:7: note: 'dequeued_len' is <=
 0
                   if (dequeued_len >=3D 0) {
                       ^~~~~~~~~~~~
   net/vmw_vsock/virtio_transport_common.c:432:3: note: Taking false branch
                   if (dequeued_len >=3D 0) {
                   ^
   net/vmw_vsock/virtio_transport_common.c:464:7: note: Use of memory after=
 it is freed
                   if (le32_to_cpu(pkt->hdr.flags) & VIRTIO_VSOCK_SEQ_EOM) {
                       ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:34:50: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                    ^~~
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
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
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
   2 warnings generated.
   net/decnet/dn_nsp_in.c:763:3: warning: Value stored to 'ptr' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                   ptr +=3D 2;
                   ^      ~
   net/decnet/dn_nsp_in.c:763:3: note: Value stored to 'ptr' is never read
                   ptr +=3D 2;
                   ^      ~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   net/decnet/dn_route.c:827:20: warning: Value stored to 'cb' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           struct dn_skb_cb *cb =3D DN_SKB_CB(skb);
                             ^~
   net/decnet/dn_route.c:827:20: note: Value stored to 'cb' during its init=
ialization is never read
           struct dn_skb_cb *cb =3D DN_SKB_CB(skb);
                             ^~
   net/decnet/dn_route.c:839:20: warning: Value stored to 'cb' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           struct dn_skb_cb *cb =3D DN_SKB_CB(skb);
                             ^~
   net/decnet/dn_route.c:839:20: note: Value stored to 'cb' during its init=
ialization is never read
           struct dn_skb_cb *cb =3D DN_SKB_CB(skb);
                             ^~
   net/decnet/dn_route.c:890:39: warning: Access to field 'mtu' results in =
a dereference of a null pointer (loaded from field 'dev') [clang-analyzer-c=
ore.NullDereference]
           if (dst_metric(&rt->dst, RTAX_MTU) > rt->dst.dev->mtu)
                                                ^
   net/decnet/dn_route.c:1646:6: note: Assuming the condition is false
           if (!net_eq(net, &init_net))
               ^~~~~~~~~~~~~~~~~~~~~~~
   net/decnet/dn_route.c:1646:2: note: Taking false branch
           if (!net_eq(net, &init_net))
           ^
   net/decnet/dn_route.c:1651:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/decnet/dn_route.c:1651:2: note: Taking false branch
           if (err < 0)
           ^
   net/decnet/dn_route.c:1658:6: note: Assuming 'skb' is not equal to NULL
           if (skb =3D=3D NULL)
               ^~~~~~~~~~~
   net/decnet/dn_route.c:1658:2: note: Taking false branch
           if (skb =3D=3D NULL)
           ^
   net/decnet/dn_route.c:1663:6: note: Assuming the condition is true
           if (tb[RTA_SRC])
               ^~~~~~~~~~~
   net/decnet/dn_route.c:1663:2: note: Taking true branch
           if (tb[RTA_SRC])
           ^
   net/decnet/dn_route.c:1666:6: note: Assuming the condition is false
           if (tb[RTA_DST])

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
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============8767801121818546538==--

