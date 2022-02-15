Content-Type: multipart/mixed; boundary="===============3635827778559501379=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/rds/af_rds.c:339:10: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Wed, 16 Feb 2022 00:00:17 +0800
Message-ID: <202202152357.0o4qPUyP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3635827778559501379==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d567f5db412ed52de0b3b3efca4a451263de6108
commit: 04324f44cb69a03fdc8f2ee52386a4fdf6a0043b MIPS: Remove get_fs/set_fs
date:   11 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 11 months ago
config: mips-randconfig-c004-20220211 (https://download.01.org/0day-ci/arch=
ive/20220215/202202152357.0o4qPUyP-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f6685f=
774697c85d6a352dcea013f46a99f9fe31)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D04324f44cb69a03fdc8f2ee52386a4fdf6a0043b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 04324f44cb69a03fdc8f2ee52386a4fdf6a0043b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                 ^
   arch/mips/include/asm/uaccess.h:86:2: note: expanded from macro 'access_=
ok'
           likely(__access_ok((addr), (size)))
           ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/uaccess.h:157:40: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                                 ^
   arch/mips/include/asm/uaccess.h:86:2: note: expanded from macro 'access_=
ok'
           likely(__access_ok((addr), (size)))
           ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^
   include/linux/compiler.h:45:66: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:472:2: note: Returning without writing t=
o 'to->sin_addr.s_addr'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0, which particip=
ates in a condition later
           if (unlikely(res))
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->s=
in_addr.s_addr'
           return res;
           ^
   include/linux/uaccess.h:163:2: note: Returning zero (loaded from 'res'),=
 which participates in a condition later
           return res;
           ^~~~~~~~~~
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->s=
in_addr.s_addr'
           return n;
           ^
   include/linux/uaccess.h:193:2: note: Returning zero (loaded from 'n'), w=
hich participates in a condition later
           return n;
           ^~~~~~~~
   include/linux/sockptr.h:48:10: note: Returning from 'copy_from_user'
                   return copy_from_user(dst, src.user + offset, size);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sockptr.h:48:3: note: Returning without writing to 'dst->s=
in_addr.s_addr'
                   return copy_from_user(dst, src.user + offset, size);
                   ^
   include/linux/sockptr.h:48:3: note: Returning zero, which participates i=
n a condition later
                   return copy_from_user(dst, src.user + offset, size);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sockptr.h:55:9: note: Returning from 'copy_from_sockptr_of=
fset'
           return copy_from_sockptr_offset(dst, src, 0, size);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sockptr.h:55:2: note: Returning without writing to 'dst->s=
in_addr.s_addr'
           return copy_from_sockptr_offset(dst, src, 0, size);
           ^
   include/linux/sockptr.h:55:2: note: Returning zero, which participates i=
n a condition later
           return copy_from_sockptr_offset(dst, src, 0, size);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/rds/af_rds.c:310:7: note: Returning from 'copy_from_sockptr'
                   if (copy_from_sockptr(&sin, optval,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/rds/af_rds.c:310:3: note: Taking false branch
                   if (copy_from_sockptr(&sin, optval,
                   ^
   net/rds/af_rds.c:315:3: note: 1st function call argument is an uninitial=
ized value
                   ipv6_addr_set_v4mapped(sin.sin_addr.s_addr, &sin6.sin6_a=
ddr);
                   ^                      ~~~~~~~~~~~~~~~~~~~
>> net/rds/af_rds.c:339:10: warning: Assigned value is garbage or undefined=
 [clang-analyzer-core.uninitialized.Assign]
           *optvar =3D !!value;
                   ^
   net/rds/af_rds.c:438:6: note: Assuming 'level' is equal to SOL_RDS
           if (level !=3D SOL_RDS) {
               ^~~~~~~~~~~~~~~~
   net/rds/af_rds.c:438:2: note: Taking false branch
           if (level !=3D SOL_RDS) {
           ^
   net/rds/af_rds.c:443:2: note: Control jumps to 'case 5:'  at line 456
           switch (optname) {
           ^
   net/rds/af_rds.c:457:9: note: Calling 'rds_set_bool_option'
                   ret =3D rds_set_bool_option(&rs->rs_recverr, optval, opt=
len);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   net/rds/af_rds.c:333:2: note: 'value' declared without an initial value
           int value;
           ^~~~~~~~~
   net/rds/af_rds.c:335:6: note: Assuming the condition is false
           if (optlen < sizeof(int))
               ^~~~~~~~~~~~~~~~~~~~
   net/rds/af_rds.c:335:2: note: Taking false branch
           if (optlen < sizeof(int))
           ^
   net/rds/af_rds.c:337:6: note: Calling 'copy_from_sockptr'
           if (copy_from_sockptr(&value, optval, sizeof(int)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sockptr.h:55:9: note: Calling 'copy_from_sockptr_offset'
           return copy_from_sockptr_offset(dst, src, 0, size);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sockptr.h:47:6: note: Assuming the condition is true
           if (!sockptr_is_kernel(src))
               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sockptr.h:47:2: note: Taking true branch
           if (!sockptr_is_kernel(src))
           ^
   include/linux/sockptr.h:48:10: note: Calling 'copy_from_user'
                   return copy_from_user(dst, src.user + offset, size);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Calling 'should_fail_usercopy'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/fault-inject-usercopy.h:18:49: note: Returning zero, which=
 participates in a condition later
   static inline bool should_fail_usercopy(void) { return false; }
                                                   ^~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Returning from 'should_fail_usercop=
y'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:40: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                                 ^
   arch/mips/include/asm/uaccess.h:86:2: note: expanded from macro 'access_=
ok'
           likely(__access_ok((addr), (size)))
           ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/uaccess.h:157:40: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                                 ^
   arch/mips/include/asm/uaccess.h:86:2: note: expanded from macro 'access_=
ok'
           likely(__access_ok((addr), (size)))
           ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^
   include/linux/compiler.h:45:66: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:472:2: note: Returning without writing t=
o '*to'
           return __cu_len_r;
--
                                                 ^
   arch/mips/include/asm/uaccess.h:86:2: note: expanded from macro 'access_=
ok'
           likely(__access_ok((addr), (size)))
           ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/uaccess.h:157:40: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                                 ^
   arch/mips/include/asm/uaccess.h:86:2: note: expanded from macro 'access_=
ok'
           likely(__access_ok((addr), (size)))
           ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^
   include/linux/compiler.h:45:66: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:472:2: note: Returning without writing t=
o '*to'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0, which particip=
ates in a condition later
           if (unlikely(res))
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to '*to'
           return res;
           ^
   include/linux/uaccess.h:163:2: note: Returning zero (loaded from 'res'),=
 which participates in a condition later
           return res;
           ^~~~~~~~~~
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to '*to'
           return n;
           ^
   include/linux/uaccess.h:193:2: note: Returning zero (loaded from 'n'), w=
hich participates in a condition later
           return n;
           ^~~~~~~~
   include/linux/sockptr.h:48:10: note: Returning from 'copy_from_user'
                   return copy_from_user(dst, src.user + offset, size);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sockptr.h:48:3: note: Returning without writing to '*dst'
                   return copy_from_user(dst, src.user + offset, size);
                   ^
   include/linux/sockptr.h:48:3: note: Returning zero, which participates i=
n a condition later
                   return copy_from_user(dst, src.user + offset, size);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sockptr.h:55:9: note: Returning from 'copy_from_sockptr_of=
fset'
           return copy_from_sockptr_offset(dst, src, 0, size);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sockptr.h:55:2: note: Returning without writing to '*dst'
           return copy_from_sockptr_offset(dst, src, 0, size);
           ^
   include/linux/sockptr.h:55:2: note: Returning zero, which participates i=
n a condition later
           return copy_from_sockptr_offset(dst, src, 0, size);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/rds/af_rds.c:370:6: note: Returning from 'copy_from_sockptr'
           if (copy_from_sockptr(&t_type, optval, sizeof(t_type)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/rds/af_rds.c:370:2: note: Taking false branch
           if (copy_from_sockptr(&t_type, optval, sizeof(t_type)))
           ^
   net/rds/af_rds.c:373:13: note: The left operand of '<' is a garbage value
           if (t_type < 0 || t_type >=3D RDS_TRANS_COUNT)
               ~~~~~~ ^
>> net/rds/af_rds.c:392:12: warning: Branch condition evaluates to a garbag=
e value [clang-analyzer-core.uninitialized.Branch]
           valbool =3D val ? 1 : 0;
                     ^
   net/rds/af_rds.c:438:6: note: Assuming 'level' is equal to SOL_RDS
           if (level !=3D SOL_RDS) {
               ^~~~~~~~~~~~~~~~
   net/rds/af_rds.c:438:2: note: Taking false branch
           if (level !=3D SOL_RDS) {
           ^
   net/rds/af_rds.c:443:2: note: Control jumps to 'case 29:'  at line 467
           switch (optname) {
           ^
   net/rds/af_rds.c:470:9: note: Calling 'rds_enable_recvtstamp'
                   ret =3D rds_enable_recvtstamp(sock->sk, optval, optlen, =
optname);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   net/rds/af_rds.c:384:6: note: 'val' declared without an initial value
           int val, valbool;
               ^~~
   net/rds/af_rds.c:386:6: note: Assuming the condition is false
           if (optlen !=3D sizeof(int))
               ^~~~~~~~~~~~~~~~~~~~~
   net/rds/af_rds.c:386:2: note: Taking false branch
           if (optlen !=3D sizeof(int))
           ^
   net/rds/af_rds.c:389:6: note: Calling 'copy_from_sockptr'
           if (copy_from_sockptr(&val, optval, sizeof(int)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sockptr.h:55:9: note: Calling 'copy_from_sockptr_offset'
           return copy_from_sockptr_offset(dst, src, 0, size);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sockptr.h:47:6: note: Assuming the condition is true
           if (!sockptr_is_kernel(src))
               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sockptr.h:47:2: note: Taking true branch
           if (!sockptr_is_kernel(src))
           ^
   include/linux/sockptr.h:48:10: note: Calling 'copy_from_user'
                   return copy_from_user(dst, src.user + offset, size);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Calling 'should_fail_usercopy'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/fault-inject-usercopy.h:18:49: note: Returning zero, which=
 participates in a condition later
   static inline bool should_fail_usercopy(void) { return false; }
                                                   ^~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Returning from 'should_fail_usercop=
y'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:40: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                                 ^
   arch/mips/include/asm/uaccess.h:86:2: note: expanded from macro 'access_=
ok'
           likely(__access_ok((addr), (size)))
           ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/uaccess.h:157:40: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                                 ^
   arch/mips/include/asm/uaccess.h:86:2: note: expanded from macro 'access_=
ok'
           likely(__access_ok((addr), (size)))
           ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^
   include/linux/compiler.h:45:66: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:472:2: note: Returning without writing t=
o '*to'
           return __cu_len_r;
--
   drivers/base/test/test_async_driver_probe.c:131:6: note: Assuming 'err' =
is 0
           if (err) {
               ^~~
   drivers/base/test/test_async_driver_probe.c:131:2: note: Taking false br=
anch
           if (err) {
           ^
   drivers/base/test/test_async_driver_probe.c:139:6: note: Assuming the co=
ndition is false
           if (duration > TEST_PROBE_THRESHOLD) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/test/test_async_driver_probe.c:139:2: note: Taking false br=
anch
           if (duration > TEST_PROBE_THRESHOLD) {
           ^
   drivers/base/test/test_async_driver_probe.c:147:2: note: Assuming 'cpu' =
is >=3D 'nr_cpu_ids'
           for_each_online_cpu(cpu) {
           ^
   include/linux/cpumask.h:818:36: note: expanded from macro 'for_each_onli=
ne_cpu'
   #define for_each_online_cpu(cpu)   for_each_cpu((cpu), cpu_online_mask)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:272:3: note: expanded from macro 'for_each_cpu'
                   (cpu) < nr_cpu_ids;)
                   ^~~~~~~~~~~~~~~~~~
   drivers/base/test/test_async_driver_probe.c:147:2: note: Loop condition =
is false. Execution continues on line 164
           for_each_online_cpu(cpu) {
           ^
   include/linux/cpumask.h:818:36: note: expanded from macro 'for_each_onli=
ne_cpu'
   #define for_each_online_cpu(cpu)   for_each_cpu((cpu), cpu_online_mask)
                                      ^
   include/linux/cpumask.h:270:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D -1;                                \
           ^
   drivers/base/test/test_async_driver_probe.c:166:12: note: Dereference of=
 null pointer (loaded from variable 'pdev')
           dev_info(&(*pdev)->dev,
                     ^
   include/linux/dev_printk.h:118:12: note: expanded from macro 'dev_info'
           _dev_info(dev, dev_fmt(fmt), ##__VA_ARGS__)
                     ^~~
   drivers/base/test/test_async_driver_probe.c:177:2: warning: Value stored=
 to 'nid' is never read [clang-analyzer-deadcode.DeadStores]
           nid =3D cpu_to_node(cpu);
           ^
   drivers/base/test/test_async_driver_probe.c:177:2: note: Value stored to=
 'nid' is never read
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   kernel/crash_core.c:241:14: warning: Dereference of null pointer (loaded=
 from variable 'crash_base') [clang-analyzer-core.NullDereference]
           *crash_base =3D 0;
                       ^
   kernel/crash_core.c:293:62: note: Passing value via 4th parameter 'crash=
_base'
           return __parse_crashkernel(cmdline, system_ram, crash_size, cras=
h_base,
                                                                       ^~~~=
~~~~~~
   kernel/crash_core.c:293:9: note: Calling '__parse_crashkernel'
           return __parse_crashkernel(cmdline, system_ram, crash_size, cras=
h_base,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   kernel/crash_core.c:239:9: note: Assuming 'crash_size' is non-null
           BUG_ON(!crash_size || !crash_base);
                  ^
   arch/mips/include/asm/bug.h:34:44: note: expanded from macro 'BUG_ON'
   #define BUG_ON(C) __BUG_ON((unsigned long)(C))
                                              ^
   kernel/crash_core.c:239:9: note: Left side of '||' is false
           BUG_ON(!crash_size || !crash_base);
                  ^
   kernel/crash_core.c:239:24: note: Assuming 'crash_base' is null
           BUG_ON(!crash_size || !crash_base);
                                 ^
   arch/mips/include/asm/bug.h:34:44: note: expanded from macro 'BUG_ON'
   #define BUG_ON(C) __BUG_ON((unsigned long)(C))
                                              ^
   kernel/crash_core.c:241:14: note: Dereference of null pointer (loaded fr=
om variable 'crash_base')
           *crash_base =3D 0;
            ~~~~~~~~~~ ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   kernel/cgroup/cgroup-v1.c:1085:3: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(root->release_agent_path, ctx->release_agent);
                   ^~~~~~
   kernel/cgroup/cgroup-v1.c:1085:3: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
                   strcpy(root->release_agent_path, ctx->release_agent);
                   ^~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   net/ipv4/udp.c:728:2: warning: Value stored to 'err' is never read [clan=
g-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   net/ipv4/udp.c:728:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
>> net/ipv4/udp.c:2611:12: warning: Branch condition evaluates to a garbage=
 value [clang-analyzer-core.uninitialized.Branch]
           valbool =3D val ? 1 : 0;
                     ^
   net/ipv4/udp.c:2715:6: note: Assuming 'level' is equal to SOL_UDP
           if (level =3D=3D SOL_UDP  ||  level =3D=3D SOL_UDPLITE)
               ^~~~~~~~~~~~~~~~
   net/ipv4/udp.c:2715:24: note: Left side of '||' is true
           if (level =3D=3D SOL_UDP  ||  level =3D=3D SOL_UDPLITE)
                                 ^
   net/ipv4/udp.c:2716:10: note: Calling 'udp_lib_setsockopt'
                   return udp_lib_setsockopt(sk, level, optname,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/udp.c:2601:6: note: 'val' declared without an initial value
           int val, valbool;
               ^~~
   net/ipv4/udp.c:2603:30: note: Assuming field 'sk_protocol' is equal to I=
PPROTO_UDPLITE
           int is_udplite =3D IS_UDPLITE(sk);
                                       ^
   include/linux/udp.h:144:27: note: expanded from macro 'IS_UDPLITE'
   #define IS_UDPLITE(__sk) (__sk->sk_protocol =3D=3D IPPROTO_UDPLITE)
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/udp.c:2605:6: note: Assuming the condition is false
           if (optlen < sizeof(int))
               ^~~~~~~~~~~~~~~~~~~~
   net/ipv4/udp.c:2605:2: note: Taking false branch
           if (optlen < sizeof(int))
           ^
   net/ipv4/udp.c:2608:6: note: Calling 'copy_from_sockptr'
           if (copy_from_sockptr(&val, optval, sizeof(val)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sockptr.h:55:9: note: Calling 'copy_from_sockptr_offset'
           return copy_from_sockptr_offset(dst, src, 0, size);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sockptr.h:47:6: note: Assuming the condition is true
           if (!sockptr_is_kernel(src))
               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sockptr.h:47:2: note: Taking true branch
           if (!sockptr_is_kernel(src))
           ^
   include/linux/sockptr.h:48:10: note: Calling 'copy_from_user'
                   return copy_from_user(dst, src.user + offset, size);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:6: note: Assuming the condition is false
           if (likely(check_copy_size(to, n, false)))
               ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Calling 'should_fail_usercopy'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/fault-inject-usercopy.h:18:49: note: Returning zero, which=
 participates in a condition later
   static inline bool should_fail_usercopy(void) { return false; }
                                                   ^~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Returning from 'should_fail_usercop=
y'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:40: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                                 ^
   arch/mips/include/asm/uaccess.h:86:2: note: expanded from macro 'access_=
ok'
           likely(__access_ok((addr), (size)))
           ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/uaccess.h:157:40: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                                 ^
   arch/mips/include/asm/uaccess.h:86:2: note: expanded from macro 'access_=
ok'
           likely(__access_ok((addr), (size)))
           ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^
   include/linux/compiler.h:45:66: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
--
   include/linux/skbuff.h:2518:9: note: Access to field 'head' results in a=
 dereference of a null pointer (loaded from variable 'skb')
           return skb->head + skb->transport_header;
                  ^~~
   include/net/sock.h:2515:13: warning: Dereference of null pointer (loaded=
 from variable 'tx_flags') [clang-analyzer-core.NullDereference]
                   *tx_flags |=3D SKBTX_WIFI_STATUS;
                             ^
   net/ipv6/raw.c:631:6: note: Assuming 'length' is <=3D field 'mtu'
           if (length > rt->dst.dev->mtu) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/raw.c:631:2: note: Taking false branch
           if (length > rt->dst.dev->mtu) {
           ^
   net/ipv6/raw.c:635:6: note: Assuming the condition is false
           if (length < sizeof(struct ipv6hdr))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/raw.c:635:2: note: Taking false branch
           if (length < sizeof(struct ipv6hdr))
           ^
   net/ipv6/raw.c:637:6: note: Assuming the condition is false
           if (flags&MSG_PROBE)
               ^~~~~~~~~~~~~~~
   net/ipv6/raw.c:637:2: note: Taking false branch
           if (flags&MSG_PROBE)
           ^
   net/ipv6/raw.c:643:6: note: Assuming 'skb' is non-null
           if (!skb)
               ^~~~
   net/ipv6/raw.c:643:2: note: Taking false branch
           if (!skb)
           ^
   net/ipv6/raw.c:645:2: note: Calling 'skb_reserve'
           skb_reserve(skb, hlen);
           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2400:1: note: Returning without writing to 'skb->=
end'
   }
   ^
   net/ipv6/raw.c:645:2: note: Returning from 'skb_reserve'
           skb_reserve(skb, hlen);
           ^~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/raw.c:652:2: note: Value assigned to field 'end'
           skb_put(skb, length);
           ^~~~~~~~~~~~~~~~~~~~
   net/ipv6/raw.c:653:2: note: Calling 'skb_reset_network_header'
           skb_reset_network_header(skb);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2541:1: note: Returning without writing to 'skb->=
end'
   }
   ^
   net/ipv6/raw.c:653:2: note: Returning from 'skb_reset_network_header'
           skb_reset_network_header(skb);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/raw.c:658:2: note: Calling 'skb_setup_tx_timestamp'
           skb_setup_tx_timestamp(skb, sockc->tsflags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sock.h:2526:39: note: Passing value via 3rd parameter 'tx_fl=
ags'
           _sock_tx_timestamp(skb->sk, tsflags, &skb_shinfo(skb)->tx_flags,
                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sock.h:2526:2: note: Calling '_sock_tx_timestamp'
           _sock_tx_timestamp(skb->sk, tsflags, &skb_shinfo(skb)->tx_flags,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sock.h:2508:6: note: Assuming 'tsflags' is not equal to 0
           if (unlikely(tsflags)) {
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   include/net/sock.h:2508:2: note: Taking true branch
           if (unlikely(tsflags)) {
           ^
   include/net/sock.h:2510:7: note: Assuming the condition is true
                   if (tsflags & SOF_TIMESTAMPING_OPT_ID && tskey &&
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sock.h:2510:7: note: Left side of '&&' is true
   include/net/sock.h:2510:44: note: Assuming 'tskey' is null
                   if (tsflags & SOF_TIMESTAMPING_OPT_ID && tskey &&
                                                            ^~~~~
   include/net/sock.h:2510:7: note: Assuming pointer value is null
                   if (tsflags & SOF_TIMESTAMPING_OPT_ID && tskey &&
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sock.h:2510:50: note: Left side of '&&' is false
                   if (tsflags & SOF_TIMESTAMPING_OPT_ID && tskey &&
                                                                  ^
   include/net/sock.h:2514:6: note: Assuming the condition is false
           if (unlikely(sock_flag(sk, SOCK_WIFI_STATUS)))
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   include/net/sock.h:2514:2: note: Taking true branch
           if (unlikely(sock_flag(sk, SOCK_WIFI_STATUS)))
           ^
   include/net/sock.h:2515:13: note: Dereference of null pointer (loaded fr=
om variable 'tx_flags')
                   *tx_flags |=3D SKBTX_WIFI_STATUS;
                    ~~~~~~~~ ^
>> net/ipv6/raw.c:1030:24: warning: Assigned value is garbage or undefined =
[clang-analyzer-core.uninitialized.Assign]
                   inet_sk(sk)->hdrincl =3D !!val;
                                        ^
   net/ipv6/raw.c:1067:2: note: Control jumps to 'case 255:'  at line 1068
           switch (level) {
           ^
   net/ipv6/raw.c:1069:3: note:  Execution continues on line 1084
                   break;
                   ^
   net/ipv6/raw.c:1084:9: note: Calling 'do_rawv6_setsockopt'
           return do_rawv6_setsockopt(sk, level, optname, optval, optlen);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/raw.c:1021:2: note: 'val' declared without an initial value
           int val;
           ^~~~~~~
   net/ipv6/raw.c:1023:6: note: Calling 'copy_from_sockptr'
           if (copy_from_sockptr(&val, optval, sizeof(val)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sockptr.h:55:9: note: Calling 'copy_from_sockptr_offset'
           return copy_from_sockptr_offset(dst, src, 0, size);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sockptr.h:47:6: note: Assuming the condition is true
           if (!sockptr_is_kernel(src))
               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sockptr.h:47:2: note: Taking true branch
           if (!sockptr_is_kernel(src))
           ^
   include/linux/sockptr.h:48:10: note: Calling 'copy_from_user'
                   return copy_from_user(dst, src.user + offset, size);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Calling 'should_fail_usercopy'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/fault-inject-usercopy.h:18:49: note: Returning zero, which=
 participates in a condition later
   static inline bool should_fail_usercopy(void) { return false; }
                                                   ^~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Returning from 'should_fail_usercop=
y'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:40: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                                 ^
   arch/mips/include/asm/uaccess.h:86:2: note: expanded from macro 'access_=
ok'
           likely(__access_ok((addr), (size)))
           ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/uaccess.h:157:40: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                                 ^
   arch/mips/include/asm/uaccess.h:86:2: note: expanded from macro 'access_=
ok'
           likely(__access_ok((addr), (size)))
           ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^
   include/linux/compiler.h:45:66: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:472:2: note: Returning without writing t=
o '*to'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0, which particip=
ates in a condition later
           if (unlikely(res))
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))

vim +339 net/rds/af_rds.c

639b321b4d8f4e Andy Grover                  2009-02-24  329  =

a7b75c5a8c4144 Christoph Hellwig            2020-07-23  330  static int rds=
_set_bool_option(unsigned char *optvar, sockptr_t optval,
639b321b4d8f4e Andy Grover                  2009-02-24  331  			       int =
optlen)
639b321b4d8f4e Andy Grover                  2009-02-24  332  {
639b321b4d8f4e Andy Grover                  2009-02-24  333  	int value;
639b321b4d8f4e Andy Grover                  2009-02-24  334  =

639b321b4d8f4e Andy Grover                  2009-02-24  335  	if (optlen < =
sizeof(int))
639b321b4d8f4e Andy Grover                  2009-02-24  336  		return -EINV=
AL;
a7b75c5a8c4144 Christoph Hellwig            2020-07-23  337  	if (copy_from=
_sockptr(&value, optval, sizeof(int)))
639b321b4d8f4e Andy Grover                  2009-02-24  338  		return -EFAU=
LT;
639b321b4d8f4e Andy Grover                  2009-02-24 @339  	*optvar =3D !=
!value;
639b321b4d8f4e Andy Grover                  2009-02-24  340  	return 0;
639b321b4d8f4e Andy Grover                  2009-02-24  341  }
639b321b4d8f4e Andy Grover                  2009-02-24  342  =

a7b75c5a8c4144 Christoph Hellwig            2020-07-23  343  static int rds=
_cong_monitor(struct rds_sock *rs, sockptr_t optval, int optlen)
639b321b4d8f4e Andy Grover                  2009-02-24  344  {
639b321b4d8f4e Andy Grover                  2009-02-24  345  	int ret;
639b321b4d8f4e Andy Grover                  2009-02-24  346  =

639b321b4d8f4e Andy Grover                  2009-02-24  347  	ret =3D rds_s=
et_bool_option(&rs->rs_cong_monitor, optval, optlen);
639b321b4d8f4e Andy Grover                  2009-02-24  348  	if (ret =3D=
=3D 0) {
639b321b4d8f4e Andy Grover                  2009-02-24  349  		if (rs->rs_c=
ong_monitor) {
639b321b4d8f4e Andy Grover                  2009-02-24  350  			rds_cong_ad=
d_socket(rs);
639b321b4d8f4e Andy Grover                  2009-02-24  351  		} else {
639b321b4d8f4e Andy Grover                  2009-02-24  352  			rds_cong_re=
move_socket(rs);
639b321b4d8f4e Andy Grover                  2009-02-24  353  			rs->rs_cong=
_mask =3D 0;
639b321b4d8f4e Andy Grover                  2009-02-24  354  			rs->rs_cong=
_notify =3D 0;
639b321b4d8f4e Andy Grover                  2009-02-24  355  		}
639b321b4d8f4e Andy Grover                  2009-02-24  356  	}
639b321b4d8f4e Andy Grover                  2009-02-24  357  	return ret;
639b321b4d8f4e Andy Grover                  2009-02-24  358  }
639b321b4d8f4e Andy Grover                  2009-02-24  359  =

a7b75c5a8c4144 Christoph Hellwig            2020-07-23  360  static int rds=
_set_transport(struct rds_sock *rs, sockptr_t optval, int optlen)
d97dac54bf83b2 Sowmini Varadhan             2015-05-29  361  {
d97dac54bf83b2 Sowmini Varadhan             2015-05-29  362  	int t_type;
d97dac54bf83b2 Sowmini Varadhan             2015-05-29  363  =

d97dac54bf83b2 Sowmini Varadhan             2015-05-29  364  	if (rs->rs_tr=
ansport)
d97dac54bf83b2 Sowmini Varadhan             2015-05-29  365  		return -EOPN=
OTSUPP; /* previously attached to transport */
d97dac54bf83b2 Sowmini Varadhan             2015-05-29  366  =

d97dac54bf83b2 Sowmini Varadhan             2015-05-29  367  	if (optlen !=
=3D sizeof(int))
d97dac54bf83b2 Sowmini Varadhan             2015-05-29  368  		return -EINV=
AL;
d97dac54bf83b2 Sowmini Varadhan             2015-05-29  369  =

a7b75c5a8c4144 Christoph Hellwig            2020-07-23  370  	if (copy_from=
_sockptr(&t_type, optval, sizeof(t_type)))
d97dac54bf83b2 Sowmini Varadhan             2015-05-29  371  		return -EFAU=
LT;
d97dac54bf83b2 Sowmini Varadhan             2015-05-29  372  =

d97dac54bf83b2 Sowmini Varadhan             2015-05-29  373  	if (t_type < =
0 || t_type >=3D RDS_TRANS_COUNT)
d97dac54bf83b2 Sowmini Varadhan             2015-05-29  374  		return -EINV=
AL;
d97dac54bf83b2 Sowmini Varadhan             2015-05-29  375  =

d97dac54bf83b2 Sowmini Varadhan             2015-05-29  376  	rs->rs_transp=
ort =3D rds_trans_get(t_type);
d97dac54bf83b2 Sowmini Varadhan             2015-05-29  377  =

d97dac54bf83b2 Sowmini Varadhan             2015-05-29  378  	return rs->rs=
_transport ? 0 : -ENOPROTOOPT;
d97dac54bf83b2 Sowmini Varadhan             2015-05-29  379  }
d97dac54bf83b2 Sowmini Varadhan             2015-05-29  380  =

a7b75c5a8c4144 Christoph Hellwig            2020-07-23  381  static int rds=
_enable_recvtstamp(struct sock *sk, sockptr_t optval,
887feae36aee6c Deepa Dinamani               2019-02-02  382  				 int optle=
n, int optname)
5711f8b3531763 santosh.shilimkar(a)oracle.com 2016-03-01  383  {
5711f8b3531763 santosh.shilimkar(a)oracle.com 2016-03-01  384  	int val, va=
lbool;
5711f8b3531763 santosh.shilimkar(a)oracle.com 2016-03-01  385  =

5711f8b3531763 santosh.shilimkar(a)oracle.com 2016-03-01  386  	if (optlen =
!=3D sizeof(int))
5711f8b3531763 santosh.shilimkar(a)oracle.com 2016-03-01  387  		return -EF=
AULT;
5711f8b3531763 santosh.shilimkar(a)oracle.com 2016-03-01  388  =

a7b75c5a8c4144 Christoph Hellwig            2020-07-23  389  	if (copy_from=
_sockptr(&val, optval, sizeof(int)))
5711f8b3531763 santosh.shilimkar(a)oracle.com 2016-03-01  390  		return -EF=
AULT;
5711f8b3531763 santosh.shilimkar(a)oracle.com 2016-03-01  391  =

5711f8b3531763 santosh.shilimkar(a)oracle.com 2016-03-01 @392  	valbool =3D=
 val ? 1 : 0;
5711f8b3531763 santosh.shilimkar(a)oracle.com 2016-03-01  393  =

887feae36aee6c Deepa Dinamani               2019-02-02  394  	if (optname =
=3D=3D SO_TIMESTAMP_NEW)
887feae36aee6c Deepa Dinamani               2019-02-02  395  		sock_set_fla=
g(sk, SOCK_TSTAMP_NEW);
887feae36aee6c Deepa Dinamani               2019-02-02  396  =

5711f8b3531763 santosh.shilimkar(a)oracle.com 2016-03-01  397  	if (valbool)
5711f8b3531763 santosh.shilimkar(a)oracle.com 2016-03-01  398  		sock_set_f=
lag(sk, SOCK_RCVTSTAMP);
5711f8b3531763 santosh.shilimkar(a)oracle.com 2016-03-01  399  	else
5711f8b3531763 santosh.shilimkar(a)oracle.com 2016-03-01  400  		sock_reset=
_flag(sk, SOCK_RCVTSTAMP);
5711f8b3531763 santosh.shilimkar(a)oracle.com 2016-03-01  401  =

5711f8b3531763 santosh.shilimkar(a)oracle.com 2016-03-01  402  	return 0;
5711f8b3531763 santosh.shilimkar(a)oracle.com 2016-03-01  403  }
5711f8b3531763 santosh.shilimkar(a)oracle.com 2016-03-01  404  =


:::::: The code at line 339 was first introduced by commit
:::::: 639b321b4d8f4e412bfbb2a4a19bfebc1e68ace4 RDS: Socket interface

:::::: TO: Andy Grover <andy.grover@oracle.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3635827778559501379==--

