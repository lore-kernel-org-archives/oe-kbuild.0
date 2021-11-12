Content-Type: multipart/mixed; boundary="===============2714127925366431874=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: lib/crypto/sm4.c:171:25: warning: Same expression on both sides of '-'. [duplicateExpression]
Date: Fri, 12 Nov 2021 14:07:53 +0800
Message-ID: <202111121442.L3o8pikc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2714127925366431874==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5833291ab6de9c3e2374336b51c814e515e8f3a5
commit: 2b31277af577b1b2da62c3ad7d3315b422869102 crypto: sm4 - create SM4 l=
ibrary based on sm4 generic code
date:   4 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 4 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> lib/crypto/sm4.c:171:25: warning: Same expression on both sides of '-'. =
[duplicateExpression]
    put_unaligned_be32(x[3 - 3], out + 3 * 4);
                           ^

vim +171 lib/crypto/sm4.c

2b31277af577b1b Tianjia Zhang 2021-07-20  145  =

2b31277af577b1b Tianjia Zhang 2021-07-20  146  /**
2b31277af577b1b Tianjia Zhang 2021-07-20  147   * sm4_crypt_block - Encrypt=
 or decrypt a single SM4 block
2b31277af577b1b Tianjia Zhang 2021-07-20  148   * @rk:		The rkey_enc for en=
crypt or rkey_dec for decrypt
2b31277af577b1b Tianjia Zhang 2021-07-20  149   * @out:	Buffer to store out=
put data
2b31277af577b1b Tianjia Zhang 2021-07-20  150   * @in: 	Buffer containing t=
he input data
2b31277af577b1b Tianjia Zhang 2021-07-20  151   */
2b31277af577b1b Tianjia Zhang 2021-07-20  152  void sm4_crypt_block(const u=
32 *rk, u8 *out, const u8 *in)
2b31277af577b1b Tianjia Zhang 2021-07-20  153  {
2b31277af577b1b Tianjia Zhang 2021-07-20  154  	u32 x[4], i;
2b31277af577b1b Tianjia Zhang 2021-07-20  155  =

2b31277af577b1b Tianjia Zhang 2021-07-20  156  	x[0] =3D get_unaligned_be32=
(in + 0 * 4);
2b31277af577b1b Tianjia Zhang 2021-07-20  157  	x[1] =3D get_unaligned_be32=
(in + 1 * 4);
2b31277af577b1b Tianjia Zhang 2021-07-20  158  	x[2] =3D get_unaligned_be32=
(in + 2 * 4);
2b31277af577b1b Tianjia Zhang 2021-07-20  159  	x[3] =3D get_unaligned_be32=
(in + 3 * 4);
2b31277af577b1b Tianjia Zhang 2021-07-20  160  =

2b31277af577b1b Tianjia Zhang 2021-07-20  161  	for (i =3D 0; i < 32; i +=
=3D 4) {
2b31277af577b1b Tianjia Zhang 2021-07-20  162  		x[0] =3D sm4_round(x[0], x=
[1], x[2], x[3], rk[i + 0]);
2b31277af577b1b Tianjia Zhang 2021-07-20  163  		x[1] =3D sm4_round(x[1], x=
[2], x[3], x[0], rk[i + 1]);
2b31277af577b1b Tianjia Zhang 2021-07-20  164  		x[2] =3D sm4_round(x[2], x=
[3], x[0], x[1], rk[i + 2]);
2b31277af577b1b Tianjia Zhang 2021-07-20  165  		x[3] =3D sm4_round(x[3], x=
[0], x[1], x[2], rk[i + 3]);
2b31277af577b1b Tianjia Zhang 2021-07-20  166  	}
2b31277af577b1b Tianjia Zhang 2021-07-20  167  =

2b31277af577b1b Tianjia Zhang 2021-07-20  168  	put_unaligned_be32(x[3 - 0]=
, out + 0 * 4);
2b31277af577b1b Tianjia Zhang 2021-07-20  169  	put_unaligned_be32(x[3 - 1]=
, out + 1 * 4);
2b31277af577b1b Tianjia Zhang 2021-07-20  170  	put_unaligned_be32(x[3 - 2]=
, out + 2 * 4);
2b31277af577b1b Tianjia Zhang 2021-07-20 @171  	put_unaligned_be32(x[3 - 3]=
, out + 3 * 4);
2b31277af577b1b Tianjia Zhang 2021-07-20  172  }
2b31277af577b1b Tianjia Zhang 2021-07-20  173  EXPORT_SYMBOL_GPL(sm4_crypt_=
block);
2b31277af577b1b Tianjia Zhang 2021-07-20  174  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============2714127925366431874==--

