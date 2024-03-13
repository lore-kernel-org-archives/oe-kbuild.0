Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356EE10A3E
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Mar 2024 04:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710305258; cv=none; b=EKNCUCvIt52MpIAWKbeHjVbptrNTDgoHqDywqJiKaPZyEBtdboSZ7RclzxDNL6UHeXAg57hIC9EjHEolO9kyQoBwASOeUV69G8EmWxdBzjpnH0I2r01pacGGxatz7u/MP5o8W6ZLP56AuvgpMEx7bDEenI8dEEY+pD6OZtMnaBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710305258; c=relaxed/simple;
	bh=T+PZuoxEjjkfWvaa4QVrhZDVXmyIxhUP7X47Tk/0DiU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O82fvB2IwJZ7w+R+M0yjNki2wzJ3kRw+Fmot7YcA7lw+vZ6jWjXx6gh5JvKi4txCCw6a3IzoRDN3+RM9RjeovfVlVuDQS2cr+DFw/E2NVMBVEtLsfYNC7A609X0V9BmA+ndeJjRld4W+UsmEtYRqtl91CjHSUgAnWW3pfFMnPiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ba5Rt3di; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ba5Rt3di"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710305256; x=1741841256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T+PZuoxEjjkfWvaa4QVrhZDVXmyIxhUP7X47Tk/0DiU=;
  b=Ba5Rt3diiJdwhPmgJVpWLW+AEcTEry5U/s60UkcN58MdEZXJK0k+oJXq
   9kg8u3DIKBKBBKTyBJfzH5UqMf6CPEg79IdTbUYl/bStClYdIHhpKd7OW
   USq+lGS+jETyX8w52Z3RWg+k+pQptvvia9xeFxqfSp/1Q3DPjE0+Wgk3d
   rzuGlcDW6uZ1dEftWKzuSaS2TNz59STQpy+N1iSJXUj0nzgtICv6JzL8I
   yaHzDOhuYgASUjAUqR7QaH2HT4he5nZHWq+JHahvOAPNyGS6fH88u0OI6
   yavXRSnXG5b9JjVfJQKA+6if1JtDZG14bN8mMQb+VR6XGoVUxAPyCBrsF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4905567"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4905567"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 21:47:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16264822"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Mar 2024 21:47:34 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkGWa-000C1h-0D;
	Wed, 13 Mar 2024 04:47:32 +0000
Date: Wed, 13 Mar 2024 12:47:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8114/13337]
 drivers/vfio/pci/nvgrace-gpu/main.c:718 nvgrace_gpu_fetch_memory_property()
 warn: impossible condition '(*pmemphys > ((((1 << (8 * 8 - 1 - (((-1)) <
 1))) - 1) + (1 << (8 * 8 - 1 - (((-1)) < 1)))))) => (0-u64max > u64max)'
Message-ID: <202403131244.nouxrenP-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Ankit Agrawal <ankita@nvidia.com>
CC: Alex Williamson <alex.williamson@redhat.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Yishai Hadas <yishaih@nvidia.com>
CC: Zhi Wang <zhi.wang.linux@gmail.com>
CC: Aniket Agashe <aniketa@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a1184cae56bcb96b86df3ee0377cec507a3f56e0
commit: 701ab935859fcfd4a8c8a97f3ee4fb5294a9d481 [8114/13337] vfio/nvgrace-gpu: Add vfio pci variant module for grace hopper
:::::: branch date: 24 hours ago
:::::: commit date: 3 weeks ago
config: loongarch-randconfig-r081-20240312 (https://download.01.org/0day-ci/archive/20240313/202403131244.nouxrenP-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403131244.nouxrenP-lkp@intel.com/

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
