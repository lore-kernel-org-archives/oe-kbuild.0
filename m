Content-Type: multipart/mixed; boundary="===============2344881049125613615=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ardb:for-kernelci 18/18] fs/efivarfs/vars.c:600:2: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 27 Jun 2022 05:13:16 +0800
Message-ID: <202206270512.gkcuJqn3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2344881049125613615==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: fs/efivar=
fs/vars.c:600:2: warning: Value stored to 'err' is never read [clang-analyz=
er-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git for-ke=
rnelci
head:   f51a4cf21aeb5f981799be9ffc2111729dd0f15e
commit: f51a4cf21aeb5f981799be9ffc2111729dd0f15e [18/18] efi: vars: move ef=
ivar caching layer into efivarfs
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: riscv-randconfig-c006-20220625
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 42a7dd=
b428c999229491b0effbb1a4059149fba8)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/co=
mmit/?id=3Df51a4cf21aeb5f981799be9ffc2111729dd0f15e
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/a=
rdb/linux.git
        git fetch --no-tags ardb for-kernelci
        git checkout f51a4cf21aeb5f981799be9ffc2111729dd0f15e
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   include/linux/compiler_types.h:352:22: note: expanded from macro 'compil=
etime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   include/linux/compiler_types.h:340:23: note: expanded from macro '_compi=
letime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:332:9: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   include/linux/sched.h:1661:2: note: Taking false branch
           BUILD_BUG_ON(1 + ilog2(TASK_REPORT_MAX) !=3D sizeof(state_char) =
- 1);
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:352:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:332:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/sched.h:1661:2: note: Loop condition is false.  Exiting lo=
op
           BUILD_BUG_ON(1 + ilog2(TASK_REPORT_MAX) !=3D sizeof(state_char) =
- 1);
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:352:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:324:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   include/linux/sched.h:1663:2: note: Undefined or garbage value returned =
to caller
           return state_char[state];
           ^      ~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:4312:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&p->stats, 0, sizeof(p->stats));
           ^~~~~~
   kernel/sched/core.c:4312:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(&p->stats, 0, sizeof(p->stats));
           ^~~~~~
   kernel/sched/core.c:4551:3: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&p->sched_info, 0, sizeof(p->sched_info));
                   ^~~~~~
   kernel/sched/core.c:4551:3: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
                   memset(&p->sched_info, 0, sizeof(p->sched_info));
                   ^~~~~~
   kernel/sched/core.c:5640:16: warning: Value stored to 'preempt_disable_i=
p' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           unsigned long preempt_disable_ip =3D get_preempt_disable_ip(curr=
ent);
                         ^~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   kernel/sched/core.c:5640:16: note: Value stored to 'preempt_disable_ip' =
during its initialization is never read
           unsigned long preempt_disable_ip =3D get_preempt_disable_ip(curr=
ent);
                         ^~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   kernel/sched/core.c:6428:3: warning: Value stored to 'rq' is never read =
[clang-analyzer-deadcode.DeadStores]
                   rq =3D context_switch(rq, prev, next, &rf);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:6428:3: note: Value stored to 'rq' is never read
                   rq =3D context_switch(rq, prev, next, &rf);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7677:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(attr, 0, sizeof(*attr));
           ^~~~~~
   kernel/sched/core.c:7677:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(attr, 0, sizeof(*attr));
           ^~~~~~
   kernel/sched/core.c:9545:3: warning: Value stored to 'ptr' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   ptr +=3D nr_cpu_ids * sizeof(void **);
                   ^
   kernel/sched/core.c:9545:3: note: Value stored to 'ptr' is never read
   kernel/sched/core.c:10974:6: warning: Call to function 'sscanf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(buf, "%20s %llu", tok, periodp) < 1)
               ^~~~~~
   kernel/sched/core.c:10974:6: note: Call to function 'sscanf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sscanf_s' in case of C11
           if (sscanf(buf, "%20s %llu", tok, periodp) < 1)
               ^~~~~~
   kernel/sched/core.c:10979:6: warning: Call to function 'sscanf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(tok, "%llu", quotap))
               ^~~~~~
   kernel/sched/core.c:10979:6: note: Call to function 'sscanf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sscanf_s' in case of C11
           if (sscanf(tok, "%llu", quotap))
               ^~~~~~
   Suppressed 97 warnings (91 in non-user code, 6 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
>> fs/efivarfs/vars.c:600:2: warning: Value stored to 'err' is never read [=
clang-analyzer-deadcode.DeadStores]
           err =3D __efivar_entry_get(entry, attributes, size, data);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/efivarfs/vars.c:600:2: note: Value stored to 'err' is never read
           err =3D __efivar_entry_get(entry, attributes, size, data);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   ipc/msg.c:329:3: warning: Call to function 'memset' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.=
DeprecatedOrUnsafeBufferHandling]
                   memset(&out, 0, sizeof(out));
                   ^~~~~~
   ipc/msg.c:329:3: note: Call to function 'memset' is insecure as it does =
not provide security checks introduced in the C11 standard. Replace with an=
alogous functions that support length arguments or provides boundary checks=
 such as 'memset_s' in case of C11
                   memset(&out, 0, sizeof(out));
                   ^~~~~~
   ipc/msg.c:491:2: warning: Call to function 'memset' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.=
DeprecatedOrUnsafeBufferHandling]
           memset(msginfo, 0, sizeof(*msginfo));
           ^~~~~~
   ipc/msg.c:491:2: note: Call to function 'memset' is insecure as it does =
not provide security checks introduced in the C11 standard. Replace with an=
alogous functions that support length arguments or provides boundary checks=
 such as 'memset_s' in case of C11
           memset(msginfo, 0, sizeof(*msginfo));
           ^~~~~~
   ipc/msg.c:518:2: warning: Call to function 'memset' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.=
DeprecatedOrUnsafeBufferHandling]
           memset(p, 0, sizeof(*p));
           ^~~~~~
   ipc/msg.c:518:2: note: Call to function 'memset' is insecure as it does =
not provide security checks introduced in the C11 standard. Replace with an=
alogous functions that support length arguments or provides boundary checks=
 such as 'memset_s' in case of C11
           memset(p, 0, sizeof(*p));
           ^~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   ipc/sem.c:688:29: warning: Access to field 'sem_num' results in a derefe=
rence of a null pointer (loaded from variable 'sop') [clang-analyzer-core.N=
ullDereference]
                   ipc_update_pid(&sma->sems[sop->sem_num].sempid, pid);
                                             ^
   ipc/sem.c:2341:6: note: Assuming 'ulp' is non-null
           if (!ulp)
               ^~~~
   ipc/sem.c:2341:2: note: Taking false branch
           if (!ulp)
           ^
   ipc/sem.c:2345:2: note: Taking false branch
           if (!refcount_dec_and_test(&ulp->refcnt))
           ^
   ipc/sem.c:2348:2: note: Loop condition is true.  Entering loop body
           for (;;) {
           ^
   ipc/sem.c:2357:8: note: Left side of '||' is false
                   un =3D list_entry_rcu(ulp->list_proc.next,
                        ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:319:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   ipc/sem.c:2357:8: note: Left side of '||' is false
                   un =3D list_entry_rcu(ulp->list_proc.next,
                        ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:319:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   ipc/sem.c:2357:8: note: Left side of '||' is true
                   un =3D list_entry_rcu(ulp->list_proc.next,
                        ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:320:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   ipc/sem.c:2357:8: note: Taking false branch
                   un =3D list_entry_rcu(ulp->list_proc.next,
                        ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)

vim +/err +600 fs/efivarfs/vars.c

f51a4cf21aeb5f Ard Biesheuvel 2022-06-20  584  =

f51a4cf21aeb5f Ard Biesheuvel 2022-06-20  585  /**
f51a4cf21aeb5f Ard Biesheuvel 2022-06-20  586   * efivar_entry_get - call g=
et_variable()
f51a4cf21aeb5f Ard Biesheuvel 2022-06-20  587   * @entry: read data for thi=
s variable
f51a4cf21aeb5f Ard Biesheuvel 2022-06-20  588   * @attributes: variable att=
ributes
f51a4cf21aeb5f Ard Biesheuvel 2022-06-20  589   * @size: size of @data buff=
er
f51a4cf21aeb5f Ard Biesheuvel 2022-06-20  590   * @data: buffer to store va=
riable data
f51a4cf21aeb5f Ard Biesheuvel 2022-06-20  591   */
f51a4cf21aeb5f Ard Biesheuvel 2022-06-20  592  int efivar_entry_get(struct =
efivar_entry *entry, u32 *attributes,
f51a4cf21aeb5f Ard Biesheuvel 2022-06-20  593  		     unsigned long *size, =
void *data)
f51a4cf21aeb5f Ard Biesheuvel 2022-06-20  594  {
f51a4cf21aeb5f Ard Biesheuvel 2022-06-20  595  	int err;
f51a4cf21aeb5f Ard Biesheuvel 2022-06-20  596  =

f51a4cf21aeb5f Ard Biesheuvel 2022-06-20  597  	err =3D efivar_lock();
f51a4cf21aeb5f Ard Biesheuvel 2022-06-20  598  	if (err)
f51a4cf21aeb5f Ard Biesheuvel 2022-06-20  599  		return err;
f51a4cf21aeb5f Ard Biesheuvel 2022-06-20 @600  	err =3D __efivar_entry_get(=
entry, attributes, size, data);
f51a4cf21aeb5f Ard Biesheuvel 2022-06-20  601  	efivar_unlock();
f51a4cf21aeb5f Ard Biesheuvel 2022-06-20  602  =

f51a4cf21aeb5f Ard Biesheuvel 2022-06-20  603  	return 0;
f51a4cf21aeb5f Ard Biesheuvel 2022-06-20  604  }
f51a4cf21aeb5f Ard Biesheuvel 2022-06-20  605  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2344881049125613615==--

