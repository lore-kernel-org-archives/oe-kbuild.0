Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82FD2D029
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Nov 2023 20:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fjkaErGc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700945323; x=1732481323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9J3/c0FVFz+Pcacvm7sv8eyie2ZghOkwTenYSYeCK24=;
  b=fjkaErGcUUZ7ShQhCwZOBPzXnkIFMc2257Sm7ITHSSULomgavKAJXdRW
   r+7wN4kMZkwSTPNF4Gjas6XZ68Zd+wfciwCVFo8yWgAjZGinnN3cfu1yU
   Me4glijCfYh1cByIzro/gUel2vH+YsEjRwfaPaSUc6CmygoUaqWQw613x
   VVIPr7/xf2rmGqs/I9xgUvlgfDhPIyDxZALQL+slEXjuIS6jfQsnVmO6i
   oPuDrRIK2POodyhgqZanReAO0mARVBq3Y5a18CPsrGJ39z4LIEu0slZte
   BMaQ1URilhwzGrbo4DNJaL2r+nrCBz9IEl59wzmxe02ojI94IizUezXyA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="456865685"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="456865685"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 12:48:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="761252982"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="761252982"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 25 Nov 2023 12:48:41 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6zZu-0004Pq-2l;
	Sat, 25 Nov 2023 20:48:38 +0000
Date: Sun, 26 Nov 2023 04:47:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [lubaolu-intel-iommu:vtd-static-identity-domain-v1 10/17]
 drivers/iommu/intel/iommu.h:990 clear_context_copied() warn: clear_bit()
 takes a bit number
Message-ID: <202311260409.u8fDnMwD-lkp@intel.com>
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
TO: Baolu Lu <baolu.lu@linux.intel.com>

tree:   https://github.com/LuBaolu/intel-iommu.git vtd-static-identity-domain-v1
head:   c56a30c3f4bbe56eb4ee140b0e56c9b9cfcff683
commit: 4176489808573c8bb862e6b58b155f19b3c3abe7 [10/17] iommu/vt-d: Move inline helpers to header files
:::::: branch date: 5 days ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-161-20231123 (https://download.01.org/0day-ci/archive/20231126/202311260409.u8fDnMwD-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231126/202311260409.u8fDnMwD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311260409.u8fDnMwD-lkp@intel.com/

New smatch warnings:
drivers/iommu/intel/iommu.h:990 clear_context_copied() warn: clear_bit() takes a bit number
drivers/iommu/intel/iommu.h:984 set_context_copied() warn: set_bit() takes a bit number

Old smatch warnings:
drivers/iommu/intel/iommu.c:616 device_lookup_iommu() error: we previously assumed 'pdev' could be null (see line 589)
drivers/iommu/intel/iommu.c:3106 intel_iommu_add() warn: missing unwind goto?

vim +990 drivers/iommu/intel/iommu.h

4176489808573c Lu Baolu 2023-11-18  980  
4176489808573c Lu Baolu 2023-11-18  981  static inline void
4176489808573c Lu Baolu 2023-11-18  982  set_context_copied(struct intel_iommu *iommu, u8 bus, u8 devfn)
4176489808573c Lu Baolu 2023-11-18  983  {
4176489808573c Lu Baolu 2023-11-18 @984  	set_bit(((long)bus << 8) | devfn, iommu->copied_tables);
4176489808573c Lu Baolu 2023-11-18  985  }
4176489808573c Lu Baolu 2023-11-18  986  
4176489808573c Lu Baolu 2023-11-18  987  static inline void
4176489808573c Lu Baolu 2023-11-18  988  clear_context_copied(struct intel_iommu *iommu, u8 bus, u8 devfn)
4176489808573c Lu Baolu 2023-11-18  989  {
4176489808573c Lu Baolu 2023-11-18 @990  	clear_bit(((long)bus << 8) | devfn, iommu->copied_tables);
4176489808573c Lu Baolu 2023-11-18  991  }
4176489808573c Lu Baolu 2023-11-18  992  #endif /* CONFIG_INTEL_IOMMU */
4176489808573c Lu Baolu 2023-11-18  993  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
