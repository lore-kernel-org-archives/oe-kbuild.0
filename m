Content-Type: multipart/mixed; boundary="===============0271823467110508168=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-linux-intel-lts:4.19/android_r 20057/20689] arch/x86/crypto/poly1305_glue.c:212:4: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing
Date: Fri, 11 Dec 2020 22:24:06 +0800
Message-ID: <202012112259.PoteLsDN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0271823467110508168==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_r
head:   4a6aef8d991e7c47e5da39927e0ad28ec90cd01b
commit: 1ff35ded67dfc68ff024c58e637dc9b9306a1800 [20057/20689] UPSTREAM: cr=
ypto: poly1305 - add new 32 and 64-bit generic versions
:::::: branch date: 30 hours ago
:::::: commit date: 7 weeks ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/x86/crypto/poly1305_glue.c:212:4: warning: Assignment of function p=
arameter has no effect outside the function. Did you forget dereferencing i=
t? [uselessAssignmentPtrArg]
      src +=3D POLY1305_BLOCK_SIZE;
      ^

vim +212 arch/x86/crypto/poly1305_glue.c

1ff35ded67dfc6 Jason A. Donenfeld 2020-01-05  196  =

1ff35ded67dfc6 Jason A. Donenfeld 2020-01-05  197  static unsigned int cryp=
to_poly1305_setdesckey(struct poly1305_desc_ctx *dctx,
1ff35ded67dfc6 Jason A. Donenfeld 2020-01-05  198  					       const u8 *sr=
c, unsigned int srclen)
1ff35ded67dfc6 Jason A. Donenfeld 2020-01-05  199  {
1ff35ded67dfc6 Jason A. Donenfeld 2020-01-05  200  	if (!dctx->sset) {
1ff35ded67dfc6 Jason A. Donenfeld 2020-01-05  201  		if (!dctx->rset && src=
len >=3D POLY1305_BLOCK_SIZE) {
1ff35ded67dfc6 Jason A. Donenfeld 2020-01-05  202  			poly1305_integer_setk=
ey(dctx->r, src);
1ff35ded67dfc6 Jason A. Donenfeld 2020-01-05  203  			src +=3D POLY1305_BLO=
CK_SIZE;
1ff35ded67dfc6 Jason A. Donenfeld 2020-01-05  204  			srclen -=3D POLY1305_=
BLOCK_SIZE;
1ff35ded67dfc6 Jason A. Donenfeld 2020-01-05  205  			dctx->rset =3D 1;
1ff35ded67dfc6 Jason A. Donenfeld 2020-01-05  206  		}
1ff35ded67dfc6 Jason A. Donenfeld 2020-01-05  207  		if (srclen >=3D POLY13=
05_BLOCK_SIZE) {
1ff35ded67dfc6 Jason A. Donenfeld 2020-01-05  208  			dctx->s[0] =3D get_un=
aligned_le32(src +  0);
1ff35ded67dfc6 Jason A. Donenfeld 2020-01-05  209  			dctx->s[1] =3D get_un=
aligned_le32(src +  4);
1ff35ded67dfc6 Jason A. Donenfeld 2020-01-05  210  			dctx->s[2] =3D get_un=
aligned_le32(src +  8);
1ff35ded67dfc6 Jason A. Donenfeld 2020-01-05  211  			dctx->s[3] =3D get_un=
aligned_le32(src + 12);
1ff35ded67dfc6 Jason A. Donenfeld 2020-01-05 @212  			src +=3D POLY1305_BLO=
CK_SIZE;
1ff35ded67dfc6 Jason A. Donenfeld 2020-01-05  213  			srclen -=3D POLY1305_=
BLOCK_SIZE;
1ff35ded67dfc6 Jason A. Donenfeld 2020-01-05  214  			dctx->sset =3D true;
1ff35ded67dfc6 Jason A. Donenfeld 2020-01-05  215  		}
1ff35ded67dfc6 Jason A. Donenfeld 2020-01-05  216  	}
1ff35ded67dfc6 Jason A. Donenfeld 2020-01-05  217  	return srclen;
1ff35ded67dfc6 Jason A. Donenfeld 2020-01-05  218  }
1ff35ded67dfc6 Jason A. Donenfeld 2020-01-05  219  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0271823467110508168==--

