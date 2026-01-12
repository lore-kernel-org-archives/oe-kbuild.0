Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F183D22AE65
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 05:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768196402; cv=none; b=dCAHL68tNMmAEs/gaoMCIvwmsa+ZuTNjlzd/oGa6J0etf6780IuLRh7YFbr+oOvaD1oMPHawxOjt3P8WlxquZqvARhSuncI8IffbNlixAit9n8Ld834fP/Vrmd8h7DIVOhDE/TJg8QlfkzVeb98YH6Ki43JBr8IyYecZXvyo/BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768196402; c=relaxed/simple;
	bh=A+948X6ZYkPwzT0HXT30FGusT7zuz8+2orb6i+th20E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IS1rowIdQNt3Lm3WRgQ2+n3DzaxPHxOEN0w//0AxUJjjmfb8+5/rKSYu6/ngIiKudacWioYKIN/1nP7f15317kYk/WNcmn+oNY586CR1QuBiS9MH9THDymDsWFmU6JEsNF1beJhPRJ9dOuAx+lWrMMpSxUbuaPvmD82dvASgmWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XFt0WqQU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XFt0WqQU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768196400; x=1799732400;
  h=date:from:to:cc:subject:message-id;
  bh=A+948X6ZYkPwzT0HXT30FGusT7zuz8+2orb6i+th20E=;
  b=XFt0WqQUscujHkk2niKdFx/2k7um5XJkeesWH1b9asIIMb9uTYYGqdU7
   x8z1gDLejib1e/Vmato9yDH4sxpq08fGo8c+Avn3Gw4b7RR1EgiseEIeQ
   GT0Du9W9tptsLWu4Yd6ZNrrNES2gbnHySBi3wGI8h7gCRhMj/iIab1tAc
   UdRyX+S5Xg49/5AwiPJih9V3/4bkDzXQ8VB7QyWxxgRVY+TjhyTtDshgi
   p8Bti975iwdX/qgvK48i5idyNAHzYPh0AzoKln8a5epS99qjrI8OuJwwI
   bUIgF/lzlmGaELoA6mwh3Md0Popkt+4du0Ryb6wf378Jcy8SdclT7UlkV
   g==;
X-CSE-ConnectionGUID: SsZpqCDFTj+VGG1UedA6YQ==
X-CSE-MsgGUID: yd8wWhvGTEGWrm3pslocIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69395533"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69395533"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 21:40:00 -0800
X-CSE-ConnectionGUID: D+P/Qk3xTuyejGv06tGuHA==
X-CSE-MsgGUID: 0QkzRh5gRUuQ6Ba+4MrP2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="208835792"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Jan 2026 21:39:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfAeg-00000000D2G-39hB;
	Mon, 12 Jan 2026 05:39:54 +0000
Date: Mon, 12 Jan 2026 13:39:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [agd5f:drm-next-6.20 405/461]
 drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_helpers.c:990
 set_replay_frame_skip_number() warn: variable dereferenced before check
 'link' (see line 987)
Message-ID: <202601121355.O4u8C4fh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: ChunTao Tso <chuntao.tso@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Robin Chen <robin.chen@amd.com>
CC: Chenyu Chen <chen-yu.chen@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-6.20
head:   38a0f4cf8c6147fd10baa206ab349f8ff724e391
commit: 9862d2ac667a0e731aa75c17c1b146da809bc3ae [405/461] drm/amd/display: Add frame skip feature support flag
:::::: branch date: 3 days ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-161-20260108 (https://download.01.org/0day-ci/archive/20260112/202601121355.O4u8C4fh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601121355.O4u8C4fh-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_helpers.c:990 set_replay_frame_skip_number() warn: variable dereferenced before check 'link' (see line 987)

vim +/link +990 drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_helpers.c

e379787cbc2aa7 Tom Chung   2023-12-01   977  
f3f48d6ce5089b Chuntao Tso 2025-10-31   978  void set_replay_frame_skip_number(struct dc_link *link,
f3f48d6ce5089b Chuntao Tso 2025-10-31   979  	enum replay_coasting_vtotal_type type,
f3f48d6ce5089b Chuntao Tso 2025-10-31   980  	uint32_t coasting_vtotal_refresh_rate_mhz,
f3f48d6ce5089b Chuntao Tso 2025-10-31   981  	uint32_t flicker_free_refresh_rate_mhz,
f3f48d6ce5089b Chuntao Tso 2025-10-31   982  	bool is_defer)
f3f48d6ce5089b Chuntao Tso 2025-10-31   983  {
f3f48d6ce5089b Chuntao Tso 2025-10-31   984  	uint32_t *frame_skip_number_array = NULL;
f3f48d6ce5089b Chuntao Tso 2025-10-31   985  	uint32_t frame_skip_number = 0;
f3f48d6ce5089b Chuntao Tso 2025-10-31   986  
9862d2ac667a0e ChunTao Tso 2025-12-08  @987  	if (false == link->replay_settings.config.frame_skip_supported)
9862d2ac667a0e ChunTao Tso 2025-12-08   988  		return;
9862d2ac667a0e ChunTao Tso 2025-12-08   989  
f3f48d6ce5089b Chuntao Tso 2025-10-31  @990  	if (link == NULL || flicker_free_refresh_rate_mhz == 0 || coasting_vtotal_refresh_rate_mhz == 0)
f3f48d6ce5089b Chuntao Tso 2025-10-31   991  		return;
f3f48d6ce5089b Chuntao Tso 2025-10-31   992  
f3f48d6ce5089b Chuntao Tso 2025-10-31   993  	if (is_defer)
f3f48d6ce5089b Chuntao Tso 2025-10-31   994  		frame_skip_number_array = link->replay_settings.defer_frame_skip_number_table;
f3f48d6ce5089b Chuntao Tso 2025-10-31   995  	else
f3f48d6ce5089b Chuntao Tso 2025-10-31   996  		frame_skip_number_array = link->replay_settings.frame_skip_number_table;
f3f48d6ce5089b Chuntao Tso 2025-10-31   997  
f3f48d6ce5089b Chuntao Tso 2025-10-31   998  	if (frame_skip_number_array == NULL)
f3f48d6ce5089b Chuntao Tso 2025-10-31   999  		return;
f3f48d6ce5089b Chuntao Tso 2025-10-31  1000  
f3f48d6ce5089b Chuntao Tso 2025-10-31  1001  	frame_skip_number = coasting_vtotal_refresh_rate_mhz / flicker_free_refresh_rate_mhz;
f3f48d6ce5089b Chuntao Tso 2025-10-31  1002  
f3f48d6ce5089b Chuntao Tso 2025-10-31  1003  	if (frame_skip_number >= 1)
f3f48d6ce5089b Chuntao Tso 2025-10-31  1004  		frame_skip_number_array[type] = frame_skip_number - 1;
f3f48d6ce5089b Chuntao Tso 2025-10-31  1005  	else
f3f48d6ce5089b Chuntao Tso 2025-10-31  1006  		frame_skip_number_array[type] = 0;
f3f48d6ce5089b Chuntao Tso 2025-10-31  1007  }
f3f48d6ce5089b Chuntao Tso 2025-10-31  1008  

:::::: The code at line 990 was first introduced by commit
:::::: f3f48d6ce5089b183fdea025a8a7798a220168f6 drm/amd/display: To support Replay frame skip mode

:::::: TO: Chuntao Tso <chunttso@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
