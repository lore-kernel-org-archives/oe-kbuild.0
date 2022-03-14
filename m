Content-Type: multipart/mixed; boundary="===============2965193563122040006=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] crypto: move sm3 and sm4 into crypto directory
Date: Mon, 14 Mar 2022 17:07:19 +0800
Message-ID: <202203141647.utMMhTc9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2965193563122040006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220314031101.663883-1-Jason@zx2c4.com>
References: <20220314031101.663883-1-Jason@zx2c4.com>
TO: "Jason A. Donenfeld" <Jason@zx2c4.com>
TO: linux-crypto(a)vger.kernel.org
TO: herbert(a)gondor.apana.org.au
TO: tianjia.zhang(a)linux.alibaba.com
TO: ebiggers(a)kernel.org
CC: "Jason A. Donenfeld" <Jason@zx2c4.com>

Hi "Jason,

I love your patch! Perhaps something to improve:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on next-20220310]
[cannot apply to herbert-crypto-2.6/master crng-random/master v5.17-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jason-A-Donenfeld/crypto-m=
ove-sm3-and-sm4-into-crypto-directory/20220314-111353
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2=
.6.git master
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
compiler: sparc-linux-gcc (GCC) 11.2.0

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


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============2965193563122040006==--

