Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6D2310655
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Nov 2025 11:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762342846; cv=none; b=GGGqIOsnMeOth01COEJ2nDA7HcWlK2lZK42cmOXq8rR0W3+OEgdUZ+35olsnDZTgnTq1p670HfMwWi1RULgqwESNAMVJ9v667UAkpFOCozsoETaZTA7YU2i14A1KXA3B7dkNv87xt7/McY7Sn0vq8Ouk9Lv16zj/PtgwunblDW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762342846; c=relaxed/simple;
	bh=kwE4G6Wb9nCFNn1HmayU6XzZly366NEAP1Ahx+WwUn4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SyyUlatGZsCHyzOcqGd6jFYbyQ0Yze3JxWheGSggJ901ZQuzZok4P8GsNInlC8Pp8AAatELwUmnA5iVyicNAosYJWd9TZtJztnerEWh26EAtgJf20SXExMptpF6txsr0baL1oFl47oZhIWywqTb4F51R+OzWTEmsZ5e9rloMm6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aF2Sqbim; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aF2Sqbim"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762342844; x=1793878844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kwE4G6Wb9nCFNn1HmayU6XzZly366NEAP1Ahx+WwUn4=;
  b=aF2Sqbim3MKzJaAA0BCwtSxBqxB/1nw14QGZHfZ++EcxkHKPAFQRiCE5
   KBB3185bXPEahRjqYosy9OwirIvDupOdTqzhZP1pXHvWVGvlOlkt+JsMQ
   Lxfs60Z4WUruoQPCBSHzhmCNiJMVEUrc8R/7zYKEs45rcj8mLnQxNNUU7
   Qf0tSzHj+1H1lvQK+V5JRfp2rAajKAQ8lo7Btdn3WI7XpOTkQw6rMQMZu
   DBDHPL3GjxpeEPZlkGGrBJfrd1mChnh+1GBCWdoaz8Hrrphq3DgKE1/Xg
   k5XH9Ybrh7OuUrF9cx2T+gH4u2MuHDJhLa3naNNpZjURdiz4MBX1NyQ9x
   g==;
X-CSE-ConnectionGUID: GW0wm3ptTKiOlSbPr+aqXQ==
X-CSE-MsgGUID: pxdEJ0E7Tyqp+j8FpEFLmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68292260"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68292260"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 03:40:10 -0800
X-CSE-ConnectionGUID: /hkS3pxjSyG1nEhB0gaEHg==
X-CSE-MsgGUID: ny/jCWwbT5qRYwM1SikNMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="218076572"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 05 Nov 2025 03:40:09 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGbrt-000SVI-0U;
	Wed, 05 Nov 2025 11:40:04 +0000
Date: Wed, 5 Nov 2025 19:39:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4206/6507] drivers/xen/grant-dma-ops.c:174
 xen_grant_dma_map_phys() warn: mask and shift to zero: expr='offset >> 12'
Message-ID: <202511051942.WvTQThiM-lkp@intel.com>
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
TO: Leon Romanovsky <leonro@nvidia.com>
CC: Marek Szyprowski <m.szyprowski@samsung.com>
CC: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   84d39fb9d529f27d2f3d295430d1be0abdae7a6d
commit: 936a9f0cb16b0646143f8e05afab458adc51d0a0 [4206/6507] xen: swiotlb: Convert mapping routine to rely on physical address
:::::: branch date: 6 hours ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-161-20251104 (https://download.01.org/0day-ci/archive/20251105/202511051942.WvTQThiM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511051942.WvTQThiM-lkp@intel.com/

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
