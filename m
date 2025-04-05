Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44E51CD1F
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Apr 2025 13:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743858385; cv=none; b=PMIihyx9L/m34L7eZdRuzD65qVK1YZ/NSWqfdDZbhIsiuxUjXfUGTlz/aOAXPkyOQbWA2vWksuCBwmZodsoGJhNj+ryLLv8tiVXzpgJLr1wHsdzlBDqg655q9R/WB1eTG9hLOFwVdzQ6wewaaT83VHWntjqp2/HykOZHFF9yRaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743858385; c=relaxed/simple;
	bh=I0vVIu6BN0zPz2GVIp+5Q79y6fmz265IxTiqNhQfi1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IUALQUNaC7YuHD4wQne3Xow37FWrTxm6/ITvY1OeomnUVpLtk1WG89rdO5MttLkZlM/9k/i6e5f77tBbvNjTlJx3xP2KUcZYDcWAh/DEaA52hnXc/JM+/C+IkQTVsJ38476DXBz1HV42jlUMzWzQ9mXgreRAJEhsxsstQzLOLAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RxXPHLBz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RxXPHLBz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743858383; x=1775394383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I0vVIu6BN0zPz2GVIp+5Q79y6fmz265IxTiqNhQfi1s=;
  b=RxXPHLBzbWWFObxi/xzMj67Bpt8YX0Ns1O40LpQPYIsMcQVtt2/CLqMb
   E4SgsixmvLrUrokGZSesR6waREPL6Zx9S5R9VfFM6q57BPh6ckUUGlBBr
   iCXZiLCk0g3eSxOxbh6FdSBuclL+qvKrcBowoqEoin/k51LNShJSxQqNb
   IqCs4/yw9lnbyrqSd4mNT8NYc6CfHQZKZCfN/SBXzOL4m+CbkHHqS/yXK
   YjiC/4QBmHjhACli7EQkBIms2bAHepmEuA8vVchTwE/suaJpi2h50eJh4
   lbR+tn89gs5srsrTORmS/Z1QejrxsbCwoco5HxxoxC246crz2Wp4yOMKI
   w==;
X-CSE-ConnectionGUID: WUQ0DoKvQMuOZULQjFIi7Q==
X-CSE-MsgGUID: IUdP4ZTzTvWsh3NbO/2x1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="45310021"
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="45310021"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 06:06:22 -0700
X-CSE-ConnectionGUID: JPW6TTrgS8i2s5PZvBGmBA==
X-CSE-MsgGUID: kUWMQVFrQXqPq4IVbcvIEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="132257634"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Apr 2025 06:06:20 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u13E2-00022N-2F;
	Sat, 05 Apr 2025 13:06:18 +0000
Date: Sat, 5 Apr 2025 21:06:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/btrfs/fs.c:94:2-8: preceding lock on line 90
Message-ID: <202504052012.8BACDzBR-lkp@intel.com>
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
TO: Filipe Manana <fdmanana@suse.com>
CC: David Sterba <dsterba@suse.com>
CC: Qu Wenruo <wqu@suse.com>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a8662bcd2ff152bfbc751cab20f33053d74d0963
commit: 0b93369104ac5f65721793e038cafa4b3e58fdba btrfs: move the exclusive operation functions into fs.c
date:   3 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-r053-20250404 (https://download.01.org/0day-ci/archive/20250405/202504052012.8BACDzBR-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202504052012.8BACDzBR-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/btrfs/fs.c:94:2-8: preceding lock on line 90

vim +94 fs/btrfs/fs.c

0b93369104ac5f Filipe Manana 2024-12-16  75  
0b93369104ac5f Filipe Manana 2024-12-16  76  /*
0b93369104ac5f Filipe Manana 2024-12-16  77   * Conditionally allow to enter the exclusive operation in case it's compatible
0b93369104ac5f Filipe Manana 2024-12-16  78   * with the running one.  This must be paired with btrfs_exclop_start_unlock()
0b93369104ac5f Filipe Manana 2024-12-16  79   * and btrfs_exclop_finish().
0b93369104ac5f Filipe Manana 2024-12-16  80   *
0b93369104ac5f Filipe Manana 2024-12-16  81   * Compatibility:
0b93369104ac5f Filipe Manana 2024-12-16  82   * - the same type is already running
0b93369104ac5f Filipe Manana 2024-12-16  83   * - when trying to add a device and balance has been paused
0b93369104ac5f Filipe Manana 2024-12-16  84   * - not BTRFS_EXCLOP_NONE - this is intentionally incompatible and the caller
0b93369104ac5f Filipe Manana 2024-12-16  85   *   must check the condition first that would allow none -> @type
0b93369104ac5f Filipe Manana 2024-12-16  86   */
0b93369104ac5f Filipe Manana 2024-12-16  87  bool btrfs_exclop_start_try_lock(struct btrfs_fs_info *fs_info,
0b93369104ac5f Filipe Manana 2024-12-16  88  				 enum btrfs_exclusive_operation type)
0b93369104ac5f Filipe Manana 2024-12-16  89  {
0b93369104ac5f Filipe Manana 2024-12-16 @90  	spin_lock(&fs_info->super_lock);
0b93369104ac5f Filipe Manana 2024-12-16  91  	if (fs_info->exclusive_operation == type ||
0b93369104ac5f Filipe Manana 2024-12-16  92  	    (fs_info->exclusive_operation == BTRFS_EXCLOP_BALANCE_PAUSED &&
0b93369104ac5f Filipe Manana 2024-12-16  93  	     type == BTRFS_EXCLOP_DEV_ADD))
0b93369104ac5f Filipe Manana 2024-12-16 @94  		return true;
0b93369104ac5f Filipe Manana 2024-12-16  95  
0b93369104ac5f Filipe Manana 2024-12-16  96  	spin_unlock(&fs_info->super_lock);
0b93369104ac5f Filipe Manana 2024-12-16  97  	return false;
0b93369104ac5f Filipe Manana 2024-12-16  98  }
0b93369104ac5f Filipe Manana 2024-12-16  99  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
