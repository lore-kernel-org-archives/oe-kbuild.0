Content-Type: multipart/mixed; boundary="===============2718452085066363613=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/slab.h:589 account_slab() warn: bitwise AND condition is false here
Date: Wed, 19 Jan 2022 14:59:41 +0800
Message-ID: <202201191458.AIFpaOpg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2718452085066363613==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Vlastimil Babka <vbabka@suse.cz>
CC: Roman Gushchin <guro@fb.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   99613159ad749543621da8238acf1a122880144e
commit: b918653b4f32881afb383b7b5853a7edfe0937a6 mm: Convert [un]account_sl=
ab_page() to struct slab
date:   13 days ago
:::::: branch date: 19 hours ago
:::::: commit date: 13 days ago
config: x86_64-randconfig-m001-20220117 (https://download.01.org/0day-ci/ar=
chive/20220119/202201191458.AIFpaOpg-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/slab.h:589 account_slab() warn: bitwise AND condition is false here

vim +589 mm/slab.h

a64b53780ec35b Kees Cook               2019-07-11  585  =

b918653b4f3288 Matthew Wilcox (Oracle  2021-10-04  586) static __always_inl=
ine void account_slab(struct slab *slab, int order,
b918653b4f3288 Matthew Wilcox (Oracle  2021-10-04  587) 					 struct kmem_c=
ache *s, gfp_t gfp)
6cea1d569d24af Roman Gushchin          2019-07-11  588  {
2e9bd483159939 Roman Gushchin          2021-02-24 @589  	if (memcg_kmem_ena=
bled() && (s->flags & SLAB_ACCOUNT))
b918653b4f3288 Matthew Wilcox (Oracle  2021-10-04  590) 		memcg_alloc_page_=
obj_cgroups(slab_page(slab), s, gfp, true);
2e9bd483159939 Roman Gushchin          2021-02-24  591  =

b918653b4f3288 Matthew Wilcox (Oracle  2021-10-04  592) 	mod_node_page_stat=
e(slab_pgdat(slab), cache_vmstat_idx(s),
f2fe7b09a52bc8 Roman Gushchin          2020-08-06  593  			    PAGE_SIZE <<=
 order);
6cea1d569d24af Roman Gushchin          2019-07-11  594  }
6cea1d569d24af Roman Gushchin          2019-07-11  595  =


:::::: The code@line 589 was first introduced by commit
:::::: 2e9bd483159939ed2c0704b914294653c8341d25 mm: memcg/slab: pre-allocat=
e obj_cgroups for slab caches with SLAB_ACCOUNT

:::::: TO: Roman Gushchin <guro@fb.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2718452085066363613==--

