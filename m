Content-Type: multipart/mixed; boundary="===============0819156599068524142=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:paulmck/linux-rcu/dev.2022.08.03b 68/79] kernel/rcu/rcutorture.c:1194:18-31: duplicated argument to && or ||
Date: Sat, 13 Aug 2022 13:44:24 +0800
Message-ID: <202208131334.n1nRXiCK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0819156599068524142==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: Ammar Faizi <ammarfaizi2@gnuweeb.org>
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dev.20=
22.08.03b
head:   ce1b7858edab35808512996e67c82cac4273381c
commit: 12a0809f363631e425b29958f37327ae09a44d06 [68/79] rcu: Add full-size=
d polling for cond_sync_full()
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: xtensa-randconfig-c032-20220811 (https://download.01.org/0day-ci/ar=
chive/20220813/202208131334.n1nRXiCK-lkp(a)intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> kernel/rcu/rcutorture.c:1194:18-31: duplicated argument to && or ||

vim +1194 kernel/rcu/rcutorture.c

18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney 2020-11-16  1182  =

a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney 2005-10-30  1183  /*
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney 2020-11-16  1184   =
* Determine which grace-period primitives are available.
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney 2005-10-30  1185   =
*/
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney 2020-11-16  1186  s=
tatic void rcu_torture_write_types(void)
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney 2005-10-30  1187  {
12a0809f363631 kernel/rcu/rcutorture.c Paul E. McKenney 2022-08-04  1188  	=
bool gp_cond1 =3D gp_cond, gp_cond_exp1 =3D gp_cond_exp, gp_cond_full1 =3D =
gp_cond_full;
12a0809f363631 kernel/rcu/rcutorture.c Paul E. McKenney 2022-08-04  1189  	=
bool gp_exp1 =3D gp_exp, gp_poll_exp1 =3D gp_poll_exp, gp_poll_exp_full1 =
=3D gp_poll_exp_full;
582a3d589d761b kernel/rcu/rcutorture.c Paul E. McKenney 2022-08-03  1190  	=
bool gp_normal1 =3D gp_normal, gp_poll1 =3D gp_poll, gp_poll_full1 =3D gp_p=
oll_full;
582a3d589d761b kernel/rcu/rcutorture.c Paul E. McKenney 2022-08-03  1191  	=
bool gp_sync1 =3D gp_sync;
dbdf65b1b7f8ec kernel/rcutorture.c     Ingo Molnar      2005-11-13  1192  =

a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney 2014-03-18  1193  	=
/* Initialize synctype[] array.  If none set, take default. */
12a0809f363631 kernel/rcu/rcutorture.c Paul E. McKenney 2022-08-04 @1194  	=
if (!gp_cond1 && !gp_cond_exp1 && !gp_cond_exp1 && !gp_exp1 && !gp_poll_exp=
 &&
12a0809f363631 kernel/rcu/rcutorture.c Paul E. McKenney 2022-08-04  1195  	=
    !gp_poll_exp_full && !gp_normal1 && !gp_poll1 && !gp_poll_full1 && !gp_=
sync1)
12a0809f363631 kernel/rcu/rcutorture.c Paul E. McKenney 2022-08-04  1196  	=
	gp_cond1 =3D gp_cond_exp1 =3D gp_cond_full1 =3D gp_exp1 =3D gp_poll_exp1 =
=3D
12a0809f363631 kernel/rcu/rcutorture.c Paul E. McKenney 2022-08-04  1197  	=
		   gp_poll_exp_full1 =3D gp_normal1 =3D gp_poll1 =3D gp_poll_full1 =3D
12a0809f363631 kernel/rcu/rcutorture.c Paul E. McKenney 2022-08-04  1198  	=
		   gp_sync1 =3D true;
fd56f64b4e3b9c kernel/rcu/rcutorture.c Paul E. McKenney 2020-11-13  1199  	=
if (gp_cond1 && cur_ops->get_gp_state && cur_ops->cond_sync) {
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney 2014-03-18  1200  	=
	synctype[nsynctypes++] =3D RTWS_COND_GET;
db0c1a8aba31ed kernel/rcu/rcutorture.c Paul E. McKenney 2017-12-08  1201  	=
	pr_info("%s: Testing conditional GPs.\n", __func__);
fd56f64b4e3b9c kernel/rcu/rcutorture.c Paul E. McKenney 2020-11-13  1202  	=
} else if (gp_cond && (!cur_ops->get_gp_state || !cur_ops->cond_sync)) {
e0d31a34c6db63 kernel/rcu/rcutorture.c Paul E. McKenney 2017-12-01  1203  	=
	pr_alert("%s: gp_cond without primitives.\n", __func__);
db0c1a8aba31ed kernel/rcu/rcutorture.c Paul E. McKenney 2017-12-08  1204  	}
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney 2022-02-01  1205  	=
if (gp_cond_exp1 && cur_ops->get_gp_state_exp && cur_ops->cond_sync_exp) {
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney 2022-02-01  1206  	=
	synctype[nsynctypes++] =3D RTWS_COND_GET_EXP;
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney 2022-02-01  1207  	=
	pr_info("%s: Testing conditional expedited GPs.\n", __func__);
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney 2022-02-01  1208  	=
} else if (gp_cond_exp && (!cur_ops->get_gp_state_exp || !cur_ops->cond_syn=
c_exp)) {
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney 2022-02-01  1209  	=
	pr_alert("%s: gp_cond_exp without primitives.\n", __func__);
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney 2022-02-01  1210  	}
12a0809f363631 kernel/rcu/rcutorture.c Paul E. McKenney 2022-08-04  1211  	=
if (gp_cond_full1 && cur_ops->get_gp_state && cur_ops->cond_sync_full) {
12a0809f363631 kernel/rcu/rcutorture.c Paul E. McKenney 2022-08-04  1212  	=
	synctype[nsynctypes++] =3D RTWS_COND_GET_FULL;
12a0809f363631 kernel/rcu/rcutorture.c Paul E. McKenney 2022-08-04  1213  	=
	pr_info("%s: Testing conditional full-state GPs.\n", __func__);
12a0809f363631 kernel/rcu/rcutorture.c Paul E. McKenney 2022-08-04  1214  	=
} else if (gp_cond_full && (!cur_ops->get_gp_state || !cur_ops->cond_sync_f=
ull)) {
12a0809f363631 kernel/rcu/rcutorture.c Paul E. McKenney 2022-08-04  1215  	=
	pr_alert("%s: gp_cond_full without primitives.\n", __func__);
12a0809f363631 kernel/rcu/rcutorture.c Paul E. McKenney 2022-08-04  1216  	}
db0c1a8aba31ed kernel/rcu/rcutorture.c Paul E. McKenney 2017-12-08  1217  	=
if (gp_exp1 && cur_ops->exp_sync) {
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney 2014-03-18  1218  	=
	synctype[nsynctypes++] =3D RTWS_EXP_SYNC;
db0c1a8aba31ed kernel/rcu/rcutorture.c Paul E. McKenney 2017-12-08  1219  	=
	pr_info("%s: Testing expedited GPs.\n", __func__);
db0c1a8aba31ed kernel/rcu/rcutorture.c Paul E. McKenney 2017-12-08  1220  	=
} else if (gp_exp && !cur_ops->exp_sync) {
e0d31a34c6db63 kernel/rcu/rcutorture.c Paul E. McKenney 2017-12-01  1221  	=
	pr_alert("%s: gp_exp without primitives.\n", __func__);
db0c1a8aba31ed kernel/rcu/rcutorture.c Paul E. McKenney 2017-12-08  1222  	}
db0c1a8aba31ed kernel/rcu/rcutorture.c Paul E. McKenney 2017-12-08  1223  	=
if (gp_normal1 && cur_ops->deferred_free) {
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney 2014-03-18  1224  	=
	synctype[nsynctypes++] =3D RTWS_DEF_FREE;
db0c1a8aba31ed kernel/rcu/rcutorture.c Paul E. McKenney 2017-12-08  1225  	=
	pr_info("%s: Testing asynchronous GPs.\n", __func__);
db0c1a8aba31ed kernel/rcu/rcutorture.c Paul E. McKenney 2017-12-08  1226  	=
} else if (gp_normal && !cur_ops->deferred_free) {
e0d31a34c6db63 kernel/rcu/rcutorture.c Paul E. McKenney 2017-12-01  1227  	=
	pr_alert("%s: gp_normal without primitives.\n", __func__);
db0c1a8aba31ed kernel/rcu/rcutorture.c Paul E. McKenney 2017-12-08  1228  	}
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney 2020-11-13  1229  	=
if (gp_poll1 && cur_ops->start_gp_poll && cur_ops->poll_gp_state) {
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney 2020-11-13  1230  	=
	synctype[nsynctypes++] =3D RTWS_POLL_GET;
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney 2020-11-13  1231  	=
	pr_info("%s: Testing polling GPs.\n", __func__);
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney 2020-11-13  1232  	=
} else if (gp_poll && (!cur_ops->start_gp_poll || !cur_ops->poll_gp_state))=
 {
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney 2020-11-13  1233  	=
	pr_alert("%s: gp_poll without primitives.\n", __func__);
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney 2020-11-13  1234  	}
1e5cbdf2877d3f kernel/rcu/rcutorture.c Paul E. McKenney 2022-08-02  1235  	=
if (gp_poll_full1 && cur_ops->start_gp_poll_full && cur_ops->poll_gp_state_=
full) {
1e5cbdf2877d3f kernel/rcu/rcutorture.c Paul E. McKenney 2022-08-02  1236  	=
	synctype[nsynctypes++] =3D RTWS_POLL_GET_FULL;
1e5cbdf2877d3f kernel/rcu/rcutorture.c Paul E. McKenney 2022-08-02  1237  	=
	pr_info("%s: Testing polling full-state GPs.\n", __func__);
1e5cbdf2877d3f kernel/rcu/rcutorture.c Paul E. McKenney 2022-08-02  1238  	=
} else if (gp_poll_full && (!cur_ops->start_gp_poll_full || !cur_ops->poll_=
gp_state_full)) {
1e5cbdf2877d3f kernel/rcu/rcutorture.c Paul E. McKenney 2022-08-02  1239  	=
	pr_alert("%s: gp_poll_full without primitives.\n", __func__);
1e5cbdf2877d3f kernel/rcu/rcutorture.c Paul E. McKenney 2022-08-02  1240  	}
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney 2022-02-01  1241  	=
if (gp_poll_exp1 && cur_ops->start_gp_poll_exp && cur_ops->poll_gp_state_ex=
p) {
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney 2022-02-01  1242  	=
	synctype[nsynctypes++] =3D RTWS_POLL_GET_EXP;
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney 2022-02-01  1243  	=
	pr_info("%s: Testing polling expedited GPs.\n", __func__);
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney 2022-02-01  1244  	=
} else if (gp_poll_exp && (!cur_ops->start_gp_poll_exp || !cur_ops->poll_gp=
_state_exp)) {
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney 2022-02-01  1245  	=
	pr_alert("%s: gp_poll_exp without primitives.\n", __func__);
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney 2022-02-01  1246  	}
582a3d589d761b kernel/rcu/rcutorture.c Paul E. McKenney 2022-08-03  1247  	=
if (gp_poll_exp_full1 && cur_ops->start_gp_poll_exp_full && cur_ops->poll_g=
p_state_full) {
582a3d589d761b kernel/rcu/rcutorture.c Paul E. McKenney 2022-08-03  1248  	=
	synctype[nsynctypes++] =3D RTWS_POLL_GET_EXP_FULL;
582a3d589d761b kernel/rcu/rcutorture.c Paul E. McKenney 2022-08-03  1249  	=
	pr_info("%s: Testing polling full-state expedited GPs.\n", __func__);
582a3d589d761b kernel/rcu/rcutorture.c Paul E. McKenney 2022-08-03  1250  	=
} else if (gp_poll_exp_full &&
582a3d589d761b kernel/rcu/rcutorture.c Paul E. McKenney 2022-08-03  1251  	=
	   (!cur_ops->start_gp_poll_exp_full || !cur_ops->poll_gp_state_full)) {
582a3d589d761b kernel/rcu/rcutorture.c Paul E. McKenney 2022-08-03  1252  	=
	pr_alert("%s: gp_poll_exp_full without primitives.\n", __func__);
582a3d589d761b kernel/rcu/rcutorture.c Paul E. McKenney 2022-08-03  1253  	}
db0c1a8aba31ed kernel/rcu/rcutorture.c Paul E. McKenney 2017-12-08  1254  	=
if (gp_sync1 && cur_ops->sync) {
f0bf8fab4f311c kernel/rcu/rcutorture.c Paul E. McKenney 2014-03-21  1255  	=
	synctype[nsynctypes++] =3D RTWS_SYNC;
db0c1a8aba31ed kernel/rcu/rcutorture.c Paul E. McKenney 2017-12-08  1256  	=
	pr_info("%s: Testing normal GPs.\n", __func__);
db0c1a8aba31ed kernel/rcu/rcutorture.c Paul E. McKenney 2017-12-08  1257  	=
} else if (gp_sync && !cur_ops->sync) {
e0d31a34c6db63 kernel/rcu/rcutorture.c Paul E. McKenney 2017-12-01  1258  	=
	pr_alert("%s: gp_sync without primitives.\n", __func__);
db0c1a8aba31ed kernel/rcu/rcutorture.c Paul E. McKenney 2017-12-08  1259  	}
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney 2020-11-16  1260  }
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney 2020-11-16  1261  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0819156599068524142==--

