Content-Type: multipart/mixed; boundary="===============6513997857136687334=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/ceph/messenger_v2.c:370:9: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Wed, 08 Dec 2021 08:51:52 +0800
Message-ID: <202112080801.YmDXWRX6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6513997857136687334==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ilya Dryomov <idryomov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   cd8c917a56f20f48748dd43d9ae3caff51d5b987
commit: cd1a677cad994021b19665ed476aea63f5d54f31 libceph, ceph: implement m=
sgr2.1 protocol (crc and secure modes)
date:   12 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 12 months ago
config: riscv-randconfig-c006-20211207 (https://download.01.org/0day-ci/arc=
hive/20211208/202112080801.YmDXWRX6-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dcd1a677cad994021b19665ed476aea63f5d54f31
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout cd1a677cad994021b19665ed476aea63f5d54f31
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^~~~~~~~~~~~~~~~~~~
   net/rds/message.c:176:7: note: Assuming the condition is false
           WARN(!refcount_read(&rm->m_refcount), "danger refcount zero on %=
p\n", rm);
                ^
   include/asm-generic/bug.h:195:25: note: expanded from macro 'WARN'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   net/rds/message.c:176:2: note: Taking false branch
           WARN(!refcount_read(&rm->m_refcount), "danger refcount zero on %=
p\n", rm);
           ^
   include/asm-generic/bug.h:196:2: note: expanded from macro 'WARN'
           no_printk(format);                                              \
           ^
   include/linux/printk.h:139:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   net/rds/message.c:177:2: note: Taking true branch
           if (refcount_dec_and_test(&rm->m_refcount)) {
           ^
   net/rds/message.c:178:3: note: Assuming the condition is false
                   BUG_ON(!list_empty(&rm->m_sock_item));
                   ^
   include/asm-generic/bug.h:183:36: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/rds/message.c:178:3: note: Taking false branch
                   BUG_ON(!list_empty(&rm->m_sock_item));
                   ^
   include/asm-generic/bug.h:183:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   net/rds/message.c:178:3: note: Loop condition is false.  Exiting loop
                   BUG_ON(!list_empty(&rm->m_sock_item));
                   ^
   include/asm-generic/bug.h:183:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   net/rds/message.c:179:3: note: Assuming the condition is false
                   BUG_ON(!list_empty(&rm->m_conn_item));
                   ^
   include/asm-generic/bug.h:183:36: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/rds/message.c:179:3: note: Taking false branch
                   BUG_ON(!list_empty(&rm->m_conn_item));
                   ^
   include/asm-generic/bug.h:183:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   net/rds/message.c:179:3: note: Loop condition is false.  Exiting loop
                   BUG_ON(!list_empty(&rm->m_conn_item));
                   ^
   include/asm-generic/bug.h:183:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   net/rds/message.c:182:3: note: Memory is released
                   kfree(rm);
                   ^~~~~~~~~
   net/rds/message.c:350:3: note: Returning; memory was released via 1st pa=
rameter
                   rds_message_put(rm);
                   ^~~~~~~~~~~~~~~~~~~
   net/rds/message.c:351:19: note: Use of memory after it is freed
                   return ERR_CAST(rm->data.op_sg);
                                   ^~~~~~~~~~~~~~
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   sound/soc/codecs/cs42l73.c:1329:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_read(cs42l73->regmap, CS42L73_DEVID_AB, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs42l73.c:1329:2: note: Value stored to 'ret' is never =
read
           ret =3D regmap_read(cs42l73->regmap, CS42L73_DEVID_AB, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs42l73.c:1332:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_read(cs42l73->regmap, CS42L73_DEVID_CD, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs42l73.c:1332:2: note: Value stored to 'ret' is never =
read
           ret =3D regmap_read(cs42l73->regmap, CS42L73_DEVID_CD, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs42l73.c:1335:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_read(cs42l73->regmap, CS42L73_DEVID_E, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs42l73.c:1335:2: note: Value stored to 'ret' is never =
read
           ret =3D regmap_read(cs42l73->regmap, CS42L73_DEVID_E, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> net/ceph/messenger_v2.c:370:9: warning: Dereference of null pointer [cla=
ng-analyzer-core.NullDereference]
           return le32_to_cpu(msg->hdr.data_len);
                  ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:34:50: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                    ^
   net/ceph/messenger_v2.c:3031:2: note: Taking false branch
           dout("%s con %p state %d have %zu\n", __func__, con, con->state,
           ^
   include/linux/ceph/ceph_debug.h:25:3: note: expanded from macro 'dout'
                   if (0)                                          \
                   ^
   net/ceph/messenger_v2.c:3031:2: note: Loop condition is false.  Exiting =
loop
           dout("%s con %p state %d have %zu\n", __func__, con, con->state,
           ^
   include/linux/ceph/ceph_debug.h:24:26: note: expanded from macro 'dout'
   #  define dout(fmt, ...)        do {                            \
                                   ^
   net/ceph/messenger_v2.c:3035:6: note: Assuming field 'state' is not equa=
l to CEPH_CON_S_PREOPEN
           if (con->state =3D=3D CEPH_CON_S_PREOPEN) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ceph/messenger_v2.c:3035:2: note: Taking false branch
           if (con->state =3D=3D CEPH_CON_S_PREOPEN) {
           ^
   net/ceph/messenger_v2.c:3070:6: note: Assuming the condition is true
           if (!iov_iter_count(&con->v2.out_iter)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ceph/messenger_v2.c:3070:2: note: Taking true branch
           if (!iov_iter_count(&con->v2.out_iter)) {
           ^
   net/ceph/messenger_v2.c:3071:9: note: Calling 'populate_out_iter'
                   ret =3D populate_out_iter(con);
                         ^~~~~~~~~~~~~~~~~~~~~~
   net/ceph/messenger_v2.c:2953:2: note: Taking false branch
           dout("%s con %p state %d out_state %d\n", __func__, con, con->st=
ate,
           ^
   include/linux/ceph/ceph_debug.h:25:3: note: expanded from macro 'dout'
                   if (0)                                          \
                   ^
   net/ceph/messenger_v2.c:2953:2: note: Loop condition is false.  Exiting =
loop
           dout("%s con %p state %d out_state %d\n", __func__, con, con->st=
ate,
           ^
   include/linux/ceph/ceph_debug.h:24:26: note: expanded from macro 'dout'
   #  define dout(fmt, ...)        do {                            \
                                   ^
   net/ceph/messenger_v2.c:2957:6: note: Assuming field 'state' is equal to=
 CEPH_CON_S_OPEN
           if (con->state !=3D CEPH_CON_S_OPEN) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ceph/messenger_v2.c:2957:2: note: Taking false branch
           if (con->state !=3D CEPH_CON_S_OPEN) {
           ^
   net/ceph/messenger_v2.c:2963:2: note: Control jumps to 'case 1:'  at lin=
e 2964
           switch (con->v2.out_state) {
           ^
   net/ceph/messenger_v2.c:2965:11: note: Assuming field 'out_msg' is null
                   WARN_ON(!con->out_msg);
                           ^
   include/asm-generic/bug.h:188:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   net/ceph/messenger_v2.c:2966:3: note: Calling 'queue_data'
                   queue_data(con);
                   ^~~~~~~~~~~~~~~
   net/ceph/messenger_v2.c:2846:16: note: Passing null pointer value via 1s=
t parameter 'msg'
                                     data_len(con->out_msg));
                                              ^~~~~~~~~~~~
   net/ceph/messenger_v2.c:2846:7: note: Calling 'data_len'
                                     data_len(con->out_msg));
                                     ^~~~~~~~~~~~~~~~~~~~~~
   net/ceph/messenger_v2.c:370:9: note: Dereference of null pointer
           return le32_to_cpu(msg->hdr.data_len);
                  ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:34:50: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                    ^~~
   net/ceph/messenger_v2.c:2538:10: warning: Access to field 'con' results =
in a dereference of a null pointer (loaded from field 'in_msg') [clang-anal=
yzer-core.NullDereference]
           WARN_ON(con->in_msg->con !=3D con);
                   ^
   net/ceph/messenger_v2.c:2812:2: note: Taking false branch
           dout("%s con %p state %d need %zu\n", __func__, con, con->state,
           ^
   include/linux/ceph/ceph_debug.h:25:3: note: expanded from macro 'dout'
                   if (0)                                          \
                   ^
   net/ceph/messenger_v2.c:2812:2: note: Loop condition is false.  Exiting =
loop
           dout("%s con %p state %d need %zu\n", __func__, con, con->state,
           ^
   include/linux/ceph/ceph_debug.h:24:26: note: expanded from macro 'dout'
   #  define dout(fmt, ...)        do {                            \
                                   ^
   net/ceph/messenger_v2.c:2815:6: note: Assuming field 'state' is not equa=
l to CEPH_CON_S_PREOPEN
           if (con->state =3D=3D CEPH_CON_S_PREOPEN)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ceph/messenger_v2.c:2815:2: note: Taking false branch
           if (con->state =3D=3D CEPH_CON_S_PREOPEN)

vim +370 net/ceph/messenger_v2.c

cd1a677cad9940 Ilya Dryomov 2020-11-19  367  =

cd1a677cad9940 Ilya Dryomov 2020-11-19  368  static int data_len(const stru=
ct ceph_msg *msg)
cd1a677cad9940 Ilya Dryomov 2020-11-19  369  {
cd1a677cad9940 Ilya Dryomov 2020-11-19 @370  	return le32_to_cpu(msg->hdr.d=
ata_len);
cd1a677cad9940 Ilya Dryomov 2020-11-19  371  }
cd1a677cad9940 Ilya Dryomov 2020-11-19  372  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6513997857136687334==--

