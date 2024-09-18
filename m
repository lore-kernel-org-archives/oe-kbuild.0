Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A259291E
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Sep 2024 11:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726658839; cv=none; b=L3DQltaL1MzLBSjlHtKjP1j3BFpau2xMZfaC9b5Kcl61Fp8lWe8szd+K4GeTyX3rNKFnbVBc81Gvj3R9ez4zVf/WvoQuTfbc//kjgGn15DP5/mQm2KZmjraV4F2JYs5Tsd5RkLdIapHlIhy9W6twQDUdavi9BeyicsCuDm6VODQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726658839; c=relaxed/simple;
	bh=mAxC0NZ+pqOhI4rityCI6E1nS64cQBMMQC884DI5Ia4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rVv3y2ligc8ODWcUicwm1ULDQvseTR9YfcHIvL2aUcFDbLk/CZnYafercmDYQKGVlZiBctWkkL7e88oTXC+G5P+Bo0vxpXExIuy2mqzaO6eO8ClhVkM2DrxSPbq0x2TcP0eihH115ufODnzwfYn1sfrErO9k8pJL3qzelEFB/9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PgTJY5rz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PgTJY5rz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726658837; x=1758194837;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mAxC0NZ+pqOhI4rityCI6E1nS64cQBMMQC884DI5Ia4=;
  b=PgTJY5rzl5+/620lObpPCE3AidZqlNJ9OBYz0M1QsMZC9IWuWpvqsLe0
   S80wDfKdPWlzXwdZkbXIob5RQDmOMXd4M6P5WcfspZsc466DPCjhI0nwy
   blEBg3QqFRa9/33/joFgJA0Dz/lNn+w6lJFvEu2BPVaQU1CGPhIrTHuOz
   x0E6Om6gxprZ8kZTkiVuxZy5cRS34IP/jWmPb3MNCqxWSGRjGAc+bUry7
   h85ADz9j2lZ0rNgWfYjbzvMcSLTvek3Fuu9vwN0zGzB8fHQr0E+ICoDs5
   f5R/ZMHUMZnRbAYciWy+kzJRXfXNbv809CtJuZm3DwtYbxaiUJYUak93m
   w==;
X-CSE-ConnectionGUID: aWVe8Z2rTpKTseoGXMy1MQ==
X-CSE-MsgGUID: IJWCnxcwT7iVtfG4IpnNPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25050104"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="25050104"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 04:27:16 -0700
X-CSE-ConnectionGUID: HiHzYxWkTI+pfzIVpGrtIQ==
X-CSE-MsgGUID: yGHkepZFR627WxiYcg1liA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="100204193"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Sep 2024 04:27:14 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqsq0-000CCU-0m;
	Wed, 18 Sep 2024 11:27:12 +0000
Date: Wed, 18 Sep 2024 19:26:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/vfio/pci/nvgrace-gpu/main.c:718
 nvgrace_gpu_fetch_memory_property() warn: impossible condition '(*pmemphys >
 ((((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 8 - 1 - (((-1)) <
 1)))))) => (0-u64max > u64max)'
Message-ID: <202409181920.3bS7zequ-lkp@intel.com>
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
TO: Ankit Agrawal <ankita@nvidia.com>
CC: Alex Williamson <alex.williamson@redhat.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Yishai Hadas <yishaih@nvidia.com>
CC: Zhi Wang <zhi.wang.linux@gmail.com>
CC: Aniket Agashe <aniketa@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2f27fce67173bbb05d5a0ee03dae5c021202c912
commit: 701ab935859fcfd4a8c8a97f3ee4fb5294a9d481 vfio/nvgrace-gpu: Add vfio pci variant module for grace hopper
date:   7 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 7 months ago
config: sparc-randconfig-r071-20240916 (https://download.01.org/0day-ci/archive/20240918/202409181920.3bS7zequ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409181920.3bS7zequ-lkp@intel.com/

smatch warnings:
drivers/vfio/pci/nvgrace-gpu/main.c:718 nvgrace_gpu_fetch_memory_property() warn: impossible condition '(*pmemphys > ((((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 8 - 1 - (((-1)) < 1)))))) => (0-u64max > u64max)'
drivers/vfio/pci/nvgrace-gpu/main.c:726 nvgrace_gpu_fetch_memory_property() warn: impossible condition '(*pmemlength > ((((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 8 - 1 - (((-1)) < 1)))))) => (0-u64max > u64max)'

vim +718 drivers/vfio/pci/nvgrace-gpu/main.c

701ab935859fcfd Ankit Agrawal 2024-02-20  702  
701ab935859fcfd Ankit Agrawal 2024-02-20  703  static int
701ab935859fcfd Ankit Agrawal 2024-02-20  704  nvgrace_gpu_fetch_memory_property(struct pci_dev *pdev,
701ab935859fcfd Ankit Agrawal 2024-02-20  705  				  u64 *pmemphys, u64 *pmemlength)
701ab935859fcfd Ankit Agrawal 2024-02-20  706  {
701ab935859fcfd Ankit Agrawal 2024-02-20  707  	int ret;
701ab935859fcfd Ankit Agrawal 2024-02-20  708  
701ab935859fcfd Ankit Agrawal 2024-02-20  709  	/*
701ab935859fcfd Ankit Agrawal 2024-02-20  710  	 * The memory information is present in the system ACPI tables as DSD
701ab935859fcfd Ankit Agrawal 2024-02-20  711  	 * properties nvidia,gpu-mem-base-pa and nvidia,gpu-mem-size.
701ab935859fcfd Ankit Agrawal 2024-02-20  712  	 */
701ab935859fcfd Ankit Agrawal 2024-02-20  713  	ret = device_property_read_u64(&pdev->dev, "nvidia,gpu-mem-base-pa",
701ab935859fcfd Ankit Agrawal 2024-02-20  714  				       pmemphys);
701ab935859fcfd Ankit Agrawal 2024-02-20  715  	if (ret)
701ab935859fcfd Ankit Agrawal 2024-02-20  716  		return ret;
701ab935859fcfd Ankit Agrawal 2024-02-20  717  
701ab935859fcfd Ankit Agrawal 2024-02-20 @718  	if (*pmemphys > type_max(phys_addr_t))
701ab935859fcfd Ankit Agrawal 2024-02-20  719  		return -EOVERFLOW;
701ab935859fcfd Ankit Agrawal 2024-02-20  720  
701ab935859fcfd Ankit Agrawal 2024-02-20  721  	ret = device_property_read_u64(&pdev->dev, "nvidia,gpu-mem-size",
701ab935859fcfd Ankit Agrawal 2024-02-20  722  				       pmemlength);
701ab935859fcfd Ankit Agrawal 2024-02-20  723  	if (ret)
701ab935859fcfd Ankit Agrawal 2024-02-20  724  		return ret;
701ab935859fcfd Ankit Agrawal 2024-02-20  725  
701ab935859fcfd Ankit Agrawal 2024-02-20 @726  	if (*pmemlength > type_max(size_t))
701ab935859fcfd Ankit Agrawal 2024-02-20  727  		return -EOVERFLOW;
701ab935859fcfd Ankit Agrawal 2024-02-20  728  
701ab935859fcfd Ankit Agrawal 2024-02-20  729  	/*
701ab935859fcfd Ankit Agrawal 2024-02-20  730  	 * If the C2C link is not up due to an error, the coherent device
701ab935859fcfd Ankit Agrawal 2024-02-20  731  	 * memory size is returned as 0. Fail in such case.
701ab935859fcfd Ankit Agrawal 2024-02-20  732  	 */
701ab935859fcfd Ankit Agrawal 2024-02-20  733  	if (*pmemlength == 0)
701ab935859fcfd Ankit Agrawal 2024-02-20  734  		return -ENOMEM;
701ab935859fcfd Ankit Agrawal 2024-02-20  735  
701ab935859fcfd Ankit Agrawal 2024-02-20  736  	return ret;
701ab935859fcfd Ankit Agrawal 2024-02-20  737  }
701ab935859fcfd Ankit Agrawal 2024-02-20  738  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
