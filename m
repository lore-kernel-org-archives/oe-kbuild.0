Content-Type: multipart/mixed; boundary="===============0231972631445587163=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [miquelraynal:perso/nand-next/flags 94/102] drivers/mtd/nand/raw/brcmnand/brcmnand.c:2580:25: sparse: sparse: cannot dereference this type
Date: Wed, 13 May 2020 06:39:19 +0800
Message-ID: <202005130614.Enpxtg7j%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0231972631445587163==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://github.com/miquelraynal/linux-0day.git perso/nand-next/flags
head:   c5212e24213cba25bcc57e3bbe0781f3e9d83611
commit: 5b2d31e2ed6c6ddd94a27c4d4694a1a2046c7fc2 [94/102] fixup! migrate na=
nd_uses_dma to nand controller options
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        git checkout 5b2d31e2ed6c6ddd94a27c4d4694a1a2046c7fc2
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/mtd/nand/raw/brcmnand/brcmnand.c:1688:42: sparse: sparse: cast t=
o restricted __be32
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:1688:42: sparse: sparse: cast t=
o restricted __be32
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:1688:42: sparse: sparse: cast t=
o restricted __be32
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:1688:42: sparse: sparse: cast t=
o restricted __be32
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:1688:42: sparse: sparse: cast t=
o restricted __be32
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:1688:42: sparse: sparse: cast t=
o restricted __be32
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:1877:41: sparse: sparse: dubiou=
s: x | !y
>> drivers/mtd/nand/raw/brcmnand/brcmnand.c:2580:25: sparse: sparse: cannot=
 dereference this type

# https://github.com/miquelraynal/linux-0day/commit/5b2d31e2ed6c6ddd94a27c4=
d4694a1a2046c7fc2
git remote add miquelraynal https://github.com/miquelraynal/linux-0day.git
git remote update miquelraynal
git checkout 5b2d31e2ed6c6ddd94a27c4d4694a1a2046c7fc2
vim +2580 drivers/mtd/nand/raw/brcmnand/brcmnand.c

27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-=
03-06  2566  =

4918b905736fdd drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2018-=
07-25  2567  static int brcmnand_attach_chip(struct nand_chip *chip)
4918b905736fdd drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2018-=
07-25  2568  {
4918b905736fdd drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2018-=
07-25  2569  	struct mtd_info *mtd =3D nand_to_mtd(chip);
4918b905736fdd drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2018-=
07-25  2570  	struct brcmnand_host *host =3D nand_get_controller_data(chip);
ff9915e8d4d5cb drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2020-=
05-12  2571  	struct brcmnand_controller *ctrl =3D host->ctrl;
4918b905736fdd drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2018-=
07-25  2572  	int ret;
4918b905736fdd drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2018-=
07-25  2573  =

4918b905736fdd drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2018-=
07-25  2574  	chip->options |=3D NAND_NO_SUBPAGE_WRITE;
4918b905736fdd drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2018-=
07-25  2575  	/*
4918b905736fdd drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2018-=
07-25  2576  	 * Avoid (for instance) kmap()'d buffers from JFFS2, which we=
 can't DMA
4918b905736fdd drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2018-=
07-25  2577  	 * to/from, and have nand_base pass us a bounce buffer instea=
d, as
4918b905736fdd drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2018-=
07-25  2578  	 * needed.
4918b905736fdd drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2018-=
07-25  2579  	 */
5b2d31e2ed6c6d drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2020-=
05-12 @2580  	ctrl->controller->flags |=3D NAND_CONTROLLER_USES_DMA;
4918b905736fdd drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2018-=
07-25  2581  =

4918b905736fdd drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2018-=
07-25  2582  	if (chip->bbt_options & NAND_BBT_USE_FLASH)
4918b905736fdd drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2018-=
07-25  2583  		chip->bbt_options |=3D NAND_BBT_NO_OOB;
4918b905736fdd drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2018-=
07-25  2584  =

4918b905736fdd drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2018-=
07-25  2585  	if (brcmnand_setup_dev(host))
4918b905736fdd drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2018-=
07-25  2586  		return -ENXIO;
4918b905736fdd drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2018-=
07-25  2587  =

4918b905736fdd drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2018-=
07-25  2588  	chip->ecc.size =3D host->hwcfg.sector_size_1k ? 1024 : 512;
4918b905736fdd drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2018-=
07-25  2589  =

4918b905736fdd drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2018-=
07-25  2590  	/* only use our internal HW threshold */
4918b905736fdd drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2018-=
07-25  2591  	mtd->bitflip_threshold =3D 1;
4918b905736fdd drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2018-=
07-25  2592  =

4918b905736fdd drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2018-=
07-25  2593  	ret =3D brcmstb_choose_ecc_layout(host);
4918b905736fdd drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2018-=
07-25  2594  =

4918b905736fdd drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2018-=
07-25  2595  	return ret;
4918b905736fdd drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2018-=
07-25  2596  }
4918b905736fdd drivers/mtd/nand/raw/brcmnand/brcmnand.c Miquel Raynal 2018-=
07-25  2597  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0231972631445587163==--

