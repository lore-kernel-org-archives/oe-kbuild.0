Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E882773F
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 13:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764683140; cv=none; b=Pi49ZP3BrK/7ZJ+FLbh6XG0O1dufn/loM08nj34b/Pe10k079+y3n11gJEF3naG/NnnciLbmoIcJwdu4nUP0tLad7Fl+T0X7a8aCF6/lL2M2TWz4TNyYRd7bL8tnw5EXcaPyR2m61PFB0t8OkNNFtQvJiKgJTi/vdA097AbDs1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764683140; c=relaxed/simple;
	bh=9NnawfeOT83xSVPu+j7y6juipYXJAY8WWagCpJkwFkE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S4TJHQmHIsthGqOZkFdyssJU7WPGy85x95aqg7KgAThgFhULJ6nM2sfG7gORmpkk9/bc5Dz2dodm12iHHs1vA18/d8Wj3vNcHXyJjSeYloDnsQ6SIfAyOB4w++7juYTdsNUcckqNOi3+baSITP9yyyRFB0mOsxcyIzm0cfIHr7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AMRNEqI7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AMRNEqI7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764683137; x=1796219137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9NnawfeOT83xSVPu+j7y6juipYXJAY8WWagCpJkwFkE=;
  b=AMRNEqI70tRmvWHn3XPjTDlsUpeb1S0X7hE3K1UmkKb+r2QIlo6OyzAQ
   O8G1P+KHeAzVmz7CWlUYBaScqTlL3Y8yA02CTl7CjIJZs+qqWY9mLePbK
   yark2AwMkTqejP7eo4izHdNF8sjHQHZKJ7nDovnBzr6cnKu3oxRzO8s0L
   82J8dePWeIcusJ6eQ7U3zR2OP5Zjs1XpEA92DXMzZI60U/M1n/VuSiSck
   e/kzdZxyGfi8r38yHYHPNqJgOoMfdkEilPLwETbWIhpMvb4drvakvQTsk
   yJ/aBmOR4KnPRH5UzCvt18sFj1XQj5QEFB6+iOxq1vvs+81qKmQSteYEj
   A==;
X-CSE-ConnectionGUID: 9Sl1sxGuQiulx+4B/gojXg==
X-CSE-MsgGUID: w9V4XGmNSsWMDpEkRfGgyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66536478"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="66536478"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 05:45:37 -0800
X-CSE-ConnectionGUID: ImYUfqnCRj6kEqKQgJqdDQ==
X-CSE-MsgGUID: L1fT6xFkQ8OxZxNfLo1twg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="199504302"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 02 Dec 2025 05:45:36 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQQhB-000000002sz-13th;
	Tue, 02 Dec 2025 13:45:33 +0000
Date: Tue, 2 Dec 2025 14:44:45 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/i915/display/intel_color_pipeline.c:25:15: error:
 implicit declaration of function 'drm_plane_colorop_curve_1d_lut_init'
Message-ID: <202512021416.Me56fJgJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Uma-Shankar/drm-i915-display-Add-identifiers-for-driver-specific-blocks/20251201-150245, commit: 40b8c00fae913da914fa3fed50bb61c62bcd2705"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
CC: 0day robot <lkp@intel.com>
CC: Uma Shankar <uma.shankar@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Uma-Shankar/drm-i915-display-Add-identifiers-for-driver-specific-blocks/20251201-150245
head:   a475844eaf5f5246fea92d8289f2c8555f2c0c7e
commit: 40b8c00fae913da914fa3fed50bb61c62bcd2705 drm/i915/color: Create a transfer function color pipeline
date:   30 hours ago
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251202/202512021416.Me56fJgJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021416.Me56fJgJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021416.Me56fJgJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_colorop.h:9,
                    from drivers/gpu/drm/i915/display/intel_color_pipeline.c:5:
   drivers/gpu/drm/i915/display/intel_display_types.h:1989:28: error: field 'base' has incomplete type
    1989 |         struct drm_colorop base;
         |                            ^~~~
   drivers/gpu/drm/i915/display/intel_color_pipeline.c: In function '_intel_color_pipeline_plane_init':
>> drivers/gpu/drm/i915/display/intel_color_pipeline.c:25:15: error: implicit declaration of function 'drm_plane_colorop_curve_1d_lut_init' [-Wimplicit-function-declaration]
      25 |         ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_color_pipeline.c:27:51: error: 'DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR' undeclared (first use in this function)
      27 |                                                   DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_color_pipeline.c:27:51: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/gpu/drm/i915/display/intel_color_pipeline.c:28:51: error: 'DRM_COLOROP_FLAG_ALLOW_BYPASS' undeclared (first use in this function)
      28 |                                                   DRM_COLOROP_FLAG_ALLOW_BYPASS);
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_color_pipeline.c:40:15: error: implicit declaration of function 'drm_plane_colorop_ctm_3x4_init' [-Wimplicit-function-declaration]
      40 |         ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_color_pipeline.c:45:9: error: implicit declaration of function 'drm_colorop_set_next_property'; did you mean 'drm_connector_set_tile_property'? [-Wimplicit-function-declaration]
      45 |         drm_colorop_set_next_property(prev_op, &colorop->base);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         drm_connector_set_tile_property
   drivers/gpu/drm/i915/display/intel_color_pipeline.c: In function 'intel_color_pipeline_plane_init':
>> drivers/gpu/drm/i915/display/intel_color_pipeline.c:92:16: error: 'struct drm_plane' has no member named 'color_pipeline_property'; did you mean 'color_encoding_property'?
      92 |         plane->color_pipeline_property = prop;
         |                ^~~~~~~~~~~~~~~~~~~~~~~
         |                color_encoding_property


vim +/drm_plane_colorop_curve_1d_lut_init +25 drivers/gpu/drm/i915/display/intel_color_pipeline.c

40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  14  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  15  static
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  16  int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_enum_list *list)
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  17  {
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  18  	struct intel_colorop *colorop;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  19  	struct drm_device *dev = plane->dev;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  20  	int ret;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  21  	struct drm_colorop *prev_op;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  22  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  23  	colorop = intel_colorop_create(INTEL_PLANE_CB_PRE_CSC_LUT);
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  24  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01 @25  	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  26  						  PLANE_DEGAMMA_SIZE,
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01 @27  						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01 @28  						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  29  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  30  	if (ret)
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  31  		return ret;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  32  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  33  	list->type = colorop->base.base.id;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  34  	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", colorop->base.base.id);
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  35  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  36  	/* TODO: handle failures and clean up */
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  37  	prev_op = &colorop->base;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  38  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  39  	colorop = intel_colorop_create(INTEL_PLANE_CB_CSC);
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01 @40  	ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  41  					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  42  	if (ret)
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  43  		return ret;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  44  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01 @45  	drm_colorop_set_next_property(prev_op, &colorop->base);
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  46  	prev_op = &colorop->base;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  47  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  48  	colorop = intel_colorop_create(INTEL_PLANE_CB_POST_CSC_LUT);
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  49  	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  50  						  PLANE_GAMMA_SIZE,
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  51  						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  52  						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  53  	if (ret)
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  54  		return ret;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  55  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  56  	drm_colorop_set_next_property(prev_op, &colorop->base);
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  57  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  58  	return 0;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  59  }
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  60  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  61  int intel_color_pipeline_plane_init(struct drm_plane *plane)
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  62  {
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  63  	struct drm_device *dev = plane->dev;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  64  	struct intel_display *display = to_intel_display(dev);
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  65  	struct drm_property *prop;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  66  	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  67  	int len = 0;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  68  	int ret;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  69  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  70  	/* Currently expose pipeline only for HDR planes */
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  71  	if (!icl_is_hdr_plane(display, to_intel_plane(plane)->id))
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  72  		return 0;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  73  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  74  	/* Add "Bypass" (i.e. NULL) pipeline */
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  75  	pipelines[len].type = 0;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  76  	pipelines[len].name = "Bypass";
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  77  	len++;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  78  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  79  	/* Add pipeline consisting of transfer functions */
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  80  	ret = _intel_color_pipeline_plane_init(plane, &pipelines[len]);
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  81  	if (ret)
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  82  		return ret;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  83  	len++;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  84  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  85  	/* Create COLOR_PIPELINE property and attach */
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  86  	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC,
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  87  					"COLOR_PIPELINE",
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  88  					pipelines, len);
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  89  	if (!prop)
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  90  		return -ENOMEM;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  91  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01 @92  	plane->color_pipeline_property = prop;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
