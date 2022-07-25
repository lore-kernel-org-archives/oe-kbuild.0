Content-Type: multipart/mixed; boundary="===============8166224166327060356=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tip:sched/core 6/31] kernel/sched/fair.c:4049:30: sparse: sparse: cast to non-scalar
Date: Mon, 25 Jul 2022 16:58:20 +0000
Message-ID: <202207231210.s2H9yBxw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8166224166327060356==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: kernel/sc=
hed/fair.c:4049:30: sparse: sparse: cast to non-scalar"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
CC: x86(a)kernel.org
TO: Chengming Zhou <zhouchengming@bytedance.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Vincent Guittot <vincent.guittot@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/c=
ore
head:   14b3f2d9ee8df3b6040f7e21f9fcd1d848938fd9
commit: 51bf903b64bdde4e4c9009a9e2b4a589845d9d81 [6/31] sched/fair: Optimiz=
e and simplify rq leaf_cfs_rq_list
:::::: branch date: 2 days ago
:::::: commit date: 6 weeks ago
config: alpha-randconfig-s042-20220721 (https://download.01.org/0day-ci/arc=
hive/20220723/202207231210.s2H9yBxw-lkp(a)intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commi=
t/?id=3D51bf903b64bdde4e4c9009a9e2b4a589845d9d81
        git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/=
tip/tip.git
        git fetch --no-tags tip sched/core
        git checkout 51bf903b64bdde4e4c9009a9e2b4a589845d9d81
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
lpha SHELL=3D/bin/bash kernel/sched/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:930:34: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected struct sched_entity *se @@     =
got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:930:34: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:930:34: sparse:     got struct sched_entity [noderef=
] __rcu *
   kernel/sched/fair.c:10918:9: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:10918:9: sparse:     expected struct sched_domain *[=
assigned] sd
   kernel/sched/fair.c:10918:9: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/fair.c:5083:22: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/fair.c:5083:22: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/fair.c:5083:22: sparse:    struct task_struct *
   kernel/sched/fair.c:6770:20: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:6770:20: sparse:     expected struct sched_domain *[=
assigned] sd
   kernel/sched/fair.c:6770:20: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/fair.c:6904:9: sparse: sparse: incorrect type in assignment=
 (different address spaces) @@     expected struct sched_domain *[assigned]=
 tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:6904:9: sparse:     expected struct sched_domain *[a=
ssigned] tmp
   kernel/sched/fair.c:6904:9: sparse:     got struct sched_domain [noderef=
] __rcu *parent
   kernel/sched/fair.c:7102:38: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected struct task_struct *curr @@  =
   got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:7102:38: sparse:     expected struct task_struct *cu=
rr
   kernel/sched/fair.c:7102:38: sparse:     got struct task_struct [noderef=
] __rcu *curr
   kernel/sched/fair.c:7400:38: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected struct task_struct *curr @@  =
   got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:7400:38: sparse:     expected struct task_struct *cu=
rr
   kernel/sched/fair.c:7400:38: sparse:     got struct task_struct [noderef=
] __rcu *curr
   kernel/sched/fair.c:8385:40: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected struct sched_domain *child @@=
     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:8385:40: sparse:     expected struct sched_domain *c=
hild
   kernel/sched/fair.c:8385:40: sparse:     got struct sched_domain [nodere=
f] __rcu *child
   kernel/sched/fair.c:8929:22: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/fair.c:8929:22: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/fair.c:8929:22: sparse:    struct task_struct *
   kernel/sched/fair.c:10193:9: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:10193:9: sparse:     expected struct sched_domain *[=
assigned] sd
   kernel/sched/fair.c:10193:9: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/fair.c:9853:44: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected struct sched_domain *sd_paren=
t @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:9853:44: sparse:     expected struct sched_domain *s=
d_parent
   kernel/sched/fair.c:9853:44: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/fair.c:10289:9: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:10289:9: sparse:     expected struct sched_domain *[=
assigned] sd
   kernel/sched/fair.c:10289:9: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast to non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast from non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast to non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast from non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast to non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast from non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast to non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast from non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast to non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast from non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast to non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast from non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast to non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast from non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast to non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast from non-scalar
   kernel/sched/fair.c:6155:28: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *sd @@    =
 got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:6155:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:6155:28: sparse:     got struct sched_domain [nodere=
f] __rcu *child
   kernel/sched/fair.c:6161:28: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *sd @@    =
 got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:6161:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:6161:28: sparse:     got struct sched_domain [nodere=
f] __rcu *child
   kernel/sched/fair.c:6168:28: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *sd @@    =
 got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:6168:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:6168:28: sparse:     got struct sched_domain [nodere=
f] __rcu *child
   kernel/sched/fair.c:6176:17: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:6176:17: sparse:     expected struct sched_domain *[=
assigned] tmp
   kernel/sched/fair.c:6176:17: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2171:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:2171:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:2171:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2013:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:2013:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:2013:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2013:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:2013:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:2013:25: sparse:    struct task_struct *

vim +4049 kernel/sched/fair.c

7f65ea42eb00bc9 Patrick Bellasi  2018-03-09  4046  =

7f65ea42eb00bc9 Patrick Bellasi  2018-03-09  4047  static inline unsigned l=
ong _task_util_est(struct task_struct *p)
7f65ea42eb00bc9 Patrick Bellasi  2018-03-09  4048  {
7f65ea42eb00bc9 Patrick Bellasi  2018-03-09 @4049  	struct util_est ue =3D =
READ_ONCE(p->se.avg.util_est);
7f65ea42eb00bc9 Patrick Bellasi  2018-03-09  4050  =

68d7a190682aa4e Dietmar Eggemann 2021-06-02  4051  	return max(ue.ewma, (ue=
.enqueued & ~UTIL_AVG_UNCHANGED));
7f65ea42eb00bc9 Patrick Bellasi  2018-03-09  4052  }
7f65ea42eb00bc9 Patrick Bellasi  2018-03-09  4053  =


:::::: The code at line 4049 was first introduced by commit
:::::: 7f65ea42eb00bc902f1c37a71e984e4f4064cfa9 sched/fair: Add util_est on=
 top of PELT

:::::: TO: Patrick Bellasi <patrick.bellasi@arm.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8166224166327060356==--

