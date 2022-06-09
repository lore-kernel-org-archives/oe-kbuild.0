Content-Type: multipart/mixed; boundary="===============6429546299529880457=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/ipv4/udp_bpf.c:42:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Thu, 09 Jun 2022 21:14:55 +0800
Message-ID: <202206092124.Ypmmn4y9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6429546299529880457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: net/ipv4/=
udp_bpf.c:42:2: warning: Dereference of null pointer [clang-analyzer-core.N=
ullDereference]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Cong Wang <cong.wang@bytedance.com>
CC: Daniel Borkmann <daniel@iogearbox.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6bfb56e93bcef41859c2d5ab234ffd80b691be35
commit: 9f2470fbc4cb4583c080bb729a998933ba61aca4 skmsg: Improve udp_bpf_rec=
vmsg() accuracy
date:   12 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 12 months ago
config: s390-randconfig-c005-20220607 (https://download.01.org/0day-ci/arch=
ive/20220609/202206092124.Ypmmn4y9-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436=
efcb7813fc481b30f2593a4907568d917a)
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
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:686:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io-wq.c:910:7: note: Returning from 'kzalloc'
           wq =3D kzalloc(sizeof(*wq), GFP_KERNEL);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io-wq.c:911:6: note: Assuming 'wq' is non-null
           if (!wq)
               ^~~
   fs/io-wq.c:911:2: note: Taking false branch
           if (!wq)
           ^
   fs/io-wq.c:914:13: note: Calling 'kcalloc'
           wq->wqes =3D kcalloc(nr_node_ids, sizeof(struct io_wqe *), GFP_K=
ERNEL);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/slab.h:625:9: note: Calling 'kmalloc_array'
           return kmalloc_array(n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:592:2: note: Taking false branch
           if (unlikely(check_mul_overflow(n, size, &bytes)))
           ^
   include/linux/slab.h:594:30: note: Left side of '&&' is false
           if (__builtin_constant_p(n) && __builtin_constant_p(size))
                                       ^
   include/linux/slab.h:596:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(bytes, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:625:9: note: Returning from 'kmalloc_array'
           return kmalloc_array(n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:625:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc_array(n, size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io-wq.c:914:13: note: Returning from 'kcalloc'
           wq->wqes =3D kcalloc(nr_node_ids, sizeof(struct io_wqe *), GFP_K=
ERNEL);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/io-wq.c:915:6: note: Assuming field 'wqes' is non-null
           if (!wq->wqes)
               ^~~~~~~~~
   fs/io-wq.c:915:2: note: Taking false branch
           if (!wq->wqes)
           ^
   fs/io-wq.c:919:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   fs/io-wq.c:919:2: note: Taking false branch
           if (ret)
           ^
   fs/io-wq.c:928:2: note: Loop condition is true.  Entering loop body
           for_each_node(node) {
           ^
   include/linux/nodemask.h:514:32: note: expanded from macro 'for_each_nod=
e'
   #define for_each_node(node)        for_each_node_state(node, N_POSSIBLE)
                                      ^
   include/linux/nodemask.h:484:2: note: expanded from macro 'for_each_node=
_state'
           for ( (node) =3D 0; (node) =3D=3D 0; (node) =3D 1)
           ^
   fs/io-wq.c:932:3: note: Taking false branch
                   if (!node_online(alloc_node))
                   ^
   fs/io-wq.c:934:9: note: Calling 'kzalloc_node'
                   wqe =3D kzalloc_node(sizeof(struct io_wqe), GFP_KERNEL, =
alloc_node);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   include/linux/slab.h:697:9: note: Calling 'kmalloc_node'
           return kmalloc_node(size, flags | __GFP_ZERO, node);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:567:33: note: Left side of '&&' is false
           if (__builtin_constant_p(size) &&
                                          ^
   include/linux/slab.h:579:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc_node(size, flags, node);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:697:9: note: Returning from 'kmalloc_node'
           return kmalloc_node(size, flags | __GFP_ZERO, node);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:697:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc_node(size, flags | __GFP_ZERO, node);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io-wq.c:934:9: note: Returning from 'kzalloc_node'
                   wqe =3D kzalloc_node(sizeof(struct io_wqe), GFP_KERNEL, =
alloc_node);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   fs/io-wq.c:935:7: note: Assuming 'wqe' is non-null
                   if (!wqe)
                       ^~~~
   fs/io-wq.c:935:3: note: Taking false branch
                   if (!wqe)
                   ^
   fs/io-wq.c:944:18: note: Dereference of null pointer
                                           task_rlimit(current, RLIMIT_NPRO=
C);
                                                       ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
>> net/ipv4/udp_bpf.c:42:2: warning: Dereference of null pointer [clang-ana=
lyzer-core.NullDereference]
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
   net/ipv4/udp_bpf.c:69:6: note: Assuming the condition is true
           if (unlikely(flags & MSG_ERRQUEUE))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   net/ipv4/udp_bpf.c:69:2: note: Taking false branch
           if (unlikely(flags & MSG_ERRQUEUE))
           ^
   net/ipv4/udp_bpf.c:73:16: note: 'psock' is non-null
           if (unlikely(!psock))
                         ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/ipv4/udp_bpf.c:73:2: note: Taking false branch
           if (unlikely(!psock))
           ^
   net/ipv4/udp_bpf.c:76:2: note: Taking false branch
           if (!psock_has_data(psock)) {
           ^
   net/ipv4/udp_bpf.c:83:6: note: Assuming 'copied' is 0
           if (!copied) {
               ^~~~~~~
   net/ipv4/udp_bpf.c:83:2: note: Taking true branch
           if (!copied) {
           ^
   net/ipv4/udp_bpf.c:88:10: note: Calling 'udp_msg_wait_data'
                   data =3D udp_msg_wait_data(sk, psock, flags, timeo, &err=
);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   24 warnings generated.
   Suppressed 24 warnings (12 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   fs/fuse/dev.c:138:41: warning: Dereference of null pointer [clang-analyz=
er-core.NullDereference]
           req->in.h.uid =3D from_kuid(fc->user_ns, current_fsuid());
                                                  ^
   include/linux/cred.h:384:27: note: expanded from macro 'current_fsuid'
   #define current_fsuid()         (current_cred_xxx(fsuid))
                                    ^
   include/linux/cred.h:375:2: note: expanded from macro 'current_cred_xxx'
           current_cred()->xxx;                    \
           ^
   include/linux/cred.h:297:28: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
                                     ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/fuse/dev.c:592:8: note: Calling 'fuse_get_req'
           req =3D fuse_get_req(fm, false);
                 ^~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/dev.c:113:6: note: Calling 'fuse_block_alloc'
           if (fuse_block_alloc(fc, for_background)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/dev.c:87:9: note: Assuming field 'initialized' is not equal to 0
           return !fc->initialized || (for_background && fc->blocked);
                  ^~~~~~~~~~~~~~~~
   fs/fuse/dev.c:87:9: note: Left side of '||' is false
   fs/fuse/dev.c:87:30: note: 'for_background' is false
           return !fc->initialized || (for_background && fc->blocked);
                                       ^~~~~~~~~~~~~~
   fs/fuse/dev.c:87:45: note: Left side of '&&' is false
           return !fc->initialized || (for_background && fc->blocked);
                                                      ^
   fs/fuse/dev.c:87:2: note: Returning without writing to 'fc->connected', =
which participates in a condition later
           return !fc->initialized || (for_background && fc->blocked);
           ^
   fs/fuse/dev.c:87:2: note: Returning without writing to 'fc->conn_error',=
 which participates in a condition later

vim +42 net/ipv4/udp_bpf.c

9f2470fbc4cb458 Cong Wang 2021-06-14  35  =

9f2470fbc4cb458 Cong Wang 2021-06-14  36  #define udp_msg_has_data(__sk, __=
psock)	\
9f2470fbc4cb458 Cong Wang 2021-06-14  37  		({ udp_sk_has_data(__sk) || pso=
ck_has_data(__psock); })
9f2470fbc4cb458 Cong Wang 2021-06-14  38  =

9f2470fbc4cb458 Cong Wang 2021-06-14  39  static int udp_msg_wait_data(stru=
ct sock *sk, struct sk_psock *psock, int flags,
9f2470fbc4cb458 Cong Wang 2021-06-14  40  			     long timeo, int *err)
9f2470fbc4cb458 Cong Wang 2021-06-14  41  {
9f2470fbc4cb458 Cong Wang 2021-06-14 @42  	DEFINE_WAIT_FUNC(wait, woken_wak=
e_function);
9f2470fbc4cb458 Cong Wang 2021-06-14  43  	int ret =3D 0;
9f2470fbc4cb458 Cong Wang 2021-06-14  44  =

9f2470fbc4cb458 Cong Wang 2021-06-14  45  	if (sk->sk_shutdown & RCV_SHUTDO=
WN)
9f2470fbc4cb458 Cong Wang 2021-06-14  46  		return 1;
9f2470fbc4cb458 Cong Wang 2021-06-14  47  =

9f2470fbc4cb458 Cong Wang 2021-06-14  48  	if (!timeo)
9f2470fbc4cb458 Cong Wang 2021-06-14  49  		return ret;
9f2470fbc4cb458 Cong Wang 2021-06-14  50  =

9f2470fbc4cb458 Cong Wang 2021-06-14  51  	add_wait_queue(sk_sleep(sk), &wa=
it);
9f2470fbc4cb458 Cong Wang 2021-06-14  52  	sk_set_bit(SOCKWQ_ASYNC_WAITDATA=
, sk);
9f2470fbc4cb458 Cong Wang 2021-06-14  53  	ret =3D udp_msg_has_data(sk, pso=
ck);
9f2470fbc4cb458 Cong Wang 2021-06-14  54  	if (!ret) {
9f2470fbc4cb458 Cong Wang 2021-06-14  55  		wait_woken(&wait, TASK_INTERRUP=
TIBLE, timeo);
9f2470fbc4cb458 Cong Wang 2021-06-14  56  		ret =3D udp_msg_has_data(sk, ps=
ock);
9f2470fbc4cb458 Cong Wang 2021-06-14  57  	}
9f2470fbc4cb458 Cong Wang 2021-06-14  58  	sk_clear_bit(SOCKWQ_ASYNC_WAITDA=
TA, sk);
9f2470fbc4cb458 Cong Wang 2021-06-14  59  	remove_wait_queue(sk_sleep(sk), =
&wait);
9f2470fbc4cb458 Cong Wang 2021-06-14  60  	return ret;
9f2470fbc4cb458 Cong Wang 2021-06-14  61  }
9f2470fbc4cb458 Cong Wang 2021-06-14  62  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6429546299529880457==--

