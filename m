Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC71B2848B1
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Oct 2025 20:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759435852; cv=none; b=NUoPtfIlFUrzec1F1TPsmu8LIr51yGlWDnHJaRpAPTv5K3aDHg57EAo5JLyhOdqk8nXukKSx/TyH+MxjU1MptHzX4O02zSasAe29v3bkeCe2s6sLnP5sQqID+rMkrx8T1PnkL6CHgmR1ge8bHqIo8g1HfoJyHfsLdd1N/ub+WfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759435852; c=relaxed/simple;
	bh=s4ObuXajDHQFjRK5Vx61AtVtl8UDN+s8k1ljQdj/3so=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DQCGy/T29DeyntIzFrWVaFyMpu2oNz/DFzDbLtGE8NOCgqdzF8SNsmfwKvNdsY2gmPjfKW/p9RFUA1qWVu9rBuECoAM2K8RiGPqrOO5wKmfh2FcCSk1v9L61G2Ys0SaTlLe/O6Bf0S9MpUhnlw2FTNQE7139mJp4pFmPYlauAN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nv/PeF2w; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nv/PeF2w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759435850; x=1790971850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s4ObuXajDHQFjRK5Vx61AtVtl8UDN+s8k1ljQdj/3so=;
  b=nv/PeF2wW9nsn5JUl1hNWB/e1Un1vHYGWc/75zM9jO6EQyTQTYgi0Okr
   4fJbqBwlWOjCWTbFMTcceJCmY1L2HESts9tG5bmc7ZjQtnbqJ2WUVjB54
   DlmnnSfu1kxwiDQB6IrdBR7RSti0rt94cDdFo8pc/kDBJi0/Aha/dLJKy
   bdmeymSbVB+Jf9w7sNT0fyzzGWbAqgr9TkeAe6hyZOOvG3NjDBYTwqQCA
   nSkplXbFW9LT7jTWGryqWRMJnL1RoLXe2jJ7KiKhpy6uEwm8qbr8wNpB6
   TJZriuZqSUjiCNK1bKNlzWNwVfOwe+uGtLakb5Q+b7dRpB7fFUhNexW5i
   A==;
X-CSE-ConnectionGUID: vCYpfe2cTxmneGcRdosdkg==
X-CSE-MsgGUID: cgCpWQaNS++uDHCDmoG1OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61890794"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="61890794"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 13:10:47 -0700
X-CSE-ConnectionGUID: mAP44EbLRqemDWyMuODxog==
X-CSE-MsgGUID: 1jSebu0XT3G6LJktT8uVUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="178757664"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Oct 2025 13:10:45 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4PdT-00045b-2B;
	Thu, 02 Oct 2025 20:10:43 +0000
Date: Fri, 3 Oct 2025 04:10:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jgunthorpe:iommu-fwspec 1/14] drivers/iommu/iommu.c:471
 iommu_do_probe_device() error: uninitialized symbol 'ret'.
Message-ID: <202510030445.Io6xezuL-lkp@intel.com>
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

tree:   https://github.com/jgunthorpe/linux iommu-fwspec
head:   670b33a8cfd32984040c12e995134b9cb4cdf0a5
commit: cca42a9b5325b96bfd3d74e24628511f537afbe9 [1/14] iommu: Add a probe_device_fwspec() op
:::::: branch date: 28 hours ago
:::::: commit date: 29 hours ago
config: x86_64-randconfig-161-20251002 (https://download.01.org/0day-ci/archive/20251003/202510030445.Io6xezuL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510030445.Io6xezuL-lkp@intel.com/

New smatch warnings:
drivers/iommu/iommu.c:471 iommu_do_probe_device() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/iommu/iommu.c:1073 iommu_group_alloc() warn: Calling kobject_put|get with state->initialized unset from line: 1053
drivers/iommu/iommu.c:1079 iommu_group_alloc() warn: Calling kobject_put|get with state->initialized unset from line: 1053
drivers/iommu/iommu.c:1088 iommu_group_alloc() warn: Calling kobject_put|get with state->initialized unset from line: 1053

vim +/ret +471 drivers/iommu/iommu.c

eda1a94caf6b05 Jason Gunthorpe 2023-12-07  410  
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  411  static int iommu_do_probe_device(struct device *dev)
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  412  {
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  413  	struct iommu_device *iommu;
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  414  	int ret;
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  415  
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  416  	lockdep_assert_held(&iommu_probe_device_lock);
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  417  
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  418  	if (dev->iommu->fwspec) {
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  419  		struct iommu_device *fwspec_iommu;
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  420  
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  421  		fwspec_iommu =
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  422  			iommu_from_fwnode(dev->iommu->fwspec->iommu_fwnode);
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  423  		if (!fwspec_iommu)
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  424  			return -ENODEV;
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  425  
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  426  		if (fwspec_iommu->ops->probe_device_fwspec) {
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  427  			ret = fwspec_iommu->ops->probe_device_fwspec(
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  428  				fwspec_iommu, dev);
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  429  			if (ret)
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  430  				return ret;
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  431  			iommu = fwspec_iommu;
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  432  		} else {
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  433  			iommu = fwspec_iommu->ops->probe_device(dev);
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  434  			if (IS_ERR(iommu))
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  435  				return PTR_ERR(iommu);
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  436  			if (WARN_ON(iommu != fwspec_iommu)) {
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  437  				ret = -EINVAL;
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  438  				goto err_release;
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  439  			}
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  440  		}
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  441  	} else {
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  442  		/*
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  443  		 * At this point, relevant devices either now have a fwspec
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  444  		 * which will match ops registered with a non-NULL fwnode, or we
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  445  		 * can reasonably assume that only one of Intel, AMD, s390, PAMU
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  446  		 * or legacy SMMUv2 can be present, and that any of their
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  447  		 * registered instances has suitable ops for probing, and thus
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  448  		 * cheekily co-opt the same mechanism.
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  449  		 */
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  450  		iommu = iommu_from_fwnode(NULL);
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  451  		if (!iommu)
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  452  			return -ENODEV;
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  453  		/* Non fwspec drivers must identify their instance internally */
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  454  		if (WARN_ON(!iommu->ops->probe_device))
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  455  			return -EINVAL;
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  456  		iommu = iommu->ops->probe_device(dev);
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  457  		if (IS_ERR(iommu))
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  458  			return PTR_ERR(iommu);
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  459  	}
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  460  
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  461  	if (!try_module_get(iommu->ops->owner)) {
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  462  		ret = -EINVAL;
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  463  		goto err_release;
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  464  	}
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  465  
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  466  	dev->iommu->iommu_dev = iommu;
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  467  
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  468  err_release:
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  469  	if (iommu->ops->release_device)
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  470  		iommu->ops->release_device(dev);
cca42a9b5325b9 Jason Gunthorpe 2025-10-01 @471  	return ret;
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  472  }
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  473  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
