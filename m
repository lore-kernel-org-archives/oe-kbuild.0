Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034A2248896
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Jan 2026 01:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767230485; cv=none; b=XuxpLBBiiFVhyDKZ4YlIA4Iw/nCa3xH8Yuqyw/k3njOWRpowoHHcPbSPYNOJUehjtYDEj0cWscogzsPL1e4PdU/IhzUrBDGPLJDwOcFrKvUcC6a5UD3wJNMfoWdOqIbNXpgmJVX3DHdlulQeKltKc6SDwo2NaU5knnghiHKMTZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767230485; c=relaxed/simple;
	bh=fYXhBwYU3hRVwTdvJprT01+xxtX/utSXaNKgy8OltkI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZnI/Zb4HyLBF2zszaE60ObiEDV7aY6q964tQDFJ4I6wKc/vHWM8PN6t13Fnf5oI0oUNFU0uislqRlEJzrQAXHFbK8sLSM9dsMOUQnET/NFNdRpCsn/8SAXXryitGn4r2m8xPNJK+BhicyV34ZCp1kXotQvk9ubS/JLZ5jaBZ2Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AwyfoM5t; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AwyfoM5t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767230483; x=1798766483;
  h=date:from:to:cc:subject:message-id;
  bh=fYXhBwYU3hRVwTdvJprT01+xxtX/utSXaNKgy8OltkI=;
  b=AwyfoM5tGSi8t/kwD99Ao0K0X9vZMxF8VAdVWLPM8DFumkWyThFLyrFO
   eRe/7cv9XERUE06eKEmm92t+8WuGaJ6Fr+TAOTq5MNuHyff3r5avVo+xj
   gcrK/mDlEKa55cJ8DILsNh8nAn/EDK0QOScNXRQHPz6au/7iNm50HcfJy
   Q4cHrXv29nHb1uE8k0VFVfR6AQReBI1ZiH454qfqfDqTK4uw3KTX1Qw1v
   yCK7MBinUZrX4lKp5F4lEjJFk1UbfriBw9gjF0H1MjnSn7tRFeWAi5iNT
   rrhbH3xJlgwpvCOXoi3v96ZecfwQir1etV1/dPNnf8r3Nn6wuZgMC9VPq
   w==;
X-CSE-ConnectionGUID: TCWJ8tPVRX+YPO/s/6CwDA==
X-CSE-MsgGUID: nD+v3ZJMR5WodpGw65Ieow==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68946529"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="68946529"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 17:21:23 -0800
X-CSE-ConnectionGUID: pF57DFdXQMa9Ea5dDn6bKw==
X-CSE-MsgGUID: BF/LYA/1RvWOxbjr3WWBFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="232231006"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Dec 2025 17:21:22 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vb7NO-000000001aD-3kaW;
	Thu, 01 Jan 2026 01:21:18 +0000
Date: Thu, 01 Jan 2026 09:20:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/btrfs/fs.c:94:2-8: preceding lock on line 90
Message-ID: <202601010939.mnUPfXJe-lkp@intel.com>
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
head:   9528d5c091c59b408a754a1823cf0942069867cc
commit: 0b93369104ac5f65721793e038cafa4b3e58fdba btrfs: move the exclusive operation functions into fs.c
date:   12 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-r051-20251231 (https://download.01.org/0day-ci/archive/20260101/202601010939.mnUPfXJe-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 86b9f90b9574b3a7d15d28a91f6316459dcfa046)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601010939.mnUPfXJe-lkp@intel.com/

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
