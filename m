Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9AD37FF63
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Jan 2026 22:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768430798; cv=none; b=UdorOJUxqKjdx/dEWvNoL3W4sVfR2n2Qw83M86s2YWgzb1a6g7is8Is0TjnHtuV6lAXgb+/JquVK20GTwQnKM6geeWx5WqmhYfr5wkdLSiihb4dgMMxOT+5Zg519z/xO6VkSSqTiIHoVPtwfvWI+RkFd3w10yWJE07uipMy1ZIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768430798; c=relaxed/simple;
	bh=ZHIlDR8hTv6IV74ntGhPTF2lK/y/obbwtb8mPPeSOgQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ce4WbZf1d3qc2vJtsPPjA6TVsJquqQ90VO6QdHSmwt04JNiU5WEjxPTR7b2FOfY+uufbj6kOkYifwYe/AU66nMsSPt7Vn8Nq+9lOlcYI2g4RWle5wWxbWSD4KwURLKy9QRLoXGzLaArIow6Og+PAQC5DQRMgmsBdvi8KONW2mQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wn6sXDGX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wn6sXDGX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768430794; x=1799966794;
  h=date:from:to:cc:subject:message-id;
  bh=ZHIlDR8hTv6IV74ntGhPTF2lK/y/obbwtb8mPPeSOgQ=;
  b=Wn6sXDGXA0VTetJt2N8nzXrHCd+r0WWjIUAtyc4P7ajIXfFv9uNWoLv/
   WDRR5FvKQhQStziYHbKCXY8PCLkIqBAgNJuAKGCyKzjLhd6rxJKbJT7Fv
   hfLqwzqBTyEBPo0LS3w25LLTJi757WcBKM6wPhHQw0MiFditTfffaN+VD
   rQSzYUXK2TAXTDeNjiQSKkb/Fw5U60wue7vgojM+inW7y34aMlQxrWRlt
   YTEMfFxAJUpgU0mCucaYO05Av/bza6VFFRPDNWxSpRIgmtMHR+nSPsgs5
   IsJaOV1QcUmBQFsItxruWJ8guZxjd3UOOgVq446HwLz/yUtP7nL9PiQkP
   A==;
X-CSE-ConnectionGUID: 1Pki4NFfRRG72j/TprI9Zw==
X-CSE-MsgGUID: e2Vmg92dRUGWCdwopxsl+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69647591"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="69647591"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 14:46:30 -0800
X-CSE-ConnectionGUID: PFjiN0epT9+PyDRbt7hHag==
X-CSE-MsgGUID: IQ5/72ZaR063flgnb3Rnsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="204848092"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Jan 2026 14:46:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg9dB-00000000H9a-2pLh;
	Wed, 14 Jan 2026 22:46:25 +0000
Date: Thu, 15 Jan 2026 06:45:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/xe/xe_sriov_vf_ccs.c:403:45-51: ERROR:
 iterator variable bound on line 398 cannot be NULL
Message-ID: <202601150657.DM5cvH4C-lkp@intel.com>
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
head:   944aacb68baf7624ab8d277d0ebf07f025ca137c
commit: fd548b77d5ef185138aa6dbc7aafdc44586bd9b5 drm/xe/vf: Move VF CCS debugfs attribute
date:   4 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-101-20260112 (https://download.01.org/0day-ci/archive/20260115/202601150657.DM5cvH4C-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601150657.DM5cvH4C-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_sriov_vf_ccs.c:403:45-51: ERROR: iterator variable bound on line 398 cannot be NULL

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
