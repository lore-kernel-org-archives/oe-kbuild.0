Content-Type: multipart/mixed; boundary="===============8642341905708721959=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/2] crypto: mtk-eip93 - Add Mediatek EIP-93 crypto engine
Date: Sun, 28 Nov 2021 08:44:33 +0800
Message-ID: <202111280816.KZjyej3t-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8642341905708721959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211027091329.3093641-3-vschagen@icloud.com>
References: <20211027091329.3093641-3-vschagen@icloud.com>
TO: Richard van Schagen <vschagen@icloud.com>
TO: herbert(a)gondor.apana.org.au
TO: davem(a)davemloft.net
TO: matthias.bgg(a)gmail.com
TO: robh+dt(a)kernel.org
CC: linux-crypto(a)vger.kernel.org
CC: Richard van Schagen <vschagen@icloud.com>

Hi Richard,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master robh/for-next v5.16-r=
c2 next-20211126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Richard-van-Schagen/Enable=
-the-Mediatek-EIP-93-crypto-engine/20211027-171429
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2=
.6.git master
:::::: branch date: 5 weeks ago
:::::: commit date: 5 weeks ago
config: powerpc-randconfig-m031-20211101 (https://download.01.org/0day-ci/a=
rchive/20211128/202111280816.KZjyej3t-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/crypto/mtk-eip93/eip93-aead.c:107 mtk_aead_cra_init() error: uninit=
ialized symbol 'alg_base'.
drivers/crypto/mtk-eip93/eip93-aead.c:175 mtk_aead_setkey() error: uninitia=
lized symbol 'err'.

Old smatch warnings:
drivers/crypto/mtk-eip93/eip93-aead.c:209 mtk_aead_setkey() error: uninitia=
lized symbol 'err'.

vim +/alg_base +107 drivers/crypto/mtk-eip93/eip93-aead.c

b4ea2578718d77 Richard van Schagen 2021-10-27   63  =

b4ea2578718d77 Richard van Schagen 2021-10-27   64  /* Crypto aead API func=
tions */
b4ea2578718d77 Richard van Schagen 2021-10-27   65  static int mtk_aead_cra=
_init(struct crypto_tfm *tfm)
b4ea2578718d77 Richard van Schagen 2021-10-27   66  {
b4ea2578718d77 Richard van Schagen 2021-10-27   67  	struct mtk_crypto_ctx =
*ctx =3D crypto_tfm_ctx(tfm);
b4ea2578718d77 Richard van Schagen 2021-10-27   68  	struct mtk_alg_templat=
e *tmpl =3D container_of(tfm->__crt_alg,
b4ea2578718d77 Richard van Schagen 2021-10-27   69  				struct mtk_alg_temp=
late, alg.aead.base);
b4ea2578718d77 Richard van Schagen 2021-10-27   70  	u32 flags =3D tmpl->fl=
ags;
b4ea2578718d77 Richard van Schagen 2021-10-27   71  	char *alg_base;
b4ea2578718d77 Richard van Schagen 2021-10-27   72  =

b4ea2578718d77 Richard van Schagen 2021-10-27   73  	memset(ctx, 0, sizeof(=
*ctx));
b4ea2578718d77 Richard van Schagen 2021-10-27   74  =

b4ea2578718d77 Richard van Schagen 2021-10-27   75  	crypto_aead_set_reqsiz=
e(__crypto_aead_cast(tfm),
b4ea2578718d77 Richard van Schagen 2021-10-27   76  			sizeof(struct mtk_ci=
pher_reqctx));
b4ea2578718d77 Richard van Schagen 2021-10-27   77  =

b4ea2578718d77 Richard van Schagen 2021-10-27   78  	ctx->mtk =3D tmpl->mtk;
b4ea2578718d77 Richard van Schagen 2021-10-27   79  	ctx->type =3D tmpl->ty=
pe;
b4ea2578718d77 Richard van Schagen 2021-10-27   80  	ctx->in_first =3D true;
b4ea2578718d77 Richard van Schagen 2021-10-27   81  	ctx->out_first =3D tru=
e;
b4ea2578718d77 Richard van Schagen 2021-10-27   82  =

b4ea2578718d77 Richard van Schagen 2021-10-27   83  	ctx->sa_in =3D kzalloc=
(sizeof(struct saRecord_s), GFP_KERNEL);
b4ea2578718d77 Richard van Schagen 2021-10-27   84  	if (!ctx->sa_in)
b4ea2578718d77 Richard van Schagen 2021-10-27   85  		return -ENOMEM;
b4ea2578718d77 Richard van Schagen 2021-10-27   86  =

b4ea2578718d77 Richard van Schagen 2021-10-27   87  	ctx->sa_base_in =3D dm=
a_map_single(ctx->mtk->dev, ctx->sa_in,
b4ea2578718d77 Richard van Schagen 2021-10-27   88  				sizeof(struct saRec=
ord_s), DMA_TO_DEVICE);
b4ea2578718d77 Richard van Schagen 2021-10-27   89  =

b4ea2578718d77 Richard van Schagen 2021-10-27   90  	ctx->sa_out =3D kzallo=
c(sizeof(struct saRecord_s), GFP_KERNEL);
b4ea2578718d77 Richard van Schagen 2021-10-27   91  	if (!ctx->sa_out)
b4ea2578718d77 Richard van Schagen 2021-10-27   92  		return -ENOMEM;
b4ea2578718d77 Richard van Schagen 2021-10-27   93  =

b4ea2578718d77 Richard van Schagen 2021-10-27   94  	ctx->sa_base_out =3D d=
ma_map_single(ctx->mtk->dev, ctx->sa_out,
b4ea2578718d77 Richard van Schagen 2021-10-27   95  				sizeof(struct saRec=
ord_s), DMA_TO_DEVICE);
b4ea2578718d77 Richard van Schagen 2021-10-27   96  =

b4ea2578718d77 Richard van Schagen 2021-10-27   97  	/* software workaround=
 for now */
b4ea2578718d77 Richard van Schagen 2021-10-27   98  	if (IS_HASH_MD5(flags))
b4ea2578718d77 Richard van Schagen 2021-10-27   99  		alg_base =3D "md5";
b4ea2578718d77 Richard van Schagen 2021-10-27  100  	if (IS_HASH_SHA1(flags=
))
b4ea2578718d77 Richard van Schagen 2021-10-27  101  		alg_base =3D "sha1";
b4ea2578718d77 Richard van Schagen 2021-10-27  102  	if (IS_HASH_SHA224(fla=
gs))
b4ea2578718d77 Richard van Schagen 2021-10-27  103  		alg_base =3D "sha224";
b4ea2578718d77 Richard van Schagen 2021-10-27  104  	if (IS_HASH_SHA256(fla=
gs))
b4ea2578718d77 Richard van Schagen 2021-10-27  105  		alg_base =3D "sha256";
b4ea2578718d77 Richard van Schagen 2021-10-27  106  =

b4ea2578718d77 Richard van Schagen 2021-10-27 @107  	ctx->shash =3D crypto_=
alloc_shash(alg_base, 0, CRYPTO_ALG_NEED_FALLBACK);
b4ea2578718d77 Richard van Schagen 2021-10-27  108  =

b4ea2578718d77 Richard van Schagen 2021-10-27  109  	if (IS_ERR(ctx->shash)=
) {
b4ea2578718d77 Richard van Schagen 2021-10-27  110  		dev_err(ctx->mtk->dev=
, "base driver %s could not be loaded.\n",
b4ea2578718d77 Richard van Schagen 2021-10-27  111  				alg_base);
b4ea2578718d77 Richard van Schagen 2021-10-27  112  		return PTR_ERR(ctx->s=
hash);
b4ea2578718d77 Richard van Schagen 2021-10-27  113  	}
b4ea2578718d77 Richard van Schagen 2021-10-27  114  =

b4ea2578718d77 Richard van Schagen 2021-10-27  115  	return 0;
b4ea2578718d77 Richard van Schagen 2021-10-27  116  }
b4ea2578718d77 Richard van Schagen 2021-10-27  117  =

b4ea2578718d77 Richard van Schagen 2021-10-27  118  static void mtk_aead_cr=
a_exit(struct crypto_tfm *tfm)
b4ea2578718d77 Richard van Schagen 2021-10-27  119  {
b4ea2578718d77 Richard van Schagen 2021-10-27  120  	struct mtk_crypto_ctx =
*ctx =3D crypto_tfm_ctx(tfm);
b4ea2578718d77 Richard van Schagen 2021-10-27  121  =

b4ea2578718d77 Richard van Schagen 2021-10-27  122  	if (ctx->shash)
b4ea2578718d77 Richard van Schagen 2021-10-27  123  		crypto_free_shash(ctx=
->shash);
b4ea2578718d77 Richard van Schagen 2021-10-27  124  =

b4ea2578718d77 Richard van Schagen 2021-10-27  125  	dma_unmap_single(ctx->=
mtk->dev, ctx->sa_base_in,
b4ea2578718d77 Richard van Schagen 2021-10-27  126  			sizeof(struct saReco=
rd_s), DMA_TO_DEVICE);
b4ea2578718d77 Richard van Schagen 2021-10-27  127  	dma_unmap_single(ctx->=
mtk->dev, ctx->sa_base_out,
b4ea2578718d77 Richard van Schagen 2021-10-27  128  			sizeof(struct saReco=
rd_s), DMA_TO_DEVICE);
b4ea2578718d77 Richard van Schagen 2021-10-27  129  	kfree(ctx->sa_in);
b4ea2578718d77 Richard van Schagen 2021-10-27  130  	kfree(ctx->sa_out);
b4ea2578718d77 Richard van Schagen 2021-10-27  131  }
b4ea2578718d77 Richard van Schagen 2021-10-27  132  =

b4ea2578718d77 Richard van Schagen 2021-10-27  133  static int mtk_aead_set=
key(struct crypto_aead *ctfm, const u8 *key,
b4ea2578718d77 Richard van Schagen 2021-10-27  134  			unsigned int len)
b4ea2578718d77 Richard van Schagen 2021-10-27  135  {
b4ea2578718d77 Richard van Schagen 2021-10-27  136  	struct crypto_tfm *tfm=
 =3D crypto_aead_tfm(ctfm);
b4ea2578718d77 Richard van Schagen 2021-10-27  137  	struct mtk_crypto_ctx =
*ctx =3D crypto_tfm_ctx(tfm);
b4ea2578718d77 Richard van Schagen 2021-10-27  138  	struct mtk_alg_templat=
e *tmpl =3D container_of(tfm->__crt_alg,
b4ea2578718d77 Richard van Schagen 2021-10-27  139  				struct mtk_alg_temp=
late, alg.skcipher.base);
b4ea2578718d77 Richard van Schagen 2021-10-27  140  	u32 flags =3D tmpl->fl=
ags;
b4ea2578718d77 Richard van Schagen 2021-10-27  141  	struct crypto_authenc_=
keys keys;
b4ea2578718d77 Richard van Schagen 2021-10-27  142  	struct crypto_aes_ctx =
aes;
b4ea2578718d77 Richard van Schagen 2021-10-27  143  	struct saRecord_s *saR=
ecord =3D ctx->sa_out;
b4ea2578718d77 Richard van Schagen 2021-10-27  144  	int sa_size =3D sizeof=
(struct saRecord_s);
b4ea2578718d77 Richard van Schagen 2021-10-27  145  	int err;
b4ea2578718d77 Richard van Schagen 2021-10-27  146  	u32 nonce =3D 0;
b4ea2578718d77 Richard van Schagen 2021-10-27  147  =

b4ea2578718d77 Richard van Schagen 2021-10-27  148  	if (crypto_authenc_ext=
ractkeys(&keys, key, len))
b4ea2578718d77 Richard van Schagen 2021-10-27  149  		return -EINVAL;
b4ea2578718d77 Richard van Schagen 2021-10-27  150  =

b4ea2578718d77 Richard van Schagen 2021-10-27  151  	if (IS_RFC3686(flags))=
 {
b4ea2578718d77 Richard van Schagen 2021-10-27  152  		if (keys.enckeylen < =
CTR_RFC3686_NONCE_SIZE)
b4ea2578718d77 Richard van Schagen 2021-10-27  153  			goto badkey;
b4ea2578718d77 Richard van Schagen 2021-10-27  154  =

b4ea2578718d77 Richard van Schagen 2021-10-27  155  		keys.enckeylen -=3D C=
TR_RFC3686_NONCE_SIZE;
b4ea2578718d77 Richard van Schagen 2021-10-27  156  		memcpy(&nonce, keys.e=
nckey + keys.enckeylen,
b4ea2578718d77 Richard van Schagen 2021-10-27  157  						CTR_RFC3686_NONCE=
_SIZE);
b4ea2578718d77 Richard van Schagen 2021-10-27  158  	}
b4ea2578718d77 Richard van Schagen 2021-10-27  159  =

b4ea2578718d77 Richard van Schagen 2021-10-27  160  	switch ((flags & MTK_A=
LG_MASK)) {
b4ea2578718d77 Richard van Schagen 2021-10-27  161  #ifdef CONFIG_CRYPTO_DE=
V_EIP93_DES
b4ea2578718d77 Richard van Schagen 2021-10-27  162  	case MTK_ALG_DES:
b4ea2578718d77 Richard van Schagen 2021-10-27  163  		err =3D verify_aead_d=
es_key(ctfm, keys.enckey, keys.enckeylen);
b4ea2578718d77 Richard van Schagen 2021-10-27  164  		break;
b4ea2578718d77 Richard van Schagen 2021-10-27  165  	case MTK_ALG_3DES:
b4ea2578718d77 Richard van Schagen 2021-10-27  166  		if (keys.enckeylen !=
=3D DES3_EDE_KEY_SIZE)
b4ea2578718d77 Richard van Schagen 2021-10-27  167  			return -EINVAL;
b4ea2578718d77 Richard van Schagen 2021-10-27  168  =

b4ea2578718d77 Richard van Schagen 2021-10-27  169  		err =3D verify_aead_d=
es3_key(ctfm, keys.enckey, keys.enckeylen);
b4ea2578718d77 Richard van Schagen 2021-10-27  170  		break;
b4ea2578718d77 Richard van Schagen 2021-10-27  171  #endif
b4ea2578718d77 Richard van Schagen 2021-10-27  172  	case MTK_ALG_AES:
b4ea2578718d77 Richard van Schagen 2021-10-27  173  		err =3D aes_expandkey=
(&aes, keys.enckey, keys.enckeylen);
b4ea2578718d77 Richard van Schagen 2021-10-27  174  	}
b4ea2578718d77 Richard van Schagen 2021-10-27 @175  	if (err)
b4ea2578718d77 Richard van Schagen 2021-10-27  176  		goto badkey;
b4ea2578718d77 Richard van Schagen 2021-10-27  177  =

b4ea2578718d77 Richard van Schagen 2021-10-27  178  	ctx->blksize =3D crypt=
o_aead_blocksize(ctfm);
b4ea2578718d77 Richard van Schagen 2021-10-27  179  	dma_unmap_single(ctx->=
mtk->dev, ctx->sa_base_in, sa_size,
b4ea2578718d77 Richard van Schagen 2021-10-27  180  								DMA_TO_DEVICE);
b4ea2578718d77 Richard van Schagen 2021-10-27  181  =

b4ea2578718d77 Richard van Schagen 2021-10-27  182  	dma_unmap_single(ctx->=
mtk->dev, ctx->sa_base_out, sa_size,
b4ea2578718d77 Richard van Schagen 2021-10-27  183  								DMA_TO_DEVICE);
b4ea2578718d77 Richard van Schagen 2021-10-27  184  	/* Encryption key */
b4ea2578718d77 Richard van Schagen 2021-10-27  185  	mtk_set_saRecord(saRec=
ord, keys.enckeylen, flags);
b4ea2578718d77 Richard van Schagen 2021-10-27  186  	saRecord->saCmd0.bits.=
opCode =3D 1;
b4ea2578718d77 Richard van Schagen 2021-10-27  187  	saRecord->saCmd0.bits.=
digestLength =3D ctx->authsize >> 2;
b4ea2578718d77 Richard van Schagen 2021-10-27  188  =

b4ea2578718d77 Richard van Schagen 2021-10-27  189  	memcpy(saRecord->saKey=
, keys.enckey, keys.enckeylen);
b4ea2578718d77 Richard van Schagen 2021-10-27  190  	ctx->saNonce =3D nonce;
b4ea2578718d77 Richard van Schagen 2021-10-27  191  	saRecord->saNonce =3D =
nonce;
b4ea2578718d77 Richard van Schagen 2021-10-27  192  =

b4ea2578718d77 Richard van Schagen 2021-10-27  193  	/* authentication key =
*/
b4ea2578718d77 Richard van Schagen 2021-10-27  194  	err =3D mtk_authenc_se=
tkey(ctx->shash, saRecord, keys.authkey,
b4ea2578718d77 Richard van Schagen 2021-10-27  195  							keys.authkeylen);
b4ea2578718d77 Richard van Schagen 2021-10-27  196  =

b4ea2578718d77 Richard van Schagen 2021-10-27  197  	saRecord->saCmd0.bits.=
direction =3D 0;
b4ea2578718d77 Richard van Schagen 2021-10-27  198  	memcpy(ctx->sa_in, saR=
ecord, sa_size);
b4ea2578718d77 Richard van Schagen 2021-10-27  199  	ctx->sa_in->saCmd0.bit=
s.direction =3D 1;
b4ea2578718d77 Richard van Schagen 2021-10-27  200  	ctx->sa_in->saCmd1.bit=
s.copyDigest =3D 0;
b4ea2578718d77 Richard van Schagen 2021-10-27  201  =

b4ea2578718d77 Richard van Schagen 2021-10-27  202  	ctx->sa_base_out =3D d=
ma_map_single(ctx->mtk->dev, ctx->sa_out, sa_size,
b4ea2578718d77 Richard van Schagen 2021-10-27  203  								DMA_TO_DEVICE);
b4ea2578718d77 Richard van Schagen 2021-10-27  204  	ctx->sa_base_in =3D dm=
a_map_single(ctx->mtk->dev, ctx->sa_in, sa_size,
b4ea2578718d77 Richard van Schagen 2021-10-27  205  								DMA_TO_DEVICE);
b4ea2578718d77 Richard van Schagen 2021-10-27  206  	ctx->in_first =3D true;
b4ea2578718d77 Richard van Schagen 2021-10-27  207  	ctx->out_first =3D tru=
e;
b4ea2578718d77 Richard van Schagen 2021-10-27  208  badkey:
b4ea2578718d77 Richard van Schagen 2021-10-27  209  	return err;
b4ea2578718d77 Richard van Schagen 2021-10-27  210  }
b4ea2578718d77 Richard van Schagen 2021-10-27  211  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8642341905708721959==--

