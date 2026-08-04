Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD3B448CE5
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Aug 2026 10:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785838139; cv=none; b=rnC1ZbIGdahxqGCjk7/95+ay+e9FgGR9OVMQ39uOeMQWxgr+kO4FzfXIWRjviluTSwM5qtnSQFArTfecsvc0ap6e6X+eB02f6s5G2ayTiMdbwzCllyq7FSEnOKAlKt2sqltW4xdS0VKzZJ+T1qSQI8d98sBS+HkHmiR8q4ERn70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785838139; c=relaxed/simple;
	bh=i4K0sccTqWyp0ZI8rHshZ8pFs8fxHOBnBELUijG5TMo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VwYM4d458YP5mFY97VRFplftfss/ZxeH6kZYMWjuQdopigpSfvzyjn1zok2RvYox8KAr7tQqGK19Y3AZcQ7wXVh0LFxHTFLJp0PPUPrbKahgWnRac3M3ypX7w+7xav8KLdkfnpoZhSXTUf/LKSPwEg4Q0ggC4Ldk+WNaqr5DnVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C/tYck5g; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C/tYck5g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785838137; x=1817374137;
  h=date:from:to:cc:subject:message-id;
  bh=i4K0sccTqWyp0ZI8rHshZ8pFs8fxHOBnBELUijG5TMo=;
  b=C/tYck5gQ4CW4cQbBtxzxmk8V2j1GUxLgGX7BMY2iV3UpnUdOJF1Fda4
   yPiFAQg8ARWPk+op9hQKBr41F1rMCOteqxsXN9P+CzhKJZsbUWNzTe1ft
   Lc+r+yx07PvhDIr+h1DDCuSPKF0PH9AqKwcL9q4bL4iOxI2CgctobJtXl
   1tHA9UqOKymkMbeuBENLnBpps86oPrzCjhGk51Z5b5udI9bxhEGNxcXCM
   ZXxG9pdkQzcXbc8Qsj7fz1zsCeFydJW3zZPML5sPXdc+B83lEP3lhv1Zv
   AWE0jpximFXfqBfR6xXW6zXN8QJfdulLrWg3/aCOmaoEu3ko8ik1Axipr
   w==;
X-CSE-ConnectionGUID: 1ZUQjl0+TpurHN1elSaZGQ==
X-CSE-MsgGUID: mRizUtpJT3iPi8HsqMOztQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86583598"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="86583598"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 03:08:57 -0700
X-CSE-ConnectionGUID: 19G+FDNlSgOzp3KOeC/TYg==
X-CSE-MsgGUID: mRGUw9QjSgKsTBU3kXOVvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="284849611"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Aug 2026 02:58:40 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrBuv-000000009bx-2r6i;
	Tue, 04 Aug 2026 09:58:37 +0000
Date: Tue, 04 Aug 2026 17:57:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/phy/mediatek/phy-mtk-dp.c:334:18: error:
 incompatible pointer to integer conversion initializing 'u16' (aka 'unsigned
 short') with an expression of type 'const u16[4]' (aka 'const unsigned
 short[4]')
Message-ID: <202608041721.5FoNeDGF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/AngeloGioacchino-Del-Regno/dt-bindings-phy-Document-MT8195-and-MT8196-DisplayPort-PHYs/20260803-214632, commit: ace28f75ebdee148cda44a230458044917223727"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-phy-Document-MT8195-and-MT8196-DisplayPort-PHYs/20260803-214632
head:   d33b28885557c8205bb5bc4e8a6566b3c4711e15
commit: ace28f75ebdee148cda44a230458044917223727 phy: phy-mtk-dp: Migrate register offsets to SoC specific pdata
date:   20 hours ago
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: x86_64-buildonly-randconfig-006-20260804 (https://download.01.org/0day-ci/archive/20260804/202608041721.5FoNeDGF-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608041721.5FoNeDGF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608041721.5FoNeDGF-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/phy/mediatek/phy-mtk-dp.c:334:18: error: incompatible pointer to integer conversion initializing 'u16' (aka 'unsigned short') with an expression of type 'const u16[4]' (aka 'const unsigned short[4]') [-Wint-conversion]
     334 |         .off_dig_lane = (const u16[]) { 0x1100, 0x1200, 0x1300, 0x1400 },
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/phy/mediatek/phy-mtk-dp.c:334:18: warning: suggest braces around initialization of subobject [-Wmissing-braces]
     334 |         .off_dig_lane = (const u16[]) { 0x1100, 0x1200, 0x1300, 0x1400 },
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         {                                               }
>> drivers/phy/mediatek/phy-mtk-dp.c:334:18: error: initializer element is not a compile-time constant
     334 |         .off_dig_lane = (const u16[]) { 0x1100, 0x1200, 0x1300, 0x1400 },
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +334 drivers/phy/mediatek/phy-mtk-dp.c

6a23afad443a8e0 Markus Schneider-Pargmann  2022-06-24  331  
ace28f75ebdee14 AngeloGioacchino Del Regno 2026-07-07  332  static const struct mtk_dp_phy_pdata mt8195_dp_phy_data = {
ace28f75ebdee14 AngeloGioacchino Del Regno 2026-07-07  333  	.off_dig_glb = 0x1000,
ace28f75ebdee14 AngeloGioacchino Del Regno 2026-07-07 @334  	.off_dig_lane = (const u16[]) { 0x1100, 0x1200, 0x1300, 0x1400 },
ace28f75ebdee14 AngeloGioacchino Del Regno 2026-07-07  335  	.regs_dig_glb = mt8195_phy_dig_glb_regs,
ace28f75ebdee14 AngeloGioacchino Del Regno 2026-07-07  336  	.regs_dig_lane = mt8195_phy_dig_lane_regs,
ace28f75ebdee14 AngeloGioacchino Del Regno 2026-07-07  337  };
ace28f75ebdee14 AngeloGioacchino Del Regno 2026-07-07  338  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
