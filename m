Content-Type: multipart/mixed; boundary="===============5993472547060560158=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [nsaenz-rpi:pcpdrain-sl-v3r1 4/4] mm/page_alloc.c:3571 __rmqueue_pcplist() warn: ignoring unreachable code.
Date: Fri, 25 Mar 2022 19:02:49 +0800
Message-ID: <202203251815.T2oLEgNJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5993472547060560158==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Nicolas Saenz Julienne <nsaenzju@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/nsaenz/linux-rpi.gi=
t pcpdrain-sl-v3r1
head:   9710838f0540b295e2ffc2ded307fe65a9fa7111
commit: 9710838f0540b295e2ffc2ded307fe65a9fa7111 [4/4] mm/page_alloc: Avoid=
 disabling interruptions on hot paths
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20325/202203251815.T2oLEgNJ-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/page_alloc.c:3571 __rmqueue_pcplist() warn: ignoring unreachable code.

vim +3571 mm/page_alloc.c

060e74173f292f Mel Gorman             2016-05-19  3530  =

066b23935578d3 Mel Gorman             2017-02-24  3531  /* Remove page from=
 the per-cpu list, caller must protect the list */
3b822017b636bf Jesper Dangaard Brouer 2021-04-29  3532  static inline
44042b4498728f Mel Gorman             2021-06-28  3533  struct page *__rmqu=
eue_pcplist(struct zone *zone, unsigned int order,
44042b4498728f Mel Gorman             2021-06-28  3534  			int migratetype,
6bb154504f8b49 Mel Gorman             2018-12-28  3535  			unsigned int all=
oc_flags,
453f85d43fa9ee Mel Gorman             2017-11-15  3536  			struct per_cpu_p=
ages *pcp,
9710838f0540b2 Nicolas Saenz Julienne 2022-03-24  3537  			struct list_head=
 *list,
9710838f0540b2 Nicolas Saenz Julienne 2022-03-24  3538  			bool locked)
^1da177e4c3f41 Linus Torvalds         2005-04-16  3539  {
689bcebfda16d7 Hugh Dickins           2005-11-21  3540  	struct page *page;
^1da177e4c3f41 Linus Torvalds         2005-04-16  3541  =

9710838f0540b2 Nicolas Saenz Julienne 2022-03-24  3542  	/*
9710838f0540b2 Nicolas Saenz Julienne 2022-03-24  3543  	 * Is IRQ preempti=
ng or a parallel drain in progress?
9710838f0540b2 Nicolas Saenz Julienne 2022-03-24  3544  	 *
9710838f0540b2 Nicolas Saenz Julienne 2022-03-24  3545  	 * If pcp->lock ca=
nnot be acquired, the caller uses rmqueue_buddy
9710838f0540b2 Nicolas Saenz Julienne 2022-03-24  3546  	 */
9710838f0540b2 Nicolas Saenz Julienne 2022-03-24  3547  	if (unlikely(!lock=
ed && !spin_trylock(&pcp->lock)))
9710838f0540b2 Nicolas Saenz Julienne 2022-03-24  3548  	       return NULL;
9710838f0540b2 Nicolas Saenz Julienne 2022-03-24  3549  =

479f854a207ce2 Mel Gorman             2016-05-19  3550  	do {
5f8dcc21211a3d Mel Gorman             2009-09-21  3551  		if (list_empty(li=
st)) {
44042b4498728f Mel Gorman             2021-06-28  3552  			int batch =3D RE=
AD_ONCE(pcp->batch);
44042b4498728f Mel Gorman             2021-06-28  3553  			int alloced;
44042b4498728f Mel Gorman             2021-06-28  3554  =

44042b4498728f Mel Gorman             2021-06-28  3555  			/*
44042b4498728f Mel Gorman             2021-06-28  3556  			 * Scale batch r=
elative to order if batch implies
44042b4498728f Mel Gorman             2021-06-28  3557  			 * free pages ca=
n be stored on the PCP. Batch can
44042b4498728f Mel Gorman             2021-06-28  3558  			 * be 1 for smal=
l zones or for boot pagesets which
44042b4498728f Mel Gorman             2021-06-28  3559  			 * should never =
store free pages as the pages may
44042b4498728f Mel Gorman             2021-06-28  3560  			 * belong to arb=
itrary zones.
44042b4498728f Mel Gorman             2021-06-28  3561  			 */
44042b4498728f Mel Gorman             2021-06-28  3562  			if (batch > 1)
44042b4498728f Mel Gorman             2021-06-28  3563  				batch =3D max(b=
atch >> order, 2);
44042b4498728f Mel Gorman             2021-06-28  3564  			alloced =3D rmqu=
eue_bulk(zone, order,
44042b4498728f Mel Gorman             2021-06-28  3565  					batch, list,
6bb154504f8b49 Mel Gorman             2018-12-28  3566  					migratetype, a=
lloc_flags);
44042b4498728f Mel Gorman             2021-06-28  3567  =

44042b4498728f Mel Gorman             2021-06-28  3568  			pcp->count +=3D =
alloced << order;
9710838f0540b2 Nicolas Saenz Julienne 2022-03-24  3569  			if (unlikely(lis=
t_empty(list))) {
066b23935578d3 Mel Gorman             2017-02-24  3570  				return NULL;
9710838f0540b2 Nicolas Saenz Julienne 2022-03-24 @3571  				goto out;
9710838f0540b2 Nicolas Saenz Julienne 2022-03-24  3572  			}
b92a6edd4b77a8 Mel Gorman             2007-10-16  3573  		}
b92a6edd4b77a8 Mel Gorman             2007-10-16  3574  =

a16601c5458eb7 Geliang Tang           2016-01-14  3575  		page =3D list_fir=
st_entry(list, struct page, lru);
^1da177e4c3f41 Linus Torvalds         2005-04-16  3576  		list_del(&page->l=
ru);
44042b4498728f Mel Gorman             2021-06-28  3577  		pcp->count -=3D 1=
 << order;
77fe7f136a7312 Mel Gorman             2022-03-22  3578  	} while (check_new=
_pcp(page, order));
066b23935578d3 Mel Gorman             2017-02-24  3579  =

9710838f0540b2 Nicolas Saenz Julienne 2022-03-24  3580  out:
9710838f0540b2 Nicolas Saenz Julienne 2022-03-24  3581  	if (!locked)
9710838f0540b2 Nicolas Saenz Julienne 2022-03-24  3582  		spin_unlock(&pcp-=
>lock);
9710838f0540b2 Nicolas Saenz Julienne 2022-03-24  3583  =

066b23935578d3 Mel Gorman             2017-02-24  3584  	return page;
066b23935578d3 Mel Gorman             2017-02-24  3585  }
066b23935578d3 Mel Gorman             2017-02-24  3586  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5993472547060560158==--

