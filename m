Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5A513E41D
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Sep 2024 22:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726524757; cv=none; b=Yuak0Cd3qa/VifNfe/PWxAyab5Gl5NUdtXIT7TteT4Hll3KcdNASURf0W7jLVMx06YOXdKS43Bh0GxSRUeNvrz9IK8k9Hv8As+c6X3YmkUqhiPo8rONmlPOdKrzlBiWXNHg3msz9s1DZ0AVNrNAYJ5fDDS8ZWhDcZ5eLNEJH2g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726524757; c=relaxed/simple;
	bh=THvYOI+E4WjryDSWBPDbWl6vlTNw8xg24G9GYNRtjao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=guBvUMJzkxOiUXIHiwSdI/sMIX6SeIOF1v0GxPfQ5Vir085kGmOQj7hoy/A0ljOBKp2W8FtnBr5MLNOSVYdvR6dhAA/STUDZXhvxV4ka29KyD1z+bNFYnpFptpWBFDWVpOajsK7zXAEzE5TKOqea++SgkNXcEoaZSW1BJdzAI8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VBjOG3jf; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VBjOG3jf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726524754; x=1758060754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=THvYOI+E4WjryDSWBPDbWl6vlTNw8xg24G9GYNRtjao=;
  b=VBjOG3jf2pmyhaEWfEuPrzfbggmYfCMgjFRsf9Zg7qdhrVAVBNjUoCV4
   7Hz75gV364GFlWtT1Zars/fmwemtmtst97pAAXvyvStDGzBLEjgDoz9+6
   OM4HnRsUP6oQg8P0pPSHaX/sWJDr9Gd4luz+MblGsjJb2odgHIXWkgThY
   NY4vN7gYVd2jkOGtIYKni9+eTFEgOB0c1wASeQNI+BjO6kKJy2DVHd/3q
   sXO0FpGQEae4tOHT341/Jk8P20OBXapYZX/JM72UfWBIg94pPyh+wMEOF
   jPxsgSP1bifGY3MuDHTrLsRDCAthkYcWvyjTostH30kGrcbwSTvma6E1V
   w==;
X-CSE-ConnectionGUID: RMwjpnxBTlWszEFYQnGhlw==
X-CSE-MsgGUID: vcgTlcVzT9aUIvn1aVy3pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="29153731"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="29153731"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 15:12:32 -0700
X-CSE-ConnectionGUID: CpKOM1WYTCKzQRhNLyj7OA==
X-CSE-MsgGUID: oYHwDPphT1a+Tb29bC8sTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="73995738"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Sep 2024 15:12:31 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqJxN-000AYw-18;
	Mon, 16 Sep 2024 22:12:29 +0000
Date: Tue, 17 Sep 2024 06:12:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/vfio/pci/nvgrace-gpu/main.c:718
 nvgrace_gpu_fetch_memory_property() warn: impossible condition '(*pmemphys >
 ((((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 8 - 1 - (((-1)) <
 1)))))) => (0-u64max > u64max)'
Message-ID: <202409170650.YZhp6VSR-lkp@intel.com>
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
head:   a430d95c5efa2b545d26a094eb5f624e36732af0
commit: 701ab935859fcfd4a8c8a97f3ee4fb5294a9d481 vfio/nvgrace-gpu: Add vfio pci variant module for grace hopper
date:   7 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
config: sparc-randconfig-r071-20240916 (https://download.01.org/0day-ci/archive/20240917/202409170650.YZhp6VSR-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409170650.YZhp6VSR-lkp@intel.com/

smatch warnings:
drivers/vfio/pci/nvgrace-gpu/main.c:718 nvgrace_gpu_fetch_memory_property() warn: impossible condition '(*pmemphys > ((((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 8 - 1 - (((-1)) < 1)))))) => (0-u64max > u64max)'
drivers/vfio/pci/nvgrace-gpu/main.c:726 nvgrace_gpu_fetch_memory_property() warn: impossible condition '(*pmemlength > ((((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 8 - 1 - (((-1)) < 1)))))) => (0-u64max > u64max)'

vim +718 drivers/vfio/pci/nvgrace-gpu/main.c

701ab935859fcf Ankit Agrawal 2024-02-20  702  
701ab935859fcf Ankit Agrawal 2024-02-20  703  static int
701ab935859fcf Ankit Agrawal 2024-02-20  704  nvgrace_gpu_fetch_memory_property(struct pci_dev *pdev,
701ab935859fcf Ankit Agrawal 2024-02-20  705  				  u64 *pmemphys, u64 *pmemlength)
701ab935859fcf Ankit Agrawal 2024-02-20  706  {
701ab935859fcf Ankit Agrawal 2024-02-20  707  	int ret;
701ab935859fcf Ankit Agrawal 2024-02-20  708  
701ab935859fcf Ankit Agrawal 2024-02-20  709  	/*
701ab935859fcf Ankit Agrawal 2024-02-20  710  	 * The memory information is present in the system ACPI tables as DSD
701ab935859fcf Ankit Agrawal 2024-02-20  711  	 * properties nvidia,gpu-mem-base-pa and nvidia,gpu-mem-size.
701ab935859fcf Ankit Agrawal 2024-02-20  712  	 */
701ab935859fcf Ankit Agrawal 2024-02-20  713  	ret = device_property_read_u64(&pdev->dev, "nvidia,gpu-mem-base-pa",
701ab935859fcf Ankit Agrawal 2024-02-20  714  				       pmemphys);
701ab935859fcf Ankit Agrawal 2024-02-20  715  	if (ret)
701ab935859fcf Ankit Agrawal 2024-02-20  716  		return ret;
701ab935859fcf Ankit Agrawal 2024-02-20  717  
701ab935859fcf Ankit Agrawal 2024-02-20 @718  	if (*pmemphys > type_max(phys_addr_t))
701ab935859fcf Ankit Agrawal 2024-02-20  719  		return -EOVERFLOW;
701ab935859fcf Ankit Agrawal 2024-02-20  720  
701ab935859fcf Ankit Agrawal 2024-02-20  721  	ret = device_property_read_u64(&pdev->dev, "nvidia,gpu-mem-size",
701ab935859fcf Ankit Agrawal 2024-02-20  722  				       pmemlength);
701ab935859fcf Ankit Agrawal 2024-02-20  723  	if (ret)
701ab935859fcf Ankit Agrawal 2024-02-20  724  		return ret;
701ab935859fcf Ankit Agrawal 2024-02-20  725  
701ab935859fcf Ankit Agrawal 2024-02-20 @726  	if (*pmemlength > type_max(size_t))
701ab935859fcf Ankit Agrawal 2024-02-20  727  		return -EOVERFLOW;
701ab935859fcf Ankit Agrawal 2024-02-20  728  
701ab935859fcf Ankit Agrawal 2024-02-20  729  	/*
701ab935859fcf Ankit Agrawal 2024-02-20  730  	 * If the C2C link is not up due to an error, the coherent device
701ab935859fcf Ankit Agrawal 2024-02-20  731  	 * memory size is returned as 0. Fail in such case.
701ab935859fcf Ankit Agrawal 2024-02-20  732  	 */
701ab935859fcf Ankit Agrawal 2024-02-20  733  	if (*pmemlength == 0)
701ab935859fcf Ankit Agrawal 2024-02-20  734  		return -ENOMEM;
701ab935859fcf Ankit Agrawal 2024-02-20  735  
701ab935859fcf Ankit Agrawal 2024-02-20  736  	return ret;
701ab935859fcf Ankit Agrawal 2024-02-20  737  }
701ab935859fcf Ankit Agrawal 2024-02-20  738  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
