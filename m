Content-Type: multipart/mixed; boundary="===============4243136035596564349=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: drivers/pci/controller/dwc/pcie-tegra194.c:1898:23: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour. See condition at line 1895. [shiftTooManyBitsSigned]
Date: Fri, 22 May 2020 05:45:13 +0800
Message-ID: <202005220510.0PiyRjm8%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4243136035596564349==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Vidya Sagar <vidyas@nvidia.com>
CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b85051e755b0e9d6dd8f17ef1da083851b83287d
commit: c57247f940e8ea13a0ec33378304dc3cdc5da4a8 PCI: tegra: Add support fo=
r PCIe endpoint mode in Tegra194
date:   7 weeks ago
:::::: branch date: 25 hours ago
:::::: commit date: 7 weeks ago
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=3D1 build):
        git checkout c57247f940e8ea13a0ec33378304dc3cdc5da4a8
        # save the attached .config to linux build tree
        make ARCH=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/pci/controller/dwc/pcie-tegra194.c:1898:23: warning: Shifting si=
gned 32-bit value by 31 bits is implementation-defined behaviour. See condi=
tion at line 1895. [shiftTooManyBitsSigned]
    appl_writel(pcie, (1 << irq), APPL_MSI_CTRL_1);
                         ^
   drivers/pci/controller/dwc/pcie-tegra194.c:1895:19: note: Assuming that =
condition 'irq>31' is not redundant
    if (unlikely(irq > 31))
                     ^
   drivers/pci/controller/dwc/pcie-tegra194.c:1898:23: note: Shift
    appl_writel(pcie, (1 << irq), APPL_MSI_CTRL_1);
                         ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dc57247f940e8ea13a0ec33378304dc3cdc5da4a8
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout c57247f940e8ea13a0ec33378304dc3cdc5da4a8
vim +1898 drivers/pci/controller/dwc/pcie-tegra194.c

c57247f940e8ea Vidya Sagar 2020-03-03  1892  =

c57247f940e8ea Vidya Sagar 2020-03-03  1893  static int tegra_pcie_ep_raise=
_msi_irq(struct tegra_pcie_dw *pcie, u16 irq)
c57247f940e8ea Vidya Sagar 2020-03-03  1894  {
c57247f940e8ea Vidya Sagar 2020-03-03 @1895  	if (unlikely(irq > 31))
c57247f940e8ea Vidya Sagar 2020-03-03  1896  		return -EINVAL;
c57247f940e8ea Vidya Sagar 2020-03-03  1897  =

c57247f940e8ea Vidya Sagar 2020-03-03 @1898  	appl_writel(pcie, (1 << irq),=
 APPL_MSI_CTRL_1);
c57247f940e8ea Vidya Sagar 2020-03-03  1899  =

c57247f940e8ea Vidya Sagar 2020-03-03  1900  	return 0;
c57247f940e8ea Vidya Sagar 2020-03-03  1901  }
c57247f940e8ea Vidya Sagar 2020-03-03  1902  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============4243136035596564349==--

