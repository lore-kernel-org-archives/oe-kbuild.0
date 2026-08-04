Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755EC345EA9
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Aug 2026 12:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845956; cv=none; b=ljsnDA1MTZrCTn0GJSnV0tM+aQtRDZvyaz+nXxj+ldVVcIFJZ+byu/XXE3YgB8UkCRq6EGFKpoZ+pNPo6kyepWWRF3JPPLirUxk7EYh2pvJG1hVm+w8wdGJ94s4T9P49cxhiHRW2R1DD2AB0uaYWQPkyKT+KRPXKU8X92uBHaLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845956; c=relaxed/simple;
	bh=D+MrTQZA60uxv7a+U3lIDwebghLZBL4MKKXKMR31CfA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UdI7aUO0lk3GLpBKttPTJKu6ZCfGxsfHgkSlcKEFLHwdsJ5A3rSTPHaI1D+LVQ6+pLhEoglO0kbYoIRxuTcnBbe/UaHgRvAaWJZeUj+uL+XySC1IwUjQh8TKZIAy1eo0zxxxj9S+j13jJHeIntvoClOivnPHfyNMug6mpt1isbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KdTMySWE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KdTMySWE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785845954; x=1817381954;
  h=date:from:to:cc:subject:message-id;
  bh=D+MrTQZA60uxv7a+U3lIDwebghLZBL4MKKXKMR31CfA=;
  b=KdTMySWEcA3pH+iij8whwJr+udsTrOaQCipkNXMpc8N2Qw6/3nF+uyqb
   W+YVLW0J1zuWAeQGwmh9QLZt3U8jYfvP5OMt8286wEuQuN3KlaJweByUF
   Frkb0BIpENDQg/rPU+vJBdEYqXMFc5G0vztq0EOpxZxrcSnhzim6/Ou6r
   MgzK6HAocwPN4RkpuxMckHW161nOCas+4YH48Je3G0yAYVKfsgBqfmCDY
   /uik7fU/pou0/r06kqqBybDSDe5NHh1Da3cX4spZfCfWjJDGWzY3OEGsV
   yVsDdt5Pfh/N0Bo4zHxT54W+fE6zr7ZelCkiQOjJW19dKPzFtBeRFLFbe
   Q==;
X-CSE-ConnectionGUID: OzBk7Q5ZSbGkAO2UnBpB8g==
X-CSE-MsgGUID: Ppo8J+rcSgChycVDnttmTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="96754394"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="96754394"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 05:19:14 -0700
X-CSE-ConnectionGUID: 6QbaS9DaTNWalmASz9pE2A==
X-CSE-MsgGUID: 1dEBr2D0QjejJdGEgfClDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="266608803"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Aug 2026 05:19:13 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrE6t-000000009qr-1WqL;
	Tue, 04 Aug 2026 12:19:07 +0000
Date: Tue, 04 Aug 2026 20:18:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/phy/mediatek/phy-mtk-dp.c:776:20: error:
 incompatible pointer to integer conversion initializing 'u32' (aka 'unsigned
 int') with an expression of type 'const u32[9]' (aka 'const unsigned int[9]')
Message-ID: <202608042049.MvZChzZV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/AngeloGioacchino-Del-Regno/dt-bindings-phy-Document-MT8195-and-MT8196-DisplayPort-PHYs/20260803-214632, commit: ca245ded65366422add185845ded62fcaa6c6343"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-phy-Document-MT8195-and-MT8196-DisplayPort-PHYs/20260803-214632
head:   d33b28885557c8205bb5bc4e8a6566b3c4711e15
commit: ca245ded65366422add185845ded62fcaa6c6343 phy: phy-mtk-dp: Add support for digital and analog calibration
date:   22 hours ago
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: x86_64-buildonly-randconfig-006-20260804 (https://download.01.org/0day-ci/archive/20260804/202608042049.MvZChzZV-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608042049.MvZChzZV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608042049.MvZChzZV-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/phy/mediatek/phy-mtk-dp.c:763:18: error: incompatible pointer to integer conversion initializing 'u16' (aka 'unsigned short') with an expression of type 'const u16[4]' (aka 'const unsigned short[4]') [-Wint-conversion]
     763 |         .off_ana_lane = (const u16[]) { 0x100, 0x200, 0x300, 0x400 },
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/mediatek/phy-mtk-dp.c:763:18: warning: suggest braces around initialization of subobject [-Wmissing-braces]
     763 |         .off_ana_lane = (const u16[]) { 0x100, 0x200, 0x300, 0x400 },
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         {                                           }
   drivers/phy/mediatek/phy-mtk-dp.c:765:18: error: incompatible pointer to integer conversion initializing 'u16' (aka 'unsigned short') with an expression of type 'const u16[4]' (aka 'const unsigned short[4]') [-Wint-conversion]
     765 |         .off_dig_lane = (const u16[]) { 0x1100, 0x1200, 0x1300, 0x1400 },
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/mediatek/phy-mtk-dp.c:765:18: warning: suggest braces around initialization of subobject [-Wmissing-braces]
     765 |         .off_dig_lane = (const u16[]) { 0x1100, 0x1200, 0x1300, 0x1400 },
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         {                                               }
>> drivers/phy/mediatek/phy-mtk-dp.c:776:20: error: incompatible pointer to integer conversion initializing 'u32' (aka 'unsigned int') with an expression of type 'const u32[9]' (aka 'const unsigned int[9]') [-Wint-conversion]
     776 |         .driving_params = (const u32[]) {
         |                           ^~~~~~~~~~~~~~~
     777 |                 [0] = 0,
         |                 ~~~~~~~~
     778 |                 [1] = 0,
         |                 ~~~~~~~~
     779 |                 [2] = 0,
         |                 ~~~~~~~~
     780 |                 [3] = MT8195_DRIVING_PARAM_3_DEFAULT,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     781 |                 [4] = MT8195_DRIVING_PARAM_4_DEFAULT,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     782 |                 [5] = MT8195_DRIVING_PARAM_5_DEFAULT,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     783 |                 [6] = MT8195_DRIVING_PARAM_6_DEFAULT,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     784 |                 [7] = MT8195_DRIVING_PARAM_7_DEFAULT,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     785 |                 [8] = MT8195_DRIVING_PARAM_8_DEFAULT
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     786 |         },
         |         ~
   drivers/phy/mediatek/phy-mtk-dp.c:776:20: warning: suggest braces around initialization of subobject [-Wmissing-braces]
     776 |         .driving_params = (const u32[]) {
         |                           ^~~~~~~~~~~~~~~
         |                           {
     777 |                 [0] = 0,
         |                 ~~~~~~~~
     778 |                 [1] = 0,
         |                 ~~~~~~~~
     779 |                 [2] = 0,
         |                 ~~~~~~~~
     780 |                 [3] = MT8195_DRIVING_PARAM_3_DEFAULT,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     781 |                 [4] = MT8195_DRIVING_PARAM_4_DEFAULT,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     782 |                 [5] = MT8195_DRIVING_PARAM_5_DEFAULT,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     783 |                 [6] = MT8195_DRIVING_PARAM_6_DEFAULT,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     784 |                 [7] = MT8195_DRIVING_PARAM_7_DEFAULT,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     785 |                 [8] = MT8195_DRIVING_PARAM_8_DEFAULT
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     786 |         },
         |         ~
         |          }
   drivers/phy/mediatek/phy-mtk-dp.c:763:18: error: initializer element is not a compile-time constant
     763 |         .off_ana_lane = (const u16[]) { 0x100, 0x200, 0x300, 0x400 },
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings and 4 errors generated.


vim +776 drivers/phy/mediatek/phy-mtk-dp.c

6a23afad443a8e Markus Schneider-Pargmann  2022-06-24  760  
ace28f75ebdee1 AngeloGioacchino Del Regno 2026-07-07  761  static const struct mtk_dp_phy_pdata mt8195_dp_phy_data = {
ca245ded653664 AngeloGioacchino Del Regno 2026-07-07  762  	.off_ana_glb = 0,
ca245ded653664 AngeloGioacchino Del Regno 2026-07-07  763  	.off_ana_lane = (const u16[]) { 0x100, 0x200, 0x300, 0x400 },
ace28f75ebdee1 AngeloGioacchino Del Regno 2026-07-07  764  	.off_dig_glb = 0x1000,
ace28f75ebdee1 AngeloGioacchino Del Regno 2026-07-07  765  	.off_dig_lane = (const u16[]) { 0x1100, 0x1200, 0x1300, 0x1400 },
145c16137cda7b AngeloGioacchino Del Regno 2026-07-07  766  	.regs_ana_glb = mt8195_phy_ana_glb_regs,
ca245ded653664 AngeloGioacchino Del Regno 2026-07-07  767  	.regs_ana_lane = mt8195_phy_ana_lane_regs,
ace28f75ebdee1 AngeloGioacchino Del Regno 2026-07-07  768  	.regs_dig_glb = mt8195_phy_dig_glb_regs,
ace28f75ebdee1 AngeloGioacchino Del Regno 2026-07-07  769  	.regs_dig_lane = mt8195_phy_dig_lane_regs,
ca245ded653664 AngeloGioacchino Del Regno 2026-07-07  770  	.ana_bias_r = 15,
ca245ded653664 AngeloGioacchino Del Regno 2026-07-07  771  	.ana_cktx_imp = 8,
ca245ded653664 AngeloGioacchino Del Regno 2026-07-07  772  	.ana_lanes_imp = {
ca245ded653664 AngeloGioacchino Del Regno 2026-07-07  773  		.pmos = 8,
ca245ded653664 AngeloGioacchino Del Regno 2026-07-07  774  		.nmos = 8,
ca245ded653664 AngeloGioacchino Del Regno 2026-07-07  775  	},
ca245ded653664 AngeloGioacchino Del Regno 2026-07-07 @776  	.driving_params = (const u32[]) {
ca245ded653664 AngeloGioacchino Del Regno 2026-07-07  777  		[0] = 0,
ca245ded653664 AngeloGioacchino Del Regno 2026-07-07  778  		[1] = 0,
ca245ded653664 AngeloGioacchino Del Regno 2026-07-07  779  		[2] = 0,
ca245ded653664 AngeloGioacchino Del Regno 2026-07-07  780  		[3] = MT8195_DRIVING_PARAM_3_DEFAULT,
ca245ded653664 AngeloGioacchino Del Regno 2026-07-07  781  		[4] = MT8195_DRIVING_PARAM_4_DEFAULT,
ca245ded653664 AngeloGioacchino Del Regno 2026-07-07  782  		[5] = MT8195_DRIVING_PARAM_5_DEFAULT,
ca245ded653664 AngeloGioacchino Del Regno 2026-07-07  783  		[6] = MT8195_DRIVING_PARAM_6_DEFAULT,
ca245ded653664 AngeloGioacchino Del Regno 2026-07-07  784  		[7] = MT8195_DRIVING_PARAM_7_DEFAULT,
ca245ded653664 AngeloGioacchino Del Regno 2026-07-07  785  		[8] = MT8195_DRIVING_PARAM_8_DEFAULT
ca245ded653664 AngeloGioacchino Del Regno 2026-07-07  786  	},
ace28f75ebdee1 AngeloGioacchino Del Regno 2026-07-07  787  };
ace28f75ebdee1 AngeloGioacchino Del Regno 2026-07-07  788  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
