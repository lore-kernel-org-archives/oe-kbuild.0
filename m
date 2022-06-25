Content-Type: multipart/mixed; boundary="===============6500261196621766146=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/sched/fair.c:6981 find_energy_efficient_cpu() error: uninitialized symbol 'best_energy_cpu'.
Date: Sat, 25 Jun 2022 16:25:21 +0800
Message-ID: <202206251643.Ptg4ve5l-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6500261196621766146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Vincent Donnefort <vincent.donnefort@arm.com>
CC: 0day robot <lkp@intel.com>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Vincent-Donnefort/fe=
ec-energy-margin-removal/20220621-170631
head:   2059fff7a5a2b6016ef5843c673845283a00a646
commit: 2059fff7a5a2b6016ef5843c673845283a00a646 sched/fair: Remove the ene=
rgy margin in feec()
date:   4 days ago
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-m021
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/sched/fair.c:6981 find_energy_efficient_cpu() error: uninitialized s=
ymbol 'best_energy_cpu'.

vim +/best_energy_cpu +6981 kernel/sched/fair.c

390031e4c309c9 Quentin Perret            2018-12-03  6815  =

732cd75b8c920d Quentin Perret            2018-12-03  6816  /*
732cd75b8c920d Quentin Perret            2018-12-03  6817   * find_energy_e=
fficient_cpu(): Find most energy-efficient target CPU for the
732cd75b8c920d Quentin Perret            2018-12-03  6818   * waking task. =
find_energy_efficient_cpu() looks for the CPU with maximum
732cd75b8c920d Quentin Perret            2018-12-03  6819   * spare capacit=
y in each performance domain and uses it as a potential
732cd75b8c920d Quentin Perret            2018-12-03  6820   * candidate to =
execute the task. Then, it uses the Energy Model to figure
732cd75b8c920d Quentin Perret            2018-12-03  6821   * out which of =
the CPU candidates is the most energy-efficient.
732cd75b8c920d Quentin Perret            2018-12-03  6822   *
732cd75b8c920d Quentin Perret            2018-12-03  6823   * The rationale=
 for this heuristic is as follows. In a performance domain,
732cd75b8c920d Quentin Perret            2018-12-03  6824   * all the most =
energy efficient CPU candidates (according to the Energy
732cd75b8c920d Quentin Perret            2018-12-03  6825   * Model) are th=
ose for which we'll request a low frequency. When there are
732cd75b8c920d Quentin Perret            2018-12-03  6826   * several CPUs =
for which the frequency request will be the same, we don't
732cd75b8c920d Quentin Perret            2018-12-03  6827   * have enough d=
ata to break the tie between them, because the Energy Model
732cd75b8c920d Quentin Perret            2018-12-03  6828   * only includes=
 active power costs. With this model, if we assume that
732cd75b8c920d Quentin Perret            2018-12-03  6829   * frequency req=
uests follow utilization (e.g. using schedutil), the CPU with
732cd75b8c920d Quentin Perret            2018-12-03  6830   * the maximum s=
pare capacity in a performance domain is guaranteed to be among
732cd75b8c920d Quentin Perret            2018-12-03  6831   * the best cand=
idates of the performance domain.
732cd75b8c920d Quentin Perret            2018-12-03  6832   *
732cd75b8c920d Quentin Perret            2018-12-03  6833   * In practice, =
it could be preferable from an energy standpoint to pack
732cd75b8c920d Quentin Perret            2018-12-03  6834   * small tasks o=
n a CPU in order to let other CPUs go in deeper idle states,
732cd75b8c920d Quentin Perret            2018-12-03  6835   * but that coul=
d also hurt our chances to go cluster idle, and we have no
732cd75b8c920d Quentin Perret            2018-12-03  6836   * ways to tell =
with the current Energy Model if this is actually a good
732cd75b8c920d Quentin Perret            2018-12-03  6837   * idea or not. =
So, find_energy_efficient_cpu() basically favors
732cd75b8c920d Quentin Perret            2018-12-03  6838   * cluster-packi=
ng, and spreading inside a cluster. That should at least be
732cd75b8c920d Quentin Perret            2018-12-03  6839   * a good thing =
for latency, and this is consistent with the idea that most
732cd75b8c920d Quentin Perret            2018-12-03  6840   * of the energy=
 savings of EAS come from the asymmetry of the system, and
732cd75b8c920d Quentin Perret            2018-12-03  6841   * not so much f=
rom breaking the tie between identical CPUs. That's also the
732cd75b8c920d Quentin Perret            2018-12-03  6842   * reason why EA=
S is enabled in the topology code only for systems where
732cd75b8c920d Quentin Perret            2018-12-03  6843   * SD_ASYM_CPUCA=
PACITY is set.
732cd75b8c920d Quentin Perret            2018-12-03  6844   *
732cd75b8c920d Quentin Perret            2018-12-03  6845   * NOTE: Forkees=
 are not accepted in the energy-aware wake-up path because
732cd75b8c920d Quentin Perret            2018-12-03  6846   * they don't ha=
ve any useful utilization data yet and it's not possible to
732cd75b8c920d Quentin Perret            2018-12-03  6847   * forecast thei=
r impact on energy consumption. Consequently, they will be
732cd75b8c920d Quentin Perret            2018-12-03  6848   * placed by fin=
d_idlest_cpu() on the least loaded CPU, which might turn out
732cd75b8c920d Quentin Perret            2018-12-03  6849   * to be energy-=
inefficient in some use-cases. The alternative would be to
732cd75b8c920d Quentin Perret            2018-12-03  6850   * bias new task=
s towards specific types of CPUs first, or to try to infer
732cd75b8c920d Quentin Perret            2018-12-03  6851   * their util_av=
g from the parent task, but those heuristics could hurt
732cd75b8c920d Quentin Perret            2018-12-03  6852   * other use-cas=
es too. So, until someone finds a better way to solve this,
732cd75b8c920d Quentin Perret            2018-12-03  6853   * let's keep th=
ings simple by re-using the existing slow path.
732cd75b8c920d Quentin Perret            2018-12-03  6854   */
732cd75b8c920d Quentin Perret            2018-12-03  6855  static int find_=
energy_efficient_cpu(struct task_struct *p, int prev_cpu)
732cd75b8c920d Quentin Perret            2018-12-03  6856  {
7f486e7e7ceb74 Dietmar Eggemann          2022-06-21  6857  	struct cpumask =
*cpus =3D this_cpu_cpumask_var_ptr(select_rq_mask);
eb92692b2544d3 Quentin Perret            2019-09-12  6858  	unsigned long p=
rev_delta =3D ULONG_MAX, best_delta =3D ULONG_MAX;
227680b6d7f621 Vincent Donnefort         2022-06-21  6859  	struct root_dom=
ain *rd =3D this_rq()->rd;
2059fff7a5a2b6 Vincent Donnefort         2022-06-21  6860  	int cpu, best_e=
nergy_cpu, target =3D -1;
732cd75b8c920d Quentin Perret            2018-12-03  6861  	struct sched_do=
main *sd;
eb92692b2544d3 Quentin Perret            2019-09-12  6862  	struct perf_dom=
ain *pd;
227680b6d7f621 Vincent Donnefort         2022-06-21  6863  	struct energy_e=
nv eenv;
732cd75b8c920d Quentin Perret            2018-12-03  6864  =

732cd75b8c920d Quentin Perret            2018-12-03  6865  	rcu_read_lock();
732cd75b8c920d Quentin Perret            2018-12-03  6866  	pd =3D rcu_dere=
ference(rd->pd);
732cd75b8c920d Quentin Perret            2018-12-03  6867  	if (!pd || READ=
_ONCE(rd->overutilized))
619e090c8e409e Pierre Gondois            2021-05-04  6868  		goto unlock;
732cd75b8c920d Quentin Perret            2018-12-03  6869  =

732cd75b8c920d Quentin Perret            2018-12-03  6870  	/*
732cd75b8c920d Quentin Perret            2018-12-03  6871  	 * Energy-aware=
 wake-up happens on the lowest sched_domain starting
732cd75b8c920d Quentin Perret            2018-12-03  6872  	 * from sd_asym=
_cpucapacity spanning over this_cpu and prev_cpu.
732cd75b8c920d Quentin Perret            2018-12-03  6873  	 */
732cd75b8c920d Quentin Perret            2018-12-03  6874  	sd =3D rcu_dere=
ference(*this_cpu_ptr(&sd_asym_cpucapacity));
732cd75b8c920d Quentin Perret            2018-12-03  6875  	while (sd && !c=
pumask_test_cpu(prev_cpu, sched_domain_span(sd)))
732cd75b8c920d Quentin Perret            2018-12-03  6876  		sd =3D sd->par=
ent;
732cd75b8c920d Quentin Perret            2018-12-03  6877  	if (!sd)
619e090c8e409e Pierre Gondois            2021-05-04  6878  		goto unlock;
619e090c8e409e Pierre Gondois            2021-05-04  6879  =

619e090c8e409e Pierre Gondois            2021-05-04  6880  	target =3D prev=
_cpu;
732cd75b8c920d Quentin Perret            2018-12-03  6881  =

732cd75b8c920d Quentin Perret            2018-12-03  6882  	sync_entity_loa=
d_avg(&p->se);
732cd75b8c920d Quentin Perret            2018-12-03  6883  	if (!task_util_=
est(p))
732cd75b8c920d Quentin Perret            2018-12-03  6884  		goto unlock;
732cd75b8c920d Quentin Perret            2018-12-03  6885  =

227680b6d7f621 Vincent Donnefort         2022-06-21  6886  	eenv_task_busy_=
time(&eenv, p, prev_cpu);
227680b6d7f621 Vincent Donnefort         2022-06-21  6887  =

732cd75b8c920d Quentin Perret            2018-12-03  6888  	for (; pd; pd =
=3D pd->next) {
227680b6d7f621 Vincent Donnefort         2022-06-21  6889  		unsigned long =
cpu_cap, cpu_thermal_cap, util;
227680b6d7f621 Vincent Donnefort         2022-06-21  6890  		unsigned long =
cur_delta, max_spare_cap =3D 0;
8d4c97c105ca07 Pierre Gondois            2021-05-04  6891  		bool compute_p=
rev_delta =3D false;
732cd75b8c920d Quentin Perret            2018-12-03  6892  		int max_spare_=
cap_cpu =3D -1;
2059fff7a5a2b6 Vincent Donnefort         2022-06-21  6893  		unsigned long =
base_energy;
732cd75b8c920d Quentin Perret            2018-12-03  6894  =

7f486e7e7ceb74 Dietmar Eggemann          2022-06-21  6895  		cpumask_and(cp=
us, perf_domain_span(pd), cpu_online_mask);
7f486e7e7ceb74 Dietmar Eggemann          2022-06-21  6896  =

227680b6d7f621 Vincent Donnefort         2022-06-21  6897  		if (cpumask_em=
pty(cpus))
227680b6d7f621 Vincent Donnefort         2022-06-21  6898  			continue;
227680b6d7f621 Vincent Donnefort         2022-06-21  6899  =

227680b6d7f621 Vincent Donnefort         2022-06-21  6900  		/* Account the=
rmal pressure for the energy estimation */
227680b6d7f621 Vincent Donnefort         2022-06-21  6901  		cpu =3D cpumas=
k_first(cpus);
227680b6d7f621 Vincent Donnefort         2022-06-21  6902  		cpu_thermal_ca=
p =3D arch_scale_cpu_capacity(cpu);
227680b6d7f621 Vincent Donnefort         2022-06-21  6903  		cpu_thermal_ca=
p -=3D arch_scale_thermal_pressure(cpu);
227680b6d7f621 Vincent Donnefort         2022-06-21  6904  =

227680b6d7f621 Vincent Donnefort         2022-06-21  6905  		eenv.cpu_cap =
=3D cpu_thermal_cap;
227680b6d7f621 Vincent Donnefort         2022-06-21  6906  		eenv.pd_cap =
=3D 0;
227680b6d7f621 Vincent Donnefort         2022-06-21  6907  =

227680b6d7f621 Vincent Donnefort         2022-06-21  6908  		for_each_cpu(c=
pu, cpus) {
227680b6d7f621 Vincent Donnefort         2022-06-21  6909  			eenv.pd_cap +=
=3D cpu_thermal_cap;
227680b6d7f621 Vincent Donnefort         2022-06-21  6910  =

227680b6d7f621 Vincent Donnefort         2022-06-21  6911  			if (!cpumask_=
test_cpu(cpu, sched_domain_span(sd)))
227680b6d7f621 Vincent Donnefort         2022-06-21  6912  				continue;
227680b6d7f621 Vincent Donnefort         2022-06-21  6913  =

3bd3706251ee8a Sebastian Andrzej Siewior 2019-04-23  6914  			if (!cpumask_=
test_cpu(cpu, p->cpus_ptr))
732cd75b8c920d Quentin Perret            2018-12-03  6915  				continue;
732cd75b8c920d Quentin Perret            2018-12-03  6916  =

732cd75b8c920d Quentin Perret            2018-12-03  6917  			util =3D cpu_=
util_next(cpu, p, cpu);
732cd75b8c920d Quentin Perret            2018-12-03  6918  			cpu_cap =3D c=
apacity_of(cpu);
1d42509e475cdc Valentin Schneider        2019-12-11  6919  =

1d42509e475cdc Valentin Schneider        2019-12-11  6920  			/*
1d42509e475cdc Valentin Schneider        2019-12-11  6921  			 * Skip CPUs =
that cannot satisfy the capacity request.
1d42509e475cdc Valentin Schneider        2019-12-11  6922  			 * IOW, placi=
ng the task there would make the CPU
1d42509e475cdc Valentin Schneider        2019-12-11  6923  			 * overutiliz=
ed. Take uclamp into account to see how
1d42509e475cdc Valentin Schneider        2019-12-11  6924  			 * much capac=
ity we can get out of the CPU; this is
a5418be9dffe70 Viresh Kumar              2020-12-08  6925  			 * aligned wi=
th sched_cpu_util().
1d42509e475cdc Valentin Schneider        2019-12-11  6926  			 */
1d42509e475cdc Valentin Schneider        2019-12-11  6927  			util =3D ucla=
mp_rq_util_with(cpu_rq(cpu), util, p);
60e17f5cef838e Viresh Kumar              2019-06-04  6928  			if (!fits_cap=
acity(util, cpu_cap))
732cd75b8c920d Quentin Perret            2018-12-03  6929  				continue;
732cd75b8c920d Quentin Perret            2018-12-03  6930  =

227680b6d7f621 Vincent Donnefort         2022-06-21  6931  			lsub_positive=
(&cpu_cap, util);
227680b6d7f621 Vincent Donnefort         2022-06-21  6932  =

732cd75b8c920d Quentin Perret            2018-12-03  6933  			if (cpu =3D=
=3D prev_cpu) {
8d4c97c105ca07 Pierre Gondois            2021-05-04  6934  				/* Always us=
e prev_cpu as a candidate. */
8d4c97c105ca07 Pierre Gondois            2021-05-04  6935  				compute_prev=
_delta =3D true;
227680b6d7f621 Vincent Donnefort         2022-06-21  6936  			} else if (cp=
u_cap > max_spare_cap) {
732cd75b8c920d Quentin Perret            2018-12-03  6937  				/*
8d4c97c105ca07 Pierre Gondois            2021-05-04  6938  				 * Find the =
CPU with the maximum spare capacity
8d4c97c105ca07 Pierre Gondois            2021-05-04  6939  				 * in the pe=
rformance domain.
732cd75b8c920d Quentin Perret            2018-12-03  6940  				 */
227680b6d7f621 Vincent Donnefort         2022-06-21  6941  				max_spare_ca=
p =3D cpu_cap;
732cd75b8c920d Quentin Perret            2018-12-03  6942  				max_spare_ca=
p_cpu =3D cpu;
732cd75b8c920d Quentin Perret            2018-12-03  6943  			}
732cd75b8c920d Quentin Perret            2018-12-03  6944  		}
732cd75b8c920d Quentin Perret            2018-12-03  6945  =

8d4c97c105ca07 Pierre Gondois            2021-05-04  6946  		if (max_spare_=
cap_cpu < 0 && !compute_prev_delta)
8d4c97c105ca07 Pierre Gondois            2021-05-04  6947  			continue;
8d4c97c105ca07 Pierre Gondois            2021-05-04  6948  =

227680b6d7f621 Vincent Donnefort         2022-06-21  6949  		eenv_pd_busy_t=
ime(&eenv, cpus, p);
8d4c97c105ca07 Pierre Gondois            2021-05-04  6950  		/* Compute the=
 'base' energy of the pd, without @p */
2059fff7a5a2b6 Vincent Donnefort         2022-06-21  6951  		base_energy =
=3D compute_energy(&eenv, pd, cpus, p, -1);
8d4c97c105ca07 Pierre Gondois            2021-05-04  6952  =

8d4c97c105ca07 Pierre Gondois            2021-05-04  6953  		/* Evaluate th=
e energy impact of using prev_cpu. */
8d4c97c105ca07 Pierre Gondois            2021-05-04  6954  		if (compute_pr=
ev_delta) {
227680b6d7f621 Vincent Donnefort         2022-06-21  6955  			prev_delta =
=3D compute_energy(&eenv, pd, cpus, p,
227680b6d7f621 Vincent Donnefort         2022-06-21  6956  						    prev_c=
pu);
227680b6d7f621 Vincent Donnefort         2022-06-21  6957  			/* CPU utiliz=
ation has changed */
2059fff7a5a2b6 Vincent Donnefort         2022-06-21  6958  			if (prev_delt=
a < base_energy)
619e090c8e409e Pierre Gondois            2021-05-04  6959  				goto unlock;
2059fff7a5a2b6 Vincent Donnefort         2022-06-21  6960  			prev_delta -=
=3D base_energy;
8d4c97c105ca07 Pierre Gondois            2021-05-04  6961  			best_delta =
=3D min(best_delta, prev_delta);
8d4c97c105ca07 Pierre Gondois            2021-05-04  6962  		}
8d4c97c105ca07 Pierre Gondois            2021-05-04  6963  =

8d4c97c105ca07 Pierre Gondois            2021-05-04  6964  		/* Evaluate th=
e energy impact of using max_spare_cap_cpu. */
8d4c97c105ca07 Pierre Gondois            2021-05-04  6965  		if (max_spare_=
cap_cpu >=3D 0) {
227680b6d7f621 Vincent Donnefort         2022-06-21  6966  			cur_delta =3D=
 compute_energy(&eenv, pd, cpus, p,
227680b6d7f621 Vincent Donnefort         2022-06-21  6967  						   max_spa=
re_cap_cpu);
227680b6d7f621 Vincent Donnefort         2022-06-21  6968  			/* CPU utiliz=
ation has changed */
2059fff7a5a2b6 Vincent Donnefort         2022-06-21  6969  			if (cur_delta=
 < base_energy)
619e090c8e409e Pierre Gondois            2021-05-04  6970  				goto unlock;
2059fff7a5a2b6 Vincent Donnefort         2022-06-21  6971  			cur_delta -=
=3D base_energy;
eb92692b2544d3 Quentin Perret            2019-09-12  6972  			if (cur_delta=
 < best_delta) {
eb92692b2544d3 Quentin Perret            2019-09-12  6973  				best_delta =
=3D cur_delta;
732cd75b8c920d Quentin Perret            2018-12-03  6974  				best_energy_=
cpu =3D max_spare_cap_cpu;
732cd75b8c920d Quentin Perret            2018-12-03  6975  			}
732cd75b8c920d Quentin Perret            2018-12-03  6976  		}
732cd75b8c920d Quentin Perret            2018-12-03  6977  	}
732cd75b8c920d Quentin Perret            2018-12-03  6978  	rcu_read_unlock=
();
732cd75b8c920d Quentin Perret            2018-12-03  6979  =

2059fff7a5a2b6 Vincent Donnefort         2022-06-21  6980  	if (best_delta =
< prev_delta)
619e090c8e409e Pierre Gondois            2021-05-04 @6981  		target =3D bes=
t_energy_cpu;
732cd75b8c920d Quentin Perret            2018-12-03  6982  =

619e090c8e409e Pierre Gondois            2021-05-04  6983  	return target;
732cd75b8c920d Quentin Perret            2018-12-03  6984  =

619e090c8e409e Pierre Gondois            2021-05-04  6985  unlock:
732cd75b8c920d Quentin Perret            2018-12-03  6986  	rcu_read_unlock=
();
732cd75b8c920d Quentin Perret            2018-12-03  6987  =

619e090c8e409e Pierre Gondois            2021-05-04  6988  	return target;
732cd75b8c920d Quentin Perret            2018-12-03  6989  }
732cd75b8c920d Quentin Perret            2018-12-03  6990  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6500261196621766146==--

