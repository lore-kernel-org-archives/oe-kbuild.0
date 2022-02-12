Content-Type: multipart/mixed; boundary="===============4560244700070648598=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 1/4] mm/memcg: Revert ("mm/memcg: optimize user context object stock access")
Date: Sat, 12 Feb 2022 18:39:17 +0800
Message-ID: <202202121755.VaCaguQX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4560244700070648598==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220211223537.2175879-2-bigeasy@linutronix.de>
References: <20220211223537.2175879-2-bigeasy@linutronix.de>
TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
TO: cgroups(a)vger.kernel.org
TO: linux-mm(a)kvack.org
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Johannes Weiner <hannes@cmpxchg.org>
CC: Michal Hocko <mhocko@kernel.org>
CC: "Michal Koutn=C3=BD" <mkoutny@suse.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Vladimir Davydov <vdavydov.dev@gmail.com>
CC: Waiman Long <longman@redhat.com>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Hi Sebastian,

I love your patch! Perhaps something to improve:

[auto build test WARNING on v5.17-rc3]
[also build test WARNING on next-20220211]
[cannot apply to hnaz-mm/master tj-cgroup/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sebastian-Andrzej-Siewior/=
mm-memcg-Address-PREEMPT_RT-problems-instead-of-disabling-it/20220212-063701
base:    dfd42facf1e4ada021b939b4e19c935dcdd55566
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: arc-randconfig-m031-20220211 (https://download.01.org/0day-ci/archi=
ve/20220212/202202121755.VaCaguQX-lkp(a)intel.com/config)
compiler: arc-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
mm/memcontrol.c:6826 uncharge_folio() error: uninitialized symbol 'objcg'.

Old smatch warnings:
arch/arc/include/asm/thread_info.h:65 current_thread_info() error: uninitia=
lized symbol 'sp'.

vim +/objcg +6826 mm/memcontrol.c

747db954cab64c Johannes Weiner         2014-08-08  6779  =

c4ed6ebfcb0929 Matthew Wilcox (Oracle  2021-06-29  6780) static void unchar=
ge_folio(struct folio *folio, struct uncharge_gather *ug)
747db954cab64c Johannes Weiner         2014-08-08  6781  {
c4ed6ebfcb0929 Matthew Wilcox (Oracle  2021-06-29  6782) 	long nr_pages;
b4e0b68fbd9d1f Muchun Song             2021-04-29  6783  	struct mem_cgroup=
 *memcg;
b4e0b68fbd9d1f Muchun Song             2021-04-29  6784  	struct obj_cgroup=
 *objcg;
9f762dbe19b9f1 Johannes Weiner         2020-06-03  6785  =

c4ed6ebfcb0929 Matthew Wilcox (Oracle  2021-06-29  6786) 	VM_BUG_ON_FOLIO(f=
olio_test_lru(folio), folio);
747db954cab64c Johannes Weiner         2014-08-08  6787  =

747db954cab64c Johannes Weiner         2014-08-08  6788  	/*
747db954cab64c Johannes Weiner         2014-08-08  6789  	 * Nobody should =
be changing or seriously looking at
c4ed6ebfcb0929 Matthew Wilcox (Oracle  2021-06-29  6790) 	 * folio memcg or=
 objcg at this point, we have fully
c4ed6ebfcb0929 Matthew Wilcox (Oracle  2021-06-29  6791) 	 * exclusive acce=
ss to the folio.
747db954cab64c Johannes Weiner         2014-08-08  6792  	 */
a6062be9ef6494 Michal Hocko            2022-02-11  6793  	if (folio_memcg_k=
mem(folio)) {
1b7e4464d43a48 Matthew Wilcox (Oracle  2021-06-28  6794) 		objcg =3D __foli=
o_objcg(folio);
b4e0b68fbd9d1f Muchun Song             2021-04-29  6795  		/*
b4e0b68fbd9d1f Muchun Song             2021-04-29  6796  		 * This get matc=
hes the put at the end of the function and
b4e0b68fbd9d1f Muchun Song             2021-04-29  6797  		 * kmem pages do=
 not hold memcg references anymore.
b4e0b68fbd9d1f Muchun Song             2021-04-29  6798  		 */
b4e0b68fbd9d1f Muchun Song             2021-04-29  6799  		memcg =3D get_me=
m_cgroup_from_objcg(objcg);
b4e0b68fbd9d1f Muchun Song             2021-04-29  6800  	} else {
1b7e4464d43a48 Matthew Wilcox (Oracle  2021-06-28  6801) 		memcg =3D __foli=
o_memcg(folio);
b4e0b68fbd9d1f Muchun Song             2021-04-29  6802  	}
b4e0b68fbd9d1f Muchun Song             2021-04-29  6803  =

b4e0b68fbd9d1f Muchun Song             2021-04-29  6804  	if (!memcg)
b4e0b68fbd9d1f Muchun Song             2021-04-29  6805  		return;
747db954cab64c Johannes Weiner         2014-08-08  6806  =

b4e0b68fbd9d1f Muchun Song             2021-04-29  6807  	if (ug->memcg !=
=3D memcg) {
a9d5adeeb4b2c7 J=C3=A9r=C3=B4me Glisse           2017-09-08  6808  		if (ug=
->memcg) {
a9d5adeeb4b2c7 J=C3=A9r=C3=B4me Glisse           2017-09-08  6809  			uncha=
rge_batch(ug);
a9d5adeeb4b2c7 J=C3=A9r=C3=B4me Glisse           2017-09-08  6810  			uncha=
rge_gather_clear(ug);
747db954cab64c Johannes Weiner         2014-08-08  6811  		}
b4e0b68fbd9d1f Muchun Song             2021-04-29  6812  		ug->memcg =3D me=
mcg;
c4ed6ebfcb0929 Matthew Wilcox (Oracle  2021-06-29  6813) 		ug->nid =3D foli=
o_nid(folio);
f1796544a0ca0f Michal Hocko            2020-09-04  6814  =

f1796544a0ca0f Michal Hocko            2020-09-04  6815  		/* pairs with cs=
s_put in uncharge_batch */
b4e0b68fbd9d1f Muchun Song             2021-04-29  6816  		css_get(&memcg->=
css);
747db954cab64c Johannes Weiner         2014-08-08  6817  	}
747db954cab64c Johannes Weiner         2014-08-08  6818  =

c4ed6ebfcb0929 Matthew Wilcox (Oracle  2021-06-29  6819) 	nr_pages =3D foli=
o_nr_pages(folio);
9f762dbe19b9f1 Johannes Weiner         2020-06-03  6820  =

a6062be9ef6494 Michal Hocko            2022-02-11  6821  	if (folio_memcg_k=
mem(folio)) {
b4e0b68fbd9d1f Muchun Song             2021-04-29  6822  		ug->nr_memory +=
=3D nr_pages;
9f762dbe19b9f1 Johannes Weiner         2020-06-03  6823  		ug->nr_kmem +=3D=
 nr_pages;
b4e0b68fbd9d1f Muchun Song             2021-04-29  6824  =

c4ed6ebfcb0929 Matthew Wilcox (Oracle  2021-06-29  6825) 		folio->memcg_dat=
a =3D 0;
b4e0b68fbd9d1f Muchun Song             2021-04-29 @6826  		obj_cgroup_put(o=
bjcg);
b4e0b68fbd9d1f Muchun Song             2021-04-29  6827  	} else {
b4e0b68fbd9d1f Muchun Song             2021-04-29  6828  		/* LRU pages are=
n't accounted at the root level */
b4e0b68fbd9d1f Muchun Song             2021-04-29  6829  		if (!mem_cgroup_=
is_root(memcg))
b4e0b68fbd9d1f Muchun Song             2021-04-29  6830  			ug->nr_memory +=
=3D nr_pages;
18b2db3b038522 Roman Gushchin          2020-12-01  6831  		ug->pgpgout++;
747db954cab64c Johannes Weiner         2014-08-08  6832  =

c4ed6ebfcb0929 Matthew Wilcox (Oracle  2021-06-29  6833) 		folio->memcg_dat=
a =3D 0;
b4e0b68fbd9d1f Muchun Song             2021-04-29  6834  	}
b4e0b68fbd9d1f Muchun Song             2021-04-29  6835  =

b4e0b68fbd9d1f Muchun Song             2021-04-29  6836  	css_put(&memcg->c=
ss);
a9d5adeeb4b2c7 J=C3=A9r=C3=B4me Glisse           2017-09-08  6837  }
a9d5adeeb4b2c7 J=C3=A9r=C3=B4me Glisse           2017-09-08  6838  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4560244700070648598==--

