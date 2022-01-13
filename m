Content-Type: multipart/mixed; boundary="===============5175961431409609871=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [vishal-tiering:tiering-0.8 2/44] mm/vmscan.c:3795 pgdat_balanced() warn: bitwise AND condition is false here
Date: Fri, 14 Jan 2022 06:54:32 +0800
Message-ID: <202201140624.L1Byu6yE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5175961431409609871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Huang Ying <ying.huang@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vishal/tiering.git =
tiering-0.8
head:   d58c7b0e1a99a2ec17f2910a310835bafc50b4d1
commit: d36de4ed8b4e6880e52ab063a39cf00498de4685 [2/44] NUMA balancing: opt=
imize page placement for memory tiering system
:::::: branch date: 28 hours ago
:::::: commit date: 10 weeks ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20114/202201140624.L1Byu6yE-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/vmscan.c:3795 pgdat_balanced() warn: bitwise AND condition is false here

vim +3795 mm/vmscan.c

d36de4ed8b4e68 Huang Ying      2019-06-04  3773  =

e716f2eb24defb Mel Gorman      2017-05-03  3774  /*
e716f2eb24defb Mel Gorman      2017-05-03  3775   * Returns true if there i=
s an eligible zone balanced for the request order
97a225e69a1f88 Joonsoo Kim     2020-06-03  3776   * and highest_zoneidx
e716f2eb24defb Mel Gorman      2017-05-03  3777   */
97a225e69a1f88 Joonsoo Kim     2020-06-03  3778  static bool pgdat_balanced=
(pg_data_t *pgdat, int order, int highest_zoneidx)
60cefed485a02b Johannes Weiner 2012-11-29  3779  {
e716f2eb24defb Mel Gorman      2017-05-03  3780  	int i;
e716f2eb24defb Mel Gorman      2017-05-03  3781  	unsigned long mark =3D -1;
e716f2eb24defb Mel Gorman      2017-05-03  3782  	struct zone *zone;
60cefed485a02b Johannes Weiner 2012-11-29  3783  =

1c30844d2dfe27 Mel Gorman      2018-12-28  3784  	/*
1c30844d2dfe27 Mel Gorman      2018-12-28  3785  	 * Check watermarks botto=
m-up as lower zones are more likely to
1c30844d2dfe27 Mel Gorman      2018-12-28  3786  	 * meet watermarks.
1c30844d2dfe27 Mel Gorman      2018-12-28  3787  	 */
97a225e69a1f88 Joonsoo Kim     2020-06-03  3788  	for (i =3D 0; i <=3D high=
est_zoneidx; i++) {
e716f2eb24defb Mel Gorman      2017-05-03  3789  		zone =3D pgdat->node_zon=
es + i;
e716f2eb24defb Mel Gorman      2017-05-03  3790  =

e716f2eb24defb Mel Gorman      2017-05-03  3791  		if (!managed_zone(zone))
e716f2eb24defb Mel Gorman      2017-05-03  3792  			continue;
e716f2eb24defb Mel Gorman      2017-05-03  3793  =

e716f2eb24defb Mel Gorman      2017-05-03  3794  		mark =3D high_wmark_page=
s(zone);
d36de4ed8b4e68 Huang Ying      2019-06-04 @3795  		if (sysctl_numa_balancin=
g_mode & NUMA_BALANCING_MEMORY_TIERING &&
d36de4ed8b4e68 Huang Ying      2019-06-04  3796  		    numa_demotion_enable=
d &&
d36de4ed8b4e68 Huang Ying      2019-06-04  3797  		    next_demotion_node(p=
gdat->node_id) !=3D NUMA_NO_NODE) {
d36de4ed8b4e68 Huang Ying      2019-06-04  3798  			unsigned long promote_m=
ark;
d36de4ed8b4e68 Huang Ying      2019-06-04  3799  =

d36de4ed8b4e68 Huang Ying      2019-06-04  3800  			promote_mark =3D min(NU=
MA_BALANCING_PROMOTE_WATERMARK,
d36de4ed8b4e68 Huang Ying      2019-06-04  3801  					   pgdat->node_presen=
t_pages >> 6);
d36de4ed8b4e68 Huang Ying      2019-06-04  3802  			mark +=3D promote_mark;
d36de4ed8b4e68 Huang Ying      2019-06-04  3803  		}
97a225e69a1f88 Joonsoo Kim     2020-06-03  3804  		if (zone_watermark_ok_sa=
fe(zone, order, mark, highest_zoneidx))
e716f2eb24defb Mel Gorman      2017-05-03  3805  			return true;
e716f2eb24defb Mel Gorman      2017-05-03  3806  	}
6256c6b499a168 Mel Gorman      2016-07-28  3807  =

e716f2eb24defb Mel Gorman      2017-05-03  3808  	/*
97a225e69a1f88 Joonsoo Kim     2020-06-03  3809  	 * If a node has no popul=
ated zone within highest_zoneidx, it does not
e716f2eb24defb Mel Gorman      2017-05-03  3810  	 * need balancing by defi=
nition. This can happen if a zone-restricted
e716f2eb24defb Mel Gorman      2017-05-03  3811  	 * allocation tries to wa=
ke a remote kswapd.
e716f2eb24defb Mel Gorman      2017-05-03  3812  	 */
e716f2eb24defb Mel Gorman      2017-05-03  3813  	if (mark =3D=3D -1)
6256c6b499a168 Mel Gorman      2016-07-28  3814  		return true;
e716f2eb24defb Mel Gorman      2017-05-03  3815  =

e716f2eb24defb Mel Gorman      2017-05-03  3816  	return false;
60cefed485a02b Johannes Weiner 2012-11-29  3817  }
60cefed485a02b Johannes Weiner 2012-11-29  3818  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5175961431409609871==--

