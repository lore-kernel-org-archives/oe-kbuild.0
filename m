Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83C9214A96
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Feb 2025 05:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740635872; cv=none; b=WC7RM4x01milePoRYN30IEZxA5bEYqYJQKL0+xfjydor0E9eRy57VEGqi99OYdJxDnDXb5PCnwDNYQTpZM/HEKOu0ZKHWMPM8EYhi20j5b+EM9XJxCjF1U9AEfKx7FtRERE2zBCd8hZ2HhiH0VaqOuV6K0m55HSeD+230m9WcS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740635872; c=relaxed/simple;
	bh=tpvahMk3NgDPp6dmZ3o/v+5M5jZlqBrd+Smyhrc6oYA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kCFosZusOEHk3fKz0A0i7PVlBZfly4zk+Qm/LVV0OZ9bLbpEV6a+hegmfIQfdAtstuDaR6/SO+1ohklr6dLTzWmgn2BxsLYLKgnDishsXnoeMfKpiU0mstqZrLTD9D48i6OKOPXVNGzOpL8AYXQkniApGg1F+oAqrVmHE8YVLlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6vee4IE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6vee4IE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740635871; x=1772171871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tpvahMk3NgDPp6dmZ3o/v+5M5jZlqBrd+Smyhrc6oYA=;
  b=m6vee4IEfyPKOlNnVjmK8Wpg5YxGLVR/W9Qd+FLXT0FcBtTh/mEKO+m8
   IQMVX/MUeZcbPG7j0zNa8bZapTM31p3lQcuwkTxx1ZbpOigBIMaJSqO1S
   EvFFcnFgOt+R5qjes8vahGle48wgO5ua868511LTOOQbKWBuEluLjRga0
   kC3XeKfU0Rd4Ruix5Dtua3+Ywg6EeFHXKP9H1GjMHUiIRJNfQ8nIqS8Gq
   spWadCK4taVQdUKrDm43m85wOEB+delr+Exww1f+wOcNw1drAGOBibBaM
   h2ufsjlVPEPz23dmypwk2uJAVkEyfrMDYgZDwHeOTIMj6bwPiq6hJrfMR
   A==;
X-CSE-ConnectionGUID: T3biDpcqRkO65OnDgzpEUw==
X-CSE-MsgGUID: 7o2PTOSQRjKDJ+sVgHXTlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="52148722"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="52148722"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 21:57:50 -0800
X-CSE-ConnectionGUID: zP6Wxnq1Tt20u7Wh/zA6zA==
X-CSE-MsgGUID: MimB3KBdR6eXQLBvoQKu5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="116718519"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 26 Feb 2025 21:57:49 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnWtx-000Cvk-0a;
	Thu, 27 Feb 2025 05:57:43 +0000
Date: Thu, 27 Feb 2025 13:57:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4924/6583] drivers/iommu/iommufd/device.c:327
 iommufd_sw_msi_get_map() error: 'cur' dereferencing possible ERR_PTR()
Message-ID: <202502271339.a2nWr9UA-lkp@intel.com>
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
CC: Nicolin Chen <nicolinc@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8433c776e1eb1371f5cd40b5fd3a61f9c7b7f3ad
commit: 598749522d4254afb33b8a6c1bea614a95896868 [4924/6583] iommufd: Implement sw_msi support natively
:::::: branch date: 24 hours ago
:::::: commit date: 6 days ago
config: i386-randconfig-141-20250226 (https://download.01.org/0day-ci/archive/20250227/202502271339.a2nWr9UA-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502271339.a2nWr9UA-lkp@intel.com/

New smatch warnings:
drivers/iommu/iommufd/device.c:327 iommufd_sw_msi_get_map() error: 'cur' dereferencing possible ERR_PTR()

Old smatch warnings:
drivers/iommu/iommufd/device.c:1392 iommufd_access_rw() error: uninitialized symbol 'rc'.

vim +/cur +327 drivers/iommu/iommufd/device.c

78d3df457ae5eb Yi Liu          2023-07-18  296  
598749522d4254 Jason Gunthorpe 2025-02-19  297  /*
598749522d4254 Jason Gunthorpe 2025-02-19  298   * Get a iommufd_sw_msi_map for the msi physical address requested by the irq
598749522d4254 Jason Gunthorpe 2025-02-19  299   * layer. The mapping to IOVA is global to the iommufd file descriptor, every
598749522d4254 Jason Gunthorpe 2025-02-19  300   * domain that is attached to a device using the same MSI parameters will use
598749522d4254 Jason Gunthorpe 2025-02-19  301   * the same IOVA.
598749522d4254 Jason Gunthorpe 2025-02-19  302   */
598749522d4254 Jason Gunthorpe 2025-02-19  303  static __maybe_unused struct iommufd_sw_msi_map *
598749522d4254 Jason Gunthorpe 2025-02-19  304  iommufd_sw_msi_get_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
598749522d4254 Jason Gunthorpe 2025-02-19  305  		       phys_addr_t sw_msi_start)
598749522d4254 Jason Gunthorpe 2025-02-19  306  {
598749522d4254 Jason Gunthorpe 2025-02-19  307  	struct iommufd_sw_msi_map *cur;
598749522d4254 Jason Gunthorpe 2025-02-19  308  	unsigned int max_pgoff = 0;
598749522d4254 Jason Gunthorpe 2025-02-19  309  
598749522d4254 Jason Gunthorpe 2025-02-19  310  	lockdep_assert_held(&ictx->sw_msi_lock);
598749522d4254 Jason Gunthorpe 2025-02-19  311  
598749522d4254 Jason Gunthorpe 2025-02-19  312  	list_for_each_entry(cur, &ictx->sw_msi_list, sw_msi_item) {
598749522d4254 Jason Gunthorpe 2025-02-19  313  		if (cur->sw_msi_start != sw_msi_start)
598749522d4254 Jason Gunthorpe 2025-02-19  314  			continue;
598749522d4254 Jason Gunthorpe 2025-02-19  315  		max_pgoff = max(max_pgoff, cur->pgoff + 1);
598749522d4254 Jason Gunthorpe 2025-02-19  316  		if (cur->msi_addr == msi_addr)
598749522d4254 Jason Gunthorpe 2025-02-19  317  			return cur;
598749522d4254 Jason Gunthorpe 2025-02-19  318  	}
598749522d4254 Jason Gunthorpe 2025-02-19  319  
598749522d4254 Jason Gunthorpe 2025-02-19  320  	if (ictx->sw_msi_id >=
598749522d4254 Jason Gunthorpe 2025-02-19  321  	    BITS_PER_BYTE * sizeof_field(struct iommufd_sw_msi_maps, bitmap))
598749522d4254 Jason Gunthorpe 2025-02-19  322  		return ERR_PTR(-EOVERFLOW);
598749522d4254 Jason Gunthorpe 2025-02-19  323  
598749522d4254 Jason Gunthorpe 2025-02-19  324  	cur = kzalloc(sizeof(*cur), GFP_KERNEL);
598749522d4254 Jason Gunthorpe 2025-02-19  325  	if (!cur)
598749522d4254 Jason Gunthorpe 2025-02-19  326  		cur = ERR_PTR(-ENOMEM);
598749522d4254 Jason Gunthorpe 2025-02-19 @327  	cur->sw_msi_start = sw_msi_start;
598749522d4254 Jason Gunthorpe 2025-02-19  328  	cur->msi_addr = msi_addr;
598749522d4254 Jason Gunthorpe 2025-02-19  329  	cur->pgoff = max_pgoff;
598749522d4254 Jason Gunthorpe 2025-02-19  330  	cur->id = ictx->sw_msi_id++;
598749522d4254 Jason Gunthorpe 2025-02-19  331  	list_add_tail(&cur->sw_msi_item, &ictx->sw_msi_list);
598749522d4254 Jason Gunthorpe 2025-02-19  332  	return cur;
598749522d4254 Jason Gunthorpe 2025-02-19  333  }
598749522d4254 Jason Gunthorpe 2025-02-19  334  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
