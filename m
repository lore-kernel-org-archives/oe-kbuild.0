Content-Type: multipart/mixed; boundary="===============8008544809121813075=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/usb/gadget/udc/bcm63xx_udc.c:1861 bcm63xx_udc_stop() warn: sleeping in atomic context
Date: Fri, 05 Aug 2022 00:53:31 +0800
Message-ID: <202208050012.uDlpcTiD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8008544809121813075==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Randy Dunlap <rdunlap@infradead.org>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b44f2fd87919b5ae6e1756d4c7ba2cbba22238e1
commit: 5eeaafc8d69373c095e461bdb39e5c9b62228ac5 mips: BCM63XX: ensure that=
 CPU_SUPPORTS_32BIT_KERNEL is set
date:   9 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 9 months ago
config: mips-randconfig-m041-20220804 (https://download.01.org/0day-ci/arch=
ive/20220805/202208050012.uDlpcTiD-lkp(a)intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/usb/gadget/udc/bcm63xx_udc.c:1861 bcm63xx_udc_stop() warn: sleeping=
 in atomic context
arch/mips/mm/tlbex.c:1677 iPTE_LW() warn: curly braces intended?
arch/mips/mm/fault.c:322 __do_page_fault() warn: inconsistent returns '&mm-=
>mmap_lock'.

Old smatch warnings:
arch/mips/mm/tlbex.c:1709 iPTE_SW() warn: inconsistent indenting
arch/mips/mm/tlbex.c:2166 build_r4000_tlb_load_handler() warn: inconsistent=
 indenting

vim +1861 drivers/usb/gadget/udc/bcm63xx_udc.c

613065e53cb191 drivers/usb/gadget/bcm63xx_udc.c     Kevin Cernekee     2012=
-08-25  1840  =

613065e53cb191 drivers/usb/gadget/bcm63xx_udc.c     Kevin Cernekee     2012=
-08-25  1841  /**
613065e53cb191 drivers/usb/gadget/bcm63xx_udc.c     Kevin Cernekee     2012=
-08-25  1842   * bcm63xx_udc_stop - Shut down the controller.
b9b70170db4d68 drivers/usb/gadget/udc/bcm63xx_udc.c Greg Kroah-Hartman 2020=
-06-30  1843   * @gadget: USB device.
b9b70170db4d68 drivers/usb/gadget/udc/bcm63xx_udc.c Greg Kroah-Hartman 2020=
-06-30  1844   * @driver: Driver for USB device.
613065e53cb191 drivers/usb/gadget/bcm63xx_udc.c     Kevin Cernekee     2012=
-08-25  1845   */
22835b807e7ca9 drivers/usb/gadget/udc/bcm63xx_udc.c Felipe Balbi       2014=
-10-17  1846  static int bcm63xx_udc_stop(struct usb_gadget *gadget)
613065e53cb191 drivers/usb/gadget/bcm63xx_udc.c     Kevin Cernekee     2012=
-08-25  1847  {
613065e53cb191 drivers/usb/gadget/bcm63xx_udc.c     Kevin Cernekee     2012=
-08-25  1848  	struct bcm63xx_udc *udc =3D gadget_to_udc(gadget);
613065e53cb191 drivers/usb/gadget/bcm63xx_udc.c     Kevin Cernekee     2012=
-08-25  1849  	unsigned long flags;
613065e53cb191 drivers/usb/gadget/bcm63xx_udc.c     Kevin Cernekee     2012=
-08-25  1850  =

613065e53cb191 drivers/usb/gadget/bcm63xx_udc.c     Kevin Cernekee     2012=
-08-25  1851  	spin_lock_irqsave(&udc->lock, flags);
613065e53cb191 drivers/usb/gadget/bcm63xx_udc.c     Kevin Cernekee     2012=
-08-25  1852  =

613065e53cb191 drivers/usb/gadget/bcm63xx_udc.c     Kevin Cernekee     2012=
-08-25  1853  	udc->driver =3D NULL;
613065e53cb191 drivers/usb/gadget/bcm63xx_udc.c     Kevin Cernekee     2012=
-08-25  1854  =

613065e53cb191 drivers/usb/gadget/bcm63xx_udc.c     Kevin Cernekee     2012=
-08-25  1855  	/*
613065e53cb191 drivers/usb/gadget/bcm63xx_udc.c     Kevin Cernekee     2012=
-08-25  1856  	 * If we switch the PHY too abruptly after dropping D+, the =
host
613065e53cb191 drivers/usb/gadget/bcm63xx_udc.c     Kevin Cernekee     2012=
-08-25  1857  	 * will often complain:
613065e53cb191 drivers/usb/gadget/bcm63xx_udc.c     Kevin Cernekee     2012=
-08-25  1858  	 *
613065e53cb191 drivers/usb/gadget/bcm63xx_udc.c     Kevin Cernekee     2012=
-08-25  1859  	 *     hub 1-0:1.0: port 1 disabled by hub (EMI?), re-enabli=
ng...
613065e53cb191 drivers/usb/gadget/bcm63xx_udc.c     Kevin Cernekee     2012=
-08-25  1860  	 */
613065e53cb191 drivers/usb/gadget/bcm63xx_udc.c     Kevin Cernekee     2012=
-08-25 @1861  	msleep(100);
613065e53cb191 drivers/usb/gadget/bcm63xx_udc.c     Kevin Cernekee     2012=
-08-25  1862  =

613065e53cb191 drivers/usb/gadget/bcm63xx_udc.c     Kevin Cernekee     2012=
-08-25  1863  	bcm63xx_select_phy_mode(udc, false);
613065e53cb191 drivers/usb/gadget/bcm63xx_udc.c     Kevin Cernekee     2012=
-08-25  1864  	set_clocks(udc, false);
613065e53cb191 drivers/usb/gadget/bcm63xx_udc.c     Kevin Cernekee     2012=
-08-25  1865  =

613065e53cb191 drivers/usb/gadget/bcm63xx_udc.c     Kevin Cernekee     2012=
-08-25  1866  	spin_unlock_irqrestore(&udc->lock, flags);
613065e53cb191 drivers/usb/gadget/bcm63xx_udc.c     Kevin Cernekee     2012=
-08-25  1867  =

613065e53cb191 drivers/usb/gadget/bcm63xx_udc.c     Kevin Cernekee     2012=
-08-25  1868  	return 0;
613065e53cb191 drivers/usb/gadget/bcm63xx_udc.c     Kevin Cernekee     2012=
-08-25  1869  }
613065e53cb191 drivers/usb/gadget/bcm63xx_udc.c     Kevin Cernekee     2012=
-08-25  1870  =


:::::: The code at line 1861 was first introduced by commit
:::::: 613065e53cb191d00d9d4fc377398b656ed05a45 usb: gadget: bcm63xx UDC dr=
iver

:::::: TO: Kevin Cernekee <cernekee@gmail.com>
:::::: CC: Felipe Balbi <balbi@ti.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8008544809121813075==--

