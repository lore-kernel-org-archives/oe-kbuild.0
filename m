Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA3C9463
	for <oe-kbuild@lists.linux.dev>; Mon,  4 May 2026 01:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777858272; cv=none; b=ho9j/k1CKgCrHbaTjOVKXCkz3tGegasBmuLRqYPI+F+kQVra/UVSIfl/Sk9cQen1c/vsby7B5Qd20Rd7nWhbiv1/1O8Nv7AYpPjGru4TJHOFTlHmNzvvlXTVFjQoXHNdTJoSVq+CYFRpjvfuXm1TIPq++acQwzWsUNV36I24S2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777858272; c=relaxed/simple;
	bh=QP4JnEgqxOp5NRYjkH4qdWRhta0Lvwn2mKbvR/aNsmw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BnfMKq1fS8CxYhHqXRvc2tX6g8ydxysF5iWEuxrlK49yBDc8cZcbdomTDGyF/4p0ne8hk8YNCoWb+dtYklnB2RmMsZMngRseEdJr050kTyqKJhShg88Hv3V1VX9O/KbyXFfx0raDTY32Nq3A5ehmiKN89yOAYREfE86HBUoeGC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h+xtsrtg; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h+xtsrtg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777858269; x=1809394269;
  h=date:from:to:cc:subject:message-id;
  bh=QP4JnEgqxOp5NRYjkH4qdWRhta0Lvwn2mKbvR/aNsmw=;
  b=h+xtsrtgAiUlgZJ/CeTEILvNa1qyvGwKRiuRMWcmrZvIYoc0IBNTRP9c
   s01qCyp5r03s6gUGS6AHK00Yng4Bsi4bScZhT4OYisT3BLGij5kpjl+8E
   4Rmuxmvr0mZiKhhLIvcWFt8wy8yshvBwgVKD18xuYc4OC98uQSrrk8lyA
   PW41pRKKu/JfYNE1KJ9wtTOIO11gxagJkc2iFr1/DnDkHABESCyYqLkcv
   H0Xx4ruOujDjzXgi0P9vpiot517PwcLi3wsvhbvbRlkJvRGCxnrk8FXVp
   6T8T/emlFROzQEqG1zWJ+mbbL9E1iEToM3pTS0vbOck7Sv/2mvvtMfpzH
   g==;
X-CSE-ConnectionGUID: jjgZK4wWSfyNJ4CM/Tqm7A==
X-CSE-MsgGUID: CxbhwUWjQ+au4jIzzzgi0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="89304509"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="89304509"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 18:31:08 -0700
X-CSE-ConnectionGUID: M23iX19xTf63wYG7rW+Bew==
X-CSE-MsgGUID: iJFt1+4GSwq/k/xtr/nyqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="237163276"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 May 2026 18:31:07 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJi9B-000000003KA-24Ol;
	Mon, 04 May 2026 01:31:00 +0000
Date: Mon, 04 May 2026 09:28:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/xe/xe_sriov_vf_ccs.c:403:45-51: ERROR:
 iterator variable bound on line 398 cannot be NULL
Message-ID: <202605040957.aM2vInoJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6d35786de28116ecf78797a62b84e6bf3c45aa5a
commit: fd548b77d5ef185138aa6dbc7aafdc44586bd9b5 drm/xe/vf: Move VF CCS debugfs attribute
date:   8 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
config: i386-randconfig-052-20260504 (https://download.01.org/0day-ci/archive/20260504/202605040957.aM2vInoJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: fd548b77d5ef ("drm/xe/vf: Move VF CCS debugfs attribute")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202605040957.aM2vInoJ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_sriov_vf_ccs.c:403:45-51: ERROR: iterator variable bound on line 398 cannot be NULL
--
>> drivers/gpu/drm/xe/xe_sriov_vf_ccs.c:403:45-51: opportunity for str_write_read(ctx_id)

vim +403 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c

fd548b77d5ef18 Michal Wajdeczko 2025-09-08  380  
fd548b77d5ef18 Michal Wajdeczko 2025-09-08  381  /**
fd548b77d5ef18 Michal Wajdeczko 2025-09-08  382   * xe_sriov_vf_ccs_print - Print VF CCS details.
fd548b77d5ef18 Michal Wajdeczko 2025-09-08  383   * @xe: the &xe_device
fd548b77d5ef18 Michal Wajdeczko 2025-09-08  384   * @p: the &drm_printer
fd548b77d5ef18 Michal Wajdeczko 2025-09-08  385   *
fd548b77d5ef18 Michal Wajdeczko 2025-09-08  386   * This function is for VF use only.
fd548b77d5ef18 Michal Wajdeczko 2025-09-08  387   */
fd548b77d5ef18 Michal Wajdeczko 2025-09-08  388  void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p)
fd548b77d5ef18 Michal Wajdeczko 2025-09-08  389  {
fd548b77d5ef18 Michal Wajdeczko 2025-09-08  390  	struct xe_sa_manager *bb_pool;
fd548b77d5ef18 Michal Wajdeczko 2025-09-08  391  	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
fd548b77d5ef18 Michal Wajdeczko 2025-09-08  392  
fd548b77d5ef18 Michal Wajdeczko 2025-09-08  393  	if (!IS_VF_CCS_READY(xe))
fd548b77d5ef18 Michal Wajdeczko 2025-09-08  394  		return;
fd548b77d5ef18 Michal Wajdeczko 2025-09-08  395  
fd548b77d5ef18 Michal Wajdeczko 2025-09-08  396  	xe_pm_runtime_get(xe);
fd548b77d5ef18 Michal Wajdeczko 2025-09-08  397  
fd548b77d5ef18 Michal Wajdeczko 2025-09-08 @398  	for_each_ccs_rw_ctx(ctx_id) {
fd548b77d5ef18 Michal Wajdeczko 2025-09-08  399  		bb_pool = xe->sriov.vf.ccs.contexts[ctx_id].mem.ccs_bb_pool;
fd548b77d5ef18 Michal Wajdeczko 2025-09-08  400  		if (!bb_pool)
fd548b77d5ef18 Michal Wajdeczko 2025-09-08  401  			break;
fd548b77d5ef18 Michal Wajdeczko 2025-09-08  402  
fd548b77d5ef18 Michal Wajdeczko 2025-09-08 @403  		drm_printf(p, "ccs %s bb suballoc info\n", ctx_id ? "write" : "read");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
