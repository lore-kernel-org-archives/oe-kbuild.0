Content-Type: multipart/mixed; boundary="===============0156107912744329748=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/2] clk: si5351: Add clock output phase offset
Date: Sat, 11 Dec 2021 14:45:49 +0800
Message-ID: <202112111413.KcZKLnJo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0156107912744329748==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211208154605.72476-1-renner@efe-gmbh.de>
References: <20211208154605.72476-1-renner@efe-gmbh.de>
TO: Jens Renner <renner@efe-gmbh.de>
TO: linux-clk(a)vger.kernel.org
CC: mturquette(a)baylibre.com
CC: sboyd(a)kernel.org
CC: sebastian.hesselbarth(a)gmail.com
CC: s.hauer(a)pengutronix.de
CC: devicetree(a)vger.kernel.org
CC: robh+dt(a)kernel.org
CC: renner(a)efe-gmbh.de

Hi Jens,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v5.16-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jens-Renner/clk-si5351-Add=
-phase-offset-for-clock-output/20211208-234754
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-n=
ext
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-c006-20211207 (https://download.01.org/0day-ci/arc=
hive/20211211/202112111413.KcZKLnJo-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/2e4aec73925b427049ef0fd8c=
d48e660eaff48fb
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jens-Renner/clk-si5351-Add-phase-o=
ffset-for-clock-output/20211208-234754
        git checkout 2e4aec73925b427049ef0fd8cd48e660eaff48fb
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                            ^
   drivers/media/dvb-frontends/stb0899_algo.c:404:5: note: The left operand=
 of '&' is a garbage value
                                   STB0899_SETFIELD_VAL(CFRM, cfr[0], MSB(i=
nternal->inversion * derot_freq));
                                   ^
   drivers/media/dvb-frontends/stb0899_priv.h:61:61: note: expanded from ma=
cro 'STB0899_SETFIELD_VAL'
   #define STB0899_SETFIELD_VAL(bitf, mask, val)   (mask =3D (mask & (~(((1=
 << STB0899_WIDTH_##bitf) - 1) <<\
                                                            ~~~~ ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/media/dvb-frontends/af9013.c:45:21: warning: Value stored to 'cl=
ient' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:45:21: note: Value stored to 'clien=
t' during its initialization is never read
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:108:21: warning: Value stored to 'c=
lient' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:108:21: note: Value stored to 'clie=
nt' during its initialization is never read
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:401:21: warning: Value stored to 'c=
lient' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:401:21: note: Value stored to 'clie=
nt' during its initialization is never read
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:518:21: warning: Value stored to 'c=
lient' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:518:21: note: Value stored to 'clie=
nt' during its initialization is never read
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:832:21: warning: Value stored to 'c=
lient' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:832:21: note: Value stored to 'clie=
nt' during its initialization is never read
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:980:21: warning: Value stored to 'c=
lient' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:980:21: note: Value stored to 'clie=
nt' during its initialization is never read
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:1166:21: warning: Value stored to '=
client' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:1166:21: note: Value stored to 'cli=
ent' during its initialization is never read
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:1185:21: warning: Value stored to '=
client' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:1185:21: note: Value stored to 'cli=
ent' during its initialization is never read
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:1239:21: warning: Value stored to '=
client' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:1239:21: note: Value stored to 'cli=
ent' during its initialization is never read
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:1260:21: warning: Value stored to '=
client' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:1260:21: note: Value stored to 'cli=
ent' during its initialization is never read
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/clk/clk-si5351.c:775:3: warning: Value stored to 'reg' is never =
read [clang-analyzer-deadcode.DeadStores]
                   reg =3D si5351_set_bits(hwdata->drvdata,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-si5351.c:775:3: note: Value stored to 'reg' is never read
                   reg =3D si5351_set_bits(hwdata->drvdata,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/clk-si5351.c:875:2: warning: Value stored to 'act_degrees' i=
s never read [clang-analyzer-deadcode.DeadStores]
           act_degrees =3D DIV_ROUND_CLOSEST_ULL(mul_u32_u32(90 * phoff, ra=
te),
           ^
   drivers/clk/clk-si5351.c:875:2: note: Value stored to 'act_degrees' is n=
ever read
>> drivers/clk/clk-si5351.c:1304:25: warning: Value stored to 'hwdata' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct si5351_hw_data *hwdata =3D
                                  ^~~~~~
   drivers/clk/clk-si5351.c:1304:25: note: Value stored to 'hwdata' during =
its initialization is never read
           struct si5351_hw_data *hwdata =3D
                                  ^~~~~~
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   20 warnings generated.
   drivers/media/tuners/mxl5005s.c:2668:3: warning: Value stored to 'Fmax' =
is never read [clang-analyzer-deadcode.DeadStores]
                   Fmax =3D FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2668:3: note: Value stored to 'Fmax' is =
never read
                   Fmax =3D FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2669:3: warning: Value stored to 'Fmin' =
is never read [clang-analyzer-deadcode.DeadStores]
                   Fmin =3D FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2669:3: note: Value stored to 'Fmin' is =
never read
                   Fmin =3D FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2677:3: warning: Value stored to 'Fmax' =
is never read [clang-analyzer-deadcode.DeadStores]
                   Fmax =3D FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2677:3: note: Value stored to 'Fmax' is =
never read
                   Fmax =3D FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2678:3: warning: Value stored to 'Fmin' =
is never read [clang-analyzer-deadcode.DeadStores]
                   Fmin =3D FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2678:3: note: Value stored to 'Fmin' is =
never read
                   Fmin =3D FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2686:3: warning: Value stored to 'Fmax' =
is never read [clang-analyzer-deadcode.DeadStores]
                   Fmax =3D FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2686:3: note: Value stored to 'Fmax' is =
never read
                   Fmax =3D FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2687:3: warning: Value stored to 'Fmin' =
is never read [clang-analyzer-deadcode.DeadStores]
                   Fmin =3D FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2687:3: note: Value stored to 'Fmin' is =
never read
                   Fmin =3D FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2695:3: warning: Value stored to 'Fmax' =
is never read [clang-analyzer-deadcode.DeadStores]
                   Fmax =3D FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2695:3: note: Value stored to 'Fmax' is =
never read
                   Fmax =3D FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2696:3: warning: Value stored to 'Fmin' =
is never read [clang-analyzer-deadcode.DeadStores]
                   Fmin =3D FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2696:3: note: Value stored to 'Fmin' is =
never read
                   Fmin =3D FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2704:3: warning: Value stored to 'Fmax' =
is never read [clang-analyzer-deadcode.DeadStores]
                   Fmax =3D FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2704:3: note: Value stored to 'Fmax' is =
never read
                   Fmax =3D FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2705:3: warning: Value stored to 'Fmin' =
is never read [clang-analyzer-deadcode.DeadStores]
                   Fmin =3D FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2705:3: note: Value stored to 'Fmin' is =
never read
                   Fmin =3D FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2713:3: warning: Value stored to 'Fmax' =
is never read [clang-analyzer-deadcode.DeadStores]
                   Fmax =3D FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2713:3: note: Value stored to 'Fmax' is =
never read
                   Fmax =3D FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2714:3: warning: Value stored to 'Fmin' =
is never read [clang-analyzer-deadcode.DeadStores]
                   Fmin =3D FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2714:3: note: Value stored to 'Fmin' is =
never read
                   Fmin =3D FminBin ;

vim +/act_degrees +875 drivers/clk/clk-si5351.c

9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  754  =

9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  755  static int si5351_msy=
nth_set_rate(struct clk_hw *hw, unsigned long rate,
9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  756  				  unsigned long p=
arent_rate)
9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  757  {
9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  758  	struct si5351_hw_dat=
a *hwdata =3D
9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  759  		container_of(hw, st=
ruct si5351_hw_data, hw);
9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  760  	u8 reg =3D si5351_ms=
ynth_params_address(hwdata->num);
9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  761  	int divby4 =3D 0;
9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  762  =

9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  763  	/* write multisynth =
parameters */
9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  764  	si5351_write_paramet=
ers(hwdata->drvdata, reg, &hwdata->params);
9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  765  =

9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  766  	if (rate > SI5351_MU=
LTISYNTH_DIVBY4_FREQ)
9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  767  		divby4 =3D 1;
9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  768  =

9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  769  	/* enable/disable in=
teger mode and divby4 on multisynth0-5 */
9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  770  	if (hwdata->num < 6)=
 {
9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  771  		si5351_set_bits(hwd=
ata->drvdata, reg + 2,
9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  772  				SI5351_OUTPUT_CLK=
_DIVBY4,
9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  773  				(divby4) ? SI5351=
_OUTPUT_CLK_DIVBY4 : 0);
2e4aec73925b42 Jens Renner           2021-12-08  774  		/* clear existing p=
hase offset */
2e4aec73925b42 Jens Renner           2021-12-08 @775  		reg =3D si5351_set_=
bits(hwdata->drvdata,
2e4aec73925b42 Jens Renner           2021-12-08  776  				SI5351_CLK0_PHASE=
_OFFSET + hwdata->num,
2e4aec73925b42 Jens Renner           2021-12-08  777  				SI5351_CLK_PHASE_=
OFFSET_MASK, 0);
9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  778  		si5351_set_bits(hwd=
ata->drvdata, SI5351_CLK0_CTRL + hwdata->num,
9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  779  			SI5351_CLK_INTEGER=
_MODE,
9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  780  			(hwdata->params.p2=
 =3D=3D 0) ? SI5351_CLK_INTEGER_MODE : 0);
9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  781  	}
9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  782  =

9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  783  	dev_dbg(&hwdata->drv=
data->client->dev,
9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  784  		"%s - %s: p1 =3D %l=
u, p2 =3D %lu, p3 =3D %lu, divby4 =3D %d, parent_rate =3D %lu, rate =3D %lu=
\n",
44f22a5d671ad8 Stephen Boyd          2015-08-07  785  		__func__, clk_hw_ge=
t_name(hw),
9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  786  		hwdata->params.p1, =
hwdata->params.p2, hwdata->params.p3,
9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  787  		divby4, parent_rate=
, rate);
9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  788  =

9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  789  	return 0;
9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  790  }
9abd5f0555df6c Sebastian Hesselbarth 2013-04-11  791  =

2e4aec73925b42 Jens Renner           2021-12-08  792  /*
2e4aec73925b42 Jens Renner           2021-12-08  793   * Initial phase offs=
et for MS0..5 can be set in 127 steps of T_vco/4.
2e4aec73925b42 Jens Renner           2021-12-08  794   * With a minimum MS =
divider a =3D 6, a theoretical maximum phase shift of
2e4aec73925b42 Jens Renner           2021-12-08  795   * ph_ms,max =3D 127 =
* 90 deg. / 6 =3D 1905 deg. is possible at the MS output.
2e4aec73925b42 Jens Renner           2021-12-08  796   *
2e4aec73925b42 Jens Renner           2021-12-08  797   * For a maximum R di=
vider of 128 though, CLKOUT could request a phase shift
2e4aec73925b42 Jens Renner           2021-12-08  798   * from the MS of up =
to 128 * 360 deg. =3D 46080 deg.
2e4aec73925b42 Jens Renner           2021-12-08  799   *
2e4aec73925b42 Jens Renner           2021-12-08  800   * (clk_set_phase() a=
pplies a limit of degrees %=3D 360 which means CLKOUT phase
2e4aec73925b42 Jens Renner           2021-12-08  801   * offsets will be re=
stricted to ph_clk < 180,..,3 deg. for RDIV =3D 2,..,128
2e4aec73925b42 Jens Renner           2021-12-08  802   * when not calling s=
i5351_msynth_set_phase() directly!)
2e4aec73925b42 Jens Renner           2021-12-08  803   */
2e4aec73925b42 Jens Renner           2021-12-08  804  static int si5351_msy=
nth_set_phase(struct clk_hw *hw, int degrees)
2e4aec73925b42 Jens Renner           2021-12-08  805  {
2e4aec73925b42 Jens Renner           2021-12-08  806  	struct si5351_hw_dat=
a *hwdata =3D
2e4aec73925b42 Jens Renner           2021-12-08  807  		container_of(hw, st=
ruct si5351_hw_data, hw);
2e4aec73925b42 Jens Renner           2021-12-08  808  	struct clk_hw *paren=
t_hw;
2e4aec73925b42 Jens Renner           2021-12-08  809  	unsigned long parent=
_rate, rate;
2e4aec73925b42 Jens Renner           2021-12-08  810  	unsigned int phoff, =
act_degrees, tmp;
2e4aec73925b42 Jens Renner           2021-12-08  811  	bool fractmode;
2e4aec73925b42 Jens Renner           2021-12-08  812  =

2e4aec73925b42 Jens Renner           2021-12-08  813  	/*
2e4aec73925b42 Jens Renner           2021-12-08  814  	 * To leverage the f=
ull phase offset range for high ratios of
2e4aec73925b42 Jens Renner           2021-12-08  815  	 * f_vco/f_clk, set =
the theoretical limit to ph_ms,max < 1905 deg.
2e4aec73925b42 Jens Renner           2021-12-08  816  	 * The later calcula=
tion could still fail for large phase-divider
2e4aec73925b42 Jens Renner           2021-12-08  817  	 * products (i.e. ph=
_ms * a =3D ph_ms * f_vco/f_ms > ph_vco,max).
2e4aec73925b42 Jens Renner           2021-12-08  818  	 */
2e4aec73925b42 Jens Renner           2021-12-08  819  	if ((degrees < 0) ||=
 (degrees >=3D 127*90/SI5351_MULTISYNTH_A_MIN) ||
2e4aec73925b42 Jens Renner           2021-12-08  820  	    (hwdata->num > 5=
)) {
2e4aec73925b42 Jens Renner           2021-12-08  821  		dev_err(&hwdata->dr=
vdata->client->dev,
2e4aec73925b42 Jens Renner           2021-12-08  822  			"Phase offset of %=
d degrees is not allowed for %s.\n",
2e4aec73925b42 Jens Renner           2021-12-08  823  			degrees, clk_hw_ge=
t_name(hw));
2e4aec73925b42 Jens Renner           2021-12-08  824  		return -EINVAL;
2e4aec73925b42 Jens Renner           2021-12-08  825  	}
2e4aec73925b42 Jens Renner           2021-12-08  826  =

2e4aec73925b42 Jens Renner           2021-12-08  827  	/*
2e4aec73925b42 Jens Renner           2021-12-08  828  	 * Requested phase o=
ffset refers to multisynth output (ph_ms).
2e4aec73925b42 Jens Renner           2021-12-08  829  	 * CLKx_PHOFF[6:0] =
=3D round(t_off * 4 * f_vco)
2e4aec73925b42 Jens Renner           2021-12-08  830  	 * Convert phase off=
set for f_ms to steps of 4 x f_vco:
2e4aec73925b42 Jens Renner           2021-12-08  831  	 * ph_offs =3D ph_ms=
 * (a + b/c) / 90 =3D ph_ms * (f_vco / f_ms) / 90
2e4aec73925b42 Jens Renner           2021-12-08  832  	 */
2e4aec73925b42 Jens Renner           2021-12-08  833  	parent_hw =3D clk_hw=
_get_parent(hw);
2e4aec73925b42 Jens Renner           2021-12-08  834  	parent_rate =3D clk_=
get_rate(parent_hw->clk);
2e4aec73925b42 Jens Renner           2021-12-08  835  	rate =3D clk_get_rat=
e(hw->clk);
2e4aec73925b42 Jens Renner           2021-12-08  836  =

2e4aec73925b42 Jens Renner           2021-12-08  837  	tmp =3D DIV_ROUND_CL=
OSEST_ULL(mul_u32_u32(parent_rate, degrees), rate);
2e4aec73925b42 Jens Renner           2021-12-08  838  	phoff =3D tmp/90;
2e4aec73925b42 Jens Renner           2021-12-08  839  =

2e4aec73925b42 Jens Renner           2021-12-08  840  	if (phoff > 127) {
2e4aec73925b42 Jens Renner           2021-12-08  841  		dev_err(&hwdata->dr=
vdata->client->dev,
2e4aec73925b42 Jens Renner           2021-12-08  842  			"Phase offset of %=
d degrees (%d steps) not possible for chosen rates of %s.\n",
2e4aec73925b42 Jens Renner           2021-12-08  843  			degrees, phoff, cl=
k_hw_get_name(hw));
2e4aec73925b42 Jens Renner           2021-12-08  844  		return -EINVAL;
2e4aec73925b42 Jens Renner           2021-12-08  845  	}
2e4aec73925b42 Jens Renner           2021-12-08  846  =

2e4aec73925b42 Jens Renner           2021-12-08  847  	/*
2e4aec73925b42 Jens Renner           2021-12-08  848  	 * Fractional mode s=
hould be used for phase offsets, but works only
2e4aec73925b42 Jens Renner           2021-12-08  849  	 * for dividers a + =
b/c >=3D 8! (P1 =3D 128 * a + floor(128*b/c) - 512).
2e4aec73925b42 Jens Renner           2021-12-08  850  	 * (For RDIVBY4 =3D =
11b, P1 =3D 0, P2 =3D 0, P3 =3D 1.)
2e4aec73925b42 Jens Renner           2021-12-08  851  	 * Hence, use fract.=
 mode for P2 !=3D 0, or P1 >=3D 512 with phase offset.
2e4aec73925b42 Jens Renner           2021-12-08  852  	 */
2e4aec73925b42 Jens Renner           2021-12-08  853  	fractmode =3D ((hwda=
ta->params.p2 !=3D 0) ||
2e4aec73925b42 Jens Renner           2021-12-08  854  		     ((phoff > 0) &=
& (hwdata->params.p1 >=3D 512)));
2e4aec73925b42 Jens Renner           2021-12-08  855  =

2e4aec73925b42 Jens Renner           2021-12-08  856  	si5351_set_bits(hwda=
ta->drvdata, SI5351_CLK0_CTRL + hwdata->num,
2e4aec73925b42 Jens Renner           2021-12-08  857  		SI5351_CLK_INTEGER_=
MODE,
2e4aec73925b42 Jens Renner           2021-12-08  858  		(fractmode) ? 0 : S=
I5351_CLK_INTEGER_MODE);
2e4aec73925b42 Jens Renner           2021-12-08  859  =

2e4aec73925b42 Jens Renner           2021-12-08  860  	/*
2e4aec73925b42 Jens Renner           2021-12-08  861  	 * For a MS rate f_m=
s > 112.5 MHz, only dividers a < 8 are possible and
2e4aec73925b42 Jens Renner           2021-12-08  862  	 * fractional mode c=
annot be used. Issue a warning and continue.
2e4aec73925b42 Jens Renner           2021-12-08  863  	 * (Tested & works f=
or f_ms =3D 128 MHz, a =3D 7, and ph_vco =3D 7 * 90 deg.)
2e4aec73925b42 Jens Renner           2021-12-08  864  	 */
2e4aec73925b42 Jens Renner           2021-12-08  865  	if ((phoff > 0) && !=
fractmode) {
2e4aec73925b42 Jens Renner           2021-12-08  866  		dev_warn(&hwdata->d=
rvdata->client->dev,
2e4aec73925b42 Jens Renner           2021-12-08  867  			 "Fract. mode cann=
ot be set for divider of %s. Continue with int. mode.\n",
2e4aec73925b42 Jens Renner           2021-12-08  868  			 clk_hw_get_name(h=
w));
2e4aec73925b42 Jens Renner           2021-12-08  869  	}
2e4aec73925b42 Jens Renner           2021-12-08  870  =

2e4aec73925b42 Jens Renner           2021-12-08  871  	si5351_set_bits(hwda=
ta->drvdata,
2e4aec73925b42 Jens Renner           2021-12-08  872  			SI5351_CLK0_PHASE_=
OFFSET + hwdata->num,
2e4aec73925b42 Jens Renner           2021-12-08  873  			SI5351_CLK_PHASE_O=
FFSET_MASK, phoff);
2e4aec73925b42 Jens Renner           2021-12-08  874  =

2e4aec73925b42 Jens Renner           2021-12-08 @875  	act_degrees =3D DIV_=
ROUND_CLOSEST_ULL(mul_u32_u32(90 * phoff, rate),
2e4aec73925b42 Jens Renner           2021-12-08  876  					    parent_rate);
2e4aec73925b42 Jens Renner           2021-12-08  877  =

2e4aec73925b42 Jens Renner           2021-12-08  878  	dev_dbg(&hwdata->drv=
data->client->dev,
2e4aec73925b42 Jens Renner           2021-12-08  879  		"%s - %s: degrees =
=3D %d, actual =3D %d, phoff steps =3D %u, mode =3D %c. PLL needs reset!\n",
2e4aec73925b42 Jens Renner           2021-12-08  880  		__func__, clk_hw_ge=
t_name(hw),
2e4aec73925b42 Jens Renner           2021-12-08  881  		degrees, act_degree=
s, phoff, (fractmode) ? 'f' : 'i');
2e4aec73925b42 Jens Renner           2021-12-08  882  =

2e4aec73925b42 Jens Renner           2021-12-08  883  	return 0;
2e4aec73925b42 Jens Renner           2021-12-08  884  }
2e4aec73925b42 Jens Renner           2021-12-08  885  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0156107912744329748==--

