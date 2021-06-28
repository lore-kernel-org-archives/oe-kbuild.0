Content-Type: multipart/mixed; boundary="===============2214557337423352936=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [meghadey-crypto:for_crypto_avx512 4/6] Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-features.h' differs from latest version at 'arch/x86/include/asm/disabled-features.h': 77> #if defined(CONFIG_AS_VAES_AVX512)
Date: Tue, 29 Jun 2021 04:07:10 +0800
Message-ID: <202106290400.dZKPRb9v-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2214557337423352936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Megha Dey <megha.dey@intel.com>
CC: labuser <labuser@ssp-romleySNB-cdi172.jf.intel.com>
CC: Tomasz Kantecki <tomasz.kantecki@intel.com>

tree:   https://github.com/meghadey/crypto for_crypto_avx512
head:   a89c5880f0d6260dd593bf579df26f2a2d56ac32
commit: e91f066a9a75849b32c42d336d49b62215a43e5a [4/6] crypto: aesni - AES =
CTR x86_64 "by16" AVX512 optimization
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version at 'arch/x86/include/asm/disabled-featur=
es.h':   71> #if defined(CONFIG_AS_VPCLMULQDQ)
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version at 'arch/x86/include/asm/disabled-featur=
es.h':   72> # define DISABLE_VPCLMULQDQ	0
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version at 'arch/x86/include/asm/disabled-featur=
es.h':   73> #else
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version at 'arch/x86/include/asm/disabled-featur=
es.h':   74> # define DISABLE_VPCLMULQDQ	(1 << (X86_FEATURE_VPCLMULQDQ & 31=
))
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version@'arch/x86/include/asm/disabled-featur=
es.h':   75> #endif
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version at 'arch/x86/include/asm/disabled-featur=
es.h':   76> =

>> Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version at 'arch/x86/include/asm/disabled-featur=
es.h':   77> #if defined(CONFIG_AS_VAES_AVX512)
>> Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version at 'arch/x86/include/asm/disabled-featur=
es.h':   78> # define DISABLE_VAES	0
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version at 'arch/x86/include/asm/disabled-featur=
es.h':   79> #else
>> Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version at 'arch/x86/include/asm/disabled-featur=
es.h':   80> # define DISABLE_VAES	(1 << (X86_FEATURE_VAES & 31))
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version@'arch/x86/include/asm/disabled-featur=
es.h':   81> #endif
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version at 'arch/x86/include/asm/disabled-featur=
es.h':   82> =

   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version at 'arch/x86/include/asm/disabled-featur=
es.h':   91< 			 DISABLE_ENQCMD)
>> Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version at 'arch/x86/include/asm/disabled-featur=
es.h':  103> 			 DISABLE_ENQCMD|DISABLE_VPCLMULQDQ|DISABLE_VAES)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2214557337423352936==--

