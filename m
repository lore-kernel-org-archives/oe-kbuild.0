Content-Type: multipart/mixed; boundary="===============2119570562324622704=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/can/j1939/socket.c:655:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Mon, 28 Feb 2022 09:56:26 +0800
Message-ID: <202202280920.8NHC4RRo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2119570562324622704==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   52a02554673122486ecb36c36387d91cf9544986
commit: 04324f44cb69a03fdc8f2ee52386a4fdf6a0043b MIPS: Remove get_fs/set_fs
date:   11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 11 months ago
config: mips-randconfig-c004-20220227 (https://download.01.org/0day-ci/arch=
ive/20220228/202202280920.8NHC4RRo-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
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
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/failover.c:53:6: note: Assuming field 'type' is equal to ARPHRD=
_ETHER
           if (slave_dev->type !=3D ARPHRD_ETHER)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/failover.c:53:2: note: Taking false branch
           if (slave_dev->type !=3D ARPHRD_ETHER)
           ^
   net/core/failover.c:56:2: note: Assuming the condition is false
           ASSERT_RTNL();
           ^
   include/linux/rtnetlink.h:110:12: note: expanded from macro 'ASSERT_RTNL'
           WARN_ONCE(!rtnl_is_locked(), \
                     ^~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:157:27: note: expanded from macro 'WARN_ONCE'
           int __ret_warn_once =3D !!(condition);                    \
                                    ^~~~~~~~~
   net/core/failover.c:56:2: note: '__ret_warn_once' is 0
           ASSERT_RTNL();
           ^
   include/linux/rtnetlink.h:110:2: note: expanded from macro 'ASSERT_RTNL'
           WARN_ONCE(!rtnl_is_locked(), \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:159:15: note: expanded from macro 'WARN_ONCE'
           if (unlikely(__ret_warn_once && !__warned)) {           \
                        ^~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/core/failover.c:56:2: note: Left side of '&&' is false
           ASSERT_RTNL();
           ^
   include/linux/rtnetlink.h:110:2: note: expanded from macro 'ASSERT_RTNL'
           WARN_ONCE(!rtnl_is_locked(), \
           ^
   include/asm-generic/bug.h:159:31: note: expanded from macro 'WARN_ONCE'
           if (unlikely(__ret_warn_once && !__warned)) {           \
                                        ^
   net/core/failover.c:56:2: note: Taking false branch
           ASSERT_RTNL();
           ^
   include/linux/rtnetlink.h:110:2: note: expanded from macro 'ASSERT_RTNL'
           WARN_ONCE(!rtnl_is_locked(), \
           ^
   include/asm-generic/bug.h:159:2: note: expanded from macro 'WARN_ONCE'
           if (unlikely(__ret_warn_once && !__warned)) {           \
           ^
   net/core/failover.c:58:17: note: Value assigned to 'fops'
           failover_dev =3D failover_get_bymac(slave_dev->perm_addr, &fops);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/failover.c:59:6: note: Assuming 'failover_dev' is non-null
           if (!failover_dev)
               ^~~~~~~~~~~~~
   net/core/failover.c:59:2: note: Taking false branch
           if (!failover_dev)
           ^
   net/core/failover.c:62:6: note: Assuming 'fops' is null
           if (fops && fops->slave_pre_register &&
               ^~~~
   net/core/failover.c:62:11: note: Left side of '&&' is false
           if (fops && fops->slave_pre_register &&
                    ^
   net/core/failover.c:66:46: note: Access to field 'slave_handle_frame' re=
sults in a dereference of a null pointer (loaded from variable 'fops')
           err =3D netdev_rx_handler_register(slave_dev, fops->slave_handle=
_frame,
                                                       ^~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
>> net/can/j1939/socket.c:655:6: warning: Branch condition evaluates to a g=
arbage value [clang-analyzer-core.uninitialized.Branch]
           if (tmp)
               ^
   net/can/j1939/socket.c:671:6: note: Assuming the condition is false
           if (level !=3D SOL_CAN_J1939)
               ^~~~~~~~~~~~~~~~~~~~~~
   net/can/j1939/socket.c:671:2: note: Taking false branch
           if (level !=3D SOL_CAN_J1939)
           ^
   net/can/j1939/socket.c:674:2: note: Control jumps to 'case SO_J1939_ERRQ=
UEUE:'  at line 709
           switch (optname) {
           ^
   net/can/j1939/socket.c:710:9: note: Calling 'j1939_sk_setsockopt_flag'
                   ret =3D j1939_sk_setsockopt_flag(jsk, optval, optlen,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/can/j1939/socket.c:648:2: note: 'tmp' declared without an initial va=
lue
           int tmp;
           ^~~~~~~
   net/can/j1939/socket.c:650:6: note: Assuming the condition is false
           if (optlen !=3D sizeof(tmp))
               ^~~~~~~~~~~~~~~~~~~~~
   net/can/j1939/socket.c:650:2: note: Taking false branch
           if (optlen !=3D sizeof(tmp))
           ^
   net/can/j1939/socket.c:652:6: note: Calling 'copy_from_sockptr'
           if (copy_from_sockptr(&tmp, optval, optlen))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
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
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
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

vim +655 net/can/j1939/socket.c

9d71dd0c7009991 The j1939 authors 2018-10-08  644  =

a7b75c5a8c41445 Christoph Hellwig 2020-07-23  645  static int j1939_sk_sets=
ockopt_flag(struct j1939_sock *jsk, sockptr_t optval,
9d71dd0c7009991 The j1939 authors 2018-10-08  646  				    unsigned int opt=
len, int flag)
9d71dd0c7009991 The j1939 authors 2018-10-08  647  {
9d71dd0c7009991 The j1939 authors 2018-10-08  648  	int tmp;
9d71dd0c7009991 The j1939 authors 2018-10-08  649  =

9d71dd0c7009991 The j1939 authors 2018-10-08  650  	if (optlen !=3D sizeof(=
tmp))
9d71dd0c7009991 The j1939 authors 2018-10-08  651  		return -EINVAL;
a7b75c5a8c41445 Christoph Hellwig 2020-07-23  652  	if (copy_from_sockptr(&=
tmp, optval, optlen))
9d71dd0c7009991 The j1939 authors 2018-10-08  653  		return -EFAULT;
9d71dd0c7009991 The j1939 authors 2018-10-08  654  	lock_sock(&jsk->sk);
9d71dd0c7009991 The j1939 authors 2018-10-08 @655  	if (tmp)
9d71dd0c7009991 The j1939 authors 2018-10-08  656  		jsk->state |=3D flag;
9d71dd0c7009991 The j1939 authors 2018-10-08  657  	else
9d71dd0c7009991 The j1939 authors 2018-10-08  658  		jsk->state &=3D ~flag;
9d71dd0c7009991 The j1939 authors 2018-10-08  659  	release_sock(&jsk->sk);
9d71dd0c7009991 The j1939 authors 2018-10-08  660  	return tmp;
9d71dd0c7009991 The j1939 authors 2018-10-08  661  }
9d71dd0c7009991 The j1939 authors 2018-10-08  662  =


:::::: The code at line 655 was first introduced by commit
:::::: 9d71dd0c70099914fcd063135da3c580865e924c can: add support of SAE J19=
39 protocol

:::::: TO: The j1939 authors <linux-can@vger.kernel.org>
:::::: CC: Marc Kleine-Budde <mkl@pengutronix.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2119570562324622704==--

