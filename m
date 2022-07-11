Content-Type: multipart/mixed; boundary="===============7782728840938302034=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: crypto/asymmetric_keys/selftest.c:186:39: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Tue, 12 Jul 2022 00:05:59 +0800
Message-ID: <202207120035.QiJnYKqJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7782728840938302034==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: crypto/as=
ymmetric_keys/selftest.c:186:39: warning: Dereference of null pointer [clan=
g-analyzer-core.NullDereference]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>
CC: Simo Sorce <simo@redhat.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   32346491ddf24599decca06190ebca03ff9de7f8
commit: 3cde3174eb910513d32a9ec8a9b95ea59be833df certs: Add FIPS selftests
date:   3 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-c005-20220710 (https://download.01.org/0day-ci/arch=
ive/20220712/202207120035.QiJnYKqJ-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6ce63e=
267aab79ca87bf63453d34dd3909ab978d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D3cde3174eb910513d32a9ec8a9b95ea59be833df
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3cde3174eb910513d32a9ec8a9b95ea59be833df
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                   ^
   include/linux/spinlock_api_smp.h:134:44: note: Calling 'do_raw_spin_lock'
           LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
                                                     ^
   include/linux/lockdep.h:477:2: note: expanded from macro 'LOCK_CONTENDED'
           lock(_lock)
           ^~~~~~~~~~~
   include/linux/spinlock.h:185:2: note: Calling 'arch_spin_lock'
           arch_spin_lock(&lock->raw_lock);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/spinlock.h:66:7: note: Calling 'arch_spin_trylock_=
once'
           if (!arch_spin_trylock_once(lp))
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   arch/s390/include/asm/spinlock.h:61:52: note: Dereference of null pointer
           return likely(__atomic_cmpxchg_bool(&lp->lock, 0, SPINLOCK_LOCKV=
AL));
                                                             ^
   arch/s390/include/asm/spinlock.h:19:26: note: expanded from macro 'SPINL=
OCK_LOCKVAL'
   #define SPINLOCK_LOCKVAL (S390_lowcore.spinlock_lockval)
                            ^
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   fs/xfs/xfs_aops.c:496:19: warning: Dereference of null pointer [clang-an=
alyzer-core.NullDereference]
           if (WARN_ON_ONCE(current->journal_info))
                            ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/asm-generic/bug.h:110:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/xfs/xfs_aops.c:496:19: note: Dereference of null pointer
           if (WARN_ON_ONCE(current->journal_info))
                            ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/asm-generic/bug.h:110:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   include/linux/sched/mm.h:321:23: warning: Dereference of null pointer [c=
lang-analyzer-core.NullDereference]
           unsigned int flags =3D current->flags & PF_MEMALLOC_NOFS;
                                ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/xfs/xfs_aops.c:425:14: note: Calling 'memalloc_nofs_save'
           nofs_flag =3D memalloc_nofs_save();
                       ^~~~~~~~~~~~~~~~~~~~
   include/linux/sched/mm.h:321:23: note: Dereference of null pointer
           unsigned int flags =3D current->flags & PF_MEMALLOC_NOFS;
                                ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   crypto/asymmetric_keys/x509_public_key.c:191:6: warning: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           p =3D memcpy(desc, cert->subject, sulen);
               ^~~~~~
   crypto/asymmetric_keys/x509_public_key.c:191:6: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
           p =3D memcpy(desc, cert->subject, sulen);
               ^~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
>> crypto/asymmetric_keys/selftest.c:186:39: warning: Dereference of null p=
ointer [clang-analyzer-core.NullDereference]
                                   GLOBAL_ROOT_UID, GLOBAL_ROOT_GID, curren=
t_cred(),
                                                                     ^
   include/linux/cred.h:299:28: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/rcupdate.h:595:31: note: expanded from macro 'rcu_derefere=
nce_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:401:35: note: expanded from macro '__rcu_derefe=
rence_protected'
           ((typeof(*p) __force __kernel *)(p)); \
                                            ^
   crypto/asymmetric_keys/selftest.c:183:2: note: Left side of '&&' is true
           pr_notice("Running certificate verification selftests\n");
           ^
   include/linux/printk.h:538:2: note: expanded from macro 'pr_notice'
           printk(KERN_NOTICE pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:475:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:446:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:399:7: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                       ^
   crypto/asymmetric_keys/selftest.c:183:2: note: '?' condition is true
           pr_notice("Running certificate verification selftests\n");
           ^
   include/linux/printk.h:538:2: note: expanded from macro 'pr_notice'
           printk(KERN_NOTICE pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:475:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:446:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:399:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   crypto/asymmetric_keys/selftest.c:183:2: note: Left side of '&&' is true
           pr_notice("Running certificate verification selftests\n");
           ^
   include/linux/printk.h:538:2: note: expanded from macro 'pr_notice'
           printk(KERN_NOTICE pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:475:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:446:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:399:7: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                       ^
   crypto/asymmetric_keys/selftest.c:183:2: note: Taking true branch
           pr_notice("Running certificate verification selftests\n");
           ^
   include/linux/printk.h:538:2: note: expanded from macro 'pr_notice'
           printk(KERN_NOTICE pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:475:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:446:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:399:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   crypto/asymmetric_keys/selftest.c:183:2: note: '?' condition is true
           pr_notice("Running certificate verification selftests\n");
           ^
   include/linux/printk.h:538:2: note: expanded from macro 'pr_notice'
           printk(KERN_NOTICE pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:475:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:446:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:408:12: note: expanded from macro '__printk_index=
_emit'
                                   .fmt =3D __builtin_constant_p(_fmt) ? (_=
fmt) : NULL, \

vim +186 crypto/asymmetric_keys/selftest.c

3cde3174eb9105 David Howells 2022-05-18  177  =

3cde3174eb9105 David Howells 2022-05-18  178  int __init fips_signature_sel=
ftest(void)
3cde3174eb9105 David Howells 2022-05-18  179  {
3cde3174eb9105 David Howells 2022-05-18  180  	struct key *keyring;
3cde3174eb9105 David Howells 2022-05-18  181  	int ret, i;
3cde3174eb9105 David Howells 2022-05-18  182  =

3cde3174eb9105 David Howells 2022-05-18  183  	pr_notice("Running certifica=
te verification selftests\n");
3cde3174eb9105 David Howells 2022-05-18  184  =

3cde3174eb9105 David Howells 2022-05-18  185  	keyring =3D keyring_alloc(".=
certs_selftest",
3cde3174eb9105 David Howells 2022-05-18 @186  				GLOBAL_ROOT_UID, GLOBAL_R=
OOT_GID, current_cred(),

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7782728840938302034==--

