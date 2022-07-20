Content-Type: multipart/mixed; boundary="===============7407824740074869339=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kraxel:drm-misc-next 4/11] drivers/video/aperture.c:343 aperture_remove_conflicting_pci_devices() error: uninitialized symbol 'ret'.
Date: Wed, 20 Jul 2022 15:57:06 +0800
Message-ID: <202207201557.ojvC9qin-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7407824740074869339==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: Javier Martinez Canillas <javierm@redhat.com>

tree:   git://git.kraxel.org/linux drm-misc-next
head:   15fced5b051e6e22c228a521a5894b12c2ba0892
commit: 9d69ef1838150c7d87afc1a87aa658c637217585 [4/11] fbdev/core: Remove =
remove_conflicting_pci_framebuffers()
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: i386-randconfig-m021-20220718 (https://download.01.org/0day-ci/arch=
ive/20220720/202207201557.ojvC9qin-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/video/aperture.c:343 aperture_remove_conflicting_pci_devices() erro=
r: uninitialized symbol 'ret'.

vim +/ret +343 drivers/video/aperture.c

7283f862bd991c8 Thomas Zimmermann 2022-06-22  331  =

7283f862bd991c8 Thomas Zimmermann 2022-06-22  332  	for (bar =3D 0; bar < P=
CI_STD_NUM_BARS; ++bar) {
7283f862bd991c8 Thomas Zimmermann 2022-06-22  333  		if (!(pci_resource_fla=
gs(pdev, bar) & IORESOURCE_MEM))
7283f862bd991c8 Thomas Zimmermann 2022-06-22  334  			continue;
9d69ef1838150c7 Thomas Zimmermann 2022-07-18  335  =

7283f862bd991c8 Thomas Zimmermann 2022-06-22  336  		base =3D pci_resource_=
start(pdev, bar);
7283f862bd991c8 Thomas Zimmermann 2022-06-22  337  		size =3D pci_resource_=
len(pdev, bar);
9d69ef1838150c7 Thomas Zimmermann 2022-07-18  338  		ret =3D aperture_remov=
e_conflicting_devices(base, size, primary, name);
9d69ef1838150c7 Thomas Zimmermann 2022-07-18  339  		if (ret)
9d69ef1838150c7 Thomas Zimmermann 2022-07-18  340  			break;
7283f862bd991c8 Thomas Zimmermann 2022-06-22  341  	}
7283f862bd991c8 Thomas Zimmermann 2022-06-22  342  =

9d69ef1838150c7 Thomas Zimmermann 2022-07-18 @343  	if (ret)
9d69ef1838150c7 Thomas Zimmermann 2022-07-18  344  		return ret;
9d69ef1838150c7 Thomas Zimmermann 2022-07-18  345  =

9d69ef1838150c7 Thomas Zimmermann 2022-07-18  346  	/*
9d69ef1838150c7 Thomas Zimmermann 2022-07-18  347  	 * WARNING: Apparently =
we must kick fbdev drivers before vgacon,
9d69ef1838150c7 Thomas Zimmermann 2022-07-18  348  	 * otherwise the vga fb=
dev driver falls over.
9d69ef1838150c7 Thomas Zimmermann 2022-07-18  349  	 */
9d69ef1838150c7 Thomas Zimmermann 2022-07-18  350  	ret =3D vga_remove_vgac=
on(pdev);
9d69ef1838150c7 Thomas Zimmermann 2022-07-18  351  	if (ret)
9d69ef1838150c7 Thomas Zimmermann 2022-07-18  352  		return ret;
9d69ef1838150c7 Thomas Zimmermann 2022-07-18  353  =

7283f862bd991c8 Thomas Zimmermann 2022-06-22  354  	return 0;
7283f862bd991c8 Thomas Zimmermann 2022-06-22  355  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7407824740074869339==--

