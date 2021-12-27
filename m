Content-Type: multipart/mixed; boundary="===============7045436735667759818=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/staging/media/av7110/sp8870.c:381:2: warning: Value stored to 'tmp' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 27 Dec 2021 13:53:52 +0800
Message-ID: <202112271354.JDYQY59Y-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7045436735667759818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   fc74e0a40e4f9fd0468e34045b0c45bba11dcbb2
commit: b998a59f82f1152605eae4f7617778020549e81a media: sp8870: move it to =
staging
date:   7 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-c002-20211226 (https://download.01.org/0day-ci/archi=
ve/20211227/202112271354.JDYQY59Y-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project a9e8b1=
ee7fd44b53c555a7823ae8fd1a8209c520)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db998a59f82f1152605eae4f7617778020549e81a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b998a59f82f1152605eae4f7617778020549e81a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           if (!count)
           ^
   drivers/leds/leds-pwm.c:146:6: note: Assuming 'priv' is non-null
           if (!priv)
               ^~~~~
   drivers/leds/leds-pwm.c:146:2: note: Taking false branch
           if (!priv)
           ^
   drivers/leds/leds-pwm.c:149:8: note: Calling 'led_pwm_create_fwnode'
           ret =3D led_pwm_create_fwnode(&pdev->dev, priv);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-pwm.c:108:2: note: Loop condition is true.  Entering l=
oop body
           device_for_each_child_node(dev, fwnode) {
           ^
   include/linux/property.h:111:2: note: expanded from macro 'device_for_ea=
ch_child_node'
           for (child =3D device_get_next_child_node(dev, NULL); child;    =
  \
           ^
   drivers/leds/leds-pwm.c:110:7: note: Assuming 'ret' is not equal to 0
                   if (ret && is_of_node(fwnode))
                       ^~~
   drivers/leds/leds-pwm.c:110:7: note: Left side of '&&' is true
   drivers/leds/leds-pwm.c:110:14: note: Assuming the condition is true
                   if (ret && is_of_node(fwnode))
                              ^~~~~~~~~~~~~~~~~~
   drivers/leds/leds-pwm.c:110:3: note: Taking true branch
                   if (ret && is_of_node(fwnode))
                   ^
   drivers/leds/leds-pwm.c:111:15: note: Assuming the condition is false
                           led.name =3D to_of_node(fwnode)->name;
                                      ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-pwm.c:111:15: note: '?' condition is false
                           led.name =3D to_of_node(fwnode)->name;
                                      ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/leds/leds-pwm.c:111:15: note: Access to field 'name' results in =
a dereference of a null pointer
                           led.name =3D to_of_node(fwnode)->name;
                                      ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/video/fbdev/matrox/g450_pll.c:362:6: warning: Value stored to 't=
mp' is never read [clang-analyzer-deadcode.DeadStores]
                                           tmp =3D 0;
                                           ^     ~
   drivers/video/fbdev/matrox/g450_pll.c:362:6: note: Value stored to 'tmp'=
 is never read
                                           tmp =3D 0;
                                           ^     ~
   drivers/video/fbdev/matrox/g450_pll.c:363:10: warning: Value stored to '=
tmp' is never read [clang-analyzer-deadcode.DeadStores]
                                   else tmp =3D
                                        ^
   drivers/video/fbdev/matrox/g450_pll.c:363:10: note: Value stored to 'tmp=
' is never read
   drivers/video/fbdev/matrox/g450_pll.c:420:5: warning: Value stored to 'm=
np' is never read [clang-analyzer-deadcode.DeadStores]
                                   mnp |=3D matroxfb_DAC_in(minfo, M1064_XP=
IXPLLCN) << 8;
                                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   drivers/video/fbdev/matrox/g450_pll.c:420:5: note: Value stored to 'mnp'=
 is never read
                                   mnp |=3D matroxfb_DAC_in(minfo, M1064_XP=
IXPLLCN) << 8;
                                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/video/fbdev/matrox/matroxfb_g450.c:277:2: warning: Value stored =
to 'chromasc' is never read [clang-analyzer-deadcode.DeadStores]
           chromasc =3D piic;
           ^          ~~~~
   drivers/video/fbdev/matrox/matroxfb_g450.c:277:2: note: Value stored to =
'chromasc' is never read
           chromasc =3D piic;
           ^          ~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/staging/media/av7110/sp8870.c:381:2: warning: Value stored to 't=
mp' is never read [clang-analyzer-deadcode.DeadStores]
           tmp =3D ret & 0x3F;
           ^     ~~~~~~~~~~
   drivers/staging/media/av7110/sp8870.c:381:2: note: Value stored to 'tmp'=
 is never read
           tmp =3D ret & 0x3F;
           ^     ~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/i2c/max2175.c:643:50: warning: The result of the left shif=
t is undefined because the left operand is negative [clang-analyzer-core.Un=
definedBinaryOperatorResult]
           nco_reg =3D max2175_round_closest(nco_val_desired << 20, clock_r=
ate);
                                                           ^
   drivers/media/i2c/max2175.c:1101:2: note: Taking false branch
           mxm_dbg(ctx, "s_freq: new %u curr %u, mode_resolved %d\n",
           ^
   drivers/media/i2c/max2175.c:30:35: note: expanded from macro 'mxm_dbg'
   #define mxm_dbg(ctx, fmt, arg...) dev_dbg(&ctx->client->dev, fmt, ## arg)
                                     ^
   include/linux/dev_printk.h:130:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/media/i2c/max2175.c:1104:6: note: Assuming field 'tuner' is equa=
l to 0
           if (vf->tuner !=3D 0)
               ^~~~~~~~~~~~~~
   drivers/media/i2c/max2175.c:1104:2: note: Taking false branch
           if (vf->tuner !=3D 0)
           ^
   drivers/media/i2c/max2175.c:1107:9: note: Assuming '__UNIQUE_ID___x243' =
is <=3D '__UNIQUE_ID___y244'
           freq =3D clamp(vf->frequency, ctx->bands_rf->rangelow,
                  ^
   include/linux/minmax.h:89:45: note: expanded from macro 'clamp'
   #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/minmax.h:45:33: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ~~~~~~~~~~~~~~^~~~~~~~
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                                         ^
   drivers/media/i2c/max2175.c:1107:9: note: '?' condition is false
           freq =3D clamp(vf->frequency, ctx->bands_rf->rangelow,
                  ^
   include/linux/minmax.h:89:45: note: expanded from macro 'clamp'
   #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
                                               ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
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
   drivers/media/i2c/max2175.c:1107:9: note: Assuming '__UNIQUE_ID___x245' =
is >=3D '__UNIQUE_ID___y246'
           freq =3D clamp(vf->frequency, ctx->bands_rf->rangelow,
                  ^
   include/linux/minmax.h:89:28: note: expanded from macro 'clamp'
   #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/media/i2c/max2175.c:1107:9: note: '?' condition is false
           freq =3D clamp(vf->frequency, ctx->bands_rf->rangelow,
                  ^
   include/linux/minmax.h:89:28: note: expanded from macro 'clamp'
   #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
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

vim +/tmp +381 drivers/staging/media/av7110/sp8870.c

^1da177e4c3f415 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      20=
05-04-16  368  =

^1da177e4c3f415 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      20=
05-04-16  369  static int sp8870_read_ber (struct dvb_frontend* fe, u32 * b=
er)
^1da177e4c3f415 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      20=
05-04-16  370  {
b8742700f13163f drivers/media/dvb/frontends/sp8870.c Johannes Stezenbach 20=
05-05-16  371  	struct sp8870_state* state =3D fe->demodulator_priv;
^1da177e4c3f415 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      20=
05-04-16  372  	int ret;
^1da177e4c3f415 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      20=
05-04-16  373  	u32 tmp;
^1da177e4c3f415 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      20=
05-04-16  374  =

^1da177e4c3f415 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      20=
05-04-16  375  	*ber =3D 0;
^1da177e4c3f415 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      20=
05-04-16  376  =

^1da177e4c3f415 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      20=
05-04-16  377  	ret =3D sp8870_readreg(state, 0xC08);
^1da177e4c3f415 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      20=
05-04-16  378  	if (ret < 0)
^1da177e4c3f415 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      20=
05-04-16  379  		return -EIO;
^1da177e4c3f415 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      20=
05-04-16  380  =

^1da177e4c3f415 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      20=
05-04-16 @381  	tmp =3D ret & 0x3F;
^1da177e4c3f415 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      20=
05-04-16  382  =

^1da177e4c3f415 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      20=
05-04-16  383  	ret =3D sp8870_readreg(state, 0xC07);
^1da177e4c3f415 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      20=
05-04-16  384  	if (ret < 0)
^1da177e4c3f415 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      20=
05-04-16  385  		return -EIO;
^1da177e4c3f415 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      20=
05-04-16  386  =

^1da177e4c3f415 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      20=
05-04-16  387  	tmp =3D ret << 6;
^1da177e4c3f415 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      20=
05-04-16  388  	if (tmp >=3D 0x3FFF0)
^1da177e4c3f415 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      20=
05-04-16  389  		tmp =3D ~0;
^1da177e4c3f415 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      20=
05-04-16  390  =

^1da177e4c3f415 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      20=
05-04-16  391  	*ber =3D tmp;
^1da177e4c3f415 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      20=
05-04-16  392  =

^1da177e4c3f415 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      20=
05-04-16  393  	return 0;
^1da177e4c3f415 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      20=
05-04-16  394  }
^1da177e4c3f415 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      20=
05-04-16  395  =


:::::: The code at line 381 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7045436735667759818==--

