Content-Type: multipart/mixed; boundary="===============7256044049881396576=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 5/5] vfio/iommu_type1: Simplify group attachment
Date: Sat, 11 Jun 2022 00:39:39 +0800
Message-ID: <202206110041.8CaoeVuj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7256044049881396576==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220606061927.26049-6-nicolinc@nvidia.com>
References: <20220606061927.26049-6-nicolinc@nvidia.com>
TO: Nicolin Chen <nicolinc@nvidia.com>
TO: jgg(a)nvidia.com
TO: joro(a)8bytes.org
TO: will(a)kernel.org
TO: marcan(a)marcan.st
TO: sven(a)svenpeter.dev
TO: robin.murphy(a)arm.com
TO: robdclark(a)gmail.com
TO: m.szyprowski(a)samsung.com
TO: krzysztof.kozlowski(a)linaro.org
TO: baolu.lu(a)linux.intel.com
TO: agross(a)kernel.org
TO: bjorn.andersson(a)linaro.org
TO: matthias.bgg(a)gmail.com
TO: heiko(a)sntech.de
TO: orsonzhai(a)gmail.com
TO: baolin.wang7(a)gmail.com
TO: zhang.lyra(a)gmail.com
TO: wens(a)csie.org
TO: jernej.skrabec(a)gmail.com
TO: samuel(a)sholland.org
TO: jean-philippe(a)linaro.org
TO: alex.williamson(a)redhat.com
CC: suravee.suthikulpanit(a)amd.com
CC: alyssa(a)rosenzweig.io
CC: alim.akhtar(a)samsung.com
CC: dwmw2(a)infradead.org
CC: yong.wu(a)mediatek.com
CC: mjrosato(a)linux.ibm.com
CC: gerald.schaefer(a)linux.ibm.com
CC: thierry.reding(a)gmail.com

Hi Nicolin,

I love your patch! Perhaps something to improve:

[auto build test WARNING on joro-iommu/next]
[also build test WARNING on tegra/for-next v5.19-rc1 next-20220610]
[cannot apply to awilliam-vfio/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicolin-Chen/Simplif=
y-vfio_iommu_type1-attach-detach-routine/20220606-143004
base:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git next
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
611/202206110041.8CaoeVuj-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/vfio/vfio_iommu_type1.c:2229 vfio_iommu_alloc_attach_domain() error=
: we previously assumed 'domain' could be null (see line 2191)
drivers/vfio/vfio_iommu_type1.c:2229 vfio_iommu_alloc_attach_domain() error=
: dereferencing freed memory 'domain'

vim +/domain +2229 drivers/vfio/vfio_iommu_type1.c

572f64c71e0fe3 Zenghui Yu   2020-10-22  2156  =

c1a4076891cf18 Nicolin Chen 2022-06-05  2157  static struct vfio_domain *
c1a4076891cf18 Nicolin Chen 2022-06-05  2158  vfio_iommu_alloc_attach_domai=
n(struct bus_type *bus, struct vfio_iommu *iommu,
c1a4076891cf18 Nicolin Chen 2022-06-05  2159  			       struct vfio_iommu_g=
roup *group)
c1a4076891cf18 Nicolin Chen 2022-06-05  2160  {
c1a4076891cf18 Nicolin Chen 2022-06-05  2161  	struct iommu_domain *new_dom=
ain;
c1a4076891cf18 Nicolin Chen 2022-06-05  2162  	struct vfio_domain *domain;
c1a4076891cf18 Nicolin Chen 2022-06-05  2163  	int ret =3D 0;
c1a4076891cf18 Nicolin Chen 2022-06-05  2164  =

c1a4076891cf18 Nicolin Chen 2022-06-05  2165  	/* Try to match an existing =
compatible domain */
c1a4076891cf18 Nicolin Chen 2022-06-05  2166  	list_for_each_entry (domain,=
 &iommu->domain_list, next) {
c1a4076891cf18 Nicolin Chen 2022-06-05  2167  		ret =3D iommu_attach_group(=
domain->domain, group->iommu_group);
c1a4076891cf18 Nicolin Chen 2022-06-05  2168  		if (ret =3D=3D -EMEDIUMTYPE)
c1a4076891cf18 Nicolin Chen 2022-06-05  2169  			continue;
c1a4076891cf18 Nicolin Chen 2022-06-05  2170  		if (ret)
c1a4076891cf18 Nicolin Chen 2022-06-05  2171  			return ERR_PTR(ret);
c1a4076891cf18 Nicolin Chen 2022-06-05  2172  		list_add(&group->next, &dom=
ain->group_list);
c1a4076891cf18 Nicolin Chen 2022-06-05  2173  		return domain;
c1a4076891cf18 Nicolin Chen 2022-06-05  2174  	}
c1a4076891cf18 Nicolin Chen 2022-06-05  2175  =

c1a4076891cf18 Nicolin Chen 2022-06-05  2176  	new_domain =3D iommu_domain_=
alloc(bus);
c1a4076891cf18 Nicolin Chen 2022-06-05  2177  	if (!new_domain)
c1a4076891cf18 Nicolin Chen 2022-06-05  2178  		return ERR_PTR(-EIO);
c1a4076891cf18 Nicolin Chen 2022-06-05  2179  =

c1a4076891cf18 Nicolin Chen 2022-06-05  2180  	if (iommu->nesting) {
c1a4076891cf18 Nicolin Chen 2022-06-05  2181  		ret =3D iommu_enable_nestin=
g(new_domain);
c1a4076891cf18 Nicolin Chen 2022-06-05  2182  		if (ret)
c1a4076891cf18 Nicolin Chen 2022-06-05  2183  			goto out_free_iommu_domain;
c1a4076891cf18 Nicolin Chen 2022-06-05  2184  	}
c1a4076891cf18 Nicolin Chen 2022-06-05  2185  =

c1a4076891cf18 Nicolin Chen 2022-06-05  2186  	ret =3D iommu_attach_group(n=
ew_domain, group->iommu_group);
c1a4076891cf18 Nicolin Chen 2022-06-05  2187  	if (ret)
c1a4076891cf18 Nicolin Chen 2022-06-05  2188  		goto out_free_iommu_domain;
c1a4076891cf18 Nicolin Chen 2022-06-05  2189  =

c1a4076891cf18 Nicolin Chen 2022-06-05  2190  	domain =3D kzalloc(sizeof(*d=
omain), GFP_KERNEL);
c1a4076891cf18 Nicolin Chen 2022-06-05 @2191  	if (!domain) {
c1a4076891cf18 Nicolin Chen 2022-06-05  2192  		ret =3D -ENOMEM;
c1a4076891cf18 Nicolin Chen 2022-06-05  2193  		goto out_detach;
c1a4076891cf18 Nicolin Chen 2022-06-05  2194  	}
c1a4076891cf18 Nicolin Chen 2022-06-05  2195  =

c1a4076891cf18 Nicolin Chen 2022-06-05  2196  	domain->domain =3D new_domai=
n;
c1a4076891cf18 Nicolin Chen 2022-06-05  2197  	vfio_test_domain_fgsp(domain=
);
c1a4076891cf18 Nicolin Chen 2022-06-05  2198  =

c1a4076891cf18 Nicolin Chen 2022-06-05  2199  	/*
c1a4076891cf18 Nicolin Chen 2022-06-05  2200  	 * If the IOMMU can block no=
n-coherent operations (ie PCIe TLPs with
c1a4076891cf18 Nicolin Chen 2022-06-05  2201  	 * no-snoop set) then VFIO a=
lways turns this feature on because on Intel
c1a4076891cf18 Nicolin Chen 2022-06-05  2202  	 * platforms it optimizes KV=
M to disable wbinvd emulation.
c1a4076891cf18 Nicolin Chen 2022-06-05  2203  	 */
c1a4076891cf18 Nicolin Chen 2022-06-05  2204  	if (new_domain->ops->enforce=
_cache_coherency)
c1a4076891cf18 Nicolin Chen 2022-06-05  2205  		domain->enforce_cache_coher=
ency =3D
c1a4076891cf18 Nicolin Chen 2022-06-05  2206  			new_domain->ops->enforce_c=
ache_coherency(new_domain);
c1a4076891cf18 Nicolin Chen 2022-06-05  2207  =

c1a4076891cf18 Nicolin Chen 2022-06-05  2208  	/* replay mappings on new do=
mains */
c1a4076891cf18 Nicolin Chen 2022-06-05  2209  	ret =3D vfio_iommu_replay(io=
mmu, domain);
c1a4076891cf18 Nicolin Chen 2022-06-05  2210  	if (ret)
c1a4076891cf18 Nicolin Chen 2022-06-05  2211  		goto out_free_domain;
c1a4076891cf18 Nicolin Chen 2022-06-05  2212  =

c1a4076891cf18 Nicolin Chen 2022-06-05  2213  	/*
c1a4076891cf18 Nicolin Chen 2022-06-05  2214  	 * An iommu backed group can=
 dirty memory directly and therefore
c1a4076891cf18 Nicolin Chen 2022-06-05  2215  	 * demotes the iommu scope u=
ntil it declares itself dirty tracking
c1a4076891cf18 Nicolin Chen 2022-06-05  2216  	 * capable via the page pinn=
ing interface.
c1a4076891cf18 Nicolin Chen 2022-06-05  2217  	 */
c1a4076891cf18 Nicolin Chen 2022-06-05  2218  	iommu->num_non_pinned_groups=
++;
c1a4076891cf18 Nicolin Chen 2022-06-05  2219  =

c1a4076891cf18 Nicolin Chen 2022-06-05  2220  	INIT_LIST_HEAD(&domain->grou=
p_list);
c1a4076891cf18 Nicolin Chen 2022-06-05  2221  	list_add(&group->next, &doma=
in->group_list);
c1a4076891cf18 Nicolin Chen 2022-06-05  2222  	list_add(&domain->next, &iom=
mu->domain_list);
c1a4076891cf18 Nicolin Chen 2022-06-05  2223  	vfio_update_pgsize_bitmap(io=
mmu);
c1a4076891cf18 Nicolin Chen 2022-06-05  2224  	return domain;
c1a4076891cf18 Nicolin Chen 2022-06-05  2225  =

c1a4076891cf18 Nicolin Chen 2022-06-05  2226  out_free_domain:
c1a4076891cf18 Nicolin Chen 2022-06-05  2227  	kfree(domain);
c1a4076891cf18 Nicolin Chen 2022-06-05  2228  out_detach:
c1a4076891cf18 Nicolin Chen 2022-06-05 @2229  	iommu_detach_group(domain->d=
omain, group->iommu_group);
c1a4076891cf18 Nicolin Chen 2022-06-05  2230  out_free_iommu_domain:
c1a4076891cf18 Nicolin Chen 2022-06-05  2231  	iommu_domain_free(new_domain=
);
c1a4076891cf18 Nicolin Chen 2022-06-05  2232  	return ERR_PTR(ret);
c1a4076891cf18 Nicolin Chen 2022-06-05  2233  }
c1a4076891cf18 Nicolin Chen 2022-06-05  2234  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7256044049881396576==--

