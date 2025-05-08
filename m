Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65FC24B28
	for <oe-kbuild@lists.linux.dev>; Thu,  8 May 2025 22:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746743818; cv=none; b=XNiexUw184/3ue8/QyKiAOjspb4g47XH497cTTpHHekS8xDSZqPlFSJZaF6tF/sla26AX+7Fok7fOPodOVRoT7kNUiIIlCQnCZDwUL9Y7V2lQrvw4SozXSIhvvEOsOJ+juR3No3iZbokN0KE+CeqCpmmjuFDNJ9LKEVBwaBTc1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746743818; c=relaxed/simple;
	bh=ZJFC643163/7c0vJncv7h2zyLrYYGLyD2jGo0lODwio=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M+hAmj6euFnpV2H2jOdQjDzLKhRxVCtH+I27d/YPhsS6jU5HLVibUiLEG/7O12HSTO2tsoUlfVBmNtKSm66ENe5w1keysrpYkPFjh62Q42O6mqMaYUJcBmbx3Tv+rmhHeyaEJrVM5EPkPUCtK93glYUieoEcTcyxl9sHVwxW+Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mxZ6m2Ax; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mxZ6m2Ax"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746743816; x=1778279816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZJFC643163/7c0vJncv7h2zyLrYYGLyD2jGo0lODwio=;
  b=mxZ6m2AxerpQyt5eXd+n/CzktEk8jZRqQfAI0Tmt49mzrMs6g+g9JtEx
   aQwkOnFpNp7sNlMOBxwyubbWvtsq3UzGNZrxHhuRuAPeUEHdy2xFz9q2j
   wEs6+Gm3nRaq7j6rFGTNZWWuJGUsU79USEvXXQUQ23TDxVqKaH+Gp/IE/
   aSihy+RAXCJOAyDp1HtXTsiiMsSbMhjHFRVG16VGIU72aJPlikWFgdoUf
   xSrkqdXXUCox+DXDboL4LD2QYNrBYxGugQGssYKszsHJlQz/yexkQWDqN
   m4Czodxklu6QVqCdvZ5PoyPQCWGy29nBS/I+mBa8Gy5hWfzEDXbUGWa0o
   w==;
X-CSE-ConnectionGUID: sHgtrriIQeGzDqoHZoS1IA==
X-CSE-MsgGUID: meQhUISwSI2MXOg1GAV0zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48564716"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="48564716"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 15:36:55 -0700
X-CSE-ConnectionGUID: I6ynVHsUS7axTeqwHIEGtQ==
X-CSE-MsgGUID: PlMjKVP4Tva0XIMzF6DNoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136368258"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 May 2025 15:36:54 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD9rH-000BQx-1w;
	Thu, 08 May 2025 22:36:51 +0000
Date: Fri, 9 May 2025 06:36:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [riteshharjani:vfs.all-ext4-atomic-write-bigalloc-lsfmm-rfcv2-wipv7-0day
 8/10] fs/ext4/inode.c:3437 ext4_map_blocks_atomic_write_slow() error:
 uninitialized symbol 'next_pblk'.
Message-ID: <202505090642.BxDYamc5-lkp@intel.com>
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
TO: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>

tree:   https://github.com/riteshharjani/linux vfs.all-ext4-atomic-write-bigalloc-lsfmm-rfcv2-wipv7-0day
head:   1912657402abaf0395d3a767f49d6ef7238fd29b
commit: ca7b8142c30f1426ea479164bb4a1d486d5c59b3 [8/10] ext4: Add multi-fsblock atomic write support with bigalloc
:::::: branch date: 32 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250508 (https://download.01.org/0day-ci/archive/20250509/202505090642.BxDYamc5-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505090642.BxDYamc5-lkp@intel.com/

New smatch warnings:
fs/ext4/inode.c:3437 ext4_map_blocks_atomic_write_slow() error: uninitialized symbol 'next_pblk'.

Old smatch warnings:
fs/ext4/inode.c:2535 mpage_prepare_extent_to_map() warn: missing error code 'err'
fs/ext4/inode.c:4980 check_igot_inode() warn: missing unwind goto?
fs/ext4/inode.c:6525 ext4_page_mkwrite() error: uninitialized symbol 'get_block'.

vim +/next_pblk +3437 fs/ext4/inode.c

c8fdfe29418745 Matthew Bobrowski    2019-11-05  3405  
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3406) static int ext4_map_blocks_atomic_write_slow(handle_t *handle,
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3407) 			struct inode *inode, struct ext4_map_blocks *map)
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3408) {
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3409) 	ext4_lblk_t m_lblk = map->m_lblk;
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3410) 	unsigned int m_len = map->m_len;
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3411) 	unsigned int mapped_len = 0, m_flags = 0;
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3412) 	ext4_fsblk_t next_pblk;
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3413) 	bool check_next_pblk = false;
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3414) 	int ret = 0;
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3415) 
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3416) 	WARN_ON_ONCE(!ext4_has_feature_bigalloc(inode->i_sb));
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3417) 
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3418) 	/*
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3419) 	 * This is a slow path in case of mixed mapping. We use
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3420) 	 * EXT4_GET_BLOCKS_CREATE_ZERO flag here to make sure we get a single
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3421) 	 * contiguous mapping. This will ensure any unwritten or hole regions
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3422) 	 * within the requested range is zeroed out and we return a single
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3423) 	 * contiguous mapped extent.
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3424) 	 */
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3425) 	m_flags = EXT4_GET_BLOCKS_CREATE_ZERO;
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3426) 
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3427) 	do {
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3428) 		ret = ext4_map_blocks(handle, inode, map, m_flags);
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3429) 		if (ret < 0 && ret != -ENOSPC)
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3430) 			goto out_err;
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3431) 		/*
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3432) 		 * With bigalloc we should never get ENOSPC nor discontiguous
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3433) 		 * physical extents.
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3434) 		 */
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3435) 		if ((check_next_pblk && next_pblk != map->m_pblk) ||
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3436) 				ret == -ENOSPC) {
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06 @3437) 			ext4_warning_inode(inode,
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3438) 				"Non-contiguous allocation detected: expected %llu, got %llu, "
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3439) 				"or ext4_map_blocks() returned out of space ret: %d",
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3440) 				next_pblk, map->m_pblk, ret);
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3441) 			ret = -ENOSPC;
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3442) 			goto out_err;
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3443) 		}
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3444) 		next_pblk = map->m_pblk + map->m_len;
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3445) 		check_next_pblk = true;
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3446) 
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3447) 		mapped_len += map->m_len;
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3448) 		map->m_lblk += map->m_len;
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3449) 		map->m_len = m_len - mapped_len;
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3450) 	} while (mapped_len < m_len);
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3451) 
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3452) 	/*
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3453) 	 * We might have done some work in above loop, so we need to query the
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3454) 	 * start of the physical extent, based on the origin m_lblk and m_len.
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3455) 	 * Let's also ensure we were able to allocate the required range for
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3456) 	 * mixed mapping case.
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3457) 	 */
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3458) 	map->m_lblk = m_lblk;
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3459) 	map->m_len = m_len;
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3460) 
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3461) 	ret = ext4_map_blocks(handle, inode, map, 0);
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3462) 	if (ret != m_len) {
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3463) 		ext4_warning_inode(inode, "allocation failed for atomic write request pos:%u, len:%u\n",
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3464) 			m_lblk, m_len);
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3465) 		ret = -EINVAL;
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3466) 	}
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3467) 	return ret;
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3468) 
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3469) out_err:
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3470) 	/* reset map before returning an error */
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3471) 	map->m_lblk = m_lblk;
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3472) 	map->m_len = m_len;
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3473) 	map->m_flags = 0;
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3474) 	return ret;
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3475) }
ca7b8142c30f14 Ritesh Harjani (IBM  2025-05-06  3476) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
