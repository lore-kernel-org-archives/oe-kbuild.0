Content-Type: multipart/mixed; boundary="===============8682920403386376373=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/mctp/af_mctp.c:243:17: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Tue, 15 Feb 2022 20:04:32 +0800
Message-ID: <202202151909.fpjJe5Hl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8682920403386376373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jeremy Kerr <jk@codeconstruct.com.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d567f5db412ed52de0b3b3efca4a451263de6108
commit: 99ce45d5e7dbde399997a630f45ac9f654fa4bcc mctp: Implement extended a=
ddressing
date:   4 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 4 months ago
config: mips-randconfig-c004-20220211 (https://download.01.org/0day-ci/arch=
ive/20220215/202202151909.fpjJe5Hl-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f6685f=
774697c85d6a352dcea013f46a99f9fe31)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D99ce45d5e7dbde399997a630f45ac9f654fa4bcc
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 99ce45d5e7dbde399997a630f45ac9f654fa4bcc
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_log.c:580:6: note: Assuming the condition is false
           if (xlog_is_shutdown(log)) {
               ^~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_log.c:580:2: note: Taking false branch
           if (xlog_is_shutdown(log)) {
           ^
   fs/xfs/xfs_log.c:594:7: note: 'last_ref' is true
           if (!last_ref)
                ^~~~~~~~
   fs/xfs/xfs_log.c:594:2: note: Taking false branch
           if (!last_ref)
           ^
   fs/xfs/xfs_log.c:597:6: note: Assuming field 'ic_state' is equal to XLOG=
_STATE_WANT_SYNC
           if (iclog->ic_state !=3D XLOG_STATE_WANT_SYNC) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_log.c:597:2: note: Taking false branch
           if (iclog->ic_state !=3D XLOG_STATE_WANT_SYNC) {
           ^
   fs/xfs/xfs_log.c:603:6: note: Assuming field 'h_tail_lsn' is 0
           if (!iclog->ic_header.h_tail_lsn)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_log.c:603:2: note: Taking true branch
           if (!iclog->ic_header.h_tail_lsn)
           ^
   fs/xfs/xfs_log.c:604:31: note: Assigned value is garbage or undefined
                   iclog->ic_header.h_tail_lsn =3D cpu_to_be64(tail_lsn);
                                               ^
   fs/xfs/xfs_log.c:965:2: warning: Value stored to 'error' is never read [=
clang-analyzer-deadcode.DeadStores]
           error =3D xlog_force_iclog(iclog);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_log.c:965:2: note: Value stored to 'error' is never read
           error =3D xlog_force_iclog(iclog);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/btrfs/file.c:548:3: warning: Value stored to 'modified' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   modified =3D false;
                   ^          ~~~~~
   fs/btrfs/file.c:548:3: note: Value stored to 'modified' is never read
                   modified =3D false;
                   ^          ~~~~~
   fs/btrfs/file.c:1400:5: warning: Value stored to 'err' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                                   err =3D 0;
                                   ^     ~
   fs/btrfs/file.c:1400:5: note: Value stored to 'err' is never read
                                   err =3D 0;
                                   ^     ~
   fs/btrfs/file.c:3247:4: warning: Value stored to 'ret' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                           ret =3D 0;
                           ^     ~
   fs/btrfs/file.c:3247:4: note: Value stored to 'ret' is never read
                           ret =3D 0;
                           ^     ~
   fs/btrfs/file.c:3253:4: warning: Value stored to 'ret' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                           ret =3D 0;
                           ^     ~
   fs/btrfs/file.c:3253:4: note: Value stored to 'ret' is never read
                           ret =3D 0;
                           ^     ~
   fs/btrfs/file.c:3264:4: warning: Value stored to 'ret' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                           ret =3D 0;
                           ^     ~
   fs/btrfs/file.c:3264:4: note: Value stored to 'ret' is never read
                           ret =3D 0;
                           ^     ~
   fs/btrfs/file.c:3271:4: warning: Value stored to 'ret' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                           ret =3D 0;
                           ^     ~
   fs/btrfs/file.c:3271:4: note: Value stored to 'ret' is never read
                           ret =3D 0;
                           ^     ~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   fs/btrfs/extent_map.c:615:3: warning: Value stored to 'ret' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                   ret =3D 0;
                   ^     ~
   fs/btrfs/extent_map.c:615:3: note: Value stored to 'ret' is never read
                   ret =3D 0;
                   ^     ~
   Suppressed 3 warnings (3 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> net/mctp/af_mctp.c:243:17: warning: Assigned value is garbage or undefin=
ed [clang-analyzer-core.uninitialized.Assign]
                   msk->addr_ext =3D val;
                                 ^ ~~~
   net/mctp/af_mctp.c:232:26: note: Left side of '&&' is false
           struct mctp_sock *msk =3D container_of(sock->sk, struct mctp_soc=
k, sk);
                                   ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   net/mctp/af_mctp.c:232:26: note: Taking false branch
           struct mctp_sock *msk =3D container_of(sock->sk, struct mctp_soc=
k, sk);
                                   ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   net/mctp/af_mctp.c:232:26: note: Loop condition is false.  Exiting loop
           struct mctp_sock *msk =3D container_of(sock->sk, struct mctp_soc=
k, sk);
                                   ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   net/mctp/af_mctp.c:233:2: note: 'val' declared without an initial value
           int val;
           ^~~~~~~
   net/mctp/af_mctp.c:235:6: note: Assuming 'level' is equal to SOL_MCTP
           if (level !=3D SOL_MCTP)
               ^~~~~~~~~~~~~~~~~
   net/mctp/af_mctp.c:235:2: note: Taking false branch
           if (level !=3D SOL_MCTP)
           ^
   net/mctp/af_mctp.c:238:6: note: Assuming 'optname' is equal to MCTP_OPT_=
ADDR_EXT
           if (optname =3D=3D MCTP_OPT_ADDR_EXT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mctp/af_mctp.c:238:2: note: Taking true branch
           if (optname =3D=3D MCTP_OPT_ADDR_EXT) {
           ^
   net/mctp/af_mctp.c:239:7: note: Assuming the condition is false
                   if (optlen !=3D sizeof(int))
                       ^~~~~~~~~~~~~~~~~~~~~
   net/mctp/af_mctp.c:239:3: note: Taking false branch
                   if (optlen !=3D sizeof(int))
                   ^
   net/mctp/af_mctp.c:241:7: note: Calling 'copy_from_sockptr'
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
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {

vim +243 net/mctp/af_mctp.c

8f601a1e4f8c84 Jeremy Kerr 2021-07-29  228  =

8f601a1e4f8c84 Jeremy Kerr 2021-07-29  229  static int mctp_setsockopt(stru=
ct socket *sock, int level, int optname,
8f601a1e4f8c84 Jeremy Kerr 2021-07-29  230  			   sockptr_t optval, unsigne=
d int optlen)
8f601a1e4f8c84 Jeremy Kerr 2021-07-29  231  {
99ce45d5e7dbde Jeremy Kerr 2021-10-26  232  	struct mctp_sock *msk =3D cont=
ainer_of(sock->sk, struct mctp_sock, sk);
99ce45d5e7dbde Jeremy Kerr 2021-10-26  233  	int val;
99ce45d5e7dbde Jeremy Kerr 2021-10-26  234  =

99ce45d5e7dbde Jeremy Kerr 2021-10-26  235  	if (level !=3D SOL_MCTP)
99ce45d5e7dbde Jeremy Kerr 2021-10-26  236  		return -EINVAL;
99ce45d5e7dbde Jeremy Kerr 2021-10-26  237  =

99ce45d5e7dbde Jeremy Kerr 2021-10-26  238  	if (optname =3D=3D MCTP_OPT_AD=
DR_EXT) {
99ce45d5e7dbde Jeremy Kerr 2021-10-26  239  		if (optlen !=3D sizeof(int))
8f601a1e4f8c84 Jeremy Kerr 2021-07-29  240  			return -EINVAL;
99ce45d5e7dbde Jeremy Kerr 2021-10-26  241  		if (copy_from_sockptr(&val, o=
ptval, sizeof(int)))
99ce45d5e7dbde Jeremy Kerr 2021-10-26  242  			return -EFAULT;
99ce45d5e7dbde Jeremy Kerr 2021-10-26 @243  		msk->addr_ext =3D val;
99ce45d5e7dbde Jeremy Kerr 2021-10-26  244  		return 0;
99ce45d5e7dbde Jeremy Kerr 2021-10-26  245  	}
99ce45d5e7dbde Jeremy Kerr 2021-10-26  246  =

99ce45d5e7dbde Jeremy Kerr 2021-10-26  247  	return -ENOPROTOOPT;
8f601a1e4f8c84 Jeremy Kerr 2021-07-29  248  }
8f601a1e4f8c84 Jeremy Kerr 2021-07-29  249  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8682920403386376373==--

