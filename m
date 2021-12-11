Content-Type: multipart/mixed; boundary="===============4713551406531908725=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/ptrace.c:213:9: sparse: sparse: cast from unknown type
Date: Sat, 11 Dec 2021 14:25:27 +0800
Message-ID: <202112111440.PdUfGlMj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4713551406531908725==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Michael Ellerman <mpe@ellerman.id.au>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6f513529296fd4f696afb4354c46508abe646541
commit: e432fe97f3e5de325b40021e505cce53877586c5 powerpc/bug: Cast to unsig=
ned long before passing to inline asm
date:   3 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 months ago
config: powerpc64-randconfig-s031-20211210 (https://download.01.org/0day-ci=
/archive/20211211/202112111440.PdUfGlMj-lkp(a)intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De432fe97f3e5de325b40021e505cce53877586c5
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e432fe97f3e5de325b40021e505cce53877586c5
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dp=
owerpc SHELL=3D/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   kernel/ptrace.c:54:22: sparse: sparse: incompatible types in comparison =
expression (different address spaces):
   kernel/ptrace.c:54:22: sparse:    struct task_struct *
   kernel/ptrace.c:54:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/ptrace.c:73:23: sparse: sparse: incorrect type in assignment (dif=
ferent address spaces) @@     expected struct task_struct [noderef] __rcu *=
parent @@     got struct task_struct *new_parent @@
   kernel/ptrace.c:73:23: sparse:     expected struct task_struct [noderef]=
 __rcu *parent
   kernel/ptrace.c:73:23: sparse:     got struct task_struct *new_parent
   kernel/ptrace.c:74:29: sparse: sparse: incorrect type in assignment (dif=
ferent address spaces) @@     expected struct cred const [noderef] __rcu *p=
tracer_cred @@     got struct cred const * @@
   kernel/ptrace.c:74:29: sparse:     expected struct cred const [noderef] =
__rcu *ptracer_cred
   kernel/ptrace.c:74:29: sparse:     got struct cred const *
   kernel/ptrace.c:128:18: sparse: sparse: incorrect type in assignment (di=
fferent address spaces) @@     expected struct cred const *old_cred @@     =
got struct cred const [noderef] __rcu *ptracer_cred @@
   kernel/ptrace.c:128:18: sparse:     expected struct cred const *old_cred
   kernel/ptrace.c:128:18: sparse:     got struct cred const [noderef] __rc=
u *ptracer_cred
   kernel/ptrace.c:132:25: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected struct spinlock [usertype] *lock @@=
     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:132:25: sparse:     expected struct spinlock [usertype] =
*lock
   kernel/ptrace.c:132:25: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:170:27: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected struct spinlock [usertype] *lock @@=
     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:170:27: sparse:     expected struct spinlock [usertype] =
*lock
   kernel/ptrace.c:170:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:197:28: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected struct spinlock [usertype] *lock @@=
     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:197:28: sparse:     expected struct spinlock [usertype] =
*lock
   kernel/ptrace.c:197:28: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:203:30: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected struct spinlock [usertype] *lock @@=
     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:203:30: sparse:     expected struct spinlock [usertype] =
*lock
   kernel/ptrace.c:203:30: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:213:9: sparse: sparse: incompatible types in comparison =
expression (different address spaces):
   kernel/ptrace.c:213:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/ptrace.c:213:9: sparse:    struct task_struct *
   kernel/ptrace.c:213:9: sparse: sparse: incompatible types in comparison =
expression (different address spaces):
   kernel/ptrace.c:213:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/ptrace.c:213:9: sparse:    struct task_struct *
   kernel/ptrace.c:213:9: sparse: sparse: incompatible types in comparison =
expression (different address spaces):
   kernel/ptrace.c:213:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/ptrace.c:213:9: sparse:    struct task_struct *
>> kernel/ptrace.c:213:9: sparse: sparse: cast from unknown type
   kernel/ptrace.c:258:44: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   kernel/ptrace.c:258:44: sparse:    struct task_struct [noderef] __rcu *
   kernel/ptrace.c:258:44: sparse:    struct task_struct *
   kernel/ptrace.c:432:24: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected struct spinlock [usertype] *lock @@=
     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:432:24: sparse:     expected struct spinlock [usertype] =
*lock
   kernel/ptrace.c:432:24: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:455:26: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected struct spinlock [usertype] *lock @@=
     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:455:26: sparse:     expected struct spinlock [usertype] =
*lock
   kernel/ptrace.c:455:26: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:491:54: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected struct task_struct *parent @@     g=
ot struct task_struct [noderef] __rcu *parent @@
   kernel/ptrace.c:491:54: sparse:     expected struct task_struct *parent
   kernel/ptrace.c:491:54: sparse:     got struct task_struct [noderef] __r=
cu *parent
   kernel/ptrace.c:499:53: sparse: sparse: incorrect type in argument 2 (di=
fferent address spaces) @@     expected struct task_struct *new_parent @@  =
   got struct task_struct [noderef] __rcu *real_parent @@
   kernel/ptrace.c:499:53: sparse:     expected struct task_struct *new_par=
ent
   kernel/ptrace.c:499:53: sparse:     got struct task_struct [noderef] __r=
cu *real_parent
   kernel/ptrace.c:547:41: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected struct task_struct *p1 @@     got s=
truct task_struct [noderef] __rcu *real_parent @@
   kernel/ptrace.c:547:41: sparse:     expected struct task_struct *p1
   kernel/ptrace.c:547:41: sparse:     got struct task_struct [noderef] __r=
cu *real_parent
   kernel/ptrace.c:549:50: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected struct sighand_struct *sigh @@     =
got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/ptrace.c:549:50: sparse:     expected struct sighand_struct *sigh
   kernel/ptrace.c:549:50: sparse:     got struct sighand_struct [noderef] =
__rcu *sighand
   kernel/ptrace.c:751:37: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected struct spinlock [usertype] *lock @@=
     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:751:37: sparse:     expected struct spinlock [usertype] =
*lock
   kernel/ptrace.c:751:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:759:39: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected struct spinlock [usertype] *lock @@=
     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:759:39: sparse:     expected struct spinlock [usertype] =
*lock
   kernel/ptrace.c:759:39: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:882:37: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected struct spinlock [usertype] *lock @@=
     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:882:37: sparse:     expected struct spinlock [usertype] =
*lock
   kernel/ptrace.c:882:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:886:39: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected struct spinlock [usertype] *lock @@=
     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:886:39: sparse:     expected struct spinlock [usertype] =
*lock
   kernel/ptrace.c:886:39: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:1116:37: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:1116:37: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/ptrace.c:1116:37: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/ptrace.c:1118:39: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:1118:39: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/ptrace.c:1118:39: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/ptrace.c:497:38: sparse: sparse: dereference of noderef expression
   kernel/ptrace.c: note: in included file (through include/linux/rcuwait.h=
, include/linux/percpu-rwsem.h, include/linux/fs.h, ...):
   include/linux/sched/signal.h:714:37: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected struct spinlock [usert=
ype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:714:37: sparse:     expected struct spinloc=
k [usertype] *lock
   include/linux/sched/signal.h:714:37: sparse:     got struct spinlock [no=
deref] __rcu *
   kernel/ptrace.c:698:9: sparse: sparse: context imbalance in 'ptrace_gets=
iginfo' - different lock contexts for basic block
   include/linux/sched/signal.h:714:37: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected struct spinlock [usert=
ype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:714:37: sparse:     expected struct spinloc=
k [usertype] *lock
   include/linux/sched/signal.h:714:37: sparse:     got struct spinlock [no=
deref] __rcu *
   kernel/ptrace.c:714:9: sparse: sparse: context imbalance in 'ptrace_sets=
iginfo' - different lock contexts for basic block
   kernel/ptrace.c:888:9: sparse: sparse: context imbalance in 'ptrace_resu=
me' - different lock contexts for basic block
   include/linux/sched/signal.h:714:37: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected struct spinlock [usert=
ype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:714:37: sparse:     expected struct spinloc=
k [usertype] *lock
   include/linux/sched/signal.h:714:37: sparse:     got struct spinlock [no=
deref] __rcu *
   include/linux/sched/signal.h:714:37: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected struct spinlock [usert=
ype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:714:37: sparse:     expected struct spinloc=
k [usertype] *lock
   include/linux/sched/signal.h:714:37: sparse:     got struct spinlock [no=
deref] __rcu *
   kernel/ptrace.c:1270:9: sparse: sparse: context imbalance in 'ptrace_req=
uest' - different lock contexts for basic block
--
   kernel/sched/rt.c:913:70: sparse: sparse: incompatible types in comparis=
on expression (different address spaces):
   kernel/sched/rt.c:913:70: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:913:70: sparse:    struct task_struct *
   kernel/sched/rt.c:2223:25: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   kernel/sched/rt.c:2223:25: sparse:    struct task_struct *
   kernel/sched/rt.c:2223:25: sparse:    struct task_struct [noderef] __rcu=
 *
   kernel/sched/rt.c:2223:25: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   kernel/sched/rt.c:2223:25: sparse:    struct task_struct *
   kernel/sched/rt.c:2223:25: sparse:    struct task_struct [noderef] __rcu=
 *
   kernel/sched/rt.c:2223:25: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   kernel/sched/rt.c:2223:25: sparse:    struct task_struct *
   kernel/sched/rt.c:2223:25: sparse:    struct task_struct [noderef] __rcu=
 *
>> kernel/sched/rt.c:2223:25: sparse: sparse: cast from unknown type
   kernel/sched/rt.c:999:38: sparse: sparse: incorrect type in initializer =
(different address spaces) @@     expected struct task_struct *curr @@     =
got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:999:38: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:999:38: sparse:     got struct task_struct [noderef] _=
_rcu *curr
   kernel/sched/rt.c:1426:31: sparse: sparse: incorrect type in argument 2 =
(different address spaces) @@     expected struct task_struct *p @@     got=
 struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1426:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1426:31: sparse:     got struct task_struct [noderef] =
__rcu *curr
   kernel/sched/rt.c:1753:9: sparse: sparse: incorrect type in assignment (=
different address spaces) @@     expected struct sched_domain *[assigned] s=
d @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/rt.c:1753:9: sparse:     expected struct sched_domain *[ass=
igned] sd
   kernel/sched/rt.c:1753:9: sparse:     got struct sched_domain [noderef] =
__rcu *parent
   kernel/sched/rt.c:1446:14: sparse: sparse: incorrect type in assignment =
(different address spaces) @@     expected struct task_struct *curr @@     =
got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1446:14: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1446:14: sparse:     got struct task_struct [noderef] =
__rcu *
   kernel/sched/rt.c:1511:45: sparse: sparse: incorrect type in argument 2 =
(different address spaces) @@     expected struct task_struct *p @@     got=
 struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1511:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1511:45: sparse:     got struct task_struct [noderef] =
__rcu *curr
   kernel/sched/rt.c:1572:67: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct task_struct *tsk @@     g=
ot struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1572:67: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1572:67: sparse:     got struct task_struct [noderef] =
__rcu *curr
   kernel/sched/rt.c:1895:40: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct task_struct *task @@     =
got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1895:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:1895:40: sparse:     got struct task_struct [noderef] =
__rcu *curr
   kernel/sched/rt.c:1916:13: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   kernel/sched/rt.c:1916:13: sparse:    struct task_struct *
   kernel/sched/rt.c:1916:13: sparse:    struct task_struct [noderef] __rcu=
 *
   kernel/sched/rt.c:1916:13: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   kernel/sched/rt.c:1916:13: sparse:    struct task_struct *
   kernel/sched/rt.c:1916:13: sparse:    struct task_struct [noderef] __rcu=
 *
   kernel/sched/rt.c:1916:13: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   kernel/sched/rt.c:1916:13: sparse:    struct task_struct *
   kernel/sched/rt.c:1916:13: sparse:    struct task_struct [noderef] __rcu=
 *
   kernel/sched/rt.c:1916:13: sparse: sparse: cast from unknown type
   kernel/sched/rt.c:2274:54: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct task_struct *tsk @@     g=
ot struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2274:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2274:54: sparse:     got struct task_struct [noderef] =
__rcu *curr
   kernel/sched/rt.c:2276:40: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct task_struct *p @@     got=
 struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2276:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2276:40: sparse:     got struct task_struct [noderef] =
__rcu *curr
   kernel/sched/rt.c:2276:61: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct task_struct *p @@     got=
 struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2276:61: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2276:61: sparse:     got struct task_struct [noderef] =
__rcu *curr
   kernel/sched/rt.c: note: in included file:
   kernel/sched/sched.h:2011:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2011:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2011:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2011:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2011:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2011:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct *
--
   kernel/sched/deadline.c:2150:13: sparse: sparse: incompatible types in c=
omparison expression (different address spaces):
   kernel/sched/deadline.c:2150:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2150:13: sparse:    struct task_struct [noderef]=
 __rcu *
   kernel/sched/deadline.c:2150:13: sparse: sparse: incompatible types in c=
omparison expression (different address spaces):
   kernel/sched/deadline.c:2150:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2150:13: sparse:    struct task_struct [noderef]=
 __rcu *
   kernel/sched/deadline.c:2150:13: sparse: sparse: incompatible types in c=
omparison expression (different address spaces):
   kernel/sched/deadline.c:2150:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2150:13: sparse:    struct task_struct [noderef]=
 __rcu *
>> kernel/sched/deadline.c:2150:13: sparse: sparse: cast from unknown type
   kernel/sched/deadline.c:2278:25: sparse: sparse: incompatible types in c=
omparison expression (different address spaces):
   kernel/sched/deadline.c:2278:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2278:25: sparse:    struct task_struct [noderef]=
 __rcu *
   kernel/sched/deadline.c:2278:25: sparse: sparse: incompatible types in c=
omparison expression (different address spaces):
   kernel/sched/deadline.c:2278:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2278:25: sparse:    struct task_struct [noderef]=
 __rcu *
   kernel/sched/deadline.c:2278:25: sparse: sparse: incompatible types in c=
omparison expression (different address spaces):
   kernel/sched/deadline.c:2278:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2278:25: sparse:    struct task_struct [noderef]=
 __rcu *
   kernel/sched/deadline.c:2278:25: sparse: sparse: cast from unknown type
   kernel/sched/deadline.c:1798:42: sparse: sparse: incorrect type in argum=
ent 2 (different address spaces) @@     expected struct sched_dl_entity *b =
@@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1798:42: sparse:     expected struct sched_dl_en=
tity *b
   kernel/sched/deadline.c:1798:42: sparse:     got struct sched_dl_entity =
[noderef] __rcu *
   kernel/sched/deadline.c:1809:38: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected struct task_struct *tsk @@=
     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1809:38: sparse:     expected struct task_struct=
 *tsk
   kernel/sched/deadline.c:1809:38: sparse:     got struct task_struct [nod=
eref] __rcu *curr
   kernel/sched/deadline.c:1114:23: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected struct task_struct *p @@  =
   got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1114:23: sparse:     expected struct task_struct=
 *p
   kernel/sched/deadline.c:1114:23: sparse:     got struct task_struct [nod=
eref] __rcu *curr
   kernel/sched/deadline.c:1243:38: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected struct task_struct *curr =
@@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1243:38: sparse:     expected struct task_struct=
 *curr
   kernel/sched/deadline.c:1243:38: sparse:     got struct task_struct [nod=
eref] __rcu *curr
   kernel/sched/deadline.c:2006:9: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct sched_domain *[assig=
ned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2006:9: sparse:     expected struct sched_domain=
 *[assigned] sd
   kernel/sched/deadline.c:2006:9: sparse:     got struct sched_domain [nod=
eref] __rcu *parent
   kernel/sched/deadline.c:1683:14: sparse: sparse: incorrect type in assig=
nment (different address spaces) @@     expected struct task_struct *curr @=
@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:1683:14: sparse:     expected struct task_struct=
 *curr
   kernel/sched/deadline.c:1683:14: sparse:     got struct task_struct [nod=
eref] __rcu *
   kernel/sched/deadline.c:1759:43: sparse: sparse: incorrect type in argum=
ent 2 (different address spaces) @@     expected struct task_struct *p @@  =
   got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1759:43: sparse:     expected struct task_struct=
 *p
   kernel/sched/deadline.c:1759:43: sparse:     got struct task_struct [nod=
eref] __rcu *curr
   kernel/sched/deadline.c:2323:38: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected struct task_struct *tsk @@=
     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2323:38: sparse:     expected struct task_struct=
 *tsk
   kernel/sched/deadline.c:2323:38: sparse:     got struct task_struct [nod=
eref] __rcu *curr
   kernel/sched/deadline.c:2325:23: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected struct task_struct *p @@  =
   got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2325:23: sparse:     expected struct task_struct=
 *p
   kernel/sched/deadline.c:2325:23: sparse:     got struct task_struct [nod=
eref] __rcu *curr
   kernel/sched/deadline.c:2327:44: sparse: sparse: incorrect type in argum=
ent 2 (different address spaces) @@     expected struct sched_dl_entity *b =
@@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2327:44: sparse:     expected struct sched_dl_en=
tity *b
   kernel/sched/deadline.c:2327:44: sparse:     got struct sched_dl_entity =
[noderef] __rcu *
   kernel/sched/deadline.c:2491:22: sparse: sparse: incompatible types in c=
omparison expression (different address spaces):
   kernel/sched/deadline.c:2491:22: sparse:    struct task_struct [noderef]=
 __rcu *
   kernel/sched/deadline.c:2491:22: sparse:    struct task_struct *
   kernel/sched/deadline.c:1142:24: sparse: sparse: context imbalance in 'd=
l_task_timer' - wrong count at exit
   kernel/sched/deadline.c:1381:24: sparse: sparse: context imbalance in 'i=
nactive_task_timer' - wrong count at exit
   kernel/sched/deadline.c: note: in included file:
   kernel/sched/sched.h:2011:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2011:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2011:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2011:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2011:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct *
--
   kernel/sched/core.c:949:38: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected struct task_struct *curr @@   =
  got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:949:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:949:38: sparse:     got struct task_struct [noderef]=
 __rcu *curr
   kernel/sched/core.c:1004:9: sparse: sparse: incorrect type in assignment=
 (different address spaces) @@     expected struct sched_domain *[assigned]=
 sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:1004:9: sparse:     expected struct sched_domain *[a=
ssigned] sd
   kernel/sched/core.c:1004:9: sparse:     got struct sched_domain [noderef=
] __rcu *parent
   kernel/sched/core.c:2074:33: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected struct task_struct *p @@     g=
ot struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2074:33: sparse:     expected struct task_struct *p
   kernel/sched/core.c:2074:33: sparse:     got struct task_struct [noderef=
] __rcu *curr
   kernel/sched/core.c:2074:68: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected struct task_struct *tsk @@    =
 got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2074:68: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2074:68: sparse:     got struct task_struct [noderef=
] __rcu *curr
   kernel/sched/core.c:3286:17: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:3286:17: sparse:     expected struct sched_domain *[=
assigned] sd
   kernel/sched/core.c:3286:17: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/core.c:3486:36: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected struct task_struct const *p @@=
     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3486:36: sparse:     expected struct task_struct con=
st *p
   kernel/sched/core.c:3486:36: sparse:     got struct task_struct [noderef=
] __rcu *curr
   kernel/sched/core.c:8455:43: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected struct task_struct *push_task=
 @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:8455:43: sparse:     expected struct task_struct *pu=
sh_task
   kernel/sched/core.c:8455:43: sparse:     got struct task_struct [noderef=
] __rcu *curr
   kernel/sched/core.c:4941:38: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected struct task_struct *curr @@  =
   got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:4941:38: sparse:     expected struct task_struct *cu=
rr
   kernel/sched/core.c:4941:38: sparse:     got struct task_struct [noderef=
] __rcu *curr
   kernel/sched/core.c:5829:14: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct task_struct *prev @@   =
  got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:5829:14: sparse:     expected struct task_struct *pr=
ev
   kernel/sched/core.c:5829:14: sparse:     got struct task_struct [noderef=
] __rcu *curr
   kernel/sched/core.c:6422:17: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/core.c:6422:17: sparse:    struct task_struct *
   kernel/sched/core.c:6422:17: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/core.c:6422:17: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/core.c:6422:17: sparse:    struct task_struct *
   kernel/sched/core.c:6422:17: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/core.c:6422:17: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/core.c:6422:17: sparse:    struct task_struct *
   kernel/sched/core.c:6422:17: sparse:    struct task_struct [noderef] __r=
cu *
>> kernel/sched/core.c:6422:17: sparse: sparse: cast from unknown type
   kernel/sched/core.c:6629:22: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/core.c:6629:22: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/core.c:6629:22: sparse:    struct task_struct *
   kernel/sched/core.c:10388:25: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected struct task_struct *p @@     =
got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:10388:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:10388:25: sparse:     got struct task_struct [nodere=
f] __rcu *curr
   kernel/sched/core.c:453:6: sparse: sparse: context imbalance in 'raw_spi=
n_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:486:23: sparse: sparse: context imbalance in 'raw_sp=
in_rq_trylock' - wrong count at exit
   kernel/sched/core.c:502:6: sparse: sparse: context imbalance in 'raw_spi=
n_rq_unlock' - unexpected unlock
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1539:9: sparse: sparse: context imbalance in '__tas=
k_rq_lock' - wrong count at exit
   kernel/sched/sched.h:1539:9: sparse: sparse: context imbalance in 'task_=
rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:76:13: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct task_struct const *p @@  =
   got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:76:13: sparse:     expected struct task_struct const=
 *p
   kernel/sched/pelt.h:76:13: sparse:     got struct task_struct [noderef] =
__rcu *curr
   kernel/sched/core.c:2065:33: sparse: sparse: dereference of noderef expr=
ession
   kernel/sched/core.c:2066:19: sparse: sparse: dereference of noderef expr=
ession
   kernel/sched/core.c:2067:37: sparse: sparse: dereference of noderef expr=
ession
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2011:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2169:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:2169:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:2169:9: sparse:    struct task_struct *
   kernel/sched/core.c:2040:38: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/core.c:2040:38: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/core.c:2040:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2011:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2169:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:2169:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:2169:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2169:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:2169:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:2169:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2011:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2169:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:2169:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:2169:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2011:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2169:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:2169:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:2169:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2011:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:2011:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2169:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:2169:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:2169:9: sparse:    struct task_struct *

vim +213 kernel/ptrace.c

9899d11f654474 Oleg Nesterov      2013-01-21  207  =

9899d11f654474 Oleg Nesterov      2013-01-21  208  static void ptrace_unfre=
eze_traced(struct task_struct *task)
9899d11f654474 Oleg Nesterov      2013-01-21  209  {
2f064a59a11ff9 Peter Zijlstra     2021-06-11  210  	if (READ_ONCE(task->__s=
tate) !=3D __TASK_TRACED)
9899d11f654474 Oleg Nesterov      2013-01-21  211  		return;
9899d11f654474 Oleg Nesterov      2013-01-21  212  =

9899d11f654474 Oleg Nesterov      2013-01-21 @213  	WARN_ON(!task->ptrace |=
| task->parent !=3D current);
9899d11f654474 Oleg Nesterov      2013-01-21  214  =

5402e97af667e3 bsegall(a)google.com 2017-04-07  215  	/*
5402e97af667e3 bsegall(a)google.com 2017-04-07  216  	 * PTRACE_LISTEN can =
allow ptrace_trap_notify to wake us up remotely.
5402e97af667e3 bsegall(a)google.com 2017-04-07  217  	 * Recheck state unde=
r the lock to close this race.
5402e97af667e3 bsegall(a)google.com 2017-04-07  218  	 */
9899d11f654474 Oleg Nesterov      2013-01-21  219  	spin_lock_irq(&task->si=
ghand->siglock);
2f064a59a11ff9 Peter Zijlstra     2021-06-11  220  	if (READ_ONCE(task->__s=
tate) =3D=3D __TASK_TRACED) {
9899d11f654474 Oleg Nesterov      2013-01-21  221  		if (__fatal_signal_pen=
ding(task))
9899d11f654474 Oleg Nesterov      2013-01-21  222  			wake_up_state(task, _=
_TASK_TRACED);
9899d11f654474 Oleg Nesterov      2013-01-21  223  		else
2f064a59a11ff9 Peter Zijlstra     2021-06-11  224  			WRITE_ONCE(task->__st=
ate, TASK_TRACED);
5402e97af667e3 bsegall(a)google.com 2017-04-07  225  	}
9899d11f654474 Oleg Nesterov      2013-01-21  226  	spin_unlock_irq(&task->=
sighand->siglock);
9899d11f654474 Oleg Nesterov      2013-01-21  227  }
9899d11f654474 Oleg Nesterov      2013-01-21  228  =


:::::: The code at line 213 was first introduced by commit
:::::: 9899d11f654474d2d54ea52ceaa2a1f4db3abd68 ptrace: ensure arch_ptrace/=
ptrace_request can never race with SIGKILL

:::::: TO: Oleg Nesterov <oleg@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4713551406531908725==--

