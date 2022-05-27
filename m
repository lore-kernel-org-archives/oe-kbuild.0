Content-Type: multipart/mixed; boundary="===============0449905948994263580=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/ipv4/udp_bpf.c:42:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Sat, 28 May 2022 03:50:35 +0800
Message-ID: <202205280304.CTm3ecOw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0449905948994263580==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Cong Wang <cong.wang@bytedance.com>
CC: Daniel Borkmann <daniel@iogearbox.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7e284070abe53d448517b80493863595af4ab5f0
commit: 9f2470fbc4cb4583c080bb729a998933ba61aca4 skmsg: Improve udp_bpf_rec=
vmsg() accuracy
date:   11 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 11 months ago
config: s390-randconfig-c005-20220518 (https://download.01.org/0day-ci/arch=
ive/20220528/202205280304.CTm3ecOw-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8=
ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D9f2470fbc4cb4583c080bb729a998933ba61aca4
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9f2470fbc4cb4583c080bb729a998933ba61aca4
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                               ^
   net/netfilter/nf_conntrack_netlink.c:2412:4: note: '?' condition is false
                           if (!cda[CTA_TUPLE_ORIG] || !cda[CTA_TUPLE_REPLY=
])
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   net/netfilter/nf_conntrack_netlink.c:2412:4: note: Taking false branch
                           if (!cda[CTA_TUPLE_ORIG] || !cda[CTA_TUPLE_REPLY=
])
                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/netfilter/nf_conntrack_netlink.c:2414:28: note: The left operand of =
'!=3D' is a garbage value
                           if (otuple.dst.protonum !=3D rtuple.dst.protonum)
                                                   ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   Suppressed 24 warnings (12 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   arch/s390/include/asm/preempt.h:112:29: warning: Dereference of null poi=
nter [clang-analyzer-core.NullDereference]
           S390_lowcore.preempt_count +=3D val;
                                      ^
   net/ipv4/udp_bpf.c:69:6: note: Assuming the condition is true
           if (unlikely(flags & MSG_ERRQUEUE))
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/ipv4/udp_bpf.c:69:2: note: '?' condition is false
           if (unlikely(flags & MSG_ERRQUEUE))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/ipv4/udp_bpf.c:69:2: note: '?' condition is false
           if (unlikely(flags & MSG_ERRQUEUE))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   net/ipv4/udp_bpf.c:69:2: note: Taking false branch
           if (unlikely(flags & MSG_ERRQUEUE))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/ipv4/udp_bpf.c:72:10: note: Calling 'sk_psock_get'
           psock =3D sk_psock_get(sk);
                   ^~~~~~~~~~~~~~~~
   include/linux/skmsg.h:431:2: note: Calling 'rcu_read_lock'
           rcu_read_lock();
           ^~~~~~~~~~~~~~~
   include/linux/rcupdate.h:655:2: note: Calling '__rcu_read_lock'
           __rcu_read_lock();
           ^~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:68:2: note: Calling '__preempt_count_add'
           preempt_disable();
           ^
   include/linux/preempt.h:177:2: note: expanded from macro 'preempt_disabl=
e'
           preempt_count_inc(); \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:170:29: note: expanded from macro 'preempt_count=
_inc'
   #define preempt_count_inc() preempt_count_add(1)
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:162:32: note: expanded from macro 'preempt_count=
_add'
   #define preempt_count_add(val)  __preempt_count_add(val)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/preempt.h:112:29: note: Dereference of null pointer
           S390_lowcore.preempt_count +=3D val;
                                      ^
>> net/ipv4/udp_bpf.c:42:2: warning: Dereference of null pointer [clang-ana=
lyzer-core.NullDereference]
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
   net/ipv4/udp_bpf.c:42:2: note: Dereference of null pointer
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
   Suppressed 24 warnings (12 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
   Suppressed 24 warnings (12 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   fs/cifs/connect.c:1213:35: warning: Dereference of null pointer [clang-a=
nalyzer-core.NullDereference]
           if (!net_eq(cifs_net_ns(server), current->nsproxy->net_ns))
                                            ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/cifs/connect.c:1199:2: note: Assuming field 'nosharesock' is false
           if (ctx->nosharesock)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/cifs/connect.c:1199:2: note: '?' condition is false
           if (ctx->nosharesock)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/cifs/connect.c:1199:11: note: Field 'nosharesock' is false
           if (ctx->nosharesock)
                    ^
   fs/cifs/connect.c:1199:2: note: '?' condition is false
           if (ctx->nosharesock)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/cifs/connect.c:1199:2: note: Taking false branch
           if (ctx->nosharesock)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/cifs/connect.c:1203:2: note: '?' condition is false
           if (strcmp(ctx->vals->version_string, SMB3ANY_VERSION_STRING) =
=3D=3D 0) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/cifs/connect.c:1203:2: note: '?' condition is true
           if (strcmp(ctx->vals->version_string, SMB3ANY_VERSION_STRING) =
=3D=3D 0) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))

vim +42 net/ipv4/udp_bpf.c

9f2470fbc4cb45 Cong Wang 2021-06-14  35  =

9f2470fbc4cb45 Cong Wang 2021-06-14  36  #define udp_msg_has_data(__sk, __p=
sock)	\
9f2470fbc4cb45 Cong Wang 2021-06-14  37  		({ udp_sk_has_data(__sk) || psoc=
k_has_data(__psock); })
9f2470fbc4cb45 Cong Wang 2021-06-14  38  =

9f2470fbc4cb45 Cong Wang 2021-06-14  39  static int udp_msg_wait_data(struc=
t sock *sk, struct sk_psock *psock, int flags,
9f2470fbc4cb45 Cong Wang 2021-06-14  40  			     long timeo, int *err)
9f2470fbc4cb45 Cong Wang 2021-06-14  41  {
9f2470fbc4cb45 Cong Wang 2021-06-14 @42  	DEFINE_WAIT_FUNC(wait, woken_wake=
_function);
9f2470fbc4cb45 Cong Wang 2021-06-14  43  	int ret =3D 0;
9f2470fbc4cb45 Cong Wang 2021-06-14  44  =

9f2470fbc4cb45 Cong Wang 2021-06-14  45  	if (sk->sk_shutdown & RCV_SHUTDOW=
N)
9f2470fbc4cb45 Cong Wang 2021-06-14  46  		return 1;
9f2470fbc4cb45 Cong Wang 2021-06-14  47  =

9f2470fbc4cb45 Cong Wang 2021-06-14  48  	if (!timeo)
9f2470fbc4cb45 Cong Wang 2021-06-14  49  		return ret;
9f2470fbc4cb45 Cong Wang 2021-06-14  50  =

9f2470fbc4cb45 Cong Wang 2021-06-14  51  	add_wait_queue(sk_sleep(sk), &wai=
t);
9f2470fbc4cb45 Cong Wang 2021-06-14  52  	sk_set_bit(SOCKWQ_ASYNC_WAITDATA,=
 sk);
9f2470fbc4cb45 Cong Wang 2021-06-14  53  	ret =3D udp_msg_has_data(sk, psoc=
k);
9f2470fbc4cb45 Cong Wang 2021-06-14  54  	if (!ret) {
9f2470fbc4cb45 Cong Wang 2021-06-14  55  		wait_woken(&wait, TASK_INTERRUPT=
IBLE, timeo);
9f2470fbc4cb45 Cong Wang 2021-06-14  56  		ret =3D udp_msg_has_data(sk, pso=
ck);
9f2470fbc4cb45 Cong Wang 2021-06-14  57  	}
9f2470fbc4cb45 Cong Wang 2021-06-14  58  	sk_clear_bit(SOCKWQ_ASYNC_WAITDAT=
A, sk);
9f2470fbc4cb45 Cong Wang 2021-06-14  59  	remove_wait_queue(sk_sleep(sk), &=
wait);
9f2470fbc4cb45 Cong Wang 2021-06-14  60  	return ret;
9f2470fbc4cb45 Cong Wang 2021-06-14  61  }
9f2470fbc4cb45 Cong Wang 2021-06-14  62  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0449905948994263580==--

