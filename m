Content-Type: multipart/mixed; boundary="===============7663325755100495564=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/rcu/rcutorture.c:3372 rcu_torture_init() warn: Function too hairy. No more merges.
Date: Sun, 04 Sep 2022 21:06:01 +0800
Message-ID: <202209042143.vg5cdIKH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7663325755100495564==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7726d4c3e60bfe206738894267414a5f10510f1a
commit: a1a5482a2c6e38a3ebed32e571625c56a8cc41a6 x86/extable: Fix ex_handle=
r_msr() print condition
date:   6 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 6 weeks ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
904/202209042143.vg5cdIKH-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/rcu/rcutorture.c:3372 rcu_torture_init() warn: Function too hairy.  =
No more merges.

vim +3372 kernel/rcu/rcutorture.c

3a6cb58f159e64 kernel/rcu/rcutorture.c Paul E. McKenney          2018-12-10=
  3137  =

6f8bc500a10ab9 kernel/rcutorture.c     Josh Triplett             2007-05-08=
  3138  static int __init
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3139  rcu_torture_init(void)
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3140  {
c04dd09bd38c0d kernel/rcu/rcutorture.c Paul E. McKenney          2018-07-23=
  3141  	long i;
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3142  	int cpu;
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3143  	int firsterr =3D 0;
959954df0ca7da kernel/rcu/rcutorture.c Joel Fernandes (Google    2020-06-18=
  3144) 	int flags =3D 0;
959954df0ca7da kernel/rcu/rcutorture.c Joel Fernandes (Google    2020-06-18=
  3145) 	unsigned long gp_seq =3D 0;
2ec1f2d9875229 kernel/rcutorture.c     Paul E. McKenney          2013-06-12=
  3146  	static struct rcu_torture_ops *torture_ops[] =3D {
40c1278aa7cd51 kernel/rcu/rcutorture.c Paul E. McKenney          2022-03-17=
  3147  		&rcu_ops, &rcu_busted_ops, &srcu_ops, &srcud_ops, &busted_srcud_o=
ps,
4c3f7b0e1e880e kernel/rcu/rcutorture.c Paul E. McKenney          2022-03-17=
  3148  		TASKS_OPS TASKS_RUDE_OPS TASKS_TRACING_OPS
40c1278aa7cd51 kernel/rcu/rcutorture.c Paul E. McKenney          2022-03-17=
  3149  		&trivial_ops,
2ec1f2d9875229 kernel/rcutorture.c     Paul E. McKenney          2013-06-12=
  3150  	};
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3151  =

a2f2577d96ad06 kernel/rcu/rcutorture.c Paul E. McKenney          2017-11-21=
  3152  	if (!torture_init_begin(torture_type, verbose))
5228084eed8d54 kernel/rcu/rcutorture.c Paul E. McKenney          2014-04-07=
  3153  		return -EBUSY;
343e9099c8152d kernel/rcutorture.c     Paul E. McKenney          2008-12-15=
  3154  =

a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3155  	/* Process args and tell the world that the torturer is on the job=
. */
ade5fb818fb186 kernel/rcutorture.c     Josh Triplett             2007-05-08=
  3156  	for (i =3D 0; i < ARRAY_SIZE(torture_ops); i++) {
72e9bb549280b3 kernel/rcutorture.c     Paul E. McKenney          2006-06-27=
  3157  		cur_ops =3D torture_ops[i];
ade5fb818fb186 kernel/rcutorture.c     Josh Triplett             2007-05-08=
  3158  		if (strcmp(torture_type, cur_ops->name) =3D=3D 0)
72e9bb549280b3 kernel/rcutorture.c     Paul E. McKenney          2006-06-27=
  3159  			break;
72e9bb549280b3 kernel/rcutorture.c     Paul E. McKenney          2006-06-27=
  3160  	}
ade5fb818fb186 kernel/rcutorture.c     Josh Triplett             2007-05-08=
  3161  	if (i =3D=3D ARRAY_SIZE(torture_ops)) {
2caa1e4432be72 kernel/rcutorture.c     Paul E. McKenney          2012-08-09=
  3162  		pr_alert("rcu-torture: invalid torture type: \"%s\"\n",
72e9bb549280b3 kernel/rcutorture.c     Paul E. McKenney          2006-06-27=
  3163  			 torture_type);
2caa1e4432be72 kernel/rcutorture.c     Paul E. McKenney          2012-08-09=
  3164  		pr_alert("rcu-torture types:");
cf886c44ec418a kernel/rcutorture.c     Paul E. McKenney          2009-10-25=
  3165  		for (i =3D 0; i < ARRAY_SIZE(torture_ops); i++)
a7538352da722f kernel/rcu/rcutorture.c Joe Perches               2018-05-14=
  3166  			pr_cont(" %s", torture_ops[i]->name);
a7538352da722f kernel/rcu/rcutorture.c Joe Perches               2018-05-14=
  3167  		pr_cont("\n");
889d487a26de4b kernel/rcu/rcutorture.c Paul E. McKenney          2015-08-24=
  3168  		firsterr =3D -EINVAL;
b813afae7ab6a5 kernel/rcu/rcutorture.c Paul E. McKenney          2019-03-21=
  3169  		cur_ops =3D NULL;
889d487a26de4b kernel/rcu/rcutorture.c Paul E. McKenney          2015-08-24=
  3170  		goto unwind;
72e9bb549280b3 kernel/rcutorture.c     Paul E. McKenney          2006-06-27=
  3171  	}
bf66f18e79e34c kernel/rcutorture.c     Paul E. McKenney          2010-01-04=
  3172  	if (cur_ops->fqs =3D=3D NULL && fqs_duration !=3D 0) {
2caa1e4432be72 kernel/rcutorture.c     Paul E. McKenney          2012-08-09=
  3173  		pr_alert("rcu-torture: ->fqs NULL and non-zero fqs_duration, fqs =
disabled.\n");
bf66f18e79e34c kernel/rcutorture.c     Paul E. McKenney          2010-01-04=
  3174  		fqs_duration =3D 0;
bf66f18e79e34c kernel/rcutorture.c     Paul E. McKenney          2010-01-04=
  3175  	}
c8e5b163101c5d kernel/rcutorture.c     Josh Triplett             2007-05-08=
  3176  	if (cur_ops->init)
889d487a26de4b kernel/rcu/rcutorture.c Paul E. McKenney          2015-08-24=
  3177  		cur_ops->init();
72e9bb549280b3 kernel/rcutorture.c     Paul E. McKenney          2006-06-27=
  3178  =

64e4b43ae05014 kernel/rcu/rcutorture.c Paul E. McKenney          2014-03-12=
  3179  	if (nreaders >=3D 0) {
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3180  		nrealreaders =3D nreaders;
64e4b43ae05014 kernel/rcu/rcutorture.c Paul E. McKenney          2014-03-12=
  3181  	} else {
3838cc1850ccd0 kernel/rcu/rcutorture.c Paul E. McKenney          2015-03-12=
  3182  		nrealreaders =3D num_online_cpus() - 2 - nreaders;
64e4b43ae05014 kernel/rcu/rcutorture.c Paul E. McKenney          2014-03-12=
  3183  		if (nrealreaders <=3D 0)
64e4b43ae05014 kernel/rcu/rcutorture.c Paul E. McKenney          2014-03-12=
  3184  			nrealreaders =3D 1;
64e4b43ae05014 kernel/rcu/rcutorture.c Paul E. McKenney          2014-03-12=
  3185  	}
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02=
  3186  	rcu_torture_print_module_parms(cur_ops, "Start of test");
959954df0ca7da kernel/rcu/rcutorture.c Joel Fernandes (Google    2020-06-18=
  3187) 	rcutorture_get_gp_data(cur_ops->ttype, &flags, &gp_seq);
959954df0ca7da kernel/rcu/rcutorture.c Joel Fernandes (Google    2020-06-18=
  3188) 	srcutorture_get_gp_data(cur_ops->ttype, srcu_ctlp, &flags, &gp_seq=
);
959954df0ca7da kernel/rcu/rcutorture.c Joel Fernandes (Google    2020-06-18=
  3189) 	start_gp_seq =3D gp_seq;
959954df0ca7da kernel/rcu/rcutorture.c Joel Fernandes (Google    2020-06-18=
  3190) 	pr_alert("%s:  Start-test grace-period state: g%ld f%#x\n",
959954df0ca7da kernel/rcu/rcutorture.c Joel Fernandes (Google    2020-06-18=
  3191) 		 cur_ops->name, (long)gp_seq, flags);
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3192  =

a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3193  	/* Set up the freelist. */
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3194  =

a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3195  	INIT_LIST_HEAD(&rcu_torture_freelist);
788e770eb2d172 kernel/rcutorture.c     Ahmed S. Darwish          2007-05-08=
  3196  	for (i =3D 0; i < ARRAY_SIZE(rcu_tortures); i++) {
996417d2c4eb58 kernel/rcutorture.c     Paul E. McKenney          2005-11-18=
  3197  		rcu_tortures[i].rtort_mbtest =3D 0;
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3198  		list_add_tail(&rcu_tortures[i].rtort_free,
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3199  			      &rcu_torture_freelist);
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3200  	}
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3201  =

a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3202  	/* Initialize the statistics so that each run gets its own numbers=
. */
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3203  =

a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3204  	rcu_torture_current =3D NULL;
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3205  	rcu_torture_current_version =3D 0;
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3206  	atomic_set(&n_rcu_torture_alloc, 0);
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3207  	atomic_set(&n_rcu_torture_alloc_fail, 0);
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3208  	atomic_set(&n_rcu_torture_free, 0);
996417d2c4eb58 kernel/rcutorture.c     Paul E. McKenney          2005-11-18=
  3209  	atomic_set(&n_rcu_torture_mberror, 0);
00504537f44422 kernel/rcu/rcutorture.c Paul E. McKenney          2020-10-29=
  3210  	atomic_set(&n_rcu_torture_mbchk_fail, 0);
00504537f44422 kernel/rcu/rcutorture.c Paul E. McKenney          2020-10-29=
  3211  	atomic_set(&n_rcu_torture_mbchk_tries, 0);
996417d2c4eb58 kernel/rcutorture.c     Paul E. McKenney          2005-11-18=
  3212  	atomic_set(&n_rcu_torture_error, 0);
fae4b54f28f034 kernel/rcutorture.c     Paul E. McKenney          2012-02-20=
  3213  	n_rcu_torture_barrier_error =3D 0;
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02=
  3214  	n_rcu_torture_boost_ktrerror =3D 0;
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02=
  3215  	n_rcu_torture_boost_rterror =3D 0;
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02=
  3216  	n_rcu_torture_boost_failure =3D 0;
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02=
  3217  	n_rcu_torture_boosts =3D 0;
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3218  	for (i =3D 0; i < RCU_TORTURE_PIPE_LEN + 1; i++)
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3219  		atomic_set(&rcu_torture_wcount[i], 0);
0a945022778f10 kernel/rcutorture.c     KAMEZAWA Hiroyuki         2006-03-28=
  3220  	for_each_possible_cpu(cpu) {
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3221  		for (i =3D 0; i < RCU_TORTURE_PIPE_LEN + 1; i++) {
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3222  			per_cpu(rcu_torture_count, cpu)[i] =3D 0;
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3223  			per_cpu(rcu_torture_batch, cpu)[i] =3D 0;
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3224  		}
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3225  	}
c116dba68d1924 kernel/rcu/rcutorture.c Paul E. McKenney          2018-07-13=
  3226  	err_segs_recorded =3D 0;
c116dba68d1924 kernel/rcu/rcutorture.c Paul E. McKenney          2018-07-13=
  3227  	rt_read_nsegs =3D 0;
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3228  =

a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3229  	/* Start up the kthreads. */
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3230  =

18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney          2020-11-16=
  3231  	rcu_torture_write_types();
47cf29b9e72196 kernel/rcu/rcutorture.c Paul E. McKenney          2014-02-03=
  3232  	firsterr =3D torture_create_kthread(rcu_torture_writer, NULL,
47cf29b9e72196 kernel/rcu/rcutorture.c Paul E. McKenney          2014-02-03=
  3233  					  writer_task);
efeff6b39b9de4 kernel/rcu/rcutorture.c Paul E. McKenney          2021-08-05=
  3234  	if (torture_init_error(firsterr))
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3235  		goto unwind;
4444d852a99b8f kernel/rcu/rcutorture.c Paul E. McKenney          2015-05-14=
  3236  	if (nfakewriters > 0) {
68a675d433fbaa kernel/rcu/rcutorture.c Paul E. McKenney          2017-12-01=
  3237  		fakewriter_tasks =3D kcalloc(nfakewriters,
4444d852a99b8f kernel/rcu/rcutorture.c Paul E. McKenney          2015-05-14=
  3238  					   sizeof(fakewriter_tasks[0]),
b772e1dd4b1e60 kernel/rcutorture.c     Josh Triplett             2006-10-04=
  3239  					   GFP_KERNEL);
b772e1dd4b1e60 kernel/rcutorture.c     Josh Triplett             2006-10-04=
  3240  		if (fakewriter_tasks =3D=3D NULL) {
81faa4f6fba429 kernel/rcu/rcutorture.c Li Zhijian                2021-11-03=
  3241  			TOROUT_ERRSTRING("out of memory");
b772e1dd4b1e60 kernel/rcutorture.c     Josh Triplett             2006-10-04=
  3242  			firsterr =3D -ENOMEM;
b772e1dd4b1e60 kernel/rcutorture.c     Josh Triplett             2006-10-04=
  3243  			goto unwind;
b772e1dd4b1e60 kernel/rcutorture.c     Josh Triplett             2006-10-04=
  3244  		}
4444d852a99b8f kernel/rcu/rcutorture.c Paul E. McKenney          2015-05-14=
  3245  	}
b772e1dd4b1e60 kernel/rcutorture.c     Josh Triplett             2006-10-04=
  3246  	for (i =3D 0; i < nfakewriters; i++) {
47cf29b9e72196 kernel/rcu/rcutorture.c Paul E. McKenney          2014-02-03=
  3247  		firsterr =3D torture_create_kthread(rcu_torture_fakewriter,
47cf29b9e72196 kernel/rcu/rcutorture.c Paul E. McKenney          2014-02-03=
  3248  						  NULL, fakewriter_tasks[i]);
efeff6b39b9de4 kernel/rcu/rcutorture.c Paul E. McKenney          2021-08-05=
  3249  		if (torture_init_error(firsterr))
b772e1dd4b1e60 kernel/rcutorture.c     Josh Triplett             2006-10-04=
  3250  			goto unwind;
b772e1dd4b1e60 kernel/rcutorture.c     Josh Triplett             2006-10-04=
  3251  	}
68a675d433fbaa kernel/rcu/rcutorture.c Paul E. McKenney          2017-12-01=
  3252  	reader_tasks =3D kcalloc(nrealreaders, sizeof(reader_tasks[0]),
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3253  			       GFP_KERNEL);
00504537f44422 kernel/rcu/rcutorture.c Paul E. McKenney          2020-10-29=
  3254  	rcu_torture_reader_mbchk =3D kcalloc(nrealreaders, sizeof(*rcu_tor=
ture_reader_mbchk),
00504537f44422 kernel/rcu/rcutorture.c Paul E. McKenney          2020-10-29=
  3255  					   GFP_KERNEL);
00504537f44422 kernel/rcu/rcutorture.c Paul E. McKenney          2020-10-29=
  3256  	if (!reader_tasks || !rcu_torture_reader_mbchk) {
81faa4f6fba429 kernel/rcu/rcutorture.c Li Zhijian                2021-11-03=
  3257  		TOROUT_ERRSTRING("out of memory");
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3258  		firsterr =3D -ENOMEM;
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3259  		goto unwind;
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3260  	}
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3261  	for (i =3D 0; i < nrealreaders; i++) {
00504537f44422 kernel/rcu/rcutorture.c Paul E. McKenney          2020-10-29=
  3262  		rcu_torture_reader_mbchk[i].rtc_chkrdr =3D -1;
c04dd09bd38c0d kernel/rcu/rcutorture.c Paul E. McKenney          2018-07-23=
  3263  		firsterr =3D torture_create_kthread(rcu_torture_reader, (void *)i,
47cf29b9e72196 kernel/rcu/rcutorture.c Paul E. McKenney          2014-02-03=
  3264  						  reader_tasks[i]);
efeff6b39b9de4 kernel/rcu/rcutorture.c Paul E. McKenney          2021-08-05=
  3265  		if (torture_init_error(firsterr))
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3266  			goto unwind;
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3267  	}
2c4319bd1d14d0 kernel/rcu/rcutorture.c Paul E. McKenney          2020-09-23=
  3268  	nrealnocbers =3D nocbs_nthreads;
2c4319bd1d14d0 kernel/rcu/rcutorture.c Paul E. McKenney          2020-09-23=
  3269  	if (WARN_ON(nrealnocbers < 0))
2c4319bd1d14d0 kernel/rcu/rcutorture.c Paul E. McKenney          2020-09-23=
  3270  		nrealnocbers =3D 1;
2c4319bd1d14d0 kernel/rcu/rcutorture.c Paul E. McKenney          2020-09-23=
  3271  	if (WARN_ON(nocbs_toggle < 0))
2c4319bd1d14d0 kernel/rcu/rcutorture.c Paul E. McKenney          2020-09-23=
  3272  		nocbs_toggle =3D HZ;
2c4319bd1d14d0 kernel/rcu/rcutorture.c Paul E. McKenney          2020-09-23=
  3273  	if (nrealnocbers > 0) {
2c4319bd1d14d0 kernel/rcu/rcutorture.c Paul E. McKenney          2020-09-23=
  3274  		nocb_tasks =3D kcalloc(nrealnocbers, sizeof(nocb_tasks[0]), GFP_K=
ERNEL);
2c4319bd1d14d0 kernel/rcu/rcutorture.c Paul E. McKenney          2020-09-23=
  3275  		if (nocb_tasks =3D=3D NULL) {
81faa4f6fba429 kernel/rcu/rcutorture.c Li Zhijian                2021-11-03=
  3276  			TOROUT_ERRSTRING("out of memory");
2c4319bd1d14d0 kernel/rcu/rcutorture.c Paul E. McKenney          2020-09-23=
  3277  			firsterr =3D -ENOMEM;
2c4319bd1d14d0 kernel/rcu/rcutorture.c Paul E. McKenney          2020-09-23=
  3278  			goto unwind;
2c4319bd1d14d0 kernel/rcu/rcutorture.c Paul E. McKenney          2020-09-23=
  3279  		}
2c4319bd1d14d0 kernel/rcu/rcutorture.c Paul E. McKenney          2020-09-23=
  3280  	} else {
2c4319bd1d14d0 kernel/rcu/rcutorture.c Paul E. McKenney          2020-09-23=
  3281  		nocb_tasks =3D NULL;
2c4319bd1d14d0 kernel/rcu/rcutorture.c Paul E. McKenney          2020-09-23=
  3282  	}
2c4319bd1d14d0 kernel/rcu/rcutorture.c Paul E. McKenney          2020-09-23=
  3283  	for (i =3D 0; i < nrealnocbers; i++) {
2c4319bd1d14d0 kernel/rcu/rcutorture.c Paul E. McKenney          2020-09-23=
  3284  		firsterr =3D torture_create_kthread(rcu_nocb_toggle, NULL, nocb_t=
asks[i]);
efeff6b39b9de4 kernel/rcu/rcutorture.c Paul E. McKenney          2021-08-05=
  3285  		if (torture_init_error(firsterr))
2c4319bd1d14d0 kernel/rcu/rcutorture.c Paul E. McKenney          2020-09-23=
  3286  			goto unwind;
2c4319bd1d14d0 kernel/rcu/rcutorture.c Paul E. McKenney          2020-09-23=
  3287  	}
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3288  	if (stat_interval > 0) {
47cf29b9e72196 kernel/rcu/rcutorture.c Paul E. McKenney          2014-02-03=
  3289  		firsterr =3D torture_create_kthread(rcu_torture_stats, NULL,
47cf29b9e72196 kernel/rcu/rcutorture.c Paul E. McKenney          2014-02-03=
  3290  						  stats_task);
efeff6b39b9de4 kernel/rcu/rcutorture.c Paul E. McKenney          2021-08-05=
  3291  		if (torture_init_error(firsterr))
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3292  			goto unwind;
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3293  	}
e8e255f7191fb6 kernel/rcu/rcutorture.c Paul E. McKenney          2015-05-14=
  3294  	if (test_no_idle_hz && shuffle_interval > 0) {
3808dc9fab0591 kernel/rcu/rcutorture.c Paul E. McKenney          2014-01-28=
  3295  		firsterr =3D torture_shuffle_init(shuffle_interval * HZ);
efeff6b39b9de4 kernel/rcu/rcutorture.c Paul E. McKenney          2021-08-05=
  3296  		if (torture_init_error(firsterr))
d84f520348d77e kernel/rcutorture.c     Srivatsa Vaddagiri        2006-01-08=
  3297  			goto unwind;
d84f520348d77e kernel/rcutorture.c     Srivatsa Vaddagiri        2006-01-08=
  3298  	}
d120f65f3aaf30 kernel/rcutorture.c     Paul E. McKenney          2008-06-18=
  3299  	if (stutter < 0)
d120f65f3aaf30 kernel/rcutorture.c     Paul E. McKenney          2008-06-18=
  3300  		stutter =3D 0;
d120f65f3aaf30 kernel/rcutorture.c     Paul E. McKenney          2008-06-18=
  3301  	if (stutter) {
ff3bf92d90d396 kernel/rcu/rcutorture.c Paul E. McKenney          2019-04-09=
  3302  		int t;
ff3bf92d90d396 kernel/rcu/rcutorture.c Paul E. McKenney          2019-04-09=
  3303  =

ff3bf92d90d396 kernel/rcu/rcutorture.c Paul E. McKenney          2019-04-09=
  3304  		t =3D cur_ops->stall_dur ? cur_ops->stall_dur() : stutter * HZ;
ff3bf92d90d396 kernel/rcu/rcutorture.c Paul E. McKenney          2019-04-09=
  3305  		firsterr =3D torture_stutter_init(stutter * HZ, t);
efeff6b39b9de4 kernel/rcu/rcutorture.c Paul E. McKenney          2021-08-05=
  3306  		if (torture_init_error(firsterr))
d120f65f3aaf30 kernel/rcutorture.c     Paul E. McKenney          2008-06-18=
  3307  			goto unwind;
d120f65f3aaf30 kernel/rcutorture.c     Paul E. McKenney          2008-06-18=
  3308  	}
bf66f18e79e34c kernel/rcutorture.c     Paul E. McKenney          2010-01-04=
  3309  	if (fqs_duration < 0)
bf66f18e79e34c kernel/rcutorture.c     Paul E. McKenney          2010-01-04=
  3310  		fqs_duration =3D 0;
bf66f18e79e34c kernel/rcutorture.c     Paul E. McKenney          2010-01-04=
  3311  	if (fqs_duration) {
628edaa5062282 kernel/rcu/rcutorture.c Paul E. McKenney          2014-01-31=
  3312  		/* Create the fqs thread */
d0d0606e2c13ad kernel/rcu/rcutorture.c Paul E. McKenney          2014-03-17=
  3313  		firsterr =3D torture_create_kthread(rcu_torture_fqs, NULL,
d0d0606e2c13ad kernel/rcu/rcutorture.c Paul E. McKenney          2014-03-17=
  3314  						  fqs_task);
efeff6b39b9de4 kernel/rcu/rcutorture.c Paul E. McKenney          2021-08-05=
  3315  		if (torture_init_error(firsterr))
bf66f18e79e34c kernel/rcutorture.c     Paul E. McKenney          2010-01-04=
  3316  			goto unwind;
bf66f18e79e34c kernel/rcutorture.c     Paul E. McKenney          2010-01-04=
  3317  	}
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02=
  3318  	if (test_boost_interval < 1)
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02=
  3319  		test_boost_interval =3D 1;
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02=
  3320  	if (test_boost_duration < 2)
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02=
  3321  		test_boost_duration =3D 2;
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google    2018-06-19=
  3322) 	if (rcu_torture_can_boost()) {
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02=
  3323  =

8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02=
  3324  		boost_starttime =3D jiffies + test_boost_interval * HZ;
0ffd374b2207a1 kernel/rcu/rcutorture.c Sebastian Andrzej Siewior 2016-08-18=
  3325  =

0ffd374b2207a1 kernel/rcu/rcutorture.c Sebastian Andrzej Siewior 2016-08-18=
  3326  		firsterr =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "RCU_TORTURE",
0ffd374b2207a1 kernel/rcu/rcutorture.c Sebastian Andrzej Siewior 2016-08-18=
  3327  					     rcutorture_booster_init,
0ffd374b2207a1 kernel/rcu/rcutorture.c Sebastian Andrzej Siewior 2016-08-18=
  3328  					     rcutorture_booster_cleanup);
0ffd374b2207a1 kernel/rcu/rcutorture.c Sebastian Andrzej Siewior 2016-08-18=
  3329  		rcutor_hp =3D firsterr;
efeff6b39b9de4 kernel/rcu/rcutorture.c Paul E. McKenney          2021-08-05=
  3330  		if (torture_init_error(firsterr))
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02=
  3331  			goto unwind;
ea6d962e80b619 kernel/rcu/rcutorture.c Paul E. McKenney          2021-03-30=
  3332  =

ea6d962e80b619 kernel/rcu/rcutorture.c Paul E. McKenney          2021-03-30=
  3333  		// Testing RCU priority boosting requires rcutorture do
ea6d962e80b619 kernel/rcu/rcutorture.c Paul E. McKenney          2021-03-30=
  3334  		// some serious abuse.  Counter this by running ksoftirqd
ea6d962e80b619 kernel/rcu/rcutorture.c Paul E. McKenney          2021-03-30=
  3335  		// at higher priority.
ea6d962e80b619 kernel/rcu/rcutorture.c Paul E. McKenney          2021-03-30=
  3336  		if (IS_BUILTIN(CONFIG_RCU_TORTURE_TEST)) {
ea6d962e80b619 kernel/rcu/rcutorture.c Paul E. McKenney          2021-03-30=
  3337  			for_each_online_cpu(cpu) {
ea6d962e80b619 kernel/rcu/rcutorture.c Paul E. McKenney          2021-03-30=
  3338  				struct sched_param sp;
ea6d962e80b619 kernel/rcu/rcutorture.c Paul E. McKenney          2021-03-30=
  3339  				struct task_struct *t;
ea6d962e80b619 kernel/rcu/rcutorture.c Paul E. McKenney          2021-03-30=
  3340  =

ea6d962e80b619 kernel/rcu/rcutorture.c Paul E. McKenney          2021-03-30=
  3341  				t =3D per_cpu(ksoftirqd, cpu);
ea6d962e80b619 kernel/rcu/rcutorture.c Paul E. McKenney          2021-03-30=
  3342  				WARN_ON_ONCE(!t);
ea6d962e80b619 kernel/rcu/rcutorture.c Paul E. McKenney          2021-03-30=
  3343  				sp.sched_priority =3D 2;
ea6d962e80b619 kernel/rcu/rcutorture.c Paul E. McKenney          2021-03-30=
  3344  				sched_setscheduler_nocheck(t, SCHED_FIFO, &sp);
ea6d962e80b619 kernel/rcu/rcutorture.c Paul E. McKenney          2021-03-30=
  3345  			}
ea6d962e80b619 kernel/rcu/rcutorture.c Paul E. McKenney          2021-03-30=
  3346  		}
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02=
  3347  	}
60013d5d2b4031 kernel/rcu/rcutorture.c Paul E. McKenney          2019-07-10=
  3348  	shutdown_jiffies =3D jiffies + shutdown_secs * HZ;
01025ebc99e39a kernel/rcu/rcutorture.c Paul E. McKenney          2014-01-31=
  3349  	firsterr =3D torture_shutdown_init(shutdown_secs, rcu_torture_clea=
nup);
efeff6b39b9de4 kernel/rcu/rcutorture.c Paul E. McKenney          2021-08-05=
  3350  	if (torture_init_error(firsterr))
d5f546d834ddc4 kernel/rcutorture.c     Paul E. McKenney          2011-11-04=
  3351  		goto unwind;
3a6cb58f159e64 kernel/rcu/rcutorture.c Paul E. McKenney          2018-12-10=
  3352  	firsterr =3D torture_onoff_init(onoff_holdoff * HZ, onoff_interval,
3a6cb58f159e64 kernel/rcu/rcutorture.c Paul E. McKenney          2018-12-10=
  3353  				      rcutorture_sync);
efeff6b39b9de4 kernel/rcu/rcutorture.c Paul E. McKenney          2021-08-05=
  3354  	if (torture_init_error(firsterr))
37e377d2823e03 kernel/rcutorture.c     Paul E. McKenney          2012-02-17=
  3355  		goto unwind;
01025ebc99e39a kernel/rcu/rcutorture.c Paul E. McKenney          2014-01-31=
  3356  	firsterr =3D rcu_torture_stall_init();
efeff6b39b9de4 kernel/rcu/rcutorture.c Paul E. McKenney          2021-08-05=
  3357  	if (torture_init_error(firsterr))
1b27291b1ea4f1 kernel/rcu/rcutorture.c Paul E. McKenney          2018-07-18=
  3358  		goto unwind;
1b27291b1ea4f1 kernel/rcu/rcutorture.c Paul E. McKenney          2018-07-18=
  3359  	firsterr =3D rcu_torture_fwd_prog_init();
efeff6b39b9de4 kernel/rcu/rcutorture.c Paul E. McKenney          2021-08-05=
  3360  	if (torture_init_error(firsterr))
37e377d2823e03 kernel/rcutorture.c     Paul E. McKenney          2012-02-17=
  3361  		goto unwind;
01025ebc99e39a kernel/rcu/rcutorture.c Paul E. McKenney          2014-01-31=
  3362  	firsterr =3D rcu_torture_barrier_init();
efeff6b39b9de4 kernel/rcu/rcutorture.c Paul E. McKenney          2021-08-05=
  3363  	if (torture_init_error(firsterr))
4a5f133c15b77c kernel/rcu/rcutorture.c Paul E. McKenney          2020-04-24=
  3364  		goto unwind;
4a5f133c15b77c kernel/rcu/rcutorture.c Paul E. McKenney          2020-04-24=
  3365  	firsterr =3D rcu_torture_read_exit_init();
efeff6b39b9de4 kernel/rcu/rcutorture.c Paul E. McKenney          2021-08-05=
  3366  	if (torture_init_error(firsterr))
fae4b54f28f034 kernel/rcutorture.c     Paul E. McKenney          2012-02-20=
  3367  		goto unwind;
d2818df168b2c8 kernel/rcutorture.c     Paul E. McKenney          2013-04-23=
  3368  	if (object_debug)
d2818df168b2c8 kernel/rcutorture.c     Paul E. McKenney          2013-04-23=
  3369  		rcu_test_debug_objects();
b5daa8f3b3b2b0 kernel/rcu/rcutorture.c Paul E. McKenney          2014-01-30=
  3370  	torture_init_end();
99d6a2acb8955f kernel/rcu/rcutorture.c Paul E. McKenney          2022-02-04=
  3371  	rcu_gp_slow_register(&rcu_fwd_cb_nodelay);
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
 @3372  	return 0;
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3373  =

a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3374  unwind:
b5daa8f3b3b2b0 kernel/rcu/rcutorture.c Paul E. McKenney          2014-01-30=
  3375  	torture_init_end();
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3376  	rcu_torture_cleanup();
4994684ce10924 kernel/rcu/rcutorture.c Paul E. McKenney          2020-09-18=
  3377  	if (shutdown_secs) {
4994684ce10924 kernel/rcu/rcutorture.c Paul E. McKenney          2020-09-18=
  3378  		WARN_ON(!IS_MODULE(CONFIG_RCU_TORTURE_TEST));
4994684ce10924 kernel/rcu/rcutorture.c Paul E. McKenney          2020-09-18=
  3379  		kernel_power_off();
4994684ce10924 kernel/rcu/rcutorture.c Paul E. McKenney          2020-09-18=
  3380  	}
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3381  	return firsterr;
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3382  }
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney          2005-10-30=
  3383  =


:::::: The code@line 3372 was first introduced by commit
:::::: a241ec65aeac3d69a08a7b153cccbdb7ea35063f [PATCH] RCU torture-testing=
 kernel module

:::::: TO: Paul E. McKenney <paulmck@us.ibm.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7663325755100495564==--

