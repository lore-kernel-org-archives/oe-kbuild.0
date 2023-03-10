Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8327E1
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Mar 2023 20:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678481430; x=1710017430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6KDkH8OIs4NEhHj3oc91FdmND4xOJlEmUm/GY++Wu5A=;
  b=OiDcyDzjaRIHZiGBtHFN5+gd+UKcV+QUHmfjc1ArlioNz6Slvyg7INvs
   cABlmAJegMkY/2jVn8C82AH4+oLFRaKkSZnmiCd9Zk+PvIrYf8Ke7DRc6
   9LMBPVLwkSbtk8TzcZF60i9JaHhzpEiExxUWvQ020MTxuzP5mHe9iYsDj
   L2FHVPBlIqKl90wFy58DCyGJuQ5OWnufwJnCCAx5wnobpoKDptwPjRX3u
   7UbmN8ZWz5AV6l7ToPxsq3rSxwr7Diq+aMjNX10hob9Y1D6hdK8OY2dUN
   p+esbkTfozUuXsvwUuf0Fyx8Sl5emIooDhNxqNPx0/Or4BHbc2kz86CWC
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="325181849"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="325181849"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 12:50:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="852049363"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="852049363"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Mar 2023 12:50:28 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pajh5-00045L-2t;
	Fri, 10 Mar 2023 20:50:27 +0000
Date: Sat, 11 Mar 2023 04:50:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/intel/iommu.c:230 clear_context_copied() warn:
 clear_bit() takes a bit number
Message-ID: <202303110425.0xQ9OdsX-lkp@intel.com>
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
TO: Lu Baolu <baolu.lu@linux.intel.com>
CC: Joerg Roedel <jroedel@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   55a21105ecc156495446d8ae75d7d73f66baed7b
commit: 0c5f6c0d8201a809a6585b07b6263e9db2c874a3 iommu/vt-d: Fix kdump kernels boot failure with scalable mode
date:   6 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 6 months ago
config: ia64-randconfig-m041-20230308 (https://download.01.org/0day-ci/archive/20230311/202303110425.0xQ9OdsX-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303110425.0xQ9OdsX-lkp@intel.com/

New smatch warnings:
drivers/iommu/intel/iommu.c:230 clear_context_copied() warn: clear_bit() takes a bit number
drivers/iommu/intel/iommu.c:224 set_context_copied() warn: set_bit() takes a bit number

Old smatch warnings:
drivers/iommu/intel/iommu.c:731 device_to_iommu() error: we previously assumed 'pdev' could be null (see line 704)
arch/ia64/include/asm/timex.h:39 get_cycles() error: uninitialized symbol 'ia64_intri_res'.
drivers/iommu/intel/iommu.c:3422 intel_iommu_add() warn: missing unwind goto?

vim +230 drivers/iommu/intel/iommu.c

0c5f6c0d8201a8 Lu Baolu 2022-08-23  220  
0c5f6c0d8201a8 Lu Baolu 2022-08-23  221  static inline void
0c5f6c0d8201a8 Lu Baolu 2022-08-23  222  set_context_copied(struct intel_iommu *iommu, u8 bus, u8 devfn)
0c5f6c0d8201a8 Lu Baolu 2022-08-23  223  {
0c5f6c0d8201a8 Lu Baolu 2022-08-23 @224  	set_bit(((long)bus << 8) | devfn, iommu->copied_tables);
0c5f6c0d8201a8 Lu Baolu 2022-08-23  225  }
0c5f6c0d8201a8 Lu Baolu 2022-08-23  226  
0c5f6c0d8201a8 Lu Baolu 2022-08-23  227  static inline void
0c5f6c0d8201a8 Lu Baolu 2022-08-23  228  clear_context_copied(struct intel_iommu *iommu, u8 bus, u8 devfn)
0c5f6c0d8201a8 Lu Baolu 2022-08-23  229  {
0c5f6c0d8201a8 Lu Baolu 2022-08-23 @230  	clear_bit(((long)bus << 8) | devfn, iommu->copied_tables);
0c5f6c0d8201a8 Lu Baolu 2022-08-23  231  }
0c5f6c0d8201a8 Lu Baolu 2022-08-23  232  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
