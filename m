Content-Type: multipart/mixed; boundary="===============0267522430301847987=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/ipv4/tcp_bpf.c:169:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Mon, 06 Jun 2022 18:04:13 +0800
Message-ID: <202206061721.4OMtsMZI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0267522430301847987==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: net/ipv4/=
tcp_bpf.c:169:2: warning: Dereference of null pointer [clang-analyzer-core.=
NullDereference]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Cong Wang <cong.wang@bytedance.com>
CC: Daniel Borkmann <daniel@iogearbox.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f2906aa863381afb0015a9eb7fefad885d4e5a56
commit: 9f2470fbc4cb4583c080bb729a998933ba61aca4 skmsg: Improve udp_bpf_rec=
vmsg() accuracy
date:   12 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 12 months ago
config: s390-randconfig-c005-20220605 (https://download.01.org/0day-ci/arch=
ive/20220606/202206061721.4OMtsMZI-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0a90b7=
2c432d70aae035727ece4ba80ce820f381)
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
                   flags |=3D TIMER_OF_IRQ;
                   ^
   drivers/clocksource/timer-of.c:191:3: note: Value stored to 'flags' is n=
ever read
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/clocksource/sh_cmt.c:90:8: warning: Excessive padding in 'struct=
 sh_cmt_channel' (291 padding bytes, where 35 is optimal). =

   Optimal fields order: =

   ced, =

   cmt, =

   iostart, =

   ioctrl, =

   flags, =

   total_cycles, =

   cs, =

   index, =

   hwidx, =

   timer_bit, =

   match_value, =

   next_match_value, =

   max_match_value, =

   lock, =

   cs_enabled, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct sh_cmt_channel {
   ~~~~~~~^~~~~~~~~~~~~~~~
   drivers/clocksource/sh_cmt.c:90:8: note: Excessive padding in 'struct sh=
_cmt_channel' (291 padding bytes, where 35 is optimal). Optimal fields orde=
r: ced, cmt, iostart, ioctrl, flags, total_cycles, cs, index, hwidx, timer_=
bit, match_value, next_match_value, max_match_value, lock, cs_enabled, cons=
ider reordering the fields or adding explicit padding members
   struct sh_cmt_channel {
   ~~~~~~~^~~~~~~~~~~~~~~~
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/clocksource/sh_tmu.c:38:8: warning: Excessive padding in 'struct=
 sh_tmu_channel' (323 padding bytes, where 67 is optimal). =

   Optimal fields order: =

   ced, =

   tmu, =

   base, =

   periodic, =

   cs, =

   index, =

   irq, =

   enable_count, =

   cs_enabled, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct sh_tmu_channel {
   ~~~~~~~^~~~~~~~~~~~~~~~
   drivers/clocksource/sh_tmu.c:38:8: note: Excessive padding in 'struct sh=
_tmu_channel' (323 padding bytes, where 67 is optimal). Optimal fields orde=
r: ced, tmu, base, periodic, cs, index, irq, enable_count, cs_enabled, cons=
ider reordering the fields or adding explicit padding members
   struct sh_tmu_channel {
   ~~~~~~~^~~~~~~~~~~~~~~~
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   include/linux/uaccess.h:229:2: warning: Dereference of null pointer [cla=
ng-analyzer-core.NullDereference]
           current->pagefault_disabled++;
           ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/mmc/host/tifm_sd.c:213:27: note: Calling 'kmap_atomic'
           unsigned char *src_buf =3D kmap_atomic(src) + src_off;
                                    ^~~~~~~~~~~~~~~~
   include/linux/highmem-internal.h:182:2: note: Loop condition is false.  =
Exiting loop
           preempt_disable();
           ^
   include/linux/preempt.h:175:27: note: expanded from macro 'preempt_disab=
le'
   #define preempt_disable() \
                             ^
   include/linux/highmem-internal.h:183:2: note: Calling 'pagefault_disable'
           pagefault_disable();
           ^~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:246:2: note: Calling 'pagefault_disabled_inc'
           pagefault_disabled_inc();
           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:229:2: note: Dereference of null pointer
           current->pagefault_disabled++;
           ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
>> net/ipv4/tcp_bpf.c:169:2: warning: Dereference of null pointer [clang-an=
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
   net/ipv4/tcp_bpf.c:194:6: note: Assuming the condition is true
           if (unlikely(flags & MSG_ERRQUEUE))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   net/ipv4/tcp_bpf.c:194:2: note: Taking false branch
           if (unlikely(flags & MSG_ERRQUEUE))
           ^
   net/ipv4/tcp_bpf.c:198:16: note: 'psock' is non-null
           if (unlikely(!psock))
                         ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/ipv4/tcp_bpf.c:198:2: note: Taking false branch
           if (unlikely(!psock))
           ^
   net/ipv4/tcp_bpf.c:200:6: note: Assuming the condition is false
           if (!skb_queue_empty(&sk->sk_receive_queue) &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/tcp_bpf.c:200:46: note: Left side of '&&' is false
           if (!skb_queue_empty(&sk->sk_receive_queue) &&
                                                       ^
   net/ipv4/tcp_bpf.c:208:6: note: Assuming 'copied' is 0
           if (!copied) {
               ^~~~~~~
   net/ipv4/tcp_bpf.c:208:2: note: Taking true branch
           if (!copied) {
           ^
   net/ipv4/tcp_bpf.c:213:10: note: Calling 'tcp_msg_wait_data'
                   data =3D tcp_msg_wait_data(sk, psock, flags, timeo, &err=
);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/tcp_bpf.c:169:2: note: Dereference of null pointer
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
   27 warnings generated.
   fs/cifs/dns_resolve.c:80:17: warning: Dereference of null pointer [clang=
-analyzer-core.NullDereference]
           rc =3D dns_query(current->nsproxy->net_ns, NULL, hostname, len,
                          ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/cifs/dns_resolve.c:53:6: note: Assuming 'ip_addr' is non-null
           if (!ip_addr || !unc)
               ^~~~~~~~
   fs/cifs/dns_resolve.c:53:6: note: Left side of '||' is false
   fs/cifs/dns_resolve.c:53:18: note: Assuming 'unc' is non-null
           if (!ip_addr || !unc)
                           ^~~~
   fs/cifs/dns_resolve.c:53:2: note: Taking false branch
           if (!ip_addr || !unc)
           ^
   fs/cifs/dns_resolve.c:57:6: note: Assuming 'len' is >=3D 3
           if (len < 3) {
               ^~~~~~~
   fs/cifs/dns_resolve.c:57:2: note: Taking false branch
           if (len < 3) {
           ^
   fs/cifs/dns_resolve.c:68:6: note: Assuming 'sep' is null
           if (sep)
               ^~~
   fs/cifs/dns_resolve.c:68:2: note: Taking false branch
           if (sep)
           ^
   fs/cifs/dns_resolve.c:71:3: note: Taking false branch
                   cifs_dbg(FYI, "%s: probably server name is whole unc: %s=
\n",
                   ^
   fs/cifs/cifs_debug.h:139:2: note: expanded from macro 'cifs_dbg'
           if (0)                                                          \
           ^
   fs/cifs/dns_resolve.c:71:3: note: Loop condition is false.  Exiting loop
                   cifs_dbg(FYI, "%s: probably server name is whole unc: %s=
\n",
                   ^
   fs/cifs/cifs_debug.h:137:38: note: expanded from macro 'cifs_dbg'
--
   net/ipv4/inet_hashtables.c:238:6: note: Left side of '&&' is true
           if (net_eq(sock_net(sk), net) && sk->sk_num =3D=3D hnum &&
               ^
   net/ipv4/inet_hashtables.c:238:2: note: Taking true branch
           if (net_eq(sock_net(sk), net) && sk->sk_num =3D=3D hnum &&
           ^
   net/ipv4/inet_hashtables.c:240:7: note: Assuming 'daddr' is equal to fie=
ld 'skc_rcv_saddr'
                   if (sk->sk_rcv_saddr !=3D daddr)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/inet_hashtables.c:240:3: note: Taking false branch
                   if (sk->sk_rcv_saddr !=3D daddr)
                   ^
   net/ipv4/inet_hashtables.c:243:3: note: Taking false branch
                   if (!inet_sk_bound_dev_eq(net, sk->sk_bound_dev_if, dif,=
 sdif))
                   ^
   net/ipv4/inet_hashtables.c:246:11: note: Assuming field 'skc_family' is =
not equal to PF_INET
                   score =3D sk->sk_family =3D=3D PF_INET ? 2 : 1;
                           ^~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/inet_hashtables.c:246:11: note: '?' condition is false
   net/ipv4/inet_hashtables.c:247:7: note: Left side of '||' is false
                   if (READ_ONCE(sk->sk_incoming_cpu) =3D=3D raw_smp_proces=
sor_id())
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
   net/ipv4/inet_hashtables.c:247:7: note: Left side of '||' is false
                   if (READ_ONCE(sk->sk_incoming_cpu) =3D=3D raw_smp_proces=
sor_id())
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
   net/ipv4/inet_hashtables.c:247:7: note: Left side of '||' is true
                   if (READ_ONCE(sk->sk_incoming_cpu) =3D=3D raw_smp_proces=
sor_id())
                       ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:291:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   net/ipv4/inet_hashtables.c:247:7: note: Taking false branch
                   if (READ_ONCE(sk->sk_incoming_cpu) =3D=3D raw_smp_proces=
sor_id())
                       ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
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
   net/ipv4/inet_hashtables.c:247:7: note: Loop condition is false.  Exitin=
g loop
                   if (READ_ONCE(sk->sk_incoming_cpu) =3D=3D raw_smp_proces=
sor_id())
                       ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
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
   net/ipv4/inet_hashtables.c:247:41: note: Dereference of null pointer
                   if (READ_ONCE(sk->sk_incoming_cpu) =3D=3D raw_smp_proces=
sor_id())
                                                         ^
   arch/s390/include/asm/smp.h:15:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^~~~~~~~~~~~~~~~~~~~~
   Suppressed 26 warnings (14 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
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
   Suppressed 26 warnings (14 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (14 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (14 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (14 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   drivers/spi/spi-ti-qspi.c:864:3: warning: Value stored to 'ret' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   ret =3D 0;
                   ^     ~
   drivers/spi/spi-ti-qspi.c:864:3: note: Value stored to 'ret' is never re=
ad
                   ret =3D 0;
                   ^     ~
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (7 in non-user code, 13 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (7 in non-user code, 13 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (7 in non-user code, 14 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (7 in non-user code, 13 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +169 net/ipv4/tcp_bpf.c

a26527981af298 YueHaibing 2020-03-20  165  =

9f2470fbc4cb45 Cong Wang  2021-06-14  166  static int tcp_msg_wait_data(str=
uct sock *sk, struct sk_psock *psock, int flags,
9f2470fbc4cb45 Cong Wang  2021-06-14  167  			     long timeo, int *err)
9f2470fbc4cb45 Cong Wang  2021-06-14  168  {
9f2470fbc4cb45 Cong Wang  2021-06-14 @169  	DEFINE_WAIT_FUNC(wait, woken_wa=
ke_function);
9f2470fbc4cb45 Cong Wang  2021-06-14  170  	int ret =3D 0;
9f2470fbc4cb45 Cong Wang  2021-06-14  171  =

9f2470fbc4cb45 Cong Wang  2021-06-14  172  	if (sk->sk_shutdown & RCV_SHUTD=
OWN)
9f2470fbc4cb45 Cong Wang  2021-06-14  173  		return 1;
9f2470fbc4cb45 Cong Wang  2021-06-14  174  =

9f2470fbc4cb45 Cong Wang  2021-06-14  175  	if (!timeo)
9f2470fbc4cb45 Cong Wang  2021-06-14  176  		return ret;
9f2470fbc4cb45 Cong Wang  2021-06-14  177  =

9f2470fbc4cb45 Cong Wang  2021-06-14  178  	add_wait_queue(sk_sleep(sk), &w=
ait);
9f2470fbc4cb45 Cong Wang  2021-06-14  179  	sk_set_bit(SOCKWQ_ASYNC_WAITDAT=
A, sk);
9f2470fbc4cb45 Cong Wang  2021-06-14  180  	ret =3D sk_wait_event(sk, &time=
o,
9f2470fbc4cb45 Cong Wang  2021-06-14  181  			    !list_empty(&psock->ingre=
ss_msg) ||
9f2470fbc4cb45 Cong Wang  2021-06-14  182  			    !skb_queue_empty(&sk->sk_=
receive_queue), &wait);
9f2470fbc4cb45 Cong Wang  2021-06-14  183  	sk_clear_bit(SOCKWQ_ASYNC_WAITD=
ATA, sk);
9f2470fbc4cb45 Cong Wang  2021-06-14  184  	remove_wait_queue(sk_sleep(sk),=
 &wait);
9f2470fbc4cb45 Cong Wang  2021-06-14  185  	return ret;
9f2470fbc4cb45 Cong Wang  2021-06-14  186  }
9f2470fbc4cb45 Cong Wang  2021-06-14  187  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0267522430301847987==--

