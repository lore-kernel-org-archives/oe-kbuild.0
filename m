Content-Type: multipart/mixed; boundary="===============0676072231244685304=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/codecs/ak4375.c:343:3: warning: Value stored to 'mclk' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 28 Jan 2022 08:14:28 +0800
Message-ID: <202201280858.hYBJaCzK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0676072231244685304==
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
head:   626b2dda7651a7c766108db4cdc0825db05b980d
commit: 53778b8292b5492ec3ecf1efb84163eac2a6e422 ASoC: Add AK4375 support
date:   5 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 5 weeks ago
config: riscv-randconfig-c006-20220126 (https://download.01.org/0day-ci/arc=
hive/20220128/202201280858.hYBJaCzK-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2a1b7a=
a016c0f4b5598806205bdfbab1ea2d92c4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D53778b8292b5492ec3ecf1efb84163eac2a6e422
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 53778b8292b5492ec3ecf1efb84163eac2a6e422
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/src.c:117:29: note: RSND_MOD_SRC is < RSND_MOD_MAX
           struct rsnd_mod *src_mod =3D rsnd_io_to_mod_src(io);
                                      ^
   sound/soc/sh/rcar/rsnd.h:521:32: note: expanded from macro 'rsnd_io_to_m=
od_src'
   #define rsnd_io_to_mod_src(io)  rsnd_io_to_mod((io), RSND_MOD_SRC)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/rsnd.h:517:32: note: expanded from macro 'rsnd_io_to_m=
od'
   #define rsnd_io_to_mod(io, i)   ((i) < RSND_MOD_MAX ? (io)->mod[(i)] : N=
ULL)
                                    ^~~
   sound/soc/sh/rcar/src.c:117:29: note: '?' condition is true
           struct rsnd_mod *src_mod =3D rsnd_io_to_mod_src(io);
                                      ^
   sound/soc/sh/rcar/rsnd.h:521:32: note: expanded from macro 'rsnd_io_to_m=
od_src'
   #define rsnd_io_to_mod_src(io)  rsnd_io_to_mod((io), RSND_MOD_SRC)
                                   ^
   sound/soc/sh/rcar/rsnd.h:517:32: note: expanded from macro 'rsnd_io_to_m=
od'
   #define rsnd_io_to_mod(io, i)   ((i) < RSND_MOD_MAX ? (io)->mod[(i)] : N=
ULL)
                                    ^
   sound/soc/sh/rcar/src.c:118:36: note: Field 'substream' is non-null
           struct snd_pcm_runtime *runtime =3D rsnd_io_to_runtime(io);
                                             ^
   sound/soc/sh/rcar/rsnd.h:529:39: note: expanded from macro 'rsnd_io_to_r=
untime'
   #define rsnd_io_to_runtime(io) ((io)->substream ? \
                                         ^
   sound/soc/sh/rcar/src.c:118:36: note: '?' condition is true
           struct snd_pcm_runtime *runtime =3D rsnd_io_to_runtime(io);
                                             ^
   sound/soc/sh/rcar/rsnd.h:529:33: note: expanded from macro 'rsnd_io_to_r=
untime'
   #define rsnd_io_to_runtime(io) ((io)->substream ? \
                                   ^
   sound/soc/sh/rcar/src.c:130:6: note: Assuming 'is_play' is equal to 'is_=
in'
           if (is_play =3D=3D is_in)
               ^~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/src.c:130:2: note: Taking true branch
           if (is_play =3D=3D is_in)
           ^
   sound/soc/sh/rcar/src.c:131:3: note: Returning zero
                   return runtime->rate;
                   ^~~~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/src.c:222:9: note: Returning from 'rsnd_src_get_rate'
           fout =3D rsnd_src_get_out_rate(priv, io);
                  ^
   sound/soc/sh/rcar/rsnd.h:818:41: note: expanded from macro 'rsnd_src_get=
_out_rate'
   #define rsnd_src_get_out_rate(priv, io) rsnd_src_get_rate(priv, io, 0)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/src.c:222:2: note: The value 0 is assigned to 'fout'
           fout =3D rsnd_src_get_out_rate(priv, io);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/src.c:227:6: note: 'fin' is equal to 'fout'
           if (fin =3D=3D fout)
               ^~~
   sound/soc/sh/rcar/src.c:227:2: note: Taking true branch
           if (fin =3D=3D fout)
           ^
   sound/soc/sh/rcar/src.c:234:6: note: 'ratio' is <=3D 600
           if (ratio > 600) {
               ^~~~~
   sound/soc/sh/rcar/src.c:234:2: note: Taking false branch
           if (ratio > 600) {
           ^
   sound/soc/sh/rcar/src.c:251:6: note: Assuming 'use_src' is not equal to 0
           if (use_src) {
               ^~~~~~~
   sound/soc/sh/rcar/src.c:251:2: note: Taking true branch
           if (use_src) {
           ^
   sound/soc/sh/rcar/src.c:256:3: note: '__base' initialized to 0
                   do_div(n, fout);
                   ^
   include/asm-generic/div64.h:220:2: note: expanded from macro 'do_div'
           uint32_t __base =3D (base);                       \
           ^~~~~~~~~~~~~~~
   sound/soc/sh/rcar/src.c:256:3: note: Left side of '&&' is false
                   do_div(n, fout);
                   ^
   include/asm-generic/div64.h:223:35: note: expanded from macro 'do_div'
           if (__builtin_constant_p(__base) &&             \
                                            ^
   sound/soc/sh/rcar/src.c:256:3: note: Left side of '&&' is false
                   do_div(n, fout);
                   ^
   include/asm-generic/div64.h:227:42: note: expanded from macro 'do_div'
           } else if (__builtin_constant_p(__base) &&      \
                                                   ^
   sound/soc/sh/rcar/src.c:256:3: note: Taking true branch
                   do_div(n, fout);
                   ^
   include/asm-generic/div64.h:234:9: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                  ^
   sound/soc/sh/rcar/src.c:256:3: note: Division by zero
                   do_div(n, fout);
                   ^
   include/asm-generic/div64.h:235:25: note: expanded from macro 'do_div'
                   __rem =3D (uint32_t)(n) % __base;         \
                           ~~~~~~~~~~~~~~^~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
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
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
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
   sound/soc/codecs/ak4613.c:402:2: warning: Value stored to 'fmt_ctrl' is =
never read [clang-analyzer-deadcode.DeadStores]
           fmt_ctrl =3D NO_FMT;
           ^
   sound/soc/codecs/ak4613.c:402:2: note: Value stored to 'fmt_ctrl' is nev=
er read
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
   6 warnings generated.
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
   10 warnings generated.
   sound/soc/codecs/arizona.c:1378:3: warning: Value stored to 'name' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   name =3D "SYSCLK";
                   ^      ~~~~~~~~
   sound/soc/codecs/arizona.c:1378:3: note: Value stored to 'name' is never=
 read
                   name =3D "SYSCLK";
                   ^      ~~~~~~~~
   sound/soc/codecs/arizona.c:1384:3: warning: Value stored to 'name' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   name =3D "ASYNCCLK";
                   ^      ~~~~~~~~~~
   sound/soc/codecs/arizona.c:1384:3: note: Value stored to 'name' is never=
 read
                   name =3D "ASYNCCLK";
                   ^      ~~~~~~~~~~
   sound/soc/codecs/arizona.c:2333:2: warning: 4th function call argument i=
s an uninitialized value [clang-analyzer-core.CallAndMessage]
           regmap_update_bits_async(arizona->regmap, base + 3,
           ^
   sound/soc/codecs/arizona.c:2584:6: note: Assuming 'source' is not equal =
to field 'sync_src'
           if (fll->sync_src =3D=3D source &&
               ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/arizona.c:2584:30: note: Left side of '&&' is false
           if (fll->sync_src =3D=3D source &&
                                       ^
   sound/soc/codecs/arizona.c:2588:6: note: Assuming 'Fout' is not equal to=
 0
           if (Fout) {
               ^~~~
   sound/soc/codecs/arizona.c:2588:2: note: Taking true branch
           if (Fout) {
           ^
   sound/soc/codecs/arizona.c:2589:7: note: Assuming field 'ref_src' is < 0
                   if (fll->ref_src >=3D 0) {
                       ^~~~~~~~~~~~~~~~~
   sound/soc/codecs/arizona.c:2589:3: note: Taking false branch
                   if (fll->ref_src >=3D 0) {
                   ^
   sound/soc/codecs/arizona.c:2596:7: note: 'ret' is equal to 0
                   if (ret !=3D 0)
                       ^~~
   sound/soc/codecs/arizona.c:2596:3: note: Taking false branch
                   if (ret !=3D 0)
                   ^
   sound/soc/codecs/arizona.c:2604:6: note: 'Fout' is not equal to 0
           if (Fout)
               ^~~~
   sound/soc/codecs/arizona.c:2604:2: note: Taking true branch
           if (Fout)
           ^
   sound/soc/codecs/arizona.c:2605:9: note: Calling 'arizona_enable_fll'
                   ret =3D arizona_enable_fll(fll);
                         ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/arizona.c:2426:6: note: 'already_enabled' is >=3D 0
           if (already_enabled < 0)
               ^~~~~~~~~~~~~~~
   sound/soc/codecs/arizona.c:2426:2: note: Taking false branch
           if (already_enabled < 0)
           ^
   sound/soc/codecs/arizona.c:2428:6: note: 'sync_enabled' is >=3D 0
           if (sync_enabled < 0)
               ^~~~~~~~~~~~
   sound/soc/codecs/arizona.c:2428:2: note: Taking false branch
           if (sync_enabled < 0)
           ^
   sound/soc/codecs/arizona.c:2431:6: note: Assuming 'already_enabled' is 0
           if (already_enabled) {
               ^~~~~~~~~~~~~~~
   sound/soc/codecs/arizona.c:2431:2: note: Taking false branch

vim +/mclk +343 sound/soc/codecs/ak4375.c

53778b8292b549 Vincent Knecht 2021-12-20  280  =

53778b8292b549 Vincent Knecht 2021-12-20  281  static int ak4375_dai_set_pl=
l(struct snd_soc_dai *dai, int pll_id, int source,
53778b8292b549 Vincent Knecht 2021-12-20  282  			      unsigned int freq_i=
n, unsigned int freq_out)
53778b8292b549 Vincent Knecht 2021-12-20  283  {
53778b8292b549 Vincent Knecht 2021-12-20  284  	struct snd_soc_component *c=
omponent =3D dai->component;
53778b8292b549 Vincent Knecht 2021-12-20  285  	struct ak4375_priv *ak4375 =
=3D snd_soc_component_get_drvdata(component);
53778b8292b549 Vincent Knecht 2021-12-20  286  	unsigned int mclk, plm, mdi=
v, div;
53778b8292b549 Vincent Knecht 2021-12-20  287  	u8 cms, fs, cm;
53778b8292b549 Vincent Knecht 2021-12-20  288  =

53778b8292b549 Vincent Knecht 2021-12-20  289  	cms =3D snd_soc_component_r=
ead(component, AK4375_05_CLOCK_MODE_SELECT);
53778b8292b549 Vincent Knecht 2021-12-20  290  	fs =3D cms & ~FS_MASK;
53778b8292b549 Vincent Knecht 2021-12-20  291  	cm =3D cms & ~CM_MASK;
53778b8292b549 Vincent Knecht 2021-12-20  292  =

53778b8292b549 Vincent Knecht 2021-12-20  293  	switch (ak4375->rate) {
53778b8292b549 Vincent Knecht 2021-12-20  294  	case 8000:
53778b8292b549 Vincent Knecht 2021-12-20  295  		fs |=3D FS_8KHZ;
53778b8292b549 Vincent Knecht 2021-12-20  296  		break;
53778b8292b549 Vincent Knecht 2021-12-20  297  	case 11025:
53778b8292b549 Vincent Knecht 2021-12-20  298  		fs |=3D FS_11_025KHZ;
53778b8292b549 Vincent Knecht 2021-12-20  299  		break;
53778b8292b549 Vincent Knecht 2021-12-20  300  	case 16000:
53778b8292b549 Vincent Knecht 2021-12-20  301  		fs |=3D FS_16KHZ;
53778b8292b549 Vincent Knecht 2021-12-20  302  		break;
53778b8292b549 Vincent Knecht 2021-12-20  303  	case 22050:
53778b8292b549 Vincent Knecht 2021-12-20  304  		fs |=3D FS_22_05KHZ;
53778b8292b549 Vincent Knecht 2021-12-20  305  		break;
53778b8292b549 Vincent Knecht 2021-12-20  306  	case 32000:
53778b8292b549 Vincent Knecht 2021-12-20  307  		fs |=3D FS_32KHZ;
53778b8292b549 Vincent Knecht 2021-12-20  308  		break;
53778b8292b549 Vincent Knecht 2021-12-20  309  	case 44100:
53778b8292b549 Vincent Knecht 2021-12-20  310  		fs |=3D FS_44_1KHZ;
53778b8292b549 Vincent Knecht 2021-12-20  311  		break;
53778b8292b549 Vincent Knecht 2021-12-20  312  	case 48000:
53778b8292b549 Vincent Knecht 2021-12-20  313  		fs |=3D FS_48KHZ;
53778b8292b549 Vincent Knecht 2021-12-20  314  		break;
53778b8292b549 Vincent Knecht 2021-12-20  315  	case 88200:
53778b8292b549 Vincent Knecht 2021-12-20  316  		fs |=3D FS_88_2KHZ;
53778b8292b549 Vincent Knecht 2021-12-20  317  		break;
53778b8292b549 Vincent Knecht 2021-12-20  318  	case 96000:
53778b8292b549 Vincent Knecht 2021-12-20  319  		fs |=3D FS_96KHZ;
53778b8292b549 Vincent Knecht 2021-12-20  320  		break;
53778b8292b549 Vincent Knecht 2021-12-20  321  	case 176400:
53778b8292b549 Vincent Knecht 2021-12-20  322  		fs |=3D FS_176_4KHZ;
53778b8292b549 Vincent Knecht 2021-12-20  323  		break;
53778b8292b549 Vincent Knecht 2021-12-20  324  	case 192000:
53778b8292b549 Vincent Knecht 2021-12-20  325  		fs |=3D FS_192KHZ;
53778b8292b549 Vincent Knecht 2021-12-20  326  		break;
53778b8292b549 Vincent Knecht 2021-12-20  327  	default:
53778b8292b549 Vincent Knecht 2021-12-20  328  		return -EINVAL;
53778b8292b549 Vincent Knecht 2021-12-20  329  	}
53778b8292b549 Vincent Knecht 2021-12-20  330  =

53778b8292b549 Vincent Knecht 2021-12-20  331  	if (ak4375->rate <=3D 24000=
) {
53778b8292b549 Vincent Knecht 2021-12-20  332  		cm |=3D CM_1;
53778b8292b549 Vincent Knecht 2021-12-20  333  		mclk =3D 512 * ak4375->rat=
e;
53778b8292b549 Vincent Knecht 2021-12-20  334  		mdiv =3D freq_out / mclk -=
 1;
53778b8292b549 Vincent Knecht 2021-12-20  335  		div =3D 0;
53778b8292b549 Vincent Knecht 2021-12-20  336  	} else if (ak4375->rate <=
=3D 96000) {
53778b8292b549 Vincent Knecht 2021-12-20  337  		cm |=3D CM_0;
53778b8292b549 Vincent Knecht 2021-12-20  338  		mclk =3D 256 * ak4375->rat=
e;
53778b8292b549 Vincent Knecht 2021-12-20  339  		mdiv =3D freq_out / mclk -=
 1;
53778b8292b549 Vincent Knecht 2021-12-20  340  		div =3D 0;
53778b8292b549 Vincent Knecht 2021-12-20  341  	} else {
53778b8292b549 Vincent Knecht 2021-12-20  342  		cm |=3D CM_3;
53778b8292b549 Vincent Knecht 2021-12-20 @343  		mclk =3D 128 * ak4375->rat=
e;
53778b8292b549 Vincent Knecht 2021-12-20  344  		mdiv =3D 4;
53778b8292b549 Vincent Knecht 2021-12-20  345  		div =3D 1;
53778b8292b549 Vincent Knecht 2021-12-20  346  	}
53778b8292b549 Vincent Knecht 2021-12-20  347  =

53778b8292b549 Vincent Knecht 2021-12-20  348  	/* Writing both fields in o=
ne go seems to make playback choppy on start */
53778b8292b549 Vincent Knecht 2021-12-20  349  	snd_soc_component_update_bi=
ts(component, AK4375_05_CLOCK_MODE_SELECT, FS_MASK, fs);
53778b8292b549 Vincent Knecht 2021-12-20  350  	snd_soc_component_update_bi=
ts(component, AK4375_05_CLOCK_MODE_SELECT, CM_MASK, cm);
53778b8292b549 Vincent Knecht 2021-12-20  351  =

53778b8292b549 Vincent Knecht 2021-12-20  352  	snd_soc_component_write(com=
ponent, AK4375_0F_PLL_REF_CLK_DIVIDER1,
53778b8292b549 Vincent Knecht 2021-12-20  353  				(ak4375->pld & 0xff00) >=
> 8);
53778b8292b549 Vincent Knecht 2021-12-20  354  	snd_soc_component_write(com=
ponent, AK4375_10_PLL_REF_CLK_DIVIDER2,
53778b8292b549 Vincent Knecht 2021-12-20  355  				ak4375->pld & 0x00ff);
53778b8292b549 Vincent Knecht 2021-12-20  356  =

53778b8292b549 Vincent Knecht 2021-12-20  357  	plm =3D freq_out / freq_in =
- 1;
53778b8292b549 Vincent Knecht 2021-12-20  358  	snd_soc_component_write(com=
ponent, AK4375_11_PLL_FB_CLK_DIVIDER1, (plm & 0xff00) >> 8);
53778b8292b549 Vincent Knecht 2021-12-20  359  	snd_soc_component_write(com=
ponent, AK4375_12_PLL_FB_CLK_DIVIDER2, plm & 0x00ff);
53778b8292b549 Vincent Knecht 2021-12-20  360  =

53778b8292b549 Vincent Knecht 2021-12-20  361  	snd_soc_component_update_bi=
ts(component, AK4375_13_SRC_CLK_SOURCE, DIV, div);
53778b8292b549 Vincent Knecht 2021-12-20  362  =

53778b8292b549 Vincent Knecht 2021-12-20  363  	/* SRCCKS bit: force to 1 f=
or SRC PLL source clock */
53778b8292b549 Vincent Knecht 2021-12-20  364  	snd_soc_component_update_bi=
ts(component, AK4375_13_SRC_CLK_SOURCE, SRCCKS, SRCCKS);
53778b8292b549 Vincent Knecht 2021-12-20  365  =

53778b8292b549 Vincent Knecht 2021-12-20  366  	snd_soc_component_write(com=
ponent, AK4375_14_DAC_CLK_DIVIDER, mdiv);
53778b8292b549 Vincent Knecht 2021-12-20  367  =

53778b8292b549 Vincent Knecht 2021-12-20  368  	dev_dbg(ak4375->dev, "rate=
=3D%d mclk=3D%d f_in=3D%d f_out=3D%d PLD=3D%d PLM=3D%d MDIV=3D%d DIV=3D%d\n=
",
53778b8292b549 Vincent Knecht 2021-12-20  369  		ak4375->rate, mclk, freq_i=
n, freq_out, ak4375->pld, plm, mdiv, div);
53778b8292b549 Vincent Knecht 2021-12-20  370  =

53778b8292b549 Vincent Knecht 2021-12-20  371  	return 0;
53778b8292b549 Vincent Knecht 2021-12-20  372  }
53778b8292b549 Vincent Knecht 2021-12-20  373  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0676072231244685304==--

