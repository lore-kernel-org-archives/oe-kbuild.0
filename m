Content-Type: multipart/mixed; boundary="===============3969825801221943886=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/crypto/poly1305_glue.c:166:4: warning: Assignment of function parameter has no effect outside the function.
Date: Sat, 19 Sep 2020 23:37:54 +0800
Message-ID: <202009192347.wzVGtQ4c%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3969825801221943886==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Samuel Neves <sneves@dei.uc.pt>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eb5f95f1593f7c22dac681b19e815828e2af3efd
commit: d7d7b853566254648df59f7ea27ea05952a6cfa8 crypto: x86/poly1305 - wir=
e up faster implementations for kernel
date:   8 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 8 months ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   arch/x86/crypto/poly1305_glue.c:165:4: warning: Assignment of function p=
arameter has no effect outside the function. Did you forget dereferencing i=
t? [uselessAssignmentPtrArg]
      inp +=3D POLY1305_BLOCK_SIZE;
      ^
>> arch/x86/crypto/poly1305_glue.c:166:4: warning: Assignment of function p=
arameter has no effect outside the function. [uselessAssignmentArg]
      len -=3D POLY1305_BLOCK_SIZE;
      ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dd7d7b853566254648df59f7ea27ea05952a6cfa8
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout d7d7b853566254648df59f7ea27ea05952a6cfa8
vim +166 arch/x86/crypto/poly1305_glue.c

ad8f5b88383ea6 Ard Biesheuvel     2019-11-08  147  =

d7d7b853566254 Jason A. Donenfeld 2020-01-05  148  static unsigned int cryp=
to_poly1305_setdctxkey(struct poly1305_desc_ctx *dctx,
d7d7b853566254 Jason A. Donenfeld 2020-01-05  149  					       const u8 *in=
p, unsigned int len)
d7d7b853566254 Jason A. Donenfeld 2020-01-05  150  {
d7d7b853566254 Jason A. Donenfeld 2020-01-05  151  	unsigned int acc =3D 0;
d7d7b853566254 Jason A. Donenfeld 2020-01-05  152  	if (unlikely(!dctx->sse=
t)) {
d7d7b853566254 Jason A. Donenfeld 2020-01-05  153  		if (!dctx->rset && len=
 >=3D POLY1305_BLOCK_SIZE) {
d7d7b853566254 Jason A. Donenfeld 2020-01-05  154  			poly1305_simd_init(&d=
ctx->h, inp);
d7d7b853566254 Jason A. Donenfeld 2020-01-05  155  			inp +=3D POLY1305_BLO=
CK_SIZE;
d7d7b853566254 Jason A. Donenfeld 2020-01-05  156  			len -=3D POLY1305_BLO=
CK_SIZE;
d7d7b853566254 Jason A. Donenfeld 2020-01-05  157  			acc +=3D POLY1305_BLO=
CK_SIZE;
d7d7b853566254 Jason A. Donenfeld 2020-01-05  158  			dctx->rset =3D 1;
da35b22df30112 Martin Willi       2015-07-16  159  		}
d7d7b853566254 Jason A. Donenfeld 2020-01-05  160  		if (len >=3D POLY1305_=
BLOCK_SIZE) {
d7d7b853566254 Jason A. Donenfeld 2020-01-05  161  			dctx->s[0] =3D get_un=
aligned_le32(&inp[0]);
d7d7b853566254 Jason A. Donenfeld 2020-01-05  162  			dctx->s[1] =3D get_un=
aligned_le32(&inp[4]);
d7d7b853566254 Jason A. Donenfeld 2020-01-05  163  			dctx->s[2] =3D get_un=
aligned_le32(&inp[8]);
d7d7b853566254 Jason A. Donenfeld 2020-01-05  164  			dctx->s[3] =3D get_un=
aligned_le32(&inp[12]);
d7d7b853566254 Jason A. Donenfeld 2020-01-05  165  			inp +=3D POLY1305_BLO=
CK_SIZE;
d7d7b853566254 Jason A. Donenfeld 2020-01-05 @166  			len -=3D POLY1305_BLO=
CK_SIZE;
d7d7b853566254 Jason A. Donenfeld 2020-01-05  167  			acc +=3D POLY1305_BLO=
CK_SIZE;
d7d7b853566254 Jason A. Donenfeld 2020-01-05  168  			dctx->sset =3D true;
da35b22df30112 Martin Willi       2015-07-16  169  		}
c70f4abef07a99 Martin Willi       2015-07-16  170  	}
d7d7b853566254 Jason A. Donenfeld 2020-01-05  171  	return acc;
c70f4abef07a99 Martin Willi       2015-07-16  172  }
c70f4abef07a99 Martin Willi       2015-07-16  173  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3969825801221943886==--

