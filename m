Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23DF194
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Sep 2023 00:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693788779; x=1725324779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pBCMx01abyra6dgNMain/hA1Vo41SMR19gFVDaf3dVM=;
  b=Ct+lGwaBvYyHCB2aBO9D2R0eu6LXA4lKZsPmazrMEsw9XRfgTv0BjSYi
   LB+26NeZ/uzYjBiWB4L+CMGKtuXfjVqifdDdI2xvK5qla/ozVkYXa8tII
   e78wxrdi85c89L7C4+PyPfLiVtsav0ZILdeB7Jf7b2ne0zBA+qZrpa8zo
   uYrdmUYHzAUgJ0wQWyoB5o7+SQX+pP5qiLsf+lvMsVhHqOVHbU61/KDra
   W3O/oSdrCXM2TLNSueCrANSL11BJs6Au6fa0hLWoFZelC1sqODGLR/qSA
   942ZAJxyKXNexuA2owN5VZqJxVCaiNVqNlRMCh3AN7zqUTYCpbLN6+Wai
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="376422885"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="376422885"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 17:52:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="806069757"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="806069757"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 03 Sep 2023 17:52:57 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcxpn-00001q-0n;
	Mon, 04 Sep 2023 00:52:55 +0000
Date: Mon, 4 Sep 2023 08:52:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/amd/init.c:2187 amd_iommu_init_pci() error:
 uninitialized symbol 'ret'.
Message-ID: <202309040858.prlg4zn5-lkp@intel.com>
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
TO: Robin Murphy <robin.murphy@arm.com>
CC: Joerg Roedel <jroedel@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   708283abf896dd4853e673cc8cba70acaf9bf4ea
commit: 31ee890a01fd2bb90f95e44ba441cccc47660f18 iommu/amd: Clean up bus_set_iommu()
date:   12 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-161-20230904 (https://download.01.org/0day-ci/archive/20230904/202309040858.prlg4zn5-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230904/202309040858.prlg4zn5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309040858.prlg4zn5-lkp@intel.com/

smatch warnings:
drivers/iommu/amd/init.c:2187 amd_iommu_init_pci() error: uninitialized symbol 'ret'.

vim +/ret +2187 drivers/iommu/amd/init.c

4d121c3256edc6 drivers/iommu/amd_iommu_init.c Joerg Roedel          2012-06-14  2150  
2c0ae1720c09c6 drivers/iommu/amd_iommu_init.c Joerg Roedel          2012-06-12  2151  static int __init amd_iommu_init_pci(void)
23c742db217113 drivers/iommu/amd_iommu_init.c Joerg Roedel          2012-06-12  2152  {
23c742db217113 drivers/iommu/amd_iommu_init.c Joerg Roedel          2012-06-12  2153  	struct amd_iommu *iommu;
1ab5a15334529d drivers/iommu/amd/init.c       Suravee Suthikulpanit 2022-07-06  2154  	struct amd_iommu_pci_seg *pci_seg;
f8993dc666f44e drivers/iommu/amd/init.c       Adrian Huang          2020-12-10  2155  	int ret;
23c742db217113 drivers/iommu/amd_iommu_init.c Joerg Roedel          2012-06-12  2156  
23c742db217113 drivers/iommu/amd_iommu_init.c Joerg Roedel          2012-06-12  2157  	for_each_iommu(iommu) {
23c742db217113 drivers/iommu/amd_iommu_init.c Joerg Roedel          2012-06-12  2158  		ret = iommu_init_pci(iommu);
06687a03805e29 drivers/iommu/amd/init.c       Suravee Suthikulpanit 2022-03-01  2159  		if (ret) {
06687a03805e29 drivers/iommu/amd/init.c       Suravee Suthikulpanit 2022-03-01  2160  			pr_err("IOMMU%d: Failed to initialize IOMMU Hardware (error=%d)!\n",
06687a03805e29 drivers/iommu/amd/init.c       Suravee Suthikulpanit 2022-03-01  2161  			       iommu->index, ret);
06687a03805e29 drivers/iommu/amd/init.c       Suravee Suthikulpanit 2022-03-01  2162  			goto out;
06687a03805e29 drivers/iommu/amd/init.c       Suravee Suthikulpanit 2022-03-01  2163  		}
54ce12e02e44fe drivers/iommu/amd/init.c       Suravee Suthikulpanit 2020-09-23  2164  		/* Need to setup range after PCI init */
54ce12e02e44fe drivers/iommu/amd/init.c       Suravee Suthikulpanit 2020-09-23  2165  		iommu_set_cwwb_range(iommu);
23c742db217113 drivers/iommu/amd_iommu_init.c Joerg Roedel          2012-06-12  2166  	}
23c742db217113 drivers/iommu/amd_iommu_init.c Joerg Roedel          2012-06-12  2167  
522e5cb76d0663 drivers/iommu/amd_iommu_init.c Joerg Roedel          2016-07-01  2168  	/*
522e5cb76d0663 drivers/iommu/amd_iommu_init.c Joerg Roedel          2016-07-01  2169  	 * Order is important here to make sure any unity map requirements are
522e5cb76d0663 drivers/iommu/amd_iommu_init.c Joerg Roedel          2016-07-01  2170  	 * fulfilled. The unity mappings are created and written to the device
31ee890a01fd2b drivers/iommu/amd/init.c       Robin Murphy          2022-08-15  2171  	 * table during the iommu_init_pci() call.
522e5cb76d0663 drivers/iommu/amd_iommu_init.c Joerg Roedel          2016-07-01  2172  	 *
522e5cb76d0663 drivers/iommu/amd_iommu_init.c Joerg Roedel          2016-07-01  2173  	 * After that we call init_device_table_dma() to make sure any
522e5cb76d0663 drivers/iommu/amd_iommu_init.c Joerg Roedel          2016-07-01  2174  	 * uninitialized DTE will block DMA, and in the end we flush the caches
522e5cb76d0663 drivers/iommu/amd_iommu_init.c Joerg Roedel          2016-07-01  2175  	 * of all IOMMUs to make sure the changes to the device table are
522e5cb76d0663 drivers/iommu/amd_iommu_init.c Joerg Roedel          2016-07-01  2176  	 * active.
522e5cb76d0663 drivers/iommu/amd_iommu_init.c Joerg Roedel          2016-07-01  2177  	 */
1ab5a15334529d drivers/iommu/amd/init.c       Suravee Suthikulpanit 2022-07-06  2178  	for_each_pci_segment(pci_seg)
1ab5a15334529d drivers/iommu/amd/init.c       Suravee Suthikulpanit 2022-07-06  2179  		init_device_table_dma(pci_seg);
aafd8ba0ca7489 drivers/iommu/amd_iommu_init.c Joerg Roedel          2015-05-28  2180  
aafd8ba0ca7489 drivers/iommu/amd_iommu_init.c Joerg Roedel          2015-05-28  2181  	for_each_iommu(iommu)
aafd8ba0ca7489 drivers/iommu/amd_iommu_init.c Joerg Roedel          2015-05-28  2182  		iommu_flush_all_caches(iommu);
aafd8ba0ca7489 drivers/iommu/amd_iommu_init.c Joerg Roedel          2015-05-28  2183  
4d121c3256edc6 drivers/iommu/amd_iommu_init.c Joerg Roedel          2012-06-14  2184  	print_iommu_info();
4d121c3256edc6 drivers/iommu/amd_iommu_init.c Joerg Roedel          2012-06-14  2185  
06687a03805e29 drivers/iommu/amd/init.c       Suravee Suthikulpanit 2022-03-01  2186  out:
23c742db217113 drivers/iommu/amd_iommu_init.c Joerg Roedel          2012-06-12 @2187  	return ret;
23c742db217113 drivers/iommu/amd_iommu_init.c Joerg Roedel          2012-06-12  2188  }
23c742db217113 drivers/iommu/amd_iommu_init.c Joerg Roedel          2012-06-12  2189  

:::::: The code at line 2187 was first introduced by commit
:::::: 23c742db217113585ccc6c4a9b6ff96d642b6158 iommu/amd: Split out PCI related parts of IOMMU initialization

:::::: TO: Joerg Roedel <joerg.roedel@amd.com>
:::::: CC: Joerg Roedel <joerg.roedel@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
