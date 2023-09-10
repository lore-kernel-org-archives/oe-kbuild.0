Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C4517D4
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Sep 2023 05:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694323466; x=1725859466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6eHVOJCDoEl+WyUX4FIsxPyZPzv2XzojZHwdjLenkcc=;
  b=jFd+dtehJ9Nais/aNybyqR3ICCNz0TmbWcHGMfeujkm8+ZTcSKzb0KMs
   AWRSVNrJsuCf4JaeqYdrwuFDkZ9np8HiogNpCnkqinWGx3uXT34k9vwPb
   lwSEI+t/zKXymlfPrOIJL1BKlIcdzH8KeoD1N6T86eav3n9mVU9r+S1Qh
   v0EOdFD+kaeM+9Zv3ou1I/zJJXn+RZj3GmNmFoSpaW26uTjcSkl7wR9Cs
   HBmg/wXVhKTFLDSwvo6L4oaUseJUcwVmI836oQohUIyIO5WVH2mlgdFua
   ZYF5eTbA6QBzltNXw4c35l2FQDftymd8mT+UkIHdMapd/Ov1820TYdzXt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="368130075"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="368130075"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 22:24:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="692686925"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="692686925"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Sep 2023 22:24:24 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfCvm-0004RG-24;
	Sun, 10 Sep 2023 05:24:22 +0000
Date: Sun, 10 Sep 2023 13:23:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/nouveau/dispnv50/disp.c:134:31: sparse: sparse:
 subtraction of different types can't work (different address spaces)
Message-ID: <202309101332.IhYvtyIL-lkp@intel.com>
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
head:   a3c57ab79a06e333a869ae340420cb3c6f5921d3
commit: 9cf06d6ef7fd08adf51568b704ab7ba6007b6fe8 drm/nouveau/disp: fix cast removes address space of expression warnings
date:   11 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-061-20230909 (https://download.01.org/0day-ci/archive/20230910/202309101332.IhYvtyIL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230910/202309101332.IhYvtyIL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309101332.IhYvtyIL-lkp@intel.com/

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
