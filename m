Content-Type: multipart/mixed; boundary="===============6897804572736819773=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH v4 6/8] hugetlb: add vma based lock for pmd sharing synchronization
Date: Sun, 10 Jul 2022 14:17:22 +0800
Message-ID: <202207101441.lWSiroAU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6897804572736819773==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220706202347.95150-7-mike.kravetz@oracle.com>
References: <20220706202347.95150-7-mike.kravetz@oracle.com>
TO: Mike Kravetz <mike.kravetz@oracle.com>

Hi Mike,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on next-20220706]
[cannot apply to akpm-mm/mm-everything linus/master v5.19-rc5 v5.19-rc4 v5.=
19-rc3 v5.19-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mike-Kravetz/hugetlb=
-Change-huge-pmd-sharing-synchronization-again/20220707-042524
base:    088b9c375534d905a4d337c78db3b3bfbb52c4a0
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20710/202207101441.lWSiroAU-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/hugetlb.c:6672 hugetlb_reserve_pages() error: uninitialized symbol 'chg'.

vim +/chg +6672 mm/hugetlb.c

8f860591ffb2973 Zhang, Yanmin   2006-03-22  6520  =

33b8f84a4ee7849 Mike Kravetz    2021-02-24  6521  /* Return true if reserva=
tion was successful, false otherwise.  */
33b8f84a4ee7849 Mike Kravetz    2021-02-24  6522  bool hugetlb_reserve_page=
s(struct inode *inode,
a1e78772d72b261 Mel Gorman      2008-07-23  6523  					long from, long to,
5a6fe1259506760 Mel Gorman      2009-02-10  6524  					struct vm_area_struc=
t *vma,
ca16d140af91feb KOSAKI Motohiro 2011-05-26  6525  					vm_flags_t vm_flags)
e4e574b767ba631 Adam Litke      2007-10-16  6526  {
33b8f84a4ee7849 Mike Kravetz    2021-02-24  6527  	long chg, add =3D -1;
a5516438959d90b Andi Kleen      2008-07-23  6528  	struct hstate *h =3D hst=
ate_inode(inode);
90481622d75715b David Gibson    2012-03-21  6529  	struct hugepage_subpool =
*spool =3D subpool_inode(inode);
9119a41e9091fb3 Joonsoo Kim     2014-04-03  6530  	struct resv_map *resv_ma=
p;
075a61d07a8eca2 Mina Almasry    2020-04-01  6531  	struct hugetlb_cgroup *h=
_cg =3D NULL;
0db9d74ed8845a3 Mina Almasry    2020-04-01  6532  	long gbl_reserve, region=
s_needed =3D 0;
e4e574b767ba631 Adam Litke      2007-10-16  6533  =

63489f8e8211440 Mike Kravetz    2018-03-22  6534  	/* This should never hap=
pen */
63489f8e8211440 Mike Kravetz    2018-03-22  6535  	if (from > to) {
63489f8e8211440 Mike Kravetz    2018-03-22  6536  		VM_WARN(1, "%s called w=
ith a negative range\n", __func__);
33b8f84a4ee7849 Mike Kravetz    2021-02-24  6537  		return false;
63489f8e8211440 Mike Kravetz    2018-03-22  6538  	}
63489f8e8211440 Mike Kravetz    2018-03-22  6539  =

b2166b156c2b85a Mike Kravetz    2022-07-06  6540  	/*
b2166b156c2b85a Mike Kravetz    2022-07-06  6541  	 * vma specific semaphor=
e used for pmd sharing synchronization
b2166b156c2b85a Mike Kravetz    2022-07-06  6542  	 */
b2166b156c2b85a Mike Kravetz    2022-07-06  6543  	hugetlb_alloc_vma_lock(v=
ma);
b2166b156c2b85a Mike Kravetz    2022-07-06  6544  =

17c9d12e126cb0d Mel Gorman      2009-02-11  6545  	/*
17c9d12e126cb0d Mel Gorman      2009-02-11  6546  	 * Only apply hugepage r=
eservation if asked. At fault time, an
17c9d12e126cb0d Mel Gorman      2009-02-11  6547  	 * attempt will be made =
for VM_NORESERVE to allocate a page
90481622d75715b David Gibson    2012-03-21  6548  	 * without using reserves
17c9d12e126cb0d Mel Gorman      2009-02-11  6549  	 */
ca16d140af91feb KOSAKI Motohiro 2011-05-26  6550  	if (vm_flags & VM_NORESE=
RVE)
33b8f84a4ee7849 Mike Kravetz    2021-02-24  6551  		return true;
17c9d12e126cb0d Mel Gorman      2009-02-11  6552  =

a1e78772d72b261 Mel Gorman      2008-07-23  6553  	/*
a1e78772d72b261 Mel Gorman      2008-07-23  6554  	 * Shared mappings base =
their reservation on the number of pages that
a1e78772d72b261 Mel Gorman      2008-07-23  6555  	 * are already allocated=
 on behalf of the file. Private mappings need
a1e78772d72b261 Mel Gorman      2008-07-23  6556  	 * to reserve the full a=
rea even if read-only as mprotect() may be
a1e78772d72b261 Mel Gorman      2008-07-23  6557  	 * called to make the ma=
pping read-write. Assume !vma is a shm mapping
a1e78772d72b261 Mel Gorman      2008-07-23  6558  	 */
9119a41e9091fb3 Joonsoo Kim     2014-04-03  6559  	if (!vma || vma->vm_flag=
s & VM_MAYSHARE) {
f27a5136f70a8c9 Mike Kravetz    2019-05-13  6560  		/*
f27a5136f70a8c9 Mike Kravetz    2019-05-13  6561  		 * resv_map can not be =
NULL as hugetlb_reserve_pages is only
f27a5136f70a8c9 Mike Kravetz    2019-05-13  6562  		 * called for inodes fo=
r which resv_maps were created (see
f27a5136f70a8c9 Mike Kravetz    2019-05-13  6563  		 * hugetlbfs_get_inode).
f27a5136f70a8c9 Mike Kravetz    2019-05-13  6564  		 */
4e35f483850ba46 Joonsoo Kim     2014-04-03  6565  		resv_map =3D inode_resv=
_map(inode);
9119a41e9091fb3 Joonsoo Kim     2014-04-03  6566  =

0db9d74ed8845a3 Mina Almasry    2020-04-01  6567  		chg =3D region_chg(resv=
_map, from, to, &regions_needed);
9119a41e9091fb3 Joonsoo Kim     2014-04-03  6568  	} else {
e9fe92ae0cd28aa Mina Almasry    2020-04-01  6569  		/* Private mapping. */
9119a41e9091fb3 Joonsoo Kim     2014-04-03  6570  		resv_map =3D resv_map_a=
lloc();
17c9d12e126cb0d Mel Gorman      2009-02-11  6571  		if (!resv_map)
b2166b156c2b85a Mike Kravetz    2022-07-06  6572  			goto out_err;
17c9d12e126cb0d Mel Gorman      2009-02-11  6573  =

a1e78772d72b261 Mel Gorman      2008-07-23  6574  		chg =3D to - from;
84afd99b8398c9d Andy Whitcroft  2008-07-23  6575  =

17c9d12e126cb0d Mel Gorman      2009-02-11  6576  		set_vma_resv_map(vma, r=
esv_map);
17c9d12e126cb0d Mel Gorman      2009-02-11  6577  		set_vma_resv_flags(vma,=
 HPAGE_RESV_OWNER);
17c9d12e126cb0d Mel Gorman      2009-02-11  6578  	}
17c9d12e126cb0d Mel Gorman      2009-02-11  6579  =

33b8f84a4ee7849 Mike Kravetz    2021-02-24  6580  	if (chg < 0)
c50ac050811d648 Dave Hansen     2012-05-29  6581  		goto out_err;
075a61d07a8eca2 Mina Almasry    2020-04-01  6582  =

33b8f84a4ee7849 Mike Kravetz    2021-02-24  6583  	if (hugetlb_cgroup_charg=
e_cgroup_rsvd(hstate_index(h),
33b8f84a4ee7849 Mike Kravetz    2021-02-24  6584  				chg * pages_per_huge_=
page(h), &h_cg) < 0)
075a61d07a8eca2 Mina Almasry    2020-04-01  6585  		goto out_err;
075a61d07a8eca2 Mina Almasry    2020-04-01  6586  =

075a61d07a8eca2 Mina Almasry    2020-04-01  6587  	if (vma && !(vma->vm_fla=
gs & VM_MAYSHARE) && h_cg) {
075a61d07a8eca2 Mina Almasry    2020-04-01  6588  		/* For private mappings=
, the hugetlb_cgroup uncharge info hangs
075a61d07a8eca2 Mina Almasry    2020-04-01  6589  		 * of the resv_map.
075a61d07a8eca2 Mina Almasry    2020-04-01  6590  		 */
075a61d07a8eca2 Mina Almasry    2020-04-01  6591  		resv_map_set_hugetlb_cg=
roup_uncharge_info(resv_map, h_cg, h);
075a61d07a8eca2 Mina Almasry    2020-04-01  6592  	}
075a61d07a8eca2 Mina Almasry    2020-04-01  6593  =

1c5ecae3a93fa1a Mike Kravetz    2015-04-15  6594  	/*
1c5ecae3a93fa1a Mike Kravetz    2015-04-15  6595  	 * There must be enough =
pages in the subpool for the mapping. If
1c5ecae3a93fa1a Mike Kravetz    2015-04-15  6596  	 * the subpool has a min=
imum size, there may be some global
1c5ecae3a93fa1a Mike Kravetz    2015-04-15  6597  	 * reservations already =
in place (gbl_reserve).
1c5ecae3a93fa1a Mike Kravetz    2015-04-15  6598  	 */
1c5ecae3a93fa1a Mike Kravetz    2015-04-15  6599  	gbl_reserve =3D hugepage=
_subpool_get_pages(spool, chg);
33b8f84a4ee7849 Mike Kravetz    2021-02-24  6600  	if (gbl_reserve < 0)
075a61d07a8eca2 Mina Almasry    2020-04-01  6601  		goto out_uncharge_cgrou=
p;
5a6fe1259506760 Mel Gorman      2009-02-10  6602  =

5a6fe1259506760 Mel Gorman      2009-02-10  6603  	/*
17c9d12e126cb0d Mel Gorman      2009-02-11  6604  	 * Check enough hugepage=
s are available for the reservation.
90481622d75715b David Gibson    2012-03-21  6605  	 * Hand the pages back t=
o the subpool if there are not
5a6fe1259506760 Mel Gorman      2009-02-10  6606  	 */
33b8f84a4ee7849 Mike Kravetz    2021-02-24  6607  	if (hugetlb_acct_memory(=
h, gbl_reserve) < 0)
075a61d07a8eca2 Mina Almasry    2020-04-01  6608  		goto out_put_pages;
17c9d12e126cb0d Mel Gorman      2009-02-11  6609  =

17c9d12e126cb0d Mel Gorman      2009-02-11  6610  	/*
17c9d12e126cb0d Mel Gorman      2009-02-11  6611  	 * Account for the reser=
vations made. Shared mappings record regions
17c9d12e126cb0d Mel Gorman      2009-02-11  6612  	 * that have reservation=
s as they are shared by multiple VMAs.
17c9d12e126cb0d Mel Gorman      2009-02-11  6613  	 * When the last VMA dis=
appears, the region map says how much
17c9d12e126cb0d Mel Gorman      2009-02-11  6614  	 * the reservation was a=
nd the page cache tells how much of
17c9d12e126cb0d Mel Gorman      2009-02-11  6615  	 * the reservation was c=
onsumed. Private mappings are per-VMA and
17c9d12e126cb0d Mel Gorman      2009-02-11  6616  	 * only the consumed res=
ervations are tracked. When the VMA
17c9d12e126cb0d Mel Gorman      2009-02-11  6617  	 * disappears, the origi=
nal reservation is the VMA size and the
17c9d12e126cb0d Mel Gorman      2009-02-11  6618  	 * consumed reservations=
 are stored in the map. Hence, nothing
17c9d12e126cb0d Mel Gorman      2009-02-11  6619  	 * else has to be done f=
or private mappings here
17c9d12e126cb0d Mel Gorman      2009-02-11  6620  	 */
33039678c8da813 Mike Kravetz    2015-06-24  6621  	if (!vma || vma->vm_flag=
s & VM_MAYSHARE) {
075a61d07a8eca2 Mina Almasry    2020-04-01  6622  		add =3D region_add(resv=
_map, from, to, regions_needed, h, h_cg);
33039678c8da813 Mike Kravetz    2015-06-24  6623  =

0db9d74ed8845a3 Mina Almasry    2020-04-01  6624  		if (unlikely(add < 0)) {
0db9d74ed8845a3 Mina Almasry    2020-04-01  6625  			hugetlb_acct_memory(h,=
 -gbl_reserve);
075a61d07a8eca2 Mina Almasry    2020-04-01  6626  			goto out_put_pages;
0db9d74ed8845a3 Mina Almasry    2020-04-01  6627  		} else if (unlikely(chg=
 > add)) {
33039678c8da813 Mike Kravetz    2015-06-24  6628  			/*
33039678c8da813 Mike Kravetz    2015-06-24  6629  			 * pages in this range=
 were added to the reserve
33039678c8da813 Mike Kravetz    2015-06-24  6630  			 * map between region_=
chg and region_add.  This
33039678c8da813 Mike Kravetz    2015-06-24  6631  			 * indicates a race wi=
th alloc_huge_page.  Adjust
33039678c8da813 Mike Kravetz    2015-06-24  6632  			 * the subpool and res=
erve counts modified above
33039678c8da813 Mike Kravetz    2015-06-24  6633  			 * based on the differ=
ence.
33039678c8da813 Mike Kravetz    2015-06-24  6634  			 */
33039678c8da813 Mike Kravetz    2015-06-24  6635  			long rsv_adjust;
33039678c8da813 Mike Kravetz    2015-06-24  6636  =

d85aecf2844ff02 Miaohe Lin      2021-03-24  6637  			/*
d85aecf2844ff02 Miaohe Lin      2021-03-24  6638  			 * hugetlb_cgroup_unch=
arge_cgroup_rsvd() will put the
d85aecf2844ff02 Miaohe Lin      2021-03-24  6639  			 * reference to h_cg->=
css. See comment below for detail.
d85aecf2844ff02 Miaohe Lin      2021-03-24  6640  			 */
075a61d07a8eca2 Mina Almasry    2020-04-01  6641  			hugetlb_cgroup_uncharg=
e_cgroup_rsvd(
075a61d07a8eca2 Mina Almasry    2020-04-01  6642  				hstate_index(h),
075a61d07a8eca2 Mina Almasry    2020-04-01  6643  				(chg - add) * pages_p=
er_huge_page(h), h_cg);
075a61d07a8eca2 Mina Almasry    2020-04-01  6644  =

33039678c8da813 Mike Kravetz    2015-06-24  6645  			rsv_adjust =3D hugepag=
e_subpool_put_pages(spool,
33039678c8da813 Mike Kravetz    2015-06-24  6646  								chg - add);
33039678c8da813 Mike Kravetz    2015-06-24  6647  			hugetlb_acct_memory(h,=
 -rsv_adjust);
d85aecf2844ff02 Miaohe Lin      2021-03-24  6648  		} else if (h_cg) {
d85aecf2844ff02 Miaohe Lin      2021-03-24  6649  			/*
d85aecf2844ff02 Miaohe Lin      2021-03-24  6650  			 * The file_regions wi=
ll hold their own reference to
d85aecf2844ff02 Miaohe Lin      2021-03-24  6651  			 * h_cg->css. So we sh=
ould release the reference held
d85aecf2844ff02 Miaohe Lin      2021-03-24  6652  			 * via hugetlb_cgroup_=
charge_cgroup_rsvd() when we are
d85aecf2844ff02 Miaohe Lin      2021-03-24  6653  			 * done.
d85aecf2844ff02 Miaohe Lin      2021-03-24  6654  			 */
d85aecf2844ff02 Miaohe Lin      2021-03-24  6655  			hugetlb_cgroup_put_rsv=
d_cgroup(h_cg);
33039678c8da813 Mike Kravetz    2015-06-24  6656  		}
33039678c8da813 Mike Kravetz    2015-06-24  6657  	}
33b8f84a4ee7849 Mike Kravetz    2021-02-24  6658  	return true;
33b8f84a4ee7849 Mike Kravetz    2021-02-24  6659  =

075a61d07a8eca2 Mina Almasry    2020-04-01  6660  out_put_pages:
075a61d07a8eca2 Mina Almasry    2020-04-01  6661  	/* put back original num=
ber of pages, chg */
075a61d07a8eca2 Mina Almasry    2020-04-01  6662  	(void)hugepage_subpool_p=
ut_pages(spool, chg);
075a61d07a8eca2 Mina Almasry    2020-04-01  6663  out_uncharge_cgroup:
075a61d07a8eca2 Mina Almasry    2020-04-01  6664  	hugetlb_cgroup_uncharge_=
cgroup_rsvd(hstate_index(h),
075a61d07a8eca2 Mina Almasry    2020-04-01  6665  					    chg * pages_per_=
huge_page(h), h_cg);
c50ac050811d648 Dave Hansen     2012-05-29  6666  out_err:
b2166b156c2b85a Mike Kravetz    2022-07-06  6667  	hugetlb_free_vma_lock(vm=
a);
5e9113731a3ce61 Mike Kravetz    2015-09-08  6668  	if (!vma || vma->vm_flag=
s & VM_MAYSHARE)
0db9d74ed8845a3 Mina Almasry    2020-04-01  6669  		/* Only call region_abo=
rt if the region_chg succeeded but the
0db9d74ed8845a3 Mina Almasry    2020-04-01  6670  		 * region_add failed or=
 didn't run.
0db9d74ed8845a3 Mina Almasry    2020-04-01  6671  		 */
0db9d74ed8845a3 Mina Almasry    2020-04-01 @6672  		if (chg >=3D 0 && add <=
 0)
0db9d74ed8845a3 Mina Almasry    2020-04-01  6673  			region_abort(resv_map,=
 from, to, regions_needed);
f031dd274ccb706 Joonsoo Kim     2014-04-03  6674  	if (vma && is_vma_resv_s=
et(vma, HPAGE_RESV_OWNER))
f031dd274ccb706 Joonsoo Kim     2014-04-03  6675  		kref_put(&resv_map->ref=
s, resv_map_release);
33b8f84a4ee7849 Mike Kravetz    2021-02-24  6676  	return false;
a43a8c39bbb493c Kenneth W Chen  2006-06-23  6677  }
a43a8c39bbb493c Kenneth W Chen  2006-06-23  6678  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6897804572736819773==--

