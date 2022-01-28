Content-Type: multipart/mixed; boundary="===============1192165352647446769=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/codecs/ak4375.c:343:3: warning: Value stored to 'mclk' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 28 Jan 2022 13:00:50 +0800
Message-ID: <202201281208.amOQKI90-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1192165352647446769==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Vincent Knecht <vincent.knecht@mailoo.org>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   23a46422c56144939c091c76cf389aa863ce9c18
commit: 53778b8292b5492ec3ecf1efb84163eac2a6e422 ASoC: Add AK4375 support
date:   5 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c002-20220125 (https://download.01.org/0day-ci/archi=
ve/20220128/202201281208.amOQKI90-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 997e12=
8e2a78f5a5434fc75997441ae1ee76f8a4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D53778b8292b5492ec3ecf1efb84163eac2a6e422
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 53778b8292b5492ec3ecf1efb84163eac2a6e422
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/hwmon/lm75.h:27:14: note: '__UNIQUE_ID___x267' is < '__UNIQUE_ID=
___y268'
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/hwmon/lm75.h:27:14: note: '?' condition is true
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
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
   drivers/hwmon/lm75.h:29:12: note: 'ntemp' is < 0
           ntemp +=3D (ntemp < 0 ? -250 : 250);
                     ^~~~~
   drivers/hwmon/lm75.h:29:12: note: '?' condition is true
   drivers/hwmon/lm75.h:30:29: note: The result of the left shift is undefi=
ned because the left operand is negative
           return (u16)((ntemp / 500) << 7);
                        ~~~~~~~~~~~~~ ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/of/device.c:59:29: warning: Value stored to 'of_node' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device_node *node, *of_node =3D dev->of_node;
                                      ^~~~~~~   ~~~~~~~~~~~~
   drivers/of/device.c:59:29: note: Value stored to 'of_node' during its in=
itialization is never read
           struct device_node *node, *of_node =3D dev->of_node;
                                      ^~~~~~~   ~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   sound/soc/codecs/adau7118.c:127:24: warning: Value stored to 'st' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct adau7118_data *st =3D
                                 ^~
   sound/soc/codecs/adau7118.c:127:24: note: Value stored to 'st' during it=
s initialization is never read
           struct adau7118_data *st =3D
                                 ^~
   sound/soc/codecs/adau7118.c:210:24: warning: Value stored to 'st' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct adau7118_data *st =3D
                                 ^~
   sound/soc/codecs/adau7118.c:210:24: note: Value stored to 'st' during it=
s initialization is never read
           struct adau7118_data *st =3D
                                 ^~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> sound/soc/codecs/ak4375.c:343:3: warning: Value stored to 'mclk' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   mclk =3D 128 * ak4375->rate;
                   ^      ~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/ak4375.c:343:3: note: Value stored to 'mclk' is never r=
ead
                   mclk =3D 128 * ak4375->rate;
                   ^      ~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   sound/soc/codecs/ak4613.c:402:2: warning: Value stored to 'fmt_ctrl' is =
never read [clang-analyzer-deadcode.DeadStores]
           fmt_ctrl =3D NO_FMT;
           ^
   sound/soc/codecs/ak4613.c:402:2: note: Value stored to 'fmt_ctrl' is nev=
er read
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   sound/soc/codecs/ak4642.c:410:2: warning: Value stored to 'data' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           data =3D 0;
           ^      ~
   sound/soc/codecs/ak4642.c:410:2: note: Value stored to 'data' is never r=
ead
           data =3D 0;
           ^      ~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/regulator/mc13xxx-regulator-core.c:115:6: warning: Value stored =
to 'id' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           int id =3D rdev_get_id(rdev);
               ^~   ~~~~~~~~~~~~~~~~~
   drivers/regulator/mc13xxx-regulator-core.c:115:6: note: Value stored to =
'id' during its initialization is never read
           int id =3D rdev_get_id(rdev);
               ^~   ~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/base/power/main.c:465:3: warning: Value stored to 'usecs' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   usecs =3D 1;
                   ^       ~
   drivers/base/power/main.c:465:3: note: Value stored to 'usecs' is never =
read
                   usecs =3D 1;
                   ^       ~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   drivers/base/regmap/regmap.c:1933:2: warning: Called function pointer is=
 null (null dereference) [clang-analyzer-core.CallAndMessage]
           map->format.format_val(map->work_buf + map->format.reg_bytes
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/base/regmap/regmap.c:1931:10: note: Assuming field 'bus' is non-=
null
           WARN_ON(!map->bus || !map->format.format_val);
                   ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/base/regmap/regmap.c:1931:10: note: Left side of '||' is false
           WARN_ON(!map->bus || !map->format.format_val);
                   ^
   drivers/base/regmap/regmap.c:1931:23: note: Assuming field 'format_val' =
is null
           WARN_ON(!map->bus || !map->format.format_val);
                                ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/base/regmap/regmap.c:1931:2: note: Taking true branch
           WARN_ON(!map->bus || !map->format.format_val);
           ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'

vim +/mclk +343 sound/soc/codecs/ak4375.c

53778b8292b5492 Vincent Knecht 2021-12-20  280  =

53778b8292b5492 Vincent Knecht 2021-12-20  281  static int ak4375_dai_set_p=
ll(struct snd_soc_dai *dai, int pll_id, int source,
53778b8292b5492 Vincent Knecht 2021-12-20  282  			      unsigned int freq_=
in, unsigned int freq_out)
53778b8292b5492 Vincent Knecht 2021-12-20  283  {
53778b8292b5492 Vincent Knecht 2021-12-20  284  	struct snd_soc_component *=
component =3D dai->component;
53778b8292b5492 Vincent Knecht 2021-12-20  285  	struct ak4375_priv *ak4375=
 =3D snd_soc_component_get_drvdata(component);
53778b8292b5492 Vincent Knecht 2021-12-20  286  	unsigned int mclk, plm, md=
iv, div;
53778b8292b5492 Vincent Knecht 2021-12-20  287  	u8 cms, fs, cm;
53778b8292b5492 Vincent Knecht 2021-12-20  288  =

53778b8292b5492 Vincent Knecht 2021-12-20  289  	cms =3D snd_soc_component_=
read(component, AK4375_05_CLOCK_MODE_SELECT);
53778b8292b5492 Vincent Knecht 2021-12-20  290  	fs =3D cms & ~FS_MASK;
53778b8292b5492 Vincent Knecht 2021-12-20  291  	cm =3D cms & ~CM_MASK;
53778b8292b5492 Vincent Knecht 2021-12-20  292  =

53778b8292b5492 Vincent Knecht 2021-12-20  293  	switch (ak4375->rate) {
53778b8292b5492 Vincent Knecht 2021-12-20  294  	case 8000:
53778b8292b5492 Vincent Knecht 2021-12-20  295  		fs |=3D FS_8KHZ;
53778b8292b5492 Vincent Knecht 2021-12-20  296  		break;
53778b8292b5492 Vincent Knecht 2021-12-20  297  	case 11025:
53778b8292b5492 Vincent Knecht 2021-12-20  298  		fs |=3D FS_11_025KHZ;
53778b8292b5492 Vincent Knecht 2021-12-20  299  		break;
53778b8292b5492 Vincent Knecht 2021-12-20  300  	case 16000:
53778b8292b5492 Vincent Knecht 2021-12-20  301  		fs |=3D FS_16KHZ;
53778b8292b5492 Vincent Knecht 2021-12-20  302  		break;
53778b8292b5492 Vincent Knecht 2021-12-20  303  	case 22050:
53778b8292b5492 Vincent Knecht 2021-12-20  304  		fs |=3D FS_22_05KHZ;
53778b8292b5492 Vincent Knecht 2021-12-20  305  		break;
53778b8292b5492 Vincent Knecht 2021-12-20  306  	case 32000:
53778b8292b5492 Vincent Knecht 2021-12-20  307  		fs |=3D FS_32KHZ;
53778b8292b5492 Vincent Knecht 2021-12-20  308  		break;
53778b8292b5492 Vincent Knecht 2021-12-20  309  	case 44100:
53778b8292b5492 Vincent Knecht 2021-12-20  310  		fs |=3D FS_44_1KHZ;
53778b8292b5492 Vincent Knecht 2021-12-20  311  		break;
53778b8292b5492 Vincent Knecht 2021-12-20  312  	case 48000:
53778b8292b5492 Vincent Knecht 2021-12-20  313  		fs |=3D FS_48KHZ;
53778b8292b5492 Vincent Knecht 2021-12-20  314  		break;
53778b8292b5492 Vincent Knecht 2021-12-20  315  	case 88200:
53778b8292b5492 Vincent Knecht 2021-12-20  316  		fs |=3D FS_88_2KHZ;
53778b8292b5492 Vincent Knecht 2021-12-20  317  		break;
53778b8292b5492 Vincent Knecht 2021-12-20  318  	case 96000:
53778b8292b5492 Vincent Knecht 2021-12-20  319  		fs |=3D FS_96KHZ;
53778b8292b5492 Vincent Knecht 2021-12-20  320  		break;
53778b8292b5492 Vincent Knecht 2021-12-20  321  	case 176400:
53778b8292b5492 Vincent Knecht 2021-12-20  322  		fs |=3D FS_176_4KHZ;
53778b8292b5492 Vincent Knecht 2021-12-20  323  		break;
53778b8292b5492 Vincent Knecht 2021-12-20  324  	case 192000:
53778b8292b5492 Vincent Knecht 2021-12-20  325  		fs |=3D FS_192KHZ;
53778b8292b5492 Vincent Knecht 2021-12-20  326  		break;
53778b8292b5492 Vincent Knecht 2021-12-20  327  	default:
53778b8292b5492 Vincent Knecht 2021-12-20  328  		return -EINVAL;
53778b8292b5492 Vincent Knecht 2021-12-20  329  	}
53778b8292b5492 Vincent Knecht 2021-12-20  330  =

53778b8292b5492 Vincent Knecht 2021-12-20  331  	if (ak4375->rate <=3D 2400=
0) {
53778b8292b5492 Vincent Knecht 2021-12-20  332  		cm |=3D CM_1;
53778b8292b5492 Vincent Knecht 2021-12-20  333  		mclk =3D 512 * ak4375->ra=
te;
53778b8292b5492 Vincent Knecht 2021-12-20  334  		mdiv =3D freq_out / mclk =
- 1;
53778b8292b5492 Vincent Knecht 2021-12-20  335  		div =3D 0;
53778b8292b5492 Vincent Knecht 2021-12-20  336  	} else if (ak4375->rate <=
=3D 96000) {
53778b8292b5492 Vincent Knecht 2021-12-20  337  		cm |=3D CM_0;
53778b8292b5492 Vincent Knecht 2021-12-20  338  		mclk =3D 256 * ak4375->ra=
te;
53778b8292b5492 Vincent Knecht 2021-12-20  339  		mdiv =3D freq_out / mclk =
- 1;
53778b8292b5492 Vincent Knecht 2021-12-20  340  		div =3D 0;
53778b8292b5492 Vincent Knecht 2021-12-20  341  	} else {
53778b8292b5492 Vincent Knecht 2021-12-20  342  		cm |=3D CM_3;
53778b8292b5492 Vincent Knecht 2021-12-20 @343  		mclk =3D 128 * ak4375->ra=
te;
53778b8292b5492 Vincent Knecht 2021-12-20  344  		mdiv =3D 4;
53778b8292b5492 Vincent Knecht 2021-12-20  345  		div =3D 1;
53778b8292b5492 Vincent Knecht 2021-12-20  346  	}
53778b8292b5492 Vincent Knecht 2021-12-20  347  =

53778b8292b5492 Vincent Knecht 2021-12-20  348  	/* Writing both fields in =
one go seems to make playback choppy on start */
53778b8292b5492 Vincent Knecht 2021-12-20  349  	snd_soc_component_update_b=
its(component, AK4375_05_CLOCK_MODE_SELECT, FS_MASK, fs);
53778b8292b5492 Vincent Knecht 2021-12-20  350  	snd_soc_component_update_b=
its(component, AK4375_05_CLOCK_MODE_SELECT, CM_MASK, cm);
53778b8292b5492 Vincent Knecht 2021-12-20  351  =

53778b8292b5492 Vincent Knecht 2021-12-20  352  	snd_soc_component_write(co=
mponent, AK4375_0F_PLL_REF_CLK_DIVIDER1,
53778b8292b5492 Vincent Knecht 2021-12-20  353  				(ak4375->pld & 0xff00) =
>> 8);
53778b8292b5492 Vincent Knecht 2021-12-20  354  	snd_soc_component_write(co=
mponent, AK4375_10_PLL_REF_CLK_DIVIDER2,
53778b8292b5492 Vincent Knecht 2021-12-20  355  				ak4375->pld & 0x00ff);
53778b8292b5492 Vincent Knecht 2021-12-20  356  =

53778b8292b5492 Vincent Knecht 2021-12-20  357  	plm =3D freq_out / freq_in=
 - 1;
53778b8292b5492 Vincent Knecht 2021-12-20  358  	snd_soc_component_write(co=
mponent, AK4375_11_PLL_FB_CLK_DIVIDER1, (plm & 0xff00) >> 8);
53778b8292b5492 Vincent Knecht 2021-12-20  359  	snd_soc_component_write(co=
mponent, AK4375_12_PLL_FB_CLK_DIVIDER2, plm & 0x00ff);
53778b8292b5492 Vincent Knecht 2021-12-20  360  =

53778b8292b5492 Vincent Knecht 2021-12-20  361  	snd_soc_component_update_b=
its(component, AK4375_13_SRC_CLK_SOURCE, DIV, div);
53778b8292b5492 Vincent Knecht 2021-12-20  362  =

53778b8292b5492 Vincent Knecht 2021-12-20  363  	/* SRCCKS bit: force to 1 =
for SRC PLL source clock */
53778b8292b5492 Vincent Knecht 2021-12-20  364  	snd_soc_component_update_b=
its(component, AK4375_13_SRC_CLK_SOURCE, SRCCKS, SRCCKS);
53778b8292b5492 Vincent Knecht 2021-12-20  365  =

53778b8292b5492 Vincent Knecht 2021-12-20  366  	snd_soc_component_write(co=
mponent, AK4375_14_DAC_CLK_DIVIDER, mdiv);
53778b8292b5492 Vincent Knecht 2021-12-20  367  =

53778b8292b5492 Vincent Knecht 2021-12-20  368  	dev_dbg(ak4375->dev, "rate=
=3D%d mclk=3D%d f_in=3D%d f_out=3D%d PLD=3D%d PLM=3D%d MDIV=3D%d DIV=3D%d\n=
",
53778b8292b5492 Vincent Knecht 2021-12-20  369  		ak4375->rate, mclk, freq_=
in, freq_out, ak4375->pld, plm, mdiv, div);
53778b8292b5492 Vincent Knecht 2021-12-20  370  =

53778b8292b5492 Vincent Knecht 2021-12-20  371  	return 0;
53778b8292b5492 Vincent Knecht 2021-12-20  372  }
53778b8292b5492 Vincent Knecht 2021-12-20  373  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1192165352647446769==--

