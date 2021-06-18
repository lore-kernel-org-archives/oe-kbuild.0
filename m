Content-Type: multipart/mixed; boundary="===============9167515675093784314=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [pci:for-linus 2/9] drivers/pci/controller/dwc/pcie-tegra194.c:1829:23: warning: Shifting signed 32-bit value by 31 bits is undefined behaviour. See condition at line 1826. [shiftTooManyBitsSigned]
Date: Fri, 18 Jun 2021 09:11:39 +0800
Message-ID: <202106180930.VMCHPw3p-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9167515675093784314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-pci(a)vger.kernel.org
TO: Jon Hunter <jonathanh@nvidia.com>
CC: Bjorn Helgaas <helgaas@kernel.org>
CC: Thierry Reding <treding@nvidia.com>

Hi Jon,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git for=
-linus
head:   15ac366c3d20ce1e08173f1de393a8ce95a1facf
commit: 99ab5996278379a02d5a84c4a7ac33a2ebfdb29e [2/9] PCI: tegra194: Fix M=
CFG quirk build regressions
:::::: branch date: 3 hours ago
:::::: commit date: 5 hours ago
compiler: m68k-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/pci/controller/dwc/pcie-tegra194.c:1829:23: warning: Shifting si=
gned 32-bit value by 31 bits is undefined behaviour. See condition at line =
1826. [shiftTooManyBitsSigned]
    appl_writel(pcie, (1 << irq), APPL_MSI_CTRL_1);
                         ^
   drivers/pci/controller/dwc/pcie-tegra194.c:1826:19: note: Assuming that =
condition 'irq>31' is not redundant
    if (unlikely(irq > 31))
                     ^
   drivers/pci/controller/dwc/pcie-tegra194.c:1829:23: note: Shift
    appl_writel(pcie, (1 << irq), APPL_MSI_CTRL_1);
                         ^

vim +1829 drivers/pci/controller/dwc/pcie-tegra194.c

c57247f940e8ea Vidya Sagar 2020-03-03  1823  =

c57247f940e8ea Vidya Sagar 2020-03-03  1824  static int tegra_pcie_ep_raise=
_msi_irq(struct tegra_pcie_dw *pcie, u16 irq)
c57247f940e8ea Vidya Sagar 2020-03-03  1825  {
c57247f940e8ea Vidya Sagar 2020-03-03 @1826  	if (unlikely(irq > 31))
c57247f940e8ea Vidya Sagar 2020-03-03  1827  		return -EINVAL;
c57247f940e8ea Vidya Sagar 2020-03-03  1828  =

c57247f940e8ea Vidya Sagar 2020-03-03 @1829  	appl_writel(pcie, (1 << irq),=
 APPL_MSI_CTRL_1);
c57247f940e8ea Vidya Sagar 2020-03-03  1830  =

c57247f940e8ea Vidya Sagar 2020-03-03  1831  	return 0;
c57247f940e8ea Vidya Sagar 2020-03-03  1832  }
c57247f940e8ea Vidya Sagar 2020-03-03  1833  =


:::::: The code@line 1829 was first introduced by commit
:::::: c57247f940e8ea13a0ec33378304dc3cdc5da4a8 PCI: tegra: Add support for=
 PCIe endpoint mode in Tegra194

:::::: TO: Vidya Sagar <vidyas@nvidia.com>
:::::: CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9167515675093784314==--

