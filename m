Content-Type: multipart/mixed; boundary="===============8471646032547989785=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [peterz-queue:sched/wip2 1/9] kernel/stop_machine.c:513:15: warning: Variable 'stopper->fn' is reassigned a value before the old one has been used.
Date: Fri, 25 Sep 2020 08:23:18 +0800
Message-ID: <202009250808.5tU1Di0u%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8471646032547989785==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sc=
hed/wip2
head:   05b12ada8e74101db269732c30802ef809eba3c9
commit: 4ed032c4bc376317ec19ffa13e86cae46aef2ea5 [1/9] stop_machine: Add fu=
nction and caller debug info
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> kernel/stop_machine.c:513:15: warning: Variable 'stopper->fn' is reassig=
ned a value before the old one has been used. [redundantAssignment]
     stopper->fn =3D NULL;
                 ^
   kernel/stop_machine.c:504:15: note: Variable 'stopper->fn' is reassigned=
 a value before the old one has been used.
     stopper->fn =3D fn;
                 ^
   kernel/stop_machine.c:513:15: note: Variable 'stopper->fn' is reassigned=
 a value before the old one has been used.
     stopper->fn =3D NULL;
                 ^

# https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?=
id=3D4ed032c4bc376317ec19ffa13e86cae46aef2ea5
git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git=
/peterz/queue.git
git fetch --no-tags peterz-queue sched/wip2
git checkout 4ed032c4bc376317ec19ffa13e86cae46aef2ea5
vim +513 kernel/stop_machine.c

14e568e78f6f80c Thomas Gleixner 2013-01-31  480  =

14e568e78f6f80c Thomas Gleixner 2013-01-31  481  static void cpu_stopper_th=
read(unsigned int cpu)
14e568e78f6f80c Thomas Gleixner 2013-01-31  482  {
14e568e78f6f80c Thomas Gleixner 2013-01-31  483  	struct cpu_stopper *stopp=
er =3D &per_cpu(cpu_stopper, cpu);
1142d810298e694 Tejun Heo       2010-05-06  484  	struct cpu_stop_work *wor=
k;
1142d810298e694 Tejun Heo       2010-05-06  485  =

1142d810298e694 Tejun Heo       2010-05-06  486  repeat:
1142d810298e694 Tejun Heo       2010-05-06  487  	work =3D NULL;
de5b55c1d4e3074 Thomas Gleixner 2018-04-23  488  	raw_spin_lock_irq(&stoppe=
r->lock);
1142d810298e694 Tejun Heo       2010-05-06  489  	if (!list_empty(&stopper-=
>works)) {
1142d810298e694 Tejun Heo       2010-05-06  490  		work =3D list_first_entr=
y(&stopper->works,
1142d810298e694 Tejun Heo       2010-05-06  491  					struct cpu_stop_work,=
 list);
1142d810298e694 Tejun Heo       2010-05-06  492  		list_del_init(&work->lis=
t);
1142d810298e694 Tejun Heo       2010-05-06  493  	}
de5b55c1d4e3074 Thomas Gleixner 2018-04-23  494  	raw_spin_unlock_irq(&stop=
per->lock);
1142d810298e694 Tejun Heo       2010-05-06  495  =

1142d810298e694 Tejun Heo       2010-05-06  496  	if (work) {
1142d810298e694 Tejun Heo       2010-05-06  497  		cpu_stop_fn_t fn =3D wor=
k->fn;
1142d810298e694 Tejun Heo       2010-05-06  498  		void *arg =3D work->arg;
1142d810298e694 Tejun Heo       2010-05-06  499  		struct cpu_stop_done *do=
ne =3D work->done;
accaf6ea3db6f5f Oleg Nesterov   2015-11-15  500  		int ret;
1142d810298e694 Tejun Heo       2010-05-06  501  =

accaf6ea3db6f5f Oleg Nesterov   2015-11-15  502  		/* cpu stop callbacks mu=
st not sleep, make in_atomic() =3D=3D T */
4ed032c4bc37631 Peter Zijlstra  2020-09-21  503  		stopper->caller =3D work=
->caller;
4ed032c4bc37631 Peter Zijlstra  2020-09-21  504  		stopper->fn =3D fn;
accaf6ea3db6f5f Oleg Nesterov   2015-11-15  505  		preempt_count_inc();
1142d810298e694 Tejun Heo       2010-05-06  506  		ret =3D fn(arg);
dd2e3121e3cb16d Oleg Nesterov   2015-11-15  507  		if (done) {
dd2e3121e3cb16d Oleg Nesterov   2015-11-15  508  			if (ret)
1142d810298e694 Tejun Heo       2010-05-06  509  				done->ret =3D ret;
6fa3b826bcb3309 Oleg Nesterov   2015-11-15  510  			cpu_stop_signal_done(do=
ne);
dd2e3121e3cb16d Oleg Nesterov   2015-11-15  511  		}
accaf6ea3db6f5f Oleg Nesterov   2015-11-15  512  		preempt_count_dec();
4ed032c4bc37631 Peter Zijlstra  2020-09-21 @513  		stopper->fn =3D NULL;
4ed032c4bc37631 Peter Zijlstra  2020-09-21  514  		stopper->caller =3D 0;
1142d810298e694 Tejun Heo       2010-05-06  515  		WARN_ONCE(preempt_count(=
),
d75f773c86a2b8b Sakari Ailus    2019-03-25  516  			  "cpu_stop: %ps(%p) le=
aked preempt count\n", fn, arg);
1142d810298e694 Tejun Heo       2010-05-06  517  		goto repeat;
1142d810298e694 Tejun Heo       2010-05-06  518  	}
14e568e78f6f80c Thomas Gleixner 2013-01-31  519  }
1142d810298e694 Tejun Heo       2010-05-06  520  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8471646032547989785==--

