Content-Type: multipart/mixed; boundary="===============0464636779521711244=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm/include/asm/uaccess.h:573:2: warning: Null pointer passed as 2nd argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
Date: Mon, 07 Feb 2022 05:29:59 +0800
Message-ID: <202202070505.FUigqEY0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0464636779521711244==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   90c9e950c0def5c354b4a6154a2ddda3e5f214ac
commit: 2d3e5caf96b9449af951e63476657acd759c1a30 net/ipv4: Replace one-elem=
ent array with flexible-array member
date:   6 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20220205 (https://download.01.org/0day-ci/archi=
ve/20220207/202202070505.FUigqEY0-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 78c6b9=
0000292eb37aac5dead6ab26611cd76f42)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2d3e5caf96b9449af951e63476657acd759c1a30
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2d3e5caf96b9449af951e63476657acd759c1a30
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/list.h:563:2: note: expanded from macro 'list_prev_entry'
           list_entry((pos)->member.prev, typeof(*(pos)), member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   sound/core/device.c:228:2: note: Loop condition is false. Execution cont=
inues on line 237
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list=
) {
           ^
   include/linux/list.h:762:2: note: expanded from macro 'list_for_each_ent=
ry_safe_reverse'
           for (pos =3D list_last_entry(head, typeof(*pos), member),       =
  \
           ^
   sound/core/device.c:237:2: note: Left side of '&&' is false
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list)
           ^
   include/linux/list.h:762:13: note: expanded from macro 'list_for_each_en=
try_safe_reverse'
           for (pos =3D list_last_entry(head, typeof(*pos), member),       =
  \
                      ^
   include/linux/list.h:533:2: note: expanded from macro 'list_last_entry'
           list_entry((ptr)->prev, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   sound/core/device.c:237:2: note: Taking false branch
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list)
           ^
   include/linux/list.h:762:13: note: expanded from macro 'list_for_each_en=
try_safe_reverse'
           for (pos =3D list_last_entry(head, typeof(*pos), member),       =
  \
                      ^
   include/linux/list.h:533:2: note: expanded from macro 'list_last_entry'
           list_entry((ptr)->prev, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   sound/core/device.c:237:2: note: Loop condition is false.  Exiting loop
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list)
           ^
   include/linux/list.h:762:13: note: expanded from macro 'list_for_each_en=
try_safe_reverse'
           for (pos =3D list_last_entry(head, typeof(*pos), member),       =
  \
                      ^
   include/linux/list.h:533:2: note: expanded from macro 'list_last_entry'
           list_entry((ptr)->prev, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   sound/core/device.c:237:2: note: Use of memory after it is freed
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list)
           ^
   include/linux/list.h:763:7: note: expanded from macro 'list_for_each_ent=
ry_safe_reverse'
                   n =3D list_prev_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:563:2: note: expanded from macro 'list_prev_entry'
           list_entry((pos)->member.prev, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:494:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> arch/arm/include/asm/uaccess.h:573:2: warning: Null pointer passed as 2n=
d argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
           memcpy((void __force *)to, from, n);
           ^
   net/ipv4/igmp.c:2522:2: note: Assuming the condition is false
           ASSERT_RTNL();
           ^
   include/linux/rtnetlink.h:110:12: note: expanded from macro 'ASSERT_RTNL'
           WARN_ONCE(!rtnl_is_locked(), \
                     ^~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:150:18: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
                           ^~~~~~~~~
   include/linux/once_lite.h:15:27: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   bool __ret_do_once =3D !!(condition);                   =
  \
                                           ^~~~~~~~~
   net/ipv4/igmp.c:2522:2: note: '__ret_do_once' is false
           ASSERT_RTNL();
           ^
   include/linux/rtnetlink.h:110:2: note: expanded from macro 'ASSERT_RTNL'
           WARN_ONCE(!rtnl_is_locked(), \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:17:16: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                ^~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/ipv4/igmp.c:2522:2: note: Left side of '&&' is false
           ASSERT_RTNL();
           ^
   include/linux/rtnetlink.h:110:2: note: expanded from macro 'ASSERT_RTNL'
           WARN_ONCE(!rtnl_is_locked(), \
           ^
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:17:30: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                              ^
   net/ipv4/igmp.c:2522:2: note: Taking false branch
           ASSERT_RTNL();
           ^
   include/linux/rtnetlink.h:110:2: note: expanded from macro 'ASSERT_RTNL'
           WARN_ONCE(!rtnl_is_locked(), \
           ^
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:17:3: note: expanded from macro 'DO_ONCE_LITE_=
IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                   ^
   net/ipv4/igmp.c:2524:7: note: Calling 'ipv4_is_multicast'
           if (!ipv4_is_multicast(addr))
                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/in.h:45:9: note: Assuming the condition is true
           return (addr & htonl(0xf0000000)) =3D=3D htonl(0xe0000000);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/in.h:45:2: note: Returning the value 1, which participates=
 in a condition later
           return (addr & htonl(0xf0000000)) =3D=3D htonl(0xe0000000);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/igmp.c:2524:7: note: Returning from 'ipv4_is_multicast'
           if (!ipv4_is_multicast(addr))
                ^~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/igmp.c:2524:2: note: Taking false branch
           if (!ipv4_is_multicast(addr))
           ^
   net/ipv4/igmp.c:2530:11: note: Calling 'ip_mc_find_dev'
           in_dev =3D ip_mc_find_dev(net, &imr);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/igmp.c:1815:11: note: Field 'imr_ifindex' is 0
           if (imr->imr_ifindex) {
                    ^
   net/ipv4/igmp.c:1815:2: note: Taking false branch
           if (imr->imr_ifindex) {
           ^
   net/ipv4/igmp.c:1819:6: note: Assuming field 's_addr' is not equal to 0
           if (imr->imr_address.s_addr) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/igmp.c:1819:2: note: Taking true branch
           if (imr->imr_address.s_addr) {
           ^
   net/ipv4/igmp.c:1821:7: note: Assuming 'dev' is non-null
                   if (!dev)
                       ^~~~
   net/ipv4/igmp.c:1821:3: note: Taking false branch
                   if (!dev)
                   ^
   net/ipv4/igmp.c:1825:7: note: 'dev' is non-null
           if (!dev) {
                ^~~
   net/ipv4/igmp.c:1825:2: note: Taking false branch
           if (!dev) {
           ^
   net/ipv4/igmp.c:1834:6: note: 'dev' is non-null
           if (dev) {
               ^~~
   net/ipv4/igmp.c:1834:2: note: Taking true branch
           if (dev) {

vim +573 arch/arm/include/asm/uaccess.h

3fba7e23f754a9 arch/arm/include/asm/uaccess.h Russell King   2015-08-19  56=
2  =

9641c7cc5a7f6d include/asm-arm/uaccess.h      Russell King   2006-06-21  56=
3  #else
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  56=
4  static inline unsigned long
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  56=
5  raw_copy_from_user(void *to, const void __user *from, unsigned long n)
32b143637e8180 arch/arm/include/asm/uaccess.h Kees Cook      2017-02-16  56=
6  {
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  56=
7  	memcpy(to, (const void __force *)from, n);
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  56=
8  	return 0;
32b143637e8180 arch/arm/include/asm/uaccess.h Kees Cook      2017-02-16  56=
9  }
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  57=
0  static inline unsigned long
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  57=
1  raw_copy_to_user(void __user *to, const void *from, unsigned long n)
32b143637e8180 arch/arm/include/asm/uaccess.h Kees Cook      2017-02-16  57=
2  {
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21 @57=
3  	memcpy((void __force *)to, from, n);
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  57=
4  	return 0;
^1da177e4c3f41 include/asm-arm/uaccess.h      Linus Torvalds 2005-04-16  57=
5  }
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  57=
6  #define __clear_user(addr, n)		(memset((void __force *)addr, 0, n), 0)
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  57=
7  #endif
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  57=
8  #define INLINE_COPY_TO_USER
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  57=
9  #define INLINE_COPY_FROM_USER
^1da177e4c3f41 include/asm-arm/uaccess.h      Linus Torvalds 2005-04-16  58=
0  =


:::::: The code at line 573 was first introduced by commit
:::::: 4de5b63e76b2e672478e49622dabe2666b7f727f arm: switch to RAW_COPY_USER

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0464636779521711244==--

