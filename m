Content-Type: multipart/mixed; boundary="===============2758270245844689648=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH -V2] NUMA balancing: fix NUMA topology for systems with CPU-less nodes
Date: Thu, 10 Feb 2022 00:00:58 +0800
Message-ID: <202202092339.FFRMVjDx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2758270245844689648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220208122322.604285-1-ying.huang@intel.com>
References: <20220208122322.604285-1-ying.huang@intel.com>
TO: Huang Ying <ying.huang@intel.com>

Hi Huang,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on tip/sched/core]
[also build test WARNING on linux/master linus/master v5.17-rc3 next-202202=
09]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Huang-Ying/NUMA-balancing-=
fix-NUMA-topology-for-systems-with-CPU-less-nodes/20220208-212402
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git c8eaf6a=
c76f40f6c59fc7d056e2e08c4a57ea9c7
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: arm64-randconfig-m031-20220209 (https://download.01.org/0day-ci/arc=
hive/20220209/202202092339.FFRMVjDx-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/sched/topology.c:1866 sched_init_numa() warn: possible memory leak o=
f 'masks'

vim +/masks +1866 kernel/sched/topology.c

620a6dc40754dc2 Valentin Schneider    2021-01-22  1785  =

ed82092e5093338 Huang Ying            2022-02-08  1786  void sched_init_num=
a(int offline_node)
f2cb13609d5397c Ingo Molnar           2017-02-01  1787  {
f2cb13609d5397c Ingo Molnar           2017-02-01  1788  	struct sched_domai=
n_topology_level *tl;
620a6dc40754dc2 Valentin Schneider    2021-01-22  1789  	unsigned long *dis=
tance_map;
620a6dc40754dc2 Valentin Schneider    2021-01-22  1790  	int nr_levels =3D =
0;
620a6dc40754dc2 Valentin Schneider    2021-01-22  1791  	int i, j;
ed82092e5093338 Huang Ying            2022-02-08  1792  	int *distances;
ed82092e5093338 Huang Ying            2022-02-08  1793  	struct cpumask ***=
masks;
051f3ca02e46432 Suravee Suthikulpanit 2017-09-07  1794  =

f2cb13609d5397c Ingo Molnar           2017-02-01  1795  	/*
f2cb13609d5397c Ingo Molnar           2017-02-01  1796  	 * O(nr_nodes^2) d=
eduplicating selection sort -- in order to find the
f2cb13609d5397c Ingo Molnar           2017-02-01  1797  	 * unique distance=
s in the node_distance() table.
f2cb13609d5397c Ingo Molnar           2017-02-01  1798  	 */
620a6dc40754dc2 Valentin Schneider    2021-01-22  1799  	distance_map =3D b=
itmap_alloc(NR_DISTANCE_VALUES, GFP_KERNEL);
620a6dc40754dc2 Valentin Schneider    2021-01-22  1800  	if (!distance_map)
620a6dc40754dc2 Valentin Schneider    2021-01-22  1801  		return;
620a6dc40754dc2 Valentin Schneider    2021-01-22  1802  =

620a6dc40754dc2 Valentin Schneider    2021-01-22  1803  	bitmap_zero(distan=
ce_map, NR_DISTANCE_VALUES);
ed82092e5093338 Huang Ying            2022-02-08  1804  	for_each_cpu_node_=
but(i, offline_node) {
ed82092e5093338 Huang Ying            2022-02-08  1805  		for_each_cpu_node=
_but(j, offline_node) {
620a6dc40754dc2 Valentin Schneider    2021-01-22  1806  			int distance =3D=
 node_distance(i, j);
f2cb13609d5397c Ingo Molnar           2017-02-01  1807  =

620a6dc40754dc2 Valentin Schneider    2021-01-22  1808  			if (distance < L=
OCAL_DISTANCE || distance >=3D NR_DISTANCE_VALUES) {
620a6dc40754dc2 Valentin Schneider    2021-01-22  1809  				sched_numa_warn=
("Invalid distance value range");
ed82092e5093338 Huang Ying            2022-02-08  1810  				bitmap_free(dis=
tance_map);
620a6dc40754dc2 Valentin Schneider    2021-01-22  1811  				return;
620a6dc40754dc2 Valentin Schneider    2021-01-22  1812  			}
f2cb13609d5397c Ingo Molnar           2017-02-01  1813  =

620a6dc40754dc2 Valentin Schneider    2021-01-22  1814  			bitmap_set(dista=
nce_map, distance, 1);
620a6dc40754dc2 Valentin Schneider    2021-01-22  1815  		}
620a6dc40754dc2 Valentin Schneider    2021-01-22  1816  	}
f2cb13609d5397c Ingo Molnar           2017-02-01  1817  	/*
620a6dc40754dc2 Valentin Schneider    2021-01-22  1818  	 * We can now figu=
re out how many unique distance values there are and
620a6dc40754dc2 Valentin Schneider    2021-01-22  1819  	 * allocate memory=
 accordingly.
f2cb13609d5397c Ingo Molnar           2017-02-01  1820  	 */
620a6dc40754dc2 Valentin Schneider    2021-01-22  1821  	nr_levels =3D bitm=
ap_weight(distance_map, NR_DISTANCE_VALUES);
f2cb13609d5397c Ingo Molnar           2017-02-01  1822  =

ed82092e5093338 Huang Ying            2022-02-08  1823  	distances =3D kcal=
loc(nr_levels, sizeof(int), GFP_KERNEL);
ed82092e5093338 Huang Ying            2022-02-08  1824  	if (!distances) {
620a6dc40754dc2 Valentin Schneider    2021-01-22  1825  		bitmap_free(dista=
nce_map);
620a6dc40754dc2 Valentin Schneider    2021-01-22  1826  		return;
f2cb13609d5397c Ingo Molnar           2017-02-01  1827  	}
f2cb13609d5397c Ingo Molnar           2017-02-01  1828  =

620a6dc40754dc2 Valentin Schneider    2021-01-22  1829  	for (i =3D 0, j =
=3D 0; i < nr_levels; i++, j++) {
620a6dc40754dc2 Valentin Schneider    2021-01-22  1830  		j =3D find_next_b=
it(distance_map, NR_DISTANCE_VALUES, j);
ed82092e5093338 Huang Ying            2022-02-08  1831  		distances[i] =3D =
j;
f2cb13609d5397c Ingo Molnar           2017-02-01  1832  	}
ed82092e5093338 Huang Ying            2022-02-08  1833  	rcu_assign_pointer=
(sched_domains_numa_distance, distances);
f2cb13609d5397c Ingo Molnar           2017-02-01  1834  =

620a6dc40754dc2 Valentin Schneider    2021-01-22  1835  	bitmap_free(distan=
ce_map);
620a6dc40754dc2 Valentin Schneider    2021-01-22  1836  =

f2cb13609d5397c Ingo Molnar           2017-02-01  1837  	/*
620a6dc40754dc2 Valentin Schneider    2021-01-22  1838  	 * 'nr_levels' con=
tains the number of unique distances
f2cb13609d5397c Ingo Molnar           2017-02-01  1839  	 *
f2cb13609d5397c Ingo Molnar           2017-02-01  1840  	 * The sched_domai=
ns_numa_distance[] array includes the actual distance
f2cb13609d5397c Ingo Molnar           2017-02-01  1841  	 * numbers.
f2cb13609d5397c Ingo Molnar           2017-02-01  1842  	 */
f2cb13609d5397c Ingo Molnar           2017-02-01  1843  =

f2cb13609d5397c Ingo Molnar           2017-02-01  1844  	/*
f2cb13609d5397c Ingo Molnar           2017-02-01  1845  	 * Here, we should=
 temporarily reset sched_domains_numa_levels to 0.
f2cb13609d5397c Ingo Molnar           2017-02-01  1846  	 * If it fails to =
allocate memory for array sched_domains_numa_masks[][],
620a6dc40754dc2 Valentin Schneider    2021-01-22  1847  	 * the array will =
contain less then 'nr_levels' members. This could be
f2cb13609d5397c Ingo Molnar           2017-02-01  1848  	 * dangerous when =
we use it to iterate array sched_domains_numa_masks[][]
f2cb13609d5397c Ingo Molnar           2017-02-01  1849  	 * in other functi=
ons.
f2cb13609d5397c Ingo Molnar           2017-02-01  1850  	 *
620a6dc40754dc2 Valentin Schneider    2021-01-22  1851  	 * We reset it to =
'nr_levels'@the end of this function.
f2cb13609d5397c Ingo Molnar           2017-02-01  1852  	 */
f2cb13609d5397c Ingo Molnar           2017-02-01  1853  	sched_domains_numa=
_levels =3D 0;
f2cb13609d5397c Ingo Molnar           2017-02-01  1854  =

ed82092e5093338 Huang Ying            2022-02-08  1855  	masks =3D kzalloc(=
sizeof(void *) * nr_levels, GFP_KERNEL);
ed82092e5093338 Huang Ying            2022-02-08  1856  	if (!masks)
f2cb13609d5397c Ingo Molnar           2017-02-01  1857  		return;
f2cb13609d5397c Ingo Molnar           2017-02-01  1858  =

f2cb13609d5397c Ingo Molnar           2017-02-01  1859  	/*
f2cb13609d5397c Ingo Molnar           2017-02-01  1860  	 * Now for each le=
vel, construct a mask per node which contains all
f2cb13609d5397c Ingo Molnar           2017-02-01  1861  	 * CPUs of nodes t=
hat are that many hops away from us.
f2cb13609d5397c Ingo Molnar           2017-02-01  1862  	 */
620a6dc40754dc2 Valentin Schneider    2021-01-22  1863  	for (i =3D 0; i < =
nr_levels; i++) {
ed82092e5093338 Huang Ying            2022-02-08  1864  		masks[i] =3D kzal=
loc(nr_node_ids * sizeof(void *), GFP_KERNEL);
ed82092e5093338 Huang Ying            2022-02-08  1865  		if (!masks[i])
f2cb13609d5397c Ingo Molnar           2017-02-01 @1866  			return;
f2cb13609d5397c Ingo Molnar           2017-02-01  1867  =

ed82092e5093338 Huang Ying            2022-02-08  1868  		for_each_cpu_node=
_but(j, offline_node) {
f2cb13609d5397c Ingo Molnar           2017-02-01  1869  			struct cpumask *=
mask =3D kzalloc(cpumask_size(), GFP_KERNEL);
620a6dc40754dc2 Valentin Schneider    2021-01-22  1870  			int k;
620a6dc40754dc2 Valentin Schneider    2021-01-22  1871  =

f2cb13609d5397c Ingo Molnar           2017-02-01  1872  			if (!mask)
f2cb13609d5397c Ingo Molnar           2017-02-01  1873  				return;
f2cb13609d5397c Ingo Molnar           2017-02-01  1874  =

ed82092e5093338 Huang Ying            2022-02-08  1875  			masks[i][j] =3D =
mask;
0083242c93759dd Valentin Schneider    2021-08-18  1876  =

ed82092e5093338 Huang Ying            2022-02-08  1877  			for_each_cpu_nod=
e_but(k, offline_node) {
620a6dc40754dc2 Valentin Schneider    2021-01-22  1878  				if (sched_debug=
() && (node_distance(j, k) !=3D node_distance(k, j)))
620a6dc40754dc2 Valentin Schneider    2021-01-22  1879  					sched_numa_war=
n("Node-distance not symmetric");
620a6dc40754dc2 Valentin Schneider    2021-01-22  1880  =

f2cb13609d5397c Ingo Molnar           2017-02-01  1881  				if (node_distan=
ce(j, k) > sched_domains_numa_distance[i])
f2cb13609d5397c Ingo Molnar           2017-02-01  1882  					continue;
f2cb13609d5397c Ingo Molnar           2017-02-01  1883  =

f2cb13609d5397c Ingo Molnar           2017-02-01  1884  				cpumask_or(mask=
, mask, cpumask_of_node(k));
f2cb13609d5397c Ingo Molnar           2017-02-01  1885  			}
f2cb13609d5397c Ingo Molnar           2017-02-01  1886  		}
f2cb13609d5397c Ingo Molnar           2017-02-01  1887  	}
ed82092e5093338 Huang Ying            2022-02-08  1888  	rcu_assign_pointer=
(sched_domains_numa_masks, masks);
f2cb13609d5397c Ingo Molnar           2017-02-01  1889  =

f2cb13609d5397c Ingo Molnar           2017-02-01  1890  	/* Compute default=
 topology size */
f2cb13609d5397c Ingo Molnar           2017-02-01  1891  	for (i =3D 0; sche=
d_domain_topology[i].mask; i++);
f2cb13609d5397c Ingo Molnar           2017-02-01  1892  =

71e5f6644fb2f33 Dietmar Eggemann      2021-02-01  1893  	tl =3D kzalloc((i =
+ nr_levels + 1) *
f2cb13609d5397c Ingo Molnar           2017-02-01  1894  			sizeof(struct sc=
hed_domain_topology_level), GFP_KERNEL);
f2cb13609d5397c Ingo Molnar           2017-02-01  1895  	if (!tl)
f2cb13609d5397c Ingo Molnar           2017-02-01  1896  		return;
f2cb13609d5397c Ingo Molnar           2017-02-01  1897  =

f2cb13609d5397c Ingo Molnar           2017-02-01  1898  	/*
f2cb13609d5397c Ingo Molnar           2017-02-01  1899  	 * Copy the defaul=
t topology bits..
f2cb13609d5397c Ingo Molnar           2017-02-01  1900  	 */
f2cb13609d5397c Ingo Molnar           2017-02-01  1901  	for (i =3D 0; sche=
d_domain_topology[i].mask; i++)
f2cb13609d5397c Ingo Molnar           2017-02-01  1902  		tl[i] =3D sched_d=
omain_topology[i];
f2cb13609d5397c Ingo Molnar           2017-02-01  1903  =

051f3ca02e46432 Suravee Suthikulpanit 2017-09-07  1904  	/*
051f3ca02e46432 Suravee Suthikulpanit 2017-09-07  1905  	 * Add the NUMA id=
entity distance, aka single NODE.
051f3ca02e46432 Suravee Suthikulpanit 2017-09-07  1906  	 */
051f3ca02e46432 Suravee Suthikulpanit 2017-09-07  1907  	tl[i++] =3D (struc=
t sched_domain_topology_level){
051f3ca02e46432 Suravee Suthikulpanit 2017-09-07  1908  		.mask =3D sd_numa=
_mask,
051f3ca02e46432 Suravee Suthikulpanit 2017-09-07  1909  		.numa_level =3D 0,
051f3ca02e46432 Suravee Suthikulpanit 2017-09-07  1910  		SD_INIT_NAME(NODE)
051f3ca02e46432 Suravee Suthikulpanit 2017-09-07  1911  	};
051f3ca02e46432 Suravee Suthikulpanit 2017-09-07  1912  =

f2cb13609d5397c Ingo Molnar           2017-02-01  1913  	/*
f2cb13609d5397c Ingo Molnar           2017-02-01  1914  	 * .. and append '=
j' levels of NUMA goodness.
f2cb13609d5397c Ingo Molnar           2017-02-01  1915  	 */
620a6dc40754dc2 Valentin Schneider    2021-01-22  1916  	for (j =3D 1; j < =
nr_levels; i++, j++) {
f2cb13609d5397c Ingo Molnar           2017-02-01  1917  		tl[i] =3D (struct=
 sched_domain_topology_level){
f2cb13609d5397c Ingo Molnar           2017-02-01  1918  			.mask =3D sd_num=
a_mask,
f2cb13609d5397c Ingo Molnar           2017-02-01  1919  			.sd_flags =3D cp=
u_numa_flags,
f2cb13609d5397c Ingo Molnar           2017-02-01  1920  			.flags =3D SDTL_=
OVERLAP,
f2cb13609d5397c Ingo Molnar           2017-02-01  1921  			.numa_level =3D =
j,
f2cb13609d5397c Ingo Molnar           2017-02-01  1922  			SD_INIT_NAME(NUM=
A)
f2cb13609d5397c Ingo Molnar           2017-02-01  1923  		};
f2cb13609d5397c Ingo Molnar           2017-02-01  1924  	}
f2cb13609d5397c Ingo Molnar           2017-02-01  1925  =

ed82092e5093338 Huang Ying            2022-02-08  1926  	sched_domain_topol=
ogy_saved =3D sched_domain_topology;
f2cb13609d5397c Ingo Molnar           2017-02-01  1927  	sched_domain_topol=
ogy =3D tl;
f2cb13609d5397c Ingo Molnar           2017-02-01  1928  =

620a6dc40754dc2 Valentin Schneider    2021-01-22  1929  	sched_domains_numa=
_levels =3D nr_levels;
620a6dc40754dc2 Valentin Schneider    2021-01-22  1930  	sched_max_numa_dis=
tance =3D sched_domains_numa_distance[nr_levels - 1];
f2cb13609d5397c Ingo Molnar           2017-02-01  1931  =

ed82092e5093338 Huang Ying            2022-02-08  1932  	init_numa_topology=
_type(offline_node);
0083242c93759dd Valentin Schneider    2021-08-18  1933  }
0083242c93759dd Valentin Schneider    2021-08-18  1934  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============2758270245844689648==--

