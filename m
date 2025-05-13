Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934B3136337
	for <oe-kbuild@lists.linux.dev>; Tue, 13 May 2025 23:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747177885; cv=none; b=iyQ4nY8xknKoJUVS5F8fuB5BB/1Neif6CYI9GpvRRIeNpx6geZioJ/wkQIhZSw7HqZauh5sddTQoZvSrx6OxFHizSuc0vkzH6NjQa2r6qDiwrFHvngmdStGyAi5oUAVMczO7oqZCGDInDKVOHCDNbgrSEGjdG6JvHVaqIXcfUW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747177885; c=relaxed/simple;
	bh=YGB8ymgCUCBBT6l0NaP++UJEc7tsdkrR819qe1CByIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N7JZLnMntmg7AjsfC5wdBUnGD0D3KvuUULjE178ML4Bu1gVMliJz3UVDdaLVIYemIs6n5w9MQL9uIOkf1V/+wUPM6/+TjA9u1MDFbwmK/GEcwJgfowmQIoAmcFx4X9Lo1cozB7ur+zOkF+WqYki2YCHf4ovpls2yCHAObuBj2tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=REj1dBNu; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="REj1dBNu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747177884; x=1778713884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YGB8ymgCUCBBT6l0NaP++UJEc7tsdkrR819qe1CByIU=;
  b=REj1dBNuOINfutAlVgrHrky8J3facOG6aqEglg1buH2uwOXqNQ89EHQW
   B0LzXtLdHkgLbawIng5bG8aj7L2QBq5mkmLO2VbnYoTqMXpEzNPNvmGM6
   GOStgsB07NMozBfEOGBiBAJwKlrrfom6er7itHu+lyT62thR5H95ToP0+
   kv+sLN2xBR+Muhme5YoNU0+pfjlgozRPFHbuXChq4t+Do7W47jachqDTD
   5sUtfnSwAb4qO5Zl9Xr52tbRbBNRBtZc4ppvWqEX+jTbsWD66BZ8TUT1v
   y/Gp13OXHB762S0GI3ctculvZklZhsHgrIUO1OX7unRTGhZOizyqBlQbe
   Q==;
X-CSE-ConnectionGUID: ij5C/Qq3TzWCZXHKZab+vg==
X-CSE-MsgGUID: fr4FtOeuSlOVITxl0n0ndQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48738462"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="48738462"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 16:11:23 -0700
X-CSE-ConnectionGUID: LdJwDZlhRheULj4gT/MhPQ==
X-CSE-MsgGUID: u/q4qzK1SdupE1WosB8ogg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="137764678"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 May 2025 16:11:16 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEymH-000GTz-1J;
	Tue, 13 May 2025 23:11:13 +0000
Date: Wed, 14 May 2025 07:10:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/memcontrol.c:1628 mem_cgroup_oom() error: uninitialized symbol
 'locked'.
Message-ID: <202505140721.G6EFhEYC-lkp@intel.com>
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
TO: Roman Gushchin <roman.gushchin@linux.dev>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9f35e33144ae5377d6a8de86dd3bd4d995c6ac65
commit: e93d4166b40a84df83c4d5cb4c709d022808ef9b mm: memcg: put cgroup v1-specific code under a config option
date:   10 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-141-20250514 (https://download.01.org/0day-ci/archive/20250514/202505140721.G6EFhEYC-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505140721.G6EFhEYC-lkp@intel.com/

smatch warnings:
mm/memcontrol.c:1628 mem_cgroup_oom() error: uninitialized symbol 'locked'.

vim +/locked +1628 mm/memcontrol.c

9cbb78bb314360a David Rientjes    2012-07-31  1609  
becdf89d776c8f5 Shakeel Butt      2022-03-22  1610  /*
becdf89d776c8f5 Shakeel Butt      2022-03-22  1611   * Returns true if successfully killed one or more processes. Though in some
becdf89d776c8f5 Shakeel Butt      2022-03-22  1612   * corner cases it can return true even without killing any process.
becdf89d776c8f5 Shakeel Butt      2022-03-22  1613   */
becdf89d776c8f5 Shakeel Butt      2022-03-22  1614  static bool mem_cgroup_oom(struct mem_cgroup *memcg, gfp_t mask, int order)
867578cbccb0893 KAMEZAWA Hiroyuki 2010-03-10  1615  {
becdf89d776c8f5 Shakeel Butt      2022-03-22  1616  	bool locked, ret;
7056d3a37d2c6aa Michal Hocko      2018-12-28  1617  
29ef680ae7c2111 Michal Hocko      2018-08-17  1618  	if (order > PAGE_ALLOC_COSTLY_ORDER)
becdf89d776c8f5 Shakeel Butt      2022-03-22  1619  		return false;
29ef680ae7c2111 Michal Hocko      2018-08-17  1620  
7a1adfddaf0d11a Roman Gushchin    2018-10-26  1621  	memcg_memory_event(memcg, MEMCG_OOM);
7a1adfddaf0d11a Roman Gushchin    2018-10-26  1622  
292fc2e0204aa02 Roman Gushchin    2024-06-24  1623  	if (!memcg1_oom_prepare(memcg, &locked))
becdf89d776c8f5 Shakeel Butt      2022-03-22  1624  		return false;
29ef680ae7c2111 Michal Hocko      2018-08-17  1625  
becdf89d776c8f5 Shakeel Butt      2022-03-22  1626  	ret = mem_cgroup_out_of_memory(memcg, mask, order);
7056d3a37d2c6aa Michal Hocko      2018-12-28  1627  
292fc2e0204aa02 Roman Gushchin    2024-06-24 @1628  	memcg1_oom_finish(memcg, locked);
29ef680ae7c2111 Michal Hocko      2018-08-17  1629  
7056d3a37d2c6aa Michal Hocko      2018-12-28  1630  	return ret;
3812c8c8f395392 Johannes Weiner   2013-09-12  1631  }
3812c8c8f395392 Johannes Weiner   2013-09-12  1632  

:::::: The code at line 1628 was first introduced by commit
:::::: 292fc2e0204aa02a24f6d2684d71801068fec803 mm: memcg: move cgroup v1 oom handling code into memcontrol-v1.c

:::::: TO: Roman Gushchin <roman.gushchin@linux.dev>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
