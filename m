Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26CAA49
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Sep 2023 20:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694378063; x=1725914063;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xdbz6TO3FV4Vkwim1yzCFAeNLAVJUYYgeWA/8dJkXHo=;
  b=OGbGactcnba28WJ4l1x4IRacn5cQkShLQ9B5yip22KwR2GbqMt2DNl5M
   AL/nGiHWpjogwaBk+pPU6qSO+9HXfpUyYVOyHEfZZH4x21bbQl8oQkJKT
   NzzBQlDpzjHiLfi2rBFqiVOlcXz+hTi19zG/6a72yLwJtKPU4Lducs1Bo
   M0xyQXDNvzbtyCYVT6vUXTvo1tY2W+X2dlb/kZE57Xeohq7NHHUg8U1VX
   gVGTWkz7ZYtVTcoHxRY6xiHcupZwOHgtranLjunNnPClXaaFuC5g6W56A
   ZkZPnZY1p2t6Be4yw4rHaPSIALINDRnr0D907VhzEOADcNosK5MH/waua
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="408900035"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="408900035"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 13:34:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="916791964"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="916791964"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Sep 2023 13:34:21 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfR8N-0005N6-0M;
	Sun, 10 Sep 2023 20:34:19 +0000
Date: Mon, 11 Sep 2023 04:33:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/nouveau/dispnv50/disp.c:134:31: sparse: sparse:
 subtraction of different types can't work (different address spaces)
Message-ID: <202309110416.LWIUwtdO-lkp@intel.com>
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
head:   535a265d7f0dd50d8c3a4f8b4f3a452d56bd160f
commit: 9cf06d6ef7fd08adf51568b704ab7ba6007b6fe8 drm/nouveau/disp: fix cast removes address space of expression warnings
date:   11 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-061-20230909 (https://download.01.org/0day-ci/archive/20230911/202309110416.LWIUwtdO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309110416.LWIUwtdO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309110416.LWIUwtdO-lkp@intel.com/

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
