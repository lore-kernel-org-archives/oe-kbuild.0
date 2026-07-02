Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CFC431E66
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 00:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782950637; cv=none; b=sW6Emgq11AC43vQU51fWARuvD/SLQ5n6gs7QQJE7HmF9TQ6DzfJd42efc0LtvxPRtljvXr9Ifk/5RJzU2Z2SOmtzwzAOwHjnsvi9JdABGS/n9B1dasUnIfJyjkisTDfp8RKhbnFt6wRTQl7r4lgvxHOj+KfGh+CGyl+yApRbMdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782950637; c=relaxed/simple;
	bh=RQ95bFR/2s9BScqJhNkhDsgRvFu9VVL2R17oq0hI0sg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PeGX3T0ZitSs/anEB4qBVNgB5Tx+VOZImWKvzex3lVU17h7kUkJneYCxESMKxJGuDGqbZME7HK/B7kJnKK0jHAzxhDM/N5ozH+BRym/qXMx/dT3BtNBKpl79Oil5iw/z5/j1M5HIo41LXDWMJ39Ao2NUNUeDxt+ov4uP+RFrvpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C/HLZGCt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C/HLZGCt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782950633; x=1814486633;
  h=date:from:to:cc:subject:message-id;
  bh=RQ95bFR/2s9BScqJhNkhDsgRvFu9VVL2R17oq0hI0sg=;
  b=C/HLZGCtsYkpzzasXxkER9+tY5a95+NBEGQ/fbgl8uwzi9xGQ8KMPiYu
   Zp8DhA/hn/u3x4FT2qLUVyxJLWvXgPSX/wcE3p32BtMyJUmcBb+NAldyT
   4s98xIwJEq2wxuVcqCIXZjHILBpa4Xbmfa5KJmEYwg18rwwaPk+UsPU0c
   f2mijyJAQkiVhQ/OwISx6lgY0eTKpbtpFSsBJlVAtn2//8mNPl7baeTm+
   hONBbJpJzoiL4BiHe+TDQm8inPCGm+ZIw2kCZCaeEnmGE418gde36z5S/
   ry3XITuuB9U1UeR+4tB0mW4IwWhX02Hl3hjmSpCmwkV263rVR5bTTswyQ
   A==;
X-CSE-ConnectionGUID: 2/KKBGmuQSethedmwBnvhQ==
X-CSE-MsgGUID: 3MeIyTV0TL+31WWNboJwKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="106490035"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="106490035"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 17:03:52 -0700
X-CSE-ConnectionGUID: Ss0+3DbjSFCvcSMsL+7Clw==
X-CSE-MsgGUID: N69TBhGRSPa2rLr89j2y5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="246349169"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 01 Jul 2026 17:03:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf4tM-000000009k3-0fW0;
	Thu, 02 Jul 2026 00:03:09 +0000
Date: Thu, 02 Jul 2026 08:01:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 732/2307]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_backlight.c:154
 convert_custom_brightness() error: buffer overflow 'caps->luminance_data' 99
 <= 127
Message-ID: <202607020734.EHHCtE8Y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alex Hung <alex.hung@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
CC: Chenyu Chen <chen-yu.chen@amd.com>

Hi Alex,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4f441960e691d37c880d2cc004de06bb5b6bd5e4
commit: f5165625b8b27a46993e0c55b4468bd4e215f7c6 [732/2307] drm/amd/display: Extract backlight code to amdgpu_dm_backlight
:::::: branch date: 8 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-r072-20260701 (https://download.01.org/0day-ci/archive/20260702/202607020734.EHHCtE8Y-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607020734.EHHCtE8Y-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_backlight.c:154 convert_custom_brightness() error: buffer overflow 'caps->luminance_data' 99 <= 127

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_backlight.c:158 convert_custom_brightness() error: buffer overflow 'caps->luminance_data' 99 <= 127
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_backlight.c:173 convert_custom_brightness() error: buffer overflow 'caps->luminance_data' 99 <= 127
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_backlight.c:174 convert_custom_brightness() error: buffer overflow 'caps->luminance_data' 99 <= 128
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_backlight.c:175 convert_custom_brightness() error: buffer overflow 'caps->luminance_data' 99 <= 127
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_backlight.c:176 convert_custom_brightness() error: buffer overflow 'caps->luminance_data' 99 <= 128

vim +154 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_backlight.c

f5165625b8b27a Alex Hung 2026-04-23  125  
f5165625b8b27a Alex Hung 2026-04-23  126  static void convert_custom_brightness(const struct amdgpu_dm_backlight_caps *caps,
f5165625b8b27a Alex Hung 2026-04-23  127  				      unsigned int min, unsigned int max,
f5165625b8b27a Alex Hung 2026-04-23  128  				      uint32_t *user_brightness)
f5165625b8b27a Alex Hung 2026-04-23  129  {
f5165625b8b27a Alex Hung 2026-04-23  130  	u32 brightness = scale_input_to_fw(min, max, *user_brightness);
f5165625b8b27a Alex Hung 2026-04-23  131  	u8 lower_signal, upper_signal, upper_lum, lower_lum, lum;
f5165625b8b27a Alex Hung 2026-04-23  132  	int left, right;
f5165625b8b27a Alex Hung 2026-04-23  133  
f5165625b8b27a Alex Hung 2026-04-23  134  	if (amdgpu_dc_debug_mask & DC_DISABLE_CUSTOM_BRIGHTNESS_CURVE)
f5165625b8b27a Alex Hung 2026-04-23  135  		return;
f5165625b8b27a Alex Hung 2026-04-23  136  
f5165625b8b27a Alex Hung 2026-04-23  137  	if (!caps->data_points)
f5165625b8b27a Alex Hung 2026-04-23  138  		return;
f5165625b8b27a Alex Hung 2026-04-23  139  
f5165625b8b27a Alex Hung 2026-04-23  140  	/*
f5165625b8b27a Alex Hung 2026-04-23  141  	 * Handle the case where brightness is below the first data point
f5165625b8b27a Alex Hung 2026-04-23  142  	 * Interpolate between (0,0) and (first_signal, first_lum)
f5165625b8b27a Alex Hung 2026-04-23  143  	 */
f5165625b8b27a Alex Hung 2026-04-23  144  	if (brightness < caps->luminance_data[0].input_signal) {
f5165625b8b27a Alex Hung 2026-04-23  145  		lum = DIV_ROUND_CLOSEST(caps->luminance_data[0].luminance * brightness,
f5165625b8b27a Alex Hung 2026-04-23  146  					caps->luminance_data[0].input_signal);
f5165625b8b27a Alex Hung 2026-04-23  147  		goto scale;
f5165625b8b27a Alex Hung 2026-04-23  148  	}
f5165625b8b27a Alex Hung 2026-04-23  149  
f5165625b8b27a Alex Hung 2026-04-23  150  	left = 0;
f5165625b8b27a Alex Hung 2026-04-23  151  	right = caps->data_points - 1;
f5165625b8b27a Alex Hung 2026-04-23  152  	while (left <= right) {
f5165625b8b27a Alex Hung 2026-04-23  153  		int mid = left + (right - left) / 2;
f5165625b8b27a Alex Hung 2026-04-23 @154  		u8 signal = caps->luminance_data[mid].input_signal;
f5165625b8b27a Alex Hung 2026-04-23  155  
f5165625b8b27a Alex Hung 2026-04-23  156  		/* Exact match found */
f5165625b8b27a Alex Hung 2026-04-23  157  		if (signal == brightness) {
f5165625b8b27a Alex Hung 2026-04-23  158  			lum = caps->luminance_data[mid].luminance;
f5165625b8b27a Alex Hung 2026-04-23  159  			goto scale;
f5165625b8b27a Alex Hung 2026-04-23  160  		}
f5165625b8b27a Alex Hung 2026-04-23  161  
f5165625b8b27a Alex Hung 2026-04-23  162  		if (signal < brightness)
f5165625b8b27a Alex Hung 2026-04-23  163  			left = mid + 1;
f5165625b8b27a Alex Hung 2026-04-23  164  		else
f5165625b8b27a Alex Hung 2026-04-23  165  			right = mid - 1;
f5165625b8b27a Alex Hung 2026-04-23  166  	}
f5165625b8b27a Alex Hung 2026-04-23  167  
f5165625b8b27a Alex Hung 2026-04-23  168  	/* verify bound */
f5165625b8b27a Alex Hung 2026-04-23  169  	if (left >= caps->data_points)
f5165625b8b27a Alex Hung 2026-04-23  170  		left = caps->data_points - 1;
f5165625b8b27a Alex Hung 2026-04-23  171  
f5165625b8b27a Alex Hung 2026-04-23  172  	/* At this point, left > right */
f5165625b8b27a Alex Hung 2026-04-23  173  	lower_signal = caps->luminance_data[right].input_signal;
f5165625b8b27a Alex Hung 2026-04-23  174  	upper_signal = caps->luminance_data[left].input_signal;
f5165625b8b27a Alex Hung 2026-04-23  175  	lower_lum = caps->luminance_data[right].luminance;
f5165625b8b27a Alex Hung 2026-04-23  176  	upper_lum = caps->luminance_data[left].luminance;
f5165625b8b27a Alex Hung 2026-04-23  177  
f5165625b8b27a Alex Hung 2026-04-23  178  	/* interpolate */
f5165625b8b27a Alex Hung 2026-04-23  179  	if (right == left || !lower_lum)
f5165625b8b27a Alex Hung 2026-04-23  180  		lum = upper_lum;
f5165625b8b27a Alex Hung 2026-04-23  181  	else
f5165625b8b27a Alex Hung 2026-04-23  182  		lum = lower_lum + DIV_ROUND_CLOSEST((upper_lum - lower_lum) *
f5165625b8b27a Alex Hung 2026-04-23  183  						    (brightness - lower_signal),
f5165625b8b27a Alex Hung 2026-04-23  184  						    upper_signal - lower_signal);
f5165625b8b27a Alex Hung 2026-04-23  185  scale:
f5165625b8b27a Alex Hung 2026-04-23  186  	*user_brightness = scale_fw_to_input(min, max,
f5165625b8b27a Alex Hung 2026-04-23  187  					     DIV_ROUND_CLOSEST(lum * brightness, 101));
f5165625b8b27a Alex Hung 2026-04-23  188  }
f5165625b8b27a Alex Hung 2026-04-23  189  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
