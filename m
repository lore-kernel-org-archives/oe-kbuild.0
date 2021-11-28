Content-Type: multipart/mixed; boundary="===============4087451506433900435=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [peterz-queue:x86/wip.ibt 1/5] fs/eventpoll.c:1303:26: warning: The right operand of '>' is a garbage value due to array index out of bounds [clang-analyzer-core.UndefinedBinaryOperatorResult]
Date: Mon, 29 Nov 2021 05:10:44 +0800
Message-ID: <202111290506.snNXue1c-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4087451506433900435==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x8=
6/wip.ibt
head:   fc75350d28c2cad4ccde0f21b696c2067881212e
commit: 00def71a65ded6fb7cfbb1ec6500baf6d14d9ca8 [1/5] x86: Annotate _THIS_=
IP_
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-c001-20211126 (https://download.01.org/0day-ci/arch=
ive/20211129/202111290506.snNXue1c-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5162b5=
58d8c0b542e752b037e72a69d5fd51eb1e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/=
commit/?id=3D00def71a65ded6fb7cfbb1ec6500baf6d14d9ca8
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/ke=
rnel/git/peterz/queue.git
        git fetch --no-tags peterz-queue x86/wip.ibt
        git checkout 00def71a65ded6fb7cfbb1ec6500baf6d14d9ca8
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   kernel/nsproxy.c:551:8: note: Calling 'prepare_nsset'
           err =3D prepare_nsset(flags, &nsset);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/nsproxy.c:316:48: note: Left side of '&&' is false
           nsset->nsproxy =3D create_new_namespaces(0, me, current_user_ns(=
), me->fs);
                                                         ^
   include/linux/cred.h:395:28: note: expanded from macro 'current_user_ns'
   #define current_user_ns()       (current_cred_xxx(user_ns))
                                    ^
   include/linux/cred.h:378:2: note: expanded from macro 'current_cred_xxx'
           current_cred()->xxx;                    \
           ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:588:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:397:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:319:11: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                           ^
   kernel/nsproxy.c:316:48: note: Loop condition is false.  Exiting loop
           nsset->nsproxy =3D create_new_namespaces(0, me, current_user_ns(=
), me->fs);
                                                         ^
   include/linux/cred.h:395:28: note: expanded from macro 'current_user_ns'
   #define current_user_ns()       (current_cred_xxx(user_ns))
                                    ^
   include/linux/cred.h:378:2: note: expanded from macro 'current_cred_xxx'
           current_cred()->xxx;                    \
           ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:588:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:397:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:317:2: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
           do {                                                            \
           ^
   kernel/nsproxy.c:317:2: note: Taking false branch
           if (IS_ERR(nsset->nsproxy))
           ^
   kernel/nsproxy.c:320:6: note: Assuming the condition is true
           if (flags & CLONE_NEWUSER)
               ^~~~~~~~~~~~~~~~~~~~~
   kernel/nsproxy.c:320:2: note: Taking true branch
           if (flags & CLONE_NEWUSER)
           ^
   kernel/nsproxy.c:324:6: note: Assuming field 'cred' is non-null
           if (!nsset->cred)
               ^~~~~~~~~~~~
   kernel/nsproxy.c:324:2: note: Taking false branch
           if (!nsset->cred)
           ^
   kernel/nsproxy.c:328:6: note: 'flags' is not equal to CLONE_NEWNS
           if (flags =3D=3D CLONE_NEWNS) {
               ^~~~~
   kernel/nsproxy.c:328:2: note: Taking false branch
           if (flags =3D=3D CLONE_NEWNS) {
           ^
   kernel/nsproxy.c:330:13: note: Assuming the condition is false
           } else if (flags & CLONE_NEWNS) {
                      ^~~~~~~~~~~~~~~~~~~
   kernel/nsproxy.c:330:9: note: Taking false branch
           } else if (flags & CLONE_NEWNS) {
                  ^
   kernel/nsproxy.c:337:2: note: Returning zero, which participates in a co=
ndition later
           return 0;
           ^~~~~~~~
   kernel/nsproxy.c:551:8: note: Returning from 'prepare_nsset'
           err =3D prepare_nsset(flags, &nsset);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/nsproxy.c:552:6: note: 'err' is 0
           if (err)
               ^~~
   kernel/nsproxy.c:552:2: note: Taking false branch
           if (err)
           ^
   kernel/nsproxy.c:555:6: note: Assuming the condition is true
           if (proc_ns_file(file))
               ^~~~~~~~~~~~~~~~~~
   kernel/nsproxy.c:555:2: note: Taking true branch
           if (proc_ns_file(file))
           ^
   kernel/nsproxy.c:556:29: note: Passing null pointer value via 2nd parame=
ter 'ns'
                   err =3D validate_ns(&nsset, ns);
                                             ^~
   kernel/nsproxy.c:556:9: note: Calling 'validate_ns'
                   err =3D validate_ns(&nsset, ns);
                         ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/nsproxy.c:346:9: note: Access to field 'ops' results in a derefer=
ence of a null pointer (loaded from variable 'ns')
           return ns->ops->install(nsset, ns);
                  ^~
   1 warning generated.
>> fs/eventpoll.c:1303:26: warning: The right operand of '>' is a garbage v=
alue due to array index out of bounds [clang-analyzer-core.UndefinedBinaryO=
peratorResult]
           if (++path_count[nests] > path_limits[nests])
                                   ^
   fs/eventpoll.c:1321:6: note: Assuming 'depth' is <=3D EP_MAX_NESTS
           if (depth > EP_MAX_NESTS) /* too deep nesting */
               ^~~~~~~~~~~~~~~~~~~~
   fs/eventpoll.c:1321:2: note: Taking false branch
           if (depth > EP_MAX_NESTS) /* too deep nesting */
           ^
   fs/eventpoll.c:1325:2: note: Left side of '||' is false
           hlist_for_each_entry_rcu(epi, refs, fllink) {
           ^
   include/linux/rculist.h:706:30: note: expanded from macro 'hlist_for_eac=
h_entry_rcu'
                pos =3D hlist_entry_safe(rcu_dereference_raw(hlist_first_rc=
u(head)),\
                                       ^
   include/linux/rcupdate.h:404:25: note: expanded from macro 'rcu_derefere=
nce_raw'
           typeof(p) ________p1 =3D READ_ONCE(p); \
                                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   fs/eventpoll.c:1325:2: note: Left side of '||' is false
           hlist_for_each_entry_rcu(epi, refs, fllink) {
           ^
   include/linux/rculist.h:706:30: note: expanded from macro 'hlist_for_eac=
h_entry_rcu'
                pos =3D hlist_entry_safe(rcu_dereference_raw(hlist_first_rc=
u(head)),\
                                       ^
   include/linux/rcupdate.h:404:25: note: expanded from macro 'rcu_derefere=
nce_raw'
           typeof(p) ________p1 =3D READ_ONCE(p); \
                                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   fs/eventpoll.c:1325:2: note: Left side of '||' is true
           hlist_for_each_entry_rcu(epi, refs, fllink) {
           ^
   include/linux/rculist.h:706:30: note: expanded from macro 'hlist_for_eac=
h_entry_rcu'
                pos =3D hlist_entry_safe(rcu_dereference_raw(hlist_first_rc=
u(head)),\
                                       ^
   include/linux/rcupdate.h:404:25: note: expanded from macro 'rcu_derefere=
nce_raw'
           typeof(p) ________p1 =3D READ_ONCE(p); \
                                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:303:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   fs/eventpoll.c:1325:2: note: Taking false branch
           hlist_for_each_entry_rcu(epi, refs, fllink) {
           ^
   include/linux/rculist.h:706:30: note: expanded from macro 'hlist_for_eac=
h_entry_rcu'
                pos =3D hlist_entry_safe(rcu_dereference_raw(hlist_first_rc=
u(head)),\
                                       ^
   include/linux/rcupdate.h:404:25: note: expanded from macro 'rcu_derefere=
nce_raw'
           typeof(p) ________p1 =3D READ_ONCE(p); \
                                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:315:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/eventpoll.c:1325:2: note: Loop condition is false.  Exiting loop
           hlist_for_each_entry_rcu(epi, refs, fllink) {
           ^
   include/linux/rculist.h:706:30: note: expanded from macro 'hlist_for_eac=
h_entry_rcu'
                pos =3D hlist_entry_safe(rcu_dereference_raw(hlist_first_rc=
u(head)),\
                                       ^
   include/linux/rcupdate.h:404:25: note: expanded from macro 'rcu_derefere=
nce_raw'
           typeof(p) ________p1 =3D READ_ONCE(p); \
                                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
--
           rightmostParityArm =3D (arms - 1) - mega_mod64(rowNum, arms);
                                             ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_fp.c:75:6: note: Assuming 'divisor' i=
s 0
           if (!divisor)
               ^~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_fp.c:75:2: note: Taking true branch
           if (!divisor)
           ^
   drivers/scsi/megaraid/megaraid_sas_fp.c:76:3: note: Loop condition is fa=
lse.  Exiting loop
                   printk(KERN_ERR "megasas : DIVISOR is zero, in div fn\n"=
);
                   ^
   include/linux/printk.h:450:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:421:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:396:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/scsi/megaraid/megaraid_sas_fp.c:78:14: note: The value 0 is assi=
gned to '__base'
           remainder =3D do_div(d, divisor);
                       ^
   arch/x86/include/asm/div64.h:25:2: note: expanded from macro 'do_div'
           __base =3D (base);                                        \
           ^~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_fp.c:78:14: note: Left side of '&&' i=
s false
           remainder =3D do_div(d, divisor);
                       ^
   arch/x86/include/asm/div64.h:26:35: note: expanded from macro 'do_div'
           if (__builtin_constant_p(__base) && is_power_of_2(__base)) { \
                                            ^
   drivers/scsi/megaraid/megaraid_sas_fp.c:78:14: note: Assuming '__high' i=
s not equal to 0
           remainder =3D do_div(d, divisor);
                       ^
   arch/x86/include/asm/div64.h:32:7: note: expanded from macro 'do_div'
                   if (__high) {                                   \
                       ^~~~~~
   drivers/scsi/megaraid/megaraid_sas_fp.c:78:14: note: Taking true branch
           remainder =3D do_div(d, divisor);
                       ^
   arch/x86/include/asm/div64.h:32:3: note: expanded from macro 'do_div'
                   if (__high) {                                   \
                   ^
   drivers/scsi/megaraid/megaraid_sas_fp.c:78:14: note: Division by zero
           remainder =3D do_div(d, divisor);
                       ^
   arch/x86/include/asm/div64.h:33:21: note: expanded from macro 'do_div'
                           __upper =3D __high % (__base);            \
                                     ~~~~~~~^~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_fp.c:1382:3: warning: Value stored to=
 'bestArm' is never read [clang-analyzer-deadcode.DeadStores]
                   bestArm =3D arm;
                   ^         ~~~
   drivers/scsi/megaraid/megaraid_sas_fp.c:1382:3: note: Value stored to 'b=
estArm' is never read
                   bestArm =3D arm;
                   ^         ~~~
   9 warnings generated.
   net/ipv6/route.c:568:6: warning: Access to field 'nh' results in a deref=
erence of a null pointer (loaded from variable 'f6i') [clang-analyzer-core.=
NullDereference]
           if (unlikely(f6i->nh)) {
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^                ~
   include/linux/compiler.h:33:33: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                        ^~
   net/ipv6/route.c:527:2: note: 'f6i' initialized here
           struct fib6_info *f6i =3D res->f6i;
           ^~~~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:531:6: note: Assuming 'oif' is not equal to 0
           if (!oif && ipv6_addr_any(saddr)) {
               ^~~~
   net/ipv6/route.c:531:11: note: Left side of '&&' is false
           if (!oif && ipv6_addr_any(saddr)) {
                    ^
   net/ipv6/route.c:543:20: note: Assuming pointer value is null
           for (spf6i =3D f6i; spf6i; spf6i =3D rcu_dereference(spf6i->fib6=
_next)) {
                             ^~~~~
   net/ipv6/route.c:543:2: note: Loop condition is false. Execution continu=
es on line 562
           for (spf6i =3D f6i; spf6i; spf6i =3D rcu_dereference(spf6i->fib6=
_next)) {
           ^
   net/ipv6/route.c:562:6: note: 'oif' is not equal to 0
           if (oif && flags & RT6_LOOKUP_F_IFACE) {
               ^~~
   net/ipv6/route.c:562:6: note: Left side of '&&' is true
   net/ipv6/route.c:562:13: note: Assuming the condition is false
           if (oif && flags & RT6_LOOKUP_F_IFACE) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:562:2: note: Taking false branch
           if (oif && flags & RT6_LOOKUP_F_IFACE) {
           ^
   net/ipv6/route.c:568:6: note: Access to field 'nh' results in a derefere=
nce of a null pointer (loaded from variable 'f6i')
           if (unlikely(f6i->nh)) {
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^                ~
   include/linux/compiler.h:33:33: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                        ^~
>> net/ipv6/route.c:3424:9: warning: Dereference of null pointer (loaded fr=
om variable '_dev') [clang-analyzer-core.NullDereference]
                   *_dev =3D dev =3D res.nh->fib_nh_dev;
                    ~~~~ ^
   net/ipv6/route.c:3384:27: note: Assuming '_dev' is null
           struct net_device *dev =3D _dev ? *_dev : NULL;
                                    ^~~~
   net/ipv6/route.c:3384:27: note: '?' condition is false
   net/ipv6/route.c:3389:6: note: Assuming field 'fc_table' is 0
           if (cfg->fc_table) {
               ^~~~~~~~~~~~~
   net/ipv6/route.c:3389:2: note: Taking false branch
           if (cfg->fc_table) {
           ^
   net/ipv6/route.c:3401:6: note: 'err' is < 0
           if (err < 0) {
               ^~~
   net/ipv6/route.c:3401:2: note: Taking true branch
           if (err < 0) {
           ^
   net/ipv6/route.c:3408:7: note: Assuming 'err' is 0
                   if (err || res.fib6_flags & RTF_REJECT ||
                       ^~~
   net/ipv6/route.c:3408:7: note: Left side of '||' is false
   net/ipv6/route.c:3408:14: note: Assuming the condition is false
                   if (err || res.fib6_flags & RTF_REJECT ||
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:3408:7: note: Left side of '||' is false
                   if (err || res.fib6_flags & RTF_REJECT ||
                       ^
   net/ipv6/route.c:3409:7: note: Assuming field 'nhc_gw_family' is 0
                       res.nh->fib_nh_gw_family)
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:3408:3: note: Taking false branch
                   if (err || res.fib6_flags & RTF_REJECT ||
                   ^
   net/ipv6/route.c:3412:7: note: 'err' is 0
                   if (err)
                       ^~~
   net/ipv6/route.c:3412:3: note: Taking false branch
                   if (err)
                   ^
   net/ipv6/route.c:3416:6: note: Assuming field 'fc_ifindex' is equal to 0
                                    cfg->fc_ifindex !=3D 0, NULL, flags);
                                    ^~~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:3420:6: note: 'dev' is null
           if (dev) {
               ^~~
   net/ipv6/route.c:3420:2: note: Taking false branch
           if (dev) {
           ^
   net/ipv6/route.c:3424:9: note: Dereference of null pointer (loaded from =
variable '_dev')
                   *_dev =3D dev =3D res.nh->fib_nh_dev;
                    ~~~~ ^
   net/ipv6/route.c:3631:24: warning: Access to field 'ifindex' results in =
a dereference of a null pointer (loaded from variable 'dev') [clang-analyze=
r-core.NullDereference]
           fib6_nh->fib_nh_oif =3D dev->ifindex;
                                 ^
   net/ipv6/route.c:3696:6: note: Assuming the condition is false
           if (cfg->fc_flags & RTF_PCPU) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:3696:2: note: Taking false branch
           if (cfg->fc_flags & RTF_PCPU) {
           ^
   net/ipv6/route.c:3702:6: note: Assuming the condition is false
           if (cfg->fc_flags & RTF_CACHE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:3702:2: note: Taking false branch
           if (cfg->fc_flags & RTF_CACHE) {
           ^
   net/ipv6/route.c:3707:6: note: Assuming the condition is false
           if (cfg->fc_type > RTN_MAX) {
               ^~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:3707:2: note: Taking false branch
           if (cfg->fc_type > RTN_MAX) {
           ^
   net/ipv6/route.c:3712:6: note: Assuming field 'fc_dst_len' is <=3D 128
           if (cfg->fc_dst_len > 128) {
               ^~~~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:3712:2: note: Taking false branch
           if (cfg->fc_dst_len > 128) {
           ^
   net/ipv6/route.c:3716:6: note: Assuming field 'fc_src_len' is <=3D 128
           if (cfg->fc_src_len > 128) {
               ^~~~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:3716:2: note: Taking false branch
           if (cfg->fc_src_len > 128) {
           ^
   net/ipv6/route.c:3721:6: note: Assuming field 'fc_src_len' is 0
           if (cfg->fc_src_len) {
               ^~~~~~~~~~~~~~~
   net/ipv6/route.c:3721:2: note: Taking false branch
           if (cfg->fc_src_len) {
           ^
   net/ipv6/route.c:3727:6: note: Assuming field 'fc_nh_id' is 0
           if (cfg->fc_nh_id) {
               ^~~~~~~~~~~~~
   net/ipv6/route.c:3727:2: note: Taking false branch
           if (cfg->fc_nh_id) {
           ^
   net/ipv6/route.c:3739:6: note: Assuming field 'nlh' is null
           if (cfg->fc_nlinfo.nlh &&
               ^~~~~~~~~~~~~~~~~~

vim +1303 fs/eventpoll.c

28d82dc1c4edbc Jason Baron 2012-01-12  1296  =

28d82dc1c4edbc Jason Baron 2012-01-12  1297  static int path_count_inc(int =
nests)
28d82dc1c4edbc Jason Baron 2012-01-12  1298  {
93dc6107a76dae Jason Baron 2012-03-16  1299  	/* Allow an arbitrary number =
of depth 1 paths */
93dc6107a76dae Jason Baron 2012-03-16  1300  	if (nests =3D=3D 0)
93dc6107a76dae Jason Baron 2012-03-16  1301  		return 0;
93dc6107a76dae Jason Baron 2012-03-16  1302  =

28d82dc1c4edbc Jason Baron 2012-01-12 @1303  	if (++path_count[nests] > pat=
h_limits[nests])
28d82dc1c4edbc Jason Baron 2012-01-12  1304  		return -1;
28d82dc1c4edbc Jason Baron 2012-01-12  1305  	return 0;
28d82dc1c4edbc Jason Baron 2012-01-12  1306  }
28d82dc1c4edbc Jason Baron 2012-01-12  1307  =


:::::: The code at line 1303 was first introduced by commit
:::::: 28d82dc1c4edbc352129f97f4ca22624d1fe61de epoll: limit paths

:::::: TO: Jason Baron <jbaron@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4087451506433900435==--

