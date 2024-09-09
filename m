Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C2E1531E0
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Sep 2024 12:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725883454; cv=none; b=ZDwDix8yJUtzrXNZ3DqSDpwb3jwcUME7oito3q8xRFGlGLy0H8jgE/CcZCsKLvFDlS/nhGJy2+K64qEyEOHcXtNJprc1NKu64cbkQao0LE6MVnbxsvgEsmEdg8YjjOjWxQODXApOfJkG8y1Nh4JopKPDU85joqY5YYDVLsGhz+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725883454; c=relaxed/simple;
	bh=SRmZiUPJki7FJFLUI7ONfyvoM+Ib63/w3VfD3gYJSJs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OHQWnw1j8NynZKFYr1eqZyEsUc+yczoCCi+N2WXvbRT4aSpFI3OPdGnndjxgBRFdA9JmqK4sUNX7AcFUFmRvKpJaGobSksC17nyrlFROfAKsApN0MsjM4PlKdp+ourR+wkRRD+aA9Q7zD45ho6jDJMl4OBuljjsLs0amM13ZkkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l6b9L4JV; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l6b9L4JV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725883452; x=1757419452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SRmZiUPJki7FJFLUI7ONfyvoM+Ib63/w3VfD3gYJSJs=;
  b=l6b9L4JVpIoj6zFr906dk6e4sCQ8f2dPaL6dLvOXbeaTVpgd7bHZ5ZKR
   2GUhq21GyH152C+/OuOrovDDL/ncHvzYYRr3lscQDLBgeLu48/uyamBTc
   rkZy2mnaNSqgjj9TWTjTY8JkqfxgJQbEf2QFdSoPJuaOPUzaDUUJr2pML
   /xAP99O1QgHz9/QVJwNkf0QerdqXQ2xhqmFfUcMO/msHw7froeF7ucL4q
   kADJEe69eBeUhmAyCWphfJQrZ4EmSTahmovk6d7A85z9MikP9Io1PldLc
   1u0OFX41sJvoQFNoXBIkN5/dEkBUAFhhAlpLE1sUY9qh3sr8WQj6Nk0lr
   g==;
X-CSE-ConnectionGUID: t26i1TAlTH23O95JUeOAaw==
X-CSE-MsgGUID: eUFeFEbDS/2KeHzjQpwgGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="28459825"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="28459825"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 05:04:12 -0700
X-CSE-ConnectionGUID: MMiZSe0CT1KLKM7Dr/87gA==
X-CSE-MsgGUID: kX0bCtyuQ0KBDqdux5wyyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="66891994"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Sep 2024 05:04:10 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snd7o-000EgO-2Y;
	Mon, 09 Sep 2024 12:04:08 +0000
Date: Mon, 9 Sep 2024 20:03:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 20910/30000] drivers/iommu/intel/iommu.c:5894
 intel_iommu_unmap() warn: variable dereferenced before check 'gather' (see
 line 5885)
Message-ID: <202409091900.JffgO6qd-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Jason Zeng <jason.zeng@intel.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   3e6d44ea60eb8609ba59273c12276e3236cd76b2
commit: 004c9426acfc9d9dcb19ec63f0f6aa2f754a06ee [20910/30000] iommu/vt-d: Avoid superfluous IOTLB tracking in lazy mode
:::::: branch date: 11 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20240906 (https://download.01.org/0day-ci/archive/20240909/202409091900.JffgO6qd-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409091900.JffgO6qd-lkp@intel.com/

New smatch warnings:
drivers/iommu/intel/iommu.c:5894 intel_iommu_unmap() warn: variable dereferenced before check 'gather' (see line 5885)

Old smatch warnings:
drivers/iommu/intel/iommu.c:263 context_copied() warn: test_bit() takes a bit number
drivers/iommu/intel/iommu.c:951 device_to_iommu() error: we previously assumed 'pdev' could be null (see line 924)
drivers/iommu/intel/iommu.c:275 clear_context_copied() warn: clear_bit() takes a bit number
drivers/iommu/intel/iommu.c:2471 __domain_mapping() error: we previously assumed 'sg' could be null (see line 2462)
drivers/iommu/intel/iommu.c:269 set_context_copied() warn: set_bit() takes a bit number

vim +/gather +5894 drivers/iommu/intel/iommu.c

38717946425792 drivers/pci/intel-iommu.c   Kay, Allen M    2008-09-09  5865  
5009065d38c954 drivers/iommu/intel-iommu.c Ohad Ben-Cohen  2011-11-10  5866  static size_t intel_iommu_unmap(struct iommu_domain *domain,
56f8af5e9d38f1 drivers/iommu/intel-iommu.c Will Deacon     2019-07-02  5867  				unsigned long iova, size_t size,
56f8af5e9d38f1 drivers/iommu/intel-iommu.c Will Deacon     2019-07-02  5868  				struct iommu_iotlb_gather *gather)
38717946425792 drivers/pci/intel-iommu.c   Kay, Allen M    2008-09-09  5869  {
00a77deb0f2f2c drivers/iommu/intel-iommu.c Joerg Roedel    2015-03-26  5870  	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
ea8ea460c9ace6 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  5871  	unsigned long start_pfn, last_pfn;
4a2e7b3a540ffb drivers/iommu/intel/iommu.c Tom Murphy      2020-11-24  5872  	int level = 0;
5cf0a76fa2179d drivers/iommu/intel-iommu.c David Woodhouse 2014-03-19  5873  
5cf0a76fa2179d drivers/iommu/intel-iommu.c David Woodhouse 2014-03-19  5874  	/* Cope with horrid API which requires us to unmap more than the
5cf0a76fa2179d drivers/iommu/intel-iommu.c David Woodhouse 2014-03-19  5875  	   size argument if it happens to be a large-page mapping. */
dc02e46e8d0234 drivers/iommu/intel-iommu.c Joerg Roedel    2015-08-13  5876  	BUG_ON(!pfn_to_dma_pte(dmar_domain, iova >> VTD_PAGE_SHIFT, &level));
5cf0a76fa2179d drivers/iommu/intel-iommu.c David Woodhouse 2014-03-19  5877  
5cf0a76fa2179d drivers/iommu/intel-iommu.c David Woodhouse 2014-03-19  5878  	if (size < VTD_PAGE_SIZE << level_to_offset_bits(level))
5cf0a76fa2179d drivers/iommu/intel-iommu.c David Woodhouse 2014-03-19  5879  		size = VTD_PAGE_SIZE << level_to_offset_bits(level);
4b99d3527041be drivers/pci/intel-iommu.c   Sheng Yang      2009-07-08  5880  
ea8ea460c9ace6 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  5881  	start_pfn = iova >> VTD_PAGE_SHIFT;
ea8ea460c9ace6 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  5882  	last_pfn = (iova + size - 1) >> VTD_PAGE_SHIFT;
ea8ea460c9ace6 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  5883  
4a2e7b3a540ffb drivers/iommu/intel/iommu.c Tom Murphy      2020-11-24  5884  	gather->freelist = domain_unmap(dmar_domain, start_pfn,
4a2e7b3a540ffb drivers/iommu/intel/iommu.c Tom Murphy      2020-11-24 @5885  					last_pfn, gather->freelist);
fe40f1e020d092 drivers/pci/intel-iommu.c   Weidong Han     2008-12-08  5886  
163cc52ccd2cc5 drivers/pci/intel-iommu.c   David Woodhouse 2009-06-28  5887  	if (dmar_domain->max_addr == iova + size)
163cc52ccd2cc5 drivers/pci/intel-iommu.c   David Woodhouse 2009-06-28  5888  		dmar_domain->max_addr = iova;
b146a1c9f7f1fe drivers/pci/intel-iommu.c   Joerg Roedel    2010-01-20  5889  
004c9426acfc9d drivers/iommu/intel/iommu.c Jacob Pan       2023-02-16  5890  	/*
004c9426acfc9d drivers/iommu/intel/iommu.c Jacob Pan       2023-02-16  5891  	 * We do not use page-selective IOTLB invalidation in flush queue,
004c9426acfc9d drivers/iommu/intel/iommu.c Jacob Pan       2023-02-16  5892  	 * so there is no need to track page and sync iotlb.
004c9426acfc9d drivers/iommu/intel/iommu.c Jacob Pan       2023-02-16  5893  	 */
004c9426acfc9d drivers/iommu/intel/iommu.c Jacob Pan       2023-02-16 @5894  	if (!(gather && gather->queued))
4a2e7b3a540ffb drivers/iommu/intel/iommu.c Tom Murphy      2020-11-24  5895  		iommu_iotlb_gather_add_page(domain, gather, iova, size);
4a2e7b3a540ffb drivers/iommu/intel/iommu.c Tom Murphy      2020-11-24  5896  
5cf0a76fa2179d drivers/iommu/intel-iommu.c David Woodhouse 2014-03-19  5897  	return size;
38717946425792 drivers/pci/intel-iommu.c   Kay, Allen M    2008-09-09  5898  }
38717946425792 drivers/pci/intel-iommu.c   Kay, Allen M    2008-09-09  5899  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
