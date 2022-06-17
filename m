Content-Type: multipart/mixed; boundary="===============8997690591658620433=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [alobakin:bitops 5/7] include/asm-generic/bitops/instrumented-non-atomic.h:141 _test_bit() warn: ignoring unreachable code.
Date: Sat, 18 Jun 2022 07:35:32 +0800
Message-ID: <202206180701.oLzXW2Ik-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8997690591658620433==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Alexander Lobakin <alexandr.lobakin@intel.com>

tree:   https://github.com/alobakin/linux bitops
head:   9bd39b17ce49d350eed93a031e0da6389067013e
commit: 54dcb250626d4ec53e9d5e41ee078b0c48849b38 [5/7] bitops: wrap non-ato=
mic bitops with a transparent macro
:::::: branch date: 9 hours ago
:::::: commit date: 11 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20618/202206180701.oLzXW2Ik-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
include/asm-generic/bitops/instrumented-non-atomic.h:141 _test_bit() warn: =
ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:141 _test_bit() warn: =
ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:141 _test_bit() warn: =
ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:141 _test_bit() warn: =
ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:141 _test_bit() warn: =
ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:141 _test_bit() warn: =
ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:141 _test_bit() warn: =
ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:99 ___test_and_set_bit=
() warn: ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:141 _test_bit() warn: =
ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:141 _test_bit() warn: =
ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:114 ___test_and_clear_=
bit() warn: ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:99 ___test_and_set_bit=
() warn: ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:141 _test_bit() warn: =
ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:141 _test_bit() warn: =
ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:141 _test_bit() warn: =
ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:99 ___test_and_set_bit=
() warn: ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:141 _test_bit() warn: =
ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:141 _test_bit() warn: =
ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:114 ___test_and_clear_=
bit() warn: ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:141 _test_bit() warn: =
ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:141 _test_bit() warn: =
ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:141 _test_bit() warn: =
ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:141 _test_bit() warn: =
ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:141 _test_bit() warn: =
ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:141 _test_bit() warn: =
ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:141 _test_bit() warn: =
ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:141 _test_bit() warn: =
ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:141 _test_bit() warn: =
ignoring unreachable code.

Old smatch warnings:
fs/exec.c:127 __do_sys_uselib() warn: passing zero to 'PTR_ERR'
fs/exec.c:127 __do_sys_uselib() warn: passing zero to 'PTR_ERR'
fs/namei.c:1571 lookup_dcache() warn: passing zero to 'ERR_PTR'
fs/namei.c:1668 lookup_fast() warn: passing zero to 'ERR_PTR'
fs/namei.c:2196 hash_name() error: uninitialized symbol 'bdata'.
fs/namei.c:3467 open_last_lookups() error: uninitialized symbol 'inode'.
fs/namei.c:3467 open_last_lookups() error: uninitialized symbol 'seq'.
fs/dcache.c:2922 __d_move() warn: statement has no effect 31
fs/splice.c:725 iter_file_splice_write() error: uninitialized symbol 'ret'.
arch/x86/include/asm/elf.h:164 elf_common_init() warn: inconsistent indenti=
ng
security/keys/keyring.c:1230 keyring_detect_cycle() warn: passing zero to '=
PTR_ERR'
lib/radix-tree.c:1046 radix_tree_tag_clear() error: uninitialized symbol 'o=
ffset'.
lib/radix-tree.c:1124 set_iter_tags() warn: unsigned 'tag_long' is never le=
ss than zero.
lib/vsprintf.c:1431 ip6_compressed_string() warn: possible spectre second h=
alf.  '*p'
lib/vsprintf.c:1434 ip6_compressed_string() warn: possible spectre second h=
alf.  '*p'
lib/rhashtable.c:550 rhashtable_insert_one() warn: passing zero to 'ERR_CAS=
T'
lib/rhashtable.c:616 rhashtable_try_insert() warn: passing zero to 'ERR_CAS=
T'
fs/nfs/dir.c:334 nfs_readdir_page_array_append() warn: potential spectre is=
sue 'array->array' [r]
fs/nfs/nfs4proc.c:1386 nfs4_opendata_alloc() error: we previously assumed '=
c' could be null (see line 1354)
fs/jffs2/nodemgmt.c:629 jffs2_mark_node_obsolete() warn: inconsistent inden=
ting
fs/jffs2/nodemgmt.c:640 jffs2_mark_node_obsolete() warn: inconsistent inden=
ting
fs/ubifs/lpt_commit.c:1649 dbg_check_ltab_lnum() warn: ignoring unreachable=
 code.
fs/ubifs/debug.c:2072 check_leaf() warn: is 'node' large enough for 'struct=
 ubifs_data_node'? 24
fs/ubifs/debug.c:2094 check_leaf() warn: is 'node' large enough for 'struct=
 ubifs_dent_node'? 24
fs/fuse/dir.c:502 get_security_context() warn: is 'ptr' large enough for 's=
truct fuse_secctx'? 0
fs/overlayfs/inode.c:1117 ovl_get_inode() error: we previously assumed 'low=
erpath' could be null (see line 1114)
fs/overlayfs/copy_up.c:421 ovl_set_origin() warn: variable dereferenced bef=
ore check 'fh' (see line 420)
fs/overlayfs/export.c:825 ovl_fh_to_dentry() warn: passing zero to 'PTR_ERR'
fs/cifs/connect.c:2830 generic_ip_connect() error: we previously assumed 's=
ocket' could be null (see line 2818)

vim +141 include/asm-generic/bitops/instrumented-non-atomic.h

068df05363b79f Marco Elver       2020-08-13   87  =

81d2c6f81996e0 Daniel Axtens     2019-08-20   88  /**
54dcb250626d4e Alexander Lobakin 2022-06-16   89   * ___test_and_set_bit - =
Set a bit and return its old value
81d2c6f81996e0 Daniel Axtens     2019-08-20   90   * @nr: Bit to set
81d2c6f81996e0 Daniel Axtens     2019-08-20   91   * @addr: Address to coun=
t from
81d2c6f81996e0 Daniel Axtens     2019-08-20   92   *
81d2c6f81996e0 Daniel Axtens     2019-08-20   93   * This operation is non-=
atomic. If two instances of this operation race, one
81d2c6f81996e0 Daniel Axtens     2019-08-20   94   * can appear to succeed =
but actually fail.
81d2c6f81996e0 Daniel Axtens     2019-08-20   95   */
521611f961a7dd Alexander Lobakin 2022-05-09   96  static __always_inline bo=
ol
54dcb250626d4e Alexander Lobakin 2022-06-16   97  ___test_and_set_bit(unsig=
ned long nr, volatile unsigned long *addr)
81d2c6f81996e0 Daniel Axtens     2019-08-20   98  {
068df05363b79f Marco Elver       2020-08-13  @99  	__instrument_read_write_=
bitop(nr, addr);
81d2c6f81996e0 Daniel Axtens     2019-08-20  100  	return arch___test_and_s=
et_bit(nr, addr);
81d2c6f81996e0 Daniel Axtens     2019-08-20  101  }
81d2c6f81996e0 Daniel Axtens     2019-08-20  102  =

81d2c6f81996e0 Daniel Axtens     2019-08-20  103  /**
54dcb250626d4e Alexander Lobakin 2022-06-16  104   * ___test_and_clear_bit =
- Clear a bit and return its old value
81d2c6f81996e0 Daniel Axtens     2019-08-20  105   * @nr: Bit to clear
81d2c6f81996e0 Daniel Axtens     2019-08-20  106   * @addr: Address to coun=
t from
81d2c6f81996e0 Daniel Axtens     2019-08-20  107   *
81d2c6f81996e0 Daniel Axtens     2019-08-20  108   * This operation is non-=
atomic. If two instances of this operation race, one
81d2c6f81996e0 Daniel Axtens     2019-08-20  109   * can appear to succeed =
but actually fail.
81d2c6f81996e0 Daniel Axtens     2019-08-20  110   */
521611f961a7dd Alexander Lobakin 2022-05-09  111  static __always_inline bo=
ol
54dcb250626d4e Alexander Lobakin 2022-06-16  112  ___test_and_clear_bit(uns=
igned long nr, volatile unsigned long *addr)
81d2c6f81996e0 Daniel Axtens     2019-08-20  113  {
068df05363b79f Marco Elver       2020-08-13 @114  	__instrument_read_write_=
bitop(nr, addr);
81d2c6f81996e0 Daniel Axtens     2019-08-20  115  	return arch___test_and_c=
lear_bit(nr, addr);
81d2c6f81996e0 Daniel Axtens     2019-08-20  116  }
81d2c6f81996e0 Daniel Axtens     2019-08-20  117  =

81d2c6f81996e0 Daniel Axtens     2019-08-20  118  /**
54dcb250626d4e Alexander Lobakin 2022-06-16  119   * ___test_and_change_bit=
 - Change a bit and return its old value
81d2c6f81996e0 Daniel Axtens     2019-08-20  120   * @nr: Bit to change
81d2c6f81996e0 Daniel Axtens     2019-08-20  121   * @addr: Address to coun=
t from
81d2c6f81996e0 Daniel Axtens     2019-08-20  122   *
81d2c6f81996e0 Daniel Axtens     2019-08-20  123   * This operation is non-=
atomic. If two instances of this operation race, one
81d2c6f81996e0 Daniel Axtens     2019-08-20  124   * can appear to succeed =
but actually fail.
81d2c6f81996e0 Daniel Axtens     2019-08-20  125   */
521611f961a7dd Alexander Lobakin 2022-05-09  126  static __always_inline bo=
ol
54dcb250626d4e Alexander Lobakin 2022-06-16  127  ___test_and_change_bit(un=
signed long nr, volatile unsigned long *addr)
81d2c6f81996e0 Daniel Axtens     2019-08-20  128  {
068df05363b79f Marco Elver       2020-08-13  129  	__instrument_read_write_=
bitop(nr, addr);
81d2c6f81996e0 Daniel Axtens     2019-08-20  130  	return arch___test_and_c=
hange_bit(nr, addr);
81d2c6f81996e0 Daniel Axtens     2019-08-20  131  }
81d2c6f81996e0 Daniel Axtens     2019-08-20  132  =

81d2c6f81996e0 Daniel Axtens     2019-08-20  133  /**
54dcb250626d4e Alexander Lobakin 2022-06-16  134   * _test_bit - Determine =
whether a bit is set
81d2c6f81996e0 Daniel Axtens     2019-08-20  135   * @nr: bit number to test
81d2c6f81996e0 Daniel Axtens     2019-08-20  136   * @addr: Address to star=
t counting from
81d2c6f81996e0 Daniel Axtens     2019-08-20  137   */
521611f961a7dd Alexander Lobakin 2022-05-09  138  static __always_inline bo=
ol
54dcb250626d4e Alexander Lobakin 2022-06-16  139  _test_bit(unsigned long n=
r, const volatile unsigned long *addr)
81d2c6f81996e0 Daniel Axtens     2019-08-20  140  {
27f937cc810aef Marco Elver       2020-01-21 @141  	instrument_atomic_read(a=
ddr + BIT_WORD(nr), sizeof(long));
81d2c6f81996e0 Daniel Axtens     2019-08-20  142  	return arch_test_bit(nr,=
 addr);
81d2c6f81996e0 Daniel Axtens     2019-08-20  143  }
81d2c6f81996e0 Daniel Axtens     2019-08-20  144  =


:::::: The code at line 141 was first introduced by commit
:::::: 27f937cc810aef63b0752f5bfbf383390dd076a1 asm-generic, kcsan: Add KCS=
AN instrumentation for bitops

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8997690591658620433==--

