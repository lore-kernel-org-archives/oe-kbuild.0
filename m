Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AFE18FC9F
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Nov 2024 02:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730861825; cv=none; b=C2l5mhpZJlkfgZ1369CdpUwQiK4HTFo5ulhQ+nnEcTyIOT4m+PpM+fv4RpZ/NKRJ5Ac1U9UBl0AQDxuzX1tj67+XmXuzFbaHBMnqigyk7DaceBbxyvHKq/YPeaybrSylz5PVNJDLdxkJyO3kcGVdT0LeCuTj3P99ZE0INHEpjoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730861825; c=relaxed/simple;
	bh=3rh5c4Gy0dD8oTaOW6QRJSxk9nf6Q8NlDfDztx/gH4A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TlZkwd6a3QK8rX+ziiL30InU+mad7NcohvLZGTT+P8nnxwpsVtqfihqaqlxhC6LZvBOmfhVoUtWGf91ZiQjWG3u1W9VU8wCIIUQwOj/4R16OyQXTAPuk3qnnMSgMlVsI2RxfIfTzIaHcaiHV9ygESvBHU8+PSKJI0TOTV82xmvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RLPOuWuy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RLPOuWuy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730861824; x=1762397824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3rh5c4Gy0dD8oTaOW6QRJSxk9nf6Q8NlDfDztx/gH4A=;
  b=RLPOuWuyQl27zxSup8Zug8Hsnjeow9NHavS7bY70YumARWxqIAAdVbNp
   sctjExwfjEKpFRjfPH+AhjCuh7pN9yKOlTopL+XBu8LH7ugUlwq/TLMp6
   geT8n4FBIWfcC4FXURCCFzz1DY+q14XQu3UKq4M3Ff95Hy+toIlnzhJRj
   2JtSXl8Zv4EojxIGazkw7SgjaC4Q1xhdoGDKaQAJdlhgxZUw2vKG8RRCC
   LAyuBgF58MoUpIlKzFAgjCeQCLsSneTVbb8SYFoE7GixIoeqG0EUCFZGG
   RStAUe+1IFYjTkHV3e1iunhlOtp+uHTCpHJ+spEefgK/BN5QZg+FoeFRw
   g==;
X-CSE-ConnectionGUID: gMpaUb1/SG2T3C+WKgpXGw==
X-CSE-MsgGUID: D+C0GPstT1iTc89bYMkygg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30492725"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30492725"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 18:57:04 -0800
X-CSE-ConnectionGUID: ZQcIr5cSTHSkk7GDtADMdw==
X-CSE-MsgGUID: DHoI+SPYStSXWWIdfDPpJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="115079268"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Nov 2024 18:57:02 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8WE7-000mrv-3B;
	Wed, 06 Nov 2024 02:56:59 +0000
Date: Wed, 6 Nov 2024 10:56:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [leon-rdma:dma-split-wip 12/25] mm/hmm.c:667:20-21: WARNING kvmalloc
 is used to allocate this memory at line 652
Message-ID: <202411061047.kZI6i7Uw-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-split-wip
head:   52d45d0a658e156c440541857e911e861c84273e
commit: 2ab6e72d4c9a3eb4472ab3c29914d7fafede8449 [12/25] mm/hmm: provide generic DMA managing logic
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: microblaze-randconfig-r051-20241106 (https://download.01.org/0day-ci/archive/20241106/202411061047.kZI6i7Uw-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411061047.kZI6i7Uw-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/hmm.c:667:20-21: WARNING kvmalloc is used to allocate this memory at line 652

vim +667 mm/hmm.c

2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  620  
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  621  /**
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  622   * hmm_dma_map_alloc - Allocate HMM map structure
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  623   * @dev: device to allocate structure for
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  624   * @map: HMM map to allocate
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  625   * @nr_entries: number of entries in the map
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  626   * @dma_entry_size: size of the DMA entry in the map
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  627   *
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  628   * Allocate the HMM map structure and all the lists it contains.
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  629   * Return 0 on success, -ENOMEM on failure.
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  630   */
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  631  int hmm_dma_map_alloc(struct device *dev, struct hmm_dma_map *map,
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  632  		      size_t nr_entries, size_t dma_entry_size)
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  633  {
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  634  	bool dma_need_sync = false;
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  635  	bool use_iova;
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  636  
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  637  	if (!(nr_entries * PAGE_SIZE / dma_entry_size))
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  638  		return -EINVAL;
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  639  
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  640  	/*
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  641  	 * The HMM API violates our normal DMA buffer ownership rules and can't
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  642  	 * transfer buffer ownership.  The dma_addressing_limited() check is a
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  643  	 * best approximation to ensure no swiotlb buffering happens.
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  644  	 */
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  645  	if (IS_ENABLED(CONFIG_DMA_NEED_SYNC))
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  646  		dma_need_sync = !dev->dma_skip_sync;
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  647  	if (dma_need_sync || dma_addressing_limited(dev))
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  648  		return -EOPNOTSUPP;
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  649  
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  650  	map->dma_entry_size = dma_entry_size;
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  651  	map->pfn_list =
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17 @652  		kvcalloc(nr_entries, sizeof(*map->pfn_list), GFP_KERNEL);
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  653  	if (!map->pfn_list)
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  654  		return -ENOMEM;
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  655  
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  656  	use_iova = dma_iova_try_alloc(dev, &map->state, 0,
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  657  			nr_entries * PAGE_SIZE);
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  658  	if (!use_iova && dma_need_unmap(dev)) {
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  659  		map->dma_list = kvcalloc(nr_entries, sizeof(*map->dma_list),
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  660  					 GFP_KERNEL);
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  661  		if (!map->dma_list)
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  662  			goto err_dma;
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  663  	}
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  664  	return 0;
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  665  
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  666  err_dma:
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17 @667  	kfree(map->pfn_list);
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  668  	return -ENOMEM;
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  669  }
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  670  EXPORT_SYMBOL_GPL(hmm_dma_map_alloc);
2ab6e72d4c9a3e Leon Romanovsky 2024-10-17  671  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
