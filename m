Content-Type: multipart/mixed; boundary="===============6801288688830611371=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jlelli:fixes/rt-double_enqueue 1/1] kernel/sched/core.c:7107:34: warning: Uninitialized variable: new_effective_prio [uninitvar]
Date: Mon, 14 Jun 2021 22:00:07 +0800
Message-ID: <202106142153.x68DaoUr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6801288688830611371==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Juri Lelli <juri.lelli@redhat.com>

tree:   https://github.com/jlelli/linux.git fixes/rt-double_enqueue
head:   f06324e1cbda29c75934fd8596ec7048deb9d810
commit: f06324e1cbda29c75934fd8596ec7048deb9d810 [1/1] sched/rt: Fix double=
 enqueue cause by rt_effective_prio
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/sched/core.c:7107:34: warning: Uninitialized variable: new_effect=
ive_prio [uninitvar]
    __setscheduler(rq, p, attr, pi, new_effective_prio);
                                    ^

vim +7107 kernel/sched/core.c

c69e8d9c01db2a kernel/sched.c      David Howells             2008-11-14  68=
76  =

d50dde5a10f305 kernel/sched/core.c Dario Faggioli            2013-11-07  68=
77  static int __sched_setscheduler(struct task_struct *p,
d50dde5a10f305 kernel/sched/core.c Dario Faggioli            2013-11-07  68=
78  				const struct sched_attr *attr,
dbc7f069b93a24 kernel/sched/core.c Peter Zijlstra            2015-06-11  68=
79  				bool user, bool pi)
^1da177e4c3f41 kernel/sched.c      Linus Torvalds            2005-04-16  68=
80  {
383afd0971538b kernel/sched/core.c Steven Rostedt            2014-03-11  68=
81  	int newprio =3D dl_policy(attr->sched_policy) ? MAX_DL_PRIO - 1 :
383afd0971538b kernel/sched/core.c Steven Rostedt            2014-03-11  68=
82  		      MAX_RT_PRIO - 1 - attr->sched_priority;
da0c1e65b51a28 kernel/sched/core.c Kirill Tkhai              2014-08-20  68=
83  	int retval, oldprio, oldpolicy =3D -1, queued, running;
0782e63bc6fe7e kernel/sched/core.c Thomas Gleixner           2015-05-05  68=
84  	int new_effective_prio, policy =3D attr->sched_policy;
83ab0aa0d5623d kernel/sched.c      Thomas Gleixner           2010-02-17  68=
85  	const struct sched_class *prev_class;
565790d28b1e33 kernel/sched/core.c Peter Zijlstra            2020-05-11  68=
86  	struct callback_head *head;
eb58075149b7f0 kernel/sched/core.c Peter Zijlstra            2015-07-31  68=
87  	struct rq_flags rf;
ca94c442535a44 kernel/sched.c      Lennart Poettering        2009-06-15  68=
88  	int reset_on_fork;
7a57f32a4d5c80 kernel/sched/core.c Peter Zijlstra            2017-02-21  68=
89  	int queue_flags =3D DEQUEUE_SAVE | DEQUEUE_MOVE | DEQUEUE_NOCLOCK;
eb58075149b7f0 kernel/sched/core.c Peter Zijlstra            2015-07-31  68=
90  	struct rq *rq;
^1da177e4c3f41 kernel/sched.c      Linus Torvalds            2005-04-16  68=
91  =

896bbb2522587e kernel/sched/core.c Steven Rostedt (VMware    2017-03-09  68=
92) 	/* The pi code expects interrupts enabled */
896bbb2522587e kernel/sched/core.c Steven Rostedt (VMware    2017-03-09  68=
93) 	BUG_ON(pi && in_interrupt());
^1da177e4c3f41 kernel/sched.c      Linus Torvalds            2005-04-16  68=
94  recheck:
d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar               2017-02-01  68=
95  	/* Double check policy once rq lock held: */
ca94c442535a44 kernel/sched.c      Lennart Poettering        2009-06-15  68=
96  	if (policy < 0) {
ca94c442535a44 kernel/sched.c      Lennart Poettering        2009-06-15  68=
97  		reset_on_fork =3D p->sched_reset_on_fork;
^1da177e4c3f41 kernel/sched.c      Linus Torvalds            2005-04-16  68=
98  		policy =3D oldpolicy =3D p->policy;
ca94c442535a44 kernel/sched.c      Lennart Poettering        2009-06-15  68=
99  	} else {
7479f3c9cf67ed kernel/sched/core.c Peter Zijlstra            2014-01-15  69=
00  		reset_on_fork =3D !!(attr->sched_flags & SCHED_FLAG_RESET_ON_FORK);
ca94c442535a44 kernel/sched.c      Lennart Poettering        2009-06-15  69=
01  =

20f9cd2acb1d74 kernel/sched/core.c Henrik Austad             2015-09-09  69=
02  		if (!valid_policy(policy))
^1da177e4c3f41 kernel/sched.c      Linus Torvalds            2005-04-16  69=
03  			return -EINVAL;
ca94c442535a44 kernel/sched.c      Lennart Poettering        2009-06-15  69=
04  	}
ca94c442535a44 kernel/sched.c      Lennart Poettering        2009-06-15  69=
05  =

794a56ebd9a57d kernel/sched/core.c Juri Lelli                2017-12-04  69=
06  	if (attr->sched_flags & ~(SCHED_FLAG_ALL | SCHED_FLAG_SUGOV))
7479f3c9cf67ed kernel/sched/core.c Peter Zijlstra            2014-01-15  69=
07  		return -EINVAL;
7479f3c9cf67ed kernel/sched/core.c Peter Zijlstra            2014-01-15  69=
08  =

^1da177e4c3f41 kernel/sched.c      Linus Torvalds            2005-04-16  69=
09  	/*
^1da177e4c3f41 kernel/sched.c      Linus Torvalds            2005-04-16  69=
10  	 * Valid priorities for SCHED_FIFO and SCHED_RR are
ae18ad281e8259 kernel/sched/core.c Dietmar Eggemann          2021-01-28  69=
11  	 * 1..MAX_RT_PRIO-1, valid priority for SCHED_NORMAL,
dd41f596cda0d7 kernel/sched.c      Ingo Molnar               2007-07-09  69=
12  	 * SCHED_BATCH and SCHED_IDLE is 0.
^1da177e4c3f41 kernel/sched.c      Linus Torvalds            2005-04-16  69=
13  	 */
ae18ad281e8259 kernel/sched/core.c Dietmar Eggemann          2021-01-28  69=
14  	if (attr->sched_priority > MAX_RT_PRIO-1)
^1da177e4c3f41 kernel/sched.c      Linus Torvalds            2005-04-16  69=
15  		return -EINVAL;
aab03e05e8f7e2 kernel/sched/core.c Dario Faggioli            2013-11-28  69=
16  	if ((dl_policy(policy) && !__checkparam_dl(attr)) ||
aab03e05e8f7e2 kernel/sched/core.c Dario Faggioli            2013-11-28  69=
17  	    (rt_policy(policy) !=3D (attr->sched_priority !=3D 0)))
^1da177e4c3f41 kernel/sched.c      Linus Torvalds            2005-04-16  69=
18  		return -EINVAL;
^1da177e4c3f41 kernel/sched.c      Linus Torvalds            2005-04-16  69=
19  =

37e4ab3f0cba13 kernel/sched.c      Olivier Croquette         2005-06-25  69=
20  	/*
37e4ab3f0cba13 kernel/sched.c      Olivier Croquette         2005-06-25  69=
21  	 * Allow unprivileged RT tasks to decrease priority:
37e4ab3f0cba13 kernel/sched.c      Olivier Croquette         2005-06-25  69=
22  	 */
961ccddd59d627 kernel/sched.c      Rusty Russell             2008-06-23  69=
23  	if (user && !capable(CAP_SYS_NICE)) {
d50dde5a10f305 kernel/sched/core.c Dario Faggioli            2013-11-07  69=
24  		if (fair_policy(policy)) {
d0ea026808ad81 kernel/sched/core.c Dongsheng Yang            2014-01-27  69=
25  			if (attr->sched_nice < task_nice(p) &&
eaad45132c564c kernel/sched/core.c Peter Zijlstra            2014-01-16  69=
26  			    !can_nice(p, attr->sched_nice))
d50dde5a10f305 kernel/sched/core.c Dario Faggioli            2013-11-07  69=
27  				return -EPERM;
d50dde5a10f305 kernel/sched/core.c Dario Faggioli            2013-11-07  69=
28  		}
d50dde5a10f305 kernel/sched/core.c Dario Faggioli            2013-11-07  69=
29  =

e05606d3301525 kernel/sched.c      Ingo Molnar               2007-07-09  69=
30  		if (rt_policy(policy)) {
a44702e8858a07 kernel/sched.c      Oleg Nesterov             2010-06-11  69=
31  			unsigned long rlim_rtprio =3D
a44702e8858a07 kernel/sched.c      Oleg Nesterov             2010-06-11  69=
32  					task_rlimit(p, RLIMIT_RTPRIO);
5fe1d75f349740 kernel/sched.c      Oleg Nesterov             2006-09-29  69=
33  =

d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar               2017-02-01  69=
34  			/* Can't set/change the rt policy: */
8dc3e9099e01df kernel/sched.c      Oleg Nesterov             2006-09-29  69=
35  			if (policy !=3D p->policy && !rlim_rtprio)
^1da177e4c3f41 kernel/sched.c      Linus Torvalds            2005-04-16  69=
36  				return -EPERM;
8dc3e9099e01df kernel/sched.c      Oleg Nesterov             2006-09-29  69=
37  =

d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar               2017-02-01  69=
38  			/* Can't increase priority: */
d50dde5a10f305 kernel/sched/core.c Dario Faggioli            2013-11-07  69=
39  			if (attr->sched_priority > p->rt_priority &&
d50dde5a10f305 kernel/sched/core.c Dario Faggioli            2013-11-07  69=
40  			    attr->sched_priority > rlim_rtprio)
^1da177e4c3f41 kernel/sched.c      Linus Torvalds            2005-04-16  69=
41  				return -EPERM;
8dc3e9099e01df kernel/sched.c      Oleg Nesterov             2006-09-29  69=
42  		}
c02aa73b1d18e4 kernel/sched.c      Darren Hart               2011-02-17  69=
43  =

d44753b843e093 kernel/sched/core.c Juri Lelli                2014-03-03  69=
44  		 /*
d44753b843e093 kernel/sched/core.c Juri Lelli                2014-03-03  69=
45  		  * Can't set/change SCHED_DEADLINE policy at all for now
d44753b843e093 kernel/sched/core.c Juri Lelli                2014-03-03  69=
46  		  * (safest behavior); in the future we would like to allow
d44753b843e093 kernel/sched/core.c Juri Lelli                2014-03-03  69=
47  		  * unprivileged DL tasks to increase their relative deadline
d44753b843e093 kernel/sched/core.c Juri Lelli                2014-03-03  69=
48  		  * or reduce their runtime (both ways reducing utilization)
d44753b843e093 kernel/sched/core.c Juri Lelli                2014-03-03  69=
49  		  */
d44753b843e093 kernel/sched/core.c Juri Lelli                2014-03-03  69=
50  		if (dl_policy(policy))
d44753b843e093 kernel/sched/core.c Juri Lelli                2014-03-03  69=
51  			return -EPERM;
d44753b843e093 kernel/sched/core.c Juri Lelli                2014-03-03  69=
52  =

dd41f596cda0d7 kernel/sched.c      Ingo Molnar               2007-07-09  69=
53  		/*
c02aa73b1d18e4 kernel/sched.c      Darren Hart               2011-02-17  69=
54  		 * Treat SCHED_IDLE as nice 20. Only allow a switch to
c02aa73b1d18e4 kernel/sched.c      Darren Hart               2011-02-17  69=
55  		 * SCHED_NORMAL if the RLIMIT_NICE would normally permit it.
dd41f596cda0d7 kernel/sched.c      Ingo Molnar               2007-07-09  69=
56  		 */
1da1843f9f0334 kernel/sched/core.c Viresh Kumar              2018-11-05  69=
57  		if (task_has_idle_policy(p) && !idle_policy(policy)) {
d0ea026808ad81 kernel/sched/core.c Dongsheng Yang            2014-01-27  69=
58  			if (!can_nice(p, task_nice(p)))
dd41f596cda0d7 kernel/sched.c      Ingo Molnar               2007-07-09  69=
59  				return -EPERM;
c02aa73b1d18e4 kernel/sched.c      Darren Hart               2011-02-17  69=
60  		}
8dc3e9099e01df kernel/sched.c      Oleg Nesterov             2006-09-29  69=
61  =

d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar               2017-02-01  69=
62  		/* Can't change other user's priorities: */
c69e8d9c01db2a kernel/sched.c      David Howells             2008-11-14  69=
63  		if (!check_same_owner(p))
37e4ab3f0cba13 kernel/sched.c      Olivier Croquette         2005-06-25  69=
64  			return -EPERM;
ca94c442535a44 kernel/sched.c      Lennart Poettering        2009-06-15  69=
65  =

d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar               2017-02-01  69=
66  		/* Normal users shall not reset the sched_reset_on_fork flag: */
ca94c442535a44 kernel/sched.c      Lennart Poettering        2009-06-15  69=
67  		if (p->sched_reset_on_fork && !reset_on_fork)
ca94c442535a44 kernel/sched.c      Lennart Poettering        2009-06-15  69=
68  			return -EPERM;
37e4ab3f0cba13 kernel/sched.c      Olivier Croquette         2005-06-25  69=
69  	}
^1da177e4c3f41 kernel/sched.c      Linus Torvalds            2005-04-16  69=
70  =

725aad24c3ba96 kernel/sched.c      Jeremy Fitzhardinge       2008-08-03  69=
71  	if (user) {
794a56ebd9a57d kernel/sched/core.c Juri Lelli                2017-12-04  69=
72  		if (attr->sched_flags & SCHED_FLAG_SUGOV)
794a56ebd9a57d kernel/sched/core.c Juri Lelli                2017-12-04  69=
73  			return -EINVAL;
794a56ebd9a57d kernel/sched/core.c Juri Lelli                2017-12-04  69=
74  =

b0ae1981137503 kernel/sched.c      KOSAKI Motohiro           2010-10-15  69=
75  		retval =3D security_task_setscheduler(p);
^1da177e4c3f41 kernel/sched.c      Linus Torvalds            2005-04-16  69=
76  		if (retval)
^1da177e4c3f41 kernel/sched.c      Linus Torvalds            2005-04-16  69=
77  			return retval;
725aad24c3ba96 kernel/sched.c      Jeremy Fitzhardinge       2008-08-03  69=
78  	}
725aad24c3ba96 kernel/sched.c      Jeremy Fitzhardinge       2008-08-03  69=
79  =

a509a7cd797470 kernel/sched/core.c Patrick Bellasi           2019-06-21  69=
80  	/* Update task specific "requested" clamps */
a509a7cd797470 kernel/sched/core.c Patrick Bellasi           2019-06-21  69=
81  	if (attr->sched_flags & SCHED_FLAG_UTIL_CLAMP) {
a509a7cd797470 kernel/sched/core.c Patrick Bellasi           2019-06-21  69=
82  		retval =3D uclamp_validate(p, attr);
a509a7cd797470 kernel/sched/core.c Patrick Bellasi           2019-06-21  69=
83  		if (retval)
a509a7cd797470 kernel/sched/core.c Patrick Bellasi           2019-06-21  69=
84  			return retval;
a509a7cd797470 kernel/sched/core.c Patrick Bellasi           2019-06-21  69=
85  	}
a509a7cd797470 kernel/sched/core.c Patrick Bellasi           2019-06-21  69=
86  =

710da3c8ea7dfb kernel/sched/core.c Juri Lelli                2019-07-19  69=
87  	if (pi)
710da3c8ea7dfb kernel/sched/core.c Juri Lelli                2019-07-19  69=
88  		cpuset_read_lock();
710da3c8ea7dfb kernel/sched/core.c Juri Lelli                2019-07-19  69=
89  =

b29739f902ee76 kernel/sched.c      Ingo Molnar               2006-06-27  69=
90  	/*
d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar               2017-02-01  69=
91  	 * Make sure no PI-waiters arrive (or leave) while we are
b29739f902ee76 kernel/sched.c      Ingo Molnar               2006-06-27  69=
92  	 * changing the priority of the task:
0122ec5b02f766 kernel/sched.c      Peter Zijlstra            2011-04-05  69=
93  	 *
25985edcedea63 kernel/sched.c      Lucas De Marchi           2011-03-30  69=
94  	 * To be able to change p->policy safely, the appropriate
^1da177e4c3f41 kernel/sched.c      Linus Torvalds            2005-04-16  69=
95  	 * runqueue lock must be held.
^1da177e4c3f41 kernel/sched.c      Linus Torvalds            2005-04-16  69=
96  	 */
eb58075149b7f0 kernel/sched/core.c Peter Zijlstra            2015-07-31  69=
97  	rq =3D task_rq_lock(p, &rf);
80f5c1b84baa81 kernel/sched/core.c Peter Zijlstra            2016-10-03  69=
98  	update_rq_clock(rq);
dc61b1d65e353d kernel/sched.c      Peter Zijlstra            2010-06-08  69=
99  =

34f971f6f7988b kernel/sched.c      Peter Zijlstra            2010-09-22  70=
00  	/*
d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar               2017-02-01  70=
01  	 * Changing the policy of the stop threads its a very bad idea:
34f971f6f7988b kernel/sched.c      Peter Zijlstra            2010-09-22  70=
02  	 */
34f971f6f7988b kernel/sched.c      Peter Zijlstra            2010-09-22  70=
03  	if (p =3D=3D rq->stop) {
4b211f2b129dd1 kernel/sched/core.c Mathieu Poirier           2019-07-19  70=
04  		retval =3D -EINVAL;
4b211f2b129dd1 kernel/sched/core.c Mathieu Poirier           2019-07-19  70=
05  		goto unlock;
34f971f6f7988b kernel/sched.c      Peter Zijlstra            2010-09-22  70=
06  	}
34f971f6f7988b kernel/sched.c      Peter Zijlstra            2010-09-22  70=
07  =

a51e91981870d0 kernel/sched.c      Dario Faggioli            2011-03-24  70=
08  	/*
d6b1e9119787fd kernel/sched/core.c Thomas Gleixner           2014-02-07  70=
09  	 * If not changing anything there's no need to proceed further,
d6b1e9119787fd kernel/sched/core.c Thomas Gleixner           2014-02-07  70=
10  	 * but store a possible modification of reset_on_fork.
a51e91981870d0 kernel/sched.c      Dario Faggioli            2011-03-24  70=
11  	 */
d50dde5a10f305 kernel/sched/core.c Dario Faggioli            2013-11-07  70=
12  	if (unlikely(policy =3D=3D p->policy)) {
d0ea026808ad81 kernel/sched/core.c Dongsheng Yang            2014-01-27  70=
13  		if (fair_policy(policy) && attr->sched_nice !=3D task_nice(p))
d50dde5a10f305 kernel/sched/core.c Dario Faggioli            2013-11-07  70=
14  			goto change;
d50dde5a10f305 kernel/sched/core.c Dario Faggioli            2013-11-07  70=
15  		if (rt_policy(policy) && attr->sched_priority !=3D p->rt_priority)
d50dde5a10f305 kernel/sched/core.c Dario Faggioli            2013-11-07  70=
16  			goto change;
75381608e8410a kernel/sched/core.c Wanpeng Li                2014-11-26  70=
17  		if (dl_policy(policy) && dl_param_changed(p, attr))
aab03e05e8f7e2 kernel/sched/core.c Dario Faggioli            2013-11-28  70=
18  			goto change;
a509a7cd797470 kernel/sched/core.c Patrick Bellasi           2019-06-21  70=
19  		if (attr->sched_flags & SCHED_FLAG_UTIL_CLAMP)
a509a7cd797470 kernel/sched/core.c Patrick Bellasi           2019-06-21  70=
20  			goto change;
d50dde5a10f305 kernel/sched/core.c Dario Faggioli            2013-11-07  70=
21  =

d6b1e9119787fd kernel/sched/core.c Thomas Gleixner           2014-02-07  70=
22  		p->sched_reset_on_fork =3D reset_on_fork;
4b211f2b129dd1 kernel/sched/core.c Mathieu Poirier           2019-07-19  70=
23  		retval =3D 0;
4b211f2b129dd1 kernel/sched/core.c Mathieu Poirier           2019-07-19  70=
24  		goto unlock;
a51e91981870d0 kernel/sched.c      Dario Faggioli            2011-03-24  70=
25  	}
d50dde5a10f305 kernel/sched/core.c Dario Faggioli            2013-11-07  70=
26  change:
a51e91981870d0 kernel/sched.c      Dario Faggioli            2011-03-24  70=
27  =

dc61b1d65e353d kernel/sched.c      Peter Zijlstra            2010-06-08  70=
28  	if (user) {
332ac17ef5bfcf kernel/sched/core.c Dario Faggioli            2013-11-07  70=
29  #ifdef CONFIG_RT_GROUP_SCHED
dc61b1d65e353d kernel/sched.c      Peter Zijlstra            2010-06-08  70=
30  		/*
dc61b1d65e353d kernel/sched.c      Peter Zijlstra            2010-06-08  70=
31  		 * Do not allow realtime tasks into groups that have no runtime
dc61b1d65e353d kernel/sched.c      Peter Zijlstra            2010-06-08  70=
32  		 * assigned.
dc61b1d65e353d kernel/sched.c      Peter Zijlstra            2010-06-08  70=
33  		 */
dc61b1d65e353d kernel/sched.c      Peter Zijlstra            2010-06-08  70=
34  		if (rt_bandwidth_enabled() && rt_policy(policy) &&
f44937718ce3b8 kernel/sched.c      Mike Galbraith            2011-01-13  70=
35  				task_group(p)->rt_bandwidth.rt_runtime =3D=3D 0 &&
f44937718ce3b8 kernel/sched.c      Mike Galbraith            2011-01-13  70=
36  				!task_group_is_autogroup(task_group(p))) {
4b211f2b129dd1 kernel/sched/core.c Mathieu Poirier           2019-07-19  70=
37  			retval =3D -EPERM;
4b211f2b129dd1 kernel/sched/core.c Mathieu Poirier           2019-07-19  70=
38  			goto unlock;
dc61b1d65e353d kernel/sched.c      Peter Zijlstra            2010-06-08  70=
39  		}
332ac17ef5bfcf kernel/sched/core.c Dario Faggioli            2013-11-07  70=
40  #endif
332ac17ef5bfcf kernel/sched/core.c Dario Faggioli            2013-11-07  70=
41  #ifdef CONFIG_SMP
794a56ebd9a57d kernel/sched/core.c Juri Lelli                2017-12-04  70=
42  		if (dl_bandwidth_enabled() && dl_policy(policy) &&
794a56ebd9a57d kernel/sched/core.c Juri Lelli                2017-12-04  70=
43  				!(attr->sched_flags & SCHED_FLAG_SUGOV)) {
332ac17ef5bfcf kernel/sched/core.c Dario Faggioli            2013-11-07  70=
44  			cpumask_t *span =3D rq->rd->span;
332ac17ef5bfcf kernel/sched/core.c Dario Faggioli            2013-11-07  70=
45  =

332ac17ef5bfcf kernel/sched/core.c Dario Faggioli            2013-11-07  70=
46  			/*
332ac17ef5bfcf kernel/sched/core.c Dario Faggioli            2013-11-07  70=
47  			 * Don't allow tasks with an affinity mask smaller than
332ac17ef5bfcf kernel/sched/core.c Dario Faggioli            2013-11-07  70=
48  			 * the entire root_domain to become SCHED_DEADLINE. We
332ac17ef5bfcf kernel/sched/core.c Dario Faggioli            2013-11-07  70=
49  			 * will also fail if there's no bandwidth available.
332ac17ef5bfcf kernel/sched/core.c Dario Faggioli            2013-11-07  70=
50  			 */
3bd3706251ee8a kernel/sched/core.c Sebastian Andrzej Siewior 2019-04-23  70=
51  			if (!cpumask_subset(span, p->cpus_ptr) ||
332ac17ef5bfcf kernel/sched/core.c Dario Faggioli            2013-11-07  70=
52  			    rq->rd->dl_bw.bw =3D=3D 0) {
4b211f2b129dd1 kernel/sched/core.c Mathieu Poirier           2019-07-19  70=
53  				retval =3D -EPERM;
4b211f2b129dd1 kernel/sched/core.c Mathieu Poirier           2019-07-19  70=
54  				goto unlock;
332ac17ef5bfcf kernel/sched/core.c Dario Faggioli            2013-11-07  70=
55  			}
dc61b1d65e353d kernel/sched.c      Peter Zijlstra            2010-06-08  70=
56  		}
dc61b1d65e353d kernel/sched.c      Peter Zijlstra            2010-06-08  70=
57  #endif
332ac17ef5bfcf kernel/sched/core.c Dario Faggioli            2013-11-07  70=
58  	}
dc61b1d65e353d kernel/sched.c      Peter Zijlstra            2010-06-08  70=
59  =

d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar               2017-02-01  70=
60  	/* Re-check policy now with rq lock held: */
^1da177e4c3f41 kernel/sched.c      Linus Torvalds            2005-04-16  70=
61  	if (unlikely(oldpolicy !=3D -1 && oldpolicy !=3D p->policy)) {
^1da177e4c3f41 kernel/sched.c      Linus Torvalds            2005-04-16  70=
62  		policy =3D oldpolicy =3D -1;
eb58075149b7f0 kernel/sched/core.c Peter Zijlstra            2015-07-31  70=
63  		task_rq_unlock(rq, p, &rf);
710da3c8ea7dfb kernel/sched/core.c Juri Lelli                2019-07-19  70=
64  		if (pi)
710da3c8ea7dfb kernel/sched/core.c Juri Lelli                2019-07-19  70=
65  			cpuset_read_unlock();
^1da177e4c3f41 kernel/sched.c      Linus Torvalds            2005-04-16  70=
66  		goto recheck;
^1da177e4c3f41 kernel/sched.c      Linus Torvalds            2005-04-16  70=
67  	}
332ac17ef5bfcf kernel/sched/core.c Dario Faggioli            2013-11-07  70=
68  =

332ac17ef5bfcf kernel/sched/core.c Dario Faggioli            2013-11-07  70=
69  	/*
332ac17ef5bfcf kernel/sched/core.c Dario Faggioli            2013-11-07  70=
70  	 * If setscheduling to SCHED_DEADLINE (or changing the parameters
332ac17ef5bfcf kernel/sched/core.c Dario Faggioli            2013-11-07  70=
71  	 * of a SCHED_DEADLINE task) we need to check if enough bandwidth
332ac17ef5bfcf kernel/sched/core.c Dario Faggioli            2013-11-07  70=
72  	 * is available.
332ac17ef5bfcf kernel/sched/core.c Dario Faggioli            2013-11-07  70=
73  	 */
06a76fe08d4daa kernel/sched/core.c Nicolas Pitre             2017-06-21  70=
74  	if ((dl_policy(policy) || dl_task(p)) && sched_dl_overflow(p, policy, =
attr)) {
4b211f2b129dd1 kernel/sched/core.c Mathieu Poirier           2019-07-19  70=
75  		retval =3D -EBUSY;
4b211f2b129dd1 kernel/sched/core.c Mathieu Poirier           2019-07-19  70=
76  		goto unlock;
332ac17ef5bfcf kernel/sched/core.c Dario Faggioli            2013-11-07  70=
77  	}
332ac17ef5bfcf kernel/sched/core.c Dario Faggioli            2013-11-07  70=
78  =

c365c292d05908 kernel/sched/core.c Thomas Gleixner           2014-02-07  70=
79  	p->sched_reset_on_fork =3D reset_on_fork;
c365c292d05908 kernel/sched/core.c Thomas Gleixner           2014-02-07  70=
80  	oldprio =3D p->prio;
c365c292d05908 kernel/sched/core.c Thomas Gleixner           2014-02-07  70=
81  =

dbc7f069b93a24 kernel/sched/core.c Peter Zijlstra            2015-06-11  70=
82  	if (pi) {
f06324e1cbda29 kernel/sched/core.c Juri Lelli                2021-04-23  70=
83  		newprio =3D fair_policy(attr->sched_policy) ?
f06324e1cbda29 kernel/sched/core.c Juri Lelli                2021-04-23  70=
84  			NICE_TO_PRIO(attr->sched_nice) : newprio;
f06324e1cbda29 kernel/sched/core.c Juri Lelli                2021-04-23  70=
85  =

c365c292d05908 kernel/sched/core.c Thomas Gleixner           2014-02-07  70=
86  		/*
0782e63bc6fe7e kernel/sched/core.c Thomas Gleixner           2015-05-05  70=
87  		 * Take priority boosted tasks into account. If the new
0782e63bc6fe7e kernel/sched/core.c Thomas Gleixner           2015-05-05  70=
88  		 * effective priority is unchanged, we just store the new
c365c292d05908 kernel/sched/core.c Thomas Gleixner           2014-02-07  70=
89  		 * normal parameters and do not touch the scheduler class and
c365c292d05908 kernel/sched/core.c Thomas Gleixner           2014-02-07  70=
90  		 * the runqueue. This will be done when the task deboost
c365c292d05908 kernel/sched/core.c Thomas Gleixner           2014-02-07  70=
91  		 * itself.
c365c292d05908 kernel/sched/core.c Thomas Gleixner           2014-02-07  70=
92  		 */
acd58620e415ae kernel/sched/core.c Peter Zijlstra            2017-03-23  70=
93  		new_effective_prio =3D rt_effective_prio(p, newprio);
ff77e468535987 kernel/sched/core.c Peter Zijlstra            2016-01-18  70=
94  		if (new_effective_prio =3D=3D oldprio)
ff77e468535987 kernel/sched/core.c Peter Zijlstra            2016-01-18  70=
95  			queue_flags &=3D ~DEQUEUE_MOVE;
dbc7f069b93a24 kernel/sched/core.c Peter Zijlstra            2015-06-11  70=
96  	}
c365c292d05908 kernel/sched/core.c Thomas Gleixner           2014-02-07  70=
97  =

da0c1e65b51a28 kernel/sched/core.c Kirill Tkhai              2014-08-20  70=
98  	queued =3D task_on_rq_queued(p);
051a1d1afa4720 kernel/sched.c      Dmitry Adamushko          2007-12-18  70=
99  	running =3D task_current(rq, p);
da0c1e65b51a28 kernel/sched/core.c Kirill Tkhai              2014-08-20  71=
00  	if (queued)
ff77e468535987 kernel/sched/core.c Peter Zijlstra            2016-01-18  71=
01  		dequeue_task(rq, p, queue_flags);
83b699ed20f521 kernel/sched.c      Srivatsa Vaddagiri        2007-10-15  71=
02  	if (running)
f3cd1c4ec059c9 kernel/sched/core.c Kirill Tkhai              2014-09-12  71=
03  		put_prev_task(rq, p);
f6b53205e17c8c kernel/sched.c      Dmitry Adamushko          2007-10-15  71=
04  =

83ab0aa0d5623d kernel/sched.c      Thomas Gleixner           2010-02-17  71=
05  	prev_class =3D p->sched_class;
a509a7cd797470 kernel/sched/core.c Patrick Bellasi           2019-06-21  71=
06  =

f06324e1cbda29 kernel/sched/core.c Juri Lelli                2021-04-23 @71=
07  	__setscheduler(rq, p, attr, pi, new_effective_prio);
a509a7cd797470 kernel/sched/core.c Patrick Bellasi           2019-06-21  71=
08  	__setscheduler_uclamp(p, attr);
f6b53205e17c8c kernel/sched.c      Dmitry Adamushko          2007-10-15  71=
09  =

da0c1e65b51a28 kernel/sched/core.c Kirill Tkhai              2014-08-20  71=
10  	if (queued) {
81a44c5441d7f7 kernel/sched/core.c Thomas Gleixner           2014-02-07  71=
11  		/*
81a44c5441d7f7 kernel/sched/core.c Thomas Gleixner           2014-02-07  71=
12  		 * We enqueue to tail when the priority of a task is
81a44c5441d7f7 kernel/sched/core.c Thomas Gleixner           2014-02-07  71=
13  		 * increased (user space view).
81a44c5441d7f7 kernel/sched/core.c Thomas Gleixner           2014-02-07  71=
14  		 */
ff77e468535987 kernel/sched/core.c Peter Zijlstra            2016-01-18  71=
15  		if (oldprio < p->prio)
ff77e468535987 kernel/sched/core.c Peter Zijlstra            2016-01-18  71=
16  			queue_flags |=3D ENQUEUE_HEAD;
1de64443d755f8 kernel/sched/core.c Peter Zijlstra            2015-09-30  71=
17  =

ff77e468535987 kernel/sched/core.c Peter Zijlstra            2016-01-18  71=
18  		enqueue_task(rq, p, queue_flags);
81a44c5441d7f7 kernel/sched/core.c Thomas Gleixner           2014-02-07  71=
19  	}
a399d233078edb kernel/sched/core.c Vincent Guittot           2016-09-12  71=
20  	if (running)
03b7fad167efca kernel/sched/core.c Peter Zijlstra            2019-05-29  71=
21  		set_next_task(rq, p);
cb46984504048d kernel/sched.c      Steven Rostedt            2008-01-25  71=
22  =

da7a735e51f962 kernel/sched.c      Peter Zijlstra            2011-01-17  71=
23  	check_class_changed(rq, p, prev_class, oldprio);
d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar               2017-02-01  71=
24  =

d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar               2017-02-01  71=
25  	/* Avoid rq from going away on us: */
d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar               2017-02-01  71=
26  	preempt_disable();
565790d28b1e33 kernel/sched/core.c Peter Zijlstra            2020-05-11  71=
27  	head =3D splice_balance_callbacks(rq);
eb58075149b7f0 kernel/sched/core.c Peter Zijlstra            2015-07-31  71=
28  	task_rq_unlock(rq, p, &rf);
b29739f902ee76 kernel/sched.c      Ingo Molnar               2006-06-27  71=
29  =

710da3c8ea7dfb kernel/sched/core.c Juri Lelli                2019-07-19  71=
30  	if (pi) {
710da3c8ea7dfb kernel/sched/core.c Juri Lelli                2019-07-19  71=
31  		cpuset_read_unlock();
95e02ca9bb5324 kernel/sched.c      Thomas Gleixner           2006-06-27  71=
32  		rt_mutex_adjust_pi(p);
710da3c8ea7dfb kernel/sched/core.c Juri Lelli                2019-07-19  71=
33  	}
95e02ca9bb5324 kernel/sched.c      Thomas Gleixner           2006-06-27  71=
34  =

d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar               2017-02-01  71=
35  	/* Run balance callbacks after we've adjusted the PI chain: */
565790d28b1e33 kernel/sched/core.c Peter Zijlstra            2020-05-11  71=
36  	balance_callbacks(rq, head);
4c9a4bc89a9cca kernel/sched/core.c Peter Zijlstra            2015-06-11  71=
37  	preempt_enable();
4c9a4bc89a9cca kernel/sched/core.c Peter Zijlstra            2015-06-11  71=
38  =

^1da177e4c3f41 kernel/sched.c      Linus Torvalds            2005-04-16  71=
39  	return 0;
4b211f2b129dd1 kernel/sched/core.c Mathieu Poirier           2019-07-19  71=
40  =

4b211f2b129dd1 kernel/sched/core.c Mathieu Poirier           2019-07-19  71=
41  unlock:
4b211f2b129dd1 kernel/sched/core.c Mathieu Poirier           2019-07-19  71=
42  	task_rq_unlock(rq, p, &rf);
710da3c8ea7dfb kernel/sched/core.c Juri Lelli                2019-07-19  71=
43  	if (pi)
710da3c8ea7dfb kernel/sched/core.c Juri Lelli                2019-07-19  71=
44  		cpuset_read_unlock();
4b211f2b129dd1 kernel/sched/core.c Mathieu Poirier           2019-07-19  71=
45  	return retval;
^1da177e4c3f41 kernel/sched.c      Linus Torvalds            2005-04-16  71=
46  }
961ccddd59d627 kernel/sched.c      Rusty Russell             2008-06-23  71=
47  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6801288688830611371==--

