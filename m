Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B1579C0
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Mar 2024 06:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709445859; cv=none; b=IDGpZbbuCY9zKkbwivwU/QDlVLLI0Am43jcDh51MvwoLdouXaaPsntYf1MR040iwlZWU1irELoaStTAVXfP2HFx7XMuc4LUN1J/2/qIysA5PDfL9a8BqRxnwSmM/9QHdstLGU0RnuogAhCmprbGn7/pKb/yyBiQHTy5uDl4toy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709445859; c=relaxed/simple;
	bh=idF9nhN8filBB+KtMVP2Fwe4fKVtS9qtRwYLIl46Br0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pE5CQ0pwjW1gakqXwURtNn/J9AiQH4kfSc20suqpbVb+rTC/1as+/V6+gN2vC9LMcDWdYxKG5Q+r8erEtrq+e3/iwpGp69aJ052HWSQVxtOjc1g9npLOtLzgM8oT2qzk3if1AWwDlk6TGM2SlhD/8gXZ6pLsE+zSXY2iJqVvyZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fLdnjfoS; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fLdnjfoS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709445857; x=1740981857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=idF9nhN8filBB+KtMVP2Fwe4fKVtS9qtRwYLIl46Br0=;
  b=fLdnjfoSInZySYFpj38JU+jRAHnzLGPDAW/K0NTcelUiRSfkJiiRjyaK
   Rt6KJoZVBKjBGOc1oI8MPPmSl10Dfw7yRYRZwWfRFMOzqCzZvozdhkXTc
   KK3LK80s4kEDI5B4KSQtDA4am1dHEfP5o4DLHN2LEfMeGQdphG/RUKrdp
   rdttbkv/ZJ4vMd+NQheVyAkrJ+R9+MhH/MJoS560IEig3g7A+AugWBehs
   v3vuA/u6LEjtTlHAUj+r8/g7rM4NbXNO4Pr+759kvSQPDITRtzIDwn0SM
   neeGPNpg+CnVxxbOtFqMlYdNXL1Cy9RjUzqBDqJf1tQ+jF4807Va5C0X2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="29374962"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="29374962"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 22:04:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="13318566"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Mar 2024 22:04:15 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgexI-0000kY-2I;
	Sun, 03 Mar 2024 06:04:12 +0000
Date: Sun, 3 Mar 2024 14:03:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9115/11394] drivers/gpu/drm/xe/xe_ggtt.c:256
 ggtt_invalidate_gt_tlb() warn: variable dereferenced before check 'gt' (see
 line 253)
Message-ID: <202403031315.uPyTvJYB-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Matthew Brost <matthew.brost@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1870cdc0e8dee32e3c221704a2977898ba4c10e8
commit: 3121fed0c51beb8ea7b18ab2ceff1ac9e358ac53 [9115/11394] drm/xe: Cleanup some layering in GGTT
:::::: branch date: 2 days ago
:::::: commit date: 8 days ago
config: x86_64-randconfig-161-20240302 (https://download.01.org/0day-ci/archive/20240303/202403031315.uPyTvJYB-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403031315.uPyTvJYB-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_ggtt.c:256 ggtt_invalidate_gt_tlb() warn: variable dereferenced before check 'gt' (see line 253)

vim +/gt +256 drivers/gpu/drm/xe/xe_ggtt.c

dd08ebf6c3525a Matthew Brost 2023-03-30  250  
d78a4778195079 Matt Roper    2023-06-01  251  static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
dd08ebf6c3525a Matthew Brost 2023-03-30  252  {
3121fed0c51beb Matthew Brost 2024-02-22 @253  	struct xe_device *xe = gt_to_xe(gt);
3121fed0c51beb Matthew Brost 2024-02-22  254  	int err;
3121fed0c51beb Matthew Brost 2024-02-22  255  
d78a4778195079 Matt Roper    2023-06-01 @256  	if (!gt)
d78a4778195079 Matt Roper    2023-06-01  257  		return;
ad703e06376d5d Matt Roper    2023-06-01  258  
933b78d678213f Matt Roper    2023-06-01  259  	/*
933b78d678213f Matt Roper    2023-06-01  260  	 * Invalidation can happen when there's no in-flight work keeping the
933b78d678213f Matt Roper    2023-06-01  261  	 * GT awake.  We need to explicitly grab forcewake to ensure the GT
933b78d678213f Matt Roper    2023-06-01  262  	 * and GuC are accessible.
933b78d678213f Matt Roper    2023-06-01  263  	 */
933b78d678213f Matt Roper    2023-06-01  264  	xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
3121fed0c51beb Matthew Brost 2024-02-22  265  	err = xe_gt_tlb_invalidation_ggtt(gt);
3121fed0c51beb Matthew Brost 2024-02-22  266  	if (err)
3121fed0c51beb Matthew Brost 2024-02-22  267  		drm_warn(&xe->drm, "xe_gt_tlb_invalidation_ggtt error=%d", err);
933b78d678213f Matt Roper    2023-06-01  268  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
dd08ebf6c3525a Matthew Brost 2023-03-30  269  }
dd08ebf6c3525a Matthew Brost 2023-03-30  270  

:::::: The code at line 256 was first introduced by commit
:::::: d78a4778195079e0b2820550efeecb7b25fa764a drm/xe: Invalidate TLB on all affected GTs during GGTT updates

:::::: TO: Matt Roper <matthew.d.roper@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
