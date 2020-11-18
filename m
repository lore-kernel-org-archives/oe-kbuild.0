Content-Type: multipart/mixed; boundary="===============9187067221540254755=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/4] crypto: aegis128/neon - optimize tail block handling
Date: Wed, 18 Nov 2020 12:25:30 +0800
Message-ID: <202011181242.FBffSNDn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9187067221540254755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20201117133214.29114-3-ardb@kernel.org>
References: <20201117133214.29114-3-ardb@kernel.org>
TO: Ard Biesheuvel <ardb@kernel.org>
TO: linux-crypto(a)vger.kernel.org
CC: herbert(a)gondor.apana.org.au
CC: linux-arm-kernel(a)lists.infradead.org
CC: Ard Biesheuvel <ardb@kernel.org>
CC: Ondrej Mosnacek <omosnacek@gmail.com>
CC: Eric Biggers <ebiggers@kernel.org>

Hi Ard,

I love your patch! Perhaps something to improve:

[auto build test WARNING on cryptodev/master]
[also build test WARNING on crypto/master soc/for-next v5.10-rc4 next-20201=
117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Ard-Biesheuvel/crypto-aegi=
s128-enhancements/20201117-215152
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2=
.6.git master
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
compiler: aarch64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> crypto/aegis128-neon-inner.c:234:11: warning: Variable 'buf' is not assi=
gned a value. [unassignedVariable]
     uint8_t buf[AEGIS_BLOCK_SIZE];
             ^
   crypto/aegis128-neon-inner.c:280:11: warning: Variable 'buf' is not assi=
gned a value. [unassignedVariable]
     uint8_t buf[AEGIS_BLOCK_SIZE];
             ^

vim +/buf +234 crypto/aegis128-neon-inner.c

bed9bb6dc223d58 Ard Biesheuvel 2020-11-17  209  =

a4397635afea5d1 Ard Biesheuvel 2019-08-12  210  void crypto_aegis128_encryp=
t_chunk_neon(void *state, void *dst, const void *src,
a4397635afea5d1 Ard Biesheuvel 2019-08-12  211  					unsigned int size)
a4397635afea5d1 Ard Biesheuvel 2019-08-12  212  {
a4397635afea5d1 Ard Biesheuvel 2019-08-12  213  	struct aegis128_state st =
=3D aegis128_load_state_neon(state);
bed9bb6dc223d58 Ard Biesheuvel 2020-11-17  214  	const int short_input =3D =
size < AEGIS_BLOCK_SIZE;
a4397635afea5d1 Ard Biesheuvel 2019-08-12  215  	uint8x16_t msg;
a4397635afea5d1 Ard Biesheuvel 2019-08-12  216  =

198429631a85622 Ard Biesheuvel 2019-08-12  217  	preload_sbox();
198429631a85622 Ard Biesheuvel 2019-08-12  218  =

a4397635afea5d1 Ard Biesheuvel 2019-08-12  219  	while (size >=3D AEGIS_BLO=
CK_SIZE) {
a4397635afea5d1 Ard Biesheuvel 2019-08-12  220  		uint8x16_t s =3D st.v[1] =
^ (st.v[2] & st.v[3]) ^ st.v[4];
a4397635afea5d1 Ard Biesheuvel 2019-08-12  221  =

a4397635afea5d1 Ard Biesheuvel 2019-08-12  222  		msg =3D vld1q_u8(src);
a4397635afea5d1 Ard Biesheuvel 2019-08-12  223  		st =3D aegis128_update_ne=
on(st, msg);
bed9bb6dc223d58 Ard Biesheuvel 2020-11-17  224  		msg ^=3D s;
bed9bb6dc223d58 Ard Biesheuvel 2020-11-17  225  		vst1q_u8(dst, msg);
a4397635afea5d1 Ard Biesheuvel 2019-08-12  226  =

a4397635afea5d1 Ard Biesheuvel 2019-08-12  227  		size -=3D AEGIS_BLOCK_SIZ=
E;
a4397635afea5d1 Ard Biesheuvel 2019-08-12  228  		src +=3D AEGIS_BLOCK_SIZE;
a4397635afea5d1 Ard Biesheuvel 2019-08-12  229  		dst +=3D AEGIS_BLOCK_SIZE;
a4397635afea5d1 Ard Biesheuvel 2019-08-12  230  	}
a4397635afea5d1 Ard Biesheuvel 2019-08-12  231  =

a4397635afea5d1 Ard Biesheuvel 2019-08-12  232  	if (size > 0) {
a4397635afea5d1 Ard Biesheuvel 2019-08-12  233  		uint8x16_t s =3D st.v[1] =
^ (st.v[2] & st.v[3]) ^ st.v[4];
bed9bb6dc223d58 Ard Biesheuvel 2020-11-17 @234  		uint8_t buf[AEGIS_BLOCK_S=
IZE];
bed9bb6dc223d58 Ard Biesheuvel 2020-11-17  235  		const void *in =3D src;
bed9bb6dc223d58 Ard Biesheuvel 2020-11-17  236  		void *out =3D dst;
bed9bb6dc223d58 Ard Biesheuvel 2020-11-17  237  		uint8x16_t m;
a4397635afea5d1 Ard Biesheuvel 2019-08-12  238  =

bed9bb6dc223d58 Ard Biesheuvel 2020-11-17  239  		if (__builtin_expect(shor=
t_input, 0))
bed9bb6dc223d58 Ard Biesheuvel 2020-11-17  240  			in =3D out =3D memcpy(bu=
f + AEGIS_BLOCK_SIZE - size, src, size);
bed9bb6dc223d58 Ard Biesheuvel 2020-11-17  241  =

bed9bb6dc223d58 Ard Biesheuvel 2020-11-17  242  		m =3D vqtbl1q_u8(vld1q_u8=
(in + size - AEGIS_BLOCK_SIZE),
bed9bb6dc223d58 Ard Biesheuvel 2020-11-17  243  			       vld1q_u8(permute =
+ 32 - size));
bed9bb6dc223d58 Ard Biesheuvel 2020-11-17  244  =

bed9bb6dc223d58 Ard Biesheuvel 2020-11-17  245  		st =3D aegis128_update_ne=
on(st, m);
bed9bb6dc223d58 Ard Biesheuvel 2020-11-17  246  =

bed9bb6dc223d58 Ard Biesheuvel 2020-11-17  247  		vst1q_u8(out + size - AEG=
IS_BLOCK_SIZE,
bed9bb6dc223d58 Ard Biesheuvel 2020-11-17  248  			 vqtbl1q_u8(m ^ s, vld1q=
_u8(permute + size)));
bed9bb6dc223d58 Ard Biesheuvel 2020-11-17  249  =

bed9bb6dc223d58 Ard Biesheuvel 2020-11-17  250  		if (__builtin_expect(shor=
t_input, 0))
bed9bb6dc223d58 Ard Biesheuvel 2020-11-17  251  			memcpy(dst, out, size);
bed9bb6dc223d58 Ard Biesheuvel 2020-11-17  252  		else
bed9bb6dc223d58 Ard Biesheuvel 2020-11-17  253  			vst1q_u8(out - AEGIS_BLO=
CK_SIZE, msg);
a4397635afea5d1 Ard Biesheuvel 2019-08-12  254  	}
a4397635afea5d1 Ard Biesheuvel 2019-08-12  255  =

a4397635afea5d1 Ard Biesheuvel 2019-08-12  256  	aegis128_save_state_neon(s=
t, state);
a4397635afea5d1 Ard Biesheuvel 2019-08-12  257  }
a4397635afea5d1 Ard Biesheuvel 2019-08-12  258  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9187067221540254755==--

