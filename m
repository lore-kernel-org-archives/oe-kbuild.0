Content-Type: multipart/mixed; boundary="===============7195910852746414472=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mtd:spi-mem-ecc 14/16] drivers/mtd/nand/ecc-mxic.c:395 mxic_ecc_data_xfer_wait_for_completion() error: uninitialized symbol 'val'.
Date: Mon, 27 Dec 2021 17:06:22 +0800
Message-ID: <202112271621.cNxEVvN6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7195910852746414472==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-m=
em-ecc
head:   5966bd4f59edbbe5873b1b4637ed50f258ced0b2
commit: b78baf1891f0b7c3f0e2e3e6022eab38ee6c871f [14/16] mtd: nand: mxic-ec=
c: Add Macronix external ECC engine support
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: i386-randconfig-m021-20211227 (https://download.01.org/0day-ci/arch=
ive/20211227/202112271621.cNxEVvN6-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/mtd/nand/ecc-mxic.c:395 mxic_ecc_data_xfer_wait_for_completion() er=
ror: uninitialized symbol 'val'.
drivers/mtd/nand/ecc-mxic.c:548 mxic_ecc_prepare_io_req_external() error: u=
ninitialized symbol 'ret'.

vim +/val +395 drivers/mtd/nand/ecc-mxic.c

b78baf1891f0b7 Miquel Raynal 2021-12-16  376  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  377  static int mxic_ecc_data_xfer=
_wait_for_completion(struct mxic_ecc_engine *mxic)
b78baf1891f0b7 Miquel Raynal 2021-12-16  378  {
b78baf1891f0b7 Miquel Raynal 2021-12-16  379  	u32 val;
b78baf1891f0b7 Miquel Raynal 2021-12-16  380  	int ret;
b78baf1891f0b7 Miquel Raynal 2021-12-16  381  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  382  	if (mxic->irq) {
b78baf1891f0b7 Miquel Raynal 2021-12-16  383  		reinit_completion(&mxic->co=
mplete);
b78baf1891f0b7 Miquel Raynal 2021-12-16  384  		mxic_ecc_enable_int(mxic);
b78baf1891f0b7 Miquel Raynal 2021-12-16  385  		ret =3D wait_for_completion=
_timeout(&mxic->complete,
b78baf1891f0b7 Miquel Raynal 2021-12-16  386  						  msecs_to_jiffies(1000=
));
b78baf1891f0b7 Miquel Raynal 2021-12-16  387  		mxic_ecc_disable_int(mxic);
b78baf1891f0b7 Miquel Raynal 2021-12-16  388  	} else {
b78baf1891f0b7 Miquel Raynal 2021-12-16  389  		ret =3D readl_poll_timeout(=
mxic->regs + INTRPT_STS, val,
b78baf1891f0b7 Miquel Raynal 2021-12-16  390  					 val & TRANS_CMPLT, 10, =
USEC_PER_SEC);
b78baf1891f0b7 Miquel Raynal 2021-12-16  391  		writel(val, mxic->regs + IN=
TRPT_STS);
b78baf1891f0b7 Miquel Raynal 2021-12-16  392  	}
b78baf1891f0b7 Miquel Raynal 2021-12-16  393  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  394  	if (ret) {
b78baf1891f0b7 Miquel Raynal 2021-12-16 @395  		dev_err(mxic->dev, "Timeout=
 on data xfer completion (sts 0x%08x)\n", val);
b78baf1891f0b7 Miquel Raynal 2021-12-16  396  		return -ETIMEDOUT;
b78baf1891f0b7 Miquel Raynal 2021-12-16  397  	}
b78baf1891f0b7 Miquel Raynal 2021-12-16  398  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  399  	return 0;
b78baf1891f0b7 Miquel Raynal 2021-12-16  400  }
b78baf1891f0b7 Miquel Raynal 2021-12-16  401  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  402  static int mxic_ecc_process_d=
ata(struct mxic_ecc_engine *mxic,
b78baf1891f0b7 Miquel Raynal 2021-12-16  403  				 unsigned int direction)
b78baf1891f0b7 Miquel Raynal 2021-12-16  404  {
b78baf1891f0b7 Miquel Raynal 2021-12-16  405  	unsigned int dir =3D (direct=
ion =3D=3D NAND_PAGE_READ) ?
b78baf1891f0b7 Miquel Raynal 2021-12-16  406  			   READ_NAND : WRITE_NAND;
b78baf1891f0b7 Miquel Raynal 2021-12-16  407  	int ret;
b78baf1891f0b7 Miquel Raynal 2021-12-16  408  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  409  	mxic_ecc_enable_engine(mxic);
b78baf1891f0b7 Miquel Raynal 2021-12-16  410  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  411  	/* Trigger processing */
b78baf1891f0b7 Miquel Raynal 2021-12-16  412  	writel(SDMA_STRT | dir, mxic=
->regs + SDMA_CTRL);
b78baf1891f0b7 Miquel Raynal 2021-12-16  413  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  414  	/* Wait for completion */
b78baf1891f0b7 Miquel Raynal 2021-12-16  415  	ret =3D mxic_ecc_data_xfer_w=
ait_for_completion(mxic);
b78baf1891f0b7 Miquel Raynal 2021-12-16  416  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  417  	mxic_ecc_disable_engine(mxic=
);
b78baf1891f0b7 Miquel Raynal 2021-12-16  418  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  419  	return ret;
b78baf1891f0b7 Miquel Raynal 2021-12-16  420  }
b78baf1891f0b7 Miquel Raynal 2021-12-16  421  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  422  static void mxic_ecc_extract_=
status_bytes(struct mxic_ecc_ctx *ctx)
b78baf1891f0b7 Miquel Raynal 2021-12-16  423  {
b78baf1891f0b7 Miquel Raynal 2021-12-16  424  	u8 *buf =3D ctx->oobwithstat;
b78baf1891f0b7 Miquel Raynal 2021-12-16  425  	int next_stat_pos;
b78baf1891f0b7 Miquel Raynal 2021-12-16  426  	int step;
b78baf1891f0b7 Miquel Raynal 2021-12-16  427  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  428  	/* Extract the ECC status */
b78baf1891f0b7 Miquel Raynal 2021-12-16  429  	for (step =3D 0; step < ctx-=
>steps; step++) {
b78baf1891f0b7 Miquel Raynal 2021-12-16  430  		next_stat_pos =3D ctx->oob_=
step_sz +
b78baf1891f0b7 Miquel Raynal 2021-12-16  431  				((STAT_BYTES + ctx->oob_s=
tep_sz) * step);
b78baf1891f0b7 Miquel Raynal 2021-12-16  432  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  433  		ctx->status[step] =3D buf[n=
ext_stat_pos];
b78baf1891f0b7 Miquel Raynal 2021-12-16  434  	}
b78baf1891f0b7 Miquel Raynal 2021-12-16  435  }
b78baf1891f0b7 Miquel Raynal 2021-12-16  436  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  437  static void mxic_ecc_reconstr=
uct_oobbuf(struct mxic_ecc_ctx *ctx,
b78baf1891f0b7 Miquel Raynal 2021-12-16  438  					u8 *dst, const u8 *src)
b78baf1891f0b7 Miquel Raynal 2021-12-16  439  {
b78baf1891f0b7 Miquel Raynal 2021-12-16  440  	int step;
b78baf1891f0b7 Miquel Raynal 2021-12-16  441  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  442  	/* Reconstruct the OOB buffe=
r linearly (without the ECC status bytes) */
b78baf1891f0b7 Miquel Raynal 2021-12-16  443  	for (step =3D 0; step < ctx-=
>steps; step++)
b78baf1891f0b7 Miquel Raynal 2021-12-16  444  		memcpy(dst + (step * ctx->o=
ob_step_sz),
b78baf1891f0b7 Miquel Raynal 2021-12-16  445  		       src + (step * (ctx->=
oob_step_sz + STAT_BYTES)),
b78baf1891f0b7 Miquel Raynal 2021-12-16  446  		       ctx->oob_step_sz);
b78baf1891f0b7 Miquel Raynal 2021-12-16  447  }
b78baf1891f0b7 Miquel Raynal 2021-12-16  448  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  449  static void mxic_ecc_add_room=
_in_oobbuf(struct mxic_ecc_ctx *ctx,
b78baf1891f0b7 Miquel Raynal 2021-12-16  450  					u8 *dst, const u8 *src)
b78baf1891f0b7 Miquel Raynal 2021-12-16  451  {
b78baf1891f0b7 Miquel Raynal 2021-12-16  452  	int step;
b78baf1891f0b7 Miquel Raynal 2021-12-16  453  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  454  	/* Add some space in the OOB=
 buffer for the status bytes */
b78baf1891f0b7 Miquel Raynal 2021-12-16  455  	for (step =3D 0; step < ctx-=
>steps; step++)
b78baf1891f0b7 Miquel Raynal 2021-12-16  456  		memcpy(dst + (step * (ctx->=
oob_step_sz + STAT_BYTES)),
b78baf1891f0b7 Miquel Raynal 2021-12-16  457  		       src + (step * ctx->o=
ob_step_sz),
b78baf1891f0b7 Miquel Raynal 2021-12-16  458  		       ctx->oob_step_sz);
b78baf1891f0b7 Miquel Raynal 2021-12-16  459  }
b78baf1891f0b7 Miquel Raynal 2021-12-16  460  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  461  static int mxic_ecc_count_bit=
errs(struct mxic_ecc_engine *mxic,
b78baf1891f0b7 Miquel Raynal 2021-12-16  462  				  struct nand_device *nan=
d)
b78baf1891f0b7 Miquel Raynal 2021-12-16  463  {
b78baf1891f0b7 Miquel Raynal 2021-12-16  464  	struct mxic_ecc_ctx *ctx =3D=
 nand_to_ecc_ctx(nand);
b78baf1891f0b7 Miquel Raynal 2021-12-16  465  	struct mtd_info *mtd =3D nan=
ddev_to_mtd(nand);
b78baf1891f0b7 Miquel Raynal 2021-12-16  466  	struct device *dev =3D mxic-=
>dev;
b78baf1891f0b7 Miquel Raynal 2021-12-16  467  	unsigned int max_bf =3D 0;
b78baf1891f0b7 Miquel Raynal 2021-12-16  468  	bool failure =3D false;
b78baf1891f0b7 Miquel Raynal 2021-12-16  469  	int step;
b78baf1891f0b7 Miquel Raynal 2021-12-16  470  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  471  	for (step =3D 0; step < ctx-=
>steps; step++) {
b78baf1891f0b7 Miquel Raynal 2021-12-16  472  		u8 stat =3D ctx->status[ste=
p];
b78baf1891f0b7 Miquel Raynal 2021-12-16  473  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  474  		if (stat =3D=3D NO_ERR) {
b78baf1891f0b7 Miquel Raynal 2021-12-16  475  			dev_dbg(dev, "ECC step %d:=
 no error\n", step);
b78baf1891f0b7 Miquel Raynal 2021-12-16  476  		} else if (stat =3D=3D ERAS=
ED_CHUNK) {
b78baf1891f0b7 Miquel Raynal 2021-12-16  477  			dev_dbg(dev, "ECC step %d:=
 erased\n", step);
b78baf1891f0b7 Miquel Raynal 2021-12-16  478  		} else if (stat =3D=3D UNCO=
RR_ERR || stat > MAX_CORR_ERR) {
b78baf1891f0b7 Miquel Raynal 2021-12-16  479  			dev_dbg(dev, "ECC step %d:=
 uncorrectable\n", step);
b78baf1891f0b7 Miquel Raynal 2021-12-16  480  			mtd->ecc_stats.failed++;
b78baf1891f0b7 Miquel Raynal 2021-12-16  481  			failure =3D true;
b78baf1891f0b7 Miquel Raynal 2021-12-16  482  		} else {
b78baf1891f0b7 Miquel Raynal 2021-12-16  483  			dev_dbg(dev, "ECC step %d:=
 %d bits corrected\n",
b78baf1891f0b7 Miquel Raynal 2021-12-16  484  				step, stat);
b78baf1891f0b7 Miquel Raynal 2021-12-16  485  			max_bf =3D max_t(unsigned =
int, max_bf, stat);
b78baf1891f0b7 Miquel Raynal 2021-12-16  486  			mtd->ecc_stats.corrected +=
=3D stat;
b78baf1891f0b7 Miquel Raynal 2021-12-16  487  		}
b78baf1891f0b7 Miquel Raynal 2021-12-16  488  	}
b78baf1891f0b7 Miquel Raynal 2021-12-16  489  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  490  	return failure ? -EBADMSG : =
max_bf;
b78baf1891f0b7 Miquel Raynal 2021-12-16  491  }
b78baf1891f0b7 Miquel Raynal 2021-12-16  492  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  493  /* External ECC engine helper=
s */
b78baf1891f0b7 Miquel Raynal 2021-12-16  494  static int mxic_ecc_prepare_i=
o_req_external(struct nand_device *nand,
b78baf1891f0b7 Miquel Raynal 2021-12-16  495  					    struct nand_page_io_=
req *req)
b78baf1891f0b7 Miquel Raynal 2021-12-16  496  {
b78baf1891f0b7 Miquel Raynal 2021-12-16  497  	struct mxic_ecc_engine *mxic=
 =3D nand_to_mxic(nand);
b78baf1891f0b7 Miquel Raynal 2021-12-16  498  	struct mxic_ecc_ctx *ctx =3D=
 nand_to_ecc_ctx(nand);
b78baf1891f0b7 Miquel Raynal 2021-12-16  499  	struct mtd_info *mtd =3D nan=
ddev_to_mtd(nand);
b78baf1891f0b7 Miquel Raynal 2021-12-16  500  	int offset, nents, step, ret;
b78baf1891f0b7 Miquel Raynal 2021-12-16  501  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  502  	if (req->mode =3D=3D MTD_OPS=
_RAW)
b78baf1891f0b7 Miquel Raynal 2021-12-16  503  		return 0;
b78baf1891f0b7 Miquel Raynal 2021-12-16  504  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  505  	nand_ecc_tweak_req(&ctx->req=
_ctx, req);
b78baf1891f0b7 Miquel Raynal 2021-12-16  506  	ctx->req =3D req;
b78baf1891f0b7 Miquel Raynal 2021-12-16  507  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  508  	if (req->type =3D=3D NAND_PA=
GE_READ)
b78baf1891f0b7 Miquel Raynal 2021-12-16  509  		return 0;
b78baf1891f0b7 Miquel Raynal 2021-12-16  510  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  511  	mxic_ecc_add_room_in_oobbuf(=
ctx, ctx->oobwithstat,
b78baf1891f0b7 Miquel Raynal 2021-12-16  512  				    ctx->req->oobbuf.out);
b78baf1891f0b7 Miquel Raynal 2021-12-16  513  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  514  	sg_set_buf(&ctx->sg[0], req-=
>databuf.out, req->datalen);
b78baf1891f0b7 Miquel Raynal 2021-12-16  515  	sg_set_buf(&ctx->sg[1], ctx-=
>oobwithstat,
b78baf1891f0b7 Miquel Raynal 2021-12-16  516  		   req->ooblen + (ctx->step=
s * STAT_BYTES));
b78baf1891f0b7 Miquel Raynal 2021-12-16  517  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  518  	nents =3D dma_map_sg(mxic->d=
ev, ctx->sg, 2, DMA_BIDIRECTIONAL);
b78baf1891f0b7 Miquel Raynal 2021-12-16  519  	if (!nents)
b78baf1891f0b7 Miquel Raynal 2021-12-16  520  		return -EINVAL;
b78baf1891f0b7 Miquel Raynal 2021-12-16  521  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  522  	mutex_lock(&mxic->lock);
b78baf1891f0b7 Miquel Raynal 2021-12-16  523  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  524  	for (step =3D 0; step < ctx-=
>steps; step++) {
b78baf1891f0b7 Miquel Raynal 2021-12-16  525  		writel(sg_dma_address(&ctx-=
>sg[0]) + (step * ctx->data_step_sz),
b78baf1891f0b7 Miquel Raynal 2021-12-16  526  		       mxic->regs + SDMA_MA=
IN_ADDR);
b78baf1891f0b7 Miquel Raynal 2021-12-16  527  		writel(sg_dma_address(&ctx-=
>sg[1]) + (step * (ctx->oob_step_sz + STAT_BYTES)),
b78baf1891f0b7 Miquel Raynal 2021-12-16  528  		       mxic->regs + SDMA_SP=
ARE_ADDR);
b78baf1891f0b7 Miquel Raynal 2021-12-16  529  		ret =3D mxic_ecc_process_da=
ta(mxic, ctx->req->type);
b78baf1891f0b7 Miquel Raynal 2021-12-16  530  		if (ret)
b78baf1891f0b7 Miquel Raynal 2021-12-16  531  			break;
b78baf1891f0b7 Miquel Raynal 2021-12-16  532  	}
b78baf1891f0b7 Miquel Raynal 2021-12-16  533  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  534  	mutex_unlock(&mxic->lock);
b78baf1891f0b7 Miquel Raynal 2021-12-16  535  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  536  	dma_unmap_sg(mxic->dev, ctx-=
>sg, 2, DMA_BIDIRECTIONAL);
b78baf1891f0b7 Miquel Raynal 2021-12-16  537  =

b78baf1891f0b7 Miquel Raynal 2021-12-16  538  	/* Retrieve the calculated E=
CC bytes */
b78baf1891f0b7 Miquel Raynal 2021-12-16  539  	for (step =3D 0; step < ctx-=
>steps; step++) {
b78baf1891f0b7 Miquel Raynal 2021-12-16  540  		offset =3D ctx->meta_sz + (=
step * ctx->oob_step_sz);
b78baf1891f0b7 Miquel Raynal 2021-12-16  541  		mtd_ooblayout_get_eccbytes(=
mtd,
b78baf1891f0b7 Miquel Raynal 2021-12-16  542  					   (u8 *)ctx->req->oobbu=
f.out + offset,
b78baf1891f0b7 Miquel Raynal 2021-12-16  543  					   ctx->oobwithstat + (s=
tep * STAT_BYTES),
b78baf1891f0b7 Miquel Raynal 2021-12-16  544  					   step * ctx->parity_sz,
b78baf1891f0b7 Miquel Raynal 2021-12-16  545  					   ctx->parity_sz);
b78baf1891f0b7 Miquel Raynal 2021-12-16  546  	}
b78baf1891f0b7 Miquel Raynal 2021-12-16  547  =

b78baf1891f0b7 Miquel Raynal 2021-12-16 @548  	return ret;
b78baf1891f0b7 Miquel Raynal 2021-12-16  549  }
b78baf1891f0b7 Miquel Raynal 2021-12-16  550  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7195910852746414472==--

