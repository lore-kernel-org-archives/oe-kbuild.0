Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FA319D088
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Sep 2024 08:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726388201; cv=none; b=Es8MX4QMyTk3t0+OOD6M8v4xRP4ttao2SCILGJ6MRzeLSQLSotElb339IyELxExtrfD0D1TNbn+lz9fzXBq8j6eDJoDTP9empstm5MUXGoKtB+X7k5eNWrkZp4Ej26HCu/o6QR/5DZxWTxtom1taUdk5fMnM7i5I7ycsk6vQE+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726388201; c=relaxed/simple;
	bh=yWU9RwPvlAmVl56GwRKAWWtpr3VP5ova0aRUPRkVDYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jsnnGc0sda8tvGYOyaLHE/rCqAPvz4y7vQwZEvXZqtzevX5J0uHfEN8Ne4OdbM8fblx1hg5QFK/UsLMNUL6KGR3QN+ALrQEfIfLdl1IrElim8QrpP6DjncmDKybfkXxIqD9kNgofnWPh0jgLf+wrWAJ596Hz3X/MPnM5UYvJnBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b/3KjRx7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b/3KjRx7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726388199; x=1757924199;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yWU9RwPvlAmVl56GwRKAWWtpr3VP5ova0aRUPRkVDYQ=;
  b=b/3KjRx7xRicjboweP7FxTPBlvO6mUuzzzr1c/BnODglLU1kcLX7CiKH
   Hh3y92LcsiYOglw1I3d+pU+uXnjwCwmCHHFdzNmuZozFqyciLN/VrdKfK
   BA9YBKS/41RhgO5llGDE3dSIX2sj92yJuVHRQso/cbvh/wxwwaxVmiwwa
   AKI/YzX6gKT6QWAZBD+eL0XmDMhw3JriWhxj2Xk9uLzhIV9Oc9YFE7HMn
   uEwp9J4NfgZhEko/ZtrEavSmeg3uORn9HSuEf+NYhlrW/3+CZWwrThYQS
   C0YcrlZu2rVQDE/RSjy2atD52NaR7crF+GZNBuOgOX1Nrv+2fKnNzcT0X
   Q==;
X-CSE-ConnectionGUID: 7XaEkxsGTaWV+8VQkS9gUA==
X-CSE-MsgGUID: eR/T/Qh3R3CRnoC3oVQgEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="50659663"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="50659663"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 01:16:38 -0700
X-CSE-ConnectionGUID: 0FIgvRvfTTKbKzBryt9nlg==
X-CSE-MsgGUID: hEcE+LJ0RmaynV4pFZmBGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="69345343"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Sep 2024 01:16:36 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spkQs-0008WK-1h;
	Sun, 15 Sep 2024 08:16:34 +0000
Date: Sun, 15 Sep 2024 16:15:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] drm/i915/display: Workaround for odd panning for planar
 yuv
Message-ID: <202409151558.ETIW5UMU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240910143619.143514-1-nemesa.garg@intel.com>
References: <20240910143619.143514-1-nemesa.garg@intel.com>
TO: Nemesa Garg <nemesa.garg@intel.com>
TO: intel-gfx@lists.freedesktop.org
CC: Nemesa Garg <nemesa.garg@intel.com>

Hi Nemesa,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.11-rc7 next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nemesa-Garg/drm-i915-display-Workaround-for-odd-panning-for-planar-yuv/20240910-223820
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240910143619.143514-1-nemesa.garg%40intel.com
patch subject: [PATCH] drm/i915/display: Workaround for odd panning for planar yuv
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-161-20240915 (https://download.01.org/0day-ci/archive/20240915/202409151558.ETIW5UMU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409151558.ETIW5UMU-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/display/intel_atomic_plane.c:1045 intel_plane_check_src_coordinates() error: uninitialized symbol 'hsub'.

Old smatch warnings:
drivers/gpu/drm/i915/display/intel_atomic_plane.c:660 intel_plane_atomic_check_with_state() error: we previously assumed 'fb' could be null (see line 648)
drivers/gpu/drm/i915/display/intel_atomic_plane.c:1047 intel_plane_check_src_coordinates() error: uninitialized symbol 'hsub'.

vim +/hsub +1045 drivers/gpu/drm/i915/display/intel_atomic_plane.c

9f05a7c0adb9ee Maarten Lankhorst   2020-11-17   990  
0ec2a5b291af32 Ville Syrjälä       2023-03-14   991  int intel_plane_check_src_coordinates(struct intel_plane_state *plane_state)
0ec2a5b291af32 Ville Syrjälä       2023-03-14   992  {
0ec2a5b291af32 Ville Syrjälä       2023-03-14   993  	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
0ec2a5b291af32 Ville Syrjälä       2023-03-14   994  	const struct drm_framebuffer *fb = plane_state->hw.fb;
0ec2a5b291af32 Ville Syrjälä       2023-03-14   995  	struct drm_rect *src = &plane_state->uapi.src;
0ec2a5b291af32 Ville Syrjälä       2023-03-14   996  	u32 src_x, src_y, src_w, src_h, hsub, vsub;
0ec2a5b291af32 Ville Syrjälä       2023-03-14   997  	bool rotated = drm_rotation_90_or_270(plane_state->hw.rotation);
0ec2a5b291af32 Ville Syrjälä       2023-03-14   998  
0ec2a5b291af32 Ville Syrjälä       2023-03-14   999  	/*
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1000  	 * FIXME hsub/vsub vs. block size is a mess. Pre-tgl CCS
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1001  	 * abuses hsub/vsub so we can't use them here. But as they
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1002  	 * are limited to 32bpp RGB formats we don't actually need
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1003  	 * to check anything.
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1004  	 */
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1005  	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_CCS ||
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1006  	    fb->modifier == I915_FORMAT_MOD_Yf_TILED_CCS)
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1007  		return 0;
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1008  
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1009  	/*
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1010  	 * Hardware doesn't handle subpixel coordinates.
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1011  	 * Adjust to (macro)pixel boundary, but be careful not to
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1012  	 * increase the source viewport size, because that could
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1013  	 * push the downscaling factor out of bounds.
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1014  	 */
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1015  	src_x = src->x1 >> 16;
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1016  	src_w = drm_rect_width(src) >> 16;
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1017  	src_y = src->y1 >> 16;
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1018  	src_h = drm_rect_height(src) >> 16;
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1019  
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1020  	drm_rect_init(src, src_x << 16, src_y << 16,
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1021  		      src_w << 16, src_h << 16);
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1022  
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1023  	if (fb->format->format == DRM_FORMAT_RGB565 && rotated) {
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1024  		hsub = 2;
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1025  		vsub = 2;
533a7836d39f1a Juha-Pekka Heikkilä 2023-09-19  1026  	} else if (DISPLAY_VER(i915) >= 20 &&
533a7836d39f1a Juha-Pekka Heikkilä 2023-09-19  1027  		   intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier)) {
533a7836d39f1a Juha-Pekka Heikkilä 2023-09-19  1028  		/*
533a7836d39f1a Juha-Pekka Heikkilä 2023-09-19  1029  		 * This allows NV12 and P0xx formats to have odd size and/or odd
533a7836d39f1a Juha-Pekka Heikkilä 2023-09-19  1030  		 * source coordinates on DISPLAY_VER(i915) >= 20
533a7836d39f1a Juha-Pekka Heikkilä 2023-09-19  1031  		 */
533a7836d39f1a Juha-Pekka Heikkilä 2023-09-19  1032  		vsub = 1;
68f459ad919373 Nemesa Garg         2024-09-10  1033  		/*
68f459ad919373 Nemesa Garg         2024-09-10  1034  		 * Wa_16023981245 for display version 20.
68f459ad919373 Nemesa Garg         2024-09-10  1035  		 * Do not support odd x-panning for NV12.
68f459ad919373 Nemesa Garg         2024-09-10  1036  		 */
68f459ad919373 Nemesa Garg         2024-09-10  1037  		if (IS_LUNARLAKE(i915) && fb->format->format != DRM_FORMAT_NV12)
68f459ad919373 Nemesa Garg         2024-09-10  1038  			hsub = 1;
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1039  	} else {
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1040  		hsub = fb->format->hsub;
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1041  		vsub = fb->format->vsub;
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1042  	}
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1043  
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1044  	if (rotated)
0ec2a5b291af32 Ville Syrjälä       2023-03-14 @1045  		hsub = vsub = max(hsub, vsub);
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1046  
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1047  	if (src_x % hsub || src_w % hsub) {
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1048  		drm_dbg_kms(&i915->drm, "src x/w (%u, %u) must be a multiple of %u (rotated: %s)\n",
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1049  			    src_x, src_w, hsub, str_yes_no(rotated));
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1050  		return -EINVAL;
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1051  	}
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1052  
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1053  	if (src_y % vsub || src_h % vsub) {
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1054  		drm_dbg_kms(&i915->drm, "src y/h (%u, %u) must be a multiple of %u (rotated: %s)\n",
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1055  			    src_y, src_h, vsub, str_yes_no(rotated));
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1056  		return -EINVAL;
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1057  	}
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1058  
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1059  	return 0;
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1060  }
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1061  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
