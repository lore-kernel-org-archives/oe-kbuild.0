Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD6C4AA018
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Sep 2026 10:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789553550; cv=none; b=Rii9WJgmuMJz6xx4NAD9lmbNey7OBKOaAbAeU39K8sIVE4D/8h06YYVYo0anW4fWZqmPmRR5zOs+wtWKCLUao9fkAXPfj2Jq9s1761U07i1vNFm4tXzBfLs6Y4/0NFAyPNjT1JN5Ed/XydPG1JTJ6hkZA5q36BSpi7xlCgwLaKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789553550; c=relaxed/simple;
	bh=IPH0cLl+xIE6wU6FrLC6qHokqwS0KvITm46LDqjmKQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pY70VKHWOa2m2JSV8I98/gpa1GvIhT/DK4yPHnzI77/i+fN3vTRiOQe6Ns+bHWIB+6dBVQ1hfyiai1NdWo1N3QhVlKavn+Y9nkrb78gRWV4V5gUUjgbnjEICTt/hA7cGTZxMEkK7oaLEu2bvHqap0mU7xSWAmLBZOZHT3LW2Gps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ak5uVD0M; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ak5uVD0M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789553535; x=1821089535;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IPH0cLl+xIE6wU6FrLC6qHokqwS0KvITm46LDqjmKQE=;
  b=Ak5uVD0MWl50CZVAZutEYpp4B5SwcLBQRwyP3d6FmFbcoPip4X12ZHPH
   e7TvuH9O9p0BWZxfwLfcME+tijTesRhO23D2UWAMbjsf/MrrUvczxH6G9
   aMkc7dGMK5/IOrfK1pixP9MqgmWDhIMjZjh8Q2L0H/Rd7Ic/DTNmRGeRO
   zNaWQzKEn4ZkKOzCMG7dgD3TMHXfNST/Jt1nBKsDgnkqXK6BCG8cqoxFp
   KNvv+0GNjUJfRiJl77+gVcXVUAJsquHMktylfjRKZ2PnoEuet9KXMkydH
   /6ThhF+9BQZh9+J7WgWVP3MK4zOpvfbYR3hc0mwVx3ejUtVIHKKRCtiTK
   A==;
X-CSE-ConnectionGUID: TYsXHsOWSResUfFadZV0FQ==
X-CSE-MsgGUID: zGkbLprZRVOHyI77ABLJzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89945290"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89945290"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 03:12:06 -0700
X-CSE-ConnectionGUID: Mkryk8xwSuC3JE+Gg5Gd7w==
X-CSE-MsgGUID: do6JzUyaQm2c5oEVjH4Vgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="278537636"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 16 Sep 2026 03:12:05 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6mcU-0000000006l-3M26;
	Wed, 16 Sep 2026 10:12:02 +0000
Date: Wed, 16 Sep 2026 12:11:09 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: 
 =?us-ascii?Q?drivers/gpu/drm/amd/display/dc/dml2=5F0/dml21/src/dml2=5Fcor?=
 =?us-ascii?Q?e/dml2=5Fcore=5Fdcn4=5Fcalcs.c:6405:53-54:?= WARNING
 opportunity for min()
Message-ID: <202609161214.PVwUTLs0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Austin Zheng <Austin.Zheng@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Dillon Varone <dillon.varone@amd.com>
CC: waynelin <Wayne.Lin@amd.com>

Hi Austin,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
commit: e6a8a000cfe6a1106c17ab4a47eb6dd21596968c drm/amd/display: Rename dml2 to dml2_0 folder
date:   11 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-103-20260911 (https://download.01.org/0day-ci/archive/20260916/202609161214.PVwUTLs0-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e6a8a000cfe6 ("drm/amd/display: Rename dml2 to dml2_0 folder")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609161214.PVwUTLs0-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:6405:53-54: WARNING opportunity for min()
--
>> drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:181:81-82: WARNING opportunity for max()
   drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:182:81-82: WARNING opportunity for max()
   drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:183:85-86: WARNING opportunity for max()
   drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:106:31-32: WARNING opportunity for max()
   drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:114:31-32: WARNING opportunity for max()
   drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:122:35-36: WARNING opportunity for max()
   drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:126:88-89: WARNING opportunity for max()
   drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:127:88-89: WARNING opportunity for max()
   drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:128:92-93: WARNING opportunity for max()
   drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:137:31-32: WARNING opportunity for max()
   drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:145:31-32: WARNING opportunity for max()
   drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:153:35-36: WARNING opportunity for max()
   drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:157:100-101: WARNING opportunity for max()
   drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:158:100-101: WARNING opportunity for max()
   drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:159:104-105: WARNING opportunity for max()
   drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:65:31-32: WARNING opportunity for max()
   drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:73:31-32: WARNING opportunity for max()
   drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:81:35-36: WARNING opportunity for max()
   drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:85:82-83: WARNING opportunity for max()
   drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:86:82-83: WARNING opportunity for max()
   drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:87:86-87: WARNING opportunity for max()
--
>> drivers/gpu/drm/amd/display/dc/dml2_0/dml2_mall_phantom.c:478:49-50: WARNING opportunity for max()
   drivers/gpu/drm/amd/display/dc/dml2_0/dml2_mall_phantom.c:575:42-43: WARNING opportunity for max()
--
>> drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_mcg/dml2_mcg_dcn4.c:73:62-63: WARNING opportunity for max()
--
>> drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_standalone_libraries/lib_float_math.c:44:13-14: WARNING opportunity for max()
   drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_standalone_libraries/lib_float_math.c:71:11-12: WARNING opportunity for max()
   drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_standalone_libraries/lib_float_math.c:76:11-12: WARNING opportunity for max()
   drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_standalone_libraries/lib_float_math.c:81:30-31: WARNING opportunity for max()
>> drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_standalone_libraries/lib_float_math.c:35:13-14: WARNING opportunity for min()
--
>> drivers/gpu/drm/amd/display/dc/dml2_0/display_mode_util.c:407:140-184: ERROR: test of a variable/field address

vim +6405 drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c

70839da6360500 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c Aurabindo Pillai 2024-04-19  6394  
70839da6360500 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c Aurabindo Pillai 2024-04-19  6395  static double get_bandwidth_available_for_immediate_flip(enum dml2_core_internal_soc_state_type eval_state,
70839da6360500 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c Aurabindo Pillai 2024-04-19  6396  	double urg_bandwidth_required[dml2_core_internal_soc_state_max][dml2_core_internal_bw_max], // no flip
70839da6360500 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c Aurabindo Pillai 2024-04-19  6397  	double urg_bandwidth_available[dml2_core_internal_soc_state_max][dml2_core_internal_bw_max])
70839da6360500 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c Aurabindo Pillai 2024-04-19  6398  {
70839da6360500 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c Aurabindo Pillai 2024-04-19  6399  	double flip_bw_available_mbps;
70839da6360500 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c Aurabindo Pillai 2024-04-19  6400  	double flip_bw_available_sdp_mbps;
70839da6360500 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c Aurabindo Pillai 2024-04-19  6401  	double flip_bw_available_dram_mbps;
70839da6360500 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c Aurabindo Pillai 2024-04-19  6402  
70839da6360500 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c Aurabindo Pillai 2024-04-19  6403  	flip_bw_available_sdp_mbps = urg_bandwidth_available[eval_state][dml2_core_internal_bw_sdp] - urg_bandwidth_required[eval_state][dml2_core_internal_bw_sdp];
70839da6360500 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c Aurabindo Pillai 2024-04-19  6404  	flip_bw_available_dram_mbps = urg_bandwidth_available[eval_state][dml2_core_internal_bw_dram] - urg_bandwidth_required[eval_state][dml2_core_internal_bw_dram];
70839da6360500 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c Aurabindo Pillai 2024-04-19 @6405  	flip_bw_available_mbps = flip_bw_available_sdp_mbps < flip_bw_available_dram_mbps ? flip_bw_available_sdp_mbps : flip_bw_available_dram_mbps;
70839da6360500 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c Aurabindo Pillai 2024-04-19  6406  

:::::: The code at line 6405 was first introduced by commit
:::::: 70839da6360500a82e4d5f78499284474cbed7c1 drm/amd/display: Add new DCN401 sources

:::::: TO: Aurabindo Pillai <aurabindo.pillai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
