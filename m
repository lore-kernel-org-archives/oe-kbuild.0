Content-Type: multipart/mixed; boundary="===============4152111022812187132=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [linux-next:master 6959/7905] drivers/crypto/chelsio/chcr_algo.c:2285:4: warning: Argument '(1<<0)|(1<<6)|(15<<2)|(1<<12)|(0<<11)|(1<<10)|((context_size)<<24)' to function htonl is always 83891325 [constArgument]
Date: Sun, 10 May 2020 17:43:06 +0800
Message-ID: <202005101702.PMiYu9fK%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4152111022812187132==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Devulapally Shiva Krishna <shiva@chelsio.com>
CC: Ayush Sawal <ayush.sawal@chelsio.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   30e2206e11ce27ae910cc0dab21472429e400a87
commit: ee91ac1b11e44b38268a2f129c86a8a4ee4c218a [6959/7905] Crypto/chcr: s=
upport for 48 byte key_len in aes-xts
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   drivers/crypto/chelsio/chcr_algo.c:1313:9: warning: Variable 'bytes' is =
reassigned a value before the old one has been used. [redundantAssignment]
     bytes =3D chcr_sg_ent_in_wr(req->src, req->dst, 0,
           ^
   drivers/crypto/chelsio/chcr_algo.c:1306:9: note: bytes is assigned
     bytes =3D IV + req->cryptlen;
           ^
   drivers/crypto/chelsio/chcr_algo.c:1313:9: note: bytes is overwritten
     bytes =3D chcr_sg_ent_in_wr(req->src, req->dst, 0,
           ^
   drivers/crypto/chelsio/chcr_algo.c:1789:8: warning: Redundant initializa=
tion for 'error'. The initialized value is overwritten before it is read. [=
redundantInitialization]
    error =3D chcr_inc_wrcount(dev);
          ^
   drivers/crypto/chelsio/chcr_algo.c:1781:12: note: error is initialized
    int error =3D -EINVAL;
              ^
   drivers/crypto/chelsio/chcr_algo.c:1789:8: note: error is overwritten
    error =3D chcr_inc_wrcount(dev);
          ^
   drivers/crypto/chelsio/chcr_algo.c:1803:22: warning: Variable 'params.op=
ad_needed' is reassigned a value before the old one has been used. [redunda=
ntAssignment]
     params.opad_needed =3D 1;
                        ^
   drivers/crypto/chelsio/chcr_algo.c:1795:22: note: params.opad_needed is =
assigned
     params.opad_needed =3D 1;
                        ^
   drivers/crypto/chelsio/chcr_algo.c:1803:22: note: params.opad_needed is =
overwritten
     params.opad_needed =3D 1;
                        ^
   drivers/crypto/chelsio/chcr_algo.c:2474:8: warning: Redundant initializa=
tion for 'error'. The initialized value is overwritten before it is read. [=
redundantInitialization]
    error =3D chcr_aead_common_init(req);
          ^
   drivers/crypto/chelsio/chcr_algo.c:2462:12: note: error is initialized
    int error =3D -EINVAL;
              ^
   drivers/crypto/chelsio/chcr_algo.c:2474:8: note: error is overwritten
    error =3D chcr_aead_common_init(req);
          ^
   drivers/crypto/chelsio/chcr_algo.c:3036:8: warning: Redundant initializa=
tion for 'error'. The initialized value is overwritten before it is read. [=
redundantInitialization]
    error =3D chcr_aead_common_init(req);
          ^
   drivers/crypto/chelsio/chcr_algo.c:3026:12: note: error is initialized
    int error =3D -EINVAL;
              ^
   drivers/crypto/chelsio/chcr_algo.c:3036:8: note: error is overwritten
    error =3D chcr_aead_common_init(req);
          ^
   drivers/crypto/chelsio/chcr_algo.c:3134:8: warning: Redundant initializa=
tion for 'error'. The initialized value is overwritten before it is read. [=
redundantInitialization]
    error =3D chcr_aead_common_init(req);
          ^
   drivers/crypto/chelsio/chcr_algo.c:3123:12: note: error is initialized
    int error =3D -EINVAL;
              ^
   drivers/crypto/chelsio/chcr_algo.c:3134:8: note: error is overwritten
    error =3D chcr_aead_common_init(req);
          ^
>> drivers/crypto/chelsio/chcr_algo.c:2285:4: warning: Argument '(1<<0)|(1<=
<6)|(15<<2)|(1<<12)|(0<<11)|(1<<10)|((context_size)<<24)' to function htonl=
 is always 83891325 [constArgument]
      FILL_KEY_CTX_HDR(CHCR_KEYCTX_CIPHER_KEY_SIZE_192,
      ^
   drivers/crypto/chelsio/chcr_algo.c:2277:14: note: Assuming that conditio=
n 'key_len=3D=3D48' is not redundant
    if (key_len =3D=3D 48) {
                ^
   drivers/crypto/chelsio/chcr_algo.c:2279:11: note: Assignment 'context_si=
ze=3D(16+key_len+16)>>4', assigned value is 5
       + 16) >> 4;
             ^
   drivers/crypto/chelsio/chcr_algo.c:2285:4: note: Argument '(1<<0)|(1<<6)=
|(15<<2)|(1<<12)|(0<<11)|(1<<10)|((context_size)<<24)' to function htonl is=
 always 83891325
      FILL_KEY_CTX_HDR(CHCR_KEYCTX_CIPHER_KEY_SIZE_192,
      ^
   drivers/crypto/chelsio/chcr_algo.h:404:36: warning: Clarify calculation =
precedence for '%' and '?'. [clarifyCalculation]
     (sgl_entr << 3) + ((sgl_entr % 2 ? 1 : 0) << 3);
                                      ^
   drivers/crypto/chelsio/chcr_algo.c:824:68: warning: Clarify calculation =
precedence for '&' and '?'. [clarifyCalculation]
    gfp_t flags =3D wrparam->req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
                                                                      ^
   drivers/crypto/chelsio/chcr_algo.c:1587:59: warning: Clarify calculation=
 precedence for '&' and '?'. [clarifyCalculation]
    gfp_t flags =3D req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ? GFP_KERNEL=
 :
                                                             ^
   drivers/crypto/chelsio/chcr_algo.c:2465:59: warning: Clarify calculation=
 precedence for '&' and '?'. [clarifyCalculation]
    gfp_t flags =3D req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ? GFP_KERNEL=
 :
                                                             ^
   drivers/crypto/chelsio/chcr_algo.c:3028:59: warning: Clarify calculation=
 precedence for '&' and '?'. [clarifyCalculation]
    gfp_t flags =3D req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ? GFP_KERNEL=
 :
                                                             ^
   drivers/crypto/chelsio/chcr_algo.c:3125:59: warning: Clarify calculation=
 precedence for '&' and '?'. [clarifyCalculation]
    gfp_t flags =3D req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ? GFP_KERNEL=
 :
                                                             ^

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3Dee91ac1b11e44b38268a2f129c86a8a4ee4c218a
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git remote update linux-next
git checkout ee91ac1b11e44b38268a2f129c86a8a4ee4c218a
vim +2285 drivers/crypto/chelsio/chcr_algo.c

324429d74127d0 Hariprasad Shenai         2016-08-17  2258  =

7cea6d3e01c2f4 Ard Biesheuvel            2019-11-09  2259  static int chcr_=
aes_xts_setkey(struct crypto_skcipher *cipher, const u8 *key,
324429d74127d0 Hariprasad Shenai         2016-08-17  2260  			       unsign=
ed int key_len)
324429d74127d0 Hariprasad Shenai         2016-08-17  2261  {
2f47d58043110b Harsh Jain                2017-10-08  2262  	struct ablk_ctx=
 *ablkctx =3D ABLK_CTX(c_ctx(cipher));
324429d74127d0 Hariprasad Shenai         2016-08-17  2263  	unsigned short =
context_size =3D 0;
b8fd1f4170e7e8 Harsh Jain                2017-06-15  2264  	int err;
324429d74127d0 Hariprasad Shenai         2016-08-17  2265  =

b8fd1f4170e7e8 Harsh Jain                2017-06-15  2266  	err =3D chcr_ci=
pher_fallback_setkey(cipher, key, key_len);
b8fd1f4170e7e8 Harsh Jain                2017-06-15  2267  	if (err)
b8fd1f4170e7e8 Harsh Jain                2017-06-15  2268  		goto badkey_er=
r;
cc1b156df510f4 Harsh Jain                2016-11-29  2269  =

324429d74127d0 Hariprasad Shenai         2016-08-17  2270  	memcpy(ablkctx-=
>key, key, key_len);
324429d74127d0 Hariprasad Shenai         2016-08-17  2271  	ablkctx->enckey=
_len =3D key_len;
cc1b156df510f4 Harsh Jain                2016-11-29  2272  	get_aes_decrypt=
_key(ablkctx->rrkey, ablkctx->key, key_len << 2);
324429d74127d0 Hariprasad Shenai         2016-08-17  2273  	context_size =
=3D (KEY_CONTEXT_HDR_SALT_AND_PAD + key_len) >> 4;
ee91ac1b11e44b Devulapally Shiva Krishna 2020-05-05  2274  	/* Both keys fo=
r xts must be aligned to 16 byte boundary
ee91ac1b11e44b Devulapally Shiva Krishna 2020-05-05  2275  	 * by padding w=
ith zeros. So for 24 byte keys padding 8 zeroes.
ee91ac1b11e44b Devulapally Shiva Krishna 2020-05-05  2276  	 */
ee91ac1b11e44b Devulapally Shiva Krishna 2020-05-05  2277  	if (key_len =3D=
=3D 48) {
ee91ac1b11e44b Devulapally Shiva Krishna 2020-05-05  2278  		context_size =
=3D (KEY_CONTEXT_HDR_SALT_AND_PAD + key_len
ee91ac1b11e44b Devulapally Shiva Krishna 2020-05-05  2279  				+ 16) >> 4;
ee91ac1b11e44b Devulapally Shiva Krishna 2020-05-05  2280  		memmove(ablkct=
x->key + 32, ablkctx->key + 24, 24);
ee91ac1b11e44b Devulapally Shiva Krishna 2020-05-05  2281  		memset(ablkctx=
->key + 24, 0, 8);
ee91ac1b11e44b Devulapally Shiva Krishna 2020-05-05  2282  		memset(ablkctx=
->key + 56, 0, 8);
ee91ac1b11e44b Devulapally Shiva Krishna 2020-05-05  2283  		ablkctx->encke=
y_len =3D 64;
ee91ac1b11e44b Devulapally Shiva Krishna 2020-05-05  2284  		ablkctx->key_c=
tx_hdr =3D
ee91ac1b11e44b Devulapally Shiva Krishna 2020-05-05 @2285  			FILL_KEY_CTX_=
HDR(CHCR_KEYCTX_CIPHER_KEY_SIZE_192,
ee91ac1b11e44b Devulapally Shiva Krishna 2020-05-05  2286  					 CHCR_KEYCT=
X_NO_KEY, 1,
ee91ac1b11e44b Devulapally Shiva Krishna 2020-05-05  2287  					 0, context=
_size);
ee91ac1b11e44b Devulapally Shiva Krishna 2020-05-05  2288  	} else {
324429d74127d0 Hariprasad Shenai         2016-08-17  2289  		ablkctx->key_c=
tx_hdr =3D
324429d74127d0 Hariprasad Shenai         2016-08-17  2290  		FILL_KEY_CTX_H=
DR((key_len =3D=3D AES_KEYSIZE_256) ?
324429d74127d0 Hariprasad Shenai         2016-08-17  2291  				 CHCR_KEYCTX=
_CIPHER_KEY_SIZE_128 :
324429d74127d0 Hariprasad Shenai         2016-08-17  2292  				 CHCR_KEYCTX=
_CIPHER_KEY_SIZE_256,
324429d74127d0 Hariprasad Shenai         2016-08-17  2293  				 CHCR_KEYCTX=
_NO_KEY, 1,
324429d74127d0 Hariprasad Shenai         2016-08-17  2294  				 0, context_=
size);
ee91ac1b11e44b Devulapally Shiva Krishna 2020-05-05  2295  	}
324429d74127d0 Hariprasad Shenai         2016-08-17  2296  	ablkctx->ciph_m=
ode =3D CHCR_SCMD_CIPHER_MODE_AES_XTS;
cc1b156df510f4 Harsh Jain                2016-11-29  2297  	return 0;
b8fd1f4170e7e8 Harsh Jain                2017-06-15  2298  badkey_err:
b8fd1f4170e7e8 Harsh Jain                2017-06-15  2299  	ablkctx->enckey=
_len =3D 0;
b8fd1f4170e7e8 Harsh Jain                2017-06-15  2300  =

b8fd1f4170e7e8 Harsh Jain                2017-06-15  2301  	return err;
324429d74127d0 Hariprasad Shenai         2016-08-17  2302  }
324429d74127d0 Hariprasad Shenai         2016-08-17  2303  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4152111022812187132==--

