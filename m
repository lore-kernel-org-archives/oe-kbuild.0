Content-Type: multipart/mixed; boundary="===============5872312241985698188=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v7 1/1] PCI: microchip: Add host driver for Microchip PCIe controller
Date: Fri, 17 Apr 2020 08:19:04 +0800
Message-ID: <202004170819.xaaaRBOa%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5872312241985698188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200416144247.GA2760@IRE-LT-SPARE06.mchp-main.com>
References: <20200416144247.GA2760@IRE-LT-SPARE06.mchp-main.com>
TO: Daire McNamara <daire.mcnamara@microchip.com>
TO: lorenzo.pieralisi(a)arm.com
TO: amurray(a)thegoodpenguin.co.uk
TO: bhelgaas(a)google.com
TO: linux-pci(a)vger.kernel.org

Hi Daire,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on c0cc271173b2e1c2d8d0ceaef14e4dfa79eefc0d]

url:    https://github.com/0day-ci/linux/commits/Daire-McNamara/PCI-microch=
ip-Add-host-driver-for-Microchip-PCIe-controller/20200417-025751
base:    c0cc271173b2e1c2d8d0ceaef14e4dfa79eefc0d
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/pci/controller/pcie-microchip-host.c:261:2-9: line 261 is redund=
ant because platform_get_irq() already prints an error
--
>> drivers/pci/controller/pcie-microchip-host.c:260:5-14: WARNING: Unsigned=
 expression compared with zero: pcie -> irq < 0

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============5872312241985698188==--

