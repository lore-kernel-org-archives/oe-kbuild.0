Content-Type: multipart/mixed; boundary="===============6385458254966045621=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: lib/overflow_kunit.c:341 overflow_shift_test() warn: '(_a_full << _to_shift)' 32768 can't fit into 32767 '*_d'
Date: Sun, 17 Apr 2022 01:52:01 +0800
Message-ID: <202204170138.HKc42N1r-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6385458254966045621==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Vitor Massaru Iha <vitor@massaru.org>
CC: Daniel Latypov <dlatypov@google.com>
CC: David Gow <davidgow@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   59250f8a7f3a60a2661b84cbafc1e0eb5d05ec9b
commit: 617f55e20743fc50c989b498f9dee289eb644cfd lib: overflow: Convert to =
Kunit
date:   7 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 7 weeks ago
config: riscv-randconfig-m031-20220416 (https://download.01.org/0day-ci/arc=
hive/20220417/202204170138.HKc42N1r-lkp(a)intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
lib/overflow_kunit.c:341 overflow_shift_test() warn: '(_a_full << _to_shift=
)' 32768 can't fit into 32767 '*_d'
lib/overflow_kunit.c:394 overflow_shift_test() warn: assigning 184467440737=
09551611 to unsigned variable '*_d'

Old smatch warnings:
lib/overflow_kunit.c:350 overflow_shift_test() warn: '(_a_full << _to_shift=
)' 69932 can't fit into 65535 '*_d'
lib/overflow_kunit.c:361 overflow_shift_test() warn: '(_a_full << _to_shift=
)' 34966 can't fit into 32767 '*_d'
lib/overflow_kunit.c:370 overflow_shift_test() warn: '(_a_full << _to_shift=
)' 300 can't fit into 127 '*_d'
lib/overflow_kunit.c:372 overflow_shift_test() warn: '(_a_full << _to_shift=
)' 69932 can't fit into 32767 '*_d'
lib/overflow_kunit.c:382 overflow_shift_test() warn: '(_a_full << _to_shift=
)' 65536 can't fit into 65535 '*_d'
lib/overflow_kunit.c:383 overflow_shift_test() warn: '(_a_full << _to_shift=
)' 65535 can't fit into 32767 '*_d'
lib/overflow_kunit.c:393 overflow_shift_test() warn: '(_a_full << _to_shift=
)' 18446744073709551611 can't fit into 32767 '*_d'
lib/overflow_kunit.c:394 overflow_shift_test() warn: '(_a_full << _to_shift=
)' 18446744073709551611 can't fit into 65535 '*_d'

vim +341 lib/overflow_kunit.c

d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  289  =

d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  290  	/* Sane shi=
fts. */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  291  	TEST_ONE_SH=
IFT(1, 0, u8, 1 << 0, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  292  	TEST_ONE_SH=
IFT(1, 4, u8, 1 << 4, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  293  	TEST_ONE_SH=
IFT(1, 7, u8, 1 << 7, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  294  	TEST_ONE_SH=
IFT(0xF, 4, u8, 0xF << 4, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  295  	TEST_ONE_SH=
IFT(1, 0, u16, 1 << 0, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  296  	TEST_ONE_SH=
IFT(1, 10, u16, 1 << 10, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  297  	TEST_ONE_SH=
IFT(1, 15, u16, 1 << 15, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  298  	TEST_ONE_SH=
IFT(0xFF, 8, u16, 0xFF << 8, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  299  	TEST_ONE_SH=
IFT(1, 0, int, 1 << 0, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  300  	TEST_ONE_SH=
IFT(1, 16, int, 1 << 16, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  301  	TEST_ONE_SH=
IFT(1, 30, int, 1 << 30, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  302  	TEST_ONE_SH=
IFT(1, 0, s32, 1 << 0, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  303  	TEST_ONE_SH=
IFT(1, 16, s32, 1 << 16, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  304  	TEST_ONE_SH=
IFT(1, 30, s32, 1 << 30, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  305  	TEST_ONE_SH=
IFT(1, 0, unsigned int, 1U << 0, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  306  	TEST_ONE_SH=
IFT(1, 20, unsigned int, 1U << 20, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  307  	TEST_ONE_SH=
IFT(1, 31, unsigned int, 1U << 31, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  308  	TEST_ONE_SH=
IFT(0xFFFFU, 16, unsigned int, 0xFFFFU << 16, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  309  	TEST_ONE_SH=
IFT(1, 0, u32, 1U << 0, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  310  	TEST_ONE_SH=
IFT(1, 20, u32, 1U << 20, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  311  	TEST_ONE_SH=
IFT(1, 31, u32, 1U << 31, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  312  	TEST_ONE_SH=
IFT(0xFFFFU, 16, u32, 0xFFFFU << 16, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  313  	TEST_ONE_SH=
IFT(1, 0, u64, 1ULL << 0, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  314  	TEST_ONE_SH=
IFT(1, 40, u64, 1ULL << 40, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  315  	TEST_ONE_SH=
IFT(1, 63, u64, 1ULL << 63, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  316  	TEST_ONE_SH=
IFT(0xFFFFFFFFULL, 32, u64, 0xFFFFFFFFULL << 32, false);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  317  =

d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  318  	/* Sane shi=
ft: start and end with 0, without a too-wide shift. */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  319  	TEST_ONE_SH=
IFT(0, 7, u8, 0, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  320  	TEST_ONE_SH=
IFT(0, 15, u16, 0, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  321  	TEST_ONE_SH=
IFT(0, 31, unsigned int, 0, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  322  	TEST_ONE_SH=
IFT(0, 31, u32, 0, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  323  	TEST_ONE_SH=
IFT(0, 63, u64, 0, false);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  324  =

d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  325  	/* Sane shi=
ft: start and end with 0, without reaching signed bit. */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  326  	TEST_ONE_SH=
IFT(0, 6, s8, 0, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  327  	TEST_ONE_SH=
IFT(0, 14, s16, 0, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  328  	TEST_ONE_SH=
IFT(0, 30, int, 0, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  329  	TEST_ONE_SH=
IFT(0, 30, s32, 0, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  330  	TEST_ONE_SH=
IFT(0, 62, s64, 0, false);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  331  =

d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  332  	/* Overflow=
: shifted the bit off the end. */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  333  	TEST_ONE_SH=
IFT(1, 8, u8, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  334  	TEST_ONE_SH=
IFT(1, 16, u16, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  335  	TEST_ONE_SH=
IFT(1, 32, unsigned int, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  336  	TEST_ONE_SH=
IFT(1, 32, u32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  337  	TEST_ONE_SH=
IFT(1, 64, u64, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  338  =

d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  339  	/* Overflow=
: shifted into the signed bit. */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  340  	TEST_ONE_SH=
IFT(1, 7, s8, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16 @341  	TEST_ONE_SH=
IFT(1, 15, s16, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  342  	TEST_ONE_SH=
IFT(1, 31, int, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  343  	TEST_ONE_SH=
IFT(1, 31, s32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  344  	TEST_ONE_SH=
IFT(1, 63, s64, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  345  =

d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  346  	/* Overflow=
: high bit falls off unsigned types. */
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  347  	/* 10010110=
 */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  348  	TEST_ONE_SH=
IFT(150, 1, u8, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  349  	/* 10001000=
10010110 */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  350  	TEST_ONE_SH=
IFT(34966, 1, u16, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  351  	/* 10000100=
000010001000100010010110 */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  352  	TEST_ONE_SH=
IFT(2215151766U, 1, u32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  353  	TEST_ONE_SH=
IFT(2215151766U, 1, unsigned int, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  354  	/* 10000010=
00010000010000000100000010000100000010001000100010010110 */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  355  	TEST_ONE_SH=
IFT(9372061470395238550ULL, 1, u64, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  356  =

d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  357  	/* Overflow=
: bit shifted into signed bit on signed types. */
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  358  	/* 01001011=
 */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  359  	TEST_ONE_SH=
IFT(75, 1, s8, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  360  	/* 01000100=
01001011 */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  361  	TEST_ONE_SH=
IFT(17483, 1, s16, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  362  	/* 01000010=
000001000100010001001011 */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  363  	TEST_ONE_SH=
IFT(1107575883, 1, s32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  364  	TEST_ONE_SH=
IFT(1107575883, 1, int, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  365  	/* 01000001=
00001000001000000010000001000010000001000100010001001011 */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  366  	TEST_ONE_SH=
IFT(4686030735197619275LL, 1, s64, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  367  =

d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  368  	/* Overflow=
: bit shifted past signed bit on signed types. */
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  369  	/* 01001011=
 */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  370  	TEST_ONE_SH=
IFT(75, 2, s8, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  371  	/* 01000100=
01001011 */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  372  	TEST_ONE_SH=
IFT(17483, 2, s16, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  373  	/* 01000010=
000001000100010001001011 */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  374  	TEST_ONE_SH=
IFT(1107575883, 2, s32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  375  	TEST_ONE_SH=
IFT(1107575883, 2, int, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  376  	/* 01000001=
00001000001000000010000001000010000001000100010001001011 */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  377  	TEST_ONE_SH=
IFT(4686030735197619275LL, 2, s64, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  378  =

d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  379  	/* Overflow=
: values larger than destination type. */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  380  	TEST_ONE_SH=
IFT(0x100, 0, u8, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  381  	TEST_ONE_SH=
IFT(0xFF, 0, s8, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  382  	TEST_ONE_SH=
IFT(0x10000U, 0, u16, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  383  	TEST_ONE_SH=
IFT(0xFFFFU, 0, s16, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  384  	TEST_ONE_SH=
IFT(0x100000000ULL, 0, u32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  385  	TEST_ONE_SH=
IFT(0x100000000ULL, 0, unsigned int, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  386  	TEST_ONE_SH=
IFT(0xFFFFFFFFUL, 0, s32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  387  	TEST_ONE_SH=
IFT(0xFFFFFFFFUL, 0, int, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  388  	TEST_ONE_SH=
IFT(0xFFFFFFFFFFFFFFFFULL, 0, s64, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  389  =

d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  390  	/* Nonsense=
: negative initial value. */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  391  	TEST_ONE_SH=
IFT(-1, 0, s8, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  392  	TEST_ONE_SH=
IFT(-1, 0, u8, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  393  	TEST_ONE_SH=
IFT(-5, 0, s16, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16 @394  	TEST_ONE_SH=
IFT(-5, 0, u16, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  395  	TEST_ONE_SH=
IFT(-10, 0, int, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  396  	TEST_ONE_SH=
IFT(-10, 0, unsigned int, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  397  	TEST_ONE_SH=
IFT(-100, 0, s32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  398  	TEST_ONE_SH=
IFT(-100, 0, u32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  399  	TEST_ONE_SH=
IFT(-10000, 0, s64, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  400  	TEST_ONE_SH=
IFT(-10000, 0, u64, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  401  =

d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  402  	/* Nonsense=
: negative shift values. */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  403  	TEST_ONE_SH=
IFT(0, -5, s8, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  404  	TEST_ONE_SH=
IFT(0, -5, u8, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  405  	TEST_ONE_SH=
IFT(0, -10, s16, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  406  	TEST_ONE_SH=
IFT(0, -10, u16, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  407  	TEST_ONE_SH=
IFT(0, -15, int, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  408  	TEST_ONE_SH=
IFT(0, -15, unsigned int, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  409  	TEST_ONE_SH=
IFT(0, -20, s32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  410  	TEST_ONE_SH=
IFT(0, -20, u32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  411  	TEST_ONE_SH=
IFT(0, -30, s64, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  412  	TEST_ONE_SH=
IFT(0, -30, u64, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  413  =

d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  414  	/* Overflow=
: shifted@or beyond entire type's bit width. */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  415  	TEST_ONE_SH=
IFT(0, 8, u8, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  416  	TEST_ONE_SH=
IFT(0, 9, u8, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  417  	TEST_ONE_SH=
IFT(0, 8, s8, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  418  	TEST_ONE_SH=
IFT(0, 9, s8, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  419  	TEST_ONE_SH=
IFT(0, 16, u16, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  420  	TEST_ONE_SH=
IFT(0, 17, u16, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  421  	TEST_ONE_SH=
IFT(0, 16, s16, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  422  	TEST_ONE_SH=
IFT(0, 17, s16, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  423  	TEST_ONE_SH=
IFT(0, 32, u32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  424  	TEST_ONE_SH=
IFT(0, 33, u32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  425  	TEST_ONE_SH=
IFT(0, 32, int, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  426  	TEST_ONE_SH=
IFT(0, 33, int, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  427  	TEST_ONE_SH=
IFT(0, 32, s32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  428  	TEST_ONE_SH=
IFT(0, 33, s32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  429  	TEST_ONE_SH=
IFT(0, 64, u64, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  430  	TEST_ONE_SH=
IFT(0, 65, u64, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  431  	TEST_ONE_SH=
IFT(0, 64, s64, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  432  	TEST_ONE_SH=
IFT(0, 65, s64, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  433  =

d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  434  	/*
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  435  	 * Corner c=
ase: for unsigned types, we fail when we've shifted
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  436  	 * through =
the entire width of bits. For signed types, we might
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  437  	 * want to =
match this behavior, but that would mean noticing if
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  438  	 * we shift=
 through all but the signed bit, and this is not
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  439  	 * currentl=
y detected (but we'll notice an overflow into the
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  440  	 * signed b=
it). So, for now, we will test this condition but
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  441  	 * mark it =
as not expected to overflow.
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  442  	 */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  443  	TEST_ONE_SH=
IFT(0, 7, s8, 0, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  444  	TEST_ONE_SH=
IFT(0, 15, s16, 0, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  445  	TEST_ONE_SH=
IFT(0, 31, int, 0, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  446  	TEST_ONE_SH=
IFT(0, 31, s32, 0, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  447  	TEST_ONE_SH=
IFT(0, 63, s64, 0, false);
8e7c8ca6b98890 lib/test_overflow.c  Kees Cook 2021-09-20  448  =

617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  449  	kunit_info(=
test, "%d shift tests finished\n", count);
8e7c8ca6b98890 lib/test_overflow.c  Kees Cook 2021-09-20  450  #undef TEST_=
ONE_SHIFT
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  451  }
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  452  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6385458254966045621==--

