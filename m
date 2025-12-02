Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841DE200C2
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 23:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764717583; cv=none; b=qFyOolPDmnW6ZkoUzSn+EwxwHkbv4MY6u7FsPl6fhSxGkgx2oEs0xvKhcA3kLTSKkhMi915bdTiF3G1YTy7VFpHqTt/Gx9wYdVJ4BH/i+vCKHgxPzxtJNUFOGBXvN1IIzFlA6/HEt+e4wezeN5LH3ZtkcZ5SSdLB/ALXi0jnMPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764717583; c=relaxed/simple;
	bh=ZJWVQ2P/5aJAH2n4sJs66kbHt4sioka45rRpVvdypDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eTOtR4i/k9lD/kaqQy2hKfw9/5t2ktL3Asjv8+ATAN2oEVG9OWlvfx3sMUrvGClO4rgfqmm2jCX6cTJX0rcA/UE6YTA/TltV+dFW9RoousxoD4LkxtHrgyDz1z3aD4sYjB2u6FJVg11epC9hT0bW/LlUj1phnI+hl8Y5dm333sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WQtT/1p0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WQtT/1p0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764717581; x=1796253581;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZJWVQ2P/5aJAH2n4sJs66kbHt4sioka45rRpVvdypDc=;
  b=WQtT/1p0jqe4KfRqTN3CZXKA0ottrg51vGxolRCmOaoF7a4sdK2uqtbz
   5zzFjWDQXq/I2ozEXDIW+0n+1YAXZOu1M3iqlC0Bzxe5X6bK+omWVXuW9
   oIlPZMRIL5xmNxK/gVDc6+cSQi4Y+ymlXsH+6E75egD7vsYQk2qiiM4SY
   CVH9bPy7G2qctxiwarj853EF95Z1kjiprHfAuv1rscY3ujr++t2CErCSo
   at48ta8LL1AmOjn8MaLN+KDHvGC/p9GXB6RMvia4zFCGe125GKf6VyiUp
   Wj/kqWWGJy80UrugXCu7ELSpDpSPSBduHbVrGYU3zaIP+a3g9u63bNwVH
   A==;
X-CSE-ConnectionGUID: b4hS5KcXQOiU31snwEND5Q==
X-CSE-MsgGUID: fyoeK99NQPKYXZs1khoT/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66592917"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="66592917"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 15:19:41 -0800
X-CSE-ConnectionGUID: JrjFCN0cTdmj6i6Domn66Q==
X-CSE-MsgGUID: Jr0RlunKTNmBKOKKoROFxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="199458980"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 02 Dec 2025 15:19:40 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQZej-000000002zh-3z8A;
	Tue, 02 Dec 2025 23:19:37 +0000
Date: Wed, 3 Dec 2025 00:18:40 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/i915/display/skl_universal_plane.c:1288:21: error:
 implicit declaration of function 'drm_color_lut32_size'; did you mean
 'drm_color_lut_size'?
Message-ID: <202512030005.UiqaQB5p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Uma-Shankar/drm-i915-display-Add-identifiers-for-driver-specific-blocks/20251201-150245, commit: a475844eaf5f5246fea92d8289f2c8555f2c0c7e"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Uma Shankar <uma.shankar@intel.com>
CC: 0day robot <lkp@intel.com>
CC: Suraj Kandpal <suraj.kandpal@intel.com>
CC: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Uma-Shankar/drm-i915-display-Add-identifiers-for-driver-specific-blocks/20251201-150245
head:   a475844eaf5f5246fea92d8289f2c8555f2c0c7e
commit: a475844eaf5f5246fea92d8289f2c8555f2c0c7e drm/i915/color: Enable Plane Color Pipelines
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251203/202512030005.UiqaQB5p-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030005.UiqaQB5p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512030005.UiqaQB5p-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/skl_universal_plane.c:19:
   drivers/gpu/drm/i915/display/intel_display_types.h:1993:28: error: field 'base' has incomplete type
    1993 |         struct drm_colorop base;
         |                            ^~~~
   drivers/gpu/drm/i915/display/skl_universal_plane.c: In function 'glk_plane_color_ctl':
>> drivers/gpu/drm/i915/display/skl_universal_plane.c:1288:21: error: implicit declaration of function 'drm_color_lut32_size'; did you mean 'drm_color_lut_size'? [-Wimplicit-function-declaration]
    1288 |                 if (drm_color_lut32_size(plane_state->hw.gamma_lut) != 32)
         |                     ^~~~~~~~~~~~~~~~~~~~
         |                     drm_color_lut_size


vim +1288 drivers/gpu/drm/i915/display/skl_universal_plane.c

46d12f911821f7 Dave Airlie   2021-02-05  1245  
01e1575609f100 Ville Syrjälä 2025-07-17  1246  static u32 glk_plane_color_ctl(const struct intel_plane_state *plane_state)
46d12f911821f7 Dave Airlie   2021-02-05  1247  {
a2ed9f84524795 Ville Syrjälä 2025-02-06  1248  	struct intel_display *display = to_intel_display(plane_state);
46d12f911821f7 Dave Airlie   2021-02-05  1249  	const struct drm_framebuffer *fb = plane_state->hw.fb;
46d12f911821f7 Dave Airlie   2021-02-05  1250  	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
46d12f911821f7 Dave Airlie   2021-02-05  1251  	u32 plane_color_ctl = 0;
46d12f911821f7 Dave Airlie   2021-02-05  1252  
46d12f911821f7 Dave Airlie   2021-02-05  1253  	plane_color_ctl |= PLANE_COLOR_PLANE_GAMMA_DISABLE;
46d12f911821f7 Dave Airlie   2021-02-05  1254  	plane_color_ctl |= glk_plane_color_ctl_alpha(plane_state);
46d12f911821f7 Dave Airlie   2021-02-05  1255  
a2ed9f84524795 Ville Syrjälä 2025-02-06  1256  	if (fb->format->is_yuv && !icl_is_hdr_plane(display, plane->id)) {
46d12f911821f7 Dave Airlie   2021-02-05  1257  		switch (plane_state->hw.color_encoding) {
46d12f911821f7 Dave Airlie   2021-02-05  1258  		case DRM_COLOR_YCBCR_BT709:
46d12f911821f7 Dave Airlie   2021-02-05  1259  			plane_color_ctl |= PLANE_COLOR_CSC_MODE_YUV709_TO_RGB709;
46d12f911821f7 Dave Airlie   2021-02-05  1260  			break;
46d12f911821f7 Dave Airlie   2021-02-05  1261  		case DRM_COLOR_YCBCR_BT2020:
46d12f911821f7 Dave Airlie   2021-02-05  1262  			plane_color_ctl |=
46d12f911821f7 Dave Airlie   2021-02-05  1263  				PLANE_COLOR_CSC_MODE_YUV2020_TO_RGB2020;
46d12f911821f7 Dave Airlie   2021-02-05  1264  			break;
46d12f911821f7 Dave Airlie   2021-02-05  1265  		default:
46d12f911821f7 Dave Airlie   2021-02-05  1266  			plane_color_ctl |=
46d12f911821f7 Dave Airlie   2021-02-05  1267  				PLANE_COLOR_CSC_MODE_YUV601_TO_RGB601;
46d12f911821f7 Dave Airlie   2021-02-05  1268  		}
46d12f911821f7 Dave Airlie   2021-02-05  1269  		if (plane_state->hw.color_range == DRM_COLOR_YCBCR_FULL_RANGE)
46d12f911821f7 Dave Airlie   2021-02-05  1270  			plane_color_ctl |= PLANE_COLOR_YUV_RANGE_CORRECTION_DISABLE;
46d12f911821f7 Dave Airlie   2021-02-05  1271  	} else if (fb->format->is_yuv) {
46d12f911821f7 Dave Airlie   2021-02-05  1272  		plane_color_ctl |= PLANE_COLOR_INPUT_CSC_ENABLE;
46d12f911821f7 Dave Airlie   2021-02-05  1273  		if (plane_state->hw.color_range == DRM_COLOR_YCBCR_FULL_RANGE)
46d12f911821f7 Dave Airlie   2021-02-05  1274  			plane_color_ctl |= PLANE_COLOR_YUV_RANGE_CORRECTION_DISABLE;
46d12f911821f7 Dave Airlie   2021-02-05  1275  	}
46d12f911821f7 Dave Airlie   2021-02-05  1276  
841f262e74a7c2 Ville Syrjälä 2021-10-07  1277  	if (plane_state->force_black)
841f262e74a7c2 Ville Syrjälä 2021-10-07  1278  		plane_color_ctl |= PLANE_COLOR_PLANE_CSC_ENABLE;
841f262e74a7c2 Ville Syrjälä 2021-10-07  1279  
a475844eaf5f52 Uma Shankar   2025-12-01  1280  	if (plane_state->hw.degamma_lut)
a475844eaf5f52 Uma Shankar   2025-12-01  1281  		plane_color_ctl |= PLANE_COLOR_PRE_CSC_GAMMA_ENABLE;
a475844eaf5f52 Uma Shankar   2025-12-01  1282  
a475844eaf5f52 Uma Shankar   2025-12-01  1283  	if (plane_state->hw.ctm)
a475844eaf5f52 Uma Shankar   2025-12-01  1284  		plane_color_ctl |= PLANE_COLOR_PLANE_CSC_ENABLE;
a475844eaf5f52 Uma Shankar   2025-12-01  1285  
a475844eaf5f52 Uma Shankar   2025-12-01  1286  	if (plane_state->hw.gamma_lut) {
a475844eaf5f52 Uma Shankar   2025-12-01  1287  		plane_color_ctl &= ~PLANE_COLOR_PLANE_GAMMA_DISABLE;
a475844eaf5f52 Uma Shankar   2025-12-01 @1288  		if (drm_color_lut32_size(plane_state->hw.gamma_lut) != 32)
a475844eaf5f52 Uma Shankar   2025-12-01  1289  			plane_color_ctl |= PLANE_COLOR_POST_CSC_GAMMA_MULTSEG_ENABLE;
a475844eaf5f52 Uma Shankar   2025-12-01  1290  	}
a475844eaf5f52 Uma Shankar   2025-12-01  1291  
46d12f911821f7 Dave Airlie   2021-02-05  1292  	return plane_color_ctl;
46d12f911821f7 Dave Airlie   2021-02-05  1293  }
46d12f911821f7 Dave Airlie   2021-02-05  1294  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
