Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923E31C04
	for <oe-kbuild@lists.linux.dev>; Sun,  7 May 2023 07:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683443551; x=1714979551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nq3Izkcb69SaA6ViIqj7VJ31lnnYDMf6yo7YDfEiV4A=;
  b=GPWnvQqtNzVgX6jeYX06tOSbOo46b/kZEGjlbdOUUAB1y1pBCtl7zLAX
   oTw4MzulqTNp0BnX1Poinvo2IokX5H1YQC/6DOnK7mB4kPgPbz30OAZ9+
   k2teIN7G76YnqL6cV+RYf807rchgZySf+dEJMuokhzztqZS+EIQfr+WoZ
   1oet9YHk7Hax4YrfvNfcsvUJQMDDTvk2Z0aj8Mo/zUVSvSRkCeDzYgjUX
   HYOiwfFQtDpn6eMMFLnOuzDaX7p3H3kXfLHPjdSEpYWM+/0oY7dc3TjZB
   210vbGKYtZmeIq4dCz1AMYmBapNBuLwV5jvh9LZkLPGeeSNKFA3WYrsXF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="338675844"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="338675844"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 00:12:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="822285822"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="822285822"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 May 2023 00:12:29 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvYZJ-0000fb-0q;
	Sun, 07 May 2023 07:12:29 +0000
Date: Sun, 7 May 2023 15:11:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/intel/iommu.c:230 clear_context_copied() warn:
 clear_bit() takes a bit number
Message-ID: <202305071548.GbwMb766-lkp@intel.com>
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
head:   fc4354c6e5c21257cf4a50b32f7c11c7d65c55b3
commit: 0c5f6c0d8201a809a6585b07b6263e9db2c874a3 iommu/vt-d: Fix kdump kernels boot failure with scalable mode
date:   8 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 8 months ago
config: ia64-randconfig-m031-20230507 (https://download.01.org/0day-ci/archive/20230507/202305071548.GbwMb766-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305071548.GbwMb766-lkp@intel.com/

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
