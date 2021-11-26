Content-Type: multipart/mixed; boundary="===============1380392617875478732=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/stm/stm32_i2s.c:434:2: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119 [clang...
Date: Fri, 26 Nov 2021 16:32:14 +0800
Message-ID: <202111261659.1M8beKNp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1380392617875478732==
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
head:   a4849f6000e29235a2707f22e39da6b897bb9543
commit: 8a262e614ef8675cfde924c6ddf873a95db0be6a ASoC: stm32: i2s: add mast=
er clock provider
date:   10 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20210929 (https://download.01.org/0day-ci/archi=
ve/20211126/202111261659.1M8beKNp-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dc6e8d=
fdfe7efecfda318d43a06fae18b40eb498)
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
           ^      ~
   drivers/video/fbdev/nvidia/nv_hw.c:439:2: note: Value stored to 'clwm' i=
s never read
           clwm =3D 0;
           ^      ~
   Suppressed 34 warnings (32 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   36 warnings generated.
   Suppressed 36 warnings (32 in non-user code, 4 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   sound/soc/xtensa/xtfpga-i2s.c:285:11: warning: Value stored to 'channels=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           unsigned channels =3D params_channels(params);
                    ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/xtensa/xtfpga-i2s.c:285:11: note: Value stored to 'channels' d=
uring its initialization is never read
           unsigned channels =3D params_channels(params);
                    ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   sound/soc/kirkwood/kirkwood-i2s.c:322:2: warning: Value stored to 'value=
' is never read [clang-analyzer-deadcode.DeadStores]
           value =3D readl(priv->io + KIRKWOOD_RECCTL);
           ^
   sound/soc/kirkwood/kirkwood-i2s.c:322:2: note: Value stored to 'value' i=
s never read
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
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
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   sound/soc/bcm/bcm63xx-pcm-whistler.c:281:31: warning: The left operand o=
f '+' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   prtd->dma_addr_next =3D val_1 + val_2;
                                         ~~~~~ ^
   sound/soc/bcm/bcm63xx-pcm-whistler.c:252:59: note: 'val_1' declared with=
out an initial value
           unsigned int availdepth, ifflevel, offlevel, int_status, val_1, =
val_2;
                                                                    ^~~~~
   sound/soc/bcm/bcm63xx-pcm-whistler.c:267:6: note: Assuming the condition=
 is true
           if (int_status & I2S_RX_DESC_OFF_INTR_EN_MSK) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/bcm/bcm63xx-pcm-whistler.c:267:2: note: Taking true branch
           if (int_status & I2S_RX_DESC_OFF_INTR_EN_MSK) {
           ^
   sound/soc/bcm/bcm63xx-pcm-whistler.c:276:3: note: Loop condition is fals=
e. Execution continues on line 281
                   while (offlevel) {
                   ^
   sound/soc/bcm/bcm63xx-pcm-whistler.c:281:31: note: The left operand of '=
+' is a garbage value
                   prtd->dma_addr_next =3D val_1 + val_2;
                                         ~~~~~ ^
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

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
--===============1380392617875478732==--

