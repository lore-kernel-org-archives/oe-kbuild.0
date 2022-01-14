Content-Type: multipart/mixed; boundary="===============6268507224307066198=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [vishal-tiering:tiering-0.8 15/44] mm/vmscan.c:4261 kswapd_try_to_sleep() warn: bitwise AND condition is false here
Date: Sat, 15 Jan 2022 00:41:35 +0800
Message-ID: <202201150055.zW9tTTH1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6268507224307066198==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Huang Ying <ying.huang@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vishal/tiering.git =
tiering-0.8
head:   d58c7b0e1a99a2ec17f2910a310835bafc50b4d1
commit: 17a24a354e12d4d4675d78481b358f668d5a6866 [15/44] memory tiering: av=
oid kswap to be keep in failure state for long
:::::: branch date: 2 days ago
:::::: commit date: 10 weeks ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20115/202201150055.zW9tTTH1-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/vmscan.c:4261 kswapd_try_to_sleep() warn: bitwise AND condition is false=
 here

vim +4261 mm/vmscan.c

e716f2eb24defb Mel Gorman      2017-05-03  4183  =

38087d9b036098 Mel Gorman      2016-07-28  4184  static void kswapd_try_to_=
sleep(pg_data_t *pgdat, int alloc_order, int reclaim_order,
97a225e69a1f88 Joonsoo Kim     2020-06-03  4185  				unsigned int highest_z=
oneidx)
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4186  {
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4187  	long remaining =3D 0;
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4188  	DEFINE_WAIT(wait);
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4189  =

f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4190  	if (freezing(current) || =
kthread_should_stop())
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4191  		return;
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4192  =

f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4193  	prepare_to_wait(&pgdat->k=
swapd_wait, &wait, TASK_INTERRUPTIBLE);
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4194  =

333b0a459c0e1b Shantanu Goel   2017-05-03  4195  	/*
333b0a459c0e1b Shantanu Goel   2017-05-03  4196  	 * Try to sleep for a sho=
rt interval. Note that kcompactd will only be
333b0a459c0e1b Shantanu Goel   2017-05-03  4197  	 * woken if it is possibl=
e to sleep for a short interval. This is
333b0a459c0e1b Shantanu Goel   2017-05-03  4198  	 * deliberate on the assu=
mption that if reclaim cannot keep an
333b0a459c0e1b Shantanu Goel   2017-05-03  4199  	 * eligible zone balanced=
 that it's also unlikely that compaction will
333b0a459c0e1b Shantanu Goel   2017-05-03  4200  	 * succeed.
333b0a459c0e1b Shantanu Goel   2017-05-03  4201  	 */
97a225e69a1f88 Joonsoo Kim     2020-06-03  4202  	if (prepare_kswapd_sleep(=
pgdat, reclaim_order, highest_zoneidx)) {
fd901c95388b3b Vlastimil Babka 2016-04-28  4203  		/*
fd901c95388b3b Vlastimil Babka 2016-04-28  4204  		 * Compaction records wh=
at page blocks it recently failed to
fd901c95388b3b Vlastimil Babka 2016-04-28  4205  		 * isolate pages from an=
d skips them in the future scanning.
fd901c95388b3b Vlastimil Babka 2016-04-28  4206  		 * When kswapd is going =
to sleep, it is reasonable to assume
fd901c95388b3b Vlastimil Babka 2016-04-28  4207  		 * that pages and compac=
tion may succeed so reset the cache.
fd901c95388b3b Vlastimil Babka 2016-04-28  4208  		 */
fd901c95388b3b Vlastimil Babka 2016-04-28  4209  		reset_isolation_suitable=
(pgdat);
fd901c95388b3b Vlastimil Babka 2016-04-28  4210  =

fd901c95388b3b Vlastimil Babka 2016-04-28  4211  		/*
fd901c95388b3b Vlastimil Babka 2016-04-28  4212  		 * We have freed the mem=
ory, now we should compact it to make
fd901c95388b3b Vlastimil Babka 2016-04-28  4213  		 * allocation of the req=
uested order possible.
fd901c95388b3b Vlastimil Babka 2016-04-28  4214  		 */
97a225e69a1f88 Joonsoo Kim     2020-06-03  4215  		wakeup_kcompactd(pgdat, =
alloc_order, highest_zoneidx);
fd901c95388b3b Vlastimil Babka 2016-04-28  4216  =

f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4217  		remaining =3D schedule_t=
imeout(HZ/10);
38087d9b036098 Mel Gorman      2016-07-28  4218  =

38087d9b036098 Mel Gorman      2016-07-28  4219  		/*
97a225e69a1f88 Joonsoo Kim     2020-06-03  4220  		 * If woken prematurely =
then reset kswapd_highest_zoneidx and
38087d9b036098 Mel Gorman      2016-07-28  4221  		 * order. The values wil=
l either be from a wakeup request or
38087d9b036098 Mel Gorman      2016-07-28  4222  		 * the previous request =
that slept prematurely.
38087d9b036098 Mel Gorman      2016-07-28  4223  		 */
38087d9b036098 Mel Gorman      2016-07-28  4224  		if (remaining) {
97a225e69a1f88 Joonsoo Kim     2020-06-03  4225  			WRITE_ONCE(pgdat->kswap=
d_highest_zoneidx,
97a225e69a1f88 Joonsoo Kim     2020-06-03  4226  					kswapd_highest_zoneid=
x(pgdat,
97a225e69a1f88 Joonsoo Kim     2020-06-03  4227  							highest_zoneidx));
5644e1fbbfe15a Qian Cai        2020-04-01  4228  =

5644e1fbbfe15a Qian Cai        2020-04-01  4229  			if (READ_ONCE(pgdat->ks=
wapd_order) < reclaim_order)
5644e1fbbfe15a Qian Cai        2020-04-01  4230  				WRITE_ONCE(pgdat->kswa=
pd_order, reclaim_order);
38087d9b036098 Mel Gorman      2016-07-28  4231  		}
38087d9b036098 Mel Gorman      2016-07-28  4232  =

f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4233  		finish_wait(&pgdat->kswa=
pd_wait, &wait);
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4234  		prepare_to_wait(&pgdat->=
kswapd_wait, &wait, TASK_INTERRUPTIBLE);
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4235  	}
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4236  =

f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4237  	/*
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4238  	 * After a short sleep, c=
heck if it was a premature sleep. If not, then
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4239  	 * go fully to sleep unti=
l explicitly woken up.
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4240  	 */
d9f21d426dc606 Mel Gorman      2016-07-28  4241  	if (!remaining &&
97a225e69a1f88 Joonsoo Kim     2020-06-03  4242  	    prepare_kswapd_sleep(=
pgdat, reclaim_order, highest_zoneidx)) {
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4243  		trace_mm_vmscan_kswapd_s=
leep(pgdat->node_id);
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4244  =

f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4245  		/*
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4246  		 * vmstat counters are n=
ot perfectly accurate and the estimated
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4247  		 * value for counters su=
ch as NR_FREE_PAGES can deviate from the
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4248  		 * true value by nr_onli=
ne_cpus * threshold. To avoid the zone
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4249  		 * watermarks being brea=
ched while under pressure, we reduce the
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4250  		 * per-cpu vmstat thresh=
old while kswapd is awake and restore
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4251  		 * them before going bac=
k to sleep.
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4252  		 */
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4253  		set_pgdat_percpu_thresho=
ld(pgdat, calculate_normal_threshold);
1c7e7f6c0703d0 Aaditya Kumar   2012-07-17  4254  =

17a24a354e12d4 Huang Ying      2019-10-29  4255  		if (!kthread_should_stop=
()) {
17a24a354e12d4 Huang Ying      2019-10-29  4256  			/*
17a24a354e12d4 Huang Ying      2019-10-29  4257  			 * In memory tiering mo=
de, try harder to recover from
17a24a354e12d4 Huang Ying      2019-10-29  4258  			 * kswapd failures, bec=
ause direct reclaiming may be
17a24a354e12d4 Huang Ying      2019-10-29  4259  			 * not triggered.
17a24a354e12d4 Huang Ying      2019-10-29  4260  			 */
17a24a354e12d4 Huang Ying      2019-10-29 @4261  			if (sysctl_numa_balanci=
ng_mode & NUMA_BALANCING_MEMORY_TIERING &&
17a24a354e12d4 Huang Ying      2019-10-29  4262  			    node_is_toptier(pgd=
at->node_id) &&
17a24a354e12d4 Huang Ying      2019-10-29  4263  			    pgdat->kswapd_failu=
res >=3D MAX_RECLAIM_RETRIES) {
17a24a354e12d4 Huang Ying      2019-10-29  4264  				remaining =3D schedule=
_timeout(10 * HZ);
17a24a354e12d4 Huang Ying      2019-10-29  4265  				if (!remaining) {
17a24a354e12d4 Huang Ying      2019-10-29  4266  					pgdat->kswapd_highest=
_zoneidx =3D ZONE_MOVABLE;
17a24a354e12d4 Huang Ying      2019-10-29  4267  					pgdat->kswapd_order =
=3D 0;
17a24a354e12d4 Huang Ying      2019-10-29  4268  				}
17a24a354e12d4 Huang Ying      2019-10-29  4269  			} else
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4270  				schedule();
17a24a354e12d4 Huang Ying      2019-10-29  4271  		}
1c7e7f6c0703d0 Aaditya Kumar   2012-07-17  4272  =

f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4273  		set_pgdat_percpu_thresho=
ld(pgdat, calculate_pressure_threshold);
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4274  	} else {
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4275  		if (remaining)
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4276  			count_vm_event(KSWAPD_L=
OW_WMARK_HIT_QUICKLY);
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4277  		else
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4278  			count_vm_event(KSWAPD_H=
IGH_WMARK_HIT_QUICKLY);
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4279  	}
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4280  	finish_wait(&pgdat->kswap=
d_wait, &wait);
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4281  }
f0bc0a60b13f20 KOSAKI Motohiro 2011-01-13  4282  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6268507224307066198==--

