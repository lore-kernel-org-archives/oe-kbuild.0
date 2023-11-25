Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73672FE0D
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Nov 2023 22:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lTbVIFFo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700953075; x=1732489075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=66LOc6ha1wDJ9e0so4VJUOeFw+kqwk2EeePSjYXfZ80=;
  b=lTbVIFFotD1MGwxqcXuaIN8+VTWsmUVqa+C+Ho4H/o7/xKJnNHLjhINp
   lAcKxmKaz4qbanIEn/bZxKtHHyyEyelmD0dfchugcIxe8gprzXZzI7sIn
   68tCQAI/c+JdWp8tRHLEBDdun1UnG8CTxk+4JAmjWgHZ2spjRrf41GB+e
   d6+HfT+uWCzm8iCgBiloAcc5w8a46NXkuKFSA3JCHLiLZ274qqHhep+n1
   U8oBJ99E9Aad2cBX1M4gBSrP7QZZ4SgJdWv/CPwcxi6MNUaykK4GJMoAX
   0FRNjMqcZ1EDTabmPWbVhz2Fveth7+Hw5rf20cEZpg5TWGDf62AZRpsNQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="391404146"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="391404146"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 14:57:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="9439783"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2023 14:57:50 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r71au-0004Ud-0X;
	Sat, 25 Nov 2023 22:57:48 +0000
Date: Sun, 26 Nov 2023 06:57:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jgunthorpe:iommu_fwspec 12/41] drivers/iommu/of_iommu.c:128
 of_iommu_for_each_id() error: we previously assumed 'id' could be null (see
 line 127)
Message-ID: <202311260642.VkLE7lht-lkp@intel.com>
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

tree:   https://github.com/jgunthorpe/linux iommu_fwspec
head:   49c7574491cc9c8e8f21a8e8acb635b0e0bdfd61
commit: c7f276e38638a13299b4ded2ad6193f863534475 [12/41] iommu/of: Make a of_iommu_for_each_id()
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: mips-randconfig-r071-20231126 (https://download.01.org/0day-ci/archive/20231126/202311260642.VkLE7lht-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20231126/202311260642.VkLE7lht-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311260642.VkLE7lht-lkp@intel.com/

smatch warnings:
drivers/iommu/of_iommu.c:128 of_iommu_for_each_id() error: we previously assumed 'id' could be null (see line 127)

vim +/id +128 drivers/iommu/of_iommu.c

a081bd4af4ce80 Lorenzo Pieralisi 2020-06-19  102  
c7f276e38638a1 Jason Gunthorpe   2023-11-23  103  static int of_iommu_for_each_id(struct device *dev,
c7f276e38638a1 Jason Gunthorpe   2023-11-23  104  				struct device_node *master_np, const u32 *id,
c7f276e38638a1 Jason Gunthorpe   2023-11-23  105  				of_for_each_fn fn, void *info)
a081bd4af4ce80 Lorenzo Pieralisi 2020-06-19  106  {
c7f276e38638a1 Jason Gunthorpe   2023-11-23  107  	/*
c7f276e38638a1 Jason Gunthorpe   2023-11-23  108  	 * We don't currently walk up the tree looking for a parent IOMMU.
c7f276e38638a1 Jason Gunthorpe   2023-11-23  109  	 * See the `Notes:' section of
c7f276e38638a1 Jason Gunthorpe   2023-11-23  110  	 * Documentation/devicetree/bindings/iommu/iommu.txt
c7f276e38638a1 Jason Gunthorpe   2023-11-23  111  	 */
c7f276e38638a1 Jason Gunthorpe   2023-11-23  112  	if (dev_is_pci(dev)) {
c7f276e38638a1 Jason Gunthorpe   2023-11-23  113  		struct of_pci_iommu_alias_info pci_info = {
c7f276e38638a1 Jason Gunthorpe   2023-11-23  114  			.np = master_np,
c7f276e38638a1 Jason Gunthorpe   2023-11-23  115  			.fn = fn,
c7f276e38638a1 Jason Gunthorpe   2023-11-23  116  			.info = info,
c7f276e38638a1 Jason Gunthorpe   2023-11-23  117  		};
c7f276e38638a1 Jason Gunthorpe   2023-11-23  118  
c7f276e38638a1 Jason Gunthorpe   2023-11-23  119  		/* In PCI mode the ID comes from the RID */
c7f276e38638a1 Jason Gunthorpe   2023-11-23  120  		if (WARN_ON(id))
c7f276e38638a1 Jason Gunthorpe   2023-11-23  121  			return -EINVAL;
c7f276e38638a1 Jason Gunthorpe   2023-11-23  122  
c7f276e38638a1 Jason Gunthorpe   2023-11-23  123  		return pci_for_each_dma_alias(to_pci_dev(dev),
c7f276e38638a1 Jason Gunthorpe   2023-11-23  124  					     __for_each_map_pci, &pci_info);
c7f276e38638a1 Jason Gunthorpe   2023-11-23  125  	}
c7f276e38638a1 Jason Gunthorpe   2023-11-23  126  
c7f276e38638a1 Jason Gunthorpe   2023-11-23 @127  	if (!id)
c7f276e38638a1 Jason Gunthorpe   2023-11-23 @128  		return __for_each_map_id(master_np, *id, fn, info);
c7f276e38638a1 Jason Gunthorpe   2023-11-23  129  	return __for_each_iommus(master_np, fn, info);
a081bd4af4ce80 Lorenzo Pieralisi 2020-06-19  130  }
a081bd4af4ce80 Lorenzo Pieralisi 2020-06-19  131  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
