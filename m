Content-Type: multipart/mixed; boundary="===============2634696326109728533=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rafael-pm:bleeding-edge 113/118] arch/x86/kernel/acpi/boot.c:1394 (null)() error: buffer overflow '(acpi_dmi_table[6])->matches' 4 <= 4
Date: Wed, 02 Mar 2022 10:52:18 +0800
Message-ID: <202203021037.WWnG44C5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2634696326109728533==
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
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20302/202203021037.WWnG44C5-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/x86/kernel/acpi/boot.c:1394 (null)() error: buffer overflow '(acpi_dmi=
_table[6])->matches' 4 <=3D 4
arch/x86/kernel/acpi/boot.c:1394 (null)() error: buffer overflow '(acpi_dmi=
_table[6])->matches' 4 <=3D 4

vim +1394 arch/x86/kernel/acpi/boot.c

7486341a98f268 arch/x86/kernel/acpi/boot.c  Li, Aubrey        2015-03-11  1=
389  =

aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
390  /*
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
391   * If your system is blacklisted here, but you find that acpi=3Dforce
5b4c0b6fffb91b arch/x86/kernel/acpi/boot.c  Zhang Rui         2009-04-01  1=
392   * works for you, please contact linux-acpi@vger.kernel.org
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
393   */
6faadbbb7f9da7 arch/x86/kernel/acpi/boot.c  Christoph Hellwig 2017-09-14 @1=
394  static const struct dmi_system_id acpi_dmi_table[] __initconst =3D {
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
395  	/*
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
396  	 * Boxes that need ACPI disabled
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
397  	 */
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
398  	{
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
399  	 .callback =3D dmi_disable_acpi,
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
400  	 .ident =3D "IBM Thinkpad",
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
401  	 .matches =3D {
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
402  		     DMI_MATCH(DMI_BOARD_VENDOR, "IBM"),
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
403  		     DMI_MATCH(DMI_BOARD_NAME, "2629H1G"),
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
404  		     },
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
405  	 },
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
406  =

aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
407  	/*
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
408  	 * Boxes that need ACPI PCI IRQ routing disabled
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
409  	 */
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
410  	{
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
411  	 .callback =3D disable_acpi_irq,
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
412  	 .ident =3D "ASUS A7V",
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
413  	 .matches =3D {
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
414  		     DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK Computer INC"),
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
415  		     DMI_MATCH(DMI_BOARD_NAME, "<A7V>"),
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
416  		     /* newer BIOS, Revision 1011, does work */
4be44fcd3bf648 arch/i386/kernel/acpi/boot.c Len Brown         2005-08-05  1=
417  		     DMI_MATCH(DMI_BIOS_VERSION,
4be44fcd3bf648 arch/i386/kernel/acpi/boot.c Len Brown         2005-08-05  1=
418  			       "ASUS A7V ACPI BIOS Revision 1007"),
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
419  		     },
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
420  	 },
74586fca38109d arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  1=
421  	{
74586fca38109d arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  1=
422  		/*
74586fca38109d arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  1=
423  		 * Latest BIOS for IBM 600E (1.16) has bad pcinum
74586fca38109d arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  1=
424  		 * for LPC bridge, which is needed for the PCI
74586fca38109d arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  1=
425  		 * interrupt links to work. DSDT fix is in bug 5966.
74586fca38109d arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  1=
426  		 * 2645, 2646 model numbers are shared with 600/600E/600X
74586fca38109d arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  1=
427  		 */
74586fca38109d arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  1=
428  	 .callback =3D disable_acpi_irq,
74586fca38109d arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  1=
429  	 .ident =3D "IBM Thinkpad 600 Series 2645",
74586fca38109d arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  1=
430  	 .matches =3D {
74586fca38109d arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  1=
431  		     DMI_MATCH(DMI_BOARD_VENDOR, "IBM"),
74586fca38109d arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  1=
432  		     DMI_MATCH(DMI_BOARD_NAME, "2645"),
74586fca38109d arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  1=
433  		     },
74586fca38109d arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  1=
434  	 },
74586fca38109d arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  1=
435  	{
74586fca38109d arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  1=
436  	 .callback =3D disable_acpi_irq,
74586fca38109d arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  1=
437  	 .ident =3D "IBM Thinkpad 600 Series 2646",
74586fca38109d arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  1=
438  	 .matches =3D {
74586fca38109d arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  1=
439  		     DMI_MATCH(DMI_BOARD_VENDOR, "IBM"),
74586fca38109d arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  1=
440  		     DMI_MATCH(DMI_BOARD_NAME, "2646"),
74586fca38109d arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  1=
441  		     },
74586fca38109d arch/i386/kernel/acpi/boot.c Len Brown         2007-03-08  1=
442  	 },
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
443  	/*
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
444  	 * Boxes that need ACPI PCI IRQ routing and PCI scan disabled
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
445  	 */
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
446  	{			/* _BBN 0 bug */
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
447  	 .callback =3D disable_acpi_pci,
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
448  	 .ident =3D "ASUS PR-DLS",
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
449  	 .matches =3D {
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
450  		     DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK Computer INC."),
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
451  		     DMI_MATCH(DMI_BOARD_NAME, "PR-DLS"),
4be44fcd3bf648 arch/i386/kernel/acpi/boot.c Len Brown         2005-08-05  1=
452  		     DMI_MATCH(DMI_BIOS_VERSION,
4be44fcd3bf648 arch/i386/kernel/acpi/boot.c Len Brown         2005-08-05  1=
453  			       "ASUS PR-DLS ACPI BIOS Revision 1010"),
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
454  		     DMI_MATCH(DMI_BIOS_DATE, "03/21/2003")
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
455  		     },
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
456  	 },
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
457  	{
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
458  	 .callback =3D disable_acpi_pci,
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
459  	 .ident =3D "Acer TravelMate 36x Laptop",
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
460  	 .matches =3D {
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
461  		     DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
462  		     DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate 360"),
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
463  		     },
aea00143a8db8c arch/i386/kernel/acpi/boot.c Andrey Panin      2005-06-25  1=
464  	 },
ed00b2b8d737f8 arch/x86/kernel/acpi/boot.c  Mark Cilissen     2022-02-23  1=
465  	/*
ed00b2b8d737f8 arch/x86/kernel/acpi/boot.c  Mark Cilissen     2022-02-23  1=
466  	 * Boxes that need ACPI XSDT use disabled due to corrupted tables
ed00b2b8d737f8 arch/x86/kernel/acpi/boot.c  Mark Cilissen     2022-02-23  1=
467  	 */
ed00b2b8d737f8 arch/x86/kernel/acpi/boot.c  Mark Cilissen     2022-02-23  1=
468  	{
ed00b2b8d737f8 arch/x86/kernel/acpi/boot.c  Mark Cilissen     2022-02-23  1=
469  	 .callback =3D disable_acpi_xsdt,
ed00b2b8d737f8 arch/x86/kernel/acpi/boot.c  Mark Cilissen     2022-02-23  1=
470  	 .ident =3D "SEGA AALE",
ed00b2b8d737f8 arch/x86/kernel/acpi/boot.c  Mark Cilissen     2022-02-23  1=
471  	 .matches =3D {
ed00b2b8d737f8 arch/x86/kernel/acpi/boot.c  Mark Cilissen     2022-02-23  1=
472  		     DMI_MATCH(DMI_SYS_VENDOR, "NEC"),
ed00b2b8d737f8 arch/x86/kernel/acpi/boot.c  Mark Cilissen     2022-02-23  1=
473  		     DMI_MATCH(DMI_PRODUCT_NAME, "Bearlake CRB Board"),
ed00b2b8d737f8 arch/x86/kernel/acpi/boot.c  Mark Cilissen     2022-02-23  1=
474  		     DMI_MATCH(DMI_BIOS_VENDOR, "Phoenix Technologies LTD"),
ed00b2b8d737f8 arch/x86/kernel/acpi/boot.c  Mark Cilissen     2022-02-23  1=
475  		     DMI_MATCH(DMI_BIOS_VERSION, "V1.12"),
ed00b2b8d737f8 arch/x86/kernel/acpi/boot.c  Mark Cilissen     2022-02-23  1=
476  		     DMI_MATCH(DMI_BIOS_DATE, "02/01/2011"),
ed00b2b8d737f8 arch/x86/kernel/acpi/boot.c  Mark Cilissen     2022-02-23  1=
477  		     },
ed00b2b8d737f8 arch/x86/kernel/acpi/boot.c  Mark Cilissen     2022-02-23  1=
478  	},
35af28219e684a arch/x86/kernel/acpi/boot.c  Andreas Herrmann  2008-10-22  1=
479  	{}
35af28219e684a arch/x86/kernel/acpi/boot.c  Andreas Herrmann  2008-10-22  1=
480  };
35af28219e684a arch/x86/kernel/acpi/boot.c  Andreas Herrmann  2008-10-22  1=
481  =


:::::: The code at line 1394 was first introduced by commit
:::::: 6faadbbb7f9da70ce484f98f72223c20125a1009 dmi: Mark all struct dmi_sy=
stem_id instances const

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jean Delvare <jdelvare@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2634696326109728533==--

