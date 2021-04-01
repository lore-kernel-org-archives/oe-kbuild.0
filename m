Content-Type: multipart/mixed; boundary="===============0341457631590160035=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 8729/9190] drivers/misc/altera-stapl/altera.c:2113:1: warning: the frame size of 4232 bytes is larger than 1024 bytes
Date: Fri, 02 Apr 2021 00:21:35 +0800
Message-ID: <202104020023.za9dag7v-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0341457631590160035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Julian Braha <julianbraha@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Julian,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   454c576c3f5e51d60f00a4ac0dde07f4f9d70e9d
commit: 969f31e9eae3fb5d8388677c2ec34c2f447f7376 [8729/9190] lib: fix kconf=
ig dependency on ARCH_WANT_FRAME_POINTERS
:::::: branch date: 8 hours ago
:::::: commit date: 12 hours ago
config: csky-randconfig-s031-20210401 (attached as .config)
compiler: csky-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-279-g6d5d9b42-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D969f31e9eae3fb5d8388677c2ec34c2f447f7376
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 969f31e9eae3fb5d8388677c2ec34c2f447f7376
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dcsky =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/misc/altera-stapl/altera.c: In function 'altera_execute':
>> drivers/misc/altera-stapl/altera.c:2113:1: warning: the frame size of 42=
32 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
    2113 | }
         | ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LOCKDEP
   Depends on DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT && (FRAME_POINTER || M=
IPS || PPC || S390 || MICROBLAZE || ARM || ARC || X86)
   Selected by
   - PROVE_LOCKING && DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT
   - DEBUG_LOCK_ALLOC && DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT


sparse warnings: (new ones prefixed by >>)
>> arch/csky/kernel/perf_callchain.c:57:49: sparse: sparse: incorrect type =
in argument 2 (different address spaces) @@     expected void const [nodere=
f] __user *from @@     got unsigned long *user_frame_tail @@
   arch/csky/kernel/perf_callchain.c:57:49: sparse:     expected void const=
 [noderef] __user *from
   arch/csky/kernel/perf_callchain.c:57:49: sparse:     got unsigned long *=
user_frame_tail
   arch/csky/kernel/perf_callchain.c: note: in included file (through inclu=
de/linux/sched/task.h, include/linux/sched/signal.h, include/linux/ptrace.h=
, ...):
   include/linux/uaccess.h:103:39: sparse: sparse: incorrect type in argume=
nt 2 (different address spaces) @@     expected void const *from @@     got=
 void const [noderef] __user *from @@
   include/linux/uaccess.h:103:39: sparse:     expected void const *from
   include/linux/uaccess.h:103:39: sparse:     got void const [noderef] __u=
ser *from
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
>> kernel/events/core.c:11514:15: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const *addr @@     got =
unsigned int const [noderef] __user *__gu_ptr @@
>> kernel/events/core.c:11617:9: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@     expected unsigned int *__pu_addr @@  =
   got unsigned int [noderef] __user * @@
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
   kernel/events/core.c: note: in included file (through include/linux/rcul=
ist.h, include/linux/dcache.h, include/linux/fs.h):
   include/linux/rcupdate.h:706:9: sparse: sparse: context imbalance in 'pe=
rf_lock_task_context' - different lock contexts for basic block
   kernel/events/core.c:1513:17: sparse: sparse: context imbalance in 'perf=
_pin_task_context' - unexpected unlock
   kernel/events/core.c:2807:9: sparse: sparse: context imbalance in '__per=
f_install_in_context' - wrong count at exit
   kernel/events/core.c:4554:17: sparse: sparse: context imbalance in 'find=
_get_context' - unexpected unlock
   kernel/events/core.c: note: in included file:
   kernel/events/internal.h:197:46: sparse: sparse: incorrect type in argum=
ent 2 (different address spaces) @@     expected void const [noderef] __use=
r *from @@     got void const *src @@
   kernel/events/core.c: note: in included file (through include/linux/sche=
d/task.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ...):
   include/linux/uaccess.h:103:39: sparse: sparse: incorrect type in argume=
nt 2 (different address spaces) @@     expected void const *from @@     got=
 void const [noderef] __user *from @@
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
--
>> fs/verity/measure.c:42:13: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const *addr @@     got unsi=
gned short const [noderef] __user *__gu_ptr @@
   fs/verity/measure.c:42:13: sparse:     expected void const *addr
   fs/verity/measure.c:42:13: sparse:     got unsigned short const [noderef=
] __user *__gu_ptr
--
>> drivers/android/binder.c:3203:21: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const *addr @@     g=
ot unsigned int const [noderef] __user *__gu_ptr @@
   drivers/android/binder.c:3203:21: sparse:     expected void const *addr
   drivers/android/binder.c:3203:21: sparse:     got unsigned int const [no=
deref] __user *__gu_ptr
   drivers/android/binder.c:3223:29: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const *addr @@     g=
ot unsigned int const [noderef] __user *__gu_ptr @@
   drivers/android/binder.c:3223:29: sparse:     expected void const *addr
   drivers/android/binder.c:3223:29: sparse:     got unsigned int const [no=
deref] __user *__gu_ptr
>> drivers/android/binder.c:3290:29: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const *addr @@     g=
ot unsigned long long const [noderef] __user *__gu_ptr @@
   drivers/android/binder.c:3290:29: sparse:     expected void const *addr
   drivers/android/binder.c:3290:29: sparse:     got unsigned long long con=
st [noderef] __user *__gu_ptr
   drivers/android/binder.c:3293:29: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const *addr @@     g=
ot unsigned long long const [noderef] __user *__gu_ptr @@
   drivers/android/binder.c:3293:29: sparse:     expected void const *addr
   drivers/android/binder.c:3293:29: sparse:     got unsigned long long con=
st [noderef] __user *__gu_ptr
   drivers/android/binder.c:3362:29: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const *addr @@     g=
ot unsigned long long const [noderef] __user *__gu_ptr @@
   drivers/android/binder.c:3362:29: sparse:     expected void const *addr
   drivers/android/binder.c:3362:29: sparse:     got unsigned long long con=
st [noderef] __user *__gu_ptr
   drivers/android/binder.c:3459:29: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const *addr @@     g=
ot unsigned int const [noderef] __user *__gu_ptr @@
   drivers/android/binder.c:3459:29: sparse:     expected void const *addr
   drivers/android/binder.c:3459:29: sparse:     got unsigned int const [no=
deref] __user *__gu_ptr
   drivers/android/binder.c:3462:29: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const *addr @@     g=
ot unsigned long long const [noderef] __user *__gu_ptr @@
   drivers/android/binder.c:3462:29: sparse:     expected void const *addr
   drivers/android/binder.c:3462:29: sparse:     got unsigned long long con=
st [noderef] __user *__gu_ptr
   drivers/android/binder.c:3581:29: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const *addr @@     g=
ot unsigned long long const [noderef] __user *__gu_ptr @@
   drivers/android/binder.c:3581:29: sparse:     expected void const *addr
   drivers/android/binder.c:3581:29: sparse:     got unsigned long long con=
st [noderef] __user *__gu_ptr
>> drivers/android/binder.c:3657:13: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int *__pu_addr =
@@     got unsigned int [noderef] [usertype] __user * @@
   drivers/android/binder.c:3657:13: sparse:     expected unsigned int *__p=
u_addr
   drivers/android/binder.c:3657:13: sparse:     got unsigned int [noderef]=
 [usertype] __user *
>> drivers/android/binder.c:3661:13: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned long long *__pu=
_addr @@     got unsigned long long [noderef] [usertype] __user * @@
   drivers/android/binder.c:3661:13: sparse:     expected unsigned long lon=
g *__pu_addr
   drivers/android/binder.c:3661:13: sparse:     got unsigned long long [no=
deref] [usertype] __user *
   drivers/android/binder.c:3665:13: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned long long *__pu=
_addr @@     got unsigned long long [noderef] [usertype] __user * @@
   drivers/android/binder.c:3665:13: sparse:     expected unsigned long lon=
g *__pu_addr
   drivers/android/binder.c:3665:13: sparse:     got unsigned long long [no=
deref] [usertype] __user *
   drivers/android/binder.c:3788:21: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int *__pu_addr =
@@     got unsigned int [noderef] [usertype] __user * @@
   drivers/android/binder.c:3788:21: sparse:     expected unsigned int *__p=
u_addr
   drivers/android/binder.c:3788:21: sparse:     got unsigned int [noderef]=
 [usertype] __user *
   drivers/android/binder.c:3870:29: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int *__pu_addr =
@@     got unsigned int [noderef] [usertype] __user * @@
   drivers/android/binder.c:3870:29: sparse:     expected unsigned int *__p=
u_addr
   drivers/android/binder.c:3870:29: sparse:     got unsigned int [noderef]=
 [usertype] __user *
   drivers/android/binder.c:3883:29: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int *__pu_addr =
@@     got unsigned int [noderef] [usertype] __user * @@
   drivers/android/binder.c:3883:29: sparse:     expected unsigned int *__p=
u_addr
   drivers/android/binder.c:3883:29: sparse:     got unsigned int [noderef]=
 [usertype] __user *
   drivers/android/binder.c:4009:29: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int *__pu_addr =
@@     got unsigned int [noderef] [usertype] __user * @@
   drivers/android/binder.c:4009:29: sparse:     expected unsigned int *__p=
u_addr
   drivers/android/binder.c:4009:29: sparse:     got unsigned int [noderef]=
 [usertype] __user *
   drivers/android/binder.c:4012:29: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned long long *__pu=
_addr @@     got unsigned long long [noderef] [usertype] __user * @@
   drivers/android/binder.c:4012:29: sparse:     expected unsigned long lon=
g *__pu_addr
   drivers/android/binder.c:4012:29: sparse:     got unsigned long long [no=
deref] [usertype] __user *
   drivers/android/binder.c:4084:37: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int *__pu_addr =
@@     got unsigned int [noderef] [usertype] __user * @@
   drivers/android/binder.c:4084:37: sparse:     expected unsigned int *__p=
u_addr
   drivers/android/binder.c:4084:37: sparse:     got unsigned int [noderef]=
 [usertype] __user *
   drivers/android/binder.c:4104:21: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int *__pu_addr =
@@     got unsigned int [noderef] [usertype] __user * @@
   drivers/android/binder.c:4104:21: sparse:     expected unsigned int *__p=
u_addr
   drivers/android/binder.c:4104:21: sparse:     got unsigned int [noderef]=
 [usertype] __user *
   drivers/android/binder.c:4169:21: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int *__pu_addr =
@@     got unsigned int [noderef] [usertype] __user * @@
   drivers/android/binder.c:4169:21: sparse:     expected unsigned int *__p=
u_addr
   drivers/android/binder.c:4169:21: sparse:     got unsigned int [noderef]=
 [usertype] __user *
   drivers/android/binder.c:4421:24: sparse: sparse: incorrect type in retu=
rn expression (different base types) @@     expected restricted __poll_t @@=
     got int @@
   drivers/android/binder.c:4421:24: sparse:     expected restricted __poll=
_t
   drivers/android/binder.c:4421:24: sparse:     got int
>> drivers/android/binder.c:4686:21: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected signed int *__pu_addr @@=
     got signed int [noderef] __user * @@
   drivers/android/binder.c:4686:21: sparse:     expected signed int *__pu_=
addr
   drivers/android/binder.c:4686:21: sparse:     got signed int [noderef] _=
_user *
--
>> net/bluetooth/rfcomm/sock.c:769:13: sparse: sparse: incorrect type in ar=
gument 1 (different address spaces) @@     expected void const *addr @@    =
 got int const [noderef] __user *__gu_ptr @@
   net/bluetooth/rfcomm/sock.c:769:13: sparse:     expected void const *addr
   net/bluetooth/rfcomm/sock.c:769:13: sparse:     got int const [noderef] =
__user *__gu_ptr
>> net/bluetooth/rfcomm/sock.c:799:21: sparse: sparse: incorrect type in in=
itializer (different address spaces) @@     expected unsigned int *__pu_add=
r @@     got unsigned int [noderef] [usertype] __user * @@
   net/bluetooth/rfcomm/sock.c:799:21: sparse:     expected unsigned int *_=
_pu_addr
   net/bluetooth/rfcomm/sock.c:799:21: sparse:     got unsigned int [nodere=
f] [usertype] __user *
   net/bluetooth/rfcomm/sock.c:847:13: sparse: sparse: incorrect type in ar=
gument 1 (different address spaces) @@     expected void const *addr @@    =
 got int const [noderef] __user *__gu_ptr @@
   net/bluetooth/rfcomm/sock.c:847:13: sparse:     expected void const *addr
   net/bluetooth/rfcomm/sock.c:847:13: sparse:     got int const [noderef] =
__user *__gu_ptr
   net/bluetooth/rfcomm/sock.c:874:21: sparse: sparse: incorrect type in in=
itializer (different address spaces) @@     expected unsigned int *__pu_add=
r @@     got unsigned int [noderef] [usertype] __user * @@
   net/bluetooth/rfcomm/sock.c:874:21: sparse:     expected unsigned int *_=
_pu_addr
   net/bluetooth/rfcomm/sock.c:874:21: sparse:     got unsigned int [nodere=
f] [usertype] __user *
--
>> net/can/j1939/socket.c:749:13: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const *addr @@     got =
int const [noderef] __user *__gu_ptr @@
   net/can/j1939/socket.c:749:13: sparse:     expected void const *addr
   net/can/j1939/socket.c:749:13: sparse:     got int const [noderef] __use=
r *__gu_ptr
   net/can/j1939/socket.c:776:18: sparse: sparse: incorrect type in initial=
izer (different address spaces) @@     expected int *__pu_addr @@     got i=
nt [noderef] __user *optlen @@
   net/can/j1939/socket.c:776:18: sparse:     expected int *__pu_addr
   net/can/j1939/socket.c:776:18: sparse:     got int [noderef] __user *opt=
len

vim +2113 drivers/misc/altera-stapl/altera.c

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   203  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   204  static int altera_execute(struct altera_state *astate,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   205  				u8 *p,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   206  				s32 program_size,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   207  				s32 *error_address,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   208  				int *exit_code,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   209  				int *format_version)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   210  {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   211  	struct altera_config *aconf =3D astate->config;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   212  	char *msg_buff =3D astate->msg_buff;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   213  	long *stack =3D astate->stack;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   214  	int status =3D 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   215  	u32 first_word =3D 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   216  	u32 action_table =3D 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   217  	u32 proc_table =3D 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   218  	u32 str_table =3D 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   219  	u32 sym_table =3D 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   220  	u32 data_sect =3D 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   221  	u32 code_sect =3D 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   222  	u32 debug_sect =3D 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   223  	u32 action_count =3D 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   224  	u32 proc_count =3D 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   225  	u32 sym_count =3D 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   226  	long *vars =3D NULL;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   227  	s32 *var_size =3D NULL;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   228  	char *attrs =3D NULL;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   229  	u8 *proc_attributes =3D NULL;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   230  	u32 pc;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   231  	u32 opcode_address;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   232  	u32 args[3];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   233  	u32 opcode;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   234  	u32 name_id;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   235  	u8 charbuf[4];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   236  	long long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   237  	u32 variable_id;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   238  	u8 *charptr_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   239  	u8 *charptr_tmp2;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   240  	long *longptr_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   241  	int version =3D 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   242  	int delta =3D 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   243  	int stack_ptr =3D 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   244  	u32 arg_count;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   245  	int done =3D 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   246  	int bad_opcode =3D 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   247  	u32 count;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   248  	u32 index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   249  	u32 index2;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   250  	s32 long_count;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   251  	s32 long_idx;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   252  	s32 long_idx2;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   253  	u32 i;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   254  	u32 j;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   255  	u32 uncomp_size;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   256  	u32 offset;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   257  	u32 value;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   258  	int current_proc =3D 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   259  	int reverse;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   260  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   261  	char *name;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   262  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   263  	dprintk("%s\n", __func__);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   264  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   265  	/* Read header information */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   266  	if (program_size > 52L) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   267  		first_word    =3D get_unaligned_be32(&p[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   268  		version =3D (first_word & 1L);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   269  		*format_version =3D version + 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   270  		delta =3D version * 8;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   271  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   272  		action_table  =3D get_unaligned_be32(&p[4]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   273  		proc_table    =3D get_unaligned_be32(&p[8]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   274  		str_table  =3D get_unaligned_be32(&p[4 + delta]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   275  		sym_table  =3D get_unaligned_be32(&p[16 + delta]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   276  		data_sect  =3D get_unaligned_be32(&p[20 + delta]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   277  		code_sect  =3D get_unaligned_be32(&p[24 + delta]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   278  		debug_sect =3D get_unaligned_be32(&p[28 + delta]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   279  		action_count  =3D get_unaligned_be32(&p[40 + delta]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   280  		proc_count    =3D get_unaligned_be32(&p[44 + delta]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   281  		sym_count  =3D get_unaligned_be32(&p[48 + (2 * delta)]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   282  	}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   283  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   284  	if ((first_word !=3D 0x4A414D00L) && (first_word !=3D 0x4A41=
4D01L)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   285  		done =3D 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   286  		status =3D -EIO;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   287  		goto exit_done;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   288  	}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   289  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   290  	if (sym_count <=3D 0)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   291  		goto exit_done;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   292  =

6396bb221514d2 drivers/misc/altera-stapl/altera.c    Kees Cook         2018=
-06-12   293  	vars =3D kcalloc(sym_count, sizeof(long), GFP_KERNEL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   294  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   295  	if (vars =3D=3D NULL)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   296  		status =3D -ENOMEM;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   297  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   298  	if (status =3D=3D 0) {
6396bb221514d2 drivers/misc/altera-stapl/altera.c    Kees Cook         2018=
-06-12   299  		var_size =3D kcalloc(sym_count, sizeof(s32), GFP_KERNEL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   300  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   301  		if (var_size =3D=3D NULL)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   302  			status =3D -ENOMEM;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   303  	}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   304  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   305  	if (status =3D=3D 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   306  		attrs =3D kzalloc(sym_count, GFP_KERNEL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   307  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   308  		if (attrs =3D=3D NULL)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   309  			status =3D -ENOMEM;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   310  	}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   311  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   312  	if ((status =3D=3D 0) && (version > 0)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   313  		proc_attributes =3D kzalloc(proc_count, GFP_KERNEL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   314  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   315  		if (proc_attributes =3D=3D NULL)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   316  			status =3D -ENOMEM;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   317  	}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   318  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   319  	if (status !=3D 0)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   320  		goto exit_done;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   321  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   322  	delta =3D version * 2;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   323  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   324  	for (i =3D 0; i < sym_count; ++i) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   325  		offset =3D (sym_table + ((11 + delta) * i));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   326  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   327  		value =3D get_unaligned_be32(&p[offset + 3 + delta]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   328  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   329  		attrs[i] =3D p[offset];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   330  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   331  		/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   332  		 * use bit 7 of attribute byte to indicate that
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   333  		 * this buffer was dynamically allocated
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   334  		 * and should be freed later
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   335  		 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   336  		attrs[i] &=3D 0x7f;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   337  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   338  		var_size[i] =3D get_unaligned_be32(&p[offset + 7 + delta]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   339  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   340  		/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   341  		 * Attribute bits:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   342  		 * bit 0: 0 =3D read-only, 1 =3D read-write
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   343  		 * bit 1: 0 =3D not compressed, 1 =3D compressed
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   344  		 * bit 2: 0 =3D not initialized, 1 =3D initialized
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   345  		 * bit 3: 0 =3D scalar, 1 =3D array
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   346  		 * bit 4: 0 =3D Boolean, 1 =3D integer
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   347  		 * bit 5: 0 =3D declared variable,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   348  		 *	1 =3D compiler created temporary variable
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   349  		 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   350  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   351  		if ((attrs[i] & 0x0c) =3D=3D 0x04)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   352  			/* initialized scalar variable */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   353  			vars[i] =3D value;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   354  		else if ((attrs[i] & 0x1e) =3D=3D 0x0e) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   355  			/* initialized compressed Boolean array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   356  			uncomp_size =3D get_unaligned_le32(&p[data_sect + value]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   357  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   358  			/* allocate a buffer for the uncompressed data */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   359  			vars[i] =3D (long)kzalloc(uncomp_size, GFP_KERNEL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   360  			if (vars[i] =3D=3D 0L)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   361  				status =3D -ENOMEM;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   362  			else {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   363  				/* set flag so buffer will be freed later */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   364  				attrs[i] |=3D 0x80;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   365  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   366  				/* uncompress the data */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   367  				if (altera_shrink(&p[data_sect + value],
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   368  						var_size[i],
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   369  						(u8 *)vars[i],
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   370  						uncomp_size,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   371  						version) !=3D uncomp_size)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   372  					/* decompression failed */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   373  					status =3D -EIO;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   374  				else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   375  					var_size[i] =3D uncomp_size * 8L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   376  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   377  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   378  		} else if ((attrs[i] & 0x1e) =3D=3D 0x0c) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   379  			/* initialized Boolean array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   380  			vars[i] =3D value + data_sect + (long)p;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   381  		} else if ((attrs[i] & 0x1c) =3D=3D 0x1c) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   382  			/* initialized integer array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   383  			vars[i] =3D value + data_sect;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   384  		} else if ((attrs[i] & 0x0c) =3D=3D 0x08) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   385  			/* uninitialized array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   386  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   387  			/* flag attrs so that memory is freed */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   388  			attrs[i] |=3D 0x80;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   389  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   390  			if (var_size[i] > 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   391  				u32 size;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   392  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   393  				if (attrs[i] & 0x10)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   394  					/* integer array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   395  					size =3D (var_size[i] * sizeof(s32));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   396  				else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   397  					/* Boolean array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   398  					size =3D ((var_size[i] + 7L) / 8L);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   399  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   400  				vars[i] =3D (long)kzalloc(size, GFP_KERNEL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   401  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   402  				if (vars[i] =3D=3D 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   403  					status =3D -ENOMEM;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   404  				} else {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   405  					/* zero out memory */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   406  					for (j =3D 0; j < size; ++j)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   407  						((u8 *)(vars[i]))[j] =3D 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   408  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   409  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   410  			} else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   411  				vars[i] =3D 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   412  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   413  		} else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   414  			vars[i] =3D 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   415  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   416  	}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   417  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   418  exit_done:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   419  	if (status !=3D 0)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   420  		done =3D 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   421  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   422  	altera_jinit(astate);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   423  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   424  	pc =3D code_sect;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   425  	msg_buff[0] =3D '\0';
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   426  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   427  	/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   428  	 * For JBC version 2, we will execute the procedures corresp=
onding to
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   429  	 * the selected ACTION
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   430  	 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   431  	if (version > 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   432  		if (aconf->action =3D=3D NULL) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   433  			status =3D -EINVAL;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   434  			done =3D 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   435  		} else {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   436  			int action_found =3D 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   437  			for (i =3D 0; (i < action_count) && !action_found; ++i) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   438  				name_id =3D get_unaligned_be32(&p[action_table +
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   439  								(12 * i)]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   440  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   441  				name =3D &p[str_table + name_id];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   442  =

30614cf34105c5 drivers/misc/altera-stapl/altera.c    Rasmus Villemoes  2014=
-10-13   443  				if (strncasecmp(aconf->action, name, strlen(name)) =3D=3D=
 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   444  					action_found =3D 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   445  					current_proc =3D
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   446  						get_unaligned_be32(&p[action_table +
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   447  								(12 * i) + 8]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   448  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   449  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   450  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   451  			if (!action_found) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   452  				status =3D -EINVAL;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   453  				done =3D 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   454  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   455  		}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   456  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   457  		if (status =3D=3D 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   458  			int first_time =3D 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   459  			i =3D current_proc;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   460  			while ((i !=3D 0) || first_time) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   461  				first_time =3D 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   462  				/* check procedure attribute byte */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   463  				proc_attributes[i] =3D
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   464  						(p[proc_table +
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   465  								(13 * i) + 8] &
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   466  									0x03);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   467  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   468  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   469  				 * BIT0 - OPTIONAL
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   470  				 * BIT1 - RECOMMENDED
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   471  				 * BIT6 - FORCED OFF
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   472  				 * BIT7 - FORCED ON
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   473  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   474  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   475  				i =3D get_unaligned_be32(&p[proc_table +
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   476  							(13 * i) + 4]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   477  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   478  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   479  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   480  			 * Set current_proc to the first procedure
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   481  			 * to be executed
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   482  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   483  			i =3D current_proc;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   484  			while ((i !=3D 0) &&
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   485  				((proc_attributes[i] =3D=3D 1) ||
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   486  				((proc_attributes[i] & 0xc0) =3D=3D 0x40))) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   487  				i =3D get_unaligned_be32(&p[proc_table +
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   488  							(13 * i) + 4]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   489  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   490  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   491  			if ((i !=3D 0) || ((i =3D=3D 0) && (current_proc =3D=3D 0)=
 &&
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   492  				((proc_attributes[0] !=3D 1) &&
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   493  				((proc_attributes[0] & 0xc0) !=3D 0x40)))) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   494  				current_proc =3D i;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   495  				pc =3D code_sect +
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   496  					get_unaligned_be32(&p[proc_table +
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   497  								(13 * i) + 9]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   498  				if ((pc < code_sect) || (pc >=3D debug_sect))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   499  					status =3D -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   500  			} else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   501  				/* there are no procedures to execute! */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   502  				done =3D 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   503  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   504  		}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   505  	}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   506  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   507  	msg_buff[0] =3D '\0';
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   508  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   509  	while (!done) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   510  		opcode =3D (p[pc] & 0xff);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   511  		opcode_address =3D pc;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   512  		++pc;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   513  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   514  		if (debug > 1)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   515  			printk("opcode: %02x\n", opcode);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   516  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   517  		arg_count =3D (opcode >> 6) & 3;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   518  		for (i =3D 0; i < arg_count; ++i) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   519  			args[i] =3D get_unaligned_be32(&p[pc]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   520  			pc +=3D 4;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   521  		}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   522  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   523  		switch (opcode) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   524  		case OP_NOP:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   525  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   526  		case OP_DUP:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   527  			if (altera_check_stack(stack_ptr, 1, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   528  				stack[stack_ptr] =3D stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   529  				++stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   530  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   531  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   532  		case OP_SWP:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   533  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   534  				long_tmp =3D stack[stack_ptr - 2];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   535  				stack[stack_ptr - 2] =3D stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   536  				stack[stack_ptr - 1] =3D long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   537  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   538  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   539  		case OP_ADD:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   540  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   541  				--stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   542  				stack[stack_ptr - 1] +=3D stack[stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   543  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   544  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   545  		case OP_SUB:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   546  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   547  				--stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   548  				stack[stack_ptr - 1] -=3D stack[stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   549  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   550  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   551  		case OP_MULT:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   552  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   553  				--stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   554  				stack[stack_ptr - 1] *=3D stack[stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   555  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   556  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   557  		case OP_DIV:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   558  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   559  				--stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   560  				stack[stack_ptr - 1] /=3D stack[stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   561  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   562  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   563  		case OP_MOD:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   564  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   565  				--stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   566  				stack[stack_ptr - 1] %=3D stack[stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   567  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   568  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   569  		case OP_SHL:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   570  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   571  				--stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   572  				stack[stack_ptr - 1] <<=3D stack[stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   573  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   574  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   575  		case OP_SHR:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   576  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   577  				--stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   578  				stack[stack_ptr - 1] >>=3D stack[stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   579  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   580  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   581  		case OP_NOT:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   582  			if (altera_check_stack(stack_ptr, 1, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   583  				stack[stack_ptr - 1] ^=3D (-1L);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   584  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   585  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   586  		case OP_AND:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   587  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   588  				--stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   589  				stack[stack_ptr - 1] &=3D stack[stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   590  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   591  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   592  		case OP_OR:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   593  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   594  				--stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   595  				stack[stack_ptr - 1] |=3D stack[stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   596  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   597  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   598  		case OP_XOR:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   599  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   600  				--stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   601  				stack[stack_ptr - 1] ^=3D stack[stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   602  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   603  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   604  		case OP_INV:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   605  			if (!altera_check_stack(stack_ptr, 1, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   606  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   607  			stack[stack_ptr - 1] =3D stack[stack_ptr - 1] ? 0L : 1L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   608  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   609  		case OP_GT:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   610  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   611  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   612  			--stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   613  			stack[stack_ptr - 1] =3D
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   614  				(stack[stack_ptr - 1] > stack[stack_ptr]) ?
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   615  									1L : 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   616  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   617  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   618  		case OP_LT:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   619  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   620  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   621  			--stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   622  			stack[stack_ptr - 1] =3D
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   623  				(stack[stack_ptr - 1] < stack[stack_ptr]) ?
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   624  									1L : 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   625  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   626  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   627  		case OP_RET:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   628  			if ((version > 0) && (stack_ptr =3D=3D 0)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   629  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   630  				 * We completed one of the main procedures
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   631  				 * of an ACTION.
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   632  				 * Find the next procedure
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   633  				 * to be executed and jump to it.
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   634  				 * If there are no more procedures, then EXIT.
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   635  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   636  				i =3D get_unaligned_be32(&p[proc_table +
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   637  						(13 * current_proc) + 4]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   638  				while ((i !=3D 0) &&
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   639  					((proc_attributes[i] =3D=3D 1) ||
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   640  					((proc_attributes[i] & 0xc0) =3D=3D 0x40)))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   641  					i =3D get_unaligned_be32(&p[proc_table +
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   642  								(13 * i) + 4]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   643  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   644  				if (i =3D=3D 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   645  					/* no procedures to execute! */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   646  					done =3D 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   647  					*exit_code =3D 0;	/* success */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   648  				} else {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   649  					current_proc =3D i;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   650  					pc =3D code_sect + get_unaligned_be32(
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   651  								&p[proc_table +
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   652  								(13 * i) + 9]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   653  					if ((pc < code_sect) ||
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   654  					    (pc >=3D debug_sect))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   655  						status =3D -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   656  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   657  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   658  			} else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   659  				if (altera_check_stack(stack_ptr, 1, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   660  					pc =3D stack[--stack_ptr] + code_sect;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   661  					if ((pc <=3D code_sect) ||
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   662  					    (pc >=3D debug_sect))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   663  						status =3D -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   664  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   665  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   666  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   667  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   668  		case OP_CMPS:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   669  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   670  			 * Array short compare
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   671  			 * ...stack 0 is source 1 value
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   672  			 * ...stack 1 is source 2 value
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   673  			 * ...stack 2 is mask value
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   674  			 * ...stack 3 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   675  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   676  			if (altera_check_stack(stack_ptr, 4, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   677  				s32 a =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   678  				s32 b =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   679  				long_tmp =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   680  				count =3D stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   681  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   682  				if ((count < 1) || (count > 32))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   683  					status =3D -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   684  				else {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   685  					long_tmp &=3D ((-1L) >> (32 - count));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   686  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   687  					stack[stack_ptr - 1] =3D
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   688  					((a & long_tmp) =3D=3D (b & long_tmp))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   689  								? 1L : 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   690  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   691  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   692  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   693  		case OP_PINT:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   694  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   695  			 * PRINT add integer
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   696  			 * ...stack 0 is integer value
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   697  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   698  			if (!altera_check_stack(stack_ptr, 1, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   699  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   700  			sprintf(&msg_buff[strlen(msg_buff)],
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   701  					"%ld", stack[--stack_ptr]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   702  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   703  		case OP_PRNT:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   704  			/* PRINT finish */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   705  			if (debug)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   706  				printk(msg_buff, "\n");
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   707  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   708  			msg_buff[0] =3D '\0';
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   709  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   710  		case OP_DSS:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   711  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   712  			 * DRSCAN short
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   713  			 * ...stack 0 is scan data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   714  			 * ...stack 1 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   715  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   716  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   717  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   718  			long_tmp =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   719  			count =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   720  			put_unaligned_le32(long_tmp, &charbuf[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   721  			status =3D altera_drscan(astate, count, charbuf, 0);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   722  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   723  		case OP_DSSC:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   724  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   725  			 * DRSCAN short with capture
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   726  			 * ...stack 0 is scan data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   727  			 * ...stack 1 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   728  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   729  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   730  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   731  			long_tmp =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   732  			count =3D stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   733  			put_unaligned_le32(long_tmp, &charbuf[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   734  			status =3D altera_swap_dr(astate, count, charbuf,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   735  							0, charbuf, 0);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   736  			stack[stack_ptr - 1] =3D get_unaligned_le32(&charbuf[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   737  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   738  		case OP_ISS:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   739  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   740  			 * IRSCAN short
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   741  			 * ...stack 0 is scan data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   742  			 * ...stack 1 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   743  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   744  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   745  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   746  			long_tmp =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   747  			count =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   748  			put_unaligned_le32(long_tmp, &charbuf[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   749  			status =3D altera_irscan(astate, count, charbuf, 0);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   750  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   751  		case OP_ISSC:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   752  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   753  			 * IRSCAN short with capture
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   754  			 * ...stack 0 is scan data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   755  			 * ...stack 1 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   756  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   757  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   758  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   759  			long_tmp =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   760  			count =3D stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   761  			put_unaligned_le32(long_tmp, &charbuf[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   762  			status =3D altera_swap_ir(astate, count, charbuf,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   763  							0, charbuf, 0);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   764  			stack[stack_ptr - 1] =3D get_unaligned_le32(&charbuf[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   765  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   766  		case OP_DPR:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   767  			if (!altera_check_stack(stack_ptr, 1, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   768  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   769  			count =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   770  			status =3D altera_set_dr_pre(&astate->js, count, 0, NULL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   771  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   772  		case OP_DPRL:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   773  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   774  			 * DRPRE with literal data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   775  			 * ...stack 0 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   776  			 * ...stack 1 is literal data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   777  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   778  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   779  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   780  			count =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   781  			long_tmp =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   782  			put_unaligned_le32(long_tmp, &charbuf[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   783  			status =3D altera_set_dr_pre(&astate->js, count, 0,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   784  						charbuf);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   785  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   786  		case OP_DPO:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   787  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   788  			 * DRPOST
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   789  			 * ...stack 0 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   790  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   791  			if (altera_check_stack(stack_ptr, 1, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   792  				count =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   793  				status =3D altera_set_dr_post(&astate->js, count,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   794  								0, NULL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   795  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   796  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   797  		case OP_DPOL:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   798  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   799  			 * DRPOST with literal data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   800  			 * ...stack 0 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   801  			 * ...stack 1 is literal data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   802  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   803  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   804  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   805  			count =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   806  			long_tmp =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   807  			put_unaligned_le32(long_tmp, &charbuf[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   808  			status =3D altera_set_dr_post(&astate->js, count, 0,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   809  							charbuf);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   810  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   811  		case OP_IPR:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   812  			if (altera_check_stack(stack_ptr, 1, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   813  				count =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   814  				status =3D altera_set_ir_pre(&astate->js, count,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   815  								0, NULL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   816  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   817  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   818  		case OP_IPRL:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   819  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   820  			 * IRPRE with literal data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   821  			 * ...stack 0 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   822  			 * ...stack 1 is literal data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   823  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   824  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   825  				count =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   826  				long_tmp =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   827  				put_unaligned_le32(long_tmp, &charbuf[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   828  				status =3D altera_set_ir_pre(&astate->js, count,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   829  							0, charbuf);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   830  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   831  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   832  		case OP_IPO:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   833  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   834  			 * IRPOST
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   835  			 * ...stack 0 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   836  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   837  			if (altera_check_stack(stack_ptr, 1, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   838  				count =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   839  				status =3D altera_set_ir_post(&astate->js, count,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   840  							0, NULL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   841  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   842  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   843  		case OP_IPOL:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   844  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   845  			 * IRPOST with literal data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   846  			 * ...stack 0 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   847  			 * ...stack 1 is literal data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   848  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   849  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   850  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   851  			count =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   852  			long_tmp =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   853  			put_unaligned_le32(long_tmp, &charbuf[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   854  			status =3D altera_set_ir_post(&astate->js, count, 0,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   855  							charbuf);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   856  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   857  		case OP_PCHR:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   858  			if (altera_check_stack(stack_ptr, 1, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   859  				u8 ch;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   860  				count =3D strlen(msg_buff);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   861  				ch =3D (char) stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   862  				if ((ch < 1) || (ch > 127)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   863  					/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   864  					 * character code out of range
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   865  					 * instead of flagging an error,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   866  					 * force the value to 127
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   867  					 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   868  					ch =3D 127;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   869  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   870  				msg_buff[count] =3D ch;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   871  				msg_buff[count + 1] =3D '\0';
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   872  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   873  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   874  		case OP_EXIT:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   875  			if (altera_check_stack(stack_ptr, 1, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   876  				*exit_code =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   877  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   878  			done =3D 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   879  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   880  		case OP_EQU:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   881  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   882  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   883  			--stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   884  			stack[stack_ptr - 1] =3D
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   885  				(stack[stack_ptr - 1] =3D=3D stack[stack_ptr]) ?
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   886  									1L : 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   887  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   888  		case OP_POPT:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   889  			if (altera_check_stack(stack_ptr, 1, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   890  				--stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   891  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   892  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   893  		case OP_ABS:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   894  			if (!altera_check_stack(stack_ptr, 1, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   895  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   896  			if (stack[stack_ptr - 1] < 0)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   897  				stack[stack_ptr - 1] =3D 0 - stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   898  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   899  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   900  		case OP_BCH0:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   901  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   902  			 * Batch operation 0
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   903  			 * SWP
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   904  			 * SWPN 7
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   905  			 * SWP
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   906  			 * SWPN 6
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   907  			 * DUPN 8
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   908  			 * SWPN 2
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   909  			 * SWP
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   910  			 * DUPN 6
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   911  			 * DUPN 6
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   912  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   913  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   914  			/* SWP  */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   915  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   916  				long_tmp =3D stack[stack_ptr - 2];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   917  				stack[stack_ptr - 2] =3D stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   918  				stack[stack_ptr - 1] =3D long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   919  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   920  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   921  			/* SWPN 7 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   922  			index =3D 7 + 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   923  			if (altera_check_stack(stack_ptr, index, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   924  				long_tmp =3D stack[stack_ptr - index];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   925  				stack[stack_ptr - index] =3D stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   926  				stack[stack_ptr - 1] =3D long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   927  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   928  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   929  			/* SWP  */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   930  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   931  				long_tmp =3D stack[stack_ptr - 2];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   932  				stack[stack_ptr - 2] =3D stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   933  				stack[stack_ptr - 1] =3D long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   934  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   935  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   936  			/* SWPN 6 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   937  			index =3D 6 + 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   938  			if (altera_check_stack(stack_ptr, index, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   939  				long_tmp =3D stack[stack_ptr - index];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   940  				stack[stack_ptr - index] =3D stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   941  				stack[stack_ptr - 1] =3D long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   942  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   943  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   944  			/* DUPN 8 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   945  			index =3D 8 + 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   946  			if (altera_check_stack(stack_ptr, index, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   947  				stack[stack_ptr] =3D stack[stack_ptr - index];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   948  				++stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   949  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   950  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   951  			/* SWPN 2 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   952  			index =3D 2 + 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   953  			if (altera_check_stack(stack_ptr, index, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   954  				long_tmp =3D stack[stack_ptr - index];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   955  				stack[stack_ptr - index] =3D stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   956  				stack[stack_ptr - 1] =3D long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   957  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   958  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   959  			/* SWP  */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   960  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   961  				long_tmp =3D stack[stack_ptr - 2];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   962  				stack[stack_ptr - 2] =3D stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   963  				stack[stack_ptr - 1] =3D long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   964  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   965  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   966  			/* DUPN 6 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   967  			index =3D 6 + 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   968  			if (altera_check_stack(stack_ptr, index, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   969  				stack[stack_ptr] =3D stack[stack_ptr - index];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   970  				++stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   971  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   972  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   973  			/* DUPN 6 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   974  			index =3D 6 + 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   975  			if (altera_check_stack(stack_ptr, index, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   976  				stack[stack_ptr] =3D stack[stack_ptr - index];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   977  				++stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   978  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   979  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   980  		case OP_PSH0:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   981  			stack[stack_ptr++] =3D 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   982  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   983  		case OP_PSHL:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   984  			stack[stack_ptr++] =3D (s32) args[0];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   985  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   986  		case OP_PSHV:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   987  			stack[stack_ptr++] =3D vars[args[0]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   988  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   989  		case OP_JMP:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   990  			pc =3D args[0] + code_sect;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   991  			if ((pc < code_sect) || (pc >=3D debug_sect))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   992  				status =3D -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   993  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   994  		case OP_CALL:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   995  			stack[stack_ptr++] =3D pc;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   996  			pc =3D args[0] + code_sect;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   997  			if ((pc < code_sect) || (pc >=3D debug_sect))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   998  				status =3D -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25   999  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1000  		case OP_NEXT:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1001  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1002  			 * Process FOR / NEXT loop
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1003  			 * ...argument 0 is variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1004  			 * ...stack 0 is step value
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1005  			 * ...stack 1 is end value
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1006  			 * ...stack 2 is top address
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1007  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1008  			if (altera_check_stack(stack_ptr, 3, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1009  				s32 step =3D stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1010  				s32 end =3D stack[stack_ptr - 2];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1011  				s32 top =3D stack[stack_ptr - 3];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1012  				s32 iterator =3D vars[args[0]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1013  				int break_out =3D 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1014  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1015  				if (step < 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1016  					if (iterator <=3D end)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1017  						break_out =3D 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1018  				} else if (iterator >=3D end)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1019  					break_out =3D 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1020  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1021  				if (break_out) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1022  					stack_ptr -=3D 3;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1023  				} else {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1024  					vars[args[0]] =3D iterator + step;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1025  					pc =3D top + code_sect;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1026  					if ((pc < code_sect) ||
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1027  					    (pc >=3D debug_sect))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1028  						status =3D -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1029  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1030  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1031  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1032  		case OP_PSTR:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1033  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1034  			 * PRINT add string
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1035  			 * ...argument 0 is string ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1036  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1037  			count =3D strlen(msg_buff);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1038  			strlcpy(&msg_buff[count],
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1039  				&p[str_table + args[0]],
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1040  				ALTERA_MESSAGE_LENGTH - count);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1041  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1042  		case OP_SINT:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1043  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1044  			 * STATE intermediate state
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1045  			 * ...argument 0 is state code
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1046  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1047  			status =3D altera_goto_jstate(astate, args[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1048  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1049  		case OP_ST:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1050  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1051  			 * STATE final state
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1052  			 * ...argument 0 is state code
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1053  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1054  			status =3D altera_goto_jstate(astate, args[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1055  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1056  		case OP_ISTP:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1057  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1058  			 * IRSTOP state
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1059  			 * ...argument 0 is state code
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1060  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1061  			status =3D altera_set_irstop(&astate->js, args[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1062  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1063  		case OP_DSTP:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1064  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1065  			 * DRSTOP state
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1066  			 * ...argument 0 is state code
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1067  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1068  			status =3D altera_set_drstop(&astate->js, args[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1069  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1070  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1071  		case OP_SWPN:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1072  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1073  			 * Exchange top with Nth stack value
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1074  			 * ...argument 0 is 0-based stack entry
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1075  			 * to swap with top element
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1076  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1077  			index =3D (args[0]) + 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1078  			if (altera_check_stack(stack_ptr, index, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1079  				long_tmp =3D stack[stack_ptr - index];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1080  				stack[stack_ptr - index] =3D stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1081  				stack[stack_ptr - 1] =3D long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1082  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1083  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1084  		case OP_DUPN:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1085  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1086  			 * Duplicate Nth stack value
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1087  			 * ...argument 0 is 0-based stack entry to duplicate
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1088  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1089  			index =3D (args[0]) + 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1090  			if (altera_check_stack(stack_ptr, index, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1091  				stack[stack_ptr] =3D stack[stack_ptr - index];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1092  				++stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1093  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1094  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1095  		case OP_POPV:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1096  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1097  			 * Pop stack into scalar variable
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1098  			 * ...argument 0 is variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1099  			 * ...stack 0 is value
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1100  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1101  			if (altera_check_stack(stack_ptr, 1, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1102  				vars[args[0]] =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1103  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1104  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1105  		case OP_POPE:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1106  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1107  			 * Pop stack into integer array element
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1108  			 * ...argument 0 is variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1109  			 * ...stack 0 is array index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1110  			 * ...stack 1 is value
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1111  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1112  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1113  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1114  			variable_id =3D args[0];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1115  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1116  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1117  			 * If variable is read-only,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1118  			 * convert to writable array
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1119  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1120  			if ((version > 0) &&
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1121  				((attrs[variable_id] & 0x9c) =3D=3D 0x1c)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1122  				/* Allocate a writable buffer for this array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1123  				count =3D var_size[variable_id];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1124  				long_tmp =3D vars[variable_id];
6396bb221514d2 drivers/misc/altera-stapl/altera.c    Kees Cook         2018=
-06-12  1125  				longptr_tmp =3D kcalloc(count, sizeof(long),
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1126  								GFP_KERNEL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1127  				vars[variable_id] =3D (long)longptr_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1128  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1129  				if (vars[variable_id] =3D=3D 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1130  					status =3D -ENOMEM;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1131  					break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1132  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1133  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1134  				/* copy previous contents into buffer */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1135  				for (i =3D 0; i < count; ++i) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1136  					longptr_tmp[i] =3D
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1137  						get_unaligned_be32(&p[long_tmp]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1138  					long_tmp +=3D sizeof(long);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1139  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1140  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1141  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1142  				 * set bit 7 - buffer was
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1143  				 * dynamically allocated
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1144  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1145  				attrs[variable_id] |=3D 0x80;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1146  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1147  				/* clear bit 2 - variable is writable */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1148  				attrs[variable_id] &=3D ~0x04;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1149  				attrs[variable_id] |=3D 0x01;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1150  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1151  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1152  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1153  			/* check that variable is a writable integer array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1154  			if ((attrs[variable_id] & 0x1c) !=3D 0x18)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1155  				status =3D -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1156  			else {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1157  				longptr_tmp =3D (long *)vars[variable_id];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1158  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1159  				/* pop the array index */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1160  				index =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1161  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1162  				/* pop the value and store it into the array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1163  				longptr_tmp[index] =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1164  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1165  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1166  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1167  		case OP_POPA:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1168  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1169  			 * Pop stack into Boolean array
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1170  			 * ...argument 0 is variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1171  			 * ...stack 0 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1172  			 * ...stack 1 is array index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1173  			 * ...stack 2 is value
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1174  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1175  			if (!altera_check_stack(stack_ptr, 3, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1176  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1177  			variable_id =3D args[0];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1178  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1179  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1180  			 * If variable is read-only,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1181  			 * convert to writable array
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1182  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1183  			if ((version > 0) &&
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1184  				((attrs[variable_id] & 0x9c) =3D=3D 0x0c)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1185  				/* Allocate a writable buffer for this array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1186  				long_tmp =3D
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1187  					(var_size[variable_id] + 7L) >> 3L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1188  				charptr_tmp2 =3D (u8 *)vars[variable_id];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1189  				charptr_tmp =3D
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1190  					kzalloc(long_tmp, GFP_KERNEL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1191  				vars[variable_id] =3D (long)charptr_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1192  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1193  				if (vars[variable_id] =3D=3D 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1194  					status =3D -ENOMEM;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1195  					break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1196  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1197  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1198  				/* zero the buffer */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1199  				for (long_idx =3D 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1200  					long_idx < long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1201  					++long_idx) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1202  					charptr_tmp[long_idx] =3D 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1203  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1204  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1205  				/* copy previous contents into buffer */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1206  				for (long_idx =3D 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1207  					long_idx < var_size[variable_id];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1208  					++long_idx) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1209  					long_idx2 =3D long_idx;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1210  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1211  					if (charptr_tmp2[long_idx2 >> 3] &
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1212  						(1 << (long_idx2 & 7))) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1213  						charptr_tmp[long_idx >> 3] |=3D
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1214  							(1 << (long_idx & 7));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1215  					}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1216  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1217  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1218  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1219  				 * set bit 7 - buffer was
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1220  				 * dynamically allocated
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1221  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1222  				attrs[variable_id] |=3D 0x80;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1223  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1224  				/* clear bit 2 - variable is writable */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1225  				attrs[variable_id] &=3D ~0x04;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1226  				attrs[variable_id] |=3D 0x01;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1227  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1228  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1229  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1230  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1231  			 * check that variable is
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1232  			 * a writable Boolean array
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1233  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1234  			if ((attrs[variable_id] & 0x1c) !=3D 0x08) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1235  				status =3D -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1236  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1237  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1238  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1239  			charptr_tmp =3D (u8 *)vars[variable_id];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1240  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1241  			/* pop the count (number of bits to copy) */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1242  			long_count =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1243  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1244  			/* pop the array index */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1245  			long_idx =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1246  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1247  			reverse =3D 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1248  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1249  			if (version > 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1250  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1251  				 * stack 0 =3D array right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1252  				 * stack 1 =3D array left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1253  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1254  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1255  				if (long_idx > long_count) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1256  					reverse =3D 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1257  					long_tmp =3D long_count;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1258  					long_count =3D 1 + long_idx -
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1259  								long_count;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1260  					long_idx =3D long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1261  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1262  					/* reverse POPA is not supported */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1263  					status =3D -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1264  					break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1265  				} else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1266  					long_count =3D 1 + long_count -
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1267  								long_idx;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1268  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1269  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1270  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1271  			/* pop the data */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1272  			long_tmp =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1273  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1274  			if (long_count < 1) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1275  				status =3D -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1276  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1277  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1278  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1279  			for (i =3D 0; i < long_count; ++i) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1280  				if (long_tmp & (1L << (s32) i))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1281  					charptr_tmp[long_idx >> 3L] |=3D
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1282  						(1L << (long_idx & 7L));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1283  				else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1284  					charptr_tmp[long_idx >> 3L] &=3D
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1285  						~(1L << (long_idx & 7L));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1286  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1287  				++long_idx;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1288  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1289  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1290  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1291  		case OP_JMPZ:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1292  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1293  			 * Pop stack and branch if zero
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1294  			 * ...argument 0 is address
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1295  			 * ...stack 0 is condition value
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1296  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1297  			if (altera_check_stack(stack_ptr, 1, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1298  				if (stack[--stack_ptr] =3D=3D 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1299  					pc =3D args[0] + code_sect;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1300  					if ((pc < code_sect) ||
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1301  					    (pc >=3D debug_sect))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1302  						status =3D -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1303  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1304  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1305  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1306  		case OP_DS:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1307  		case OP_IS:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1308  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1309  			 * DRSCAN
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1310  			 * IRSCAN
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1311  			 * ...argument 0 is scan data variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1312  			 * ...stack 0 is array index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1313  			 * ...stack 1 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1314  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1315  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1316  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1317  			long_idx =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1318  			long_count =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1319  			reverse =3D 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1320  			if (version > 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1321  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1322  				 * stack 0 =3D array right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1323  				 * stack 1 =3D array left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1324  				 * stack 2 =3D count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1325  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1326  				long_tmp =3D long_count;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1327  				long_count =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1328  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1329  				if (long_idx > long_tmp) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1330  					reverse =3D 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1331  					long_idx =3D long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1332  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1333  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1334  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1335  			charptr_tmp =3D (u8 *)vars[args[0]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1336  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1337  			if (reverse) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1338  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1339  				 * allocate a buffer
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1340  				 * and reverse the data order
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1341  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1342  				charptr_tmp2 =3D charptr_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1343  				charptr_tmp =3D kzalloc((long_count >> 3) + 1,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1344  								GFP_KERNEL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1345  				if (charptr_tmp =3D=3D NULL) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1346  					status =3D -ENOMEM;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1347  					break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1348  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1349  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1350  				long_tmp =3D long_idx + long_count - 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1351  				long_idx2 =3D 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1352  				while (long_idx2 < long_count) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1353  					if (charptr_tmp2[long_tmp >> 3] &
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1354  							(1 << (long_tmp & 7)))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1355  						charptr_tmp[long_idx2 >> 3] |=3D
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1356  							(1 << (long_idx2 & 7));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1357  					else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1358  						charptr_tmp[long_idx2 >> 3] &=3D
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1359  							~(1 << (long_idx2 & 7));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1360  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1361  					--long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1362  					++long_idx2;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1363  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1364  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1365  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1366  			if (opcode =3D=3D 0x51) /* DS */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1367  				status =3D altera_drscan(astate, long_count,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1368  						charptr_tmp, long_idx);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1369  			else /* IS */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1370  				status =3D altera_irscan(astate, long_count,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1371  						charptr_tmp, long_idx);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1372  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1373  			if (reverse)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1374  				kfree(charptr_tmp);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1375  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1376  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1377  		case OP_DPRA:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1378  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1379  			 * DRPRE with array data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1380  			 * ...argument 0 is variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1381  			 * ...stack 0 is array index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1382  			 * ...stack 1 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1383  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1384  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1385  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1386  			index =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1387  			count =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1388  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1389  			if (version > 0)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1390  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1391  				 * stack 0 =3D array right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1392  				 * stack 1 =3D array left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1393  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1394  				count =3D 1 + count - index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1395  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1396  			charptr_tmp =3D (u8 *)vars[args[0]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1397  			status =3D altera_set_dr_pre(&astate->js, count, index,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1398  							charptr_tmp);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1399  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1400  		case OP_DPOA:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1401  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1402  			 * DRPOST with array data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1403  			 * ...argument 0 is variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1404  			 * ...stack 0 is array index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1405  			 * ...stack 1 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1406  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1407  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1408  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1409  			index =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1410  			count =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1411  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1412  			if (version > 0)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1413  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1414  				 * stack 0 =3D array right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1415  				 * stack 1 =3D array left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1416  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1417  				count =3D 1 + count - index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1418  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1419  			charptr_tmp =3D (u8 *)vars[args[0]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1420  			status =3D altera_set_dr_post(&astate->js, count, index,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1421  							charptr_tmp);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1422  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1423  		case OP_IPRA:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1424  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1425  			 * IRPRE with array data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1426  			 * ...argument 0 is variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1427  			 * ...stack 0 is array index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1428  			 * ...stack 1 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1429  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1430  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1431  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1432  			index =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1433  			count =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1434  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1435  			if (version > 0)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1436  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1437  				 * stack 0 =3D array right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1438  				 * stack 1 =3D array left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1439  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1440  				count =3D 1 + count - index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1441  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1442  			charptr_tmp =3D (u8 *)vars[args[0]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1443  			status =3D altera_set_ir_pre(&astate->js, count, index,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1444  							charptr_tmp);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1445  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1446  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1447  		case OP_IPOA:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1448  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1449  			 * IRPOST with array data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1450  			 * ...argument 0 is variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1451  			 * ...stack 0 is array index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1452  			 * ...stack 1 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1453  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1454  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1455  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1456  			index =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1457  			count =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1458  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1459  			if (version > 0)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1460  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1461  				 * stack 0 =3D array right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1462  				 * stack 1 =3D array left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1463  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1464  				count =3D 1 + count - index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1465  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1466  			charptr_tmp =3D (u8 *)vars[args[0]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1467  			status =3D altera_set_ir_post(&astate->js, count, index,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1468  							charptr_tmp);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1469  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1470  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1471  		case OP_EXPT:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1472  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1473  			 * EXPORT
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1474  			 * ...argument 0 is string ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1475  			 * ...stack 0 is integer expression
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1476  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1477  			if (altera_check_stack(stack_ptr, 1, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1478  				name =3D &p[str_table + args[0]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1479  				long_tmp =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1480  				altera_export_int(name, long_tmp);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1481  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1482  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1483  		case OP_PSHE:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1484  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1485  			 * Push integer array element
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1486  			 * ...argument 0 is variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1487  			 * ...stack 0 is array index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1488  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1489  			if (!altera_check_stack(stack_ptr, 1, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1490  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1491  			variable_id =3D args[0];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1492  			index =3D stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1493  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1494  			/* check variable type */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1495  			if ((attrs[variable_id] & 0x1f) =3D=3D 0x19) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1496  				/* writable integer array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1497  				longptr_tmp =3D (long *)vars[variable_id];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1498  				stack[stack_ptr - 1] =3D longptr_tmp[index];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1499  			} else if ((attrs[variable_id] & 0x1f) =3D=3D 0x1c) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1500  				/* read-only integer array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1501  				long_tmp =3D vars[variable_id] +
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1502  						(index * sizeof(long));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1503  				stack[stack_ptr - 1] =3D
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1504  					get_unaligned_be32(&p[long_tmp]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1505  			} else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1506  				status =3D -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1507  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1508  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1509  		case OP_PSHA:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1510  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1511  			 * Push Boolean array
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1512  			 * ...argument 0 is variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1513  			 * ...stack 0 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1514  			 * ...stack 1 is array index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1515  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1516  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1517  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1518  			variable_id =3D args[0];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1519  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1520  			/* check that variable is a Boolean array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1521  			if ((attrs[variable_id] & 0x18) !=3D 0x08) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1522  				status =3D -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1523  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1524  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1525  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1526  			charptr_tmp =3D (u8 *)vars[variable_id];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1527  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1528  			/* pop the count (number of bits to copy) */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1529  			count =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1530  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1531  			/* pop the array index */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1532  			index =3D stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1533  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1534  			if (version > 0)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1535  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1536  				 * stack 0 =3D array right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1537  				 * stack 1 =3D array left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1538  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1539  				count =3D 1 + count - index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1540  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1541  			if ((count < 1) || (count > 32)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1542  				status =3D -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1543  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1544  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1545  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1546  			long_tmp =3D 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1547  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1548  			for (i =3D 0; i < count; ++i)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1549  				if (charptr_tmp[(i + index) >> 3] &
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1550  						(1 << ((i + index) & 7)))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1551  					long_tmp |=3D (1L << i);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1552  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1553  			stack[stack_ptr - 1] =3D long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1554  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1555  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1556  		case OP_DYNA:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1557  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1558  			 * Dynamically change size of array
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1559  			 * ...argument 0 is variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1560  			 * ...stack 0 is new size
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1561  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1562  			if (!altera_check_stack(stack_ptr, 1, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1563  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1564  			variable_id =3D args[0];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1565  			long_tmp =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1566  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1567  			if (long_tmp > var_size[variable_id]) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1568  				var_size[variable_id] =3D long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1569  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1570  				if (attrs[variable_id] & 0x10)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1571  					/* allocate integer array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1572  					long_tmp *=3D sizeof(long);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1573  				else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1574  					/* allocate Boolean array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1575  					long_tmp =3D (long_tmp + 7) >> 3;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1576  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1577  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1578  				 * If the buffer was previously allocated,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1579  				 * free it
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1580  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1581  				if (attrs[variable_id] & 0x80) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1582  					kfree((void *)vars[variable_id]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1583  					vars[variable_id] =3D 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1584  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1585  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1586  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1587  				 * Allocate a new buffer
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1588  				 * of the requested size
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1589  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1590  				vars[variable_id] =3D (long)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1591  					kzalloc(long_tmp, GFP_KERNEL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1592  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1593  				if (vars[variable_id] =3D=3D 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1594  					status =3D -ENOMEM;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1595  					break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1596  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1597  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1598  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1599  				 * Set the attribute bit to indicate that
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1600  				 * this buffer was dynamically allocated and
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1601  				 * should be freed later
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1602  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1603  				attrs[variable_id] |=3D 0x80;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1604  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1605  				/* zero out memory */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1606  				count =3D ((var_size[variable_id] + 7L) /
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1607  									8L);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1608  				charptr_tmp =3D (u8 *)(vars[variable_id]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1609  				for (index =3D 0; index < count; ++index)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1610  					charptr_tmp[index] =3D 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1611  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1612  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1613  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1614  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1615  		case OP_EXPV:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1616  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1617  			 * Export Boolean array
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1618  			 * ...argument 0 is string ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1619  			 * ...stack 0 is variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1620  			 * ...stack 1 is array right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1621  			 * ...stack 2 is array left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1622  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1623  			if (!altera_check_stack(stack_ptr, 3, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1624  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1625  			if (version =3D=3D 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1626  				/* EXPV is not supported in JBC 1.0 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1627  				bad_opcode =3D 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1628  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1629  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1630  			name =3D &p[str_table + args[0]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1631  			variable_id =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1632  			long_idx =3D stack[--stack_ptr];/* right indx */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1633  			long_idx2 =3D stack[--stack_ptr];/* left indx */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1634  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1635  			if (long_idx > long_idx2) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1636  				/* reverse indices not supported */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1637  				status =3D -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1638  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1639  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1640  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1641  			long_count =3D 1 + long_idx2 - long_idx;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1642  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1643  			charptr_tmp =3D (u8 *)vars[variable_id];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1644  			charptr_tmp2 =3D NULL;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1645  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1646  			if ((long_idx & 7L) !=3D 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1647  				s32 k =3D long_idx;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1648  				charptr_tmp2 =3D
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1649  					kzalloc(((long_count + 7L) / 8L),
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1650  							GFP_KERNEL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1651  				if (charptr_tmp2 =3D=3D NULL) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1652  					status =3D -ENOMEM;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1653  					break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1654  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1655  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1656  				for (i =3D 0; i < long_count; ++i) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1657  					if (charptr_tmp[k >> 3] &
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1658  							(1 << (k & 7)))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1659  						charptr_tmp2[i >> 3] |=3D
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1660  								(1 << (i & 7));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1661  					else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1662  						charptr_tmp2[i >> 3] &=3D
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1663  								~(1 << (i & 7));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1664  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1665  					++k;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1666  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1667  				charptr_tmp =3D charptr_tmp2;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1668  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1669  			} else if (long_idx !=3D 0)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1670  				charptr_tmp =3D &charptr_tmp[long_idx >> 3];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1671  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1672  			altera_export_bool_array(name, charptr_tmp,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1673  							long_count);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1674  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1675  			/* free allocated buffer */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1676  			if ((long_idx & 7L) !=3D 0)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1677  				kfree(charptr_tmp2);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1678  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1679  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1680  		case OP_COPY: {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1681  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1682  			 * Array copy
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1683  			 * ...argument 0 is dest ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1684  			 * ...argument 1 is source ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1685  			 * ...stack 0 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1686  			 * ...stack 1 is dest index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1687  			 * ...stack 2 is source index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1688  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1689  			s32 copy_count;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1690  			s32 copy_index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1691  			s32 copy_index2;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1692  			s32 destleft;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1693  			s32 src_count;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1694  			s32 dest_count;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1695  			int src_reverse =3D 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1696  			int dest_reverse =3D 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1697  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1698  			if (!altera_check_stack(stack_ptr, 3, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1699  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1700  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1701  			copy_count =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1702  			copy_index =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1703  			copy_index2 =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1704  			reverse =3D 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1705  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1706  			if (version > 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1707  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1708  				 * stack 0 =3D source right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1709  				 * stack 1 =3D source left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1710  				 * stack 2 =3D destination right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1711  				 * stack 3 =3D destination left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1712  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1713  				destleft =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1714  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1715  				if (copy_count > copy_index) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1716  					src_reverse =3D 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1717  					reverse =3D 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1718  					src_count =3D 1 + copy_count - copy_index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1719  					/* copy_index =3D source start index */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1720  				} else {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1721  					src_count =3D 1 + copy_index - copy_count;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1722  					/* source start index */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1723  					copy_index =3D copy_count;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1724  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1725  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1726  				if (copy_index2 > destleft) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1727  					dest_reverse =3D 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1728  					reverse =3D !reverse;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1729  					dest_count =3D 1 + copy_index2 - destleft;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1730  					/* destination start index */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1731  					copy_index2 =3D destleft;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1732  				} else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1733  					dest_count =3D 1 + destleft - copy_index2;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1734  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1735  				copy_count =3D (src_count < dest_count) ?
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1736  							src_count : dest_count;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1737  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1738  				if ((src_reverse || dest_reverse) &&
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1739  					(src_count !=3D dest_count))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1740  					/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1741  					 * If either the source or destination
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1742  					 * is reversed, we can't tolerate
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1743  					 * a length mismatch, because we
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1744  					 * "left justify" arrays when copying.
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1745  					 * This won't work correctly
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1746  					 * with reversed arrays.
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1747  					 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1748  					status =3D -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1749  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1750  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1751  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1752  			count =3D copy_count;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1753  			index =3D copy_index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1754  			index2 =3D copy_index2;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1755  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1756  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1757  			 * If destination is a read-only array,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1758  			 * allocate a buffer and convert it to a writable array
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1759  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1760  			variable_id =3D args[1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1761  			if ((version > 0) &&
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1762  				((attrs[variable_id] & 0x9c) =3D=3D 0x0c)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1763  				/* Allocate a writable buffer for this array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1764  				long_tmp =3D
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1765  					(var_size[variable_id] + 7L) >> 3L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1766  				charptr_tmp2 =3D (u8 *)vars[variable_id];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1767  				charptr_tmp =3D
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1768  					kzalloc(long_tmp, GFP_KERNEL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1769  				vars[variable_id] =3D (long)charptr_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1770  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1771  				if (vars[variable_id] =3D=3D 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1772  					status =3D -ENOMEM;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1773  					break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1774  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1775  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1776  				/* zero the buffer */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1777  				for (long_idx =3D 0L; long_idx < long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1778  								++long_idx)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1779  					charptr_tmp[long_idx] =3D 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1780  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1781  				/* copy previous contents into buffer */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1782  				for (long_idx =3D 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1783  					long_idx < var_size[variable_id];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1784  								++long_idx) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1785  					long_idx2 =3D long_idx;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1786  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1787  					if (charptr_tmp2[long_idx2 >> 3] &
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1788  						(1 << (long_idx2 & 7)))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1789  						charptr_tmp[long_idx >> 3] |=3D
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1790  							(1 << (long_idx & 7));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1791  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1792  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1793  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1794  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1795  				set bit 7 - buffer was dynamically allocated */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1796  				attrs[variable_id] |=3D 0x80;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1797  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1798  				/* clear bit 2 - variable is writable */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1799  				attrs[variable_id] &=3D ~0x04;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1800  				attrs[variable_id] |=3D 0x01;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1801  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1802  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1803  			charptr_tmp =3D (u8 *)vars[args[1]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1804  			charptr_tmp2 =3D (u8 *)vars[args[0]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1805  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1806  			/* check if destination is a writable Boolean array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1807  			if ((attrs[args[1]] & 0x1c) !=3D 0x08) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1808  				status =3D -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1809  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1810  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1811  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1812  			if (count < 1) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1813  				status =3D -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1814  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1815  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1816  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1817  			if (reverse)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1818  				index2 +=3D (count - 1);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1819  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1820  			for (i =3D 0; i < count; ++i) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1821  				if (charptr_tmp2[index >> 3] &
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1822  							(1 << (index & 7)))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1823  					charptr_tmp[index2 >> 3] |=3D
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1824  							(1 << (index2 & 7));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1825  				else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1826  					charptr_tmp[index2 >> 3] &=3D
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1827  						~(1 << (index2 & 7));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1828  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1829  				++index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1830  				if (reverse)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1831  					--index2;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1832  				else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1833  					++index2;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1834  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1835  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1836  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1837  		}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1838  		case OP_DSC:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1839  		case OP_ISC: {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1840  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1841  			 * DRSCAN with capture
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1842  			 * IRSCAN with capture
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1843  			 * ...argument 0 is scan data variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1844  			 * ...argument 1 is capture variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1845  			 * ...stack 0 is capture index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1846  			 * ...stack 1 is scan data index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1847  			 * ...stack 2 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1848  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1849  			s32 scan_right, scan_left;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1850  			s32 capture_count =3D 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1851  			s32 scan_count =3D 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1852  			s32 capture_index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1853  			s32 scan_index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1854  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1855  			if (!altera_check_stack(stack_ptr, 3, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1856  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1857  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1858  			capture_index =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1859  			scan_index =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1860  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1861  			if (version > 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1862  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1863  				 * stack 0 =3D capture right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1864  				 * stack 1 =3D capture left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1865  				 * stack 2 =3D scan right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1866  				 * stack 3 =3D scan left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1867  				 * stack 4 =3D count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1868  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1869  				scan_right =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1870  				scan_left =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1871  				capture_count =3D 1 + scan_index - capture_index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1872  				scan_count =3D 1 + scan_left - scan_right;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1873  				scan_index =3D scan_right;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1874  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1875  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1876  			long_count =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1877  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1878  			 * If capture array is read-only, allocate a buffer
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1879  			 * and convert it to a writable array
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1880  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1881  			variable_id =3D args[1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1882  			if ((version > 0) &&
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1883  				((attrs[variable_id] & 0x9c) =3D=3D 0x0c)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1884  				/* Allocate a writable buffer for this array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1885  				long_tmp =3D
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1886  					(var_size[variable_id] + 7L) >> 3L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1887  				charptr_tmp2 =3D (u8 *)vars[variable_id];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1888  				charptr_tmp =3D
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1889  					kzalloc(long_tmp, GFP_KERNEL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1890  				vars[variable_id] =3D (long)charptr_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1891  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1892  				if (vars[variable_id] =3D=3D 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1893  					status =3D -ENOMEM;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1894  					break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1895  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1896  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1897  				/* zero the buffer */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1898  				for (long_idx =3D 0L; long_idx < long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1899  								++long_idx)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1900  					charptr_tmp[long_idx] =3D 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1901  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1902  				/* copy previous contents into buffer */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1903  				for (long_idx =3D 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1904  					long_idx < var_size[variable_id];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1905  								++long_idx) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1906  					long_idx2 =3D long_idx;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1907  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1908  					if (charptr_tmp2[long_idx2 >> 3] &
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1909  						(1 << (long_idx2 & 7)))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1910  						charptr_tmp[long_idx >> 3] |=3D
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1911  							(1 << (long_idx & 7));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1912  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1913  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1914  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1915  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1916  				 * set bit 7 - buffer was
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1917  				 * dynamically allocated
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1918  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1919  				attrs[variable_id] |=3D 0x80;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1920  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1921  				/* clear bit 2 - variable is writable */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1922  				attrs[variable_id] &=3D ~0x04;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1923  				attrs[variable_id] |=3D 0x01;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1924  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1925  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1926  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1927  			charptr_tmp =3D (u8 *)vars[args[0]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1928  			charptr_tmp2 =3D (u8 *)vars[args[1]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1929  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1930  			if ((version > 0) &&
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1931  					((long_count > capture_count) ||
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1932  					(long_count > scan_count))) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1933  				status =3D -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1934  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1935  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1936  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1937  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1938  			 * check that capture array
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1939  			 * is a writable Boolean array
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1940  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1941  			if ((attrs[args[1]] & 0x1c) !=3D 0x08) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1942  				status =3D -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1943  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1944  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1945  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1946  			if (status =3D=3D 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1947  				if (opcode =3D=3D 0x82) /* DSC */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1948  					status =3D altera_swap_dr(astate,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1949  							long_count,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1950  							charptr_tmp,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1951  							scan_index,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1952  							charptr_tmp2,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1953  							capture_index);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1954  				else /* ISC */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1955  					status =3D altera_swap_ir(astate,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1956  							long_count,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1957  							charptr_tmp,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1958  							scan_index,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1959  							charptr_tmp2,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1960  							capture_index);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1961  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1962  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1963  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1964  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1965  		}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1966  		case OP_WAIT:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1967  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1968  			 * WAIT
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1969  			 * ...argument 0 is wait state
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1970  			 * ...argument 1 is end state
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1971  			 * ...stack 0 is cycles
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1972  			 * ...stack 1 is microseconds
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1973  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1974  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1975  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1976  			long_tmp =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1977  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1978  			if (long_tmp !=3D 0L)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1979  				status =3D altera_wait_cycles(astate, long_tmp,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1980  								args[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1981  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1982  			long_tmp =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1983  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1984  			if ((status =3D=3D 0) && (long_tmp !=3D 0L))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1985  				status =3D altera_wait_msecs(astate,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1986  								long_tmp,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1987  								args[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1988  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1989  			if ((status =3D=3D 0) && (args[1] !=3D args[0]))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1990  				status =3D altera_goto_jstate(astate,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1991  								args[1]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1992  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1993  			if (version > 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1994  				--stack_ptr; /* throw away MAX cycles */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1995  				--stack_ptr; /* throw away MAX microseconds */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1996  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1997  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1998  		case OP_CMPA: {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  1999  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2000  			 * Array compare
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2001  			 * ...argument 0 is source 1 ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2002  			 * ...argument 1 is source 2 ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2003  			 * ...argument 2 is mask ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2004  			 * ...stack 0 is source 1 index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2005  			 * ...stack 1 is source 2 index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2006  			 * ...stack 2 is mask index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2007  			 * ...stack 3 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2008  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2009  			s32 a, b;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2010  			u8 *source1 =3D (u8 *)vars[args[0]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2011  			u8 *source2 =3D (u8 *)vars[args[1]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2012  			u8 *mask =3D (u8 *)vars[args[2]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2013  			u32 index1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2014  			u32 index2;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2015  			u32 mask_index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2016  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2017  			if (!altera_check_stack(stack_ptr, 4, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2018  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2019  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2020  			index1 =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2021  			index2 =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2022  			mask_index =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2023  			long_count =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2024  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2025  			if (version > 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2026  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2027  				 * stack 0 =3D source 1 right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2028  				 * stack 1 =3D source 1 left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2029  				 * stack 2 =3D source 2 right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2030  				 * stack 3 =3D source 2 left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2031  				 * stack 4 =3D mask right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2032  				 * stack 5 =3D mask left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2033  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2034  				s32 mask_right =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2035  				s32 mask_left =3D stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2036  				/* source 1 count */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2037  				a =3D 1 + index2 - index1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2038  				/* source 2 count */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2039  				b =3D 1 + long_count - mask_index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2040  				a =3D (a < b) ? a : b;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2041  				/* mask count */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2042  				b =3D 1 + mask_left - mask_right;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2043  				a =3D (a < b) ? a : b;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2044  				/* source 2 start index */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2045  				index2 =3D mask_index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2046  				/* mask start index */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2047  				mask_index =3D mask_right;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2048  				long_count =3D a;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2049  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2050  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2051  			long_tmp =3D 1L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2052  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2053  			if (long_count < 1)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2054  				status =3D -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2055  			else {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2056  				count =3D long_count;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2057  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2058  				for (i =3D 0; i < count; ++i) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2059  					if (mask[mask_index >> 3] &
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2060  						(1 << (mask_index & 7))) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2061  						a =3D source1[index1 >> 3] &
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2062  							(1 << (index1 & 7))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2063  								? 1 : 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2064  						b =3D source2[index2 >> 3] &
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2065  							(1 << (index2 & 7))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2066  								? 1 : 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2067  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2068  						if (a !=3D b) /* failure */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2069  							long_tmp =3D 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2070  					}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2071  					++index1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2072  					++index2;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2073  					++mask_index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2074  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2075  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2076  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2077  			stack[stack_ptr++] =3D long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2078  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2079  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2080  		}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2081  		default:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2082  			/* Unrecognized opcode -- ERROR! */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2083  			bad_opcode =3D 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2084  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2085  		}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2086  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2087  		if (bad_opcode)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2088  			status =3D -ENOSYS;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2089  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2090  		if ((stack_ptr < 0) || (stack_ptr >=3D ALTERA_STACK_SIZE))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2091  			status =3D -EOVERFLOW;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2092  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2093  		if (status !=3D 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2094  			done =3D 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2095  			*error_address =3D (s32)(opcode_address - code_sect);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2096  		}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2097  	}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2098  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2099  	altera_free_buffers(astate);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2100  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2101  	/* Free all dynamically allocated arrays */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2102  	if ((attrs !=3D NULL) && (vars !=3D NULL))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2103  		for (i =3D 0; i < sym_count; ++i)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2104  			if (attrs[i] & 0x80)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2105  				kfree((void *)vars[i]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2106  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2107  	kfree(vars);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2108  	kfree(var_size);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2109  	kfree(attrs);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2110  	kfree(proc_attributes);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2111  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2112  	return status;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25 @2113  }
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011=
-01-25  2114  =


:::::: The code@line 2113 was first introduced by commit
:::::: fa766c9be58bd872784b081074a7d15a3ce61c5f [media] Altera FPGA firmwar=
e download module

:::::: TO: Igor M. Liplianin <liplianin@me.by>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0341457631590160035==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============0341457631590160035==--

