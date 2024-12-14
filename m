Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD43178C6D
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Dec 2024 20:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734209544; cv=none; b=e7K17FY8q4mCa1tqxLS7ESzWfg71spTyWcQnftyvKKUEq4cg1fKNTrhpyoCYSXnn8TdAEin+d+M8hLp9yVVwPMEqfaBhgyaNvROe7jK2X46G3cDV3g9dPDQ/NWUidQtQNt76qrxxqY33/opK1tMKytNK+mrEGKpLAqqZcMyXdpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734209544; c=relaxed/simple;
	bh=WnlxsU1V4gOV3f4i21wOmrbJHn0rUogn0EtqZgSMHto=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qFVQ6WtRfpRk8dDYo5Ah+6LPRDPhIHSO1PiEFllwTh/zfDdSG+tE9iijx3lQS31lr1mGzgyrYfnwuTwb0aq21KIwymSt/SUySc94xbcSGnaLnS2N+7qI4tNOfITlFUUwn7nTy829t9BLD8QlqYnzbNBDjCbMKSSL0hZZ1Ge/+5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ADIFB84t; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ADIFB84t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734209543; x=1765745543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WnlxsU1V4gOV3f4i21wOmrbJHn0rUogn0EtqZgSMHto=;
  b=ADIFB84t+B1FYADFIHvNnY4uqoFkP7mLCliH+lHLTl3Wm/aVqJtynGgD
   xtD5MmAPpLJzDoN4YSMbu5gBe1jz7GJCGwb5DXCHMbIxhzqVOeddizJuS
   aOk3Ldm1lydr9ohzqfdv6bPlNm6vwu+lbLy7tCvt24j0K8xvghsDeWcgp
   OaOBaCJHk9J3k45BPLioi24Wju0KjWSEv3VNDVHD1kjdA6WMmq0SyOQup
   adA4EP+bET8Yv8o467XkfuMIAJUMlf1YJOBXaDGf/teHsFKYBkOWlcFER
   WEZZKeYTl9ry2QqtQoGKbT+/Yq/kFIsCem3LrM/ObRqhgAwNI01+Od2Gr
   w==;
X-CSE-ConnectionGUID: 6DAFEJm9T6eLl9E+3X+6YQ==
X-CSE-MsgGUID: jfrHYrmfR3KxFKLP0AA+CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="45242393"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="45242393"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 12:52:22 -0800
X-CSE-ConnectionGUID: 9i2ncwkCSqyKJhNKfWc+bA==
X-CSE-MsgGUID: udlvOhBoRm+Sg5P40pfZ0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97273002"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Dec 2024 12:52:20 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMZ7a-000DDg-13;
	Sat, 14 Dec 2024 20:52:18 +0000
Date: Sun, 15 Dec 2024 04:52:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/amd/iommu.c:2011 init_gcr3_table() warn: missing error
 code? 'ret'
Message-ID: <202412150452.bS7b6cyM-lkp@intel.com>
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
TO: Vasant Hegde <vasant.hegde@amd.com>
CC: Joerg Roedel <jroedel@suse.de>
CC: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a0e3919a2df29b373b19a8fbd6e4c4c38fc10d87
commit: c9e8701132e6cc162d082e7dad8a2e9110f5f8fd iommu/amd: Setup GCR3 table in advance if domain is SVA capable
date:   8 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-r073-20241208 (https://download.01.org/0day-ci/archive/20241215/202412150452.bS7b6cyM-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412150452.bS7b6cyM-lkp@intel.com/

smatch warnings:
drivers/iommu/amd/iommu.c:2011 init_gcr3_table() warn: missing error code? 'ret'

vim +/ret +2011 drivers/iommu/amd/iommu.c

c5ebd0962539100 Vasant Hegde 2024-04-18  1981  
c9e8701132e6cc1 Vasant Hegde 2024-04-18  1982  /*
c9e8701132e6cc1 Vasant Hegde 2024-04-18  1983   * If domain is SVA capable then initialize GCR3 table. Also if domain is
c9e8701132e6cc1 Vasant Hegde 2024-04-18  1984   * in v2 page table mode then update GCR3[0].
c9e8701132e6cc1 Vasant Hegde 2024-04-18  1985   */
c9e8701132e6cc1 Vasant Hegde 2024-04-18  1986  static int init_gcr3_table(struct iommu_dev_data *dev_data,
c9e8701132e6cc1 Vasant Hegde 2024-04-18  1987  			   struct protection_domain *pdom)
c9e8701132e6cc1 Vasant Hegde 2024-04-18  1988  {
c9e8701132e6cc1 Vasant Hegde 2024-04-18  1989  	struct amd_iommu *iommu = get_amd_iommu_from_dev_data(dev_data);
c9e8701132e6cc1 Vasant Hegde 2024-04-18  1990  	int max_pasids = dev_data->max_pasids;
c9e8701132e6cc1 Vasant Hegde 2024-04-18  1991  	int ret = 0;
c9e8701132e6cc1 Vasant Hegde 2024-04-18  1992  
c9e8701132e6cc1 Vasant Hegde 2024-04-18  1993  	 /*
c9e8701132e6cc1 Vasant Hegde 2024-04-18  1994  	  * If domain is in pt mode then setup GCR3 table only if device
c9e8701132e6cc1 Vasant Hegde 2024-04-18  1995  	  * is PASID capable
c9e8701132e6cc1 Vasant Hegde 2024-04-18  1996  	  */
c9e8701132e6cc1 Vasant Hegde 2024-04-18  1997  	if (pdom_is_in_pt_mode(pdom) && !pdev_pasid_supported(dev_data))
c9e8701132e6cc1 Vasant Hegde 2024-04-18  1998  		return ret;
c9e8701132e6cc1 Vasant Hegde 2024-04-18  1999  
c9e8701132e6cc1 Vasant Hegde 2024-04-18  2000  	/*
c9e8701132e6cc1 Vasant Hegde 2024-04-18  2001  	 * By default, setup GCR3 table to support MAX PASIDs
c9e8701132e6cc1 Vasant Hegde 2024-04-18  2002  	 * supported by the device/IOMMU.
c9e8701132e6cc1 Vasant Hegde 2024-04-18  2003  	 */
c9e8701132e6cc1 Vasant Hegde 2024-04-18  2004  	ret = setup_gcr3_table(&dev_data->gcr3_info, iommu,
c9e8701132e6cc1 Vasant Hegde 2024-04-18  2005  			       max_pasids > 0 ?  max_pasids : 1);
c9e8701132e6cc1 Vasant Hegde 2024-04-18  2006  	if (ret)
c9e8701132e6cc1 Vasant Hegde 2024-04-18  2007  		return ret;
c9e8701132e6cc1 Vasant Hegde 2024-04-18  2008  
c9e8701132e6cc1 Vasant Hegde 2024-04-18  2009  	/* Setup GCR3[0] only if domain is setup with v2 page table mode */
c9e8701132e6cc1 Vasant Hegde 2024-04-18  2010  	if (!pdom_is_v2_pgtbl_mode(pdom))
c9e8701132e6cc1 Vasant Hegde 2024-04-18 @2011  		return ret;
c9e8701132e6cc1 Vasant Hegde 2024-04-18  2012  
c9e8701132e6cc1 Vasant Hegde 2024-04-18  2013  	ret = update_gcr3(dev_data, 0, iommu_virt_to_phys(pdom->iop.pgd), true);
c9e8701132e6cc1 Vasant Hegde 2024-04-18  2014  	if (ret)
c9e8701132e6cc1 Vasant Hegde 2024-04-18  2015  		free_gcr3_table(&dev_data->gcr3_info);
c9e8701132e6cc1 Vasant Hegde 2024-04-18  2016  
c9e8701132e6cc1 Vasant Hegde 2024-04-18  2017  	return ret;
c9e8701132e6cc1 Vasant Hegde 2024-04-18  2018  }
c9e8701132e6cc1 Vasant Hegde 2024-04-18  2019  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
