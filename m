Content-Type: multipart/mixed; boundary="===============9038483746887705347=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tip:sched/core 21/24] kernel/sched/fair.c:5897:1: sparse: sparse: symbol '__pcpu_scope_select_rq_mask' was not declared. Should it be static?
Date: Fri, 01 Jul 2022 17:27:22 +0800
Message-ID: <202207011755.z8jsA6aZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9038483746887705347==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
CC: x86(a)kernel.org
TO: Dietmar Eggemann <dietmar.eggemann@arm.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Vincent Guittot <vincent.guittot@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/c=
ore
head:   b812fc9768e0048582c8e18d7b66559c1758dde1
commit: ec4fc801a02d96180c597238fe87141471b70971 [21/24] sched/fair: Rename=
 select_idle_mask to select_rq_mask
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: powerpc-randconfig-s032-20220629 (https://download.01.org/0day-ci/a=
rchive/20220701/202207011755.z8jsA6aZ-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commi=
t/?id=3Dec4fc801a02d96180c597238fe87141471b70971
        git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/=
tip/tip.git
        git fetch --no-tags tip sched/core
        git checkout ec4fc801a02d96180c597238fe87141471b70971
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dp=
owerpc SHELL=3D/bin/bash kernel/sched/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:927:34: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected struct sched_entity *se @@     =
got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:927:34: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:927:34: sparse:     got struct sched_entity [noderef=
] __rcu *
   kernel/sched/fair.c:11059:9: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11059:9: sparse:     expected struct sched_domain *[=
assigned] sd
   kernel/sched/fair.c:11059:9: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/fair.c:5896:1: sparse: sparse: symbol '__pcpu_scope_load_ba=
lance_mask' was not declared. Should it be static?
>> kernel/sched/fair.c:5897:1: sparse: sparse: symbol '__pcpu_scope_select_=
rq_mask' was not declared. Should it be static?
   kernel/sched/fair.c:6835:20: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:6835:20: sparse:     expected struct sched_domain *[=
assigned] sd
   kernel/sched/fair.c:6835:20: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/fair.c:6969:9: sparse: sparse: incorrect type in assignment=
 (different address spaces) @@     expected struct sched_domain *[assigned]=
 tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:6969:9: sparse:     expected struct sched_domain *[a=
ssigned] tmp
   kernel/sched/fair.c:6969:9: sparse:     got struct sched_domain [noderef=
] __rcu *parent
   kernel/sched/fair.c:7159:38: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected struct task_struct *curr @@  =
   got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:7159:38: sparse:     expected struct task_struct *cu=
rr
   kernel/sched/fair.c:7159:38: sparse:     got struct task_struct [noderef=
] __rcu *curr
   kernel/sched/fair.c:7457:38: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected struct task_struct *curr @@  =
   got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:7457:38: sparse:     expected struct task_struct *cu=
rr
   kernel/sched/fair.c:7457:38: sparse:     got struct task_struct [noderef=
] __rcu *curr
   kernel/sched/fair.c:8445:40: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected struct sched_domain *child @@=
     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:8445:40: sparse:     expected struct sched_domain *c=
hild
   kernel/sched/fair.c:8445:40: sparse:     got struct sched_domain [nodere=
f] __rcu *child
   kernel/sched/fair.c:8989:22: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/fair.c:8989:22: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/fair.c:8989:22: sparse:    struct task_struct *
   kernel/sched/fair.c:10334:9: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:10334:9: sparse:     expected struct sched_domain *[=
assigned] sd
   kernel/sched/fair.c:10334:9: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/fair.c:9994:44: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected struct sched_domain *sd_paren=
t @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:9994:44: sparse:     expected struct sched_domain *s=
d_parent
   kernel/sched/fair.c:9994:44: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/fair.c:10430:9: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:10430:9: sparse:     expected struct sched_domain *[=
assigned] sd
   kernel/sched/fair.c:10430:9: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/fair.c:5592:35: sparse: sparse: marked inline, but without =
a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2210:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:2210:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:2210:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2053:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:2053:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:2053:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2053:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:2053:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:2053:25: sparse:    struct task_struct *

vim +/__pcpu_scope_select_rq_mask +5897 kernel/sched/fair.c

10e2f1acd0106c0 Peter Zijlstra   2016-05-09  5894  =

10e2f1acd0106c0 Peter Zijlstra   2016-05-09  5895  /* Working cpumask for: =
load_balance, load_balance_newidle. */
10e2f1acd0106c0 Peter Zijlstra   2016-05-09  5896  DEFINE_PER_CPU(cpumask_v=
ar_t, load_balance_mask);
ec4fc801a02d961 Dietmar Eggemann 2022-06-23 @5897  DEFINE_PER_CPU(cpumask_v=
ar_t, select_rq_mask);
10e2f1acd0106c0 Peter Zijlstra   2016-05-09  5898  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9038483746887705347==--

