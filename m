Content-Type: multipart/mixed; boundary="===============3395090482535640870=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [meghadey-crypto:for_crypto_avx512 3/6] Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-features.h' differs from latest version at 'arch/x86/include/asm/disabled-features.h': 71> #if defined(CONFIG_AS_VPCLMULQDQ)
Date: Tue, 29 Jun 2021 03:30:45 +0800
Message-ID: <202106290337.sfNP87Pe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3395090482535640870==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Kyung Min Park <kyung.min.park@intel.com>
CC: labuser <labuser@ssp-romleySNB-cdi172.jf.intel.com>
CC: Greg Tucker <greg.b.tucker@intel.com>
CC: Tomasz Kantecki <tomasz.kantecki@intel.com>
CC: Megha Dey <megha.dey@intel.com>

tree:   https://github.com/meghadey/crypto for_crypto_avx512
head:   a89c5880f0d6260dd593bf579df26f2a2d56ac32
commit: 7d992d6059e6953c2312c46d71b5638416a02895 [3/6] crypto: crct10dif - =
Accelerated CRC T10 DIF with vectorized instruction
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
>> Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version at 'arch/x86/include/asm/disabled-featur=
es.h':   71> #if defined(CONFIG_AS_VPCLMULQDQ)
>> Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version at 'arch/x86/include/asm/disabled-featur=
es.h':   72> # define DISABLE_VPCLMULQDQ	0
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version at 'arch/x86/include/asm/disabled-featur=
es.h':   73> #else
>> Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version at 'arch/x86/include/asm/disabled-featur=
es.h':   74> # define DISABLE_VPCLMULQDQ	(1 << (X86_FEATURE_VPCLMULQDQ & 31=
))
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version@'arch/x86/include/asm/disabled-featur=
es.h':   75> #endif
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version at 'arch/x86/include/asm/disabled-featur=
es.h':   76> =

   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version at 'arch/x86/include/asm/disabled-featur=
es.h':   91< 			 DISABLE_ENQCMD)
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version@'arch/x86/include/asm/disabled-featur=
es.h':   97> 			 DISABLE_ENQCMD|DISABLE_VPCLMULQDQ)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3395090482535640870==--

