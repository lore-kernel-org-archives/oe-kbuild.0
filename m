Content-Type: multipart/mixed; boundary="===============5159728019052621966=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pci/controller/dwc/pcie-kirin.c:321:2: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing it? [uselessAssignmentPtrArg]
Date: Fri, 25 Feb 2022 08:56:52 +0800
Message-ID: <202202250839.jqjO1m34-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5159728019052621966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Bjorn Helgaas <helgaas@kernel.org>
CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   73878e5eb1bd3c9656685ca60bc3a49d17311e0c
commit: 61d37547436dce45e3590db72360df0e230ca969 PCI: kirin: Reorganize the=
 PHY logic inside the driver
date:   4 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 months ago
compiler: alpha-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/pci/controller/dwc/pcie-kirin.c:321:2: warning: Assignment of fu=
nction parameter has no effect outside the function. Did you forget derefer=
encing it? [uselessAssignmentPtrArg]
    pdev =3D container_of(dev, struct platform_device, dev);
    ^
>> drivers/scsi/pm8001/pm8001_hwi.c:4493:51: warning: Same expression on bo=
th sides of '&'. [knownConditionTrueFalse]
    payload.dtype_dlr_retry =3D cpu_to_le32((retryFlag & 0x01) |
                                                     ^
   drivers/scsi/pm8001/pm8001_hwi.c:4458:17: note: 'retryFlag' is assigned =
value '1' here.
    u8 retryFlag =3D 0x1;
                   ^
   drivers/scsi/pm8001/pm8001_hwi.c:4493:51: note: Same expression on both =
sides of '&'.
    payload.dtype_dlr_retry =3D cpu_to_le32((retryFlag & 0x01) |
                                                     ^

vim +321 drivers/pci/controller/dwc/pcie-kirin.c

61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  305  =

61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  306  static int hi3660_pcie_phy_init(struct platform_device *=
pdev,
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  307  				struct kirin_pcie *pcie)
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  308  {
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  309  	struct device *dev =3D &pdev->dev;
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  310  	struct hi3660_pcie_phy *phy;
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  311  	int ret;
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  312  =

61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  313  	phy =3D devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  314  	if (!phy)
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  315  		return -ENOMEM;
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  316  =

61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  317  	pcie->phy_priv =3D phy;
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  318  	phy->dev =3D dev;
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  319  =

61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  320  	/* registers */
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21 @321  	pdev =3D container_of(dev, struct platform_device, dev);
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  322  =

61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  323  	ret =3D hi3660_pcie_phy_get_clk(phy);
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  324  	if (ret)
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  325  		return ret;
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  326  =

61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  327  	return hi3660_pcie_phy_get_resource(phy);
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  328  }
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  329  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5159728019052621966==--

