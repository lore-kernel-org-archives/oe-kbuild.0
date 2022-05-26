Content-Type: multipart/mixed; boundary="===============4597636645592489373=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [arnd-playground:virt-to-bus 2/6] drivers/staging/vme_user/vme_tsi148.c:755 tsi148_alloc_resource() warn: passing freed memory 'image->bus_resource.name'
Date: Thu, 26 May 2022 12:07:20 +0800
Message-ID: <202205261146.2ZqjnmD0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4597636645592489373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git=
 virt-to-bus
head:   cadaf81a0bbef045c78f7c2be40af351f40195f7
commit: eb74c6738d1dc0332381f53c562ba051c580a32d [2/6] vme: move back to st=
aging
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
526/202205261146.2ZqjnmD0-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/staging/vme_user/vme_tsi148.c:755 tsi148_alloc_resource() warn: pas=
sing freed memory 'image->bus_resource.name'
drivers/staging/vme_user/vme_tsi148.c:1771 tsi148_dma_list_add() warn: '&en=
try->list' not removed from list

vim +755 drivers/staging/vme_user/vme_tsi148.c

d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  711  =

d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  712  /*
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  713   * Allocate and map PCI Resource
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  714   */
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  715  static int tsi148_alloc_resource(struct vme_master_resourc=
e *image,
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  716  	unsigned long long size)
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  717  {
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  718  	unsigned long long existing_size;
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  719  	int retval =3D 0;
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  720  	struct pci_dev *pdev;
29848ac9f3b33bf drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2010-02-18  721  	struct vme_bridge *tsi148_bridge;
29848ac9f3b33bf drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2010-02-18  722  =

29848ac9f3b33bf drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2010-02-18  723  	tsi148_bridge =3D image->parent;
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  724  =

177581faf2a5aa7 drivers/vme/bridges/vme_tsi148.c         Aaron Sierra      =
2014-04-03  725  	pdev =3D to_pci_dev(tsi148_bridge->parent);
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  726  =

8fafb47638012d9 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2010-02-18  727  	existing_size =3D (unsigned long long)(image->bus_resourc=
e.end -
8fafb47638012d9 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2010-02-18  728  		image->bus_resource.start);
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  729  =

d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  730  	/* If the existing size is OK, return */
59c2290428dd93a drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-10-29  731  	if ((size !=3D 0) && (existing_size =3D=3D (size - 1)))
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  732  		return 0;
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  733  =

d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  734  	if (existing_size !=3D 0) {
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  735  		iounmap(image->kern_base);
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  736  		image->kern_base =3D NULL;
8fafb47638012d9 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2010-02-18  737  		kfree(image->bus_resource.name);
886953e9b70bcb6 drivers/staging/vme/bridges/vme_tsi148.c Emilio G. Cota    =
2010-11-12  738  		release_resource(&image->bus_resource);
6d011dd876cb825 drivers/vme/bridges/vme_tsi148.c         Markus Elfring    =
2017-08-25  739  		memset(&image->bus_resource, 0, sizeof(image->bus_resour=
ce));
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  740  	}
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  741  =

59c2290428dd93a drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-10-29  742  	/* Exit here if size is zero */
7946328faf1dca9 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2010-03-22  743  	if (size =3D=3D 0)
59c2290428dd93a drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-10-29  744  		return 0;
59c2290428dd93a drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-10-29  745  =

a75dc630086a6b8 drivers/vme/bridges/vme_tsi148.c         Markus Elfring    =
2017-08-25  746  	if (!image->bus_resource.name) {
0aa3f139cd5123f drivers/staging/vme/bridges/vme_tsi148.c Julia Lawall      =
2010-05-30  747  		image->bus_resource.name =3D kmalloc(VMENAMSIZ+3, GFP_AT=
OMIC);
a75dc630086a6b8 drivers/vme/bridges/vme_tsi148.c         Markus Elfring    =
2017-08-25  748  		if (!image->bus_resource.name) {
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  749  			retval =3D -ENOMEM;
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  750  			goto err_name;
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  751  		}
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  752  	}
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  753  =

8fafb47638012d9 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2010-02-18  754  	sprintf((char *)image->bus_resource.name, "%s.%d", tsi148=
_bridge->name,
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31 @755  		image->number);
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  756  =

8fafb47638012d9 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2010-02-18  757  	image->bus_resource.start =3D 0;
8fafb47638012d9 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2010-02-18  758  	image->bus_resource.end =3D (unsigned long)size;
8fafb47638012d9 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2010-02-18  759  	image->bus_resource.flags =3D IORESOURCE_MEM;
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  760  =

d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  761  	retval =3D pci_bus_alloc_resource(pdev->bus,
da5ae8a991d35d7 drivers/vme/bridges/vme_tsi148.c         Dmitry Kalinkin   =
2015-07-08  762  		&image->bus_resource, size, 0x10000, PCIBIOS_MIN_MEM,
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  763  		0, NULL, NULL);
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  764  	if (retval) {
48d9356e7750d3e drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2010-03-22  765  		dev_err(tsi148_bridge->parent, "Failed to allocate mem "
48d9356e7750d3e drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2010-03-22  766  			"resource for window %d size 0x%lx start 0x%lx\n",
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  767  			image->number, (unsigned long)size,
8fafb47638012d9 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2010-02-18  768  			(unsigned long)image->bus_resource.start);
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  769  		goto err_resource;
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  770  	}
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  771  =

4bdc0d676a64314 drivers/vme/bridges/vme_tsi148.c         Christoph Hellwig =
2020-01-06  772  	image->kern_base =3D ioremap(
8fafb47638012d9 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2010-02-18  773  		image->bus_resource.start, size);
a75dc630086a6b8 drivers/vme/bridges/vme_tsi148.c         Markus Elfring    =
2017-08-25  774  	if (!image->kern_base) {
48d9356e7750d3e drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2010-03-22  775  		dev_err(tsi148_bridge->parent, "Failed to remap resource=
\n");
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  776  		retval =3D -ENOMEM;
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  777  		goto err_remap;
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  778  	}
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  779  =

d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  780  	return 0;
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  781  =

d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  782  err_remap:
886953e9b70bcb6 drivers/staging/vme/bridges/vme_tsi148.c Emilio G. Cota    =
2010-11-12  783  	release_resource(&image->bus_resource);
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  784  err_resource:
8fafb47638012d9 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2010-02-18  785  	kfree(image->bus_resource.name);
6d011dd876cb825 drivers/vme/bridges/vme_tsi148.c         Markus Elfring    =
2017-08-25  786  	memset(&image->bus_resource, 0, sizeof(image->bus_resourc=
e));
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  787  err_name:
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  788  	return retval;
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  789  }
d22b8ed9a3b0a15 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      =
2009-07-31  790  =


:::::: The code at line 755 was first introduced by commit
:::::: d22b8ed9a3b0a157b732580258ec16b729265953 Staging: vme: add Tundra TS=
I148 VME-PCI Bridge driver

:::::: TO: Martyn Welch <martyn.welch@gefanuc.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4597636645592489373==--

