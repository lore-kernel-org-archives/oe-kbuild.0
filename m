Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B8815B971
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 07:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768721473; cv=none; b=RKVlEYQQfNBD0lwxbz36juFnMaqtCEWGZSiiOc1Rb8iUGEqWLHSmQk331tbpmXQUUibNjobKOf4dnRHQZr/6ApwUVLSddCgLHc5jRWZJ8Uzt9HoqB5oD4HPN95ZUFflkcQWc3hhDLHIPCdOzntX7tVxaYbnheU1b5rHOahoqcBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768721473; c=relaxed/simple;
	bh=1H8ivweSBCeWTQ/cJ76Tc3sZm+X58OLefJKvw7s2Ass=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NTiLnU748q4uJDqZ/ydkXyS9t4b51mD6N1wjgXKGKPD2eg8msVQm9GJ9+MUuUAjSjaFp2qADmIe3MCnz7ANOF1nBCgCobQJhY2679yAPLcvEqob5KGVocTYWDw4BEAJaJFqlL4WBMIdCWzNll6lr8CbO4Vx+s3sdpBMkqtyNdnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PT78E+k+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PT78E+k+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768721472; x=1800257472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1H8ivweSBCeWTQ/cJ76Tc3sZm+X58OLefJKvw7s2Ass=;
  b=PT78E+k+R9KVErBB/IolOOdkU/oOzB5/eYAjyFDRK5DEi6eHdmjD79p/
   psAuFWyiFYIwE+S2EF1V/jrBvqNcJ7wnS3ydCdxAyfpApszVaZuzDK/Qd
   SK/jQtgShlHXpB7ZKNqCReIJSvP8VUVbHOqZQLA9LI8rrYJKY+Yun7Q/r
   jAUY6Um2+QF/NYFkl0AE6kA6bn3qDvi1v1cSjDPUojC89xMyh35BvoYJ+
   3jhSUe/QpFtI/6yXqlo4xkNCh027xXlf9JYZw8kbTb/z8QEioPQliHsHL
   Qmrsbn7WuQwEheHAWYZa8MflTxSlGLa3uTHEg3byBco+nRTadYsCcAw2Q
   g==;
X-CSE-ConnectionGUID: hgsrRagkTCSwy48E9sVZDQ==
X-CSE-MsgGUID: Z1veQCKRSCGFtnCF88DGZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="80269254"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="80269254"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 23:31:12 -0800
X-CSE-ConnectionGUID: c3ztukm1RkieEBGWrFSa1g==
X-CSE-MsgGUID: 3x3lig+SSAyy40u8fr8OwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="210073648"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Jan 2026 23:31:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhNFb-00000000Mlg-3OLh;
	Sun, 18 Jan 2026 07:31:07 +0000
Date: Sun, 18 Jan 2026 15:30:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: 
 =?us-ascii?Q?drivers/gpu/drm/amd/display/dc/dml2=5F0/dml21/src/dml2=5Fcor?=
 =?us-ascii?Q?e/dml2=5Fcore=5Fdcn4=5Fcalcs.c:6405:53-54:?= WARNING
 opportunity for min()
Message-ID: <202601181559.VRtgn7V7-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e84d960149e71e8d5e4db69775ce31305898ed0c
commit: e6a8a000cfe6a1106c17ab4a47eb6dd21596968c drm/amd/display: Rename dml2 to dml2_0 folder
date:   3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-101-20260112 (https://download.01.org/0day-ci/archive/20260118/202601181559.VRtgn7V7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601181559.VRtgn7V7-lkp@intel.com/

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
>> drivers/gpu/drm/amd/display/dc/dml2_0/dml2_wrapper.c:383:42-43: WARNING opportunity for max()
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
