Content-Type: multipart/mixed; boundary="===============7016483060973629875=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/clk/imx/clk-pll14xx.c:166:2: warning: Value stored to 'pll_div_ctl1' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 06 Apr 2022 11:13:04 +0800
Message-ID: <202204061157.YnSNlQr3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7016483060973629875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Sascha Hauer <s.hauer@pengutronix.de>
CC: Abel Vesa <abel.vesa@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3e732ebf7316ac83e8562db7e64cc68aec390a18
commit: b09c68dc57c9d44071d83bb935b733f53ea2b2b4 clk: imx: pll14xx: Support=
 dynamic rates
date:   5 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c002-20220404 (https://download.01.org/0day-ci/archi=
ve/20220406/202204061157.YnSNlQr3-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b0=
7d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db09c68dc57c9d44071d83bb935b733f53ea2b2b4
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b09c68dc57c9d44071d83bb935b733f53ea2b2b4
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:250:2: note: Taking fa=
lse branch
           if (kstrtoul(buf, 0, &val))
           ^
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:255:6: note: Assuming =
'pcached_val' is null
           if (pcached_val)
               ^~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:255:6: note: Assuming =
pointer value is null
           if (pcached_val)
               ^~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:255:2: note: Taking fa=
lse branch
           if (pcached_val)
           ^
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:259:7: note: 'reg_offs=
et' is >=3D 0
           if ((reg_offset >=3D 0) && cti_active(config))
                ^~~~~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:259:6: note: Left side=
 of '&&' is true
           if ((reg_offset >=3D 0) && cti_active(config))
               ^
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:259:38: note: Passing =
value via 1st parameter 'cfg'
           if ((reg_offset >=3D 0) && cti_active(config))
                                               ^~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:259:27: note: Calling =
'cti_active'
           if ((reg_offset >=3D 0) && cti_active(config))
                                    ^~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-cti.h:238:9: note: Access to field=
 'hw_powered' results in a dereference of a null pointer (loaded from varia=
ble 'cfg')
           return cfg->hw_powered && cfg->hw_enabled;
                  ^~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   drivers/clocksource/timer-of.c:191:3: warning: Value stored to 'flags' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   flags |=3D TIMER_OF_IRQ;
                   ^
   drivers/clocksource/timer-of.c:191:3: note: Value stored to 'flags' is n=
ever read
   Suppressed 1 warnings (1 in non-user code).
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
   3 warnings generated.
   drivers/clocksource/timer-imx-gpt.c:263:2: warning: Value stored to 'tst=
at' is never read [clang-analyzer-deadcode.DeadStores]
           tstat =3D readl_relaxed(imxtm->base + imxtm->gpt->reg_tstat);
           ^
   drivers/clocksource/timer-imx-gpt.c:263:2: note: Value stored to 'tstat'=
 is never read
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   sound/soc/codecs/cs42l42.c:605:8: warning: Excessive padding in 'struct =
cs42l42_pll_params' (5 padding bytes, where 1 is optimal). =

   Optimal fields order: =

   sclk, =

   pll_div_frac, =

   mclk_int, =

   mclk_src_sel, =

   sclk_prediv, =

   pll_div_int, =

   pll_mode, =

   pll_divout, =

   pll_cal_ratio, =

   n, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct cs42l42_pll_params {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs42l42.c:605:8: note: Excessive padding in 'struct cs4=
2l42_pll_params' (5 padding bytes, where 1 is optimal). Optimal fields orde=
r: sclk, pll_div_frac, mclk_int, mclk_src_sel, sclk_prediv, pll_div_int, pl=
l_mode, pll_divout, pll_cal_ratio, n, consider reordering the fields or add=
ing explicit padding members
   struct cs42l42_pll_params {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/hwtracing/coresight/coresight-cti-core.c:447:2: warning: Value s=
tored to 'reg_value' is never read [clang-analyzer-deadcode.DeadStores]
           reg_value =3D config->ctiappset;
           ^           ~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-cti-core.c:447:2: note: Value stor=
ed to 'reg_value' is never read
           reg_value =3D config->ctiappset;
           ^           ~~~~~~~~~~~~~~~~~
   7 warnings generated.
   fs/ext4/super.c:5543:3: warning: Value stored to 'ret' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   ret =3D -ENOMEM;
                   ^     ~~~~~~~
   fs/ext4/super.c:5543:3: note: Value stored to 'ret' is never read
                   ret =3D -ENOMEM;
                   ^     ~~~~~~~
   Suppressed 6 warnings (2 in non-user code, 4 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/clk/imx/clk-pll14xx.c:166:2: warning: Value stored to 'pll_div_c=
tl1' is never read [clang-analyzer-deadcode.DeadStores]
           pll_div_ctl1 =3D readl_relaxed(pll->base + DIV_CTL1);
           ^
   drivers/clk/imx/clk-pll14xx.c:166:2: note: Value stored to 'pll_div_ctl1=
' is never read
   1 warning generated.
   drivers/mmc/core/sdio_cis.c:63:3: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(string, buf);
                   ^~~~~~
   drivers/mmc/core/sdio_cis.c:63:3: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
                   strcpy(string, buf);
                   ^~~~~~
   1 warning generated.
   drivers/mmc/core/regulator.c:181:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mmc_dev(mmc);
                          ^~~
   drivers/mmc/core/regulator.c:181:17: note: Value stored to 'dev' during =
its initialization is never read
           struct device *dev =3D mmc_dev(mmc);
                          ^~~
   1 warning generated.
   drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c:366:3: warning: Value=
 stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                   err =3D PTR_ERR(kingdisplay->enable_gpio);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c:366:3: note: Value st=
ored to 'err' is never read
                   err =3D PTR_ERR(kingdisplay->enable_gpio);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c:59:17: warning: Value s=
tored to 'dev' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
   drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c:59:17: note: Value stor=
ed to 'dev' during its initialization is never read
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
   1 warning generated.
   sound/soc/codecs/rt700.c:127:3: warning: Value stored to 'ret' is never =
read [clang-analyzer-deadcode.DeadStores]
                   ret =3D regmap_read(rt700->regmap, reg, &jack_status);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/rt700.c:127:3: note: Value stored to 'ret' is never read
                   ret =3D regmap_read(rt700->regmap, reg, &jack_status);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   sound/soc/codecs/rt711.c:95:2: warning: Value stored to 'dev' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           dev =3D regmap_get_device(regmap);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/rt711.c:95:2: note: Value stored to 'dev' is never read
           dev =3D regmap_get_device(regmap);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.
   drivers/fpga/dfl-afu-dma-region.c:38:17: warning: Value stored to 'dev' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &pdata->dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/fpga/dfl-afu-dma-region.c:38:17: note: Value stored to 'dev' dur=
ing its initialization is never read
           struct device *dev =3D &pdata->dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/fpga/dfl-afu-dma-region.c:86:17: warning: Value stored to 'dev' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &pdata->dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/fpga/dfl-afu-dma-region.c:86:17: note: Value stored to 'dev' dur=
ing its initialization is never read
           struct device *dev =3D &pdata->dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/fpga/dfl-afu-dma-region.c:249:17: warning: Value stored to 'dev'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct device *dev =3D &pdata->dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/fpga/dfl-afu-dma-region.c:249:17: note: Value stored to 'dev' du=
ring its initialization is never read
           struct device *dev =3D &pdata->dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   2 warnings generated.
   drivers/video/fbdev/core/fbcvt.c:261:4: warning: Value stored to 'cnt' i=
s never read [clang-analyzer-deadcode.DeadStores]
                           cnt -=3D read;
                           ^      ~~~~
   drivers/video/fbdev/core/fbcvt.c:261:4: note: Value stored to 'cnt' is n=
ever read
                           cnt -=3D read;
                           ^      ~~~~
   drivers/video/fbdev/core/fbcvt.c:262:4: warning: Value stored to 'offset=
' is never read [clang-analyzer-deadcode.DeadStores]
                           offset +=3D read;
                           ^         ~~~~
   drivers/video/fbdev/core/fbcvt.c:262:4: note: Value stored to 'offset' i=
s never read
                           offset +=3D read;
                           ^         ~~~~
   1 warning generated.
   sound/soc/codecs/ak4642.c:410:2: warning: Value stored to 'data' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           data =3D 0;
           ^      ~
   sound/soc/codecs/ak4642.c:410:2: note: Value stored to 'data' is never r=
ead
           data =3D 0;
           ^      ~
   1 warning generated.
   sound/soc/codecs/alc5623.c:700:23: warning: Value stored to 'alc5623' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct alc5623_priv *alc5623 =3D snd_soc_component_get_drvdata(c=
omponent);
                                ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   sound/soc/codecs/alc5623.c:700:23: note: Value stored to 'alc5623' durin=
g its initialization is never read
           struct alc5623_priv *alc5623 =3D snd_soc_component_get_drvdata(c=
omponent);
                                ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   1 warning generated.
   sound/soc/codecs/cs35l33.c:1161:3: warning: Value stored to 'pdata' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   pdata =3D &cs35l33->pdata;
                   ^       ~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l33.c:1161:3: note: Value stored to 'pdata' is neve=
r read
                   pdata =3D &cs35l33->pdata;
                   ^       ~~~~~~~~~~~~~~~
   1 warning generated.
   sound/soc/codecs/cs35l34.c:260:3: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]

vim +/pll_div_ctl1 +166 drivers/clk/imx/clk-pll14xx.c

b09c68dc57c9d4 Sascha Hauer 2022-03-04  128  =

b09c68dc57c9d4 Sascha Hauer 2022-03-04  129  static void imx_pll14xx_calc_s=
ettings(struct clk_pll14xx *pll, unsigned long rate,
b09c68dc57c9d4 Sascha Hauer 2022-03-04  130  				      unsigned long prate,=
 struct imx_pll14xx_rate_table *t)
b09c68dc57c9d4 Sascha Hauer 2022-03-04  131  {
b09c68dc57c9d4 Sascha Hauer 2022-03-04  132  	u32 pll_div_ctl0, pll_div_ctl=
1;
b09c68dc57c9d4 Sascha Hauer 2022-03-04  133  	int mdiv, pdiv, sdiv, kdiv;
b09c68dc57c9d4 Sascha Hauer 2022-03-04  134  	long fvco, rate_min, rate_max=
, dist, best =3D LONG_MAX;
b09c68dc57c9d4 Sascha Hauer 2022-03-04  135  	const struct imx_pll14xx_rate=
_table *tt;
b09c68dc57c9d4 Sascha Hauer 2022-03-04  136  =

b09c68dc57c9d4 Sascha Hauer 2022-03-04  137  	/*
b09c68dc57c9d4 Sascha Hauer 2022-03-04  138  	 * Fractional PLL constrains:
b09c68dc57c9d4 Sascha Hauer 2022-03-04  139  	 *
b09c68dc57c9d4 Sascha Hauer 2022-03-04  140  	 * a) 6MHz <=3D prate <=3D 25=
MHz
b09c68dc57c9d4 Sascha Hauer 2022-03-04  141  	 * b) 1 <=3D p <=3D 63 (1 <=
=3D p <=3D 4 prate =3D 24MHz)
b09c68dc57c9d4 Sascha Hauer 2022-03-04  142  	 * c) 64 <=3D m <=3D 1023
b09c68dc57c9d4 Sascha Hauer 2022-03-04  143  	 * d) 0 <=3D s <=3D 6
b09c68dc57c9d4 Sascha Hauer 2022-03-04  144  	 * e) -32768 <=3D k <=3D 32767
b09c68dc57c9d4 Sascha Hauer 2022-03-04  145  	 *
b09c68dc57c9d4 Sascha Hauer 2022-03-04  146  	 * fvco =3D (m * 65536 + k) *=
 prate / (p * 65536)
b09c68dc57c9d4 Sascha Hauer 2022-03-04  147  	 */
b09c68dc57c9d4 Sascha Hauer 2022-03-04  148  =

b09c68dc57c9d4 Sascha Hauer 2022-03-04  149  	/* First try if we can get th=
e desired rate from one of the static entries */
b09c68dc57c9d4 Sascha Hauer 2022-03-04  150  	tt =3D imx_get_pll_settings(p=
ll, rate);
b09c68dc57c9d4 Sascha Hauer 2022-03-04  151  	if (tt) {
b09c68dc57c9d4 Sascha Hauer 2022-03-04  152  		pr_debug("%s: in=3D%ld, want=
=3D%ld, Using PLL setting from table\n",
b09c68dc57c9d4 Sascha Hauer 2022-03-04  153  			 clk_hw_get_name(&pll->hw),=
 prate, rate);
b09c68dc57c9d4 Sascha Hauer 2022-03-04  154  		t->rate =3D tt->rate;
b09c68dc57c9d4 Sascha Hauer 2022-03-04  155  		t->mdiv =3D tt->mdiv;
b09c68dc57c9d4 Sascha Hauer 2022-03-04  156  		t->pdiv =3D tt->pdiv;
b09c68dc57c9d4 Sascha Hauer 2022-03-04  157  		t->sdiv =3D tt->sdiv;
b09c68dc57c9d4 Sascha Hauer 2022-03-04  158  		t->kdiv =3D tt->kdiv;
b09c68dc57c9d4 Sascha Hauer 2022-03-04  159  		return;
b09c68dc57c9d4 Sascha Hauer 2022-03-04  160  	}
b09c68dc57c9d4 Sascha Hauer 2022-03-04  161  =

b09c68dc57c9d4 Sascha Hauer 2022-03-04  162  	pll_div_ctl0 =3D readl_relaxe=
d(pll->base + DIV_CTL0);
b09c68dc57c9d4 Sascha Hauer 2022-03-04  163  	mdiv =3D FIELD_GET(MDIV_MASK,=
 pll_div_ctl0);
b09c68dc57c9d4 Sascha Hauer 2022-03-04  164  	pdiv =3D FIELD_GET(PDIV_MASK,=
 pll_div_ctl0);
b09c68dc57c9d4 Sascha Hauer 2022-03-04  165  	sdiv =3D FIELD_GET(SDIV_MASK,=
 pll_div_ctl0);
b09c68dc57c9d4 Sascha Hauer 2022-03-04 @166  	pll_div_ctl1 =3D readl_relaxe=
d(pll->base + DIV_CTL1);
b09c68dc57c9d4 Sascha Hauer 2022-03-04  167  =

b09c68dc57c9d4 Sascha Hauer 2022-03-04  168  	/* Then see if we can get the=
 desired rate by only adjusting kdiv (glitch free) */
b09c68dc57c9d4 Sascha Hauer 2022-03-04  169  	rate_min =3D pll14xx_calc_rat=
e(pll, mdiv, pdiv, sdiv, KDIV_MIN, prate);
b09c68dc57c9d4 Sascha Hauer 2022-03-04  170  	rate_max =3D pll14xx_calc_rat=
e(pll, mdiv, pdiv, sdiv, KDIV_MAX, prate);
b09c68dc57c9d4 Sascha Hauer 2022-03-04  171  =

b09c68dc57c9d4 Sascha Hauer 2022-03-04  172  	if (rate >=3D rate_min && rat=
e <=3D rate_max) {
b09c68dc57c9d4 Sascha Hauer 2022-03-04  173  		kdiv =3D pll1443x_calc_kdiv(=
mdiv, pdiv, sdiv, rate, prate);
b09c68dc57c9d4 Sascha Hauer 2022-03-04  174  		pr_debug("%s: in=3D%ld, want=
=3D%ld Only adjust kdiv %ld -> %d\n",
b09c68dc57c9d4 Sascha Hauer 2022-03-04  175  			 clk_hw_get_name(&pll->hw),=
 prate, rate,
b09c68dc57c9d4 Sascha Hauer 2022-03-04  176  			 FIELD_GET(KDIV_MASK, pll_d=
iv_ctl1), kdiv);
b09c68dc57c9d4 Sascha Hauer 2022-03-04  177  		fvco =3D pll14xx_calc_rate(p=
ll, mdiv, pdiv, sdiv, kdiv, prate);
b09c68dc57c9d4 Sascha Hauer 2022-03-04  178  		t->rate =3D (unsigned int)fv=
co;
b09c68dc57c9d4 Sascha Hauer 2022-03-04  179  		t->mdiv =3D mdiv;
b09c68dc57c9d4 Sascha Hauer 2022-03-04  180  		t->pdiv =3D pdiv;
b09c68dc57c9d4 Sascha Hauer 2022-03-04  181  		t->sdiv =3D sdiv;
b09c68dc57c9d4 Sascha Hauer 2022-03-04  182  		t->kdiv =3D kdiv;
b09c68dc57c9d4 Sascha Hauer 2022-03-04  183  		return;
b09c68dc57c9d4 Sascha Hauer 2022-03-04  184  	}
b09c68dc57c9d4 Sascha Hauer 2022-03-04  185  =

b09c68dc57c9d4 Sascha Hauer 2022-03-04  186  	/* Finally calculate best val=
ues */
b09c68dc57c9d4 Sascha Hauer 2022-03-04  187  	for (pdiv =3D 1; pdiv <=3D 7;=
 pdiv++) {
b09c68dc57c9d4 Sascha Hauer 2022-03-04  188  		for (sdiv =3D 0; sdiv <=3D 6=
; sdiv++) {
b09c68dc57c9d4 Sascha Hauer 2022-03-04  189  			/* calc mdiv =3D round(rate=
 * pdiv * 2^sdiv) / prate) */
b09c68dc57c9d4 Sascha Hauer 2022-03-04  190  			mdiv =3D DIV_ROUND_CLOSEST(=
rate * (pdiv << sdiv), prate);
b09c68dc57c9d4 Sascha Hauer 2022-03-04  191  			mdiv =3D clamp(mdiv, 64, 10=
23);
b09c68dc57c9d4 Sascha Hauer 2022-03-04  192  =

b09c68dc57c9d4 Sascha Hauer 2022-03-04  193  			kdiv =3D pll1443x_calc_kdiv=
(mdiv, pdiv, sdiv, rate, prate);
b09c68dc57c9d4 Sascha Hauer 2022-03-04  194  			fvco =3D pll14xx_calc_rate(=
pll, mdiv, pdiv, sdiv, kdiv, prate);
b09c68dc57c9d4 Sascha Hauer 2022-03-04  195  =

b09c68dc57c9d4 Sascha Hauer 2022-03-04  196  			/* best match */
b09c68dc57c9d4 Sascha Hauer 2022-03-04  197  			dist =3D abs((long)rate - (=
long)fvco);
b09c68dc57c9d4 Sascha Hauer 2022-03-04  198  			if (dist < best) {
b09c68dc57c9d4 Sascha Hauer 2022-03-04  199  				best =3D dist;
b09c68dc57c9d4 Sascha Hauer 2022-03-04  200  				t->rate =3D (unsigned int)=
fvco;
b09c68dc57c9d4 Sascha Hauer 2022-03-04  201  				t->mdiv =3D mdiv;
b09c68dc57c9d4 Sascha Hauer 2022-03-04  202  				t->pdiv =3D pdiv;
b09c68dc57c9d4 Sascha Hauer 2022-03-04  203  				t->sdiv =3D sdiv;
b09c68dc57c9d4 Sascha Hauer 2022-03-04  204  				t->kdiv =3D kdiv;
b09c68dc57c9d4 Sascha Hauer 2022-03-04  205  =

b09c68dc57c9d4 Sascha Hauer 2022-03-04  206  				if (!dist)
b09c68dc57c9d4 Sascha Hauer 2022-03-04  207  					goto found;
b09c68dc57c9d4 Sascha Hauer 2022-03-04  208  			}
b09c68dc57c9d4 Sascha Hauer 2022-03-04  209  		}
b09c68dc57c9d4 Sascha Hauer 2022-03-04  210  	}
b09c68dc57c9d4 Sascha Hauer 2022-03-04  211  found:
b09c68dc57c9d4 Sascha Hauer 2022-03-04  212  	pr_debug("%s: in=3D%ld, want=
=3D%ld got=3D%d (pdiv=3D%d sdiv=3D%d mdiv=3D%d kdiv=3D%d)\n",
b09c68dc57c9d4 Sascha Hauer 2022-03-04  213  		 clk_hw_get_name(&pll->hw), =
prate, rate, t->rate, t->pdiv, t->sdiv,
b09c68dc57c9d4 Sascha Hauer 2022-03-04  214  		 t->mdiv, t->kdiv);
b09c68dc57c9d4 Sascha Hauer 2022-03-04  215  }
b09c68dc57c9d4 Sascha Hauer 2022-03-04  216  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7016483060973629875==--

