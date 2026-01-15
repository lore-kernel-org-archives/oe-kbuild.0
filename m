Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE4C2701BB
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Jan 2026 16:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768493478; cv=none; b=Y+L6ZdbsgY2gJ44J8F/KJWdfAafwMYPNSezr/GPCK4rDzvMHfp2ziCV2Xp2Y/pcmxICe+wuNZ1f3lkVpxUWum2RGJDq6E7+Uk4/k/3/NH6PjBOOyRF1YMhdkzukAP5IjESstwc3KC1iiUg/vFBVGcyyiYm+CdAmxjEfcQfnhPwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768493478; c=relaxed/simple;
	bh=mvfkAMrMBOKGQYEtcPWyhwuoiJLoAG4HSRF6nlp8k+Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mPCehqW+wPnWmLvC9DE9ioJtTI/Xbq85tfusTuLRqxJn+fSWWftZepqWh2qSmuqT1y2wMmZEy0iMlAbSzJ0WhD104mcPw789qqTlY/8MIkqAAvAjIY0plaMeDd78J3hwJM7VNJudAogsKyEYlIpfzfGO9cgkaII+vG/KrPYUp48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SaGwBzyt; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SaGwBzyt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768493476; x=1800029476;
  h=date:from:to:cc:subject:message-id;
  bh=mvfkAMrMBOKGQYEtcPWyhwuoiJLoAG4HSRF6nlp8k+Y=;
  b=SaGwBzytm2/RZw7HjzPDmCYr6lAt0T8NKOmN04arniD/C0mfaQjC2LZH
   w6pG06ey2snkL9EKHFrwipRUrfdMdoNbN6y6+fGcN/FKK4KLKsRFFOPox
   iRkDFsLbxfBX8lXGVCyyFUzWQ+ZN13iaohij5c6j4JYPKhXckYr17vM1i
   vxLwTApa4nkMQh4KhJnLVEd8fw6KRzzMhZ+dhF6LNew2MQiZdz8yGaJd1
   fbehcGJlEPoKBdJeSCxdSusxm9AUuOqrTXG0ECLhDVjXJHJ5bcf+dxc16
   tDsLxcSp7H5kyPo1V+8zDndfgBV/7wS5v/64xqAaGrrtsf4g26N8MygFV
   Q==;
X-CSE-ConnectionGUID: FrNi4TWmQgq/k1R5tVGz+w==
X-CSE-MsgGUID: OiGDWvLMQaar8Aa95VIzNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69968533"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69968533"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 08:11:15 -0800
X-CSE-ConnectionGUID: 8pNWSWzsRZKi/a3osksrrQ==
X-CSE-MsgGUID: xUKIx0OfQy6UGsKA7gXGYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="209460676"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 Jan 2026 08:11:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgPwF-00000000IBU-1KGK;
	Thu, 15 Jan 2026 16:11:11 +0000
Date: Fri, 16 Jan 2026 00:10:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/test_hmm.c:624 dmirror_allocate_chunk() warn:
 'res->start' from request_free_mem_region() not released on lines: 614.
Message-ID: <202601160001.sJ0jvhaj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Balbir Singh <balbirs@nvidia.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   944aacb68baf7624ab8d277d0ebf07f025ca137c
commit: 775465fd26a325359887f9c3129444fcc76c6298 lib/test_hmm: add zone device private THP test infrastructure
date:   7 weeks ago
:::::: branch date: 21 hours ago
:::::: commit date: 7 weeks ago
config: s390-randconfig-r071-20260115 (https://download.01.org/0day-ci/archive/20260116/202601160001.sJ0jvhaj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601160001.sJ0jvhaj-lkp@intel.com/

New smatch warnings:
lib/test_hmm.c:624 dmirror_allocate_chunk() warn: 'res->start' from request_free_mem_region() not released on lines: 614.

Old smatch warnings:
lib/test_hmm.c:715 dmirror_migrate_alloc_and_copy() error: we previously assumed 'spage' could be null (see line 712)
lib/test_hmm.c:1082 dmirror_migrate_to_system() error: uninitialized symbol 'ret'.

vim +624 lib/test_hmm.c

b2ef9f5a5cb376 Ralph Campbell 2020-04-22  494  
25b80162d55040 Alex Sierra    2022-07-15  495  static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
775465fd26a325 Balbir Singh   2025-10-01  496  				  struct page **ppage, bool is_large)
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  497  {
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  498  	struct dmirror_chunk *devmem;
25b80162d55040 Alex Sierra    2022-07-15  499  	struct resource *res = NULL;
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  500  	unsigned long pfn;
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  501  	unsigned long pfn_first;
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  502  	unsigned long pfn_last;
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  503  	void *ptr;
25b80162d55040 Alex Sierra    2022-07-15  504  	int ret = -ENOMEM;
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  505  
a4574f63edc6f7 Dan Williams   2020-10-13  506  	devmem = kzalloc(sizeof(*devmem), GFP_KERNEL);
a4574f63edc6f7 Dan Williams   2020-10-13  507  	if (!devmem)
25b80162d55040 Alex Sierra    2022-07-15  508  		return ret;
a4574f63edc6f7 Dan Williams   2020-10-13  509  
25b80162d55040 Alex Sierra    2022-07-15  510  	switch (mdevice->zone_device_type) {
25b80162d55040 Alex Sierra    2022-07-15  511  	case HMM_DMIRROR_MEMORY_DEVICE_PRIVATE:
a4574f63edc6f7 Dan Williams   2020-10-13  512  		res = request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
a4574f63edc6f7 Dan Williams   2020-10-13  513  					      "hmm_dmirror");
25b80162d55040 Alex Sierra    2022-07-15  514  		if (IS_ERR_OR_NULL(res))
a4574f63edc6f7 Dan Williams   2020-10-13  515  			goto err_devmem;
a4574f63edc6f7 Dan Williams   2020-10-13  516  		devmem->pagemap.range.start = res->start;
a4574f63edc6f7 Dan Williams   2020-10-13  517  		devmem->pagemap.range.end = res->end;
25b80162d55040 Alex Sierra    2022-07-15  518  		devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
25b80162d55040 Alex Sierra    2022-07-15  519  		break;
25b80162d55040 Alex Sierra    2022-07-15  520  	case HMM_DMIRROR_MEMORY_DEVICE_COHERENT:
25b80162d55040 Alex Sierra    2022-07-15  521  		devmem->pagemap.range.start = (MINOR(mdevice->cdevice.dev) - 2) ?
25b80162d55040 Alex Sierra    2022-07-15  522  							spm_addr_dev0 :
25b80162d55040 Alex Sierra    2022-07-15  523  							spm_addr_dev1;
25b80162d55040 Alex Sierra    2022-07-15  524  		devmem->pagemap.range.end = devmem->pagemap.range.start +
25b80162d55040 Alex Sierra    2022-07-15  525  					    DEVMEM_CHUNK_SIZE - 1;
25b80162d55040 Alex Sierra    2022-07-15  526  		devmem->pagemap.type = MEMORY_DEVICE_COHERENT;
25b80162d55040 Alex Sierra    2022-07-15  527  		break;
25b80162d55040 Alex Sierra    2022-07-15  528  	default:
25b80162d55040 Alex Sierra    2022-07-15  529  		ret = -EINVAL;
25b80162d55040 Alex Sierra    2022-07-15  530  		goto err_devmem;
25b80162d55040 Alex Sierra    2022-07-15  531  	}
25b80162d55040 Alex Sierra    2022-07-15  532  
b7b3c01b191596 Dan Williams   2020-10-13  533  	devmem->pagemap.nr_range = 1;
a4574f63edc6f7 Dan Williams   2020-10-13  534  	devmem->pagemap.ops = &dmirror_devmem_ops;
a4574f63edc6f7 Dan Williams   2020-10-13  535  	devmem->pagemap.owner = mdevice;
a4574f63edc6f7 Dan Williams   2020-10-13  536  
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  537  	mutex_lock(&mdevice->devmem_lock);
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  538  
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  539  	if (mdevice->devmem_count == mdevice->devmem_capacity) {
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  540  		struct dmirror_chunk **new_chunks;
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  541  		unsigned int new_capacity;
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  542  
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  543  		new_capacity = mdevice->devmem_capacity +
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  544  				DEVMEM_CHUNKS_RESERVE;
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  545  		new_chunks = krealloc(mdevice->devmem_chunks,
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  546  				sizeof(new_chunks[0]) * new_capacity,
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  547  				GFP_KERNEL);
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  548  		if (!new_chunks)
a4574f63edc6f7 Dan Williams   2020-10-13  549  			goto err_release;
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  550  		mdevice->devmem_capacity = new_capacity;
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  551  		mdevice->devmem_chunks = new_chunks;
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  552  	}
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  553  	ptr = memremap_pages(&devmem->pagemap, numa_node_id());
25b80162d55040 Alex Sierra    2022-07-15  554  	if (IS_ERR_OR_NULL(ptr)) {
25b80162d55040 Alex Sierra    2022-07-15  555  		if (ptr)
25b80162d55040 Alex Sierra    2022-07-15  556  			ret = PTR_ERR(ptr);
25b80162d55040 Alex Sierra    2022-07-15  557  		else
25b80162d55040 Alex Sierra    2022-07-15  558  			ret = -EFAULT;
a4574f63edc6f7 Dan Williams   2020-10-13  559  		goto err_release;
25b80162d55040 Alex Sierra    2022-07-15  560  	}
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  561  
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  562  	devmem->mdevice = mdevice;
a4574f63edc6f7 Dan Williams   2020-10-13  563  	pfn_first = devmem->pagemap.range.start >> PAGE_SHIFT;
a4574f63edc6f7 Dan Williams   2020-10-13  564  	pfn_last = pfn_first + (range_len(&devmem->pagemap.range) >> PAGE_SHIFT);
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  565  	mdevice->devmem_chunks[mdevice->devmem_count++] = devmem;
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  566  
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  567  	mutex_unlock(&mdevice->devmem_lock);
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  568  
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  569  	pr_info("added new %u MB chunk (total %u chunks, %u MB) PFNs [0x%lx 0x%lx)\n",
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  570  		DEVMEM_CHUNK_SIZE / (1024 * 1024),
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  571  		mdevice->devmem_count,
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  572  		mdevice->devmem_count * (DEVMEM_CHUNK_SIZE / (1024 * 1024)),
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  573  		pfn_first, pfn_last);
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  574  
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  575  	spin_lock(&mdevice->lock);
775465fd26a325 Balbir Singh   2025-10-01  576  	for (pfn = pfn_first; pfn < pfn_last; ) {
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  577  		struct page *page = pfn_to_page(pfn);
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  578  
775465fd26a325 Balbir Singh   2025-10-01  579  		if (is_large && IS_ALIGNED(pfn, HPAGE_PMD_NR)
775465fd26a325 Balbir Singh   2025-10-01  580  			&& (pfn + HPAGE_PMD_NR <= pfn_last)) {
775465fd26a325 Balbir Singh   2025-10-01  581  			page->zone_device_data = mdevice->free_folios;
775465fd26a325 Balbir Singh   2025-10-01  582  			mdevice->free_folios = page_folio(page);
775465fd26a325 Balbir Singh   2025-10-01  583  			pfn += HPAGE_PMD_NR;
775465fd26a325 Balbir Singh   2025-10-01  584  			continue;
775465fd26a325 Balbir Singh   2025-10-01  585  		}
775465fd26a325 Balbir Singh   2025-10-01  586  
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  587  		page->zone_device_data = mdevice->free_pages;
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  588  		mdevice->free_pages = page;
775465fd26a325 Balbir Singh   2025-10-01  589  		pfn++;
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  590  	}
775465fd26a325 Balbir Singh   2025-10-01  591  
775465fd26a325 Balbir Singh   2025-10-01  592  	ret = 0;
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  593  	if (ppage) {
775465fd26a325 Balbir Singh   2025-10-01  594  		if (is_large) {
775465fd26a325 Balbir Singh   2025-10-01  595  			if (!mdevice->free_folios) {
775465fd26a325 Balbir Singh   2025-10-01  596  				ret = -ENOMEM;
775465fd26a325 Balbir Singh   2025-10-01  597  				goto err_unlock;
775465fd26a325 Balbir Singh   2025-10-01  598  			}
775465fd26a325 Balbir Singh   2025-10-01  599  			*ppage = folio_page(mdevice->free_folios, 0);
775465fd26a325 Balbir Singh   2025-10-01  600  			mdevice->free_folios = (*ppage)->zone_device_data;
775465fd26a325 Balbir Singh   2025-10-01  601  			mdevice->calloc += HPAGE_PMD_NR;
775465fd26a325 Balbir Singh   2025-10-01  602  		} else if (mdevice->free_pages) {
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  603  			*ppage = mdevice->free_pages;
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  604  			mdevice->free_pages = (*ppage)->zone_device_data;
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  605  			mdevice->calloc++;
775465fd26a325 Balbir Singh   2025-10-01  606  		} else {
775465fd26a325 Balbir Singh   2025-10-01  607  			ret = -ENOMEM;
775465fd26a325 Balbir Singh   2025-10-01  608  			goto err_unlock;
775465fd26a325 Balbir Singh   2025-10-01  609  		}
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  610  	}
775465fd26a325 Balbir Singh   2025-10-01  611  err_unlock:
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  612  	spin_unlock(&mdevice->lock);
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  613  
775465fd26a325 Balbir Singh   2025-10-01  614  	return ret;
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  615  
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  616  err_release:
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  617  	mutex_unlock(&mdevice->devmem_lock);
25b80162d55040 Alex Sierra    2022-07-15  618  	if (res && devmem->pagemap.type == MEMORY_DEVICE_PRIVATE)
25b80162d55040 Alex Sierra    2022-07-15  619  		release_mem_region(devmem->pagemap.range.start,
25b80162d55040 Alex Sierra    2022-07-15  620  				   range_len(&devmem->pagemap.range));
a4574f63edc6f7 Dan Williams   2020-10-13  621  err_devmem:
a4574f63edc6f7 Dan Williams   2020-10-13  622  	kfree(devmem);
a4574f63edc6f7 Dan Williams   2020-10-13  623  
25b80162d55040 Alex Sierra    2022-07-15 @624  	return ret;
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  625  }
b2ef9f5a5cb376 Ralph Campbell 2020-04-22  626  

:::::: The code at line 624 was first introduced by commit
:::::: 25b80162d550408058b2d8fff2e63807bceda64c lib: test_hmm add module param for zone device type

:::::: TO: Alex Sierra <alex.sierra@amd.com>
:::::: CC: akpm <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
