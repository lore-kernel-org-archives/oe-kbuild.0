Content-Type: multipart/mixed; boundary="===============0861324201712309875=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 7/7] sched/fair: Remove the energy margin in feec()
Date: Fri, 15 Apr 2022 19:58:15 +0800
Message-ID: <202204151914.NKAe2ef1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0861324201712309875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220412134220.1588482-8-vincent.donnefort@arm.com>
References: <20220412134220.1588482-8-vincent.donnefort@arm.com>
TO: Vincent Donnefort <vincent.donnefort@arm.com>

Hi Vincent,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on rafael-pm/linux-next rafael-pm/thermal v5.18-rc=
2 next-20220414]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Donnefort/fe=
ec-energy-margin-removal/20220412-214441
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 089c02a=
e2771a14af2928c59c56abfb9b885a8d7
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
415/202204151914.NKAe2ef1-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/sched/fair.c:6975 find_energy_efficient_cpu() error: uninitialized s=
ymbol 'best_energy_cpu'.

vim +/best_energy_cpu +6975 kernel/sched/fair.c

390031e4c309c9 Quentin Perret            2018-12-03  6814  =

732cd75b8c920d Quentin Perret            2018-12-03  6815  /*
732cd75b8c920d Quentin Perret            2018-12-03  6816   * find_energy_e=
fficient_cpu(): Find most energy-efficient target CPU for the
732cd75b8c920d Quentin Perret            2018-12-03  6817   * waking task. =
find_energy_efficient_cpu() looks for the CPU with maximum
732cd75b8c920d Quentin Perret            2018-12-03  6818   * spare capacit=
y in each performance domain and uses it as a potential
732cd75b8c920d Quentin Perret            2018-12-03  6819   * candidate to =
execute the task. Then, it uses the Energy Model to figure
732cd75b8c920d Quentin Perret            2018-12-03  6820   * out which of =
the CPU candidates is the most energy-efficient.
732cd75b8c920d Quentin Perret            2018-12-03  6821   *
732cd75b8c920d Quentin Perret            2018-12-03  6822   * The rationale=
 for this heuristic is as follows. In a performance domain,
732cd75b8c920d Quentin Perret            2018-12-03  6823   * all the most =
energy efficient CPU candidates (according to the Energy
732cd75b8c920d Quentin Perret            2018-12-03  6824   * Model) are th=
ose for which we'll request a low frequency. When there are
732cd75b8c920d Quentin Perret            2018-12-03  6825   * several CPUs =
for which the frequency request will be the same, we don't
732cd75b8c920d Quentin Perret            2018-12-03  6826   * have enough d=
ata to break the tie between them, because the Energy Model
732cd75b8c920d Quentin Perret            2018-12-03  6827   * only includes=
 active power costs. With this model, if we assume that
732cd75b8c920d Quentin Perret            2018-12-03  6828   * frequency req=
uests follow utilization (e.g. using schedutil), the CPU with
732cd75b8c920d Quentin Perret            2018-12-03  6829   * the maximum s=
pare capacity in a performance domain is guaranteed to be among
732cd75b8c920d Quentin Perret            2018-12-03  6830   * the best cand=
idates of the performance domain.
732cd75b8c920d Quentin Perret            2018-12-03  6831   *
732cd75b8c920d Quentin Perret            2018-12-03  6832   * In practice, =
it could be preferable from an energy standpoint to pack
732cd75b8c920d Quentin Perret            2018-12-03  6833   * small tasks o=
n a CPU in order to let other CPUs go in deeper idle states,
732cd75b8c920d Quentin Perret            2018-12-03  6834   * but that coul=
d also hurt our chances to go cluster idle, and we have no
732cd75b8c920d Quentin Perret            2018-12-03  6835   * ways to tell =
with the current Energy Model if this is actually a good
732cd75b8c920d Quentin Perret            2018-12-03  6836   * idea or not. =
So, find_energy_efficient_cpu() basically favors
732cd75b8c920d Quentin Perret            2018-12-03  6837   * cluster-packi=
ng, and spreading inside a cluster. That should at least be
732cd75b8c920d Quentin Perret            2018-12-03  6838   * a good thing =
for latency, and this is consistent with the idea that most
732cd75b8c920d Quentin Perret            2018-12-03  6839   * of the energy=
 savings of EAS come from the asymmetry of the system, and
732cd75b8c920d Quentin Perret            2018-12-03  6840   * not so much f=
rom breaking the tie between identical CPUs. That's also the
732cd75b8c920d Quentin Perret            2018-12-03  6841   * reason why EA=
S is enabled in the topology code only for systems where
732cd75b8c920d Quentin Perret            2018-12-03  6842   * SD_ASYM_CPUCA=
PACITY is set.
732cd75b8c920d Quentin Perret            2018-12-03  6843   *
732cd75b8c920d Quentin Perret            2018-12-03  6844   * NOTE: Forkees=
 are not accepted in the energy-aware wake-up path because
732cd75b8c920d Quentin Perret            2018-12-03  6845   * they don't ha=
ve any useful utilization data yet and it's not possible to
732cd75b8c920d Quentin Perret            2018-12-03  6846   * forecast thei=
r impact on energy consumption. Consequently, they will be
732cd75b8c920d Quentin Perret            2018-12-03  6847   * placed by fin=
d_idlest_cpu() on the least loaded CPU, which might turn out
732cd75b8c920d Quentin Perret            2018-12-03  6848   * to be energy-=
inefficient in some use-cases. The alternative would be to
732cd75b8c920d Quentin Perret            2018-12-03  6849   * bias new task=
s towards specific types of CPUs first, or to try to infer
732cd75b8c920d Quentin Perret            2018-12-03  6850   * their util_av=
g from the parent task, but those heuristics could hurt
732cd75b8c920d Quentin Perret            2018-12-03  6851   * other use-cas=
es too. So, until someone finds a better way to solve this,
732cd75b8c920d Quentin Perret            2018-12-03  6852   * let's keep th=
ings simple by re-using the existing slow path.
732cd75b8c920d Quentin Perret            2018-12-03  6853   */
732cd75b8c920d Quentin Perret            2018-12-03  6854  static int find_=
energy_efficient_cpu(struct task_struct *p, int prev_cpu)
732cd75b8c920d Quentin Perret            2018-12-03  6855  {
04409022d37d2c Dietmar Eggemann          2022-04-12  6856  	struct cpumask =
*cpus =3D this_cpu_cpumask_var_ptr(select_rq_mask);
eb92692b2544d3 Quentin Perret            2019-09-12  6857  	unsigned long p=
rev_delta =3D ULONG_MAX, best_delta =3D ULONG_MAX;
ce557de247bd64 Vincent Donnefort         2022-04-12  6858  	struct root_dom=
ain *rd =3D this_rq()->rd;
5311f1261af84b Vincent Donnefort         2022-04-12  6859  	int cpu, best_e=
nergy_cpu, target =3D -1;
732cd75b8c920d Quentin Perret            2018-12-03  6860  	struct sched_do=
main *sd;
eb92692b2544d3 Quentin Perret            2019-09-12  6861  	struct perf_dom=
ain *pd;
ce557de247bd64 Vincent Donnefort         2022-04-12  6862  	struct energy_e=
nv eenv;
732cd75b8c920d Quentin Perret            2018-12-03  6863  =

732cd75b8c920d Quentin Perret            2018-12-03  6864  	rcu_read_lock();
732cd75b8c920d Quentin Perret            2018-12-03  6865  	pd =3D rcu_dere=
ference(rd->pd);
732cd75b8c920d Quentin Perret            2018-12-03  6866  	if (!pd || READ=
_ONCE(rd->overutilized))
619e090c8e409e Pierre Gondois            2021-05-04  6867  		goto unlock;
732cd75b8c920d Quentin Perret            2018-12-03  6868  =

732cd75b8c920d Quentin Perret            2018-12-03  6869  	/*
732cd75b8c920d Quentin Perret            2018-12-03  6870  	 * Energy-aware=
 wake-up happens on the lowest sched_domain starting
732cd75b8c920d Quentin Perret            2018-12-03  6871  	 * from sd_asym=
_cpucapacity spanning over this_cpu and prev_cpu.
732cd75b8c920d Quentin Perret            2018-12-03  6872  	 */
732cd75b8c920d Quentin Perret            2018-12-03  6873  	sd =3D rcu_dere=
ference(*this_cpu_ptr(&sd_asym_cpucapacity));
732cd75b8c920d Quentin Perret            2018-12-03  6874  	while (sd && !c=
pumask_test_cpu(prev_cpu, sched_domain_span(sd)))
732cd75b8c920d Quentin Perret            2018-12-03  6875  		sd =3D sd->par=
ent;
732cd75b8c920d Quentin Perret            2018-12-03  6876  	if (!sd)
619e090c8e409e Pierre Gondois            2021-05-04  6877  		goto unlock;
619e090c8e409e Pierre Gondois            2021-05-04  6878  =

619e090c8e409e Pierre Gondois            2021-05-04  6879  	target =3D prev=
_cpu;
732cd75b8c920d Quentin Perret            2018-12-03  6880  =

732cd75b8c920d Quentin Perret            2018-12-03  6881  	sync_entity_loa=
d_avg(&p->se);
732cd75b8c920d Quentin Perret            2018-12-03  6882  	if (!task_util_=
est(p))
732cd75b8c920d Quentin Perret            2018-12-03  6883  		goto unlock;
732cd75b8c920d Quentin Perret            2018-12-03  6884  =

ce557de247bd64 Vincent Donnefort         2022-04-12  6885  	eenv_task_busy_=
time(&eenv, p, prev_cpu);
ce557de247bd64 Vincent Donnefort         2022-04-12  6886  =

732cd75b8c920d Quentin Perret            2018-12-03  6887  	for (; pd; pd =
=3D pd->next) {
ce557de247bd64 Vincent Donnefort         2022-04-12  6888  		unsigned long =
cpu_cap, cpu_thermal_cap, util;
ce557de247bd64 Vincent Donnefort         2022-04-12  6889  		unsigned long =
cur_delta, max_spare_cap =3D 0;
8d4c97c105ca07 Pierre Gondois            2021-05-04  6890  		bool compute_p=
rev_delta =3D false;
732cd75b8c920d Quentin Perret            2018-12-03  6891  		int max_spare_=
cap_cpu =3D -1;
5311f1261af84b Vincent Donnefort         2022-04-12  6892  		unsigned long =
base_energy;
732cd75b8c920d Quentin Perret            2018-12-03  6893  =

04409022d37d2c Dietmar Eggemann          2022-04-12  6894  		cpumask_and(cp=
us, perf_domain_span(pd), cpu_online_mask);
04409022d37d2c Dietmar Eggemann          2022-04-12  6895  =

ce557de247bd64 Vincent Donnefort         2022-04-12  6896  		/* Account the=
rmal pressure for the energy estimation */
ce557de247bd64 Vincent Donnefort         2022-04-12  6897  		cpu =3D cpumas=
k_first(cpus);
ce557de247bd64 Vincent Donnefort         2022-04-12  6898  		cpu_thermal_ca=
p =3D arch_scale_cpu_capacity(cpu);
ce557de247bd64 Vincent Donnefort         2022-04-12  6899  		cpu_thermal_ca=
p -=3D arch_scale_thermal_pressure(cpu);
ce557de247bd64 Vincent Donnefort         2022-04-12  6900  =

ce557de247bd64 Vincent Donnefort         2022-04-12  6901  		eenv.cpu_cap =
=3D cpu_thermal_cap;
ce557de247bd64 Vincent Donnefort         2022-04-12  6902  		eenv.pd_cap =
=3D 0;
ce557de247bd64 Vincent Donnefort         2022-04-12  6903  =

ce557de247bd64 Vincent Donnefort         2022-04-12  6904  		for_each_cpu(c=
pu, cpus) {
ce557de247bd64 Vincent Donnefort         2022-04-12  6905  			eenv.pd_cap +=
=3D cpu_thermal_cap;
ce557de247bd64 Vincent Donnefort         2022-04-12  6906  =

ce557de247bd64 Vincent Donnefort         2022-04-12  6907  			if (!cpumask_=
test_cpu(cpu, sched_domain_span(sd)))
ce557de247bd64 Vincent Donnefort         2022-04-12  6908  				continue;
ce557de247bd64 Vincent Donnefort         2022-04-12  6909  =

3bd3706251ee8a Sebastian Andrzej Siewior 2019-04-23  6910  			if (!cpumask_=
test_cpu(cpu, p->cpus_ptr))
732cd75b8c920d Quentin Perret            2018-12-03  6911  				continue;
732cd75b8c920d Quentin Perret            2018-12-03  6912  =

732cd75b8c920d Quentin Perret            2018-12-03  6913  			util =3D cpu_=
util_next(cpu, p, cpu);
732cd75b8c920d Quentin Perret            2018-12-03  6914  			cpu_cap =3D c=
apacity_of(cpu);
1d42509e475cdc Valentin Schneider        2019-12-11  6915  =

1d42509e475cdc Valentin Schneider        2019-12-11  6916  			/*
1d42509e475cdc Valentin Schneider        2019-12-11  6917  			 * Skip CPUs =
that cannot satisfy the capacity request.
1d42509e475cdc Valentin Schneider        2019-12-11  6918  			 * IOW, placi=
ng the task there would make the CPU
1d42509e475cdc Valentin Schneider        2019-12-11  6919  			 * overutiliz=
ed. Take uclamp into account to see how
1d42509e475cdc Valentin Schneider        2019-12-11  6920  			 * much capac=
ity we can get out of the CPU; this is
a5418be9dffe70 Viresh Kumar              2020-12-08  6921  			 * aligned wi=
th sched_cpu_util().
1d42509e475cdc Valentin Schneider        2019-12-11  6922  			 */
1d42509e475cdc Valentin Schneider        2019-12-11  6923  			util =3D ucla=
mp_rq_util_with(cpu_rq(cpu), util, p);
60e17f5cef838e Viresh Kumar              2019-06-04  6924  			if (!fits_cap=
acity(util, cpu_cap))
732cd75b8c920d Quentin Perret            2018-12-03  6925  				continue;
732cd75b8c920d Quentin Perret            2018-12-03  6926  =

ce557de247bd64 Vincent Donnefort         2022-04-12  6927  			lsub_positive=
(&cpu_cap, util);
ce557de247bd64 Vincent Donnefort         2022-04-12  6928  =

732cd75b8c920d Quentin Perret            2018-12-03  6929  			if (cpu =3D=
=3D prev_cpu) {
8d4c97c105ca07 Pierre Gondois            2021-05-04  6930  				/* Always us=
e prev_cpu as a candidate. */
8d4c97c105ca07 Pierre Gondois            2021-05-04  6931  				compute_prev=
_delta =3D true;
ce557de247bd64 Vincent Donnefort         2022-04-12  6932  			} else if (cp=
u_cap > max_spare_cap) {
732cd75b8c920d Quentin Perret            2018-12-03  6933  				/*
8d4c97c105ca07 Pierre Gondois            2021-05-04  6934  				 * Find the =
CPU with the maximum spare capacity
8d4c97c105ca07 Pierre Gondois            2021-05-04  6935  				 * in the pe=
rformance domain.
732cd75b8c920d Quentin Perret            2018-12-03  6936  				 */
ce557de247bd64 Vincent Donnefort         2022-04-12  6937  				max_spare_ca=
p =3D cpu_cap;
732cd75b8c920d Quentin Perret            2018-12-03  6938  				max_spare_ca=
p_cpu =3D cpu;
732cd75b8c920d Quentin Perret            2018-12-03  6939  			}
732cd75b8c920d Quentin Perret            2018-12-03  6940  		}
732cd75b8c920d Quentin Perret            2018-12-03  6941  =

8d4c97c105ca07 Pierre Gondois            2021-05-04  6942  		if (max_spare_=
cap_cpu < 0 && !compute_prev_delta)
8d4c97c105ca07 Pierre Gondois            2021-05-04  6943  			continue;
8d4c97c105ca07 Pierre Gondois            2021-05-04  6944  =

8d4c97c105ca07 Pierre Gondois            2021-05-04  6945  		/* Compute the=
 'base' energy of the pd, without @p */
ce557de247bd64 Vincent Donnefort         2022-04-12  6946  		eenv_pd_busy_t=
ime(&eenv, cpus, p);
5311f1261af84b Vincent Donnefort         2022-04-12  6947  		base_energy =
=3D compute_energy(&eenv, pd, cpus, p, -1);
8d4c97c105ca07 Pierre Gondois            2021-05-04  6948  =

8d4c97c105ca07 Pierre Gondois            2021-05-04  6949  		/* Evaluate th=
e energy impact of using prev_cpu. */
8d4c97c105ca07 Pierre Gondois            2021-05-04  6950  		if (compute_pr=
ev_delta) {
ce557de247bd64 Vincent Donnefort         2022-04-12  6951  			prev_delta =
=3D compute_energy(&eenv, pd, cpus, p,
ce557de247bd64 Vincent Donnefort         2022-04-12  6952  						    prev_c=
pu);
5311f1261af84b Vincent Donnefort         2022-04-12  6953  			if (prev_delt=
a < base_energy)
619e090c8e409e Pierre Gondois            2021-05-04  6954  				goto unlock;
5311f1261af84b Vincent Donnefort         2022-04-12  6955  			prev_delta -=
=3D base_energy;
8d4c97c105ca07 Pierre Gondois            2021-05-04  6956  			best_delta =
=3D min(best_delta, prev_delta);
8d4c97c105ca07 Pierre Gondois            2021-05-04  6957  		}
8d4c97c105ca07 Pierre Gondois            2021-05-04  6958  =

8d4c97c105ca07 Pierre Gondois            2021-05-04  6959  		/* Evaluate th=
e energy impact of using max_spare_cap_cpu. */
8d4c97c105ca07 Pierre Gondois            2021-05-04  6960  		if (max_spare_=
cap_cpu >=3D 0) {
ce557de247bd64 Vincent Donnefort         2022-04-12  6961  			cur_delta =3D=
 compute_energy(&eenv, pd, cpus, p,
ce557de247bd64 Vincent Donnefort         2022-04-12  6962  						   max_spa=
re_cap_cpu);
5311f1261af84b Vincent Donnefort         2022-04-12  6963  			if (cur_delta=
 < base_energy)
619e090c8e409e Pierre Gondois            2021-05-04  6964  				goto unlock;
5311f1261af84b Vincent Donnefort         2022-04-12  6965  			cur_delta -=
=3D base_energy;
eb92692b2544d3 Quentin Perret            2019-09-12  6966  			if (cur_delta=
 < best_delta) {
eb92692b2544d3 Quentin Perret            2019-09-12  6967  				best_delta =
=3D cur_delta;
732cd75b8c920d Quentin Perret            2018-12-03  6968  				best_energy_=
cpu =3D max_spare_cap_cpu;
732cd75b8c920d Quentin Perret            2018-12-03  6969  			}
732cd75b8c920d Quentin Perret            2018-12-03  6970  		}
732cd75b8c920d Quentin Perret            2018-12-03  6971  	}
732cd75b8c920d Quentin Perret            2018-12-03  6972  	rcu_read_unlock=
();
732cd75b8c920d Quentin Perret            2018-12-03  6973  =

5311f1261af84b Vincent Donnefort         2022-04-12  6974  	if (best_delta =
< prev_delta)
619e090c8e409e Pierre Gondois            2021-05-04 @6975  		target =3D bes=
t_energy_cpu;
732cd75b8c920d Quentin Perret            2018-12-03  6976  =

619e090c8e409e Pierre Gondois            2021-05-04  6977  	return target;
732cd75b8c920d Quentin Perret            2018-12-03  6978  =

619e090c8e409e Pierre Gondois            2021-05-04  6979  unlock:
732cd75b8c920d Quentin Perret            2018-12-03  6980  	rcu_read_unlock=
();
732cd75b8c920d Quentin Perret            2018-12-03  6981  =

619e090c8e409e Pierre Gondois            2021-05-04  6982  	return target;
732cd75b8c920d Quentin Perret            2018-12-03  6983  }
732cd75b8c920d Quentin Perret            2018-12-03  6984  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0861324201712309875==--

