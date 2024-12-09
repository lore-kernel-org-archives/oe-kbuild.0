Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4734F73446
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718742; cv=none; b=Y2LXphbZOaqg/oFHDieRrq3fczLCSVKjs1kYaGrCu6DmqLjPNW/OE1vFRCMtlK9InunG6bZOxU2SVW4ZQu8jsxWEwRHhzN/F1LzP9IVpigRMzlzdKU+ugYsDn4NMauTr+G50LeNC3FwUQ9vjYzOTtDc+TmRPBTr36ubG+5EQ/FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718742; c=relaxed/simple;
	bh=lsHYwt/Trj44Hf9RJZj8a08JlzIHICmFfk0BzXoCt3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kKLfSI40cSAQx8nDgcL+XhZunhOlQhyq2dz34G/YpOWrPSvuEkvW/hJFAReILH8AK0ZWVYr9ctm7h38AC+aEEQJNcoDo7X0Gdj2x7tETs01O+oXWP2Qg8hE03tcfHO3HG0CG5PH+qwrT2gnVWGWxP9sZDRZy1HZQvO73DJDlMg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MRokbpUo; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MRokbpUo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718741; x=1765254741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lsHYwt/Trj44Hf9RJZj8a08JlzIHICmFfk0BzXoCt3Q=;
  b=MRokbpUoZ68kCZghoiVOBClm2HDPARky5Z7qQo8qZYFbe1XI/3XM/ANu
   4IkLE8p6GGeZcbcEBDAVzsuVvEApmoNrG7BZRFYc+Uj7g+R3Kx/tR/RhC
   xaQvixUYTvexd4ZVd9U3raLv6c4rhyh5dWVmfarCqFmfxmqpl1LnUOHlO
   UTZSxHvlbd4RqdMFChd6LpinbWdV3JXTbX1SE6M6bK0IEzxIhpxZ/NPvn
   LbQDcl8ZPnBGGMnd/BQXt/SYrPRKKyI2UrogU5bEkj++XBjt25PSA2Ksz
   ZFiaxEaVrdXDgCXgR0y0gTlpr6oAxTNUdxpJhrfx1NjHk8aaYfPP9T2Ul
   A==;
X-CSE-ConnectionGUID: WIta5s82R2S4S3bdsf8EAA==
X-CSE-MsgGUID: 7ua+RKJCREGT2GHqtCwraw==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="45013692"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="45013692"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:32:20 -0800
X-CSE-ConnectionGUID: OxvRj+u3QXi9LGqEQRj+Dw==
X-CSE-MsgGUID: eMKdOUiUQBeTOTsjkRkEOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95048613"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Dec 2024 20:32:18 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVRQ-0003sB-10;
	Mon, 09 Dec 2024 04:32:16 +0000
Date: Mon, 9 Dec 2024 12:31:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-6.6 1590/1590] fs/resctrl/monitor.c:222
 resctrl_find_cleanest_closid() warn: iterator 'i' not incremented
Message-ID: <202412080524.QdsdtKnd-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Zeng Heng <zengheng4@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   330348879858de86a15cef38738cbf022633f403
commit: 13e249bf4944afceae17195b7bb77c767ff61384 [1590/1590] x86/resctrl: Move the filesystem portions of resctrl to live in '/fs/'
:::::: branch date: 17 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20241208/202412080524.QdsdtKnd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412080524.QdsdtKnd-lkp@intel.com/

smatch warnings:
fs/resctrl/monitor.c:222 resctrl_find_cleanest_closid() warn: iterator 'i' not incremented

vim +/i +222 fs/resctrl/monitor.c

13e249bf4944af James Morse 2024-01-22  206  
13e249bf4944af James Morse 2024-01-22  207  /**
13e249bf4944af James Morse 2024-01-22  208   * resctrl_find_cleanest_closid() - Find a CLOSID where all the associated
13e249bf4944af James Morse 2024-01-22  209   *                                  RMID are clean, or the CLOSID that has
13e249bf4944af James Morse 2024-01-22  210   *                                  the most clean RMID.
13e249bf4944af James Morse 2024-01-22  211   *
13e249bf4944af James Morse 2024-01-22  212   * MPAM's equivalent of RMID are per-CLOSID, meaning a freshly allocated CLOSID
13e249bf4944af James Morse 2024-01-22  213   * may not be able to allocate clean RMID. To avoid this the allocator will
13e249bf4944af James Morse 2024-01-22  214   * choose the CLOSID with the most clean RMID.
13e249bf4944af James Morse 2024-01-22  215   *
13e249bf4944af James Morse 2024-01-22  216   * When the CLOSID and RMID are independent numbers, the first free CLOSID will
13e249bf4944af James Morse 2024-01-22  217   * be returned.
13e249bf4944af James Morse 2024-01-22  218   */
13e249bf4944af James Morse 2024-01-22  219  int resctrl_find_cleanest_closid(void)
13e249bf4944af James Morse 2024-01-22  220  {
13e249bf4944af James Morse 2024-01-22  221  	u32 cleanest_closid = ~0;
13e249bf4944af James Morse 2024-01-22 @222  	int i = 0;
13e249bf4944af James Morse 2024-01-22  223  
13e249bf4944af James Morse 2024-01-22  224  	lockdep_assert_held(&rdtgroup_mutex);
13e249bf4944af James Morse 2024-01-22  225  
13e249bf4944af James Morse 2024-01-22  226  	if (!IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID))
13e249bf4944af James Morse 2024-01-22  227  		return -EIO;
13e249bf4944af James Morse 2024-01-22  228  
13e249bf4944af James Morse 2024-01-22  229  	for (i = 0; i < closids_supported(); i++) {
13e249bf4944af James Morse 2024-01-22  230  		int num_dirty;
13e249bf4944af James Morse 2024-01-22  231  
13e249bf4944af James Morse 2024-01-22  232  		if (closid_allocated(i))
13e249bf4944af James Morse 2024-01-22  233  			continue;
13e249bf4944af James Morse 2024-01-22  234  
13e249bf4944af James Morse 2024-01-22  235  		num_dirty = closid_num_dirty_rmid[i];
13e249bf4944af James Morse 2024-01-22  236  		if (num_dirty == 0)
13e249bf4944af James Morse 2024-01-22  237  			return i;
13e249bf4944af James Morse 2024-01-22  238  
13e249bf4944af James Morse 2024-01-22  239  		if (cleanest_closid == ~0)
13e249bf4944af James Morse 2024-01-22  240  			cleanest_closid = i;
13e249bf4944af James Morse 2024-01-22  241  
13e249bf4944af James Morse 2024-01-22  242  		if (num_dirty < closid_num_dirty_rmid[cleanest_closid])
13e249bf4944af James Morse 2024-01-22  243  			cleanest_closid = i;
13e249bf4944af James Morse 2024-01-22  244  	}
13e249bf4944af James Morse 2024-01-22  245  
13e249bf4944af James Morse 2024-01-22  246  	if (cleanest_closid == ~0)
13e249bf4944af James Morse 2024-01-22  247  		return -ENOSPC;
13e249bf4944af James Morse 2024-01-22  248  
13e249bf4944af James Morse 2024-01-22  249  	return cleanest_closid;
13e249bf4944af James Morse 2024-01-22  250  }
13e249bf4944af James Morse 2024-01-22  251  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
