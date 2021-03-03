Content-Type: multipart/mixed; boundary="===============2957889628217559322=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [peterz-queue:sched/core-sched 42/43] kernel/sched/core.c:377:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
Date: Wed, 03 Mar 2021 22:39:48 +0800
Message-ID: <202103032237.V1PZLnE3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2957889628217559322==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sc=
hed/core-sched
head:   4a2c9e0f53dc03a005b20f0355d0833b577e304b
commit: 18016992c4635b47e8494f599697d7cdcb78bdf9 [42/43] sched: Prepare to =
drop stop_machine() for core sched
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: powerpc64-randconfig-s032-20210303 (attached as .config)
compiler: powerpc64le-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-245-gacc5c298-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/=
commit/?id=3D18016992c4635b47e8494f599697d7cdcb78bdf9
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/ke=
rnel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/core-sched
        git checkout 18016992c4635b47e8494f599697d7cdcb78bdf9
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dpowerpc64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
   kernel/sched/core.c:254:6: sparse: sparse: symbol 'sched_core_get' was n=
ot declared. Should it be static?
   kernel/sched/core.c:262:6: sparse: sparse: symbol 'sched_core_put' was n=
ot declared. Should it be static?
   kernel/sched/core.c:604:48: sparse: sparse: incorrect type in argument 2=
 (different address spaces) @@     expected struct task_struct *p @@     go=
t struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:604:48: sparse:     expected struct task_struct *p
   kernel/sched/core.c:604:48: sparse:     got struct task_struct [noderef]=
 __rcu *curr
   kernel/sched/core.c:858:38: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected struct task_struct *curr @@   =
  got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:858:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:858:38: sparse:     got struct task_struct [noderef]=
 __rcu *curr
   kernel/sched/core.c:1978:33: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected struct task_struct *p @@     g=
ot struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1978:33: sparse:     expected struct task_struct *p
   kernel/sched/core.c:1978:33: sparse:     got struct task_struct [noderef=
] __rcu *curr
   kernel/sched/core.c:1978:68: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected struct task_struct *tsk @@    =
 got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1978:68: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:1978:68: sparse:     got struct task_struct [noderef=
] __rcu *curr
   kernel/sched/core.c:3185:17: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:3185:17: sparse:     expected struct sched_domain *[=
assigned] sd
   kernel/sched/core.c:3185:17: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/core.c:3382:36: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected struct task_struct const *p @@=
     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3382:36: sparse:     expected struct task_struct con=
st *p
   kernel/sched/core.c:3382:36: sparse:     got struct task_struct [noderef=
] __rcu *curr
   kernel/sched/core.c:8361:43: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected struct task_struct *push_task=
 @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:8361:43: sparse:     expected struct task_struct *pu=
sh_task
   kernel/sched/core.c:8361:43: sparse:     got struct task_struct [noderef=
] __rcu *curr
   kernel/sched/core.c:4803:38: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected struct task_struct *curr @@  =
   got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:4803:38: sparse:     expected struct task_struct *cu=
rr
   kernel/sched/core.c:4803:38: sparse:     got struct task_struct [noderef=
] __rcu *curr
   kernel/sched/core.c:5478:32: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/core.c:5478:32: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/core.c:5478:32: sparse:    struct task_struct *
   kernel/sched/core.c:5505:23: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/core.c:5505:23: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/core.c:5505:23: sparse:    struct task_struct *
   kernel/sched/core.c:5513:46: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/core.c:5513:46: sparse:    struct task_struct *
   kernel/sched/core.c:5513:46: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/core.c:5570:9: sparse: sparse: incorrect type in assignment=
 (different address spaces) @@     expected struct sched_domain *[assigned]=
 sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:5570:9: sparse:     expected struct sched_domain *[a=
ssigned] sd
   kernel/sched/core.c:5570:9: sparse:     got struct sched_domain [noderef=
] __rcu *parent
   kernel/sched/core.c:5688:14: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct task_struct *prev @@   =
  got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:5688:14: sparse:     expected struct task_struct *pr=
ev
   kernel/sched/core.c:5688:14: sparse:     got struct task_struct [noderef=
] __rcu *curr
   kernel/sched/core.c:6347:17: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/core.c:6347:17: sparse:    struct task_struct *
   kernel/sched/core.c:6347:17: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/core.c:6554:22: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/core.c:6554:22: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/core.c:6554:22: sparse:    struct task_struct *
   kernel/sched/core.c:10242:25: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected struct task_struct *p @@     =
got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:10242:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:10242:25: sparse:     got struct task_struct [nodere=
f] __rcu *curr
>> kernel/sched/core.c:377:6: sparse: sparse: context imbalance in 'raw_spi=
n_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:395:6: sparse: sparse: context imbalance in 'raw_spi=
n_rq_trylock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1138:30: sparse: sparse: context imbalance in 'raw_=
spin_rq_unlock' - unexpected unlock
   kernel/sched/sched.h:1138:30: sparse: sparse: context imbalance in '__ta=
sk_rq_lock' - wrong count at exit
   kernel/sched/sched.h:1138:30: sparse: sparse: context imbalance in 'task=
_rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:85:13: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct task_struct const *p @@  =
   got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:85:13: sparse:     expected struct task_struct const=
 *p
   kernel/sched/pelt.h:85:13: sparse:     got struct task_struct [noderef] =
__rcu *curr
   kernel/sched/core.c:604:11: sparse: sparse: dereference of noderef expre=
ssion
   kernel/sched/core.c:1969:33: sparse: sparse: dereference of noderef expr=
ession
   kernel/sched/core.c:1970:19: sparse: sparse: dereference of noderef expr=
ession
   kernel/sched/core.c:1971:37: sparse: sparse: dereference of noderef expr=
ession
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1880:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1880:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:1880:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2038:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:2038:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:2038:9: sparse:    struct task_struct *
   kernel/sched/core.c:1944:38: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/core.c:1944:38: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/core.c:1944:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:1880:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1880:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:1880:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2038:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:2038:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:2038:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2038:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:2038:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:2038:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2038:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:2038:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:2038:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2038:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:2038:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:2038:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1880:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1880:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:1880:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2038:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:2038:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:2038:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1880:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1880:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:1880:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2038:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:2038:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:2038:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1880:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1880:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:1880:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2038:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:2038:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:2038:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1880:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1880:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:1880:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2038:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:2038:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:2038:9: sparse:    struct task_struct *

vim +/raw_spin_rq_lock_nested +377 kernel/sched/core.c

fa85ae2418e684 kernel/sched.c      Peter Zijlstra 2008-01-25  282  =

58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  283  =

58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  284  /*
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  285   * Seria=
lization rules:
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  286   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  287   * Lock =
order:
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  288   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  289   *   p->=
pi_lock
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  290   *     r=
q->lock
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  291   *      =
 hrtimer_cpu_base->lock (hrtimer_start() for bandwidth controls)
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  292   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  293   *  rq1-=
>lock
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  294   *    rq=
2->lock  where: rq1 < rq2
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  295   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  296   * Regul=
ar state:
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  297   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  298   * Norma=
l scheduling state is serialized by rq->lock. __schedule() takes the
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  299   * local=
 CPU's rq->lock, it optionally removes the task from the runqueue and
b19a888c1e9bdf kernel/sched/core.c Tal Zussman    2020-11-12  300   * alway=
s looks at the local rq data structures to find the most eligible task
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  301   * to ru=
n next.
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  302   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  303   * Task =
enqueue is also under rq->lock, possibly taken from another CPU.
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  304   * Wakeu=
ps from another LLC domain might use an IPI to transfer the enqueue to
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  305   * the l=
ocal CPU to avoid bouncing the runqueue state around [ see
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  306   * ttwu_=
queue_wakelist() ]
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  307   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  308   * Task =
wakeup, specifically wakeups that involve migration, are horribly
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  309   * compl=
icated to avoid having to take two rq->locks.
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  310   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  311   * Speci=
al state:
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  312   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  313   * Syste=
m-calls and anything external will use task_rq_lock() which acquires
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  314   * both =
p->pi_lock and rq->lock. As a consequence the state they change is
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  315   * stabl=
e while holding either lock:
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  316   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  317   *  - sc=
hed_setaffinity()/
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  318   *    se=
t_cpus_allowed_ptr():	p->cpus_ptr, p->nr_cpus_allowed
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  319   *  - se=
t_user_nice():		p->se.load, p->*prio
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  320   *  - __=
sched_setscheduler():	p->sched_class, p->policy, p->*prio,
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  321   *				p-=
>se.load, p->rt_priority,
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  322   *				p-=
>dl.dl_{runtime, deadline, period, flags, bw, density}
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  323   *  - sc=
hed_setnuma():		p->numa_preferred_nid
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  324   *  - sc=
hed_move_task()/
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  325   *    cp=
u_cgroup_fork():	p->sched_task_group
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  326   *  - uc=
lamp_update_active()	p->uclamp*
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  327   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  328   * p->st=
ate <- TASK_*:
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  329   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  330   *   is =
changed locklessly using set_current_state(), __set_current_state() or
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  331   *   set=
_special_state(), see their respective comments, or by
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  332   *   try=
_to_wake_up(). This latter uses p->pi_lock to serialize against
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  333   *   con=
current self.
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  334   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  335   * p->on=
_rq <- { 0, 1 =3D TASK_ON_RQ_QUEUED, 2 =3D TASK_ON_RQ_MIGRATING }:
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  336   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  337   *   is =
set by activate_task() and cleared by deactivate_task(), under
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  338   *   rq-=
>lock. Non-zero indicates the task is runnable, the special
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  339   *   ON_=
RQ_MIGRATING state is used for migration without holding both
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  340   *   rq-=
>locks. It indicates task_cpu() is not stable, see task_rq_lock().
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  341   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  342   * p->on=
_cpu <- { 0, 1 }:
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  343   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  344   *   is =
set by prepare_task() and cleared by finish_task() such that it will be
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  345   *   set=
 before p is scheduled-in and cleared after p is scheduled-out, both
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  346   *   und=
er rq->lock. Non-zero indicates the task is running on its CPU.
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  347   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  348   *   [ T=
he astute reader will observe that it is possible for two tasks on one
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  349   *     C=
PU to have ->on_cpu =3D 1 at the same time. ]
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  350   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  351   * task_=
cpu(p): is changed by set_task_cpu(), the rules are:
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  352   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  353   *  - Do=
n't call set_task_cpu() on a blocked task:
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  354   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  355   *    We=
 don't care what CPU we're not running on, this simplifies hotplug,
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  356   *    th=
e CPU assignment of blocked tasks isn't required to be valid.
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  357   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  358   *  - fo=
r try_to_wake_up(), called under p->pi_lock:
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  359   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  360   *    Th=
is allows try_to_wake_up() to only take one rq->lock, see its comment.
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  361   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  362   *  - fo=
r migration called under rq->lock:
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  363   *    [ =
see task_on_rq_migrating() in task_rq_lock() ]
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  364   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  365   *    o =
move_queued_task()
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  366   *    o =
detach_task()
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  367   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  368   *  - fo=
r migration called under double_rq_lock():
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  369   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  370   *    o =
__migrate_swap_task()
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  371   *    o =
push_rt_task() / pull_rt_task()
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  372   *    o =
push_dl_task() / pull_dl_task()
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  373   *    o =
dl_task_offline_migration()
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  374   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  375   */
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  376  =

c2a73235e000ad kernel/sched/core.c Peter Zijlstra 2021-03-02 @377  void raw=
_spin_rq_lock_nested(struct rq *rq, int subclass)
c2a73235e000ad kernel/sched/core.c Peter Zijlstra 2021-03-02  378  {
18016992c4635b kernel/sched/core.c Peter Zijlstra 2021-03-02  379  	raw_spi=
nlock_t *lock;
18016992c4635b kernel/sched/core.c Peter Zijlstra 2021-03-02  380  =

18016992c4635b kernel/sched/core.c Peter Zijlstra 2021-03-02  381  	if (!st=
atic_branch_unlikely(&__sched_core_enabled)) {
18016992c4635b kernel/sched/core.c Peter Zijlstra 2021-03-02  382  		raw_sp=
in_lock_nested(&rq->__lock, subclass);
18016992c4635b kernel/sched/core.c Peter Zijlstra 2021-03-02  383  		return;
18016992c4635b kernel/sched/core.c Peter Zijlstra 2021-03-02  384  	}
18016992c4635b kernel/sched/core.c Peter Zijlstra 2021-03-02  385  =

18016992c4635b kernel/sched/core.c Peter Zijlstra 2021-03-02  386  	for (;;=
) {
18016992c4635b kernel/sched/core.c Peter Zijlstra 2021-03-02  387  		lock =
=3D rq_lockp(rq);
18016992c4635b kernel/sched/core.c Peter Zijlstra 2021-03-02  388  		raw_sp=
in_lock_nested(lock, subclass);
18016992c4635b kernel/sched/core.c Peter Zijlstra 2021-03-02  389  		if (li=
kely(lock =3D=3D rq_lockp(rq)))
18016992c4635b kernel/sched/core.c Peter Zijlstra 2021-03-02  390  			retur=
n;
18016992c4635b kernel/sched/core.c Peter Zijlstra 2021-03-02  391  		raw_sp=
in_unlock(lock);
18016992c4635b kernel/sched/core.c Peter Zijlstra 2021-03-02  392  	}
c2a73235e000ad kernel/sched/core.c Peter Zijlstra 2021-03-02  393  }
c2a73235e000ad kernel/sched/core.c Peter Zijlstra 2021-03-02  394  =


:::::: The code at line 377 was first introduced by commit
:::::: c2a73235e000ad7365055061a464af75cb48963a sched: Provide raw_spin_rq_=
*lock*() helpers

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2957889628217559322==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============2957889628217559322==--

