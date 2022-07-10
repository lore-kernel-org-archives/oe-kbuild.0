Content-Type: multipart/mixed; boundary="===============6774214200174387094=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/unix/unix_bpf.c:18:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Sun, 10 Jul 2022 23:57:29 +0800
Message-ID: <202207102319.aXNpI7Fo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6774214200174387094==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: net/unix/=
unix_bpf.c:18:2: warning: Dereference of null pointer [clang-analyzer-core.=
NullDereference]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Cong Wang <cong.wang@bytedance.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b1c428b6c3684ee8ddf4137d68b3e8d51d2a700f
commit: 9825d866ce0d11009513e06824885340062c166b af_unix: Implement unix_dg=
ram_bpf_recvmsg()
date:   12 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 12 months ago
config: s390-randconfig-c005-20220707 (https://download.01.org/0day-ci/arch=
ive/20220710/202207102319.aXNpI7Fo-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 562c34=
67a6738aa89203f72fc1d1343e5baadf3c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D9825d866ce0d11009513e06824885340062c166b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9825d866ce0d11009513e06824885340062c166b
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/batman-adv/netlink.c:1285:14: note: '?' condition is false
           if (WARN_ON(hweight8(ops->internal_flags & user_ptr1_flags) > 1))
                       ^
   include/asm-generic/bitops/const_hweight.h:26:23: note: expanded from ma=
cro 'hweight8'
   #define hweight8(w)  (__builtin_constant_p(w) ? __const_hweight8(w)  : _=
_arch_hweight8(w))
                         ^
   net/batman-adv/netlink.c:1285:14: note: Assuming the condition is false
           if (WARN_ON(hweight8(ops->internal_flags & user_ptr1_flags) > 1))
                       ^
   include/asm-generic/bitops/const_hweight.h:26:22: note: expanded from ma=
cro 'hweight8'
   #define hweight8(w)  (__builtin_constant_p(w) ? __const_hweight8(w)  : _=
_arch_hweight8(w))
                        ^
   arch/s390/include/asm/bug.h:53:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(x);                      \
                                  ^
   net/batman-adv/netlink.c:1285:6: note: Taking false branch
           if (WARN_ON(hweight8(ops->internal_flags & user_ptr1_flags) > 1))
               ^
   arch/s390/include/asm/bug.h:54:2: note: expanded from macro 'WARN_ON'
           if (__builtin_constant_p(__ret_warn_on)) {      \
           ^
   net/batman-adv/netlink.c:1285:6: note: Taking false branch
           if (WARN_ON(hweight8(ops->internal_flags & user_ptr1_flags) > 1))
               ^
   arch/s390/include/asm/bug.h:58:3: note: expanded from macro 'WARN_ON'
                   if (unlikely(__ret_warn_on))            \
                   ^
   net/batman-adv/netlink.c:1285:2: note: Taking false branch
           if (WARN_ON(hweight8(ops->internal_flags & user_ptr1_flags) > 1))
           ^
   net/batman-adv/netlink.c:1289:15: note: Assuming the condition is false
           if (WARN_ON((ops->internal_flags & mesh_dep_flags) &&
                        ^
   arch/s390/include/asm/bug.h:53:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(x);                      \
                                  ^
   net/batman-adv/netlink.c:1289:53: note: Left side of '&&' is false
           if (WARN_ON((ops->internal_flags & mesh_dep_flags) &&
                                                              ^
   net/batman-adv/netlink.c:1289:6: note: Taking false branch
           if (WARN_ON((ops->internal_flags & mesh_dep_flags) &&
               ^
   arch/s390/include/asm/bug.h:54:2: note: expanded from macro 'WARN_ON'
           if (__builtin_constant_p(__ret_warn_on)) {      \
           ^
   net/batman-adv/netlink.c:1289:6: note: Taking false branch
           if (WARN_ON((ops->internal_flags & mesh_dep_flags) &&
               ^
   arch/s390/include/asm/bug.h:58:3: note: expanded from macro 'WARN_ON'
                   if (unlikely(__ret_warn_on))            \
                   ^
   net/batman-adv/netlink.c:1289:2: note: Taking false branch
           if (WARN_ON((ops->internal_flags & mesh_dep_flags) &&
           ^
   net/batman-adv/netlink.c:1293:6: note: Assuming the condition is false
           if (ops->internal_flags & BATADV_FLAG_NEED_MESH) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/batman-adv/netlink.c:1293:2: note: Taking false branch
           if (ops->internal_flags & BATADV_FLAG_NEED_MESH) {
           ^
   net/batman-adv/netlink.c:1302:6: note: Assuming the condition is true
           if (ops->internal_flags & BATADV_FLAG_NEED_HARDIF) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/batman-adv/netlink.c:1302:2: note: Taking true branch
           if (ops->internal_flags & BATADV_FLAG_NEED_HARDIF) {
           ^
   net/batman-adv/netlink.c:1303:44: note: Passing null pointer value via 1=
st parameter 'bat_priv'
                   hard_iface =3D batadv_get_hardif_from_info(bat_priv, net=
, info);
                                                            ^~~~~~~~
   net/batman-adv/netlink.c:1303:16: note: Calling 'batadv_get_hardif_from_=
info'
                   hard_iface =3D batadv_get_hardif_from_info(bat_priv, net=
, info);
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   net/batman-adv/netlink.c:1207:6: note: Assuming the condition is false
           if (!info->attrs[BATADV_ATTR_HARD_IFINDEX])
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/batman-adv/netlink.c:1207:2: note: Taking false branch
           if (!info->attrs[BATADV_ATTR_HARD_IFINDEX])
           ^
   net/batman-adv/netlink.c:1213:6: note: Assuming 'hard_dev' is non-null
           if (!hard_dev)
               ^~~~~~~~~
   net/batman-adv/netlink.c:1213:2: note: Taking false branch
           if (!hard_dev)
           ^
   net/batman-adv/netlink.c:1217:6: note: Assuming 'hard_iface' is non-null
           if (!hard_iface)
               ^~~~~~~~~~~
   net/batman-adv/netlink.c:1217:2: note: Taking false branch
           if (!hard_iface)
           ^
   net/batman-adv/netlink.c:1220:32: note: Access to field 'soft_iface' res=
ults in a dereference of a null pointer (loaded from variable 'bat_priv')
           if (hard_iface->soft_iface !=3D bat_priv->soft_iface)
                                         ^~~~~~~~
   Suppressed 25 warnings (13 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (14 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
>> net/unix/unix_bpf.c:18:2: warning: Dereference of null pointer [clang-an=
alyzer-core.NullDereference]
           DEFINE_WAIT_FUNC(wait, woken_wake_function);
           ^
   include/linux/wait.h:1148:14: note: expanded from macro 'DEFINE_WAIT_FUN=
C'
                   .private        =3D current,                            =
          \
                                     ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   net/unix/unix_bpf.c:50:16: note: 'psock' is non-null
           if (unlikely(!psock))
                         ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/unix/unix_bpf.c:50:2: note: Taking false branch
           if (unlikely(!psock))
           ^
   net/unix/unix_bpf.c:54:6: note: Assuming the condition is false
           if (!skb_queue_empty(&sk->sk_receive_queue) &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/unix/unix_bpf.c:54:46: note: Left side of '&&' is false
           if (!skb_queue_empty(&sk->sk_receive_queue) &&
                                                       ^
   net/unix/unix_bpf.c:62:6: note: Assuming 'copied' is 0
           if (!copied) {
               ^~~~~~~
   net/unix/unix_bpf.c:62:2: note: Taking true branch
           if (!copied) {
           ^
   net/unix/unix_bpf.c:67:10: note: Calling 'unix_msg_wait_data'
                   data =3D unix_msg_wait_data(sk, psock, timeo);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/unix/unix_bpf.c:18:2: note: Dereference of null pointer
           DEFINE_WAIT_FUNC(wait, woken_wake_function);
           ^
   include/linux/wait.h:1148:14: note: expanded from macro 'DEFINE_WAIT_FUN=
C'
                   .private        =3D current,                            =
          \
                                     ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 26 warnings (14 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (14 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   net/unix/scm.c:97:29: warning: Dereference of null pointer [clang-analyz=
er-core.NullDereference]
           struct user_struct *user =3D current_user();
                                      ^
   include/linux/cred.h:390:26: note: expanded from macro 'current_user'
   #define current_user()          (current_cred_xxx(user))
                                    ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/cred.h:378:2: note: expanded from macro 'current_cred_xxx'
           current_cred()->xxx;                    \
           ^~~~~~~~~~~~~~
   include/linux/cred.h:299:28: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/rcupdate.h:577:31: note: expanded from macro 'rcu_derefere=
nce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
   include/linux/rcupdate.h:398:35: note: expanded from macro '__rcu_derefe=
rence_protected'
           ((typeof(*p) __force __kernel *)(p)); \
                                            ^
   net/unix/scm.c:97:29: note: Left side of '&&' is false
           struct user_struct *user =3D current_user();
                                      ^
   include/linux/cred.h:390:26: note: expanded from macro 'current_user'
   #define current_user()          (current_cred_xxx(user))
                                    ^
   include/linux/cred.h:378:2: note: expanded from macro 'current_cred_xxx'
           current_cred()->xxx;                    \
           ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:577:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:396:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:346:48: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                                  ^
   net/unix/scm.c:97:29: note: Loop condition is false.  Exiting loop
           struct user_struct *user =3D current_user();
                                      ^
   include/linux/cred.h:390:26: note: expanded from macro 'current_user'

vim +18 net/unix/unix_bpf.c

c63829182c37c2 Cong Wang 2021-07-04   8  =

9825d866ce0d11 Cong Wang 2021-07-04   9  #define unix_sk_has_data(__sk, __p=
sock)					\
9825d866ce0d11 Cong Wang 2021-07-04  10  		({	!skb_queue_empty(&__sk->sk_re=
ceive_queue) ||	\
9825d866ce0d11 Cong Wang 2021-07-04  11  			!skb_queue_empty(&__psock->ingr=
ess_skb) ||	\
9825d866ce0d11 Cong Wang 2021-07-04  12  			!list_empty(&__psock->ingress_m=
sg);		\
9825d866ce0d11 Cong Wang 2021-07-04  13  		})
9825d866ce0d11 Cong Wang 2021-07-04  14  =

9825d866ce0d11 Cong Wang 2021-07-04  15  static int unix_msg_wait_data(stru=
ct sock *sk, struct sk_psock *psock,
9825d866ce0d11 Cong Wang 2021-07-04  16  			      long timeo)
9825d866ce0d11 Cong Wang 2021-07-04  17  {
9825d866ce0d11 Cong Wang 2021-07-04 @18  	DEFINE_WAIT_FUNC(wait, woken_wake=
_function);
9825d866ce0d11 Cong Wang 2021-07-04  19  	struct unix_sock *u =3D unix_sk(s=
k);
9825d866ce0d11 Cong Wang 2021-07-04  20  	int ret =3D 0;
9825d866ce0d11 Cong Wang 2021-07-04  21  =

9825d866ce0d11 Cong Wang 2021-07-04  22  	if (sk->sk_shutdown & RCV_SHUTDOW=
N)
9825d866ce0d11 Cong Wang 2021-07-04  23  		return 1;
9825d866ce0d11 Cong Wang 2021-07-04  24  =

9825d866ce0d11 Cong Wang 2021-07-04  25  	if (!timeo)
9825d866ce0d11 Cong Wang 2021-07-04  26  		return ret;
9825d866ce0d11 Cong Wang 2021-07-04  27  =

9825d866ce0d11 Cong Wang 2021-07-04  28  	add_wait_queue(sk_sleep(sk), &wai=
t);
9825d866ce0d11 Cong Wang 2021-07-04  29  	sk_set_bit(SOCKWQ_ASYNC_WAITDATA,=
 sk);
9825d866ce0d11 Cong Wang 2021-07-04  30  	if (!unix_sk_has_data(sk, psock))=
 {
9825d866ce0d11 Cong Wang 2021-07-04  31  		mutex_unlock(&u->iolock);
9825d866ce0d11 Cong Wang 2021-07-04  32  		wait_woken(&wait, TASK_INTERRUPT=
IBLE, timeo);
9825d866ce0d11 Cong Wang 2021-07-04  33  		mutex_lock(&u->iolock);
9825d866ce0d11 Cong Wang 2021-07-04  34  		ret =3D unix_sk_has_data(sk, pso=
ck);
9825d866ce0d11 Cong Wang 2021-07-04  35  	}
9825d866ce0d11 Cong Wang 2021-07-04  36  	sk_clear_bit(SOCKWQ_ASYNC_WAITDAT=
A, sk);
9825d866ce0d11 Cong Wang 2021-07-04  37  	remove_wait_queue(sk_sleep(sk), &=
wait);
9825d866ce0d11 Cong Wang 2021-07-04  38  	return ret;
9825d866ce0d11 Cong Wang 2021-07-04  39  }
9825d866ce0d11 Cong Wang 2021-07-04  40  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6774214200174387094==--

