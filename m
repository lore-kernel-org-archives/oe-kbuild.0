Content-Type: multipart/mixed; boundary="===============2855291074528695073=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/memory_hotplug.c:826 default_kernel_zone_for_pfn() warn: we never enter this loop
Date: Mon, 06 Jun 2022 17:43:35 +0800
Message-ID: <202206061742.dEsTx8C8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2855291074528695073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Miaohe Lin <linmiaohe@huawei.com>
CC: David Hildenbrand <david@redhat.com>
CC: Oscar Salvador <osalvador@suse.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f2906aa863381afb0015a9eb7fefad885d4e5a56
commit: d6aad2016a3f902153d7b8b7e02da2c7c50c10a4 mm/memory_hotplug: avoid c=
alling zone_intersects() for ZONE_NORMAL
date:   3 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-m031-20220530 (https://download.01.org/0day-ci/arc=
hive/20220606/202206061742.dEsTx8C8-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/memory_hotplug.c:826 default_kernel_zone_for_pfn() warn: we never enter =
this loop

vim +826 mm/memory_hotplug.c

e83a437faa625e David Hildenbrand 2021-09-07  814  =

c246a213f5bad6 Michal Hocko      2017-07-06  815  /*
c246a213f5bad6 Michal Hocko      2017-07-06  816   * Returns a default kern=
el memory zone for the given pfn range.
c246a213f5bad6 Michal Hocko      2017-07-06  817   * If no kernel zone cove=
rs this pfn range it will automatically go
c246a213f5bad6 Michal Hocko      2017-07-06  818   * to the ZONE_NORMAL.
c246a213f5bad6 Michal Hocko      2017-07-06  819   */
c6f03e2903c9ec Michal Hocko      2017-09-06  820  static struct zone *defau=
lt_kernel_zone_for_pfn(int nid, unsigned long start_pfn,
c246a213f5bad6 Michal Hocko      2017-07-06  821  		unsigned long nr_pages)
c246a213f5bad6 Michal Hocko      2017-07-06  822  {
c246a213f5bad6 Michal Hocko      2017-07-06  823  	struct pglist_data *pgda=
t =3D NODE_DATA(nid);
c246a213f5bad6 Michal Hocko      2017-07-06  824  	int zid;
c246a213f5bad6 Michal Hocko      2017-07-06  825  =

d6aad2016a3f90 Miaohe Lin        2022-03-22 @826  	for (zid =3D 0; zid < ZO=
NE_NORMAL; zid++) {
c246a213f5bad6 Michal Hocko      2017-07-06  827  		struct zone *zone =3D &=
pgdat->node_zones[zid];
c246a213f5bad6 Michal Hocko      2017-07-06  828  =

c246a213f5bad6 Michal Hocko      2017-07-06  829  		if (zone_intersects(zon=
e, start_pfn, nr_pages))
c246a213f5bad6 Michal Hocko      2017-07-06  830  			return zone;
c246a213f5bad6 Michal Hocko      2017-07-06  831  	}
c246a213f5bad6 Michal Hocko      2017-07-06  832  =

c246a213f5bad6 Michal Hocko      2017-07-06  833  	return &pgdat->node_zone=
s[ZONE_NORMAL];
c246a213f5bad6 Michal Hocko      2017-07-06  834  }
c246a213f5bad6 Michal Hocko      2017-07-06  835  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2855291074528695073==--

