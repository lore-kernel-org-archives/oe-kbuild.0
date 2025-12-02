Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761A72D1F64
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 18:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764698502; cv=none; b=kzGqfGok1FiNM4wc7YfrTxK5spGRsntW/pRBzZyvyt+kf9kUjle3aoKXY1HvzZcWgX/JSVgzAwjfIYBxXZLbtT7NUhMHp7FwEvPwvh8Li1Sw4aS/bCk7t6tJBWZCSFfIyxG9SvC+Pv2R3BjAryZFyly9EUJPEu+dT5lizxCWJrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764698502; c=relaxed/simple;
	bh=SyptaBUKiBdkNCS4srWWa1vfr6iET1ajlGmR62Ktx+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mVS2EIJOQnB0j6mY0B9vLKC0RkbC3HQvDRRzKzPcVCWsuog5XZ4LhpCK5dBd0GzEhk0CHJ9BNhEX1Sdsh7ANVQiEN2mwluB+/fyxe6/XalbO7jGZbhhRCNL26qYyxkwkxoqNpkMcS6dJDDjMTDyeMslhUH0LkkYe0CAcLfO0+gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cpD0zsrT; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cpD0zsrT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764698500; x=1796234500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SyptaBUKiBdkNCS4srWWa1vfr6iET1ajlGmR62Ktx+U=;
  b=cpD0zsrTIgAHH1UwimybaEWdNfLDdGPy7uwlZDb8xXNtMeco9VosUEPb
   WWQlaI8EWc2cZ9nwlL9tPKGtvHSbC2wpWUNyxUiiOpRe4FoFJYBkFuunB
   hKsfY9+/P8rOAwpJ1s7Zzxno9S3BCe1NnLO3ySEAJAhhoABatRJRVH/Ei
   mwtziEq9OLy0AuYc6Snun/sk5SPIza11tR8UXtBvMRJqBj51eLhoKbBJu
   CstxdjyvJcdQjNxiQpUNNfZGfW3n1Rjl6BCcwufVIUkuObg5JMrvPpjbm
   aec6+4ZjNrjBrCeX4yfUFvn1dxZGhBP3OO2dmk1SrT2usYUNeCGLVdKDT
   Q==;
X-CSE-ConnectionGUID: 00+xrsLsTxmU1Y8o//sA+Q==
X-CSE-MsgGUID: f+X3l6EIRHaLlrF9rkciTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66635424"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="66635424"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 10:01:39 -0800
X-CSE-ConnectionGUID: hzEgNEJKT6WFIwLlXK9t2g==
X-CSE-MsgGUID: xG7u727wR12+NDw1/uG7uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="193548253"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 02 Dec 2025 10:01:37 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQUgx-000000002wj-2ve0;
	Tue, 02 Dec 2025 18:01:35 +0000
Date: Tue, 2 Dec 2025 19:01:15 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/i915/display/intel_color.c:3865:20: error: invalid
 use of undefined type 'struct drm_color_ctm_3x4'
Message-ID: <202512021955.KJmvBhUB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Uma-Shankar/drm-i915-display-Add-identifiers-for-driver-specific-blocks/20251201-150245, commit: 531d2c65d4e35c5aaa31efc318fa7de4771695a9"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Uma Shankar <uma.shankar@intel.com>
CC: 0day robot <lkp@intel.com>
CC: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Uma-Shankar/drm-i915-display-Add-identifiers-for-driver-specific-blocks/20251201-150245
head:   a475844eaf5f5246fea92d8289f2c8555f2c0c7e
commit: 531d2c65d4e35c5aaa31efc318fa7de4771695a9 drm/i915/color: Add plane CTM callback for D12 and beyond
date:   35 hours ago
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251202/202512021955.KJmvBhUB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021955.KJmvBhUB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021955.KJmvBhUB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_color.c:31:
   drivers/gpu/drm/i915/display/intel_display_types.h:1993:28: error: field 'base' has incomplete type
    1993 |         struct drm_colorop base;
         |                            ^~~~
   drivers/gpu/drm/i915/display/intel_color.c: In function 'xelpd_load_plane_csc_matrix':
>> drivers/gpu/drm/i915/display/intel_color.c:3865:20: error: invalid use of undefined type 'struct drm_color_ctm_3x4'
    3865 |         input = ctm->matrix;
         |                    ^~


vim +3865 drivers/gpu/drm/i915/display/intel_color.c

b4ab7aa848acaf Swati Sharma 2020-03-17  3846  
531d2c65d4e35c Uma Shankar  2025-12-01  3847  static void
531d2c65d4e35c Uma Shankar  2025-12-01  3848  xelpd_load_plane_csc_matrix(struct intel_dsb *dsb,
531d2c65d4e35c Uma Shankar  2025-12-01  3849  			    const struct intel_plane_state *plane_state)
531d2c65d4e35c Uma Shankar  2025-12-01  3850  {
531d2c65d4e35c Uma Shankar  2025-12-01  3851  	struct intel_display *display = to_intel_display(plane_state);
531d2c65d4e35c Uma Shankar  2025-12-01  3852  	const struct drm_plane_state *state = &plane_state->uapi;
531d2c65d4e35c Uma Shankar  2025-12-01  3853  	enum pipe pipe = to_intel_plane(state->plane)->pipe;
531d2c65d4e35c Uma Shankar  2025-12-01  3854  	enum plane_id plane = to_intel_plane(state->plane)->id;
531d2c65d4e35c Uma Shankar  2025-12-01  3855  	const struct drm_property_blob *blob = plane_state->hw.ctm;
531d2c65d4e35c Uma Shankar  2025-12-01  3856  	struct drm_color_ctm_3x4 *ctm;
531d2c65d4e35c Uma Shankar  2025-12-01  3857  	const u64 *input;
531d2c65d4e35c Uma Shankar  2025-12-01  3858  	u16 coeffs[9] = {};
531d2c65d4e35c Uma Shankar  2025-12-01  3859  	int i, j;
531d2c65d4e35c Uma Shankar  2025-12-01  3860  
531d2c65d4e35c Uma Shankar  2025-12-01  3861  	if (!icl_is_hdr_plane(display, plane) || !blob)
531d2c65d4e35c Uma Shankar  2025-12-01  3862  		return;
531d2c65d4e35c Uma Shankar  2025-12-01  3863  
531d2c65d4e35c Uma Shankar  2025-12-01  3864  	ctm = blob->data;
531d2c65d4e35c Uma Shankar  2025-12-01 @3865  	input = ctm->matrix;
531d2c65d4e35c Uma Shankar  2025-12-01  3866  
531d2c65d4e35c Uma Shankar  2025-12-01  3867  	/*
531d2c65d4e35c Uma Shankar  2025-12-01  3868  	 * Convert fixed point S31.32 input to format supported by the
531d2c65d4e35c Uma Shankar  2025-12-01  3869  	 * hardware.
531d2c65d4e35c Uma Shankar  2025-12-01  3870  	 */
531d2c65d4e35c Uma Shankar  2025-12-01  3871  	for (i = 0, j = 0; i < ARRAY_SIZE(coeffs); i++) {
531d2c65d4e35c Uma Shankar  2025-12-01  3872  		u64 abs_coeff = ((1ULL << 63) - 1) & input[j];
531d2c65d4e35c Uma Shankar  2025-12-01  3873  
531d2c65d4e35c Uma Shankar  2025-12-01  3874  		/*
531d2c65d4e35c Uma Shankar  2025-12-01  3875  		 * Clamp input value to min/max supported by
531d2c65d4e35c Uma Shankar  2025-12-01  3876  		 * hardware.
531d2c65d4e35c Uma Shankar  2025-12-01  3877  		 */
531d2c65d4e35c Uma Shankar  2025-12-01  3878  		abs_coeff = clamp_val(abs_coeff, 0, CTM_COEFF_4_0 - 1);
531d2c65d4e35c Uma Shankar  2025-12-01  3879  
531d2c65d4e35c Uma Shankar  2025-12-01  3880  		/* sign bit */
531d2c65d4e35c Uma Shankar  2025-12-01  3881  		if (CTM_COEFF_NEGATIVE(input[j]))
531d2c65d4e35c Uma Shankar  2025-12-01  3882  			coeffs[i] |= 1 << 15;
531d2c65d4e35c Uma Shankar  2025-12-01  3883  
531d2c65d4e35c Uma Shankar  2025-12-01  3884  		if (abs_coeff < CTM_COEFF_0_125)
531d2c65d4e35c Uma Shankar  2025-12-01  3885  			coeffs[i] |= (3 << 12) |
531d2c65d4e35c Uma Shankar  2025-12-01  3886  				      ILK_CSC_COEFF_FP(abs_coeff, 12);
531d2c65d4e35c Uma Shankar  2025-12-01  3887  		else if (abs_coeff < CTM_COEFF_0_25)
531d2c65d4e35c Uma Shankar  2025-12-01  3888  			coeffs[i] |= (2 << 12) |
531d2c65d4e35c Uma Shankar  2025-12-01  3889  				      ILK_CSC_COEFF_FP(abs_coeff, 11);
531d2c65d4e35c Uma Shankar  2025-12-01  3890  		else if (abs_coeff < CTM_COEFF_0_5)
531d2c65d4e35c Uma Shankar  2025-12-01  3891  			coeffs[i] |= (1 << 12) |
531d2c65d4e35c Uma Shankar  2025-12-01  3892  				      ILK_CSC_COEFF_FP(abs_coeff, 10);
531d2c65d4e35c Uma Shankar  2025-12-01  3893  		else if (abs_coeff < CTM_COEFF_1_0)
531d2c65d4e35c Uma Shankar  2025-12-01  3894  			coeffs[i] |= ILK_CSC_COEFF_FP(abs_coeff, 9);
531d2c65d4e35c Uma Shankar  2025-12-01  3895  		else if (abs_coeff < CTM_COEFF_2_0)
531d2c65d4e35c Uma Shankar  2025-12-01  3896  			coeffs[i] |= (7 << 12) |
531d2c65d4e35c Uma Shankar  2025-12-01  3897  				      ILK_CSC_COEFF_FP(abs_coeff, 8);
531d2c65d4e35c Uma Shankar  2025-12-01  3898  		else
531d2c65d4e35c Uma Shankar  2025-12-01  3899  			coeffs[i] |= (6 << 12) |
531d2c65d4e35c Uma Shankar  2025-12-01  3900  				      ILK_CSC_COEFF_FP(abs_coeff, 7);
531d2c65d4e35c Uma Shankar  2025-12-01  3901  
531d2c65d4e35c Uma Shankar  2025-12-01  3902  		/* Skip postoffs */
531d2c65d4e35c Uma Shankar  2025-12-01  3903  		if (!((j + 2) % 4))
531d2c65d4e35c Uma Shankar  2025-12-01  3904  			j += 2;
531d2c65d4e35c Uma Shankar  2025-12-01  3905  		else
531d2c65d4e35c Uma Shankar  2025-12-01  3906  			j++;
531d2c65d4e35c Uma Shankar  2025-12-01  3907  	}
531d2c65d4e35c Uma Shankar  2025-12-01  3908  
531d2c65d4e35c Uma Shankar  2025-12-01  3909  	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 0),
531d2c65d4e35c Uma Shankar  2025-12-01  3910  			   coeffs[0] << 16 | coeffs[1]);
531d2c65d4e35c Uma Shankar  2025-12-01  3911  	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 1),
531d2c65d4e35c Uma Shankar  2025-12-01  3912  			   coeffs[2] << 16);
531d2c65d4e35c Uma Shankar  2025-12-01  3913  
531d2c65d4e35c Uma Shankar  2025-12-01  3914  	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 2),
531d2c65d4e35c Uma Shankar  2025-12-01  3915  			   coeffs[3] << 16 | coeffs[4]);
531d2c65d4e35c Uma Shankar  2025-12-01  3916  	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 3),
531d2c65d4e35c Uma Shankar  2025-12-01  3917  			   coeffs[5] << 16);
531d2c65d4e35c Uma Shankar  2025-12-01  3918  
531d2c65d4e35c Uma Shankar  2025-12-01  3919  	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 4),
531d2c65d4e35c Uma Shankar  2025-12-01  3920  			   coeffs[6] << 16 | coeffs[7]);
531d2c65d4e35c Uma Shankar  2025-12-01  3921  	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 5),
531d2c65d4e35c Uma Shankar  2025-12-01  3922  			   coeffs[8] << 16);
531d2c65d4e35c Uma Shankar  2025-12-01  3923  
531d2c65d4e35c Uma Shankar  2025-12-01  3924  	intel_de_write_dsb(display, dsb, PLANE_CSC_PREOFF(pipe, plane, 0), 0);
531d2c65d4e35c Uma Shankar  2025-12-01  3925  	intel_de_write_dsb(display, dsb, PLANE_CSC_PREOFF(pipe, plane, 1), 0);
531d2c65d4e35c Uma Shankar  2025-12-01  3926  	intel_de_write_dsb(display, dsb, PLANE_CSC_PREOFF(pipe, plane, 2), 0);
531d2c65d4e35c Uma Shankar  2025-12-01  3927  
531d2c65d4e35c Uma Shankar  2025-12-01  3928  	/*
531d2c65d4e35c Uma Shankar  2025-12-01  3929  	 * Conversion from S31.32 to S0.12. BIT[12] is the signed bit
531d2c65d4e35c Uma Shankar  2025-12-01  3930  	 */
531d2c65d4e35c Uma Shankar  2025-12-01  3931  	intel_de_write_dsb(display, dsb,
531d2c65d4e35c Uma Shankar  2025-12-01  3932  			   PLANE_CSC_POSTOFF(pipe, plane, 0),
531d2c65d4e35c Uma Shankar  2025-12-01  3933  			   ctm_to_twos_complement(input[3], 0, 12));
531d2c65d4e35c Uma Shankar  2025-12-01  3934  	intel_de_write_dsb(display, dsb,
531d2c65d4e35c Uma Shankar  2025-12-01  3935  			   PLANE_CSC_POSTOFF(pipe, plane, 1),
531d2c65d4e35c Uma Shankar  2025-12-01  3936  			   ctm_to_twos_complement(input[7], 0, 12));
531d2c65d4e35c Uma Shankar  2025-12-01  3937  	intel_de_write_dsb(display, dsb,
531d2c65d4e35c Uma Shankar  2025-12-01  3938  			   PLANE_CSC_POSTOFF(pipe, plane, 2),
531d2c65d4e35c Uma Shankar  2025-12-01  3939  			   ctm_to_twos_complement(input[11], 0, 12));
531d2c65d4e35c Uma Shankar  2025-12-01  3940  }
531d2c65d4e35c Uma Shankar  2025-12-01  3941  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
