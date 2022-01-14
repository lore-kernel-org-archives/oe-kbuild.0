Content-Type: multipart/mixed; boundary="===============6191993104043685619=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [peterz-queue:sched/wip.umcg 5/5] kernel/sched/core.c:6359 sched_update_worker() warn: bitwise AND condition is false here
Date: Sat, 15 Jan 2022 05:59:12 +0800
Message-ID: <202201150503.URNNEjCJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6191993104043685619==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sc=
hed/wip.umcg
head:   9a7daaca3237a2f71b0bc5f6bcd1252a53caa012
commit: 9a7daaca3237a2f71b0bc5f6bcd1252a53caa012 [5/5] sched: User Mode Con=
curency Groups
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20115/202201150503.URNNEjCJ-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/sched/core.c:6359 sched_update_worker() warn: bitwise AND condition =
is false here
kernel/sched/core.c:6337 sched_submit_work() warn: bitwise AND condition is=
 false here

vim +6359 kernel/sched/core.c

9af6528ee9b682 kernel/sched/core.c Peter Zijlstra            2016-09-13  63=
21  =

9c40cef2b799f9 kernel/sched.c      Thomas Gleixner           2011-06-22  63=
22  static inline void sched_submit_work(struct task_struct *tsk)
9c40cef2b799f9 kernel/sched.c      Thomas Gleixner           2011-06-22  63=
23  {
c1cecf884ad748 kernel/sched/core.c Sebastian Andrzej Siewior 2020-08-19  63=
24  	unsigned int task_flags;
c1cecf884ad748 kernel/sched/core.c Sebastian Andrzej Siewior 2020-08-19  63=
25  =

b03fbd4ff24c5f kernel/sched/core.c Peter Zijlstra            2021-06-11  63=
26  	if (task_is_running(tsk))
9c40cef2b799f9 kernel/sched.c      Thomas Gleixner           2011-06-22  63=
27  		return;
6d25be5782e482 kernel/sched/core.c Thomas Gleixner           2019-03-13  63=
28  =

c1cecf884ad748 kernel/sched/core.c Sebastian Andrzej Siewior 2020-08-19  63=
29  	task_flags =3D tsk->flags;
6d25be5782e482 kernel/sched/core.c Thomas Gleixner           2019-03-13  63=
30  	/*
b945efcdd07d86 kernel/sched/core.c Thomas Gleixner           2021-09-29  63=
31  	 * If a worker goes to sleep, notify and ask workqueue whether it
b945efcdd07d86 kernel/sched/core.c Thomas Gleixner           2021-09-29  63=
32  	 * wants to wake up a task to maintain concurrency.
6d25be5782e482 kernel/sched/core.c Thomas Gleixner           2019-03-13  63=
33  	 */
9a7daaca3237a2 kernel/sched/core.c Peter Zijlstra            2021-12-14  63=
34  	if (task_flags & (PF_WQ_WORKER | PF_IO_WORKER | PF_UMCG_WORKER)) {
c1cecf884ad748 kernel/sched/core.c Sebastian Andrzej Siewior 2020-08-19  63=
35  		if (task_flags & PF_WQ_WORKER)
6d25be5782e482 kernel/sched/core.c Thomas Gleixner           2019-03-13  63=
36  			wq_worker_sleeping(tsk);
9a7daaca3237a2 kernel/sched/core.c Peter Zijlstra            2021-12-14 @63=
37  		else if (task_flags & PF_UMCG_WORKER)
9a7daaca3237a2 kernel/sched/core.c Peter Zijlstra            2021-12-14  63=
38  			umcg_wq_worker_sleeping(tsk);
771b53d033e866 kernel/sched/core.c Jens Axboe                2019-10-22  63=
39  		else
771b53d033e866 kernel/sched/core.c Jens Axboe                2019-10-22  63=
40  			io_wq_worker_sleeping(tsk);
6d25be5782e482 kernel/sched/core.c Thomas Gleixner           2019-03-13  63=
41  	}
6d25be5782e482 kernel/sched/core.c Thomas Gleixner           2019-03-13  63=
42  =

b0fdc01354f45d kernel/sched/core.c Sebastian Andrzej Siewior 2019-08-16  63=
43  	if (tsk_is_pi_blocked(tsk))
b0fdc01354f45d kernel/sched/core.c Sebastian Andrzej Siewior 2019-08-16  63=
44  		return;
b0fdc01354f45d kernel/sched/core.c Sebastian Andrzej Siewior 2019-08-16  63=
45  =

9c40cef2b799f9 kernel/sched.c      Thomas Gleixner           2011-06-22  63=
46  	/*
9c40cef2b799f9 kernel/sched.c      Thomas Gleixner           2011-06-22  63=
47  	 * If we are going to sleep and we have plugged IO queued,
9c40cef2b799f9 kernel/sched.c      Thomas Gleixner           2011-06-22  63=
48  	 * make sure to submit it to avoid deadlocks.
9c40cef2b799f9 kernel/sched.c      Thomas Gleixner           2011-06-22  63=
49  	 */
9c40cef2b799f9 kernel/sched.c      Thomas Gleixner           2011-06-22  63=
50  	if (blk_needs_flush_plug(tsk))
008f75a20e7072 kernel/sched/core.c Christoph Hellwig         2021-10-20  63=
51  		blk_flush_plug(tsk->plug, true);
9c40cef2b799f9 kernel/sched.c      Thomas Gleixner           2011-06-22  63=
52  }
9c40cef2b799f9 kernel/sched.c      Thomas Gleixner           2011-06-22  63=
53  =

6d25be5782e482 kernel/sched/core.c Thomas Gleixner           2019-03-13  63=
54  static void sched_update_worker(struct task_struct *tsk)
6d25be5782e482 kernel/sched/core.c Thomas Gleixner           2019-03-13  63=
55  {
9a7daaca3237a2 kernel/sched/core.c Peter Zijlstra            2021-12-14  63=
56  	if (tsk->flags & (PF_WQ_WORKER | PF_IO_WORKER | PF_UMCG_WORKER)) {
6d25be5782e482 kernel/sched/core.c Thomas Gleixner           2019-03-13  63=
57  		if (tsk->flags & PF_WQ_WORKER)
6d25be5782e482 kernel/sched/core.c Thomas Gleixner           2019-03-13  63=
58  			wq_worker_running(tsk);
9a7daaca3237a2 kernel/sched/core.c Peter Zijlstra            2021-12-14 @63=
59  		else if (tsk->flags & PF_UMCG_WORKER)
9a7daaca3237a2 kernel/sched/core.c Peter Zijlstra            2021-12-14  63=
60  			umcg_wq_worker_running(tsk);
771b53d033e866 kernel/sched/core.c Jens Axboe                2019-10-22  63=
61  		else
771b53d033e866 kernel/sched/core.c Jens Axboe                2019-10-22  63=
62  			io_wq_worker_running(tsk);
771b53d033e866 kernel/sched/core.c Jens Axboe                2019-10-22  63=
63  	}
6d25be5782e482 kernel/sched/core.c Thomas Gleixner           2019-03-13  63=
64  }
6d25be5782e482 kernel/sched/core.c Thomas Gleixner           2019-03-13  63=
65  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6191993104043685619==--

