Content-Type: multipart/mixed; boundary="===============2457628857171073286=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/core/sock_reuseport.c:579:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Sat, 28 May 2022 21:20:31 +0800
Message-ID: <202205282128.d5eKdesj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2457628857171073286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Kuniyuki Iwashima <kuniyu@amazon.co.jp>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9d004b2f4fea97cde123e7f1939b80e77bf2e695
commit: 55d444b310c64b084dcc62ba3e4dc3862269fb96 tcp: Add stats for socket =
migration.
date:   11 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 11 months ago
config: s390-randconfig-c005-20220524 (https://download.01.org/0day-ci/arch=
ive/20220528/202205282128.d5eKdesj-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 10c9ec=
ce9f6096e18222a331c5e7d085bd813f75)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D55d444b310c64b084dcc62ba3e4dc3862269fb96
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 55d444b310c64b084dcc62ba3e4dc3862269fb96
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/filter.h:589:2: note: expanded from macro '__BPF_PROG_RUN'
           cant_migrate();                                                 \
           ^
   include/linux/kernel.h:148:3: note: expanded from macro 'cant_migrate'
                   if (IS_ENABLED(CONFIG_SMP))                             \
                   ^
   include/linux/filter.h:729:8: note: Loop condition is false.  Exiting lo=
op
           res =3D BPF_PROG_RUN(prog, skb);
                 ^
   include/linux/filter.h:605:2: note: expanded from macro 'BPF_PROG_RUN'
           __BPF_PROG_RUN(prog, ctx, bpf_dispatcher_nop_func)
           ^
   include/linux/filter.h:589:2: note: expanded from macro '__BPF_PROG_RUN'
           cant_migrate();                                                 \
           ^
   include/linux/kernel.h:147:2: note: expanded from macro 'cant_migrate'
           do {                                                            \
           ^
   include/linux/filter.h:729:8: note: Left side of '&&' is false
           res =3D BPF_PROG_RUN(prog, skb);
                 ^
   include/linux/filter.h:605:2: note: expanded from macro 'BPF_PROG_RUN'
           __BPF_PROG_RUN(prog, ctx, bpf_dispatcher_nop_func)
           ^
   include/linux/filter.h:590:6: note: expanded from macro '__BPF_PROG_RUN'
           if (static_branch_unlikely(&bpf_stats_enabled_key)) {           \
               ^
   include/linux/jump_label.h:496:52: note: expanded from macro 'static_bra=
nch_unlikely'
   #define static_branch_unlikely(x)       unlikely_notrace(static_key_enab=
led(&(x)->key))
                                                            ^
   include/linux/jump_label.h:404:67: note: expanded from macro 'static_key=
_enabled'
           if (!__builtin_types_compatible_p(typeof(*x), struct static_key)=
 &&     \
                                                                           =
 ^
   include/linux/filter.h:729:8: note: Assuming the condition is true
           res =3D BPF_PROG_RUN(prog, skb);
                 ^
   include/linux/filter.h:605:2: note: expanded from macro 'BPF_PROG_RUN'
           __BPF_PROG_RUN(prog, ctx, bpf_dispatcher_nop_func)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/filter.h:590:6: note: expanded from macro '__BPF_PROG_RUN'
           if (static_branch_unlikely(&bpf_stats_enabled_key)) {           \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/jump_label.h:496:35: note: expanded from macro 'static_bra=
nch_unlikely'
   #define static_branch_unlikely(x)       unlikely_notrace(static_key_enab=
led(&(x)->key))
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
   include/linux/compiler.h:80:30: note: expanded from macro 'unlikely_notr=
ace'
   # define unlikely_notrace(x)    unlikely(x)
                                   ^~~~~~~~~~~
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/filter.h:729:8: note: Taking true branch
           res =3D BPF_PROG_RUN(prog, skb);
                 ^
   include/linux/filter.h:605:2: note: expanded from macro 'BPF_PROG_RUN'
           __BPF_PROG_RUN(prog, ctx, bpf_dispatcher_nop_func)
           ^
   include/linux/filter.h:590:2: note: expanded from macro '__BPF_PROG_RUN'
           if (static_branch_unlikely(&bpf_stats_enabled_key)) {           \
           ^
   include/linux/filter.h:729:8: note: Loop condition is false.  Exiting lo=
op
           res =3D BPF_PROG_RUN(prog, skb);
                 ^
   include/linux/filter.h:605:2: note: expanded from macro 'BPF_PROG_RUN'
           __BPF_PROG_RUN(prog, ctx, bpf_dispatcher_nop_func)
           ^
   include/linux/filter.h:594:13: note: expanded from macro '__BPF_PROG_RUN'
                   __stats =3D this_cpu_ptr(prog->stats);                  =
  \
                             ^
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                             ^
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   include/linux/filter.h:729:8: note: Dereference of null pointer
           res =3D BPF_PROG_RUN(prog, skb);
                 ^
   include/linux/filter.h:605:2: note: expanded from macro 'BPF_PROG_RUN'
           __BPF_PROG_RUN(prog, ctx, bpf_dispatcher_nop_func)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/filter.h:594:13: note: expanded from macro '__BPF_PROG_RUN'
                   __stats =3D this_cpu_ptr(prog->stats);                  =
  \
                             ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                             ^~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:182:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^~~~~
>> net/core/sock_reuseport.c:579:2: warning: Dereference of null pointer [c=
lang-analyzer-core.NullDereference]
           __NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPMIGRATEREQFAILURE);
           ^
   include/net/ip.h:289:37: note: expanded from macro '__NET_INC_STATS'
   #define __NET_INC_STATS(net, field)     __SNMP_INC_STATS((net)->mib.net_=
statistics, field)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
   include/net/snmp.h:128:4: note: expanded from macro '__SNMP_INC_STATS'
                           __this_cpu_inc(mib->mibs[field])
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:497:30: note: expanded from macro '__this_cp=
u_inc'
   #define __this_cpu_inc(pcp)             __this_cpu_add(pcp, 1)
                                           ^~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 7 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:182:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^~~~~
   net/core/sock_reuseport.c:534:10: note: Left side of '||' is false
           reuse =3D rcu_dereference(sk->sk_reuseport_cb);
                   ^
   include/linux/rcupdate.h:572:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:514:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:375:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   net/core/sock_reuseport.c:534:10: note: Left side of '||' is false
           reuse =3D rcu_dereference(sk->sk_reuseport_cb);
                   ^
   include/linux/rcupdate.h:572:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:514:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:375:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   net/core/sock_reuseport.c:534:10: note: Left side of '||' is false
           reuse =3D rcu_dereference(sk->sk_reuseport_cb);
                   ^
   include/linux/rcupdate.h:572:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:514:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:375:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   net/core/sock_reuseport.c:534:10: note: Left side of '||' is true
           reuse =3D rcu_dereference(sk->sk_reuseport_cb);
                   ^
   include/linux/rcupdate.h:572:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:514:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:375:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compileti=
me_assert_rwonce_type'

vim +579 net/core/sock_reuseport.c

538950a1b7527a Craig Gallek      2016-01-04  511  =

1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  512  /**
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  513   *  reuseport_migrate_soc=
k - Select a socket from an SO_REUSEPORT group.
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  514   *  @sk: close()ed or shu=
tdown()ed socket in the group.
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  515   *  @migrating_sk: ESTABL=
ISHED/SYN_RECV full socket in the accept queue or
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  516   *    NEW_SYN_RECV reques=
t socket during 3WHS.
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  517   *  @skb: skb to run thro=
ugh BPF filter.
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  518   *  Returns a socket (wit=
h sk_refcnt +1) that should accept the child socket
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  519   *  (or NULL on error).
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  520   */
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  521  struct sock *reuseport_mi=
grate_sock(struct sock *sk,
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  522  				    struct sock *migr=
ating_sk,
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  523  				    struct sk_buff *s=
kb)
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  524  {
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  525  	struct sock_reuseport *r=
euse;
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  526  	struct sock *nsk =3D NUL=
L;
d5e4ddaeb6ab2c Kuniyuki Iwashima 2021-06-12  527  	bool allocated =3D false;
d5e4ddaeb6ab2c Kuniyuki Iwashima 2021-06-12  528  	struct bpf_prog *prog;
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  529  	u16 socks;
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  530  	u32 hash;
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  531  =

1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  532  	rcu_read_lock();
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  533  =

1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  534  	reuse =3D rcu_dereferenc=
e(sk->sk_reuseport_cb);
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  535  	if (!reuse)
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  536  		goto out;
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  537  =

1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  538  	socks =3D READ_ONCE(reus=
e->num_socks);
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  539  	if (unlikely(!socks))
55d444b310c64b Kuniyuki Iwashima 2021-06-23  540  		goto failure;
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  541  =

1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  542  	/* paired with smp_wmb()=
 in __reuseport_add_sock() */
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  543  	smp_rmb();
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  544  =

1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  545  	hash =3D migrating_sk->s=
k_hash;
d5e4ddaeb6ab2c Kuniyuki Iwashima 2021-06-12  546  	prog =3D rcu_dereference=
(reuse->prog);
d5e4ddaeb6ab2c Kuniyuki Iwashima 2021-06-12  547  	if (!prog || prog->expec=
ted_attach_type !=3D BPF_SK_REUSEPORT_SELECT_OR_MIGRATE) {
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  548  		if (sock_net(sk)->ipv4.=
sysctl_tcp_migrate_req)
d5e4ddaeb6ab2c Kuniyuki Iwashima 2021-06-12  549  			goto select_by_hash;
55d444b310c64b Kuniyuki Iwashima 2021-06-23  550  		goto failure;
d5e4ddaeb6ab2c Kuniyuki Iwashima 2021-06-12  551  	}
d5e4ddaeb6ab2c Kuniyuki Iwashima 2021-06-12  552  =

d5e4ddaeb6ab2c Kuniyuki Iwashima 2021-06-12  553  	if (!skb) {
d5e4ddaeb6ab2c Kuniyuki Iwashima 2021-06-12  554  		skb =3D alloc_skb(0, GF=
P_ATOMIC);
d5e4ddaeb6ab2c Kuniyuki Iwashima 2021-06-12  555  		if (!skb)
55d444b310c64b Kuniyuki Iwashima 2021-06-23  556  			goto failure;
d5e4ddaeb6ab2c Kuniyuki Iwashima 2021-06-12  557  		allocated =3D true;
d5e4ddaeb6ab2c Kuniyuki Iwashima 2021-06-12  558  	}
d5e4ddaeb6ab2c Kuniyuki Iwashima 2021-06-12  559  =

d5e4ddaeb6ab2c Kuniyuki Iwashima 2021-06-12  560  	nsk =3D bpf_run_sk_reuse=
port(reuse, sk, prog, skb, migrating_sk, hash);
d5e4ddaeb6ab2c Kuniyuki Iwashima 2021-06-12  561  =

d5e4ddaeb6ab2c Kuniyuki Iwashima 2021-06-12  562  	if (allocated)
d5e4ddaeb6ab2c Kuniyuki Iwashima 2021-06-12  563  		kfree_skb(skb);
d5e4ddaeb6ab2c Kuniyuki Iwashima 2021-06-12  564  =

d5e4ddaeb6ab2c Kuniyuki Iwashima 2021-06-12  565  select_by_hash:
d5e4ddaeb6ab2c Kuniyuki Iwashima 2021-06-12  566  	if (!nsk)
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  567  		nsk =3D reuseport_selec=
t_sock_by_hash(reuse, hash, socks);
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  568  =

55d444b310c64b Kuniyuki Iwashima 2021-06-23  569  	if (IS_ERR_OR_NULL(nsk) =
|| unlikely(!refcount_inc_not_zero(&nsk->sk_refcnt))) {
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  570  		nsk =3D NULL;
55d444b310c64b Kuniyuki Iwashima 2021-06-23  571  		goto failure;
55d444b310c64b Kuniyuki Iwashima 2021-06-23  572  	}
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  573  =

1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  574  out:
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  575  	rcu_read_unlock();
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  576  	return nsk;
55d444b310c64b Kuniyuki Iwashima 2021-06-23  577  =

55d444b310c64b Kuniyuki Iwashima 2021-06-23  578  failure:
55d444b310c64b Kuniyuki Iwashima 2021-06-23 @579  	__NET_INC_STATS(sock_net=
(sk), LINUX_MIB_TCPMIGRATEREQFAILURE);
55d444b310c64b Kuniyuki Iwashima 2021-06-23  580  	goto out;
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  581  }
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  582  EXPORT_SYMBOL(reuseport_m=
igrate_sock);
1cd62c21572c1d Kuniyuki Iwashima 2021-06-12  583  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2457628857171073286==--

