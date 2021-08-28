Content-Type: multipart/mixed; boundary="===============8543206931997242335=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/fsl/fsl_xcvr.c:1048:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 28 Aug 2021 20:53:14 +0800
Message-ID: <202108282001.Uj7ePHIs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8543206931997242335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Viorel Suman <viorel.suman@nxp.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   64b4fc45bea6f4faa843d2f97ff51665280efee1
commit: 28564486866fa889b78264360022c94836fa8072 ASoC: fsl_xcvr: Add XCVR A=
SoC CPU DAI driver
date:   10 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20210816 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 44d0a9=
9a12ec7ead4d2f5ef649ba05b40f6d463d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D28564486866fa889b78264360022c94836fa8072
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 28564486866fa889b78264360022c94836fa8072
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   14 warnings generated.
   Suppressed 14 warnings (4 in non-user code, 10 with check filters).
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
   9 warnings generated.
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
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> sound/soc/fsl/fsl_xcvr.c:1048:17: warning: Value stored to 'dev' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &xcvr->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_xcvr.c:1048:17: note: Value stored to 'dev' during its=
 initialization is never read
           struct device *dev =3D &xcvr->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/media/i2c/st-mipid02.c:623:21: warning: Value stored to 'client'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct i2c_client *client =3D bridge->i2c_client;
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/st-mipid02.c:623:21: note: Value stored to 'client' du=
ring its initialization is never read
           struct i2c_client *client =3D bridge->i2c_client;
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/st-mipid02.c:679:21: warning: Value stored to 'client'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct i2c_client *client =3D bridge->i2c_client;
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/st-mipid02.c:679:21: note: Value stored to 'client' du=
ring its initialization is never read
           struct i2c_client *client =3D bridge->i2c_client;
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/st-mipid02.c:747:21: warning: Value stored to 'client'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct i2c_client *client =3D bridge->i2c_client;
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/st-mipid02.c:747:21: note: Value stored to 'client' du=
ring its initialization is never read
           struct i2c_client *client =3D bridge->i2c_client;
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/st-mipid02.c:919:3: warning: Value stored to 'ret' is =
never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -EINVAL;
                   ^     ~~~~~~~
   drivers/media/i2c/st-mipid02.c:919:3: note: Value stored to 'ret' is nev=
er read
                   ret =3D -EINVAL;
                   ^     ~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/tuners/tuner-xc2028.c:1037:3: warning: Value stored to 'rc=
' is never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D send_seq(priv, {0x00, 0x00});
                   ^
   drivers/media/tuners/tuner-xc2028.c:1037:3: note: Value stored to 'rc' i=
s never read
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
   6 warnings generated.
   kernel/kallsyms.c:369:3: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(buffer, name);
                   ^~~~~~
   kernel/kallsyms.c:369:3: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                   strcpy(buffer, name);
                   ^~~~~~
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
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
   5 warnings generated.
   drivers/mmc/core/core.c:2010:19: warning: Value stored to 'host' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct mmc_host *host =3D card->host;
                            ^~~~   ~~~~~~~~~~
   drivers/mmc/core/core.c:2010:19: note: Value stored to 'host' during its=
 initialization is never read

vim +/dev +1048 sound/soc/fsl/fsl_xcvr.c

28564486866fa8 Viorel Suman 2020-10-13  1044  =

28564486866fa8 Viorel Suman 2020-10-13  1045  static irqreturn_t irq0_isr(i=
nt irq, void *devid)
28564486866fa8 Viorel Suman 2020-10-13  1046  {
28564486866fa8 Viorel Suman 2020-10-13  1047  	struct fsl_xcvr *xcvr =3D (s=
truct fsl_xcvr *)devid;
28564486866fa8 Viorel Suman 2020-10-13 @1048  	struct device *dev =3D &xcvr=
->pdev->dev;
28564486866fa8 Viorel Suman 2020-10-13  1049  	struct regmap *regmap =3D xc=
vr->regmap;
28564486866fa8 Viorel Suman 2020-10-13  1050  	void __iomem *reg_ctrl, *reg=
_buff;
28564486866fa8 Viorel Suman 2020-10-13  1051  	u32 isr, isr_clr =3D 0, val,=
 i;
28564486866fa8 Viorel Suman 2020-10-13  1052  =

28564486866fa8 Viorel Suman 2020-10-13  1053  	regmap_read(regmap, FSL_XCVR=
_EXT_ISR, &isr);
28564486866fa8 Viorel Suman 2020-10-13  1054  =

28564486866fa8 Viorel Suman 2020-10-13  1055  	if (isr & FSL_XCVR_IRQ_NEW_C=
S) {
28564486866fa8 Viorel Suman 2020-10-13  1056  		dev_dbg(dev, "Received new =
CS block\n");
28564486866fa8 Viorel Suman 2020-10-13  1057  		isr_clr |=3D FSL_XCVR_IRQ_N=
EW_CS;
28564486866fa8 Viorel Suman 2020-10-13  1058  		/* Data RAM is 4KiB, last t=
wo pages: 8 and 9. Select page 8. */
28564486866fa8 Viorel Suman 2020-10-13  1059  		regmap_update_bits(xcvr->re=
gmap, FSL_XCVR_EXT_CTRL,
28564486866fa8 Viorel Suman 2020-10-13  1060  				   FSL_XCVR_EXT_CTRL_PAGE=
_MASK,
28564486866fa8 Viorel Suman 2020-10-13  1061  				   FSL_XCVR_EXT_CTRL_PAGE=
(8));
28564486866fa8 Viorel Suman 2020-10-13  1062  =

28564486866fa8 Viorel Suman 2020-10-13  1063  		/* Find updated CS buffer */
28564486866fa8 Viorel Suman 2020-10-13  1064  		reg_ctrl =3D xcvr->ram_addr=
 + FSL_XCVR_RX_CS_CTRL_0;
28564486866fa8 Viorel Suman 2020-10-13  1065  		reg_buff =3D xcvr->ram_addr=
 + FSL_XCVR_RX_CS_BUFF_0;
28564486866fa8 Viorel Suman 2020-10-13  1066  		memcpy_fromio(&val, reg_ctr=
l, sizeof(val));
28564486866fa8 Viorel Suman 2020-10-13  1067  		if (!val) {
28564486866fa8 Viorel Suman 2020-10-13  1068  			reg_ctrl =3D xcvr->ram_add=
r + FSL_XCVR_RX_CS_CTRL_1;
28564486866fa8 Viorel Suman 2020-10-13  1069  			reg_buff =3D xcvr->ram_add=
r + FSL_XCVR_RX_CS_BUFF_1;
28564486866fa8 Viorel Suman 2020-10-13  1070  			memcpy_fromio(&val, reg_ct=
rl, sizeof(val));
28564486866fa8 Viorel Suman 2020-10-13  1071  		}
28564486866fa8 Viorel Suman 2020-10-13  1072  =

28564486866fa8 Viorel Suman 2020-10-13  1073  		if (val) {
28564486866fa8 Viorel Suman 2020-10-13  1074  			/* copy CS buffer */
28564486866fa8 Viorel Suman 2020-10-13  1075  			memcpy_fromio(&xcvr->rx_ie=
c958.status, reg_buff,
28564486866fa8 Viorel Suman 2020-10-13  1076  				      sizeof(xcvr->rx_iec=
958.status));
28564486866fa8 Viorel Suman 2020-10-13  1077  			for (i =3D 0; i < 6; i++) {
28564486866fa8 Viorel Suman 2020-10-13  1078  				val =3D *(u32 *)(xcvr->rx=
_iec958.status + i*4);
28564486866fa8 Viorel Suman 2020-10-13  1079  				*(u32 *)(xcvr->rx_iec958.=
status + i*4) =3D
28564486866fa8 Viorel Suman 2020-10-13  1080  					bitrev32(val);
28564486866fa8 Viorel Suman 2020-10-13  1081  			}
28564486866fa8 Viorel Suman 2020-10-13  1082  			/* clear CS control regist=
er */
28564486866fa8 Viorel Suman 2020-10-13  1083  			memset_io(reg_ctrl, 0, siz=
eof(val));
28564486866fa8 Viorel Suman 2020-10-13  1084  		}
28564486866fa8 Viorel Suman 2020-10-13  1085  	}
28564486866fa8 Viorel Suman 2020-10-13  1086  	if (isr & FSL_XCVR_IRQ_NEW_U=
D) {
28564486866fa8 Viorel Suman 2020-10-13  1087  		dev_dbg(dev, "Received new =
UD block\n");
28564486866fa8 Viorel Suman 2020-10-13  1088  		isr_clr |=3D FSL_XCVR_IRQ_N=
EW_UD;
28564486866fa8 Viorel Suman 2020-10-13  1089  	}
28564486866fa8 Viorel Suman 2020-10-13  1090  	if (isr & FSL_XCVR_IRQ_MUTE)=
 {
28564486866fa8 Viorel Suman 2020-10-13  1091  		dev_dbg(dev, "HW mute bit d=
etected\n");
28564486866fa8 Viorel Suman 2020-10-13  1092  		isr_clr |=3D FSL_XCVR_IRQ_M=
UTE;
28564486866fa8 Viorel Suman 2020-10-13  1093  	}
28564486866fa8 Viorel Suman 2020-10-13  1094  	if (isr & FSL_XCVR_IRQ_FIFO_=
UOFL_ERR) {
28564486866fa8 Viorel Suman 2020-10-13  1095  		dev_dbg(dev, "RX/TX FIFO fu=
ll/empty\n");
28564486866fa8 Viorel Suman 2020-10-13  1096  		isr_clr |=3D FSL_XCVR_IRQ_F=
IFO_UOFL_ERR;
28564486866fa8 Viorel Suman 2020-10-13  1097  	}
28564486866fa8 Viorel Suman 2020-10-13  1098  	if (isr & FSL_XCVR_IRQ_ARC_M=
ODE) {
28564486866fa8 Viorel Suman 2020-10-13  1099  		dev_dbg(dev, "CMDC SM falls=
 out of eARC mode\n");
28564486866fa8 Viorel Suman 2020-10-13  1100  		isr_clr |=3D FSL_XCVR_IRQ_A=
RC_MODE;
28564486866fa8 Viorel Suman 2020-10-13  1101  	}
28564486866fa8 Viorel Suman 2020-10-13  1102  	if (isr & FSL_XCVR_IRQ_DMA_R=
D_REQ) {
28564486866fa8 Viorel Suman 2020-10-13  1103  		dev_dbg(dev, "DMA read requ=
est\n");
28564486866fa8 Viorel Suman 2020-10-13  1104  		isr_clr |=3D FSL_XCVR_IRQ_D=
MA_RD_REQ;
28564486866fa8 Viorel Suman 2020-10-13  1105  	}
28564486866fa8 Viorel Suman 2020-10-13  1106  	if (isr & FSL_XCVR_IRQ_DMA_W=
R_REQ) {
28564486866fa8 Viorel Suman 2020-10-13  1107  		dev_dbg(dev, "DMA write req=
uest\n");
28564486866fa8 Viorel Suman 2020-10-13  1108  		isr_clr |=3D FSL_XCVR_IRQ_D=
MA_WR_REQ;
28564486866fa8 Viorel Suman 2020-10-13  1109  	}
28564486866fa8 Viorel Suman 2020-10-13  1110  =

28564486866fa8 Viorel Suman 2020-10-13  1111  	if (isr_clr) {
28564486866fa8 Viorel Suman 2020-10-13  1112  		regmap_write(regmap, FSL_XC=
VR_EXT_ISR_CLR, isr_clr);
28564486866fa8 Viorel Suman 2020-10-13  1113  		return IRQ_HANDLED;
28564486866fa8 Viorel Suman 2020-10-13  1114  	}
28564486866fa8 Viorel Suman 2020-10-13  1115  =

28564486866fa8 Viorel Suman 2020-10-13  1116  	return IRQ_NONE;
28564486866fa8 Viorel Suman 2020-10-13  1117  }
28564486866fa8 Viorel Suman 2020-10-13  1118  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8543206931997242335==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
M7wBAA==
--===============8543206931997242335==--

