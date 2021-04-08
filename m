Content-Type: multipart/mixed; boundary="===============8450843368780063140=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rcu:dev.2021.04.06a 65/73] include/linux/rcutiny.h:105:44: sparse: sparse: context imbalance in 'send_sigqueue' - wrong count at exit
Date: Thu, 08 Apr 2021 08:50:24 +0800
Message-ID: <202104080816.bUB2SLnM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8450843368780063140==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.g=
it dev.2021.04.06a
head:   2d5149067a2aca5be4d24fc0f8368e48b47d222d
commit: 420d9384a0b98b51e74684d55d7853dfc113d660 [65/73] rcu: Reject RCU_LO=
CKDEP_WARN() false positives
:::::: branch date: 2 hours ago
:::::: commit date: 26 hours ago
config: x86_64-randconfig-s022-20210407 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.3-279-g6d5d9b42-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu=
.git/commit/?id=3D420d9384a0b98b51e74684d55d7853dfc113d660
        git remote add rcu https://git.kernel.org/pub/scm/linux/kernel/git/=
paulmck/linux-rcu.git
        git fetch --no-tags rcu dev.2021.04.06a
        git checkout 420d9384a0b98b51e74684d55d7853dfc113d660
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=
=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   kernel/signal.c:2280:33: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:2280:33: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:2377:41: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2377:41: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:2377:41: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:2462:41: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2462:41: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:2462:41: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:2474:33: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2474:33: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:2474:33: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:2512:52: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct task_struct *tsk @@     got=
 struct task_struct [noderef] __rcu *parent @@
   kernel/signal.c:2512:52: sparse:     expected struct task_struct *tsk
   kernel/signal.c:2512:52: sparse:     got struct task_struct [noderef] __=
rcu *parent
   kernel/signal.c:2514:49: sparse: sparse: cast removes address space '__r=
cu' of expression
   kernel/signal.c:2549:49: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected struct sighand_struct *sighand @@=
     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/signal.c:2549:49: sparse:     expected struct sighand_struct *sig=
hand
   kernel/signal.c:2549:49: sparse:     got struct sighand_struct [noderef]=
 __rcu *sighand
   kernel/signal.c:2878:27: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2878:27: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:2878:27: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:2898:29: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2898:29: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:2898:29: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:2965:27: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2965:27: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:2965:27: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:2967:29: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2967:29: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:2967:29: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:3118:31: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3118:31: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:3118:31: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:3121:33: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3121:33: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:3121:33: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:3504:27: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3504:27: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:3504:27: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:3516:37: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3516:37: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:3516:37: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:3521:35: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3521:35: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:3521:35: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:3526:29: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3526:29: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:3526:29: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:3980:31: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3980:31: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:3980:31: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:3992:33: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3992:33: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:3992:33: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:4010:11: sparse: sparse: incorrect type in assignment (d=
ifferent address spaces) @@     expected struct k_sigaction *k @@     got s=
truct k_sigaction [noderef] __rcu * @@
   kernel/signal.c:4010:11: sparse:     expected struct k_sigaction *k
   kernel/signal.c:4010:11: sparse:     got struct k_sigaction [noderef] __=
rcu *
   kernel/signal.c:4012:25: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:4012:25: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:4012:25: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:4058:27: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:4058:27: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:4058:27: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:69:34: sparse: sparse: dereference of noderef expression
   kernel/signal.c:529:35: sparse: sparse: dereference of noderef expression
   kernel/signal.c:557:52: sparse: sparse: dereference of noderef expression
   kernel/signal.c:884:9: sparse: sparse: dereference of noderef expression
   kernel/signal.c:1031:13: sparse: sparse: dereference of noderef expressi=
on
   kernel/signal.c:1079:9: sparse: sparse: dereference of noderef expression
   kernel/signal.c: note: in included file:
   include/linux/signalfd.h:21:13: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected struct wait_queue_head *wq_=
head @@     got struct wait_queue_head [noderef] __rcu * @@
   include/linux/signalfd.h:21:13: sparse:     expected struct wait_queue_h=
ead *wq_head
   include/linux/signalfd.h:21:13: sparse:     got struct wait_queue_head [=
noderef] __rcu *
   include/linux/signalfd.h:22:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected struct wait_queue_head *wq_=
head @@     got struct wait_queue_head [noderef] __rcu * @@
   include/linux/signalfd.h:22:17: sparse:     expected struct wait_queue_h=
ead *wq_head
   include/linux/signalfd.h:22:17: sparse:     got struct wait_queue_head [=
noderef] __rcu *
   kernel/signal.c: note: in included file (through include/linux/sched/cpu=
time.h):
   include/linux/sched/signal.h:708:37: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected struct spinlock [usert=
ype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:708:37: sparse:     expected struct spinloc=
k [usertype] *lock
   include/linux/sched/signal.h:708:37: sparse:     got struct spinlock [no=
deref] __rcu *
   kernel/signal.c:1295:9: sparse: sparse: context imbalance in 'do_send_si=
g_info' - different lock contexts for basic block
   kernel/signal.c: note: in included file (through include/linux/rbtree.h,=
 include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:709:9: sparse: sparse: context imbalance in '__=
lock_task_sighand' - different lock contexts for basic block
   kernel/signal.c: note: in included file (through include/linux/sched/cpu=
time.h):
   include/linux/sched/signal.h:708:37: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected struct spinlock [usert=
ype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:708:37: sparse:     expected struct spinloc=
k [usertype] *lock
   include/linux/sched/signal.h:708:37: sparse:     got struct spinlock [no=
deref] __rcu *
   kernel/signal.c:1647:35: sparse: sparse: dereference of noderef expressi=
on
   kernel/signal.c: note: in included file:
   include/linux/signalfd.h:21:13: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected struct wait_queue_head *wq_=
head @@     got struct wait_queue_head [noderef] __rcu * @@
   include/linux/signalfd.h:21:13: sparse:     expected struct wait_queue_h=
ead *wq_head
   include/linux/signalfd.h:21:13: sparse:     got struct wait_queue_head [=
noderef] __rcu *
   include/linux/signalfd.h:22:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected struct wait_queue_head *wq_=
head @@     got struct wait_queue_head [noderef] __rcu * @@
   include/linux/signalfd.h:22:17: sparse:     expected struct wait_queue_h=
ead *wq_head
   include/linux/signalfd.h:22:17: sparse:     got struct wait_queue_head [=
noderef] __rcu *
   kernel/signal.c: note: in included file (through include/linux/sched/cpu=
time.h):
   include/linux/sched/signal.h:708:37: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected struct spinlock [usert=
ype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:708:37: sparse:     expected struct spinloc=
k [usertype] *lock
   include/linux/sched/signal.h:708:37: sparse:     got struct spinlock [no=
deref] __rcu *
   kernel/signal.c: note: in included file (through include/linux/rcupdate.=
h, include/linux/rbtree.h, include/linux/mm_types.h, ...):
>> include/linux/rcutiny.h:105:44: sparse: sparse: context imbalance in 'se=
nd_sigqueue' - wrong count at exit
   kernel/signal.c:1951:40: sparse: sparse: dereference of noderef expressi=
on
   kernel/signal.c:1951:40: sparse: sparse: dereference of noderef expressi=
on
   kernel/signal.c:1951:40: sparse: sparse: dereference of noderef expressi=
on
   kernel/signal.c:1951:40: sparse: sparse: dereference of noderef expressi=
on
   kernel/signal.c:2094:13: sparse: sparse: dereference of noderef expressi=
on
   kernel/signal.c: note: in included file (through include/uapi/asm-generi=
c/bpf_perf_event.h, arch/x86/include/generated/uapi/asm/bpf_perf_event.h, .=
..):
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
   kernel/signal.c:2305:13: sparse: sparse: context imbalance in 'do_signal=
_stop' - different lock contexts for basic block
   kernel/signal.c:2514:49: sparse: sparse: dereference of noderef expressi=
on
   kernel/signal.c:2514:49: sparse: sparse: dereference of noderef expressi=
on
   kernel/signal.c:2514:49: sparse: sparse: dereference of noderef expressi=
on
   kernel/signal.c:2514:49: sparse: sparse: dereference of noderef expressi=
on
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
   kernel/signal.c:2630:69: sparse: sparse: context imbalance in 'get_signa=
l' - unexpected unlock
   kernel/signal.c:3981:33: sparse: sparse: dereference of noderef expressi=
on
--
   kernel/events/core.c:583:26: sparse: sparse: function 'perf_pmu_name' wi=
th external linkage has definition
   kernel/events/core.c:1466:15: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/events/core.c:1466:15: sparse:    struct perf_event_context [node=
ref] __rcu *
   kernel/events/core.c:1466:15: sparse:    struct perf_event_context *
   kernel/events/core.c:1479:28: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/events/core.c:1479:28: sparse:    struct perf_event_context [node=
ref] __rcu *
   kernel/events/core.c:1479:28: sparse:    struct perf_event_context *
   kernel/events/core.c:3390:18: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/events/core.c:3390:18: sparse:    struct perf_event_context [node=
ref] __rcu *
   kernel/events/core.c:3390:18: sparse:    struct perf_event_context *
   kernel/events/core.c:3391:23: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/events/core.c:3391:23: sparse:    struct perf_event_context [node=
ref] __rcu *
   kernel/events/core.c:3391:23: sparse:    struct perf_event_context *
   kernel/events/core.c:3439:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/events/core.c:3439:25: sparse:    struct perf_event_context [node=
ref] __rcu *
   kernel/events/core.c:3439:25: sparse:    struct perf_event_context *
   kernel/events/core.c:3440:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/events/core.c:3440:25: sparse:    struct perf_event_context [node=
ref] __rcu *
   kernel/events/core.c:3440:25: sparse:    struct perf_event_context *
   kernel/events/core.c:4582:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/events/core.c:4582:25: sparse:    struct perf_event_context [node=
ref] __rcu *
   kernel/events/core.c:4582:25: sparse:    struct perf_event_context *
   kernel/events/core.c:5844:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/events/core.c:5844:9: sparse:    struct perf_buffer [noderef] __r=
cu *
   kernel/events/core.c:5844:9: sparse:    struct perf_buffer *
   kernel/events/core.c:5320:24: sparse: sparse: incorrect type in assignme=
nt (different base types) @@     expected restricted __poll_t [usertype] ev=
ents @@     got int @@
   kernel/events/core.c:5550:22: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/events/core.c:5550:22: sparse:    struct perf_buffer [noderef] __=
rcu *
   kernel/events/core.c:5550:22: sparse:    struct perf_buffer *
   kernel/events/core.c:5686:14: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/events/core.c:5686:14: sparse:    struct perf_buffer [noderef] __=
rcu *
   kernel/events/core.c:5686:14: sparse:    struct perf_buffer *
   kernel/events/core.c:5719:14: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/events/core.c:5719:14: sparse:    struct perf_buffer [noderef] __=
rcu *
   kernel/events/core.c:5719:14: sparse:    struct perf_buffer *
   kernel/events/core.c:5776:14: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/events/core.c:5776:14: sparse:    struct perf_buffer [noderef] __=
rcu *
   kernel/events/core.c:5776:14: sparse:    struct perf_buffer *
   kernel/events/core.c:5862:14: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/events/core.c:5862:14: sparse:    struct perf_buffer [noderef] __=
rcu *
   kernel/events/core.c:5862:14: sparse:    struct perf_buffer *
   kernel/events/core.c:5875:14: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/events/core.c:5875:14: sparse:    struct perf_buffer [noderef] __=
rcu *
   kernel/events/core.c:5875:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6557:6: sparse: sparse: symbol 'perf_pmu_snapshot_a=
ux' was not declared. Should it be static?
   kernel/events/core.c:7476:23: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/events/core.c:7476:23: sparse:    struct perf_event_context [node=
ref] __rcu *
   kernel/events/core.c:7476:23: sparse:    struct perf_event_context *
   kernel/events/core.c:7567:13: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/events/core.c:7567:13: sparse:    struct perf_buffer [noderef] __=
rcu *
   kernel/events/core.c:7567:13: sparse:    struct perf_buffer *
   kernel/events/core.c:7672:61: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected struct task_struct *p @@     =
got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:7672:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:7672:61: sparse:     got struct task_struct [nodere=
f] __rcu *real_parent
   kernel/events/core.c:7674:61: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected struct task_struct *p @@     =
got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:7674:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:7674:61: sparse:     got struct task_struct [nodere=
f] __rcu *real_parent
   kernel/events/core.c:8379:23: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/events/core.c:8379:23: sparse:    struct perf_event_context [node=
ref] __rcu *
   kernel/events/core.c:8379:23: sparse:    struct perf_event_context *
   kernel/events/core.c:9343:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/events/core.c:9343:9: sparse:    struct swevent_hlist [noderef] _=
_rcu *
   kernel/events/core.c:9343:9: sparse:    struct swevent_hlist *
   kernel/events/core.c:9382:17: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/events/core.c:9382:17: sparse:    struct swevent_hlist [noderef] =
__rcu *
   kernel/events/core.c:9382:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:9563:23: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/events/core.c:9563:23: sparse:    struct perf_event_context [node=
ref] __rcu *
   kernel/events/core.c:9563:23: sparse:    struct perf_event_context *
   kernel/events/core.c:10748:1: sparse: sparse: symbol 'dev_attr_nr_addr_f=
ilters' was not declared. Should it be static?
   kernel/events/core.c:12489:9: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/events/core.c:12489:9: sparse:    struct perf_event_context [node=
ref] __rcu *
   kernel/events/core.c:12489:9: sparse:    struct perf_event_context *
   kernel/events/core.c:12599:17: sparse: sparse: incompatible types in com=
parison expression (different address spaces):
   kernel/events/core.c:12599:17: sparse:    struct perf_event_context [nod=
eref] __rcu *
   kernel/events/core.c:12599:17: sparse:    struct perf_event_context *
   kernel/events/core.c:13022:17: sparse: sparse: incompatible types in com=
parison expression (different address spaces):
   kernel/events/core.c:13022:17: sparse:    struct swevent_hlist [noderef]=
 __rcu *
   kernel/events/core.c:13022:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:166:9: sparse: sparse: context imbalance in 'perf_c=
tx_lock' - wrong count at exit
   kernel/events/core.c:174:17: sparse: sparse: context imbalance in 'perf_=
ctx_unlock' - unexpected unlock
   kernel/events/core.c: note: in included file (through include/linux/rcup=
date.h, include/linux/rculist.h, include/linux/dcache.h, ...):
>> include/linux/rcutiny.h:105:44: sparse: sparse: context imbalance in 'pe=
rf_lock_task_context' - different lock contexts for basic block
   kernel/events/core.c:1513:17: sparse: sparse: context imbalance in 'perf=
_pin_task_context' - unexpected unlock
   kernel/events/core.c:2807:9: sparse: sparse: context imbalance in '__per=
f_install_in_context' - wrong count at exit
   kernel/events/core.c:4554:17: sparse: sparse: context imbalance in 'find=
_get_context' - unexpected unlock
   kernel/events/core.c: note: in included file:
   kernel/events/internal.h:204:1: sparse: sparse: incorrect type in argume=
nt 2 (different address spaces) @@     expected void const [noderef] __user=
 *from @@     got void const *buf @@
   kernel/events/core.c:9192:17: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/events/core.c:9192:17: sparse:    struct swevent_hlist [noderef] =
__rcu *
   kernel/events/core.c:9192:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:9212:17: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/events/core.c:9212:17: sparse:    struct swevent_hlist [noderef] =
__rcu *
   kernel/events/core.c:9212:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:9332:16: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/events/core.c:9332:16: sparse:    struct swevent_hlist [noderef] =
__rcu *
   kernel/events/core.c:9332:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:9332:16: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/events/core.c:9332:16: sparse:    struct swevent_hlist [noderef] =
__rcu *
   kernel/events/core.c:9332:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:9332:16: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/events/core.c:9332:16: sparse:    struct swevent_hlist [noderef] =
__rcu *
   kernel/events/core.c:9332:16: sparse:    struct swevent_hlist *

vim +/send_sigqueue +105 include/linux/rcutiny.h

5f192ab027a5d8 Paul E. McKenney 2017-05-03   75  =

29ce831000081d Gleb Natapov     2011-05-04   76  /*
29ce831000081d Gleb Natapov     2011-05-04   77   * Take advantage of the f=
act that there is only one CPU, which
29ce831000081d Gleb Natapov     2011-05-04   78   * allows us to ignore vir=
tualization-based context switches.
29ce831000081d Gleb Natapov     2011-05-04   79   */
71c40fd0b5ceb3 Paul E. McKenney 2017-05-03   80  static inline void rcu_vir=
t_note_context_switch(int cpu) { }
71c40fd0b5ceb3 Paul E. McKenney 2017-05-03   81  static inline void rcu_cpu=
_stall_reset(void) { }
1b27291b1ea4f1 Paul E. McKenney 2018-07-18   82  static inline int rcu_jiff=
ies_till_stall_check(void) { return 21 * HZ; }
71c40fd0b5ceb3 Paul E. McKenney 2017-05-03   83  static inline void rcu_idl=
e_enter(void) { }
71c40fd0b5ceb3 Paul E. McKenney 2017-05-03   84  static inline void rcu_idl=
e_exit(void) { }
71c40fd0b5ceb3 Paul E. McKenney 2017-05-03   85  static inline void rcu_irq=
_enter(void) { }
71c40fd0b5ceb3 Paul E. McKenney 2017-05-03   86  static inline void rcu_irq=
_exit_irqson(void) { }
71c40fd0b5ceb3 Paul E. McKenney 2017-05-03   87  static inline void rcu_irq=
_enter_irqson(void) { }
71c40fd0b5ceb3 Paul E. McKenney 2017-05-03   88  static inline void rcu_irq=
_exit(void) { }
07325d4a90d2d8 Thomas Gleixner  2020-05-21   89  static inline void rcu_irq=
_exit_check_preempt(void) { }
3fcd6a230fa7d0 Paul E. McKenney 2020-09-03   90  #define rcu_is_idle_cpu(cp=
u) \
3fcd6a230fa7d0 Paul E. McKenney 2020-09-03   91  	(is_idle_task(current) &&=
 !in_nmi() && !in_irq() && !in_serving_softirq())
71c40fd0b5ceb3 Paul E. McKenney 2017-05-03   92  static inline void exit_rc=
u(void) { }
3e31009898699d Paul E. McKenney 2018-06-21   93  static inline bool rcu_pre=
empt_need_deferred_qs(struct task_struct *t)
3e31009898699d Paul E. McKenney 2018-06-21   94  {
3e31009898699d Paul E. McKenney 2018-06-21   95  	return false;
3e31009898699d Paul E. McKenney 2018-06-21   96  }
3e31009898699d Paul E. McKenney 2018-06-21   97  static inline void rcu_pre=
empt_deferred_qs(struct task_struct *t) { }
825c5bd2fd47d3 Paul E. McKenney 2017-05-26   98  #ifdef CONFIG_SRCU
584dc4ce552677 Teodora Baluta   2013-11-11   99  void rcu_scheduler_startin=
g(void);
825c5bd2fd47d3 Paul E. McKenney 2017-05-26  100  #else /* #ifndef CONFIG_SR=
CU */
71c40fd0b5ceb3 Paul E. McKenney 2017-05-03  101  static inline void rcu_sch=
eduler_starting(void) { }
825c5bd2fd47d3 Paul E. McKenney 2017-05-26  102  #endif /* #else #ifndef CO=
NFIG_SRCU */
d2b1654f91f9e9 Paul E. McKenney 2017-05-11  103  static inline void rcu_end=
_inkernel_boot(void) { }
59ee0326ccf712 Paul E. McKenney 2019-11-28  104  static inline bool rcu_ink=
ernel_boot_has_ended(void) { return true; }
71c40fd0b5ceb3 Paul E. McKenney 2017-05-03 @105  static inline bool rcu_is_=
watching(void) { return true; }
79ba7ff5a9925f Paul E. McKenney 2019-08-04  106  static inline void rcu_mom=
entary_dyntick_idle(void) { }
a35d16905efc6a Byungchul Park   2019-08-05  107  static inline void kfree_r=
cu_scheduler_running(void) { }
6be7436d2245d3 Paul E. McKenney 2020-04-10  108  static inline bool rcu_gp_=
might_be_stalled(void) { return false; }
5c173eb8bcb9c1 Paul E. McKenney 2013-09-13  109  =


:::::: The code at line 105 was first introduced by commit
:::::: 71c40fd0b5ceb300c6cb8753835d9d94a8bfc56f rcu: Move rcutiny.h to new =
empty/true/false-function style

:::::: TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8450843368780063140==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8450843368780063140==--

