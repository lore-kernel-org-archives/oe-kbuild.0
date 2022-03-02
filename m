Content-Type: multipart/mixed; boundary="===============3307102975862920408=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rafael-pm:bleeding-edge 113/118] arch/x86/kernel/acpi/boot.c:1476:22: sparse: sparse: excessive elements in array initializer
Date: Wed, 02 Mar 2022 13:14:06 +0800
Message-ID: <202203021316.r0hMgV0f-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3307102975862920408==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-acpi(a)vger.kernel.org
CC: devel(a)acpica.org
CC: linux-pm(a)vger.kernel.org
TO: Mark Cilissen <mark@yotsuba.nl>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git=
 bleeding-edge
head:   f7307721a01f4f14d21c699b270a870370cf34b9
commit: ed00b2b8d737f87a2437d7bd7c7f90124b50da05 [113/118] x86 / ACPI: Work=
 around broken XSDT on SEGA AALE board
:::::: branch date: 9 hours ago
:::::: commit date: 10 hours ago
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20220=
302/202203021316.r0hMgV0f-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.g=
it/commit/?id=3Ded00b2b8d737f87a2437d7bd7c7f90124b50da05
        git remote add rafael-pm https://git.kernel.org/pub/scm/linux/kerne=
l/git/rafael/linux-pm.git
        git fetch --no-tags rafael-pm bleeding-edge
        git checkout ed00b2b8d737f87a2437d7bd7c7f90124b50da05
        # save the config file to linux build tree
        mkdir build_dir
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash arch/x86/kernel/acpi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   arch/x86/kernel/acpi/boot.c:112:30: sparse: sparse: incorrect type in re=
turn expression (different address spaces) @@     expected void [noderef] _=
_iomem * @@     got void * @@
   arch/x86/kernel/acpi/boot.c:112:30: sparse:     expected void [noderef] =
__iomem *
   arch/x86/kernel/acpi/boot.c:112:30: sparse:     got void *
   arch/x86/kernel/acpi/boot.c:120:24: sparse: sparse: incorrect type in ar=
gument 1 (different address spaces) @@     expected void *addr @@     got v=
oid [noderef] __iomem *map @@
   arch/x86/kernel/acpi/boot.c:120:24: sparse:     expected void *addr
   arch/x86/kernel/acpi/boot.c:120:24: sparse:     got void [noderef] __iom=
em *map
>> arch/x86/kernel/acpi/boot.c:1476:22: sparse: sparse: excessive elements =
in array initializer

vim +1476 arch/x86/kernel/acpi/boot.c

7486341a98f2685 arch/x86/kernel/acpi/boot.c  Li, Aubrey        2015-03-11  =
1389  =

aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1390  /*
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1391   * If your system is blacklisted here, but you find that acpi=3Dforce
5b4c0b6fffb91b0 arch/x86/kernel/acpi/boot.c  Zhang Rui         2009-04-01  =
1392   * works for you, please contact linux-acpi(a)vger.kernel.org
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1393   */
6faadbbb7f9da70 arch/x86/kernel/acpi/boot.c  Christoph Hellwig 2017-09-14  =
1394  static const struct dmi_system_id acpi_dmi_table[] __initconst =3D {
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1395  	/*
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1396  	 * Boxes that need ACPI disabled
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1397  	 */
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1398  	{
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1399  	 .callback =3D dmi_disable_acpi,
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1400  	 .ident =3D "IBM Thinkpad",
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1401  	 .matches =3D {
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1402  		     DMI_MATCH(DMI_BOARD_VENDOR, "IBM"),
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1403  		     DMI_MATCH(DMI_BOARD_NAME, "2629H1G"),
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1404  		     },
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1405  	 },
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1406  =

aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1407  	/*
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1408  	 * Boxes that need ACPI PCI IRQ routing disabled
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1409  	 */
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1410  	{
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1411  	 .callback =3D disable_acpi_irq,
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1412  	 .ident =3D "ASUS A7V",
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1413  	 .matches =3D {
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1414  		     DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK Computer INC"),
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1415  		     DMI_MATCH(DMI_BOARD_NAME, "<A7V>"),
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1416  		     /* newer BIOS, Revision 1011, does work */
4be44fcd3bf648b arch/i386/kernel/acpi/boot.c Len Brown         2005-08-05  =
1417  		     DMI_MATCH(DMI_BIOS_VERSION,
4be44fcd3bf648b arch/i386/kernel/acpi/boot.c Len Brown         2005-08-05  =
1418  			       "ASUS A7V ACPI BIOS Revision 1007"),
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1419  		     },
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1420  	 },
74586fca38109d2 arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  =
1421  	{
74586fca38109d2 arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  =
1422  		/*
74586fca38109d2 arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  =
1423  		 * Latest BIOS for IBM 600E (1.16) has bad pcinum
74586fca38109d2 arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  =
1424  		 * for LPC bridge, which is needed for the PCI
74586fca38109d2 arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  =
1425  		 * interrupt links to work. DSDT fix is in bug 5966.
74586fca38109d2 arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  =
1426  		 * 2645, 2646 model numbers are shared with 600/600E/600X
74586fca38109d2 arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  =
1427  		 */
74586fca38109d2 arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  =
1428  	 .callback =3D disable_acpi_irq,
74586fca38109d2 arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  =
1429  	 .ident =3D "IBM Thinkpad 600 Series 2645",
74586fca38109d2 arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  =
1430  	 .matches =3D {
74586fca38109d2 arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  =
1431  		     DMI_MATCH(DMI_BOARD_VENDOR, "IBM"),
74586fca38109d2 arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  =
1432  		     DMI_MATCH(DMI_BOARD_NAME, "2645"),
74586fca38109d2 arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  =
1433  		     },
74586fca38109d2 arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  =
1434  	 },
74586fca38109d2 arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  =
1435  	{
74586fca38109d2 arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  =
1436  	 .callback =3D disable_acpi_irq,
74586fca38109d2 arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  =
1437  	 .ident =3D "IBM Thinkpad 600 Series 2646",
74586fca38109d2 arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  =
1438  	 .matches =3D {
74586fca38109d2 arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  =
1439  		     DMI_MATCH(DMI_BOARD_VENDOR, "IBM"),
74586fca38109d2 arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  =
1440  		     DMI_MATCH(DMI_BOARD_NAME, "2646"),
74586fca38109d2 arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  =
1441  		     },
74586fca38109d2 arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  =
1442  	 },
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1443  	/*
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1444  	 * Boxes that need ACPI PCI IRQ routing and PCI scan disabled
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1445  	 */
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1446  	{			/* _BBN 0 bug */
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1447  	 .callback =3D disable_acpi_pci,
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1448  	 .ident =3D "ASUS PR-DLS",
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1449  	 .matches =3D {
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1450  		     DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK Computer INC."),
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1451  		     DMI_MATCH(DMI_BOARD_NAME, "PR-DLS"),
4be44fcd3bf648b arch/i386/kernel/acpi/boot.c Len Brown         2005-08-05  =
1452  		     DMI_MATCH(DMI_BIOS_VERSION,
4be44fcd3bf648b arch/i386/kernel/acpi/boot.c Len Brown         2005-08-05  =
1453  			       "ASUS PR-DLS ACPI BIOS Revision 1010"),
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1454  		     DMI_MATCH(DMI_BIOS_DATE, "03/21/2003")
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1455  		     },
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1456  	 },
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1457  	{
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1458  	 .callback =3D disable_acpi_pci,
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1459  	 .ident =3D "Acer TravelMate 36x Laptop",
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1460  	 .matches =3D {
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1461  		     DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1462  		     DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate 360"),
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1463  		     },
aea00143a8db8c0 arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  =
1464  	 },
ed00b2b8d737f87 arch/x86/kernel/acpi/boot.c  Mark Cilissen     2022-02-23  =
1465  	/*
ed00b2b8d737f87 arch/x86/kernel/acpi/boot.c  Mark Cilissen     2022-02-23  =
1466  	 * Boxes that need ACPI XSDT use disabled due to corrupted tables
ed00b2b8d737f87 arch/x86/kernel/acpi/boot.c  Mark Cilissen     2022-02-23  =
1467  	 */
ed00b2b8d737f87 arch/x86/kernel/acpi/boot.c  Mark Cilissen     2022-02-23  =
1468  	{
ed00b2b8d737f87 arch/x86/kernel/acpi/boot.c  Mark Cilissen     2022-02-23  =
1469  	 .callback =3D disable_acpi_xsdt,
ed00b2b8d737f87 arch/x86/kernel/acpi/boot.c  Mark Cilissen     2022-02-23  =
1470  	 .ident =3D "SEGA AALE",
ed00b2b8d737f87 arch/x86/kernel/acpi/boot.c  Mark Cilissen     2022-02-23  =
1471  	 .matches =3D {
ed00b2b8d737f87 arch/x86/kernel/acpi/boot.c  Mark Cilissen     2022-02-23  =
1472  		     DMI_MATCH(DMI_SYS_VENDOR, "NEC"),
ed00b2b8d737f87 arch/x86/kernel/acpi/boot.c  Mark Cilissen     2022-02-23  =
1473  		     DMI_MATCH(DMI_PRODUCT_NAME, "Bearlake CRB Board"),
ed00b2b8d737f87 arch/x86/kernel/acpi/boot.c  Mark Cilissen     2022-02-23  =
1474  		     DMI_MATCH(DMI_BIOS_VENDOR, "Phoenix Technologies LTD"),
ed00b2b8d737f87 arch/x86/kernel/acpi/boot.c  Mark Cilissen     2022-02-23  =
1475  		     DMI_MATCH(DMI_BIOS_VERSION, "V1.12"),
ed00b2b8d737f87 arch/x86/kernel/acpi/boot.c  Mark Cilissen     2022-02-23 @=
1476  		     DMI_MATCH(DMI_BIOS_DATE, "02/01/2011"),
ed00b2b8d737f87 arch/x86/kernel/acpi/boot.c  Mark Cilissen     2022-02-23  =
1477  		     },
ed00b2b8d737f87 arch/x86/kernel/acpi/boot.c  Mark Cilissen     2022-02-23  =
1478  	},
35af28219e684a3 arch/x86/kernel/acpi/boot.c  Andreas Herrmann  2008-10-22  =
1479  	{}
35af28219e684a3 arch/x86/kernel/acpi/boot.c  Andreas Herrmann  2008-10-22  =
1480  };
35af28219e684a3 arch/x86/kernel/acpi/boot.c  Andreas Herrmann  2008-10-22  =
1481  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3307102975862920408==--

