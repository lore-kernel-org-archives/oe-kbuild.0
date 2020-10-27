Content-Type: multipart/mixed; boundary="===============7408313189676253606=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [vincent.guittot:sched/pelt 1/1] kernel/sched/fair.c:6176:6: warning: Local variable task_util shadows outer function
Date: Wed, 28 Oct 2020 03:53:00 +0800
Message-ID: <202010280348.y9XlAHxi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7408313189676253606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Vincent Guittot <vincent.guittot@linaro.org>

tree:   https://git.linaro.org/people/vincent.guittot/kernel.git sched/pelt
head:   c2ebc392e23b7958705576a49091fe407b0ad7b3
commit: c2ebc392e23b7958705576a49091fe407b0ad7b3 [1/1] sched/fair: prefer p=
rev cpu in asymmetric wakeup path
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
compiler: powerpc64le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"cppcheck warnings: (new ones prefixed by >>)"
   kernel/sched/fair.c:10845:62: warning: Same value in both branches of te=
rnary operator. [duplicateValueTernary]
    update_load_avg(cfs_rq, se, sched_feat(ATTACH_AGE_LOAD) ? 0 : SKIP_AGE_=
LOAD);
                                                                ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/sched/fair.c:6176:6: warning: Local variable task_util shadows ou=
ter function [shadowFunction]
    int task_util, cpu, best_cpu =3D -1;
        ^
   kernel/sched/fair.c:3888:29: note: Shadowed declaration
   static inline unsigned long task_util(struct task_struct *p)
                               ^
   kernel/sched/fair.c:6176:6: note: Shadow variable
    int task_util, cpu, best_cpu =3D -1;
        ^
   kernel/sched/fair.c:6215:26: warning: Local variable task_util shadows o=
uter function [shadowFunction]
    int i, recent_used_cpu, task_util;
                            ^
   kernel/sched/fair.c:3888:29: note: Shadowed declaration
   static inline unsigned long task_util(struct task_struct *p)
                               ^
   kernel/sched/fair.c:6215:26: note: Shadow variable
    int i, recent_used_cpu, task_util;
                            ^
   kernel/sched/fair.c:6511:17: warning: Local variable cpu_util shadows ou=
ter function [shadowFunction]
     unsigned long cpu_util, util_cfs =3D cpu_util_next(cpu, p, dst_cpu);
                   ^
   kernel/sched/fair.c:5437:29: note: Shadowed declaration
   static inline unsigned long cpu_util(int cpu);
                               ^
   kernel/sched/fair.c:6511:17: note: Shadow variable
     unsigned long cpu_util, util_cfs =3D cpu_util_next(cpu, p, dst_cpu);
                   ^
   kernel/sched/fair.c:6771:7: warning: Local variable min_vruntime shadows=
 outer function [shadowFunction]
     u64 min_vruntime;
         ^
   kernel/sched/fair.c:525:19: note: Shadowed declaration
   static inline u64 min_vruntime(u64 min_vruntime, u64 vruntime)
                     ^
   kernel/sched/fair.c:6771:7: note: Shadow variable
     u64 min_vruntime;
         ^
   kernel/sched/fair.c:9956:6: warning: Local variable update_next_balance =
shadows outer function [shadowFunction]
    int update_next_balance =3D 0;
        ^
   kernel/sched/fair.c:9828:1: note: Shadowed declaration
   update_next_balance(struct sched_domain *sd, unsigned long *next_balance)
   ^
   kernel/sched/fair.c:9956:6: note: Shadow variable
    int update_next_balance =3D 0;
        ^

vim +6176 kernel/sched/fair.c

10e2f1acd0106c0 Peter Zijlstra   2016-05-09  6166  =

b7a331615d25419 Morten Rasmussen 2020-02-06  6167  /*
b7a331615d25419 Morten Rasmussen 2020-02-06  6168   * Scan the asym_capacit=
y domain for idle CPUs; pick the first idle one on which
b7a331615d25419 Morten Rasmussen 2020-02-06  6169   * the task fits. If no =
CPU is big enough, but there are idle ones, try to
b7a331615d25419 Morten Rasmussen 2020-02-06  6170   * maximize capacity.
b7a331615d25419 Morten Rasmussen 2020-02-06  6171   */
b7a331615d25419 Morten Rasmussen 2020-02-06  6172  static int
b7a331615d25419 Morten Rasmussen 2020-02-06  6173  select_idle_capacity(str=
uct task_struct *p, struct sched_domain *sd, int target)
b7a331615d25419 Morten Rasmussen 2020-02-06  6174  {
b7a331615d25419 Morten Rasmussen 2020-02-06  6175  	unsigned long best_cap =
=3D 0;
c2ebc392e23b795 Vincent Guittot  2020-10-21 @6176  	int task_util, cpu, bes=
t_cpu =3D -1;
b7a331615d25419 Morten Rasmussen 2020-02-06  6177  	struct cpumask *cpus;
b7a331615d25419 Morten Rasmussen 2020-02-06  6178  =

b7a331615d25419 Morten Rasmussen 2020-02-06  6179  	cpus =3D this_cpu_cpuma=
sk_var_ptr(select_idle_mask);
b7a331615d25419 Morten Rasmussen 2020-02-06  6180  	cpumask_and(cpus, sched=
_domain_span(sd), p->cpus_ptr);
b7a331615d25419 Morten Rasmussen 2020-02-06  6181  =

c2ebc392e23b795 Vincent Guittot  2020-10-21  6182  	task_util =3D uclamp_ta=
sk_util(p);
c2ebc392e23b795 Vincent Guittot  2020-10-21  6183  =

b7a331615d25419 Morten Rasmussen 2020-02-06  6184  	for_each_cpu_wrap(cpu, =
cpus, target) {
b7a331615d25419 Morten Rasmussen 2020-02-06  6185  		unsigned long cpu_cap =
=3D capacity_of(cpu);
b7a331615d25419 Morten Rasmussen 2020-02-06  6186  =

b7a331615d25419 Morten Rasmussen 2020-02-06  6187  		if (!available_idle_cp=
u(cpu) && !sched_idle_cpu(cpu))
b7a331615d25419 Morten Rasmussen 2020-02-06  6188  			continue;
c2ebc392e23b795 Vincent Guittot  2020-10-21  6189  		if (fits_capacity(task=
_util, cpu_cap))
b7a331615d25419 Morten Rasmussen 2020-02-06  6190  			return cpu;
b7a331615d25419 Morten Rasmussen 2020-02-06  6191  =

b7a331615d25419 Morten Rasmussen 2020-02-06  6192  		if (cpu_cap > best_cap=
) {
b7a331615d25419 Morten Rasmussen 2020-02-06  6193  			best_cap =3D cpu_cap;
b7a331615d25419 Morten Rasmussen 2020-02-06  6194  			best_cpu =3D cpu;
b7a331615d25419 Morten Rasmussen 2020-02-06  6195  		}
b7a331615d25419 Morten Rasmussen 2020-02-06  6196  	}
b7a331615d25419 Morten Rasmussen 2020-02-06  6197  =

b7a331615d25419 Morten Rasmussen 2020-02-06  6198  	return best_cpu;
b7a331615d25419 Morten Rasmussen 2020-02-06  6199  }
b7a331615d25419 Morten Rasmussen 2020-02-06  6200  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7408313189676253606==--

