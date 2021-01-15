Content-Type: multipart/mixed; boundary="===============1005920227532815696=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1027/3956] arch/mips/kernel/cacheinfo.c:112:3: warning: Variable 'level' is modified but its new value is never used.
Date: Fri, 15 Jan 2021 19:43:30 +0800
Message-ID: <202101151917.n2Edpk0M-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1005920227532815696==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jiaxun Yang <jiaxun.yang@flygoat.com>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC: Tiezhu Yang <yangtiezhu@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   b3a3cbdec55b090d22a09f75efb7c7d34cb97f25
commit: e8bb8f28233d88f4ad89fdf83d54bbc4a8ee40f2 [1027/3956] MIPS: cacheinf=
o: Add missing VCache
:::::: branch date: 5 hours ago
:::::: commit date: 11 days ago
compiler: mips-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/mips/kernel/cacheinfo.c:112:3: warning: Variable 'level' is modifie=
d but its new value is never used. [unreadVariable]
     level++;
     ^

vim +/level +112 arch/mips/kernel/cacheinfo.c

3b1313eb32c499d4 Vladimir Kondratiev 2019-11-24   76  =

ef462f3b64e9fb0c Justin Chen         2016-12-07   77  static int __populate=
_cache_leaves(unsigned int cpu)
ef462f3b64e9fb0c Justin Chen         2016-12-07   78  {
ef462f3b64e9fb0c Justin Chen         2016-12-07   79  	struct cpuinfo_mips =
*c =3D &current_cpu_data;
ef462f3b64e9fb0c Justin Chen         2016-12-07   80  	struct cpu_cacheinfo=
 *this_cpu_ci =3D get_cpu_cacheinfo(cpu);
ef462f3b64e9fb0c Justin Chen         2016-12-07   81  	struct cacheinfo *th=
is_leaf =3D this_cpu_ci->info_list;
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30   82  	int level =3D 1;
ef462f3b64e9fb0c Justin Chen         2016-12-07   83  =

ef462f3b64e9fb0c Justin Chen         2016-12-07   84  	if (c->icache.waysiz=
e) {
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30   85  		/* I/D caches are p=
er core */
3b1313eb32c499d4 Vladimir Kondratiev 2019-11-24   86  		fill_cpumask_siblin=
gs(cpu, &this_leaf->shared_cpu_map);
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30   87  		populate_cache(dcac=
he, this_leaf, level, CACHE_TYPE_DATA);
3b1313eb32c499d4 Vladimir Kondratiev 2019-11-24   88  		fill_cpumask_siblin=
gs(cpu, &this_leaf->shared_cpu_map);
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30   89  		populate_cache(icac=
he, this_leaf, level, CACHE_TYPE_INST);
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30   90  		level++;
ef462f3b64e9fb0c Justin Chen         2016-12-07   91  	} else {
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30   92  		populate_cache(dcac=
he, this_leaf, level, CACHE_TYPE_UNIFIED);
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30   93  		level++;
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30   94  	}
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30   95  =

e8bb8f28233d88f4 Jiaxun Yang         2020-12-30   96  	if (c->vcache.waysiz=
e) {
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30   97  		/* Vcache is per co=
re as well */
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30   98  		fill_cpumask_siblin=
gs(cpu, &this_leaf->shared_cpu_map);
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30   99  		populate_cache(vcac=
he, this_leaf, level, CACHE_TYPE_UNIFIED);
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30  100  		level++;
ef462f3b64e9fb0c Justin Chen         2016-12-07  101  	}
ef462f3b64e9fb0c Justin Chen         2016-12-07  102  =

3b1313eb32c499d4 Vladimir Kondratiev 2019-11-24  103  	if (c->scache.waysiz=
e) {
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30  104  		/* Scache is per cl=
uster */
3b1313eb32c499d4 Vladimir Kondratiev 2019-11-24  105  		fill_cpumask_cluste=
r(cpu, &this_leaf->shared_cpu_map);
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30  106  		populate_cache(scac=
he, this_leaf, level, CACHE_TYPE_UNIFIED);
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30  107  		level++;
3b1313eb32c499d4 Vladimir Kondratiev 2019-11-24  108  	}
ef462f3b64e9fb0c Justin Chen         2016-12-07  109  =

e8bb8f28233d88f4 Jiaxun Yang         2020-12-30  110  	if (c->tcache.waysiz=
e) {
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30  111  		populate_cache(tcac=
he, this_leaf, level, CACHE_TYPE_UNIFIED);
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30 @112  		level++;
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30  113  	}
ef462f3b64e9fb0c Justin Chen         2016-12-07  114  =

b8bea8a5e5d942e6 Vladimir Kondratiev 2019-07-16  115  	this_cpu_ci->cpu_map=
_populated =3D true;
b8bea8a5e5d942e6 Vladimir Kondratiev 2019-07-16  116  =

ef462f3b64e9fb0c Justin Chen         2016-12-07  117  	return 0;
ef462f3b64e9fb0c Justin Chen         2016-12-07  118  }
ef462f3b64e9fb0c Justin Chen         2016-12-07  119  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1005920227532815696==--

