Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AA33A4F4B
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Jul 2026 19:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784663137; cv=none; b=kBI0PGMydm7JyW7a5nDRSN83HibHSaNDC32o2OzNeYZDI7l7f7Xr4W87hB44zrxkACzU4hROre2GA5DjQ0dVh4jsqA7kTxU8BX1TrBjVnizWrUljvVAu57XAyimp68JX1PWur3aP/MfJ4JnxqQWnNM24yaMpktZfmKuFnUGgDvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784663137; c=relaxed/simple;
	bh=okT17QbZvhvAIf6Mi/ssz63Hy/O83RLLAJmIqvsy+4g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ohUlOIwPGoD/8biE5NSBROCq0Xl0hZHvUjZ+aqRQS0qACoaue3eY0JXQDFAkmEpBCNWsk2JTxCQaiieUTrt7NMtaDIkAipWANz6BK3J3robtNok+5u7QJ2+knVSo6mguFvkewsQ5xJ/GAhlELAWoOF+DeU8I3680FcNsEyMv/WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hqf0Q4OS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hqf0Q4OS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784663136; x=1816199136;
  h=date:from:to:cc:subject:message-id;
  bh=okT17QbZvhvAIf6Mi/ssz63Hy/O83RLLAJmIqvsy+4g=;
  b=Hqf0Q4OSByVAltnweskVhHFYvAAXs4TNNMBq2XDy0H1BY4K6NAdBSMB0
   +sUt9fxO8g/dDBmoI2v7Uh7RZ1l7MBHFSQ3gWyaruzTvKV/hSRrrRZKMj
   6zWwyajRjCWyzvhG5zEOykrXLCaHcSdUQtVj/3JGDJSFmM6jKHNEHOiGs
   SmDVWDSyiVnhexRRNQTCF5+Xs7jpCIzK3IK3D63/sHe6Rrw0B9IqO67oL
   uWxgq1/+lU7w+QGUcoPfsG9dx78AuvamU1lno9k6/SG63eUw6BZJk480X
   2P0aljcleDDe4Tz8EUUYFFSlwqQqosGdFvX3V0NA18vkwKP+9Xp42AocI
   A==;
X-CSE-ConnectionGUID: cE88CyAeS6qMjcB1xd1jpA==
X-CSE-MsgGUID: XaujxMsfTw+8Afr1/oZSCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85042472"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="85042472"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 12:45:35 -0700
X-CSE-ConnectionGUID: hyHufQ35QOS2EXiMb7/avQ==
X-CSE-MsgGUID: gc2SZmo3ToCvmjd5/DHvXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="287891708"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 Jul 2026 12:45:33 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmGPC-00000000Xuc-3lyO;
	Tue, 21 Jul 2026 19:45:30 +0000
Date: Wed, 22 Jul 2026 03:44:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5141/7793]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dio/dcn10/dcn10_link_encoder.c:1192
 dcn10_link_encoder_dp_set_phy_pattern() warn: variable dereferenced before
 check 'param' (see line 1169)
Message-ID: <202607220316.QHZEudqb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Charlene Liu <Charlene.Liu@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Gabe Teeger <gabe.teeger@amd.com>
CC: George Zhang <george.zhang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3fe08b9796f36ef437ab9328e7dd1e5ff2d66603
commit: b6f466c509ad2f390b3fc91cd0de4783554f5f98 [5141/7793] drm/amd/display: add null pointer access check
:::::: branch date: 28 hours ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-161-20260721 (https://download.01.org/0day-ci/archive/20260722/202607220316.QHZEudqb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607220316.QHZEudqb-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dio/dcn10/dcn10_link_encoder.c:1192 dcn10_link_encoder_dp_set_phy_pattern() warn: variable dereferenced before check 'param' (see line 1169)

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dio/dcn10/dcn10_link_encoder.c:1206 dcn10_link_encoder_dp_set_phy_pattern() warn: variable dereferenced before check 'param' (see line 1169)

vim +/param +1192 drivers/gpu/drm/amd/amdgpu/../display/dc/dio/dcn10/dcn10_link_encoder.c

f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1161  
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1162  /* set DP PHY test and training patterns */
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1163  void dcn10_link_encoder_dp_set_phy_pattern(
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1164  	struct link_encoder *enc,
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1165  	const struct encoder_set_dp_phy_pattern_param *param)
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1166  {
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1167  	struct dcn10_link_encoder *enc10 = TO_DCN10_LINK_ENC(enc);
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1168  
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26 @1169  	switch (param->dp_phy_pattern) {
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1170  	case DP_TEST_PATTERN_TRAINING_PATTERN1:
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1171  		dcn10_link_encoder_set_dp_phy_pattern_training_pattern(enc, 0);
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1172  		break;
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1173  	case DP_TEST_PATTERN_TRAINING_PATTERN2:
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1174  		dcn10_link_encoder_set_dp_phy_pattern_training_pattern(enc, 1);
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1175  		break;
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1176  	case DP_TEST_PATTERN_TRAINING_PATTERN3:
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1177  		dcn10_link_encoder_set_dp_phy_pattern_training_pattern(enc, 2);
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1178  		break;
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1179  	case DP_TEST_PATTERN_TRAINING_PATTERN4:
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1180  		dcn10_link_encoder_set_dp_phy_pattern_training_pattern(enc, 3);
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1181  		break;
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1182  	case DP_TEST_PATTERN_D102:
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1183  		set_dp_phy_pattern_d102(enc10);
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1184  		break;
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1185  	case DP_TEST_PATTERN_SYMBOL_ERROR:
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1186  		set_dp_phy_pattern_symbol_error(enc10);
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1187  		break;
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1188  	case DP_TEST_PATTERN_PRBS7:
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1189  		set_dp_phy_pattern_prbs7(enc10);
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1190  		break;
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1191  	case DP_TEST_PATTERN_80BIT_CUSTOM:
b6f466c509ad2f drivers/gpu/drm/amd/display/dc/dio/dcn10/dcn10_link_encoder.c Charlene Liu   2026-06-22 @1192  		if (param)
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1193  			set_dp_phy_pattern_80bit_custom(
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1194  				enc10, param->custom_pattern);
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1195  		break;
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1196  	case DP_TEST_PATTERN_CP2520_1:
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1197  		set_dp_phy_pattern_hbr2_compliance_cp2520_2(enc10, 1);
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1198  		break;
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1199  	case DP_TEST_PATTERN_CP2520_2:
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1200  		set_dp_phy_pattern_hbr2_compliance_cp2520_2(enc10, 2);
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1201  		break;
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1202  	case DP_TEST_PATTERN_CP2520_3:
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1203  		set_dp_phy_pattern_hbr2_compliance_cp2520_2(enc10, 3);
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1204  		break;
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1205  	case DP_TEST_PATTERN_VIDEO_MODE: {
b6f466c509ad2f drivers/gpu/drm/amd/display/dc/dio/dcn10/dcn10_link_encoder.c Charlene Liu   2026-06-22  1206  		if (param)
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1207  			set_dp_phy_pattern_passthrough_mode(
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1208  				enc10, param->dp_panel_mode);
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1209  		break;
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1210  	}
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1211  
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1212  	default:
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1213  		/* invalid phy pattern */
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1214  		ASSERT_CRITICAL(false);
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1215  		break;
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1216  	}
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1217  }
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1218  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
