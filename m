Content-Type: multipart/mixed; boundary="===============0117229487647713003=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] compiler_types: mark __compiletime_assert failure as __noreturn
Date: Sun, 07 Nov 2021 16:28:04 +0800
Message-ID: <202111071646.EJB2R7KC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0117229487647713003==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211014132331.GA4811@kernel.org>
References: <20211014132331.GA4811@kernel.org>
TO: Miguel Ojeda <ojeda@kernel.org>

Hi Miguel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.15]
[cannot apply to next-20211106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Miguel-Ojeda/compiler_type=
s-mark-__compiletime_assert-failure-as-__noreturn/20211014-212525
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
348949d9a4440abdab3b1dc99a9bb660e8c7da7c
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-c006-20211014 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project acb3b1=
87c4c88650a6a717a1bcb234d27d0d7f54)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/dbc83335c8484937120e562d5=
31c7f401aa944b2
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Miguel-Ojeda/compiler_types-mark-_=
_compiletime_assert-failure-as-__noreturn/20211014-212525
        git checkout dbc83335c8484937120e562d531c7f401aa944b2
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   kernel/bpf/core.c:962:2: note: Loop condition is false.  Exiting loop
           BUILD_BUG_ON(BPF_REG_AX  + 1 !=3D MAX_BPF_JIT_REG);
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
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
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   kernel/bpf/core.c:963:2: note: Taking false branch
           BUILD_BUG_ON(MAX_BPF_REG + 1 !=3D MAX_BPF_JIT_REG);
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
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
   kernel/bpf/core.c:963:2: note: Loop condition is false.  Exiting loop
           BUILD_BUG_ON(MAX_BPF_REG + 1 !=3D MAX_BPF_JIT_REG);
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
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
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   kernel/bpf/core.c:982:6: note: Assuming field 'dst_reg' is not equal to =
__MAX_BPF_REG
           if (from->dst_reg =3D=3D BPF_REG_AX || from->src_reg =3D=3D BPF_=
REG_AX)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/core.c:982:6: note: Left side of '||' is false
   kernel/bpf/core.c:982:37: note: Assuming field 'src_reg' is not equal to=
 __MAX_BPF_REG
           if (from->dst_reg =3D=3D BPF_REG_AX || from->src_reg =3D=3D BPF_=
REG_AX)
                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/core.c:982:2: note: Taking false branch
           if (from->dst_reg =3D=3D BPF_REG_AX || from->src_reg =3D=3D BPF_=
REG_AX)
           ^
   kernel/bpf/core.c:985:6: note: Assuming field 'imm' is not equal to 0
           if (from->imm =3D=3D 0 &&
               ^~~~~~~~~~~~~~
   kernel/bpf/core.c:985:21: note: Left side of '&&' is false
           if (from->imm =3D=3D 0 &&
                              ^
   kernel/bpf/core.c:992:2: note: Control jumps to 'case 0:'  at line 1068
           switch (from->code) {
           ^
   kernel/bpf/core.c:1069:54: note: The right operand of '^' is a garbage v=
alue
                   *to++ =3D BPF_ALU32_IMM(BPF_MOV, BPF_REG_AX, imm_rnd ^ a=
ux[0].imm);
                                                                      ^
   include/linux/filter.h:124:12: note: expanded from macro 'BPF_ALU32_IMM'
                   .imm   =3D IMM })
                            ^~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> mm/gup.c:708:2: warning: Value stored to 'page' is never read [clang-ana=
lyzer-deadcode.DeadStores]
           page =3D follow_trans_huge_pmd(vma, address, pmd, flags);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/gup.c:708:2: note: Value stored to 'page' is never read
           page =3D follow_trans_huge_pmd(vma, address, pmd, flags);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/gup.c:1294:13: warning: Dereference of null pointer (loaded from vari=
able 'unlocked') [clang-analyzer-core.NullDereference]
                   *unlocked =3D true;
                    ~~~~~~~~ ^
   mm/gup.c:1268:6: note: Assuming 'unlocked' is null
           if (unlocked)
               ^~~~~~~~
   mm/gup.c:1268:2: note: Taking false branch
           if (unlocked)
           ^
   mm/gup.c:1273:6: note: Assuming 'vma' is non-null
           if (!vma || address < vma->vm_start)
               ^~~~
   mm/gup.c:1273:6: note: Left side of '||' is false
   mm/gup.c:1273:14: note: Assuming 'address' is >=3D field 'vm_start'
           if (!vma || address < vma->vm_start)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   mm/gup.c:1273:2: note: Taking false branch
           if (!vma || address < vma->vm_start)
           ^
   mm/gup.c:1276:7: note: Calling 'vma_permits_fault'
           if (!vma_permits_fault(vma, fault_flags))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/gup.c:1210:18: note: Assuming the condition is false
           bool write   =3D !!(fault_flags & FAULT_FLAG_WRITE);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/gup.c:1211:18: note: Assuming the condition is false
           bool foreign =3D !!(fault_flags & FAULT_FLAG_REMOTE);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/gup.c:1212:24: note: 'write' is true
           vm_flags_t vm_flags =3D write ? VM_WRITE : VM_READ;
                                 ^~~~~
   mm/gup.c:1212:24: note: '?' condition is true
   mm/gup.c:1214:6: note: Assuming the condition is false
           if (!(vm_flags & vma->vm_flags))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/gup.c:1214:2: note: Taking false branch
           if (!(vm_flags & vma->vm_flags))
           ^
   mm/gup.c:1224:7: note: Calling 'arch_vma_access_permitted'
           if (!arch_vma_access_permitted(vma, write, false, foreign))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/mm_hooks.h:29:2: note: Returning the value 1, which =
participates in a condition later
           return true;
           ^~~~~~~~~~~
   mm/gup.c:1224:7: note: Returning from 'arch_vma_access_permitted'
           if (!arch_vma_access_permitted(vma, write, false, foreign))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/gup.c:1224:2: note: Taking false branch
           if (!arch_vma_access_permitted(vma, write, false, foreign))
           ^
   mm/gup.c:1227:2: note: Returning the value 1, which participates in a co=
ndition later
           return true;
           ^~~~~~~~~~~
   mm/gup.c:1276:7: note: Returning from 'vma_permits_fault'
           if (!vma_permits_fault(vma, fault_flags))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/gup.c:1276:2: note: Taking false branch
           if (!vma_permits_fault(vma, fault_flags))
           ^
   mm/gup.c:1279:7: note: Assuming the condition is false
           if ((fault_flags & FAULT_FLAG_KILLABLE) &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/gup.c:1279:42: note: Left side of '&&' is false
           if ((fault_flags & FAULT_FLAG_KILLABLE) &&
                                                   ^
   mm/gup.c:1284:6: note: Assuming the condition is false
           if (ret & VM_FAULT_ERROR) {
               ^~~~~~~~~~~~~~~~~~~~
   mm/gup.c:1284:2: note: Taking false branch
           if (ret & VM_FAULT_ERROR) {
           ^
   mm/gup.c:1292:6: note: Assuming the condition is true
           if (ret & VM_FAULT_RETRY) {
               ^~~~~~~~~~~~~~~~~~~~
   mm/gup.c:1292:2: note: Taking true branch
           if (ret & VM_FAULT_RETRY) {
           ^
   mm/gup.c:1294:13: note: Dereference of null pointer (loaded from variabl=
e 'unlocked')
                   *unlocked =3D true;
                    ~~~~~~~~ ^
   Suppressed 9 warnings (9 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
--
                   ^        ~~~~~~
   lib/assoc_array.c:409:3: note: Value stored to 'cursor' is never read
                   cursor =3D parent;
                   ^        ~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   lib/debugobjects.c:502:9: warning: Value stored to 'hint' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
                   void *hint =3D descr->debug_hint ?
                         ^~~~   ~~~~~~~~~~~~~~~~~~~
   lib/debugobjects.c:502:9: note: Value stored to 'hint' during its initia=
lization is never read
                   void *hint =3D descr->debug_hint ?
                         ^~~~   ~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   lib/math/reciprocal_div.c:51:14: warning: The result of the left shift i=
s undefined due to shifting by '64', which is greater or equal to the width=
 of type 'unsigned long long' [clang-analyzer-core.UndefinedBinaryOperatorR=
esult]
           mlow =3D 1ULL << (32 + l);
                       ^  ~~~~~~~~
   lib/math/reciprocal_div.c:47:2: note: Taking false branch
           WARN(l =3D=3D 32,
           ^
   include/asm-generic/bug.h:174:2: note: expanded from macro 'WARN'
           no_printk(format);                                              \
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   lib/math/reciprocal_div.c:51:14: note: The result of the left shift is u=
ndefined due to shifting by '64', which is greater or equal to the width of=
 type 'unsigned long long'
           mlow =3D 1ULL << (32 + l);
                       ^  ~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   mm/shmem.c:1362:2: warning: Value stored to 'index' is never read [clang=
-analyzer-deadcode.DeadStores]
           index =3D page->index;
           ^       ~~~~~~~~~~~
   mm/shmem.c:1362:2: note: Value stored to 'index' is never read
           index =3D page->index;
           ^       ~~~~~~~~~~~
>> mm/shmem.c:1554:24: warning: Value stored to 'mapping' during its initia=
lization is never read [clang-analyzer-deadcode.DeadStores]
           struct address_space *mapping =3D info->vfs_inode.i_mapping;
                                 ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/shmem.c:1554:24: note: Value stored to 'mapping' during its initializ=
ation is never read
           struct address_space *mapping =3D info->vfs_inode.i_mapping;
                                 ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   mm/percpu.c:276:44: warning: The result of the left shift is undefined b=
ecause the left operand is negative [clang-analyzer-core.UndefinedBinaryOpe=
ratorResult]
           return pcpu_unit_offsets[cpu] + (page_idx << PAGE_SHIFT);
                                                     ^
   mm/percpu.c:2247:2: note: Calling 'pcpu_reclaim_populated'
           pcpu_reclaim_populated();
           ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/percpu.c:2143:2: note: 'debug_locks' is 0
           lockdep_assert_held(&pcpu_lock);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:310:15: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                        ^~~~~~~~~~~
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   mm/percpu.c:2143:2: note: Left side of '&&' is false
           lockdep_assert_held(&pcpu_lock);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:27: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                                    ^
   mm/percpu.c:2143:2: note: Loop condition is false.  Exiting loop
           lockdep_assert_held(&pcpu_lock);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:2: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
           ^
   mm/percpu.c:2151:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(&pcpu_chunk_lists[pcpu_to_depopulate_slot])) {
           ^
   mm/percpu.c:2152:11: note: Left side of '&&' is false
                   chunk =3D list_first_entry(&pcpu_chunk_lists[pcpu_to_dep=
opulate_slot],
                           ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   mm/percpu.c:2152:11: note: Taking false branch
                   chunk =3D list_first_entry(&pcpu_chunk_lists[pcpu_to_dep=
opulate_slot],
                           ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
   mm/percpu.c:2152:11: note: Loop condition is false.  Exiting loop
                   chunk =3D list_first_entry(&pcpu_chunk_lists[pcpu_to_dep=
opulate_slot],
                           ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
--
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
   include/linux/skbuff.h:1942:2: note: Loop condition is false.  Exiting l=
oop
           WRITE_ONCE(prev->next, newsk);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
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
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   include/linux/skbuff.h:1942:2: note: Dereference of null pointer
           WRITE_ONCE(prev->next, newsk);
           ^
   include/asm-generic/rwonce.h:61:2: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:55:30: note: expanded from macro '__WRITE_O=
NCE'
           *(volatile typeof(x) *)&(x) =3D (val);                          =
  \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   include/linux/skbuff.h:2048:2: warning: 2nd function call argument is an=
 uninitialized value [clang-analyzer-core.CallAndMessage]
           __skb_insert(newsk, next->prev, next, list);
           ^
   net/tipc/bcast.c:565:2: note: Calling 'tipc_bcbase_xmit'
           tipc_bcbase_xmit(net, &xmitq);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tipc/bcast.c:184:2: note: Taking false branch
           if (skb_queue_empty(xmitq))
           ^
   net/tipc/bcast.c:189:6: note: Assuming 'bearer_id' is < 0
           if (bearer_id >=3D 0) {
               ^~~~~~~~~~~~~~
   net/tipc/bcast.c:189:2: note: Taking false branch
           if (bearer_id >=3D 0) {
           ^
   net/tipc/bcast.c:195:2: note: Calling '__skb_queue_head_init'
           __skb_queue_head_init(&_xmitq);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tipc/bcast.c:195:2: note: Returning from '__skb_queue_head_init'
           __skb_queue_head_init(&_xmitq);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tipc/bcast.c:196:2: note: Loop condition is true.  Entering loop body
           for (bearer_id =3D 0; bearer_id < MAX_BEARERS; bearer_id++) {
           ^
   net/tipc/bcast.c:197:7: note: Assuming the condition is false
                   if (!bb->dests[bearer_id])
                       ^~~~~~~~~~~~~~~~~~~~~
   net/tipc/bcast.c:197:3: note: Taking false branch
                   if (!bb->dests[bearer_id])
                   ^
   net/tipc/bcast.c:200:3: note: Loop condition is true.  Entering loop body
                   skb_queue_walk(xmitq, skb) {
                   ^
   include/linux/skbuff.h:3537:3: note: expanded from macro 'skb_queue_walk'
                   for (skb =3D (queue)->next;                             =
          \
                   ^
   net/tipc/bcast.c:202:8: note: Assuming '_skb' is non-null
                           if (!_skb)
                               ^~~~~
   net/tipc/bcast.c:202:4: note: Taking false branch
                           if (!_skb)
                           ^
   net/tipc/bcast.c:204:4: note: Calling '__skb_queue_tail'
                           __skb_queue_tail(&_xmitq, _skb);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2081:2: note: Calling '__skb_queue_before'
           __skb_queue_before(list, (struct sk_buff *)list, newsk);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2048:2: note: 2nd function call argument is an un=
initialized value
           __skb_insert(newsk, next->prev, next, list);
           ^                   ~~~~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> mm/migrate.c:1633:3: warning: Value stored to 'gfp_mask' is never read [=
clang-analyzer-deadcode.DeadStores]
                   gfp_mask |=3D GFP_TRANSHUGE;
                   ^
   mm/migrate.c:1633:3: note: Value stored to 'gfp_mask' is never read
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   18 warnings generated.
   drivers/char/ipmi/ipmi_ssif.c:817:37: warning: Array access (via field '=
rsp') results in a null pointer dereference [clang-analyzer-core.NullDerefe=
rence]
                   if ((result < 0) || (len < 3) || (msg->rsp[2] !=3D 0)) {
                                                     ^    ~~~
   drivers/char/ipmi/ipmi_ssif.c:618:6: note: Assuming 'result' is >=3D 0
           if (result < 0) {
               ^~~~~~~~~~
   drivers/char/ipmi/ipmi_ssif.c:618:2: note: Taking false branch
           if (result < 0) {
           ^
   drivers/char/ipmi/ipmi_ssif.c:642:7: note: Assuming 'len' is > 1
           if ((len > 1) && (ssif_info->multi_pos =3D=3D 0)
                ^~~~~~~
   drivers/char/ipmi/ipmi_ssif.c:642:6: note: Left side of '&&' is true
           if ((len > 1) && (ssif_info->multi_pos =3D=3D 0)
               ^
   drivers/char/ipmi/ipmi_ssif.c:642:20: note: Assuming field 'multi_pos' i=
s equal to 0
           if ((len > 1) && (ssif_info->multi_pos =3D=3D 0)
                             ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_ssif.c:642:6: note: Left side of '&&' is true
           if ((len > 1) && (ssif_info->multi_pos =3D=3D 0)
               ^
   drivers/char/ipmi/ipmi_ssif.c:643:9: note: Assuming the condition is fal=
se
                                   && (data[0] =3D=3D 0x00) && (data[1] =3D=
=3D 0x01)) {
                                       ^~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_ssif.c:643:26: note: Left side of '&&' is false
                                   && (data[0] =3D=3D 0x00) && (data[1] =3D=
=3D 0x01)) {
                                                        ^
   drivers/char/ipmi/ipmi_ssif.c:661:24: note: Field 'multi_pos' is 0
           } else if (ssif_info->multi_pos) {
                                 ^
   drivers/char/ipmi/ipmi_ssif.c:661:9: note: Taking false branch
           } else if (ssif_info->multi_pos) {
                  ^
   drivers/char/ipmi/ipmi_ssif.c:732:6: note: 'result' is >=3D 0
           if (result < 0) {
               ^~~~~~
   drivers/char/ipmi/ipmi_ssif.c:732:2: note: Taking false branch
           if (result < 0) {
           ^
   drivers/char/ipmi/ipmi_ssif.c:739:6: note: Assuming the condition is fal=
se
           if (ssif_info->ssif_debug & SSIF_DEBUG_STATE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_ssif.c:739:2: note: Taking false branch
           if (ssif_info->ssif_debug & SSIF_DEBUG_STATE)
           ^
   drivers/char/ipmi/ipmi_ssif.c:744:10: note: Calling 'ipmi_ssif_lock_cond'
           flags =3D ipmi_ssif_lock_cond(ssif_info, &oflags);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_ssif.c:311:2: note: Value assigned to field 'curr=
_msg'
           spin_lock_irqsave(&ssif_info->lock, *flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:256:11: note: expanded from macro 'raw_spin_loc=
k_irqsave'
                   flags =3D _raw_spin_lock_irqsave(lock);   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_ssif.c:311:2: note: Value assigned to field 'ssif=
_state', which participates in a condition later
           spin_lock_irqsave(&ssif_info->lock, *flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:256:11: note: expanded from macro 'raw_spin_loc=
k_irqsave'
                   flags =3D _raw_spin_lock_irqsave(lock);   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_ssif.c:311:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(&ssif_info->lock, *flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:254:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/char/ipmi/ipmi_ssif.c:311:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(&ssif_info->lock, *flags);
           ^
   include/linux/spinlock.h:391:43: note: expanded from macro 'spin_lock_ir=
qsave'

vim +/page +708 mm/gup.c

69e68b4f03135d Kirill A. Shutemov 2014-06-04  610  =

080dbb618b4bc2 Aneesh Kumar K.V   2017-07-06  611  static struct page *foll=
ow_pmd_mask(struct vm_area_struct *vma,
080dbb618b4bc2 Aneesh Kumar K.V   2017-07-06  612  				    unsigned long ad=
dress, pud_t *pudp,
df06b37ffe5a44 Keith Busch        2018-10-26  613  				    unsigned int fla=
gs,
df06b37ffe5a44 Keith Busch        2018-10-26  614  				    struct follow_pa=
ge_context *ctx)
69e68b4f03135d Kirill A. Shutemov 2014-06-04  615  {
688272809fcce5 Huang Ying         2018-06-07  616  	pmd_t *pmd, pmdval;
69e68b4f03135d Kirill A. Shutemov 2014-06-04  617  	spinlock_t *ptl;
69e68b4f03135d Kirill A. Shutemov 2014-06-04  618  	struct page *page;
69e68b4f03135d Kirill A. Shutemov 2014-06-04  619  	struct mm_struct *mm =
=3D vma->vm_mm;
69e68b4f03135d Kirill A. Shutemov 2014-06-04  620  =

080dbb618b4bc2 Aneesh Kumar K.V   2017-07-06  621  	pmd =3D pmd_offset(pudp=
, address);
688272809fcce5 Huang Ying         2018-06-07  622  	/*
688272809fcce5 Huang Ying         2018-06-07  623  	 * The READ_ONCE() will=
 stabilize the pmdval in a register or
688272809fcce5 Huang Ying         2018-06-07  624  	 * on the stack so that=
 it will stop changing under the code.
688272809fcce5 Huang Ying         2018-06-07  625  	 */
688272809fcce5 Huang Ying         2018-06-07  626  	pmdval =3D READ_ONCE(*p=
md);
688272809fcce5 Huang Ying         2018-06-07  627  	if (pmd_none(pmdval))
69e68b4f03135d Kirill A. Shutemov 2014-06-04  628  		return no_page_table(v=
ma, flags);
be9d30458913f7 Wei Yang           2020-01-30  629  	if (pmd_huge(pmdval) &&=
 is_vm_hugetlb_page(vma)) {
e66f17ff71772b Naoya Horiguchi    2015-02-11  630  		page =3D follow_huge_p=
md(mm, address, pmd, flags);
e66f17ff71772b Naoya Horiguchi    2015-02-11  631  		if (page)
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  632  			return page;
e66f17ff71772b Naoya Horiguchi    2015-02-11  633  		return no_page_table(v=
ma, flags);
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  634  	}
688272809fcce5 Huang Ying         2018-06-07  635  	if (is_hugepd(__hugepd(=
pmd_val(pmdval)))) {
4dc71451a2078e Aneesh Kumar K.V   2017-07-06  636  		page =3D follow_huge_p=
d(vma, address,
688272809fcce5 Huang Ying         2018-06-07  637  				      __hugepd(pmd_v=
al(pmdval)), flags,
4dc71451a2078e Aneesh Kumar K.V   2017-07-06  638  				      PMD_SHIFT);
4dc71451a2078e Aneesh Kumar K.V   2017-07-06  639  		if (page)
4dc71451a2078e Aneesh Kumar K.V   2017-07-06  640  			return page;
4dc71451a2078e Aneesh Kumar K.V   2017-07-06  641  		return no_page_table(v=
ma, flags);
4dc71451a2078e Aneesh Kumar K.V   2017-07-06  642  	}
84c3fc4e9c563d Zi Yan             2017-09-08  643  retry:
688272809fcce5 Huang Ying         2018-06-07  644  	if (!pmd_present(pmdval=
)) {
84c3fc4e9c563d Zi Yan             2017-09-08  645  		if (likely(!(flags & F=
OLL_MIGRATION)))
84c3fc4e9c563d Zi Yan             2017-09-08  646  			return no_page_table(=
vma, flags);
84c3fc4e9c563d Zi Yan             2017-09-08  647  		VM_BUG_ON(thp_migratio=
n_supported() &&
688272809fcce5 Huang Ying         2018-06-07  648  				  !is_pmd_migration_=
entry(pmdval));
688272809fcce5 Huang Ying         2018-06-07  649  		if (is_pmd_migration_e=
ntry(pmdval))
84c3fc4e9c563d Zi Yan             2017-09-08  650  			pmd_migration_entry_w=
ait(mm, pmd);
688272809fcce5 Huang Ying         2018-06-07  651  		pmdval =3D READ_ONCE(*=
pmd);
688272809fcce5 Huang Ying         2018-06-07  652  		/*
688272809fcce5 Huang Ying         2018-06-07  653  		 * MADV_DONTNEED may c=
onvert the pmd to null because
c1e8d7c6a7a682 Michel Lespinasse  2020-06-08  654  		 * mmap_lock is held i=
n read mode
688272809fcce5 Huang Ying         2018-06-07  655  		 */
688272809fcce5 Huang Ying         2018-06-07  656  		if (pmd_none(pmdval))
688272809fcce5 Huang Ying         2018-06-07  657  			return no_page_table(=
vma, flags);
84c3fc4e9c563d Zi Yan             2017-09-08  658  		goto retry;
84c3fc4e9c563d Zi Yan             2017-09-08  659  	}
688272809fcce5 Huang Ying         2018-06-07  660  	if (pmd_devmap(pmdval))=
 {
3565fce3a6597e Dan Williams       2016-01-15  661  		ptl =3D pmd_lock(mm, p=
md);
df06b37ffe5a44 Keith Busch        2018-10-26  662  		page =3D follow_devmap=
_pmd(vma, address, pmd, flags, &ctx->pgmap);
3565fce3a6597e Dan Williams       2016-01-15  663  		spin_unlock(ptl);
3565fce3a6597e Dan Williams       2016-01-15  664  		if (page)
3565fce3a6597e Dan Williams       2016-01-15  665  			return page;
3565fce3a6597e Dan Williams       2016-01-15  666  	}
688272809fcce5 Huang Ying         2018-06-07  667  	if (likely(!pmd_trans_h=
uge(pmdval)))
df06b37ffe5a44 Keith Busch        2018-10-26  668  		return follow_page_pte=
(vma, address, pmd, flags, &ctx->pgmap);
6742d293cbe01d Kirill A. Shutemov 2016-01-15  669  =

688272809fcce5 Huang Ying         2018-06-07  670  	if ((flags & FOLL_NUMA)=
 && pmd_protnone(pmdval))
db08f2030a173f Aneesh Kumar K.V   2017-02-24  671  		return no_page_table(v=
ma, flags);
db08f2030a173f Aneesh Kumar K.V   2017-02-24  672  =

84c3fc4e9c563d Zi Yan             2017-09-08  673  retry_locked:
69e68b4f03135d Kirill A. Shutemov 2014-06-04  674  	ptl =3D pmd_lock(mm, pm=
d);
688272809fcce5 Huang Ying         2018-06-07  675  	if (unlikely(pmd_none(*=
pmd))) {
688272809fcce5 Huang Ying         2018-06-07  676  		spin_unlock(ptl);
688272809fcce5 Huang Ying         2018-06-07  677  		return no_page_table(v=
ma, flags);
688272809fcce5 Huang Ying         2018-06-07  678  	}
84c3fc4e9c563d Zi Yan             2017-09-08  679  	if (unlikely(!pmd_prese=
nt(*pmd))) {
84c3fc4e9c563d Zi Yan             2017-09-08  680  		spin_unlock(ptl);
84c3fc4e9c563d Zi Yan             2017-09-08  681  		if (likely(!(flags & F=
OLL_MIGRATION)))
84c3fc4e9c563d Zi Yan             2017-09-08  682  			return no_page_table(=
vma, flags);
84c3fc4e9c563d Zi Yan             2017-09-08  683  		pmd_migration_entry_wa=
it(mm, pmd);
84c3fc4e9c563d Zi Yan             2017-09-08  684  		goto retry_locked;
84c3fc4e9c563d Zi Yan             2017-09-08  685  	}
6742d293cbe01d Kirill A. Shutemov 2016-01-15  686  	if (unlikely(!pmd_trans=
_huge(*pmd))) {
6742d293cbe01d Kirill A. Shutemov 2016-01-15  687  		spin_unlock(ptl);
df06b37ffe5a44 Keith Busch        2018-10-26  688  		return follow_page_pte=
(vma, address, pmd, flags, &ctx->pgmap);
6742d293cbe01d Kirill A. Shutemov 2016-01-15  689  	}
4066c119483af8 Yang Shi           2021-04-29  690  	if (flags & FOLL_SPLIT_=
PMD) {
6742d293cbe01d Kirill A. Shutemov 2016-01-15  691  		int ret;
6742d293cbe01d Kirill A. Shutemov 2016-01-15  692  		page =3D pmd_page(*pmd=
);
6742d293cbe01d Kirill A. Shutemov 2016-01-15  693  		if (is_huge_zero_page(=
page)) {
6742d293cbe01d Kirill A. Shutemov 2016-01-15  694  			spin_unlock(ptl);
6742d293cbe01d Kirill A. Shutemov 2016-01-15  695  			ret =3D 0;
78ddc534734190 Kirill A. Shutemov 2016-01-15  696  			split_huge_pmd(vma, p=
md, address);
337d9abf1cd1a5 Naoya Horiguchi    2016-07-26  697  			if (pmd_trans_unstabl=
e(pmd))
337d9abf1cd1a5 Naoya Horiguchi    2016-07-26  698  				ret =3D -EBUSY;
4066c119483af8 Yang Shi           2021-04-29  699  		} else {
bfe7b00de6d1e2 Song Liu           2019-09-23  700  			spin_unlock(ptl);
bfe7b00de6d1e2 Song Liu           2019-09-23  701  			split_huge_pmd(vma, p=
md, address);
bfe7b00de6d1e2 Song Liu           2019-09-23  702  			ret =3D pte_alloc(mm,=
 pmd) ? -ENOMEM : 0;
69e68b4f03135d Kirill A. Shutemov 2014-06-04  703  		}
6742d293cbe01d Kirill A. Shutemov 2016-01-15  704  =

6742d293cbe01d Kirill A. Shutemov 2016-01-15  705  		return ret ? ERR_PTR(r=
et) :
df06b37ffe5a44 Keith Busch        2018-10-26  706  			follow_page_pte(vma, =
address, pmd, flags, &ctx->pgmap);
69e68b4f03135d Kirill A. Shutemov 2014-06-04  707  	}
6742d293cbe01d Kirill A. Shutemov 2016-01-15 @708  	page =3D follow_trans_h=
uge_pmd(vma, address, pmd, flags);
6742d293cbe01d Kirill A. Shutemov 2016-01-15  709  	spin_unlock(ptl);
df06b37ffe5a44 Keith Busch        2018-10-26  710  	ctx->page_mask =3D HPAG=
E_PMD_NR - 1;
6742d293cbe01d Kirill A. Shutemov 2016-01-15  711  	return page;
69e68b4f03135d Kirill A. Shutemov 2014-06-04  712  }
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  713  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0117229487647713003==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============0117229487647713003==--

