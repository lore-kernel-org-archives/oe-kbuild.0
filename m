Content-Type: multipart/mixed; boundary="===============4815830767094268365=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 1/5] fbdev: Put mmap for deferred I/O into drivers
Date: Thu, 28 Apr 2022 10:00:36 +0800
Message-ID: <202204280832.sGHcYdgQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4815830767094268365==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220426120359.17437-2-tzimmermann@suse.de>
References: <20220426120359.17437-2-tzimmermann@suse.de>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: javierm(a)redhat.com
TO: daniel(a)ffwll.ch
TO: deller(a)gmx.de
TO: airlied(a)linux.ie
TO: maarten.lankhorst(a)linux.intel.com
CC: linux-fbdev(a)vger.kernel.org
CC: Thomas Zimmermann <tzimmermann@suse.de>
CC: dri-devel(a)lists.freedesktop.org

Hi Thomas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 0e7deff6446a4ba2c75f499a0bfa80cd6a15c129]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/fb=
dev-Decouple-deferred-I-O-from-struct-page/20220426-200655
base:   0e7deff6446a4ba2c75f499a0bfa80cd6a15c129
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
428/202204280832.sGHcYdgQ-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/video/fbdev/core/fbmem.c:1389 fb_mmap() warn: inconsistent returns =
'&info->mm_lock'.

Old smatch warnings:
drivers/video/fbdev/core/fbmem.c:1660 do_register_framebuffer() error: buff=
er overflow 'registered_fb' 32 <=3D 32 (assuming for loop doesn't break)

vim +1389 drivers/video/fbdev/core/fbmem.c

^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-1=
6  1332  =

^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-1=
6  1333  static int
^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-1=
6  1334  fb_mmap(struct file *file, struct vm_area_struct * vma)
^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-1=
6  1335  {
c47747fde931c0 drivers/video/fbmem.c            Linus Torvalds    2011-05-1=
1  1336  	struct fb_info *info =3D file_fb_info(file);
fc9bbca8f650e5 drivers/video/fbmem.c            Linus Torvalds    2013-04-1=
9  1337  	unsigned long mmio_pgoff;
^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-1=
6  1338  	unsigned long start;
^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-1=
6  1339  	u32 len;
^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-1=
6  1340  =

c47747fde931c0 drivers/video/fbmem.c            Linus Torvalds    2011-05-1=
1  1341  	if (!info)
c47747fde931c0 drivers/video/fbmem.c            Linus Torvalds    2011-05-1=
1  1342  		return -ENODEV;
537a1bf059fa31 drivers/video/fbmem.c            Krzysztof Helt    2009-06-3=
0  1343  	mutex_lock(&info->mm_lock);
12281c8dda5a3b drivers/video/fbdev/core/fbmem.c Jani Nikula       2019-11-2=
9  1344  =

8a9ea404b61faa drivers/video/fbdev/core/fbmem.c Thomas Zimmermann 2022-04-2=
6  1345  	if (info->fbops->fb_mmap) {
^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-1=
6  1346  		int res;
95cf9264d5f36c drivers/video/fbdev/core/fbmem.c Tom Lendacky      2017-07-1=
7  1347  =

95cf9264d5f36c drivers/video/fbdev/core/fbmem.c Tom Lendacky      2017-07-1=
7  1348  		/*
95cf9264d5f36c drivers/video/fbdev/core/fbmem.c Tom Lendacky      2017-07-1=
7  1349  		 * The framebuffer needs to be accessed decrypted, be sure
95cf9264d5f36c drivers/video/fbdev/core/fbmem.c Tom Lendacky      2017-07-1=
7  1350  		 * SME protection is removed ahead of the call
95cf9264d5f36c drivers/video/fbdev/core/fbmem.c Tom Lendacky      2017-07-1=
7  1351  		 */
95cf9264d5f36c drivers/video/fbdev/core/fbmem.c Tom Lendacky      2017-07-1=
7  1352  		vma->vm_page_prot =3D pgprot_decrypted(vma->vm_page_prot);
8a9ea404b61faa drivers/video/fbdev/core/fbmem.c Thomas Zimmermann 2022-04-2=
6  1353  		res =3D info->fbops->fb_mmap(info, vma);
537a1bf059fa31 drivers/video/fbmem.c            Krzysztof Helt    2009-06-3=
0  1354  		mutex_unlock(&info->mm_lock);
^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-1=
6  1355  		return res;
8a9ea404b61faa drivers/video/fbdev/core/fbmem.c Thomas Zimmermann 2022-04-2=
6  1356  #if IS_ENABLED(CONFIG_FB_DEFERRED_IO)
8a9ea404b61faa drivers/video/fbdev/core/fbmem.c Thomas Zimmermann 2022-04-2=
6  1357  	} else if (info->fbdefio) {
8a9ea404b61faa drivers/video/fbdev/core/fbmem.c Thomas Zimmermann 2022-04-2=
6  1358  		/*
8a9ea404b61faa drivers/video/fbdev/core/fbmem.c Thomas Zimmermann 2022-04-2=
6  1359  		 * FB deferred I/O wants you to handle mmap in your drivers. At a
8a9ea404b61faa drivers/video/fbdev/core/fbmem.c Thomas Zimmermann 2022-04-2=
6  1360  		 * minimum, point struct fb_ops.fb_mmap to fb_deferred_io_mmap().
8a9ea404b61faa drivers/video/fbdev/core/fbmem.c Thomas Zimmermann 2022-04-2=
6  1361  		 */
8a9ea404b61faa drivers/video/fbdev/core/fbmem.c Thomas Zimmermann 2022-04-2=
6  1362  		dev_warn_once(info->dev, "fbdev mmap not set up for deferred I/O=
.\n");
8a9ea404b61faa drivers/video/fbdev/core/fbmem.c Thomas Zimmermann 2022-04-2=
6  1363  		return -ENODEV;
8a9ea404b61faa drivers/video/fbdev/core/fbmem.c Thomas Zimmermann 2022-04-2=
6  1364  #endif
^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-1=
6  1365  	}
^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-1=
6  1366  =

fc9bbca8f650e5 drivers/video/fbmem.c            Linus Torvalds    2013-04-1=
9  1367  	/*
fc9bbca8f650e5 drivers/video/fbmem.c            Linus Torvalds    2013-04-1=
9  1368  	 * Ugh. This can be either the frame buffer mapping, or
fc9bbca8f650e5 drivers/video/fbmem.c            Linus Torvalds    2013-04-1=
9  1369  	 * if pgoff points past it, the mmio mapping.
fc9bbca8f650e5 drivers/video/fbmem.c            Linus Torvalds    2013-04-1=
9  1370  	 */
^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-1=
6  1371  	start =3D info->fix.smem_start;
fc9bbca8f650e5 drivers/video/fbmem.c            Linus Torvalds    2013-04-1=
9  1372  	len =3D info->fix.smem_len;
fc9bbca8f650e5 drivers/video/fbmem.c            Linus Torvalds    2013-04-1=
9  1373  	mmio_pgoff =3D PAGE_ALIGN((start & ~PAGE_MASK) + len) >> PAGE_SHI=
FT;
fc9bbca8f650e5 drivers/video/fbmem.c            Linus Torvalds    2013-04-1=
9  1374  	if (vma->vm_pgoff >=3D mmio_pgoff) {
138f296e140f79 drivers/video/fbmem.c            Tomi Valkeinen    2013-04-2=
4  1375  		if (info->var.accel_flags) {
138f296e140f79 drivers/video/fbmem.c            Tomi Valkeinen    2013-04-2=
4  1376  			mutex_unlock(&info->mm_lock);
138f296e140f79 drivers/video/fbmem.c            Tomi Valkeinen    2013-04-2=
4  1377  			return -EINVAL;
138f296e140f79 drivers/video/fbmem.c            Tomi Valkeinen    2013-04-2=
4  1378  		}
138f296e140f79 drivers/video/fbmem.c            Tomi Valkeinen    2013-04-2=
4  1379  =

fc9bbca8f650e5 drivers/video/fbmem.c            Linus Torvalds    2013-04-1=
9  1380  		vma->vm_pgoff -=3D mmio_pgoff;
^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-1=
6  1381  		start =3D info->fix.mmio_start;
fc9bbca8f650e5 drivers/video/fbmem.c            Linus Torvalds    2013-04-1=
9  1382  		len =3D info->fix.mmio_len;
^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-1=
6  1383  	}
537a1bf059fa31 drivers/video/fbmem.c            Krzysztof Helt    2009-06-3=
0  1384  	mutex_unlock(&info->mm_lock);
fc9bbca8f650e5 drivers/video/fbmem.c            Linus Torvalds    2013-04-1=
9  1385  =

c07fbfd17e614a drivers/video/fbmem.c            Daniel De Graaf   2010-08-1=
0  1386  	vma->vm_page_prot =3D vm_get_page_prot(vma->vm_flags);
fc9bbca8f650e5 drivers/video/fbmem.c            Linus Torvalds    2013-04-1=
9  1387  	fb_pgprotect(file, vma, start);
fc9bbca8f650e5 drivers/video/fbmem.c            Linus Torvalds    2013-04-1=
9  1388  =

fc9bbca8f650e5 drivers/video/fbmem.c            Linus Torvalds    2013-04-1=
9 @1389  	return vm_iomap_memory(vma, start, len);
^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-1=
6  1390  }
^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-1=
6  1391  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4815830767094268365==--

