Content-Type: multipart/mixed; boundary="===============3351792532785842239=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [norov:fns 4/23] include/asm-generic/bitops/generic-non-atomic.h:127 generic_test_bit() warn: shift has higher precedence than mask
Date: Sun, 03 Jul 2022 01:45:14 +0800
Message-ID: <202207030120.DbCGbr9n-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3351792532785842239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Yury Norov <yury.norov@gmail.com>

tree:   https://github.com/norov/linux fns
head:   1df9509fd92a58cb37e9a419235823bbb13367de
commit: 0e862838f290147ea9c16db852d8d494b552d38d [4/23] bitops: unify non-a=
tomic bitops prototypes across architectures
:::::: branch date: 20 hours ago
:::::: commit date: 2 days ago
config: microblaze-randconfig-m031-20220629 (https://download.01.org/0day-c=
i/archive/20220703/202207030120.DbCGbr9n-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
include/asm-generic/bitops/generic-non-atomic.h:127 generic_test_bit() warn=
: shift has higher precedence than mask
include/asm-generic/bitops/generic-non-atomic.h:127 generic_test_bit() warn=
: ignoring unreachable code.
include/asm-generic/bitops/generic-non-atomic.h:127 generic_test_bit() warn=
: shift has higher precedence than mask
include/asm-generic/bitops/generic-non-atomic.h:127 generic_test_bit() warn=
: shift has higher precedence than mask
include/asm-generic/bitops/generic-non-atomic.h:127 generic_test_bit() warn=
: ignoring unreachable code.
include/asm-generic/bitops/generic-non-atomic.h:127 generic_test_bit() warn=
: shift has higher precedence than mask
include/asm-generic/bitops/generic-non-atomic.h:127 generic_test_bit() warn=
: shift has higher precedence than mask
include/asm-generic/bitops/generic-non-atomic.h:127 generic_test_bit() warn=
: ignoring unreachable code.
include/asm-generic/bitops/generic-non-atomic.h:127 generic_test_bit() warn=
: shift has higher precedence than mask

Old smatch warnings:
arch/microblaze/include/asm/thread_info.h:85 current_thread_info() error: u=
ninitialized symbol 'sp'.

vim +127 include/asm-generic/bitops/generic-non-atomic.h

21bb8af513d35c Alexander Lobakin 2022-06-24  113  =

21bb8af513d35c Alexander Lobakin 2022-06-24  114  /**
21bb8af513d35c Alexander Lobakin 2022-06-24  115   * generic_test_bit - Det=
ermine whether a bit is set
21bb8af513d35c Alexander Lobakin 2022-06-24  116   * @nr: bit number to test
21bb8af513d35c Alexander Lobakin 2022-06-24  117   * @addr: Address to star=
t counting from
21bb8af513d35c Alexander Lobakin 2022-06-24  118   */
0e862838f29014 Alexander Lobakin 2022-06-24  119  static __always_inline bo=
ol
0e862838f29014 Alexander Lobakin 2022-06-24  120  generic_test_bit(unsigned=
 long nr, const volatile unsigned long *addr)
21bb8af513d35c Alexander Lobakin 2022-06-24  121  {
21bb8af513d35c Alexander Lobakin 2022-06-24  122  	/*
21bb8af513d35c Alexander Lobakin 2022-06-24  123  	 * Unlike the bitops wit=
h the '__' prefix above, this one *is* atomic,
21bb8af513d35c Alexander Lobakin 2022-06-24  124  	 * so `volatile` must al=
ways stay here with no cast-aways. See
21bb8af513d35c Alexander Lobakin 2022-06-24  125  	 * `Documentation/atomic=
_bitops.txt` for the details.
21bb8af513d35c Alexander Lobakin 2022-06-24  126  	 */
21bb8af513d35c Alexander Lobakin 2022-06-24 @127  	return 1UL & (addr[BIT_W=
ORD(nr)] >> (nr & (BITS_PER_LONG-1)));
21bb8af513d35c Alexander Lobakin 2022-06-24  128  }
21bb8af513d35c Alexander Lobakin 2022-06-24  129  =


:::::: The code at line 127 was first introduced by commit
:::::: 21bb8af513d35c005c401706030f4eb469538d1d bitops: always define asm-g=
eneric non-atomic bitops

:::::: TO: Alexander Lobakin <alexandr.lobakin@intel.com>
:::::: CC: Yury Norov <yury.norov@gmail.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3351792532785842239==--

