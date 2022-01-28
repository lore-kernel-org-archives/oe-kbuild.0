Content-Type: multipart/mixed; boundary="===============5642732898755592363=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kees:for-next/memcpy 7/7] include/linux/fortify-string.h:393:9: warning: Null pointer passed as 2nd argument to memory comparison function [clang-analyzer-unix.cstring.NullArg]
Date: Fri, 28 Jan 2022 16:04:41 +0800
Message-ID: <202201281531.0UItrwvx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5642732898755592363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-=
next/memcpy
head:   7db6d0c94a3589eaaa2e71abb6f9218fcc16ebbb
commit: 7db6d0c94a3589eaaa2e71abb6f9218fcc16ebbb [7/7] fortify: Work around=
 Clang inlining bugs
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
128/202201281531.0UItrwvx-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f32dcc=
b9a43b02ce4e540d6ba5dbbdb188f2dc7d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/co=
mmit/?id=3D7db6d0c94a3589eaaa2e71abb6f9218fcc16ebbb
        git remote add kees https://git.kernel.org/pub/scm/linux/kernel/git=
/kees/linux.git
        git fetch --no-tags kees for-next/memcpy
        git checkout 7db6d0c94a3589eaaa2e71abb6f9218fcc16ebbb
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   include/linux/rcupdate.h:594:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ^
   include/linux/rcupdate.h:398:2: note: expanded from macro '__rcu_derefer=
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
   include/linux/rcupdate.h:594:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ^
   include/linux/rcupdate.h:398:2: note: expanded from macro '__rcu_derefer=
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
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> include/linux/fortify-string.h:393:9: warning: Null pointer passed as 2n=
d argument to memory comparison function [clang-analyzer-unix.cstring.NullA=
rg]
           return __underlying_memcmp(p, q, size);
                  ^
   include/linux/fortify-string.h:42:29: note: expanded from macro '__under=
lying_memcmp'
   #define __underlying_memcmp     __builtin_memcmp
                                   ^
   security/keys/keyring.c:678:2: note: Taking false branch
           kenter("{%d},{%s,%s}",
           ^
   security/keys/internal.h:34:2: note: expanded from macro 'kenter'
           no_printk(KERN_DEBUG "=3D=3D> %s("FMT")\n", __func__, ##__VA_ARG=
S__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   security/keys/keyring.c:684:9: note: Assuming the condition is false
           BUG_ON((ctx->flags & STATE_CHECKS) =3D=3D 0 ||
                  ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   security/keys/keyring.c:684:9: note: Left side of '||' is false
           BUG_ON((ctx->flags & STATE_CHECKS) =3D=3D 0 ||
                  ^
   security/keys/keyring.c:685:9: note: Assuming the condition is false
                  (ctx->flags & STATE_CHECKS) =3D=3D STATE_CHECKS);
                  ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   security/keys/keyring.c:684:2: note: Taking false branch
           BUG_ON((ctx->flags & STATE_CHECKS) =3D=3D 0 ||
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   security/keys/keyring.c:684:2: note: Loop condition is false.  Exiting l=
oop
           BUG_ON((ctx->flags & STATE_CHECKS) =3D=3D 0 ||
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   security/keys/keyring.c:687:6: note: Assuming field 'description' is null
           if (ctx->index_key.description)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/keyring.c:687:2: note: Taking false branch
           if (ctx->index_key.description)
           ^
   security/keys/keyring.c:693:6: note: Assuming field 'lookup_type' is not=
 equal to KEYRING_SEARCH_LOOKUP_ITERATE
           if (ctx->match_data.lookup_type =3D=3D KEYRING_SEARCH_LOOKUP_ITE=
RATE ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/keyring.c:693:6: note: Left side of '||' is false
   security/keys/keyring.c:694:6: note: Calling 'keyring_compare_object'
               keyring_compare_object(keyring, &ctx->index_key)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/keyring.c:314:9: note: Assuming 'key->index_key.type' is e=
qual to 'index_key->type'
           return key->index_key.type =3D=3D index_key->type &&
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/keyring.c:314:9: note: Left side of '&&' is true
   security/keys/keyring.c:315:3: note: Assuming 'key->index_key.domain_tag=
' is equal to 'index_key->domain_tag'
                   key->index_key.domain_tag =3D=3D index_key->domain_tag &&
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/keyring.c:314:9: note: Left side of '&&' is true
           return key->index_key.type =3D=3D index_key->type &&
                  ^
   security/keys/keyring.c:316:3: note: Assuming 'key->index_key.desc_len' =
is equal to 'index_key->desc_len'
                   key->index_key.desc_len =3D=3D index_key->desc_len &&
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/keyring.c:314:9: note: Left side of '&&' is true
           return key->index_key.type =3D=3D index_key->type &&
                  ^
   security/keys/keyring.c:317:38: note: Passing null pointer value via 2nd=
 parameter 'q'
                   memcmp(key->index_key.description, index_key->descriptio=
n,
                                                      ^
   include/linux/fortify-string.h:379:45: note: expanded from macro 'memcmp'
   #define memcmp(p, q, s) __fortify_memcmp(p, q, s)
                                               ^
   security/keys/keyring.c:317:3: note: Calling '__fortify_memcmp'
                   memcmp(key->index_key.description, index_key->descriptio=
n,
                   ^
   include/linux/fortify-string.h:379:25: note: expanded from macro 'memcmp'
   #define memcmp(p, q, s) __fortify_memcmp(p, q, s)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:385:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/fortify-string.h:391:6: note: Assuming 'p_size' is >=3D 's=
ize'
           if (p_size < size || q_size < size)
               ^~~~~~~~~~~~~
   include/linux/fortify-string.h:391:6: note: Left side of '||' is false
   include/linux/fortify-string.h:391:23: note: Assuming 'q_size' is >=3D '=
size'
           if (p_size < size || q_size < size)
                                ^~~~~~~~~~~~~
   include/linux/fortify-string.h:391:2: note: Taking false branch
           if (p_size < size || q_size < size)
--
   net/core/gro.c:739:37: note: Calling 'dev_gro_receive'
           ret =3D napi_frags_finish(napi, skb, dev_gro_receive(napi, skb));
                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/gro.c:450:2: note: Taking true branch
           if (netif_elide_gro(skb->dev))
           ^
   net/core/gro.c:451:3: note: Control jumps to line 544
                   goto normal;
                   ^
   net/core/gro.c:545:2: note: Control jumps to line 530
           goto pull;
           ^
   net/core/gro.c:531:6: note: Assuming 'grow' is > 0
           if (grow > 0)
               ^~~~~~~~
   net/core/gro.c:531:2: note: Taking true branch
           if (grow > 0)
           ^
   net/core/gro.c:532:3: note: Calling 'gro_pull_from_frag0'
                   gro_pull_from_frag0(skb, grow);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/gro.c:402:9: note: Assuming the condition is false
           BUG_ON(skb->end - skb->tail < grow);
                  ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/core/gro.c:402:2: note: Taking false branch
           BUG_ON(skb->end - skb->tail < grow);
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   net/core/gro.c:402:2: note: Loop condition is false.  Exiting loop
           BUG_ON(skb->end - skb->tail < grow);
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   net/core/gro.c:404:2: note: Null pointer passed as 2nd argument to memor=
y copy function
           memcpy(skb_tail_pointer(skb), NAPI_GRO_CB(skb)->frag0, grow);
           ^
   include/linux/fortify-string.h:357:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:350:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^                    ~
   note: expanded from here
   include/linux/fortify-string.h:43:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> include/linux/fortify-string.h:61:9: warning: Null pointer passed as 2nd=
 argument to string copy function [clang-analyzer-unix.cstring.NullArg]
           return __underlying_strncpy(p, q, size);
                  ^
   include/linux/fortify-string.h:50:30: note: expanded from macro '__under=
lying_strncpy'
   #define __underlying_strncpy    __builtin_strncpy
                                   ^
   drivers/cpufreq/cpufreq.c:2763:2: note: Calling 'cpufreq_offline'
           cpufreq_offline(cpu);
           ^~~~~~~~~~~~~~~~~~~~
   drivers/cpufreq/cpufreq.c:1579:2: note: Taking false branch
           pr_debug("%s: unregistering CPU %u\n", __func__, cpu);
           ^
   include/linux/printk.h:570:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:162:2: note: expanded from macro 'dynamic_=
pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   drivers/cpufreq/cpufreq.c:1579:2: note: Loop condition is false.  Exitin=
g loop
           pr_debug("%s: unregistering CPU %u\n", __func__, cpu);
           ^
   include/linux/printk.h:570:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:162:2: note: expanded from macro 'dynamic_=
pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:131:49: note: expanded from macro '__dynam=
ic_func_call'
   #define __dynamic_func_call(id, fmt, func, ...) do {    \
                                                   ^
   drivers/cpufreq/cpufreq.c:1581:11: note: Calling 'cpufreq_cpu_get_raw'
           policy =3D cpufreq_cpu_get_raw(cpu);
                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cpufreq/cpufreq.c:184:34: note: Loop condition is false.  Exitin=
g loop
           struct cpufreq_policy *policy =3D per_cpu(cpufreq_cpu_data, cpu);
                                           ^
   include/linux/percpu-defs.h:269:29: note: expanded from macro 'per_cpu'
   #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
                                     ^
   include/linux/percpu-defs.h:263:47: note: expanded from macro 'per_cpu_p=
tr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); =
})
                                                   ^
   include/linux/percpu-defs.h:259:2: note: expanded from macro 'VERIFY_PER=
CPU_PTR'
           __verify_pcpu_ptr(__p);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   drivers/cpufreq/cpufreq.c:186:9: note: Assuming 'policy' is non-null
           return policy && cpumask_test_cpu(cpu, policy->cpus) ? policy : =
NULL;
                  ^~~~~~
   drivers/cpufreq/cpufreq.c:186:9: note: Left side of '&&' is true
   drivers/cpufreq/cpufreq.c:186:19: note: Assuming the condition is true
           return policy && cpumask_test_cpu(cpu, policy->cpus) ? policy : =
NULL;
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cpufreq/cpufreq.c:186:9: note: '?' condition is true
           return policy && cpumask_test_cpu(cpu, policy->cpus) ? policy : =
NULL;
                  ^
   drivers/cpufreq/cpufreq.c:186:2: note: Returning pointer, which particip=
ates in a condition later
           return policy && cpumask_test_cpu(cpu, policy->cpus) ? policy : =
NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/cpufreq/cpufreq.c:1581:11: note: Returning from 'cpufreq_cpu_get=
_raw'
           policy =3D cpufreq_cpu_get_raw(cpu);
                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cpufreq/cpufreq.c:1582:7: note: 'policy' is non-null
           if (!policy) {
                ^~~~~~
   drivers/cpufreq/cpufreq.c:1582:2: note: Taking false branch
           if (!policy) {
           ^
   drivers/cpufreq/cpufreq.c:1588:2: note: Taking true branch
           if (has_target())
           ^
   drivers/cpufreq/cpufreq.c:1593:6: note: Calling 'policy_is_inactive'
           if (policy_is_inactive(policy)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpufreq.h:212:9: note: Calling 'cpumask_empty'
           return cpumask_empty(policy->cpus);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:557:9: note: Calling 'bitmap_empty'
           return bitmap_empty(cpumask_bits(srcp), nr_cpumask_bits);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:385:6: note: Left side of '&&' is false
           if (small_const_nbits(nbits))
               ^
   include/asm-generic/bitsperlong.h:36:31: note: expanded from macro 'smal=
l_const_nbits'
           (__builtin_constant_p(nbits) && (nbits) <=3D BITS_PER_LONG && (n=
bits) > 0)
                                        ^
   include/linux/bitmap.h:388:9: note: Assuming the condition is true
           return find_first_bit(src, nbits) =3D=3D nbits;
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:388:2: note: Returning the value 1, which partici=
pates in a condition later
--
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/pkt_cls.h:476:6: note: Assuming field 'nmatches' is 0
           if (tree->hdr.nmatches)
               ^~~~~~~~~~~~~~~~~~
   include/net/pkt_cls.h:476:2: note: Taking false branch
           if (tree->hdr.nmatches)
           ^
   include/net/pkt_cls.h:479:3: note: Returning the value 1, which particip=
ates in a condition later
                   return 1;
                   ^~~~~~~~
   net/sched/cls_flow.c:309:8: note: Returning from 'tcf_em_tree_match'
                   if (!tcf_em_tree_match(skb, &f->ematches, NULL))
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/cls_flow.c:309:3: note: Taking false branch
                   if (!tcf_em_tree_match(skb, &f->ematches, NULL))
                   ^
   net/sched/cls_flow.c:313:7: note: Assuming the condition is false
                   if (keymask & FLOW_KEYS_NEEDED)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/cls_flow.c:313:3: note: Taking false branch
                   if (keymask & FLOW_KEYS_NEEDED)
                   ^
   net/sched/cls_flow.c:316:15: note: Assuming 'n' is >=3D field 'nkeys'
                   for (n =3D 0; n < f->nkeys; n++) {
                               ^~~~~~~~~~~~
   net/sched/cls_flow.c:316:3: note: Loop condition is false. Execution con=
tinues on line 322
                   for (n =3D 0; n < f->nkeys; n++) {
                   ^
   net/sched/cls_flow.c:322:7: note: Assuming field 'mode' is not equal to =
FLOW_MODE_HASH
                   if (f->mode =3D=3D FLOW_MODE_HASH)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/cls_flow.c:322:3: note: Taking false branch
                   if (f->mode =3D=3D FLOW_MODE_HASH)
                   ^
   net/sched/cls_flow.c:325:12: note: Assigned value is garbage or undefined
                           classid =3D keys[0];
                                   ^ ~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   include/uapi/linux/phonet.h:176:9: warning: 1st function call argument i=
s an uninitialized value [clang-analyzer-core.CallAndMessage]
           return pn_object(spn->spn_dev, spn->spn_obj);
                  ^
   net/phonet/pep.c:776:6: note: Assuming 'skb' is non-null
           if (!skb)
               ^~~~
   net/phonet/pep.c:776:2: note: Taking false branch
           if (!skb)
           ^
   net/phonet/pep.c:780:6: note: Assuming field 'skc_state' is equal to TCP=
_LISTEN
           if (sk->sk_state !=3D TCP_LISTEN) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/phonet/pep.c:780:2: note: Taking false branch
           if (sk->sk_state !=3D TCP_LISTEN) {
           ^
   net/phonet/pep.c:787:2: note: Taking false branch
           if (!pskb_may_pull(skb, sizeof(*hdr) + 4))
           ^
   net/phonet/pep.c:792:2: note: Control jumps to 'case PN_PIPE_ENABLE:'  a=
t line 796
           switch (hdr->state_after_connect) {
           ^
   net/phonet/pep.c:798:3: note:  Execution continues on line 804
                   break;
                   ^
   net/phonet/pep.c:808:9: note: Assuming 'n_sb' is <=3D 0
           while (n_sb > 0) {
                  ^~~~~~~~
   net/phonet/pep.c:808:2: note: Loop condition is false. Execution continu=
es on line 828
           while (n_sb > 0) {
           ^
   net/phonet/pep.c:828:10: note: Calling 'pep_find_pipe'
           newsk =3D pep_find_pipe(&pn->hlist, &dst, pipe_handle);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/phonet/pep.c:630:13: note: Calling 'pn_sockaddr_get_object'
           u16 dobj =3D pn_sockaddr_get_object(dst);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/phonet.h:176:9: note: 1st function call argument is a=
n uninitialized value
           return pn_object(spn->spn_dev, spn->spn_obj);
                  ^         ~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   net/ieee802154/nl-mac.c:529:2: warning: Value stored to 'rc' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           rc =3D ops->set_mac_params(dev, &params);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ieee802154/nl-mac.c:529:2: note: Value stored to 'rc' is never read
           rc =3D ops->set_mac_params(dev, &params);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> include/linux/fortify-string.h:80:17: warning: Array access (from variab=
le '__p') results in a null pointer dereference [clang-analyzer-core.NullDe=
reference]
           size_t p_len =3D __compiletime_strlen(p);
                          ^
   include/linux/fortify-string.h:22:28: note: expanded from macro '__compi=
letime_strlen'
                   if (__builtin_constant_p(__p[__p_len]) &&       \
                                            ^
   net/ieee802154/nl-phy.c:172:2: note: Taking false branch
           pr_debug("%s\n", __func__);
           ^
   include/linux/printk.h:570:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:162:2: note: expanded from macro 'dynamic_=
pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   net/ieee802154/nl-phy.c:172:2: note: Loop condition is false.  Exiting l=
oop
           pr_debug("%s\n", __func__);
           ^
   include/linux/printk.h:570:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:162:2: note: expanded from macro 'dynamic_=
pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:131:49: note: expanded from macro '__dynam=
ic_func_call'
   #define __dynamic_func_call(id, fmt, func, ...) do {    \
                                                   ^
   net/ieee802154/nl-phy.c:174:6: note: Assuming the condition is false
           if (!info->attrs[IEEE802154_ATTR_PHY_NAME])
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ieee802154/nl-phy.c:174:2: note: Taking false branch
           if (!info->attrs[IEEE802154_ATTR_PHY_NAME])
           ^
   net/ieee802154/nl-phy.c:178:6: note: Assuming the condition is false
           if (name[nla_len(info->attrs[IEEE802154_ATTR_PHY_NAME]) - 1] !=
=3D '\0')
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   net/ieee802154/nl-phy.c:178:2: note: Taking false branch
           if (name[nla_len(info->attrs[IEEE802154_ATTR_PHY_NAME]) - 1] !=
=3D '\0')
           ^
   net/ieee802154/nl-phy.c:181:6: note: Assuming the condition is false
           if (info->attrs[IEEE802154_ATTR_DEV_NAME]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ieee802154/nl-phy.c:181:2: note: Taking false branch
           if (info->attrs[IEEE802154_ATTR_DEV_NAME]) {
           ^
   net/ieee802154/nl-phy.c:192:2: note: Taking false branch
           if (strlen(devname) >=3D IFNAMSIZ)
           ^
   net/ieee802154/nl-phy.c:196:6: note: Assuming 'phy' is non-null
           if (!phy)
               ^~~~
   net/ieee802154/nl-phy.c:196:2: note: Taking false branch
           if (!phy)
           ^
   net/ieee802154/nl-phy.c:200:6: note: Assuming 'msg' is non-null
           if (!msg)
               ^~~~
   net/ieee802154/nl-phy.c:200:2: note: Taking false branch
           if (!msg)
           ^
   net/ieee802154/nl-phy.c:203:6: note: Assuming pointer value is null
           if (info->attrs[IEEE802154_ATTR_HW_ADDR] &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ieee802154/nl-phy.c:203:43: note: Left side of '&&' is false
           if (info->attrs[IEEE802154_ATTR_HW_ADDR] &&
                                                    ^
   net/ieee802154/nl-phy.c:210:6: note: Assuming the condition is false
           if (info->attrs[IEEE802154_ATTR_DEV_TYPE]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ieee802154/nl-phy.c:210:2: note: Taking false branch
           if (info->attrs[IEEE802154_ATTR_DEV_TYPE]) {
           ^
   net/ieee802154/nl-phy.c:220:6: note: Calling 'IS_ERR'
           if (IS_ERR(dev)) {
               ^~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ieee802154/nl-phy.c:220:6: note: Returning from 'IS_ERR'
           if (IS_ERR(dev)) {
               ^~~~~~~~~~~
   net/ieee802154/nl-phy.c:220:2: note: Taking false branch
           if (IS_ERR(dev)) {
--
                   ^     ~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/media/v4l2-core/v4l2-mc.c:176:4: warning: Value stored to 'if_au=
d' is never read [clang-analyzer-deadcode.DeadStores]
                           if_aud =3D tuner;
                           ^        ~~~~~
   drivers/media/v4l2-core/v4l2-mc.c:176:4: note: Value stored to 'if_aud' =
is never read
                           if_aud =3D tuner;
                           ^        ~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/media/tuners/tda18271-fe.c:473:2: warning: Value stored to 'bcal=
' is never read [clang-analyzer-deadcode.DeadStores]
           bcal =3D 0;
           ^      ~
   drivers/media/tuners/tda18271-fe.c:473:2: note: Value stored to 'bcal' i=
s never read
           bcal =3D 0;
           ^      ~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> include/linux/fortify-string.h:80:17: warning: Array access (from variab=
le '__p') results in a null pointer dereference [clang-analyzer-core.NullDe=
reference]
           size_t p_len =3D __compiletime_strlen(p);
                          ^
   include/linux/fortify-string.h:22:28: note: expanded from macro '__compi=
letime_strlen'
                   if (__builtin_constant_p(__p[__p_len]) &&       \
                                            ^
   drivers/target/target_core_stat.c:226:12: note: Passing null pointer val=
ue via 1st parameter 'p'
                           (strlen(dev->t10_wwn.unit_serial)) ?
                                   ^
   include/linux/fortify-string.h:98:36: note: expanded from macro 'strlen'
   #define strlen(p) __fortify_strlen(p, __builtin_object_size(p, 1))
                                      ^
   drivers/target/target_core_stat.c:226:5: note: Calling '__fortify_strlen'
                           (strlen(dev->t10_wwn.unit_serial)) ?
                            ^
   include/linux/fortify-string.h:98:19: note: expanded from macro 'strlen'
   #define strlen(p) __fortify_strlen(p, __builtin_object_size(p, 1))
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:104:2: note: Taking false branch
           if (p_size =3D=3D (size_t)-1)
           ^
   include/linux/fortify-string.h:106:16: note: Passing null pointer value =
via 1st parameter 'p'
           ret =3D strnlen(p, p_size);
                         ^
   include/linux/fortify-string.h:76:41: note: expanded from macro 'strnlen'
   #define strnlen(p, s) __fortify_strnlen(p, s, __builtin_object_size(p, 1=
))
                                           ^
   include/linux/fortify-string.h:106:8: note: Calling '__fortify_strnlen'
           ret =3D strnlen(p, p_size);
                 ^
   include/linux/fortify-string.h:76:23: note: expanded from macro 'strnlen'
   #define strnlen(p, s) __fortify_strnlen(p, s, __builtin_object_size(p, 1=
))
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/fortify-string.h:80:17: note: '__p' initialized to a null =
pointer value
           size_t p_len =3D __compiletime_strlen(p);
                          ^
   include/linux/fortify-string.h:17:2: note: expanded from macro '__compil=
etime_strlen'
           unsigned char *__p =3D (unsigned char *)(p);              \
           ^~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:80:17: note: Assuming the condition is tr=
ue
           size_t p_len =3D __compiletime_strlen(p);
                          ^
   include/linux/fortify-string.h:20:6: note: expanded from macro '__compil=
etime_strlen'
           if (__p_size !=3D (size_t)-1) {                           \
               ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:80:17: note: Taking true branch
           size_t p_len =3D __compiletime_strlen(p);
                          ^
   include/linux/fortify-string.h:20:2: note: expanded from macro '__compil=
etime_strlen'
           if (__p_size !=3D (size_t)-1) {                           \
           ^
   include/linux/fortify-string.h:80:17: note: Array access (from variable =
'__p') results in a null pointer dereference
           size_t p_len =3D __compiletime_strlen(p);
                          ^
   include/linux/fortify-string.h:22:28: note: expanded from macro '__compi=
letime_strlen'
                   if (__builtin_constant_p(__p[__p_len]) &&       \
                                            ^~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/md/dm-table.c:1585:3: warning: Value stored to 'ti' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                   ti =3D dm_table_get_target(t, i);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-table.c:1585:3: note: Value stored to 'ti' is never read
                   ti =3D dm_table_get_target(t, i);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +393 include/linux/fortify-string.h

a28a6e860c6cf2 Francis Laniel 2021-02-25  378  =

7db6d0c94a3589 Kees Cook      2021-06-17  379  #define memcmp(p, q, s) __fo=
rtify_memcmp(p, q, s)
7db6d0c94a3589 Kees Cook      2021-06-17  380  __FORTIFY_INLINE int __forti=
fy_memcmp(const void *p, const void *q, __kernel_size_t size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  381  {
a28a6e860c6cf2 Francis Laniel 2021-02-25  382  	size_t p_size =3D __builtin=
_object_size(p, 0);
a28a6e860c6cf2 Francis Laniel 2021-02-25  383  	size_t q_size =3D __builtin=
_object_size(q, 0);
a28a6e860c6cf2 Francis Laniel 2021-02-25  384  =

a28a6e860c6cf2 Francis Laniel 2021-02-25  385  	if (__builtin_constant_p(si=
ze)) {
a28a6e860c6cf2 Francis Laniel 2021-02-25  386  		if (p_size < size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  387  			__read_overflow();
a28a6e860c6cf2 Francis Laniel 2021-02-25  388  		if (q_size < size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  389  			__read_overflow2();
a28a6e860c6cf2 Francis Laniel 2021-02-25  390  	}
a28a6e860c6cf2 Francis Laniel 2021-02-25  391  	if (p_size < size || q_size=
 < size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  392  		fortify_panic(__func__);
a28a6e860c6cf2 Francis Laniel 2021-02-25 @393  	return __underlying_memcmp(=
p, q, size);
a28a6e860c6cf2 Francis Laniel 2021-02-25  394  }
a28a6e860c6cf2 Francis Laniel 2021-02-25  395  =


:::::: The code@line 393 was first introduced by commit
:::::: a28a6e860c6cf231cf3c5171c75c342adcd00406 string.h: move fortified fu=
nctions definitions in a dedicated header.

:::::: TO: Francis Laniel <laniel_francis@privacyrequired.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5642732898755592363==--

