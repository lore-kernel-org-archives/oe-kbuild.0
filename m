Content-Type: multipart/mixed; boundary="===============0336897650819668612=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/mctp/af_mctp.c:343:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Sat, 23 Apr 2022 15:30:13 +0800
Message-ID: <202204231540.rEC33b4r-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0336897650819668612==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Matt Johnston <matt@codeconstruct.com.au>
CC: Jeremy Kerr <jk@codeconstruct.com.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c00c5e1d157bec0ef0b0b59aa5482eb8dc7e8e49
commit: 63ed1aab3d40aa61aaa66819bdce9377ac7f40fa mctp: Add SIOCMCTP{ALLOC,D=
ROP}TAG ioctls for tag control
date:   2 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 2 months ago
config: mips-randconfig-c004-20220421 (https://download.01.org/0day-ci/arch=
ive/20220423/202204231540.rEC33b4r-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd873=
50a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D63ed1aab3d40aa61aaa66819bdce9377ac7f40fa
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 63ed1aab3d40aa61aaa66819bdce9377ac7f40fa
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   5 warnings generated.
   net/mctp/af_mctp.c:301:17: warning: Assigned value is garbage or undefin=
ed [clang-analyzer-core.uninitialized.Assign]
                   msk->addr_ext =3D val;
                                 ^ ~~~
   net/mctp/af_mctp.c:291:2: note: 'val' declared without an initial value
           int val;
           ^~~~~~~
   net/mctp/af_mctp.c:293:6: note: Assuming 'level' is equal to SOL_MCTP
           if (level !=3D SOL_MCTP)
               ^~~~~~~~~~~~~~~~~
   net/mctp/af_mctp.c:293:2: note: Taking false branch
           if (level !=3D SOL_MCTP)
           ^
   net/mctp/af_mctp.c:296:6: note: Assuming 'optname' is equal to MCTP_OPT_=
ADDR_EXT
           if (optname =3D=3D MCTP_OPT_ADDR_EXT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mctp/af_mctp.c:296:2: note: Taking true branch
           if (optname =3D=3D MCTP_OPT_ADDR_EXT) {
           ^
   net/mctp/af_mctp.c:297:7: note: Assuming the condition is false
                   if (optlen !=3D sizeof(int))
                       ^~~~~~~~~~~~~~~~~~~~~
   net/mctp/af_mctp.c:297:3: note: Taking false branch
                   if (optlen !=3D sizeof(int))
                   ^
   net/mctp/af_mctp.c:299:7: note: Calling 'copy_from_sockptr'
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
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:455:2: note: Returning without writing t=
o '*to'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0
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
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to '*to'
           return n;
           ^
   include/linux/sockptr.h:48:10: note: Returning from 'copy_from_user'
                   return copy_from_user(dst, src.user + offset, size);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sockptr.h:48:3: note: Returning without writing to '*dst'
                   return copy_from_user(dst, src.user + offset, size);
                   ^
   include/linux/sockptr.h:55:9: note: Returning from 'copy_from_sockptr_of=
fset'
           return copy_from_sockptr_offset(dst, src, 0, size);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sockptr.h:55:2: note: Returning without writing to '*dst'
           return copy_from_sockptr_offset(dst, src, 0, size);
           ^
   net/mctp/af_mctp.c:299:7: note: Returning from 'copy_from_sockptr'
                   if (copy_from_sockptr(&val, optval, sizeof(int)))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mctp/af_mctp.c:299:3: note: Taking false branch
                   if (copy_from_sockptr(&val, optval, sizeof(int)))
                   ^
   net/mctp/af_mctp.c:301:17: note: Assigned value is garbage or undefined
                   msk->addr_ext =3D val;
                                 ^ ~~~
>> net/mctp/af_mctp.c:343:6: warning: Branch condition evaluates to a garba=
ge value [clang-analyzer-core.uninitialized.Branch]
           if (ctl.tag)
               ^
   net/mctp/af_mctp.c:414:2: note: Control jumps to 'case 35296:'  at line =
415
           switch (cmd) {
           ^
   net/mctp/af_mctp.c:416:10: note: Calling 'mctp_ioctl_alloctag'
                   return mctp_ioctl_alloctag(msk, arg);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mctp/af_mctp.c:340:6: note: Calling 'copy_from_user'
           if (copy_from_user(&ctl, (void __user *)arg, sizeof(ctl)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:455:2: note: Returning without writing t=
o 'to->tag'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->t=
ag'
           return res;
           ^
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->t=
ag'
           return n;
           ^
   net/mctp/af_mctp.c:340:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&ctl, (void __user *)arg, sizeof(ctl)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mctp/af_mctp.c:340:2: note: Taking false branch
           if (copy_from_user(&ctl, (void __user *)arg, sizeof(ctl)))
           ^
   net/mctp/af_mctp.c:343:6: note: Branch condition evaluates to a garbage =
value
           if (ctl.tag)
               ^~~~~~~
   net/mctp/af_mctp.c:379:6: warning: Branch condition evaluates to a garba=
ge value [clang-analyzer-core.uninitialized.Branch]
           if (ctl.flags)
               ^
   net/mctp/af_mctp.c:414:2: note: Control jumps to 'case 35297:'  at line =
417
           switch (cmd) {
           ^
   net/mctp/af_mctp.c:418:10: note: Calling 'mctp_ioctl_droptag'
                   return mctp_ioctl_droptag(msk, arg);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mctp/af_mctp.c:376:6: note: Calling 'copy_from_user'
           if (copy_from_user(&ctl, (void __user *)arg, sizeof(ctl)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:455:2: note: Returning without writing t=
o 'to->flags'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))

vim +343 net/mctp/af_mctp.c

63ed1aab3d40aa Matt Johnston 2022-02-09  286  =

8f601a1e4f8c84 Jeremy Kerr   2021-07-29  287  static int mctp_setsockopt(st=
ruct socket *sock, int level, int optname,
8f601a1e4f8c84 Jeremy Kerr   2021-07-29  288  			   sockptr_t optval, unsig=
ned int optlen)
8f601a1e4f8c84 Jeremy Kerr   2021-07-29  289  {
99ce45d5e7dbde Jeremy Kerr   2021-10-26  290  	struct mctp_sock *msk =3D co=
ntainer_of(sock->sk, struct mctp_sock, sk);
99ce45d5e7dbde Jeremy Kerr   2021-10-26  291  	int val;
99ce45d5e7dbde Jeremy Kerr   2021-10-26  292  =

99ce45d5e7dbde Jeremy Kerr   2021-10-26  293  	if (level !=3D SOL_MCTP)
99ce45d5e7dbde Jeremy Kerr   2021-10-26  294  		return -EINVAL;
99ce45d5e7dbde Jeremy Kerr   2021-10-26  295  =

99ce45d5e7dbde Jeremy Kerr   2021-10-26  296  	if (optname =3D=3D MCTP_OPT_=
ADDR_EXT) {
99ce45d5e7dbde Jeremy Kerr   2021-10-26  297  		if (optlen !=3D sizeof(int))
8f601a1e4f8c84 Jeremy Kerr   2021-07-29  298  			return -EINVAL;
99ce45d5e7dbde Jeremy Kerr   2021-10-26 @299  		if (copy_from_sockptr(&val,=
 optval, sizeof(int)))
99ce45d5e7dbde Jeremy Kerr   2021-10-26  300  			return -EFAULT;
99ce45d5e7dbde Jeremy Kerr   2021-10-26  301  		msk->addr_ext =3D val;
99ce45d5e7dbde Jeremy Kerr   2021-10-26  302  		return 0;
99ce45d5e7dbde Jeremy Kerr   2021-10-26  303  	}
99ce45d5e7dbde Jeremy Kerr   2021-10-26  304  =

99ce45d5e7dbde Jeremy Kerr   2021-10-26  305  	return -ENOPROTOOPT;
8f601a1e4f8c84 Jeremy Kerr   2021-07-29  306  }
8f601a1e4f8c84 Jeremy Kerr   2021-07-29  307  =

8f601a1e4f8c84 Jeremy Kerr   2021-07-29  308  static int mctp_getsockopt(st=
ruct socket *sock, int level, int optname,
8f601a1e4f8c84 Jeremy Kerr   2021-07-29  309  			   char __user *optval, in=
t __user *optlen)
8f601a1e4f8c84 Jeremy Kerr   2021-07-29  310  {
99ce45d5e7dbde Jeremy Kerr   2021-10-26  311  	struct mctp_sock *msk =3D co=
ntainer_of(sock->sk, struct mctp_sock, sk);
99ce45d5e7dbde Jeremy Kerr   2021-10-26  312  	int len, val;
99ce45d5e7dbde Jeremy Kerr   2021-10-26  313  =

99ce45d5e7dbde Jeremy Kerr   2021-10-26  314  	if (level !=3D SOL_MCTP)
99ce45d5e7dbde Jeremy Kerr   2021-10-26  315  		return -EINVAL;
99ce45d5e7dbde Jeremy Kerr   2021-10-26  316  =

99ce45d5e7dbde Jeremy Kerr   2021-10-26  317  	if (get_user(len, optlen))
99ce45d5e7dbde Jeremy Kerr   2021-10-26  318  		return -EFAULT;
99ce45d5e7dbde Jeremy Kerr   2021-10-26  319  =

99ce45d5e7dbde Jeremy Kerr   2021-10-26  320  	if (optname =3D=3D MCTP_OPT_=
ADDR_EXT) {
99ce45d5e7dbde Jeremy Kerr   2021-10-26  321  		if (len !=3D sizeof(int))
99ce45d5e7dbde Jeremy Kerr   2021-10-26  322  			return -EINVAL;
99ce45d5e7dbde Jeremy Kerr   2021-10-26  323  		val =3D !!msk->addr_ext;
99ce45d5e7dbde Jeremy Kerr   2021-10-26  324  		if (copy_to_user(optval, &v=
al, len))
99ce45d5e7dbde Jeremy Kerr   2021-10-26  325  			return -EFAULT;
99ce45d5e7dbde Jeremy Kerr   2021-10-26  326  		return 0;
99ce45d5e7dbde Jeremy Kerr   2021-10-26  327  	}
99ce45d5e7dbde Jeremy Kerr   2021-10-26  328  =

8f601a1e4f8c84 Jeremy Kerr   2021-07-29  329  	return -EINVAL;
8f601a1e4f8c84 Jeremy Kerr   2021-07-29  330  }
8f601a1e4f8c84 Jeremy Kerr   2021-07-29  331  =

63ed1aab3d40aa Matt Johnston 2022-02-09  332  static int mctp_ioctl_allocta=
g(struct mctp_sock *msk, unsigned long arg)
63ed1aab3d40aa Matt Johnston 2022-02-09  333  {
63ed1aab3d40aa Matt Johnston 2022-02-09  334  	struct net *net =3D sock_net=
(&msk->sk);
63ed1aab3d40aa Matt Johnston 2022-02-09  335  	struct mctp_sk_key *key =3D =
NULL;
63ed1aab3d40aa Matt Johnston 2022-02-09  336  	struct mctp_ioc_tag_ctl ctl;
63ed1aab3d40aa Matt Johnston 2022-02-09  337  	unsigned long flags;
63ed1aab3d40aa Matt Johnston 2022-02-09  338  	u8 tag;
63ed1aab3d40aa Matt Johnston 2022-02-09  339  =

63ed1aab3d40aa Matt Johnston 2022-02-09  340  	if (copy_from_user(&ctl, (vo=
id __user *)arg, sizeof(ctl)))
63ed1aab3d40aa Matt Johnston 2022-02-09  341  		return -EFAULT;
63ed1aab3d40aa Matt Johnston 2022-02-09  342  =

63ed1aab3d40aa Matt Johnston 2022-02-09 @343  	if (ctl.tag)
63ed1aab3d40aa Matt Johnston 2022-02-09  344  		return -EINVAL;
63ed1aab3d40aa Matt Johnston 2022-02-09  345  =

63ed1aab3d40aa Matt Johnston 2022-02-09  346  	if (ctl.flags)
63ed1aab3d40aa Matt Johnston 2022-02-09  347  		return -EINVAL;
63ed1aab3d40aa Matt Johnston 2022-02-09  348  =

63ed1aab3d40aa Matt Johnston 2022-02-09  349  	key =3D mctp_alloc_local_tag=
(msk, ctl.peer_addr, MCTP_ADDR_ANY,
63ed1aab3d40aa Matt Johnston 2022-02-09  350  				   true, &tag);
63ed1aab3d40aa Matt Johnston 2022-02-09  351  	if (IS_ERR(key))
63ed1aab3d40aa Matt Johnston 2022-02-09  352  		return PTR_ERR(key);
63ed1aab3d40aa Matt Johnston 2022-02-09  353  =

63ed1aab3d40aa Matt Johnston 2022-02-09  354  	ctl.tag =3D tag | MCTP_TAG_O=
WNER | MCTP_TAG_PREALLOC;
63ed1aab3d40aa Matt Johnston 2022-02-09  355  	if (copy_to_user((void __use=
r *)arg, &ctl, sizeof(ctl))) {
63ed1aab3d40aa Matt Johnston 2022-02-09  356  		spin_lock_irqsave(&key->loc=
k, flags);
63ed1aab3d40aa Matt Johnston 2022-02-09  357  		__mctp_key_remove(key, net,=
 flags, MCTP_TRACE_KEY_DROPPED);
63ed1aab3d40aa Matt Johnston 2022-02-09  358  		mctp_key_unref(key);
63ed1aab3d40aa Matt Johnston 2022-02-09  359  		return -EFAULT;
63ed1aab3d40aa Matt Johnston 2022-02-09  360  	}
63ed1aab3d40aa Matt Johnston 2022-02-09  361  =

63ed1aab3d40aa Matt Johnston 2022-02-09  362  	mctp_key_unref(key);
63ed1aab3d40aa Matt Johnston 2022-02-09  363  	return 0;
63ed1aab3d40aa Matt Johnston 2022-02-09  364  }
63ed1aab3d40aa Matt Johnston 2022-02-09  365  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0336897650819668612==--

