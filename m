Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24BC283C93
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 09:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766135049; cv=none; b=adgOTRkrWVJn0hqUDs2ZC5mJnZBIS6kxBAEghy2eOrwZ9JviB7d/uhrvex/coggTP+pW2CI3HQ+ZAUln0FYsRLL+PpLg6LFWyjbwjSqmlrj9f7t9S7j0uNcRskBgDJ935ItL4Dqurmr1uiT1W3aJh717J4lM2Rig5Gq2Cc+9pkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766135049; c=relaxed/simple;
	bh=X192LQ1iH0W4woCTwGSAFQ5Cfg5nQKZ6MuxWKr8K11s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Co2lxpTljuY0RhGJWjs8Af+zcQCxA9fAkXXW7m1WYYl9y2NXZ4u+raNyJp5Si6uPrrt0Bh7tG92yOXcNcRiFmaufgQrX3sm08w8TVUVS42B4rk+olfwCUcWw56TVb80vL7Epgm/pl4KyeWsGcL+m7FQ9pj+uMAElGDd6clb3wcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CbYnTNSK; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CbYnTNSK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766135048; x=1797671048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X192LQ1iH0W4woCTwGSAFQ5Cfg5nQKZ6MuxWKr8K11s=;
  b=CbYnTNSK8qjwM+HfHnGJDvcXgU0IRk3806ULGdRIefzgwvG3HnNDnxcL
   6tC3zdrAqv4UWmwnNZhlaMV9FHOYCDWV0duI6k+sQh2WxSC3sHKMSzeNG
   DwGxJYxZ+kC2dc5LtWIrllo5vn59zChkTXd3cJKZFsW43f6XBAat3aWuK
   lqX8ZqDMExuQeBTVOQadB3ZOv1rmZVnwDrjYZ9Wp585pp45nEufT+lslB
   xlwno2mOndmfUzIHTkbc9ywzCGNL2jQbTY2S8X4PbrRIcWcjuEl27YqgK
   mPaqHQhvWVCRg72gtCPA8vWJcp58M6ZcxTL+2oN4Lpru8zQyLTQ2RjBdh
   A==;
X-CSE-ConnectionGUID: uUH00DvURSagFDOcmJwpVw==
X-CSE-MsgGUID: KVoxDj58RzyIQ/0Ye3uHZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68070623"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="68070623"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:04:08 -0800
X-CSE-ConnectionGUID: r3HehA8/R4+vVtKVl8M+jw==
X-CSE-MsgGUID: 5EXF6KgSSm2VAsdOknmbew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="197964525"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Dec 2025 01:04:05 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWWP5-000000003In-1Vjx;
	Fri, 19 Dec 2025 09:04:03 +0000
Date: Fri, 19 Dec 2025 17:03:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/amd/iommu.c:2401 amd_iommu_probe_device() error:
 uninitialized symbol 'dev_data'.
Message-ID: <202512191724.meqJENXe-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Kishon Vijay Abraham I <kvijayab@amd.com>
CC: Joerg Roedel <jroedel@suse.de>
CC: Sairaj Kodilkar <sarunkod@amd.com>
CC: Vasant Hegde <vasant.hegde@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd9b004b7ff3289fb7bae35130c0a5c0537266af
commit: 19e5cc156cbc32421eb8237615f246c08eea8284 iommu/amd: Enable support for up to 2K interrupts per function
date:   9 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-r073-20251215 (https://download.01.org/0day-ci/archive/20251219/202512191724.meqJENXe-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512191724.meqJENXe-lkp@intel.com/

New smatch warnings:
drivers/iommu/amd/iommu.c:2401 amd_iommu_probe_device() error: uninitialized symbol 'dev_data'.
drivers/iommu/amd/iommu.c:3200 alloc_irq_table() error: we previously assumed 'iommu' could be null (see line 3195)

Old smatch warnings:
drivers/iommu/amd/iommu.c:1405 domain_flush_complete() warn: iterator 'i' not incremented
drivers/iommu/amd/iommu.c:1608 domain_flush_pages_v1() warn: iterator 'i' not incremented
drivers/iommu/amd/iommu.c:2153 init_gcr3_table() warn: missing error code? 'ret'
drivers/iommu/amd/iommu.c:2403 amd_iommu_probe_device() error: uninitialized symbol 'dev_data'.

vim +/dev_data +2401 drivers/iommu/amd/iommu.c

e275a2a0fc9e21 arch/x86/kernel/amd_iommu.c Joerg Roedel           2008-12-10  2352  
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2353  static struct iommu_device *amd_iommu_probe_device(struct device *dev)
15898bbcb48fc8 arch/x86/kernel/amd_iommu.c Joerg Roedel           2009-11-24  2354  {
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2355  	struct iommu_device *iommu_dev;
e275a2a0fc9e21 arch/x86/kernel/amd_iommu.c Joerg Roedel           2008-12-10  2356  	struct amd_iommu *iommu;
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2357  	struct iommu_dev_data *dev_data;
8b71c9bf4df829 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit  2022-07-06  2358  	int ret;
e275a2a0fc9e21 arch/x86/kernel/amd_iommu.c Joerg Roedel           2008-12-10  2359  
57bd2c24ba1673 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2360  	if (!check_device(dev))
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2361  		return ERR_PTR(-ENODEV);
e275a2a0fc9e21 arch/x86/kernel/amd_iommu.c Joerg Roedel           2008-12-10  2362  
8b71c9bf4df829 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit  2022-07-06  2363  	iommu = rlookup_amd_iommu(dev);
8b71c9bf4df829 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit  2022-07-06  2364  	if (!iommu)
8b71c9bf4df829 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit  2022-07-06  2365  		return ERR_PTR(-ENODEV);
e275a2a0fc9e21 arch/x86/kernel/amd_iommu.c Joerg Roedel           2008-12-10  2366  
cbc040081fdf7d drivers/iommu/amd/iommu.c   Robin Murphy           2022-08-15  2367  	/* Not registered yet? */
cbc040081fdf7d drivers/iommu/amd/iommu.c   Robin Murphy           2022-08-15  2368  	if (!iommu->iommu.ops)
cbc040081fdf7d drivers/iommu/amd/iommu.c   Robin Murphy           2022-08-15  2369  		return ERR_PTR(-ENODEV);
cbc040081fdf7d drivers/iommu/amd/iommu.c   Robin Murphy           2022-08-15  2370  
05a0542b456e13 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-05-27  2371  	if (dev_iommu_priv_get(dev))
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2372  		return &iommu->iommu;
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2373  
99fc4ac3d2978c drivers/iommu/amd/iommu.c   Suravee Suthikulpanit  2022-07-06  2374  	ret = iommu_init_device(iommu, dev);
4d58b8a6de6b8c drivers/iommu/amd_iommu.c   Joerg Roedel           2015-06-11  2375  	if (ret) {
5f226da1b1d706 drivers/iommu/amd_iommu.c   Bjorn Helgaas          2019-02-08  2376  		dev_err(dev, "Failed to initialize - trying to proceed anyway\n");
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2377  		iommu_dev = ERR_PTR(ret);
99fc4ac3d2978c drivers/iommu/amd/iommu.c   Suravee Suthikulpanit  2022-07-06  2378  		iommu_ignore_device(iommu, dev);
293aa9ec694e63 drivers/iommu/amd/iommu.c   Vasant Hegde           2024-08-28  2379  		goto out_err;
293aa9ec694e63 drivers/iommu/amd/iommu.c   Vasant Hegde           2024-08-28  2380  	}
293aa9ec694e63 drivers/iommu/amd/iommu.c   Vasant Hegde           2024-08-28  2381  
2b2c6aa63824c6 drivers/iommu/amd/iommu.c   Thomas Gleixner        2020-08-26  2382  	amd_iommu_set_pci_msi_domain(dev, iommu);
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2383  	iommu_dev = &iommu->iommu;
657cbb6b6cba0f arch/x86/kernel/amd_iommu.c Joerg Roedel           2009-11-23  2384  
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2385  	/*
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2386  	 * If IOMMU and device supports PASID then it will contain max
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2387  	 * supported PASIDs, else it will be zero.
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2388  	 */
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2389  	dev_data = dev_iommu_priv_get(dev);
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2390  	if (amd_iommu_pasid_supported() && dev_is_pci(dev) &&
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2391  	    pdev_pasid_supported(dev_data)) {
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2392  		dev_data->max_pasids = min_t(u32, iommu->iommu.max_pasids,
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2393  					     pci_max_pasids(to_pci_dev(dev)));
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2394  	}
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2395  
293aa9ec694e63 drivers/iommu/amd/iommu.c   Vasant Hegde           2024-08-28  2396  out_err:
19e5cc156cbc32 drivers/iommu/amd/iommu.c   Kishon Vijay Abraham I 2025-03-07  2397  
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2398  	iommu_completion_wait(iommu);
2c9195e9902970 drivers/iommu/amd_iommu.c   Joerg Roedel           2012-07-19  2399  
19e5cc156cbc32 drivers/iommu/amd/iommu.c   Kishon Vijay Abraham I 2025-03-07  2400  	if (FEATURE_NUM_INT_REMAP_SUP_2K(amd_iommu_efr2))
19e5cc156cbc32 drivers/iommu/amd/iommu.c   Kishon Vijay Abraham I 2025-03-07 @2401  		dev_data->max_irqs = MAX_IRQS_PER_TABLE_2K;
19e5cc156cbc32 drivers/iommu/amd/iommu.c   Kishon Vijay Abraham I 2025-03-07  2402  	else
19e5cc156cbc32 drivers/iommu/amd/iommu.c   Kishon Vijay Abraham I 2025-03-07  2403  		dev_data->max_irqs = MAX_IRQS_PER_TABLE_512;
19e5cc156cbc32 drivers/iommu/amd/iommu.c   Kishon Vijay Abraham I 2025-03-07  2404  
6c17c7d5936e6a drivers/iommu/amd/iommu.c   Jason Gunthorpe        2024-08-07  2405  	if (dev_is_pci(dev))
6c17c7d5936e6a drivers/iommu/amd/iommu.c   Jason Gunthorpe        2024-08-07  2406  		pci_prepare_ats(to_pci_dev(dev), PAGE_SHIFT);
6c17c7d5936e6a drivers/iommu/amd/iommu.c   Jason Gunthorpe        2024-08-07  2407  
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2408  	return iommu_dev;
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2409  }
1ac4cbbc5eb56d arch/x86/kernel/amd_iommu.c Joerg Roedel           2008-12-10  2410  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
