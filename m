Content-Type: multipart/mixed; boundary="===============7699691001138890880=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/crypto/stm32/stm32-cryp.c:1057:17: warning: dereference of NULL '*cryp.areq' [CWE-476]
Date: Fri, 17 Jun 2022 20:17:32 +0800
Message-ID: <202206172043.tO1UzqFb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7699691001138890880==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/c=
rypto/stm32/stm32-cryp.c:1057:17: warning: dereference of NULL '*cryp.areq'=
 [CWE-476] [-Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   47700948a4abb4a5ae13ef943ff682a7f327547a
commit: 4b898d5cfa4d9a0ad5bc82cb5eafdc092394c6a9 crypto: stm32/cryp - fix b=
ugs and crash in tests
date:   6 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20220616 (https://download.01.org/0day-ci/archi=
ve/20220617/202206172043.tO1UzqFb-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D4b898d5cfa4d9a0ad5bc82cb5eafdc092394c6a9
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4b898d5cfa4d9a0ad5bc82cb5eafdc092394c6a9
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/crypto/stm32/stm32-cryp.c: In function 'stm32_cryp_prepare_req':
>> drivers/crypto/stm32/stm32-cryp.c:1057:17: warning: dereference of NULL =
'*cryp.areq' [CWE-476] [-Wanalyzer-null-dereference]
    1057 |                 scatterwalk_copychunks(NULL, &cryp->out_walk, cr=
yp->areq->assoclen, 2);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~
     'stm32_cryp_prepare_req': events 1-3
       |
       |  999 |         if (!cryp)
       |      |            ^
       |      |            |
       |      |            (1) following 'false' branch (when 'cryp' is non=
-NULL)...
       |......
       | 1002 |         rctx =3D req ? skcipher_request_ctx(req) : aead_req=
uest_ctx(areq);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
       |      |              |
       |      |              (2) ...to here
       |      |              (3) following 'true' branch (when 'req' is non=
-NULL)...
       |
     'stm32_cryp_prepare_req': event 4
       |
       |include/crypto/internal/skcipher.h:156:16:
       |  156 |         return req->__ctx;
       |      |                ^~~
       |      |                |
       |      |                (4) ...to here
       |
     'stm32_cryp_prepare_req': events 5-6
       |
       |drivers/crypto/stm32/stm32-cryp.c:1011:12:
       | 1011 |         if (req) {
       |      |            ^
       |      |            |
       |      |            (5) following 'true' branch (when 'req' is non-N=
ULL)...
       | 1012 |                 cryp->req =3D req;
       |      |                 ~~~~~~~~~~~~~~~
       |      |                           |
       |      |                           (6) ...to here
       |
     'stm32_cryp_prepare_req': events 7-13
       |
       | 1013 |                 cryp->areq =3D NULL;
       |......
       | 1049 |         in_sg =3D req ? req->src : areq->src;
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                                |
       |      |                                (8) following 'true' branch =
(when 'req' is non-NULL)...
       |      |                                (9) ...to here
       |......
       | 1052 |         cryp->out_sg =3D req ? req->dst : areq->dst;
       |      |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                                       |
       |      |                                       (10) following 'true'=
 branch (when 'req' is non-NULL)...
       |      |                                       (11) ...to here
       |......
       | 1057 |                 scatterwalk_copychunks(NULL, &cryp->out_wal=
k, cryp->areq->assoclen, 2);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |                                          =
       |
       |      |                 (13) dereference of NULL '*cryp.areq'      =
       (12) '*cryp.areq' is NULL
       |

vim +1057 drivers/crypto/stm32/stm32-cryp.c

9e054ec21ef834 Fabien DESSENNE    2017-10-19   981  =

47ece4813f19f1 Ard Biesheuvel     2019-11-09   982  static int stm32_cryp_p=
repare_req(struct skcipher_request *req,
9d3b5030bc1e44 Fabien DESSENNE    2018-02-07   983  				  struct aead_reque=
st *areq)
9e054ec21ef834 Fabien DESSENNE    2017-10-19   984  {
9e054ec21ef834 Fabien DESSENNE    2017-10-19   985  	struct stm32_cryp_ctx =
*ctx;
9e054ec21ef834 Fabien DESSENNE    2017-10-19   986  	struct stm32_cryp *cry=
p;
9e054ec21ef834 Fabien DESSENNE    2017-10-19   987  	struct stm32_cryp_reqc=
tx *rctx;
4b898d5cfa4d9a Nicolas Toromanoff 2021-11-30   988  	struct scatterlist *in=
_sg;
9e054ec21ef834 Fabien DESSENNE    2017-10-19   989  	int ret;
9e054ec21ef834 Fabien DESSENNE    2017-10-19   990  =

9d3b5030bc1e44 Fabien DESSENNE    2018-02-07   991  	if (!req && !areq)
9e054ec21ef834 Fabien DESSENNE    2017-10-19   992  		return -EINVAL;
9e054ec21ef834 Fabien DESSENNE    2017-10-19   993  =

47ece4813f19f1 Ard Biesheuvel     2019-11-09   994  	ctx =3D req ? crypto_s=
kcipher_ctx(crypto_skcipher_reqtfm(req)) :
9d3b5030bc1e44 Fabien DESSENNE    2018-02-07   995  		    crypto_aead_ctx(c=
rypto_aead_reqtfm(areq));
9e054ec21ef834 Fabien DESSENNE    2017-10-19   996  =

9e054ec21ef834 Fabien DESSENNE    2017-10-19   997  	cryp =3D ctx->cryp;
9e054ec21ef834 Fabien DESSENNE    2017-10-19   998  =

9e054ec21ef834 Fabien DESSENNE    2017-10-19   999  	if (!cryp)
9e054ec21ef834 Fabien DESSENNE    2017-10-19  1000  		return -ENODEV;
9e054ec21ef834 Fabien DESSENNE    2017-10-19  1001  =

47ece4813f19f1 Ard Biesheuvel     2019-11-09  1002  	rctx =3D req ? skciphe=
r_request_ctx(req) : aead_request_ctx(areq);
9e054ec21ef834 Fabien DESSENNE    2017-10-19  1003  	rctx->mode &=3D FLG_MO=
DE_MASK;
9e054ec21ef834 Fabien DESSENNE    2017-10-19  1004  =

9e054ec21ef834 Fabien DESSENNE    2017-10-19  1005  	ctx->cryp =3D cryp;
9e054ec21ef834 Fabien DESSENNE    2017-10-19  1006  =

9e054ec21ef834 Fabien DESSENNE    2017-10-19  1007  	cryp->flags =3D (cryp-=
>flags & ~FLG_MODE_MASK) | rctx->mode;
9e054ec21ef834 Fabien DESSENNE    2017-10-19  1008  	cryp->hw_blocksize =3D=
 is_aes(cryp) ? AES_BLOCK_SIZE : DES_BLOCK_SIZE;
9e054ec21ef834 Fabien DESSENNE    2017-10-19  1009  	cryp->ctx =3D ctx;
9e054ec21ef834 Fabien DESSENNE    2017-10-19  1010  =

9d3b5030bc1e44 Fabien DESSENNE    2018-02-07  1011  	if (req) {
9e054ec21ef834 Fabien DESSENNE    2017-10-19  1012  		cryp->req =3D req;
29aed438e87020 Lionel Debieve     2019-04-24  1013  		cryp->areq =3D NULL;
4b898d5cfa4d9a Nicolas Toromanoff 2021-11-30  1014  		cryp->header_in =3D 0;
4b898d5cfa4d9a Nicolas Toromanoff 2021-11-30  1015  		cryp->payload_in =3D =
req->cryptlen;
4b898d5cfa4d9a Nicolas Toromanoff 2021-11-30  1016  		cryp->payload_out =3D=
 req->cryptlen;
4b898d5cfa4d9a Nicolas Toromanoff 2021-11-30  1017  		cryp->authsize =3D 0;
9d3b5030bc1e44 Fabien DESSENNE    2018-02-07  1018  	} else {
9d3b5030bc1e44 Fabien DESSENNE    2018-02-07  1019  		/*
9d3b5030bc1e44 Fabien DESSENNE    2018-02-07  1020  		 * Length of input an=
d output data:
9d3b5030bc1e44 Fabien DESSENNE    2018-02-07  1021  		 * Encryption case:
9d3b5030bc1e44 Fabien DESSENNE    2018-02-07  1022  		 *  INPUT  =3D AssocD=
ata   ||     PlainText
9d3b5030bc1e44 Fabien DESSENNE    2018-02-07  1023  		 *          <- assocl=
en ->  <- cryptlen ->
9d3b5030bc1e44 Fabien DESSENNE    2018-02-07  1024  		 *
9d3b5030bc1e44 Fabien DESSENNE    2018-02-07  1025  		 *  OUTPUT =3D AssocD=
ata    ||   CipherText   ||      AuthTag
4b898d5cfa4d9a Nicolas Toromanoff 2021-11-30  1026  		 *          <- assocl=
en ->  <-- cryptlen -->  <- authsize ->
9d3b5030bc1e44 Fabien DESSENNE    2018-02-07  1027  		 *
9d3b5030bc1e44 Fabien DESSENNE    2018-02-07  1028  		 * Decryption case:
4b898d5cfa4d9a Nicolas Toromanoff 2021-11-30  1029  		 *  INPUT  =3D  Assoc=
Data     ||    CipherTex   ||       AuthTag
4b898d5cfa4d9a Nicolas Toromanoff 2021-11-30  1030  		 *          <- assocl=
en --->  <---------- cryptlen ---------->
9d3b5030bc1e44 Fabien DESSENNE    2018-02-07  1031  		 *
9d3b5030bc1e44 Fabien DESSENNE    2018-02-07  1032  		 *  OUTPUT =3D AssocD=
ata    ||               PlainText
4b898d5cfa4d9a Nicolas Toromanoff 2021-11-30  1033  		 *          <- assocl=
en ->  <- cryptlen - authsize ->
9d3b5030bc1e44 Fabien DESSENNE    2018-02-07  1034  		 */
9d3b5030bc1e44 Fabien DESSENNE    2018-02-07  1035  		cryp->areq =3D areq;
29aed438e87020 Lionel Debieve     2019-04-24  1036  		cryp->req =3D NULL;
9d3b5030bc1e44 Fabien DESSENNE    2018-02-07  1037  		cryp->authsize =3D cr=
ypto_aead_authsize(crypto_aead_reqtfm(areq));
4b898d5cfa4d9a Nicolas Toromanoff 2021-11-30  1038  		if (is_encrypt(cryp))=
 {
4b898d5cfa4d9a Nicolas Toromanoff 2021-11-30  1039  			cryp->payload_in =3D=
 areq->cryptlen;
4b898d5cfa4d9a Nicolas Toromanoff 2021-11-30  1040  			cryp->header_in =3D =
areq->assoclen;
4b898d5cfa4d9a Nicolas Toromanoff 2021-11-30  1041  			cryp->payload_out =
=3D areq->cryptlen;
4b898d5cfa4d9a Nicolas Toromanoff 2021-11-30  1042  		} else {
4b898d5cfa4d9a Nicolas Toromanoff 2021-11-30  1043  			cryp->payload_in =3D=
 areq->cryptlen - cryp->authsize;
4b898d5cfa4d9a Nicolas Toromanoff 2021-11-30  1044  			cryp->header_in =3D =
areq->assoclen;
4b898d5cfa4d9a Nicolas Toromanoff 2021-11-30  1045  			cryp->payload_out =
=3D cryp->payload_in;
9d3b5030bc1e44 Fabien DESSENNE    2018-02-07  1046  		}
9e054ec21ef834 Fabien DESSENNE    2017-10-19  1047  	}
9e054ec21ef834 Fabien DESSENNE    2017-10-19  1048  =

4b898d5cfa4d9a Nicolas Toromanoff 2021-11-30  1049  	in_sg =3D req ? req->s=
rc : areq->src;
4b898d5cfa4d9a Nicolas Toromanoff 2021-11-30  1050  	scatterwalk_start(&cry=
p->in_walk, in_sg);
9e054ec21ef834 Fabien DESSENNE    2017-10-19  1051  =

4b898d5cfa4d9a Nicolas Toromanoff 2021-11-30  1052  	cryp->out_sg =3D req ?=
 req->dst : areq->dst;
9e054ec21ef834 Fabien DESSENNE    2017-10-19  1053  	scatterwalk_start(&cry=
p->out_walk, cryp->out_sg);
9e054ec21ef834 Fabien DESSENNE    2017-10-19  1054  =

9d3b5030bc1e44 Fabien DESSENNE    2018-02-07  1055  	if (is_gcm(cryp) || is=
_ccm(cryp)) {
9d3b5030bc1e44 Fabien DESSENNE    2018-02-07  1056  		/* In output, jump af=
ter assoc data */
4b898d5cfa4d9a Nicolas Toromanoff 2021-11-30 @1057  		scatterwalk_copychunk=
s(NULL, &cryp->out_walk, cryp->areq->assoclen, 2);
9d3b5030bc1e44 Fabien DESSENNE    2018-02-07  1058  	}
9d3b5030bc1e44 Fabien DESSENNE    2018-02-07  1059  =

4b898d5cfa4d9a Nicolas Toromanoff 2021-11-30  1060  	if (is_ctr(cryp))
4b898d5cfa4d9a Nicolas Toromanoff 2021-11-30  1061  		memset(cryp->last_ctr=
, 0, sizeof(cryp->last_ctr));
4b898d5cfa4d9a Nicolas Toromanoff 2021-11-30  1062  =

9e054ec21ef834 Fabien DESSENNE    2017-10-19  1063  	ret =3D stm32_cryp_hw_=
init(cryp);
9e054ec21ef834 Fabien DESSENNE    2017-10-19  1064  	return ret;
9e054ec21ef834 Fabien DESSENNE    2017-10-19  1065  }
9e054ec21ef834 Fabien DESSENNE    2017-10-19  1066  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7699691001138890880==--

