Content-Type: multipart/mixed; boundary="===============2749409654614306908=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/rcu/rcutorture.c:941 rcu_torture_boost_failed() error: uninitialized symbol 'cpu'.
Date: Tue, 07 Dec 2021 04:33:31 +0800
Message-ID: <202112070433.ZcTtoVRi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2749409654614306908==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0fcfb00b28c0b7884635dacf38e46d60bf3d4eb1
commit: 0260b92e1c39412b1e345e202355c43169c16274 rcutorture: Forgive RCU bo=
ost failures when CPUs don't pass through QS
date:   7 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-m001-20211206 (https://download.01.org/0day-ci/ar=
chive/20211207/202112070433.ZcTtoVRi-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/rcu/rcutorture.c:941 rcu_torture_boost_failed() error: uninitialized=
 symbol 'cpu'.

vim +/cpu +941 kernel/rcu/rcutorture.c

450efca7182a51 Joel Fernandes (Google  2018-06-10  920) =

ea6d962e80b619 Paul E. McKenney        2021-03-30  921  static bool rcu_tor=
ture_boost_failed(unsigned long gp_state, unsigned long start, unsigned lon=
g end)
3b745c8969c752 Joel Fernandes (Google  2018-06-10  922) {
0260b92e1c3941 Paul E. McKenney        2021-04-08  923  	int cpu;
5e59fba573e64c Paul E. McKenney        2021-01-15  924  	static int dbg_don=
e;
bcd4af44e2f173 Paul E. McKenney        2021-04-08  925  	bool gp_done;
0260b92e1c3941 Paul E. McKenney        2021-04-08  926  	unsigned long j;
0260b92e1c3941 Paul E. McKenney        2021-04-08  927  	static unsigned lo=
ng last_persist;
0260b92e1c3941 Paul E. McKenney        2021-04-08  928  	unsigned long lp;
0260b92e1c3941 Paul E. McKenney        2021-04-08  929  	unsigned long mini=
nterval =3D test_boost_duration * HZ - HZ / 2;
5e59fba573e64c Paul E. McKenney        2021-01-15  930  =

0260b92e1c3941 Paul E. McKenney        2021-04-08  931  	if (end - start > =
mininterval) {
7b9dad7abad707 Paul E. McKenney        2021-04-07  932  		// Recheck after =
checking time to avoid false positives.
7b9dad7abad707 Paul E. McKenney        2021-04-07  933  		smp_mb(); // Time=
 check before grace-period check.
7b9dad7abad707 Paul E. McKenney        2021-04-07  934  		if (cur_ops->poll=
_gp_state(gp_state))
7b9dad7abad707 Paul E. McKenney        2021-04-07  935  			return false; //=
 passed, though perhaps just barely
0260b92e1c3941 Paul E. McKenney        2021-04-08  936  		if (cur_ops->chec=
k_boost_failed && !cur_ops->check_boost_failed(gp_state, &cpu)) {
0260b92e1c3941 Paul E. McKenney        2021-04-08  937  			// At most one p=
ersisted message per boost test.
0260b92e1c3941 Paul E. McKenney        2021-04-08  938  			j =3D jiffies;
0260b92e1c3941 Paul E. McKenney        2021-04-08  939  			lp =3D READ_ONCE=
(last_persist);
0260b92e1c3941 Paul E. McKenney        2021-04-08  940  			if (time_after(j=
, lp + mininterval) && cmpxchg(&last_persist, lp, j) =3D=3D lp)
0260b92e1c3941 Paul E. McKenney        2021-04-08 @941  				pr_info("Boost =
inversion persisted: No QS from CPU %d\n", cpu);
0260b92e1c3941 Paul E. McKenney        2021-04-08  942  			return false; //=
 passed on a technicality
0260b92e1c3941 Paul E. McKenney        2021-04-08  943  		}
3b745c8969c752 Joel Fernandes (Google  2018-06-10  944) 		VERBOSE_TOROUT_ST=
RING("rcu_torture_boost boosting failed");
3b745c8969c752 Joel Fernandes (Google  2018-06-10  945) 		n_rcu_torture_boo=
st_failure++;
ea6d962e80b619 Paul E. McKenney        2021-03-30  946  		if (!xchg(&dbg_do=
ne, 1) && cur_ops->gp_kthread_dbg) {
ea6d962e80b619 Paul E. McKenney        2021-03-30  947  			pr_info("Boost i=
nversion thread ->rt_priority %u gp_state %lu jiffies %lu\n",
ea6d962e80b619 Paul E. McKenney        2021-03-30  948  				current->rt_pri=
ority, gp_state, end - start);
5e59fba573e64c Paul E. McKenney        2021-01-15  949  			cur_ops->gp_kthr=
ead_dbg();
bcd4af44e2f173 Paul E. McKenney        2021-04-08  950  			// Recheck after=
 print to flag grace period ending during splat.
bcd4af44e2f173 Paul E. McKenney        2021-04-08  951  			gp_done =3D cur_=
ops->poll_gp_state(gp_state);
bcd4af44e2f173 Paul E. McKenney        2021-04-08  952  			pr_info("Boost i=
nversion: GP %lu %s.\n", gp_state,
bcd4af44e2f173 Paul E. McKenney        2021-04-08  953  				gp_done ? "ende=
d already" : "still pending");
bcd4af44e2f173 Paul E. McKenney        2021-04-08  954  =

ea6d962e80b619 Paul E. McKenney        2021-03-30  955  		}
3b745c8969c752 Joel Fernandes (Google  2018-06-10  956) =

7b9dad7abad707 Paul E. McKenney        2021-04-07  957  		return true; // f=
ailed
3b745c8969c752 Joel Fernandes (Google  2018-06-10  958) 	}
3b745c8969c752 Joel Fernandes (Google  2018-06-10  959) =

7b9dad7abad707 Paul E. McKenney        2021-04-07  960  	return false; // p=
assed
3b745c8969c752 Joel Fernandes (Google  2018-06-10  961) }
3b745c8969c752 Joel Fernandes (Google  2018-06-10  962) =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2749409654614306908==--

