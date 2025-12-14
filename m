Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3664217A316
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 04:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765687229; cv=none; b=cQCFGjefcY2yvq6Picz2YHX8OfnecYRXYrVf4Q1BfBuunE0ZcPTsUpdgP0tXbTOHwwuqSiodVlFZ1SjrRt4tcJHA1yJOsuPFWPZFNrwPSRWR2PtYGxfJZL8X05PDoqJZRoPIo8H3Amc/r3fXKURtibys5LaA4zIdSPNMDTlPUUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765687229; c=relaxed/simple;
	bh=EGIPOGYTYNJiEL7upyqHnT4emAJGgDo/8UOmiiJEw1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OvO0fQffkX9gBYncTa2jIw7Pi7/jhYkkP5/ONqBYv8Ory8o8qcNTctSMRYt/B24PBXqVARbRkZjgrl/jcIAEUuMjr+sDOlGMlJi+BUHi/71fnJo/X7uWpZ20Qv5qolah/EofWMfAj/PlynMU5ZFu/4r+Y99JnUfIQLGD2eiZv+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z+IbfqTm; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+IbfqTm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765687227; x=1797223227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EGIPOGYTYNJiEL7upyqHnT4emAJGgDo/8UOmiiJEw1A=;
  b=Z+IbfqTmRiJ0nsBze71+t0ZyuErxuSVHM+ravd1i34uS5ByHVdBg+Ohf
   DSecpG5/VH2Hp2/z9j/Cq8YwySkXlu9V1QjgXHCtP7vU6Afbwt7+ThZGl
   Zt8X/sTiIeZn7PzMCWQXmRnIvFLUnLxt5yxzbnBCKgHjMWhmPcxCQq2aF
   nRfjn9r/yOTMP9sZ1MjDqaHRCdgpYe3YjUioenJBvncutU6JPgUmTKJLA
   CYMhWe/XVSOQUmGBF4CbRi9UUFXrHt5+fSFmPrI3v9mBQO2ZJ/YG5DVRe
   iY8ojztztYxNPg6gbJAqFcgUaXMdBVaQoTsAJhAOKF7VLfGxCj+wyZNk/
   A==;
X-CSE-ConnectionGUID: GoUI/g96S2SIeuUyDE5ogw==
X-CSE-MsgGUID: 4968vlSOQmmNlChmAetNmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="79002817"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="79002817"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 20:40:27 -0800
X-CSE-ConnectionGUID: Dk0TLVErQva4u0ZbFnCPAg==
X-CSE-MsgGUID: pNhhIfTERiynPiUXISoUTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197059155"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Dec 2025 20:40:25 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUduB-000000008aF-0QFk;
	Sun, 14 Dec 2025 04:40:23 +0000
Date: Sun, 14 Dec 2025 12:40:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/vfio/vfio_iommu_type1.c:2374 vfio_iommu_type1_attach_group()
 warn: '&group->next' not removed from list
Message-ID: <202512141215.wELQfiRX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Li Zhe <lizhe.67@bytedance.com>
CC: Alex Williamson <alex.williamson@redhat.com>
CC: David Hildenbrand <david@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a298a43f5e339f48d2dda0665c02b88ee9a4e03
commit: 089722e8939e580c9ccc64678ba22f563fdf3bb5 vfio/type1: introduce a new member has_rsvd for struct vfio_dma
date:   10 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 10 weeks ago
config: i386-randconfig-141-20251213 (https://download.01.org/0day-ci/archive/20251214/202512141215.wELQfiRX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512141215.wELQfiRX-lkp@intel.com/

New smatch warnings:
drivers/vfio/vfio_iommu_type1.c:2374 vfio_iommu_type1_attach_group() warn: '&group->next' not removed from list

Old smatch warnings:
drivers/vfio/vfio_iommu_type1.c:786 vfio_pin_pages_remote() error: uninitialized symbol 'rsvd'.

vim +2374 drivers/vfio/vfio_iommu_type1.c

eed20c782aea57 Robin Murphy      2022-06-24  2187  
73fa0d10d077d9 Alex Williamson   2012-07-31  2188  static int vfio_iommu_type1_attach_group(void *iommu_data,
c3c0fa9d94f707 Christoph Hellwig 2021-09-24  2189  		struct iommu_group *iommu_group, enum vfio_group_type type)
73fa0d10d077d9 Alex Williamson   2012-07-31  2190  {
73fa0d10d077d9 Alex Williamson   2012-07-31  2191  	struct vfio_iommu *iommu = iommu_data;
c7396f2eac2bf9 Max Gurtovoy      2021-06-08  2192  	struct vfio_iommu_group *group;
1ef3e2bc04223f Alex Williamson   2014-02-26  2193  	struct vfio_domain *domain, *d;
6b1a7a00427cb5 Jason Gunthorpe   2022-12-08  2194  	bool resv_msi;
95f89e090618ef Joerg Roedel      2019-10-15  2195  	phys_addr_t resv_msi_base = 0;
bc9a05eef113e7 Christoph Hellwig 2021-04-01  2196  	struct iommu_domain_geometry *geo;
1108696aecf048 Shameer Kolothum  2019-07-23  2197  	LIST_HEAD(iova_copy);
af029169b8fdae Shameer Kolothum  2019-07-23  2198  	LIST_HEAD(group_resv_regions);
ef3a3f6a294ba6 Steve Sistare     2023-01-31  2199  	int ret = -EBUSY;
73fa0d10d077d9 Alex Williamson   2012-07-31  2200  
73fa0d10d077d9 Alex Williamson   2012-07-31  2201  	mutex_lock(&iommu->lock);
73fa0d10d077d9 Alex Williamson   2012-07-31  2202  
ef3a3f6a294ba6 Steve Sistare     2023-01-31  2203  	/* Attach could require pinning, so disallow while vaddr is invalid. */
ef3a3f6a294ba6 Steve Sistare     2023-01-31  2204  	if (iommu->vaddr_invalid_count)
ef3a3f6a294ba6 Steve Sistare     2023-01-31  2205  		goto out_unlock;
ef3a3f6a294ba6 Steve Sistare     2023-01-31  2206  
572f64c71e0fe3 Zenghui Yu        2020-10-22  2207  	/* Check for duplicates */
ef3a3f6a294ba6 Steve Sistare     2023-01-31  2208  	ret = -EINVAL;
296e505baddf92 Christoph Hellwig 2021-09-24  2209  	if (vfio_iommu_find_iommu_group(iommu, iommu_group))
296e505baddf92 Christoph Hellwig 2021-09-24  2210  		goto out_unlock;
a54eb55045ae9b Kirti Wankhede    2016-11-17  2211  
1ef3e2bc04223f Alex Williamson   2014-02-26  2212  	ret = -ENOMEM;
296e505baddf92 Christoph Hellwig 2021-09-24  2213  	group = kzalloc(sizeof(*group), GFP_KERNEL);
296e505baddf92 Christoph Hellwig 2021-09-24  2214  	if (!group)
296e505baddf92 Christoph Hellwig 2021-09-24  2215  		goto out_unlock;
1ef3e2bc04223f Alex Williamson   2014-02-26  2216  	group->iommu_group = iommu_group;
1ef3e2bc04223f Alex Williamson   2014-02-26  2217  
c3c0fa9d94f707 Christoph Hellwig 2021-09-24  2218  	if (type == VFIO_EMULATED_IOMMU) {
296e505baddf92 Christoph Hellwig 2021-09-24  2219  		list_add(&group->next, &iommu->emulated_iommu_groups);
95fc87b44104d9 Kirti Wankhede    2020-05-29  2220  		/*
296e505baddf92 Christoph Hellwig 2021-09-24  2221  		 * An emulated IOMMU group cannot dirty memory directly, it can
fda49d97f2c4fa Christoph Hellwig 2021-09-24  2222  		 * only use interfaces that provide dirty tracking.
fda49d97f2c4fa Christoph Hellwig 2021-09-24  2223  		 * The iommu scope can only be promoted with the addition of a
fda49d97f2c4fa Christoph Hellwig 2021-09-24  2224  		 * dirty tracking group.
95fc87b44104d9 Kirti Wankhede    2020-05-29  2225  		 */
95fc87b44104d9 Kirti Wankhede    2020-05-29  2226  		group->pinned_page_dirty_scope = true;
296e505baddf92 Christoph Hellwig 2021-09-24  2227  		ret = 0;
296e505baddf92 Christoph Hellwig 2021-09-24  2228  		goto out_unlock;
a54eb55045ae9b Kirti Wankhede    2016-11-17  2229  	}
be068fa236c3d6 Lu Baolu          2019-04-12  2230  
296e505baddf92 Christoph Hellwig 2021-09-24  2231  	ret = -ENOMEM;
296e505baddf92 Christoph Hellwig 2021-09-24  2232  	domain = kzalloc(sizeof(*domain), GFP_KERNEL);
296e505baddf92 Christoph Hellwig 2021-09-24  2233  	if (!domain)
296e505baddf92 Christoph Hellwig 2021-09-24  2234  		goto out_free_group;
296e505baddf92 Christoph Hellwig 2021-09-24  2235  
eed20c782aea57 Robin Murphy      2022-06-24  2236  	/*
eed20c782aea57 Robin Murphy      2022-06-24  2237  	 * Going via the iommu_group iterator avoids races, and trivially gives
eed20c782aea57 Robin Murphy      2022-06-24  2238  	 * us a representative device for the IOMMU API call. We don't actually
eed20c782aea57 Robin Murphy      2022-06-24  2239  	 * want to iterate beyond the first device (if any).
eed20c782aea57 Robin Murphy      2022-06-24  2240  	 */
eed20c782aea57 Robin Murphy      2022-06-24  2241  	iommu_group_for_each_dev(iommu_group, &domain->domain,
eed20c782aea57 Robin Murphy      2022-06-24  2242  				 vfio_iommu_domain_alloc);
60ffc45017229e Lu Baolu          2024-06-10  2243  	if (IS_ERR(domain->domain)) {
60ffc45017229e Lu Baolu          2024-06-10  2244  		ret = PTR_ERR(domain->domain);
296e505baddf92 Christoph Hellwig 2021-09-24  2245  		goto out_free_domain;
60ffc45017229e Lu Baolu          2024-06-10  2246  	}
1ef3e2bc04223f Alex Williamson   2014-02-26  2247  
fda49d97f2c4fa Christoph Hellwig 2021-09-24  2248  	ret = iommu_attach_group(domain->domain, group->iommu_group);
1ef3e2bc04223f Alex Williamson   2014-02-26  2249  	if (ret)
1ef3e2bc04223f Alex Williamson   2014-02-26  2250  		goto out_domain;
1ef3e2bc04223f Alex Williamson   2014-02-26  2251  
1108696aecf048 Shameer Kolothum  2019-07-23  2252  	/* Get aperture info */
bc9a05eef113e7 Christoph Hellwig 2021-04-01  2253  	geo = &domain->domain->geometry;
bc9a05eef113e7 Christoph Hellwig 2021-04-01  2254  	if (vfio_iommu_aper_conflict(iommu, geo->aperture_start,
bc9a05eef113e7 Christoph Hellwig 2021-04-01  2255  				     geo->aperture_end)) {
1108696aecf048 Shameer Kolothum  2019-07-23  2256  		ret = -EINVAL;
1108696aecf048 Shameer Kolothum  2019-07-23  2257  		goto out_detach;
1108696aecf048 Shameer Kolothum  2019-07-23  2258  	}
1108696aecf048 Shameer Kolothum  2019-07-23  2259  
af029169b8fdae Shameer Kolothum  2019-07-23  2260  	ret = iommu_get_group_resv_regions(iommu_group, &group_resv_regions);
af029169b8fdae Shameer Kolothum  2019-07-23  2261  	if (ret)
af029169b8fdae Shameer Kolothum  2019-07-23  2262  		goto out_detach;
af029169b8fdae Shameer Kolothum  2019-07-23  2263  
af029169b8fdae Shameer Kolothum  2019-07-23  2264  	if (vfio_iommu_resv_conflict(iommu, &group_resv_regions)) {
af029169b8fdae Shameer Kolothum  2019-07-23  2265  		ret = -EINVAL;
af029169b8fdae Shameer Kolothum  2019-07-23  2266  		goto out_detach;
af029169b8fdae Shameer Kolothum  2019-07-23  2267  	}
af029169b8fdae Shameer Kolothum  2019-07-23  2268  
1108696aecf048 Shameer Kolothum  2019-07-23  2269  	/*
1108696aecf048 Shameer Kolothum  2019-07-23  2270  	 * We don't want to work on the original iova list as the list
1108696aecf048 Shameer Kolothum  2019-07-23  2271  	 * gets modified and in case of failure we have to retain the
1108696aecf048 Shameer Kolothum  2019-07-23  2272  	 * original list. Get a copy here.
1108696aecf048 Shameer Kolothum  2019-07-23  2273  	 */
1108696aecf048 Shameer Kolothum  2019-07-23  2274  	ret = vfio_iommu_iova_get_copy(iommu, &iova_copy);
1108696aecf048 Shameer Kolothum  2019-07-23  2275  	if (ret)
1108696aecf048 Shameer Kolothum  2019-07-23  2276  		goto out_detach;
1108696aecf048 Shameer Kolothum  2019-07-23  2277  
bc9a05eef113e7 Christoph Hellwig 2021-04-01  2278  	ret = vfio_iommu_aper_resize(&iova_copy, geo->aperture_start,
bc9a05eef113e7 Christoph Hellwig 2021-04-01  2279  				     geo->aperture_end);
1108696aecf048 Shameer Kolothum  2019-07-23  2280  	if (ret)
1108696aecf048 Shameer Kolothum  2019-07-23  2281  		goto out_detach;
1108696aecf048 Shameer Kolothum  2019-07-23  2282  
af029169b8fdae Shameer Kolothum  2019-07-23  2283  	ret = vfio_iommu_resv_exclude(&iova_copy, &group_resv_regions);
af029169b8fdae Shameer Kolothum  2019-07-23  2284  	if (ret)
af029169b8fdae Shameer Kolothum  2019-07-23  2285  		goto out_detach;
af029169b8fdae Shameer Kolothum  2019-07-23  2286  
b09d6e47397409 Shameer Kolothum  2019-07-23  2287  	resv_msi = vfio_iommu_has_sw_msi(&group_resv_regions, &resv_msi_base);
5d704992189fe8 Eric Auger        2017-01-19  2288  
1ef3e2bc04223f Alex Williamson   2014-02-26  2289  	INIT_LIST_HEAD(&domain->group_list);
1ef3e2bc04223f Alex Williamson   2014-02-26  2290  	list_add(&group->next, &domain->group_list);
1ef3e2bc04223f Alex Williamson   2014-02-26  2291  
6b1a7a00427cb5 Jason Gunthorpe   2022-12-08  2292  	if (!allow_unsafe_interrupts &&
6b1a7a00427cb5 Jason Gunthorpe   2022-12-08  2293  	    !iommu_group_has_isolated_msi(iommu_group)) {
1ef3e2bc04223f Alex Williamson   2014-02-26  2294  		pr_warn("%s: No interrupt remapping support.  Use the module param \"allow_unsafe_interrupts\" to enable VFIO IOMMU support on this platform\n",
1ef3e2bc04223f Alex Williamson   2014-02-26  2295  		       __func__);
1ef3e2bc04223f Alex Williamson   2014-02-26  2296  		ret = -EPERM;
1ef3e2bc04223f Alex Williamson   2014-02-26  2297  		goto out_detach;
1ef3e2bc04223f Alex Williamson   2014-02-26  2298  	}
1ef3e2bc04223f Alex Williamson   2014-02-26  2299  
71cfafda9c9bd9 Jason Gunthorpe   2022-04-11  2300  	/*
71cfafda9c9bd9 Jason Gunthorpe   2022-04-11  2301  	 * If the IOMMU can block non-coherent operations (ie PCIe TLPs with
71cfafda9c9bd9 Jason Gunthorpe   2022-04-11  2302  	 * no-snoop set) then VFIO always turns this feature on because on Intel
71cfafda9c9bd9 Jason Gunthorpe   2022-04-11  2303  	 * platforms it optimizes KVM to disable wbinvd emulation.
71cfafda9c9bd9 Jason Gunthorpe   2022-04-11  2304  	 */
71cfafda9c9bd9 Jason Gunthorpe   2022-04-11  2305  	if (domain->domain->ops->enforce_cache_coherency)
71cfafda9c9bd9 Jason Gunthorpe   2022-04-11  2306  		domain->enforce_cache_coherency =
71cfafda9c9bd9 Jason Gunthorpe   2022-04-11  2307  			domain->domain->ops->enforce_cache_coherency(
71cfafda9c9bd9 Jason Gunthorpe   2022-04-11  2308  				domain->domain);
1ef3e2bc04223f Alex Williamson   2014-02-26  2309  
73fa0d10d077d9 Alex Williamson   2012-07-31  2310  	/*
1ef3e2bc04223f Alex Williamson   2014-02-26  2311  	 * Try to match an existing compatible domain.  We don't want to
1ef3e2bc04223f Alex Williamson   2014-02-26  2312  	 * preclude an IOMMU driver supporting multiple bus_types and being
1ef3e2bc04223f Alex Williamson   2014-02-26  2313  	 * able to include different bus_types in the same IOMMU domain, so
1ef3e2bc04223f Alex Williamson   2014-02-26  2314  	 * we test whether the domains use the same iommu_ops rather than
1ef3e2bc04223f Alex Williamson   2014-02-26  2315  	 * testing if they're on the same bus_type.
73fa0d10d077d9 Alex Williamson   2012-07-31  2316  	 */
1ef3e2bc04223f Alex Williamson   2014-02-26  2317  	list_for_each_entry(d, &iommu->domain_list, next) {
1ef3e2bc04223f Alex Williamson   2014-02-26  2318  		if (d->domain->ops == domain->domain->ops &&
71cfafda9c9bd9 Jason Gunthorpe   2022-04-11  2319  		    d->enforce_cache_coherency ==
71cfafda9c9bd9 Jason Gunthorpe   2022-04-11  2320  			    domain->enforce_cache_coherency) {
fda49d97f2c4fa Christoph Hellwig 2021-09-24  2321  			iommu_detach_group(domain->domain, group->iommu_group);
fda49d97f2c4fa Christoph Hellwig 2021-09-24  2322  			if (!iommu_attach_group(d->domain,
fda49d97f2c4fa Christoph Hellwig 2021-09-24  2323  						group->iommu_group)) {
1ef3e2bc04223f Alex Williamson   2014-02-26  2324  				list_add(&group->next, &d->group_list);
1ef3e2bc04223f Alex Williamson   2014-02-26  2325  				iommu_domain_free(domain->domain);
1ef3e2bc04223f Alex Williamson   2014-02-26  2326  				kfree(domain);
1108696aecf048 Shameer Kolothum  2019-07-23  2327  				goto done;
73fa0d10d077d9 Alex Williamson   2012-07-31  2328  			}
73fa0d10d077d9 Alex Williamson   2012-07-31  2329  
fda49d97f2c4fa Christoph Hellwig 2021-09-24  2330  			ret = iommu_attach_group(domain->domain,
fda49d97f2c4fa Christoph Hellwig 2021-09-24  2331  						 group->iommu_group);
1ef3e2bc04223f Alex Williamson   2014-02-26  2332  			if (ret)
1ef3e2bc04223f Alex Williamson   2014-02-26  2333  				goto out_domain;
1ef3e2bc04223f Alex Williamson   2014-02-26  2334  		}
1ef3e2bc04223f Alex Williamson   2014-02-26  2335  	}
1ef3e2bc04223f Alex Williamson   2014-02-26  2336  
1ef3e2bc04223f Alex Williamson   2014-02-26  2337  	/* replay mappings on new domains */
1ef3e2bc04223f Alex Williamson   2014-02-26  2338  	ret = vfio_iommu_replay(iommu, domain);
1ef3e2bc04223f Alex Williamson   2014-02-26  2339  	if (ret)
1ef3e2bc04223f Alex Williamson   2014-02-26  2340  		goto out_detach;
1ef3e2bc04223f Alex Williamson   2014-02-26  2341  
2c9f1af528a458 Wei Yongjun       2017-02-09  2342  	if (resv_msi) {
2c9f1af528a458 Wei Yongjun       2017-02-09  2343  		ret = iommu_get_msi_cookie(domain->domain, resv_msi_base);
f44efca0493ddc Andre Przywara    2020-04-01  2344  		if (ret && ret != -ENODEV)
5d704992189fe8 Eric Auger        2017-01-19  2345  			goto out_detach;
2c9f1af528a458 Wei Yongjun       2017-02-09  2346  	}
5d704992189fe8 Eric Auger        2017-01-19  2347  
1ef3e2bc04223f Alex Williamson   2014-02-26  2348  	list_add(&domain->next, &iommu->domain_list);
cade075f265b25 Kirti Wankhede    2020-05-29  2349  	vfio_update_pgsize_bitmap(iommu);
1108696aecf048 Shameer Kolothum  2019-07-23  2350  done:
1108696aecf048 Shameer Kolothum  2019-07-23  2351  	/* Delete the old one and insert new iova list */
1108696aecf048 Shameer Kolothum  2019-07-23  2352  	vfio_iommu_iova_insert_copy(iommu, &iova_copy);
95fc87b44104d9 Kirti Wankhede    2020-05-29  2353  
95fc87b44104d9 Kirti Wankhede    2020-05-29  2354  	/*
95fc87b44104d9 Kirti Wankhede    2020-05-29  2355  	 * An iommu backed group can dirty memory directly and therefore
95fc87b44104d9 Kirti Wankhede    2020-05-29  2356  	 * demotes the iommu scope until it declares itself dirty tracking
95fc87b44104d9 Kirti Wankhede    2020-05-29  2357  	 * capable via the page pinning interface.
95fc87b44104d9 Kirti Wankhede    2020-05-29  2358  	 */
010321565a7d2c Keqian Zhu        2021-01-25  2359  	iommu->num_non_pinned_groups++;
73fa0d10d077d9 Alex Williamson   2012-07-31  2360  	mutex_unlock(&iommu->lock);
af029169b8fdae Shameer Kolothum  2019-07-23  2361  	vfio_iommu_resv_free(&group_resv_regions);
73fa0d10d077d9 Alex Williamson   2012-07-31  2362  
73fa0d10d077d9 Alex Williamson   2012-07-31  2363  	return 0;
1ef3e2bc04223f Alex Williamson   2014-02-26  2364  
1ef3e2bc04223f Alex Williamson   2014-02-26  2365  out_detach:
fda49d97f2c4fa Christoph Hellwig 2021-09-24  2366  	iommu_detach_group(domain->domain, group->iommu_group);
1ef3e2bc04223f Alex Williamson   2014-02-26  2367  out_domain:
1ef3e2bc04223f Alex Williamson   2014-02-26  2368  	iommu_domain_free(domain->domain);
1108696aecf048 Shameer Kolothum  2019-07-23  2369  	vfio_iommu_iova_free(&iova_copy);
af029169b8fdae Shameer Kolothum  2019-07-23  2370  	vfio_iommu_resv_free(&group_resv_regions);
296e505baddf92 Christoph Hellwig 2021-09-24  2371  out_free_domain:
1ef3e2bc04223f Alex Williamson   2014-02-26  2372  	kfree(domain);
296e505baddf92 Christoph Hellwig 2021-09-24  2373  out_free_group:
1ef3e2bc04223f Alex Williamson   2014-02-26 @2374  	kfree(group);
296e505baddf92 Christoph Hellwig 2021-09-24  2375  out_unlock:
1ef3e2bc04223f Alex Williamson   2014-02-26  2376  	mutex_unlock(&iommu->lock);
1ef3e2bc04223f Alex Williamson   2014-02-26  2377  	return ret;
1ef3e2bc04223f Alex Williamson   2014-02-26  2378  }
1ef3e2bc04223f Alex Williamson   2014-02-26  2379  

:::::: The code at line 2374 was first introduced by commit
:::::: 1ef3e2bc04223ff956dc62abaf2dff1f3322a431 vfio/iommu_type1: Multi-IOMMU domain support

:::::: TO: Alex Williamson <alex.williamson@redhat.com>
:::::: CC: Alex Williamson <alex.williamson@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
