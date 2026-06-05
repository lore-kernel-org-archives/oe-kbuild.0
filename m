Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA09F3612E7
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jun 2026 01:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780622650; cv=none; b=vF8sc4TR3FWJFlVWaF5xkQMRpMzxtAugPbLMcsaDnLf8AGYaAyRzzcxU4VzFN+mQWBk0dPAh6zdQYfWVAzkM5v2i6QtgFrJTniiZ7yfO9z6vngmQYmB2wkOlEQpAavvMOvg0QZlpjbb7tz5SPOApzNy83CNZ3YfyAU9xS2QK+4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780622650; c=relaxed/simple;
	bh=d3Xr0IrceVG6IAs7wmdaZm3Aobz7LPBh04W0Avk2Kmo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jcdSg1bxACvxPBc+sxKeV/skcsTSlvDiswq6ug1KpmHqgDGbVk4l9nWPYdmCiL410QboUC6FmCEWYisvMaRiCcuRA5IVs2zauhj1AJxK3FfrJemH7X3y5j0vBoexykY+o/f4HY7upeA8VQF0ez3Lsi/RfX0uW+99eNU4FbdimrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TNn2suwb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TNn2suwb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780622645; x=1812158645;
  h=date:from:to:cc:subject:message-id;
  bh=d3Xr0IrceVG6IAs7wmdaZm3Aobz7LPBh04W0Avk2Kmo=;
  b=TNn2suwbTq5ZoVUP7XqlM0MMX4NPHpCYD7MxJHZmPyRjUTnfkJW+ZA7l
   2D0apD+LG2DUXAGV1TPWyZ50flDQxtrznSaSE9p+LHuQxVuWCer3fdHoE
   akZOc5qUtMUXXsiwQs10gmkEi5bUYPlHvCuPCw2FBQV5MyLCiJWT8MUq1
   srMp9MpsErYKFI9eeN2ejXeebCSoi0FfbHCGfdej3mfx44ypW4NAT0fk4
   Ui71k1Yv761vYKeqgU6dkUOWJy5SambQqAOo4i0m4HJeC9xgEI2G36Uig
   2jobFmQgEgq5QbZuYQQ1D4yqLG3nPX2nksNFC0HrXPszb5e9b9fZKK0Io
   Q==;
X-CSE-ConnectionGUID: w0JoXYAYQau2M7995yWQVQ==
X-CSE-MsgGUID: ewRD5Ec5Q6y3nx7Q+04OkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="92142075"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="92142075"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 18:24:04 -0700
X-CSE-ConnectionGUID: aebwhouBTdOUXVCt/O4nSg==
X-CSE-MsgGUID: CmYy1/YdSOSsLf0q7+T2IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="240516091"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Jun 2026 18:24:03 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVJI0-00000000FQd-1swy;
	Fri, 05 Jun 2026 01:24:00 +0000
Date: Fri, 05 Jun 2026 09:23:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/xen/grant-dma-ops.c:174 xen_grant_dma_map_phys()
 warn: mask and shift to zero: expr='offset >> 12'
Message-ID: <202606050924.np68TBk4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Leon Romanovsky <leonro@nvidia.com>
CC: Marek Szyprowski <m.szyprowski@samsung.com>
CC: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ddd664bbff63e09e7a7f9acae9c43605d4cf185f
commit: 936a9f0cb16b0646143f8e05afab458adc51d0a0 xen: swiotlb: Convert mapping routine to rely on physical address
date:   7 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-161-20260605 (https://download.01.org/0day-ci/archive/20260605/202606050924.np68TBk4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 936a9f0cb16b ("xen: swiotlb: Convert mapping routine to rely on physical address")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606050924.np68TBk4-lkp@intel.com/

smatch warnings:
drivers/xen/grant-dma-ops.c:174 xen_grant_dma_map_phys() warn: mask and shift to zero: expr='offset >> 12'

vim +174 drivers/xen/grant-dma-ops.c

d6aca3504c7ded Juergen Gross        2022-06-02  165  
936a9f0cb16b06 Leon Romanovsky      2025-10-15  166  static dma_addr_t xen_grant_dma_map_phys(struct device *dev, phys_addr_t phys,
936a9f0cb16b06 Leon Romanovsky      2025-10-15  167  					 size_t size,
d6aca3504c7ded Juergen Gross        2022-06-02  168  					 enum dma_data_direction dir,
d6aca3504c7ded Juergen Gross        2022-06-02  169  					 unsigned long attrs)
d6aca3504c7ded Juergen Gross        2022-06-02  170  {
d6aca3504c7ded Juergen Gross        2022-06-02  171  	struct xen_grant_dma_data *data;
936a9f0cb16b06 Leon Romanovsky      2025-10-15  172  	unsigned long offset = offset_in_page(phys);
a383dcb1cca830 Oleksandr Tyshchenko 2022-10-08  173  	unsigned long dma_offset = xen_offset_in_page(offset),
a383dcb1cca830 Oleksandr Tyshchenko 2022-10-08 @174  			pfn_offset = XEN_PFN_DOWN(offset);
a383dcb1cca830 Oleksandr Tyshchenko 2022-10-08  175  	unsigned int i, n_pages = XEN_PFN_UP(dma_offset + size);
d6aca3504c7ded Juergen Gross        2022-06-02  176  	grant_ref_t grant;
d6aca3504c7ded Juergen Gross        2022-06-02  177  	dma_addr_t dma_handle;
d6aca3504c7ded Juergen Gross        2022-06-02  178  
936a9f0cb16b06 Leon Romanovsky      2025-10-15  179  	if (unlikely(attrs & DMA_ATTR_MMIO))
936a9f0cb16b06 Leon Romanovsky      2025-10-15  180  		return DMA_MAPPING_ERROR;
936a9f0cb16b06 Leon Romanovsky      2025-10-15  181  
d6aca3504c7ded Juergen Gross        2022-06-02  182  	if (WARN_ON(dir == DMA_NONE))
d6aca3504c7ded Juergen Gross        2022-06-02  183  		return DMA_MAPPING_ERROR;
d6aca3504c7ded Juergen Gross        2022-06-02  184  
d6aca3504c7ded Juergen Gross        2022-06-02  185  	data = find_xen_grant_dma_data(dev);
d6aca3504c7ded Juergen Gross        2022-06-02  186  	if (!data)
d6aca3504c7ded Juergen Gross        2022-06-02  187  		return DMA_MAPPING_ERROR;
d6aca3504c7ded Juergen Gross        2022-06-02  188  
d6aca3504c7ded Juergen Gross        2022-06-02  189  	if (unlikely(data->broken))
d6aca3504c7ded Juergen Gross        2022-06-02  190  		return DMA_MAPPING_ERROR;
d6aca3504c7ded Juergen Gross        2022-06-02  191  
d6aca3504c7ded Juergen Gross        2022-06-02  192  	if (gnttab_alloc_grant_reference_seq(n_pages, &grant))
d6aca3504c7ded Juergen Gross        2022-06-02  193  		return DMA_MAPPING_ERROR;
d6aca3504c7ded Juergen Gross        2022-06-02  194  
d6aca3504c7ded Juergen Gross        2022-06-02  195  	for (i = 0; i < n_pages; i++) {
d6aca3504c7ded Juergen Gross        2022-06-02  196  		gnttab_grant_foreign_access_ref(grant + i, data->backend_domid,
936a9f0cb16b06 Leon Romanovsky      2025-10-15  197  				pfn_to_gfn(page_to_xen_pfn(phys_to_page(phys)) + i + pfn_offset),
875553e317b28e Oleksandr Tyshchenko 2022-10-08  198  				dir == DMA_TO_DEVICE);
d6aca3504c7ded Juergen Gross        2022-06-02  199  	}
d6aca3504c7ded Juergen Gross        2022-06-02  200  
875553e317b28e Oleksandr Tyshchenko 2022-10-08  201  	dma_handle = grant_to_dma(grant) + dma_offset;
d6aca3504c7ded Juergen Gross        2022-06-02  202  
d6aca3504c7ded Juergen Gross        2022-06-02  203  	return dma_handle;
d6aca3504c7ded Juergen Gross        2022-06-02  204  }
d6aca3504c7ded Juergen Gross        2022-06-02  205  

:::::: The code at line 174 was first introduced by commit
:::::: a383dcb1cca8305497877119fba0a320f41fe853 xen/virtio: Convert PAGE_SIZE/PAGE_SHIFT/PFN_UP to Xen counterparts

:::::: TO: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
:::::: CC: Juergen Gross <jgross@suse.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
