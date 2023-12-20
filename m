Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728ED405D3
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Dec 2023 18:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GKT7LKUA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703098329; x=1734634329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=feoiW7VVqz0xJDt4hoOknU/3WFv8hKl7GC0DD0jmyyc=;
  b=GKT7LKUA5jU3J6Xj8yttpTq3dRDFBCcR2zwUaPMUisIyYQanJzKFFDB0
   MIHsXkM3RKDDfXTSoFKvqE14bbuxiGo/7G/xLjBOnNkPCvSpeGEb14gDf
   3wYHrssc8W4Cq9n7WX+BnEgU7xwEaVtKMhybxLRQm+QXfbbyddsVpahna
   HmLpc/Lz5SnSGftlMZHv6NUJ2eyukzPWowWoeoKVRrQDLblM1Djxix9Uv
   4+HoezxM3+oi/euLiimsu5PEFwTUbAcEUBz0898BbtSbJmvgNJ9vpRXar
   WjGwDIafFIxk1N87C3cwolMtAyNLN6pt3GbGR70WEEYQryehLI75aBHYE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="9237255"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="9237255"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 10:52:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="949614838"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="949614838"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Dec 2023 10:52:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rG1fp-0007LN-1N;
	Wed, 20 Dec 2023 18:52:05 +0000
Date: Thu, 21 Dec 2023 02:51:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 9130/9550]
 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_state.c:49:15: sparse:
 sparse: memcpy with byte count of 215064
Message-ID: <202312210249.vErCjDjW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_state.c:49:15: sparse: sparse: memcpy with byte count of 215064"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Dillon Varone <dillon.varone@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
CC: Jun Lei <jun.lei@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20d857259d7d10cd0d5e8b60608455986167cfad
commit: 09a4ec5da92c84952db117f0d576fdd8368c873a [9130/9550] drm/amd/display: Refactor dc_state interface
:::::: branch date: 9 hours ago
:::::: commit date: 23 hours ago
config: arc-randconfig-r111-20231220 (https://download.01.org/0day-ci/archive/20231221/202312210249.vErCjDjW-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231221/202312210249.vErCjDjW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312210249.vErCjDjW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_state.c:49:15: sparse: sparse: memcpy with byte count of 215064
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_state.c:80:15: sparse: sparse: memcpy with byte count of 244508

vim +49 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_state.c

09a4ec5da92c84 Dillon Varone 2023-11-17  41  
09a4ec5da92c84 Dillon Varone 2023-11-17  42  /* Public dc_state functions */
09a4ec5da92c84 Dillon Varone 2023-11-17  43  static void init_state(struct dc *dc, struct dc_state *state)
09a4ec5da92c84 Dillon Varone 2023-11-17  44  {
09a4ec5da92c84 Dillon Varone 2023-11-17  45  	/* Each context must have their own instance of VBA and in order to
09a4ec5da92c84 Dillon Varone 2023-11-17  46  	 * initialize and obtain IP and SOC the base DML instance from DC is
09a4ec5da92c84 Dillon Varone 2023-11-17  47  	 * initially copied into every context
09a4ec5da92c84 Dillon Varone 2023-11-17  48  	 */
09a4ec5da92c84 Dillon Varone 2023-11-17 @49  	memcpy(&state->bw_ctx.dml, &dc->dml, sizeof(struct display_mode_lib));
09a4ec5da92c84 Dillon Varone 2023-11-17  50  }
09a4ec5da92c84 Dillon Varone 2023-11-17  51  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
