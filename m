Content-Type: multipart/mixed; boundary="===============7235352089074328179=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-linux-intel-lts:4.19/android_r 20059/20689] arch/x86/crypto/poly1305_glue.c:166:4: warning: Assignment of function parameter has no effect outside the function.
Date: Sat, 12 Dec 2020 02:22:26 +0800
Message-ID: <202012120222.uRSWk94R-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7235352089074328179==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Samuel Neves <sneves@dei.uc.pt>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_r
head:   4a6aef8d991e7c47e5da39927e0ad28ec90cd01b
commit: d127b15e38bc410dde8cb758c79ab3b60fb0ddae [20059/20689] UPSTREAM: cr=
ypto: x86/poly1305 - wire up faster implementations for kernel
:::::: branch date: 34 hours ago
:::::: commit date: 7 weeks ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   arch/x86/crypto/poly1305_glue.c:165:4: warning: Assignment of function p=
arameter has no effect outside the function. Did you forget dereferencing i=
t? [uselessAssignmentPtrArg]
      inp +=3D POLY1305_BLOCK_SIZE;
      ^
>> arch/x86/crypto/poly1305_glue.c:166:4: warning: Assignment of function p=
arameter has no effect outside the function. [uselessAssignmentArg]
      len -=3D POLY1305_BLOCK_SIZE;
      ^

vim +166 arch/x86/crypto/poly1305_glue.c

c99c62721844fb Ard Biesheuvel     2019-11-08  147  =

d127b15e38bc41 Jason A. Donenfeld 2020-01-05  148  static unsigned int cryp=
to_poly1305_setdctxkey(struct poly1305_desc_ctx *dctx,
d127b15e38bc41 Jason A. Donenfeld 2020-01-05  149  					       const u8 *in=
p, unsigned int len)
d127b15e38bc41 Jason A. Donenfeld 2020-01-05  150  {
d127b15e38bc41 Jason A. Donenfeld 2020-01-05  151  	unsigned int acc =3D 0;
d127b15e38bc41 Jason A. Donenfeld 2020-01-05  152  	if (unlikely(!dctx->sse=
t)) {
d127b15e38bc41 Jason A. Donenfeld 2020-01-05  153  		if (!dctx->rset && len=
 >=3D POLY1305_BLOCK_SIZE) {
d127b15e38bc41 Jason A. Donenfeld 2020-01-05  154  			poly1305_simd_init(&d=
ctx->h, inp);
d127b15e38bc41 Jason A. Donenfeld 2020-01-05  155  			inp +=3D POLY1305_BLO=
CK_SIZE;
d127b15e38bc41 Jason A. Donenfeld 2020-01-05  156  			len -=3D POLY1305_BLO=
CK_SIZE;
d127b15e38bc41 Jason A. Donenfeld 2020-01-05  157  			acc +=3D POLY1305_BLO=
CK_SIZE;
d127b15e38bc41 Jason A. Donenfeld 2020-01-05  158  			dctx->rset =3D 1;
da35b22df30112 Martin Willi       2015-07-16  159  		}
d127b15e38bc41 Jason A. Donenfeld 2020-01-05  160  		if (len >=3D POLY1305_=
BLOCK_SIZE) {
d127b15e38bc41 Jason A. Donenfeld 2020-01-05  161  			dctx->s[0] =3D get_un=
aligned_le32(&inp[0]);
d127b15e38bc41 Jason A. Donenfeld 2020-01-05  162  			dctx->s[1] =3D get_un=
aligned_le32(&inp[4]);
d127b15e38bc41 Jason A. Donenfeld 2020-01-05  163  			dctx->s[2] =3D get_un=
aligned_le32(&inp[8]);
d127b15e38bc41 Jason A. Donenfeld 2020-01-05  164  			dctx->s[3] =3D get_un=
aligned_le32(&inp[12]);
d127b15e38bc41 Jason A. Donenfeld 2020-01-05  165  			inp +=3D POLY1305_BLO=
CK_SIZE;
d127b15e38bc41 Jason A. Donenfeld 2020-01-05 @166  			len -=3D POLY1305_BLO=
CK_SIZE;
d127b15e38bc41 Jason A. Donenfeld 2020-01-05  167  			acc +=3D POLY1305_BLO=
CK_SIZE;
d127b15e38bc41 Jason A. Donenfeld 2020-01-05  168  			dctx->sset =3D true;
da35b22df30112 Martin Willi       2015-07-16  169  		}
c70f4abef07a99 Martin Willi       2015-07-16  170  	}
d127b15e38bc41 Jason A. Donenfeld 2020-01-05  171  	return acc;
c70f4abef07a99 Martin Willi       2015-07-16  172  }
c70f4abef07a99 Martin Willi       2015-07-16  173  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7235352089074328179==--

