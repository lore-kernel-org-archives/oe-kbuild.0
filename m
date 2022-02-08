Content-Type: multipart/mixed; boundary="===============3097781615396580983=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH -V2] NUMA balancing: fix NUMA topology for systems with CPU-less nodes
Date: Wed, 09 Feb 2022 04:36:48 +0800
Message-ID: <202202090432.GKrg4Fan-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3097781615396580983==
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
08]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Huang-Ying/NUMA-balancing-=
fix-NUMA-topology-for-systems-with-CPU-less-nodes/20220208-212402
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git c8eaf6a=
c76f40f6c59fc7d056e2e08c4a57ea9c7
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: arm64-randconfig-s031-20220208 (https://download.01.org/0day-ci/arc=
hive/20220209/202202090432.GKrg4Fan-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/ed82092e509333870d756fc8e=
53d816885922fc4
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Huang-Ying/NUMA-balancing-fix-NUMA=
-topology-for-systems-with-CPU-less-nodes/20220208-212402
        git checkout ed82092e509333870d756fc8e53d816885922fc4
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
rm64 SHELL=3D/bin/bash kernel/sched/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   kernel/sched/topology.c:461:19: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected struct perf_domain *pd @@  =
   got struct perf_domain [noderef] __rcu *pd @@
   kernel/sched/topology.c:461:19: sparse:     expected struct perf_domain =
*pd
   kernel/sched/topology.c:461:19: sparse:     got struct perf_domain [node=
ref] __rcu *pd
   kernel/sched/topology.c:623:49: sparse: sparse: incorrect type in initia=
lizer (different address spaces) @@     expected struct sched_domain *paren=
t @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:623:49: sparse:     expected struct sched_domain=
 *parent
   kernel/sched/topology.c:623:49: sparse:     got struct sched_domain [nod=
eref] __rcu *parent
   kernel/sched/topology.c:694:50: sparse: sparse: incorrect type in initia=
lizer (different address spaces) @@     expected struct sched_domain *paren=
t @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:694:50: sparse:     expected struct sched_domain=
 *parent
   kernel/sched/topology.c:694:50: sparse:     got struct sched_domain [nod=
eref] __rcu *parent
   kernel/sched/topology.c:701:55: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct sched_domain [nodere=
f] __rcu *[noderef] __rcu child @@     got struct sched_domain *[assigned] =
tmp @@
   kernel/sched/topology.c:701:55: sparse:     expected struct sched_domain=
 [noderef] __rcu *[noderef] __rcu child
   kernel/sched/topology.c:701:55: sparse:     got struct sched_domain *[as=
signed] tmp
   kernel/sched/topology.c:711:29: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct sched_domain *[assig=
ned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:711:29: sparse:     expected struct sched_domain=
 *[assigned] tmp
   kernel/sched/topology.c:711:29: sparse:     got struct sched_domain [nod=
eref] __rcu *parent
   kernel/sched/topology.c:716:20: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct sched_domain *sd @@ =
    got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:716:20: sparse:     expected struct sched_domain=
 *sd
   kernel/sched/topology.c:716:20: sparse:     got struct sched_domain [nod=
eref] __rcu *parent
   kernel/sched/topology.c:737:13: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct sched_domain *[assig=
ned] tmp @@     got struct sched_domain [noderef] __rcu *sd @@
   kernel/sched/topology.c:737:13: sparse:     expected struct sched_domain=
 *[assigned] tmp
   kernel/sched/topology.c:737:13: sparse:     got struct sched_domain [nod=
eref] __rcu *sd
   kernel/sched/topology.c:899:70: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected struct sched_domain *sd @@ =
    got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:899:70: sparse:     expected struct sched_domain=
 *sd
   kernel/sched/topology.c:899:70: sparse:     got struct sched_domain [nod=
eref] __rcu *child
   kernel/sched/topology.c:928:59: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected struct sched_domain *sd @@ =
    got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:928:59: sparse:     expected struct sched_domain=
 *sd
   kernel/sched/topology.c:928:59: sparse:     got struct sched_domain [nod=
eref] __rcu *child
   kernel/sched/topology.c:974:57: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected struct sched_domain *sd @@ =
    got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:974:57: sparse:     expected struct sched_domain=
 *sd
   kernel/sched/topology.c:974:57: sparse:     got struct sched_domain [nod=
eref] __rcu *child
   kernel/sched/topology.c:976:25: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct sched_domain *siblin=
g @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:976:25: sparse:     expected struct sched_domain=
 *sibling
   kernel/sched/topology.c:976:25: sparse:     got struct sched_domain [nod=
eref] __rcu *child
   kernel/sched/topology.c:984:55: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected struct sched_domain *sd @@ =
    got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:984:55: sparse:     expected struct sched_domain=
 *sd
   kernel/sched/topology.c:984:55: sparse:     got struct sched_domain [nod=
eref] __rcu *child
   kernel/sched/topology.c:986:25: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct sched_domain *siblin=
g @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:986:25: sparse:     expected struct sched_domain=
 *sibling
   kernel/sched/topology.c:986:25: sparse:     got struct sched_domain [nod=
eref] __rcu *child
   kernel/sched/topology.c:1056:62: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected struct sched_domain *sd @@=
     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1056:62: sparse:     expected struct sched_domai=
n *sd
   kernel/sched/topology.c:1056:62: sparse:     got struct sched_domain [no=
deref] __rcu *child
   kernel/sched/topology.c:1160:40: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected struct sched_domain *chil=
d @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1160:40: sparse:     expected struct sched_domai=
n *child
   kernel/sched/topology.c:1160:40: sparse:     got struct sched_domain [no=
deref] __rcu *child
   kernel/sched/topology.c:1569:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected struct sched_domain [node=
ref] __rcu *child @@     got struct sched_domain *child @@
   kernel/sched/topology.c:1569:43: sparse:     expected struct sched_domai=
n [noderef] __rcu *child
   kernel/sched/topology.c:1569:43: sparse:     got struct sched_domain *ch=
ild
   kernel/sched/topology.c:1707:21: sparse: sparse: incompatible types in c=
omparison expression (different address spaces):
>> kernel/sched/topology.c:1707:21: sparse:    int [noderef] __rcu *
>> kernel/sched/topology.c:1707:21: sparse:    int *
   kernel/sched/topology.c:1833:9: sparse: sparse: incompatible types in co=
mparison expression (different address spaces):
   kernel/sched/topology.c:1833:9: sparse:    int [noderef] __rcu *
   kernel/sched/topology.c:1833:9: sparse:    int *
   kernel/sched/topology.c:1888:9: sparse: sparse: incompatible types in co=
mparison expression (different address spaces):
>> kernel/sched/topology.c:1888:9: sparse:    struct cpumask **[noderef] __=
rcu *
>> kernel/sched/topology.c:1888:9: sparse:    struct cpumask ***
   kernel/sched/topology.c:1946:9: sparse: sparse: incompatible types in co=
mparison expression (different address spaces):
   kernel/sched/topology.c:1946:9: sparse:    int [noderef] __rcu *
   kernel/sched/topology.c:1946:9: sparse:    int *
   kernel/sched/topology.c:1948:9: sparse: sparse: incompatible types in co=
mparison expression (different address spaces):
   kernel/sched/topology.c:1948:9: sparse:    struct cpumask **[noderef] __=
rcu *
   kernel/sched/topology.c:1948:9: sparse:    struct cpumask ***
   kernel/sched/topology.c:2032:17: sparse: sparse: incompatible types in c=
omparison expression (different address spaces):
   kernel/sched/topology.c:2032:17: sparse:    struct cpumask **[noderef] _=
_rcu *
   kernel/sched/topology.c:2032:17: sparse:    struct cpumask ***
   kernel/sched/topology.c:2166:31: sparse: sparse: incorrect type in assig=
nment (different address spaces) @@     expected struct sched_domain [noder=
ef] __rcu *parent @@     got struct sched_domain *sd @@
   kernel/sched/topology.c:2166:31: sparse:     expected struct sched_domai=
n [noderef] __rcu *parent
   kernel/sched/topology.c:2166:31: sparse:     got struct sched_domain *sd
   kernel/sched/topology.c:2269:57: sparse: sparse: incorrect type in assig=
nment (different address spaces) @@     expected struct sched_domain *[assi=
gned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2269:57: sparse:     expected struct sched_domai=
n *[assigned] sd
   kernel/sched/topology.c:2269:57: sparse:     got struct sched_domain [no=
deref] __rcu *parent
   kernel/sched/topology.c:2286:57: sparse: sparse: incorrect type in assig=
nment (different address spaces) @@     expected struct sched_domain *[assi=
gned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2286:57: sparse:     expected struct sched_domai=
n *[assigned] sd
   kernel/sched/topology.c:2286:57: sparse:     got struct sched_domain [no=
deref] __rcu *parent
   kernel/sched/topology.c: note: in included file:
   kernel/sched/sched.h:1745:9: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/sched.h:1745:9: sparse:     expected struct sched_domain *[=
assigned] sd
   kernel/sched/sched.h:1745:9: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/sched.h:1758:9: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/sched.h:1758:9: sparse:     expected struct sched_domain *[=
assigned] sd
   kernel/sched/sched.h:1758:9: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/sched.h:1745:9: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/sched.h:1745:9: sparse:     expected struct sched_domain *[=
assigned] sd
   kernel/sched/sched.h:1745:9: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/sched.h:1758:9: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/sched.h:1758:9: sparse:     expected struct sched_domain *[=
assigned] sd
   kernel/sched/sched.h:1758:9: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/topology.c:929:31: sparse: sparse: dereference of noderef e=
xpression
   kernel/sched/topology.c:1590:19: sparse: sparse: dereference of noderef =
expression

vim +1707 kernel/sched/topology.c

f2cb13609d5397 Ingo Molnar           2017-02-01  1697  =

f2cb13609d5397 Ingo Molnar           2017-02-01  1698  bool find_numa_dista=
nce(int distance)
f2cb13609d5397 Ingo Molnar           2017-02-01  1699  {
ed82092e509333 Huang Ying            2022-02-08  1700  	bool found =3D fals=
e;
ed82092e509333 Huang Ying            2022-02-08  1701  	int i, *distances;
f2cb13609d5397 Ingo Molnar           2017-02-01  1702  =

f2cb13609d5397 Ingo Molnar           2017-02-01  1703  	if (distance =3D=3D=
 node_distance(0, 0))
f2cb13609d5397 Ingo Molnar           2017-02-01  1704  		return true;
f2cb13609d5397 Ingo Molnar           2017-02-01  1705  =

ed82092e509333 Huang Ying            2022-02-08  1706  	rcu_read_lock();
ed82092e509333 Huang Ying            2022-02-08 @1707  	distances =3D rcu_d=
ereference(sched_domains_numa_distance);
ed82092e509333 Huang Ying            2022-02-08  1708  	if (!distances)
ed82092e509333 Huang Ying            2022-02-08  1709  		goto unlock;
f2cb13609d5397 Ingo Molnar           2017-02-01  1710  	for (i =3D 0; i < s=
ched_domains_numa_levels; i++) {
ed82092e509333 Huang Ying            2022-02-08  1711  		if (distances[i] =
=3D=3D distance) {
ed82092e509333 Huang Ying            2022-02-08  1712  			found =3D true;
ed82092e509333 Huang Ying            2022-02-08  1713  			break;
f2cb13609d5397 Ingo Molnar           2017-02-01  1714  		}
ed82092e509333 Huang Ying            2022-02-08  1715  	}
ed82092e509333 Huang Ying            2022-02-08  1716  unlock:
ed82092e509333 Huang Ying            2022-02-08  1717  	rcu_read_unlock();
f2cb13609d5397 Ingo Molnar           2017-02-01  1718  =

ed82092e509333 Huang Ying            2022-02-08  1719  	return found;
f2cb13609d5397 Ingo Molnar           2017-02-01  1720  }
f2cb13609d5397 Ingo Molnar           2017-02-01  1721  =

ed82092e509333 Huang Ying            2022-02-08  1722  #define for_each_cpu=
_node_but(n, nbut)		\
ed82092e509333 Huang Ying            2022-02-08  1723  	for_each_node_state=
(n, N_CPU)		\
ed82092e509333 Huang Ying            2022-02-08  1724  		if (n =3D=3D nbut)=
			\
ed82092e509333 Huang Ying            2022-02-08  1725  			continue;		\
ed82092e509333 Huang Ying            2022-02-08  1726  		else
ed82092e509333 Huang Ying            2022-02-08  1727  =

f2cb13609d5397 Ingo Molnar           2017-02-01  1728  /*
f2cb13609d5397 Ingo Molnar           2017-02-01  1729   * A system can have=
 three types of NUMA topology:
f2cb13609d5397 Ingo Molnar           2017-02-01  1730   * NUMA_DIRECT: all =
nodes are directly connected, or not a NUMA system
f2cb13609d5397 Ingo Molnar           2017-02-01  1731   * NUMA_GLUELESS_MES=
H: some nodes reachable through intermediary nodes
f2cb13609d5397 Ingo Molnar           2017-02-01  1732   * NUMA_BACKPLANE: n=
odes can reach other nodes through a backplane
f2cb13609d5397 Ingo Molnar           2017-02-01  1733   *
f2cb13609d5397 Ingo Molnar           2017-02-01  1734   * The difference be=
tween a glueless mesh topology and a backplane
f2cb13609d5397 Ingo Molnar           2017-02-01  1735   * topology lies in =
whether communication between not directly
f2cb13609d5397 Ingo Molnar           2017-02-01  1736   * connected nodes g=
oes through intermediary nodes (where programs
f2cb13609d5397 Ingo Molnar           2017-02-01  1737   * could run), or th=
rough backplane controllers. This affects
f2cb13609d5397 Ingo Molnar           2017-02-01  1738   * placement of prog=
rams.
f2cb13609d5397 Ingo Molnar           2017-02-01  1739   *
f2cb13609d5397 Ingo Molnar           2017-02-01  1740   * The type of topol=
ogy can be discerned with the following tests:
f2cb13609d5397 Ingo Molnar           2017-02-01  1741   * - If the maximum =
distance between any nodes is 1 hop, the system
f2cb13609d5397 Ingo Molnar           2017-02-01  1742   *   is directly con=
nected.
f2cb13609d5397 Ingo Molnar           2017-02-01  1743   * - If for two node=
s A and B, located N > 1 hops away from each other,
f2cb13609d5397 Ingo Molnar           2017-02-01  1744   *   there is an int=
ermediary node C, which is < N hops away from both
f2cb13609d5397 Ingo Molnar           2017-02-01  1745   *   nodes A and B, =
the system is a glueless mesh.
f2cb13609d5397 Ingo Molnar           2017-02-01  1746   */
ed82092e509333 Huang Ying            2022-02-08  1747  static void init_num=
a_topology_type(int offline_node)
f2cb13609d5397 Ingo Molnar           2017-02-01  1748  {
f2cb13609d5397 Ingo Molnar           2017-02-01  1749  	int a, b, c, n;
f2cb13609d5397 Ingo Molnar           2017-02-01  1750  =

f2cb13609d5397 Ingo Molnar           2017-02-01  1751  	n =3D sched_max_num=
a_distance;
f2cb13609d5397 Ingo Molnar           2017-02-01  1752  =

e5e96fafd9028b Srikar Dronamraju     2018-08-10  1753  	if (sched_domains_n=
uma_levels <=3D 2) {
f2cb13609d5397 Ingo Molnar           2017-02-01  1754  		sched_numa_topolog=
y_type =3D NUMA_DIRECT;
f2cb13609d5397 Ingo Molnar           2017-02-01  1755  		return;
f2cb13609d5397 Ingo Molnar           2017-02-01  1756  	}
f2cb13609d5397 Ingo Molnar           2017-02-01  1757  =

ed82092e509333 Huang Ying            2022-02-08  1758  	for_each_cpu_node_b=
ut(a, offline_node) {
ed82092e509333 Huang Ying            2022-02-08  1759  		for_each_cpu_node_=
but(b, offline_node) {
f2cb13609d5397 Ingo Molnar           2017-02-01  1760  			/* Find two nodes=
 furthest removed from each other. */
f2cb13609d5397 Ingo Molnar           2017-02-01  1761  			if (node_distance=
(a, b) < n)
f2cb13609d5397 Ingo Molnar           2017-02-01  1762  				continue;
f2cb13609d5397 Ingo Molnar           2017-02-01  1763  =

f2cb13609d5397 Ingo Molnar           2017-02-01  1764  			/* Is there an in=
termediary node between a and b? */
ed82092e509333 Huang Ying            2022-02-08  1765  			for_each_cpu_node=
_but(c, offline_node) {
f2cb13609d5397 Ingo Molnar           2017-02-01  1766  				if (node_distanc=
e(a, c) < n &&
f2cb13609d5397 Ingo Molnar           2017-02-01  1767  				    node_distanc=
e(b, c) < n) {
f2cb13609d5397 Ingo Molnar           2017-02-01  1768  					sched_numa_topo=
logy_type =3D
f2cb13609d5397 Ingo Molnar           2017-02-01  1769  							NUMA_GLUELESS=
_MESH;
f2cb13609d5397 Ingo Molnar           2017-02-01  1770  					return;
f2cb13609d5397 Ingo Molnar           2017-02-01  1771  				}
f2cb13609d5397 Ingo Molnar           2017-02-01  1772  			}
f2cb13609d5397 Ingo Molnar           2017-02-01  1773  =

f2cb13609d5397 Ingo Molnar           2017-02-01  1774  			sched_numa_topolo=
gy_type =3D NUMA_BACKPLANE;
f2cb13609d5397 Ingo Molnar           2017-02-01  1775  			return;
f2cb13609d5397 Ingo Molnar           2017-02-01  1776  		}
f2cb13609d5397 Ingo Molnar           2017-02-01  1777  	}
ed82092e509333 Huang Ying            2022-02-08  1778  =

ed82092e509333 Huang Ying            2022-02-08  1779  	pr_err("Failed to f=
ind a NUMA topology type, defaulting to DIRECT\n");
ed82092e509333 Huang Ying            2022-02-08  1780  	sched_numa_topology=
_type =3D NUMA_DIRECT;
f2cb13609d5397 Ingo Molnar           2017-02-01  1781  }
f2cb13609d5397 Ingo Molnar           2017-02-01  1782  =

620a6dc40754dc Valentin Schneider    2021-01-22  1783  =

620a6dc40754dc Valentin Schneider    2021-01-22  1784  #define NR_DISTANCE_=
VALUES (1 << DISTANCE_BITS)
620a6dc40754dc Valentin Schneider    2021-01-22  1785  =

ed82092e509333 Huang Ying            2022-02-08  1786  void sched_init_numa=
(int offline_node)
f2cb13609d5397 Ingo Molnar           2017-02-01  1787  {
f2cb13609d5397 Ingo Molnar           2017-02-01  1788  	struct sched_domain=
_topology_level *tl;
620a6dc40754dc Valentin Schneider    2021-01-22  1789  	unsigned long *dist=
ance_map;
620a6dc40754dc Valentin Schneider    2021-01-22  1790  	int nr_levels =3D 0;
620a6dc40754dc Valentin Schneider    2021-01-22  1791  	int i, j;
ed82092e509333 Huang Ying            2022-02-08  1792  	int *distances;
ed82092e509333 Huang Ying            2022-02-08  1793  	struct cpumask ***m=
asks;
051f3ca02e4643 Suravee Suthikulpanit 2017-09-07  1794  =

f2cb13609d5397 Ingo Molnar           2017-02-01  1795  	/*
f2cb13609d5397 Ingo Molnar           2017-02-01  1796  	 * O(nr_nodes^2) de=
duplicating selection sort -- in order to find the
f2cb13609d5397 Ingo Molnar           2017-02-01  1797  	 * unique distances=
 in the node_distance() table.
f2cb13609d5397 Ingo Molnar           2017-02-01  1798  	 */
620a6dc40754dc Valentin Schneider    2021-01-22  1799  	distance_map =3D bi=
tmap_alloc(NR_DISTANCE_VALUES, GFP_KERNEL);
620a6dc40754dc Valentin Schneider    2021-01-22  1800  	if (!distance_map)
620a6dc40754dc Valentin Schneider    2021-01-22  1801  		return;
620a6dc40754dc Valentin Schneider    2021-01-22  1802  =

620a6dc40754dc Valentin Schneider    2021-01-22  1803  	bitmap_zero(distanc=
e_map, NR_DISTANCE_VALUES);
ed82092e509333 Huang Ying            2022-02-08  1804  	for_each_cpu_node_b=
ut(i, offline_node) {
ed82092e509333 Huang Ying            2022-02-08  1805  		for_each_cpu_node_=
but(j, offline_node) {
620a6dc40754dc Valentin Schneider    2021-01-22  1806  			int distance =3D =
node_distance(i, j);
f2cb13609d5397 Ingo Molnar           2017-02-01  1807  =

620a6dc40754dc Valentin Schneider    2021-01-22  1808  			if (distance < LO=
CAL_DISTANCE || distance >=3D NR_DISTANCE_VALUES) {
620a6dc40754dc Valentin Schneider    2021-01-22  1809  				sched_numa_warn(=
"Invalid distance value range");
ed82092e509333 Huang Ying            2022-02-08  1810  				bitmap_free(dist=
ance_map);
620a6dc40754dc Valentin Schneider    2021-01-22  1811  				return;
620a6dc40754dc Valentin Schneider    2021-01-22  1812  			}
f2cb13609d5397 Ingo Molnar           2017-02-01  1813  =

620a6dc40754dc Valentin Schneider    2021-01-22  1814  			bitmap_set(distan=
ce_map, distance, 1);
620a6dc40754dc Valentin Schneider    2021-01-22  1815  		}
620a6dc40754dc Valentin Schneider    2021-01-22  1816  	}
f2cb13609d5397 Ingo Molnar           2017-02-01  1817  	/*
620a6dc40754dc Valentin Schneider    2021-01-22  1818  	 * We can now figur=
e out how many unique distance values there are and
620a6dc40754dc Valentin Schneider    2021-01-22  1819  	 * allocate memory =
accordingly.
f2cb13609d5397 Ingo Molnar           2017-02-01  1820  	 */
620a6dc40754dc Valentin Schneider    2021-01-22  1821  	nr_levels =3D bitma=
p_weight(distance_map, NR_DISTANCE_VALUES);
f2cb13609d5397 Ingo Molnar           2017-02-01  1822  =

ed82092e509333 Huang Ying            2022-02-08  1823  	distances =3D kcall=
oc(nr_levels, sizeof(int), GFP_KERNEL);
ed82092e509333 Huang Ying            2022-02-08  1824  	if (!distances) {
620a6dc40754dc Valentin Schneider    2021-01-22  1825  		bitmap_free(distan=
ce_map);
620a6dc40754dc Valentin Schneider    2021-01-22  1826  		return;
f2cb13609d5397 Ingo Molnar           2017-02-01  1827  	}
f2cb13609d5397 Ingo Molnar           2017-02-01  1828  =

620a6dc40754dc Valentin Schneider    2021-01-22  1829  	for (i =3D 0, j =3D=
 0; i < nr_levels; i++, j++) {
620a6dc40754dc Valentin Schneider    2021-01-22  1830  		j =3D find_next_bi=
t(distance_map, NR_DISTANCE_VALUES, j);
ed82092e509333 Huang Ying            2022-02-08  1831  		distances[i] =3D j;
f2cb13609d5397 Ingo Molnar           2017-02-01  1832  	}
ed82092e509333 Huang Ying            2022-02-08  1833  	rcu_assign_pointer(=
sched_domains_numa_distance, distances);
f2cb13609d5397 Ingo Molnar           2017-02-01  1834  =

620a6dc40754dc Valentin Schneider    2021-01-22  1835  	bitmap_free(distanc=
e_map);
620a6dc40754dc Valentin Schneider    2021-01-22  1836  =

f2cb13609d5397 Ingo Molnar           2017-02-01  1837  	/*
620a6dc40754dc Valentin Schneider    2021-01-22  1838  	 * 'nr_levels' cont=
ains the number of unique distances
f2cb13609d5397 Ingo Molnar           2017-02-01  1839  	 *
f2cb13609d5397 Ingo Molnar           2017-02-01  1840  	 * The sched_domain=
s_numa_distance[] array includes the actual distance
f2cb13609d5397 Ingo Molnar           2017-02-01  1841  	 * numbers.
f2cb13609d5397 Ingo Molnar           2017-02-01  1842  	 */
f2cb13609d5397 Ingo Molnar           2017-02-01  1843  =

f2cb13609d5397 Ingo Molnar           2017-02-01  1844  	/*
f2cb13609d5397 Ingo Molnar           2017-02-01  1845  	 * Here, we should =
temporarily reset sched_domains_numa_levels to 0.
f2cb13609d5397 Ingo Molnar           2017-02-01  1846  	 * If it fails to a=
llocate memory for array sched_domains_numa_masks[][],
620a6dc40754dc Valentin Schneider    2021-01-22  1847  	 * the array will c=
ontain less then 'nr_levels' members. This could be
f2cb13609d5397 Ingo Molnar           2017-02-01  1848  	 * dangerous when w=
e use it to iterate array sched_domains_numa_masks[][]
f2cb13609d5397 Ingo Molnar           2017-02-01  1849  	 * in other functio=
ns.
f2cb13609d5397 Ingo Molnar           2017-02-01  1850  	 *
620a6dc40754dc Valentin Schneider    2021-01-22  1851  	 * We reset it to '=
nr_levels'@the end of this function.
f2cb13609d5397 Ingo Molnar           2017-02-01  1852  	 */
f2cb13609d5397 Ingo Molnar           2017-02-01  1853  	sched_domains_numa_=
levels =3D 0;
f2cb13609d5397 Ingo Molnar           2017-02-01  1854  =

ed82092e509333 Huang Ying            2022-02-08  1855  	masks =3D kzalloc(s=
izeof(void *) * nr_levels, GFP_KERNEL);
ed82092e509333 Huang Ying            2022-02-08  1856  	if (!masks)
f2cb13609d5397 Ingo Molnar           2017-02-01  1857  		return;
f2cb13609d5397 Ingo Molnar           2017-02-01  1858  =

f2cb13609d5397 Ingo Molnar           2017-02-01  1859  	/*
f2cb13609d5397 Ingo Molnar           2017-02-01  1860  	 * Now for each lev=
el, construct a mask per node which contains all
f2cb13609d5397 Ingo Molnar           2017-02-01  1861  	 * CPUs of nodes th=
at are that many hops away from us.
f2cb13609d5397 Ingo Molnar           2017-02-01  1862  	 */
620a6dc40754dc Valentin Schneider    2021-01-22  1863  	for (i =3D 0; i < n=
r_levels; i++) {
ed82092e509333 Huang Ying            2022-02-08  1864  		masks[i] =3D kzall=
oc(nr_node_ids * sizeof(void *), GFP_KERNEL);
ed82092e509333 Huang Ying            2022-02-08  1865  		if (!masks[i])
f2cb13609d5397 Ingo Molnar           2017-02-01  1866  			return;
f2cb13609d5397 Ingo Molnar           2017-02-01  1867  =

ed82092e509333 Huang Ying            2022-02-08  1868  		for_each_cpu_node_=
but(j, offline_node) {
f2cb13609d5397 Ingo Molnar           2017-02-01  1869  			struct cpumask *m=
ask =3D kzalloc(cpumask_size(), GFP_KERNEL);
620a6dc40754dc Valentin Schneider    2021-01-22  1870  			int k;
620a6dc40754dc Valentin Schneider    2021-01-22  1871  =

f2cb13609d5397 Ingo Molnar           2017-02-01  1872  			if (!mask)
f2cb13609d5397 Ingo Molnar           2017-02-01  1873  				return;
f2cb13609d5397 Ingo Molnar           2017-02-01  1874  =

ed82092e509333 Huang Ying            2022-02-08  1875  			masks[i][j] =3D m=
ask;
0083242c93759d Valentin Schneider    2021-08-18  1876  =

ed82092e509333 Huang Ying            2022-02-08  1877  			for_each_cpu_node=
_but(k, offline_node) {
620a6dc40754dc Valentin Schneider    2021-01-22  1878  				if (sched_debug(=
) && (node_distance(j, k) !=3D node_distance(k, j)))
620a6dc40754dc Valentin Schneider    2021-01-22  1879  					sched_numa_warn=
("Node-distance not symmetric");
620a6dc40754dc Valentin Schneider    2021-01-22  1880  =

f2cb13609d5397 Ingo Molnar           2017-02-01  1881  				if (node_distanc=
e(j, k) > sched_domains_numa_distance[i])
f2cb13609d5397 Ingo Molnar           2017-02-01  1882  					continue;
f2cb13609d5397 Ingo Molnar           2017-02-01  1883  =

f2cb13609d5397 Ingo Molnar           2017-02-01  1884  				cpumask_or(mask,=
 mask, cpumask_of_node(k));
f2cb13609d5397 Ingo Molnar           2017-02-01  1885  			}
f2cb13609d5397 Ingo Molnar           2017-02-01  1886  		}
f2cb13609d5397 Ingo Molnar           2017-02-01  1887  	}
ed82092e509333 Huang Ying            2022-02-08 @1888  	rcu_assign_pointer(=
sched_domains_numa_masks, masks);
f2cb13609d5397 Ingo Molnar           2017-02-01  1889  =

f2cb13609d5397 Ingo Molnar           2017-02-01  1890  	/* Compute default =
topology size */
f2cb13609d5397 Ingo Molnar           2017-02-01  1891  	for (i =3D 0; sched=
_domain_topology[i].mask; i++);
f2cb13609d5397 Ingo Molnar           2017-02-01  1892  =

71e5f6644fb2f3 Dietmar Eggemann      2021-02-01  1893  	tl =3D kzalloc((i +=
 nr_levels + 1) *
f2cb13609d5397 Ingo Molnar           2017-02-01  1894  			sizeof(struct sch=
ed_domain_topology_level), GFP_KERNEL);
f2cb13609d5397 Ingo Molnar           2017-02-01  1895  	if (!tl)
f2cb13609d5397 Ingo Molnar           2017-02-01  1896  		return;
f2cb13609d5397 Ingo Molnar           2017-02-01  1897  =

f2cb13609d5397 Ingo Molnar           2017-02-01  1898  	/*
f2cb13609d5397 Ingo Molnar           2017-02-01  1899  	 * Copy the default=
 topology bits..
f2cb13609d5397 Ingo Molnar           2017-02-01  1900  	 */
f2cb13609d5397 Ingo Molnar           2017-02-01  1901  	for (i =3D 0; sched=
_domain_topology[i].mask; i++)
f2cb13609d5397 Ingo Molnar           2017-02-01  1902  		tl[i] =3D sched_do=
main_topology[i];
f2cb13609d5397 Ingo Molnar           2017-02-01  1903  =

051f3ca02e4643 Suravee Suthikulpanit 2017-09-07  1904  	/*
051f3ca02e4643 Suravee Suthikulpanit 2017-09-07  1905  	 * Add the NUMA ide=
ntity distance, aka single NODE.
051f3ca02e4643 Suravee Suthikulpanit 2017-09-07  1906  	 */
051f3ca02e4643 Suravee Suthikulpanit 2017-09-07  1907  	tl[i++] =3D (struct=
 sched_domain_topology_level){
051f3ca02e4643 Suravee Suthikulpanit 2017-09-07  1908  		.mask =3D sd_numa_=
mask,
051f3ca02e4643 Suravee Suthikulpanit 2017-09-07  1909  		.numa_level =3D 0,
051f3ca02e4643 Suravee Suthikulpanit 2017-09-07  1910  		SD_INIT_NAME(NODE)
051f3ca02e4643 Suravee Suthikulpanit 2017-09-07  1911  	};
051f3ca02e4643 Suravee Suthikulpanit 2017-09-07  1912  =

f2cb13609d5397 Ingo Molnar           2017-02-01  1913  	/*
f2cb13609d5397 Ingo Molnar           2017-02-01  1914  	 * .. and append 'j=
' levels of NUMA goodness.
f2cb13609d5397 Ingo Molnar           2017-02-01  1915  	 */
620a6dc40754dc Valentin Schneider    2021-01-22  1916  	for (j =3D 1; j < n=
r_levels; i++, j++) {
f2cb13609d5397 Ingo Molnar           2017-02-01  1917  		tl[i] =3D (struct =
sched_domain_topology_level){
f2cb13609d5397 Ingo Molnar           2017-02-01  1918  			.mask =3D sd_numa=
_mask,
f2cb13609d5397 Ingo Molnar           2017-02-01  1919  			.sd_flags =3D cpu=
_numa_flags,
f2cb13609d5397 Ingo Molnar           2017-02-01  1920  			.flags =3D SDTL_O=
VERLAP,
f2cb13609d5397 Ingo Molnar           2017-02-01  1921  			.numa_level =3D j,
f2cb13609d5397 Ingo Molnar           2017-02-01  1922  			SD_INIT_NAME(NUMA)
f2cb13609d5397 Ingo Molnar           2017-02-01  1923  		};
f2cb13609d5397 Ingo Molnar           2017-02-01  1924  	}
f2cb13609d5397 Ingo Molnar           2017-02-01  1925  =

ed82092e509333 Huang Ying            2022-02-08  1926  	sched_domain_topolo=
gy_saved =3D sched_domain_topology;
f2cb13609d5397 Ingo Molnar           2017-02-01  1927  	sched_domain_topolo=
gy =3D tl;
f2cb13609d5397 Ingo Molnar           2017-02-01  1928  =

620a6dc40754dc Valentin Schneider    2021-01-22  1929  	sched_domains_numa_=
levels =3D nr_levels;
620a6dc40754dc Valentin Schneider    2021-01-22  1930  	sched_max_numa_dist=
ance =3D sched_domains_numa_distance[nr_levels - 1];
f2cb13609d5397 Ingo Molnar           2017-02-01  1931  =

ed82092e509333 Huang Ying            2022-02-08  1932  	init_numa_topology_=
type(offline_node);
0083242c93759d Valentin Schneider    2021-08-18  1933  }
0083242c93759d Valentin Schneider    2021-08-18  1934  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============3097781615396580983==--

