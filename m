Content-Type: multipart/mixed; boundary="===============7721737591099980067=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [luxis1999-iommufd:vsva-iommufd-v5.18-rc4-joerg-branch 6/42] drivers/iommu/iommufd/pages.c:991 iopt_area_fill_domains() error: uninitialized symbol 'index'.
Date: Mon, 09 May 2022 22:42:08 +0800
Message-ID: <202205092202.hlc8JgUy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7721737591099980067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Liu Yi L <yi.l.liu@intel.com>

tree:   https://github.com/luxis1999/iommufd vsva-iommufd-v5.18-rc4-joerg-b=
ranch
head:   1da48fc20a9603c05ac0e88aa4bc063cc426b232
commit: ecd2a281b1dd0543dbb6fcce44ada8a98588c0cf [6/42] iommufd: Algorithms=
 for PFN storage
:::::: branch date: 8 hours ago
:::::: commit date: 7 days ago
config: i386-randconfig-m021-20220509 (https://download.01.org/0day-ci/arch=
ive/20220509/202205092202.hlc8JgUy-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/iommu/iommufd/pages.c:991 iopt_area_fill_domains() error: uninitial=
ized symbol 'index'.

vim +/index +991 drivers/iommu/iommufd/pages.c

ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   936  =

ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   937  /**
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   938   * iopt_area_fill_domains(=
) - Install PFNs into the area's domains
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   939   * @area: The area to act =
on
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   940   * @pages: The pages assoc=
iated with the area (area->pages is NULL)
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   941   *
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   942   * Called during area crea=
tion. The area is freshly created and not inserted in
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   943   * the domains_itree yet. =
PFNs are read and loaded into every domain held in the
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   944   * area's io_pagetable and=
 the area is installed in the domains_itree.
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   945   *
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   946   * On failure all domains =
are left unchanged.
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   947   */
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   948  int iopt_area_fill_domains=
(struct iopt_area *area, struct iopt_pages *pages)
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   949  {
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   950  	struct pfn_reader pfns;
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   951  	struct iommu_domain *doma=
in;
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   952  	unsigned long unmap_index;
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   953  	unsigned long index;
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   954  	int rc;
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   955  =

ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   956  	lockdep_assert_held(&area=
->iopt->domains_rwsem);
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   957  =

ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   958  	if (xa_empty(&area->iopt-=
>domains))
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   959  		return 0;
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   960  =

ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   961  	mutex_lock(&pages->mutex);
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   962  	rc =3D pfn_reader_first(&=
pfns, pages, iopt_area_index(area),
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   963  			      iopt_area_last_in=
dex(area));
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   964  	if (rc)
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   965  		goto out_unlock;
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   966  =

ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   967  	while (!pfn_reader_done(&=
pfns)) {
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   968  		xa_for_each (&area->iopt=
->domains, index, domain) {
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   969  			rc =3D batch_to_domain(=
&pfns.batch, domain, area,
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   970  					     pfns.batch_start=
_index);
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   971  			if (rc)
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   972  				goto out_unmap;
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   973  		}
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   974  =

ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   975  		rc =3D pfn_reader_next(&=
pfns);
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   976  		if (rc)
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   977  			goto out_unmap;
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   978  	}
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   979  	rc =3D update_pinned(page=
s);
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   980  	if (rc)
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   981  		goto out_unmap;
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   982  =

ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   983  	area->storage_domain =3D =
xa_load(&area->iopt->domains, 0);
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   984  	interval_tree_insert(&are=
a->pages_node, &pages->domains_itree);
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   985  	goto out_destroy;
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   986  =

ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   987  out_unmap:
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   988  	xa_for_each (&area->iopt-=
>domains, unmap_index, domain) {
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   989  		unsigned long end_index =
=3D pfns.batch_start_index;
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   990  =

ecd2a281b1dd05 Jason Gunthorpe 2021-12-13  @991  		if (unmap_index <=3D ind=
ex)
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   992  			end_index =3D pfns.batc=
h_end_index;
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   993  =

ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   994  		/*
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   995  		 * The area is not yet p=
art of the domains_itree so we have to
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   996  		 * manage the unpinning =
specially. The last domain does the
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   997  		 * unpin, every other do=
main is just unmapped.
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   998  		 */
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13   999  		if (unmap_index !=3D are=
a->iopt->next_domain_id - 1) {
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13  1000  			if (end_index !=3D iopt=
_area_index(area))
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13  1001  				iopt_area_unmap_domain=
_range(
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13  1002  					area, domain, iopt_ar=
ea_index(area),
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13  1003  					end_index - 1);
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13  1004  		} else {
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13  1005  			iopt_area_unfill_partia=
l_domain(area, pages, domain,
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13  1006  							end_index);
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13  1007  		}
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13  1008  	}
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13  1009  out_destroy:
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13  1010  	pfn_reader_destroy(&pfns);
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13  1011  out_unlock:
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13  1012  	mutex_unlock(&pages->mute=
x);
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13  1013  	return rc;
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13  1014  }
ecd2a281b1dd05 Jason Gunthorpe 2021-12-13  1015  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7721737591099980067==--

