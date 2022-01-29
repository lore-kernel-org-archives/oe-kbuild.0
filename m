Content-Type: multipart/mixed; boundary="===============3036919925501210950=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/md/dm-linear.c:169 linear_dax_pgoff() warn: should '*pgoff << (12 - 9)' be a 64 bit type?
Date: Sat, 29 Jan 2022 11:42:04 +0800
Message-ID: <202201291106.wIoU0BpN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3036919925501210950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Dan Williams <dan.j.williams@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   169387e2aa291a4e3cb856053730fe99d6cec06f
commit: f43e0065c264b2cb001952be17c9291c68d07182 dm-linear: add a linear_da=
x_pgoff helper
date:   8 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 weeks ago
config: nios2-randconfig-m031-20220129 (https://download.01.org/0day-ci/arc=
hive/20220129/202201291106.wIoU0BpN-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/md/dm-linear.c:169 linear_dax_pgoff() warn: should '*pgoff << (12 -=
 9)' be a 64 bit type?

vim +169 drivers/md/dm-linear.c

af4874e03ed82f Mike Snitzer      2009-06-22  164  =

5d2a228b9e1319 Christoph Hellwig 2021-11-29  165  #if IS_ENABLED(CONFIG_FS_=
DAX)
f43e0065c264b2 Christoph Hellwig 2021-11-29  166  static struct dax_device =
*linear_dax_pgoff(struct dm_target *ti, pgoff_t *pgoff)
f43e0065c264b2 Christoph Hellwig 2021-11-29  167  {
f43e0065c264b2 Christoph Hellwig 2021-11-29  168  	struct linear_c *lc =3D =
ti->private;
f43e0065c264b2 Christoph Hellwig 2021-11-29 @169  	sector_t sector =3D line=
ar_map_sector(ti, *pgoff << PAGE_SECTORS_SHIFT);
f43e0065c264b2 Christoph Hellwig 2021-11-29  170  =

f43e0065c264b2 Christoph Hellwig 2021-11-29  171  	*pgoff =3D (get_start_se=
ct(lc->dev->bdev) + sector) >> PAGE_SECTORS_SHIFT;
f43e0065c264b2 Christoph Hellwig 2021-11-29  172  	return lc->dev->dax_dev;
f43e0065c264b2 Christoph Hellwig 2021-11-29  173  }
f43e0065c264b2 Christoph Hellwig 2021-11-29  174  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3036919925501210950==--

