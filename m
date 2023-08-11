Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E00EC6
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Aug 2023 06:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691734595; x=1723270595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l443nOfxHsgog3MhhL1d/A9mKjgZpRGMfWK6CBtuC0s=;
  b=caMEiqvMKRWz6CaMMvMipW+vuhn44XbDGU0fTnL8GZiMSgHnBKvjkEiJ
   gKrTvcjnN1hORAoCK9bOymrYUxyWcWDbao4xMSwCnP4YVqy/ivdwFneXL
   UJOaoZ7TRtuxdu+v//IFt4fkLY0OWHk4AURBtGKVhiyKX+XBRPkPdggfk
   JnWGLsM8cUIw5SMSJf7Id7TBJK6zKPtc3GXeJV7n2uE6YPUVwNdjDz5S7
   K8zsGcoK+/zUsdxmbBczYPpabEuY4h0VTGXxxxHFUmY80BNOX6p29vh1g
   T+INVkPx59J89NuJa11sIwtTVXuQvuUvVV5zYQCh8VSAnaf61kud7Bvd4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="351926786"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="351926786"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 23:16:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="797899829"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="797899829"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Aug 2023 23:16:32 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qULRo-0007Ys-10;
	Fri, 11 Aug 2023 06:16:32 +0000
Date: Fri, 11 Aug 2023 14:15:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/rcu/tree.c:2247:25: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202308111449.srR81f3f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Qing Zhang <zhangqing@loongson.cn>
CC: Huacai Chen <chenhuacai@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   25aa0bebba72b318e71fe205bfd1236550cc9534
commit: 93a4fa622eb061f75f87f0cf9609ab4e69c67d01 LoongArch: Add STACKTRACE support
date:   12 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 12 months ago
config: loongarch-randconfig-r071-20230811 (https://download.01.org/0day-ci/archive/20230811/202308111449.srR81f3f-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308111449.srR81f3f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308111449.srR81f3f-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/rcu/tree_stall.h:941:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:941:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:941:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:941:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:957:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:957:25: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:957:25: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_stall.h:957:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:957:25: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:957:25: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_stall.h:957:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:957:25: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:957:25: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_stall.h:957:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:957:25: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:957:25: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_stall.h:957:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:957:25: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:957:25: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:957:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:957:25: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:957:25: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:957:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:957:25: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:957:25: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:957:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:957:25: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:957:25: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:958:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:958:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:958:17: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_stall.h:958:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:958:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:958:17: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_stall.h:958:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:958:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:958:17: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_stall.h:958:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:958:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:958:17: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_stall.h:958:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:958:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:958:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:958:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:958:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:958:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:958:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:958:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:958:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:958:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:958:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:958:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:963:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:963:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:963:17: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_stall.h:963:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:963:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:963:17: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_stall.h:963:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:963:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:963:17: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_stall.h:963:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:963:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:963:17: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_stall.h:963:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:963:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:963:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:963:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:963:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:963:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:963:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:963:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:963:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:963:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:963:17: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:963:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:964:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:964:9: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:964:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_stall.h:964:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:964:9: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:964:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_stall.h:964:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:964:9: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:964:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_stall.h:964:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:964:9: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:964:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_stall.h:964:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:964:9: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:964:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:964:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:964:9: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:964:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:964:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:964:9: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:964:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:964:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:964:9: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:964:9: sparse:     got int [noderef] __percpu *
>> kernel/rcu/tree.c:2247:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree.c:2247:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2247:25: sparse:     got unsigned int [noderef] __percpu *
>> kernel/rcu/tree.c:2247:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree.c:2247:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2247:25: sparse:     got unsigned int [noderef] __percpu *
>> kernel/rcu/tree.c:2247:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree.c:2247:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2247:25: sparse:     got unsigned int [noderef] __percpu *
>> kernel/rcu/tree.c:2247:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree.c:2247:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2247:25: sparse:     got unsigned int [noderef] __percpu *
>> kernel/rcu/tree.c:2247:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree.c:2247:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2247:25: sparse:     got int [noderef] __percpu *
>> kernel/rcu/tree.c:2247:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree.c:2247:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2247:25: sparse:     got int [noderef] __percpu *
>> kernel/rcu/tree.c:2247:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree.c:2247:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2247:25: sparse:     got int [noderef] __percpu *
>> kernel/rcu/tree.c:2247:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree.c:2247:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2247:25: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree.c:2261:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree.c:2261:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2261:25: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree.c:2261:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree.c:2261:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2261:25: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree.c:2261:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree.c:2261:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2261:25: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree.c:2261:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree.c:2261:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2261:25: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree.c:2261:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree.c:2261:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2261:25: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree.c:2261:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree.c:2261:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2261:25: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree.c:2261:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree.c:2261:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2261:25: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree.c:2261:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree.c:2261:25: sparse:     expected void *ptr
   kernel/rcu/tree.c:2261:25: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree.c:2272:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree.c:2272:17: sparse:     expected void *ptr
   kernel/rcu/tree.c:2272:17: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree.c:2272:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree.c:2272:17: sparse:     expected void *ptr
   kernel/rcu/tree.c:2272:17: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree.c:2272:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree.c:2272:17: sparse:     expected void *ptr
   kernel/rcu/tree.c:2272:17: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree.c:2272:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree.c:2272:17: sparse:     expected void *ptr
   kernel/rcu/tree.c:2272:17: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree.c:2272:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree.c:2272:17: sparse:     expected void *ptr
   kernel/rcu/tree.c:2272:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree.c:2272:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree.c:2272:17: sparse:     expected void *ptr
   kernel/rcu/tree.c:2272:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree.c:2272:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree.c:2272:17: sparse:     expected void *ptr
   kernel/rcu/tree.c:2272:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree.c:2272:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree.c:2272:17: sparse:     expected void *ptr
   kernel/rcu/tree.c:2272:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree.c:4212:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree.c:4212:17: sparse:     expected void *ptr
   kernel/rcu/tree.c:4212:17: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree.c:4212:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree.c:4212:17: sparse:     expected void *ptr
   kernel/rcu/tree.c:4212:17: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree.c:4212:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree.c:4212:17: sparse:     expected void *ptr
   kernel/rcu/tree.c:4212:17: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree.c:4212:17: sparse: sparse: too many warnings

vim +2247 kernel/rcu/tree.c

f41d911f8c49a5 kernel/rcutree.c  Paul E. McKenney 2009-08-22  2215  
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2216  /*
d3f6bad3911736 kernel/rcutree.c  Paul E. McKenney 2009-12-02  2217   * Similar to rcu_report_qs_rdp(), for which it is a helper function.
d3f6bad3911736 kernel/rcutree.c  Paul E. McKenney 2009-12-02  2218   * Allows quiescent states for a group of CPUs to be reported at one go
d3f6bad3911736 kernel/rcutree.c  Paul E. McKenney 2009-12-02  2219   * to the specified rcu_node structure, though all the CPUs in the group
654e953340491e kernel/rcu/tree.c Paul E. McKenney 2015-03-15  2220   * must be represented by the same rcu_node structure (which need not be a
654e953340491e kernel/rcu/tree.c Paul E. McKenney 2015-03-15  2221   * leaf rcu_node structure, though it often will be).  The gps parameter
654e953340491e kernel/rcu/tree.c Paul E. McKenney 2015-03-15  2222   * is the grace-period snapshot, which means that the quiescent states
c9a24e2d0c7d33 kernel/rcu/tree.c Paul E. McKenney 2018-04-27  2223   * are valid only if rnp->gp_seq is equal to gps.  That structure's lock
654e953340491e kernel/rcu/tree.c Paul E. McKenney 2015-03-15  2224   * must be held upon entry, and it is released before return.
ec2c29765a4ab1 kernel/rcu/tree.c Paul E. McKenney 2018-05-07  2225   *
ec2c29765a4ab1 kernel/rcu/tree.c Paul E. McKenney 2018-05-07  2226   * As a special case, if mask is zero, the bit-already-cleared check is
ec2c29765a4ab1 kernel/rcu/tree.c Paul E. McKenney 2018-05-07  2227   * disabled.  This allows propagating quiescent state due to resumed tasks
ec2c29765a4ab1 kernel/rcu/tree.c Paul E. McKenney 2018-05-07  2228   * during grace-period initialization.
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2229   */
b50912d0b5e03f kernel/rcu/tree.c Paul E. McKenney 2018-07-03  2230  static void rcu_report_qs_rnp(unsigned long mask, struct rcu_node *rnp,
b50912d0b5e03f kernel/rcu/tree.c Paul E. McKenney 2018-07-03  2231  			      unsigned long gps, unsigned long flags)
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2232  	__releases(rnp->lock)
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2233  {
654e953340491e kernel/rcu/tree.c Paul E. McKenney 2015-03-15  2234  	unsigned long oldmask = 0;
28ecd58020409b kernel/rcutree.c  Paul E. McKenney 2009-09-18  2235  	struct rcu_node *rnp_c;
28ecd58020409b kernel/rcutree.c  Paul E. McKenney 2009-09-18  2236  
a32e01ee689794 kernel/rcu/tree.c Matthew Wilcox   2018-01-17  2237  	raw_lockdep_assert_held_rcu_node(rnp);
c0b334c5bfa98a kernel/rcu/tree.c Paul E. McKenney 2017-04-28  2238  
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2239  	/* Walk up the rcu_node hierarchy. */
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2240  	for (;;) {
ec2c29765a4ab1 kernel/rcu/tree.c Paul E. McKenney 2018-05-07  2241  		if ((!(rnp->qsmask & mask) && mask) || rnp->gp_seq != gps) {
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2242  
654e953340491e kernel/rcu/tree.c Paul E. McKenney 2015-03-15  2243  			/*
654e953340491e kernel/rcu/tree.c Paul E. McKenney 2015-03-15  2244  			 * Our bit has already been cleared, or the
654e953340491e kernel/rcu/tree.c Paul E. McKenney 2015-03-15  2245  			 * relevant grace period is already over, so done.
654e953340491e kernel/rcu/tree.c Paul E. McKenney 2015-03-15  2246  			 */
67c583a7de3433 kernel/rcu/tree.c Boqun Feng       2015-12-29 @2247  			raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2248  			return;
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2249  		}
654e953340491e kernel/rcu/tree.c Paul E. McKenney 2015-03-15  2250  		WARN_ON_ONCE(oldmask); /* Any child must be all zeroed! */
5b4c11d54b1b8d kernel/rcu/tree.c Paul E. McKenney 2018-04-13  2251  		WARN_ON_ONCE(!rcu_is_leaf_node(rnp) &&
2dee9404fa8c43 kernel/rcu/tree.c Paul E. McKenney 2017-07-11  2252  			     rcu_preempt_blocked_readers_cgp(rnp));
7672d647ddae37 kernel/rcu/tree.c Paul E. McKenney 2020-01-03  2253  		WRITE_ONCE(rnp->qsmask, rnp->qsmask & ~mask);
67a0edbf3c4dfc kernel/rcu/tree.c Paul E. McKenney 2018-07-05  2254  		trace_rcu_quiescent_state_report(rcu_state.name, rnp->gp_seq,
d4c08f2ac311a3 kernel/rcutree.c  Paul E. McKenney 2011-06-25  2255  						 mask, rnp->qsmask, rnp->level,
d4c08f2ac311a3 kernel/rcutree.c  Paul E. McKenney 2011-06-25  2256  						 rnp->grplo, rnp->grphi,
d4c08f2ac311a3 kernel/rcutree.c  Paul E. McKenney 2011-06-25  2257  						 !!rnp->gp_tasks);
27f4d28057adf9 kernel/rcutree.c  Paul E. McKenney 2011-02-07  2258  		if (rnp->qsmask != 0 || rcu_preempt_blocked_readers_cgp(rnp)) {
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2259  
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2260  			/* Other bits still set at this level, so done. */
67c583a7de3433 kernel/rcu/tree.c Boqun Feng       2015-12-29  2261  			raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2262  			return;
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2263  		}
d43a5d32e125db kernel/rcu/tree.c Paul E. McKenney 2018-04-28  2264  		rnp->completedqs = rnp->gp_seq;
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2265  		mask = rnp->grpmask;
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2266  		if (rnp->parent == NULL) {
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2267  
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2268  			/* No more levels.  Exit loop holding root lock. */
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2269  
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2270  			break;
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2271  		}
67c583a7de3433 kernel/rcu/tree.c Boqun Feng       2015-12-29  2272  		raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
28ecd58020409b kernel/rcutree.c  Paul E. McKenney 2009-09-18  2273  		rnp_c = rnp;
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2274  		rnp = rnp->parent;
2a67e741bbbc02 kernel/rcu/tree.c Peter Zijlstra   2015-10-08  2275  		raw_spin_lock_irqsave_rcu_node(rnp, flags);
0937d045732b5d kernel/rcu/tree.c Paul E. McKenney 2020-01-03  2276  		oldmask = READ_ONCE(rnp_c->qsmask);
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2277  	}
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2278  
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2279  	/*
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2280  	 * Get here if we are the last CPU to pass through a quiescent
d3f6bad3911736 kernel/rcutree.c  Paul E. McKenney 2009-12-02  2281  	 * state for this grace period.  Invoke rcu_report_qs_rsp()
f41d911f8c49a5 kernel/rcutree.c  Paul E. McKenney 2009-08-22  2282  	 * to clean up and start the next grace period if one is needed.
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2283  	 */
aff4e9ede52bad kernel/rcu/tree.c Paul E. McKenney 2018-07-03  2284  	rcu_report_qs_rsp(flags); /* releases rnp->lock. */
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2285  }
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney 2008-12-18  2286  

:::::: The code at line 2247 was first introduced by commit
:::::: 67c583a7de3433a971983490b37ad2bff3c55463 RCU: Privatize rcu_node::lock

:::::: TO: Boqun Feng <boqun.feng@gmail.com>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
