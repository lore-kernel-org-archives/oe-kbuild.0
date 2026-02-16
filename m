Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098D723909C
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Feb 2026 22:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771279358; cv=none; b=NeQmveSAU7T2sFIa56awzg67C9sQPXVT3tzUb7DKjbXv/aBUmX5vZBlwBDXvU/8nrjZSXGvTUmm/J62O0vjgnbWmgkzNtGnRLcxr0K5hGvJTMmRldUkJnSHsFbxIgN9EYc634XEHXJywinxGZI4EPhT37OhMq9ZNWnTYgHUaenM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771279358; c=relaxed/simple;
	bh=LLGKb8SsXVbh1w/6XB3qQ9rLqhSAjV0ViccKz1GHz/U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UjcIgDokoNuhpodfqtF/3NFV76AuXO63yF91tR944yWMEwRBWOyW74ob4gHeeaHM9bL9XQBk+xSV2FoeZq/DeQpP84u2igAfuGNipE2P9On5xFr2LR6iH4l/buHpPyyY/Hsd58GhS091Kq6vWICizsiYiNoqA5RAXzmI/1UXFlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gSdnlkGL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gSdnlkGL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771279357; x=1802815357;
  h=date:from:to:cc:subject:message-id;
  bh=LLGKb8SsXVbh1w/6XB3qQ9rLqhSAjV0ViccKz1GHz/U=;
  b=gSdnlkGLl9K1HG6yohMb1XHW5BHTmxQNutTGcQeampr9MmcxkCIx534O
   J0tcDq17E4EXPTPFwthEcZX+qYPih4PMe6NLnGeRRAT50uCQiCczU/zF4
   BcuLR7AImliEwoJ6JxMw+n14QWWvC85GbExemSf0HqpynR+GCnFY6j/mW
   YAcE+nGxOP5rmcZfSWSc9bSLqa+u14wt7inLydM1a+nVEUQOjkmXcnrJP
   zzDLKv4McHXqftmVjBn6vgRW/nNEYuJmNL7BBUuVVUIw64ynB1v/u9U/8
   OXN+bqRLhRKxWnB1fXu6Wjh2eufeKIjl0qTQdoJu3s9pQ0aIOh38auFk/
   A==;
X-CSE-ConnectionGUID: YxCC4PNVR+GJMiKE2XiJ+w==
X-CSE-MsgGUID: VmEZot+QTwaYVAmb8ucQKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72451818"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="72451818"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 14:02:37 -0800
X-CSE-ConnectionGUID: VCnj5pLTStmFhsg4kyMrQw==
X-CSE-MsgGUID: bvLXDQ6DRKiRmHFRPKyMrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="218241812"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Feb 2026 14:02:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vs6fp-000000010Jk-1QzW;
	Mon, 16 Feb 2026 22:02:33 +0000
Date: Tue, 17 Feb 2026 06:02:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/xen/grant-dma-ops.c:174 xen_grant_dma_map_phys()
 warn: mask and shift to zero: expr='offset >> 12'
Message-ID: <202602170520.TSeikPfm-lkp@intel.com>
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
head:   0f2acd3148e0ef42bdacbd477f90e8533f96b2ac
commit: 936a9f0cb16b0646143f8e05afab458adc51d0a0 xen: swiotlb: Convert mapping routine to rely on physical address
date:   4 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-r072-20260217 (https://download.01.org/0day-ci/archive/20260217/202602170520.TSeikPfm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602170520.TSeikPfm-lkp@intel.com/

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
