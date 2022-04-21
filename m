Content-Type: multipart/mixed; boundary="===============6551397759585192688=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wwan/wwan_hwsim.c:286:3: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Thu, 21 Apr 2022 18:24:09 +0800
Message-ID: <202204211832.eLvuxvUr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6551397759585192688==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Loic Poulain <loic.poulain@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b253435746d9a4a701b5f09211b9c14d3370d0da
commit: 89212e160b81e778f829b89743570665810e3b13 net: wwan: Fix WWAN config=
 symbols
date:   10 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220417 (https://download.01.org/0day-ci/archi=
ve/20220421/202204211832.eLvuxvUr-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 64c045=
e25b8471bbb572bd29159c294a82a86a25)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D89212e160b81e778f829b89743570665810e3b13
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 89212e160b81e778f829b89743570665810e3b13
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/iio/pressure/icp10100.c:114:6: note: Assuming 'ret' is equal to =
'num'
           if (ret !=3D num)
               ^~~~~~~~~~
   drivers/iio/pressure/icp10100.c:114:2: note: Taking false branch
           if (ret !=3D num)
           ^
   drivers/iio/pressure/icp10100.c:117:2: note: Returning zero, which parti=
cipates in a condition later
           return 0;
           ^~~~~~~~
   drivers/iio/pressure/icp10100.c:156:9: note: Returning from 'icp10100_i2=
c_xfer'
                   ret =3D icp10100_i2c_xfer(st->client->adapter, msgs,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/pressure/icp10100.c:158:7: note: 'ret' is 0
                   if (ret)
                       ^~~
   drivers/iio/pressure/icp10100.c:158:3: note: Taking false branch
                   if (ret)
                   ^
   drivers/iio/pressure/icp10100.c:178:14: note: Assuming 'i' is < field 'r=
esponse_word_nb'
           for (i =3D 0; i < cmd->response_word_nb; ++i) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/pressure/icp10100.c:178:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < cmd->response_word_nb; ++i) {
           ^
   drivers/iio/pressure/icp10100.c:182:7: note: Assuming the condition is f=
alse
                   if (crc !=3D ptr[ICP10100_CRC8_WORD_LENGTH]) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/pressure/icp10100.c:182:3: note: Taking false branch
                   if (crc !=3D ptr[ICP10100_CRC8_WORD_LENGTH]) {
                   ^
   drivers/iio/pressure/icp10100.c:178:14: note: Assuming 'i' is < field 'r=
esponse_word_nb'
           for (i =3D 0; i < cmd->response_word_nb; ++i) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/pressure/icp10100.c:178:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < cmd->response_word_nb; ++i) {
           ^
   drivers/iio/pressure/icp10100.c:182:7: note: Assuming the condition is f=
alse
                   if (crc !=3D ptr[ICP10100_CRC8_WORD_LENGTH]) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/pressure/icp10100.c:182:3: note: Taking false branch
                   if (crc !=3D ptr[ICP10100_CRC8_WORD_LENGTH]) {
                   ^
   drivers/iio/pressure/icp10100.c:178:14: note: Assuming 'i' is >=3D field=
 'response_word_nb'
           for (i =3D 0; i < cmd->response_word_nb; ++i) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/pressure/icp10100.c:178:2: note: Loop condition is false. Ex=
ecution continues on line 191
           for (i =3D 0; i < cmd->response_word_nb; ++i) {
           ^
   drivers/iio/pressure/icp10100.c:191:2: note: Returning zero, which parti=
cipates in a condition later
           return 0;
           ^~~~~~~~
   drivers/iio/pressure/icp10100.c:257:8: note: Returning from 'icp10100_se=
nd_cmd'
           ret =3D icp10100_send_cmd(st, cmd, measures, sizeof(measures));
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/pressure/icp10100.c:259:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/iio/pressure/icp10100.c:259:2: note: Taking false branch
           if (ret)
           ^
   drivers/iio/pressure/icp10100.c:264:17: note: 1st function call argument=
 is an uninitialized value
           *temperature =3D be16_to_cpu(measures[2]);
                          ^
   include/linux/byteorder/generic.h:97:21: note: expanded from macro 'be16=
_to_cpu'
   #define be16_to_cpu __be16_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:42:26: note: expanded from =
macro '__be16_to_cpu'
   #define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/swab.h:102:28: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                              ^                 ~~~~~~~~~~
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
   3 warnings generated.
>> drivers/net/wwan/wwan_hwsim.c:286:3: warning: Use of memory after it is =
freed [clang-analyzer-unix.Malloc]
                   wwan_hwsim_port_del(port);
                   ^
   drivers/net/wwan/wwan_hwsim.c:489:2: note: Calling 'wwan_hwsim_free_devs'
           wwan_hwsim_free_devs();
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wwan/wwan_hwsim.c:444:2: note: Loop condition is true.  Ente=
ring loop body
           while (!list_empty(&wwan_hwsim_devs)) {
           ^
   drivers/net/wwan/wwan_hwsim.c:445:9: note: Left side of '&&' is false
                   dev =3D list_first_entry(&wwan_hwsim_devs, struct wwan_h=
wsim_dev,
                         ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:716:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/net/wwan/wwan_hwsim.c:445:9: note: Taking false branch
                   dev =3D list_first_entry(&wwan_hwsim_devs, struct wwan_h=
wsim_dev,
                         ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:716:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
   drivers/net/wwan/wwan_hwsim.c:445:9: note: Loop condition is false.  Exi=
ting loop
                   dev =3D list_first_entry(&wwan_hwsim_devs, struct wwan_h=
wsim_dev,
                         ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:716:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
   drivers/net/wwan/wwan_hwsim.c:449:3: note: Calling 'wwan_hwsim_dev_del'
                   wwan_hwsim_dev_del(dev);
                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wwan/wwan_hwsim.c:279:2: note: Loop condition is true.  Ente=
ring loop body
           while (!list_empty(&dev->ports)) {
           ^
   drivers/net/wwan/wwan_hwsim.c:282:10: note: Left side of '&&' is false
                   port =3D list_first_entry(&dev->ports, struct wwan_hwsim=
_port,
                          ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:716:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/net/wwan/wwan_hwsim.c:282:10: note: Taking false branch
                   port =3D list_first_entry(&dev->ports, struct wwan_hwsim=
_port,
                          ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:716:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)

vim +286 drivers/net/wwan/wwan_hwsim.c

f36a111a74e71ed Sergey Ryazanov 2021-06-08  273  =

f36a111a74e71ed Sergey Ryazanov 2021-06-08  274  static void wwan_hwsim_dev=
_del(struct wwan_hwsim_dev *dev)
f36a111a74e71ed Sergey Ryazanov 2021-06-08  275  {
9ee23f48f6705ff Sergey Ryazanov 2021-06-08  276  	debugfs_remove(dev->debug=
fs_portcreate);	/* Avoid new ports */
9ee23f48f6705ff Sergey Ryazanov 2021-06-08  277  =

f36a111a74e71ed Sergey Ryazanov 2021-06-08  278  	spin_lock(&dev->ports_loc=
k);
f36a111a74e71ed Sergey Ryazanov 2021-06-08  279  	while (!list_empty(&dev->=
ports)) {
f36a111a74e71ed Sergey Ryazanov 2021-06-08  280  		struct wwan_hwsim_port *=
port;
f36a111a74e71ed Sergey Ryazanov 2021-06-08  281  =

f36a111a74e71ed Sergey Ryazanov 2021-06-08  282  		port =3D list_first_entr=
y(&dev->ports, struct wwan_hwsim_port,
f36a111a74e71ed Sergey Ryazanov 2021-06-08  283  					list);
9ee23f48f6705ff Sergey Ryazanov 2021-06-08  284  		list_del_init(&port->lis=
t);
f36a111a74e71ed Sergey Ryazanov 2021-06-08  285  		spin_unlock(&dev->ports_=
lock);
f36a111a74e71ed Sergey Ryazanov 2021-06-08 @286  		wwan_hwsim_port_del(port=
);
f36a111a74e71ed Sergey Ryazanov 2021-06-08  287  		spin_lock(&dev->ports_lo=
ck);
f36a111a74e71ed Sergey Ryazanov 2021-06-08  288  	}
f36a111a74e71ed Sergey Ryazanov 2021-06-08  289  	spin_unlock(&dev->ports_l=
ock);
f36a111a74e71ed Sergey Ryazanov 2021-06-08  290  =

9ee23f48f6705ff Sergey Ryazanov 2021-06-08  291  	debugfs_remove(dev->debug=
fs_topdir);
9ee23f48f6705ff Sergey Ryazanov 2021-06-08  292  =

9ee23f48f6705ff Sergey Ryazanov 2021-06-08  293  	/* Make sure that there i=
s no pending deletion work */
9ee23f48f6705ff Sergey Ryazanov 2021-06-08  294  	if (current_work() !=3D &=
dev->del_work)
9ee23f48f6705ff Sergey Ryazanov 2021-06-08  295  		cancel_work_sync(&dev->d=
el_work);
9ee23f48f6705ff Sergey Ryazanov 2021-06-08  296  =

f36a111a74e71ed Sergey Ryazanov 2021-06-08  297  	device_unregister(&dev->d=
ev);
f36a111a74e71ed Sergey Ryazanov 2021-06-08  298  	/* Memory will be freed i=
n the device release callback */
f36a111a74e71ed Sergey Ryazanov 2021-06-08  299  }
f36a111a74e71ed Sergey Ryazanov 2021-06-08  300  =


:::::: The code at line 286 was first introduced by commit
:::::: f36a111a74e71edbba27d4c0cf3d7bbccc172108 wwan_hwsim: WWAN device sim=
ulator

:::::: TO: Sergey Ryazanov <ryazanov.s.a@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6551397759585192688==--

