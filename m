Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F06C2836F
	for <oe-kbuild@lists.linux.dev>; Fri,  1 May 2026 00:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777595557; cv=none; b=I30iFX0bjFhFZPK5yIGlsDWp7R3XHpV8ROPFSg4PhI6givlLf3RO6IbK2m+r9+Y77rRvcF3Ii+GNkZG2c0nXhTYwP6//456kL9s86EDIY0YlFj+RY0BXgQ72G993Z5DMpdRzMOxXpJTWa6IEnYV545F8aB+aPLGezm9E45RHuTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777595557; c=relaxed/simple;
	bh=uO6Z9TOCoSMCITUsgEhQp8bYx/2VCoW1f0qMhrONTl0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lBzQp8IvmxEj8Pq6z6JveJVP7Z78PquWRDNANWgVyvyk8grbZNsUubR8tFj5wFDYlMiLhWQiTUastEzl0Em3TN1MY5Z8HpvNvB9vxTjJ9RZPRGCi6yFbjLSNzcT84vIUry5xQaXJB+WexzGc2uCwyTavJH1U8C1qoiZPNxIFcNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JciB7XVb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JciB7XVb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777595555; x=1809131555;
  h=date:from:to:cc:subject:message-id;
  bh=uO6Z9TOCoSMCITUsgEhQp8bYx/2VCoW1f0qMhrONTl0=;
  b=JciB7XVbylvgLpgOEeP91HZbRHbYWMhAEJbTAic+kvXH3SitEM7fo+iu
   EzLIpN/eBgeSpmFzYn35Jx1BixqWYAQc+A/DawqAMtbkfgzC3I6oQzbrt
   oibptx5trHfUNwPBOhcWC/M9hjwqA0KG9yGPNsDJVmxW+20UpBUNtJ5zA
   9RKzsV0LzdQJ/BxSilbTwc83A00QJIL7zO8xQo2OxlJfaB4UvoJ3ln37c
   TRBdRybMwmFfzsH/wO1FJ8oboBQFy0Jq3IWYWz9HVUx2OcwPq8S6lVlNz
   Je+N5aDtyx/jbO/fWhV7lQfOJPJxlq8JWrWbMDCdRMHf3EkG3b0Wy1FAj
   w==;
X-CSE-ConnectionGUID: Ct5hd9XMTombnumGPjf3Ow==
X-CSE-MsgGUID: yP6EtCXhRpiRCws+73cSPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="89257939"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="89257939"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 17:32:35 -0700
X-CSE-ConnectionGUID: ttDHJIZrTpaIi1pr4F98NA==
X-CSE-MsgGUID: 6smFQIk5QwqGjEswA4KuSQ==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="234991916"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Apr 2026 17:32:33 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIbny-00000000DA8-4AZM;
	Fri, 01 May 2026 00:32:31 +0000
Date: Fri, 01 May 2026 08:32:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: 
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4833
 convert_custom_brightness() error: buffer overflow 'caps->luminance_data' 99
 <= 127
Message-ID: <202605010835.af3xzIY7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mario Limonciello <mario.limonciello@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Alex Hung <alex.hung@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   08d0d3466664000ba0670e0ef0d447f23459e0d4
commit: de63b05593573cb0106875452c706ebaf6faa8f7 drm/amd/display: Optimize custom brightness curve interpolation
date:   8 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 8 months ago
config: alpha-randconfig-r072-20260427 (https://download.01.org/0day-ci/archive/20260501/202605010835.af3xzIY7-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: de63b0559357 ("drm/amd/display: Optimize custom brightness curve interpolation")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605010835.af3xzIY7-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4833 convert_custom_brightness() error: buffer overflow 'caps->luminance_data' 99 <= 127

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4837 convert_custom_brightness() error: buffer overflow 'caps->luminance_data' 99 <= 127
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4852 convert_custom_brightness() error: buffer overflow 'caps->luminance_data' 99 <= 127
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4853 convert_custom_brightness() error: buffer overflow 'caps->luminance_data' 99 <= 128
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4854 convert_custom_brightness() error: buffer overflow 'caps->luminance_data' 99 <= 127
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4855 convert_custom_brightness() error: buffer overflow 'caps->luminance_data' 99 <= 128
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:12539 parse_edid_displayid_vrr() warn: variable dereferenced before check 'edid_ext' (see line 12535)

vim +4833 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

8dbd72cb790058 Mario Limonciello 2025-05-29  4814  
03b979e1025fba Mario Limonciello 2025-03-24  4815  static void convert_custom_brightness(const struct amdgpu_dm_backlight_caps *caps,
8dbd72cb790058 Mario Limonciello 2025-05-29  4816  				      unsigned int min, unsigned int max,
8dbd72cb790058 Mario Limonciello 2025-05-29  4817  				      uint32_t *user_brightness)
69d9f4278d0f9d Alexander Monakov 2020-08-04  4818  {
8dbd72cb790058 Mario Limonciello 2025-05-29  4819  	u32 brightness = scale_input_to_fw(min, max, *user_brightness);
de63b05593573c Mario Limonciello 2025-08-19  4820  	u8 lower_signal, upper_signal, upper_lum, lower_lum, lum;
de63b05593573c Mario Limonciello 2025-08-19  4821  	int left, right;
578df37b1b6a5b Mario Limonciello 2025-02-28  4822  
36d63ce5dbc0dc Mario Limonciello 2025-02-28  4823  	if (amdgpu_dc_debug_mask & DC_DISABLE_CUSTOM_BRIGHTNESS_CURVE)
03b979e1025fba Mario Limonciello 2025-03-24  4824  		return;
36d63ce5dbc0dc Mario Limonciello 2025-02-28  4825  
03b979e1025fba Mario Limonciello 2025-03-24  4826  	if (!caps->data_points)
03b979e1025fba Mario Limonciello 2025-03-24  4827  		return;
03b979e1025fba Mario Limonciello 2025-03-24  4828  
de63b05593573c Mario Limonciello 2025-08-19  4829  	left = 0;
de63b05593573c Mario Limonciello 2025-08-19  4830  	right = caps->data_points - 1;
de63b05593573c Mario Limonciello 2025-08-19  4831  	while (left <= right) {
de63b05593573c Mario Limonciello 2025-08-19  4832  		int mid = left + (right - left) / 2;
de63b05593573c Mario Limonciello 2025-08-19 @4833  		u8 signal = caps->luminance_data[mid].input_signal;
578df37b1b6a5b Mario Limonciello 2025-02-28  4834  
de63b05593573c Mario Limonciello 2025-08-19  4835  		/* Exact match found */
de63b05593573c Mario Limonciello 2025-08-19  4836  		if (signal == brightness) {
de63b05593573c Mario Limonciello 2025-08-19  4837  			lum = caps->luminance_data[mid].luminance;
de63b05593573c Mario Limonciello 2025-08-19  4838  			goto scale;
578df37b1b6a5b Mario Limonciello 2025-02-28  4839  		}
de63b05593573c Mario Limonciello 2025-08-19  4840  
de63b05593573c Mario Limonciello 2025-08-19  4841  		if (signal < brightness)
de63b05593573c Mario Limonciello 2025-08-19  4842  			left = mid + 1;
de63b05593573c Mario Limonciello 2025-08-19  4843  		else
de63b05593573c Mario Limonciello 2025-08-19  4844  			right = mid - 1;
de63b05593573c Mario Limonciello 2025-08-19  4845  	}
de63b05593573c Mario Limonciello 2025-08-19  4846  
de63b05593573c Mario Limonciello 2025-08-19  4847  	/* verify bound */
de63b05593573c Mario Limonciello 2025-08-19  4848  	if (left >= caps->data_points)
de63b05593573c Mario Limonciello 2025-08-19  4849  		left = caps->data_points - 1;
de63b05593573c Mario Limonciello 2025-08-19  4850  
de63b05593573c Mario Limonciello 2025-08-19  4851  	/* At this point, left > right */
de63b05593573c Mario Limonciello 2025-08-19  4852  	lower_signal = caps->luminance_data[right].input_signal;
de63b05593573c Mario Limonciello 2025-08-19  4853  	upper_signal = caps->luminance_data[left].input_signal;
de63b05593573c Mario Limonciello 2025-08-19  4854  	lower_lum = caps->luminance_data[right].luminance;
de63b05593573c Mario Limonciello 2025-08-19  4855  	upper_lum = caps->luminance_data[left].luminance;
de63b05593573c Mario Limonciello 2025-08-19  4856  
de63b05593573c Mario Limonciello 2025-08-19  4857  	/* interpolate */
de63b05593573c Mario Limonciello 2025-08-19  4858  	if (right == left || !lower_lum)
de63b05593573c Mario Limonciello 2025-08-19  4859  		lum = upper_lum;
de63b05593573c Mario Limonciello 2025-08-19  4860  	else
de63b05593573c Mario Limonciello 2025-08-19  4861  		lum = lower_lum + DIV_ROUND_CLOSEST((upper_lum - lower_lum) *
de63b05593573c Mario Limonciello 2025-08-19  4862  						    (brightness - lower_signal),
de63b05593573c Mario Limonciello 2025-08-19  4863  						    upper_signal - lower_signal);
de63b05593573c Mario Limonciello 2025-08-19  4864  scale:
8dbd72cb790058 Mario Limonciello 2025-05-29  4865  	*user_brightness = scale_fw_to_input(min, max,
8dbd72cb790058 Mario Limonciello 2025-05-29  4866  					     DIV_ROUND_CLOSEST(lum * brightness, 101));
578df37b1b6a5b Mario Limonciello 2025-02-28  4867  }
578df37b1b6a5b Mario Limonciello 2025-02-28  4868  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
