Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC6E219E0
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Jan 2025 10:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735901093; cv=none; b=PZJC9c1lLjXcCcufygPJ8N/ZB58CZ82IDzxNOT42hWfbkmxnL4UKEZ4h+8E7kDdYKfrOudUwA+L8IoBK4kXHfkuUNVXmtWxvxgQQ/fVFcFBSEU0Tc/bkxAoDOZXtzWBrPWnRimgPlmR7mg/lfA5d0LdUIyWnZqYBnk6RKGyzs+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735901093; c=relaxed/simple;
	bh=PwUzUoB0pTDdX81iB1DLqOGmx2609opg1M2PE8ijVFM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bXtsDhJt5F+zRYBNtYxKH4N5bn7A+znInJi0Ha1gHzc/6pYrEI+k0S6E+VB2qaXj51B5NK9/X85poyT3IC5t1Wd//KEtB0gaugnbXWwytGiTy7rk+uJ5/VDxjDfahRl5SuQ9JkTMFSIIikoFUew5ke6Aec/LlveoQyY8H9aVOUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PwMQdT6d; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PwMQdT6d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735901092; x=1767437092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PwUzUoB0pTDdX81iB1DLqOGmx2609opg1M2PE8ijVFM=;
  b=PwMQdT6dzrsOpHuuh68FLkAN5jqTdX6NgdfMmmLdoqhiy2GaMNn+LjtP
   Kf5DKn/tR3N4pnXAve7MrHvL+iy3XOJtA3p/OtgpKtiQ721B4KXJuz0fU
   UiJlkvLhDEwRo1UWAujcLavPoBcNXyxid0Ax2YJyRPJDmg3LEUHhlzZCo
   pTZoqYAVk/mJMyWGN91+Y1qZSX2jlljwvH/xSuEM2T61HXkcuA7f2lQ31
   4v/nlB2wG+5jWC+FApaZEOgTffJTBAySbKQ49BvnSjx4WtedNVJDzamg8
   hSVKv0wYrRj1ex3C+XoDEvDPy0JFccOnefYzkfCT+dwiwzQQr8Ls/XsQR
   Q==;
X-CSE-ConnectionGUID: 8tJR0+YLRfOhdXybuShjUw==
X-CSE-MsgGUID: rkf9IIpPQl6kWpWU99sIFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="46822906"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="46822906"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 02:44:51 -0800
X-CSE-ConnectionGUID: /e5O6yW2SW2N6rnIfM5gTA==
X-CSE-MsgGUID: YiR6daNHTmOTnlJbAe6aLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="106621947"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Jan 2025 02:44:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTfAe-0009bt-0I;
	Fri, 03 Jan 2025 10:44:48 +0000
Date: Fri, 3 Jan 2025 18:44:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/btrfs/compression.c:195:12-13: WARNING opportunity for max()
Message-ID: <202501031834.8jhs6NLM-lkp@intel.com>
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
TO: David Sterba <dsterba@suse.com>
CC: Josef Bacik <josef@toxicpanda.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
commit: 4cea422a776558ccf84e918205d0c162a516502c btrfs: use shrinker for compression page pool
date:   1 year, 1 month ago
:::::: branch date: 16 hours ago
:::::: commit date: 1 year, 1 month ago
config: hexagon-randconfig-r054-20250102 (https://download.01.org/0day-ci/archive/20250103/202501031834.8jhs6NLM-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ed572f2003275da8e06a634b4d6658b7921e8334)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501031834.8jhs6NLM-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/btrfs/compression.c:195:12-13: WARNING opportunity for max()

vim +195 fs/btrfs/compression.c

4cea422a776558 David Sterba 2023-11-15  183  
4cea422a776558 David Sterba 2023-11-15  184  static unsigned long btrfs_compr_pool_count(struct shrinker *sh, struct shrink_control *sc)
4cea422a776558 David Sterba 2023-11-15  185  {
4cea422a776558 David Sterba 2023-11-15  186  	int ret;
4cea422a776558 David Sterba 2023-11-15  187  
4cea422a776558 David Sterba 2023-11-15  188  	/*
4cea422a776558 David Sterba 2023-11-15  189  	 * We must not read the values more than once if 'ret' gets expanded in
4cea422a776558 David Sterba 2023-11-15  190  	 * the return statement so we don't accidentally return a negative
4cea422a776558 David Sterba 2023-11-15  191  	 * number, even if the first condition finds it positive.
4cea422a776558 David Sterba 2023-11-15  192  	 */
4cea422a776558 David Sterba 2023-11-15  193  	ret = READ_ONCE(compr_pool.count) - READ_ONCE(compr_pool.thresh);
4cea422a776558 David Sterba 2023-11-15  194  
4cea422a776558 David Sterba 2023-11-15 @195  	return ret > 0 ? ret : 0;
4cea422a776558 David Sterba 2023-11-15  196  }
4cea422a776558 David Sterba 2023-11-15  197  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
