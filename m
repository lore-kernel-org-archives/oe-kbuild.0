Content-Type: multipart/mixed; boundary="===============1946031169682283389=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4222/11475] drivers/md/dm-linear.c:169 linear_dax_pgoff() warn: should '*pgoff << (13 - 9)' be a 64 bit type?
Date: Sun, 09 Jan 2022 11:07:37 +0800
Message-ID: <202201091150.7rV7C2sT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1946031169682283389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Christoph Hellwig <hch@lst.de>
CC: Dan Williams <dan.j.williams@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   b8170452cd5121b11a5726e3ea8dbdfc2d74e771
commit: f43e0065c264b2cb001952be17c9291c68d07182 [4222/11475] dm-linear: ad=
d a linear_dax_pgoff helper
:::::: branch date: 35 hours ago
:::::: commit date: 5 weeks ago
config: openrisc-randconfig-m031-20220107 (https://download.01.org/0day-ci/=
archive/20220109/202201091150.7rV7C2sT-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/md/dm-linear.c:169 linear_dax_pgoff() warn: should '*pgoff << (13 -=
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
--===============1946031169682283389==--

