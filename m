Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DEB1A2392
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Oct 2025 13:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761052633; cv=none; b=Mv5nP3SngDBfsRy635OYSzsXSDOmah/qy2U2r/d7RghaX96Sj+B3oyqVFXrimXnVoRI/iBvFlj41kgjU0UsYseLYjIQgALdJ3sDPTkoZCxNX+gWCfNuieKnbe7Y6KMq6ENE8gA62V3lvEvIXe1Q1TBbioWsE00tYeTy+JS7WWMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761052633; c=relaxed/simple;
	bh=hNnRJQaK5x2zQZw37xG8i6dsFf288yjYCz++u5hRZ38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QEL5lTl79kX6E4V/Zoti7FXLaciRn8zhoK08xcJufwo1Maadb7ogT/GN/QyS7bEKMAiXaU74EU7DwZJ494rTbDgFBhUW42IHcZ4W1Yep9SUZOF+wA3wyJLKK8o5QmoQtsFg8+FIfD1UjTCfGuIDSDD3oHa+cZz59BNMSlISx/5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VAoujKQo; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VAoujKQo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761052631; x=1792588631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hNnRJQaK5x2zQZw37xG8i6dsFf288yjYCz++u5hRZ38=;
  b=VAoujKQodGZiUspHD9ZW3qm4I9pIL5CBIxMg9hhSmqQrc+oC7xGGyNk0
   YR45MbLDHtsLlaycE0fws4/8t3Pnl7ZUSwRuxr7oBYLdPh1qJ8oeqj0ix
   VnytOfvlL8uCTggefU6kV1IPX9XRZvC/SmKxWTyBq0MpUsNs7Bqa9MLfj
   P1qxBTnw0Ka9nvHzjNHNXTWf3sPz0vUJKU6hhh7VCbfCBHzUdhZAmv70h
   QPIjuvsuHZK2UbMXW9+91eoHVVfw4xhbZNc0r/oJ35CBuZVCpvBg7qItz
   QHrtTzQNZKZj8JK1zl/doVBm8R+B1mwn4Qfokgs66ngow3GAXVHu/Hna7
   g==;
X-CSE-ConnectionGUID: OH+YVpWFSA28ZCPXNbWV4Q==
X-CSE-MsgGUID: kkSkuPtdQnehU4CovE4sgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74518648"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="74518648"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 06:17:11 -0700
X-CSE-ConnectionGUID: N4Yiw0BxRNSjoas+KmE2SA==
X-CSE-MsgGUID: PhXjI8tnSJaWaeLLCcxgPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="188875008"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 21 Oct 2025 06:17:09 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBCEd-000Aqh-2Q;
	Tue, 21 Oct 2025 13:17:07 +0000
Date: Tue, 21 Oct 2025 21:17:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/dma/ops_helpers.c:75:55: sparse: signed value source
Message-ID: <202510212158.vnns5f0U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/dma/ops_helpers.c:75:55: sparse: signed value source"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Leon Romanovsky <leonro@nvidia.com>
CC: Marek Szyprowski <m.szyprowski@samsung.com>
CC: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6548d364a3e850326831799d7e3ea2d7bb97ba08
commit: 513559f73700966ded094b090c3ecc6dff877ef9 iommu/dma: rename iommu_dma_*map_page to iommu_dma_*map_phys
date:   6 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 6 weeks ago
config: i386-randconfig-061-20251021 (https://download.01.org/0day-ci/archive/20251021/202510212158.vnns5f0U-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510212158.vnns5f0U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510212158.vnns5f0U-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/dma/ops_helpers.c: note: in included file (through arch/x86/include/asm/page.h, arch/x86/include/asm/processor.h, include/linux/sched.h, ...):
   include/asm-generic/memory_model.h:30:23: sparse: sparse: unsigned value that used to be signed checked against zero?
>> kernel/dma/ops_helpers.c:75:55: sparse: signed value source

vim +75 kernel/dma/ops_helpers.c

efa70f2fdc842e Christoph Hellwig 2020-09-01  61  
efa70f2fdc842e Christoph Hellwig 2020-09-01  62  struct page *dma_common_alloc_pages(struct device *dev, size_t size,
efa70f2fdc842e Christoph Hellwig 2020-09-01  63  		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
efa70f2fdc842e Christoph Hellwig 2020-09-01  64  {
efa70f2fdc842e Christoph Hellwig 2020-09-01  65  	const struct dma_map_ops *ops = get_dma_ops(dev);
efa70f2fdc842e Christoph Hellwig 2020-09-01  66  	struct page *page;
efa70f2fdc842e Christoph Hellwig 2020-09-01  67  
efa70f2fdc842e Christoph Hellwig 2020-09-01  68  	page = dma_alloc_contiguous(dev, size, gfp);
efa70f2fdc842e Christoph Hellwig 2020-09-01  69  	if (!page)
efa70f2fdc842e Christoph Hellwig 2020-09-01  70  		page = alloc_pages_node(dev_to_node(dev), gfp, get_order(size));
efa70f2fdc842e Christoph Hellwig 2020-09-01  71  	if (!page)
efa70f2fdc842e Christoph Hellwig 2020-09-01  72  		return NULL;
efa70f2fdc842e Christoph Hellwig 2020-09-01  73  
19156263cb1f24 Leon Romanovsky   2024-09-05  74  	if (use_dma_iommu(dev))
513559f7370096 Leon Romanovsky   2025-09-09 @75  		*dma_handle = iommu_dma_map_phys(dev, page_to_phys(page), size,
513559f7370096 Leon Romanovsky   2025-09-09  76  						 dir, DMA_ATTR_SKIP_CPU_SYNC);
19156263cb1f24 Leon Romanovsky   2024-09-05  77  	else
efa70f2fdc842e Christoph Hellwig 2020-09-01  78  		*dma_handle = ops->map_page(dev, page, 0, size, dir,
efa70f2fdc842e Christoph Hellwig 2020-09-01  79  					    DMA_ATTR_SKIP_CPU_SYNC);
efa70f2fdc842e Christoph Hellwig 2020-09-01  80  	if (*dma_handle == DMA_MAPPING_ERROR) {
efa70f2fdc842e Christoph Hellwig 2020-09-01  81  		dma_free_contiguous(dev, page, size);
efa70f2fdc842e Christoph Hellwig 2020-09-01  82  		return NULL;
efa70f2fdc842e Christoph Hellwig 2020-09-01  83  	}
efa70f2fdc842e Christoph Hellwig 2020-09-01  84  
efa70f2fdc842e Christoph Hellwig 2020-09-01  85  	memset(page_address(page), 0, size);
efa70f2fdc842e Christoph Hellwig 2020-09-01  86  	return page;
efa70f2fdc842e Christoph Hellwig 2020-09-01  87  }
efa70f2fdc842e Christoph Hellwig 2020-09-01  88  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
