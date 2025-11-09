Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A081F4174
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Nov 2025 18:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762711827; cv=none; b=JoV83GYQpHwCW7p2sgGQldYy3CPSVPL/o3iE1XIHxGllzqUs39XYsGfX5u3yENpnQTyrybS4WAibzwN4t9GdgGy56I/oA3x4MGZ6b5EvH7JI1TyVjGNwbe/QjPPoWi+ZqQUMzZ45F0z8y2ZrMO7VOMsnlbWoaoYY9yXoIr4tXcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762711827; c=relaxed/simple;
	bh=l807Kcf73YUUEx/XPNbxC0hJxCOOmruhxcOVa/brZ+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hrzaeNnV+uAYv9ZPwDN0UvGvV/AiAv3vU9AoMlpSmBkhiLfJW0m7w7c+skKaZrADwIdoVg95uGgzumRddUeMwDX59c4WsV2a4ZJNratZyFVrlU2x7/pnvTUsHqr7AuPhz3F8YO/qKdr0f2CXRJuyavTdbJB0sMNHaR7VhTqmmCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LCEBbgnw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LCEBbgnw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762711825; x=1794247825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l807Kcf73YUUEx/XPNbxC0hJxCOOmruhxcOVa/brZ+M=;
  b=LCEBbgnwcbsg7WhMHP6GxkweJNlls14Cu2h9qdlf8Sfsc9uGfXSrKRUP
   fOEXPburq2fOtBM30+yLlq0Q0BJji6UiCPnYL1gWFR4jWXll9k/2MNms0
   O71AuSKWUtABKXN0lqgbNjdr0IVckYJMAq43uMHcmbsra7gEHzlojF/fX
   k+1igchwQjboACuIve1JE0k7bMHCQt9Wl8vbb7Yy5H5ULAjeqB+eSdm5q
   tPkAIowMd0gsbIv+ScKFWUyI34pEU3NjqOyNo0etndDI3FOaSqNDsnAhB
   0TGuQMUdNZYUU0NO+vNJYIP0lyo94hks+SiYZ/di39zftLj/anpGelQOl
   w==;
X-CSE-ConnectionGUID: U+Ou4ILLRLqslVpI/rsE3Q==
X-CSE-MsgGUID: /aZhHtCbQjKfDodKVSQssQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="75466807"
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="75466807"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 10:10:24 -0800
X-CSE-ConnectionGUID: EyzVMLTBQv+9s0K3IbxMcg==
X-CSE-MsgGUID: mjEruZM7ReWGMpA7PssulA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="192882523"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Nov 2025 10:10:23 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vI9rp-0002Id-13;
	Sun, 09 Nov 2025 18:10:21 +0000
Date: Mon, 10 Nov 2025 02:09:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v6 11/11] vfio/nvgrace: Support get_dmabuf_phys
Message-ID: <202511100152.SyE9Mhps-lkp@intel.com>
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
In-Reply-To: <20251102-dmabuf-vfio-v6-11-d773cff0db9f@nvidia.com>
References: <20251102-dmabuf-vfio-v6-11-d773cff0db9f@nvidia.com>
TO: Leon Romanovsky <leon@kernel.org>

Hi Leon,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/Leon-Romanovsky/PCI-P2PDMA-Separate-the-mmap-support-from-the-core-logic/20251102-160355
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251102-dmabuf-vfio-v6-11-d773cff0db9f%40nvidia.com
patch subject: [PATCH v6 11/11] vfio/nvgrace: Support get_dmabuf_phys
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-r072-20251109 (https://download.01.org/0day-ci/archive/20251110/202511100152.SyE9Mhps-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b9ea93cd5c37fb6d606502fd01208dd48330549d)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511100152.SyE9Mhps-lkp@intel.com/

New smatch warnings:
drivers/vfio/pci/nvgrace-gpu/main.c:706 nvgrace_get_dmabuf_phys() warn: '*provider' is an error pointer or valid

Old smatch warnings:
drivers/vfio/pci/nvgrace-gpu/main.c:720 nvgrace_get_dmabuf_phys() warn: '*provider' is an error pointer or valid
drivers/vfio/pci/nvgrace-gpu/main.c:794 nvgrace_gpu_fetch_memory_property() warn: impossible condition '(*pmemphys > ((((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 8 - 1 - (((-1)) < 1)))))) => (0-u64max > u64max)'
drivers/vfio/pci/nvgrace-gpu/main.c:802 nvgrace_gpu_fetch_memory_property() warn: impossible condition '(*pmemlength > ((((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 8 - 1 - (((-1)) < 1)))))) => (0-u64max > u64max)'

vim +706 drivers/vfio/pci/nvgrace-gpu/main.c

701ab935859fcfd Ankit Agrawal   2024-02-20  686  
d7ddf63944708fb Jason Gunthorpe 2025-11-02  687  static int nvgrace_get_dmabuf_phys(struct vfio_pci_core_device *core_vdev,
d7ddf63944708fb Jason Gunthorpe 2025-11-02  688  				   struct p2pdma_provider **provider,
d7ddf63944708fb Jason Gunthorpe 2025-11-02  689  				   unsigned int region_index,
d7ddf63944708fb Jason Gunthorpe 2025-11-02  690  				   struct dma_buf_phys_vec *phys_vec,
d7ddf63944708fb Jason Gunthorpe 2025-11-02  691  				   struct vfio_region_dma_range *dma_ranges,
d7ddf63944708fb Jason Gunthorpe 2025-11-02  692  				   size_t nr_ranges)
d7ddf63944708fb Jason Gunthorpe 2025-11-02  693  {
d7ddf63944708fb Jason Gunthorpe 2025-11-02  694  	struct nvgrace_gpu_pci_core_device *nvdev = container_of(
d7ddf63944708fb Jason Gunthorpe 2025-11-02  695  		core_vdev, struct nvgrace_gpu_pci_core_device, core_device);
d7ddf63944708fb Jason Gunthorpe 2025-11-02  696  	struct pci_dev *pdev = core_vdev->pdev;
d7ddf63944708fb Jason Gunthorpe 2025-11-02  697  
d7ddf63944708fb Jason Gunthorpe 2025-11-02  698  	if (nvdev->resmem.memlength && region_index == RESMEM_REGION_INDEX) {
d7ddf63944708fb Jason Gunthorpe 2025-11-02  699  		/*
d7ddf63944708fb Jason Gunthorpe 2025-11-02  700  		 * The P2P properties of the non-BAR memory is the same as the
d7ddf63944708fb Jason Gunthorpe 2025-11-02  701  		 * BAR memory, so just use the provider for index 0. Someday
d7ddf63944708fb Jason Gunthorpe 2025-11-02  702  		 * when CXL gets P2P support we could create CXLish providers
d7ddf63944708fb Jason Gunthorpe 2025-11-02  703  		 * for the non-BAR memory.
d7ddf63944708fb Jason Gunthorpe 2025-11-02  704  		 */
d7ddf63944708fb Jason Gunthorpe 2025-11-02  705  		*provider = pcim_p2pdma_provider(pdev, 0);
d7ddf63944708fb Jason Gunthorpe 2025-11-02 @706  		if (!*provider)
d7ddf63944708fb Jason Gunthorpe 2025-11-02  707  			return -EINVAL;
d7ddf63944708fb Jason Gunthorpe 2025-11-02  708  		return vfio_pci_core_fill_phys_vec(phys_vec, dma_ranges,
d7ddf63944708fb Jason Gunthorpe 2025-11-02  709  						   nr_ranges,
d7ddf63944708fb Jason Gunthorpe 2025-11-02  710  						   nvdev->resmem.memphys,
d7ddf63944708fb Jason Gunthorpe 2025-11-02  711  						   nvdev->resmem.memlength);
d7ddf63944708fb Jason Gunthorpe 2025-11-02  712  	} else if (region_index == USEMEM_REGION_INDEX) {
d7ddf63944708fb Jason Gunthorpe 2025-11-02  713  		/*
d7ddf63944708fb Jason Gunthorpe 2025-11-02  714  		 * This is actually cachable memory and isn't treated as P2P in
d7ddf63944708fb Jason Gunthorpe 2025-11-02  715  		 * the chip. For now we have no way to push cachable memory
d7ddf63944708fb Jason Gunthorpe 2025-11-02  716  		 * through everything and the Grace HW doesn't care what caching
d7ddf63944708fb Jason Gunthorpe 2025-11-02  717  		 * attribute is programmed into the SMMU. So use BAR 0.
d7ddf63944708fb Jason Gunthorpe 2025-11-02  718  		 */
d7ddf63944708fb Jason Gunthorpe 2025-11-02  719  		*provider = pcim_p2pdma_provider(pdev, 0);
d7ddf63944708fb Jason Gunthorpe 2025-11-02  720  		if (!*provider)
d7ddf63944708fb Jason Gunthorpe 2025-11-02  721  			return -EINVAL;
d7ddf63944708fb Jason Gunthorpe 2025-11-02  722  		return vfio_pci_core_fill_phys_vec(phys_vec, dma_ranges,
d7ddf63944708fb Jason Gunthorpe 2025-11-02  723  						   nr_ranges,
d7ddf63944708fb Jason Gunthorpe 2025-11-02  724  						   nvdev->usemem.memphys,
d7ddf63944708fb Jason Gunthorpe 2025-11-02  725  						   nvdev->usemem.memlength);
d7ddf63944708fb Jason Gunthorpe 2025-11-02  726  	}
d7ddf63944708fb Jason Gunthorpe 2025-11-02  727  	return vfio_pci_core_get_dmabuf_phys(core_vdev, provider, region_index,
d7ddf63944708fb Jason Gunthorpe 2025-11-02  728  					     phys_vec, dma_ranges, nr_ranges);
d7ddf63944708fb Jason Gunthorpe 2025-11-02  729  }
d7ddf63944708fb Jason Gunthorpe 2025-11-02  730  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
