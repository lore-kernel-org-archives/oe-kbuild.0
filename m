Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D294314B
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 22:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UHbYr+tE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700087380; x=1731623380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hhl4VrQgxH7CfyZqqFE+vc5cuBGt6uImAJI8Ld9oNYM=;
  b=UHbYr+tEaRGe36fvGPcF6JhBA95DJvtX1OuPZItArsbSjCQiqBYU2yzm
   HGNwOAF0GkaxatoVrdoUQGPq6//Nrw/Idmi/ZSJNiYfRltb+ggvTlfZBj
   KJttq6WvqGvE/C66iBPMUWhRrDX97HA1JHs0j//wdpGX2Gu7NdntqVpPy
   FZsrzlKan7sCgcvJSbwcU4X/2z5vCDaz2/YR+KfeOkznfbqV90M+51rc2
   cedWPKf/DrM7a9w89He6HUqBfRSjHsHWwXakMfk5whIk4GIhJjvuZMh8k
   yLjLh6KYq50ZJckJMOU7huwnCLJNKVUbfTbsWSivplGwu38oiyi22mxvg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="370326106"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="370326106"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 14:29:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="888717432"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="888717432"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Nov 2023 14:29:38 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3OO7-0000us-2g;
	Wed, 15 Nov 2023 22:29:35 +0000
Date: Thu, 16 Nov 2023 06:29:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:115:27: sparse:
 sparse: too long token expansion
Message-ID: <202311160639.m7tEHmMp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:115:27: sparse: sparse: too long token expansion"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: David Laight <David.Laight@ACULAB.COM>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: d03eba99f5bf7cbc6e2fdde3b6fa36954ad58e09 minmax: allow min()/max()/clamp() if the arguments have the same signedness.
date:   4 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 4 weeks ago
config: loongarch-randconfig-r133-20231107 (https://download.01.org/0day-ci/archive/20231116/202311160639.m7tEHmMp-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311160639.m7tEHmMp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311160639.m7tEHmMp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:115:27: sparse: sparse: too long token expansion
>> drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:115:27: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:683:48: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:683:48: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:687:47: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:687:47: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:691:48: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:691:48: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:756:28: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:756:28: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:1028:33: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:1028:33: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:1034:20: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:1034:20: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:1111:25: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:1111:25: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:1124:35: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:1124:35: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:1159:25: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:1159:25: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:1172:35: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:1172:35: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:1187:30: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:1187:30: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:1298:24: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:1298:24: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:1305:40: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:1305:40: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:1333:40: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:1333:40: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:2953:45: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:2953:45: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:3795:54: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:3795:54: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:3799:55: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:3799:55: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:3943:17: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:3943:17: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:3953:50: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:3953:50: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:3960:58: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:3960:58: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:4011:50: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:4011:50: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:5031:37: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:5031:37: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:5033:38: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:5033:38: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:5037:38: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:5037:38: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:5049:29: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:5049:29: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:5320:30: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:5320:30: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:6900:24: sparse: sparse: too long token expansion
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:6900:24: sparse: sparse: too long token expansion
--
>> drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:600:17: sparse: sparse: too long token expansion
>> drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:600:17: sparse: sparse: too long token expansion

vim +115 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c

a59d354208a784 Stefan Chulski 2021-02-11  103  
b27db2274ba8a6 Matteo Croce   2020-07-02  104  static struct page_pool *
c2d6fe6163de80 Matteo Croce   2020-07-02  105  mvpp2_create_page_pool(struct device *dev, int num, int len,
c2d6fe6163de80 Matteo Croce   2020-07-02  106  		       enum dma_data_direction dma_dir)
b27db2274ba8a6 Matteo Croce   2020-07-02  107  {
b27db2274ba8a6 Matteo Croce   2020-07-02  108  	struct page_pool_params pp_params = {
b27db2274ba8a6 Matteo Croce   2020-07-02  109  		/* internal DMA mapping in page_pool */
b27db2274ba8a6 Matteo Croce   2020-07-02  110  		.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV,
b27db2274ba8a6 Matteo Croce   2020-07-02  111  		.pool_size = num,
b27db2274ba8a6 Matteo Croce   2020-07-02  112  		.nid = NUMA_NO_NODE,
b27db2274ba8a6 Matteo Croce   2020-07-02  113  		.dev = dev,
c2d6fe6163de80 Matteo Croce   2020-07-02  114  		.dma_dir = dma_dir,
07dd0a7aae7f72 Matteo Croce   2020-07-02 @115  		.offset = MVPP2_SKB_HEADROOM,
b27db2274ba8a6 Matteo Croce   2020-07-02  116  		.max_len = len,
b27db2274ba8a6 Matteo Croce   2020-07-02  117  	};
b27db2274ba8a6 Matteo Croce   2020-07-02  118  
b27db2274ba8a6 Matteo Croce   2020-07-02  119  	return page_pool_create(&pp_params);
b27db2274ba8a6 Matteo Croce   2020-07-02  120  }
b27db2274ba8a6 Matteo Croce   2020-07-02  121  

:::::: The code at line 115 was first introduced by commit
:::::: 07dd0a7aae7f72af7cec18909581c2bb570edddc mvpp2: add basic XDP support

:::::: TO: Matteo Croce <mcroce@microsoft.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
