Content-Type: multipart/mixed; boundary="===============8837439718151317035=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mtd: rawnand: protect access to rawnand devices while in suspend
Date: Wed, 22 Dec 2021 21:41:15 +0800
Message-ID: <202112222131.nXJNAKHW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8837439718151317035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211220130015.3630975-1-sean@geanix.com>
References: <20211220130015.3630975-1-sean@geanix.com>
TO: Sean Nyekjaer <sean@geanix.com>
TO: Miquel Raynal <miquel.raynal@bootlin.com>
TO: Richard Weinberger <richard@nod.at>
TO: Vignesh Raghavendra <vigneshr@ti.com>
TO: Boris Brezillon <bbrezillon@kernel.org>
CC: Sean Nyekjaer <sean@geanix.com>
CC: linux-mtd(a)lists.infradead.org
CC: linux-kernel(a)vger.kernel.org

Hi Sean,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on mtd/nand/next]
[also build test WARNING on linux/master linus/master v5.16-rc6 next-202112=
21]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sean-Nyekjaer/mtd-rawnand-=
protect-access-to-rawnand-devices-while-in-suspend/20211220-210300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/=
next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-m001-20211222 (https://download.01.org/0day-ci/ar=
chive/20211222/202112222131.nXJNAKHW-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/mtd/nand/raw/nand_base.c:4437 nand_write_oob() error: uninitialized=
 symbol 'ret'.

Old smatch warnings:
drivers/mtd/nand/raw/nand_base.c:894 nand_setup_interface() warn: missing e=
rror code 'ret'
drivers/mtd/nand/raw/nand_base.c:963 nand_choose_best_sdr_timings() error: =
uninitialized symbol 'ret'.
drivers/mtd/nand/raw/nand_base.c:1014 nand_choose_best_nvddr_timings() erro=
r: uninitialized symbol 'ret'.

vim +/ret +4437 drivers/mtd/nand/raw/nand_base.c

2af7c653993199 drivers/mtd/nand/nand_base.c     Simon Kagstrom  2009-10-05 =
 4403  =

8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29 =
 4404  /**
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29 =
 4405   * nand_write_oob - [MTD Interface] NAND write data and/or out-of-ba=
nd
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29 =
 4406   * @mtd: MTD device structure
844d3b427ef1a4 drivers/mtd/nand/nand_base.c     Randy Dunlap    2006-06-28 =
 4407   * @to: offset to write to
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29 =
 4408   * @ops: oob operation description structure
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29 =
 4409   */
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29 =
 4410  static int nand_write_oob(struct mtd_info *mtd, loff_t to,
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29 =
 4411  			  struct mtd_oob_ops *ops)
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29 =
 4412  {
0813621ba898aa drivers/mtd/nand/raw/nand_base.c Boris Brezillon 2018-11-11 =
 4413  	struct nand_chip *chip =3D mtd_to_nand(mtd);
80107e764846a6 drivers/mtd/nand/raw/nand_base.c Colin Ian King  2019-07-31 =
 4414  	int ret;
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29 =
 4415  =

8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29 =
 4416  	ops->retlen =3D 0;
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29 =
 4417  =

4820bae9bf9bca drivers/mtd/nand/raw/nand_base.c Sean Nyekjaer   2021-12-20 =
 4418  	nand_get_device(chip);
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29 =
 4419  =

8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29 =
 4420  	switch (ops->mode) {
0612b9ddc2eeda drivers/mtd/nand/nand_base.c     Brian Norris    2011-08-30 =
 4421  	case MTD_OPS_PLACE_OOB:
0612b9ddc2eeda drivers/mtd/nand/nand_base.c     Brian Norris    2011-08-30 =
 4422  	case MTD_OPS_AUTO_OOB:
0612b9ddc2eeda drivers/mtd/nand/nand_base.c     Brian Norris    2011-08-30 =
 4423  	case MTD_OPS_RAW:
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29 =
 4424  		break;
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29 =
 4425  =

8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29 =
 4426  	default:
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29 =
 4427  		goto out;
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29 =
 4428  	}
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29 =
 4429  =

8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29 =
 4430  	if (!ops->datbuf)
0813621ba898aa drivers/mtd/nand/raw/nand_base.c Boris Brezillon 2018-11-11 =
 4431  		ret =3D nand_do_write_oob(chip, to, ops);
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29 =
 4432  	else
0813621ba898aa drivers/mtd/nand/raw/nand_base.c Boris Brezillon 2018-11-11 =
 4433  		ret =3D nand_do_write_ops(chip, to, ops);
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29 =
 4434  =

^1da177e4c3f41 drivers/mtd/nand/nand_base.c     Linus Torvalds  2005-04-16 =
 4435  out:
0813621ba898aa drivers/mtd/nand/raw/nand_base.c Boris Brezillon 2018-11-11 =
 4436  	nand_release_device(chip);
^1da177e4c3f41 drivers/mtd/nand/nand_base.c     Linus Torvalds  2005-04-16 =
@4437  	return ret;
^1da177e4c3f41 drivers/mtd/nand/nand_base.c     Linus Torvalds  2005-04-16 =
 4438  }
^1da177e4c3f41 drivers/mtd/nand/nand_base.c     Linus Torvalds  2005-04-16 =
 4439  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8837439718151317035==--

