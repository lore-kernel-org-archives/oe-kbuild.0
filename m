Content-Type: multipart/mixed; boundary="===============4859005151081868762=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH V4 1/1] swiotlb: Split up single swiotlb lock
Date: Sun, 19 Jun 2022 13:55:17 +0800
Message-ID: <202206191339.ynzj6UiE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4859005151081868762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: kernel/dm=
a/swiotlb.c:655:14: warning: Dereference of null pointer [clang-analyzer-co=
re.NullDereference]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220617144741.921308-1-ltykernel@gmail.com>
References: <20220617144741.921308-1-ltykernel@gmail.com>
TO: Tianyu Lan <ltykernel@gmail.com>

Hi Tianyu,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v5.19-rc2 next-20220617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Tianyu-Lan/swiotlb-S=
plit-up-single-swiotlb-lock/20220618-010819
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-ever=
ything
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: s390-randconfig-c005-20220617 (https://download.01.org/0day-ci/arch=
ive/20220619/202206191339.ynzj6UiE-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 916887=
16ba49942051dccdf7b9c4f81a7ec8feaf)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/47bb420a6670ad36f2b=
ec2dd442d79f17453186d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tianyu-Lan/swiotlb-Split-up-single=
-swiotlb-lock/20220618-010819
        git checkout 47bb420a6670ad36f2bec2dd442d79f17453186d
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/asm-generic/bug.h:71:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   kernel/dma/swiotlb.c:752:2: note: Calling '__raw_spin_lock_irqsave'
           spin_lock_irqsave(&area->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:242:11: note: expanded from macro 'raw_spin_loc=
k_irqsave'
                   flags =3D _raw_spin_lock_irqsave(lock);   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:59:38: note: expanded from macro '_raw_=
spin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock) __raw_spin_lock_irqsave(lock)
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:108:2: note: Loop condition is false.  =
Exiting loop
           local_irq_save(flags);
           ^
   include/linux/irqflags.h:244:36: note: expanded from macro 'local_irq_sa=
ve'
   #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while =
(0)
                                        ^
   include/linux/irqflags.h:176:2: note: expanded from macro 'raw_local_irq=
_save'
           do {                                            \
           ^
   include/linux/spinlock_api_smp.h:108:2: note: Loop condition is false.  =
Exiting loop
           local_irq_save(flags);
           ^
   include/linux/irqflags.h:244:31: note: expanded from macro 'local_irq_sa=
ve'
   #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while =
(0)
                                   ^
   include/linux/spinlock_api_smp.h:110:2: note: Loop condition is false.  =
Exiting loop
           spin_acquire(&lock->dep_map, 0, 0, _RET_IP_);
           ^
   include/linux/lockdep.h:522:35: note: expanded from macro 'spin_acquire'
   #define spin_acquire(l, s, t, i)                lock_acquire_exclusive(l=
, s, t, NULL, i)
                                                   ^
   include/linux/lockdep.h:518:48: note: expanded from macro 'lock_acquire_=
exclusive'
   #define lock_acquire_exclusive(l, s, t, n, i)           lock_acquire(l, =
s, t, 0, 1, n, i)
                                                           ^
   include/linux/lockdep.h:356:44: note: expanded from macro 'lock_acquire'
   # define lock_acquire(l, s, t, r, c, n, i)      do { } while (0)
                                                   ^
   include/linux/spinlock_api_smp.h:111:44: note: Calling 'do_raw_spin_lock'
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
                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/spinlock.h:61:52: note: Dereference of null pointer
           return likely(__atomic_cmpxchg_bool(&lp->lock, 0, SPINLOCK_LOCKV=
AL));
                                                             ^
   arch/s390/include/asm/spinlock.h:19:26: note: expanded from macro 'SPINL=
OCK_LOCKVAL'
   #define SPINLOCK_LOCKVAL (S390_lowcore.spinlock_lockval)
                            ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   kernel/dma/swiotlb.c:268:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(vaddr, 0, bytes);
           ^~~~~~
   kernel/dma/swiotlb.c:268:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(vaddr, 0, bytes);
           ^~~~~~
   kernel/dma/swiotlb.c:451:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(mem, 0, sizeof(*mem));
           ^~~~~~
   kernel/dma/swiotlb.c:451:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(mem, 0, sizeof(*mem));
           ^~~~~~
   kernel/dma/swiotlb.c:519:5: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(vaddr, buffer + offset, sz);
                                   ^~~~~~
   kernel/dma/swiotlb.c:519:5: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                                   memcpy(vaddr, buffer + offset, sz);
                                   ^~~~~~
   kernel/dma/swiotlb.c:521:5: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(buffer + offset, vaddr, sz);
                                   ^~~~~~
   kernel/dma/swiotlb.c:521:5: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                                   memcpy(buffer + offset, vaddr, sz);
                                   ^~~~~~
   kernel/dma/swiotlb.c:531:3: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(vaddr, phys_to_virt(orig_addr), size);
                   ^~~~~~
   kernel/dma/swiotlb.c:531:3: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                   memcpy(vaddr, phys_to_virt(orig_addr), size);
                   ^~~~~~
   kernel/dma/swiotlb.c:533:3: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(phys_to_virt(orig_addr), vaddr, size);
                   ^~~~~~
   kernel/dma/swiotlb.c:533:3: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                   memcpy(phys_to_virt(orig_addr), vaddr, size);
                   ^~~~~~
>> kernel/dma/swiotlb.c:655:14: warning: Dereference of null pointer [clang=
-analyzer-core.NullDereference]
           int start =3D raw_smp_processor_id() & ((1U << __fls(mem->nareas=
)) - 1);
                       ^
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   kernel/dma/swiotlb.c:827:17: note: Calling 'swiotlb_tbl_map_single'
           swiotlb_addr =3D swiotlb_tbl_map_single(dev, paddr, size, size, =
0, dir,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   kernel/dma/swiotlb.c:692:6: note: Assuming 'mem' is non-null
           if (!mem)
               ^~~~
   kernel/dma/swiotlb.c:692:2: note: Taking false branch
           if (!mem)
           ^
   kernel/dma/swiotlb.c:695:2: note: Taking false branch
           if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
           ^
   kernel/dma/swiotlb.c:698:6: note: 'mapping_size' is <=3D 'alloc_size'
           if (mapping_size > alloc_size) {
               ^~~~~~~~~~~~
   kernel/dma/swiotlb.c:698:2: note: Taking false branch
           if (mapping_size > alloc_size) {
           ^
   kernel/dma/swiotlb.c:704:10: note: Calling 'swiotlb_find_slots'
           index =3D swiotlb_find_slots(dev, orig_addr,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/dma/swiotlb.c:655:14: note: Dereference of null pointer
           int start =3D raw_smp_processor_id() & ((1U << __fls(mem->nareas=
)) - 1);
                       ^
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^~~~~~~~~~~~~~~~~~~~~
   Suppressed 60 warnings (48 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   108 warnings generated.
   arch/s390/include/asm/preempt.h:17:9: warning: Dereference of null point=
er [clang-analyzer-core.NullDereference]
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RES=
CHED;
                  ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^
   init/main.c:1418:2: note: Loop condition is true.  Entering loop body
           for (fn =3D __initcall_start; fn < __initcall0_start; fn++)
           ^
   init/main.c:1419:3: note: Calling 'do_one_initcall'
                   do_one_initcall(initcall_from_entry(fn));
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   init/main.c:1292:14: note: Calling 'preempt_count'
           int count =3D preempt_count();
                       ^~~~~~~~~~~~~~~
   arch/s390/include/asm/preempt.h:17:9: note: Left side of '||' is false
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RES=
CHED;
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
   arch/s390/include/asm/preempt.h:17:9: note: Left side of '||' is false
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RES=
CHED;
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
   arch/s390/include/asm/preempt.h:17:9: note: Left side of '||' is true
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RES=
CHED;
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
   arch/s390/include/asm/preempt.h:17:9: note: Taking false branch
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RES=
CHED;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:352:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)

vim +655 kernel/dma/swiotlb.c

^1da177e4c3f41 arch/ia64/lib/swiotlb.c Linus Torvalds    2005-04-16  650  =

47bb420a6670ad kernel/dma/swiotlb.c    Tianyu Lan        2022-06-17  651  s=
tatic int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
47bb420a6670ad kernel/dma/swiotlb.c    Tianyu Lan        2022-06-17  652  	=
		      size_t alloc_size, unsigned int alloc_align_mask)
47bb420a6670ad kernel/dma/swiotlb.c    Tianyu Lan        2022-06-17  653  {
47bb420a6670ad kernel/dma/swiotlb.c    Tianyu Lan        2022-06-17  654  	=
struct io_tlb_mem *mem =3D dev->dma_io_tlb_mem;
47bb420a6670ad kernel/dma/swiotlb.c    Tianyu Lan        2022-06-17 @655  	=
int start =3D raw_smp_processor_id() & ((1U << __fls(mem->nareas)) - 1);
47bb420a6670ad kernel/dma/swiotlb.c    Tianyu Lan        2022-06-17  656  	=
int i =3D start, index;
47bb420a6670ad kernel/dma/swiotlb.c    Tianyu Lan        2022-06-17  657  =

47bb420a6670ad kernel/dma/swiotlb.c    Tianyu Lan        2022-06-17  658  	=
do {
47bb420a6670ad kernel/dma/swiotlb.c    Tianyu Lan        2022-06-17  659  	=
	index =3D swiotlb_do_find_slots(mem, mem->areas + i, i,
47bb420a6670ad kernel/dma/swiotlb.c    Tianyu Lan        2022-06-17  660  	=
				      dev, orig_addr, alloc_size,
47bb420a6670ad kernel/dma/swiotlb.c    Tianyu Lan        2022-06-17  661  	=
				      alloc_align_mask);
47bb420a6670ad kernel/dma/swiotlb.c    Tianyu Lan        2022-06-17  662  	=
	if (index >=3D 0)
26a7e094783d48 kernel/dma/swiotlb.c    Christoph Hellwig 2021-02-04  663  	=
		return index;
47bb420a6670ad kernel/dma/swiotlb.c    Tianyu Lan        2022-06-17  664  	=
	if (++i >=3D mem->nareas)
47bb420a6670ad kernel/dma/swiotlb.c    Tianyu Lan        2022-06-17  665  	=
		i =3D 0;
47bb420a6670ad kernel/dma/swiotlb.c    Tianyu Lan        2022-06-17  666  	=
} while (i !=3D start);
47bb420a6670ad kernel/dma/swiotlb.c    Tianyu Lan        2022-06-17  667  =

47bb420a6670ad kernel/dma/swiotlb.c    Tianyu Lan        2022-06-17  668  	=
return -1;
47bb420a6670ad kernel/dma/swiotlb.c    Tianyu Lan        2022-06-17  669  }
47bb420a6670ad kernel/dma/swiotlb.c    Tianyu Lan        2022-06-17  670  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4859005151081868762==--

