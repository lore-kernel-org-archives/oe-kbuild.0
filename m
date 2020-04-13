Content-Type: multipart/mixed; boundary="===============7907170592002255646=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 3/9] crypto: sun8i-ce: split into prepare/run/unprepare
Date: Tue, 14 Apr 2020 06:32:43 +0800
Message-ID: <202004140628.EHDfjVT3%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7907170592002255646==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1586771889-3299-4-git-send-email-clabbe@baylibre.com>
References: <1586771889-3299-4-git-send-email-clabbe@baylibre.com>
TO: Corentin Labbe <clabbe@baylibre.com>
CC: davem(a)davemloft.net, herbert(a)gondor.apana.org.au, mripard(a)kernel.=
org, wens(a)csie.org

Hi Corentin,

I love your patch! Perhaps something to improve:

[auto build test WARNING on cryptodev/master]
[also build test WARNING on crypto/master v5.7-rc1 next-20200413]
[cannot apply to sunxi/sunxi/for-next]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Corentin-Labbe/crypto-sun8=
i-ce-support-TRNG-PRNG-and-hashes/20200413-235954
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2=
.6.git master
reproduce:
        # apt-get install sparse
        # sparse version: =

        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c:277:5: sparse: warni=
ng: symbol 'sun8i_ce_cipher_run' was not declared. Should it be static?
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c:321:25: sparse: warn=
ing: incorrect type in argument 2 (different base types)
>> drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c:321:25: sparse:    e=
xpected unsigned long long [usertype] addr
>> drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c:321:25: sparse:    g=
ot restricted __le32 [usertype] t_iv
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c:334:9: sparse: warni=
ng: incorrect type in argument 2 (different base types)
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c:334:9: sparse:    ex=
pected unsigned long long [usertype] addr
>> drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c:334:9: sparse:    go=
t restricted __le32 [usertype] t_key

# https://github.com/0day-ci/linux/commit/90d7b544421a35ed15f08ef20ad1fbe63=
bbf9f8a
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 90d7b544421a35ed15f08ef20ad1fbe63bbf9f8a
vim +321 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c

06f751b613296c Corentin Labbe 2019-10-23  276  =

90d7b544421a35 Corentin Labbe 2020-04-13 @277  int sun8i_ce_cipher_run(stru=
ct crypto_engine *engine, void *areq)
06f751b613296c Corentin Labbe 2019-10-23  278  {
06f751b613296c Corentin Labbe 2019-10-23  279  	struct skcipher_request *br=
eq =3D container_of(areq, struct skcipher_request, base);
90d7b544421a35 Corentin Labbe 2020-04-13  280  	struct crypto_skcipher *tfm=
 =3D crypto_skcipher_reqtfm(breq);
90d7b544421a35 Corentin Labbe 2020-04-13  281  	struct sun8i_cipher_tfm_ctx=
 *op =3D crypto_skcipher_ctx(tfm);
90d7b544421a35 Corentin Labbe 2020-04-13  282  	struct sun8i_ce_dev *ce =3D=
 op->ce;
90d7b544421a35 Corentin Labbe 2020-04-13  283  	struct sun8i_cipher_req_ctx=
 *rctx =3D skcipher_request_ctx(breq);
90d7b544421a35 Corentin Labbe 2020-04-13  284  	int flow, err;
06f751b613296c Corentin Labbe 2019-10-23  285  =

90d7b544421a35 Corentin Labbe 2020-04-13  286  	flow =3D rctx->flow;
90d7b544421a35 Corentin Labbe 2020-04-13  287  	err =3D sun8i_ce_run_task(c=
e, flow, crypto_tfm_alg_name(breq->base.tfm));
06f751b613296c Corentin Labbe 2019-10-23  288  	crypto_finalize_skcipher_re=
quest(engine, breq, err);
90d7b544421a35 Corentin Labbe 2020-04-13  289  	return 0;
90d7b544421a35 Corentin Labbe 2020-04-13  290  }
90d7b544421a35 Corentin Labbe 2020-04-13  291  =

90d7b544421a35 Corentin Labbe 2020-04-13  292  static int sun8i_ce_cipher_u=
nprepare(struct crypto_engine *engine, void *async_req)
90d7b544421a35 Corentin Labbe 2020-04-13  293  {
90d7b544421a35 Corentin Labbe 2020-04-13  294  	struct skcipher_request *ar=
eq =3D container_of(async_req, struct skcipher_request, base);
90d7b544421a35 Corentin Labbe 2020-04-13  295  	struct crypto_skcipher *tfm=
 =3D crypto_skcipher_reqtfm(areq);
90d7b544421a35 Corentin Labbe 2020-04-13  296  	struct sun8i_cipher_tfm_ctx=
 *op =3D crypto_skcipher_ctx(tfm);
90d7b544421a35 Corentin Labbe 2020-04-13  297  	struct sun8i_ce_dev *ce =3D=
 op->ce;
90d7b544421a35 Corentin Labbe 2020-04-13  298  	struct sun8i_cipher_req_ctx=
 *rctx =3D skcipher_request_ctx(areq);
90d7b544421a35 Corentin Labbe 2020-04-13  299  	struct sun8i_ce_flow *chan;
90d7b544421a35 Corentin Labbe 2020-04-13  300  	struct ce_task *cet;
90d7b544421a35 Corentin Labbe 2020-04-13  301  	unsigned int ivsize, offset;
90d7b544421a35 Corentin Labbe 2020-04-13  302  	int nr_sgs =3D rctx->nr_sgs;
90d7b544421a35 Corentin Labbe 2020-04-13  303  	int nr_sgd =3D rctx->nr_sgd;
90d7b544421a35 Corentin Labbe 2020-04-13  304  	int flow;
90d7b544421a35 Corentin Labbe 2020-04-13  305  =

90d7b544421a35 Corentin Labbe 2020-04-13  306  	flow =3D rctx->flow;
90d7b544421a35 Corentin Labbe 2020-04-13  307  	chan =3D &ce->chanlist[flow=
];
90d7b544421a35 Corentin Labbe 2020-04-13  308  	cet =3D chan->tl;
90d7b544421a35 Corentin Labbe 2020-04-13  309  	ivsize =3D crypto_skcipher_=
ivsize(tfm);
90d7b544421a35 Corentin Labbe 2020-04-13  310  =

90d7b544421a35 Corentin Labbe 2020-04-13  311  	if (areq->src =3D=3D areq->=
dst) {
90d7b544421a35 Corentin Labbe 2020-04-13  312  		dma_unmap_sg(ce->dev, areq=
->src, nr_sgs, DMA_BIDIRECTIONAL);
90d7b544421a35 Corentin Labbe 2020-04-13  313  	} else {
90d7b544421a35 Corentin Labbe 2020-04-13  314  		if (nr_sgs > 0)
90d7b544421a35 Corentin Labbe 2020-04-13  315  			dma_unmap_sg(ce->dev, are=
q->src, nr_sgs, DMA_TO_DEVICE);
90d7b544421a35 Corentin Labbe 2020-04-13  316  		dma_unmap_sg(ce->dev, areq=
->dst, nr_sgd, DMA_FROM_DEVICE);
90d7b544421a35 Corentin Labbe 2020-04-13  317  	}
90d7b544421a35 Corentin Labbe 2020-04-13  318  =

90d7b544421a35 Corentin Labbe 2020-04-13  319  	if (areq->iv && ivsize > 0)=
 {
90d7b544421a35 Corentin Labbe 2020-04-13  320  		if (cet->t_iv)
90d7b544421a35 Corentin Labbe 2020-04-13 @321  			dma_unmap_single(ce->dev,=
 cet->t_iv, rctx->ivlen,
90d7b544421a35 Corentin Labbe 2020-04-13  322  					 DMA_TO_DEVICE);
90d7b544421a35 Corentin Labbe 2020-04-13  323  		offset =3D areq->cryptlen =
- ivsize;
90d7b544421a35 Corentin Labbe 2020-04-13  324  		if (rctx->op_dir & CE_DECR=
YPTION) {
90d7b544421a35 Corentin Labbe 2020-04-13  325  			memcpy(areq->iv, rctx->ba=
ckup_iv, ivsize);
90d7b544421a35 Corentin Labbe 2020-04-13  326  			kzfree(rctx->backup_iv);
90d7b544421a35 Corentin Labbe 2020-04-13  327  		} else {
90d7b544421a35 Corentin Labbe 2020-04-13  328  			scatterwalk_map_and_copy(=
areq->iv, areq->dst, offset,
90d7b544421a35 Corentin Labbe 2020-04-13  329  						 ivsize, 0);
90d7b544421a35 Corentin Labbe 2020-04-13  330  		}
90d7b544421a35 Corentin Labbe 2020-04-13  331  		kfree(rctx->bounce_iv);
90d7b544421a35 Corentin Labbe 2020-04-13  332  	}
90d7b544421a35 Corentin Labbe 2020-04-13  333  =

90d7b544421a35 Corentin Labbe 2020-04-13 @334  	dma_unmap_single(ce->dev, c=
et->t_key, op->keylen, DMA_TO_DEVICE);
06f751b613296c Corentin Labbe 2019-10-23  335  =

06f751b613296c Corentin Labbe 2019-10-23  336  	return 0;
06f751b613296c Corentin Labbe 2019-10-23  337  }
06f751b613296c Corentin Labbe 2019-10-23  338  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7907170592002255646==--

