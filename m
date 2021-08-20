Content-Type: multipart/mixed; boundary="===============4083663168571101357=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/trace/trace_osnoise.c:1471:2: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
Date: Sat, 21 Aug 2021 01:11:51 +0800
Message-ID: <202108210145.PRfQcnos-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4083663168571101357==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Bristot de Oliveira <bristot@redhat.com>
CC: "Steven Rostedt (VMware)" <rostedt@goodmis.org>

Hi Daniel,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d992fe5318d8d7af9510b879439a3c7f283da442
commit: 498627b4ac85780b9962ed9b5c5abbefd884ef8e trace/osnoise: Fix return =
value on osnoise_init_hotplug_support
date:   8 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 8 weeks ago
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/trace/trace_osnoise.c:1611:8: warning: snprintf format string req=
uires 2 parameters but only 1 is given. [wrongPrintfScanfArgNum]
    len =3D snprintf(NULL, 0, "%*pbln", cpumask_pr_args(&osnoise_cpumask)) =
+ 1;
          ^
   kernel/trace/trace_osnoise.c:1618:8: warning: snprintf format string req=
uires 2 parameters but only 1 is given. [wrongPrintfScanfArgNum]
    len =3D snprintf(mask_str, len, "%*pbln", cpumask_pr_args(&osnoise_cpum=
ask));
          ^

vim +1471 kernel/trace/trace_osnoise.c

c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1453  =

c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1454  /*
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1455   * start_kthre=
ad - Start a workload tread
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1456   */
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1457  static int sta=
rt_kthread(unsigned int cpu)
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1458  {
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1459  	struct task_s=
truct *kthread;
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1460  	void *main =
=3D osnoise_main;
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1461  	char comm[24];
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1462  =

a955d7eac1779b4 Daniel Bristot de Oliveira 2021-06-22  1463  #ifdef CONFIG_=
TIMERLAT_TRACER
a955d7eac1779b4 Daniel Bristot de Oliveira 2021-06-22  1464  	if (osnoise_d=
ata.timerlat_tracer) {
a955d7eac1779b4 Daniel Bristot de Oliveira 2021-06-22  1465  		snprintf(com=
m, 24, "timerlat/%d", cpu);
a955d7eac1779b4 Daniel Bristot de Oliveira 2021-06-22  1466  		main =3D tim=
erlat_main;
a955d7eac1779b4 Daniel Bristot de Oliveira 2021-06-22  1467  	} else {
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1468  		snprintf(com=
m, 24, "osnoise/%d", cpu);
a955d7eac1779b4 Daniel Bristot de Oliveira 2021-06-22  1469  	}
a955d7eac1779b4 Daniel Bristot de Oliveira 2021-06-22  1470  #else
a955d7eac1779b4 Daniel Bristot de Oliveira 2021-06-22 @1471  	snprintf(comm=
, 24, "osnoise/%d", cpu);
a955d7eac1779b4 Daniel Bristot de Oliveira 2021-06-22  1472  #endif
a955d7eac1779b4 Daniel Bristot de Oliveira 2021-06-22  1473  	kthread =3D k=
thread_create_on_cpu(main, NULL, cpu, comm);
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1474  =

bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1475  	if (IS_ERR(kt=
hread)) {
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1476  		pr_err(BANNE=
R "could not start sampling thread\n");
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1477  		stop_per_cpu=
_kthreads();
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1478  		return -ENOM=
EM;
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1479  	}
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1480  =

bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1481  	per_cpu(per_c=
pu_osnoise_var, cpu).kthread =3D kthread;
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1482  	wake_up_proce=
ss(kthread);
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1483  =

c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1484  	return 0;
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1485  }
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1486  =

c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1487  /*
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1488   * start_per_c=
pu_kthread - Kick off per-cpu osnoise sampling kthreads
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1489   *
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1490   * This starts=
 the kernel thread that will look for osnoise on many
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1491   * cpus.
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1492   */
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1493  static int sta=
rt_per_cpu_kthreads(struct trace_array *tr)
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1494  {
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1495  	struct cpumas=
k *current_mask =3D &save_cpumask;
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1496  	int retval;
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1497  	int cpu;
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1498  =

c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1499  	get_online_cp=
us();
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1500  	/*
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1501  	 * Run only o=
n CPUs in which trace and osnoise are allowed to run.
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1502  	 */
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1503  	cpumask_and(c=
urrent_mask, tr->tracing_cpumask, &osnoise_cpumask);
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1504  	/*
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1505  	 * And the CP=
U is online.
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1506  	 */
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1507  	cpumask_and(c=
urrent_mask, cpu_online_mask, current_mask);
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1508  =

c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1509  	for_each_poss=
ible_cpu(cpu)
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1510  		per_cpu(per_=
cpu_osnoise_var, cpu).kthread =3D NULL;
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1511  =

c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1512  	for_each_cpu(=
cpu, current_mask) {
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1513  		retval =3D s=
tart_kthread(cpu);
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1514  		if (retval) {
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1515  			stop_per_cp=
u_kthreads();
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1516  			return retv=
al;
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1517  		}
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1518  	}
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1519  =

c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1520  	put_online_cp=
us();
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1521  =

c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1522  	return 0;
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1523  }
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1524  =

c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1525  #ifdef CONFIG_=
HOTPLUG_CPU
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1526  static void os=
noise_hotplug_workfn(struct work_struct *dummy)
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1527  {
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1528  	struct trace_=
array *tr =3D osnoise_trace;
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1529  	unsigned int =
cpu =3D smp_processor_id();
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1530  =

c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1531  =

c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1532  	mutex_lock(&t=
race_types_lock);
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1533  =

c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1534  	if (!osnoise_=
busy)
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1535  		goto out_unl=
ock_trace;
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1536  =

c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1537  	mutex_lock(&i=
nterface_lock);
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1538  	get_online_cp=
us();
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1539  =

c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1540  	if (!cpumask_=
test_cpu(cpu, &osnoise_cpumask))
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1541  		goto out_unl=
ock;
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1542  =

c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1543  	if (!cpumask_=
test_cpu(cpu, tr->tracing_cpumask))
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1544  		goto out_unl=
ock;
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1545  =

c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1546  	start_kthread=
(cpu);
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1547  =

c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1548  out_unlock:
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1549  	put_online_cp=
us();
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1550  	mutex_unlock(=
&interface_lock);
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1551  out_unlock_tra=
ce:
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1552  	mutex_unlock(=
&trace_types_lock);
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1553  }
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1554  =

c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1555  static DECLARE=
_WORK(osnoise_hotplug_work, osnoise_hotplug_workfn);
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1556  =

c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1557  /*
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1558   * osnoise_cpu=
_init - CPU hotplug online callback function
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1559   */
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1560  static int osn=
oise_cpu_init(unsigned int cpu)
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1561  {
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1562  	schedule_work=
_on(cpu, &osnoise_hotplug_work);
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1563  	return 0;
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1564  }
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1565  =

c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1566  /*
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1567   * osnoise_cpu=
_die - CPU hotplug offline callback function
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1568   */
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1569  static int osn=
oise_cpu_die(unsigned int cpu)
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1570  {
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1571  	stop_kthread(=
cpu);
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1572  	return 0;
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1573  }
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1574  =

c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1575  static void os=
noise_init_hotplug_support(void)
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1576  {
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1577  	int ret;
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1578  =

c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1579  	ret =3D cpuhp=
_setup_state(CPUHP_AP_ONLINE_DYN, "trace/osnoise:online",
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1580  				osnoise_cp=
u_init, osnoise_cpu_die);
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1581  	if (ret < 0)
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1582  		pr_warn(BANN=
ER "Error to init cpu hotplug support\n");
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1583  =

c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1584  	return;
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1585  }
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1586  #else /* CONFI=
G_HOTPLUG_CPU */
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1587  static void os=
noise_init_hotplug_support(void)
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1588  {
498627b4ac85780 Daniel Bristot de Oliveira 2021-06-28  1589  	return;
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1590  }
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1591  #endif /* CONF=
IG_HOTPLUG_CPU */
c8895e271f7994a Daniel Bristot de Oliveira 2021-06-22  1592  =

bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1593  /*
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1594   * osnoise_cpu=
s_read - Read function for reading the "cpus" file
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1595   * @filp: The =
active open file structure
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1596   * @ubuf: The =
userspace provided buffer to read value into
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1597   * @cnt: The m=
aximum number of bytes to read
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1598   * @ppos: The =
current "file" position
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1599   *
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1600   * Prints the =
"cpus" output into the user-provided buffer.
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1601   */
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1602  static ssize_t
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1603  osnoise_cpus_r=
ead(struct file *filp, char __user *ubuf, size_t count,
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1604  		  loff_t *pp=
os)
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1605  {
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1606  	char *mask_st=
r;
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1607  	int len;
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1608  =

bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1609  	mutex_lock(&i=
nterface_lock);
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1610  =

bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22 @1611  	len =3D snpri=
ntf(NULL, 0, "%*pbl\n", cpumask_pr_args(&osnoise_cpumask)) + 1;
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1612  	mask_str =3D =
kmalloc(len, GFP_KERNEL);
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1613  	if (!mask_str=
) {
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1614  		count =3D -E=
NOMEM;
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1615  		goto out_unl=
ock;
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1616  	}
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1617  =

bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1618  	len =3D snpri=
ntf(mask_str, len, "%*pbl\n", cpumask_pr_args(&osnoise_cpumask));
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1619  	if (len >=3D =
count) {
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1620  		count =3D -E=
INVAL;
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1621  		goto out_fre=
e;
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1622  	}
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1623  =

bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1624  	count =3D sim=
ple_read_from_buffer(ubuf, count, ppos, mask_str, len);
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1625  =

bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1626  out_free:
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1627  	kfree(mask_st=
r);
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1628  out_unlock:
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1629  	mutex_unlock(=
&interface_lock);
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1630  =

bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1631  	return count;
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1632  }
bce29ac9ce0bb0b Daniel Bristot de Oliveira 2021-06-22  1633  =


:::::: The code at line 1471 was first introduced by commit
:::::: a955d7eac1779b437ceb24fc352026a2cbcec140 trace: Add timerlat tracer

:::::: TO: Daniel Bristot de Oliveira <bristot@redhat.com>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4083663168571101357==--

