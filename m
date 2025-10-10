Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3888E2FBDFE
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Oct 2025 16:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760113515; cv=none; b=k7qB1otYrAW4eO7UxqpKH8XlvqKgRDrQbWXX/y6P4m+/Ges0GTsyPcCl7byCoQMIJX0LJdQQdiJXy8yrvlVbHWh7VeLPLxcOJPpFZzzCVvfo2YrRtS7A1kC8p6J2gMd9MEoCKMIgCaXXOZq7G0wlvXByyilr2mDRL09qINh03ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760113515; c=relaxed/simple;
	bh=4c6cUOdZFNAIWKNvICqHmCx7KL8SG4fGC96YhJuw1fM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MzkgbKY//Pv6ITtx97ywrptklNTqq988BER1wWYmyzm/9Rn8MDkt0vKgdqC1VaE/xPTLL/x+Boa71rftQUBf+uAVTJD8rVJg0vr5QNdVBqju/xfydkklmpZ1RakdDHhUXhWvj9BGtbQuZ5qC5fwcySpGc+bN7NnhLXY0iNZy+qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jLMaNkiW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jLMaNkiW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760113513; x=1791649513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4c6cUOdZFNAIWKNvICqHmCx7KL8SG4fGC96YhJuw1fM=;
  b=jLMaNkiW4vdmUpnPxm7RkKWzNvk67PDPyi0lYL9PEtlEaLTTbVf+6T6n
   fa3DCXDJ+71Rf5isNep/0YSoJ+NN1Ms0NmV3AjCVptOi5YjV1Ki7DrMWU
   QR2FmwdFgKs5kfKMyP/OwxbLX+yzc0rCiC5ONm70q60+5iZtq+qigkHrx
   8uOfyJhxSZR+IvjBIvCIYOPp8++PQ0Sk3XAnNhZH8+CEYekfJDuhACCnJ
   vTwHNoi05pOsUSpouo96+dBzspfDw3lSiAJAV2qeyidn0yhoWNZjqRs8z
   JB2Ix82JmOyWqey3vZfPtsYUoItHDKopWWQLDC+IGgm6k3/A7BVcZ7bxW
   Q==;
X-CSE-ConnectionGUID: or4GAsswRw+CSqeWhx9sgg==
X-CSE-MsgGUID: dW/LT4vgRym6EOQ/AdttYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62254110"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62254110"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 09:25:01 -0700
X-CSE-ConnectionGUID: H9jvMiNMSO2rBM3pq6VwBw==
X-CSE-MsgGUID: ah9ucgrxRB2kkPEE/mt8Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="180699025"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Oct 2025 09:24:59 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7FvM-0002xJ-17;
	Fri, 10 Oct 2025 16:24:56 +0000
Date: Sat, 11 Oct 2025 00:24:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jgunthorpe:iommu_pt_vtd 12/34]
 drivers/iommu/generic_pt/fmt/../iommu_pt.h:291 amdv1_set_dirty() warn:
 sizeof(NUMBER)?
Message-ID: <202510110042.OzmbPlYW-lkp@intel.com>
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
TO: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://github.com/jgunthorpe/linux iommu_pt_vtd
head:   385b726d52995c3f1842ab4218ab299ef44c2360
commit: e919c47afc07f5da102d17bf2afbf97c826857df [12/34] iommufd: Change the selftest to use iommupt instead of xarray
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20251010 (https://download.01.org/0day-ci/archive/20251011/202510110042.OzmbPlYW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510110042.OzmbPlYW-lkp@intel.com/

New smatch warnings:
drivers/iommu/generic_pt/fmt/../iommu_pt.h:291 amdv1_set_dirty() warn: sizeof(NUMBER)?

Old smatch warnings:
drivers/iommu/generic_pt/fmt/../iommu_pt.h:153 pt_iommu_amdv1_iova_to_phys() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:663 increase_top() error: uninitialized symbol 'table_mem'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:663 increase_top() error: uninitialized symbol 'new_level'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:622 increase_top() warn: missing unwind goto?

vim +291 drivers/iommu/generic_pt/fmt/../iommu_pt.h

e919c47afc07f5d Jason Gunthorpe 2024-08-21  284  
e919c47afc07f5d Jason Gunthorpe 2024-08-21  285  static int __maybe_unused NS(set_dirty)(struct pt_iommu *iommu_table,
e919c47afc07f5d Jason Gunthorpe 2024-08-21  286  					dma_addr_t iova)
e919c47afc07f5d Jason Gunthorpe 2024-08-21  287  {
e919c47afc07f5d Jason Gunthorpe 2024-08-21  288  	struct pt_range range;
e919c47afc07f5d Jason Gunthorpe 2024-08-21  289  	int ret;
e919c47afc07f5d Jason Gunthorpe 2024-08-21  290  
e919c47afc07f5d Jason Gunthorpe 2024-08-21 @291  	ret = make_range(common_from_iommu(iommu_table), &range, iova, 1);
e919c47afc07f5d Jason Gunthorpe 2024-08-21  292  	if (ret)
e919c47afc07f5d Jason Gunthorpe 2024-08-21  293  		return ret;
e919c47afc07f5d Jason Gunthorpe 2024-08-21  294  
e919c47afc07f5d Jason Gunthorpe 2024-08-21  295  	/*
e919c47afc07f5d Jason Gunthorpe 2024-08-21  296  	 * Note: There is no locking here yet, if the test suite races this it
e919c47afc07f5d Jason Gunthorpe 2024-08-21  297  	 * can crash. It should use RCU locking eventually.
e919c47afc07f5d Jason Gunthorpe 2024-08-21  298  	 */
e919c47afc07f5d Jason Gunthorpe 2024-08-21  299  	return pt_walk_range(&range, __set_dirty, NULL);
e919c47afc07f5d Jason Gunthorpe 2024-08-21  300  }
e919c47afc07f5d Jason Gunthorpe 2024-08-21  301  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
