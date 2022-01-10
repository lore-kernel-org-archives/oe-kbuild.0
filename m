Content-Type: multipart/mixed; boundary="===============8445510787050419702=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm/include/asm/uaccess.h:573:2: warning: Null pointer passed as 2nd argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
Date: Mon, 10 Jan 2022 12:44:33 +0800
Message-ID: <202201101117.sHtfPAs5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8445510787050419702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   df0cc57e057f18e44dac8e6c18aba47ab53202f9
commit: 2d3e5caf96b9449af951e63476657acd759c1a30 net/ipv4: Replace one-elem=
ent array with flexible-array member
date:   5 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-c002-20220107 (https://download.01.org/0day-ci/archi=
ve/20220110/202201101117.sHtfPAs5-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 32167b=
fe64a4c5dd4eb3f7a58e24f4cba76f5ac2)
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
   net/sched/sch_cake.c:1629:10: note: Calling 'cake_handle_diffserv'
                   dscp =3D cake_handle_diffserv(skb, wash);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_cake.c:1564:2: note: Control jumps to 'case 8:'  at line 1=
565
           switch (skb_protocol(skb, true)) {
           ^
   net/sched/sch_cake.c:1566:9: note: Calling 'skb_header_pointer'
                   buf =3D skb_header_pointer(skb, offset, sizeof(buf_), &b=
uf_);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/skbuff.h:3714:9: note: Calling '__skb_header_pointer'
           return __skb_header_pointer(skb, offset, len, skb->data,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:3702:13: note: Assuming the condition is false
           if (likely(hlen - offset >=3D len))
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   include/linux/skbuff.h:3702:2: note: Taking false branch
           if (likely(hlen - offset >=3D len))
           ^
   include/linux/skbuff.h:3705:7: note: 'skb' is non-null
           if (!skb || unlikely(skb_copy_bits(skb, offset, buffer, len) < 0=
))
                ^~~
   include/linux/skbuff.h:3705:6: note: Left side of '||' is false
           if (!skb || unlikely(skb_copy_bits(skb, offset, buffer, len) < 0=
))
               ^
   include/linux/skbuff.h:3705:23: note: Assuming the condition is false
           if (!skb || unlikely(skb_copy_bits(skb, offset, buffer, len) < 0=
))
                                ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/skbuff.h:3705:2: note: Taking false branch
           if (!skb || unlikely(skb_copy_bits(skb, offset, buffer, len) < 0=
))
           ^
   include/linux/skbuff.h:3714:9: note: Returning from '__skb_header_pointe=
r'
           return __skb_header_pointer(skb, offset, len, skb->data,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_cake.c:1566:9: note: Returning from 'skb_header_pointer'
                   buf =3D skb_header_pointer(skb, offset, sizeof(buf_), &b=
uf_);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   net/sched/sch_cake.c:1567:3: note: Taking false branch
                   if (unlikely(!buf))
                   ^
   net/sched/sch_cake.c:1571:10: note: Calling 'ipv4_get_dsfield'
                   dscp =3D ipv4_get_dsfield((struct iphdr *)buf) >> 2;
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/dsfield.h:18:2: note: Undefined or garbage value returned to=
 caller
           return iph->tos;
           ^      ~~~~~~~~
   net/sched/sch_cake.c:1008:10: warning: The left expression of the compou=
nd assignment is an uninitialized value. The computed value will also be ga=
rbage [clang-analyzer-core.uninitialized.Assign]
           oplen_a -=3D TCPOLEN_SACK_BASE;
           ~~~~~~~ ^
   net/sched/sch_cake.c:1001:6: note: 'oplen_a' declared without an initial=
 value
           int oplen_a, oplen_b;
               ^~~~~~~
   net/sched/sch_cake.c:1004:11: note: Calling 'cake_get_tcpopt'
           sack_a =3D cake_get_tcpopt(tcph_a, TCPOPT_SACK, &oplen_a);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_cake.c:960:9: note: Assuming 'length' is <=3D 0
           while (length > 0) {
                  ^~~~~~~~~~
   net/sched/sch_cake.c:960:2: note: Loop condition is false. Execution con=
tinues on line 985
           while (length > 0) {
           ^
   net/sched/sch_cake.c:985:2: note: Returning without writing to '*oplen'
           return NULL;
           ^
   net/sched/sch_cake.c:1004:11: note: Returning from 'cake_get_tcpopt'
           sack_a =3D cake_get_tcpopt(tcph_a, TCPOPT_SACK, &oplen_a);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_cake.c:1008:10: note: The left expression of the compound =
assignment is an uninitialized value. The computed value will also be garba=
ge
           oplen_a -=3D TCPOLEN_SACK_BASE;
           ~~~~~~~ ^
   net/sched/sch_cake.c:1009:10: warning: The left expression of the compou=
nd assignment is an uninitialized value. The computed value will also be ga=
rbage [clang-analyzer-core.uninitialized.Assign]
           oplen_b -=3D TCPOLEN_SACK_BASE;
           ~~~~~~~ ^
   net/sched/sch_cake.c:1001:15: note: 'oplen_b' declared without an initia=
l value
           int oplen_a, oplen_b;
                        ^~~~~~~
   net/sched/sch_cake.c:1005:11: note: Calling 'cake_get_tcpopt'
           sack_b =3D cake_get_tcpopt(tcph_b, TCPOPT_SACK, &oplen_b);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_cake.c:960:9: note: Assuming 'length' is <=3D 0
           while (length > 0) {
                  ^~~~~~~~~~
   net/sched/sch_cake.c:960:2: note: Loop condition is false. Execution con=
tinues on line 985
           while (length > 0) {
           ^
   net/sched/sch_cake.c:985:2: note: Returning without writing to '*oplen'
           return NULL;
           ^
   net/sched/sch_cake.c:1005:11: note: Returning from 'cake_get_tcpopt'
           sack_b =3D cake_get_tcpopt(tcph_b, TCPOPT_SACK, &oplen_b);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_cake.c:1009:10: note: The left expression of the compound =
assignment is an uninitialized value. The computed value will also be garba=
ge
           oplen_b -=3D TCPOLEN_SACK_BASE;
           ~~~~~~~ ^
   2 warnings generated.
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
--===============8445510787050419702==--

