Content-Type: multipart/mixed; boundary="===============1106535298345194099=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:paulmck/linux-rcu/dev 80/83] kernel/rcu/srcutree.c:1426 srcu_torture_stats_print() error: buffer overflow 'srcu_size_state_name' 10 <= 10
Date: Wed, 26 Jan 2022 14:27:58 +0800
Message-ID: <202201261439.SqXHa4LN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1106535298345194099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: "GNU/Weeb Mailing List" <gwml@gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dev
head:   1063f4620dd3242633b35487e08e159b803f717b
commit: 6d5d02daa5c0173da1c5430352dca9ab3f4fd8b5 [80/83] srcu: Make rcutort=
ure dump the SRCU size state
:::::: branch date: 11 hours ago
:::::: commit date: 12 hours ago
config: x86_64-randconfig-m001-20220124 (https://download.01.org/0day-ci/ar=
chive/20220126/202201261439.SqXHa4LN-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/rcu/srcutree.c:1426 srcu_torture_stats_print() error: buffer overflo=
w 'srcu_size_state_name' 10 <=3D 10

vim +/srcu_size_state_name +1426 kernel/rcu/srcutree.c

6d5d02daa5c017 Paul E. McKenney 2022-01-24  1414  =

aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1415  void srcu_torture_stats_p=
rint(struct srcu_struct *ssp, char *tt, char *tf)
115a1a5285664f Paul E. McKenney 2017-05-22  1416  {
115a1a5285664f Paul E. McKenney 2017-05-22  1417  	int cpu;
115a1a5285664f Paul E. McKenney 2017-05-22  1418  	int idx;
ac3748c6042660 Paul E. McKenney 2017-05-22  1419  	unsigned long s0 =3D 0, =
s1 =3D 0;
6d5d02daa5c017 Paul E. McKenney 2022-01-24  1420  	int ss_state =3D READ_ON=
CE(ssp->srcu_size_state);
6d5d02daa5c017 Paul E. McKenney 2022-01-24  1421  	int ss_state_idx =3D ss_=
state;
115a1a5285664f Paul E. McKenney 2017-05-22  1422  =

aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1423  	idx =3D ssp->srcu_idx & =
0x1;
6d5d02daa5c017 Paul E. McKenney 2022-01-24  1424  	if (ss_state < 0 || ss_s=
tate >=3D ARRAY_SIZE(srcu_size_state_name))
6d5d02daa5c017 Paul E. McKenney 2022-01-24  1425  		ss_state_idx =3D ARRAY_=
SIZE(srcu_size_state_name);
6d5d02daa5c017 Paul E. McKenney 2022-01-24 @1426  	pr_alert("%s%s Tree SRCU=
 g%ld state %d (%s) per-CPU(idx=3D%d):",
6d5d02daa5c017 Paul E. McKenney 2022-01-24  1427  		 tt, tf, rcu_seq_curren=
t(&ssp->srcu_gp_seq), ss_state,
6d5d02daa5c017 Paul E. McKenney 2022-01-24  1428  		 srcu_size_state_name[s=
s_state_idx], idx);
115a1a5285664f Paul E. McKenney 2017-05-22  1429  	for_each_possible_cpu(cp=
u) {
115a1a5285664f Paul E. McKenney 2017-05-22  1430  		unsigned long l0, l1;
115a1a5285664f Paul E. McKenney 2017-05-22  1431  		unsigned long u0, u1;
115a1a5285664f Paul E. McKenney 2017-05-22  1432  		long c0, c1;
5ab07a8df4d6c9 Paul E. McKenney 2018-05-22  1433  		struct srcu_data *sdp;
115a1a5285664f Paul E. McKenney 2017-05-22  1434  =

aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1435  		sdp =3D per_cpu_ptr(ssp=
->sda, cpu);
b68c6146512d92 Paul E. McKenney 2020-01-03  1436  		u0 =3D data_race(sdp->s=
rcu_unlock_count[!idx]);
b68c6146512d92 Paul E. McKenney 2020-01-03  1437  		u1 =3D data_race(sdp->s=
rcu_unlock_count[idx]);
115a1a5285664f Paul E. McKenney 2017-05-22  1438  =

115a1a5285664f Paul E. McKenney 2017-05-22  1439  		/*
115a1a5285664f Paul E. McKenney 2017-05-22  1440  		 * Make sure that a loc=
k is always counted if the corresponding
115a1a5285664f Paul E. McKenney 2017-05-22  1441  		 * unlock is counted.
115a1a5285664f Paul E. McKenney 2017-05-22  1442  		 */
115a1a5285664f Paul E. McKenney 2017-05-22  1443  		smp_rmb();
115a1a5285664f Paul E. McKenney 2017-05-22  1444  =

b68c6146512d92 Paul E. McKenney 2020-01-03  1445  		l0 =3D data_race(sdp->s=
rcu_lock_count[!idx]);
b68c6146512d92 Paul E. McKenney 2020-01-03  1446  		l1 =3D data_race(sdp->s=
rcu_lock_count[idx]);
115a1a5285664f Paul E. McKenney 2017-05-22  1447  =

115a1a5285664f Paul E. McKenney 2017-05-22  1448  		c0 =3D l0 - u0;
115a1a5285664f Paul E. McKenney 2017-05-22  1449  		c1 =3D l1 - u1;
7e210a653ec944 Paul E. McKenney 2019-06-28  1450  		pr_cont(" %d(%ld,%ld %c=
)",
7e210a653ec944 Paul E. McKenney 2019-06-28  1451  			cpu, c0, c1,
7e210a653ec944 Paul E. McKenney 2019-06-28  1452  			"C."[rcu_segcblist_emp=
ty(&sdp->srcu_cblist)]);
ac3748c6042660 Paul E. McKenney 2017-05-22  1453  		s0 +=3D c0;
ac3748c6042660 Paul E. McKenney 2017-05-22  1454  		s1 +=3D c1;
115a1a5285664f Paul E. McKenney 2017-05-22  1455  	}
ac3748c6042660 Paul E. McKenney 2017-05-22  1456  	pr_cont(" T(%ld,%ld)\n",=
 s0, s1);
e3ec4a4e8733d5 Paul E. McKenney 2022-01-24  1457  	smp_store_release(&ssp->=
srcu_size_state, SRCU_SIZE_ALLOC); // @@@
115a1a5285664f Paul E. McKenney 2017-05-22  1458  }
115a1a5285664f Paul E. McKenney 2017-05-22  1459  EXPORT_SYMBOL_GPL(srcu_to=
rture_stats_print);
115a1a5285664f Paul E. McKenney 2017-05-22  1460  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1106535298345194099==--

