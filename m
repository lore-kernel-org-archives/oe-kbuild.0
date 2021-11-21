Content-Type: multipart/mixed; boundary="===============6240758256007639401=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/i2c/ccs/ccs-core.c:105:21: warning: Value stored to 'client' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 21 Nov 2021 19:05:59 +0800
Message-ID: <202111211953.HqfhAsgU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6240758256007639401==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   923dcc5eb0c111eccd51cc7ce1658537e3c38b25
commit: b24cc2a18c50e4e315abc76a86b26b4c49652f79 media: smiapp: Rename as "=
ccs"
date:   12 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-c007-20211119 (attached as .config)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db24cc2a18c50e4e315abc76a86b26b4c49652f79
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b24cc2a18c50e4e315abc76a86b26b4c49652f79
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                      ^
   drivers/nvdimm/security.c:530:9: note: Taking false branch
           } else if (i =3D=3D OP_DISABLE) {
                  ^
   drivers/nvdimm/security.c:533:13: note: 'i' is not equal to OP_UPDATE
           } else if (i =3D=3D OP_UPDATE || i =3D=3D OP_MASTER_UPDATE) {
                      ^
   drivers/nvdimm/security.c:533:13: note: Left side of '||' is false
   drivers/nvdimm/security.c:533:31: note: 'i' is not equal to OP_MASTER_UP=
DATE
           } else if (i =3D=3D OP_UPDATE || i =3D=3D OP_MASTER_UPDATE) {
                                        ^
   drivers/nvdimm/security.c:533:9: note: Taking false branch
           } else if (i =3D=3D OP_UPDATE || i =3D=3D OP_MASTER_UPDATE) {
                  ^
   drivers/nvdimm/security.c:537:13: note: 'i' is equal to OP_ERASE
           } else if (i =3D=3D OP_ERASE || i =3D=3D OP_MASTER_ERASE) {
                      ^
   drivers/nvdimm/security.c:537:27: note: Left side of '||' is true
           } else if (i =3D=3D OP_ERASE || i =3D=3D OP_MASTER_ERASE) {
                                    ^
   drivers/nvdimm/security.c:538:3: note: Taking false branch
                   dev_dbg(dev, "%s %u\n", ops[i].name, key);
                   ^
   include/linux/dev_printk.h:130:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/nvdimm/security.c:539:7: note: Assuming the condition is false
                   if (atomic_read(&nvdimm->busy)) {
                       ^
   include/asm-generic/atomic-instrumented.h:30:21: note: expanded from mac=
ro 'atomic_read'
   #define atomic_read atomic_read
                       ^
   drivers/nvdimm/security.c:539:3: note: Taking false branch
                   if (atomic_read(&nvdimm->busy)) {
                   ^
   drivers/nvdimm/security.c:543:36: note: 'i' is equal to OP_ERASE
                   rc =3D security_erase(nvdimm, key, i =3D=3D OP_ERASE
                                                    ^
   drivers/nvdimm/security.c:543:36: note: '?' condition is true
   drivers/nvdimm/security.c:543:8: note: 2nd function call argument is an =
uninitialized value
                   rc =3D security_erase(nvdimm, key, i =3D=3D OP_ERASE
                        ^                      ~~~
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/i3c/device.c:221:10: warning: The left operand of '&' is a garba=
ge value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           manuf =3D I3C_PID_MANUF_ID(devinfo.pid);
                   ^
   include/linux/i3c/device.h:79:40: note: expanded from macro 'I3C_PID_MAN=
UF_ID'
   #define I3C_PID_MANUF_ID(pid)           (((pid) & GENMASK_ULL(47, 33)) >=
> 33)
                                              ~~~  ^
   drivers/i3c/device.c:219:2: note: Calling 'i3c_device_get_info'
           i3c_device_get_info(i3cdev, &devinfo);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/device.c:64:7: note: 'info' is non-null
           if (!info)
                ^~~~
   drivers/i3c/device.c:64:2: note: Taking false branch
           if (!info)
           ^
   drivers/i3c/device.c:68:6: note: Assuming field 'desc' is null
           if (dev->desc)
               ^~~~~~~~~
   drivers/i3c/device.c:68:2: note: Taking false branch
           if (dev->desc)
           ^
   drivers/i3c/device.c:71:1: note: Returning without writing to '->pid'
   }
   ^
   drivers/i3c/device.c:219:2: note: Returning from 'i3c_device_get_info'
           i3c_device_get_info(i3cdev, &devinfo);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/device.c:221:10: note: The left operand of '&' is a garbage =
value
           manuf =3D I3C_PID_MANUF_ID(devinfo.pid);
                   ^
   include/linux/i3c/device.h:79:40: note: expanded from macro 'I3C_PID_MAN=
UF_ID'
   #define I3C_PID_MANUF_ID(pid)           (((pid) & GENMASK_ULL(47, 33)) >=
> 33)
                                              ~~~  ^
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/i3c/master.c:555:32: warning: Value stored to 'master' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i3c_master_controller *master =3D i3c_bus_to_i3c_master(i=
3cbus);
                                         ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/i3c/master.c:555:32: note: Value stored to 'master' during its i=
nitialization is never read
           struct i3c_master_controller *master =3D i3c_bus_to_i3c_master(i=
3cbus);
                                         ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/i3c/master/i3c-master-cdns.c:1245:2: warning: Value stored to 'p=
rescl1' is never read [clang-analyzer-deadcode.DeadStores]
           prescl1 =3D PRESCL_CTRL1_OD_LOW(low);
           ^
   drivers/i3c/master/i3c-master-cdns.c:1245:2: note: Value stored to 'pres=
cl1' is never read
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
>> drivers/media/i2c/ccs/ccs-core.c:105:21: warning: Value stored to 'clien=
t' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct i2c_client *client =3D v4l2_get_subdevdata(&sensor->src->=
sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:105:21: note: Value stored to 'client' =
during its initialization is never read
           struct i2c_client *client =3D v4l2_get_subdevdata(&sensor->src->=
sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:230:21: warning: Value stored to 'clien=
t' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct i2c_client *client =3D v4l2_get_subdevdata(&sensor->src->=
sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:230:21: note: Value stored to 'client' =
during its initialization is never read
           struct i2c_client *client =3D v4l2_get_subdevdata(&sensor->src->=
sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/ccs/ccs-core.c:288:4: warning: Value stored to 'which'=
 is never read [clang-analyzer-deadcode.DeadStores]
                           which =3D "columns";
                           ^       ~~~~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:288:4: note: Value stored to 'which' is=
 never read
                           which =3D "columns";
                           ^       ~~~~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:290:4: warning: Value stored to 'which'=
 is never read [clang-analyzer-deadcode.DeadStores]
                           which =3D "rows";
                           ^       ~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:290:4: note: Value stored to 'which' is=
 never read
                           which =3D "rows";
                           ^       ~~~~~~
>> drivers/media/i2c/ccs/ccs-core.c:294:4: warning: Value stored to 'what' =
is never read [clang-analyzer-deadcode.DeadStores]
                           what =3D "embedded";
                           ^      ~~~~~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:294:4: note: Value stored to 'what' is =
never read
                           what =3D "embedded";
                           ^      ~~~~~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:297:4: warning: Value stored to 'what' =
is never read [clang-analyzer-deadcode.DeadStores]
                           what =3D "dummy";
                           ^      ~~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:297:4: note: Value stored to 'what' is =
never read
                           what =3D "dummy";
                           ^      ~~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:300:4: warning: Value stored to 'what' =
is never read [clang-analyzer-deadcode.DeadStores]
                           what =3D "black";
                           ^      ~~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:300:4: note: Value stored to 'what' is =
never read
                           what =3D "black";
                           ^      ~~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:303:4: warning: Value stored to 'what' =
is never read [clang-analyzer-deadcode.DeadStores]
                           what =3D "dark";
                           ^      ~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:303:4: note: Value stored to 'what' is =
never read
                           what =3D "dark";
                           ^      ~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:306:4: warning: Value stored to 'what' =
is never read [clang-analyzer-deadcode.DeadStores]
                           what =3D "visible";
                           ^      ~~~~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:306:4: note: Value stored to 'what' is =
never read
                           what =3D "visible";
                           ^      ~~~~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:309:4: warning: Value stored to 'what' =
is never read [clang-analyzer-deadcode.DeadStores]
                           what =3D "invalid";
                           ^      ~~~~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:309:4: note: Value stored to 'what' is =
never read
                           what =3D "invalid";
                           ^      ~~~~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:513:21: warning: Value stored to 'clien=
t' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct i2c_client *client =3D v4l2_get_subdevdata(&sensor->src->=
sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:513:21: note: Value stored to 'client' =
during its initialization is never read
           struct i2c_client *client =3D v4l2_get_subdevdata(&sensor->src->=
sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:532:21: warning: Value stored to 'clien=
t' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct i2c_client *client =3D v4l2_get_subdevdata(&sensor->src->=
sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:532:21: note: Value stored to 'client' =
during its initialization is never read
           struct i2c_client *client =3D v4l2_get_subdevdata(&sensor->src->=
sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:1001:21: warning: Value stored to 'clie=
nt' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct i2c_client *client =3D v4l2_get_subdevdata(&sensor->src->=
sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:1001:21: note: Value stored to 'client'=
 during its initialization is never read
           struct i2c_client *client =3D v4l2_get_subdevdata(&sensor->src->=
sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:1797:23: warning: Dereference of undefi=
ned pointer value [clang-analyzer-core.NullDereference]
                   *crops[CCS_PAD_SRC] =3D *comp;
                                       ^
   drivers/media/i2c/ccs/ccs-core.c:2319:30: note: Left side of '&&' is fal=
se
           struct ccs_sensor *sensor =3D to_ccs_sensor(subdev);
                                       ^
   drivers/media/i2c/ccs/ccs.h:276:3: note: expanded from macro 'to_ccs_sen=
sor'
           (to_ccs_subdev(_sd)->sensor)
            ^
   drivers/media/i2c/ccs/ccs.h:273:2: note: expanded from macro 'to_ccs_sub=
dev'
           container_of(_sd, struct ccs_subdev, sd)
           ^
   include/linux/kernel.h:853:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/media/i2c/ccs/ccs-core.c:2319:30: note: Taking false branch
           struct ccs_sensor *sensor =3D to_ccs_sensor(subdev);
                                       ^
   drivers/media/i2c/ccs/ccs.h:276:3: note: expanded from macro 'to_ccs_sen=
sor'
           (to_ccs_subdev(_sd)->sensor)
            ^
   drivers/media/i2c/ccs/ccs.h:273:2: note: expanded from macro 'to_ccs_sub=
dev'
           container_of(_sd, struct ccs_subdev, sd)
           ^
   include/linux/kernel.h:853:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/media/i2c/ccs/ccs-core.c:2319:30: note: Loop condition is false.=
  Exiting loop
           struct ccs_sensor *sensor =3D to_ccs_sensor(subdev);
                                       ^
   drivers/media/i2c/ccs/ccs.h:276:3: note: expanded from macro 'to_ccs_sen=
sor'
           (to_ccs_subdev(_sd)->sensor)
            ^
   drivers/media/i2c/ccs/ccs.h:273:2: note: expanded from macro 'to_ccs_sub=
dev'
           container_of(_sd, struct ccs_subdev, sd)
           ^
   include/linux/kernel.h:853:2: note: expanded from macro 'container_of'

vim +/client +105 drivers/media/i2c/ccs/ccs-core.c

ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  101  =

161cc847370a92 drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-0=
2-11  102  void ccs_replace_limit(struct ccs_sensor *sensor,
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  103  		       unsigned int limit, unsigned int offset, u32 val)
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  104  {
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06 @105  	struct i2c_client *client =3D v4l2_get_subdevdata(&sensor->src-=
>sd);
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  106  	const struct ccs_limit *linfo;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  107  	void *ptr;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  108  	int ret;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  109  =

ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  110  	ret =3D ccs_limit_ptr(sensor, limit, offset, &ptr);
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  111  	if (ret)
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  112  		return;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  113  =

ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  114  	linfo =3D &ccs_limits[ccs_limit_offsets[limit].info];
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  115  =

ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  116  	dev_dbg(&client->dev, "quirk: 0x%8.8x \"%s\" %u =3D %d, 0x%x\n",
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  117  		linfo->reg, linfo->name, offset, val, val);
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  118  =

ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  119  	ccs_assign_limit(ptr, ccs_reg_width(linfo->reg), val);
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  120  }
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  121  =

161cc847370a92 drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-0=
2-11  122  static u32 ccs_get_limit(struct ccs_sensor *sensor,
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  123  			 unsigned int limit, unsigned int offset)
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  124  {
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  125  	void *ptr;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  126  	int ret;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  127  =

ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  128  	ret =3D ccs_limit_ptr(sensor, limit, offset, &ptr);
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  129  	if (ret)
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  130  		return 0;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  131  =

ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  132  	switch (ccs_reg_width(ccs_limits[ccs_limit_offsets[limit].info]=
.reg)) {
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  133  	case sizeof(u8):
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  134  		return *(u8 *)ptr;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  135  	case sizeof(u16):
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  136  		return *(u16 *)ptr;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  137  	case sizeof(u32):
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  138  		return *(u32 *)ptr;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  139  	}
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  140  =

ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  141  	WARN_ON(1);
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  142  =

ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  143  	return 0;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  144  }
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  145  =

ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  146  #define CCS_LIM(sensor, limit) \
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  147  	ccs_get_limit(sensor, CCS_L_##limit, 0)
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  148  =

ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  149  #define CCS_LIM_AT(sensor, limit, offset)	\
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  150  	ccs_get_limit(sensor, CCS_L_##limit, CCS_L_##limit##_OFFSET(off=
set))
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  151  =

161cc847370a92 drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-0=
2-11  152  static int ccs_read_all_limits(struct ccs_sensor *sensor)
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  153  {
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  154  	struct i2c_client *client =3D v4l2_get_subdevdata(&sensor->src-=
>sd);
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  155  	void *ptr, *alloc, *end;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  156  	unsigned int i, l;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  157  	int ret;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  158  =

ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  159  	kfree(sensor->ccs_limits);
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  160  	sensor->ccs_limits =3D NULL;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  161  =

ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  162  	alloc =3D kzalloc(ccs_limit_offsets[CCS_L_LAST].lim, GFP_KERNEL=
);
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  163  	if (!alloc)
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  164  		return -ENOMEM;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  165  =

ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  166  	end =3D alloc + ccs_limit_offsets[CCS_L_LAST].lim;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  167  =

ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  168  	for (i =3D 0, l =3D 0, ptr =3D alloc; ccs_limits[i].size; i++) {
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  169  		u32 reg =3D ccs_limits[i].reg;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  170  		unsigned int width =3D ccs_reg_width(reg);
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  171  		unsigned int j;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  172  =

ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  173  		if (l =3D=3D CCS_L_LAST) {
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  174  			dev_err(&client->dev,
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  175  				"internal error --- end of limit array\n");
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  176  			ret =3D -EINVAL;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  177  			goto out_err;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  178  		}
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  179  =

ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  180  		for (j =3D 0; j < ccs_limits[i].size / width;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  181  		     j++, reg +=3D width, ptr +=3D width) {
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  182  			u32 val;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  183  =

47ff2ff267ee4f drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-11  184  			ret =3D ccs_read_addr(sensor, reg, &val);
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  185  			if (ret)
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  186  				goto out_err;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  187  =

ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  188  			if (ptr + width > end) {
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  189  				dev_err(&client->dev,
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  190  					"internal error --- no room for regs\n");
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  191  				ret =3D -EINVAL;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  192  				goto out_err;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  193  			}
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  194  =

ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  195  			ccs_assign_limit(ptr, width, val);
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  196  =

ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  197  			dev_dbg(&client->dev, "0x%8.8x \"%s\" =3D %u, 0x%x\n",
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  198  				reg, ccs_limits[i].name, val, val);
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  199  		}
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  200  =

ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  201  		if (ccs_limits[i].flags & CCS_L_FL_SAME_REG)
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  202  			continue;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  203  =

ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  204  		l++;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  205  		ptr =3D alloc + ccs_limit_offsets[l].lim;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  206  	}
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  207  =

ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  208  	if (l !=3D CCS_L_LAST) {
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  209  		dev_err(&client->dev,
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  210  			"internal error --- insufficient limits\n");
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  211  		ret =3D -EINVAL;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  212  		goto out_err;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  213  	}
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  214  =

ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  215  	sensor->ccs_limits =3D alloc;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  216  =

3e158e1f1ec2ac drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  217  	if (CCS_LIM(sensor, SCALER_N_MIN) < 16)
3e158e1f1ec2ac drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  218  		ccs_replace_limit(sensor, CCS_L_SCALER_N_MIN, 0, 16);
3e158e1f1ec2ac drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  219  =

ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  220  	return 0;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  221  =

ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  222  out_err:
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  223  	kfree(alloc);
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  224  =

ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  225  	return ret;
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  226  }
ca296a11156a00 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-06  227  =

161cc847370a92 drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-0=
2-11  228  static int ccs_read_frame_fmt(struct ccs_sensor *sensor)
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  229  {
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  230  	struct i2c_client *client =3D v4l2_get_subdevdata(&sensor->src-=
>sd);
fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  231  	u8 fmt_model_type, fmt_model_subtype, ncol_desc, nrow_desc;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  232  	unsigned int i;
3fc34b7beb8947 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2016-0=
9-05  233  	int pixel_count =3D 0;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  234  	int line_count =3D 0;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  235  =

fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  236  	fmt_model_type =3D CCS_LIM(sensor, FRAME_FORMAT_MODEL_TYPE);
fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  237  	fmt_model_subtype =3D CCS_LIM(sensor, FRAME_FORMAT_MODEL_SUBTYP=
E);
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  238  =

ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  239  	ncol_desc =3D (fmt_model_subtype
fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  240  		     & CCS_FRAME_FORMAT_MODEL_SUBTYPE_COLUMNS_MASK)
fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  241  		>> CCS_FRAME_FORMAT_MODEL_SUBTYPE_COLUMNS_SHIFT;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  242  	nrow_desc =3D fmt_model_subtype
fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  243  		& CCS_FRAME_FORMAT_MODEL_SUBTYPE_ROWS_MASK;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  244  =

ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  245  	dev_dbg(&client->dev, "format_model_type %s\n",
fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  246  		fmt_model_type =3D=3D CCS_FRAME_FORMAT_MODEL_TYPE_2_BYTE
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  247  		? "2 byte" :
fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  248  		fmt_model_type =3D=3D CCS_FRAME_FORMAT_MODEL_TYPE_4_BYTE
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  249  		? "4 byte" : "is simply bad");
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  250  =

fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  251  	dev_dbg(&client->dev, "%u column and %u row descriptors\n",
fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  252  		ncol_desc, nrow_desc);
fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  253  =

ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  254  	for (i =3D 0; i < ncol_desc + nrow_desc; i++) {
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  255  		u32 desc;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  256  		u32 pixelcode;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  257  		u32 pixels;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  258  		char *which;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  259  		char *what;
e43665a9d7b41b drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2016-0=
9-07  260  		u32 reg;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  261  =

fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  262  		if (fmt_model_type =3D=3D CCS_FRAME_FORMAT_MODEL_TYPE_2_BYTE) {
fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  263  			desc =3D CCS_LIM_AT(sensor, FRAME_FORMAT_DESCRIPTOR, i);
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  264  =

ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  265  			pixelcode =3D
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  266  				(desc
fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  267  				 & CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_MASK)
fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  268  				>> CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_SHIFT;
fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  269  			pixels =3D desc & CCS_FRAME_FORMAT_DESCRIPTOR_PIXELS_MASK;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  270  		} else if (fmt_model_type
fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  271  			   =3D=3D CCS_FRAME_FORMAT_MODEL_TYPE_4_BYTE) {
fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  272  			desc =3D CCS_LIM_AT(sensor, FRAME_FORMAT_DESCRIPTOR_4, i);
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  273  =

ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  274  			pixelcode =3D
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  275  				(desc
fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  276  				 & CCS_FRAME_FORMAT_DESCRIPTOR_4_PCODE_MASK)
fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  277  				>> CCS_FRAME_FORMAT_DESCRIPTOR_4_PCODE_SHIFT;
fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  278  			pixels =3D desc &
fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  279  				CCS_FRAME_FORMAT_DESCRIPTOR_4_PIXELS_MASK;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  280  		} else {
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  281  			dev_dbg(&client->dev,
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  282  				"invalid frame format model type %d\n",
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  283  				fmt_model_type);
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  284  			return -EINVAL;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  285  		}
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  286  =

ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  287  		if (i < ncol_desc)
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03 @288  			which =3D "columns";
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  289  		else
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  290  			which =3D "rows";
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  291  =

ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  292  		switch (pixelcode) {
fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  293  		case CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_EMBEDDED:
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03 @294  			what =3D "embedded";
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  295  			break;
fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  296  		case CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_DUMMY_PIXEL:
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  297  			what =3D "dummy";
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  298  			break;
fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  299  		case CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_BLACK_PIXEL:
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  300  			what =3D "black";
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  301  			break;
fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  302  		case CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_DARK_PIXEL:
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  303  			what =3D "dark";
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  304  			break;
fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  305  		case CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_VISIBLE_PIXEL:
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  306  			what =3D "visible";
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  307  			break;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  308  		default:
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  309  			what =3D "invalid";
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  310  			break;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  311  		}
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  312  =

e43665a9d7b41b drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2016-0=
9-07  313  		dev_dbg(&client->dev,
e43665a9d7b41b drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2016-0=
9-07  314  			"0x%8.8x %s pixels: %d %s (pixelcode %u)\n", reg,
e43665a9d7b41b drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2016-0=
9-07  315  			what, pixels, which, pixelcode);
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  316  =

3fc34b7beb8947 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2016-0=
9-05  317  		if (i < ncol_desc) {
3fc34b7beb8947 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2016-0=
9-05  318  			if (pixelcode =3D=3D
fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  319  			    CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_VISIBLE_PIXEL)
3fc34b7beb8947 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2016-0=
9-05  320  				sensor->visible_pixel_start =3D pixel_count;
3fc34b7beb8947 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2016-0=
9-05  321  			pixel_count +=3D pixels;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  322  			continue;
3fc34b7beb8947 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2016-0=
9-05  323  		}
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  324  =

ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  325  		/* Handle row descriptors */
3fc34b7beb8947 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2016-0=
9-05  326  		switch (pixelcode) {
fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  327  		case CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_EMBEDDED:
3fc34b7beb8947 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2016-0=
9-05  328  			if (sensor->embedded_end)
3fc34b7beb8947 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2016-0=
9-05  329  				break;
3fc34b7beb8947 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2016-0=
9-05  330  			sensor->embedded_start =3D line_count;
3fc34b7beb8947 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2016-0=
9-05  331  			sensor->embedded_end =3D line_count + pixels;
3fc34b7beb8947 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2016-0=
9-05  332  			break;
fd9065812c7b45 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  333  		case CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_VISIBLE_PIXEL:
3fc34b7beb8947 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2016-0=
9-05  334  			sensor->image_start =3D line_count;
3fc34b7beb8947 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2016-0=
9-05  335  			break;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  336  		}
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  337  		line_count +=3D pixels;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  338  	}
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  339  =

3fc34b7beb8947 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2016-0=
9-05  340  	if (sensor->embedded_end > sensor->image_start) {
3fc34b7beb8947 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2016-0=
9-05  341  		dev_dbg(&client->dev,
3fc34b7beb8947 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2016-0=
9-05  342  			"adjusting image start line to %u (was %u)\n",
3fc34b7beb8947 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2016-0=
9-05  343  			sensor->embedded_end, sensor->image_start);
3fc34b7beb8947 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2016-0=
9-05  344  		sensor->image_start =3D sensor->embedded_end;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  345  	}
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  346  =

ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  347  	dev_dbg(&client->dev, "embedded data from lines %d to %d\n",
3fc34b7beb8947 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2016-0=
9-05  348  		sensor->embedded_start, sensor->embedded_end);
3fc34b7beb8947 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2016-0=
9-05  349  	dev_dbg(&client->dev, "image data starts at line %d\n",
3fc34b7beb8947 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2016-0=
9-05  350  		sensor->image_start);
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  351  =

ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  352  	return 0;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  353  }
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  354  =


:::::: The code at line 105 was first introduced by commit
:::::: ca296a11156a00cc2336ba5fbcbcf2c6c41755c5 media: smiapp: Read CCS lim=
it values

:::::: TO: Sakari Ailus <sakari.ailus@linux.intel.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6240758256007639401==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6240758256007639401==--

