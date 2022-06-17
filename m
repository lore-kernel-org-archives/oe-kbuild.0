Content-Type: multipart/mixed; boundary="===============0491877755310449080=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [alobakin:bitops 3/7] arch/x86/include/asm/bitops.h:225 arch_test_bit() warn: ignoring unreachable code.
Date: Sat, 18 Jun 2022 04:30:01 +0800
Message-ID: <202206180454.f8fDqO3S-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0491877755310449080==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Alexander Lobakin <alexandr.lobakin@intel.com>
CC: Yury Norov <yury.norov@gmail.com>

tree:   https://github.com/alobakin/linux bitops
head:   9bd39b17ce49d350eed93a031e0da6389067013e
commit: 521611f961a7dda92eefa26e1afd3914c06af64e [3/7] bitops: unify non-at=
omic bitops prototypes across architectures
:::::: branch date: 6 hours ago
:::::: commit date: 8 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20618/202206180454.f8fDqO3S-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
arch/x86/include/asm/bitops.h:225 arch_test_bit() warn: ignoring unreachabl=
e code.
arch/x86/include/asm/bitops.h:225 arch_test_bit() warn: ignoring unreachabl=
e code.
arch/x86/include/asm/bitops.h:225 arch_test_bit() warn: ignoring unreachabl=
e code.
arch/x86/include/asm/bitops.h:225 arch_test_bit() warn: ignoring unreachabl=
e code.
arch/x86/include/asm/bitops.h:225 arch_test_bit() warn: ignoring unreachabl=
e code.

Old smatch warnings:
include/asm-generic/bitops/instrumented-non-atomic.h:141 test_bit() warn: i=
gnoring unreachable code.
arch/x86/kernel/cpu/common.c:1440 cpu_parse_early_param() warn: potential s=
pectre issue 'x86_cap_flags' [w] (local cap)
include/asm-generic/bitops/instrumented-non-atomic.h:141 test_bit() warn: i=
gnoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:141 test_bit() warn: i=
gnoring unreachable code.

vim +225 arch/x86/include/asm/bitops.h

1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
  221  =

521611f961a7dd arch/x86/include/asm/bitops.h Alexander Lobakin   2022-05-09=
  222  static __always_inline bool
521611f961a7dd arch/x86/include/asm/bitops.h Alexander Lobakin   2022-05-09=
  223  arch_test_bit(unsigned long nr, const volatile unsigned long *addr)
521611f961a7dd arch/x86/include/asm/bitops.h Alexander Lobakin   2022-05-09=
  224  {
521611f961a7dd arch/x86/include/asm/bitops.h Alexander Lobakin   2022-05-09=
 @225  	return __builtin_constant_p(nr) ? constant_test_bit(nr, addr) :
521611f961a7dd arch/x86/include/asm/bitops.h Alexander Lobakin   2022-05-09=
  226  					  variable_test_bit(nr, addr);
521611f961a7dd arch/x86/include/asm/bitops.h Alexander Lobakin   2022-05-09=
  227  }
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
  228  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0491877755310449080==--

