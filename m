Content-Type: multipart/mixed; boundary="===============3936172606640657192=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kees:memcpy/step2/next-20211206 18/19] drivers/vme/bridges/vme_ca91cx42.c:540 ca91cx42_alloc_resource() warn: passing freed memory 'image->bus_resource.name'
Date: Fri, 10 Dec 2021 11:34:44 +0800
Message-ID: <202112101100.RP5cQp9A-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3936172606640657192==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git memc=
py/step2/next-20211206
head:   082faead4a3c2e5d9f541f97d8d4d5fa0f88dce0
commit: 2fc46de99fed3430ed2f29f9912c896b62905bd7 [18/19] fortify: Detect st=
ruct member overflows in memset() at compile-time
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-m021-20211209 (https://download.01.org/0day-ci/arch=
ive/20211210/202112101100.RP5cQp9A-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/vme/bridges/vme_ca91cx42.c:540 ca91cx42_alloc_resource() warn: pass=
ing freed memory 'image->bus_resource.name'

vim +540 drivers/vme/bridges/vme_ca91cx42.c

60479690af6d559 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-07-31  495  =

3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  496  /*
3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  497   * Allocate and map PCI Resource
3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  498   */
3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  499  static int ca91cx42_alloc_resource(struct vme_master_res=
ource *image,
3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  500  	unsigned long long size)
60479690af6d559 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-07-31  501  {
3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  502  	unsigned long long existing_size;
3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  503  	int retval =3D 0;
3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  504  	struct pci_dev *pdev;
29848ac9f3b33bf drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2010-02-18  505  	struct vme_bridge *ca91cx42_bridge;
29848ac9f3b33bf drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2010-02-18  506  =

29848ac9f3b33bf drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2010-02-18  507  	ca91cx42_bridge =3D image->parent;
60479690af6d559 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-07-31  508  =

3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  509  	/* Find pci_dev container of dev */
8d97931740cff8f drivers/vme/bridges/vme_ca91cx42.c         Markus Elfring  =
  2017-08-25  510  	if (!ca91cx42_bridge->parent) {
48d9356e7750d3e drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2010-03-22  511  		dev_err(ca91cx42_bridge->parent, "Dev entry NULL\n");
3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  512  		return -EINVAL;
60479690af6d559 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-07-31  513  	}
445f82492f2256b drivers/vme/bridges/vme_ca91cx42.c         Geliang Tang    =
  2015-12-27  514  	pdev =3D to_pci_dev(ca91cx42_bridge->parent);
60479690af6d559 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-07-31  515  =

8fafb47638012d9 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2010-02-18  516  	existing_size =3D (unsigned long long)(image->bus_resou=
rce.end -
8fafb47638012d9 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2010-02-18  517  		image->bus_resource.start);
3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  518  =

3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  519  	/* If the existing size is OK, return */
3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  520  	if (existing_size =3D=3D (size - 1))
3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  521  		return 0;
3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  522  =

3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  523  	if (existing_size !=3D 0) {
3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  524  		iounmap(image->kern_base);
3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  525  		image->kern_base =3D NULL;
8fafb47638012d9 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2010-02-18  526  		kfree(image->bus_resource.name);
886953e9b70bcb6 drivers/staging/vme/bridges/vme_ca91cx42.c Emilio G. Cota  =
  2010-11-12  527  		release_resource(&image->bus_resource);
3d9b1e53343651e drivers/vme/bridges/vme_ca91cx42.c         Markus Elfring  =
  2017-08-25  528  		memset(&image->bus_resource, 0, sizeof(image->bus_reso=
urce));
60479690af6d559 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-07-31  529  	}
60479690af6d559 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-07-31  530  =

8d97931740cff8f drivers/vme/bridges/vme_ca91cx42.c         Markus Elfring  =
  2017-08-25  531  	if (!image->bus_resource.name) {
0aa3f139cd5123f drivers/staging/vme/bridges/vme_ca91cx42.c Julia Lawall    =
  2010-05-30  532  		image->bus_resource.name =3D kmalloc(VMENAMSIZ+3, GFP_=
ATOMIC);
8d97931740cff8f drivers/vme/bridges/vme_ca91cx42.c         Markus Elfring  =
  2017-08-25  533  		if (!image->bus_resource.name) {
3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  534  			retval =3D -ENOMEM;
3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  535  			goto err_name;
60479690af6d559 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-07-31  536  		}
60479690af6d559 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-07-31  537  	}
60479690af6d559 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-07-31  538  =

8fafb47638012d9 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2010-02-18  539  	sprintf((char *)image->bus_resource.name, "%s.%d",
3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27 @540  		ca91cx42_bridge->name, image->number);
60479690af6d559 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-07-31  541  =

8fafb47638012d9 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2010-02-18  542  	image->bus_resource.start =3D 0;
8fafb47638012d9 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2010-02-18  543  	image->bus_resource.end =3D (unsigned long)size;
8fafb47638012d9 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2010-02-18  544  	image->bus_resource.flags =3D IORESOURCE_MEM;
60479690af6d559 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-07-31  545  =

3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  546  	retval =3D pci_bus_alloc_resource(pdev->bus,
da5ae8a991d35d7 drivers/vme/bridges/vme_ca91cx42.c         Dmitry Kalinkin =
  2015-07-08  547  		&image->bus_resource, size, 0x10000, PCIBIOS_MIN_MEM,
3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  548  		0, NULL, NULL);
3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  549  	if (retval) {
48d9356e7750d3e drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2010-03-22  550  		dev_err(ca91cx42_bridge->parent, "Failed to allocate m=
em "
48d9356e7750d3e drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2010-03-22  551  			"resource for window %d size 0x%lx start 0x%lx\n",
3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  552  			image->number, (unsigned long)size,
8fafb47638012d9 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2010-02-18  553  			(unsigned long)image->bus_resource.start);
3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  554  		goto err_resource;
60479690af6d559 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-07-31  555  	}
60479690af6d559 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-07-31  556  =

4bdc0d676a64314 drivers/vme/bridges/vme_ca91cx42.c         Christoph Hellwi=
g 2020-01-06  557  	image->kern_base =3D ioremap(
8fafb47638012d9 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2010-02-18  558  		image->bus_resource.start, size);
8d97931740cff8f drivers/vme/bridges/vme_ca91cx42.c         Markus Elfring  =
  2017-08-25  559  	if (!image->kern_base) {
48d9356e7750d3e drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2010-03-22  560  		dev_err(ca91cx42_bridge->parent, "Failed to remap reso=
urce\n");
3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  561  		retval =3D -ENOMEM;
3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  562  		goto err_remap;
60479690af6d559 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-07-31  563  	}
60479690af6d559 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-07-31  564  =

3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  565  	return 0;
60479690af6d559 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-07-31  566  =

3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  567  err_remap:
886953e9b70bcb6 drivers/staging/vme/bridges/vme_ca91cx42.c Emilio G. Cota  =
  2010-11-12  568  	release_resource(&image->bus_resource);
3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  569  err_resource:
8fafb47638012d9 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2010-02-18  570  	kfree(image->bus_resource.name);
3d9b1e53343651e drivers/vme/bridges/vme_ca91cx42.c         Markus Elfring  =
  2017-08-25  571  	memset(&image->bus_resource, 0, sizeof(image->bus_resou=
rce));
3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  572  err_name:
3d0f8bc7517718a drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-08-27  573  	return retval;
60479690af6d559 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-07-31  574  }
60479690af6d559 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch    =
  2009-07-31  575  =


:::::: The code at line 540 was first introduced by commit
:::::: 3d0f8bc7517718a4846de6f538ad67a4f7f83239 Staging: vme: Update suppor=
t for the Universe II VME driver

:::::: TO: Martyn Welch <martyn.welch@gefanuc.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3936172606640657192==--

