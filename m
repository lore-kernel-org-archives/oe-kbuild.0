Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1002D46A9
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Aug 2025 14:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755007525; cv=none; b=nqyQrKZd05N7xvvig2/cui0ukOltwAGxiIeTtxPfNHIJQbezimW6jzEtXk6PVIFhjbEmf1kwTLVCXgzZRKq86FouY5fgf0rn9vchONPSwY0chzr2Q3ry5h5+koYfqNx6gDe7q8LC8DKvOMff/p5nVEO0eoPDQkmhJSKAQo9DUaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755007525; c=relaxed/simple;
	bh=M2CT4SqZ4AVi05rrA6uDbOaXPs1vIcHy4bVse0ltz6s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EyesCXHxQ0OBzth+Bjj2O7JuF6ZTA8M+tiSZwU8VZLXa315nM5+2xH55atCEHDpgVSa/Zzi5QXWm+FW038lc03gLsSqsv78ApO21mMf9wruru3fqOuZYbRZgbK4ExJUpMONAXE13/gNve6hEmXckl7/qxlg2YHx3rJCp92Y416g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XqZDb3Tr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XqZDb3Tr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755007521; x=1786543521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M2CT4SqZ4AVi05rrA6uDbOaXPs1vIcHy4bVse0ltz6s=;
  b=XqZDb3TrhRE9A5PHYpvaeszDUpCDc7DCo02qNXyzHM5nnrs3pc0Yb7+p
   LgSbbwA+BcDOCOJgAV1sFWjow1Lo5wUbeRxQcr4Mmf/7+cwiaWrsNXKLM
   sliaayZuMotuyNjuMSsz9D/fFVontJhqqbtBAeZAhnMiBxuwe//LSSmIt
   wQuE4meeWxQTKe/yBtab31+JUij/bVEQl3PgtmvBdYpX9TsxufVkXlsNk
   3y4ZdQYjsH7B2CnGQGjjlL9ifcyLu4TXChKEkCNGkB13R5R+mIoNG/1Wa
   89naBX0xkFgjYGnFS/Coiu+xBXP/smH2BQQD2TWsUtTmAIc/7eKDc76kg
   g==;
X-CSE-ConnectionGUID: Bs//FVhlRIyF9cV4HIXzeA==
X-CSE-MsgGUID: qRGOH1RZSyy1UnxGG8S/kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57186123"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="57186123"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 07:05:20 -0700
X-CSE-ConnectionGUID: rf1ZyXvxQ9K9BAPUbuTzdg==
X-CSE-MsgGUID: wdPpRj9/S6yg/81nfHPebg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="170342038"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 12 Aug 2025 07:05:19 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulpcq-0006rR-39;
	Tue, 12 Aug 2025 14:05:16 +0000
Date: Tue, 12 Aug 2025 22:04:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 387/1649]
 drivers/gpu/drm/xe/xe_gt_debugfs.c:153:45-51: ERROR: iterator variable bound
 on line 148 cannot be NULL
Message-ID: <202508122138.UShvF0v1-lkp@intel.com>
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
TO: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2674d1eadaa2fd3a918dfcdb6d0bb49efe8a8bb9
commit: f3009272ff2ec0498426001e4dd2a12c50234e08 [387/1649] drm/xe/vf: Create contexts for CCS read write
:::::: branch date: 10 hours ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-r063-20250812 (https://download.01.org/0day-ci/archive/20250812/202508122138.UShvF0v1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202508122138.UShvF0v1-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_gt_debugfs.c:153:45-51: ERROR: iterator variable bound on line 148 cannot be NULL
--
>> drivers/gpu/drm/xe/xe_gt_debugfs.c:153:45-51: opportunity for str_write_read(ctx_id)

vim +153 drivers/gpu/drm/xe/xe_gt_debugfs.c

dd08ebf6c3525a Matthew Brost       2023-03-30  136  
f3009272ff2ec0 Satyanarayana K V P 2025-07-22  137  static int sa_info_vf_ccs(struct xe_gt *gt, struct drm_printer *p)
f3009272ff2ec0 Satyanarayana K V P 2025-07-22  138  {
f3009272ff2ec0 Satyanarayana K V P 2025-07-22  139  	struct xe_tile *tile = gt_to_tile(gt);
f3009272ff2ec0 Satyanarayana K V P 2025-07-22  140  	struct xe_sa_manager *bb_pool;
f3009272ff2ec0 Satyanarayana K V P 2025-07-22  141  	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
f3009272ff2ec0 Satyanarayana K V P 2025-07-22  142  
f3009272ff2ec0 Satyanarayana K V P 2025-07-22  143  	if (!IS_VF_CCS_READY(gt_to_xe(gt)))
f3009272ff2ec0 Satyanarayana K V P 2025-07-22  144  		return 0;
f3009272ff2ec0 Satyanarayana K V P 2025-07-22  145  
f3009272ff2ec0 Satyanarayana K V P 2025-07-22  146  	xe_pm_runtime_get(gt_to_xe(gt));
f3009272ff2ec0 Satyanarayana K V P 2025-07-22  147  
f3009272ff2ec0 Satyanarayana K V P 2025-07-22 @148  	for_each_ccs_rw_ctx(ctx_id) {
f3009272ff2ec0 Satyanarayana K V P 2025-07-22  149  		bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
f3009272ff2ec0 Satyanarayana K V P 2025-07-22  150  		if (!bb_pool)
f3009272ff2ec0 Satyanarayana K V P 2025-07-22  151  			break;
f3009272ff2ec0 Satyanarayana K V P 2025-07-22  152  
f3009272ff2ec0 Satyanarayana K V P 2025-07-22 @153  		drm_printf(p, "ccs %s bb suballoc info\n", ctx_id ? "write" : "read");
f3009272ff2ec0 Satyanarayana K V P 2025-07-22  154  		drm_printf(p, "-------------------------\n");
f3009272ff2ec0 Satyanarayana K V P 2025-07-22  155  		drm_suballoc_dump_debug_info(&bb_pool->base, p, bb_pool->gpu_addr);
f3009272ff2ec0 Satyanarayana K V P 2025-07-22  156  		drm_puts(p, "\n");
f3009272ff2ec0 Satyanarayana K V P 2025-07-22  157  	}
f3009272ff2ec0 Satyanarayana K V P 2025-07-22  158  
f3009272ff2ec0 Satyanarayana K V P 2025-07-22  159  	xe_pm_runtime_put(gt_to_xe(gt));
f3009272ff2ec0 Satyanarayana K V P 2025-07-22  160  
f3009272ff2ec0 Satyanarayana K V P 2025-07-22  161  	return 0;
f3009272ff2ec0 Satyanarayana K V P 2025-07-22  162  }
f3009272ff2ec0 Satyanarayana K V P 2025-07-22  163  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
