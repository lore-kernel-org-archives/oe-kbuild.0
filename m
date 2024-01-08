Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855338F45
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Jan 2024 00:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hpOp/AAR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704673088; x=1736209088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BFBldIeChddDezpKsgT0+S0eNrDZTX/a6NUJ+1XEMQY=;
  b=hpOp/AAReIN7CAZiD3KJyPpX2ttwCyoLX0X0penxMqgtMP3tNhbFM7PQ
   qixUuOqB+4Uxa7wqCibE3KHh3fjsgJ3N292LiuMk3YcJLyNxvThvwUMSt
   dKe8vHlPiKA6K+T9KU5dtR7nzecG8Wrz47ENLBH/UYWJLHjF6UN3O99ZV
   KRFtp/QX5YUZNj6qxhyWh8WzGIuKXvJF3UOZ4oGN121pocxdcRLfOIsBF
   Oj3kBka4qDSkQMfl9J53i+kk9giumWH+vBoeJ6jjcuao4GWyKVejBgaI9
   4A3/Y0DnFt3WTgvGJ84GaQjwRBw0d3Df9Lr5W1m+LzjLLrCUpFqx4Cz+7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="4528436"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="4528436"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 16:18:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="15751757"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 07 Jan 2024 16:18:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMdL9-0004Lh-1h;
	Mon, 08 Jan 2024 00:18:03 +0000
Date: Mon, 8 Jan 2024 08:17:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/nouveau/dispnv50/disp.c:134:31: sparse: sparse:
 subtraction of different types can't work (different address spaces)
Message-ID: <202401080840.8X2gF7jD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/nouveau/dispnv50/disp.c:134:31: sparse: sparse: subtraction of different types can't work (different address spaces)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: ruanjinjie <ruanjinjie@huawei.com>
CC: Lyude Paul <lyude@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0dd3ee31125508cd67f7e7172247f05b7fd1753a
commit: 9cf06d6ef7fd08adf51568b704ab7ba6007b6fe8 drm/nouveau/disp: fix cast removes address space of expression warnings
date:   1 year, 3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 1 year, 3 months ago
config: i386-randconfig-062-20240106 (https://download.01.org/0day-ci/archive/20240108/202401080840.8X2gF7jD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240108/202401080840.8X2gF7jD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401080840.8X2gF7jD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/dispnv50/disp.c:134:31: sparse: sparse: subtraction of different types can't work (different address spaces)
   drivers/gpu/drm/nouveau/dispnv50/disp.c:197:31: sparse: sparse: subtraction of different types can't work (different address spaces)
   drivers/gpu/drm/nouveau/dispnv50/disp.c:257:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [usertype] *ptr @@     got void [noderef] __iomem *ptr @@
   drivers/gpu/drm/nouveau/dispnv50/disp.c:261:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [usertype] *bgn @@     got void [noderef] __iomem *ptr @@

vim +134 drivers/gpu/drm/nouveau/dispnv50/disp.c

2853ccf09255aa Ben Skeggs 2020-06-20  128  
2853ccf09255aa Ben Skeggs 2020-06-20  129  static void
2853ccf09255aa Ben Skeggs 2020-06-20  130  nv50_dmac_kick(struct nvif_push *push)
2853ccf09255aa Ben Skeggs 2020-06-20  131  {
2853ccf09255aa Ben Skeggs 2020-06-20  132  	struct nv50_dmac *dmac = container_of(push, typeof(*dmac), _push);
0a96099691c8cd Ben Skeggs 2020-07-21  133  
9cf06d6ef7fd08 ruanjinjie 2022-09-24 @134  	dmac->cur = push->cur - (u32 __iomem *)dmac->_push.mem.object.map.ptr;
0a96099691c8cd Ben Skeggs 2020-07-21  135  	if (dmac->put != dmac->cur) {
0a96099691c8cd Ben Skeggs 2020-07-21  136  		/* Push buffer fetches are not coherent with BAR1, we need to ensure
0a96099691c8cd Ben Skeggs 2020-07-21  137  		 * writes have been flushed right through to VRAM before writing PUT.
0a96099691c8cd Ben Skeggs 2020-07-21  138  		 */
0a96099691c8cd Ben Skeggs 2020-07-21  139  		if (dmac->push->mem.type & NVIF_MEM_VRAM) {
0a96099691c8cd Ben Skeggs 2020-07-21  140  			struct nvif_device *device = dmac->base.device;
0a96099691c8cd Ben Skeggs 2020-07-21  141  			nvif_wr32(&device->object, 0x070000, 0x00000001);
0a96099691c8cd Ben Skeggs 2020-07-21  142  			nvif_msec(device, 2000,
0a96099691c8cd Ben Skeggs 2020-07-21  143  				if (!(nvif_rd32(&device->object, 0x070000) & 0x00000002))
0a96099691c8cd Ben Skeggs 2020-07-21  144  					break;
0a96099691c8cd Ben Skeggs 2020-07-21  145  			);
0a96099691c8cd Ben Skeggs 2020-07-21  146  		}
0a96099691c8cd Ben Skeggs 2020-07-21  147  
0a96099691c8cd Ben Skeggs 2020-07-21  148  		NVIF_WV32(&dmac->base.user, NV507C, PUT, PTR, dmac->cur);
0a96099691c8cd Ben Skeggs 2020-07-21  149  		dmac->put = dmac->cur;
0a96099691c8cd Ben Skeggs 2020-07-21  150  	}
0a96099691c8cd Ben Skeggs 2020-07-21  151  
0a96099691c8cd Ben Skeggs 2020-07-21  152  	push->bgn = push->cur;
0a96099691c8cd Ben Skeggs 2020-07-21  153  }
0a96099691c8cd Ben Skeggs 2020-07-21  154  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
