Content-Type: multipart/mixed; boundary="===============8270926940433647628=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] phy: ti: Add missing pm_runtime_disable() in probe function
Date: Thu, 06 Jan 2022 01:50:42 +0800
Message-ID: <202201060123.PR3DWie4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8270926940433647628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220105090225.20507-1-linmq006@gmail.com>
References: <20220105090225.20507-1-linmq006@gmail.com>
TO: Miaoqian Lin <linmq006@gmail.com>
CC: linmq006(a)gmail.com
CC: Kishon Vijay Abraham I <kishon@ti.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: Randy Dunlap <rdunlap@infradead.org>
CC: Roger Quadros <rogerq@ti.com>
CC: linux-phy(a)lists.infradead.org
CC: linux-kernel(a)vger.kernel.org

Hi Miaoqian,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.16-rc8 next-20220105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Miaoqian-Lin/phy-ti-Add-mi=
ssing-pm_runtime_disable-in-probe-function/20220105-170334
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
c9e6606c7fe92b50a02ce51dda82586ebdf99b48
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: microblaze-randconfig-s031-20220105 (https://download.01.org/0day-c=
i/archive/20220106/202201060123.PR3DWie4-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/dc404b65a54364bb2937baba8=
5bb37960c514167
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Miaoqian-Lin/phy-ti-Add-missing-pm=
_runtime_disable-in-probe-function/20220105-170334
        git checkout dc404b65a54364bb2937baba85bb37960c514167
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dm=
icroblaze SHELL=3D/bin/bash drivers/phy/ti/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/phy/ti/phy-am654-serdes.c:841:1: sparse: sparse: unused label 'e=
rr_pm_disable'

vim +/err_pm_disable +841 drivers/phy/ti/phy-am654-serdes.c

71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  751  =

71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  752  static int serdes_am=
654_probe(struct platform_device *pdev)
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  753  {
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  754  	struct phy_provider=
 *phy_provider;
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  755  	struct device *dev =
=3D &pdev->dev;
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  756  	struct device_node =
*node =3D dev->of_node;
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  757  	struct clk_onecell_=
data *clk_data;
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  758  	struct serdes_am654=
 *am654_phy;
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  759  	struct mux_control =
*control;
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  760  	const char *clock_n=
ame;
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  761  	struct regmap *regm=
ap;
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  762  	void __iomem *base;
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  763  	struct phy *phy;
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  764  	int ret;
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  765  	int i;
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  766  =

71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  767  	am654_phy =3D devm_=
kzalloc(dev, sizeof(*am654_phy), GFP_KERNEL);
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  768  	if (!am654_phy)
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  769  		return -ENOMEM;
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  770  =

71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  771  	base =3D devm_platf=
orm_ioremap_resource(pdev, 0);
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  772  	if (IS_ERR(base))
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  773  		return PTR_ERR(bas=
e);
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  774  =

71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  775  	regmap =3D devm_reg=
map_init_mmio(dev, base, &serdes_am654_regmap_config);
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  776  	if (IS_ERR(regmap))=
 {
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  777  		dev_err(dev, "Fail=
ed to initialize regmap\n");
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  778  		return PTR_ERR(reg=
map);
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  779  	}
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  780  =

71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  781  	control =3D devm_mu=
x_control_get(dev, NULL);
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  782  	if (IS_ERR(control))
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  783  		return PTR_ERR(con=
trol);
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  784  =

71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  785  	am654_phy->dev =3D =
dev;
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  786  	am654_phy->of_node =
=3D node;
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  787  	am654_phy->regmap =
=3D regmap;
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  788  	am654_phy->control =
=3D control;
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  789  	am654_phy->type =3D=
 PHY_NONE;
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  790  =

71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  791  	ret =3D serdes_am65=
4_regfield_init(am654_phy);
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  792  	if (ret) {
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  793  		dev_err(dev, "Fail=
ed to initialize regfields\n");
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  794  		return ret;
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  795  	}
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  796  =

71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  797  	platform_set_drvdat=
a(pdev, am654_phy);
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  798  =

71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  799  	for (i =3D 0; i < S=
ERDES_NUM_CLOCKS; i++) {
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  800  		ret =3D of_propert=
y_read_string_index(node, "clock-output-names",
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  801  						    i, &clock_=
name);
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  802  		if (ret) {
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  803  			dev_err(dev, "Fai=
led to get clock name\n");
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  804  			return ret;
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  805  		}
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  806  =

71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  807  		ret =3D serdes_am6=
54_clk_register(am654_phy, clock_name, i);
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  808  		if (ret) {
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  809  			dev_err(dev, "Fai=
led to initialize clock %s\n",
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  810  				clock_name);
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  811  			return ret;
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  812  		}
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  813  	}
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  814  =

71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  815  	clk_data =3D &am654=
_phy->clk_data;
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  816  	clk_data->clks =3D =
am654_phy->clks;
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  817  	clk_data->clk_num =
=3D SERDES_NUM_CLOCKS;
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  818  	ret =3D of_clk_add_=
provider(node, of_clk_src_onecell_get, clk_data);
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  819  	if (ret)
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  820  		return ret;
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  821  =

71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  822  	pm_runtime_enable(d=
ev);
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  823  =

71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  824  	phy =3D devm_phy_cr=
eate(dev, NULL, &ops);
850280156f6421 Dan Carpenter          2020-09-05  825  	if (IS_ERR(phy)) {
850280156f6421 Dan Carpenter          2020-09-05  826  		ret =3D PTR_ERR(ph=
y);
850280156f6421 Dan Carpenter          2020-09-05  827  		goto clk_err;
850280156f6421 Dan Carpenter          2020-09-05  828  	}
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  829  =

71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  830  	phy_set_drvdata(phy=
, am654_phy);
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  831  	phy_provider =3D de=
vm_of_phy_provider_register(dev, serdes_am654_xlate);
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  832  	if (IS_ERR(phy_prov=
ider)) {
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  833  		ret =3D PTR_ERR(ph=
y_provider);
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  834  		goto clk_err;
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  835  	}
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  836  =

71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  837  	return 0;
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  838  =

71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  839  clk_err:
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  840  	of_clk_del_provider=
(node);
dc404b65a54364 Miaoqian Lin           2022-01-05 @841  err_pm_disable:
dc404b65a54364 Miaoqian Lin           2022-01-05  842  	pm_runtime_disable(=
dev);
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  843  	return ret;
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  844  }
71e2f5c5c2249d Kishon Vijay Abraham I 2019-04-17  845  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8270926940433647628==--

