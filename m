Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B76E18EB0
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Jan 2026 11:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767267582; cv=none; b=g1qbUVfe1UHdugJBspXEzgl00Dh6fJrK0kdnluFdf3HQlidXxEJ4Mz7wIgEWYe6MrlzzyB0nhEqL5WRBGWXt25zx8ymk/Ixfj/TEaPQph6bX9qudgqjb5aIYb/hNWwV1Hd8i3AuS0qyTkuybPfqEOJ4+QOXHo8zijdwK32IsxjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767267582; c=relaxed/simple;
	bh=epQTAYaaCTn4kTWGIyZBGe34AGtmvY2zxHNbpHgniUM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fxSySZq9ZjLuW8p3Pa20b5LfuIGLNtPHwNypliDe8eWfoL+3DhwyLRzVGcVuu/pnYVJpGrxAOrw3OgTOgm6e2Hs2AKx7ESQen77kSxzydSYx5VMnA4U42IAb/OtO8AJauTIPzVrXI6bmYPP01WsFYPIruqwmyz2d69XzJmFiips=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R80wvOci; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R80wvOci"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767267580; x=1798803580;
  h=date:from:to:cc:subject:message-id;
  bh=epQTAYaaCTn4kTWGIyZBGe34AGtmvY2zxHNbpHgniUM=;
  b=R80wvOci48gt3i+CCxs2OLpif0gBrWHMiTiSzXnvKmucOWGpAyuhuJpP
   86G/T7Aiqmr4a9+cs6+r86waFiBWm9F5t+fDJxlZIu6sJkq6fZFMdeiZU
   TCO3JUwHCaA9dAbTU/PEJxODyQ0yc2rJcjslvYManFaBVioM/X6OAW/Ww
   SXsRfL3sFIFXfXvodMydMrHRTO0jP8o+SQh8OOpc9KoC6L2B4cd178mNv
   RG1qXl7WEVH1mAT3UdGk09yjFBeQ0Pva2C2Uuxve9h+qyD/x2SkyCxds0
   QiMjvcGkW3kpab+/4X7j287DDFD9zBlNA6Zi/wwPL/krgy1RG41ePgJr2
   A==;
X-CSE-ConnectionGUID: /lNoElGSQX6lpglmDwaOyA==
X-CSE-MsgGUID: 7A3/xVAQRr+8XU8to08LWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="67814016"
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="67814016"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 03:39:39 -0800
X-CSE-ConnectionGUID: 4sfR88ZXSRi9bTiO5bqLmg==
X-CSE-MsgGUID: RKOM+AAeRsaNH1vSRLE7vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="201616612"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Jan 2026 03:39:38 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbH1j-000000001r1-2nRy;
	Thu, 01 Jan 2026 11:39:35 +0000
Date: Thu, 01 Jan 2026 19:38:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/btrfs/fs.c:94:2-8: preceding lock on line 90
Message-ID: <202601011957.d58McUoE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Filipe Manana <fdmanana@suse.com>
CC: David Sterba <dsterba@suse.com>
CC: Qu Wenruo <wqu@suse.com>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b69053dd3ffbc0d2dedbbc86182cdef6f641fe1b
commit: 0b93369104ac5f65721793e038cafa4b3e58fdba btrfs: move the exclusive operation functions into fs.c
date:   12 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-r051-20251231 (https://download.01.org/0day-ci/archive/20260101/202601011957.d58McUoE-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 86b9f90b9574b3a7d15d28a91f6316459dcfa046)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601011957.d58McUoE-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/btrfs/fs.c:94:2-8: preceding lock on line 90

vim +94 fs/btrfs/fs.c

0b93369104ac5f6 Filipe Manana 2024-12-16  75  
0b93369104ac5f6 Filipe Manana 2024-12-16  76  /*
0b93369104ac5f6 Filipe Manana 2024-12-16  77   * Conditionally allow to enter the exclusive operation in case it's compatible
0b93369104ac5f6 Filipe Manana 2024-12-16  78   * with the running one.  This must be paired with btrfs_exclop_start_unlock()
0b93369104ac5f6 Filipe Manana 2024-12-16  79   * and btrfs_exclop_finish().
0b93369104ac5f6 Filipe Manana 2024-12-16  80   *
0b93369104ac5f6 Filipe Manana 2024-12-16  81   * Compatibility:
0b93369104ac5f6 Filipe Manana 2024-12-16  82   * - the same type is already running
0b93369104ac5f6 Filipe Manana 2024-12-16  83   * - when trying to add a device and balance has been paused
0b93369104ac5f6 Filipe Manana 2024-12-16  84   * - not BTRFS_EXCLOP_NONE - this is intentionally incompatible and the caller
0b93369104ac5f6 Filipe Manana 2024-12-16  85   *   must check the condition first that would allow none -> @type
0b93369104ac5f6 Filipe Manana 2024-12-16  86   */
0b93369104ac5f6 Filipe Manana 2024-12-16  87  bool btrfs_exclop_start_try_lock(struct btrfs_fs_info *fs_info,
0b93369104ac5f6 Filipe Manana 2024-12-16  88  				 enum btrfs_exclusive_operation type)
0b93369104ac5f6 Filipe Manana 2024-12-16  89  {
0b93369104ac5f6 Filipe Manana 2024-12-16 @90  	spin_lock(&fs_info->super_lock);
0b93369104ac5f6 Filipe Manana 2024-12-16  91  	if (fs_info->exclusive_operation == type ||
0b93369104ac5f6 Filipe Manana 2024-12-16  92  	    (fs_info->exclusive_operation == BTRFS_EXCLOP_BALANCE_PAUSED &&
0b93369104ac5f6 Filipe Manana 2024-12-16  93  	     type == BTRFS_EXCLOP_DEV_ADD))
0b93369104ac5f6 Filipe Manana 2024-12-16 @94  		return true;
0b93369104ac5f6 Filipe Manana 2024-12-16  95  
0b93369104ac5f6 Filipe Manana 2024-12-16  96  	spin_unlock(&fs_info->super_lock);
0b93369104ac5f6 Filipe Manana 2024-12-16  97  	return false;
0b93369104ac5f6 Filipe Manana 2024-12-16  98  }
0b93369104ac5f6 Filipe Manana 2024-12-16  99  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
