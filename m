Content-Type: multipart/mixed; boundary="===============3385755500670832292=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [luxis1999-iommufd:iommufd-v5.17-rc6 21/28] drivers/iommu/iommufd/pages.c:995 iopt_area_fill_domains() error: uninitialized symbol 'index'.
Date: Fri, 15 Apr 2022 22:22:07 +0800
Message-ID: <202204152242.AswcWIkw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3385755500670832292==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Liu Yi L <yi.l.liu@intel.com>

tree:   https://github.com/luxis1999/iommufd iommufd-v5.17-rc6
head:   71a58479a11e89a480ebc59ed5163440d3e2772c
commit: 085c3eb8ff8b6ef7093d9c798b04d5fab76c41ac [21/28] vfio/pci: Add bind=
_iommufd() support
:::::: branch date: 2 days ago
:::::: commit date: 4 weeks ago
config: arm64-randconfig-m031-20220415 (https://download.01.org/0day-ci/arc=
hive/20220415/202204152242.AswcWIkw-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/iommu/iommufd/pages.c:995 iopt_area_fill_domains() error: uninitial=
ized symbol 'index'.

vim +/index +995 drivers/iommu/iommufd/pages.c

2da819744d404d Jason Gunthorpe 2021-12-13   940  =

2da819744d404d Jason Gunthorpe 2021-12-13   941  /**
2da819744d404d Jason Gunthorpe 2021-12-13   942   * iopt_area_fill_domains(=
) - Install PFNs into the area's domains
2da819744d404d Jason Gunthorpe 2021-12-13   943   * @area: The area to act =
on
2da819744d404d Jason Gunthorpe 2021-12-13   944   * @pages: The pages assoc=
iated with the area (area->pages is NULL)
2da819744d404d Jason Gunthorpe 2021-12-13   945   *
2da819744d404d Jason Gunthorpe 2021-12-13   946   * Called during area crea=
tion. The area is freshly created and not inserted in
2da819744d404d Jason Gunthorpe 2021-12-13   947   * the domains_itree yet. =
PFNs are read and loaded into every domain held in the
2da819744d404d Jason Gunthorpe 2021-12-13   948   * area's io_pagetable and=
 the area is installed in the domains_itree.
2da819744d404d Jason Gunthorpe 2021-12-13   949   *
2da819744d404d Jason Gunthorpe 2021-12-13   950   * On failure all domains =
are left unchanged.
2da819744d404d Jason Gunthorpe 2021-12-13   951   */
2da819744d404d Jason Gunthorpe 2021-12-13   952  int iopt_area_fill_domains=
(struct iopt_area *area, struct iopt_pages *pages)
2da819744d404d Jason Gunthorpe 2021-12-13   953  {
2da819744d404d Jason Gunthorpe 2021-12-13   954  	struct pfn_reader pfns;
2da819744d404d Jason Gunthorpe 2021-12-13   955  	struct iommu_domain *doma=
in;
2da819744d404d Jason Gunthorpe 2021-12-13   956  	unsigned long unmap_index;
2da819744d404d Jason Gunthorpe 2021-12-13   957  	unsigned long index;
2da819744d404d Jason Gunthorpe 2021-12-13   958  	int rc;
2da819744d404d Jason Gunthorpe 2021-12-13   959  =

2da819744d404d Jason Gunthorpe 2021-12-13   960  	lockdep_assert_held(&area=
->iopt->domains_rwsem);
2da819744d404d Jason Gunthorpe 2021-12-13   961  =

2da819744d404d Jason Gunthorpe 2021-12-13   962  	if (xa_empty(&area->iopt-=
>domains))
2da819744d404d Jason Gunthorpe 2021-12-13   963  		return 0;
2da819744d404d Jason Gunthorpe 2021-12-13   964  =

2da819744d404d Jason Gunthorpe 2021-12-13   965  	mutex_lock(&pages->mutex);
2da819744d404d Jason Gunthorpe 2021-12-13   966  	rc =3D pfn_reader_first(&=
pfns, pages, iopt_area_index(area),
2da819744d404d Jason Gunthorpe 2021-12-13   967  			      iopt_area_last_in=
dex(area));
2da819744d404d Jason Gunthorpe 2021-12-13   968  	if (rc)
2da819744d404d Jason Gunthorpe 2021-12-13   969  		goto out_unlock;
2da819744d404d Jason Gunthorpe 2021-12-13   970  =

2da819744d404d Jason Gunthorpe 2021-12-13   971  	while (!pfn_reader_done(&=
pfns)) {
2da819744d404d Jason Gunthorpe 2021-12-13   972  		xa_for_each (&area->iopt=
->domains, index, domain) {
2da819744d404d Jason Gunthorpe 2021-12-13   973  			rc =3D batch_to_domain(=
&pfns.batch, domain, area,
2da819744d404d Jason Gunthorpe 2021-12-13   974  					     pfns.batch_start=
_index);
2da819744d404d Jason Gunthorpe 2021-12-13   975  			if (rc)
2da819744d404d Jason Gunthorpe 2021-12-13   976  				goto out_unmap;
2da819744d404d Jason Gunthorpe 2021-12-13   977  		}
2da819744d404d Jason Gunthorpe 2021-12-13   978  =

2da819744d404d Jason Gunthorpe 2021-12-13   979  		rc =3D pfn_reader_next(&=
pfns);
2da819744d404d Jason Gunthorpe 2021-12-13   980  		if (rc)
2da819744d404d Jason Gunthorpe 2021-12-13   981  			goto out_unmap;
2da819744d404d Jason Gunthorpe 2021-12-13   982  	}
2da819744d404d Jason Gunthorpe 2021-12-13   983  	rc =3D update_pinned(page=
s);
2da819744d404d Jason Gunthorpe 2021-12-13   984  	if (rc)
2da819744d404d Jason Gunthorpe 2021-12-13   985  		goto out_unmap;
2da819744d404d Jason Gunthorpe 2021-12-13   986  =

2da819744d404d Jason Gunthorpe 2021-12-13   987  	area->storage_domain =3D =
xa_load(&area->iopt->domains, 0);
2da819744d404d Jason Gunthorpe 2021-12-13   988  	interval_tree_insert(&are=
a->pages_node, &pages->domains_itree);
2da819744d404d Jason Gunthorpe 2021-12-13   989  	goto out_destroy;
2da819744d404d Jason Gunthorpe 2021-12-13   990  =

2da819744d404d Jason Gunthorpe 2021-12-13   991  out_unmap:
2da819744d404d Jason Gunthorpe 2021-12-13   992  	xa_for_each (&area->iopt-=
>domains, unmap_index, domain) {
2da819744d404d Jason Gunthorpe 2021-12-13   993  		unsigned long end_index =
=3D pfns.batch_start_index;
2da819744d404d Jason Gunthorpe 2021-12-13   994  =

2da819744d404d Jason Gunthorpe 2021-12-13  @995  		if (unmap_index <=3D ind=
ex)
2da819744d404d Jason Gunthorpe 2021-12-13   996  			end_index =3D pfns.batc=
h_end_index;
2da819744d404d Jason Gunthorpe 2021-12-13   997  =

2da819744d404d Jason Gunthorpe 2021-12-13   998  		/*
2da819744d404d Jason Gunthorpe 2021-12-13   999  		 * The area is not yet p=
art of the domains_itree so we have to
2da819744d404d Jason Gunthorpe 2021-12-13  1000  		 * manage the unpinning =
specially. The last domain does the
2da819744d404d Jason Gunthorpe 2021-12-13  1001  		 * unpin, every other do=
main is just unmapped.
2da819744d404d Jason Gunthorpe 2021-12-13  1002  		 */
2da819744d404d Jason Gunthorpe 2021-12-13  1003  		if (unmap_index !=3D are=
a->iopt->next_domain_id - 1) {
2da819744d404d Jason Gunthorpe 2021-12-13  1004  			if (end_index !=3D iopt=
_area_index(area))
2da819744d404d Jason Gunthorpe 2021-12-13  1005  				iopt_area_unmap_domain=
_range(
2da819744d404d Jason Gunthorpe 2021-12-13  1006  					area, domain, iopt_ar=
ea_index(area),
2da819744d404d Jason Gunthorpe 2021-12-13  1007  					end_index - 1);
2da819744d404d Jason Gunthorpe 2021-12-13  1008  		} else {
2da819744d404d Jason Gunthorpe 2021-12-13  1009  			iopt_area_unfill_partia=
l_domain(area, pages, domain,
2da819744d404d Jason Gunthorpe 2021-12-13  1010  							end_index);
2da819744d404d Jason Gunthorpe 2021-12-13  1011  		}
2da819744d404d Jason Gunthorpe 2021-12-13  1012  	}
2da819744d404d Jason Gunthorpe 2021-12-13  1013  out_destroy:
2da819744d404d Jason Gunthorpe 2021-12-13  1014  	pfn_reader_destroy(&pfns);
2da819744d404d Jason Gunthorpe 2021-12-13  1015  out_unlock:
2da819744d404d Jason Gunthorpe 2021-12-13  1016  	mutex_unlock(&pages->mute=
x);
2da819744d404d Jason Gunthorpe 2021-12-13  1017  	return rc;
2da819744d404d Jason Gunthorpe 2021-12-13  1018  }
2da819744d404d Jason Gunthorpe 2021-12-13  1019  =


:::::: The code at line 995 was first introduced by commit
:::::: 2da819744d404d26ae32e6f04c53c9ee23216972 iommufd: Algorithms for PFN=
 storage

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3385755500670832292==--

