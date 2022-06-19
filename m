Content-Type: multipart/mixed; boundary="===============3267351274178203340=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pci/controller/dwc/pcie-kirin.c:221 hi3660_pcie_phy_clk_ctrl() warn: missing error code 'ret'
Date: Sun, 19 Jun 2022 18:41:33 +0800
Message-ID: <202206191805.WOziInZ7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3267351274178203340==
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
head:   4b35035bcf80ddb47c0112c4fbd84a63a2836a18
commit: 61d37547436dce45e3590db72360df0e230ca969 PCI: kirin: Reorganize the=
 PHY logic inside the driver
date:   8 months ago
:::::: branch date: 2 days ago
:::::: commit date: 8 months ago
config: parisc-randconfig-m031-20220619 (https://download.01.org/0day-ci/ar=
chive/20220619/202206191805.WOziInZ7-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/pci/controller/dwc/pcie-kirin.c:221 hi3660_pcie_phy_clk_ctrl() warn=
: missing error code 'ret'

vim +/ret +221 drivers/pci/controller/dwc/pcie-kirin.c

fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  215  =

61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  216  static int hi3660_pcie_phy_clk_ctrl(struct hi3660_pcie_p=
hy *phy, bool enable)
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  217  {
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  218  	int ret =3D 0;
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  219  =

fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  220  	if (!enable)
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19 @221  		goto close_clk;
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  222  =

61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  223  	ret =3D clk_set_rate(phy->phy_ref_clk, REF_CLK_FREQ);
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  224  	if (ret)
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  225  		return ret;
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  226  =

61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  227  	ret =3D clk_prepare_enable(phy->phy_ref_clk);
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  228  	if (ret)
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  229  		return ret;
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  230  =

61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  231  	ret =3D clk_prepare_enable(phy->apb_sys_clk);
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  232  	if (ret)
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  233  		goto apb_sys_fail;
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  234  =

61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  235  	ret =3D clk_prepare_enable(phy->apb_phy_clk);
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  236  	if (ret)
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  237  		goto apb_phy_fail;
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  238  =

61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  239  	ret =3D clk_prepare_enable(phy->aclk);
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  240  	if (ret)
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  241  		goto aclk_fail;
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  242  =

61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  243  	ret =3D clk_prepare_enable(phy->aux_clk);
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  244  	if (ret)
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  245  		goto aux_clk_fail;
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  246  =

fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  247  	return 0;
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  248  =

fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  249  close_clk:
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  250  	clk_disable_unprepare(phy->aux_clk);
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  251  aux_clk_fail:
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  252  	clk_disable_unprepare(phy->aclk);
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  253  aclk_fail:
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  254  	clk_disable_unprepare(phy->apb_phy_clk);
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  255  apb_phy_fail:
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  256  	clk_disable_unprepare(phy->apb_sys_clk);
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  257  apb_sys_fail:
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  258  	clk_disable_unprepare(phy->phy_ref_clk);
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  259  =

fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  260  	return ret;
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  261  }
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  262  =


:::::: The code at line 221 was first introduced by commit
:::::: fc5165db245ac4b56c19e634592a144352817c6d PCI: kirin: Add HiSilicon K=
irin SoC PCIe controller driver

:::::: TO: Xiaowei Song <songxiaowei@hisilicon.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3267351274178203340==--

