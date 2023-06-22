Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FD8185E
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jun 2023 02:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687402163; x=1718938163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L6CmXVZlAji+G+TPG13cKjiH2HeefB2uJTQGsH6o0Ok=;
  b=NeJno7jZYTfD2xDg1XfQD2MmWZ/7+WIcYYQ5Lku9P8Q3m1A9yKyoqRyW
   nQhBIInnQJtmwYedosV97qGDL1oumc+1HVsWlpZ+QiBN6bQ6bVpZ0Tgjl
   5E7smkzoAcDI1/6JlIybqE+HLmCrKVwaw1kwoEFzeWZ0vWE0/vagMTMCs
   sk6BlVeKw44+b5FGJFdnPCtwGO4QLTlZQ5oRWktTBLEVvJAV63QOacgdW
   jNeouc4+b6bmGeEIb2l7Ztowi4zc34UayySRpsu+Bh7rWyrBEVfFcW2t8
   zjVqMsulpEBtQxqIRg8/lUqm/q0ILO5jit1L/EW7rZTWezxDYdC94fHoq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="339976569"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; 
   d="scan'208";a="339976569"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 19:48:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="784740121"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; 
   d="scan'208";a="784740121"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jun 2023 19:48:27 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCAN0-0007HS-2m;
	Thu, 22 Jun 2023 02:48:26 +0000
Date: Thu, 22 Jun 2023 10:48:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/dma/idxd/device.c:774:8-26: WARNING: dma_alloc_coherent used
 in
Message-ID: <202306221019.fuVCjfX6-lkp@intel.com>
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
TO: Dave Jiang <dave.jiang@intel.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: Fenghua Yu <fenghua.yu@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dad9774deaf1cf8e8f7483310dfb2690310193d2
commit: 244da66cda359227d80ccb41dbcb99da40eae186 dmaengine: idxd: setup event log configuration
date:   2 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 2 months ago
config: x86_64-randconfig-c041-20230621 (https://download.01.org/0day-ci/archive/20230622/202306221019.fuVCjfX6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306221019.fuVCjfX6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202306221019.fuVCjfX6-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/dma/idxd/device.c:774:8-26: WARNING: dma_alloc_coherent used in 
   	 /*
>> 	 * Address needs to be page aligned. However, dma_alloc_coherent() provides
>> 	 * at minimal page size aligned address. No manual alignment required.
   	 */ 
>> 	 addr   already zeroes out memory, so memset is not needed

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
