Content-Type: multipart/mixed; boundary="===============2063847911454305343=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:paulmck/linux-rcu/dev.2022.05.18a 64/65] kernel/rcu/tasks.h:1514 rcu_tasks_trace_pregp_step() error: uninitialized symbol 'rtpcp'.
Date: Tue, 24 May 2022 23:43:12 +0800
Message-ID: <202205242352.SlyLYuAI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2063847911454305343==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dev.20=
22.05.18a
head:   9735325cf6f7eb6cdcf1ad875b49faa72f288f79
commit: ec0c0f7ea3f62df2f6494b490fe158bcac66a1f1 [64/65] fixup! rcu-tasks: =
Scan per-CPU lists of RCU Tasks Trace blocked tasks
:::::: branch date: 21 hours ago
:::::: commit date: 4 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
524/202205242352.SlyLYuAI-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/rcu/tasks.h:1514 rcu_tasks_trace_pregp_step() error: uninitialized s=
ymbol 'rtpcp'.

vim +/rtpcp +1514 kernel/rcu/tasks.h

b2a7e376a9dcfa Paul E. McKenney 2022-05-18  1469  =

d5f177d35c2442 Paul E. McKenney 2020-03-09  1470  /* Initialize for a new R=
CU-tasks-trace grace period. */
b2a7e376a9dcfa Paul E. McKenney 2022-05-18  1471  static void rcu_tasks_tra=
ce_pregp_step(struct list_head *hop)
d5f177d35c2442 Paul E. McKenney 2020-03-09  1472  {
ec0c0f7ea3f62d Paul E. McKenney 2022-05-20  1473  	LIST_HEAD(blkd_tasks);
d5f177d35c2442 Paul E. McKenney 2020-03-09  1474  	int cpu;
ec0c0f7ea3f62d Paul E. McKenney 2022-05-20  1475  	unsigned long flags;
ec0c0f7ea3f62d Paul E. McKenney 2022-05-20  1476  	struct rcu_tasks_percpu =
*rtpcp;
ec0c0f7ea3f62d Paul E. McKenney 2022-05-20  1477  	struct task_struct *t;
d5f177d35c2442 Paul E. McKenney 2020-03-09  1478  =

d5f177d35c2442 Paul E. McKenney 2020-03-09  1479  	// Allow for fast-acting=
 IPIs.
d5f177d35c2442 Paul E. McKenney 2020-03-09  1480  	atomic_set(&trc_n_reader=
s_need_end, 1);
d5f177d35c2442 Paul E. McKenney 2020-03-09  1481  =

d5f177d35c2442 Paul E. McKenney 2020-03-09  1482  	// There shouldn't be an=
y old IPIs, but...
d5f177d35c2442 Paul E. McKenney 2020-03-09  1483  	for_each_possible_cpu(cp=
u)
d5f177d35c2442 Paul E. McKenney 2020-03-09  1484  		WARN_ON_ONCE(per_cpu(tr=
c_ipi_to_cpu, cpu));
81b4a7bc3b54b0 Paul E. McKenney 2020-03-22  1485  =

81b4a7bc3b54b0 Paul E. McKenney 2020-03-22  1486  	// Disable CPU hotplug a=
cross the tasklist scan.
81b4a7bc3b54b0 Paul E. McKenney 2020-03-22  1487  	// This also waits for a=
ll readers in CPU-hotplug code paths.
81b4a7bc3b54b0 Paul E. McKenney 2020-03-22  1488  	cpus_read_lock();
b2a7e376a9dcfa Paul E. McKenney 2022-05-18  1489  =

b2a7e376a9dcfa Paul E. McKenney 2022-05-18  1490  	// These smp_call_functi=
on_single() calls are serialized to
b2a7e376a9dcfa Paul E. McKenney 2022-05-18  1491  	// allow safe access to =
the hop list.
b2a7e376a9dcfa Paul E. McKenney 2022-05-18  1492  	for_each_possible_cpu(cp=
u)
b2a7e376a9dcfa Paul E. McKenney 2022-05-18  1493  		smp_call_function_singl=
e(cpu, rcu_tasks_trace_pertask_handler, hop, 1);
ec0c0f7ea3f62d Paul E. McKenney 2022-05-20  1494  =

ec0c0f7ea3f62d Paul E. McKenney 2022-05-20  1495  	// Only after all runnin=
g tasks have been accounted for is it
ec0c0f7ea3f62d Paul E. McKenney 2022-05-20  1496  	// safe to take care of =
the tasks that have blocked within their
ec0c0f7ea3f62d Paul E. McKenney 2022-05-20  1497  	// current RCU tasks tra=
ce read-side critical section.
ec0c0f7ea3f62d Paul E. McKenney 2022-05-20  1498  	for_each_possible_cpu(cp=
u) {
ec0c0f7ea3f62d Paul E. McKenney 2022-05-20  1499  		rtpcp =3D per_cpu_ptr(r=
cu_tasks_trace.rtpcpu, cpu);
ec0c0f7ea3f62d Paul E. McKenney 2022-05-20  1500  		raw_spin_lock_irqsave_r=
cu_node(rtpcp, flags);
ec0c0f7ea3f62d Paul E. McKenney 2022-05-20  1501  		list_splice_init(&rtpcp=
->rtp_blkd_tasks, &blkd_tasks);
ec0c0f7ea3f62d Paul E. McKenney 2022-05-20  1502  		while (!list_empty(&blk=
d_tasks)) {
ec0c0f7ea3f62d Paul E. McKenney 2022-05-20  1503  			t =3D list_first_entry=
(&blkd_tasks, struct task_struct, trc_blkd_node);
ec0c0f7ea3f62d Paul E. McKenney 2022-05-20  1504  			list_del_init(&t->trc_=
blkd_node);
ec0c0f7ea3f62d Paul E. McKenney 2022-05-20  1505  			list_add(&t->trc_blkd_=
node, &rtpcp->rtp_blkd_tasks);
ec0c0f7ea3f62d Paul E. McKenney 2022-05-20  1506  			raw_spin_unlock_irqres=
tore_rcu_node(rtpcp, flags);
ec0c0f7ea3f62d Paul E. McKenney 2022-05-20  1507  			rcu_tasks_trace_pertas=
k(t, hop);
ec0c0f7ea3f62d Paul E. McKenney 2022-05-20  1508  			raw_spin_lock_irqsave_=
rcu_node(rtpcp, flags);
ec0c0f7ea3f62d Paul E. McKenney 2022-05-20  1509  		}
ec0c0f7ea3f62d Paul E. McKenney 2022-05-20  1510  		raw_spin_unlock_irqrest=
ore_rcu_node(rtpcp, flags);
ec0c0f7ea3f62d Paul E. McKenney 2022-05-20  1511  	}
ec0c0f7ea3f62d Paul E. McKenney 2022-05-20  1512  	// Pull in the tasks tha=
t blocked on this CPU while in their
ec0c0f7ea3f62d Paul E. McKenney 2022-05-20  1513  	// current RCU tasks tra=
ce read-side critical section.
ec0c0f7ea3f62d Paul E. McKenney 2022-05-20 @1514  	raw_spin_lock_irqsave_rc=
u_node(rtpcp, flags);
ec0c0f7ea3f62d Paul E. McKenney 2022-05-20  1515  	list_for_each_entry(t, &=
rtpcp->rtp_blkd_tasks, trc_blkd_node)
ec0c0f7ea3f62d Paul E. McKenney 2022-05-20  1516  		if (rcu_tasks_trace_per=
task_prep(t))
ec0c0f7ea3f62d Paul E. McKenney 2022-05-20  1517  			trc_add_holdout(t, hop=
);
ec0c0f7ea3f62d Paul E. McKenney 2022-05-20  1518  	raw_spin_unlock_irqresto=
re_rcu_node(rtpcp, flags);
d5f177d35c2442 Paul E. McKenney 2020-03-09  1519  }
d5f177d35c2442 Paul E. McKenney 2020-03-09  1520  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2063847911454305343==--

