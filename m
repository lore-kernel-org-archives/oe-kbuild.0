Content-Type: multipart/mixed; boundary="===============7731160697208239755=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [l1k:smsc95xx_5.17 340/888] drivers/media/i2c/ov5647.c:595:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 10 Apr 2022 13:27:04 +0800
Message-ID: <202204101333.iRw0Qyh3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7731160697208239755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: David Plowman <david.plowman@raspberrypi.org>
CC: Dom Cobley <popcornmix@gmail.com>
CC: Naushir Patuck <naush@raspberrypi.com>

tree:   https://github.com/l1k/linux smsc95xx_5.17
head:   240f56c27361c195cd502d95aba51c6b8e5b808c
commit: 645a01bf4309d11d09fc477f931da135347a70dc [340/888] media: ov5647: F=
ix return codes from ov5647_write/ov5647_read functions.
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
410/202204101333.iRw0Qyh3-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 893e1c=
18b98d8bbc7b8d7d22cc2c348f65c72ad9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/645a01bf4309d11d09fc477f931da=
135347a70dc
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k smsc95xx_5.17
        git checkout 645a01bf4309d11d09fc477f931da135347a70dc
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   include/linux/printk.h:370:7: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                       ^
   include/linux/hid.h:1036:3: note: Taking true branch
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:640:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
                   ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:370:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   include/linux/hid.h:1036:3: note: '?' condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:640:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
                   ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:379:12: note: expanded from macro '__printk_index=
_emit'
                                   .fmt =3D __builtin_constant_p(_fmt) ? (_=
fmt) : NULL, \
                                          ^
   include/linux/hid.h:1036:3: note: '?' condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:640:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
                   ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:383:14: note: expanded from macro '__printk_index=
_emit'
                                   .level =3D __builtin_constant_p(_level) =
? (_level) : NULL, \
                                            ^
   include/linux/hid.h:1036:3: note: Loop condition is false.  Exiting loop
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:640:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
                   ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:369:2: note: expanded from macro '__printk_index_=
emit'
           do {                                                            \
           ^
   include/linux/hid.h:1037:9: note: Access to field 'name' results in a de=
reference of a null pointer (loaded from variable 'input')
                                       input->name, c, type);
                                       ^
   include/linux/printk.h:656:49: note: expanded from macro 'pr_warn_rateli=
mited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                                          ^~~~~~~~~~~
   include/linux/printk.h:640:17: note: expanded from macro 'printk_ratelim=
ited'
                   printk(fmt, ##__VA_ARGS__);                             \
                                 ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   1 warning generated.
   drivers/media/i2c/ov2680.c:424:2: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           ret =3D ov2680_write_reg16(sensor, OV2680_REG_GAIN_PK, gain);
           ^
   drivers/media/i2c/ov2680.c:424:2: note: Value stored to 'ret' is never r=
ead
   7 warnings generated.
>> drivers/media/i2c/ov5647.c:595:3: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   ret =3D 0;
                   ^     ~
   drivers/media/i2c/ov5647.c:595:3: note: Value stored to 'ret' is never r=
ead
                   ret =3D 0;
                   ^     ~
   drivers/media/i2c/ov5647.c:617:3: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   ret =3D 0;
                   ^     ~
   drivers/media/i2c/ov5647.c:617:3: note: Value stored to 'ret' is never r=
ead
                   ret =3D 0;
                   ^     ~
   drivers/media/i2c/ov5647.c:622:4: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                           ret =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/media/i2c/ov5647.c:622:4: note: Value stored to 'ret' is never r=
ead
                           ret =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/media/i2c/ov5647.c:653:3: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   ret =3D 0;
                   ^     ~
   drivers/media/i2c/ov5647.c:653:3: note: Value stored to 'ret' is never r=
ead
                   ret =3D 0;
                   ^     ~
   drivers/media/i2c/ov5647.c:658:4: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                           ret =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/media/i2c/ov5647.c:658:4: note: Value stored to 'ret' is never r=
ead
                           ret =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/media/i2c/ov5647.c:839:8: warning: The left expression of the co=
mpound assignment is an uninitialized value. The computed value will also b=
e garbage [clang-analyzer-core.uninitialized.Assign]
           rdval &=3D ~0x01;
           ~~~~~ ^
   drivers/media/i2c/ov5647.c:824:2: note: 'rdval' declared without an init=
ial value
           u8 rdval;
           ^~~~~~~~
   drivers/media/i2c/ov5647.c:827:2: note: '?' condition is false
           dev_dbg(dev, "OV5647 power off\n");
           ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/i2c/ov5647.c:827:2: note: '?' condition is false
           dev_dbg(dev, "OV5647 power off\n");
           ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/media/i2c/ov5647.c:827:2: note: Taking false branch
           dev_dbg(dev, "OV5647 power off\n");
           ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/i2c/ov5647.c:827:2: note: Loop condition is false.  Exitin=
g loop
           dev_dbg(dev, "OV5647 power off\n");
           ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'

vim +/ret +595 drivers/media/i2c/ov5647.c

d7d6074ecd49607 Jacopo Mondi   2020-11-19  582  =

2512c06441e3f0d Dave Stevenson 2020-11-19  583  static int ov5647_write16(s=
truct v4l2_subdev *sd, u16 reg, u16 val)
2512c06441e3f0d Dave Stevenson 2020-11-19  584  {
2512c06441e3f0d Dave Stevenson 2020-11-19  585  	unsigned char data[4] =3D =
{ reg >> 8, reg & 0xff, val >> 8, val & 0xff};
2512c06441e3f0d Dave Stevenson 2020-11-19  586  	struct i2c_client *client =
=3D v4l2_get_subdevdata(sd);
2512c06441e3f0d Dave Stevenson 2020-11-19  587  	int ret;
2512c06441e3f0d Dave Stevenson 2020-11-19  588  =

2512c06441e3f0d Dave Stevenson 2020-11-19  589  	ret =3D i2c_master_send(cl=
ient, data, 4);
645a01bf4309d11 David Plowman  2020-01-15  590  	/*
645a01bf4309d11 David Plowman  2020-01-15  591  	 * Writing the wrong numbe=
r of bytes also needs to be flagged as an
645a01bf4309d11 David Plowman  2020-01-15  592  	 * error. Success needs to=
 produce a 0 return code.
645a01bf4309d11 David Plowman  2020-01-15  593  	 */
645a01bf4309d11 David Plowman  2020-01-15  594  	if (ret =3D=3D 4) {
645a01bf4309d11 David Plowman  2020-01-15 @595  		ret =3D 0;
645a01bf4309d11 David Plowman  2020-01-15  596  	} else {
2512c06441e3f0d Dave Stevenson 2020-11-19  597  		dev_dbg(&client->dev, "%s=
: i2c write error, reg: %x\n",
2512c06441e3f0d Dave Stevenson 2020-11-19  598  			__func__, reg);
2512c06441e3f0d Dave Stevenson 2020-11-19  599  		return ret;
2512c06441e3f0d Dave Stevenson 2020-11-19  600  	}
2512c06441e3f0d Dave Stevenson 2020-11-19  601  =

2512c06441e3f0d Dave Stevenson 2020-11-19  602  	return 0;
2512c06441e3f0d Dave Stevenson 2020-11-19  603  }
2512c06441e3f0d Dave Stevenson 2020-11-19  604  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7731160697208239755==--

