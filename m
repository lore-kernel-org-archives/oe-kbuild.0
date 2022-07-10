Content-Type: multipart/mixed; boundary="===============2267013397469458077=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [peterz-queue:sched/idle 25/37] include/linux/thread_info.h:185:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Sun, 10 Jul 2022 17:21:15 +0800
Message-ID: <202207101702.15TQXwWX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2267013397469458077==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: include/l=
inux/thread_info.h:185:28: warning: Dereference of null pointer [clang-anal=
yzer-core.NullDereference]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sc=
hed/idle
head:   fa5af5d5cda43ded92091b6e29cf6aedf35b41cb
commit: dd13f42107d9842affc04f842b49c91cd44e9948 [25/37] cpuidle,sched: Rem=
ove annotations from TIF_{POLLING_NRFLAG,NEED_RESCHED}
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: s390-randconfig-c005-20220707 (https://download.01.org/0day-ci/arch=
ive/20220710/202207101702.15TQXwWX-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 77a38f=
6839980bfac61babb40d83772c51427011)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/=
commit/?id=3Ddd13f42107d9842affc04f842b49c91cd44e9948
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/ke=
rnel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/idle
        git checkout dd13f42107d9842affc04f842b49c91cd44e9948
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^~~~~~
   fs/configfs/symlink.c:70:3: note: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119
                   strcpy(s,"../");
                   ^~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   fs/configfs/item.c:60:9: warning: Call to function 'vsnprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'vsnprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           need =3D vsnprintf(item->ci_namebuf, limit, fmt, args);
                  ^~~~~~~~~
   fs/configfs/item.c:60:9: note: Call to function 'vsnprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'vsnprintf_s' in case of C11
           need =3D vsnprintf(item->ci_namebuf, limit, fmt, args);
                  ^~~~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   fs/cramfs/inode.c:250:4: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(data, kmap(page), PAGE_SIZE);
                           ^~~~~~
   fs/cramfs/inode.c:250:4: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                           memcpy(data, kmap(page), PAGE_SIZE);
                           ^~~~~~
   fs/cramfs/inode.c:254:4: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(data, 0, PAGE_SIZE);
                           ^~~~~~
   fs/cramfs/inode.c:254:4: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
                           memset(data, 0, PAGE_SIZE);
                           ^~~~~~
   fs/cramfs/inode.c:282:25: warning: Value stored to 'sbi' during its init=
ialization is never read [clang-analyzer-deadcode.DeadStores]
           struct cramfs_sb_info *sbi =3D CRAMFS_SB(sb);
                                  ^~~   ~~~~~~~~~~~~~
   fs/cramfs/inode.c:282:25: note: Value stored to 'sbi' during its initial=
ization is never read
           struct cramfs_sb_info *sbi =3D CRAMFS_SB(sb);
                                  ^~~   ~~~~~~~~~~~~~
   fs/cramfs/inode.c:374:2: warning: Value stored to 'bailout_reason' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           bailout_reason =3D "vma is writable";
           ^                ~~~~~~~~~~~~~~~~~
   fs/cramfs/inode.c:374:2: note: Value stored to 'bailout_reason' is never=
 read
           bailout_reason =3D "vma is writable";
           ^                ~~~~~~~~~~~~~~~~~
   fs/cramfs/inode.c:379:2: warning: Value stored to 'bailout_reason' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           bailout_reason =3D "beyond file limit";
           ^                ~~~~~~~~~~~~~~~~~~~
   fs/cramfs/inode.c:379:2: note: Value stored to 'bailout_reason' is never=
 read
           bailout_reason =3D "beyond file limit";
           ^                ~~~~~~~~~~~~~~~~~~~
   fs/cramfs/inode.c:385:2: warning: Value stored to 'bailout_reason' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           bailout_reason =3D "unsuitable block layout";
           ^                ~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cramfs/inode.c:385:2: note: Value stored to 'bailout_reason' is never=
 read
           bailout_reason =3D "unsuitable block layout";
           ^                ~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cramfs/inode.c:389:2: warning: Value stored to 'bailout_reason' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           bailout_reason =3D "data is not page aligned";
           ^                ~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cramfs/inode.c:389:2: note: Value stored to 'bailout_reason' is never=
 read
           bailout_reason =3D "data is not page aligned";
           ^                ~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cramfs/inode.c:400:3: warning: Value stored to 'bailout_reason' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   bailout_reason =3D "no suitable block remaining";
                   ^                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cramfs/inode.c:400:3: note: Value stored to 'bailout_reason' is never=
 read
                   bailout_reason =3D "no suitable block remaining";
                   ^                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cramfs/inode.c:527:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(super, cramfs_read(sb, 0, sizeof(*super)), sizeof(*super)=
);
           ^~~~~~
   fs/cramfs/inode.c:527:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(super, cramfs_read(sb, 0, sizeof(*super)), sizeof(*super)=
);
           ^~~~~~
   fs/cramfs/inode.c:541:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(super,
                   ^~~~~~
   fs/cramfs/inode.c:541:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(super,
                   ^~~~~~
   fs/cramfs/inode.c:736:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, name, namelen);
                   ^~~~~~
   fs/cramfs/inode.c:736:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(buf, name, namelen);
                   ^~~~~~
   fs/cramfs/inode.c:898:4: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(pgdata,
                           ^~~~~~
   fs/cramfs/inode.c:898:4: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                           memcpy(pgdata,
                           ^~~~~~
   fs/cramfs/inode.c:913:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(pgdata + bytes_filled, 0, PAGE_SIZE - bytes_filled);
           ^~~~~~
   fs/cramfs/inode.c:913:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(pgdata + bytes_filled, 0, PAGE_SIZE - bytes_filled);
           ^~~~~~
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer=
 [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   security/keys/gc.c:189:2: note: Taking false branch
           kenter("[%lx,%x]", key_gc_flags, gc_state);
           ^
   security/keys/internal.h:34:2: note: expanded from macro 'kenter'
           no_printk(KERN_DEBUG "=3D=3D> %s("FMT")\n", __func__, ##__VA_ARG=
S__)
           ^
   include/linux/printk.h:130:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   security/keys/gc.c:192:6: note: Assuming 'limit' is <=3D 'key_gc_delay'
           if (limit > key_gc_delay)
               ^~~~~~~~~~~~~~~~~~~~
   security/keys/gc.c:192:2: note: Taking false branch
           if (limit > key_gc_delay)
           ^
   security/keys/gc.c:200:6: note: Assuming the condition is false
           if (test_and_clear_bit(KEY_GC_KEY_EXPIRED, &key_gc_flags))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/gc.c:200:2: note: Taking false branch
           if (test_and_clear_bit(KEY_GC_KEY_EXPIRED, &key_gc_flags))
           ^
   security/keys/gc.c:203:6: note: Assuming the condition is false
           if (test_and_clear_bit(KEY_GC_REAP_KEYTYPE, &key_gc_flags))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/gc.c:203:2: note: Taking false branch
           if (test_and_clear_bit(KEY_GC_REAP_KEYTYPE, &key_gc_flags))
           ^
   security/keys/gc.c:205:2: note: Taking false branch
           kdebug("new pass %x", gc_state);
           ^
   security/keys/internal.h:38:2: note: expanded from macro 'kdebug'
           no_printk(KERN_DEBUG FMT"\n", ##__VA_ARGS__)
           ^
   include/linux/printk.h:130:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   security/keys/gc.c:217:2: note: Loop condition is true.  Entering loop b=
ody
           while (cursor) {
           ^
   security/keys/gc.c:221:7: note: Assuming the condition is false
                   if (refcount_read(&key->usage) =3D=3D 0)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/gc.c:221:3: note: Taking false branch
                   if (refcount_read(&key->usage) =3D=3D 0)
                   ^
   security/keys/gc.c:224:3: note: Taking false branch
                   if (unlikely(gc_state & KEY_GC_REAPING_DEAD_1)) {
                   ^
   security/keys/gc.c:236:3: note: Taking false branch
                   if (gc_state & KEY_GC_SET_TIMER) {
                   ^
   security/keys/gc.c:244:3: note: Taking false branch
                   if (unlikely(gc_state & KEY_GC_REAPING_DEAD_2))
                   ^
   security/keys/gc.c:248:7: note: Left side of '||' is false
                   if ((gc_state & KEY_GC_REAPING_LINKS) ||
                       ^
   security/keys/gc.c:248:3: note: Taking false branch
                   if ((gc_state & KEY_GC_REAPING_LINKS) ||
                   ^
   security/keys/gc.c:254:3: note: Taking false branch
                   if (unlikely(gc_state & KEY_GC_REAPING_DEAD_3))
                   ^
   security/keys/gc.c:259:7: note: Left side of '||' is false
                   if (spin_is_contended(&key_serial_lock) || need_resched(=
))
                       ^
   security/keys/gc.c:259:46: note: Calling 'need_resched'
                   if (spin_is_contended(&key_serial_lock) || need_resched(=
))
                                                              ^~~~~~~~~~~~~~
   include/linux/sched.h:2196:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   security/keys/gc.c:366:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&key->payload, KEY_DESTROY, sizeof(key->payload));
--
                        ^
   arch/s390/kvm/kvm-s390.c:4431:6: warning: Dereference of null pointer [c=
lang-analyzer-core.NullDereference]
           if (MACHINE_HAS_GS) {
               ^
   arch/s390/include/asm/setup.h:95:26: note: expanded from macro 'MACHINE_=
HAS_GS'
   #define MACHINE_HAS_GS          (S390_lowcore.machine_flags & MACHINE_FL=
AG_GS)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/kvm/kvm-s390.c:4429:25: note: Assuming the condition is false
           kvm_run->s.regs.bpbc =3D (vcpu->arch.sie_block->fpf & FPF_BPBC) =
=3D=3D FPF_BPBC;
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   arch/s390/kvm/kvm-s390.c:4431:6: note: Dereference of null pointer
           if (MACHINE_HAS_GS) {
               ^
   arch/s390/include/asm/setup.h:95:26: note: expanded from macro 'MACHINE_=
HAS_GS'
   #define MACHINE_HAS_GS          (S390_lowcore.machine_flags & MACHINE_FL=
AG_GS)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/kvm/kvm-s390.c:4453:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&kvm_run->s.regs.crs, &vcpu->arch.sie_block->gcr, 128);
           ^~~~~~
   arch/s390/kvm/kvm-s390.c:4453:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(&kvm_run->s.regs.crs, &vcpu->arch.sie_block->gcr, 128);
           ^~~~~~
   arch/s390/kvm/kvm-s390.c:4463:26: warning: Dereference of null pointer [=
clang-analyzer-core.NullDereference]
           vcpu->run->s.regs.fpc =3D current->thread.fpu.fpc;
                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/kvm/kvm-s390.c:4463:26: note: Dereference of null pointer
           vcpu->run->s.regs.fpc =3D current->thread.fpu.fpc;
                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/kvm/kvm-s390.c:4565:6: warning: Dereference of null pointer [c=
lang-analyzer-core.NullDereference]
           if (MACHINE_HAS_VX) {
               ^
   arch/s390/include/asm/setup.h:92:26: note: expanded from macro 'MACHINE_=
HAS_VX'
   #define MACHINE_HAS_VX          (S390_lowcore.machine_flags & MACHINE_FL=
AG_VX)
                                    ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/kvm/kvm-s390.c:4926:2: note: Control jumps to 'case 1074310805=
:'  at line 4927
           switch (ioctl) {
           ^
   arch/s390/kvm/kvm-s390.c:4929:7: note: Calling 'kvm_s390_store_status_un=
loaded'
                   r =3D kvm_s390_store_status_unloaded(vcpu, arg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/kvm/kvm-s390.c:4553:6: note: Assuming the condition is false
           if (gpa =3D=3D KVM_S390_STORE_STATUS_NOADDR) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/kvm/kvm-s390.c:4553:2: note: Taking false branch
           if (gpa =3D=3D KVM_S390_STORE_STATUS_NOADDR) {
           ^
   arch/s390/kvm/kvm-s390.c:4557:13: note: Assuming the condition is false
           } else if (gpa =3D=3D KVM_S390_STORE_STATUS_PREFIXED) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/kvm/kvm-s390.c:4557:9: note: Taking false branch
           } else if (gpa =3D=3D KVM_S390_STORE_STATUS_PREFIXED) {
                  ^
   arch/s390/kvm/kvm-s390.c:4565:6: note: Dereference of null pointer
           if (MACHINE_HAS_VX) {
               ^
   arch/s390/include/asm/setup.h:92:26: note: expanded from macro 'MACHINE_=
HAS_VX'
   #define MACHINE_HAS_VX          (S390_lowcore.machine_flags & MACHINE_FL=
AG_VX)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/kvm/kvm-s390.c:4604:26: warning: Dereference of null pointer [=
clang-analyzer-core.NullDereference]
           vcpu->run->s.regs.fpc =3D current->thread.fpu.fpc;
                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/kvm/kvm-s390.c:4604:26: note: Dereference of null pointer
           vcpu->run->s.regs.fpc =3D current->thread.fpu.fpc;
                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer=
 [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/kvm/kvm-s390.c:4248:8: note: Calling 'vcpu_pre_run'
                   rc =3D vcpu_pre_run(vcpu);
                        ^~~~~~~~~~~~~~~~~~
   arch/s390/kvm/kvm-s390.c:4117:6: note: Calling 'need_resched'
           if (need_resched())
               ^~~~~~~~~~~~~~
   include/linux/sched.h:2196:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 79 warnings (67 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   crypto/chacha_generic.c:62:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&real_iv[0], req->iv + 24, 8); /* stream position */
           ^~~~~~
   crypto/chacha_generic.c:62:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(&real_iv[0], req->iv + 24, 8); /* stream position */
           ^~~~~~
   crypto/chacha_generic.c:63:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&real_iv[8], req->iv + 16, 8); /* remaining 64 nonce bits=
 */
           ^~~~~~
   crypto/chacha_generic.c:63:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(&real_iv[8], req->iv + 16, 8); /* remaining 64 nonce bits=
 */
           ^~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   crypto/poly1305_generic.c:49:4: warning: Value stored to 'src' is never =
read [clang-analyzer-deadcode.DeadStores]
                           src +=3D POLY1305_BLOCK_SIZE;
                           ^
   crypto/poly1305_generic.c:49:4: note: Value stored to 'src' is never read
   crypto/poly1305_generic.c:80:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dctx->buf + dctx->buflen, src, bytes);
                   ^~~~~~
   crypto/poly1305_generic.c:80:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dctx->buf + dctx->buflen, src, bytes);
                   ^~~~~~
   crypto/poly1305_generic.c:100:3: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dctx->buf, src, srclen);
                   ^~~~~~
   crypto/poly1305_generic.c:100:3: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dctx->buf, src, srclen);
                   ^~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   fs/autofs/inode.c:142:16: warning: Dereference of null pointer [clang-an=
alyzer-core.NullDereference]
           root->i_uid =3D current_uid();
                         ^
   include/linux/cred.h:381:25: note: expanded from macro 'current_uid'
   #define current_uid()           (current_cred_xxx(uid))
                                    ^
   include/linux/cred.h:378:2: note: expanded from macro 'current_cred_xxx'
           current_cred()->xxx;                    \
           ^
   include/linux/cred.h:299:28: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
                                     ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/autofs/inode.c:232:6: note: Assuming 'sbi' is non-null
           if (!sbi)
               ^~~~
   fs/autofs/inode.c:232:2: note: Taking false branch
           if (!sbi)
           ^
   fs/autofs/inode.c:234:2: note: Taking false branch
--
                     ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/asm-generic/irq_regs.h:21:9: warning: Dereference of null pointe=
r [clang-analyzer-core.NullDereference]
           return __this_cpu_read(__irq_regs);
                  ^
   include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu=
_read'
           raw_cpu_read(pcp);                                              \
           ^
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_r=
ead'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_=
read_, pcp)
                                           ^
   include/linux/percpu-defs.h:324:23: note: expanded from macro '__pcpu_si=
ze_call_return'
           case 8: pscr_ret__ =3D stem##8(variable); break;                =
  \
                                ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^
   kernel/time/tick-sched.c:1470:25: note: Calling 'get_irq_regs'
           struct pt_regs *regs =3D get_irq_regs();
                                  ^~~~~~~~~~~~~~
   include/asm-generic/irq_regs.h:21:9: note: Loop condition is false.  Exi=
ting loop
           return __this_cpu_read(__irq_regs);
                  ^
   include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu=
_read'
           raw_cpu_read(pcp);                                              \
           ^
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_r=
ead'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_=
read_, pcp)
                                           ^
   include/linux/percpu-defs.h:319:2: note: expanded from macro '__pcpu_siz=
e_call_return'
           __verify_pcpu_ptr(&(variable));                                 \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   include/asm-generic/irq_regs.h:21:9: note: Control jumps to 'case 8:'  a=
t line 21
           return __this_cpu_read(__irq_regs);
                  ^
   include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu=
_read'
           raw_cpu_read(pcp);                                              \
           ^
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_r=
ead'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_=
read_, pcp)
                                           ^
   include/linux/percpu-defs.h:320:2: note: expanded from macro '__pcpu_siz=
e_call_return'
           switch(sizeof(variable)) {                                      \
           ^
   include/asm-generic/irq_regs.h:21:9: note: Loop condition is false.  Exi=
ting loop
           return __this_cpu_read(__irq_regs);
                  ^
   include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu=
_read'
           raw_cpu_read(pcp);                                              \
           ^
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_r=
ead'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_=
read_, pcp)
                                           ^
   include/linux/percpu-defs.h:324:23: note: expanded from macro '__pcpu_si=
ze_call_return'
           case 8: pscr_ret__ =3D stem##8(variable); break;                =
  \
                                ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/percpu.h:67:3: note: expanded from macro 'raw_cpu_ge=
neric_read'
           *raw_cpu_ptr(&(pcp));                                           \
            ^
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   include/asm-generic/irq_regs.h:21:9: note: Dereference of null pointer
           return __this_cpu_read(__irq_regs);
                  ^
   include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu=
_read'
           raw_cpu_read(pcp);                                              \
           ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_r=
ead'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_=
read_, pcp)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/linux/percpu-defs.h:324:23: note: expanded from macro '__pcpu_si=
ze_call_return'
           case 8: pscr_ret__ =3D stem##8(variable); break;                =
  \
                                ^~~~~~~~~~~~~~~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^~~~~
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer=
 [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/time/tick-sched.c:1051:15: note: Assuming the condition is false
           if (unlikely(!cpu_online(cpu))) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   kernel/time/tick-sched.c:1051:2: note: Taking false branch
           if (unlikely(!cpu_online(cpu))) {
           ^
   kernel/time/tick-sched.c:1062:15: note: Assuming field 'nohz_mode' is no=
t equal to NOHZ_MODE_INACTIVE
           if (unlikely(ts->nohz_mode =3D=3D NOHZ_MODE_INACTIVE))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   kernel/time/tick-sched.c:1062:2: note: Taking false branch
           if (unlikely(ts->nohz_mode =3D=3D NOHZ_MODE_INACTIVE))
           ^
   kernel/time/tick-sched.c:1065:6: note: Calling 'need_resched'
           if (need_resched())
               ^~~~~~~~~~~~~~
   include/linux/sched.h:2196:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/time/tick-sched.c:176:12: warning: Dereference of null pointer [c=
lang-analyzer-core.NullDereference]
           int cpu =3D smp_processor_id();
                     ^
   include/linux/smp.h:264:29: note: expanded from macro 'smp_processor_id'
   # define smp_processor_id() __smp_processor_id()
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/smp.h:257:31: note: expanded from macro '__smp_processor_i=
d'
   #define __smp_processor_id(x) raw_smp_processor_id(x)
                                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/tick-sched.c:176:12: note: Dereference of null pointer
           int cpu =3D smp_processor_id();
                     ^
   include/linux/smp.h:264:29: note: expanded from macro 'smp_processor_id'
   # define smp_processor_id() __smp_processor_id()
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/smp.h:257:31: note: expanded from macro '__smp_processor_i=
d'
   #define __smp_processor_id(x) raw_smp_processor_id(x)
                                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/tick-sched.c:233:20: warning: Dereference of null pointer [c=
lang-analyzer-core.NullDereference]
                   if (is_idle_task(current))
                                    ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/time/tick-sched.c:231:6: note: Assuming field 'tick_stopped' is n=
ot equal to 0
           if (ts->tick_stopped) {
               ^~~~~~~~~~~~~~~~
   kernel/time/tick-sched.c:231:2: note: Taking true branch
           if (ts->tick_stopped) {
           ^
   kernel/time/tick-sched.c:233:20: note: Dereference of null pointer
                   if (is_idle_task(current))
                                    ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/time/tick-sched.c:605:26: warning: Dereference of null pointer [c=
lang-analyzer-core.NullDereference]
           struct tick_sched *ts =3D this_cpu_ptr(&tick_cpu_sched);
--
           ^~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   arch/s390/include/asm/preempt.h:74:18: warning: Dereference of null poin=
ter [clang-analyzer-core.NullDereference]
           return unlikely(READ_ONCE(S390_lowcore.preempt_count) =3D=3D
                           ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^
   kernel/sched/core.c:8330:16: note: Calling 'should_resched'
           int resched =3D should_resched(PREEMPT_LOCK_OFFSET);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/preempt.h:74:18: note: Left side of '||' is false
           return unlikely(READ_ONCE(S390_lowcore.preempt_count) =3D=3D
                           ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:325:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   arch/s390/include/asm/preempt.h:74:18: note: Left side of '||' is false
           return unlikely(READ_ONCE(S390_lowcore.preempt_count) =3D=3D
                           ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:325:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   arch/s390/include/asm/preempt.h:74:18: note: Left side of '||' is true
           return unlikely(READ_ONCE(S390_lowcore.preempt_count) =3D=3D
                           ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:326:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   arch/s390/include/asm/preempt.h:74:18: note: Taking false branch
           return unlikely(READ_ONCE(S390_lowcore.preempt_count) =3D=3D
                           ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:358:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:338:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   arch/s390/include/asm/preempt.h:74:18: note: Loop condition is false.  E=
xiting loop
           return unlikely(READ_ONCE(S390_lowcore.preempt_count) =3D=3D
                           ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:358:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:330:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   arch/s390/include/asm/preempt.h:74:18: note: Dereference of null pointer
           return unlikely(READ_ONCE(S390_lowcore.preempt_count) =3D=3D
                           ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer=
 [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/sched/core.c:1174:65: note: Loop condition is false.  Exiting loop
           flags =3D atomic_fetch_andnot(NOHZ_KICK_MASK | NOHZ_NEWILB_KICK,=
 nohz_flags(cpu));
                                                                          ^
   kernel/sched/sched.h:2744:27: note: expanded from macro 'nohz_flags'
   #define nohz_flags(cpu) (&cpu_rq(cpu)->nohz_flags)
                             ^
   kernel/sched/sched.h:1353:24: note: expanded from macro 'cpu_rq'
   #define cpu_rq(cpu)             (&per_cpu(runqueues, (cpu)))
                                     ^
   include/linux/percpu-defs.h:269:29: note: expanded from macro 'per_cpu'
   #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
                                     ^
   include/linux/percpu-defs.h:235:2: note: expanded from macro 'per_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   kernel/sched/core.c:1175:10: note: Assuming the condition is false
           WARN_ON(!(flags & NOHZ_KICK_MASK));
                   ^
   arch/s390/include/asm/bug.h:54:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(x);                      \
                                  ^
   kernel/sched/core.c:1175:2: note: Taking false branch
           WARN_ON(!(flags & NOHZ_KICK_MASK));
           ^
   arch/s390/include/asm/bug.h:55:2: note: expanded from macro 'WARN_ON'
           if (__builtin_constant_p(__ret_warn_on)) {      \
           ^
   kernel/sched/core.c:1175:2: note: Taking false branch
           WARN_ON(!(flags & NOHZ_KICK_MASK));
           ^
   arch/s390/include/asm/bug.h:59:3: note: expanded from macro 'WARN_ON'
                   if (unlikely(__ret_warn_on))            \
                   ^
   kernel/sched/core.c:1178:10: note: Field 'idle_balance' is 1
           if (rq->idle_balance && !need_resched()) {
                   ^
   kernel/sched/core.c:1178:6: note: Left side of '&&' is true
           if (rq->idle_balance && !need_resched()) {
               ^
   kernel/sched/core.c:1178:27: note: Calling 'need_resched'
           if (rq->idle_balance && !need_resched()) {
                                    ^~~~~~~~~~~~~~
   include/linux/sched.h:2196:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/sched/core.c:776:29: warning: Dereference of null pointer [clang-=
analyzer-core.NullDereference]
           WARN_ON_ONCE(cpu_of(rq) !=3D smp_processor_id());
                                      ^
   include/linux/smp.h:264:29: note: expanded from macro 'smp_processor_id'
   # define smp_processor_id() __smp_processor_id()
                               ^
   include/linux/smp.h:257:31: note: expanded from macro '__smp_processor_i=
d'
   #define __smp_processor_id(x) raw_smp_processor_id(x)
                                 ^
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   include/asm-generic/bug.h:110:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                  ^~~~~~~~~
   kernel/sched/core.c:776:29: note: Dereference of null pointer
           WARN_ON_ONCE(cpu_of(rq) !=3D smp_processor_id());
                                      ^
   include/linux/smp.h:264:29: note: expanded from macro 'smp_processor_id'
   # define smp_processor_id() __smp_processor_id()
                               ^
   include/linux/smp.h:257:31: note: expanded from macro '__smp_processor_i=
d'
   #define __smp_processor_id(x) raw_smp_processor_id(x)
                                 ^
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
--
           ^~~~~~
   drivers/video/fbdev/core/fbmem.c:619:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(&fb_logo, 0, sizeof(struct logo_data));
           ^~~~~~
   drivers/video/fbdev/core/fbmem.c:806:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   fb_memcpy_fromfb(dst, src, c);
                   ^
   include/linux/fb.h:584:26: note: expanded from macro 'fb_memcpy_fromfb'
   #define fb_memcpy_fromfb memcpy
                            ^~~~~~
   drivers/video/fbdev/core/fbmem.c:806:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   fb_memcpy_fromfb(dst, src, c);
                   ^
   include/linux/fb.h:584:26: note: expanded from macro 'fb_memcpy_fromfb'
   #define fb_memcpy_fromfb memcpy
                            ^~~~~~
   drivers/video/fbdev/core/fbmem.c:807:3: warning: Value stored to 'dst' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   dst +=3D c;
                   ^      ~
   drivers/video/fbdev/core/fbmem.c:807:3: note: Value stored to 'dst' is n=
ever read
                   dst +=3D c;
                   ^      ~
   drivers/video/fbdev/core/fbmem.c:883:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   fb_memcpy_tofb(dst, src, c);
                   ^
   include/linux/fb.h:585:24: note: expanded from macro 'fb_memcpy_tofb'
   #define fb_memcpy_tofb memcpy
                          ^~~~~~
   drivers/video/fbdev/core/fbmem.c:883:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   fb_memcpy_tofb(dst, src, c);
                   ^
   include/linux/fb.h:585:24: note: expanded from macro 'fb_memcpy_tofb'
   #define fb_memcpy_tofb memcpy
                          ^~~~~~
   drivers/video/fbdev/core/fbmem.c:885:3: warning: Value stored to 'src' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   src +=3D c;
                   ^      ~
   drivers/video/fbdev/core/fbmem.c:885:3: note: Value stored to 'src' is n=
ever read
                   src +=3D c;
                   ^      ~
   drivers/video/fbdev/core/fbmem.c:941:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&caps, 0, sizeof(caps));
           ^~~~~~
   drivers/video/fbdev/core/fbmem.c:941:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(&caps, 0, sizeof(caps));
           ^~~~~~
   drivers/video/fbdev/core/fbmem.c:942:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&fbcaps, 0, sizeof(fbcaps));
           ^~~~~~
   drivers/video/fbdev/core/fbmem.c:942:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(&fbcaps, 0, sizeof(fbcaps));
           ^~~~~~
   drivers/video/fbdev/core/fbmem.c:1120:3: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&fix, &info->fix, sizeof(fix));
                   ^~~~~~
   drivers/video/fbdev/core/fbmem.c:1120:3: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&fix, &info->fix, sizeof(fix));
                   ^~~~~~
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   Suppressed 49 warnings (37 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   drivers/tty/tty_buffer.c:327:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(char_buf_ptr(tb, tb->used), chars, space);
                   ^~~~~~
   drivers/tty/tty_buffer.c:327:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(char_buf_ptr(tb, tb->used), chars, space);
                   ^~~~~~
   drivers/tty/tty_buffer.c:329:4: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(flag_buf_ptr(tb, tb->used), flag, space);
                           ^~~~~~
   drivers/tty/tty_buffer.c:329:4: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
                           memset(flag_buf_ptr(tb, tb->used), flag, space);
                           ^~~~~~
   drivers/tty/tty_buffer.c:365:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(char_buf_ptr(tb, tb->used), chars, space);
                   ^~~~~~
   drivers/tty/tty_buffer.c:365:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(char_buf_ptr(tb, tb->used), chars, space);
                   ^~~~~~
   drivers/tty/tty_buffer.c:366:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(flag_buf_ptr(tb, tb->used), flags, space);
                   ^~~~~~
   drivers/tty/tty_buffer.c:366:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(flag_buf_ptr(tb, tb->used), flags, space);
                   ^~~~~~
   drivers/tty/tty_buffer.c:429:4: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(flag_buf_ptr(tb, tb->used), TTY_NORMAL, s=
pace);
                           ^~~~~~
   drivers/tty/tty_buffer.c:429:4: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
                           memset(flag_buf_ptr(tb, tb->used), TTY_NORMAL, s=
pace);
                           ^~~~~~
   drivers/tty/tty_buffer.c:474:3: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(p, 0, n);
                   ^~~~~~
   drivers/tty/tty_buffer.c:474:3: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
                   memset(p, 0, n);
                   ^~~~~~
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer=
 [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/tty/tty_buffer.c:496:2: note: Loop condition is true.  Entering =
loop body
           while (1) {
           ^
   drivers/tty/tty_buffer.c:502:7: note: Assuming the condition is false
                   if (atomic_read(&buf->priority))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/tty_buffer.c:502:3: note: Taking false branch
                   if (atomic_read(&buf->priority))
                   ^
   drivers/tty/tty_buffer.c:509:10: note: Left side of '||' is false
                   next =3D smp_load_acquire(&head->next);
                          ^
   include/asm-generic/barrier.h:168:29: note: expanded from macro 'smp_loa=
d_acquire'
   #define smp_load_acquire(p) __smp_load_acquire(p)
                               ^
   arch/s390/include/asm/barrier.h:47:21: note: expanded from macro '__smp_=
load_acquire'
           typeof(*p) ___p1 =3D READ_ONCE(*p);                             =
  \
                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:325:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/tty/tty_buffer.c:509:10: note: Left side of '||' is false
                   next =3D smp_load_acquire(&head->next);
                          ^
   include/asm-generic/barrier.h:168:29: note: expanded from macro 'smp_loa=
d_acquire'
   #define smp_load_acquire(p) __smp_load_acquire(p)
                               ^
   arch/s390/include/asm/barrier.h:47:21: note: expanded from macro '__smp_=
load_acquire'
           typeof(*p) ___p1 =3D READ_ONCE(*p);                             =
  \
                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:325:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/tty/tty_buffer.c:509:10: note: Left side of '||' is false
                   next =3D smp_load_acquire(&head->next);
                          ^
   include/asm-generic/barrier.h:168:29: note: expanded from macro 'smp_loa=
d_acquire'
   #define smp_load_acquire(p) __smp_load_acquire(p)
                               ^
   arch/s390/include/asm/barrier.h:47:21: note: expanded from macro '__smp_=
load_acquire'
           typeof(*p) ___p1 =3D READ_ONCE(*p);                             =
  \
                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:325:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/tty/tty_buffer.c:509:10: note: Left side of '||' is true
                   next =3D smp_load_acquire(&head->next);
                          ^
   include/asm-generic/barrier.h:168:29: note: expanded from macro 'smp_loa=
d_acquire'
   #define smp_load_acquire(p) __smp_load_acquire(p)
                               ^
   arch/s390/include/asm/barrier.h:47:21: note: expanded from macro '__smp_=
load_acquire'
           typeof(*p) ___p1 =3D READ_ONCE(*p);                             =
  \
                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                                               ^
   drivers/tty/tty_buffer.c:509:10: note: Taking false branch
                   next =3D smp_load_acquire(&head->next);
                          ^
   include/asm-generic/barrier.h:168:29: note: expanded from macro 'smp_loa=
d_acquire'
   #define smp_load_acquire(p) __smp_load_acquire(p)
                               ^
   arch/s390/include/asm/barrier.h:47:21: note: expanded from macro '__smp_=
load_acquire'
           typeof(*p) ___p1 =3D READ_ONCE(*p);                             =
  \
                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
--
               ^~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/core.c:620:2: note: Taking true branch
           if (current_rng =3D=3D rng) {
           ^
   drivers/char/hw_random/core.c:621:9: note: Calling 'enable_best_rng'
                   err =3D enable_best_rng();
                         ^~~~~~~~~~~~~~~~~
   drivers/char/hw_random/core.c:300:22: note: 'new_rng' initialized to a n=
ull pointer value
           struct hwrng *rng, *new_rng =3D NULL;
                               ^~~~~~~
   drivers/char/hw_random/core.c:303:9: note: Assuming the condition is fal=
se
           BUG_ON(!mutex_is_locked(&rng_mutex));
                  ^
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/char/hw_random/core.c:303:2: note: Taking false branch
           BUG_ON(!mutex_is_locked(&rng_mutex));
           ^
   include/asm-generic/bug.h:71:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   drivers/char/hw_random/core.c:303:2: note: Loop condition is false.  Exi=
ting loop
           BUG_ON(!mutex_is_locked(&rng_mutex));
           ^
   include/asm-generic/bug.h:71:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   drivers/char/hw_random/core.c:306:6: note: Assuming the condition is fal=
se
           if (list_empty(&rng_list)) {
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/core.c:306:2: note: Taking false branch
           if (list_empty(&rng_list)) {
           ^
   drivers/char/hw_random/core.c:313:2: note: Loop condition is false. Exec=
ution continues on line 318
           list_for_each_entry(rng, &rng_list, list) {
           ^
   include/linux/list.h:674:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/char/hw_random/core.c:318:10: note: Assuming 'new_rng' is not eq=
ual to 'current_rng'
           ret =3D ((new_rng =3D=3D current_rng) ? 0 : set_current_rng(new_=
rng));
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/core.c:318:9: note: '?' condition is false
           ret =3D ((new_rng =3D=3D current_rng) ? 0 : set_current_rng(new_=
rng));
                  ^
   drivers/char/hw_random/core.c:318:56: note: Passing null pointer value v=
ia 1st parameter 'rng'
           ret =3D ((new_rng =3D=3D current_rng) ? 0 : set_current_rng(new_=
rng));
                                                                 ^~~~~~~
   drivers/char/hw_random/core.c:318:40: note: Calling 'set_current_rng'
           ret =3D ((new_rng =3D=3D current_rng) ? 0 : set_current_rng(new_=
rng));
                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/core.c:90:9: note: Assuming the condition is false
           BUG_ON(!mutex_is_locked(&rng_mutex));
                  ^
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/char/hw_random/core.c:90:2: note: Taking false branch
           BUG_ON(!mutex_is_locked(&rng_mutex));
           ^
   include/asm-generic/bug.h:71:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   drivers/char/hw_random/core.c:90:2: note: Loop condition is false.  Exit=
ing loop
           BUG_ON(!mutex_is_locked(&rng_mutex));
           ^
   include/asm-generic/bug.h:71:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   drivers/char/hw_random/core.c:92:19: note: Passing null pointer value vi=
a 1st parameter 'rng'
           err =3D hwrng_init(rng);
                            ^~~
   drivers/char/hw_random/core.c:92:8: note: Calling 'hwrng_init'
           err =3D hwrng_init(rng);
                 ^~~~~~~~~~~~~~~
   drivers/char/hw_random/core.c:149:6: note: Assuming the condition is true
           if (kref_get_unless_zero(&rng->ref))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/core.c:149:2: note: Taking true branch
           if (kref_get_unless_zero(&rng->ref))
           ^
   drivers/char/hw_random/core.c:150:3: note: Control jumps to line 164
                   goto skip_init;
                   ^
   drivers/char/hw_random/core.c:164:7: note: Access to field 'quality' res=
ults in a dereference of a null pointer (loaded from variable 'rng')
           if (!rng->quality)
                ^~~
   drivers/char/hw_random/core.c:372:8: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D snprintf(buf, PAGE_SIZE, "%s\n", rng ? rng->name : "none=
");
                 ^~~~~~~~
   drivers/char/hw_random/core.c:372:8: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           ret =3D snprintf(buf, PAGE_SIZE, "%s\n", rng ? rng->name : "none=
");
                 ^~~~~~~~
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer=
 [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/char/hw_random/core.c:212:2: note: Loop condition is true.  Ente=
ring loop body
           while (size) {
           ^
   drivers/char/hw_random/core.c:214:3: note: Taking false branch
                   if (IS_ERR(rng)) {
                   ^
   drivers/char/hw_random/core.c:218:7: note: Assuming 'rng' is non-null
                   if (!rng) {
                       ^~~~
   drivers/char/hw_random/core.c:218:3: note: Taking false branch
                   if (!rng) {
                   ^
   drivers/char/hw_random/core.c:223:7: note: Assuming the condition is fal=
se
                   if (mutex_lock_interruptible(&reading_mutex)) {
                       ^
   include/linux/mutex.h:188:40: note: expanded from macro 'mutex_lock_inte=
rruptible'
   #define mutex_lock_interruptible(lock) mutex_lock_interruptible_nested(l=
ock, 0)
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/char/hw_random/core.c:223:3: note: Taking false branch
                   if (mutex_lock_interruptible(&reading_mutex)) {
                   ^
   drivers/char/hw_random/core.c:227:7: note: Assuming 'data_avail' is 0
                   if (!data_avail) {
                       ^~~~~~~~~~~
   drivers/char/hw_random/core.c:227:3: note: Taking true branch
                   if (!data_avail) {
                   ^
   drivers/char/hw_random/core.c:230:5: note: Assuming the condition is true
                                   !(filp->f_flags & O_NONBLOCK));
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/core.c:231:8: note: Assuming 'bytes_read' is >=3D=
 0
                           if (bytes_read < 0) {
                               ^~~~~~~~~~~~~~
   drivers/char/hw_random/core.c:231:4: note: Taking false branch
                           if (bytes_read < 0) {
                           ^
   drivers/char/hw_random/core.c:238:7: note: Assuming 'data_avail' is 0
                   if (!data_avail) {
                       ^~~~~~~~~~~
   drivers/char/hw_random/core.c:238:3: note: Taking true branch
                   if (!data_avail) {
                   ^
   drivers/char/hw_random/core.c:239:4: note: Taking false branch
                           if (filp->f_flags & O_NONBLOCK) {
                           ^
   drivers/char/hw_random/core.c:263:7: note: Calling 'need_resched'
                   if (need_resched())
                       ^~~~~~~~~~~~~~
   include/linux/sched.h:2196:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   90 warnings generated.
   arch/s390/kvm/priv.c:62:3: warning: Dereference of null pointer [clang-a=
nalyzer-core.NullDereference]
                   current->thread.gs_cb =3D (struct gs_cb *)&vcpu->run->s.=
regs.gscb;
                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/kvm/priv.c:78:6: note: Assuming 'code' is not equal to 73
           if (code =3D=3D 0x49 || code =3D=3D 0x4d)
               ^~~~~~~~~~~~
   arch/s390/kvm/priv.c:78:6: note: Left side of '||' is false
   arch/s390/kvm/priv.c:78:22: note: Assuming 'code' is equal to 77
           if (code =3D=3D 0x49 || code =3D=3D 0x4d)
                               ^~~~~~~~~~~~
   arch/s390/kvm/priv.c:78:2: note: Taking true branch
           if (code =3D=3D 0x49 || code =3D=3D 0x4d)
           ^
   arch/s390/kvm/priv.c:79:10: note: Calling 'handle_gs'
--
           ^
   include/linux/fsnotify_backend.h:268:24: note: Calling 'memalloc_nofs_sa=
ve'
                   group->owner_flags =3D memalloc_nofs_save();
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
   include/linux/sched/mm.h:336:20: warning: Dereference of null pointer [c=
lang-analyzer-core.NullDereference]
           current->flags =3D (current->flags & ~PF_MEMALLOC_NOFS) | flags;
                             ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/notify/mark.c:753:2: note: Calling 'fsnotify_group_unlock'
           fsnotify_group_unlock(group);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fsnotify_backend.h:273:6: note: Assuming the condition is =
true
           if (group->flags & FSNOTIFY_GROUP_NOFS)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fsnotify_backend.h:273:2: note: Taking true branch
           if (group->flags & FSNOTIFY_GROUP_NOFS)
           ^
   include/linux/fsnotify_backend.h:274:3: note: Calling 'memalloc_nofs_res=
tore'
                   memalloc_nofs_restore(group->owner_flags);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sched/mm.h:336:20: note: Dereference of null pointer
           current->flags =3D (current->flags & ~PF_MEMALLOC_NOFS) | flags;
                             ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   lib/genalloc.c:446:3: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(vaddr, 0, size);
                   ^~~~~~
   lib/genalloc.c:446:3: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
                   memset(vaddr, 0, size);
                   ^~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   lib/842/842_compress.c:534:4: warning: Value stored to 'ret' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                           ret =3D add_repeat_template(p, repeat_count);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/842/842_compress.c:534:4: note: Value stored to 'ret' is never read
                           ret =3D add_repeat_template(p, repeat_count);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/842/842_compress.c:598:3: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(p->out, 0, pad);
                   ^~~~~~
   lib/842/842_compress.c:598:3: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
                   memset(p->out, 0, pad);
                   ^~~~~~
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   Suppressed 60 warnings (48 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (47 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   Suppressed 60 warnings (48 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (38 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (38 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (38 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (38 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   Suppressed 49 warnings (37 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   Suppressed 49 warnings (37 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   Suppressed 49 warnings (37 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer=
 [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/char/hw_random/s390-trng.c:69:6: note: Assuming the condition is=
 false
           if (nbytes > sizeof(buf)) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/s390-trng.c:69:2: note: Taking false branch
           if (nbytes > sizeof(buf)) {
           ^
   drivers/char/hw_random/s390-trng.c:75:2: note: Loop condition is true.  =
Entering loop body
           while (nbytes) {
           ^
   drivers/char/hw_random/s390-trng.c:76:7: note: Calling 'need_resched'
                   if (need_resched()) {
                       ^~~~~~~~~~~~~~
   include/linux/sched.h:2196:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   drivers/char/hw_random/ks-sa-rng.c:95:9: warning: Division by zero [clan=
g-analyzer-core.DivideZero]
           return DIV_ROUND_UP_ULL((TRNG_DEF_CLK_DIV_CYCLES + 1) * 10000000=
00ull *
                  ^
   include/linux/math.h:43:2: note: expanded from macro 'DIV_ROUND_UP_ULL'
           DIV_ROUND_DOWN_ULL((unsigned long long)(ll) + (d) - 1, (d))
           ^
   include/linux/math.h:40:37: note: expanded from macro 'DIV_ROUND_DOWN_UL=
L'
           ({ unsigned long long _tmp =3D (ll); do_div(_tmp, d); _tmp; })
                                              ^
   include/asm-generic/div64.h:48:26: note: expanded from macro 'do_div'
           __rem =3D ((uint64_t)(n)) % __base;                       \
                                   ^
   drivers/char/hw_random/ks-sa-rng.c:118:27: note: Calling 'clk_get_rate'
           unsigned long clk_rate =3D clk_get_rate(ks_sa_rng->clk);
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/clk.h:882:2: note: Returning zero
           return 0;
           ^~~~~~~~
   drivers/char/hw_random/ks-sa-rng.c:118:27: note: Returning from 'clk_get=
_rate'
           unsigned long clk_rate =3D clk_get_rate(ks_sa_rng->clk);
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/ks-sa-rng.c:118:2: note: 'clk_rate' initialized t=
o 0
           unsigned long clk_rate =3D clk_get_rate(ks_sa_rng->clk);
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/ks-sa-rng.c:147:47: note: Passing the value 0 via=
 1st parameter 'clk_rate'
           ks_sa_rng->refill_delay_ns =3D refill_delay_ns(clk_rate);
                                                        ^~~~~~~~
   drivers/char/hw_random/ks-sa-rng.c:147:31: note: Calling 'refill_delay_n=
s'
           ks_sa_rng->refill_delay_ns =3D refill_delay_ns(clk_rate);
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/ks-sa-rng.c:108:2: note: Taking true branch
           if (!TRNG_DEF_MAX_REFILL_CYCLES)
           ^
   drivers/char/hw_random/ks-sa-rng.c:109:23: note: Passing the value 0 via=
 1st parameter 'clk_rate'
                   return cycles_to_ns(clk_rate, BIT(24));
                                       ^~~~~~~~
   drivers/char/hw_random/ks-sa-rng.c:109:10: note: Calling 'cycles_to_ns'
                   return cycles_to_ns(clk_rate, BIT(24));
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/ks-sa-rng.c:95:9: note: '__base' initialized to 0
           return DIV_ROUND_UP_ULL((TRNG_DEF_CLK_DIV_CYCLES + 1) * 10000000=
00ull *
                  ^
   include/linux/math.h:43:2: note: expanded from macro 'DIV_ROUND_UP_ULL'
           DIV_ROUND_DOWN_ULL((unsigned long long)(ll) + (d) - 1, (d))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math.h:40:37: note: expanded from macro 'DIV_ROUND_DOWN_UL=
L'
           ({ unsigned long long _tmp =3D (ll); do_div(_tmp, d); _tmp; })
                                              ^~~~~~~~~~~~~~~
   include/asm-generic/div64.h:46:2: note: expanded from macro 'do_div'
           uint32_t __base =3D (base);                               \
           ^~~~~~~~~~~~~~~
   drivers/char/hw_random/ks-sa-rng.c:95:9: note: Division by zero
           return DIV_ROUND_UP_ULL((TRNG_DEF_CLK_DIV_CYCLES + 1) * 10000000=
00ull *
                  ^
   include/linux/math.h:43:2: note: expanded from macro 'DIV_ROUND_UP_ULL'
           DIV_ROUND_DOWN_ULL((unsigned long long)(ll) + (d) - 1, (d))
--
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
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   drivers/tty/tty_port.c:73:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(port, 0, sizeof(*port));
           ^~~~~~
   drivers/tty/tty_port.c:73:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(port, 0, sizeof(*port));
           ^~~~~~
   drivers/tty/tty_port.c:494:2: warning: Dereference of null pointer [clan=
g-analyzer-core.NullDereference]
           DEFINE_WAIT(wait);
           ^
   include/linux/wait.h:1179:27: note: expanded from macro 'DEFINE_WAIT'
   #define DEFINE_WAIT(name) DEFINE_WAIT_FUNC(name, autoremove_wake_functio=
n)
                             ^
   include/linux/wait.h:1174:14: note: expanded from macro 'DEFINE_WAIT_FUN=
C'
                   .private        =3D current,                            =
          \
                                     ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/tty/tty_port.c:760:6: note: Assuming the condition is false
           if (!tty_port_initialized(port)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/tty_port.c:760:2: note: Taking false branch
           if (!tty_port_initialized(port)) {
           ^
   drivers/tty/tty_port.c:773:9: note: Calling 'tty_port_block_til_ready'
           return tty_port_block_til_ready(port, tty, filp);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/tty_port.c:494:2: note: Dereference of null pointer
           DEFINE_WAIT(wait);
           ^
   include/linux/wait.h:1179:27: note: expanded from macro 'DEFINE_WAIT'
   #define DEFINE_WAIT(name) DEFINE_WAIT_FUNC(name, autoremove_wake_functio=
n)
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/wait.h:1174:14: note: expanded from macro 'DEFINE_WAIT_FUN=
C'
                   .private        =3D current,                            =
          \
                                     ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 49 warnings (37 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   Suppressed 49 warnings (37 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   80 warnings generated.
   arch/s390/include/asm/pgtable.h:1281:7: warning: Dereference of null poi=
nter [clang-analyzer-core.NullDereference]
           if (!MACHINE_HAS_NX)
                ^
   arch/s390/include/asm/setup.h:94:26: note: expanded from macro 'MACHINE_=
HAS_NX'
   #define MACHINE_HAS_NX          (S390_lowcore.machine_flags & MACHINE_FL=
AG_NX)
                                    ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   mm/memory.c:4287:18: note: Assuming 'addr' is equal to field 'address'
           bool prefault =3D vmf->address !=3D addr;
                           ^~~~~~~~~~~~~~~~~~~~
   mm/memory.c:4291:10: note: Calling 'mk_pte'
           entry =3D mk_pte(page, vma->vm_page_prot);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/pgtable.h:1289:16: note: Calling 'mk_pte_phys'
           pte_t __pte =3D mk_pte_phys(physpage, pgprot);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/pgtable.h:1281:7: note: Dereference of null pointer
           if (!MACHINE_HAS_NX)
                ^
   arch/s390/include/asm/setup.h:94:26: note: expanded from macro 'MACHINE_=
HAS_NX'
   #define MACHINE_HAS_NX          (S390_lowcore.machine_flags & MACHINE_FL=
AG_NX)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer=
 [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   mm/memory.c:1585:10: note: Assuming the condition is false
                   next =3D pud_addr_end(addr, end);
                          ^
   include/linux/pgtable.h:808:3: note: expanded from macro 'pud_addr_end'
           (__boundary - 1 < (end) - 1)? __boundary: (end);                \
            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:1585:10: note: '?' condition is false
                   next =3D pud_addr_end(addr, end);
                          ^
   include/linux/pgtable.h:808:2: note: expanded from macro 'pud_addr_end'
           (__boundary - 1 < (end) - 1)? __boundary: (end);                \
           ^
   mm/memory.c:1586:7: note: Left side of '||' is false
                   if (pud_trans_huge(*pud) || pud_devmap(*pud)) {
                       ^
   mm/memory.c:1586:3: note: Taking false branch
                   if (pud_trans_huge(*pud) || pud_devmap(*pud)) {
                   ^
   mm/memory.c:1594:3: note: Taking false branch
                   if (pud_none_or_clear_bad(pud))
                   ^
   mm/memory.c:1596:10: note: Calling 'zap_pmd_range'
                   next =3D zap_pmd_range(tlb, vma, pud, addr, next, detail=
s);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:1539:10: note: Assuming the condition is false
                   next =3D pmd_addr_end(addr, end);
                          ^
   include/linux/pgtable.h:815:3: note: expanded from macro 'pmd_addr_end'
           (__boundary - 1 < (end) - 1)? __boundary: (end);                \
            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:1539:10: note: '?' condition is false
                   next =3D pmd_addr_end(addr, end);
                          ^
   include/linux/pgtable.h:815:2: note: expanded from macro 'pmd_addr_end'
           (__boundary - 1 < (end) - 1)? __boundary: (end);                \
           ^
   mm/memory.c:1540:7: note: Left side of '||' is false
                   if (is_swap_pmd(*pmd) || pmd_trans_huge(*pmd) || pmd_dev=
map(*pmd)) {
                       ^
   mm/memory.c:1540:7: note: Left side of '||' is false
   mm/memory.c:1540:3: note: Taking false branch
                   if (is_swap_pmd(*pmd) || pmd_trans_huge(*pmd) || pmd_dev=
map(*pmd)) {
                   ^
   mm/memory.c:1546:14: note: Assuming 'details' is null
                   } else if (details && details->single_folio &&
                              ^~~~~~~
   mm/memory.c:1546:22: note: Left side of '&&' is false
                   } else if (details && details->single_folio &&
                                      ^
   mm/memory.c:1565:3: note: Taking false branch
                   if (pmd_none_or_trans_huge_or_clear_bad(pmd))
                   ^
   mm/memory.c:1567:10: note: Calling 'zap_pte_range'
                   next =3D zap_pte_range(tlb, vma, pmd, addr, next, detail=
s);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:1413:2: note: Loop condition is false.  Exiting loop
           arch_enter_lazy_mmu_mode();
           ^
   include/linux/pgtable.h:1011:36: note: expanded from macro 'arch_enter_l=
azy_mmu_mode'
   #define arch_enter_lazy_mmu_mode()      do {} while (0)
                                           ^
   mm/memory.c:1418:3: note: Taking false branch
                   if (pte_none(ptent))
                   ^
   mm/memory.c:1421:7: note: Calling 'need_resched'
                   if (need_resched())
                       ^~~~~~~~~~~~~~
   include/linux/sched.h:2196:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/uaccess.h:179:2: warning: Dereference of null pointer [cla=
ng-analyzer-core.NullDereference]
           current->pagefault_disabled++;
           ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
--
                          ^
   drivers/char/mem.c:496:22: note: Dereference of null pointer
                   if (signal_pending(current))
                                      ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/char/mem.c:526:22: warning: Dereference of null pointer [clang-a=
nalyzer-core.NullDereference]
                   if (signal_pending(current))
                                      ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/char/mem.c:512:2: note: Loop condition is true.  Entering loop b=
ody
           while (count) {
           ^
   drivers/char/mem.c:513:18: note: Assuming '__UNIQUE_ID___x268' is >=3D '=
__UNIQUE_ID___y269'
                   size_t chunk =3D min_t(size_t, count, PAGE_SIZE);
                                  ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/char/mem.c:513:18: note: '?' condition is false
                   size_t chunk =3D min_t(size_t, count, PAGE_SIZE);
                                  ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/char/mem.c:517:7: note: Assuming 'left' is 0
                   if (unlikely(left)) {
                       ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   drivers/char/mem.c:517:3: note: Taking false branch
                   if (unlikely(left)) {
                   ^
   drivers/char/mem.c:526:22: note: Dereference of null pointer
                   if (signal_pending(current))
                                      ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/char/mem.c:561:9: warning: Dereference of null pointer [clang-an=
alyzer-core.NullDereference]
           return current->mm->get_unmapped_area(file, addr, len, pgoff, fl=
ags);
                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/char/mem.c:550:6: note: Assuming the condition is false
           if (flags & MAP_SHARED) {
               ^~~~~~~~~~~~~~~~~~
   drivers/char/mem.c:550:2: note: Taking false branch
           if (flags & MAP_SHARED) {
           ^
   drivers/char/mem.c:561:9: note: Dereference of null pointer
           return current->mm->get_unmapped_area(file, addr, len, pgoff, fl=
ags);
                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/char/mem.c:694:21: warning: Excessive padding in 'struct memdev'=
 (10 padding bytes, where 2 is optimal). Optimal fields order: name, fops, =
fmode, mode, consider reordering the fields or adding explicit padding memb=
ers [clang-analyzer-optin.performance.Padding]
   static const struct memdev {
                ~~~~~~~^~~~~~~~
   drivers/char/mem.c:694:21: note: Excessive padding in 'struct memdev' (1=
0 padding bytes, where 2 is optimal). Optimal fields order: name, fops, fmo=
de, mode, consider reordering the fields or adding explicit padding members
   static const struct memdev {
                ~~~~~~~^~~~~~~~
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer=
 [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/char/mem.c:206:2: note: Taking false branch
           if (p !=3D *ppos)
           ^
   drivers/char/mem.c:209:2: note: Taking false branch
           if (!valid_phys_addr_range(p, count))
           ^
   drivers/char/mem.c:226:9: note: Assuming 'count' is > 0
           while (count > 0) {
                  ^~~~~~~~~
   drivers/char/mem.c:226:2: note: Loop condition is true.  Entering loop b=
ody
           while (count > 0) {
           ^
   drivers/char/mem.c:232:8: note: 'allowed' is 1
                   if (!allowed)
                        ^~~~~~~
   drivers/char/mem.c:232:3: note: Taking false branch
                   if (!allowed)
                   ^
   drivers/char/mem.c:236:7: note: 'allowed' is equal to 1
                   if (allowed =3D=3D 1) {
                       ^~~~~~~
   drivers/char/mem.c:236:3: note: Taking true branch
                   if (allowed =3D=3D 1) {
                   ^
   drivers/char/mem.c:243:8: note: Assuming 'ptr' is non-null
                           if (!ptr) {
                               ^~~~
   drivers/char/mem.c:243:4: note: Taking false branch
                           if (!ptr) {
                           ^
   drivers/char/mem.c:251:8: note: Assuming 'copied' is 0
                           if (copied) {
                               ^~~~~~
   drivers/char/mem.c:251:4: note: Taking false branch
                           if (copied) {
                           ^
   drivers/char/mem.c:263:7: note: Calling 'should_stop_iteration'
                   if (should_stop_iteration())
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/mem.c:102:6: note: Calling 'need_resched'
           if (need_resched())
               ^~~~~~~~~~~~~~
   include/linux/sched.h:2196:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 59 warnings (47 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   drivers/regulator/wm831x-isink.c:143:2: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(isink->name, sizeof(isink->name), "ISINK%d", id + 1);
           ^~~~~~~~
   drivers/regulator/wm831x-isink.c:143:2: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(isink->name, sizeof(isink->name), "ISINK%d", id + 1);
           ^~~~~~~~
   Suppressed 59 warnings (47 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
   drivers/regulator/wm831x-ldo.c:246:2: warning: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(ldo->name, sizeof(ldo->name), "LDO%d", id + 1);
           ^~~~~~~~
   drivers/regulator/wm831x-ldo.c:246:2: note: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11
           snprintf(ldo->name, sizeof(ldo->name), "LDO%d", id + 1);
           ^~~~~~~~
   drivers/regulator/wm831x-ldo.c:249:2: warning: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(ldo->supply_name, sizeof(ldo->supply_name),
           ^~~~~~~~
   drivers/regulator/wm831x-ldo.c:249:2: note: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11
           snprintf(ldo->supply_name, sizeof(ldo->supply_name),
           ^~~~~~~~
   drivers/regulator/wm831x-ldo.c:456:2: warning: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(ldo->name, sizeof(ldo->name), "LDO%d", id + 1);
           ^~~~~~~~
   drivers/regulator/wm831x-ldo.c:456:2: note: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11
           snprintf(ldo->name, sizeof(ldo->name), "LDO%d", id + 1);
--
                   this_cpu_inc(*sem->read_count);
                   ^
   include/linux/percpu-defs.h:520:28: note: expanded from macro 'this_cpu_=
inc'
   #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_=
add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, =
pcp, val)
                                           ^
   include/linux/percpu-defs.h:379:11: note: expanded from macro '__pcpu_si=
ze_call'
                   case 4: stem##4(variable, __VA_ARGS__);break;           \
                           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   arch/s390/include/asm/percpu.h:72:10: note: expanded from macro 'arch_th=
is_cpu_add'
           ptr__ =3D raw_cpu_ptr(&(pcp));                            \
                   ^
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   include/linux/percpu-rwsem.h:63:3: note: Dereference of null pointer
                   this_cpu_inc(*sem->read_count);
                   ^
   include/linux/percpu-defs.h:520:28: note: expanded from macro 'this_cpu_=
inc'
   #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
                                           ^~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_=
add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, =
pcp, val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   include/linux/percpu-defs.h:379:11: note: expanded from macro '__pcpu_si=
ze_call'
                   case 4: stem##4(variable, __VA_ARGS__);break;           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^~~~~
   include/linux/sched/signal.h:775:21: warning: Dereference of null pointe=
r [clang-analyzer-core.NullDereference]
           return task_rlimit(current, limit);
                              ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/io_uring.c:10715:14: note: Assuming 'i' is < 'nr_pages'
           for (i =3D 0; i < nr_pages; i++) {
                       ^~~~~~~~~~~~
   fs/io_uring.c:10715:2: note: Loop condition is true.  Entering loop body
           for (i =3D 0; i < nr_pages; i++) {
           ^
   fs/io_uring.c:10716:7: note: Assuming the condition is true
                   if (!PageCompound(pages[i])) {
                       ^~~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:10716:3: note: Taking true branch
                   if (!PageCompound(pages[i])) {
                   ^
   fs/io_uring.c:10715:14: note: Assuming 'i' is >=3D 'nr_pages'
           for (i =3D 0; i < nr_pages; i++) {
                       ^~~~~~~~~~~~
   fs/io_uring.c:10715:2: note: Loop condition is false. Execution continue=
s on line 10731
           for (i =3D 0; i < nr_pages; i++) {
           ^
   fs/io_uring.c:10731:12: note: Field 'acct_pages' is 1
           if (!imu->acct_pages)
                     ^
   fs/io_uring.c:10731:2: note: Taking false branch
           if (!imu->acct_pages)
           ^
   fs/io_uring.c:10734:8: note: Calling 'io_account_mem'
           ret =3D io_account_mem(ctx, imu->acct_pages);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:10528:6: note: Assuming field 'user' is non-null
           if (ctx->user) {
               ^~~~~~~~~
   fs/io_uring.c:10528:2: note: Taking true branch
           if (ctx->user) {
           ^
   fs/io_uring.c:10529:9: note: Calling '__io_account_mem'
                   ret =3D __io_account_mem(ctx->user, nr_pages);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:10502:15: note: Calling 'rlimit'
           page_limit =3D rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;
                        ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/sched/signal.h:775:21: note: Dereference of null pointer
           return task_rlimit(current, limit);
                              ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer=
 [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/io_uring.c:11285:3: note: Calling 'io_uring_try_cancel_requests'
                   io_uring_try_cancel_requests(ctx, NULL, true);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:11470:31: note: 'task' is null
           struct io_uring_task *tctx =3D task ? task->io_uring : NULL;
                                        ^~~~
   fs/io_uring.c:11470:31: note: '?' condition is false
   fs/io_uring.c:11473:6: note: Assuming field 'rings' is non-null
           if (!ctx->rings)
               ^~~~~~~~~~~
   fs/io_uring.c:11473:2: note: Taking false branch
           if (!ctx->rings)
           ^
   fs/io_uring.c:11476:2: note: Loop condition is true.  Entering loop body
           while (1) {
           ^
   fs/io_uring.c:11480:8: note: 'task' is null
                   if (!task) {
                        ^~~~
   fs/io_uring.c:11480:3: note: Taking true branch
                   if (!task) {
                   ^
   fs/io_uring.c:11493:8: note: Assuming the condition is true
                   if ((!(ctx->flags & IORING_SETUP_SQPOLL) && cancel_all) =
||
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:11493:8: note: Left side of '&&' is true
   fs/io_uring.c:11493:47: note: 'cancel_all' is true
                   if ((!(ctx->flags & IORING_SETUP_SQPOLL) && cancel_all) =
||
                                                               ^~~~~~~~~~
   fs/io_uring.c:11493:59: note: Left side of '||' is true
                   if ((!(ctx->flags & IORING_SETUP_SQPOLL) && cancel_all) =
||
                                                                           ^
   fs/io_uring.c:11495:12: note: Left side of '||' is false
                           while (!wq_list_empty(&ctx->iopoll_list)) {
                                   ^
   fs/io-wq.h:38:30: note: expanded from macro 'wq_list_empty'
   #define wq_list_empty(list)     (READ_ONCE((list)->first) =3D=3D NULL)
                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:325:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   fs/io_uring.c:11495:12: note: Left side of '||' is false
                           while (!wq_list_empty(&ctx->iopoll_list)) {
                                   ^
   fs/io-wq.h:38:30: note: expanded from macro 'wq_list_empty'
   #define wq_list_empty(list)     (READ_ONCE((list)->first) =3D=3D NULL)
                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:325:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   fs/io_uring.c:11495:12: note: Left side of '||' is false
                           while (!wq_list_empty(&ctx->iopoll_list)) {
                                   ^
   fs/io-wq.h:38:30: note: expanded from macro 'wq_list_empty'
   #define wq_list_empty(list)     (READ_ONCE((list)->first) =3D=3D NULL)
                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:325:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   fs/io_uring.c:11495:12: note: Left side of '||' is true
                           while (!wq_list_empty(&ctx->iopoll_list)) {
                                   ^
   fs/io-wq.h:38:30: note: expanded from macro 'wq_list_empty'
   #define wq_list_empty(list)     (READ_ONCE((list)->first) =3D=3D NULL)
                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                                               ^
--
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   fs/libfs.c:837:2: warning: Call to function 'memcpy' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI=
.DeprecatedOrUnsafeBufferHandling]
           memcpy(to, from + pos, count);
           ^~~~~~
   fs/libfs.c:837:2: note: Call to function 'memcpy' is insecure as it does=
 not provide security checks introduced in the C11 standard. Replace with a=
nalogous functions that support length arguments or provides boundary check=
s such as 'memcpy_s' in case of C11
           memcpy(to, from + pos, count);
           ^~~~~~
   fs/libfs.c:1241:17: warning: Dereference of null pointer [clang-analyzer=
-core.NullDereference]
           inode->i_uid =3D current_fsuid();
                          ^
   include/linux/cred.h:387:27: note: expanded from macro 'current_fsuid'
   #define current_fsuid()         (current_cred_xxx(fsuid))
                                    ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cred.h:378:2: note: expanded from macro 'current_cred_xxx'
           current_cred()->xxx;                    \
           ^~~~~~~~~~~~~~
   include/linux/cred.h:299:28: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
   fs/libfs.c:1227:6: note: Assuming 'inode' is non-null
           if (!inode)
               ^~~~~~
   fs/libfs.c:1227:2: note: Taking false branch
           if (!inode)
           ^
   fs/libfs.c:1241:17: note: Left side of '&&' is false
           inode->i_uid =3D current_fsuid();
                          ^
   include/linux/cred.h:387:27: note: expanded from macro 'current_fsuid'
   #define current_fsuid()         (current_cred_xxx(fsuid))
                                    ^
   include/linux/cred.h:378:2: note: expanded from macro 'current_cred_xxx'
           current_cred()->xxx;                    \
           ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:595:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ^
   include/linux/rcupdate.h:399:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:348:48: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                                  ^
   fs/libfs.c:1241:17: note: Loop condition is false.  Exiting loop
           inode->i_uid =3D current_fsuid();
                          ^
   include/linux/cred.h:387:27: note: expanded from macro 'current_fsuid'
   #define current_fsuid()         (current_cred_xxx(fsuid))
                                    ^
   include/linux/cred.h:378:2: note: expanded from macro 'current_cred_xxx'
           current_cred()->xxx;                    \
           ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:595:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ^
   include/linux/rcupdate.h:399:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:348:32: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                  ^
   fs/libfs.c:1241:17: note: Dereference of null pointer
           inode->i_uid =3D current_fsuid();
                          ^
   include/linux/cred.h:387:27: note: expanded from macro 'current_fsuid'
   #define current_fsuid()         (current_cred_xxx(fsuid))
                                    ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cred.h:378:2: note: expanded from macro 'current_cred_xxx'
           current_cred()->xxx;                    \
           ^~~~~~~~~~~~~~
   include/linux/cred.h:299:28: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer=
 [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/libfs.c:196:2: note: Taking false branch
           if (!dir_emit_dots(file, ctx))
           ^
   fs/libfs.c:199:6: note: Assuming field 'pos' is equal to 2
           if (ctx->pos =3D=3D 2)
               ^~~~~~~~~~~~~
   fs/libfs.c:199:2: note: Taking true branch
           if (ctx->pos =3D=3D 2)
           ^
   fs/libfs.c:206:17: note: Calling 'scan_positives'
           while ((next =3D scan_positives(cursor, p, 1, next)) !=3D NULL) {
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/libfs.c:110:2: note: Loop condition is true.  Entering loop body
           while ((p =3D p->next) !=3D &dentry->d_subdirs) {
           ^
   fs/libfs.c:113:7: note: Assuming the condition is false
                   if (d->d_flags & DCACHE_DENTRY_CURSOR)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/libfs.c:113:3: note: Taking false branch
                   if (d->d_flags & DCACHE_DENTRY_CURSOR)
                   ^
   fs/libfs.c:115:26: note: Left side of '&&' is false
                   if (simple_positive(d) && !--count) {
                                          ^
   fs/libfs.c:124:7: note: Calling 'need_resched'
                   if (need_resched()) {
                       ^~~~~~~~~~~~~~
   include/linux/sched.h:2196:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/tty/vt/selection.c:123:2: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(inwordLut, tmplut, sizeof(inwordLut));
           ^~~~~~
   drivers/tty/vt/selection.c:123:2: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
           memcpy(inwordLut, tmplut, sizeof(inwordLut));
           ^~~~~~
   drivers/tty/vt/selection.c:380:26: warning: Dereference of null pointer =
[clang-analyzer-core.NullDereference]
           DECLARE_WAITQUEUE(wait, current);
                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/wait.h:55:63: note: expanded from macro 'DECLARE_WAITQUEUE'
           struct wait_queue_entry name =3D __WAITQUEUE_INITIALIZER(name, t=
sk)
                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/wait.h:50:13: note: expanded from macro '__WAITQUEUE_INITI=
ALIZER'
           .private        =3D tsk,                                        =
          \
                             ^~~
   drivers/tty/vt/selection.c:380:26: note: Dereference of null pointer
           DECLARE_WAITQUEUE(wait, current);
                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/wait.h:55:63: note: expanded from macro 'DECLARE_WAITQUEUE'
           struct wait_queue_entry name =3D __WAITQUEUE_INITIALIZER(name, t=
sk)
                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/wait.h:50:13: note: expanded from macro '__WAITQUEUE_INITI=
ALIZER'
           .private        =3D tsk,                                        =
          \
                             ^~~
   Suppressed 51 warnings (39 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   drivers/tty/vt/keyboard.c:210:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(d.ke.scancode, &scancode, sizeof(scancode));
--
                                                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/parport/daisy.c:147:9: note: 'extra' is null
                           if (!extra) {
                                ^~~~~
   drivers/parport/daisy.c:147:4: note: Taking true branch
                           if (!extra) {
                           ^
   drivers/parport/daisy.c:148:24: note: Dereference of null pointer
                                   if (signal_pending(current))
                                                      ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/parport/daisy.c:249:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&par_cb, 0, sizeof(par_cb));
           ^~~~~~
   drivers/parport/daisy.c:249:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(&par_cb, 0, sizeof(par_cb));
           ^~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   fs/fs-writeback.c:1455:2: warning: Dereference of null pointer [clang-an=
alyzer-core.NullDereference]
           DEFINE_WAIT_BIT(wq, &inode->i_state, __I_SYNC);
           ^
   include/linux/wait_bit.h:42:15: note: expanded from macro 'DEFINE_WAIT_B=
IT'
                           .private        =3D current,                    =
          \
                                             ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/fs-writeback.c:1473:2: note: Calling '__inode_wait_for_writeback'
           __inode_wait_for_writeback(inode);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:1455:2: note: Dereference of null pointer
           DEFINE_WAIT_BIT(wq, &inode->i_state, __I_SYNC);
           ^
   include/linux/wait_bit.h:42:15: note: expanded from macro 'DEFINE_WAIT_B=
IT'
                           .private        =3D current,                    =
          \
                                             ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/fs-writeback.c:1485:2: warning: Dereference of null pointer [clang-an=
alyzer-core.NullDereference]
           DEFINE_WAIT(wait);
           ^
   include/linux/wait.h:1179:27: note: expanded from macro 'DEFINE_WAIT'
   #define DEFINE_WAIT(name) DEFINE_WAIT_FUNC(name, autoremove_wake_functio=
n)
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/wait.h:1174:14: note: expanded from macro 'DEFINE_WAIT_FUN=
C'
                   .private        =3D current,                            =
          \
                                     ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/fs-writeback.c:1485:2: note: Dereference of null pointer
           DEFINE_WAIT(wait);
           ^
   include/linux/wait.h:1179:27: note: expanded from macro 'DEFINE_WAIT'
   #define DEFINE_WAIT(name) DEFINE_WAIT_FUNC(name, autoremove_wake_functio=
n)
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/wait.h:1174:14: note: expanded from macro 'DEFINE_WAIT_FUN=
C'
                   .private        =3D current,                            =
          \
                                     ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/fs-writeback.c:2276:17: warning: Dereference of null pointer [clang-a=
nalyzer-core.NullDereference]
           blk_flush_plug(current->plug, true);
                          ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/fs-writeback.c:2276:17: note: Dereference of null pointer
           blk_flush_plug(current->plug, true);
                          ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer=
 [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/fs-writeback.c:2213:13: note: Assuming the condition is false
           if (likely(!current_is_workqueue_rescuer() ||
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/fs-writeback.c:2213:13: note: Left side of '||' is false
           if (likely(!current_is_workqueue_rescuer() ||
                      ^
   fs/fs-writeback.c:2214:6: note: Assuming the condition is false
                      !test_bit(WB_registered, &wb->state))) {
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/fs-writeback.c:2213:2: note: Taking false branch
           if (likely(!current_is_workqueue_rescuer() ||
           ^
   fs/fs-writeback.c:2231:19: note: Calling 'writeback_inodes_wb'
                   pages_written =3D writeback_inodes_wb(wb, 1024,
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:1964:6: note: Assuming the condition is false
           if (list_empty(&wb->b_io))
               ^~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:1964:2: note: Taking false branch
           if (list_empty(&wb->b_io))
           ^
   fs/fs-writeback.c:1966:2: note: Calling '__writeback_inodes_wb'
           __writeback_inodes_wb(wb, &work);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:1923:2: note: Loop condition is true.  Entering loop b=
ody
           while (!list_empty(&wb->b_io)) {
           ^
   fs/fs-writeback.c:1927:7: note: Assuming the condition is false
                   if (!trylock_super(sb)) {
                       ^~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:1927:3: note: Taking false branch
                   if (!trylock_super(sb)) {
                   ^
   fs/fs-writeback.c:1936:12: note: Calling 'writeback_sb_inodes'
                   wrote +=3D writeback_sb_inodes(sb, wb, work);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:1790:2: note: Loop condition is true.  Entering loop b=
ody
           while (!list_empty(&wb->b_io)) {
           ^
   fs/fs-writeback.c:1795:22: note: 'sb' is equal to field 'i_sb'
                   if (inode->i_sb !=3D sb) {
                                      ^~
   fs/fs-writeback.c:1795:3: note: Taking false branch
                   if (inode->i_sb !=3D sb) {
                   ^
   fs/fs-writeback.c:1820:7: note: Assuming the condition is false
                   if (inode->i_state & (I_NEW | I_FREEING | I_WILL_FREE)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:1820:3: note: Taking false branch
                   if (inode->i_state & (I_NEW | I_FREEING | I_WILL_FREE)) {
                   ^
   fs/fs-writeback.c:1825:8: note: Assuming the condition is false
                   if ((inode->i_state & I_SYNC) && wbc.sync_mode !=3D WB_S=
YNC_ALL) {
                        ^~~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:1825:33: note: Left side of '&&' is false
                   if ((inode->i_state & I_SYNC) && wbc.sync_mode !=3D WB_S=
YNC_ALL) {
                                                 ^
   fs/fs-writeback.c:1847:3: note: Taking false branch
                   if (inode->i_state & I_SYNC) {
                   ^
   fs/fs-writeback.c:1870:11: note: Assuming 'wrote' is < 0
                   wrote =3D wrote < 0 ? 0 : wrote;
                           ^~~~~~~~~
   fs/fs-writeback.c:1870:11: note: '?' condition is true
   fs/fs-writeback.c:1873:7: note: Calling 'need_resched'
                   if (need_resched()) {
                       ^~~~~~~~~~~~~~
   include/linux/sched.h:2196:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
--
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:358:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:330:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/dcache.c:2638:2: note: Taking false branch
           if (unlikely(READ_ONCE(parent->d_inode->i_dir_seq) !=3D seq)) {
           ^
   fs/dcache.c:2650:34: note: Assuming 'node' is non-null
           hlist_bl_for_each_entry(dentry, node, b, d_u.d_in_lookup_hash) {
                                           ^
   include/linux/list_bl.h:171:7: note: expanded from macro 'hlist_bl_for_e=
ach_entry'
                pos &&                                                     \
                ^~~
   fs/dcache.c:2650:34: note: Left side of '&&' is true
           hlist_bl_for_each_entry(dentry, node, b, d_u.d_in_lookup_hash) {
                                           ^
   fs/dcache.c:2650:2: note: Loop condition is true.  Entering loop body
           hlist_bl_for_each_entry(dentry, node, b, d_u.d_in_lookup_hash) {
           ^
   include/linux/list_bl.h:170:2: note: expanded from macro 'hlist_bl_for_e=
ach_entry'
           for (pos =3D hlist_bl_first(head);                              =
  \
           ^
   fs/dcache.c:2651:7: note: Assuming 'hash' is equal to field 'hash'
                   if (dentry->d_name.hash !=3D hash)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/dcache.c:2651:3: note: Taking false branch
                   if (dentry->d_name.hash !=3D hash)
                   ^
   fs/dcache.c:2653:7: note: Assuming 'parent' is equal to field 'd_parent'
                   if (dentry->d_parent !=3D parent)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/dcache.c:2653:3: note: Taking false branch
                   if (dentry->d_parent !=3D parent)
                   ^
   fs/dcache.c:2655:3: note: Taking false branch
                   if (!d_same_name(dentry, parent, name))
                   ^
   fs/dcache.c:2659:7: note: Assuming the condition is false
                   if (!lockref_get_not_dead(&dentry->d_lockref)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/dcache.c:2659:3: note: Taking false branch
                   if (!lockref_get_not_dead(&dentry->d_lockref)) {
                   ^
   fs/dcache.c:2670:3: note: Calling 'd_wait_lookup'
                   d_wait_lookup(dentry);
                   ^~~~~~~~~~~~~~~~~~~~~
   fs/dcache.c:2582:6: note: Assuming the condition is true
           if (d_in_lookup(dentry)) {
               ^~~~~~~~~~~~~~~~~~~
   fs/dcache.c:2582:2: note: Taking true branch
           if (d_in_lookup(dentry)) {
           ^
   fs/dcache.c:2583:27: note: Dereference of null pointer
                   DECLARE_WAITQUEUE(wait, current);
                                           ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/wait.h:55:63: note: expanded from macro 'DECLARE_WAITQUEUE'
           struct wait_queue_entry name =3D __WAITQUEUE_INITIALIZER(name, t=
sk)
                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/wait.h:50:13: note: expanded from macro '__WAITQUEUE_INITI=
ALIZER'
           .private        =3D tsk,                                        =
          \
                             ^~~
   fs/dcache.c:2825:4: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(target->d_iname, dentry->d_name.name,
                           ^~~~~~
   fs/dcache.c:2825:4: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
                           memcpy(target->d_iname, dentry->d_name.name,
                           ^~~~~~
   fs/dcache.c:2836:4: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(dentry->d_iname, target->d_name.name,
                           ^~~~~~
   fs/dcache.c:2836:4: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
                           memcpy(dentry->d_iname, target->d_name.name,
                           ^~~~~~
   fs/dcache.c:2864:3: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dentry->d_iname, target->d_name.name,
                   ^~~~~~
   fs/dcache.c:2864:3: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
                   memcpy(dentry->d_iname, target->d_name.name,
                   ^~~~~~
   fs/dcache.c:3204:23: warning: Call to function 'sprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           dentry->d_name.len =3D sprintf(dentry->d_iname, "#%llu",
                                ^~~~~~~
   fs/dcache.c:3204:23: note: Call to function 'sprintf' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'sprintf_s' in case of C11
           dentry->d_name.len =3D sprintf(dentry->d_iname, "#%llu",
                                ^~~~~~~
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer=
 [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/dcache.c:1558:6: note: Assuming 'dentry' is not equal to field 'start'
           if (data->start =3D=3D dentry)
               ^~~~~~~~~~~~~~~~~~~~~
   fs/dcache.c:1558:2: note: Taking false branch
           if (data->start =3D=3D dentry)
           ^
   fs/dcache.c:1561:6: note: Assuming the condition is true
           if (dentry->d_flags & DCACHE_SHRINK_LIST) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/dcache.c:1561:2: note: Taking true branch
           if (dentry->d_flags & DCACHE_SHRINK_LIST) {
           ^
   fs/dcache.c:1576:6: note: Assuming the condition is true
           if (!list_empty(&data->dispose))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/dcache.c:1576:2: note: Taking true branch
           if (!list_empty(&data->dispose))
           ^
   fs/dcache.c:1577:9: note: Calling 'need_resched'
                   ret =3D need_resched() ? D_WALK_QUIT : D_WALK_NORETRY;
                         ^~~~~~~~~~~~~~
   include/linux/sched.h:2196:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 51 warnings (39 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   64 warnings generated.
   drivers/video/fbdev/matrox/matroxfb_g450.c:157:3: warning: Call to funct=
ion 'sprintf' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'sprintf_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(p->name, "Ctrl #%08X", i);
                   ^~~~~~~
   drivers/video/fbdev/matrox/matroxfb_g450.c:157:3: note: Call to function=
 'sprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(p->name, "Ctrl #%08X", i);
                   ^~~~~~~
   drivers/video/fbdev/matrox/matroxfb_g450.c:277:2: warning: Value stored =
to 'chromasc' is never read [clang-analyzer-deadcode.DeadStores]
           chromasc =3D piic;
           ^          ~~~~
   drivers/video/fbdev/matrox/matroxfb_g450.c:277:2: note: Value stored to =
'chromasc' is never read
           chromasc =3D piic;
           ^          ~~~~
   Suppressed 62 warnings (50 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   drivers/video/fbdev/matrox/matroxfb_crtc2.c:407:2: warning: Call to func=
tion 'memset' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memset_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(vblank, 0, sizeof(*vblank));
           ^~~~~~
   drivers/video/fbdev/matrox/matroxfb_crtc2.c:407:2: note: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11
           memset(vblank, 0, sizeof(*vblank));
           ^~~~~~
   Suppressed 62 warnings (50 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   drivers/video/fbdev/matrox/i2c-matroxfb.c:112:2: warning: Call to functi=
on 'snprintf' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'snprintf_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(b->adapter.name, sizeof(b->adapter.name), name,
           ^~~~~~~~
   drivers/video/fbdev/matrox/i2c-matroxfb.c:112:2: note: Call to function =
'snprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(b->adapter.name, sizeof(b->adapter.name), name,
           ^~~~~~~~
   Suppressed 62 warnings (50 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/pci/setup-bus.c:87:2: warning: Use of memory after it is freed [=
clang-analyzer-unix.Malloc]
           list_for_each_entry_safe(dev_res, tmp, head, list) {
           ^
   include/linux/list.h:762:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
--
               ^~~~~~~~~~~~~~~
   drivers/video/fbdev/smscufx.c:1134:6: warning: Value stored to 'node' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           int node =3D info->node;
               ^~~~   ~~~~~~~~~~
   drivers/video/fbdev/smscufx.c:1134:6: note: Value stored to 'node' durin=
g its initialization is never read
           int node =3D info->node;
               ^~~~   ~~~~~~~~~~
   drivers/video/fbdev/smscufx.c:1311:4: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(new_fb, old_fb, old_len);
                           ^~~~~~
   drivers/video/fbdev/smscufx.c:1311:4: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(new_fb, old_fb, old_len);
                           ^~~~~~
   drivers/video/fbdev/smscufx.c:1435:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(edid, 0xff, EDID_LENGTH);
           ^~~~~~
   drivers/video/fbdev/smscufx.c:1435:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(edid, 0xff, EDID_LENGTH);
           ^~~~~~
   drivers/video/fbdev/smscufx.c:1498:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&info->monspecs, 0, sizeof(info->monspecs));
           ^~~~~~
   drivers/video/fbdev/smscufx.c:1498:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(&info->monspecs, 0, sizeof(info->monspecs));
           ^~~~~~
   drivers/video/fbdev/smscufx.c:1532:5: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(edid, default_edid, default_edid_=
size);
                                   ^~~~~~
   drivers/video/fbdev/smscufx.c:1532:5: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(edid, default_edid, default_edid_=
size);
                                   ^~~~~~
   drivers/video/fbdev/smscufx.c:1589:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&info->fix, &ufx_fix, sizeof(ufx_fix));
                   ^~~~~~
   drivers/video/fbdev/smscufx.c:1589:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&info->fix, &ufx_fix, sizeof(ufx_fix));
                   ^~~~~~
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   97 warnings generated.
   include/linux/math64.h:28:24: warning: Division by zero [clang-analyzer-=
core.DivideZero]
           *remainder =3D dividend % divisor;
                                 ^
   kernel/sched/fair.c:11379:2: note: Calling 'attach_task_cfs_rq'
           attach_task_cfs_rq(p);
           ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11366:2: note: Calling 'attach_entity_cfs_rq'
           attach_entity_cfs_rq(se);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11338:30: note: '?' condition is true
           update_load_avg(cfs_rq, se, sched_feat(ATTACH_AGE_LOAD) ? 0 : SK=
IP_AGE_LOAD);
                                       ^
   kernel/sched/sched.h:1996:23: note: expanded from macro 'sched_feat'
   #define sched_feat(x) !!(sysctl_sched_features & (1UL << __SCHED_FEAT_##=
x))
                         ^
   kernel/sched/fair.c:11339:2: note: Calling 'attach_entity_load_avg'
           attach_entity_load_avg(cfs_rq, se);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:3845:6: note: Assuming the condition is true
           if (se_weight(se) < se->avg.load_sum)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:3845:2: note: Taking true branch
           if (se_weight(se) < se->avg.load_sum)
           ^
   kernel/sched/fair.c:3846:48: note: Calling 'se_weight'
                   se->avg.load_sum =3D div_u64(se->avg.load_sum, se_weight=
(se));
                                                                ^~~~~~~~~~~=
~~
   kernel/sched/sched.h:765:9: note: '__w' is 0
           return scale_load_down(se->load.weight);
                  ^
   kernel/sched/sched.h:147:6: note: expanded from macro 'scale_load_down'
           if (__w) \
               ^~~
   kernel/sched/sched.h:765:9: note: Taking false branch
           return scale_load_down(se->load.weight);
                  ^
   kernel/sched/sched.h:147:2: note: expanded from macro 'scale_load_down'
           if (__w) \
           ^
   kernel/sched/sched.h:765:2: note: Returning zero
           return scale_load_down(se->load.weight);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:3846:48: note: Returning from 'se_weight'
                   se->avg.load_sum =3D div_u64(se->avg.load_sum, se_weight=
(se));
                                                                ^~~~~~~~~~~=
~~
   kernel/sched/fair.c:3846:48: note: Passing the value 0 via 2nd parameter=
 'divisor'
                   se->avg.load_sum =3D div_u64(se->avg.load_sum, se_weight=
(se));
                                                                ^~~~~~~~~~~=
~~
   kernel/sched/fair.c:3846:22: note: Calling 'div_u64'
                   se->avg.load_sum =3D div_u64(se->avg.load_sum, se_weight=
(se));
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/math64.h:128:31: note: Passing the value 0 via 2nd paramet=
er 'divisor'
           return div_u64_rem(dividend, divisor, &remainder);
                                        ^~~~~~~
   include/linux/math64.h:128:9: note: Calling 'div_u64_rem'
           return div_u64_rem(dividend, divisor, &remainder);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math64.h:28:24: note: Division by zero
           *remainder =3D dividend % divisor;
                        ~~~~~~~~~^~~~~~~~~
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer=
 [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/sched/fair.c:10814:48: note: Loop condition is false.  Exiting lo=
op
           flags =3D atomic_fetch_andnot(NOHZ_NEWILB_KICK, nohz_flags(cpu));
                                                         ^
   kernel/sched/sched.h:2744:27: note: expanded from macro 'nohz_flags'
   #define nohz_flags(cpu) (&cpu_rq(cpu)->nohz_flags)
                             ^
   kernel/sched/sched.h:1353:24: note: expanded from macro 'cpu_rq'
   #define cpu_rq(cpu)             (&per_cpu(runqueues, (cpu)))
                                     ^
   include/linux/percpu-defs.h:269:29: note: expanded from macro 'per_cpu'
   #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
                                     ^
   include/linux/percpu-defs.h:235:2: note: expanded from macro 'per_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   kernel/sched/fair.c:10820:7: note: Assuming the condition is true
           if ((flags =3D=3D NOHZ_NEWILB_KICK) && !need_resched())
                ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:10820:6: note: Left side of '&&' is true
           if ((flags =3D=3D NOHZ_NEWILB_KICK) && !need_resched())
               ^
   kernel/sched/fair.c:10820:38: note: Calling 'need_resched'
           if ((flags =3D=3D NOHZ_NEWILB_KICK) && !need_resched())
                                               ^~~~~~~~~~~~~~
   include/linux/sched.h:2196:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/trace/events/sched.h:718:1: warning: Dereference of null pointer=
 [clang-analyzer-core.NullDereference]
   DECLARE_TRACE(sched_cpu_capacity_tp,
   ^
   include/linux/tracepoint.h:420:15: note: expanded from macro 'DECLARE_TR=
ACE'
                           cpu_online(raw_smp_processor_id()),             \
                                      ^
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   kernel/sched/fair.c:9503:2: note: Calling 'update_sd_lb_stats'
           update_sd_lb_stats(env, &sds);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:9244:7: note: Assuming 'local_group' is not equal to=
 0
                   if (local_group) {
                       ^~~~~~~~~~~
   kernel/sched/fair.c:9244:3: note: Taking true branch
                   if (local_group) {
                   ^
   kernel/sched/fair.c:9248:8: note: Assuming field 'idle' is not equal to =
CPU_NEWLY_IDLE
                           if (env->idle !=3D CPU_NEWLY_IDLE ||
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:9248:36: note: Left side of '||' is true
                           if (env->idle !=3D CPU_NEWLY_IDLE ||
                                                           ^
   kernel/sched/fair.c:9250:5: note: Calling 'update_group_capacity'
                                   update_group_capacity(env->sd, env->dst_=
cpu);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   kernel/sched/fair.c:8395:13: note: Assuming '__UNIQUE_ID___x527' is <=3D=
 '__UNIQUE_ID___y528'
           interval =3D clamp(interval, 1UL, max_load_balance_interval);
                      ^
   include/linux/minmax.h:89:45: note: expanded from macro 'clamp'
   #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/minmax.h:45:33: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ~~~~~~~~~~~~~~^~~~~~~~
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
--
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/misc/habanalabs/common/command_submission.c:2994:2: note: Loop c=
ondition is false.  Exiting loop
           spin_lock_irqsave(&interrupt->wait_list_lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/misc/habanalabs/common/command_submission.c:2999:6: note: Assumi=
ng the condition is false
           if (*pend->cq_kernel_addr >=3D target_value) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2999:2: note: Taking=
 false branch
           if (*pend->cq_kernel_addr >=3D target_value) {
           ^
   drivers/misc/habanalabs/common/command_submission.c:3013:14: note: 'time=
out_us' is not equal to 0, which participates in a condition later
           } else if (!timeout_us) {
                       ^~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:3013:9: note: Taking=
 false branch
           } else if (!timeout_us) {
                  ^
   drivers/misc/habanalabs/common/command_submission.c:3029:6: note: 'regis=
ter_ts_record' is true
           if (register_ts_record) {
               ^~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:3029:2: note: Taking=
 true branch
           if (register_ts_record) {
           ^
   drivers/misc/habanalabs/common/command_submission.c:3031:3: note: Contro=
l jumps to line 3080
                   goto ts_registration_exit;
                   ^
   drivers/misc/habanalabs/common/command_submission.c:3082:2: note: Return=
ing without writing to '*timestamp'
           return rc;
           ^
   drivers/misc/habanalabs/common/command_submission.c:3082:2: note: Return=
ing zero (loaded from 'rc'), which participates in a condition later
           return rc;
           ^~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:3247:8: note: Return=
ing from '_hl_interrupt_wait_ioctl'
                   rc =3D _hl_interrupt_wait_ioctl(hdev, hpriv->ctx, &hpriv=
->mem_mgr, &hpriv->mem_mgr,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:3259:6: note: 'rc' i=
s 0
           if (rc)
               ^~
   drivers/misc/habanalabs/common/command_submission.c:3259:2: note: Taking=
 false branch
           if (rc)
           ^
   drivers/misc/habanalabs/common/command_submission.c:3265:6: note: Branch=
 condition evaluates to a garbage value
           if (timestamp) {
               ^~~~~~~~~
   Suppressed 80 warnings (68 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   68 warnings generated.
   drivers/usb/core/message.c:286:3: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(driver_data, data, size);
                   ^~~~~~
   drivers/usb/core/message.c:286:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(driver_data, data, size);
                   ^~~~~~
   drivers/usb/core/message.c:789:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0, size);   /* Make sure we parse really received da=
ta */
           ^~~~~~
   drivers/usb/core/message.c:789:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(buf, 0, size);   /* Make sure we parse really received da=
ta */
           ^~~~~~
   drivers/usb/core/message.c:1034:4: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(smallbuf, buf, len);
                           ^~~~~~
   drivers/usb/core/message.c:1034:4: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                           memcpy(smallbuf, buf, len);
                           ^~~~~~
   drivers/usb/core/message.c:1073:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&dev->descriptor, desc, size);
                   ^~~~~~
   drivers/usb/core/message.c:1073:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&dev->descriptor, desc, size);
                   ^~~~~~
   drivers/usb/core/message.c:1709:2: warning: Value stored to 'retval' is =
never read [clang-analyzer-deadcode.DeadStores]
           retval =3D 0;
           ^        ~
   drivers/usb/core/message.c:1709:2: note: Value stored to 'retval' is nev=
er read
           retval =3D 0;
           ^        ~
   drivers/usb/core/message.c:2301:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(hdr, 0x00, sizeof(struct usb_cdc_parsed_header));
           ^~~~~~
   drivers/usb/core/message.c:2301:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(hdr, 0x00, sizeof(struct usb_cdc_parsed_header));
           ^~~~~~
   Suppressed 62 warnings (50 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
   Suppressed 65 warnings (50 in non-user code, 15 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   Suppressed 62 warnings (50 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer=
 [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/locking/mutex.c:444:6: note: Assuming 'waiter' is null
           if (!waiter) {
               ^~~~~~~
   kernel/locking/mutex.c:444:2: note: Taking true branch
           if (!waiter) {
           ^
   kernel/locking/mutex.c:452:8: note: Calling 'mutex_can_spin_on_owner'
                   if (!mutex_can_spin_on_owner(lock))
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/mutex.c:397:2: note: Loop condition is false.  Exiting lo=
op
           lockdep_assert_preemption_disabled();
           ^
   include/linux/lockdep.h:633:47: note: expanded from macro 'lockdep_asser=
t_preemption_disabled'
   # define lockdep_assert_preemption_disabled() do { } while (0)
                                                 ^
   kernel/locking/mutex.c:399:6: note: Calling 'need_resched'
           if (need_resched())
               ^~~~~~~~~~~~~~
   include/linux/sched.h:2196:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/locking/mutex.c:105:45: warning: Dereference of null pointer [cla=
ng-analyzer-core.NullDereference]
           unsigned long owner, curr =3D (unsigned long)current;
                                                      ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/locking/mutex.c:144:10: note: Calling '__mutex_trylock_common'
           return !__mutex_trylock_common(lock, handoff);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/mutex.c:105:45: note: Dereference of null pointer
           unsigned long owner, curr =3D (unsigned long)current;
                                                      ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/locking/mutex.c:208:39: warning: Dereference of null pointer [cla=
ng-analyzer-core.NullDereference]
           debug_mutex_add_waiter(lock, waiter, current);
                                                ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/locking/mutex.c:208:39: note: Dereference of null pointer
           debug_mutex_add_waiter(lock, waiter, current);
                                                ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/locking/mutex.c:222:42: warning: Dereference of null pointer [cla=
ng-analyzer-core.NullDereference]
           debug_mutex_remove_waiter(lock, waiter, current);
                                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/locking/mutex.c:219:6: note: Assuming the condition is false
           if (likely(list_empty(&lock->wait_list)))
               ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
--
                                     ^
   include/linux/percpu-rwsem.h:82:3: note: Loop condition is false.  Exiti=
ng loop
                   this_cpu_inc(*sem->read_count);
                   ^
   include/linux/percpu-defs.h:520:28: note: expanded from macro 'this_cpu_=
inc'
   #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_=
add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, =
pcp, val)
                                           ^
   include/linux/percpu-defs.h:379:11: note: expanded from macro '__pcpu_si=
ze_call'
                   case 4: stem##4(variable, __VA_ARGS__);break;           \
                           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   arch/s390/include/asm/percpu.h:72:10: note: expanded from macro 'arch_th=
is_cpu_add'
           ptr__ =3D raw_cpu_ptr(&(pcp));                            \
                   ^
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   include/linux/percpu-rwsem.h:82:3: note: Dereference of null pointer
                   this_cpu_inc(*sem->read_count);
                   ^
   include/linux/percpu-defs.h:520:28: note: expanded from macro 'this_cpu_=
inc'
   #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
                                           ^~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_=
add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, =
pcp, val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   include/linux/percpu-defs.h:379:11: note: expanded from macro '__pcpu_si=
ze_call'
                   case 4: stem##4(variable, __VA_ARGS__);break;           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^~~~~
   include/linux/swap.h:39:9: warning: Dereference of null pointer [clang-a=
nalyzer-core.NullDereference]
           return current->flags & PF_KSWAPD;
                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/inode.c:825:6: note: Assuming the condition is false
           if (!spin_trylock(&inode->i_lock))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/inode.c:825:2: note: Taking false branch
           if (!spin_trylock(&inode->i_lock))
           ^
   fs/inode.c:834:6: note: Assuming the condition is false
           if (atomic_read(&inode->i_count) ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/inode.c:834:6: note: Left side of '||' is false
   fs/inode.c:835:7: note: Assuming the condition is false
               (inode->i_state & ~I_REFERENCED) ||
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/inode.c:834:6: note: Left side of '||' is false
           if (atomic_read(&inode->i_count) ||
               ^
   fs/inode.c:834:2: note: Taking false branch
           if (atomic_read(&inode->i_count) ||
           ^
   fs/inode.c:844:6: note: Assuming the condition is false
           if (inode->i_state & I_REFERENCED) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/inode.c:844:2: note: Taking false branch
           if (inode->i_state & I_REFERENCED) {
           ^
   fs/inode.c:855:6: note: Left side of '||' is false
           if (inode_has_buffers(inode) || !mapping_empty(&inode->i_data)) {
               ^
   fs/inode.c:855:2: note: Taking true branch
           if (inode_has_buffers(inode) || !mapping_empty(&inode->i_data)) {
           ^
   fs/inode.c:859:3: note: Taking true branch
                   if (remove_inode_buffers(inode)) {
                   ^
   fs/inode.c:862:8: note: Calling 'current_is_kswapd'
                           if (current_is_kswapd())
                               ^~~~~~~~~~~~~~~~~~~
   include/linux/swap.h:39:9: note: Dereference of null pointer
           return current->flags & PF_KSWAPD;
                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer=
 [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/inode.c:718:2: note: Loop condition is true.  Entering loop body
           list_for_each_entry_safe(inode, next, &sb->s_inodes, i_sb_list) {
           ^
   include/linux/list.h:761:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   fs/inode.c:719:7: note: Assuming the condition is false
                   if (atomic_read(&inode->i_count))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/inode.c:719:3: note: Taking false branch
                   if (atomic_read(&inode->i_count))
                   ^
   fs/inode.c:723:7: note: Assuming the condition is false
                   if (inode->i_state & (I_NEW | I_FREEING | I_WILL_FREE)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/inode.c:723:3: note: Taking false branch
                   if (inode->i_state & (I_NEW | I_FREEING | I_WILL_FREE)) {
                   ^
   fs/inode.c:738:7: note: Calling 'need_resched'
                   if (need_resched()) {
                       ^~~~~~~~~~~~~~
   include/linux/sched.h:2196:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 60 warnings (48 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   drivers/usb/musb/musb_debugfs.c:171:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0x00, sizeof(buf));
           ^~~~~~
   drivers/usb/musb/musb_debugfs.c:171:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(buf, 0x00, sizeof(buf));
           ^~~~~~
   drivers/usb/musb/musb_debugfs.c:271:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0x00, sizeof(buf));
           ^~~~~~
   drivers/usb/musb/musb_debugfs.c:271:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(buf, 0x00, sizeof(buf));
           ^~~~~~
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   103 warnings generated.
   drivers/usb/usbip/usbip_common.c:39:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lx\n", usbip_debug_flag);
                  ^~~~~~~
   drivers/usb/usbip/usbip_common.c:39:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lx\n", usbip_debug_flag);
                  ^~~~~~~
   drivers/usb/usbip/usbip_common.c:46:6: warning: Call to function 'sscanf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(buf, "%lx", &usbip_debug_flag) !=3D 1)
               ^~~~~~
   drivers/usb/usbip/usbip_common.c:46:6: note: Call to function 'sscanf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(buf, "%lx", &usbip_debug_flag) !=3D 1)
               ^~~~~~
   drivers/usb/usbip/usbip_common.c:61:16: warning: Value stored to 'ep' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned char ep   =3D usb_pipeendpoint(p);
                         ^~
   drivers/usb/usbip/usbip_common.c:61:16: note: Value stored to 'ep' durin=
g its initialization is never read
           unsigned char ep   =3D usb_pipeendpoint(p);
                         ^~
   drivers/usb/usbip/usbip_common.c:62:16: warning: Value stored to 'dev' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned char dev  =3D usb_pipedevice(p);
                         ^~~
   drivers/usb/usbip/usbip_common.c:62:16: note: Value stored to 'dev' duri=
ng its initialization is never read
           unsigned char dev  =3D usb_pipedevice(p);
                         ^~~
   drivers/usb/usbip/usbip_common.c:63:16: warning: Value stored to 'dir' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned char dir  =3D usb_pipein(p);
                         ^~~
   drivers/usb/usbip/usbip_common.c:63:16: note: Value stored to 'dir' duri=
ng its initialization is never read
           unsigned char dir  =3D usb_pipein(p);
                         ^~~
   drivers/usb/usbip/usbip_common.c:88:17: warning: Value stored to 'dev' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &udev->dev;
--
           ^~~~~~
   Suppressed 49 warnings (37 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   drivers/media/dvb-frontends/tda8083.c:431:2: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&state->frontend.ops, &tda8083_ops, sizeof(struct dvb_fro=
ntend_ops));
           ^~~~~~
   drivers/media/dvb-frontends/tda8083.c:431:2: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&state->frontend.ops, &tda8083_ops, sizeof(struct dvb_fro=
ntend_ops));
           ^~~~~~
   Suppressed 62 warnings (50 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   Suppressed 62 warnings (50 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/spi/spi-nxp-fspi.c:764:4: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&data, buf + i + j, 4);
                           ^~~~~~
   drivers/spi/spi-nxp-fspi.c:764:4: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&data, buf + i + j, 4);
                           ^~~~~~
   drivers/spi/spi-nxp-fspi.c:811:4: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(buf + j, &tmp, size);
                           ^~~~~~
   drivers/spi/spi-nxp-fspi.c:811:4: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                           memcpy(buf + j, &tmp, size);
                           ^~~~~~
   Suppressed 51 warnings (39 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (40 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   Suppressed 53 warnings (40 in non-user code, 13 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/spi/spi-pxa2xx-dma.c:86:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&cfg, 0, sizeof(cfg));
           ^~~~~~
   drivers/spi/spi-pxa2xx-dma.c:86:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(&cfg, 0, sizeof(cfg));
           ^~~~~~
   Suppressed 51 warnings (39 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   drivers/mfd/twl4030-irq.c:328:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0xff, sizeof(buf));
           ^~~~~~
   drivers/mfd/twl4030-irq.c:328:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(buf, 0xff, sizeof(buf));
           ^~~~~~
   Suppressed 50 warnings (38 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   Suppressed 60 warnings (48 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   Suppressed 60 warnings (48 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   drivers/mfd/mc13xxx-core.c:377:6: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(buf, sizeof(buf), format, name) > sizeof(buf))
               ^~~~~~~~
   drivers/mfd/mc13xxx-core.c:377:6: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
           if (snprintf(buf, sizeof(buf), format, name) > sizeof(buf))
               ^~~~~~~~
   Suppressed 49 warnings (37 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   Suppressed 60 warnings (48 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (47 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   Suppressed 62 warnings (50 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   kernel/locking/semaphore.c:215:16: warning: Dereference of null pointer =
[clang-analyzer-core.NullDereference]
           waiter.task =3D current;
                         ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/locking/semaphore.c:215:16: note: Dereference of null pointer
           waiter.task =3D current;
                         ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer=
 [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/locking/rwsem.c:1104:6: note: Calling 'rwsem_can_spin_on_owner'
           if (rwsem_can_spin_on_owner(sem) && rwsem_optimistic_spin(sem)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rwsem.c:698:6: note: Calling 'need_resched'
           if (need_resched()) {
               ^~~~~~~~~~~~~~
   include/linux/sched.h:2196:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/locking/rwsem.c:139:37: warning: Dereference of null pointer [cla=
ng-analyzer-core.NullDereference]
           atomic_long_set(&sem->owner, (long)current);
                                              ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/locking/rwsem.c:1659:2: note: Loop condition is false.  Exiting l=
oop
           might_sleep();
           ^
   include/linux/kernel.h:143:42: note: expanded from macro 'might_sleep'
           do { __might_sleep(__FILE__, __LINE__); might_resched(); } while=
 (0)
                                                   ^
   include/linux/kernel.h:120:26: note: expanded from macro 'might_resched'
   # define might_resched() do { } while (0)
                            ^
   kernel/locking/rwsem.c:1659:2: note: Loop condition is false.  Exiting l=
oop
           might_sleep();
           ^
   include/linux/kernel.h:143:2: note: expanded from macro 'might_sleep'
           do { __might_sleep(__FILE__, __LINE__); might_resched(); } while=
 (0)
           ^
   kernel/locking/rwsem.c:1663:7: note: Calling '__down_write_killable'
                                     __down_write_killable)) {
                                     ^
   include/linux/lockdep.h:480:2: note: expanded from macro 'LOCK_CONTENDED=
_RETURN'
           lock(_lock)
           ^~~~~~~~~~~
   kernel/locking/rwsem.c:1301:9: note: Calling '__down_write_common'
           return __down_write_common(sem, TASK_KILLABLE);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rwsem.c:1286:16: note: Calling 'rwsem_write_trylock'
           if (unlikely(!rwsem_write_trylock(sem))) {
                         ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   kernel/locking/rwsem.c:255:2: note: Taking true branch
           if (atomic_long_try_cmpxchg_acquire(&sem->count, &tmp, RWSEM_WRI=
TER_LOCKED)) {
           ^
   kernel/locking/rwsem.c:256:3: note: Calling 'rwsem_set_owner'
                   rwsem_set_owner(sem);
                   ^~~~~~~~~~~~~~~~~~~~
   kernel/locking/rwsem.c:139:37: note: Dereference of null pointer
           atomic_long_set(&sem->owner, (long)current);
                                              ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/locking/rwsem.c:176:32: warning: Dereference of null pointer [cla=
ng-analyzer-core.NullDereference]
           __rwsem_set_reader_owned(sem, current);
                                         ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/locking/rwsem.c:1605:2: note: Calling '__downgrade_write'
           __downgrade_write(sem);
--
                           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^
   net/core/dev.c:3602:2: note: Loop condition is true.  Entering loop body
           while (skb) {
           ^
   net/core/dev.c:3606:32: note: Assuming 'next' is equal to NULL
                   rc =3D xmit_one(skb, dev, txq, next !=3D NULL);
                                                ^~~~~~~~~~~~
   net/core/dev.c:3606:8: note: Calling 'xmit_one'
                   rc =3D xmit_one(skb, dev, txq, next !=3D NULL);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:3585:2: note: Taking true branch
           if (dev_nit_active(dev))
           ^
   net/core/dev.c:3590:7: note: Calling 'netdev_start_xmit'
           rc =3D netdev_start_xmit(skb, dev, txq, more);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netdevice.h:4819:7: note: Calling '__netdev_start_xmit'
           rc =3D __netdev_start_xmit(ops, skb, dev, more);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netdevice.h:4804:2: note: Loop condition is false.  Exitin=
g loop
           __this_cpu_write(softnet_data.xmit.more, more);
           ^
   include/linux/percpu-defs.h:452:2: note: expanded from macro '__this_cpu=
_write'
           raw_cpu_write(pcp, val);                                        \
           ^
   include/linux/percpu-defs.h:421:34: note: expanded from macro 'raw_cpu_w=
rite'
   #define raw_cpu_write(pcp, val)         __pcpu_size_call(raw_cpu_write_,=
 pcp, val)
                                           ^
   include/linux/percpu-defs.h:375:2: note: expanded from macro '__pcpu_siz=
e_call'
           __verify_pcpu_ptr(&(variable));                                 \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   include/linux/netdevice.h:4804:2: note: Control jumps to 'case 1:'  at l=
ine 4804
           __this_cpu_write(softnet_data.xmit.more, more);
           ^
   include/linux/percpu-defs.h:452:2: note: expanded from macro '__this_cpu=
_write'
           raw_cpu_write(pcp, val);                                        \
           ^
   include/linux/percpu-defs.h:421:34: note: expanded from macro 'raw_cpu_w=
rite'
   #define raw_cpu_write(pcp, val)         __pcpu_size_call(raw_cpu_write_,=
 pcp, val)
                                           ^
   include/linux/percpu-defs.h:376:2: note: expanded from macro '__pcpu_siz=
e_call'
           switch(sizeof(variable)) {                                      \
           ^
   include/linux/netdevice.h:4804:2: note: Loop condition is false.  Exitin=
g loop
           __this_cpu_write(softnet_data.xmit.more, more);
           ^
   include/linux/percpu-defs.h:452:2: note: expanded from macro '__this_cpu=
_write'
           raw_cpu_write(pcp, val);                                        \
           ^
   include/linux/percpu-defs.h:421:34: note: expanded from macro 'raw_cpu_w=
rite'
   #define raw_cpu_write(pcp, val)         __pcpu_size_call(raw_cpu_write_,=
 pcp, val)
                                           ^
   include/linux/percpu-defs.h:377:11: note: expanded from macro '__pcpu_si=
ze_call'
                   case 1: stem##1(variable, __VA_ARGS__);break;           \
                           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/percpu.h:72:3: note: expanded from macro 'raw_cpu_ge=
neric_to_op'
           *raw_cpu_ptr(&(pcp)) op val;                                    \
            ^
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   include/linux/netdevice.h:4804:2: note: Dereference of null pointer
           __this_cpu_write(softnet_data.xmit.more, more);
           ^
   include/linux/percpu-defs.h:452:2: note: expanded from macro '__this_cpu=
_write'
           raw_cpu_write(pcp, val);                                        \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:421:34: note: expanded from macro 'raw_cpu_w=
rite'
   #define raw_cpu_write(pcp, val)         __pcpu_size_call(raw_cpu_write_,=
 pcp, val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
   include/linux/percpu-defs.h:377:11: note: expanded from macro '__pcpu_si=
ze_call'
                   case 1: stem##1(variable, __VA_ARGS__);break;           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^~~~~
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer=
 [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->f=
lags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   net/core/dev.c:6176:29: note: Assuming 'loop_end' is non-null
           unsigned long start_time =3D loop_end ? busy_loop_current_time()=
 : 0;
                                      ^~~~~~~~
   net/core/dev.c:6176:29: note: '?' condition is true
   net/core/dev.c:6187:6: note: Assuming 'napi' is non-null
           if (!napi)
               ^~~~~
   net/core/dev.c:6187:2: note: Taking false branch
           if (!napi)
           ^
   net/core/dev.c:6190:2: note: Loop condition is false.  Exiting loop
           preempt_disable();
           ^
   include/linux/preempt.h:201:27: note: expanded from macro 'preempt_disab=
le'
   #define preempt_disable() \
                             ^
   net/core/dev.c:6191:2: note: Loop condition is true.  Entering loop body
           for (;;) {
           ^
   net/core/dev.c:6195:8: note: 'napi_poll' is null
                   if (!napi_poll) {
                        ^~~~~~~~~
   net/core/dev.c:6195:3: note: Taking true branch
                   if (!napi_poll) {
                   ^
   net/core/dev.c:6196:24: note: Left side of '||' is false
                           unsigned long val =3D READ_ONCE(napi->state);
                                               ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:325:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   net/core/dev.c:6196:24: note: Left side of '||' is false
                           unsigned long val =3D READ_ONCE(napi->state);
                                               ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:325:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   net/core/dev.c:6196:24: note: Left side of '||' is false
                           unsigned long val =3D READ_ONCE(napi->state);
                                               ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:325:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   net/core/dev.c:6196:24: note: Left side of '||' is true
                           unsigned long val =3D READ_ONCE(napi->state);
                                               ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                                               ^
   net/core/dev.c:6196:24: note: Taking false branch
                           unsigned long val =3D READ_ONCE(napi->state);
                                               ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:358:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:338:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   net/core/dev.c:6196:24: note: Loop condition is false.  Exiting loop

vim +185 include/linux/thread_info.h

dd13f42107d984 Peter Zijlstra 2022-06-05  181  =

dd13f42107d984 Peter Zijlstra 2022-06-05  182  static __always_inline bool =
tif_need_resched(void)
dd13f42107d984 Peter Zijlstra 2022-06-05  183  {
dd13f42107d984 Peter Zijlstra 2022-06-05  184  	return arch_test_bit(TIF_NE=
ED_RESCHED,
dd13f42107d984 Peter Zijlstra 2022-06-05 @185  			     (unsigned long *)(&c=
urrent_thread_info()->flags));
dd13f42107d984 Peter Zijlstra 2022-06-05  186  }
dd13f42107d984 Peter Zijlstra 2022-06-05  187  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2267013397469458077==--

