Content-Type: multipart/mixed; boundary="===============3636761153759078520=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [pci:pci/misc 2/3] drivers/pci/controller/dwc/pcie-tegra194.c:2194:2-9: line 2194 is redundant because platform_get_irq() already prints an error
Date: Fri, 08 May 2020 07:27:25 +0800
Message-ID: <202005080708.oPqRROEz%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3636761153759078520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-pci(a)vger.kernel.org
TO: Aman Sharma <amanharitsh123@gmail.com>
CC: Bjorn Helgaas <helgaas@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git pci=
/misc
head:   a88f8c176147d9778330082fcc34b7107da756aa
commit: 198938ec966d45c47eb7c1f6d2a4ac82c12bf5ce [2/3] PCI: Check for platf=
orm_get_irq() failure consistently
:::::: branch date: 3 hours ago
:::::: commit date: 2 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/pci/controller/dwc/pcie-tegra194.c:2194:2-9: line 2194 is redund=
ant because platform_get_irq() already prints an error

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3636761153759078520==--

