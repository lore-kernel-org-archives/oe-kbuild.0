Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1910222566
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jan 2026 10:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768645195; cv=none; b=G3W9PuR/XGC7h1moGbXGphcfWc1L0CzmnLW3np/W4Ra0JLrj6zcniWGTOFuyaro05fkFu7MmEZjoJEy+Z7ldhqaK4ZX8v++GKk0uL9N4VTJj5ZNxVH1YM55YvYDPtuNixdt2Gm/Qt6LbSvU8mhzypCvq/yIEPO25TbEcKekAMEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768645195; c=relaxed/simple;
	bh=5FXgB9/OgB3KafEjrIEeIdEc8GzyHnDTeueNLMC93lY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f/5VBEAu8flTeezRTLVjOByLGmaZuTS4ma0mn8iPEqCn0xLGS30h/pMqB4ZNAVv9JVf3R94UM3Rbo93rm4SN6BhlD/RvcoObwe0meKUcfhF4T4qYYWzhS6JES+YDoTrwLv+1h3coYpy1qu7D87Z+pAQXCOmVF3MU8WdQe66Zq8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BX/OPX4/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BX/OPX4/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768645192; x=1800181192;
  h=date:from:to:cc:subject:message-id;
  bh=5FXgB9/OgB3KafEjrIEeIdEc8GzyHnDTeueNLMC93lY=;
  b=BX/OPX4/7A3ZSbQcDSuDOXoKmIpLtLrHCTbemIDnxChMHGDl3H7uOOwJ
   VAswnJpgoGjScUViadyBgT6TX4+B2X84ZCwc6k+x3IUvbZ8RfbjZN0r9o
   JGkDwmm/deWZtOz5Zw/bm3Jki9uMCpUssKJ1ZDYojYqWwvBDbpkuhsf/v
   F9GF2rNHxwkBEKVIuyH1kESfZpgngAiFkw+gg3MY61JL63nGMmZO9Z5eH
   cM1bCo/Lz8oMo1lxiHpy3YjytTWyHj99ME9qHDeyaBIgNCqh+y9i9iiDV
   25QSoEvdqoKxDmnYV5C8usAVrpVTOG+dyIg3JA2cE7WRp8Gos2tLQwhPv
   A==;
X-CSE-ConnectionGUID: tR2L7B3hQQmhDjQYpIkaaw==
X-CSE-MsgGUID: UTgBWUulQx+5iRRW1HaI5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="80663091"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="80663091"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 02:19:52 -0800
X-CSE-ConnectionGUID: Q+cNSswlSc+6eAbcr6yoDw==
X-CSE-MsgGUID: hgitOnJiTriSbZb+kbjOTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="210460242"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Jan 2026 02:19:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh3PI-00000000Lkm-0i9T;
	Sat, 17 Jan 2026 10:19:48 +0000
Date: Sat, 17 Jan 2026 18:19:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/xe/xe_sriov_vf_ccs.c:403:45-51: ERROR:
 iterator variable bound on line 398 cannot be NULL
Message-ID: <202601171812.KlwQ6Mek-lkp@intel.com>
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
head:   d3eeb99bbc99cc5eb94a4a75ed4415a0272254ef
commit: fd548b77d5ef185138aa6dbc7aafdc44586bd9b5 drm/xe/vf: Move VF CCS debugfs attribute
date:   4 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-101-20260112 (https://download.01.org/0day-ci/archive/20260117/202601171812.KlwQ6Mek-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601171812.KlwQ6Mek-lkp@intel.com/

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
