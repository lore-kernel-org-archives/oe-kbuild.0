Content-Type: multipart/mixed; boundary="===============5885924742505227227=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [weiny2:lm-pks-pmem-for-5.10-v4 11/72] arch/x86/include/asm/pgtable_types.h:234:9: sparse: this was the original definition
Date: Wed, 23 Sep 2020 17:22:23 +0800
Message-ID: <202009231712.2tIbOtST%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5885924742505227227==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Fenghua Yu <fenghua.yu@intel.com>
CC: Ira Weiny <ira.weiny@intel.com>

tree:   https://github.com/weiny2/linux-kernel.git lm-pks-pmem-for-5.10-v4
head:   a337ef71d02653ffe0d9d8cef60d35508a8d8f5d
commit: e3d7c75f395cdcdc542d601a5f2ff4da526580bc [11/72] x86/pks: Add PKS k=
ernel API
:::::: branch date: 4 hours ago
:::::: commit date: 14 hours ago
config: i386-randconfig-s001-20200923 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.2-201-g24bdaac6-dirty
        git checkout e3d7c75f395cdcdc542d601a5f2ff4da526580bc
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=
=3Di386 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   kernel/exit.c: note: in included file (through arch/x86/include/asm/mmu_=
context.h):
   include/linux/pkeys.h:65:9: sparse: sparse: preprocessor token PAGE_KERN=
EL_PKEY redefined
   kernel/exit.c: note: in included file (through arch/x86/include/asm/para=
virt_types.h, arch/x86/include/asm/ptrace.h, arch/x86/include/asm/math_emu.=
h, ...):
>> arch/x86/include/asm/pgtable_types.h:234:9: sparse: this was the origina=
l definition
   kernel/exit.c:276:37: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct task_struct *tsk @@     got st=
ruct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:276:37: sparse:     expected struct task_struct *tsk
   kernel/exit.c:276:37: sparse:     got struct task_struct [noderef] __rcu=
 *real_parent
   kernel/exit.c:279:32: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct task_struct *task @@     got s=
truct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:279:32: sparse:     expected struct task_struct *task
   kernel/exit.c:279:32: sparse:     got struct task_struct [noderef] __rcu=
 *real_parent
   kernel/exit.c:280:35: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct task_struct *task @@     got s=
truct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:280:35: sparse:     expected struct task_struct *task
   kernel/exit.c:280:35: sparse:     got struct task_struct [noderef] __rcu=
 *real_parent
   kernel/exit.c:325:24: sparse: sparse: incorrect type in assignment (diff=
erent address spaces) @@     expected struct task_struct *parent @@     got=
 struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:325:24: sparse:     expected struct task_struct *parent
   kernel/exit.c:325:24: sparse:     got struct task_struct [noderef] __rcu=
 *real_parent
   kernel/exit.c:556:29: sparse: sparse: incorrect type in assignment (diff=
erent address spaces) @@     expected struct task_struct *reaper @@     got=
 struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:556:29: sparse:     expected struct task_struct *reaper
   kernel/exit.c:556:29: sparse:     got struct task_struct [noderef] __rcu=
 *real_parent
   kernel/exit.c:558:29: sparse: sparse: incorrect type in assignment (diff=
erent address spaces) @@     expected struct task_struct *reaper @@     got=
 struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:558:29: sparse:     expected struct task_struct *reaper
   kernel/exit.c:558:29: sparse:     got struct task_struct [noderef] __rcu=
 *real_parent
   kernel/exit.c:889:63: sparse: sparse: incorrect type in initializer (dif=
ferent address spaces) @@     expected struct sighand_struct *const sighand=
 @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/exit.c:889:63: sparse:     expected struct sighand_struct *const =
sighand
   kernel/exit.c:889:63: sparse:     got struct sighand_struct [noderef] __=
rcu *sighand
   kernel/exit.c:1041:39: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1041:39: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/exit.c:1041:39: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1066:41: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1066:41: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/exit.c:1066:41: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1155:25: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1155:25: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/exit.c:1155:25: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1170:27: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1170:27: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/exit.c:1170:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1221:25: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1221:25: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/exit.c:1221:25: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1224:35: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1224:35: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/exit.c:1224:35: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1230:27: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1230:27: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/exit.c:1230:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1411:59: sparse: sparse: incompatible types in comparison =
expression (different base types):
   kernel/exit.c:1411:59: sparse:    void *
   kernel/exit.c:1411:59: sparse:    struct task_struct [noderef] __rcu *
   kernel/exit.c:1754:13: sparse: sparse: symbol 'abort' was not declared. =
Should it be static?
   kernel/exit.c: note: in included file:
   include/linux/ptrace.h:99:40: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected struct task_struct *p1 @@    =
 got struct task_struct [noderef] __rcu *real_parent @@
   include/linux/ptrace.h:99:40: sparse:     expected struct task_struct *p1
   include/linux/ptrace.h:99:40: sparse:     got struct task_struct [nodere=
f] __rcu *real_parent
   include/linux/ptrace.h:99:60: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected struct task_struct *p2 @@    =
 got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:99:60: sparse:     expected struct task_struct *p2
   include/linux/ptrace.h:99:60: sparse:     got struct task_struct [nodere=
f] __rcu *parent
   include/linux/ptrace.h:99:40: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected struct task_struct *p1 @@    =
 got struct task_struct [noderef] __rcu *real_parent @@
   include/linux/ptrace.h:99:40: sparse:     expected struct task_struct *p1
   include/linux/ptrace.h:99:40: sparse:     got struct task_struct [nodere=
f] __rcu *real_parent
   include/linux/ptrace.h:99:60: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected struct task_struct *p2 @@    =
 got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:99:60: sparse:     expected struct task_struct *p2
   include/linux/ptrace.h:99:60: sparse:     got struct task_struct [nodere=
f] __rcu *parent
   kernel/exit.c: note: in included file (through include/linux/sched/signa=
l.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...):
   include/linux/sched/task.h:102:34: sparse: sparse: context imbalance in =
'wait_task_zombie' - unexpected unlock
   include/linux/sched/task.h:102:34: sparse: sparse: context imbalance in =
'wait_task_stopped' - unexpected unlock
   include/linux/sched/task.h:102:34: sparse: sparse: context imbalance in =
'wait_task_continued' - unexpected unlock
   kernel/exit.c: note: in included file:
   include/linux/ptrace.h:99:40: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected struct task_struct *p1 @@    =
 got struct task_struct [noderef] __rcu *real_parent @@
   include/linux/ptrace.h:99:40: sparse:     expected struct task_struct *p1
   include/linux/ptrace.h:99:40: sparse:     got struct task_struct [nodere=
f] __rcu *real_parent
   include/linux/ptrace.h:99:60: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected struct task_struct *p2 @@    =
 got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:99:60: sparse:     expected struct task_struct *p2
   include/linux/ptrace.h:99:60: sparse:     got struct task_struct [nodere=
f] __rcu *parent
   kernel/exit.c:1472:9: sparse: sparse: context imbalance in 'do_wait' - w=
rong count at exit
--
   kernel/fork.c: note: in included file (through arch/x86/include/asm/mmu_=
context.h):
   include/linux/pkeys.h:65:9: sparse: sparse: preprocessor token PAGE_KERN=
EL_PKEY redefined
   kernel/fork.c: note: in included file (through arch/x86/include/asm/para=
virt_types.h, arch/x86/include/asm/ptrace.h, arch/x86/include/asm/math_emu.=
h, ...):
>> arch/x86/include/asm/pgtable_types.h:234:9: sparse: this was the origina=
l definition
   kernel/fork.c:1501:38: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct refcount_struct [usertype] *r=
 @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:1501:38: sparse:     expected struct refcount_struct [user=
type] *r
   kernel/fork.c:1501:38: sparse:     got struct refcount_struct [noderef] =
__rcu *
   kernel/fork.c:1510:31: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1510:31: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/fork.c:1510:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:1511:9: sparse: sparse: incorrect type in argument 2 (diff=
erent address spaces) @@     expected void const * @@     got struct k_siga=
ction [noderef] __rcu * @@
   kernel/fork.c:1511:9: sparse:     expected void const *
   kernel/fork.c:1511:9: sparse:     got struct k_sigaction [noderef] __rcu=
 *
   kernel/fork.c:1512:33: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1512:33: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/fork.c:1512:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:1605:9: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct qspinlock *lock @@     got str=
uct qspinlock [noderef] __rcu * @@
   kernel/fork.c:1605:9: sparse:     expected struct qspinlock *lock
   kernel/fork.c:1605:9: sparse:     got struct qspinlock [noderef] __rcu *
   kernel/fork.c:1906:31: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1906:31: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/fork.c:1906:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:1910:33: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1910:33: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/fork.c:1910:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2196:32: sparse: sparse: incorrect type in assignment (dif=
ferent address spaces) @@     expected struct task_struct [noderef] __rcu *=
real_parent @@     got struct task_struct * @@
   kernel/fork.c:2196:32: sparse:     expected struct task_struct [noderef]=
 __rcu *real_parent
   kernel/fork.c:2196:32: sparse:     got struct task_struct *
   kernel/fork.c:2202:27: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2202:27: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/fork.c:2202:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2251:54: sparse: sparse: incorrect type in argument 2 (dif=
ferent address spaces) @@     expected struct list_head *head @@     got st=
ruct list_head [noderef] __rcu * @@
   kernel/fork.c:2251:54: sparse:     expected struct list_head *head
   kernel/fork.c:2251:54: sparse:     got struct list_head [noderef] __rcu *
   kernel/fork.c:2272:29: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2272:29: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/fork.c:2272:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2287:29: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2287:29: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/fork.c:2287:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2314:28: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct sighand_struct *sighand @@   =
  got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/fork.c:2314:28: sparse:     expected struct sighand_struct *sigha=
nd
   kernel/fork.c:2314:28: sparse:     got struct sighand_struct [noderef] _=
_rcu *sighand
   kernel/fork.c:2342:31: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2342:31: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/fork.c:2342:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2344:33: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2344:33: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/fork.c:2344:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2731:24: sparse: sparse: incorrect type in assignment (dif=
ferent address spaces) @@     expected struct task_struct *[assigned] paren=
t @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/fork.c:2731:24: sparse:     expected struct task_struct *[assigne=
d] parent
   kernel/fork.c:2731:24: sparse:     got struct task_struct [noderef] __rc=
u *real_parent
   kernel/fork.c:2812:43: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct refcount_struct const [userty=
pe] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:2812:43: sparse:     expected struct refcount_struct const=
 [usertype] *r
   kernel/fork.c:2812:43: sparse:     got struct refcount_struct [noderef] =
__rcu *
   kernel/fork.c:1941:27: sparse: sparse: dereference of noderef expression
   kernel/fork.c:1941:27: sparse: sparse: dereference of noderef expression
   kernel/fork.c:1943:22: sparse: sparse: dereference of noderef expression
   kernel/fork.c: note: in included file (through include/uapi/asm-generic/=
bpf_perf_event.h, arch/x86/include/generated/uapi/asm/bpf_perf_event.h, ...=
):
   include/linux/ptrace.h:218:45: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces) @@     expected struct task_struct *new_pare=
nt @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:218:45: sparse:     expected struct task_struct *=
new_parent
   include/linux/ptrace.h:218:45: sparse:     got struct task_struct [noder=
ef] __rcu *parent
   include/linux/ptrace.h:218:62: sparse: sparse: incorrect type in argumen=
t 3 (different address spaces) @@     expected struct cred const *ptracer_c=
red @@     got struct cred const [noderef] __rcu *ptracer_cred @@
   include/linux/ptrace.h:218:62: sparse:     expected struct cred const *p=
tracer_cred
   include/linux/ptrace.h:218:62: sparse:     got struct cred const [nodere=
f] __rcu *ptracer_cred
   kernel/fork.c:2249:59: sparse: sparse: dereference of noderef expression
   kernel/fork.c:2250:59: sparse: sparse: dereference of noderef expression
   kernel/fork.c:2335:22: sparse: sparse: dereference of noderef expression
   kernel/fork.c:2335:22: sparse: sparse: dereference of noderef expression
--
   kernel/kthread.c: note: in included file (through arch/x86/include/asm/m=
mu_context.h, include/linux/mmu_context.h):
   include/linux/pkeys.h:65:9: sparse: sparse: preprocessor token PAGE_KERN=
EL_PKEY redefined
   kernel/kthread.c: note: in included file (through arch/x86/include/asm/p=
aravirt_types.h, arch/x86/include/asm/ptrace.h, arch/x86/include/asm/math_e=
mu.h, ...):
>> arch/x86/include/asm/pgtable_types.h:234:9: sparse: this was the origina=
l definition
--
   kernel/module.c: note: in included file (through arch/x86/include/asm/mm=
u_context.h):
   include/linux/pkeys.h:65:9: sparse: sparse: preprocessor token PAGE_KERN=
EL_PKEY redefined
   kernel/module.c: note: in included file (through arch/x86/include/asm/pa=
ravirt_types.h, arch/x86/include/asm/ptrace.h, arch/x86/include/asm/math_em=
u.h, ...):
>> arch/x86/include/asm/pgtable_types.h:234:9: sparse: this was the origina=
l definition
   kernel/module.c:2777:23: sparse: sparse: incorrect type in assignment (d=
ifferent address spaces) @@     expected struct mod_kallsyms [noderef] __rc=
u *kallsyms @@     got void * @@
   kernel/module.c:2777:23: sparse:     expected struct mod_kallsyms [noder=
ef] __rcu *kallsyms
   kernel/module.c:2777:23: sparse:     got void *
   kernel/module.c:4308:52: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected struct mod_kallsyms *kallsyms @@ =
    got struct mod_kallsyms [noderef] __rcu *kallsyms @@
   kernel/module.c:4308:52: sparse:     expected struct mod_kallsyms *kalls=
yms
   kernel/module.c:4308:52: sparse:     got struct mod_kallsyms [noderef] _=
_rcu *kallsyms
   kernel/module.c: note: in included file (through include/linux/mm_types.=
h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rbtree.h:84:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   include/linux/rbtree.h:84:9: sparse:    struct rb_node [noderef] __rcu *
   include/linux/rbtree.h:84:9: sparse:    struct rb_node *
   include/linux/rbtree.h:84:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   include/linux/rbtree.h:84:9: sparse:    struct rb_node [noderef] __rcu *
   include/linux/rbtree.h:84:9: sparse:    struct rb_node *
--
   kernel/sched/loadavg.c: note: in included file (through arch/x86/include=
/asm/mmu_context.h, include/linux/mmu_context.h, kernel/sched/sched.h):
   include/linux/pkeys.h:65:9: sparse: sparse: preprocessor token PAGE_KERN=
EL_PKEY redefined
   kernel/sched/loadavg.c: note: in included file (through arch/x86/include=
/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, arch/x86/include/asm/=
math_emu.h, ...):
>> arch/x86/include/asm/pgtable_types.h:234:9: sparse: this was the origina=
l definition
--
   kernel/sched/clock.c: note: in included file (through arch/x86/include/a=
sm/mmu_context.h, include/linux/mmu_context.h, kernel/sched/sched.h):
   include/linux/pkeys.h:65:9: sparse: sparse: preprocessor token PAGE_KERN=
EL_PKEY redefined
   kernel/sched/clock.c: note: in included file (through arch/x86/include/a=
sm/paravirt_types.h, arch/x86/include/asm/ptrace.h, arch/x86/include/asm/ma=
th_emu.h, ...):
>> arch/x86/include/asm/pgtable_types.h:234:9: sparse: this was the origina=
l definition
--
   kernel/sched/cputime.c: note: in included file (through arch/x86/include=
/asm/mmu_context.h, include/linux/mmu_context.h, kernel/sched/sched.h):
   include/linux/pkeys.h:65:9: sparse: sparse: preprocessor token PAGE_KERN=
EL_PKEY redefined
   kernel/sched/cputime.c: note: in included file (through arch/x86/include=
/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, arch/x86/include/asm/=
math_emu.h, ...):
>> arch/x86/include/asm/pgtable_types.h:234:9: sparse: this was the origina=
l definition
   kernel/sched/cputime.c:316:17: sparse: sparse: context imbalance in 'thr=
ead_group_cputime' - different lock contexts for basic block
--
   kernel/sched/idle.c: note: in included file (through arch/x86/include/as=
m/mmu_context.h, include/linux/mmu_context.h, kernel/sched/sched.h):
   include/linux/pkeys.h:65:9: sparse: sparse: preprocessor token PAGE_KERN=
EL_PKEY redefined
   kernel/sched/idle.c: note: in included file (through arch/x86/include/as=
m/paravirt_types.h, arch/x86/include/asm/ptrace.h, arch/x86/include/asm/mat=
h_emu.h, ...):
>> arch/x86/include/asm/pgtable_types.h:234:9: sparse: this was the origina=
l definition
--
   kernel/sched/core.c: note: in included file (through arch/x86/include/as=
m/mmu_context.h, include/linux/mmu_context.h, kernel/sched/sched.h):
   include/linux/pkeys.h:65:9: sparse: sparse: preprocessor token PAGE_KERN=
EL_PKEY redefined
   kernel/sched/core.c: note: in included file (through arch/x86/include/as=
m/paravirt_types.h, arch/x86/include/asm/ptrace.h, arch/x86/include/asm/mat=
h_emu.h, ...):
>> arch/x86/include/asm/pgtable_types.h:234:9: sparse: this was the origina=
l definition
   kernel/sched/core.c:354:48: sparse: sparse: incorrect type in argument 2=
 (different address spaces) @@     expected struct task_struct *p @@     go=
t struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:354:48: sparse:     expected struct task_struct *p
   kernel/sched/core.c:354:48: sparse:     got struct task_struct [noderef]=
 __rcu *curr
   kernel/sched/core.c:610:38: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected struct task_struct *curr @@   =
  got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:610:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:610:38: sparse:     got struct task_struct [noderef]=
 __rcu *curr
   kernel/sched/core.c:1697:33: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected struct task_struct *p @@     g=
ot struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1697:33: sparse:     expected struct task_struct *p
   kernel/sched/core.c:1697:33: sparse:     got struct task_struct [noderef=
] __rcu *curr
   kernel/sched/core.c:1697:68: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected struct task_struct *tsk @@    =
 got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1697:68: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:1697:68: sparse:     got struct task_struct [noderef=
] __rcu *curr
   kernel/sched/core.c:2439:17: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:2439:17: sparse:     expected struct sched_domain *[=
assigned] sd
   kernel/sched/core.c:2439:17: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/core.c:2631:36: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected struct task_struct const *p @@=
     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2631:36: sparse:     expected struct task_struct con=
st *p
   kernel/sched/core.c:2631:36: sparse:     got struct task_struct [noderef=
] __rcu *curr
   kernel/sched/core.c:3987:38: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected struct task_struct *curr @@  =
   got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3987:38: sparse:     expected struct task_struct *cu=
rr
   kernel/sched/core.c:3987:38: sparse:     got struct task_struct [noderef=
] __rcu *curr
   kernel/sched/core.c:4420:14: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct task_struct *prev @@   =
  got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:4420:14: sparse:     expected struct task_struct *pr=
ev
   kernel/sched/core.c:4420:14: sparse:     got struct task_struct [noderef=
] __rcu *curr
   kernel/sched/core.c:4879:17: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/core.c:4879:17: sparse:    struct task_struct *
   kernel/sched/core.c:4879:17: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/core.c:5079:22: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/core.c:5079:22: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/core.c:5079:22: sparse:    struct task_struct *
   kernel/sched/core.c:8437:25: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected struct task_struct *p @@     g=
ot struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:8437:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:8437:25: sparse:     got struct task_struct [noderef=
] __rcu *curr
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:85:13: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct task_struct const *p @@  =
   got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:85:13: sparse:     expected struct task_struct const=
 *p
   kernel/sched/pelt.h:85:13: sparse:     got struct task_struct [noderef] =
__rcu *curr
   kernel/sched/core.c:354:11: sparse: sparse: dereference of noderef expre=
ssion
   kernel/sched/core.c:1688:33: sparse: sparse: dereference of noderef expr=
ession
   kernel/sched/core.c:1689:19: sparse: sparse: dereference of noderef expr=
ession
   kernel/sched/core.c:1690:37: sparse: sparse: dereference of noderef expr=
ession
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1688:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1688:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:1688:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1833:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:1833:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:1833:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1839:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:1839:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:1839:9: sparse:    struct task_struct *
   kernel/sched/core.c:1663:38: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/core.c:1663:38: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/core.c:1663:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:1688:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1688:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:1688:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1833:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:1833:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:1833:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1833:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:1833:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:1833:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1688:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1688:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:1688:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1833:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:1833:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:1833:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1839:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:1839:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:1839:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1688:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1688:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:1688:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1833:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:1833:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:1833:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1839:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:1839:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:1839:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1688:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1688:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:1688:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1833:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:1833:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:1833:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1839:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:1839:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:1839:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1688:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1688:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:1688:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1833:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:1833:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:1833:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1839:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:1839:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:1839:9: sparse:    struct task_struct *
--
   kernel/sched/completion.c: note: in included file (through arch/x86/incl=
ude/asm/mmu_context.h, include/linux/mmu_context.h, kernel/sched/sched.h):
   include/linux/pkeys.h:65:9: sparse: sparse: preprocessor token PAGE_KERN=
EL_PKEY redefined
   kernel/sched/completion.c: note: in included file (through arch/x86/incl=
ude/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, arch/x86/include/a=
sm/math_emu.h, ...):
>> arch/x86/include/asm/pgtable_types.h:234:9: sparse: this was the origina=
l definition
--
   kernel/sched/wait.c: note: in included file (through arch/x86/include/as=
m/mmu_context.h, include/linux/mmu_context.h, kernel/sched/sched.h):
   include/linux/pkeys.h:65:9: sparse: sparse: preprocessor token PAGE_KERN=
EL_PKEY redefined
   kernel/sched/wait.c: note: in included file (through arch/x86/include/as=
m/paravirt_types.h, arch/x86/include/asm/ptrace.h, arch/x86/include/asm/mat=
h_emu.h, ...):
>> arch/x86/include/asm/pgtable_types.h:234:9: sparse: this was the origina=
l definition
--
   kernel/sched/swait.c: note: in included file (through arch/x86/include/a=
sm/mmu_context.h, include/linux/mmu_context.h, kernel/sched/sched.h):
   include/linux/pkeys.h:65:9: sparse: sparse: preprocessor token PAGE_KERN=
EL_PKEY redefined
   kernel/sched/swait.c: note: in included file (through arch/x86/include/a=
sm/paravirt_types.h, arch/x86/include/asm/ptrace.h, arch/x86/include/asm/ma=
th_emu.h, ...):
>> arch/x86/include/asm/pgtable_types.h:234:9: sparse: this was the origina=
l definition
--
   kernel/sched/cpupri.c: note: in included file (through arch/x86/include/=
asm/mmu_context.h, include/linux/mmu_context.h, kernel/sched/sched.h):
   include/linux/pkeys.h:65:9: sparse: sparse: preprocessor token PAGE_KERN=
EL_PKEY redefined
   kernel/sched/cpupri.c: note: in included file (through arch/x86/include/=
asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, arch/x86/include/asm/m=
ath_emu.h, ...):
>> arch/x86/include/asm/pgtable_types.h:234:9: sparse: this was the origina=
l definition
--
   kernel/sched/wait_bit.c: note: in included file (through arch/x86/includ=
e/asm/mmu_context.h, include/linux/mmu_context.h, kernel/sched/sched.h):
   include/linux/pkeys.h:65:9: sparse: sparse: preprocessor token PAGE_KERN=
EL_PKEY redefined
   kernel/sched/wait_bit.c: note: in included file (through arch/x86/includ=
e/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, arch/x86/include/asm=
/math_emu.h, ...):
>> arch/x86/include/asm/pgtable_types.h:234:9: sparse: this was the origina=
l definition
--
   kernel/sched/rt.c: note: in included file (through arch/x86/include/asm/=
mmu_context.h, include/linux/mmu_context.h, kernel/sched/sched.h):
   include/linux/pkeys.h:65:9: sparse: sparse: preprocessor token PAGE_KERN=
EL_PKEY redefined
   kernel/sched/rt.c: note: in included file (through arch/x86/include/asm/=
paravirt_types.h, arch/x86/include/asm/ptrace.h, arch/x86/include/asm/math_=
emu.h, ...):
>> arch/x86/include/asm/pgtable_types.h:234:9: sparse: this was the origina=
l definition
   kernel/sched/rt.c:912:70: sparse: sparse: incompatible types in comparis=
on expression (different address spaces):
   kernel/sched/rt.c:912:70: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:912:70: sparse:    struct task_struct *
   kernel/sched/rt.c:2183:25: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   kernel/sched/rt.c:2183:25: sparse:    struct task_struct *
   kernel/sched/rt.c:2183:25: sparse:    struct task_struct [noderef] __rcu=
 *
   kernel/sched/rt.c:529:54: sparse: sparse: incorrect type in initializer =
(different address spaces) @@     expected struct task_struct *curr @@     =
got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:529:54: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:529:54: sparse:     got struct task_struct [noderef] _=
_rcu *curr
   kernel/sched/rt.c:998:38: sparse: sparse: incorrect type in initializer =
(different address spaces) @@     expected struct task_struct *curr @@     =
got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:998:38: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:998:38: sparse:     got struct task_struct [noderef] _=
_rcu *curr
   kernel/sched/rt.c:1424:31: sparse: sparse: incorrect type in argument 2 =
(different address spaces) @@     expected struct task_struct *p @@     got=
 struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1424:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1424:31: sparse:     got struct task_struct [noderef] =
__rcu *curr
   kernel/sched/rt.c:1741:9: sparse: sparse: incorrect type in assignment (=
different address spaces) @@     expected struct sched_domain *[assigned] s=
d @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/rt.c:1741:9: sparse:     expected struct sched_domain *[ass=
igned] sd
   kernel/sched/rt.c:1741:9: sparse:     got struct sched_domain [noderef] =
__rcu *parent
   kernel/sched/rt.c:1444:14: sparse: sparse: incorrect type in assignment =
(different address spaces) @@     expected struct task_struct *curr @@     =
got struct task_struct [noderef] __rcu *const volatile @@
   kernel/sched/rt.c:1444:14: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1444:14: sparse:     got struct task_struct [noderef] =
__rcu *const volatile
   kernel/sched/rt.c:1509:45: sparse: sparse: incorrect type in argument 2 =
(different address spaces) @@     expected struct task_struct *p @@     got=
 struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1509:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1509:45: sparse:     got struct task_struct [noderef] =
__rcu *curr
   kernel/sched/rt.c:1570:67: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct task_struct *tsk @@     g=
ot struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1570:67: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1570:67: sparse:     got struct task_struct [noderef] =
__rcu *curr
   kernel/sched/rt.c:1876:13: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   kernel/sched/rt.c:1876:13: sparse:    struct task_struct *
   kernel/sched/rt.c:1876:13: sparse:    struct task_struct [noderef] __rcu=
 *
   kernel/sched/rt.c:2224:54: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct task_struct *tsk @@     g=
ot struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2224:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2224:54: sparse:     got struct task_struct [noderef] =
__rcu *curr
   kernel/sched/rt.c:2226:40: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct task_struct *p @@     got=
 struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2226:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2226:40: sparse:     got struct task_struct [noderef] =
__rcu *curr
   kernel/sched/rt.c:2226:61: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct task_struct *p @@     got=
 struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2226:61: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2226:61: sparse:     got struct task_struct [noderef] =
__rcu *curr
   kernel/sched/rt.c:2300:46: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   kernel/sched/rt.c:2300:46: sparse:    struct task_struct [noderef] __rcu=
 *
   kernel/sched/rt.c:2300:46: sparse:    struct task_struct *
   kernel/sched/rt.c:2320:22: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   kernel/sched/rt.c:2320:22: sparse:    struct task_struct [noderef] __rcu=
 *
   kernel/sched/rt.c:2320:22: sparse:    struct task_struct *
   kernel/sched/rt.c: note: in included file:
   kernel/sched/sched.h:1688:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1688:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:1688:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1688:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1688:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:1688:25: sparse:    struct task_struct *
--
   kernel/sched/deadline.c: note: in included file (through arch/x86/includ=
e/asm/mmu_context.h, include/linux/mmu_context.h, kernel/sched/sched.h):
   include/linux/pkeys.h:65:9: sparse: sparse: preprocessor token PAGE_KERN=
EL_PKEY redefined
   kernel/sched/deadline.c: note: in included file (through arch/x86/includ=
e/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, arch/x86/include/asm=
/math_emu.h, ...):
>> arch/x86/include/asm/pgtable_types.h:234:9: sparse: this was the origina=
l definition
   kernel/sched/deadline.c:2108:13: sparse: sparse: incompatible types in c=
omparison expression (different address spaces):
   kernel/sched/deadline.c:2108:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2108:13: sparse:    struct task_struct [noderef]=
 __rcu *
   kernel/sched/deadline.c:2235:25: sparse: sparse: incompatible types in c=
omparison expression (different address spaces):
   kernel/sched/deadline.c:2235:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2235:25: sparse:    struct task_struct [noderef]=
 __rcu *
   kernel/sched/deadline.c:1770:42: sparse: sparse: incorrect type in argum=
ent 2 (different address spaces) @@     expected struct sched_dl_entity *b =
@@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1770:42: sparse:     expected struct sched_dl_en=
tity *b
   kernel/sched/deadline.c:1770:42: sparse:     got struct sched_dl_entity =
[noderef] __rcu *
   kernel/sched/deadline.c:1781:38: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected struct task_struct *tsk @@=
     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1781:38: sparse:     expected struct task_struct=
 *tsk
   kernel/sched/deadline.c:1781:38: sparse:     got struct task_struct [nod=
eref] __rcu *curr
   kernel/sched/deadline.c:1093:23: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected struct task_struct *p @@  =
   got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1093:23: sparse:     expected struct task_struct=
 *p
   kernel/sched/deadline.c:1093:23: sparse:     got struct task_struct [nod=
eref] __rcu *curr
   kernel/sched/deadline.c:1222:38: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected struct task_struct *curr =
@@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1222:38: sparse:     expected struct task_struct=
 *curr
   kernel/sched/deadline.c:1222:38: sparse:     got struct task_struct [nod=
eref] __rcu *curr
   kernel/sched/deadline.c:1967:9: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct sched_domain *[assig=
ned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:1967:9: sparse:     expected struct sched_domain=
 *[assigned] sd
   kernel/sched/deadline.c:1967:9: sparse:     got struct sched_domain [nod=
eref] __rcu *parent
   kernel/sched/deadline.c:1655:14: sparse: sparse: incorrect type in assig=
nment (different address spaces) @@     expected struct task_struct *curr @=
@     got struct task_struct [noderef] __rcu *const volatile @@
   kernel/sched/deadline.c:1655:14: sparse:     expected struct task_struct=
 *curr
   kernel/sched/deadline.c:1655:14: sparse:     got struct task_struct [nod=
eref] __rcu *const volatile
   kernel/sched/deadline.c:1731:43: sparse: sparse: incorrect type in argum=
ent 2 (different address spaces) @@     expected struct task_struct *p @@  =
   got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1731:43: sparse:     expected struct task_struct=
 *p
   kernel/sched/deadline.c:1731:43: sparse:     got struct task_struct [nod=
eref] __rcu *curr
   kernel/sched/deadline.c:2270:38: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected struct task_struct *tsk @@=
     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2270:38: sparse:     expected struct task_struct=
 *tsk
   kernel/sched/deadline.c:2270:38: sparse:     got struct task_struct [nod=
eref] __rcu *curr
   kernel/sched/deadline.c:2272:23: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected struct task_struct *p @@  =
   got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2272:23: sparse:     expected struct task_struct=
 *p
   kernel/sched/deadline.c:2272:23: sparse:     got struct task_struct [nod=
eref] __rcu *curr
   kernel/sched/deadline.c:2274:44: sparse: sparse: incorrect type in argum=
ent 2 (different address spaces) @@     expected struct sched_dl_entity *b =
@@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2274:44: sparse:     expected struct sched_dl_en=
tity *b
   kernel/sched/deadline.c:2274:44: sparse:     got struct sched_dl_entity =
[noderef] __rcu *
   kernel/sched/deadline.c:2434:22: sparse: sparse: incompatible types in c=
omparison expression (different address spaces):
   kernel/sched/deadline.c:2434:22: sparse:    struct task_struct [noderef]=
 __rcu *
   kernel/sched/deadline.c:2434:22: sparse:    struct task_struct *
   kernel/sched/deadline.c:2453:46: sparse: sparse: incompatible types in c=
omparison expression (different address spaces):
   kernel/sched/deadline.c:2453:46: sparse:    struct task_struct [noderef]=
 __rcu *
   kernel/sched/deadline.c:2453:46: sparse:    struct task_struct *
   kernel/sched/deadline.c:631:17: sparse: sparse: context imbalance in 'dl=
_task_offline_migration' - unexpected unlock
   kernel/sched/deadline.c: note: in included file:
   kernel/sched/sched.h:1688:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1688:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:1688:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1688:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1688:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:1688:25: sparse:    struct task_struct *
--
   kernel/sched/stop_task.c: note: in included file (through arch/x86/inclu=
de/asm/mmu_context.h, include/linux/mmu_context.h, kernel/sched/sched.h):
   include/linux/pkeys.h:65:9: sparse: sparse: preprocessor token PAGE_KERN=
EL_PKEY redefined
   kernel/sched/stop_task.c: note: in included file (through arch/x86/inclu=
de/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, arch/x86/include/as=
m/math_emu.h, ...):
>> arch/x86/include/asm/pgtable_types.h:234:9: sparse: this was the origina=
l definition
   kernel/sched/stop_task.c:65:38: sparse: sparse: incorrect type in initia=
lizer (different address spaces) @@     expected struct task_struct *curr @=
@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/stop_task.c:65:38: sparse:     expected struct task_struct =
*curr
   kernel/sched/stop_task.c:65:38: sparse:     got struct task_struct [node=
ref] __rcu *curr
--
   kernel/sched/cpudeadline.c: note: in included file (through arch/x86/inc=
lude/asm/mmu_context.h, include/linux/mmu_context.h, kernel/sched/sched.h):
   include/linux/pkeys.h:65:9: sparse: sparse: preprocessor token PAGE_KERN=
EL_PKEY redefined
   kernel/sched/cpudeadline.c: note: in included file (through arch/x86/inc=
lude/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, arch/x86/include/=
asm/math_emu.h, ...):
>> arch/x86/include/asm/pgtable_types.h:234:9: sparse: this was the origina=
l definition
--
   kernel/sched/fair.c: note: in included file (through arch/x86/include/as=
m/mmu_context.h, include/linux/mmu_context.h, kernel/sched/sched.h):
   include/linux/pkeys.h:65:9: sparse: sparse: preprocessor token PAGE_KERN=
EL_PKEY redefined
   kernel/sched/fair.c: note: in included file (through arch/x86/include/as=
m/paravirt_types.h, arch/x86/include/asm/ptrace.h, arch/x86/include/asm/mat=
h_emu.h, ...):
>> arch/x86/include/asm/pgtable_types.h:234:9: sparse: this was the origina=
l definition
   kernel/sched/fair.c:879:34: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected struct sched_entity *se @@     =
got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:879:34: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:879:34: sparse:     got struct sched_entity [noderef=
] __rcu *
   kernel/sched/fair.c:10521:9: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:10521:9: sparse:     expected struct sched_domain *[=
assigned] sd
   kernel/sched/fair.c:10521:9: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/fair.c:5398:38: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/fair.c:5398:38: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/fair.c:5398:38: sparse:    struct task_struct *
   kernel/sched/fair.c:5413:38: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected struct task_struct *curr @@  =
   got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:5413:38: sparse:     expected struct task_struct *cu=
rr
   kernel/sched/fair.c:5413:38: sparse:     got struct task_struct [noderef=
] __rcu *curr
   kernel/sched/fair.c:5644:1: sparse: sparse: symbol '__pcpu_scope_load_ba=
lance_mask' was not declared. Should it be static?
   kernel/sched/fair.c:5645:1: sparse: sparse: symbol '__pcpu_scope_select_=
idle_mask' was not declared. Should it be static?
   kernel/sched/fair.c:6574:20: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:6574:20: sparse:     expected struct sched_domain *[=
assigned] sd
   kernel/sched/fair.c:6574:20: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/fair.c:6693:9: sparse: sparse: incorrect type in assignment=
 (different address spaces) @@     expected struct sched_domain *[assigned]=
 tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:6693:9: sparse:     expected struct sched_domain *[a=
ssigned] tmp
   kernel/sched/fair.c:6693:9: sparse:     got struct sched_domain [noderef=
] __rcu *parent
   kernel/sched/fair.c:6892:38: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected struct task_struct *curr @@  =
   got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6892:38: sparse:     expected struct task_struct *cu=
rr
   kernel/sched/fair.c:6892:38: sparse:     got struct task_struct [noderef=
] __rcu *curr
   kernel/sched/fair.c:7143:38: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected struct task_struct *curr @@  =
   got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:7143:38: sparse:     expected struct task_struct *cu=
rr
   kernel/sched/fair.c:7143:38: sparse:     got struct task_struct [noderef=
] __rcu *curr
   kernel/sched/fair.c:8108:40: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected struct sched_domain *child @@=
     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:8108:40: sparse:     expected struct sched_domain *c=
hild
   kernel/sched/fair.c:8108:40: sparse:     got struct sched_domain [nodere=
f] __rcu *child
   kernel/sched/fair.c:8601:22: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/fair.c:8601:22: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/fair.c:8601:22: sparse:    struct task_struct *
   kernel/sched/fair.c:9844:9: sparse: sparse: incorrect type in assignment=
 (different address spaces) @@     expected struct sched_domain *[assigned]=
 sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:9844:9: sparse:     expected struct sched_domain *[a=
ssigned] sd
   kernel/sched/fair.c:9844:9: sparse:     got struct sched_domain [noderef=
] __rcu *parent
   kernel/sched/fair.c:9504:44: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected struct sched_domain *sd_paren=
t @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:9504:44: sparse:     expected struct sched_domain *s=
d_parent
   kernel/sched/fair.c:9504:44: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/fair.c:9922:9: sparse: sparse: incorrect type in assignment=
 (different address spaces) @@     expected struct sched_domain *[assigned]=
 sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:9922:9: sparse:     expected struct sched_domain *[a=
ssigned] sd
   kernel/sched/fair.c:9922:9: sparse:     got struct sched_domain [noderef=
] __rcu *parent
   kernel/sched/fair.c:10722:22: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/fair.c:10722:22: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/fair.c:10722:22: sparse:    struct task_struct *
   kernel/sched/fair.c:10855:30: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/fair.c:10855:30: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/fair.c:10855:30: sparse:    struct task_struct *
   kernel/sched/fair.c:5342:35: sparse: sparse: marked inline, but without =
a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:1833:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:1833:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:1833:9: sparse:    struct task_struct *
--
   kernel/sched/pelt.c: note: in included file (through arch/x86/include/as=
m/mmu_context.h, include/linux/mmu_context.h, kernel/sched/sched.h):
   include/linux/pkeys.h:65:9: sparse: sparse: preprocessor token PAGE_KERN=
EL_PKEY redefined
   kernel/sched/pelt.c: note: in included file (through arch/x86/include/as=
m/paravirt_types.h, arch/x86/include/asm/ptrace.h, arch/x86/include/asm/mat=
h_emu.h, ...):
>> arch/x86/include/asm/pgtable_types.h:234:9: sparse: this was the origina=
l definition
--
   kernel/sched/autogroup.c: note: in included file (through arch/x86/inclu=
de/asm/mmu_context.h, include/linux/mmu_context.h, kernel/sched/sched.h):
   include/linux/pkeys.h:65:9: sparse: sparse: preprocessor token PAGE_KERN=
EL_PKEY redefined
   kernel/sched/autogroup.c: note: in included file (through arch/x86/inclu=
de/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, arch/x86/include/as=
m/math_emu.h, ...):
>> arch/x86/include/asm/pgtable_types.h:234:9: sparse: this was the origina=
l definition
   kernel/sched/autogroup.c: note: in included file (through include/linux/=
sched/cputime.h, kernel/sched/sched.h):
   include/linux/sched/signal.h:695:37: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected struct spinlock [usert=
ype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:695:37: sparse:     expected struct spinloc=
k [usertype] *lock
   include/linux/sched/signal.h:695:37: sparse:     got struct spinlock [no=
deref] __rcu *
   include/linux/sched/signal.h:695:37: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected struct spinlock [usert=
ype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:695:37: sparse:     expected struct spinloc=
k [usertype] *lock
   include/linux/sched/signal.h:695:37: sparse:     got struct spinlock [no=
deref] __rcu *
   include/linux/sched/signal.h:695:37: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected struct spinlock [usert=
ype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:695:37: sparse:     expected struct spinloc=
k [usertype] *lock
   include/linux/sched/signal.h:695:37: sparse:     got struct spinlock [no=
deref] __rcu *
   include/linux/sched/signal.h:695:37: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected struct spinlock [usert=
ype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:695:37: sparse:     expected struct spinloc=
k [usertype] *lock
   include/linux/sched/signal.h:695:37: sparse:     got struct spinlock [no=
deref] __rcu *
   include/linux/sched/signal.h:695:37: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected struct spinlock [usert=
ype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:695:37: sparse:     expected struct spinloc=
k [usertype] *lock
   include/linux/sched/signal.h:695:37: sparse:     got struct spinlock [no=
deref] __rcu *
--
   kernel/sched/cpufreq.c: note: in included file (through arch/x86/include=
/asm/mmu_context.h, include/linux/mmu_context.h, kernel/sched/sched.h):
   include/linux/pkeys.h:65:9: sparse: sparse: preprocessor token PAGE_KERN=
EL_PKEY redefined
   kernel/sched/cpufreq.c: note: in included file (through arch/x86/include=
/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, arch/x86/include/asm/=
math_emu.h, ...):
>> arch/x86/include/asm/pgtable_types.h:234:9: sparse: this was the origina=
l definition
--
   kernel/sched/debug.c: note: in included file (through arch/x86/include/a=
sm/mmu_context.h, include/linux/mmu_context.h, kernel/sched/sched.h):
   include/linux/pkeys.h:65:9: sparse: sparse: preprocessor token PAGE_KERN=
EL_PKEY redefined
   kernel/sched/debug.c: note: in included file (through arch/x86/include/a=
sm/paravirt_types.h, arch/x86/include/asm/ptrace.h, arch/x86/include/asm/ma=
th_emu.h, ...):
>> arch/x86/include/asm/pgtable_types.h:234:9: sparse: this was the origina=
l definition
   kernel/sched/debug.c:276:9: sparse: sparse: incorrect type in assignment=
 (different address spaces) @@     expected struct sched_domain *[assigned]=
 sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/debug.c:276:9: sparse:     expected struct sched_domain *[a=
ssigned] sd
   kernel/sched/debug.c:276:9: sparse:     got struct sched_domain [noderef=
] __rcu *parent
   kernel/sched/debug.c:283:9: sparse: sparse: incorrect type in assignment=
 (different address spaces) @@     expected struct sched_domain *[assigned]=
 sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/debug.c:283:9: sparse:     expected struct sched_domain *[a=
ssigned] sd
   kernel/sched/debug.c:283:9: sparse:     got struct sched_domain [noderef=
] __rcu *parent
   kernel/sched/debug.c:435:22: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/debug.c:435:22: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/debug.c:435:22: sparse:    struct task_struct *
   kernel/sched/debug.c:643:9: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected struct task_struct *tsk @@     =
got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:643:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:643:9: sparse:     got struct task_struct [noderef]=
 __rcu *curr
   kernel/sched/debug.c:643:9: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected struct task_struct *tsk @@     =
got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:643:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:643:9: sparse:     got struct task_struct [noderef]=
 __rcu *curr
--
   kernel/sched/topology.c: note: in included file (through arch/x86/includ=
e/asm/mmu_context.h, include/linux/mmu_context.h, kernel/sched/sched.h):
   include/linux/pkeys.h:65:9: sparse: sparse: preprocessor token PAGE_KERN=
EL_PKEY redefined
   kernel/sched/topology.c: note: in included file (through arch/x86/includ=
e/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, arch/x86/include/asm=
/math_emu.h, ...):
>> arch/x86/include/asm/pgtable_types.h:234:9: sparse: this was the origina=
l definition
   kernel/sched/topology.c:83:56: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected struct sched_domain *sd @@  =
   got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:83:56: sparse:     expected struct sched_domain =
*sd
   kernel/sched/topology.c:83:56: sparse:     got struct sched_domain [node=
ref] __rcu *child
   kernel/sched/topology.c:102:60: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected struct sched_domain *sd @@ =
    got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:102:60: sparse:     expected struct sched_domain=
 *sd
   kernel/sched/topology.c:102:60: sparse:     got struct sched_domain [nod=
eref] __rcu *parent
   kernel/sched/topology.c:125:20: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct sched_domain *sd @@ =
    got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:125:20: sparse:     expected struct sched_domain=
 *sd
   kernel/sched/topology.c:125:20: sparse:     got struct sched_domain [nod=
eref] __rcu *parent
   kernel/sched/topology.c:404:13: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct perf_domain *[assign=
ed] tmp @@     got struct perf_domain [noderef] __rcu *pd @@
   kernel/sched/topology.c:404:13: sparse:     expected struct perf_domain =
*[assigned] tmp
   kernel/sched/topology.c:404:13: sparse:     got struct perf_domain [node=
ref] __rcu *pd
   kernel/sched/topology.c:413:13: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct perf_domain *[assign=
ed] tmp @@     got struct perf_domain [noderef] __rcu *pd @@
   kernel/sched/topology.c:413:13: sparse:     expected struct perf_domain =
*[assigned] tmp
   kernel/sched/topology.c:413:13: sparse:     got struct perf_domain [node=
ref] __rcu *pd
   kernel/sched/topology.c:434:19: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected struct perf_domain *[assign=
ed] pd @@     got struct perf_domain [noderef] __rcu *pd @@
   kernel/sched/topology.c:434:19: sparse:     expected struct perf_domain =
*[assigned] pd
   kernel/sched/topology.c:434:19: sparse:     got struct perf_domain [node=
ref] __rcu *pd
   kernel/sched/topology.c:595:49: sparse: sparse: incorrect type in initia=
lizer (different address spaces) @@     expected struct sched_domain *paren=
t @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:595:49: sparse:     expected struct sched_domain=
 *parent
   kernel/sched/topology.c:595:49: sparse:     got struct sched_domain [nod=
eref] __rcu *parent
   kernel/sched/topology.c:666:50: sparse: sparse: incorrect type in initia=
lizer (different address spaces) @@     expected struct sched_domain *paren=
t @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:666:50: sparse:     expected struct sched_domain=
 *parent
   kernel/sched/topology.c:666:50: sparse:     got struct sched_domain [nod=
eref] __rcu *parent
   kernel/sched/topology.c:673:55: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct sched_domain [nodere=
f] __rcu *[noderef] __rcu child @@     got struct sched_domain *[assigned] =
tmp @@
   kernel/sched/topology.c:673:55: sparse:     expected struct sched_domain=
 [noderef] __rcu *[noderef] __rcu child
   kernel/sched/topology.c:673:55: sparse:     got struct sched_domain *[as=
signed] tmp
   kernel/sched/topology.c:683:29: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct sched_domain *[assig=
ned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:683:29: sparse:     expected struct sched_domain=
 *[assigned] tmp
   kernel/sched/topology.c:683:29: sparse:     got struct sched_domain [nod=
eref] __rcu *parent
   kernel/sched/topology.c:688:20: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct sched_domain *sd @@ =
    got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:688:20: sparse:     expected struct sched_domain=
 *sd
   kernel/sched/topology.c:688:20: sparse:     got struct sched_domain [nod=
eref] __rcu *parent
   kernel/sched/topology.c:697:13: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct sched_domain *[assig=
ned] tmp @@     got struct sched_domain [noderef] __rcu *sd @@
   kernel/sched/topology.c:697:13: sparse:     expected struct sched_domain=
 *[assigned] tmp
   kernel/sched/topology.c:697:13: sparse:     got struct sched_domain [nod=
eref] __rcu *sd
   kernel/sched/topology.c:859:70: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected struct sched_domain *sd @@ =
    got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:859:70: sparse:     expected struct sched_domain=
 *sd
   kernel/sched/topology.c:859:70: sparse:     got struct sched_domain [nod=
eref] __rcu *child
   kernel/sched/topology.c:888:59: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected struct sched_domain *sd @@ =
    got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:888:59: sparse:     expected struct sched_domain=
 *sd
   kernel/sched/topology.c:888:59: sparse:     got struct sched_domain [nod=
eref] __rcu *child
   kernel/sched/topology.c:1058:40: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected struct sched_domain *chil=
d @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1058:40: sparse:     expected struct sched_domai=
n *child
   kernel/sched/topology.c:1058:40: sparse:     got struct sched_domain [no=
deref] __rcu *child
   kernel/sched/topology.c:1361:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected struct sched_domain [node=
ref] __rcu *child @@     got struct sched_domain *child @@
   kernel/sched/topology.c:1361:43: sparse:     expected struct sched_domai=
n [noderef] __rcu *child
   kernel/sched/topology.c:1361:43: sparse:     got struct sched_domain *ch=
ild
   kernel/sched/topology.c:1849:31: sparse: sparse: incorrect type in assig=
nment (different address spaces) @@     expected struct sched_domain [noder=
ef] __rcu *parent @@     got struct sched_domain *sd @@
   kernel/sched/topology.c:1849:31: sparse:     expected struct sched_domai=
n [noderef] __rcu *parent
   kernel/sched/topology.c:1849:31: sparse:     got struct sched_domain *sd
   kernel/sched/topology.c:2018:57: sparse: sparse: incorrect type in assig=
nment (different address spaces) @@     expected struct sched_domain *[assi=
gned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2018:57: sparse:     expected struct sched_domai=
n *[assigned] sd
   kernel/sched/topology.c:2018:57: sparse:     got struct sched_domain [no=
deref] __rcu *parent
   kernel/sched/topology.c:2035:57: sparse: sparse: incorrect type in assig=
nment (different address spaces) @@     expected struct sched_domain *[assi=
gned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2035:57: sparse:     expected struct sched_domai=
n *[assigned] sd
   kernel/sched/topology.c:2035:57: sparse:     got struct sched_domain [no=
deref] __rcu *parent
   kernel/sched/topology.c: note: in included file:
   kernel/sched/sched.h:1428:9: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/sched.h:1428:9: sparse:     expected struct sched_domain *[=
assigned] sd
   kernel/sched/sched.h:1428:9: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/sched.h:1441:9: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/sched.h:1441:9: sparse:     expected struct sched_domain *[=
assigned] sd
   kernel/sched/sched.h:1441:9: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/sched.h:1428:9: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/sched.h:1428:9: sparse:     expected struct sched_domain *[=
assigned] sd
   kernel/sched/sched.h:1428:9: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/sched.h:1441:9: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/sched.h:1441:9: sparse:     expected struct sched_domain *[=
assigned] sd
   kernel/sched/sched.h:1441:9: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/topology.c:1376:19: sparse: sparse: dereference of noderef =
expression
--
   kernel/sched/membarrier.c: note: in included file (through arch/x86/incl=
ude/asm/mmu_context.h, include/linux/mmu_context.h, kernel/sched/sched.h):
   include/linux/pkeys.h:65:9: sparse: sparse: preprocessor token PAGE_KERN=
EL_PKEY redefined
   kernel/sched/membarrier.c: note: in included file (through arch/x86/incl=
ude/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, arch/x86/include/a=
sm/math_emu.h, ...):
>> arch/x86/include/asm/pgtable_types.h:234:9: sparse: this was the origina=
l definition
--
   kernel/sched/cpufreq_schedutil.c: note: in included file (through arch/x=
86/include/asm/mmu_context.h, include/linux/mmu_context.h, kernel/sched/sch=
ed.h):
   include/linux/pkeys.h:65:9: sparse: sparse: preprocessor token PAGE_KERN=
EL_PKEY redefined
   kernel/sched/cpufreq_schedutil.c: note: in included file (through arch/x=
86/include/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, arch/x86/in=
clude/asm/math_emu.h, ...):
>> arch/x86/include/asm/pgtable_types.h:234:9: sparse: this was the origina=
l definition
--
   kernel/sched/psi.c: note: in included file (through arch/x86/include/asm=
/mmu_context.h, include/linux/mmu_context.h, kernel/sched/sched.h):
   include/linux/pkeys.h:65:9: sparse: sparse: preprocessor token PAGE_KERN=
EL_PKEY redefined
   kernel/sched/psi.c: note: in included file (through arch/x86/include/asm=
/paravirt_types.h, arch/x86/include/asm/ptrace.h, arch/x86/include/asm/math=
_emu.h, ...):
>> arch/x86/include/asm/pgtable_types.h:234:9: sparse: this was the origina=
l definition
   kernel/sched/psi.c:1217:9: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   kernel/sched/psi.c:1217:9: sparse:    void [noderef] __rcu *
   kernel/sched/psi.c:1217:9: sparse:    void *
   kernel/sched/psi.c:750:30: sparse: sparse: dereference of noderef expres=
sion
   kernel/sched/psi.c: note: in included file:
   kernel/sched/sched.h:1688:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1688:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:1688:25: sparse:    struct task_struct *

# https://github.com/weiny2/linux-kernel/commit/e3d7c75f395cdcdc542d601a5f2=
ff4da526580bc
git remote add weiny2 https://github.com/weiny2/linux-kernel.git
git fetch --no-tags weiny2 lm-pks-pmem-for-5.10-v4
git checkout e3d7c75f395cdcdc542d601a5f2ff4da526580bc
vim +234 arch/x86/include/asm/pgtable_types.h

8d19c99faf6165e Jeremy Fitzhardinge 2009-02-08  233  =

e3d7c75f395cdcd Fenghua Yu          2020-03-20 @234  #define PAGE_KERNEL_PK=
EY(pkey)	__pgprot_mask(__PAGE_KERNEL | _PAGE_PKEY(pkey))
e3d7c75f395cdcd Fenghua Yu          2020-03-20  235  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5885924742505227227==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5885924742505227227==--

