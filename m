Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7445328AD
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 19:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790190775; cv=none; b=gyjdIVo7spIthTg0Fqu6n/xUTxrSRrC7XRgKRIe1Iz9N6K0Iu7XBExkGuw+LvYz12VGgURXBg9EjmZPh+lKR0xD1rTS6ywnKKe08njsbPjGFaOFQQH4WNIxRoLY9ixLGw8/uyU0+BFjPJOnQE6UmV2EBPjbASTHuXxTaj0LnrTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790190775; c=relaxed/simple;
	bh=AKHDnd+8Keqj8dX+xtOR6471ZgtU/+sZnvbHA8bLFLk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JkyWR07BAFauPtO2qzIF7jngGp6OBuR6303Wx1LRig9D0+VMKPIpFIAK1rDE4YBbX3NMjGpFsuzbOxuJlFnDLWpNiIc2+soaoICw/00AhxcXMWrObCL9aaZYWPLpUHkV7VuEBjn2EaTPHFvn/nLslsCq1e1BMgvzdq6mpGnx6wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bUhIxYIr; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bUhIxYIr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790190773; x=1821726773;
  h=date:from:to:cc:subject:message-id;
  bh=AKHDnd+8Keqj8dX+xtOR6471ZgtU/+sZnvbHA8bLFLk=;
  b=bUhIxYIr+wT8GQi9/liUIZPLStenXvhLG/I9vHnWjmqxohaPWv+FLY30
   0rAw1KH+a1CLCeidRTOYUNDAhxfkiMGh+RDY6BJGkOLKBisjboHhmINbI
   x7HQRLstboGX3my3v7tMuYlGb9phbTrjdLoo2p3pNi0pGPtxID+bjGKAC
   7aboGjwVu+DVFrr2c45kGOH+nzb+D1I80vnhLpj35TI0Ok+QUom8UTcqD
   rNGVWRWfzxSLhL6CH7alaNko2KnxEbbUwvJqXlBKp3k1GzYj8L1pVEK0f
   TE4YymnEL4AAoFwJCwZoXo4+ttOR59T6SusiowWnyqLBKYCsSHbLSk1Ks
   Q==;
X-CSE-ConnectionGUID: rAvIS4YnTouzvoBLoZlfMQ==
X-CSE-MsgGUID: jANrMSjOSgGnhX93eumM6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="101585327"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="101585327"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 12:12:52 -0700
X-CSE-ConnectionGUID: AnwwmSMjQzGhx2DoYYjwvw==
X-CSE-MsgGUID: M/k3dJbvRKWrm8ZwhVmU+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="281824010"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 23 Sep 2026 12:12:51 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9SOf-000000000mf-2Baj;
	Wed, 23 Sep 2026 19:12:49 +0000
Date: Wed, 23 Sep 2026 21:11:55 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/xen/grant-dma-ops.c:174 xen_grant_dma_map_phys()
 warn: mask and shift to zero: expr='offset >> 12'
Message-ID: <202609232135.404BR1OX-lkp@intel.com>
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
head:   fe2ec83746e501645709761605c2464a44fd2929
commit: 936a9f0cb16b0646143f8e05afab458adc51d0a0 xen: swiotlb: Convert mapping routine to rely on physical address
date:   11 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 11 months ago
config: arm64-randconfig-r2201-20260923 (https://download.01.org/0day-ci/archive/20260923/202609232135.404BR1OX-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 945b9128ca6655df0dd372067988fea8d6bb8ed1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 936a9f0cb16b ("xen: swiotlb: Convert mapping routine to rely on physical address")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609232135.404BR1OX-lkp@intel.com/

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
