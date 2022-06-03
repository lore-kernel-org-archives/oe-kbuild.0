Content-Type: multipart/mixed; boundary="===============5437002186442195894=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 14468/14705] lib/maple_tree.c:667:9: warning: The right operand of '>=' is a garbage value due to array index out of bounds [clang-analyzer-core.UndefinedBinaryOperatorResult]
Date: Fri, 03 Jun 2022 13:04:31 +0800
Message-ID: <202206031212.dGV52qAL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5437002186442195894==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: lib/maple=
_tree.c:667:9: warning: The right operand of '>=3D' is a garbage value due =
to array index out of bounds [clang-analyzer-core.UndefinedBinaryOperatorRe=
sult]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Matthew Wilcox (Oracle)" <willy@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   2e776ccffa840ce53ee1c21bde54cbe4bc102c3b
commit: 2434ee25be6b2f86767dcfd83f1c923f109fe73e [14468/14705] Maple Tree: =
add new data structure
:::::: branch date: 25 hours ago
:::::: commit date: 30 hours ago
config: s390-randconfig-c005-20220531 (https://download.01.org/0day-ci/arch=
ive/20220603/202206031212.dGV52qAL-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b364c7=
6683f8ef241025a9556300778c07b590c2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D2434ee25be6b2f86767dcfd83f1c923f109fe73e
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 2434ee25be6b2f86767dcfd83f1c923f109fe73e
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   lib/kobject_uevent.c:665:8: warning: Call to function 'vsnprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'vsnprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D vsnprintf(&env->buf[env->buflen],
                 ^~~~~~~~~
   lib/kobject_uevent.c:665:8: note: Call to function 'vsnprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'vsnprintf_s' in case of C11
           len =3D vsnprintf(&env->buf[env->buflen],
                 ^~~~~~~~~
   Suppressed 28 warnings (16 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   arch/s390/include/asm/spinlock.h:61:52: warning: Dereference of null poi=
nter [clang-analyzer-core.NullDereference]
           return likely(__atomic_cmpxchg_bool(&lp->lock, 0, SPINLOCK_LOCKV=
AL));
                                                             ^
   arch/s390/include/asm/spinlock.h:19:26: note: expanded from macro 'SPINL=
OCK_LOCKVAL'
   #define SPINLOCK_LOCKVAL (S390_lowcore.spinlock_lockval)
                            ^
   lib/maple_tree.c:6259:2: note: Calling 'spin_lock'
           mtree_lock(mt);
           ^
   include/linux/maple_tree.h:253:25: note: expanded from macro 'mtree_lock'
   #define mtree_lock(mt)          spin_lock((&(mt)->ma_lock))
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:349:2: note: Calling '__raw_spin_lock'
           raw_spin_lock(&lock->rlock);
           ^
   include/linux/spinlock.h:215:29: note: expanded from macro 'raw_spin_loc=
k'
   #define raw_spin_lock(lock)     _raw_spin_lock(lock)
                                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:47:30: note: expanded from macro '_raw_=
spin_lock'
   #define _raw_spin_lock(lock) __raw_spin_lock(lock)
                                ^~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:133:2: note: Loop condition is false.  =
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
   lib/maple_tree.c:326:2: warning: Value stored to 'node' is never read [c=
lang-analyzer-deadcode.DeadStores]
           node =3D (void *)((unsigned long)node & ~MAPLE_ENODE_NULL);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:326:2: note: Value stored to 'node' is never read
           node =3D (void *)((unsigned long)node & ~MAPLE_ENODE_NULL);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:331:2: warning: Value stored to 'node' is never read [c=
lang-analyzer-deadcode.DeadStores]
           node =3D (void *)((unsigned long)node | MAPLE_ENODE_NULL);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:331:2: note: Value stored to 'node' is never read
           node =3D (void *)((unsigned long)node | MAPLE_ENODE_NULL);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/maple_tree.c:667:9: warning: The right operand of '>=3D' is a garbag=
e value due to array index out of bounds [clang-analyzer-core.UndefinedBina=
ryOperatorResult]
           if(piv >=3D mt_pivots[piv]) {
                  ^
   lib/maple_tree.c:5223:6: note: Left side of '||' is false
           if (mas_is_none(mas) || mas_is_ptr(mas)) {
               ^
   lib/maple_tree.c:5223:2: note: Taking false branch
           if (mas_is_none(mas) || mas_is_ptr(mas)) {
           ^
   lib/maple_tree.c:5235:2: note: Taking false branch
           if (mas_is_err(mas))
           ^
   lib/maple_tree.c:5238:11: note: Field 'offset' is not equal to MAPLE_NOD=
E_SLOTS
           if (mas->offset =3D=3D MAPLE_NODE_SLOTS)
                    ^
   lib/maple_tree.c:5238:2: note: Taking false branch
           if (mas->offset =3D=3D MAPLE_NODE_SLOTS)
           ^
   lib/maple_tree.c:5246:11: note: Field 'offset' is 15
           if (mas->offset)
                    ^
   lib/maple_tree.c:5246:2: note: Taking true branch
           if (mas->offset)
           ^
   lib/maple_tree.c:5247:30: note: Passing the value 14 via 2nd parameter '=
piv'
                   min =3D mte_pivot(mas->node, mas->offset - 1) + 1;
                                              ^~~~~~~~~~~~~~~
   lib/maple_tree.c:5247:9: note: Calling 'mte_pivot'
                   min =3D mte_pivot(mas->node, mas->offset - 1) + 1;
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:667:9: note: The right operand of '>=3D' is a garbage v=
alue due to array index out of bounds
           if(piv >=3D mt_pivots[piv]) {
                  ^  ~~~~~~~~~~~~~~
   lib/maple_tree.c:1206:23: warning: Value stored to 'nodep' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
           struct maple_alloc **nodep =3D &mas->alloc;
                                ^~~~~   ~~~~~~~~~~~
   lib/maple_tree.c:1206:23: note: Value stored to 'nodep' during its initi=
alization is never read
           struct maple_alloc **nodep =3D &mas->alloc;
                                ^~~~~   ~~~~~~~~~~~
   lib/maple_tree.c:1218:20: warning: Access to field 'node_count' results =
in a dereference of a null pointer (loaded from field 'alloc') [clang-analy=
zer-core.NullDereference]
           if (!allocated || mas->alloc->node_count =3D=3D MAPLE_ALLOC_SLOT=
S - 1) {
                             ^
   lib/maple_tree.c:5936:6: note: Calling 'mas_is_none'
           if (mas_is_none(mas) || mas_is_paused(mas))
               ^~~~~~~~~~~~~~~~
   include/linux/maple_tree.h:477:9: note: Assuming field 'node' is not equ=
al to MAS_NONE
           return mas->node =3D=3D MAS_NONE;
                  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/maple_tree.h:477:2: note: Returning without writing to 'ma=
s->alloc', which participates in a condition later
           return mas->node =3D=3D MAS_NONE;
           ^
   include/linux/maple_tree.h:477:2: note: Returning without writing to 'ma=
s->alloc'
   lib/maple_tree.c:5936:6: note: Returning from 'mas_is_none'
           if (mas_is_none(mas) || mas_is_paused(mas))
               ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:5936:6: note: Left side of '||' is false
   lib/maple_tree.c:5936:26: note: Calling 'mas_is_paused'
           if (mas_is_none(mas) || mas_is_paused(mas))
                                   ^~~~~~~~~~~~~~~~~~
   include/linux/maple_tree.h:483:9: note: Assuming field 'node' is not equ=
al to MAS_PAUSE
           return mas->node =3D=3D MAS_PAUSE;
                  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/maple_tree.h:483:2: note: Returning without writing to 'ma=
s->alloc', which participates in a condition later
           return mas->node =3D=3D MAS_PAUSE;
           ^
   include/linux/maple_tree.h:483:2: note: Returning without writing to 'ma=
s->alloc'
   lib/maple_tree.c:5936:26: note: Returning from 'mas_is_paused'
           if (mas_is_none(mas) || mas_is_paused(mas))
                                   ^~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:5936:2: note: Taking false branch
           if (mas_is_none(mas) || mas_is_paused(mas))
           ^
   lib/maple_tree.c:5940:10: note: Calling 'mas_state_walk'
           entry =3D mas_state_walk(mas);
                   ^~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:3745:10: note: Calling 'mas_start'
           entry =3D mas_start(mas);
                   ^~~~~~~~~~~~~~
   lib/maple_tree.c:1322:13: note: Calling 'mas_is_start'
           if (likely(mas_is_start(mas))) {
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   lib/maple_tree.c:243:9: note: Assuming field 'node' is equal to MAS_START
           return mas->node =3D=3D MAS_START;
                  ^~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:243:2: note: Returning without writing to 'mas->alloc',=
 which participates in a condition later
           return mas->node =3D=3D MAS_START;
           ^
   lib/maple_tree.c:243:2: note: Returning without writing to 'mas->alloc'
   lib/maple_tree.c:1322:13: note: Returning from 'mas_is_start'
           if (likely(mas_is_start(mas))) {
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   lib/maple_tree.c:1322:2: note: Taking true branch
           if (likely(mas_is_start(mas))) {
           ^
   lib/maple_tree.c:1333:3: note: Taking false branch

vim +667 lib/maple_tree.c

2434ee25be6b2f8 Liam R. Howlett 2022-06-01  654  =

2434ee25be6b2f8 Liam R. Howlett 2022-06-01  655  /*
2434ee25be6b2f8 Liam R. Howlett 2022-06-01  656   * mte_pivot() - Get the p=
ivot at @piv of the maple encoded node.
2434ee25be6b2f8 Liam R. Howlett 2022-06-01  657   * @mn: The maple encoded =
node.
2434ee25be6b2f8 Liam R. Howlett 2022-06-01  658   * @piv: The pivot.
2434ee25be6b2f8 Liam R. Howlett 2022-06-01  659   *
2434ee25be6b2f8 Liam R. Howlett 2022-06-01  660   * Return: the pivot at @p=
iv of @mn.
2434ee25be6b2f8 Liam R. Howlett 2022-06-01  661   */
2434ee25be6b2f8 Liam R. Howlett 2022-06-01  662  static inline unsigned lon=
g mte_pivot(const struct maple_enode *mn,
2434ee25be6b2f8 Liam R. Howlett 2022-06-01  663  				 unsigned char piv)
2434ee25be6b2f8 Liam R. Howlett 2022-06-01  664  {
2434ee25be6b2f8 Liam R. Howlett 2022-06-01  665  	struct maple_node *node =
=3D mte_to_node(mn);
2434ee25be6b2f8 Liam R. Howlett 2022-06-01  666  =

2434ee25be6b2f8 Liam R. Howlett 2022-06-01 @667  	if(piv >=3D mt_pivots[piv=
]) {
2434ee25be6b2f8 Liam R. Howlett 2022-06-01  668  		WARN_ON(1);
2434ee25be6b2f8 Liam R. Howlett 2022-06-01  669  		return 0;
2434ee25be6b2f8 Liam R. Howlett 2022-06-01  670  	}
2434ee25be6b2f8 Liam R. Howlett 2022-06-01  671  	switch (mte_node_type(mn)=
) {
2434ee25be6b2f8 Liam R. Howlett 2022-06-01  672  	case maple_arange_64:
2434ee25be6b2f8 Liam R. Howlett 2022-06-01  673  		return node->ma64.pivot[=
piv];
2434ee25be6b2f8 Liam R. Howlett 2022-06-01  674  	case maple_range_64:
2434ee25be6b2f8 Liam R. Howlett 2022-06-01  675  	case maple_leaf_64:
2434ee25be6b2f8 Liam R. Howlett 2022-06-01  676  		return node->mr64.pivot[=
piv];
2434ee25be6b2f8 Liam R. Howlett 2022-06-01  677  	case maple_dense:
2434ee25be6b2f8 Liam R. Howlett 2022-06-01  678  		return 0;
2434ee25be6b2f8 Liam R. Howlett 2022-06-01  679  	}
2434ee25be6b2f8 Liam R. Howlett 2022-06-01  680  	return 0;
2434ee25be6b2f8 Liam R. Howlett 2022-06-01  681  }
2434ee25be6b2f8 Liam R. Howlett 2022-06-01  682  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5437002186442195894==--

