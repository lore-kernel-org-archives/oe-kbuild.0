Content-Type: multipart/mixed; boundary="===============8575401265782271624=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [peterz-queue:sched/core-sched 10/11] kernel/sched/core.c:5262 pick_next_task() error: we previously assumed 'next' could be null (see line 5258)
Date: Fri, 08 Jan 2021 22:32:10 +0800
Message-ID: <202101082200.ouiinQm1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8575401265782271624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: "Joel Fernandes (Google)" <joel@joelfernandes.org>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sc=
hed/core-sched
head:   ead81f232b5b31ab6240a719ff3bad564c3f0e4c
commit: 6f7eefbb382e8c5fa56180f8cd5becb5f882a3d6 [10/11] sched/fair: Snapsh=
ot the min_vruntime of CPUs on force idle
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: x86_64-randconfig-m001-20210108 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/sched/core.c:5262 pick_next_task() error: we previously assumed 'nex=
t' could be null (see line 5258)

vim +/next +5262 kernel/sched/core.c

6f7eefbb382e8c5 Joel Fernandes (Google  2020-11-17  5175) =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5176  static struct tas=
k_struct *
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5177  pick_next_task(st=
ruct rq *rq, struct task_struct *prev, struct rq_flags *rf)
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5178  {
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5179  	struct task_stru=
ct *next, *max =3D NULL;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5180  	const struct sch=
ed_class *class;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5181  	const struct cpu=
mask *smt_mask;
6f7eefbb382e8c5 Joel Fernandes (Google  2020-11-17  5182) 	bool fi_before =
=3D false;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5183  	bool need_sync;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5184  	int i, j, cpu;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5185  =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5186  	if (!sched_core_=
enabled(rq))
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5187  		return __pick_n=
ext_task(rq, prev, rf);
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5188  =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5189  	cpu =3D cpu_of(r=
q);
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5190  =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5191  	/* Stopper task =
is switching into idle, no need core-wide selection. */
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5192  	if (cpu_is_offli=
ne(cpu)) {
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5193  		/*
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5194  		 * Reset core_p=
ick so that we don't enter the fastpath when
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5195  		 * coming onlin=
e. core_pick would already be migrated to
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5196  		 * another cpu =
during offline.
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5197  		 */
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5198  		rq->core_pick =
=3D NULL;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5199  		return __pick_n=
ext_task(rq, prev, rf);
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5200  	}
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5201  =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5202  	/*
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5203  	 * If there were=
 no {en,de}queues since we picked (IOW, the task
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5204  	 * pointers are =
all still valid), and we haven't scheduled the last
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5205  	 * pick yet, do =
so now.
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5206  	 *
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5207  	 * rq->core_pick=
 can be NULL if no selection was made for a CPU because
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5208  	 * it was either=
 offline or went offline during a sibling's core-wide
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5209  	 * selection. In=
 this case, do a core-wide selection.
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5210  	 */
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5211  	if (rq->core->co=
re_pick_seq =3D=3D rq->core->core_task_seq &&
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5212  	    rq->core->co=
re_pick_seq !=3D rq->core_sched_seq &&
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5213  	    rq->core_pic=
k) {
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5214  		WRITE_ONCE(rq->=
core_sched_seq, rq->core->core_pick_seq);
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5215  =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5216  		next =3D rq->co=
re_pick;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5217  		if (next !=3D p=
rev) {
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5218  			put_prev_task(=
rq, prev);
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5219  			set_next_task(=
rq, next);
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5220  		}
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5221  =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5222  		rq->core_pick =
=3D NULL;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5223  		return next;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5224  	}
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5225  =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5226  	put_prev_task_ba=
lance(rq, prev, rf);
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5227  =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5228  	smt_mask =3D cpu=
_smt_mask(cpu);
d7bbf5f9ab91135 Joel Fernandes (Google  2020-11-17  5229) 	need_sync =3D !!=
rq->core->core_cookie;
d7bbf5f9ab91135 Joel Fernandes (Google  2020-11-17  5230) =

d7bbf5f9ab91135 Joel Fernandes (Google  2020-11-17  5231) 	/* reset state */
d7bbf5f9ab91135 Joel Fernandes (Google  2020-11-17  5232) 	rq->core->core_c=
ookie =3D 0UL;
d7bbf5f9ab91135 Joel Fernandes (Google  2020-11-17  5233) 	if (rq->core->co=
re_forceidle) {
d7bbf5f9ab91135 Joel Fernandes (Google  2020-11-17  5234) 		need_sync =3D t=
rue;
d7bbf5f9ab91135 Joel Fernandes (Google  2020-11-17  5235) 		fi_before =3D t=
rue;
d7bbf5f9ab91135 Joel Fernandes (Google  2020-11-17  5236) 		rq->core->core_=
forceidle =3D false;
d7bbf5f9ab91135 Joel Fernandes (Google  2020-11-17  5237) 	}
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5238  =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5239  	/*
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5240  	 * core->core_ta=
sk_seq, core->core_pick_seq, rq->core_sched_seq
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5241  	 *
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5242  	 * @task_seq gua=
rds the task state ({en,de}queues)
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5243  	 * @pick_seq is =
the @task_seq we did a selection on
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5244  	 * @sched_seq is=
 the @pick_seq we scheduled
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5245  	 *
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5246  	 * However, pree=
mptions can cause multiple picks on the same task set.
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5247  	 * 'Fix' this by=
 also increasing @task_seq for every pick.
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5248  	 */
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5249  	rq->core->core_t=
ask_seq++;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5250  =

d7bbf5f9ab91135 Joel Fernandes (Google  2020-11-17  5251) 	/*
d7bbf5f9ab91135 Joel Fernandes (Google  2020-11-17  5252) 	 * Optimize for =
common case where this CPU has no cookies
d7bbf5f9ab91135 Joel Fernandes (Google  2020-11-17  5253) 	 * and there are=
 no cookied tasks running on siblings.
d7bbf5f9ab91135 Joel Fernandes (Google  2020-11-17  5254) 	 */
d7bbf5f9ab91135 Joel Fernandes (Google  2020-11-17  5255) 	if (!need_sync) {
d7bbf5f9ab91135 Joel Fernandes (Google  2020-11-17  5256) 		for_each_class(=
class) {
d7bbf5f9ab91135 Joel Fernandes (Google  2020-11-17  5257) 			next =3D class=
->pick_task(rq);
d7bbf5f9ab91135 Joel Fernandes (Google  2020-11-17 @5258) 			if (next)
d7bbf5f9ab91135 Joel Fernandes (Google  2020-11-17  5259) 				break;
d7bbf5f9ab91135 Joel Fernandes (Google  2020-11-17  5260) 		}
d7bbf5f9ab91135 Joel Fernandes (Google  2020-11-17  5261) =

d7bbf5f9ab91135 Joel Fernandes (Google  2020-11-17 @5262) 		if (!next->core=
_cookie) {
d7bbf5f9ab91135 Joel Fernandes (Google  2020-11-17  5263) 			rq->core_pick =
=3D NULL;
6f7eefbb382e8c5 Joel Fernandes (Google  2020-11-17  5264) 			/*
6f7eefbb382e8c5 Joel Fernandes (Google  2020-11-17  5265) 			 * For robustn=
ess, update the min_vruntime_fi for
6f7eefbb382e8c5 Joel Fernandes (Google  2020-11-17  5266) 			 * unconstrain=
ed picks as well.
6f7eefbb382e8c5 Joel Fernandes (Google  2020-11-17  5267) 			 */
6f7eefbb382e8c5 Joel Fernandes (Google  2020-11-17  5268) 			WARN_ON_ONCE(f=
i_before);
6f7eefbb382e8c5 Joel Fernandes (Google  2020-11-17  5269) 			task_vruntime_=
update(rq, next, false);
d7bbf5f9ab91135 Joel Fernandes (Google  2020-11-17  5270) 			goto done;
d7bbf5f9ab91135 Joel Fernandes (Google  2020-11-17  5271) 		}
651b592b4b80bae Vineeth Pillai          2020-11-17  5272  	}
d7bbf5f9ab91135 Joel Fernandes (Google  2020-11-17  5273) =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5274  	for_each_cpu(i, =
smt_mask) {
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5275  		struct rq *rq_i=
 =3D cpu_rq(i);
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5276  =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5277  		rq_i->core_pick=
 =3D NULL;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5278  =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5279  		if (i !=3D cpu)
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5280  			update_rq_cloc=
k(rq_i);
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5281  	}
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5282  =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5283  	/*
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5284  	 * Try and selec=
t tasks for each sibling in decending sched_class
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5285  	 * order.
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5286  	 */
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5287  	for_each_class(c=
lass) {
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5288  again:
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5289  		for_each_cpu_wr=
ap(i, smt_mask, cpu) {
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5290  			struct rq *rq_=
i =3D cpu_rq(i);
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5291  			struct task_st=
ruct *p;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5292  =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5293  			if (rq_i->core=
_pick)
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5294  				continue;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5295  =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5296  			/*
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5297  			 * If this sib=
ling doesn't yet have a suitable task to
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5298  			 * run; ask fo=
r the most elegible task, given the
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5299  			 * highest pri=
ority task already selected for this
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5300  			 * core.
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5301  			 */
6f7eefbb382e8c5 Joel Fernandes (Google  2020-11-17  5302) 			p =3D pick_tas=
k(rq_i, class, max, fi_before);
d7bbf5f9ab91135 Joel Fernandes (Google  2020-11-17  5303) 			if (!p)
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5304  				continue;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5305  =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5306  			rq_i->core_pic=
k =3D p;
6f7eefbb382e8c5 Joel Fernandes (Google  2020-11-17  5307) 			if (rq_i->idle=
 =3D=3D p && rq_i->nr_running) {
6f7eefbb382e8c5 Joel Fernandes (Google  2020-11-17  5308) 				rq->core->cor=
e_forceidle =3D true;
6f7eefbb382e8c5 Joel Fernandes (Google  2020-11-17  5309) 				if (!fi_befor=
e)
6f7eefbb382e8c5 Joel Fernandes (Google  2020-11-17  5310) 					rq->core->co=
re_forceidle_seq++;
6f7eefbb382e8c5 Joel Fernandes (Google  2020-11-17  5311) 			}
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5312  =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5313  			/*
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5314  			 * If this new=
 candidate is of higher priority than the
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5315  			 * previous; a=
nd they're incompatible; we need to wipe
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5316  			 * the slate a=
nd start over. pick_task makes sure that
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5317  			 * p's priorit=
y is more than max if it doesn't match
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5318  			 * max's cooki=
e.
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5319  			 *
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5320  			 * NOTE: this =
is a linear max-filter and is thus bounded
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5321  			 * in executio=
n time.
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5322  			 */
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5323  			if (!max || !c=
ookie_match(max, p)) {
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5324  				struct task_s=
truct *old_max =3D max;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5325  =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5326  				rq->core->cor=
e_cookie =3D p->core_cookie;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5327  				max =3D p;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5328  =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5329  				if (old_max) {
6f7eefbb382e8c5 Joel Fernandes (Google  2020-11-17  5330) 					rq->core->co=
re_forceidle =3D false;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5331  					for_each_cpu=
(j, smt_mask) {
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5332  						if (j =3D=
=3D i)
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5333  							continue;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5334  =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5335  						cpu_rq(j)->=
core_pick =3D NULL;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5336  					}
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5337  					goto again;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5338  				}
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5339  			}
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5340  		}
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5341  	}
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5342  =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5343  	rq->core->core_p=
ick_seq =3D rq->core->core_task_seq;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5344  	next =3D rq->cor=
e_pick;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5345  	rq->core_sched_s=
eq =3D rq->core->core_pick_seq;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5346  =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5347  	/* Something sho=
uld have been selected for current CPU */
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5348  	WARN_ON_ONCE(!ne=
xt);
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5349  =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5350  	/*
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5351  	 * Reschedule si=
blings
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5352  	 *
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5353  	 * NOTE: L1TF --=
 at this point we're no longer running the old task and
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5354  	 * sending an IP=
I (below) ensures the sibling will no longer be running
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5355  	 * their task. T=
his ensures there is no inter-sibling overlap between
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5356  	 * non-matching =
user state.
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5357  	 */
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5358  	for_each_cpu(i, =
smt_mask) {
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5359  		struct rq *rq_i=
 =3D cpu_rq(i);
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5360  =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5361  		/*
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5362  		 * An online si=
bling might have gone offline before a task
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5363  		 * could be pic=
ked for it, or it might be offline but later
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5364  		 * happen to co=
me online, but its too late and nothing was
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5365  		 * picked for i=
t.  That's Ok - it will pick tasks for itself,
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5366  		 * so ignore it.
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5367  		 */
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5368  		if (!rq_i->core=
_pick)
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5369  			continue;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5370  =

6f7eefbb382e8c5 Joel Fernandes (Google  2020-11-17  5371) 		/*
6f7eefbb382e8c5 Joel Fernandes (Google  2020-11-17  5372) 		 * Update for n=
ew !FI->FI transitions, or if continuing to be in !FI:
6f7eefbb382e8c5 Joel Fernandes (Google  2020-11-17  5373) 		 * fi_before   =
  fi      update?
6f7eefbb382e8c5 Joel Fernandes (Google  2020-11-17  5374) 		 *  0          =
  0       1
6f7eefbb382e8c5 Joel Fernandes (Google  2020-11-17  5375) 		 *  0          =
  1       1
6f7eefbb382e8c5 Joel Fernandes (Google  2020-11-17  5376) 		 *  1          =
  0       1
6f7eefbb382e8c5 Joel Fernandes (Google  2020-11-17  5377) 		 *  1          =
  1       0
6f7eefbb382e8c5 Joel Fernandes (Google  2020-11-17  5378) 		 */
6f7eefbb382e8c5 Joel Fernandes (Google  2020-11-17  5379) 		if (!(fi_before=
 && rq->core->core_forceidle))
6f7eefbb382e8c5 Joel Fernandes (Google  2020-11-17  5380) 			task_vruntime_=
update(rq_i, rq_i->core_pick, rq->core->core_forceidle);
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5381  =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5382  		if (i =3D=3D cp=
u) {
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5383  			rq_i->core_pic=
k =3D NULL;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5384  			continue;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5385  		}
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5386  =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5387  		/* Did we break=
 L1TF mitigation requirements? */
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5388  		WARN_ON_ONCE(!c=
ookie_match(next, rq_i->core_pick));
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5389  =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5390  		if (rq_i->curr =
=3D=3D rq_i->core_pick) {
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5391  			rq_i->core_pic=
k =3D NULL;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5392  			continue;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5393  		}
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5394  =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5395  		resched_curr(rq=
_i);
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5396  	}
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5397  =

2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5398  done:
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5399  	set_next_task(rq=
, next);
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5400  	return next;
2d8ac06b6ca3a0f Peter Zijlstra          2020-11-17  5401  }
2230396a2aab443 Peter Zijlstra          2020-11-17  5402  =


:::::: The code at line 5262 was first introduced by commit
:::::: d7bbf5f9ab91135f8e39144df4189ae963e63cf8 sched: Simplify the core pi=
ck loop for optimized case

:::::: TO: Joel Fernandes (Google) <joel@joelfernandes.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8575401265782271624==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
F9wGC9M0AP25/iyT/NtLSKLcW/4LHFsxLoHYAQA=
--===============8575401265782271624==--

