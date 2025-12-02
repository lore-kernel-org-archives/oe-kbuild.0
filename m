Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2154728F948
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 20:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764705761; cv=none; b=FFdDna39EWrlX9DfHg3noRwyL7tNqjE3d+KPkdvd8Y8eKRAwMNp05MYKnnV2jk0ZD6/XI5VMRjN9z3j1Kh+DRQJekSj/UwDHmjjYBYZNqSBhhUPjqEOuMLeI5TcNF9PsPnPTVF+l/rFdkQ/iIDpOzUUUvFqgUkSh4onOl5bRux8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764705761; c=relaxed/simple;
	bh=PQOICqmOL7MWpUo4WRLFA62hnhoLVpa1d66n3oT++vY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kcgLnphTGcnMzwhRr+Z2BvnZ253/4CPFhAydTMDlhrtkAqZKD5Xvk2pRrnYRNPvSt+n5VcO+yoeI2+3TizRaoKAhyi+MDB7BcGr43BjLQCLx+nZdfa7yNtNlMD5gOeByPIw2DlimAK9yMKa9r5BN4rBcDiisoc4g3WJ7VDXL/nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bHq0UVSY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bHq0UVSY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764705760; x=1796241760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PQOICqmOL7MWpUo4WRLFA62hnhoLVpa1d66n3oT++vY=;
  b=bHq0UVSYy2ACICa3zPPWc6l9ScYNE4bGPlYWAYyZRqcMLFe1TgRFAwup
   +2r/31lJp43KxNHtYgnjt1ZCRJIi4Z7pFnvvLPtSVsg2DTiwxvGOWr/Ha
   r6vXqB++rSHM/ytV8noJHYaX0JNmopaCVMAz2e5dGO/SDxBgaWxv1V2ZX
   b3Fm+MxohwU9Jc8Xn5AcyIKuE8B2CjCneSxbfFGhDrdummv4JLwUcTK0I
   ISvVUYNigzvhcw5v96fvN5V1UrkMiPNN55qGpJXc/aQXJ/xxX2g66sMHK
   gdOhghH0qdhwPly0sLYZoc7CKOutsd+lDqgXqgf+BSSzRja9oSbtrBpf0
   A==;
X-CSE-ConnectionGUID: v4kjbmuISc2KzZGmkBZmKQ==
X-CSE-MsgGUID: Fih6O5NAQuaV0hhGn2Uh9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70539396"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="70539396"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 12:02:40 -0800
X-CSE-ConnectionGUID: D7J0++xpRZ6MnkLcWO1CNA==
X-CSE-MsgGUID: dMOleiVoSCuIErZK/0B5+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="195268217"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 02 Dec 2025 12:02:39 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQWa4-000000002xl-1qog;
	Tue, 02 Dec 2025 20:02:36 +0000
Date: Tue, 2 Dec 2025 21:01:47 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/i915/display/intel_color.c:3966:47: error: implicit
 declaration of function 'drm_color_lut32_extract'; did you mean
 'drm_color_lut_extract'?
Message-ID: <202512022117.hWNdILOG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Uma-Shankar/drm-i915-display-Add-identifiers-for-driver-specific-blocks/20251201-150245, commit: 560aac84e09db2e0d1f762c53f406e8c096cf0f2"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Uma Shankar <uma.shankar@intel.com>
CC: 0day robot <lkp@intel.com>
CC: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Uma-Shankar/drm-i915-display-Add-identifiers-for-driver-specific-blocks/20251201-150245
head:   a475844eaf5f5246fea92d8289f2c8555f2c0c7e
commit: 560aac84e09db2e0d1f762c53f406e8c096cf0f2 drm/i915/color: Program Pre-CSC registers
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251202/202512022117.hWNdILOG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512022117.hWNdILOG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512022117.hWNdILOG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_color.c:31:
   drivers/gpu/drm/i915/display/intel_display_types.h:1993:28: error: field 'base' has incomplete type
    1993 |         struct drm_colorop base;
         |                            ^~~~
   drivers/gpu/drm/i915/display/intel_color.c: In function 'xelpd_load_plane_csc_matrix':
   drivers/gpu/drm/i915/display/intel_color.c:3869:20: error: invalid use of undefined type 'struct drm_color_ctm_3x4'
    3869 |         input = ctm->matrix;
         |                    ^~
   drivers/gpu/drm/i915/display/intel_color.c: In function 'xelpd_program_plane_pre_csc_lut':
>> drivers/gpu/drm/i915/display/intel_color.c:3966:47: error: implicit declaration of function 'drm_color_lut32_extract'; did you mean 'drm_color_lut_extract'? [-Wimplicit-function-declaration]
    3966 |                                 u32 lut_val = drm_color_lut32_extract(pre_csc_lut[i].green, 24);
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~
         |                                               drm_color_lut_extract
>> drivers/gpu/drm/i915/display/intel_color.c:3966:82: error: invalid use of undefined type 'struct drm_color_lut32'
    3966 |                                 u32 lut_val = drm_color_lut32_extract(pre_csc_lut[i].green, 24);
         |                                                                                  ^
>> drivers/gpu/drm/i915/display/intel_color.c:3966:85: error: invalid use of undefined type 'const struct drm_color_lut32'
    3966 |                                 u32 lut_val = drm_color_lut32_extract(pre_csc_lut[i].green, 24);
         |                                                                                     ^


vim +3966 drivers/gpu/drm/i915/display/intel_color.c

531d2c65d4e35c Uma Shankar 2025-12-01  3945  
560aac84e09db2 Uma Shankar 2025-12-01  3946  static void
560aac84e09db2 Uma Shankar 2025-12-01  3947  xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
560aac84e09db2 Uma Shankar 2025-12-01  3948  				const struct intel_plane_state *plane_state)
560aac84e09db2 Uma Shankar 2025-12-01  3949  {
560aac84e09db2 Uma Shankar 2025-12-01  3950  	struct intel_display *display = to_intel_display(plane_state);
560aac84e09db2 Uma Shankar 2025-12-01  3951  	const struct drm_plane_state *state = &plane_state->uapi;
560aac84e09db2 Uma Shankar 2025-12-01  3952  	enum pipe pipe = to_intel_plane(state->plane)->pipe;
560aac84e09db2 Uma Shankar 2025-12-01  3953  	enum plane_id plane = to_intel_plane(state->plane)->id;
560aac84e09db2 Uma Shankar 2025-12-01  3954  	const struct drm_color_lut32 *pre_csc_lut = plane_state->hw.degamma_lut->data;
560aac84e09db2 Uma Shankar 2025-12-01  3955  	u32 i, lut_size;
560aac84e09db2 Uma Shankar 2025-12-01  3956  
560aac84e09db2 Uma Shankar 2025-12-01  3957  	if (icl_is_hdr_plane(display, plane)) {
560aac84e09db2 Uma Shankar 2025-12-01  3958  		lut_size = 128;
560aac84e09db2 Uma Shankar 2025-12-01  3959  
560aac84e09db2 Uma Shankar 2025-12-01  3960  		intel_de_write_dsb(display, dsb,
560aac84e09db2 Uma Shankar 2025-12-01  3961  				   PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0),
560aac84e09db2 Uma Shankar 2025-12-01  3962  				   PLANE_PAL_PREC_AUTO_INCREMENT);
560aac84e09db2 Uma Shankar 2025-12-01  3963  
560aac84e09db2 Uma Shankar 2025-12-01  3964  		if (pre_csc_lut) {
560aac84e09db2 Uma Shankar 2025-12-01  3965  			for (i = 0; i < lut_size; i++) {
560aac84e09db2 Uma Shankar 2025-12-01 @3966  				u32 lut_val = drm_color_lut32_extract(pre_csc_lut[i].green, 24);
560aac84e09db2 Uma Shankar 2025-12-01  3967  
560aac84e09db2 Uma Shankar 2025-12-01  3968  				intel_de_write_dsb(display, dsb,
560aac84e09db2 Uma Shankar 2025-12-01  3969  						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
560aac84e09db2 Uma Shankar 2025-12-01  3970  						   lut_val);
560aac84e09db2 Uma Shankar 2025-12-01  3971  			}
560aac84e09db2 Uma Shankar 2025-12-01  3972  
560aac84e09db2 Uma Shankar 2025-12-01  3973  			/* Program the max register to clamp values > 1.0. */
560aac84e09db2 Uma Shankar 2025-12-01  3974  			/* TODO: Restrict to 0x7ffffff */
560aac84e09db2 Uma Shankar 2025-12-01  3975  			do {
560aac84e09db2 Uma Shankar 2025-12-01  3976  				intel_de_write_dsb(display, dsb,
560aac84e09db2 Uma Shankar 2025-12-01  3977  						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
560aac84e09db2 Uma Shankar 2025-12-01  3978  						   (1 << 24));
560aac84e09db2 Uma Shankar 2025-12-01  3979  			} while (i++ > 130);
560aac84e09db2 Uma Shankar 2025-12-01  3980  		} else {
560aac84e09db2 Uma Shankar 2025-12-01  3981  			for (i = 0; i < lut_size; i++) {
560aac84e09db2 Uma Shankar 2025-12-01  3982  				u32 v = (i * ((1 << 24) - 1)) / (lut_size - 1);
560aac84e09db2 Uma Shankar 2025-12-01  3983  
560aac84e09db2 Uma Shankar 2025-12-01  3984  				intel_de_write_dsb(display, dsb,
560aac84e09db2 Uma Shankar 2025-12-01  3985  						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0), v);
560aac84e09db2 Uma Shankar 2025-12-01  3986  			}
560aac84e09db2 Uma Shankar 2025-12-01  3987  
560aac84e09db2 Uma Shankar 2025-12-01  3988  			do {
560aac84e09db2 Uma Shankar 2025-12-01  3989  				intel_de_write_dsb(display, dsb,
560aac84e09db2 Uma Shankar 2025-12-01  3990  						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
560aac84e09db2 Uma Shankar 2025-12-01  3991  						   1 << 24);
560aac84e09db2 Uma Shankar 2025-12-01  3992  			} while (i++ < 130);
560aac84e09db2 Uma Shankar 2025-12-01  3993  		}
560aac84e09db2 Uma Shankar 2025-12-01  3994  
560aac84e09db2 Uma Shankar 2025-12-01  3995  		intel_de_write_dsb(display, dsb, PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
560aac84e09db2 Uma Shankar 2025-12-01  3996  	}
560aac84e09db2 Uma Shankar 2025-12-01  3997  }
560aac84e09db2 Uma Shankar 2025-12-01  3998  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
