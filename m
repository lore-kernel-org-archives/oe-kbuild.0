Content-Type: multipart/mixed; boundary="===============1791056075317576802=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH -V11 2/3] NUMA balancing: optimize page placement for memory tiering system
Date: Fri, 28 Jan 2022 23:24:44 +0800
Message-ID: <202201282334.HfXqLBa5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1791056075317576802==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220128082751.593478-3-ying.huang@intel.com>
References: <20220128082751.593478-3-ying.huang@intel.com>
TO: Huang Ying <ying.huang@intel.com>

Hi Huang,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linux/master]
[also build test WARNING on linus/master v5.17-rc1 next-20220128]
[cannot apply to tip/sched/core hnaz-mm/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Huang-Ying/NUMA-balancing-=
optimize-memory-placement-for-memory-tiering-system/20220128-162856
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
2c271fe77d52a0555161926c232cd5bc07178b39
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20128/202201282334.HfXqLBa5-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/vmscan.c:3987 pgdat_balanced() warn: bitwise AND condition is false here

vim +3987 mm/vmscan.c

904d2532d3f5bf3 Huang Ying      2022-01-28  3965  =

e716f2eb24defb3 Mel Gorman      2017-05-03  3966  /*
e716f2eb24defb3 Mel Gorman      2017-05-03  3967   * Returns true if there =
is an eligible zone balanced for the request order
97a225e69a1f880 Joonsoo Kim     2020-06-03  3968   * and highest_zoneidx
e716f2eb24defb3 Mel Gorman      2017-05-03  3969   */
97a225e69a1f880 Joonsoo Kim     2020-06-03  3970  static bool pgdat_balance=
d(pg_data_t *pgdat, int order, int highest_zoneidx)
60cefed485a02bd Johannes Weiner 2012-11-29  3971  {
e716f2eb24defb3 Mel Gorman      2017-05-03  3972  	int i;
e716f2eb24defb3 Mel Gorman      2017-05-03  3973  	unsigned long mark =3D -=
1;
e716f2eb24defb3 Mel Gorman      2017-05-03  3974  	struct zone *zone;
60cefed485a02bd Johannes Weiner 2012-11-29  3975  =

1c30844d2dfe272 Mel Gorman      2018-12-28  3976  	/*
1c30844d2dfe272 Mel Gorman      2018-12-28  3977  	 * Check watermarks bott=
om-up as lower zones are more likely to
1c30844d2dfe272 Mel Gorman      2018-12-28  3978  	 * meet watermarks.
1c30844d2dfe272 Mel Gorman      2018-12-28  3979  	 */
97a225e69a1f880 Joonsoo Kim     2020-06-03  3980  	for (i =3D 0; i <=3D hig=
hest_zoneidx; i++) {
e716f2eb24defb3 Mel Gorman      2017-05-03  3981  		zone =3D pgdat->node_zo=
nes + i;
e716f2eb24defb3 Mel Gorman      2017-05-03  3982  =

e716f2eb24defb3 Mel Gorman      2017-05-03  3983  		if (!managed_zone(zone))
e716f2eb24defb3 Mel Gorman      2017-05-03  3984  			continue;
e716f2eb24defb3 Mel Gorman      2017-05-03  3985  =

e716f2eb24defb3 Mel Gorman      2017-05-03  3986  		mark =3D high_wmark_pag=
es(zone);
904d2532d3f5bf3 Huang Ying      2022-01-28 @3987  		if (sysctl_numa_balanci=
ng_mode & NUMA_BALANCING_MEMORY_TIERING &&
904d2532d3f5bf3 Huang Ying      2022-01-28  3988  		    numa_demotion_enabl=
ed &&
904d2532d3f5bf3 Huang Ying      2022-01-28  3989  		    next_demotion_node(=
pgdat->node_id) !=3D NUMA_NO_NODE) {
904d2532d3f5bf3 Huang Ying      2022-01-28  3990  			unsigned long promote_=
mark;
904d2532d3f5bf3 Huang Ying      2022-01-28  3991  =

904d2532d3f5bf3 Huang Ying      2022-01-28  3992  			promote_mark =3D max(N=
UMA_BALANCING_PROMOTE_WATERMARK_MIN,
904d2532d3f5bf3 Huang Ying      2022-01-28  3993  				mark / NUMA_BALANCING=
_PROMOTE_WATERMARK_DIV);
904d2532d3f5bf3 Huang Ying      2022-01-28  3994  			mark +=3D promote_mark;
904d2532d3f5bf3 Huang Ying      2022-01-28  3995  		}
97a225e69a1f880 Joonsoo Kim     2020-06-03  3996  		if (zone_watermark_ok_s=
afe(zone, order, mark, highest_zoneidx))
e716f2eb24defb3 Mel Gorman      2017-05-03  3997  			return true;
e716f2eb24defb3 Mel Gorman      2017-05-03  3998  	}
6256c6b499a1689 Mel Gorman      2016-07-28  3999  =

e716f2eb24defb3 Mel Gorman      2017-05-03  4000  	/*
97a225e69a1f880 Joonsoo Kim     2020-06-03  4001  	 * If a node has no popu=
lated zone within highest_zoneidx, it does not
e716f2eb24defb3 Mel Gorman      2017-05-03  4002  	 * need balancing by def=
inition. This can happen if a zone-restricted
e716f2eb24defb3 Mel Gorman      2017-05-03  4003  	 * allocation tries to w=
ake a remote kswapd.
e716f2eb24defb3 Mel Gorman      2017-05-03  4004  	 */
e716f2eb24defb3 Mel Gorman      2017-05-03  4005  	if (mark =3D=3D -1)
6256c6b499a1689 Mel Gorman      2016-07-28  4006  		return true;
e716f2eb24defb3 Mel Gorman      2017-05-03  4007  =

e716f2eb24defb3 Mel Gorman      2017-05-03  4008  	return false;
60cefed485a02bd Johannes Weiner 2012-11-29  4009  }
60cefed485a02bd Johannes Weiner 2012-11-29  4010  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1791056075317576802==--

