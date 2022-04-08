Content-Type: multipart/mixed; boundary="===============2474179266455984129=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [herbert-cryptodev-2.6:master 1/14] crypto/sm4.c:171:25: warning: Same expression on both sides of '-'. [duplicateExpression]
Date: Fri, 08 Apr 2022 22:09:44 +0800
Message-ID: <202204082204.RRIGLgBb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2474179266455984129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-crypto(a)vger.kernel.org
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>
CC: Herbert Xu <herbert@gondor.apana.org.au>

Hi Jason,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2=
.6.git master
head:   7b2206d8809259b0dd297f0ccf017bf2dea98a02
commit: d2825fa9365d0101571ed16534b16b7c8d261ab3 [1/14] crypto: sm3,sm4 - m=
ove into crypto directory
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
compiler: powerpc-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout d2825fa9365d0101571ed16534b16b7c8d261ab3
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> crypto/sm4.c:171:25: warning: Same expression on both sides of '-'. [dup=
licateExpression]
    put_unaligned_be32(x[3 - 3], out + 3 * 4);
                           ^

vim +171 crypto/sm4.c

2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20  145  =

2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20  146  /**
2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20  147   * sm4_crypt=
_block - Encrypt or decrypt a single SM4 block
2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20  148   * @rk:		The=
 rkey_enc for encrypt or rkey_dec for decrypt
2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20  149   * @out:	Buf=
fer to store output data
2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20  150   * @in: 	Buf=
fer containing the input data
2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20  151   */
2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20  152  void sm4_cry=
pt_block(const u32 *rk, u8 *out, const u8 *in)
2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20  153  {
2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20  154  	u32 x[4], i;
2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20  155  =

2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20  156  	x[0] =3D ge=
t_unaligned_be32(in + 0 * 4);
2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20  157  	x[1] =3D ge=
t_unaligned_be32(in + 1 * 4);
2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20  158  	x[2] =3D ge=
t_unaligned_be32(in + 2 * 4);
2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20  159  	x[3] =3D ge=
t_unaligned_be32(in + 3 * 4);
2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20  160  =

2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20  161  	for (i =3D =
0; i < 32; i +=3D 4) {
2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20  162  		x[0] =3D s=
m4_round(x[0], x[1], x[2], x[3], rk[i + 0]);
2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20  163  		x[1] =3D s=
m4_round(x[1], x[2], x[3], x[0], rk[i + 1]);
2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20  164  		x[2] =3D s=
m4_round(x[2], x[3], x[0], x[1], rk[i + 2]);
2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20  165  		x[3] =3D s=
m4_round(x[3], x[0], x[1], x[2], rk[i + 3]);
2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20  166  	}
2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20  167  =

2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20  168  	put_unalign=
ed_be32(x[3 - 0], out + 0 * 4);
2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20  169  	put_unalign=
ed_be32(x[3 - 1], out + 1 * 4);
2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20  170  	put_unalign=
ed_be32(x[3 - 2], out + 2 * 4);
2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20 @171  	put_unalign=
ed_be32(x[3 - 3], out + 3 * 4);
2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20  172  }
2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20  173  EXPORT_SYMBO=
L_GPL(sm4_crypt_block);
2b31277af577b1 lib/crypto/sm4.c Tianjia Zhang 2021-07-20  174  =


:::::: The code@line 171 was first introduced by commit
:::::: 2b31277af577b1b2da62c3ad7d3315b422869102 crypto: sm4 - create SM4 li=
brary based on sm4 generic code

:::::: TO: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2474179266455984129==--

