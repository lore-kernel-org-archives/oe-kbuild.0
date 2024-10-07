Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DF02AD05
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Oct 2024 04:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728276872; cv=none; b=XH3bZz2TnigU5SZ0v71ZeCE1Fy/pbyL9K0JjUs8gP7HaK3ltOPpAlRGAj8+LFD0dKAPAHGFWIyPyTL97tuVfjsv+aQiXEX4ipQn7o55rXa+bn/13OQFET2JPI7K/A4i512ielWTcAYpAYeCV5oWMExO4HB/XOCynamjjKYFPMVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728276872; c=relaxed/simple;
	bh=qfyUqQ+JWYVxVgrOqoK6pJNeS8BDQGiSjj9wWviEcqY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pgWzytAQEjF7EAykadirNTgV/u8H1Sq+BuvJHQ1f34FyCg0ycHVQRTB/+kjtqkEWcmZ0WVsLpdoXYyv2bYEMckVB2tgF2/zDzVFheU3GCohClLTRgEoV22Q/8fHt1Rpp18qPEZbd9G+Ffa5/tQqvD3Fmrn80iv8UHg1YJ2jMXQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gqdYhQ5P; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gqdYhQ5P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728276870; x=1759812870;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qfyUqQ+JWYVxVgrOqoK6pJNeS8BDQGiSjj9wWviEcqY=;
  b=gqdYhQ5Px2WaqdnLaBUQ1aiT00ohCr1vZ0c61Cfvuk2uM6Qs61QtqtFF
   JCcIdzqjUcWUVEit54dYz5WE09qEQaV+NEmXCrm4J/vVgytnFWbQmE03L
   a7iRAM88chgkfndBnO+ug8d+pwdD5IF0yP8W9Sp20T9ZZlyLQDimr5mVj
   1K5mLdAJcZSD+yni7oQIKufOMKAq3S9e69aUVcqPW7CitoH6UbSVidTce
   mlGTwbFtnsd5CJISNSqQnCrnH059Z3RzW+A8xzlhE0HSknngN0npjtOhr
   SKLSSAR7sJoiREA5XzNz4Y4MyxKMaNAYeZOcMW8b8Qb3vorAzn7IzV7C9
   g==;
X-CSE-ConnectionGUID: NqY2IU7QTtKieRoqOZUyxw==
X-CSE-MsgGUID: UcNZMJ7DRbCxyiRdlsqFvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="27585317"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="27585317"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 21:54:29 -0700
X-CSE-ConnectionGUID: uGbJowDYQIKM7sZ7ehoh3w==
X-CSE-MsgGUID: /chdigJYTt6sO86UrpAZsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="75703758"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Oct 2024 21:54:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxflK-0004bK-0R;
	Mon, 07 Oct 2024 04:54:26 +0000
Date: Mon, 7 Oct 2024 12:54:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/i915/display/intel_dp.c:2243:6-9: opportunity for
 str_on_off(dsc)
Message-ID: <202410071252.cWILJzrH-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Imre Deak <imre.deak@intel.com>
CC: "Ville Syrjälä" <ville.syrjala@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
commit: 78015e27b7d75ec497a9b5f14a7dc0ee9288d560 drm/i915/dp: Update the link bpp limits for DSC mode
date:   1 year ago
:::::: branch date: 6 hours ago
:::::: commit date: 1 year ago
config: x86_64-randconfig-102-20241007 (https://download.01.org/0day-ci/archive/20241007/202410071252.cWILJzrH-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410071252.cWILJzrH-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_dp.c:2243:6-9: opportunity for str_on_off(dsc)

vim +2243 drivers/gpu/drm/i915/display/intel_dp.c

a4a157777c807d drivers/gpu/drm/i915/intel_dp.c         Manasi Navare 2018-11-28  2192  
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2193  /**
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2194   * intel_dp_compute_config_link_bpp_limits - compute output link bpp limits
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2195   * @intel_dp: intel DP
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2196   * @crtc_state: crtc state
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2197   * @dsc: DSC compression mode
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2198   * @limits: link configuration limits
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2199   *
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2200   * Calculates the output link min, max bpp values in @limits based on the
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2201   * pipe bpp range, @crtc_state and @dsc mode.
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2202   *
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2203   * Returns %true in case of success.
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2204   */
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2205  bool
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2206  intel_dp_compute_config_link_bpp_limits(struct intel_dp *intel_dp,
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2207  					const struct intel_crtc_state *crtc_state,
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2208  					bool dsc,
72b2d2a6f178b9 drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2209  					struct link_config_limits *limits)
a4fc5ed69817c7 drivers/gpu/drm/i915/intel_dp.c         Keith Packard 2009-04-07  2210  {
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2211  	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
0c1abaa7fbfb99 drivers/gpu/drm/i915/display/intel_dp.c Ville Syrjälä 2020-03-19  2212  	const struct drm_display_mode *adjusted_mode =
72b2d2a6f178b9 drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2213  		&crtc_state->hw.adjusted_mode;
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2214  	const struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2215  	const struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2216  	int max_link_bpp_x16;
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2217  
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2218  	max_link_bpp_x16 = to_bpp_x16(limits->pipe.max_bpp);
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2219  
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2220  	if (!dsc) {
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2221  		max_link_bpp_x16 = rounddown(max_link_bpp_x16, to_bpp_x16(2 * 3));
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2222  
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2223  		if (max_link_bpp_x16 < to_bpp_x16(limits->pipe.min_bpp))
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2224  			return false;
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2225  
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2226  		limits->link.min_bpp_x16 = to_bpp_x16(limits->pipe.min_bpp);
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2227  	} else {
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2228  		/*
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2229  		 * TODO: set the DSC link limits already here, atm these are
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2230  		 * initialized only later in intel_edp_dsc_compute_pipe_bpp() /
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2231  		 * intel_dp_dsc_compute_pipe_bpp()
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2232  		 */
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2233  		limits->link.min_bpp_x16 = 0;
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2234  	}
7c2781e41ec889 drivers/gpu/drm/i915/intel_dp.c         Jani Nikula   2018-04-26  2235  
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2236  	limits->link.max_bpp_x16 = max_link_bpp_x16;
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2237  
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2238  	drm_dbg_kms(&i915->drm,
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2239  		    "[ENCODER:%d:%s][CRTC:%d:%s] DP link limits: pixel clock %d kHz DSC %s max lanes %d max rate %d max pipe_bpp %d max link_bpp " BPP_X16_FMT "\n",
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2240  		    encoder->base.base.id, encoder->base.name,
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2241  		    crtc->base.base.id, crtc->base.name,
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2242  		    adjusted_mode->crtc_clock,
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21 @2243  		    dsc ? "on" : "off",
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2244  		    limits->max_lane_count,
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2245  		    limits->max_rate,
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2246  		    limits->pipe.max_bpp,
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2247  		    BPP_X16_ARGS(limits->link.max_bpp_x16));
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2248  
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2249  	return true;
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2250  }
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak     2023-09-21  2251  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
