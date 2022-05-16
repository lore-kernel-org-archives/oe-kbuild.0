Content-Type: multipart/mixed; boundary="===============7995988076090512705=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] sched/rt: Support multi-criterion fitness search for
Date: Tue, 17 May 2022 01:04:29 +0800
Message-ID: <202205170040.Eh9wjHXf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7995988076090512705==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220514235513.jm7ul2y6uddj6eh2@airbuntu>
References: <20220514235513.jm7ul2y6uddj6eh2@airbuntu>
TO: Qais Yousef <qais.yousef@arm.com>
TO: Xuewen Yan <xuewen.yan94@gmail.com>
CC: Lukasz Luba <lukasz.luba@arm.com>
CC: dietmar.eggemann(a)arm.com
CC: rafael(a)kernel.org
CC: viresh.kumar(a)linaro.org
CC: mingo(a)redhat.com
CC: peterz(a)infradead.org
CC: vincent.guittot(a)linaro.org
CC: rostedt(a)goodmis.org
CC: linux-kernel(a)vger.kernel.org
CC: di.shen(a)unisoc.com
CC: "=E7=8E=8B=E7=A7=91 (Ke Wang)" <Ke.Wang@unisoc.com>

Hi Qais,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on v5.18-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Qais-Yousef/sched-rt=
-Support-multi-criterion-fitness-search-for/20220515-075732
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 734387e=
c2f9d77b00276042b1fa7c95f48ee879d
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-m031-20220516 (https://download.01.org/0day-ci/ar=
chive/20220517/202205170040.Eh9wjHXf-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/sched/cpupri.c:157 cpupri_find_fitness() warn: we never enter this l=
oop
kernel/sched/rt.c:2509 init_sched_rt_fitness_mask() warn: we never enter th=
is loop

vim +157 kernel/sched/cpupri.c

a1bd02e1f28b193 kernel/sched/cpupri.c Qais Yousef     2020-03-02  125  =

d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  126  /**
a1bd02e1f28b193 kernel/sched/cpupri.c Qais Yousef     2020-03-02  127   * c=
pupri_find_fitness - find the best (lowest-pri) CPU in the system
d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  128   * @=
cp: The cpupri context
d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  129   * @=
p: The task
d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  130   * @=
lowest_mask: A mask to fill in with selected CPUs (or NULL)
d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  131   * @=
fitness_fn: A pointer to a function to do custom checks whether the CPU
d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  132   *  =
            fits a specific criteria so that we only return those CPUs.
d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  133   *
d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  134   * N=
ote: This function returns the recommended CPUs as calculated during the
d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  135   * c=
urrent invocation.  By the time the call returns, the CPUs may have in
d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  136   * f=
act changed priorities any number of times.  While not ideal, it is not
d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  137   * a=
n issue of correctness since the normal rebalancer logic will correct
d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  138   * a=
ny discrepancies created by racing against the uncertainty of the current
d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  139   * p=
riority configuration.
d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  140   *
d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  141   * R=
eturn: (int)bool - CPUs were found
d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  142   */
a1bd02e1f28b193 kernel/sched/cpupri.c Qais Yousef     2020-03-02  143  int =
cpupri_find_fitness(struct cpupri *cp, struct task_struct *p,
d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  144  		st=
ruct cpumask *lowest_mask,
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  145  		cp=
umask_var_t fitness_mask[], fitness_fn_t fitness_fn[])
d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  146  {
d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  147  	int=
 task_pri =3D convert_prio(p->prio);
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  148  	boo=
l fallback_found[NUM_FITNESS_FN];
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  149  	int=
 idx, cpu, fn_idx;
d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  150  =

d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  151  	BUG=
_ON(task_pri >=3D CPUPRI_NR_PRIORITIES);
d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  152  =

0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  153  	if =
(NUM_FITNESS_FN && fitness_fn) {
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  154  		/*
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  155  		 *=
 Clear the masks so that we can save a fallback hit in them
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  156  		 */
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15 @157  		fo=
r (fn_idx =3D 0; fn_idx < NUM_FITNESS_FN; fn_idx++) {
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  158  			c=
pumask_clear(fitness_mask[fn_idx]);
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  159  			f=
allback_found[fn_idx] =3D false;
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  160  		}
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  161  	}
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  162  =

d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  163  	for=
 (idx =3D 0; idx < task_pri; idx++) {
d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  164  =

d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  165  		if=
 (!__cpupri_find(cp, p, lowest_mask, idx))
804d402fb6f6487 kernel/sched/cpupri.c Qais Yousef     2019-10-09  166  			c=
ontinue;
804d402fb6f6487 kernel/sched/cpupri.c Qais Yousef     2019-10-09  167  =

d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  168  		if=
 (!lowest_mask || !fitness_fn)
804d402fb6f6487 kernel/sched/cpupri.c Qais Yousef     2019-10-09  169  			r=
eturn 1;
804d402fb6f6487 kernel/sched/cpupri.c Qais Yousef     2019-10-09  170  =

0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  171  		/*
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  172  		 *=
 We got a hit, save in our fallback masks that are empty.
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  173  		 *
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  174  		 *=
 Note that we use fitness_mask[0] to save the fallback for
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  175  		 *=
 when all fitness_fns fail to find a suitable CPU.
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  176  		 *
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  177  		 *=
 We use lowest_mask to store the results of fitness_fn[0]
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  178  		 *=
 directly.
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  179  		 */
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  180  		if=
 (!fallback_found[0]) {
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  181  				=
cpumask_copy(fitness_mask[0], lowest_mask);
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  182  				=
fallback_found[0] =3D true;
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  183  		}
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  184  		fo=
r (fn_idx =3D 1; fn_idx < NUM_FITNESS_FN; fn_idx++) {
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  185  =

0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  186  			/*
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  187  			 =
* We just need one valid fallback at highest level
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  188  			 =
* (smallest fn_idx). We don't care about checking for
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  189  			 =
* fallback beyond this once we found one.
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  190  			 =
*/
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  191  			i=
f (fallback_found[fn_idx])
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  192  				=
break;
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  193  =

0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  194  			c=
pumask_copy(fitness_mask[fn_idx], lowest_mask);
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  195  		}
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  196  =

0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  197  		/*
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  198  		 *=
 fintness_fn[0] hit always terminates the search immediately,
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  199  		 *=
 so do that first.
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  200  		 */
804d402fb6f6487 kernel/sched/cpupri.c Qais Yousef     2019-10-09  201  		fo=
r_each_cpu(cpu, lowest_mask) {
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  202  			i=
f (!fitness_fn[0](p, cpu))
804d402fb6f6487 kernel/sched/cpupri.c Qais Yousef     2019-10-09  203  				=
cpumask_clear_cpu(cpu, lowest_mask);
804d402fb6f6487 kernel/sched/cpupri.c Qais Yousef     2019-10-09  204  		}
804d402fb6f6487 kernel/sched/cpupri.c Qais Yousef     2019-10-09  205  =

804d402fb6f6487 kernel/sched/cpupri.c Qais Yousef     2019-10-09  206  		/*
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  207  		 *=
 Stop searching as soon as fitness_fn[0] is happy with the
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  208  		 *=
 results.
804d402fb6f6487 kernel/sched/cpupri.c Qais Yousef     2019-10-09  209  		 */
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  210  		if=
 (!cpumask_empty(lowest_mask))
6e0534f278199f1 kernel/sched_cpupri.c Gregory Haskins 2008-05-12  211  			r=
eturn 1;
6e0534f278199f1 kernel/sched_cpupri.c Gregory Haskins 2008-05-12  212  =

d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  213  		/*
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  214  		 *=
 Find a fallback CPU for the other fitness_fns.
d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  215  		 *
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  216  		 *=
 Only do this once. As soon as we get a valid fallback mask,
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  217  		 *=
 we'll remember it so that when fitness_fn[0] fails for all
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  218  		 *=
 priorities, we'll return this fallback mask.
d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  219  		 *
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  220  		 *=
 Remember that we use fitnss_mask[0] to store our fallback
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  221  		 *=
 results for when all fitness_fns fail.
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  222  		 */
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  223  		fo=
r (fn_idx =3D 1; fn_idx < NUM_FITNESS_FN; fn_idx++) {
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  224  =

0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  225  			/*
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  226  			 =
* We just need one valid fallback at highest level
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  227  			 =
* (smallest fn_idx). We don't care about checking for
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  228  			 =
* fallback beyond this once we found one.
d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  229  			 =
*/
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  230  			i=
f (fallback_found[fn_idx])
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  231  				=
break;
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  232  =

0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  233  			f=
or_each_cpu(cpu, fitness_mask[fn_idx]) {
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  234  				=
if (!fitness_fn[fn_idx](p, cpu))
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  235  				=
	cpumask_clear_cpu(cpu, fitness_mask[fn_idx]);
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  236  			}
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  237  =

0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  238  			i=
f (!cpumask_empty(fitness_mask[fn_idx]))
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  239  				=
fallback_found[fn_idx] =3D true;
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  240  		}
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  241  	}
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  242  =

0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  243  	for=
 (fn_idx =3D 1; fn_idx < NUM_FITNESS_FN; fn_idx++) {
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  244  		if=
 (fallback_found[fn_idx]) {
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  245  			c=
pumask_copy(lowest_mask, fitness_mask[fn_idx]);
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  246  			r=
eturn 1;
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  247  		}
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  248  	}
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  249  =

0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  250  	/*
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  251  	 * =
No fallback from any of the fitness_fns, fallback to priority based
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  252  	 * =
lowest_mask which we store@fitness_mask[0].
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  253  	 */
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  254  =

0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  255  	if =
(fallback_found[0]) {
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  256  		cp=
umask_copy(lowest_mask, fitness_mask[0]);
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  257  		re=
turn 1;
0eee64011b1d437 kernel/sched/cpupri.c Qais Yousef     2022-05-15  258  	}
d9cb236b9429044 kernel/sched/cpupri.c Qais Yousef     2020-03-02  259  =

6e0534f278199f1 kernel/sched_cpupri.c Gregory Haskins 2008-05-12  260  	ret=
urn 0;
6e0534f278199f1 kernel/sched_cpupri.c Gregory Haskins 2008-05-12  261  }
6e0534f278199f1 kernel/sched_cpupri.c Gregory Haskins 2008-05-12  262  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7995988076090512705==--

