Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BEF2BB13
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Feb 2026 13:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770469306; cv=none; b=i1CGT7HJZz70dGRkDFduMb+WIAqa9oKt+y0+XM0UJfka+g0SWaVkn5CLnqtxy1f22ekRINMivwbH0RnJYkPVut+UR8/a02v64QHoxIiJIChoXeAf2HqLEiJlNtmFWbXr3O7TMloznwaEOCKIx6Fy3a6t7SSxOrFJ5ZDlxrCKgec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770469306; c=relaxed/simple;
	bh=4ZgfQ+M7m+gwEbMTjHFImrLbn2dk076NnfcOHWdyMrY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LScac3cs3NEYvfF326Y4pXzjU9FxOIRqBQqovvXT2HwwYj0y5IWdFnktw2B2i4nwC2RuakBrD7t1sYEcxQNr5rnHS84xBvMXfuGu2QzLCQSNQeSiLUb2+8c+75Ij+CU+AJnbLefin+m7/tkbqZ860QjD5P5ZrfATNJCwawZQZ9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HJ6zBOUn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HJ6zBOUn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770469306; x=1802005306;
  h=date:from:to:cc:subject:message-id;
  bh=4ZgfQ+M7m+gwEbMTjHFImrLbn2dk076NnfcOHWdyMrY=;
  b=HJ6zBOUnnCKQkQbtVWpo6bugGLaHQ6bGLFzq4Dwh7l5NqNwHB0eur/4Z
   +EhWaag545Qbpp0BKs25K1+InxTF/RCoDCnUGpeIZtA3SXbhnxgetH6lW
   p68MzLzpcyeM3dD5Cyi2TeeHm/qPcVXCPzksL6s3TOYhcCqKTV9htXIej
   u/dTPWyr2EoMknyfxFZDcV31m7L8n9QbEM3ec/kbJIKsn+eLs89frjSNp
   qkeRMv+V8KRXKJczyxUvBxND+b5qokVwcs2ukjcNB7APf9MWW78kKlwVk
   B4JUidhiiZiBqQFV6AUSDkacB3AHO98og9zMPoIzRpNeiD+x2Zg7yxJru
   A==;
X-CSE-ConnectionGUID: CG1RnzxTQzuWO9pQTdXS3Q==
X-CSE-MsgGUID: t8B0Q0z0TDCPkzBkvOrhIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="59221872"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="59221872"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 05:01:45 -0800
X-CSE-ConnectionGUID: 2w1ixNJjR2O5kyRK9tRbUg==
X-CSE-MsgGUID: hBFGWkq9R9uahmRd6CSO7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="210397255"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Feb 2026 05:01:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vohwT-00000000leS-1vLZ;
	Sat, 07 Feb 2026 13:01:41 +0000
Date: Sat, 07 Feb 2026 21:00:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [agd5f:manual_gfxoff 2303/2318]
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:532
 amdgpu_gfx_mqd_symmetrically_map_cu_mask() error: buffer overflow
 'cu_info->bitmap' 8 <= 15
Message-ID: <202602072022.pCMtgC26-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Jesse.Zhang" <Jesse.Zhang@amd.com>
CC: Linux Infrastructure <z1.linuxinfra@amd.com>
CC: Jesse Zhang <jesse.zhang@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git manual_gfxoff
head:   03ec4547c9d0c96a84f2b08c6b348c3668722e0f
commit: c6c703a0deb836a67eae7c05a4ef05147bbba79f [2303/2318] drm/amdgpu: Add CU mask support for MQD properties
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: powerpc-randconfig-r071-20260207 (https://download.01.org/0day-ci/archive/20260207/202602072022.pCMtgC26-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602072022.pCMtgC26-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:532 amdgpu_gfx_mqd_symmetrically_map_cu_mask() error: buffer overflow 'cu_info->bitmap' 8 <= 15

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:134 amdgpu_gfx_parse_disable_cu() warn: potential spectre issue 'mask' [w]

vim +532 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c

d23ee13fba23a3 Rex Zhu     2018-07-30  505  
c6c703a0deb836 Jesse.Zhang 2026-01-23  506  void amdgpu_gfx_mqd_symmetrically_map_cu_mask(struct amdgpu_device *adev, const uint32_t *cu_mask,
c6c703a0deb836 Jesse.Zhang 2026-01-23  507  					      uint32_t cu_mask_count, uint32_t *se_mask)
c6c703a0deb836 Jesse.Zhang 2026-01-23  508  {
c6c703a0deb836 Jesse.Zhang 2026-01-23  509  	struct amdgpu_cu_info *cu_info = &adev->gfx.cu_info;
c6c703a0deb836 Jesse.Zhang 2026-01-23  510  	struct amdgpu_gfx_config *gfx_info = &adev->gfx.config;
c6c703a0deb836 Jesse.Zhang 2026-01-23  511  	uint32_t cu_per_sh[8][4] = {0};
c6c703a0deb836 Jesse.Zhang 2026-01-23  512  	int i, se, sh, cu, cu_bitmap_sh_mul;
c6c703a0deb836 Jesse.Zhang 2026-01-23  513  	int xcc_inst = ffs(adev->gfx.xcc_mask) - 1;
c6c703a0deb836 Jesse.Zhang 2026-01-23  514  	bool wgp_mode_req = amdgpu_ip_version(adev, GC_HWIP, 0) >= IP_VERSION(10, 0, 0);
c6c703a0deb836 Jesse.Zhang 2026-01-23  515  	int cu_inc = wgp_mode_req ? 2 : 1;
c6c703a0deb836 Jesse.Zhang 2026-01-23  516  	uint32_t en_mask = wgp_mode_req ? 0x3 : 0x1;
c6c703a0deb836 Jesse.Zhang 2026-01-23  517  	int num_xcc, inc, inst = 0;
c6c703a0deb836 Jesse.Zhang 2026-01-23  518  
c6c703a0deb836 Jesse.Zhang 2026-01-23  519  	if (xcc_inst < 0)
c6c703a0deb836 Jesse.Zhang 2026-01-23  520  		xcc_inst = 0;
c6c703a0deb836 Jesse.Zhang 2026-01-23  521  
c6c703a0deb836 Jesse.Zhang 2026-01-23  522  	num_xcc = hweight16(adev->gfx.xcc_mask);
c6c703a0deb836 Jesse.Zhang 2026-01-23  523  	if (!num_xcc)
c6c703a0deb836 Jesse.Zhang 2026-01-23  524  		num_xcc = 1;
c6c703a0deb836 Jesse.Zhang 2026-01-23  525  
c6c703a0deb836 Jesse.Zhang 2026-01-23  526  	inc = cu_inc * num_xcc;
c6c703a0deb836 Jesse.Zhang 2026-01-23  527  
c6c703a0deb836 Jesse.Zhang 2026-01-23  528  	cu_bitmap_sh_mul = 2;
c6c703a0deb836 Jesse.Zhang 2026-01-23  529  
c6c703a0deb836 Jesse.Zhang 2026-01-23  530  	for (se = 0; se < gfx_info->max_shader_engines; se++)
c6c703a0deb836 Jesse.Zhang 2026-01-23  531  		for (sh = 0; sh < gfx_info->max_sh_per_se; sh++)
c6c703a0deb836 Jesse.Zhang 2026-01-23 @532  			cu_per_sh[se][sh] = hweight32(
c6c703a0deb836 Jesse.Zhang 2026-01-23  533  				cu_info->bitmap[xcc_inst][se % 4][sh + (se / 4) *
c6c703a0deb836 Jesse.Zhang 2026-01-23  534  				cu_bitmap_sh_mul]);
c6c703a0deb836 Jesse.Zhang 2026-01-23  535  
c6c703a0deb836 Jesse.Zhang 2026-01-23  536  	for (i = 0; i < gfx_info->max_shader_engines; i++)
c6c703a0deb836 Jesse.Zhang 2026-01-23  537  		se_mask[i] = 0;
c6c703a0deb836 Jesse.Zhang 2026-01-23  538  
c6c703a0deb836 Jesse.Zhang 2026-01-23  539  	i = inst;
c6c703a0deb836 Jesse.Zhang 2026-01-23  540  	for (cu = 0; cu < 16; cu += cu_inc) {
c6c703a0deb836 Jesse.Zhang 2026-01-23  541  		for (sh = 0; sh < gfx_info->max_sh_per_se; sh++) {
c6c703a0deb836 Jesse.Zhang 2026-01-23  542  			for (se = 0; se < gfx_info->max_shader_engines; se++) {
c6c703a0deb836 Jesse.Zhang 2026-01-23  543  				if (cu_per_sh[se][sh] > cu) {
c6c703a0deb836 Jesse.Zhang 2026-01-23  544  					if ((i / 32) < cu_mask_count && (cu_mask[i / 32] & (1 << (i % 32))))
c6c703a0deb836 Jesse.Zhang 2026-01-23  545  						se_mask[se] |= en_mask << (cu + sh * 16);
c6c703a0deb836 Jesse.Zhang 2026-01-23  546  					i += inc;
c6c703a0deb836 Jesse.Zhang 2026-01-23  547  					if (i >= cu_mask_count * 32)
c6c703a0deb836 Jesse.Zhang 2026-01-23  548  						return;
c6c703a0deb836 Jesse.Zhang 2026-01-23  549  				}
c6c703a0deb836 Jesse.Zhang 2026-01-23  550  			}
c6c703a0deb836 Jesse.Zhang 2026-01-23  551  		}
c6c703a0deb836 Jesse.Zhang 2026-01-23  552  	}
c6c703a0deb836 Jesse.Zhang 2026-01-23  553  }
c6c703a0deb836 Jesse.Zhang 2026-01-23  554  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
