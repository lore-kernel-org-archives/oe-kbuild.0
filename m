Content-Type: multipart/mixed; boundary="===============7228399020979860668=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/sched/rt.c:2223:25: sparse: sparse: cast from unknown type
Date: Tue, 14 Jun 2022 21:18:22 +0800
Message-ID: <202206142159.5mpl6opZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7228399020979860668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 kernel/sched/rt.c:2223:25: sparse: sparse: cast from unknown type"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Michael Ellerman <mpe@ellerman.id.au>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
commit: e432fe97f3e5de325b40021e505cce53877586c5 powerpc/bug: Cast to unsig=
ned long before passing to inline asm
date:   10 months ago
:::::: branch date: 2 days ago
:::::: commit date: 10 months ago
config: powerpc64-randconfig-s032-20220613 (https://download.01.org/0day-ci=
/archive/20220614/202206142159.5mpl6opZ-lkp(a)intel.com/config)
compiler: powerpc64le-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-30-g92122700-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De432fe97f3e5de325b40021e505cce53877586c5
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e432fe97f3e5de325b40021e505cce53877586c5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dp=
owerpc SHELL=3D/bin/bash arch/powerpc/kvm/ arch/powerpc/platforms/powernv/ =
kernel/sched/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
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
   kernel/sched/rt.c:530:54: sparse: sparse: incorrect type in initializer =
(different address spaces) @@     expected struct task_struct *curr @@     =
got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:530:54: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:530:54: sparse:     got struct task_struct [noderef] _=
_rcu *curr
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
   kernel/sched/core.c:696:48: sparse: sparse: incorrect type in argument 2=
 (different address spaces) @@     expected struct task_struct *p @@     go=
t struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:696:48: sparse:     expected struct task_struct *p
   kernel/sched/core.c:696:48: sparse:     got struct task_struct [noderef]=
 __rcu *curr
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
   kernel/sched/core.c:9280:16: sparse: sparse: incorrect type in return ex=
pression (different address spaces) @@     expected struct task_struct * @@=
     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:9280:16: sparse:     expected struct task_struct *
   kernel/sched/core.c:9280:16: sparse:     got struct task_struct [noderef=
] __rcu *curr
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
   kernel/sched/core.c:540:36: sparse: sparse: context imbalance in '__task=
_rq_lock' - wrong count at exit
   kernel/sched/core.c:581:36: sparse: sparse: context imbalance in 'task_r=
q_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:76:13: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct task_struct const *p @@  =
   got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:76:13: sparse:     expected struct task_struct const=
 *p
   kernel/sched/pelt.h:76:13: sparse:     got struct task_struct [noderef] =
__rcu *curr
   kernel/sched/core.c:696:11: sparse: sparse: dereference of noderef expre=
ssion
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

vim +2223 kernel/sched/rt.c

b6366f048e0caf kernel/sched/rt.c Steven Rostedt  2015-03-18  2186  =

c6c4927b22a351 kernel/sched_rt.c Rusty Russell   2008-11-25  2187  	for_eac=
h_cpu(cpu, this_rq->rd->rto_mask) {
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2188  		if (th=
is_cpu =3D=3D cpu)
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2189  			conti=
nue;
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2190  =

f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2191  		src_rq=
 =3D cpu_rq(cpu);
74ab8e4f6412c0 kernel/sched_rt.c Gregory Haskins 2008-12-29  2192  =

74ab8e4f6412c0 kernel/sched_rt.c Gregory Haskins 2008-12-29  2193  		/*
74ab8e4f6412c0 kernel/sched_rt.c Gregory Haskins 2008-12-29  2194  		 * Don=
't bother taking the src_rq->lock if the next highest
74ab8e4f6412c0 kernel/sched_rt.c Gregory Haskins 2008-12-29  2195  		 * tas=
k is known to be lower-priority than our current task.
74ab8e4f6412c0 kernel/sched_rt.c Gregory Haskins 2008-12-29  2196  		 * Thi=
s may look racy, but if this value is about to go
74ab8e4f6412c0 kernel/sched_rt.c Gregory Haskins 2008-12-29  2197  		 * log=
ically higher, the src_rq will push this task away.
74ab8e4f6412c0 kernel/sched_rt.c Gregory Haskins 2008-12-29  2198  		 * And=
 if its going logically lower, we do not care
74ab8e4f6412c0 kernel/sched_rt.c Gregory Haskins 2008-12-29  2199  		 */
74ab8e4f6412c0 kernel/sched_rt.c Gregory Haskins 2008-12-29  2200  		if (sr=
c_rq->rt.highest_prio.next >=3D
74ab8e4f6412c0 kernel/sched_rt.c Gregory Haskins 2008-12-29  2201  		    th=
is_rq->rt.highest_prio.curr)
74ab8e4f6412c0 kernel/sched_rt.c Gregory Haskins 2008-12-29  2202  			conti=
nue;
74ab8e4f6412c0 kernel/sched_rt.c Gregory Haskins 2008-12-29  2203  =

f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2204  		/*
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2205  		 * We =
can potentially drop this_rq's lock in
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2206  		 * dou=
ble_lock_balance, and another CPU could
a8728944efe234 kernel/sched_rt.c Gregory Haskins 2008-12-29  2207  		 * alt=
er this_rq
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2208  		 */
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra  2020-09-28  2209  		push_t=
ask =3D NULL;
a8728944efe234 kernel/sched_rt.c Gregory Haskins 2008-12-29  2210  		double=
_lock_balance(this_rq, src_rq);
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2211  =

f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2212  		/*
e23ee74777f389 kernel/sched/rt.c Kirill Tkhai    2013-06-07  2213  		 * We =
can pull only a task, which is pushable
e23ee74777f389 kernel/sched/rt.c Kirill Tkhai    2013-06-07  2214  		 * on =
its rq, and no others.
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2215  		 */
e23ee74777f389 kernel/sched/rt.c Kirill Tkhai    2013-06-07  2216  		p =3D =
pick_highest_pushable_task(src_rq, this_cpu);
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2217  =

f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2218  		/*
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2219  		 * Do =
we have an RT task that preempts
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2220  		 * the=
 to-be-scheduled task?
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2221  		 */
a8728944efe234 kernel/sched_rt.c Gregory Haskins 2008-12-29  2222  		if (p =
&& (p->prio < this_rq->rt.highest_prio.curr)) {
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25 @2223  			WARN_=
ON(p =3D=3D src_rq->curr);
da0c1e65b51a28 kernel/sched/rt.c Kirill Tkhai    2014-08-20  2224  			WARN_=
ON(!task_on_rq_queued(p));
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2225  =

f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2226  			/*
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2227  			 * Th=
ere's a chance that p is higher in priority
97fb7a0a8944bd kernel/sched/rt.c Ingo Molnar     2018-03-03  2228  			 * th=
an what's currently running on its CPU.
3b03706fa621ce kernel/sched/rt.c Ingo Molnar     2021-03-18  2229  			 * Th=
is is just that p is waking up and hasn't
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2230  			 * ha=
d a chance to schedule. We only pull
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2231  			 * p =
if it is lower in priority than the
a8728944efe234 kernel/sched_rt.c Gregory Haskins 2008-12-29  2232  			 * cu=
rrent task on the run queue
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2233  			 */
a8728944efe234 kernel/sched_rt.c Gregory Haskins 2008-12-29  2234  			if (p=
->prio < src_rq->curr->prio)
614ee1f61f667b kernel/sched_rt.c Mike Galbraith  2008-01-25  2235  				goto=
 skip;
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2236  =

a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra  2020-09-28  2237  			if (i=
s_migration_disabled(p)) {
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra  2020-09-28  2238  				push=
_task =3D get_push_task(src_rq);
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra  2020-09-28  2239  			} els=
e {
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2240  				deac=
tivate_task(src_rq, p, 0);
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2241  				set_=
task_cpu(p, this_cpu);
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2242  				acti=
vate_task(this_rq, p, 0);
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra  2020-09-28  2243  				resc=
hed =3D true;
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra  2020-09-28  2244  			}
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2245  			/*
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2246  			 * We=
 continue with the search, just in
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2247  			 * ca=
se there's an even higher prio task
25985edcedea63 kernel/sched_rt.c Lucas De Marchi 2011-03-30  2248  			 * in=
 another runqueue. (low likelihood
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2249  			 * bu=
t possible)
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2250  			 */
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2251  		}
614ee1f61f667b kernel/sched_rt.c Mike Galbraith  2008-01-25  2252  skip:
1b12bbc747560e kernel/sched_rt.c Peter Zijlstra  2008-08-11  2253  		double=
_unlock_balance(this_rq, src_rq);
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra  2020-09-28  2254  =

a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra  2020-09-28  2255  		if (pu=
sh_task) {
5cb9eaa3d274f7 kernel/sched/rt.c Peter Zijlstra  2020-11-17  2256  			raw_s=
pin_rq_unlock(this_rq);
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra  2020-09-28  2257  			stop_=
one_cpu_nowait(src_rq->cpu, push_cpu_stop,
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra  2020-09-28  2258  					   =
 push_task, &src_rq->push_work);
5cb9eaa3d274f7 kernel/sched/rt.c Peter Zijlstra  2020-11-17  2259  			raw_s=
pin_rq_lock(this_rq);
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra  2020-09-28  2260  		}
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2261  	}
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2262  =

8046d680624708 kernel/sched/rt.c Peter Zijlstra  2015-06-11  2263  	if (res=
ched)
8046d680624708 kernel/sched/rt.c Peter Zijlstra  2015-06-11  2264  		resche=
d_curr(this_rq);
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2265  }
f65eda4f789168 kernel/sched_rt.c Steven Rostedt  2008-01-25  2266  =


:::::: The code at line 2223 was first introduced by commit
:::::: f65eda4f789168ba5ff3fa75546c29efeed19f58 sched: pull RT tasks from o=
verloaded runqueues

:::::: TO: Steven Rostedt <srostedt@redhat.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7228399020979860668==--

