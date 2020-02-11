Content-Type: multipart/mixed; boundary="===============5734235323741407840=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [sashal-linux-stable:queue-4.9 37/96] drivers/crypto/atmel-aes.c:944 atmel_aes_ctr_transfer() warn: right shifting more than type allows 16 vs 16
Date: Tue, 11 Feb 2020 09:21:25 +0300
Message-ID: <20200211062125.GT24804@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5734235323741407840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable=
.git queue-4.9
head:   89d815750d288127abb27eedf62fb7606c59cd69
commit: 5f5295e65a5cd95f1c9c208547be07a5bb0ec6c5 [37/96] crypto: atmel-aes =
- Fix counter overflow in CTR mode

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/crypto/atmel-aes.c:944 atmel_aes_ctr_transfer() warn: right shiftin=
g more than type allows 16 vs 16

# https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/c=
ommit/?id=3D5f5295e65a5cd95f1c9c208547be07a5bb0ec6c5
git remote add sashal-linux-stable https://git.kernel.org/pub/scm/linux/ker=
nel/git/sashal/linux-stable.git
git remote update sashal-linux-stable
git checkout 5f5295e65a5cd95f1c9c208547be07a5bb0ec6c5
vim +944 drivers/crypto/atmel-aes.c

fcac83656a3e3b Cyrille Pitchen 2015-12-17  920  static int atmel_aes_ctr_tr=
ansfer(struct atmel_aes_dev *dd)
fcac83656a3e3b Cyrille Pitchen 2015-12-17  921  {
fcac83656a3e3b Cyrille Pitchen 2015-12-17  922  	struct atmel_aes_ctr_ctx *=
ctx =3D atmel_aes_ctr_ctx_cast(dd->ctx);
fcac83656a3e3b Cyrille Pitchen 2015-12-17  923  	struct ablkcipher_request =
*req =3D ablkcipher_request_cast(dd->areq);
fcac83656a3e3b Cyrille Pitchen 2015-12-17  924  	struct scatterlist *src, *=
dst;
fcac83656a3e3b Cyrille Pitchen 2015-12-17  925  	size_t datalen;
5f5295e65a5cd9 Tudor Ambarus   2019-12-05  926  	u32 ctr;
5f5295e65a5cd9 Tudor Ambarus   2019-12-05  927  	u16 blocks, start, end;
                                                        ^^^^^^^^^^

fcac83656a3e3b Cyrille Pitchen 2015-12-17  928  	bool use_dma, fragmented =
=3D false;
fcac83656a3e3b Cyrille Pitchen 2015-12-17  929  =

fcac83656a3e3b Cyrille Pitchen 2015-12-17  930  	/* Check for transfer comp=
letion. */
fcac83656a3e3b Cyrille Pitchen 2015-12-17  931  	ctx->offset +=3D dd->total;
fcac83656a3e3b Cyrille Pitchen 2015-12-17  932  	if (ctx->offset >=3D req->=
nbytes)
fcac83656a3e3b Cyrille Pitchen 2015-12-17  933  		return atmel_aes_transfer=
_complete(dd);
fcac83656a3e3b Cyrille Pitchen 2015-12-17  934  =

fcac83656a3e3b Cyrille Pitchen 2015-12-17  935  	/* Compute data length. */
fcac83656a3e3b Cyrille Pitchen 2015-12-17  936  	datalen =3D req->nbytes - =
ctx->offset;
fcac83656a3e3b Cyrille Pitchen 2015-12-17  937  	blocks =3D DIV_ROUND_UP(da=
talen, AES_BLOCK_SIZE);
fcac83656a3e3b Cyrille Pitchen 2015-12-17  938  	ctr =3D be32_to_cpu(ctx->i=
v[3]);
5f5295e65a5cd9 Tudor Ambarus   2019-12-05  939  =

fcac83656a3e3b Cyrille Pitchen 2015-12-17  940  	/* Check 16bit counter ove=
rflow. */
5f5295e65a5cd9 Tudor Ambarus   2019-12-05  941  	start =3D ctr & 0xffff;
5f5295e65a5cd9 Tudor Ambarus   2019-12-05  942  	end =3D start + blocks - 1;
fcac83656a3e3b Cyrille Pitchen 2015-12-17  943  =

fcac83656a3e3b Cyrille Pitchen 2015-12-17 @944  	if (blocks >> 16 || end < =
start) {
                                                            ^^^^^^^^^^^^
This is always non-zero.

fcac83656a3e3b Cyrille Pitchen 2015-12-17  945  		ctr |=3D 0xffff;
fcac83656a3e3b Cyrille Pitchen 2015-12-17  946  		datalen =3D AES_BLOCK_SIZ=
E * (0x10000 - start);
fcac83656a3e3b Cyrille Pitchen 2015-12-17  947  		fragmented =3D true;
fcac83656a3e3b Cyrille Pitchen 2015-12-17  948  	}
5f5295e65a5cd9 Tudor Ambarus   2019-12-05  949  =

fcac83656a3e3b Cyrille Pitchen 2015-12-17  950  	use_dma =3D (datalen >=3D =
ATMEL_AES_DMA_THRESHOLD);
fcac83656a3e3b Cyrille Pitchen 2015-12-17  951  =

fcac83656a3e3b Cyrille Pitchen 2015-12-17  952  	/* Jump to offset. */
fcac83656a3e3b Cyrille Pitchen 2015-12-17  953  	src =3D scatterwalk_ffwd(c=
tx->src, req->src, ctx->offset);
fcac83656a3e3b Cyrille Pitchen 2015-12-17  954  	dst =3D ((req->src =3D=3D =
req->dst) ? src :
fcac83656a3e3b Cyrille Pitchen 2015-12-17  955  	       scatterwalk_ffwd(ct=
x->dst, req->dst, ctx->offset));
fcac83656a3e3b Cyrille Pitchen 2015-12-17  956  =

fcac83656a3e3b Cyrille Pitchen 2015-12-17  957  	/* Configure hardware. */
fcac83656a3e3b Cyrille Pitchen 2015-12-17  958  	atmel_aes_write_ctrl(dd, u=
se_dma, ctx->iv);
fcac83656a3e3b Cyrille Pitchen 2015-12-17  959  	if (unlikely(fragmented)) {
fcac83656a3e3b Cyrille Pitchen 2015-12-17  960  		/*
fcac83656a3e3b Cyrille Pitchen 2015-12-17  961  		 * Increment the counter =
manually to cope with the hardware
fcac83656a3e3b Cyrille Pitchen 2015-12-17  962  		 * counter overflow.
fcac83656a3e3b Cyrille Pitchen 2015-12-17  963  		 */
fcac83656a3e3b Cyrille Pitchen 2015-12-17  964  		ctx->iv[3] =3D cpu_to_be3=
2(ctr);
fcac83656a3e3b Cyrille Pitchen 2015-12-17  965  		crypto_inc((u8 *)ctx->iv,=
 AES_BLOCK_SIZE);
fcac83656a3e3b Cyrille Pitchen 2015-12-17  966  	}
fcac83656a3e3b Cyrille Pitchen 2015-12-17  967  =

fcac83656a3e3b Cyrille Pitchen 2015-12-17  968  	if (use_dma)
fcac83656a3e3b Cyrille Pitchen 2015-12-17  969  		return atmel_aes_dma_star=
t(dd, src, dst, datalen,
fcac83656a3e3b Cyrille Pitchen 2015-12-17  970  					   atmel_aes_ctr_trans=
fer);
fcac83656a3e3b Cyrille Pitchen 2015-12-17  971  =

fcac83656a3e3b Cyrille Pitchen 2015-12-17  972  	return atmel_aes_cpu_start=
(dd, src, dst, datalen,
fcac83656a3e3b Cyrille Pitchen 2015-12-17  973  				   atmel_aes_ctr_transf=
er);
fcac83656a3e3b Cyrille Pitchen 2015-12-17  974  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5734235323741407840==--

