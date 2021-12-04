Content-Type: multipart/mixed; boundary="===============4819211583195405988=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mtd/nand/raw/atmel/nand-controller.c:1532 atmel_nand_setup_interface() warn: passing a valid pointer to 'PTR_ERR'
Date: Sat, 04 Dec 2021 11:23:43 +0800
Message-ID: <202112041148.r2LYXA8f-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4819211583195405988==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   12119cfa1052d512a92524e90ebee85029a918f8
commit: ed2a491037116387f109e851a2b46adcb5feca3b mtd: rawnand: atmel: Check=
 the proposed data interface is supported
date:   6 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 6 months ago
config: nios2-randconfig-m031-20211202 (https://download.01.org/0day-ci/arc=
hive/20211204/202112041148.r2LYXA8f-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/mtd/nand/raw/atmel/nand-controller.c:1532 atmel_nand_setup_interfac=
e() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +1532 drivers/mtd/nand/raw/atmel/nand-controller.c

f9ce2eddf1769a drivers/mtd/nand/atmel/nand-controller.c     Boris Brezillon=
 2017-03-16  1522  =

4c46667b3d6725 drivers/mtd/nand/raw/atmel/nand-controller.c Miquel Raynal  =
 2020-05-29  1523  static int atmel_nand_setup_interface(struct nand_chip *=
chip, int csline,
4c46667b3d6725 drivers/mtd/nand/raw/atmel/nand-controller.c Miquel Raynal  =
 2020-05-29  1524  				      const struct nand_interface_config *conf)
f9ce2eddf1769a drivers/mtd/nand/atmel/nand-controller.c     Boris Brezillon=
 2017-03-16  1525  {
f9ce2eddf1769a drivers/mtd/nand/atmel/nand-controller.c     Boris Brezillon=
 2017-03-16  1526  	struct atmel_nand *nand =3D to_atmel_nand(chip);
ed2a4910371163 drivers/mtd/nand/raw/atmel/nand-controller.c Miquel Raynal  =
 2021-05-05  1527  	const struct nand_sdr_timings *sdr;
f9ce2eddf1769a drivers/mtd/nand/atmel/nand-controller.c     Boris Brezillon=
 2017-03-16  1528  	struct atmel_nand_controller *nc;
f9ce2eddf1769a drivers/mtd/nand/atmel/nand-controller.c     Boris Brezillon=
 2017-03-16  1529  =

ed2a4910371163 drivers/mtd/nand/raw/atmel/nand-controller.c Miquel Raynal  =
 2021-05-05  1530  	sdr =3D nand_get_sdr_timings(conf);
ed2a4910371163 drivers/mtd/nand/raw/atmel/nand-controller.c Miquel Raynal  =
 2021-05-05  1531  	if (IS_ERR(sdr))
ed2a4910371163 drivers/mtd/nand/raw/atmel/nand-controller.c Miquel Raynal  =
 2021-05-05 @1532  		return PTR_ERR(sdr);
ed2a4910371163 drivers/mtd/nand/raw/atmel/nand-controller.c Miquel Raynal  =
 2021-05-05  1533  =

f9ce2eddf1769a drivers/mtd/nand/atmel/nand-controller.c     Boris Brezillon=
 2017-03-16  1534  	nc =3D to_nand_controller(nand->base.controller);
f9ce2eddf1769a drivers/mtd/nand/atmel/nand-controller.c     Boris Brezillon=
 2017-03-16  1535  =

f9ce2eddf1769a drivers/mtd/nand/atmel/nand-controller.c     Boris Brezillon=
 2017-03-16  1536  	if (csline >=3D nand->numcs ||
f9ce2eddf1769a drivers/mtd/nand/atmel/nand-controller.c     Boris Brezillon=
 2017-03-16  1537  	    (csline < 0 && csline !=3D NAND_DATA_IFACE_CHECK_ON=
LY))
f9ce2eddf1769a drivers/mtd/nand/atmel/nand-controller.c     Boris Brezillon=
 2017-03-16  1538  		return -EINVAL;
f9ce2eddf1769a drivers/mtd/nand/atmel/nand-controller.c     Boris Brezillon=
 2017-03-16  1539  =

4c46667b3d6725 drivers/mtd/nand/raw/atmel/nand-controller.c Miquel Raynal  =
 2020-05-29  1540  	return nc->caps->ops->setup_interface(nand, csline, con=
f);
f9ce2eddf1769a drivers/mtd/nand/atmel/nand-controller.c     Boris Brezillon=
 2017-03-16  1541  }
f9ce2eddf1769a drivers/mtd/nand/atmel/nand-controller.c     Boris Brezillon=
 2017-03-16  1542  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4819211583195405988==--

