Content-Type: multipart/mixed; boundary="===============3760826007633644395=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pci/controller/dwc/pci-dra7xx.c:864 dra7xx_pcie_probe() warn: 'dra7xx->clk' not released on lines: 759.
Date: Tue, 30 Nov 2021 18:07:07 +0800
Message-ID: <202111301803.NOwoj4Jd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3760826007633644395==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Luca Ceresoli <luca@lucaceresoli.net>
CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d58071a8a76d779eedab38033ae4c821c30295a5
commit: 5af9405397bfb90d6adab61d58f4d94c78166698 PCI: dra7xx: Get an option=
al clock
date:   9 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 9 weeks ago
config: powerpc64-randconfig-m031-20211128 (https://download.01.org/0day-ci=
/archive/20211130/202111301803.NOwoj4Jd-lkp(a)intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/pci/controller/dwc/pci-dra7xx.c:864 dra7xx_pcie_probe() warn: 'dra7=
xx->clk' not released on lines: 759.

vim +864 drivers/pci/controller/dwc/pci-dra7xx.c

c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham=
 I 2019-01-24  683  =

e259c2926c016d drivers/pci/controller/dwc/pci-dra7xx.c Tony Lindgren       =
   2021-03-10  684  static int dra7xx_pcie_probe(struct platform_device *pd=
ev)
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  685  {
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  686  	u32 reg;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  687  	int ret;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  688  	int irq;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  689  	int i;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  690  	int phy_count;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  691  	struct phy **phy;
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-10-09  692  	struct device_link **link;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  693  	void __iomem *base;
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-02-15  694  	struct dw_pcie *pci;
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-02-15  695  	struct dra7xx_pcie *dra7xx;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  696  	struct device *dev =3D &pdev->dev;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  697  	struct device_node *np =3D dev->of_node;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  698  	char name[10];
602d38bc65aa29 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-01-11  699  	struct gpio_desc *reset;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  700  	const struct of_device_id *match;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  701  	const struct dra7xx_pcie_of_data *data;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  702  	enum dw_pcie_device_mode mode;
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham=
 I 2019-01-24  703  	u32 b1co_mode_sel_mask;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  704  =

608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  705  	match =3D of_match_device(of_match_ptr(of_dra7xx_pcie_=
match), dev);
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  706  	if (!match)
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  707  		return -EINVAL;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  708  =

608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  709  	data =3D (struct dra7xx_pcie_of_data *)match->data;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  710  	mode =3D (enum dw_pcie_device_mode)data->mode;
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham=
 I 2019-01-24  711  	b1co_mode_sel_mask =3D data->b1co_mode_sel_mask;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  712  =

47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  713  	dra7xx =3D devm_kzalloc(dev, sizeof(*dra7xx), GFP_KERN=
EL);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  714  	if (!dra7xx)
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  715  		return -ENOMEM;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  716  =

442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-02-15  717  	pci =3D devm_kzalloc(dev, sizeof(*pci), GFP_KERNEL);
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-02-15  718  	if (!pci)
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-02-15  719  		return -ENOMEM;
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-02-15  720  =

442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-02-15  721  	pci->dev =3D dev;
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-02-15  722  	pci->ops =3D &dw_pcie_ops;
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-02-15  723  =

47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  724  	irq =3D platform_get_irq(pdev, 0);
caecb05c800081 drivers/pci/controller/dwc/pci-dra7xx.c Krzysztof Wilczy=C5=
=84ski   2020-08-02  725  	if (irq < 0)
a0d21ba120d2c7 drivers/pci/dwc/pci-dra7xx.c            Gustavo A. R. Silva =
   2017-08-09  726  		return irq;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  727  =

c8a119779f5609 drivers/pci/controller/dwc/pci-dra7xx.c Wei Yongjun         =
   2020-04-29  728  	base =3D devm_platform_ioremap_resource_byname(pdev, "=
ti_conf");
c8a119779f5609 drivers/pci/controller/dwc/pci-dra7xx.c Wei Yongjun         =
   2020-04-29  729  	if (IS_ERR(base))
c8a119779f5609 drivers/pci/controller/dwc/pci-dra7xx.c Wei Yongjun         =
   2020-04-29  730  		return PTR_ERR(base);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  731  =

47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  732  	phy_count =3D of_property_count_strings(np, "phy-names=
");
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  733  	if (phy_count < 0) {
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  734  		dev_err(dev, "unable to find the strings\n");
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  735  		return phy_count;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  736  	}
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  737  =

a86854d0c599b3 drivers/pci/dwc/pci-dra7xx.c            Kees Cook           =
   2018-06-12  738  	phy =3D devm_kcalloc(dev, phy_count, sizeof(*phy), GFP=
_KERNEL);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  739  	if (!phy)
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  740  		return -ENOMEM;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  741  =

a86854d0c599b3 drivers/pci/dwc/pci-dra7xx.c            Kees Cook           =
   2018-06-12  742  	link =3D devm_kcalloc(dev, phy_count, sizeof(*link), G=
FP_KERNEL);
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-10-09  743  	if (!link)
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-10-09  744  		return -ENOMEM;
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-10-09  745  =

5af9405397bfb9 drivers/pci/controller/dwc/pci-dra7xx.c Luca Ceresoli       =
   2021-05-31  746  	dra7xx->clk =3D devm_clk_get_optional(dev, NULL);
5af9405397bfb9 drivers/pci/controller/dwc/pci-dra7xx.c Luca Ceresoli       =
   2021-05-31  747  	if (IS_ERR(dra7xx->clk))
5af9405397bfb9 drivers/pci/controller/dwc/pci-dra7xx.c Luca Ceresoli       =
   2021-05-31  748  		return dev_err_probe(dev, PTR_ERR(dra7xx->clk),
5af9405397bfb9 drivers/pci/controller/dwc/pci-dra7xx.c Luca Ceresoli       =
   2021-05-31  749  				     "clock request failed");
5af9405397bfb9 drivers/pci/controller/dwc/pci-dra7xx.c Luca Ceresoli       =
   2021-05-31  750  =

5af9405397bfb9 drivers/pci/controller/dwc/pci-dra7xx.c Luca Ceresoli       =
   2021-05-31  751  	ret =3D clk_prepare_enable(dra7xx->clk);
5af9405397bfb9 drivers/pci/controller/dwc/pci-dra7xx.c Luca Ceresoli       =
   2021-05-31  752  	if (ret)
5af9405397bfb9 drivers/pci/controller/dwc/pci-dra7xx.c Luca Ceresoli       =
   2021-05-31  753  		return ret;
5af9405397bfb9 drivers/pci/controller/dwc/pci-dra7xx.c Luca Ceresoli       =
   2021-05-31  754  =

47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  755  	for (i =3D 0; i < phy_count; i++) {
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  756  		snprintf(name, sizeof(name), "pcie-phy%d", i);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  757  		phy[i] =3D devm_phy_get(dev, name);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  758  		if (IS_ERR(phy[i]))
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  759  			return PTR_ERR(phy[i]);
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-10-09  760  =

7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-10-09  761  		link[i] =3D device_link_add(dev, &phy[i]->dev, DL_FLA=
G_STATELESS);
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-10-09  762  		if (!link[i]) {
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-10-09  763  			ret =3D -EINVAL;
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-10-09  764  			goto err_link;
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-10-09  765  		}
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  766  	}
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  767  =

47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  768  	dra7xx->base =3D base;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  769  	dra7xx->phy =3D phy;
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-02-15  770  	dra7xx->pci =3D pci;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  771  	dra7xx->phy_count =3D phy_count;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  772  =

c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham=
 I 2019-01-24  773  	if (phy_count =3D=3D 2) {
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham=
 I 2019-01-24  774  		ret =3D dra7xx_pcie_configure_two_lane(dev, b1co_mode=
_sel_mask);
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham=
 I 2019-01-24  775  		if (ret < 0)
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham=
 I 2019-01-24  776  			dra7xx->phy_count =3D 1; /* Fallback to x1 lane mode=
 */
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham=
 I 2019-01-24  777  	}
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham=
 I 2019-01-24  778  =

1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-01-11  779  	ret =3D dra7xx_pcie_enable_phy(dra7xx);
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-01-11  780  	if (ret) {
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-01-11  781  		dev_err(dev, "failed to enable phy\n");
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-01-11  782  		return ret;
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-01-11  783  	}
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-01-11  784  =

9bcf0a6fdc5062 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-02-15  785  	platform_set_drvdata(pdev, dra7xx);
9bcf0a6fdc5062 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-02-15  786  =

47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  787  	pm_runtime_enable(dev);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  788  	ret =3D pm_runtime_get_sync(dev);
d3f4caa355c1c9 drivers/pci/host/pci-dra7xx.c           Fabio Estevam       =
   2015-08-20  789  	if (ret < 0) {
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  790  		dev_err(dev, "pm_runtime_get_sync failed\n");
0e2bdb0e7abf4b drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2015-07-31  791  		goto err_get_sync;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  792  	}
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  793  =

602d38bc65aa29 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-01-11  794  	reset =3D devm_gpiod_get_optional(dev, NULL, GPIOD_OUT=
_HIGH);
602d38bc65aa29 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-01-11  795  	if (IS_ERR(reset)) {
602d38bc65aa29 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-01-11  796  		ret =3D PTR_ERR(reset);
602d38bc65aa29 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-01-11  797  		dev_err(&pdev->dev, "gpio request failed, ret %d\n", =
ret);
78bdcad05ea17f drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2015-07-28  798  		goto err_gpio;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  799  	}
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  800  =

47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  801  	reg =3D dra7xx_pcie_readl(dra7xx, PCIECTRL_DRA7XX_CONF=
_DEVICE_CMD);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  802  	reg &=3D ~LTSSM_EN;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  803  	dra7xx_pcie_writel(dra7xx, PCIECTRL_DRA7XX_CONF_DEVICE=
_CMD, reg);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  804  =

608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  805  	switch (mode) {
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  806  	case DW_PCIE_RC_TYPE:
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel       =
   2017-12-20  807  		if (!IS_ENABLED(CONFIG_PCI_DRA7XX_HOST)) {
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel       =
   2017-12-20  808  			ret =3D -ENODEV;
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel       =
   2017-12-20  809  			goto err_gpio;
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel       =
   2017-12-20  810  		}
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel       =
   2017-12-20  811  =

608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  812  		dra7xx_pcie_writel(dra7xx, PCIECTRL_TI_CONF_DEVICE_TY=
PE,
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  813  				   DEVICE_TYPE_RC);
726d75a6d243bf drivers/pci/controller/dwc/pci-dra7xx.c Vignesh R           =
   2018-09-25  814  =

726d75a6d243bf drivers/pci/controller/dwc/pci-dra7xx.c Vignesh R           =
   2018-09-25  815  		ret =3D dra7xx_pcie_unaligned_memaccess(dev);
726d75a6d243bf drivers/pci/controller/dwc/pci-dra7xx.c Vignesh R           =
   2018-09-25  816  		if (ret)
726d75a6d243bf drivers/pci/controller/dwc/pci-dra7xx.c Vignesh R           =
   2018-09-25  817  			dev_err(dev, "WA for Errata i870 not applied\n");
726d75a6d243bf drivers/pci/controller/dwc/pci-dra7xx.c Vignesh R           =
   2018-09-25  818  =

23926c8dbd6fdc drivers/pci/host/pci-dra7xx.c           Jingoo Han          =
   2014-11-06  819  		ret =3D dra7xx_add_pcie_port(dra7xx, pdev);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  820  		if (ret < 0)
78bdcad05ea17f drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2015-07-28  821  			goto err_gpio;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  822  		break;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  823  	case DW_PCIE_EP_TYPE:
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel       =
   2017-12-20  824  		if (!IS_ENABLED(CONFIG_PCI_DRA7XX_EP)) {
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel       =
   2017-12-20  825  			ret =3D -ENODEV;
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel       =
   2017-12-20  826  			goto err_gpio;
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel       =
   2017-12-20  827  		}
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel       =
   2017-12-20  828  =

608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  829  		dra7xx_pcie_writel(dra7xx, PCIECTRL_TI_CONF_DEVICE_TY=
PE,
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  830  				   DEVICE_TYPE_EP);
f7a2757f6cd0aa drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  831  =

726d75a6d243bf drivers/pci/controller/dwc/pci-dra7xx.c Vignesh R           =
   2018-09-25  832  		ret =3D dra7xx_pcie_unaligned_memaccess(dev);
f7a2757f6cd0aa drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  833  		if (ret)
f7a2757f6cd0aa drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  834  			goto err_gpio;
f7a2757f6cd0aa drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  835  =

608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  836  		ret =3D dra7xx_add_pcie_ep(dra7xx, pdev);
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  837  		if (ret < 0)
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  838  			goto err_gpio;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  839  		break;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  840  	default:
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  841  		dev_err(dev, "INVALID device type %d\n", mode);
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  842  	}
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-03-27  843  	dra7xx->mode =3D mode;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  844  =

d4c7d1a089d6fd drivers/pci/dwc/pci-dra7xx.c            Keerthy             =
   2017-03-13  845  	ret =3D devm_request_irq(dev, irq, dra7xx_pcie_irq_han=
dler,
d4c7d1a089d6fd drivers/pci/dwc/pci-dra7xx.c            Keerthy             =
   2017-03-13  846  			       IRQF_SHARED, "dra7xx-pcie-main", dra7xx);
d4c7d1a089d6fd drivers/pci/dwc/pci-dra7xx.c            Keerthy             =
   2017-03-13  847  	if (ret) {
d4c7d1a089d6fd drivers/pci/dwc/pci-dra7xx.c            Keerthy             =
   2017-03-13  848  		dev_err(dev, "failed to request irq\n");
d4c7d1a089d6fd drivers/pci/dwc/pci-dra7xx.c            Keerthy             =
   2017-03-13  849  		goto err_gpio;
d4c7d1a089d6fd drivers/pci/dwc/pci-dra7xx.c            Keerthy             =
   2017-03-13  850  	}
d4c7d1a089d6fd drivers/pci/dwc/pci-dra7xx.c            Keerthy             =
   2017-03-13  851  =

47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  852  	return 0;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  853  =

78bdcad05ea17f drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2015-07-28  854  err_gpio:
0e2bdb0e7abf4b drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2015-07-31  855  err_get_sync:
c2615d620a852a drivers/pci/controller/dwc/pci-dra7xx.c Dinghao Liu         =
   2020-05-20  856  	pm_runtime_put(dev);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  857  	pm_runtime_disable(dev);
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-01-11  858  	dra7xx_pcie_disable_phy(dra7xx);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  859  =

7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-10-09  860  err_link:
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-10-09  861  	while (--i >=3D 0)
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-10-09  862  		device_link_del(link[i]);
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham=
 I 2017-10-09  863  =

47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22 @864  	return ret;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  865  }
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham=
 I 2014-07-22  866  =


:::::: The code at line 864 was first introduced by commit
:::::: 47ff3de911a728cdf9ecc6ad777131902cff62b4 PCI: dra7xx: Add TI DRA7xx =
PCIe driver

:::::: TO: Kishon Vijay Abraham I <kishon@ti.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3760826007633644395==--

