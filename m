Content-Type: multipart/mixed; boundary="===============5937009397120690151=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 08/16] dept: Apply Dept to seqlock
Date: Fri, 18 Feb 2022 05:09:51 +0800
Message-ID: <202202180552.lmx7qDUR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5937009397120690151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1645095472-26530-9-git-send-email-byungchul.park@lge.com>
References: <1645095472-26530-9-git-send-email-byungchul.park@lge.com>
TO: Byungchul Park <byungchul.park@lge.com>
TO: torvalds(a)linux-foundation.org
CC: damien.lemoal(a)opensource.wdc.com
CC: linux-ide(a)vger.kernel.org
CC: adilger.kernel(a)dilger.ca
CC: linux-ext4(a)vger.kernel.org
CC: mingo(a)redhat.com
CC: linux-kernel(a)vger.kernel.org
CC: peterz(a)infradead.org
CC: will(a)kernel.org
CC: tglx(a)linutronix.de
CC: rostedt(a)goodmis.org
CC: joel(a)joelfernandes.org
CC: sashal(a)kernel.org
CC: daniel.vetter(a)ffwll.ch
CC: chris(a)chris-wilson.co.uk
CC: duyuyang(a)gmail.com
CC: johannes.berg(a)intel.com
CC: tj(a)kernel.org
CC: tytso(a)mit.edu
CC: willy(a)infradead.org
CC: david(a)fromorbit.com
CC: amir73il(a)gmail.com
CC: bfields(a)fieldses.org
CC: gregkh(a)linuxfoundation.org
CC: kernel-team(a)lge.com
CC: linux-mm(a)kvack.org
CC: akpm(a)linux-foundation.org
CC: mhocko(a)kernel.org
CC: minchan(a)kernel.org
CC: hannes(a)cmpxchg.org

Hi Byungchul,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on linux/master linus/master v5.17-rc4]
[cannot apply to tip/locking/core hnaz-mm/master next-20220217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Byungchul-Park/DEPT-Depend=
ency-Tracker/20220217-190040
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 3624ba7=
b5e2acc02b01301ea5fd3534971eb9896
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20218/202202180552.lmx7qDUR-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
kernel/time/timekeeping.c:1322 do_settimeofday64() warn: statement has no e=
ffect 31
kernel/time/timekeeping.c:1370 timekeeping_inject_offset() warn: statement =
has no effect 31
kernel/time/timekeeping.c:1459 change_clocksource() warn: statement has no =
effect 31
kernel/time/timekeeping.c:1652 timekeeping_init() warn: statement has no ef=
fect 31
kernel/time/timekeeping.c:1745 timekeeping_inject_sleeptime64() warn: state=
ment has no effect 31
kernel/time/timekeeping.c:1807 timekeeping_resume() warn: statement has no =
effect 31
kernel/time/timekeeping.c:1877 timekeeping_suspend() warn: statement has no=
 effect 31
kernel/time/timekeeping.c:2197 timekeeping_advance() warn: statement has no=
 effect 31
kernel/time/timekeeping.c:2432 do_adjtimex() warn: statement has no effect =
31
kernel/time/timekeeping.c:2462 hardpps() warn: statement has no effect 31
drivers/dma-buf/dma-resv.c:282 dma_resv_add_shared_fence() warn: statement =
has no effect 31
drivers/dma-buf/dma-resv.c:315 dma_resv_add_excl_fence() warn: statement ha=
s no effect 31
drivers/dma-buf/dma-resv.c:532 dma_resv_copy_fences() warn: statement has n=
o effect 31
kernel/time/tick-common.c:95 tick_periodic() warn: statement has no effect =
31
net/core/gen_estimator.c:96 est_timer() warn: statement has no effect 31

Old smatch warnings:
drivers/dma-buf/dma-resv.c:181 dma_resv_reserve_shared() error: we previous=
ly assumed 'old' could be null (see line 160)

vim +1322 kernel/time/timekeeping.c

8006c24595cab10 Christopher S. Hall 2016-02-22  1286  =

8524070b7982d76 John Stultz         2007-05-08  1287  /**
21f7eca555ad14e pang.xunlei         2014-11-18  1288   * do_settimeofday64 =
- Sets the time of day.
21f7eca555ad14e pang.xunlei         2014-11-18  1289   * @ts:     pointer t=
o the timespec64 variable containing the new time
8524070b7982d76 John Stultz         2007-05-08  1290   *
8524070b7982d76 John Stultz         2007-05-08  1291   * Sets the time of d=
ay to the new time and update NTP and notify hrtimers
8524070b7982d76 John Stultz         2007-05-08  1292   */
21f7eca555ad14e pang.xunlei         2014-11-18  1293  int do_settimeofday64=
(const struct timespec64 *ts)
8524070b7982d76 John Stultz         2007-05-08  1294  {
3fdb14fd1df7032 Thomas Gleixner     2014-07-16  1295  	struct timekeeper *t=
k =3D &tk_core.timekeeper;
21f7eca555ad14e pang.xunlei         2014-11-18  1296  	struct timespec64 ts=
_delta, xt;
92c1d3ed4dc0b8c John Stultz         2011-11-14  1297  	unsigned long flags;
e1d7ba8735551ed Wang YanQing        2015-06-23  1298  	int ret =3D 0;
8524070b7982d76 John Stultz         2007-05-08  1299  =

7a8e61f84786390 Thomas Gleixner     2019-03-23  1300  	if (!timespec64_vali=
d_settod(ts))
8524070b7982d76 John Stultz         2007-05-08  1301  		return -EINVAL;
8524070b7982d76 John Stultz         2007-05-08  1302  =

9a7a71b1d0968fc Thomas Gleixner     2013-02-21  1303  	raw_spin_lock_irqsav=
e(&timekeeper_lock, flags);
3fdb14fd1df7032 Thomas Gleixner     2014-07-16  1304  	write_seqcount_begin=
(&tk_core.seq);
8524070b7982d76 John Stultz         2007-05-08  1305  =

4e250fdde9be505 John Stultz         2012-07-27  1306  	timekeeping_forward_=
now(tk);
8524070b7982d76 John Stultz         2007-05-08  1307  =

4e250fdde9be505 John Stultz         2012-07-27  1308  	xt =3D tk_xtime(tk);
4e8c11b6b3f0b6a Yu Liao             2021-12-13  1309  	ts_delta =3D timespe=
c64_sub(*ts, xt);
1e75fa8be9fb61e John Stultz         2012-07-13  1310  =

e1d7ba8735551ed Wang YanQing        2015-06-23  1311  	if (timespec64_compa=
re(&tk->wall_to_monotonic, &ts_delta) > 0) {
e1d7ba8735551ed Wang YanQing        2015-06-23  1312  		ret =3D -EINVAL;
e1d7ba8735551ed Wang YanQing        2015-06-23  1313  		goto out;
e1d7ba8735551ed Wang YanQing        2015-06-23  1314  	}
e1d7ba8735551ed Wang YanQing        2015-06-23  1315  =

7d489d15ce4be53 John Stultz         2014-07-16  1316  	tk_set_wall_to_mono(=
tk, timespec64_sub(tk->wall_to_monotonic, ts_delta));
9a055117d3d9cb5 Roman Zippel        2008-08-20  1317  =

21f7eca555ad14e pang.xunlei         2014-11-18  1318  	tk_set_xtime(tk, ts);
e1d7ba8735551ed Wang YanQing        2015-06-23  1319  out:
780427f0e113b4c David Vrabel        2013-06-27  1320  	timekeeping_update(t=
k, TK_CLEAR_NTP | TK_MIRROR | TK_CLOCK_WAS_SET);
8524070b7982d76 John Stultz         2007-05-08  1321  =

3fdb14fd1df7032 Thomas Gleixner     2014-07-16 @1322  	write_seqcount_end(&=
tk_core.seq);
9a7a71b1d0968fc Thomas Gleixner     2013-02-21  1323  	raw_spin_unlock_irqr=
estore(&timekeeper_lock, flags);
8524070b7982d76 John Stultz         2007-05-08  1324  =

17a1b8826b451c8 Thomas Gleixner     2021-07-13  1325  	/* Signal hrtimers a=
bout time change */
17a1b8826b451c8 Thomas Gleixner     2021-07-13  1326  	clock_was_set(CLOCK_=
SET_WALL);
8524070b7982d76 John Stultz         2007-05-08  1327  =

2d87a0674bd60d8 Ondrej Mosnacek     2019-04-10  1328  	if (!ret)
2d87a0674bd60d8 Ondrej Mosnacek     2019-04-10  1329  		audit_tk_injoffset(=
ts_delta);
2d87a0674bd60d8 Ondrej Mosnacek     2019-04-10  1330  =

e1d7ba8735551ed Wang YanQing        2015-06-23  1331  	return ret;
8524070b7982d76 John Stultz         2007-05-08  1332  }
21f7eca555ad14e pang.xunlei         2014-11-18  1333  EXPORT_SYMBOL(do_sett=
imeofday64);
8524070b7982d76 John Stultz         2007-05-08  1334  =

c528f7c6c208f1f John Stultz         2011-02-01  1335  /**
c528f7c6c208f1f John Stultz         2011-02-01  1336   * timekeeping_inject=
_offset - Adds or subtracts from the current time.
6e5a91901c2dff3 Alex Shi            2020-11-13  1337   * @ts:		Pointer to t=
he timespec variable containing the offset
c528f7c6c208f1f John Stultz         2011-02-01  1338   *
c528f7c6c208f1f John Stultz         2011-02-01  1339   * Adds or subtracts =
an offset value from the current time.
c528f7c6c208f1f John Stultz         2011-02-01  1340   */
985e695074d3576 Ondrej Mosnacek     2018-07-13  1341  static int timekeepin=
g_inject_offset(const struct timespec64 *ts)
c528f7c6c208f1f John Stultz         2011-02-01  1342  {
3fdb14fd1df7032 Thomas Gleixner     2014-07-16  1343  	struct timekeeper *t=
k =3D &tk_core.timekeeper;
92c1d3ed4dc0b8c John Stultz         2011-11-14  1344  	unsigned long flags;
1572fa03784831b Arnd Bergmann       2017-10-19  1345  	struct timespec64 tm=
p;
4e8b14526ca7fb0 John Stultz         2012-08-08  1346  	int ret =3D 0;
c528f7c6c208f1f John Stultz         2011-02-01  1347  =

1572fa03784831b Arnd Bergmann       2017-10-19  1348  	if (ts->tv_nsec < 0 =
|| ts->tv_nsec >=3D NSEC_PER_SEC)
c528f7c6c208f1f John Stultz         2011-02-01  1349  		return -EINVAL;
c528f7c6c208f1f John Stultz         2011-02-01  1350  =

9a7a71b1d0968fc Thomas Gleixner     2013-02-21  1351  	raw_spin_lock_irqsav=
e(&timekeeper_lock, flags);
3fdb14fd1df7032 Thomas Gleixner     2014-07-16  1352  	write_seqcount_begin=
(&tk_core.seq);
c528f7c6c208f1f John Stultz         2011-02-01  1353  =

4e250fdde9be505 John Stultz         2012-07-27  1354  	timekeeping_forward_=
now(tk);
c528f7c6c208f1f John Stultz         2011-02-01  1355  =

4e8b14526ca7fb0 John Stultz         2012-08-08  1356  	/* Make sure the pro=
posed value is valid */
1572fa03784831b Arnd Bergmann       2017-10-19  1357  	tmp =3D timespec64_a=
dd(tk_xtime(tk), *ts);
1572fa03784831b Arnd Bergmann       2017-10-19  1358  	if (timespec64_compa=
re(&tk->wall_to_monotonic, ts) > 0 ||
7a8e61f84786390 Thomas Gleixner     2019-03-23  1359  	    !timespec64_vali=
d_settod(&tmp)) {
4e8b14526ca7fb0 John Stultz         2012-08-08  1360  		ret =3D -EINVAL;
4e8b14526ca7fb0 John Stultz         2012-08-08  1361  		goto error;
4e8b14526ca7fb0 John Stultz         2012-08-08  1362  	}
1e75fa8be9fb61e John Stultz         2012-07-13  1363  =

1572fa03784831b Arnd Bergmann       2017-10-19  1364  	tk_xtime_add(tk, ts);
1572fa03784831b Arnd Bergmann       2017-10-19  1365  	tk_set_wall_to_mono(=
tk, timespec64_sub(tk->wall_to_monotonic, *ts));
c528f7c6c208f1f John Stultz         2011-02-01  1366  =

4e8b14526ca7fb0 John Stultz         2012-08-08  1367  error: /* even if we =
error out, we forwarded the time, so call update */
780427f0e113b4c David Vrabel        2013-06-27  1368  	timekeeping_update(t=
k, TK_CLEAR_NTP | TK_MIRROR | TK_CLOCK_WAS_SET);
c528f7c6c208f1f John Stultz         2011-02-01  1369  =

3fdb14fd1df7032 Thomas Gleixner     2014-07-16 @1370  	write_seqcount_end(&=
tk_core.seq);
9a7a71b1d0968fc Thomas Gleixner     2013-02-21  1371  	raw_spin_unlock_irqr=
estore(&timekeeper_lock, flags);
c528f7c6c208f1f John Stultz         2011-02-01  1372  =

17a1b8826b451c8 Thomas Gleixner     2021-07-13  1373  	/* Signal hrtimers a=
bout time change */
17a1b8826b451c8 Thomas Gleixner     2021-07-13  1374  	clock_was_set(CLOCK_=
SET_WALL);
c528f7c6c208f1f John Stultz         2011-02-01  1375  =

4e8b14526ca7fb0 John Stultz         2012-08-08  1376  	return ret;
c528f7c6c208f1f John Stultz         2011-02-01  1377  }
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1378  =

e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1379  /*
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1380   * Indicates if there=
 is an offset between the system clock and the hardware
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1381   * clock/persistent c=
lock/rtc.
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1382   */
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1383  int persistent_clock_=
is_local;
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1384  =

e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1385  /*
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1386   * Adjust the time ob=
tained from the CMOS to be UTC time instead of
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1387   * local time.
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1388   *
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1389   * This is ugly, but =
preferable to the alternatives.  Otherwise we
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1390   * would either need =
to write a program to do it in /etc/rc (and risk
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1391   * confusion if the p=
rogram gets run more than once; it would also be
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1392   * hard to make the p=
rogram warp the clock precisely n hours)  or
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1393   * compile in the tim=
ezone information into the kernel.  Bad, bad....
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1394   *
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1395   *						- TYT, 1992-0=
1-01
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1396   *
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1397   * The best thing to =
do is to keep the CMOS clock in universal time (UTC)
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1398   * as real UNIX machi=
nes always do it. This avoids all headaches about
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1399   * daylight saving ti=
mes and warping kernel clocks.
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1400   */
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1401  void timekeeping_warp=
_clock(void)
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1402  {
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1403  	if (sys_tz.tz_minute=
swest !=3D 0) {
1572fa03784831b Arnd Bergmann       2017-10-19  1404  		struct timespec64 a=
djust;
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1405  =

e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1406  		persistent_clock_is=
_local =3D 1;
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1407  		adjust.tv_sec =3D s=
ys_tz.tz_minuteswest * 60;
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1408  		adjust.tv_nsec =3D =
0;
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1409  		timekeeping_inject_=
offset(&adjust);
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1410  	}
e0956dcc4ba74ec Arnd Bergmann       2017-10-19  1411  }
c528f7c6c208f1f John Stultz         2011-02-01  1412  =

199d280c884de44 Alex Shi            2020-11-13  1413  /*
40d9f82750044f8 Stephen Boyd        2016-12-07  1414   * __timekeeping_set_=
tai_offset - Sets the TAI offset from UTC and monotonic
cc244ddae6d4c69 John Stultz         2012-05-03  1415   */
dd5d70e869f960b Fengguang Wu        2013-03-25  1416  static void __timekee=
ping_set_tai_offset(struct timekeeper *tk, s32 tai_offset)
cc244ddae6d4c69 John Stultz         2012-05-03  1417  {
cc244ddae6d4c69 John Stultz         2012-05-03  1418  	tk->tai_offset =3D t=
ai_offset;
04005f6011e3b50 John Stultz         2013-12-10  1419  	tk->offs_tai =3D kti=
me_add(tk->offs_real, ktime_set(tai_offset, 0));
cc244ddae6d4c69 John Stultz         2012-05-03  1420  }
cc244ddae6d4c69 John Stultz         2012-05-03  1421  =

199d280c884de44 Alex Shi            2020-11-13  1422  /*
8524070b7982d76 John Stultz         2007-05-08  1423   * change_clocksource=
 - Swaps clocksources if a new one is available
8524070b7982d76 John Stultz         2007-05-08  1424   *
8524070b7982d76 John Stultz         2007-05-08  1425   * Accumulates curren=
t time interval and initializes new clocksource
8524070b7982d76 John Stultz         2007-05-08  1426   */
75c5158f70c065b Martin Schwidefsky  2009-08-14  1427  static int change_clo=
cksource(void *data)
8524070b7982d76 John Stultz         2007-05-08  1428  {
3fdb14fd1df7032 Thomas Gleixner     2014-07-16  1429  	struct timekeeper *t=
k =3D &tk_core.timekeeper;
d4c7c2880661680 Niklas S=C3=B6derlund    2021-02-11  1430  	struct clocksou=
rce *new, *old =3D NULL;
f695cf94837de53 John Stultz         2012-03-14  1431  	unsigned long flags;
d4c7c2880661680 Niklas S=C3=B6derlund    2021-02-11  1432  	bool change =3D=
 false;
8524070b7982d76 John Stultz         2007-05-08  1433  =

75c5158f70c065b Martin Schwidefsky  2009-08-14  1434  	new =3D (struct cloc=
ksource *) data;
8524070b7982d76 John Stultz         2007-05-08  1435  =

09ac369c825d9d5 Thomas Gleixner     2013-04-25  1436  	/*
09ac369c825d9d5 Thomas Gleixner     2013-04-25  1437  	 * If the cs is in m=
odule, get a module reference. Succeeds
09ac369c825d9d5 Thomas Gleixner     2013-04-25  1438  	 * for built-in code=
 (owner =3D=3D NULL) as well.
09ac369c825d9d5 Thomas Gleixner     2013-04-25  1439  	 */
09ac369c825d9d5 Thomas Gleixner     2013-04-25  1440  	if (try_module_get(n=
ew->owner)) {
d4c7c2880661680 Niklas S=C3=B6derlund    2021-02-11  1441  		if (!new->enab=
le || new->enable(new) =3D=3D 0)
d4c7c2880661680 Niklas S=C3=B6derlund    2021-02-11  1442  			change =3D tr=
ue;
d4c7c2880661680 Niklas S=C3=B6derlund    2021-02-11  1443  		else
09ac369c825d9d5 Thomas Gleixner     2013-04-25  1444  			module_put(new->ow=
ner);
09ac369c825d9d5 Thomas Gleixner     2013-04-25  1445  	}
d4c7c2880661680 Niklas S=C3=B6derlund    2021-02-11  1446  =

d4c7c2880661680 Niklas S=C3=B6derlund    2021-02-11  1447  	raw_spin_lock_i=
rqsave(&timekeeper_lock, flags);
d4c7c2880661680 Niklas S=C3=B6derlund    2021-02-11  1448  	write_seqcount_=
begin(&tk_core.seq);
d4c7c2880661680 Niklas S=C3=B6derlund    2021-02-11  1449  =

d4c7c2880661680 Niklas S=C3=B6derlund    2021-02-11  1450  	timekeeping_for=
ward_now(tk);
d4c7c2880661680 Niklas S=C3=B6derlund    2021-02-11  1451  =

d4c7c2880661680 Niklas S=C3=B6derlund    2021-02-11  1452  	if (change) {
d4c7c2880661680 Niklas S=C3=B6derlund    2021-02-11  1453  		old =3D tk->tk=
r_mono.clock;
d4c7c2880661680 Niklas S=C3=B6derlund    2021-02-11  1454  		tk_setup_inter=
nals(tk, new);
75c5158f70c065b Martin Schwidefsky  2009-08-14  1455  	}
d4c7c2880661680 Niklas S=C3=B6derlund    2021-02-11  1456  =

780427f0e113b4c David Vrabel        2013-06-27  1457  	timekeeping_update(t=
k, TK_CLEAR_NTP | TK_MIRROR | TK_CLOCK_WAS_SET);
f695cf94837de53 John Stultz         2012-03-14  1458  =

3fdb14fd1df7032 Thomas Gleixner     2014-07-16 @1459  	write_seqcount_end(&=
tk_core.seq);
9a7a71b1d0968fc Thomas Gleixner     2013-02-21  1460  	raw_spin_unlock_irqr=
estore(&timekeeper_lock, flags);
f695cf94837de53 John Stultz         2012-03-14  1461  =

d4c7c2880661680 Niklas S=C3=B6derlund    2021-02-11  1462  	if (old) {
d4c7c2880661680 Niklas S=C3=B6derlund    2021-02-11  1463  		if (old->disab=
le)
d4c7c2880661680 Niklas S=C3=B6derlund    2021-02-11  1464  			old->disable(=
old);
d4c7c2880661680 Niklas S=C3=B6derlund    2021-02-11  1465  =

d4c7c2880661680 Niklas S=C3=B6derlund    2021-02-11  1466  		module_put(old=
->owner);
d4c7c2880661680 Niklas S=C3=B6derlund    2021-02-11  1467  	}
d4c7c2880661680 Niklas S=C3=B6derlund    2021-02-11  1468  =

75c5158f70c065b Martin Schwidefsky  2009-08-14  1469  	return 0;
75c5158f70c065b Martin Schwidefsky  2009-08-14  1470  }
4614e6adafa2c5e Magnus Damm         2009-04-21  1471  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5937009397120690151==--

