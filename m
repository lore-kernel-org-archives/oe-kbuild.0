Content-Type: multipart/mixed; boundary="===============0737755283745725653=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mtd:spi-mem-ecc 16/29] drivers/mtd/nand/ecc-mxic.c:652 mxic_ecc_finish_io_req_external() error: uninitialized symbol 'ret'.
Date: Thu, 10 Feb 2022 00:52:05 +0800
Message-ID: <202202100023.AD5wMMvp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0737755283745725653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-m=
em-ecc
head:   b556a86810e25b9d5a56da553bc65e5f4dcbedb6
commit: f46b431b115d2ead7ccf71da53a5d1993f0acfcd [16/29] mtd: nand: mxic-ec=
c: Support SPI pipelined mode
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: arm64-randconfig-m031-20220209 (https://download.01.org/0day-ci/arc=
hive/20220210/202202100023.AD5wMMvp-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/mtd/nand/ecc-mxic.c:652 mxic_ecc_finish_io_req_external() error: un=
initialized symbol 'ret'.

Old smatch warnings:
drivers/mtd/nand/ecc-mxic.c:595 mxic_ecc_prepare_io_req_external() error: u=
ninitialized symbol 'ret'.

vim +/ret +652 drivers/mtd/nand/ecc-mxic.c

48e6633a9fa2400 Miquel Raynal 2021-12-16  610  =

48e6633a9fa2400 Miquel Raynal 2021-12-16  611  static int mxic_ecc_finish_i=
o_req_external(struct nand_device *nand,
48e6633a9fa2400 Miquel Raynal 2021-12-16  612  					   struct nand_page_io_=
req *req)
48e6633a9fa2400 Miquel Raynal 2021-12-16  613  {
48e6633a9fa2400 Miquel Raynal 2021-12-16  614  	struct mxic_ecc_engine *mxi=
c =3D nand_to_mxic(nand);
48e6633a9fa2400 Miquel Raynal 2021-12-16  615  	struct mxic_ecc_ctx *ctx =
=3D nand_to_ecc_ctx(nand);
48e6633a9fa2400 Miquel Raynal 2021-12-16  616  	int nents, step, ret;
48e6633a9fa2400 Miquel Raynal 2021-12-16  617  =

48e6633a9fa2400 Miquel Raynal 2021-12-16  618  	if (req->mode =3D=3D MTD_OP=
S_RAW)
48e6633a9fa2400 Miquel Raynal 2021-12-16  619  		return 0;
48e6633a9fa2400 Miquel Raynal 2021-12-16  620  =

48e6633a9fa2400 Miquel Raynal 2021-12-16  621  	if (req->type =3D=3D NAND_P=
AGE_WRITE) {
48e6633a9fa2400 Miquel Raynal 2021-12-16  622  		nand_ecc_restore_req(&ctx-=
>req_ctx, req);
48e6633a9fa2400 Miquel Raynal 2021-12-16  623  		return 0;
48e6633a9fa2400 Miquel Raynal 2021-12-16  624  	}
48e6633a9fa2400 Miquel Raynal 2021-12-16  625  =

48e6633a9fa2400 Miquel Raynal 2021-12-16  626  	/* Copy the OOB buffer and =
add room for the ECC engine status bytes */
48e6633a9fa2400 Miquel Raynal 2021-12-16  627  	mxic_ecc_add_room_in_oobbuf=
(ctx, ctx->oobwithstat, ctx->req->oobbuf.in);
48e6633a9fa2400 Miquel Raynal 2021-12-16  628  =

48e6633a9fa2400 Miquel Raynal 2021-12-16  629  	sg_set_buf(&ctx->sg[0], req=
->databuf.in, req->datalen);
48e6633a9fa2400 Miquel Raynal 2021-12-16  630  	sg_set_buf(&ctx->sg[1], ctx=
->oobwithstat,
48e6633a9fa2400 Miquel Raynal 2021-12-16  631  		   req->ooblen + (ctx->ste=
ps * STAT_BYTES));
48e6633a9fa2400 Miquel Raynal 2021-12-16  632  	nents =3D dma_map_sg(mxic->=
dev, ctx->sg, 2, DMA_BIDIRECTIONAL);
48e6633a9fa2400 Miquel Raynal 2021-12-16  633  	if (!nents)
48e6633a9fa2400 Miquel Raynal 2021-12-16  634  		return -EINVAL;
48e6633a9fa2400 Miquel Raynal 2021-12-16  635  =

48e6633a9fa2400 Miquel Raynal 2021-12-16  636  	mutex_lock(&mxic->lock);
48e6633a9fa2400 Miquel Raynal 2021-12-16  637  =

48e6633a9fa2400 Miquel Raynal 2021-12-16  638  	for (step =3D 0; step < ctx=
->steps; step++) {
48e6633a9fa2400 Miquel Raynal 2021-12-16  639  		writel(sg_dma_address(&ctx=
->sg[0]) + (step * ctx->data_step_sz),
48e6633a9fa2400 Miquel Raynal 2021-12-16  640  		       mxic->regs + SDMA_M=
AIN_ADDR);
48e6633a9fa2400 Miquel Raynal 2021-12-16  641  		writel(sg_dma_address(&ctx=
->sg[1]) + (step * (ctx->oob_step_sz + STAT_BYTES)),
48e6633a9fa2400 Miquel Raynal 2021-12-16  642  		       mxic->regs + SDMA_S=
PARE_ADDR);
48e6633a9fa2400 Miquel Raynal 2021-12-16  643  		ret =3D mxic_ecc_process_d=
ata(mxic, ctx->req->type);
48e6633a9fa2400 Miquel Raynal 2021-12-16  644  		if (ret)
48e6633a9fa2400 Miquel Raynal 2021-12-16  645  			break;
48e6633a9fa2400 Miquel Raynal 2021-12-16  646  	}
48e6633a9fa2400 Miquel Raynal 2021-12-16  647  =

48e6633a9fa2400 Miquel Raynal 2021-12-16  648  	mutex_unlock(&mxic->lock);
48e6633a9fa2400 Miquel Raynal 2021-12-16  649  =

48e6633a9fa2400 Miquel Raynal 2021-12-16  650  	dma_unmap_sg(mxic->dev, ctx=
->sg, 2, DMA_BIDIRECTIONAL);
48e6633a9fa2400 Miquel Raynal 2021-12-16  651  =

f46b431b115d2ea Miquel Raynal 2021-12-16 @652  	if (!ret) {
f46b431b115d2ea Miquel Raynal 2021-12-16  653  		nand_ecc_restore_req(&ctx-=
>req_ctx, req);
f46b431b115d2ea Miquel Raynal 2021-12-16  654  		return ret;
f46b431b115d2ea Miquel Raynal 2021-12-16  655  	}
f46b431b115d2ea Miquel Raynal 2021-12-16  656  =

48e6633a9fa2400 Miquel Raynal 2021-12-16  657  	/* Extract the status bytes=
 and reconstruct the buffer */
48e6633a9fa2400 Miquel Raynal 2021-12-16  658  	mxic_ecc_extract_status_byt=
es(ctx);
48e6633a9fa2400 Miquel Raynal 2021-12-16  659  	mxic_ecc_reconstruct_oobbuf=
(ctx, ctx->req->oobbuf.in, ctx->oobwithstat);
48e6633a9fa2400 Miquel Raynal 2021-12-16  660  =

48e6633a9fa2400 Miquel Raynal 2021-12-16  661  	nand_ecc_restore_req(&ctx->=
req_ctx, req);
48e6633a9fa2400 Miquel Raynal 2021-12-16  662  =

48e6633a9fa2400 Miquel Raynal 2021-12-16  663  	return mxic_ecc_count_biter=
rs(mxic, nand);
48e6633a9fa2400 Miquel Raynal 2021-12-16  664  }
48e6633a9fa2400 Miquel Raynal 2021-12-16  665  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0737755283745725653==--

