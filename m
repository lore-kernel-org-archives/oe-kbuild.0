Content-Type: multipart/mixed; boundary="===============4570483492412287184=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:bpf/bpf-next/master 185/265] net/mctp/af_mctp.c:343:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Wed, 16 Feb 2022 08:09:39 +0800
Message-ID: <202202160838.POPiJ4nt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4570483492412287184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Matt Johnston <matt@codeconstruct.com.au>
CC: Jeremy Kerr <jk@codeconstruct.com.au>

tree:   https://github.com/ammarfaizi2/linux-block bpf/bpf-next/master
head:   8cbf062a250ed52148badf6f3ffd03657dd4a3f0
commit: 63ed1aab3d40aa61aaa66819bdce9377ac7f40fa [185/265] mctp: Add SIOCMC=
TP{ALLOC,DROP}TAG ioctls for tag control
:::::: branch date: 6 hours ago
:::::: commit date: 7 days ago
config: mips-randconfig-c004-20220211 (https://download.01.org/0day-ci/arch=
ive/20220216/202202160838.POPiJ4nt-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f6685f=
774697c85d6a352dcea013f46a99f9fe31)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/63ed1aab3d40aa6=
1aaa66819bdce9377ac7f40fa
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block bpf/bpf-next/master
        git checkout 63ed1aab3d40aa61aaa66819bdce9377ac7f40fa
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->t=
ag'
           return res;
           ^
   include/linux/uaccess.h:163:2: note: Returning zero (loaded from 'res'),=
 which participates in a condition later
           return res;
           ^~~~~~~~~~
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->t=
ag'
           return n;
           ^
   include/linux/uaccess.h:193:2: note: Returning zero (loaded from 'n'), w=
hich participates in a condition later
           return n;
           ^~~~~~~~
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
   include/linux/uaccess.h:157:7: note: Calling 'should_fail_usercopy'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/fault-inject-usercopy.h:18:49: note: Returning zero, which=
 participates in a condition later
   static inline bool should_fail_usercopy(void) { return false; }

vim +343 net/mctp/af_mctp.c

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


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4570483492412287184==--

