Content-Type: multipart/mixed; boundary="===============6321252013853980355=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/stm/stm32_i2s.c:434:2: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119 [clang...
Date: Sat, 29 Jan 2022 00:56:04 +0800
Message-ID: <202201290050.Dj6LluqQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6321252013853980355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Olivier Moysan <olivier.moysan@st.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   145d9b498fc827b79c1260b4caa29a8e59d4c2b9
commit: 8a262e614ef8675cfde924c6ddf873a95db0be6a ASoC: stm32: i2s: add mast=
er clock provider
date:   12 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20220123 (https://download.01.org/0day-ci/archi=
ve/20220129/202201290050.Dj6LluqQ-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30=
728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8a262e614ef8675cfde924c6ddf873a95db0be6a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8a262e614ef8675cfde924c6ddf873a95db0be6a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   sound/soc/stm/stm32_i2s.c:307:51: warning: The result of the left shift =
is undefined due to shifting '0' by '24', which is unrepresentable in the u=
nsigned version of the return type 'int' [clang-analyzer-core.UndefinedBina=
ryOperatorResult]
           cgfr =3D I2S_CGFR_I2SDIV_SET(i2s->div) | (i2s->odd << I2S_CGFR_O=
DD_SHIFT);
                                                            ^
   sound/soc/stm/stm32_i2s.c:800:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0) {
               ^~~~~~~
   sound/soc/stm/stm32_i2s.c:800:2: note: Taking false branch
           if (ret < 0) {
           ^
   sound/soc/stm/stm32_i2s.c:805:6: note: Assuming field 'ms_flg' is equal =
to I2S_MS_MASTER
           if (STM32_I2S_IS_MASTER(i2s))
               ^
   sound/soc/stm/stm32_i2s.c:197:34: note: expanded from macro 'STM32_I2S_I=
S_MASTER'
   #define STM32_I2S_IS_MASTER(x)          ((x)->ms_flg =3D=3D I2S_MS_MASTE=
R)
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/stm/stm32_i2s.c:805:2: note: Taking true branch
           if (STM32_I2S_IS_MASTER(i2s))
           ^
   sound/soc/stm/stm32_i2s.c:806:9: note: Calling 'stm32_i2s_configure_cloc=
k'
                   ret =3D stm32_i2s_configure_clock(cpu_dai, params);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/stm/stm32_i2s.c:669:6: note: Assuming the condition is false
           if (!(rate % 11025))
               ^~~~~~~~~~~~~~~
   sound/soc/stm/stm32_i2s.c:669:2: note: Taking false branch
           if (!(rate % 11025))
           ^
   sound/soc/stm/stm32_i2s.c:687:6: note: Assuming field 'mclk_rate' is not=
 equal to 0
           if (i2s->mclk_rate) {
               ^~~~~~~~~~~~~~
   sound/soc/stm/stm32_i2s.c:687:2: note: Taking true branch
           if (i2s->mclk_rate) {
           ^
   sound/soc/stm/stm32_i2s.c:688:9: note: Calling 'stm32_i2s_calc_clk_div'
                   ret =3D stm32_i2s_calc_clk_div(i2s, i2s_clock_rate,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/stm/stm32_i2s.c:270:10: note: Left side of '||' is true
           ratio =3D DIV_ROUND_CLOSEST(input_rate, output_rate);
                   ^
   include/linux/math.h:89:23: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
                                ^
   sound/soc/stm/stm32_i2s.c:273:2: note: Value assigned to 'odd'
           odd =3D ratio & 0x1;
           ^~~~~~~~~~~~~~~~~
   sound/soc/stm/stm32_i2s.c:279:6: note: Assuming 'div' is not equal to 0
           if (div) {
               ^~~
   sound/soc/stm/stm32_i2s.c:279:2: note: Taking true branch
           if (div) {
           ^
   sound/soc/stm/stm32_i2s.c:281:3: note: Taking false branch
                   dev_dbg(&i2s->pdev->dev, "Divider: 2*%d(div)+%d(odd) =3D=
 %d\n",
                   ^
   include/linux/dev_printk.h:130:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   sound/soc/stm/stm32_i2s.c:286:7: note: Assuming 'div' is equal to 1
           if ((div =3D=3D 1 && odd) || div > I2S_CGFR_I2SDIV_MAX) {
                ^~~~~~~~
   sound/soc/stm/stm32_i2s.c:286:7: note: Left side of '&&' is true
   sound/soc/stm/stm32_i2s.c:286:19: note: Assuming 'odd' is false
           if ((div =3D=3D 1 && odd) || div > I2S_CGFR_I2SDIV_MAX) {
                            ^~~
   sound/soc/stm/stm32_i2s.c:286:6: note: Left side of '||' is false
           if ((div =3D=3D 1 && odd) || div > I2S_CGFR_I2SDIV_MAX) {
               ^
   sound/soc/stm/stm32_i2s.c:286:2: note: Taking false branch
           if ((div =3D=3D 1 && odd) || div > I2S_CGFR_I2SDIV_MAX) {
           ^
   sound/soc/stm/stm32_i2s.c:291:6: note: Assuming the condition is false
           if (input_rate % divider)
               ^~~~~~~~~~~~~~~~~~~~
   sound/soc/stm/stm32_i2s.c:291:2: note: Taking false branch
           if (input_rate % divider)
           ^
   sound/soc/stm/stm32_i2s.c:297:2: note: The value of 'odd' is assigned to=
 field 'odd'
           i2s->odd =3D odd;
           ^~~~~~~~~~~~~~
   sound/soc/stm/stm32_i2s.c:688:9: note: Returning from 'stm32_i2s_calc_cl=
k_div'
                   ret =3D stm32_i2s_calc_clk_div(i2s, i2s_clock_rate,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/stm/stm32_i2s.c:690:7: note: 'ret' is 0
                   if (ret)
                       ^~~
   sound/soc/stm/stm32_i2s.c:690:3: note: Taking false branch
                   if (ret)
                   ^
   sound/soc/stm/stm32_i2s.c:710:8: note: Calling 'stm32_i2s_set_clk_div'
           ret =3D stm32_i2s_set_clk_div(i2s);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/stm/stm32_i2s.c:307:51: note: The result of the left shift is =
undefined due to shifting '0' by '24', which is unrepresentable in the unsi=
gned version of the return type 'int'
           cgfr =3D I2S_CGFR_I2SDIV_SET(i2s->div) | (i2s->odd << I2S_CGFR_O=
DD_SHIFT);
                                                   ~~~~~~~~ ^
>> sound/soc/stm/stm32_i2s.c:434:2: warning: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(p, "_mclk");
           ^~~~~~
   sound/soc/stm/stm32_i2s.c:434:2: note: Call to function 'strcat' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcat'. CWE-119
           strcat(p, "_mclk");
           ^~~~~~
   sound/soc/stm/stm32_i2s.c:455:26: warning: Value stored to 'pdev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev =3D i2s->pdev;
                                   ^~~~   ~~~~~~~~~
   sound/soc/stm/stm32_i2s.c:455:26: note: Value stored to 'pdev' during it=
s initialization is never read
           struct platform_device *pdev =3D i2s->pdev;
                                   ^~~~   ~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   sound/soc/codecs/cs42l42.c:575:8: warning: Excessive padding in 'struct =
cs42l42_pll_params' (5 padding bytes, where 1 is optimal). =

   Optimal fields order: =

   sclk, =

   pll_div_frac, =

   mclk_int, =

   mclk_div, =

   mclk_src_sel, =

   sclk_prediv, =

   pll_div_int, =

   pll_mode, =

   pll_divout, =

   pll_cal_ratio, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct cs42l42_pll_params {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs42l42.c:575:8: note: Excessive padding in 'struct cs4=
2l42_pll_params' (5 padding bytes, where 1 is optimal). Optimal fields orde=
r: sclk, pll_div_frac, mclk_int, mclk_div, mclk_src_sel, sclk_prediv, pll_d=
iv_int, pll_mode, pll_divout, pll_cal_ratio, consider reordering the fields=
 or adding explicit padding members
   struct cs42l42_pll_params {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs42l42.c:1338:28: warning: Value stored to 'component'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct snd_soc_component *component =3D cs42l42->component;
                                     ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs42l42.c:1338:28: note: Value stored to 'component' du=
ring its initialization is never read
           struct snd_soc_component *component =3D cs42l42->component;
                                     ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs42l42.c:1818:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_read(cs42l42->regmap, CS42L42_DEVID_AB, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs42l42.c:1818:2: note: Value stored to 'ret' is never =
read
           ret =3D regmap_read(cs42l42->regmap, CS42L42_DEVID_AB, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs42l42.c:1821:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_read(cs42l42->regmap, CS42L42_DEVID_CD, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs42l42.c:1821:2: note: Value stored to 'ret' is never =
read
           ret =3D regmap_read(cs42l42->regmap, CS42L42_DEVID_CD, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs42l42.c:1824:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_read(cs42l42->regmap, CS42L42_DEVID_E, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs42l42.c:1824:2: note: Value stored to 'ret' is never =
read
           ret =3D regmap_read(cs42l42->regmap, CS42L42_DEVID_E, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   13 warnings generated.
   include/linux/list.h:135:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   sound/soc/codecs/wm_adsp.c:3440:2: note: Loop condition is true.  Enteri=
ng loop body
           while (!list_empty(&dsp->ctl_list)) {
           ^
   sound/soc/codecs/wm_adsp.c:3441:9: note: Left side of '&&' is false
                   ctl =3D list_first_entry(&dsp->ctl_list, struct wm_coeff=
_ctl,
                         ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   sound/soc/codecs/wm_adsp.c:3441:9: note: Taking false branch
                   ctl =3D list_first_entry(&dsp->ctl_list, struct wm_coeff=
_ctl,
                         ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)

vim +434 sound/soc/stm/stm32_i2s.c

8a262e614ef867 Olivier Moysan 2021-02-05  406  =

8a262e614ef867 Olivier Moysan 2021-02-05  407  static int stm32_i2s_add_mcl=
k_provider(struct stm32_i2s_data *i2s)
8a262e614ef867 Olivier Moysan 2021-02-05  408  {
8a262e614ef867 Olivier Moysan 2021-02-05  409  	struct clk_hw *hw;
8a262e614ef867 Olivier Moysan 2021-02-05  410  	struct stm32_i2smclk_data *=
mclk;
8a262e614ef867 Olivier Moysan 2021-02-05  411  	struct device *dev =3D &i2s=
->pdev->dev;
8a262e614ef867 Olivier Moysan 2021-02-05  412  	const char *pname =3D __clk=
_get_name(i2s->i2sclk);
8a262e614ef867 Olivier Moysan 2021-02-05  413  	char *mclk_name, *p, *s =3D=
 (char *)pname;
8a262e614ef867 Olivier Moysan 2021-02-05  414  	int ret, i =3D 0;
8a262e614ef867 Olivier Moysan 2021-02-05  415  =

8a262e614ef867 Olivier Moysan 2021-02-05  416  	mclk =3D devm_kzalloc(dev, =
sizeof(*mclk), GFP_KERNEL);
8a262e614ef867 Olivier Moysan 2021-02-05  417  	if (!mclk)
8a262e614ef867 Olivier Moysan 2021-02-05  418  		return -ENOMEM;
8a262e614ef867 Olivier Moysan 2021-02-05  419  =

8a262e614ef867 Olivier Moysan 2021-02-05  420  	mclk_name =3D devm_kcalloc(=
dev, sizeof(char),
8a262e614ef867 Olivier Moysan 2021-02-05  421  				 STM32_I2S_NAME_LEN, GFP=
_KERNEL);
8a262e614ef867 Olivier Moysan 2021-02-05  422  	if (!mclk_name)
8a262e614ef867 Olivier Moysan 2021-02-05  423  		return -ENOMEM;
8a262e614ef867 Olivier Moysan 2021-02-05  424  =

8a262e614ef867 Olivier Moysan 2021-02-05  425  	/*
8a262e614ef867 Olivier Moysan 2021-02-05  426  	 * Forge mclk clock name fr=
om parent clock name and suffix.
8a262e614ef867 Olivier Moysan 2021-02-05  427  	 * String after "_" char is=
 stripped in parent name.
8a262e614ef867 Olivier Moysan 2021-02-05  428  	 */
8a262e614ef867 Olivier Moysan 2021-02-05  429  	p =3D mclk_name;
8a262e614ef867 Olivier Moysan 2021-02-05  430  	while (*s && *s !=3D '_' &&=
 (i < (STM32_I2S_NAME_LEN - 7))) {
8a262e614ef867 Olivier Moysan 2021-02-05  431  		*p++ =3D *s++;
8a262e614ef867 Olivier Moysan 2021-02-05  432  		i++;
8a262e614ef867 Olivier Moysan 2021-02-05  433  	}
8a262e614ef867 Olivier Moysan 2021-02-05 @434  	strcat(p, "_mclk");
8a262e614ef867 Olivier Moysan 2021-02-05  435  =

8a262e614ef867 Olivier Moysan 2021-02-05  436  	mclk->hw.init =3D CLK_HW_IN=
IT(mclk_name, pname, &mclk_ops, 0);
8a262e614ef867 Olivier Moysan 2021-02-05  437  	mclk->i2s_data =3D i2s;
8a262e614ef867 Olivier Moysan 2021-02-05  438  	hw =3D &mclk->hw;
8a262e614ef867 Olivier Moysan 2021-02-05  439  =

8a262e614ef867 Olivier Moysan 2021-02-05  440  	dev_dbg(dev, "Register mast=
er clock %s\n", mclk_name);
8a262e614ef867 Olivier Moysan 2021-02-05  441  	ret =3D devm_clk_hw_registe=
r(&i2s->pdev->dev, hw);
8a262e614ef867 Olivier Moysan 2021-02-05  442  	if (ret) {
8a262e614ef867 Olivier Moysan 2021-02-05  443  		dev_err(dev, "mclk registe=
r fails with error %d\n", ret);
8a262e614ef867 Olivier Moysan 2021-02-05  444  		return ret;
8a262e614ef867 Olivier Moysan 2021-02-05  445  	}
8a262e614ef867 Olivier Moysan 2021-02-05  446  	i2s->i2smclk =3D hw->clk;
8a262e614ef867 Olivier Moysan 2021-02-05  447  =

8a262e614ef867 Olivier Moysan 2021-02-05  448  	/* register mclk provider */
8a262e614ef867 Olivier Moysan 2021-02-05  449  	return devm_of_clk_add_hw_p=
rovider(dev, of_clk_hw_simple_get, hw);
8a262e614ef867 Olivier Moysan 2021-02-05  450  }
8a262e614ef867 Olivier Moysan 2021-02-05  451  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6321252013853980355==--

