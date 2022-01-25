Content-Type: multipart/mixed; boundary="===============2398908729088352669=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/stm/stm32_i2s.c:434:2: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119 [clang...
Date: Tue, 25 Jan 2022 21:10:52 +0800
Message-ID: <202201252154.inREbA2X-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2398908729088352669==
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
head:   a08b41ab9e2e468647f78eb17c28e29b93006394
commit: 8a262e614ef8675cfde924c6ddf873a95db0be6a ASoC: stm32: i2s: add mast=
er clock provider
date:   12 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20220123 (https://download.01.org/0day-ci/archi=
ve/20220125/202201252154.inREbA2X-lkp(a)intel.com/config)
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
   Suppressed 18 warnings (8 in non-user code, 10 with check filters).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   4 warnings generated.
   drivers/fpga/altera-freeze-bridge.c:69:4: warning: Value stored to 'ctrl=
' is never read [clang-analyzer-deadcode.DeadStores]
                           ctrl =3D readl(priv->base_addr + FREEZE_CSR_CTRL=
_OFFSET);
                           ^
   drivers/fpga/altera-freeze-bridge.c:69:4: note: Value stored to 'ctrl' i=
s never read
   drivers/fpga/altera-freeze-bridge.c:150:2: warning: Value stored to 'sta=
tus' is never read [clang-analyzer-deadcode.DeadStores]
           status =3D readl(priv->base_addr + FREEZE_CSR_STATUS_OFFSET);
           ^
   drivers/fpga/altera-freeze-bridge.c:150:2: note: Value stored to 'status=
' is never read
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   include/linux/log2.h:57:13: warning: The result of the left shift is und=
efined due to shifting by '32', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   sound/soc/codecs/hdac_hdmi.c:1070:29: note: Left side of '&&' is false
           struct hdac_device *hdev =3D dev_to_hdac_dev(dapm->dev);
                                      ^
   include/sound/hdaudio.h:115:31: note: expanded from macro 'dev_to_hdac_d=
ev'
   #define dev_to_hdac_dev(_dev)   container_of(_dev, struct hdac_device, d=
ev)
                                   ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   sound/soc/codecs/hdac_hdmi.c:1070:29: note: Taking false branch
           struct hdac_device *hdev =3D dev_to_hdac_dev(dapm->dev);
                                      ^
   include/sound/hdaudio.h:115:31: note: expanded from macro 'dev_to_hdac_d=
ev'
   #define dev_to_hdac_dev(_dev)   container_of(_dev, struct hdac_device, d=
ev)
                                   ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   sound/soc/codecs/hdac_hdmi.c:1070:29: note: Loop condition is false.  Ex=
iting loop
           struct hdac_device *hdev =3D dev_to_hdac_dev(dapm->dev);
                                      ^

vim +434 sound/soc/stm/stm32_i2s.c

8a262e614ef8675 Olivier Moysan 2021-02-05  406  =

8a262e614ef8675 Olivier Moysan 2021-02-05  407  static int stm32_i2s_add_mc=
lk_provider(struct stm32_i2s_data *i2s)
8a262e614ef8675 Olivier Moysan 2021-02-05  408  {
8a262e614ef8675 Olivier Moysan 2021-02-05  409  	struct clk_hw *hw;
8a262e614ef8675 Olivier Moysan 2021-02-05  410  	struct stm32_i2smclk_data =
*mclk;
8a262e614ef8675 Olivier Moysan 2021-02-05  411  	struct device *dev =3D &i2=
s->pdev->dev;
8a262e614ef8675 Olivier Moysan 2021-02-05  412  	const char *pname =3D __cl=
k_get_name(i2s->i2sclk);
8a262e614ef8675 Olivier Moysan 2021-02-05  413  	char *mclk_name, *p, *s =
=3D (char *)pname;
8a262e614ef8675 Olivier Moysan 2021-02-05  414  	int ret, i =3D 0;
8a262e614ef8675 Olivier Moysan 2021-02-05  415  =

8a262e614ef8675 Olivier Moysan 2021-02-05  416  	mclk =3D devm_kzalloc(dev,=
 sizeof(*mclk), GFP_KERNEL);
8a262e614ef8675 Olivier Moysan 2021-02-05  417  	if (!mclk)
8a262e614ef8675 Olivier Moysan 2021-02-05  418  		return -ENOMEM;
8a262e614ef8675 Olivier Moysan 2021-02-05  419  =

8a262e614ef8675 Olivier Moysan 2021-02-05  420  	mclk_name =3D devm_kcalloc=
(dev, sizeof(char),
8a262e614ef8675 Olivier Moysan 2021-02-05  421  				 STM32_I2S_NAME_LEN, GF=
P_KERNEL);
8a262e614ef8675 Olivier Moysan 2021-02-05  422  	if (!mclk_name)
8a262e614ef8675 Olivier Moysan 2021-02-05  423  		return -ENOMEM;
8a262e614ef8675 Olivier Moysan 2021-02-05  424  =

8a262e614ef8675 Olivier Moysan 2021-02-05  425  	/*
8a262e614ef8675 Olivier Moysan 2021-02-05  426  	 * Forge mclk clock name f=
rom parent clock name and suffix.
8a262e614ef8675 Olivier Moysan 2021-02-05  427  	 * String after "_" char i=
s stripped in parent name.
8a262e614ef8675 Olivier Moysan 2021-02-05  428  	 */
8a262e614ef8675 Olivier Moysan 2021-02-05  429  	p =3D mclk_name;
8a262e614ef8675 Olivier Moysan 2021-02-05  430  	while (*s && *s !=3D '_' &=
& (i < (STM32_I2S_NAME_LEN - 7))) {
8a262e614ef8675 Olivier Moysan 2021-02-05  431  		*p++ =3D *s++;
8a262e614ef8675 Olivier Moysan 2021-02-05  432  		i++;
8a262e614ef8675 Olivier Moysan 2021-02-05  433  	}
8a262e614ef8675 Olivier Moysan 2021-02-05 @434  	strcat(p, "_mclk");
8a262e614ef8675 Olivier Moysan 2021-02-05  435  =

8a262e614ef8675 Olivier Moysan 2021-02-05  436  	mclk->hw.init =3D CLK_HW_I=
NIT(mclk_name, pname, &mclk_ops, 0);
8a262e614ef8675 Olivier Moysan 2021-02-05  437  	mclk->i2s_data =3D i2s;
8a262e614ef8675 Olivier Moysan 2021-02-05  438  	hw =3D &mclk->hw;
8a262e614ef8675 Olivier Moysan 2021-02-05  439  =

8a262e614ef8675 Olivier Moysan 2021-02-05  440  	dev_dbg(dev, "Register mas=
ter clock %s\n", mclk_name);
8a262e614ef8675 Olivier Moysan 2021-02-05  441  	ret =3D devm_clk_hw_regist=
er(&i2s->pdev->dev, hw);
8a262e614ef8675 Olivier Moysan 2021-02-05  442  	if (ret) {
8a262e614ef8675 Olivier Moysan 2021-02-05  443  		dev_err(dev, "mclk regist=
er fails with error %d\n", ret);
8a262e614ef8675 Olivier Moysan 2021-02-05  444  		return ret;
8a262e614ef8675 Olivier Moysan 2021-02-05  445  	}
8a262e614ef8675 Olivier Moysan 2021-02-05  446  	i2s->i2smclk =3D hw->clk;
8a262e614ef8675 Olivier Moysan 2021-02-05  447  =

8a262e614ef8675 Olivier Moysan 2021-02-05  448  	/* register mclk provider =
*/
8a262e614ef8675 Olivier Moysan 2021-02-05  449  	return devm_of_clk_add_hw_=
provider(dev, of_clk_hw_simple_get, hw);
8a262e614ef8675 Olivier Moysan 2021-02-05  450  }
8a262e614ef8675 Olivier Moysan 2021-02-05  451  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2398908729088352669==--

