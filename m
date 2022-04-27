Content-Type: multipart/mixed; boundary="===============6454512583289666152=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5 4/8] crypto: x86/aesni-xctr: Add accelerated implementation of XCTR
Date: Wed, 27 Apr 2022 17:12:15 +0800
Message-ID: <202204271713.m6uwRMNv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6454512583289666152==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220427003759.1115361-5-nhuck@google.com>
References: <20220427003759.1115361-5-nhuck@google.com>
TO: Nathan Huckleberry <nhuck@google.com>

Hi Nathan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linus/master v5.18-rc=
4 next-20220427]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Nathan-Huckleberry/c=
rypto-HCTR2-support/20220427-084044
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2=
.6.git master
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 00cd244c8a1bd9623a271407bf10b99c01884ef5
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/x86/crypto/aesni-intel_glue.c:1287:1: warning: Label 'unregister_ae=
ads' is not used. There is #if in function body so the label might be used =
in code that is removed by the preprocessor. [unusedLabelConfiguration]
   unregister_aeads:
   ^
   arch/x86/crypto/aesni-intel_glue.c:831:8: warning: Local variable 'aes_c=
tx' shadows outer function [shadowFunction]
    void *aes_ctx =3D &(ctx->aes_key_expanded);
          ^
   arch/x86/crypto/aesni-intel_glue.c:222:38: note: Shadowed declaration
   static inline struct crypto_aes_ctx *aes_ctx(void *raw_ctx)
                                        ^
   arch/x86/crypto/aesni-intel_glue.c:831:8: note: Shadow variable
    void *aes_ctx =3D &(ctx->aes_key_expanded);
          ^
   arch/x86/crypto/aesni-intel_glue.c:859:8: warning: Local variable 'aes_c=
tx' shadows outer function [shadowFunction]
    void *aes_ctx =3D &(ctx->aes_key_expanded);
          ^
   arch/x86/crypto/aesni-intel_glue.c:222:38: note: Shadowed declaration
   static inline struct crypto_aes_ctx *aes_ctx(void *raw_ctx)
                                        ^
   arch/x86/crypto/aesni-intel_glue.c:859:8: note: Shadow variable
    void *aes_ctx =3D &(ctx->aes_key_expanded);
          ^
   arch/x86/crypto/aesni-intel_glue.c:1162:8: warning: Local variable 'aes_=
ctx' shadows outer function [shadowFunction]
    void *aes_ctx =3D &(ctx->aes_key_expanded);
          ^
   arch/x86/crypto/aesni-intel_glue.c:222:38: note: Shadowed declaration
   static inline struct crypto_aes_ctx *aes_ctx(void *raw_ctx)
                                        ^
   arch/x86/crypto/aesni-intel_glue.c:1162:8: note: Shadow variable
    void *aes_ctx =3D &(ctx->aes_key_expanded);
          ^
   arch/x86/crypto/aesni-intel_glue.c:1179:8: warning: Local variable 'aes_=
ctx' shadows outer function [shadowFunction]
    void *aes_ctx =3D &(ctx->aes_key_expanded);
          ^
   arch/x86/crypto/aesni-intel_glue.c:222:38: note: Shadowed declaration
   static inline struct crypto_aes_ctx *aes_ctx(void *raw_ctx)
                                        ^
   arch/x86/crypto/aesni-intel_glue.c:1179:8: note: Shadow variable
    void *aes_ctx =3D &(ctx->aes_key_expanded);
          ^

vim +/unregister_aeads +1287 arch/x86/crypto/aesni-intel_glue.c

00cd244c8a1bd9 Nathan Huckleberry 2022-04-27  1284  =

85671860caaca2 Herbert Xu         2016-11-22  1285  	return 0;
85671860caaca2 Herbert Xu         2016-11-22  1286  =

00cd244c8a1bd9 Nathan Huckleberry 2022-04-27 @1287  unregister_aeads:
00cd244c8a1bd9 Nathan Huckleberry 2022-04-27  1288  	simd_unregister_aeads(=
aesni_aeads, ARRAY_SIZE(aesni_aeads),
00cd244c8a1bd9 Nathan Huckleberry 2022-04-27  1289  				aesni_simd_aeads);
85671860caaca2 Herbert Xu         2016-11-22  1290  unregister_skciphers:
8b56d3488d8755 Eric Biggers       2019-03-10  1291  	simd_unregister_skciph=
ers(aesni_skciphers, ARRAY_SIZE(aesni_skciphers),
8b56d3488d8755 Eric Biggers       2019-03-10  1292  				  aesni_simd_skciph=
ers);
07269559ac0bf7 Eric Biggers       2019-06-02  1293  unregister_cipher:
07269559ac0bf7 Eric Biggers       2019-06-02  1294  	crypto_unregister_alg(=
&aesni_cipher_alg);
af05b3009b6b10 Herbert Xu         2015-05-28  1295  	return err;
54b6a1bd5364ac Huang Ying         2009-01-18  1296  }
54b6a1bd5364ac Huang Ying         2009-01-18  1297  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6454512583289666152==--

