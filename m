Content-Type: multipart/mixed; boundary="===============2313786922969358093=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mtd:spi-mem-ecc 14/29] drivers/mtd/nand/ecc-mxic.c:548 mxic_ecc_prepare_io_req_external() error: uninitialized symbol 'ret'.
Date: Wed, 09 Feb 2022 04:36:54 +0800
Message-ID: <202202090415.SS8TwwHj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2313786922969358093==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-m=
em-ecc
head:   d6986e74ec6ee6a48ce9ee1d8051b2988d747558
commit: cfe5cf69e97267e9d1de65cc894b7a2310644a15 [14/29] mtd: nand: mxic-ec=
c: Add Macronix external ECC engine support
:::::: branch date: 29 hours ago
:::::: commit date: 13 days ago
config: x86_64-randconfig-m001-20220207 (https://download.01.org/0day-ci/ar=
chive/20220209/202202090415.SS8TwwHj-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/mtd/nand/ecc-mxic.c:548 mxic_ecc_prepare_io_req_external() error: u=
ninitialized symbol 'ret'.

vim +/ret +548 drivers/mtd/nand/ecc-mxic.c

cfe5cf69e97267 Miquel Raynal 2021-12-16  492  =

cfe5cf69e97267 Miquel Raynal 2021-12-16  493  /* External ECC engine helper=
s */
cfe5cf69e97267 Miquel Raynal 2021-12-16  494  static int mxic_ecc_prepare_i=
o_req_external(struct nand_device *nand,
cfe5cf69e97267 Miquel Raynal 2021-12-16  495  					    struct nand_page_io_=
req *req)
cfe5cf69e97267 Miquel Raynal 2021-12-16  496  {
cfe5cf69e97267 Miquel Raynal 2021-12-16  497  	struct mxic_ecc_engine *mxic=
 =3D nand_to_mxic(nand);
cfe5cf69e97267 Miquel Raynal 2021-12-16  498  	struct mxic_ecc_ctx *ctx =3D=
 nand_to_ecc_ctx(nand);
cfe5cf69e97267 Miquel Raynal 2021-12-16  499  	struct mtd_info *mtd =3D nan=
ddev_to_mtd(nand);
cfe5cf69e97267 Miquel Raynal 2021-12-16  500  	int offset, nents, step, ret;
cfe5cf69e97267 Miquel Raynal 2021-12-16  501  =

cfe5cf69e97267 Miquel Raynal 2021-12-16  502  	if (req->mode =3D=3D MTD_OPS=
_RAW)
cfe5cf69e97267 Miquel Raynal 2021-12-16  503  		return 0;
cfe5cf69e97267 Miquel Raynal 2021-12-16  504  =

cfe5cf69e97267 Miquel Raynal 2021-12-16  505  	nand_ecc_tweak_req(&ctx->req=
_ctx, req);
cfe5cf69e97267 Miquel Raynal 2021-12-16  506  	ctx->req =3D req;
cfe5cf69e97267 Miquel Raynal 2021-12-16  507  =

cfe5cf69e97267 Miquel Raynal 2021-12-16  508  	if (req->type =3D=3D NAND_PA=
GE_READ)
cfe5cf69e97267 Miquel Raynal 2021-12-16  509  		return 0;
cfe5cf69e97267 Miquel Raynal 2021-12-16  510  =

cfe5cf69e97267 Miquel Raynal 2021-12-16  511  	mxic_ecc_add_room_in_oobbuf(=
ctx, ctx->oobwithstat,
cfe5cf69e97267 Miquel Raynal 2021-12-16  512  				    ctx->req->oobbuf.out);
cfe5cf69e97267 Miquel Raynal 2021-12-16  513  =

cfe5cf69e97267 Miquel Raynal 2021-12-16  514  	sg_set_buf(&ctx->sg[0], req-=
>databuf.out, req->datalen);
cfe5cf69e97267 Miquel Raynal 2021-12-16  515  	sg_set_buf(&ctx->sg[1], ctx-=
>oobwithstat,
cfe5cf69e97267 Miquel Raynal 2021-12-16  516  		   req->ooblen + (ctx->step=
s * STAT_BYTES));
cfe5cf69e97267 Miquel Raynal 2021-12-16  517  =

cfe5cf69e97267 Miquel Raynal 2021-12-16  518  	nents =3D dma_map_sg(mxic->d=
ev, ctx->sg, 2, DMA_BIDIRECTIONAL);
cfe5cf69e97267 Miquel Raynal 2021-12-16  519  	if (!nents)
cfe5cf69e97267 Miquel Raynal 2021-12-16  520  		return -EINVAL;
cfe5cf69e97267 Miquel Raynal 2021-12-16  521  =

cfe5cf69e97267 Miquel Raynal 2021-12-16  522  	mutex_lock(&mxic->lock);
cfe5cf69e97267 Miquel Raynal 2021-12-16  523  =

cfe5cf69e97267 Miquel Raynal 2021-12-16  524  	for (step =3D 0; step < ctx-=
>steps; step++) {
cfe5cf69e97267 Miquel Raynal 2021-12-16  525  		writel(sg_dma_address(&ctx-=
>sg[0]) + (step * ctx->data_step_sz),
cfe5cf69e97267 Miquel Raynal 2021-12-16  526  		       mxic->regs + SDMA_MA=
IN_ADDR);
cfe5cf69e97267 Miquel Raynal 2021-12-16  527  		writel(sg_dma_address(&ctx-=
>sg[1]) + (step * (ctx->oob_step_sz + STAT_BYTES)),
cfe5cf69e97267 Miquel Raynal 2021-12-16  528  		       mxic->regs + SDMA_SP=
ARE_ADDR);
cfe5cf69e97267 Miquel Raynal 2021-12-16  529  		ret =3D mxic_ecc_process_da=
ta(mxic, ctx->req->type);
cfe5cf69e97267 Miquel Raynal 2021-12-16  530  		if (ret)
cfe5cf69e97267 Miquel Raynal 2021-12-16  531  			break;
cfe5cf69e97267 Miquel Raynal 2021-12-16  532  	}
cfe5cf69e97267 Miquel Raynal 2021-12-16  533  =

cfe5cf69e97267 Miquel Raynal 2021-12-16  534  	mutex_unlock(&mxic->lock);
cfe5cf69e97267 Miquel Raynal 2021-12-16  535  =

cfe5cf69e97267 Miquel Raynal 2021-12-16  536  	dma_unmap_sg(mxic->dev, ctx-=
>sg, 2, DMA_BIDIRECTIONAL);
cfe5cf69e97267 Miquel Raynal 2021-12-16  537  =

cfe5cf69e97267 Miquel Raynal 2021-12-16  538  	/* Retrieve the calculated E=
CC bytes */
cfe5cf69e97267 Miquel Raynal 2021-12-16  539  	for (step =3D 0; step < ctx-=
>steps; step++) {
cfe5cf69e97267 Miquel Raynal 2021-12-16  540  		offset =3D ctx->meta_sz + (=
step * ctx->oob_step_sz);
cfe5cf69e97267 Miquel Raynal 2021-12-16  541  		mtd_ooblayout_get_eccbytes(=
mtd,
cfe5cf69e97267 Miquel Raynal 2021-12-16  542  					   (u8 *)ctx->req->oobbu=
f.out + offset,
cfe5cf69e97267 Miquel Raynal 2021-12-16  543  					   ctx->oobwithstat + (s=
tep * STAT_BYTES),
cfe5cf69e97267 Miquel Raynal 2021-12-16  544  					   step * ctx->parity_sz,
cfe5cf69e97267 Miquel Raynal 2021-12-16  545  					   ctx->parity_sz);
cfe5cf69e97267 Miquel Raynal 2021-12-16  546  	}
cfe5cf69e97267 Miquel Raynal 2021-12-16  547  =

cfe5cf69e97267 Miquel Raynal 2021-12-16 @548  	return ret;
cfe5cf69e97267 Miquel Raynal 2021-12-16  549  }
cfe5cf69e97267 Miquel Raynal 2021-12-16  550  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2313786922969358093==--

