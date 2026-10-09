Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC743233946
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Oct 2026 01:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791508454; cv=none; b=QFTP5cDQR6ANre4NW6s4l1PWxsdps+yPlioVyB8RlD0XCuZEO7NWhuJckH0UoiDEI76II42DWJ4isjjS/L+CE0QWRKARRpkK4/ZPYbOnj6oDhhy7lpsAMnhvxUOCt2ON0zkr4ZE7NrqOVZLpM8qXl2fthF/api+LcoxH3mw3+XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791508454; c=relaxed/simple;
	bh=znFEWsvDdVKmZ7krQyC2cGJLAO38280PJYfZyX93oUA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lepRv6QdhHIVgJkM1ukwAcgyfSmHwVbj0pzIWMFdxR5pKaVPLrskz0RQTMcW9wtORcfwN1A3Tx2uatrq9ZCQAbUwHKuYjf3qkH6ng2N3Gw2ag08h8jg62dCSq90Pwb9ItT6lZybtquaHvc5bGRoIfijXuGxJHqz/lXF/eqiWXGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TsvE2/UP; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TsvE2/UP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791508452; x=1823044452;
  h=date:from:to:cc:subject:message-id;
  bh=znFEWsvDdVKmZ7krQyC2cGJLAO38280PJYfZyX93oUA=;
  b=TsvE2/UPyBF8+93/k2JDcdR/PeOWdg8hHM7X3oUA6Iend25gTJdmnheP
   LFUbSttZGzA/4ioU0nifjQRfQc8ZbNKVaxETG+M/xWvZqhHYHz9tt6lc9
   OPUafNX43bXSNq/oRoU3hWAdTA++1iHYIxzZ4Y+iTPxE+3uKlc2pfMcKP
   +jHot4md1xyP0Id0TYot7c/3uNG1oygjgDBlcKrZIBlnrXOgIXCR6rCl3
   REHPgvrZao6oXeecGqpZ1yqgVSLKOLyEgqnwOLHcChDFVcW564Z7hvaQy
   qodMUsmH1w+tidRDeBBjrTfNfwwo3PzmPM3IbiKZBWDhcGFOOtAMby5w9
   g==;
X-CSE-ConnectionGUID: FtaZE5scQl62MPXXbh4LPQ==
X-CSE-MsgGUID: o5Bj6AXwSBKW+TdSBGCcEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="307758"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="307758"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 18:14:12 -0700
X-CSE-ConnectionGUID: D9oJLeV/TTOrlqwHWCE0Vg==
X-CSE-MsgGUID: 1+mf7EODT0WppEetUsEdbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="548318"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 08 Oct 2026 18:14:10 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEzBX-000000006SN-3Fue;
	Fri, 09 Oct 2026 01:14:07 +0000
Date: Fri, 09 Oct 2026 03:13:57 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 757/15343]
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:2079:52-54: WARNING opportunity
 for max()
Message-ID: <202610090357.4wunOhLG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Hawking Zhang <Hawking.Zhang@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Shiwu Zhang <shiwu.zhang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aac26bee2287c88af5be5a5ff96d783b19a28790
commit: b69b3051d6b044b4a1558d9e2ca82d318897e54c [757/15343] drm/amdgpu: Use max SA WGP count for GC info v1.5 CU config
:::::: branch date: 15 hours ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-2100-20261008 (https://download.01.org/0day-ci/archive/20261009/202610090357.4wunOhLG-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610090357.4wunOhLG-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:2079:52-54: WARNING opportunity for max()

vim +2079 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c

0cd7f378b0927e Alex Deucher  2021-12-15  1994  
e24d0e91b33676 Alex Deucher  2022-03-30  1995  static int amdgpu_discovery_get_gfx_info(struct amdgpu_device *adev)
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  1996  {
9e2096baab9add Lijo Lazar    2025-10-10  1997  	uint8_t *discovery_bin = adev->discovery.bin;
d0c647a6aae2ce Likun Gao     2025-11-07  1998  	struct table_info *info;
0cd7f378b0927e Alex Deucher  2021-12-15  1999  	union gc_info *gc_info;
b69b3051d6b044 Hawking Zhang 2026-06-12  2000  	uint32_t num_wgps_per_sa, num_wgps_per_sa1;
f716113aacea12 Alex Deucher  2022-03-30  2001  	u16 offset;
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  2002  
9e2096baab9add Lijo Lazar    2025-10-10  2003  	if (!discovery_bin) {
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  2004  		DRM_ERROR("ip discovery uninitialized\n");
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  2005  		return -EINVAL;
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  2006  	}
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  2007  
d0c647a6aae2ce Likun Gao     2025-11-07  2008  	if (amdgpu_discovery_get_table_info(adev, &info, GC))
d0c647a6aae2ce Likun Gao     2025-11-07  2009  		return -EINVAL;
d0c647a6aae2ce Likun Gao     2025-11-07  2010  	offset = le16_to_cpu(info->offset);
f716113aacea12 Alex Deucher  2022-03-30  2011  
e24d0e91b33676 Alex Deucher  2022-03-30  2012  	if (!offset)
e24d0e91b33676 Alex Deucher  2022-03-30  2013  		return 0;
f716113aacea12 Alex Deucher  2022-03-30  2014  
9e2096baab9add Lijo Lazar    2025-10-10  2015  	gc_info = (union gc_info *)(discovery_bin + offset);
f716113aacea12 Alex Deucher  2022-03-30  2016  
8eece29c4ecd5c Alex Deucher  2022-03-30  2017  	switch (le16_to_cpu(gc_info->v1.header.version_major)) {
0cd7f378b0927e Alex Deucher  2021-12-15  2018  	case 1:
0cd7f378b0927e Alex Deucher  2021-12-15  2019  		adev->gfx.config.max_shader_engines = le32_to_cpu(gc_info->v1.gc_num_se);
0cd7f378b0927e Alex Deucher  2021-12-15  2020  		adev->gfx.config.max_cu_per_sh = 2 * (le32_to_cpu(gc_info->v1.gc_num_wgp0_per_sa) +
0cd7f378b0927e Alex Deucher  2021-12-15  2021  					      le32_to_cpu(gc_info->v1.gc_num_wgp1_per_sa));
0cd7f378b0927e Alex Deucher  2021-12-15  2022  		adev->gfx.config.max_sh_per_se = le32_to_cpu(gc_info->v1.gc_num_sa_per_se);
0cd7f378b0927e Alex Deucher  2021-12-15  2023  		adev->gfx.config.max_backends_per_se = le32_to_cpu(gc_info->v1.gc_num_rb_per_se);
0cd7f378b0927e Alex Deucher  2021-12-15  2024  		adev->gfx.config.max_texture_channel_caches = le32_to_cpu(gc_info->v1.gc_num_gl2c);
0cd7f378b0927e Alex Deucher  2021-12-15  2025  		adev->gfx.config.max_gprs = le32_to_cpu(gc_info->v1.gc_num_gprs);
0cd7f378b0927e Alex Deucher  2021-12-15  2026  		adev->gfx.config.max_gs_threads = le32_to_cpu(gc_info->v1.gc_num_max_gs_thds);
0cd7f378b0927e Alex Deucher  2021-12-15  2027  		adev->gfx.config.gs_vgt_table_depth = le32_to_cpu(gc_info->v1.gc_gs_table_depth);
0cd7f378b0927e Alex Deucher  2021-12-15  2028  		adev->gfx.config.gs_prim_buffer_depth = le32_to_cpu(gc_info->v1.gc_gsprim_buff_depth);
0cd7f378b0927e Alex Deucher  2021-12-15  2029  		adev->gfx.config.double_offchip_lds_buf = le32_to_cpu(gc_info->v1.gc_double_offchip_lds_buffer);
0cd7f378b0927e Alex Deucher  2021-12-15  2030  		adev->gfx.cu_info.wave_front_size = le32_to_cpu(gc_info->v1.gc_wave_size);
0cd7f378b0927e Alex Deucher  2021-12-15  2031  		adev->gfx.cu_info.max_waves_per_simd = le32_to_cpu(gc_info->v1.gc_max_waves_per_simd);
0cd7f378b0927e Alex Deucher  2021-12-15  2032  		adev->gfx.cu_info.max_scratch_slots_per_cu = le32_to_cpu(gc_info->v1.gc_max_scratch_slots_per_cu);
0cd7f378b0927e Alex Deucher  2021-12-15  2033  		adev->gfx.cu_info.lds_size = le32_to_cpu(gc_info->v1.gc_lds_size);
0cd7f378b0927e Alex Deucher  2021-12-15  2034  		adev->gfx.config.num_sc_per_sh = le32_to_cpu(gc_info->v1.gc_num_sc_per_se) /
0cd7f378b0927e Alex Deucher  2021-12-15  2035  			le32_to_cpu(gc_info->v1.gc_num_sa_per_se);
0cd7f378b0927e Alex Deucher  2021-12-15  2036  		adev->gfx.config.num_packer_per_sc = le32_to_cpu(gc_info->v1.gc_num_packer_per_sc);
0e64c9aad03139 Yifan Zhang   2023-09-06  2037  		if (le16_to_cpu(gc_info->v1.header.version_minor) >= 1) {
5cb1cfd5f1863c Alex Deucher  2022-03-29  2038  			adev->gfx.config.gc_num_tcp_per_sa = le32_to_cpu(gc_info->v1_1.gc_num_tcp_per_sa);
5cb1cfd5f1863c Alex Deucher  2022-03-29  2039  			adev->gfx.config.gc_num_sdp_interface = le32_to_cpu(gc_info->v1_1.gc_num_sdp_interface);
5cb1cfd5f1863c Alex Deucher  2022-03-29  2040  			adev->gfx.config.gc_num_tcps = le32_to_cpu(gc_info->v1_1.gc_num_tcps);
5cb1cfd5f1863c Alex Deucher  2022-03-29  2041  		}
0e64c9aad03139 Yifan Zhang   2023-09-06  2042  		if (le16_to_cpu(gc_info->v1.header.version_minor) >= 2) {
5cb1cfd5f1863c Alex Deucher  2022-03-29  2043  			adev->gfx.config.gc_num_tcp_per_wpg = le32_to_cpu(gc_info->v1_2.gc_num_tcp_per_wpg);
5cb1cfd5f1863c Alex Deucher  2022-03-29  2044  			adev->gfx.config.gc_tcp_l1_size = le32_to_cpu(gc_info->v1_2.gc_tcp_l1_size);
5cb1cfd5f1863c Alex Deucher  2022-03-29  2045  			adev->gfx.config.gc_num_sqc_per_wgp = le32_to_cpu(gc_info->v1_2.gc_num_sqc_per_wgp);
5cb1cfd5f1863c Alex Deucher  2022-03-29  2046  			adev->gfx.config.gc_l1_instruction_cache_size_per_sqc = le32_to_cpu(gc_info->v1_2.gc_l1_instruction_cache_size_per_sqc);
5cb1cfd5f1863c Alex Deucher  2022-03-29  2047  			adev->gfx.config.gc_l1_data_cache_size_per_sqc = le32_to_cpu(gc_info->v1_2.gc_l1_data_cache_size_per_sqc);
5cb1cfd5f1863c Alex Deucher  2022-03-29  2048  			adev->gfx.config.gc_gl1c_per_sa = le32_to_cpu(gc_info->v1_2.gc_gl1c_per_sa);
5cb1cfd5f1863c Alex Deucher  2022-03-29  2049  			adev->gfx.config.gc_gl1c_size_per_instance = le32_to_cpu(gc_info->v1_2.gc_gl1c_size_per_instance);
5cb1cfd5f1863c Alex Deucher  2022-03-29  2050  			adev->gfx.config.gc_gl2c_per_gpu = le32_to_cpu(gc_info->v1_2.gc_gl2c_per_gpu);
5cb1cfd5f1863c Alex Deucher  2022-03-29  2051  		}
875ff9a7ee8824 Likun Gao     2024-08-22  2052  		if (le16_to_cpu(gc_info->v1.header.version_minor) >= 3) {
875ff9a7ee8824 Likun Gao     2024-08-22  2053  			adev->gfx.config.gc_tcp_size_per_cu = le32_to_cpu(gc_info->v1_3.gc_tcp_size_per_cu);
875ff9a7ee8824 Likun Gao     2024-08-22  2054  			adev->gfx.config.gc_tcp_cache_line_size = le32_to_cpu(gc_info->v1_3.gc_tcp_cache_line_size);
875ff9a7ee8824 Likun Gao     2024-08-22  2055  			adev->gfx.config.gc_instruction_cache_size_per_sqc = le32_to_cpu(gc_info->v1_3.gc_instruction_cache_size_per_sqc);
875ff9a7ee8824 Likun Gao     2024-08-22  2056  			adev->gfx.config.gc_instruction_cache_line_size = le32_to_cpu(gc_info->v1_3.gc_instruction_cache_line_size);
875ff9a7ee8824 Likun Gao     2024-08-22  2057  			adev->gfx.config.gc_scalar_data_cache_size_per_sqc = le32_to_cpu(gc_info->v1_3.gc_scalar_data_cache_size_per_sqc);
875ff9a7ee8824 Likun Gao     2024-08-22  2058  			adev->gfx.config.gc_scalar_data_cache_line_size = le32_to_cpu(gc_info->v1_3.gc_scalar_data_cache_line_size);
875ff9a7ee8824 Likun Gao     2024-08-22  2059  			adev->gfx.config.gc_tcc_size = le32_to_cpu(gc_info->v1_3.gc_tcc_size);
875ff9a7ee8824 Likun Gao     2024-08-22  2060  			adev->gfx.config.gc_tcc_cache_line_size = le32_to_cpu(gc_info->v1_3.gc_tcc_cache_line_size);
875ff9a7ee8824 Likun Gao     2024-08-22  2061  		}
46848df41bd369 Hawking Zhang 2026-05-16  2062  		if (le16_to_cpu(gc_info->v1.header.version_minor) == 4 ||
46848df41bd369 Hawking Zhang 2026-05-16  2063  		    le16_to_cpu(gc_info->v1.header.version_minor) > 5) {
46848df41bd369 Hawking Zhang 2026-05-16  2064  			dev_err(adev->dev,
46848df41bd369 Hawking Zhang 2026-05-16  2065  				"Unsupported GC info table %d.%d\n",
46848df41bd369 Hawking Zhang 2026-05-16  2066  				le16_to_cpu(gc_info->v1.header.version_major),
46848df41bd369 Hawking Zhang 2026-05-16  2067  				le16_to_cpu(gc_info->v1.header.version_minor));
46848df41bd369 Hawking Zhang 2026-05-16  2068  			return -EINVAL;
46848df41bd369 Hawking Zhang 2026-05-16  2069  		}
46848df41bd369 Hawking Zhang 2026-05-16  2070  		if (le16_to_cpu(gc_info->v1.header.version_minor) == 5) {
46848df41bd369 Hawking Zhang 2026-05-16  2071  			adev->gfx.config.gc_max_num_residency_ways = le32_to_cpu(gc_info->v1_5.gc_max_num_residency_ways);
46848df41bd369 Hawking Zhang 2026-05-16  2072  			adev->gfx.config.gc_cache_ways_size_in_bytes = le32_to_cpu(gc_info->v1_5.gc_cache_ways_size_in_bytes);
46848df41bd369 Hawking Zhang 2026-05-16  2073  			adev->gfx.config.gc_reserved = le32_to_cpu(gc_info->v1_5.gc_reserved);
b69b3051d6b044 Hawking Zhang 2026-06-12  2074  
b69b3051d6b044 Hawking Zhang 2026-06-12  2075  			num_wgps_per_sa = le32_to_cpu(gc_info->v1.gc_num_wgp0_per_sa) +
b69b3051d6b044 Hawking Zhang 2026-06-12  2076  					  le32_to_cpu(gc_info->v1.gc_num_wgp1_per_sa);
b69b3051d6b044 Hawking Zhang 2026-06-12  2077  			num_wgps_per_sa1 = le32_to_cpu(gc_info->v1_5.gc_num_wgp0_per_sa1) +
46848df41bd369 Hawking Zhang 2026-05-16  2078  					   le32_to_cpu(gc_info->v1_5.gc_num_wgp1_per_sa1);
b69b3051d6b044 Hawking Zhang 2026-06-12 @2079  			adev->gfx.config.max_cu_per_sh = num_wgps_per_sa >= num_wgps_per_sa1 ?
b69b3051d6b044 Hawking Zhang 2026-06-12  2080  							 num_wgps_per_sa : num_wgps_per_sa1;
46848df41bd369 Hawking Zhang 2026-05-16  2081  		}
0cd7f378b0927e Alex Deucher  2021-12-15  2082  		break;
0cd7f378b0927e Alex Deucher  2021-12-15  2083  	case 2:
0cd7f378b0927e Alex Deucher  2021-12-15  2084  		adev->gfx.config.max_shader_engines = le32_to_cpu(gc_info->v2.gc_num_se);
0cd7f378b0927e Alex Deucher  2021-12-15  2085  		adev->gfx.config.max_cu_per_sh = le32_to_cpu(gc_info->v2.gc_num_cu_per_sh);
0cd7f378b0927e Alex Deucher  2021-12-15  2086  		adev->gfx.config.max_sh_per_se = le32_to_cpu(gc_info->v2.gc_num_sh_per_se);
0cd7f378b0927e Alex Deucher  2021-12-15  2087  		adev->gfx.config.max_backends_per_se = le32_to_cpu(gc_info->v2.gc_num_rb_per_se);
0cd7f378b0927e Alex Deucher  2021-12-15  2088  		adev->gfx.config.max_texture_channel_caches = le32_to_cpu(gc_info->v2.gc_num_tccs);
0cd7f378b0927e Alex Deucher  2021-12-15  2089  		adev->gfx.config.max_gprs = le32_to_cpu(gc_info->v2.gc_num_gprs);
0cd7f378b0927e Alex Deucher  2021-12-15  2090  		adev->gfx.config.max_gs_threads = le32_to_cpu(gc_info->v2.gc_num_max_gs_thds);
0cd7f378b0927e Alex Deucher  2021-12-15  2091  		adev->gfx.config.gs_vgt_table_depth = le32_to_cpu(gc_info->v2.gc_gs_table_depth);
0cd7f378b0927e Alex Deucher  2021-12-15  2092  		adev->gfx.config.gs_prim_buffer_depth = le32_to_cpu(gc_info->v2.gc_gsprim_buff_depth);
0cd7f378b0927e Alex Deucher  2021-12-15  2093  		adev->gfx.config.double_offchip_lds_buf = le32_to_cpu(gc_info->v2.gc_double_offchip_lds_buffer);
0cd7f378b0927e Alex Deucher  2021-12-15  2094  		adev->gfx.cu_info.wave_front_size = le32_to_cpu(gc_info->v2.gc_wave_size);
0cd7f378b0927e Alex Deucher  2021-12-15  2095  		adev->gfx.cu_info.max_waves_per_simd = le32_to_cpu(gc_info->v2.gc_max_waves_per_simd);
0cd7f378b0927e Alex Deucher  2021-12-15  2096  		adev->gfx.cu_info.max_scratch_slots_per_cu = le32_to_cpu(gc_info->v2.gc_max_scratch_slots_per_cu);
0cd7f378b0927e Alex Deucher  2021-12-15  2097  		adev->gfx.cu_info.lds_size = le32_to_cpu(gc_info->v2.gc_lds_size);
0cd7f378b0927e Alex Deucher  2021-12-15  2098  		adev->gfx.config.num_sc_per_sh = le32_to_cpu(gc_info->v2.gc_num_sc_per_se) /
0cd7f378b0927e Alex Deucher  2021-12-15  2099  			le32_to_cpu(gc_info->v2.gc_num_sh_per_se);
0cd7f378b0927e Alex Deucher  2021-12-15  2100  		adev->gfx.config.num_packer_per_sc = le32_to_cpu(gc_info->v2.gc_num_packer_per_sc);
f7a17b2b36043a Mukul Joshi   2023-10-26  2101  		if (le16_to_cpu(gc_info->v2.header.version_minor) == 1) {
46b55e25c94af1 Le Ma         2023-08-14  2102  			adev->gfx.config.gc_num_tcp_per_sa = le32_to_cpu(gc_info->v2_1.gc_num_tcp_per_sh);
46b55e25c94af1 Le Ma         2023-08-14  2103  			adev->gfx.config.gc_tcp_size_per_cu = le32_to_cpu(gc_info->v2_1.gc_tcp_size_per_cu);
46b55e25c94af1 Le Ma         2023-08-14  2104  			adev->gfx.config.gc_num_sdp_interface = le32_to_cpu(gc_info->v2_1.gc_num_sdp_interface); /* per XCD */
46b55e25c94af1 Le Ma         2023-08-14  2105  			adev->gfx.config.gc_num_cu_per_sqc = le32_to_cpu(gc_info->v2_1.gc_num_cu_per_sqc);
46b55e25c94af1 Le Ma         2023-08-14  2106  			adev->gfx.config.gc_l1_instruction_cache_size_per_sqc = le32_to_cpu(gc_info->v2_1.gc_instruction_cache_size_per_sqc);
46b55e25c94af1 Le Ma         2023-08-14  2107  			adev->gfx.config.gc_l1_data_cache_size_per_sqc = le32_to_cpu(gc_info->v2_1.gc_scalar_data_cache_size_per_sqc);
46b55e25c94af1 Le Ma         2023-08-14  2108  			adev->gfx.config.gc_tcc_size = le32_to_cpu(gc_info->v2_1.gc_tcc_size); /* per XCD */
46b55e25c94af1 Le Ma         2023-08-14  2109  		}
0cd7f378b0927e Alex Deucher  2021-12-15  2110  		break;
0cd7f378b0927e Alex Deucher  2021-12-15  2111  	default:
0cd7f378b0927e Alex Deucher  2021-12-15  2112  		dev_err(adev->dev,
0cd7f378b0927e Alex Deucher  2021-12-15  2113  			"Unhandled GC info table %d.%d\n",
8eece29c4ecd5c Alex Deucher  2022-03-30  2114  			le16_to_cpu(gc_info->v1.header.version_major),
8eece29c4ecd5c Alex Deucher  2022-03-30  2115  			le16_to_cpu(gc_info->v1.header.version_minor));
0cd7f378b0927e Alex Deucher  2021-12-15  2116  		return -EINVAL;
0cd7f378b0927e Alex Deucher  2021-12-15  2117  	}
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  2118  	return 0;
24681cb50bcbe0 Alex Deucher  2022-03-29  2119  }
24681cb50bcbe0 Alex Deucher  2022-03-29  2120  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
