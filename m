Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A5E3BB48
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Nov 2024 14:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730817939; cv=none; b=F+7h1VIXIfSjivMzmfCqJekZdC6nYo3nVKndRw9mIY4Q+tzwQuhdg9KQhdn2IcsWUxwwLP2c157NK2nvcIJCs5UIFpKmF55Uq1+/KIEYut6veelKQFz6wSbyruR6ES/XD8VJNha0gNgkhoAMF+Cr5lm3Pp9spaoh8g8nT4tyGgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730817939; c=relaxed/simple;
	bh=LK1zhGNULqAXrKg7ENeNo+YrwHQMhXKvm/YO+DGsOeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j2J2aDiukJCCi42E1cxMycc75jRwp0mZnSmsKEMLpZ3HwEG2PCaSf6yeen3EadTAGvmo0bMlM1rUPjoDX5uR0vl/NUC5xzZnGZfcYLEq06+Yz6ZZ55kyUIkAwJrDqy/HMRRn8J7GE6RKwzkS3XzODIOu9DHjRpllWmwNutzq/Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXtI++dh; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXtI++dh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730817937; x=1762353937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LK1zhGNULqAXrKg7ENeNo+YrwHQMhXKvm/YO+DGsOeQ=;
  b=gXtI++dhMihiU1BL4NZW/gnzECYyqBTbAtvpkroGmjakcl1zVlO/JD9j
   ybUAutrfCpPCmxVByRvERJFxQkS3CKyoQQexkI5QpBF1HMZfyp1HCntAD
   IDhm/5yJxdDU+3ZdRefnzLzgD/iiLSGQJ6Y2BhNyzSQyOAeZbKEmPRKbp
   rsWpPScbM+IyVnYiuOL75d/U8ZIF2Q6Dz1lbw87WrvTNUfkx7IdY5mt5Y
   OcLNkfyvta5iBowe+DLecw1Zg8F4gTV4uz8NYLMVtS1ZWRJ+AROp57WGm
   fjA+lBIT7gti1Yjt2xVNtUileNdIQrPIzH5tO0dTPfWxEV7d9PaDk1z0B
   w==;
X-CSE-ConnectionGUID: UWs6NQ5gRMGj9RtaeOQdZw==
X-CSE-MsgGUID: KN3FCQYURAaXTpCHDSbLoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30342449"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30342449"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 06:45:36 -0800
X-CSE-ConnectionGUID: AMJwoVNITLSYCqbX6hEN8Q==
X-CSE-MsgGUID: 9RgS1vceRuuRdYGXGej4dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="83707067"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Nov 2024 06:45:34 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8KoF-000mA7-0m;
	Tue, 05 Nov 2024 14:45:31 +0000
Date: Tue, 5 Nov 2024 22:44:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-6.6 1351/1351] fs/resctrl/monitor.c:222
 resctrl_find_cleanest_closid() warn: iterator 'i' not incremented
Message-ID: <202411060018.LrrsbbHA-lkp@intel.com>
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
head:   be25139622a639593fdb2e34ef7c259833956980
commit: 13e249bf4944afceae17195b7bb77c767ff61384 [1351/1351] x86/resctrl: Move the filesystem portions of resctrl to live in '/fs/'
:::::: branch date: 5 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20241103 (https://download.01.org/0day-ci/archive/20241106/202411060018.LrrsbbHA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411060018.LrrsbbHA-lkp@intel.com/

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
