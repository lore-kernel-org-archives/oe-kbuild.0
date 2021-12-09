Content-Type: multipart/mixed; boundary="===============0093654682090806816=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hch-misc:dax-block-cleanup 9/29] drivers/md/dm-linear.c:169 linear_dax_pgoff() warn: should '*pgoff << (12 - 9)' be a 64 bit type?
Date: Thu, 09 Dec 2021 16:44:27 +0800
Message-ID: <202112091633.TxoLnbAZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0093654682090806816==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git dax-block-cleanup
head:   85eeeba6accd7ba7457ab6c8905863a74458f063
commit: 565c95d7dd9faeed27050aa6bf4fd0d406016431 [9/29] dm-linear: add a li=
near_dax_pgoff helper
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: nios2-randconfig-m031-20211202 (https://download.01.org/0day-ci/arc=
hive/20211209/202112091633.TxoLnbAZ-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/md/dm-linear.c:169 linear_dax_pgoff() warn: should '*pgoff << (12 -=
 9)' be a 64 bit type?

vim +169 drivers/md/dm-linear.c

af4874e03ed82f Mike Snitzer      2009-06-22  164  =

3d1cf7b80bd13c Christoph Hellwig 2021-10-15  165  #if IS_ENABLED(CONFIG_FS_=
DAX)
565c95d7dd9fae Christoph Hellwig 2021-10-15  166  static struct dax_device =
*linear_dax_pgoff(struct dm_target *ti, pgoff_t *pgoff)
565c95d7dd9fae Christoph Hellwig 2021-10-15  167  {
565c95d7dd9fae Christoph Hellwig 2021-10-15  168  	struct linear_c *lc =3D =
ti->private;
565c95d7dd9fae Christoph Hellwig 2021-10-15 @169  	sector_t sector =3D line=
ar_map_sector(ti, *pgoff << PAGE_SECTORS_SHIFT);
565c95d7dd9fae Christoph Hellwig 2021-10-15  170  =

565c95d7dd9fae Christoph Hellwig 2021-10-15  171  	*pgoff =3D (get_start_se=
ct(lc->dev->bdev) + sector) >> PAGE_SECTORS_SHIFT;
565c95d7dd9fae Christoph Hellwig 2021-10-15  172  	return lc->dev->dax_dev;
565c95d7dd9fae Christoph Hellwig 2021-10-15  173  }
565c95d7dd9fae Christoph Hellwig 2021-10-15  174  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0093654682090806816==--

