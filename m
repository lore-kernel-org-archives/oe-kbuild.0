Content-Type: multipart/mixed; boundary="===============8152852909781575944=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.10 78/140] drivers/pci/controller/dwc/pcie-artpec6.c:475:3: warning: Consecutive return, break, continue, goto or throw statements are unnecessary. [duplicateBreak]
Date: Sun, 25 Jul 2021 07:28:05 +0800
Message-ID: <202107250757.3DNMsS5u-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8152852909781575944==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   370c019298b937a0e4f65756f8297af5194a41db
commit: 324cef01b84b35ebb4ab6dad5b4b9bbd8362b430 [78/140] UPSTREAM: PCI: dw=
c: Move "dbi", "dbi2", and "addr_space" resource setup into common code
:::::: branch date: 7 hours ago
:::::: commit date: 19 hours ago
compiler: ia64-linux-gcc (GCC) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/pci/controller/dwc/pcie-artpec6.c:475:3: warning: Consecutive re=
turn, break, continue, goto or throw statements are unnecessary. [duplicate=
Break]
     break;
     ^

vim +475 drivers/pci/controller/dwc/pcie-artpec6.c

794a8604fe6e4a drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-04-03  405  =

a3cbfae1f7b3b5 drivers/pci/host/pcie-artpec6.c           Niklas Cassel     =
     2016-05-09  406  static int artpec6_pcie_probe(struct platform_device =
*pdev)
a3cbfae1f7b3b5 drivers/pci/host/pcie-artpec6.c           Niklas Cassel     =
     2016-05-09  407  {
e6f3115f5836ee drivers/pci/host/pcie-artpec6.c           Bjorn Helgaas     =
     2016-10-06  408  	struct device *dev =3D &pdev->dev;
442ec4c04d1235 drivers/pci/dwc/pcie-artpec6.c            Kishon Vijay Abrah=
am I 2017-02-15  409  	struct dw_pcie *pci;
a3cbfae1f7b3b5 drivers/pci/host/pcie-artpec6.c           Niklas Cassel     =
     2016-05-09  410  	struct artpec6_pcie *artpec6_pcie;
a3cbfae1f7b3b5 drivers/pci/host/pcie-artpec6.c           Niklas Cassel     =
     2016-05-09  411  	int ret;
b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  412  	const struct of_device_id *match;
b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  413  	const struct artpec_pcie_of_data *data;
dc734ee02cb6f2 drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  414  	enum artpec_pcie_variants variant;
b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  415  	enum dw_pcie_device_mode mode;
b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  416  =

b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  417  	match =3D of_match_device(artpec6_pcie_of_match, dev=
);
b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  418  	if (!match)
b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  419  		return -EINVAL;
b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  420  =

b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  421  	data =3D (struct artpec_pcie_of_data *)match->data;
dc734ee02cb6f2 drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  422  	variant =3D (enum artpec_pcie_variants)data->variant;
b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  423  	mode =3D (enum dw_pcie_device_mode)data->mode;
a3cbfae1f7b3b5 drivers/pci/host/pcie-artpec6.c           Niklas Cassel     =
     2016-05-09  424  =

e6f3115f5836ee drivers/pci/host/pcie-artpec6.c           Bjorn Helgaas     =
     2016-10-06  425  	artpec6_pcie =3D devm_kzalloc(dev, sizeof(*artpec6_p=
cie), GFP_KERNEL);
a3cbfae1f7b3b5 drivers/pci/host/pcie-artpec6.c           Niklas Cassel     =
     2016-05-09  426  	if (!artpec6_pcie)
a3cbfae1f7b3b5 drivers/pci/host/pcie-artpec6.c           Niklas Cassel     =
     2016-05-09  427  		return -ENOMEM;
a3cbfae1f7b3b5 drivers/pci/host/pcie-artpec6.c           Niklas Cassel     =
     2016-05-09  428  =

442ec4c04d1235 drivers/pci/dwc/pcie-artpec6.c            Kishon Vijay Abrah=
am I 2017-02-15  429  	pci =3D devm_kzalloc(dev, sizeof(*pci), GFP_KERNEL);
442ec4c04d1235 drivers/pci/dwc/pcie-artpec6.c            Kishon Vijay Abrah=
am I 2017-02-15  430  	if (!pci)
442ec4c04d1235 drivers/pci/dwc/pcie-artpec6.c            Kishon Vijay Abrah=
am I 2017-02-15  431  		return -ENOMEM;
442ec4c04d1235 drivers/pci/dwc/pcie-artpec6.c            Kishon Vijay Abrah=
am I 2017-02-15  432  =

442ec4c04d1235 drivers/pci/dwc/pcie-artpec6.c            Kishon Vijay Abrah=
am I 2017-02-15  433  	pci->dev =3D dev;
794a8604fe6e4a drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-04-03  434  	pci->ops =3D &dw_pcie_ops;
a3cbfae1f7b3b5 drivers/pci/host/pcie-artpec6.c           Niklas Cassel     =
     2016-05-09  435  =

c0464062bfea9c drivers/pci/dwc/pcie-artpec6.c            Guenter Roeck     =
     2017-02-25  436  	artpec6_pcie->pci =3D pci;
dc734ee02cb6f2 drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  437  	artpec6_pcie->variant =3D variant;
b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  438  	artpec6_pcie->mode =3D mode;
c0464062bfea9c drivers/pci/dwc/pcie-artpec6.c            Guenter Roeck     =
     2017-02-25  439  =

936fa5cd7b8e3e drivers/pci/controller/dwc/pcie-artpec6.c Dejin Zheng       =
     2020-07-09  440  	artpec6_pcie->phy_base =3D
936fa5cd7b8e3e drivers/pci/controller/dwc/pcie-artpec6.c Dejin Zheng       =
     2020-07-09  441  		devm_platform_ioremap_resource_byname(pdev, "phy");
a3cbfae1f7b3b5 drivers/pci/host/pcie-artpec6.c           Niklas Cassel     =
     2016-05-09  442  	if (IS_ERR(artpec6_pcie->phy_base))
a3cbfae1f7b3b5 drivers/pci/host/pcie-artpec6.c           Niklas Cassel     =
     2016-05-09  443  		return PTR_ERR(artpec6_pcie->phy_base);
a3cbfae1f7b3b5 drivers/pci/host/pcie-artpec6.c           Niklas Cassel     =
     2016-05-09  444  =

a3cbfae1f7b3b5 drivers/pci/host/pcie-artpec6.c           Niklas Cassel     =
     2016-05-09  445  	artpec6_pcie->regmap =3D
e6f3115f5836ee drivers/pci/host/pcie-artpec6.c           Bjorn Helgaas     =
     2016-10-06  446  		syscon_regmap_lookup_by_phandle(dev->of_node,
a3cbfae1f7b3b5 drivers/pci/host/pcie-artpec6.c           Niklas Cassel     =
     2016-05-09  447  						"axis,syscon-pcie");
a3cbfae1f7b3b5 drivers/pci/host/pcie-artpec6.c           Niklas Cassel     =
     2016-05-09  448  	if (IS_ERR(artpec6_pcie->regmap))
a3cbfae1f7b3b5 drivers/pci/host/pcie-artpec6.c           Niklas Cassel     =
     2016-05-09  449  		return PTR_ERR(artpec6_pcie->regmap);
a3cbfae1f7b3b5 drivers/pci/host/pcie-artpec6.c           Niklas Cassel     =
     2016-05-09  450  =

9bcf0a6fdc5062 drivers/pci/dwc/pcie-artpec6.c            Kishon Vijay Abrah=
am I 2017-02-15  451  	platform_set_drvdata(pdev, artpec6_pcie);
9bcf0a6fdc5062 drivers/pci/dwc/pcie-artpec6.c            Kishon Vijay Abrah=
am I 2017-02-15  452  =

b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  453  	switch (artpec6_pcie->mode) {
b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  454  	case DW_PCIE_RC_TYPE:
b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  455  		if (!IS_ENABLED(CONFIG_PCIE_ARTPEC6_HOST))
b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  456  			return -ENODEV;
b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  457  =

b6f5f434f079eb drivers/pci/host/pcie-artpec6.c           Bjorn Helgaas     =
     2016-10-06  458  		ret =3D artpec6_add_pcie_port(artpec6_pcie, pdev);
a3cbfae1f7b3b5 drivers/pci/host/pcie-artpec6.c           Niklas Cassel     =
     2016-05-09  459  		if (ret < 0)
a3cbfae1f7b3b5 drivers/pci/host/pcie-artpec6.c           Niklas Cassel     =
     2016-05-09  460  			return ret;
b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  461  		break;
b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  462  	case DW_PCIE_EP_TYPE: {
b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  463  		u32 val;
b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  464  =

b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  465  		if (!IS_ENABLED(CONFIG_PCIE_ARTPEC6_EP))
b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  466  			return -ENODEV;
b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  467  =

b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  468  		val =3D artpec6_pcie_readl(artpec6_pcie, PCIECFG);
b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  469  		val &=3D ~PCIECFG_DEVICE_TYPE_MASK;
b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  470  		artpec6_pcie_writel(artpec6_pcie, PCIECFG, val);
324cef01b84b35 drivers/pci/controller/dwc/pcie-artpec6.c Rob Herring       =
     2020-11-05  471  =

324cef01b84b35 drivers/pci/controller/dwc/pcie-artpec6.c Rob Herring       =
     2020-11-05  472  		pci->ep.ops =3D &pcie_ep_ops;
324cef01b84b35 drivers/pci/controller/dwc/pcie-artpec6.c Rob Herring       =
     2020-11-05  473  =

324cef01b84b35 drivers/pci/controller/dwc/pcie-artpec6.c Rob Herring       =
     2020-11-05  474  		return dw_pcie_ep_init(&pci->ep);
b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20 @475  		break;
b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  476  	}
b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  477  	default:
b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  478  		dev_err(dev, "INVALID device type %d\n", artpec6_pc=
ie->mode);
b5074ef6fe7d6e drivers/pci/dwc/pcie-artpec6.c            Niklas Cassel     =
     2017-12-20  479  	}
a3cbfae1f7b3b5 drivers/pci/host/pcie-artpec6.c           Niklas Cassel     =
     2016-05-09  480  =

a3cbfae1f7b3b5 drivers/pci/host/pcie-artpec6.c           Niklas Cassel     =
     2016-05-09  481  	return 0;
a3cbfae1f7b3b5 drivers/pci/host/pcie-artpec6.c           Niklas Cassel     =
     2016-05-09  482  }
a3cbfae1f7b3b5 drivers/pci/host/pcie-artpec6.c           Niklas Cassel     =
     2016-05-09  483  =


:::::: The code at line 475 was first introduced by commit
:::::: b5074ef6fe7d6ed4bb8cd8660907b3092b8ae325 PCI: dwc: artpec6: Add supp=
ort for endpoint mode

:::::: TO: Niklas Cassel <niklas.cassel@axis.com>
:::::: CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8152852909781575944==--

