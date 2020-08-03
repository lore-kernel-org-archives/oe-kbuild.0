Content-Type: multipart/mixed; boundary="===============3871101377652132748=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] sched: Make select_idle_sibling search domain configurable
Date: Tue, 04 Aug 2020 05:36:03 +0800
Message-ID: <202008040548.LXOEDIDn%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3871101377652132748==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200728070131.1629670-1-xii@google.com>
References: <20200728070131.1629670-1-xii@google.com>
TO: Xi Wang <xii@google.com>
TO: Ingo Molnar <mingo@redhat.com>
TO: Peter Zijlstra <peterz@infradead.org>
CC: Juri Lelli <juri.lelli@redhat.com>
CC: Vincent Guittot <vincent.guittot@linaro.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>
CC: Steven Rostedt <rostedt@goodmis.org>
CC: Mel Gorman <mgorman@suse.de>
CC: linux-kernel(a)vger.kernel.org
CC: linux-fsdevel(a)vger.kernel.org
CC: Xi Wang <xii@google.com>

Hi Xi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on tip/auto-latest linus/master v5.8]
[cannot apply to block/for-next cgroup/for-next next-20200803]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Xi-Wang/sched-Make-select_=
idle_sibling-search-domain-configurable/20200728-150328
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 13efa61=
6124f7eec7d6a58adeeef31864aa03879
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-s022-20200803 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-14) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.2-117-g8c7aee71-dirty
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=
=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   kernel/sched/fair.c:6270:33: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
>> kernel/sched/fair.c:6270:33: sparse:    struct sched_domain [noderef] __=
rcu *
   kernel/sched/fair.c:6270:33: sparse:    struct sched_domain *
   kernel/sched/fair.c:879:34: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected struct sched_entity *se @@     =
got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:879:34: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:879:34: sparse:     got struct sched_entity [noderef=
] __rcu *
   kernel/sched/fair.c:10578:9: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:10578:9: sparse:     expected struct sched_domain *[=
assigned] sd
   kernel/sched/fair.c:10578:9: sparse:     got struct sched_domain [nodere=
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
   kernel/sched/fair.c:6591:20: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:6591:20: sparse:     expected struct sched_domain *[=
assigned] sd
   kernel/sched/fair.c:6591:20: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/fair.c:6710:9: sparse: sparse: incorrect type in assignment=
 (different address spaces) @@     expected struct sched_domain *[assigned]=
 tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:6710:9: sparse:     expected struct sched_domain *[a=
ssigned] tmp
   kernel/sched/fair.c:6710:9: sparse:     got struct sched_domain [noderef=
] __rcu *parent
>> kernel/sched/fair.c:6752:1: sparse: sparse: symbol 'wake_idle_domain_mut=
ex' was not declared. Should it be static?
>> kernel/sched/fair.c:6767:48: sparse: sparse: incorrect type in argument =
3 (different address spaces) @@     expected void * @@     got void [nodere=
f] __user *buffer @@
>> kernel/sched/fair.c:6767:48: sparse:     expected void *
>> kernel/sched/fair.c:6767:48: sparse:     got void [noderef] __user *buff=
er
   kernel/sched/fair.c:6949:38: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected struct task_struct *curr @@  =
   got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6949:38: sparse:     expected struct task_struct *cu=
rr
   kernel/sched/fair.c:6949:38: sparse:     got struct task_struct [noderef=
] __rcu *curr
   kernel/sched/fair.c:7200:38: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected struct task_struct *curr @@  =
   got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:7200:38: sparse:     expected struct task_struct *cu=
rr
   kernel/sched/fair.c:7200:38: sparse:     got struct task_struct [noderef=
] __rcu *curr
   kernel/sched/fair.c:8165:40: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected struct sched_domain *child @@=
     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:8165:40: sparse:     expected struct sched_domain *c=
hild
   kernel/sched/fair.c:8165:40: sparse:     got struct sched_domain [nodere=
f] __rcu *child
   kernel/sched/fair.c:8658:22: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/fair.c:8658:22: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/fair.c:8658:22: sparse:    struct task_struct *
   kernel/sched/fair.c:9901:9: sparse: sparse: incorrect type in assignment=
 (different address spaces) @@     expected struct sched_domain *[assigned]=
 sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:9901:9: sparse:     expected struct sched_domain *[a=
ssigned] sd
   kernel/sched/fair.c:9901:9: sparse:     got struct sched_domain [noderef=
] __rcu *parent
   kernel/sched/fair.c:9561:44: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected struct sched_domain *sd_paren=
t @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:9561:44: sparse:     expected struct sched_domain *s=
d_parent
   kernel/sched/fair.c:9561:44: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/fair.c:9979:9: sparse: sparse: incorrect type in assignment=
 (different address spaces) @@     expected struct sched_domain *[assigned]=
 sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:9979:9: sparse:     expected struct sched_domain *[a=
ssigned] sd
   kernel/sched/fair.c:9979:9: sparse:     got struct sched_domain [noderef=
] __rcu *parent
   kernel/sched/fair.c:10779:22: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/fair.c:10779:22: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/fair.c:10779:22: sparse:    struct task_struct *
   kernel/sched/fair.c:10912:30: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/fair.c:10912:30: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/fair.c:10912:30: sparse:    struct task_struct *
   kernel/sched/fair.c:5342:35: sparse: sparse: marked inline, but without =
a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:1834:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:1834:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:1834:9: sparse:    struct task_struct *
--
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
   kernel/sched/topology.c:434:19: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected struct perf_domain *pd @@  =
   got struct perf_domain [noderef] __rcu *pd @@
   kernel/sched/topology.c:434:19: sparse:     expected struct perf_domain =
*pd
   kernel/sched/topology.c:434:19: sparse:     got struct perf_domain [node=
ref] __rcu *pd
   kernel/sched/topology.c:595:49: sparse: sparse: incorrect type in initia=
lizer (different address spaces) @@     expected struct sched_domain *paren=
t @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:595:49: sparse:     expected struct sched_domain=
 *parent
   kernel/sched/topology.c:595:49: sparse:     got struct sched_domain [nod=
eref] __rcu *parent
   kernel/sched/topology.c:645:17: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct sched_domain *[assig=
ned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:645:17: sparse:     expected struct sched_domain=
 *[assigned] sd
   kernel/sched/topology.c:645:17: sparse:     got struct sched_domain [nod=
eref] __rcu *parent
>> kernel/sched/topology.c:666:17: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct sched_domain *[assig=
ned] sdp @@     got struct sched_domain [noderef] __rcu *parent @@
>> kernel/sched/topology.c:666:17: sparse:     expected struct sched_domain=
 *[assigned] sdp
   kernel/sched/topology.c:666:17: sparse:     got struct sched_domain [nod=
eref] __rcu *parent
   kernel/sched/topology.c:676:9: sparse: sparse: incompatible types in com=
parison expression (different address spaces):
>> kernel/sched/topology.c:676:9: sparse:    struct sched_domain [noderef] =
__rcu *
   kernel/sched/topology.c:676:9: sparse:    struct sched_domain *
   kernel/sched/topology.c:700:50: sparse: sparse: incorrect type in initia=
lizer (different address spaces) @@     expected struct sched_domain *paren=
t @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:707:55: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct sched_domain [nodere=
f] __rcu *[noderef] __rcu child @@     got struct sched_domain *[assigned] =
tmp @@
   kernel/sched/topology.c:717:29: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct sched_domain *[assig=
ned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:722:20: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct sched_domain *sd @@ =
    got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:731:13: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct sched_domain *[assig=
ned] tmp @@     got struct sched_domain [noderef] __rcu *sd @@
   kernel/sched/topology.c:893:70: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected struct sched_domain *sd @@ =
    got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:922:59: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected struct sched_domain *sd @@ =
    got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1092:40: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected struct sched_domain *chil=
d @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1395:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected struct sched_domain [node=
ref] __rcu *child @@     got struct sched_domain *child @@
   kernel/sched/topology.c:1881:31: sparse: sparse: incorrect type in assig=
nment (different address spaces) @@     expected struct sched_domain [noder=
ef] __rcu *parent @@     got struct sched_domain *sd @@
   kernel/sched/topology.c:2050:57: sparse: sparse: incorrect type in assig=
nment (different address spaces) @@     expected struct sched_domain *[assi=
gned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2067:57: sparse: sparse: incorrect type in assig=
nment (different address spaces) @@     expected struct sched_domain *[assi=
gned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c: note: in included file:
   kernel/sched/sched.h:1428:9: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/sched.h:1441:9: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/sched.h:1428:9: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/sched.h:1441:9: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:1410:19: sparse: sparse: dereference of noderef =
expression

Please review and possibly fold the followup patch.

# https://github.com/0day-ci/linux/commit/7fc1ba3175b1f61ac6f92ce142fec7867=
b57e04d
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 7fc1ba3175b1f61ac6f92ce142fec7867b57e04d
vim +6270 kernel/sched/fair.c

b7a331615d2541 kernel/sched/fair.c Morten Rasmussen          2020-02-06  61=
96  =

10e2f1acd0106c kernel/sched/fair.c Peter Zijlstra            2016-05-09  61=
97  /*
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  61=
98   * Try and locate an idle core/thread in the sis domain.
a50bde5130f657 kernel/sched_fair.c Peter Zijlstra            2009-11-12  61=
99   */
772bd008cd9a1d kernel/sched/fair.c Morten Rasmussen          2016-06-22  62=
00  static int select_idle_sibling(struct task_struct *p, int prev, int tar=
get)
a50bde5130f657 kernel/sched_fair.c Peter Zijlstra            2009-11-12  62=
01  {
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
02  	struct sched_domain *sd_asym;
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
03  	struct sched_domain *sd[2];
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
04  	struct cpumask *cpus =3D this_cpu_cpumask_var_ptr(select_idle_mask);
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
05  	int i, r, recent_used_cpu;
a50bde5130f657 kernel/sched_fair.c Peter Zijlstra            2009-11-12  62=
06  =

b7a331615d2541 kernel/sched/fair.c Morten Rasmussen          2020-02-06  62=
07  	/*
b7a331615d2541 kernel/sched/fair.c Morten Rasmussen          2020-02-06  62=
08  	 * For asymmetric CPU capacity systems, our domain of interest is
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
09  	 * sd_asym_cpucapacity rather than sd_sis.
b7a331615d2541 kernel/sched/fair.c Morten Rasmussen          2020-02-06  62=
10  	 */
b7a331615d2541 kernel/sched/fair.c Morten Rasmussen          2020-02-06  62=
11  	if (static_branch_unlikely(&sched_asym_cpucapacity)) {
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
12  		sd_asym =3D rcu_dereference(per_cpu(sd_asym_cpucapacity, target));
b7a331615d2541 kernel/sched/fair.c Morten Rasmussen          2020-02-06  62=
13  		/*
b7a331615d2541 kernel/sched/fair.c Morten Rasmussen          2020-02-06  62=
14  		 * On an asymmetric CPU capacity system where an exclusive
b7a331615d2541 kernel/sched/fair.c Morten Rasmussen          2020-02-06  62=
15  		 * cpuset defines a symmetric island (i.e. one unique
b7a331615d2541 kernel/sched/fair.c Morten Rasmussen          2020-02-06  62=
16  		 * capacity_orig value through the cpuset), the key will be set
b7a331615d2541 kernel/sched/fair.c Morten Rasmussen          2020-02-06  62=
17  		 * but the CPUs within that cpuset will not have a domain with
b7a331615d2541 kernel/sched/fair.c Morten Rasmussen          2020-02-06  62=
18  		 * SD_ASYM_CPUCAPACITY. These should follow the usual symmetric
b7a331615d2541 kernel/sched/fair.c Morten Rasmussen          2020-02-06  62=
19  		 * capacity path.
b7a331615d2541 kernel/sched/fair.c Morten Rasmussen          2020-02-06  62=
20  		 */
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
21  		if (!sd_asym)
b7a331615d2541 kernel/sched/fair.c Morten Rasmussen          2020-02-06  62=
22  			goto symmetric;
b7a331615d2541 kernel/sched/fair.c Morten Rasmussen          2020-02-06  62=
23  =

7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
24  		i =3D select_idle_capacity(p, sd_asym, target);
b7a331615d2541 kernel/sched/fair.c Morten Rasmussen          2020-02-06  62=
25  		return ((unsigned)i < nr_cpumask_bits) ? i : target;
b7a331615d2541 kernel/sched/fair.c Morten Rasmussen          2020-02-06  62=
26  	}
b7a331615d2541 kernel/sched/fair.c Morten Rasmussen          2020-02-06  62=
27  =

b7a331615d2541 kernel/sched/fair.c Morten Rasmussen          2020-02-06  62=
28  symmetric:
3c29e651e16dd3 kernel/sched/fair.c Viresh Kumar              2019-06-26  62=
29  	if (available_idle_cpu(target) || sched_idle_cpu(target))
e0a79f529d5ba2 kernel/sched/fair.c Mike Galbraith            2013-01-28  62=
30  		return target;
99bd5e2f245d8c kernel/sched_fair.c Suresh Siddha             2010-03-31  62=
31  =

99bd5e2f245d8c kernel/sched_fair.c Suresh Siddha             2010-03-31  62=
32  	/*
97fb7a0a8944bd kernel/sched/fair.c Ingo Molnar               2018-03-03  62=
33  	 * If the previous CPU is cache affine and idle, don't be stupid:
a50bde5130f657 kernel/sched_fair.c Peter Zijlstra            2009-11-12  62=
34  	 */
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
35  	if (prev !=3D target && cpus_share_sis(prev, target) &&
3c29e651e16dd3 kernel/sched/fair.c Viresh Kumar              2019-06-26  62=
36  	    (available_idle_cpu(prev) || sched_idle_cpu(prev)))
772bd008cd9a1d kernel/sched/fair.c Morten Rasmussen          2016-06-22  62=
37  		return prev;
a50bde5130f657 kernel/sched_fair.c Peter Zijlstra            2009-11-12  62=
38  =

52262ee567ad14 kernel/sched/fair.c Mel Gorman                2020-01-28  62=
39  	/*
52262ee567ad14 kernel/sched/fair.c Mel Gorman                2020-01-28  62=
40  	 * Allow a per-cpu kthread to stack with the wakee if the
52262ee567ad14 kernel/sched/fair.c Mel Gorman                2020-01-28  62=
41  	 * kworker thread and the tasks previous CPUs are the same.
52262ee567ad14 kernel/sched/fair.c Mel Gorman                2020-01-28  62=
42  	 * The assumption is that the wakee queued work for the
52262ee567ad14 kernel/sched/fair.c Mel Gorman                2020-01-28  62=
43  	 * per-cpu kthread that is now complete and the wakeup is
52262ee567ad14 kernel/sched/fair.c Mel Gorman                2020-01-28  62=
44  	 * essentially a sync wakeup. An obvious example of this
52262ee567ad14 kernel/sched/fair.c Mel Gorman                2020-01-28  62=
45  	 * pattern is IO completions.
52262ee567ad14 kernel/sched/fair.c Mel Gorman                2020-01-28  62=
46  	 */
52262ee567ad14 kernel/sched/fair.c Mel Gorman                2020-01-28  62=
47  	if (is_per_cpu_kthread(current) &&
52262ee567ad14 kernel/sched/fair.c Mel Gorman                2020-01-28  62=
48  	    prev =3D=3D smp_processor_id() &&
52262ee567ad14 kernel/sched/fair.c Mel Gorman                2020-01-28  62=
49  	    this_rq()->nr_running <=3D 1) {
52262ee567ad14 kernel/sched/fair.c Mel Gorman                2020-01-28  62=
50  		return prev;
52262ee567ad14 kernel/sched/fair.c Mel Gorman                2020-01-28  62=
51  	}
52262ee567ad14 kernel/sched/fair.c Mel Gorman                2020-01-28  62=
52  =

97fb7a0a8944bd kernel/sched/fair.c Ingo Molnar               2018-03-03  62=
53  	/* Check a recently used CPU as a potential idle candidate: */
32e839dda3ba57 kernel/sched/fair.c Mel Gorman                2018-01-30  62=
54  	recent_used_cpu =3D p->recent_used_cpu;
32e839dda3ba57 kernel/sched/fair.c Mel Gorman                2018-01-30  62=
55  	if (recent_used_cpu !=3D prev &&
32e839dda3ba57 kernel/sched/fair.c Mel Gorman                2018-01-30  62=
56  	    recent_used_cpu !=3D target &&
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
57  	    cpus_share_sis(recent_used_cpu, target) &&
3c29e651e16dd3 kernel/sched/fair.c Viresh Kumar              2019-06-26  62=
58  	    (available_idle_cpu(recent_used_cpu) || sched_idle_cpu(recent_used=
_cpu)) &&
3bd3706251ee8a kernel/sched/fair.c Sebastian Andrzej Siewior 2019-04-23  62=
59  	    cpumask_test_cpu(p->recent_used_cpu, p->cpus_ptr)) {
32e839dda3ba57 kernel/sched/fair.c Mel Gorman                2018-01-30  62=
60  		/*
32e839dda3ba57 kernel/sched/fair.c Mel Gorman                2018-01-30  62=
61  		 * Replace recent_used_cpu with prev as it is a potential
97fb7a0a8944bd kernel/sched/fair.c Ingo Molnar               2018-03-03  62=
62  		 * candidate for the next wake:
32e839dda3ba57 kernel/sched/fair.c Mel Gorman                2018-01-30  62=
63  		 */
32e839dda3ba57 kernel/sched/fair.c Mel Gorman                2018-01-30  62=
64  		p->recent_used_cpu =3D prev;
32e839dda3ba57 kernel/sched/fair.c Mel Gorman                2018-01-30  62=
65  		return recent_used_cpu;
32e839dda3ba57 kernel/sched/fair.c Mel Gorman                2018-01-30  62=
66  	}
32e839dda3ba57 kernel/sched/fair.c Mel Gorman                2018-01-30  62=
67  =

7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
68  	for (i =3D 0; ; i++) {
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
69  		if (i =3D=3D 0) {
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28 @62=
70  			sd[0] =3D rcu_dereference(per_cpu(sd_sis_pre, target));
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
71  			if (!sd[0])
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
72  				continue;
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
73  			cpumask_and(cpus, sched_domain_span(sd[0]), p->cpus_ptr);
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
74  		} else if (i =3D=3D 1) {
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
75  			sd[1] =3D rcu_dereference(per_cpu(sd_sis, target));
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
76  			if (!sd[1])
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
77  				continue;
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
78  			cpumask_and(cpus, sched_domain_span(sd[1]), p->cpus_ptr);
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
79  			if (sd[0])
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
80  				cpumask_andnot(cpus, cpus, sched_domain_span(sd[0]));
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
81  		} else {
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
82  			break;
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
83  		}
772bd008cd9a1d kernel/sched/fair.c Morten Rasmussen          2016-06-22  62=
84  =

7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
85  		r =3D select_idle_core(p, cpus, target);
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
86  		if ((unsigned)r < nr_cpumask_bits)
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
87  			return r;
37407ea7f93864 kernel/sched/fair.c Linus Torvalds            2012-09-16  62=
88  =

7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
89  		r =3D select_idle_cpu(p, cpus, (i =3D=3D 1), sd[i]->span_weight, targ=
et);
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
90  		if ((unsigned)r < nr_cpumask_bits)
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
91  			return r;
10e2f1acd0106c kernel/sched/fair.c Peter Zijlstra            2016-05-09  62=
92  =

7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
93  		r =3D select_idle_smt(p, target);
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
94  		if ((unsigned)r < nr_cpumask_bits)
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
95  			return r;
7fc1ba3175b1f6 kernel/sched/fair.c Xi Wang                   2020-07-28  62=
96  	}
a50bde5130f657 kernel/sched_fair.c Peter Zijlstra            2009-11-12  62=
97  =

a50bde5130f657 kernel/sched_fair.c Peter Zijlstra            2009-11-12  62=
98  	return target;
a50bde5130f657 kernel/sched_fair.c Peter Zijlstra            2009-11-12  62=
99  }
231678b768da07 kernel/sched/fair.c Dietmar Eggemann          2015-08-14  63=
00  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============3871101377652132748==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3871101377652132748==--

