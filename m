Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C673D5C2A
	for <oe-kbuild@lists.linux.dev>; Fri, 22 May 2026 10:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445316; cv=none; b=cUWafG58chQXch7e2XF1mjqA8JyR8hb5kZYYjkTz0UXX3ZvDItRDPEJwO2MHGb8sv6PmYJXst+Rpy5Yga2Nm0qWbsjwP7mI7G2nfnJGTX+KIxWCTQWQMmo2pTlbXdn+Lt2JVzV/F23h17MZcQaVUuH8sukLupUqugGBq5Tq/tVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445316; c=relaxed/simple;
	bh=5L12PpVUdK2eIHvgm0cfrYg0S8C4LnfA3meGVqqJT7w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=US/hQeTNLorvlEv6+ibTtdYO38uGMfd5JH4zQxJsP6e3bxkWhBTvykdRo26SCVgZv9l8IyLDMORD/85fQIaoUO0HEM13vWTeapRCMTrvPKdkBdErzJ9b/eRqTUkSNlEVTbk5S7DZl84gVqN2P+GrZ/EFs+fYl4Iy+qkR7OCNHNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fGF8ONCB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fGF8ONCB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779445313; x=1810981313;
  h=date:from:to:cc:subject:message-id;
  bh=5L12PpVUdK2eIHvgm0cfrYg0S8C4LnfA3meGVqqJT7w=;
  b=fGF8ONCBgLCYVypGyFK+hl0FY8PhPyYGeE1CuycKYQ/3NYZeZ2RF1PBi
   SUFJaRrqp+F01CD6hZXYH4xeaomUgZefenxfMB/HZFRccCgj9QVMWRH+Q
   SWhJ2/PffgWZkru2kpAN+20ojnXeg8YRGB8IZPB3TIDTC6su+omb7UR55
   p2x2ceYDLAVs06g6hhShNKdRsK8ci5RGItPSVUApxgyPLy8WtKE/X3v/b
   c8gXVLRNSugp1FhC5Gtcg2Ug/UoBpz38joY4uENXoMqe1SamYuETGMZwR
   5ALlCVCxOy9/PgXLSItvG5PJ1Fq0C4hOrpJiEDEx86HUBbFxsYDBAcdN0
   w==;
X-CSE-ConnectionGUID: nkEYMhkaTByTiFT2OzvytA==
X-CSE-MsgGUID: 6Ur4rjycRZK6nCprIy+UBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="91766207"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="91766207"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 03:21:51 -0700
X-CSE-ConnectionGUID: AnfpOteFTx+pu/1b+FefLw==
X-CSE-MsgGUID: nzn7KwszSziDFb9fJiJPlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="240927627"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 May 2026 03:21:50 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQN0l-000000002Dh-2wIN;
	Fri, 22 May 2026 10:21:47 +0000
Date: Fri, 22 May 2026 18:20:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:532
 amdgpu_gfx_mqd_symmetrically_map_cu_mask() error: buffer overflow
 'cu_info->bitmap' 8 <= 15
Message-ID: <202605221813.PH0pZ9Nu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: YiPeng Chai <YiPeng.Chai@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Tao Zhou <tao.zhou1@amd.com>

Hi YiPeng,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6779b50faa562e6cca1aa6a4649a4d764c6c7e28
commit: 7783a8bf065461c1eecaae5ab4421dd4d895f72b drm/amdgpu: Fix static assertion failure issue
date:   3 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 3 months ago
config: powerpc64-randconfig-r072-20260521 (https://download.01.org/0day-ci/archive/20260522/202605221813.PH0pZ9Nu-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7783a8bf0654 ("drm/amdgpu: Fix static assertion failure issue")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605221813.PH0pZ9Nu-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:532 amdgpu_gfx_mqd_symmetrically_map_cu_mask() error: buffer overflow 'cu_info->bitmap' 8 <= 15

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:451 amdgpu_gfx_mqd_sw_init() error: buffer overflow 'adev->gfx.compute_ring' 64 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:463 amdgpu_gfx_mqd_sw_init() error: buffer overflow 'adev->gfx.mec.mqd_backup' 64 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:464 amdgpu_gfx_mqd_sw_init() error: buffer overflow 'adev->gfx.mec.mqd_backup' 64 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:492 amdgpu_gfx_mqd_sw_fini() error: buffer overflow 'adev->gfx.compute_ring' 64 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:493 amdgpu_gfx_mqd_sw_fini() error: buffer overflow 'adev->gfx.mec.mqd_backup' 64 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:566 amdgpu_gfx_disable_kcq() error: buffer overflow 'adev->gfx.compute_ring' 64 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:588 amdgpu_gfx_disable_kcq() error: buffer overflow 'adev->gfx.compute_ring' 64 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:617 amdgpu_gfx_disable_kgq() error: buffer overflow 'adev->gfx.gfx_ring' 2 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:641 amdgpu_gfx_disable_kgq() error: buffer overflow 'adev->gfx.gfx_ring' 2 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:700 amdgpu_gfx_mes_enable_kcq() error: buffer overflow 'adev->gfx.compute_ring' 64 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:758 amdgpu_gfx_enable_kcq() error: buffer overflow 'adev->gfx.compute_ring' 64 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:790 amdgpu_gfx_enable_kgq() error: buffer overflow 'adev->gfx.gfx_ring' 2 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:815 amdgpu_gfx_enable_kgq() error: buffer overflow 'adev->gfx.gfx_ring' 2 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1686 amdgpu_gfx_run_cleaner_shader() error: buffer overflow 'adev->gfx.compute_ring' 64 <= u32max

vim +532 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c

d23ee13fba23a3 Rex Zhu     2018-07-30  505  
0ea556047d49d8 Jesse.Zhang 2026-01-23  506  void amdgpu_gfx_mqd_symmetrically_map_cu_mask(struct amdgpu_device *adev, const uint32_t *cu_mask,
0ea556047d49d8 Jesse.Zhang 2026-01-23  507  					      uint32_t cu_mask_count, uint32_t *se_mask)
0ea556047d49d8 Jesse.Zhang 2026-01-23  508  {
0ea556047d49d8 Jesse.Zhang 2026-01-23  509  	struct amdgpu_cu_info *cu_info = &adev->gfx.cu_info;
0ea556047d49d8 Jesse.Zhang 2026-01-23  510  	struct amdgpu_gfx_config *gfx_info = &adev->gfx.config;
0ea556047d49d8 Jesse.Zhang 2026-01-23  511  	uint32_t cu_per_sh[8][4] = {0};
0ea556047d49d8 Jesse.Zhang 2026-01-23  512  	int i, se, sh, cu, cu_bitmap_sh_mul;
0ea556047d49d8 Jesse.Zhang 2026-01-23  513  	int xcc_inst = ffs(adev->gfx.xcc_mask) - 1;
0ea556047d49d8 Jesse.Zhang 2026-01-23  514  	bool wgp_mode_req = amdgpu_ip_version(adev, GC_HWIP, 0) >= IP_VERSION(10, 0, 0);
0ea556047d49d8 Jesse.Zhang 2026-01-23  515  	int cu_inc = wgp_mode_req ? 2 : 1;
0ea556047d49d8 Jesse.Zhang 2026-01-23  516  	uint32_t en_mask = wgp_mode_req ? 0x3 : 0x1;
0ea556047d49d8 Jesse.Zhang 2026-01-23  517  	int num_xcc, inc, inst = 0;
0ea556047d49d8 Jesse.Zhang 2026-01-23  518  
0ea556047d49d8 Jesse.Zhang 2026-01-23  519  	if (xcc_inst < 0)
0ea556047d49d8 Jesse.Zhang 2026-01-23  520  		xcc_inst = 0;
0ea556047d49d8 Jesse.Zhang 2026-01-23  521  
0ea556047d49d8 Jesse.Zhang 2026-01-23  522  	num_xcc = hweight16(adev->gfx.xcc_mask);
0ea556047d49d8 Jesse.Zhang 2026-01-23  523  	if (!num_xcc)
0ea556047d49d8 Jesse.Zhang 2026-01-23  524  		num_xcc = 1;
0ea556047d49d8 Jesse.Zhang 2026-01-23  525  
0ea556047d49d8 Jesse.Zhang 2026-01-23  526  	inc = cu_inc * num_xcc;
0ea556047d49d8 Jesse.Zhang 2026-01-23  527  
0ea556047d49d8 Jesse.Zhang 2026-01-23  528  	cu_bitmap_sh_mul = 2;
0ea556047d49d8 Jesse.Zhang 2026-01-23  529  
0ea556047d49d8 Jesse.Zhang 2026-01-23  530  	for (se = 0; se < gfx_info->max_shader_engines; se++)
0ea556047d49d8 Jesse.Zhang 2026-01-23  531  		for (sh = 0; sh < gfx_info->max_sh_per_se; sh++)
0ea556047d49d8 Jesse.Zhang 2026-01-23 @532  			cu_per_sh[se][sh] = hweight32(
0ea556047d49d8 Jesse.Zhang 2026-01-23  533  				cu_info->bitmap[xcc_inst][se % 4][sh + (se / 4) *
0ea556047d49d8 Jesse.Zhang 2026-01-23  534  				cu_bitmap_sh_mul]);
0ea556047d49d8 Jesse.Zhang 2026-01-23  535  
0ea556047d49d8 Jesse.Zhang 2026-01-23  536  	for (i = 0; i < gfx_info->max_shader_engines; i++)
0ea556047d49d8 Jesse.Zhang 2026-01-23  537  		se_mask[i] = 0;
0ea556047d49d8 Jesse.Zhang 2026-01-23  538  
0ea556047d49d8 Jesse.Zhang 2026-01-23  539  	i = inst;
0ea556047d49d8 Jesse.Zhang 2026-01-23  540  	for (cu = 0; cu < 16; cu += cu_inc) {
0ea556047d49d8 Jesse.Zhang 2026-01-23  541  		for (sh = 0; sh < gfx_info->max_sh_per_se; sh++) {
0ea556047d49d8 Jesse.Zhang 2026-01-23  542  			for (se = 0; se < gfx_info->max_shader_engines; se++) {
0ea556047d49d8 Jesse.Zhang 2026-01-23  543  				if (cu_per_sh[se][sh] > cu) {
0ea556047d49d8 Jesse.Zhang 2026-01-23  544  					if ((i / 32) < cu_mask_count && (cu_mask[i / 32] & (1 << (i % 32))))
0ea556047d49d8 Jesse.Zhang 2026-01-23  545  						se_mask[se] |= en_mask << (cu + sh * 16);
0ea556047d49d8 Jesse.Zhang 2026-01-23  546  					i += inc;
0ea556047d49d8 Jesse.Zhang 2026-01-23  547  					if (i >= cu_mask_count * 32)
0ea556047d49d8 Jesse.Zhang 2026-01-23  548  						return;
0ea556047d49d8 Jesse.Zhang 2026-01-23  549  				}
0ea556047d49d8 Jesse.Zhang 2026-01-23  550  			}
0ea556047d49d8 Jesse.Zhang 2026-01-23  551  		}
0ea556047d49d8 Jesse.Zhang 2026-01-23  552  	}
0ea556047d49d8 Jesse.Zhang 2026-01-23  553  }
0ea556047d49d8 Jesse.Zhang 2026-01-23  554  

:::::: The code at line 532 was first introduced by commit
:::::: 0ea556047d49d8d735d324c9c0176e67e252ad77 drm/amdgpu: Add CU mask support for MQD properties

:::::: TO: Jesse.Zhang <Jesse.Zhang@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
