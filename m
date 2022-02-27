Content-Type: multipart/mixed; boundary="===============4791942494485966627=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/i2c/hi846.c:1494:21: warning: Value stored to 'client' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 27 Feb 2022 12:25:02 +0800
Message-ID: <202202271220.9j3Zc95k-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4791942494485966627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Martin Kepplinger <martin.kepplinger@puri.sm>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Pavel Machek <pavel@ucw.cz>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2293be58d6a18cab800e25e42081bacb75c05752
commit: e8c0882685f9152f0d729664a12bcbe749cb7736 media: i2c: add driver for=
 the SK Hynix Hi-846 8M pixel camera
date:   5 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 5 months ago
config: riscv-randconfig-c006-20220222 (https://download.01.org/0day-ci/arc=
hive/20220227/202202271220.9j3Zc95k-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c0882685f9152f0d729664a12bcbe749cb7736
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c0882685f9152f0d729664a12bcbe749cb7736
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
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
   drivers/scsi/mpi3mr/mpi3mr_os.c:1393:16: note: Loop condition is false. =
 Exiting loop
                   _rmhs_node =3D list_entry(mrioc->delayed_rmhs_list.next,
                                ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
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
   drivers/scsi/mpi3mr/mpi3mr_os.c:1396:3: note: Memory is released
                   kfree(_rmhs_node);
                   ^~~~~~~~~~~~~~~~~
   drivers/scsi/mpi3mr/mpi3mr_os.c:1392:2: note: Loop condition is true.  E=
ntering loop body
           while (!list_empty(&mrioc->delayed_rmhs_list)) {
           ^
   drivers/scsi/mpi3mr/mpi3mr_os.c:1393:16: note: Left side of '&&' is false
                   _rmhs_node =3D list_entry(mrioc->delayed_rmhs_list.next,
                                ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/scsi/mpi3mr/mpi3mr_os.c:1393:16: note: Taking false branch
                   _rmhs_node =3D list_entry(mrioc->delayed_rmhs_list.next,
                                ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
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
   drivers/scsi/mpi3mr/mpi3mr_os.c:1393:16: note: Loop condition is false. =
 Exiting loop
                   _rmhs_node =3D list_entry(mrioc->delayed_rmhs_list.next,
                                ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
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
   drivers/scsi/mpi3mr/mpi3mr_os.c:1395:3: note: Calling 'list_del'
                   list_del(&_rmhs_node->list);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:147:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
>> drivers/media/i2c/hi846.c:1494:21: warning: Value stored to 'client' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D v4l2_get_subdevdata(&hi846->sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/hi846.c:1494:21: note: Value stored to 'client' during=
 its initialization is never read
           struct i2c_client *client =3D v4l2_get_subdevdata(&hi846->sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/hi846.c:1764:2: warning: Value stored to 'tgt_fps' is =
never read [clang-analyzer-deadcode.DeadStores]
           tgt_fps =3D hi846->cur_mode->fps;
           ^         ~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/hi846.c:1764:2: note: Value stored to 'tgt_fps' is nev=
er read
           tgt_fps =3D hi846->cur_mode->fps;
           ^         ~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/hi846.c:1805:21: warning: Value stored to 'client' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/hi846.c:1805:21: note: Value stored to 'client' during=
 its initialization is never read
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/media/i2c/imx258.c:781:3: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   ret =3D imx258_write_reg(imx258, IMX258_REG_TEST_PATTERN,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/imx258.c:781:3: note: Value stored to 'ret' is never r=
ead
                   ret =3D imx258_write_reg(imx258, IMX258_REG_TEST_PATTERN,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/media/i2c/imx274.c:955:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &imx274->client->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/imx274.c:955:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D &imx274->client->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/imx274.c:1014:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &imx274->client->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/imx274.c:1014:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D &imx274->client->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/media/tuners/fc2580.c:30:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/fc2580.c:30:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/fc2580.c:277:21: warning: Value stored to 'client' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/fc2580.c:277:21: note: Value stored to 'client' dur=
ing its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/fc2580.c:298:21: warning: Value stored to 'client' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/fc2580.c:298:21: note: Value stored to 'client' dur=
ing its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/fc2580.c:391:21: warning: Value stored to 'client' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/fc2580.c:391:21: note: Value stored to 'client' dur=
ing its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/fc2580.c:406:21: warning: Value stored to 'client' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/fc2580.c:406:21: note: Value stored to 'client' dur=
ing its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/fc2580.c:415:21: warning: Value stored to 'client' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/fc2580.c:415:21: note: Value stored to 'client' dur=
ing its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/fc2580.c:426:21: warning: Value stored to 'client' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/fc2580.c:426:21: note: Value stored to 'client' dur=
ing its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/fc2580.c:440:21: warning: Value stored to 'client' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/fc2580.c:440:21: note: Value stored to 'client' dur=
ing its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/fc2580.c:470:21: warning: Value stored to 'client' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/fc2580.c:470:21: note: Value stored to 'client' dur=
ing its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/client +1494 drivers/media/i2c/hi846.c

e8c0882685f915 Martin Kepplinger 2021-09-06  1491  =

e8c0882685f915 Martin Kepplinger 2021-09-06  1492  static int hi846_set_vid=
eo_mode(struct hi846 *hi846, int fps)
e8c0882685f915 Martin Kepplinger 2021-09-06  1493  {
e8c0882685f915 Martin Kepplinger 2021-09-06 @1494  	struct i2c_client *clie=
nt =3D v4l2_get_subdevdata(&hi846->sd);
e8c0882685f915 Martin Kepplinger 2021-09-06  1495  	u64 frame_length;
e8c0882685f915 Martin Kepplinger 2021-09-06  1496  	int ret =3D 0;
e8c0882685f915 Martin Kepplinger 2021-09-06  1497  	int dummy_lines;
e8c0882685f915 Martin Kepplinger 2021-09-06  1498  	u64 link_freq =3D hi846=
_get_link_freq(hi846);
e8c0882685f915 Martin Kepplinger 2021-09-06  1499  =

e8c0882685f915 Martin Kepplinger 2021-09-06  1500  	dev_dbg(&client->dev, "=
%s: link freq: %llu\n", __func__,
e8c0882685f915 Martin Kepplinger 2021-09-06  1501  		hi846_get_link_freq(hi=
846));
e8c0882685f915 Martin Kepplinger 2021-09-06  1502  =

e8c0882685f915 Martin Kepplinger 2021-09-06  1503  	do_div(link_freq, fps);
e8c0882685f915 Martin Kepplinger 2021-09-06  1504  	frame_length =3D link_f=
req;
e8c0882685f915 Martin Kepplinger 2021-09-06  1505  	do_div(frame_length, HI=
846_LINE_LENGTH);
e8c0882685f915 Martin Kepplinger 2021-09-06  1506  =

e8c0882685f915 Martin Kepplinger 2021-09-06  1507  	dummy_lines =3D (frame_=
length > hi846->cur_mode->frame_len) ?
e8c0882685f915 Martin Kepplinger 2021-09-06  1508  			(frame_length - hi846=
->cur_mode->frame_len) : 0;
e8c0882685f915 Martin Kepplinger 2021-09-06  1509  =

e8c0882685f915 Martin Kepplinger 2021-09-06  1510  	frame_length =3D hi846-=
>cur_mode->frame_len + dummy_lines;
e8c0882685f915 Martin Kepplinger 2021-09-06  1511  =

e8c0882685f915 Martin Kepplinger 2021-09-06  1512  	dev_dbg(&client->dev, "=
%s: frame length calculated: %llu\n", __func__,
e8c0882685f915 Martin Kepplinger 2021-09-06  1513  		frame_length);
e8c0882685f915 Martin Kepplinger 2021-09-06  1514  =

e8c0882685f915 Martin Kepplinger 2021-09-06  1515  	hi846_write_reg_16(hi84=
6, HI846_REG_FLL, frame_length & 0xFFFF, &ret);
e8c0882685f915 Martin Kepplinger 2021-09-06  1516  	hi846_write_reg_16(hi84=
6, HI846_REG_LLP,
e8c0882685f915 Martin Kepplinger 2021-09-06  1517  			   HI846_LINE_LENGTH =
& 0xFFFF, &ret);
e8c0882685f915 Martin Kepplinger 2021-09-06  1518  =

e8c0882685f915 Martin Kepplinger 2021-09-06  1519  	return ret;
e8c0882685f915 Martin Kepplinger 2021-09-06  1520  }
e8c0882685f915 Martin Kepplinger 2021-09-06  1521  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4791942494485966627==--

