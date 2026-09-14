Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760A2313277
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Sep 2026 16:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404366; cv=none; b=QJ/fo6cRHMckqc6jDLt6GXq17gMUfrQtgu5XT1hUR2ZYdNvNPhALhUsoUQj5/6QGVVKZNaXtzAmtzNBGrIBVeAKJ4MSZCAAHawga3jOOQ68Jys6Ko4cTTS0302GnLGOgC+LpS0VAXN2LGoamKpSDbXeci8N4432+MJHlSPSr3LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404366; c=relaxed/simple;
	bh=sa7jD/uJk+EOy0d5qkBlGXleIO+9Zk7XMlukrOz/kJ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ptSDo7+Vef6tCQhwA0woY9aotaaLAGw8qZYeCXuzcUy4We1lXf82R4fFPjbUm+7GV+YQJhXM4Zif4TSfxm13yQq/5L8ssZREkmpU/OMg6SGf9HkP1ZPl9jWZq8PlWarv0OqXF2cAPeJxWXgcSeiDgigxsYm1nCHaTDvAX9KD8fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y4DYtjPN; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y4DYtjPN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789404364; x=1820940364;
  h=date:from:to:cc:subject:message-id;
  bh=sa7jD/uJk+EOy0d5qkBlGXleIO+9Zk7XMlukrOz/kJ4=;
  b=Y4DYtjPNGKyTT/g2mAlvU1EXOTCuzDSlVbxi8RZA5o/Hi3d5g2f37lmP
   LVCBOj2KhVINrQ4GVjtsLuaQaJL/B6T467QJLkSdaM26ZGGkTjVwuXhY0
   vD9yA6Kia8akJWPFKS2ZF/v+gkbpCfov6J9fE+SAvajdHaqAr0fXIRk/3
   jKQZLMWC2cI2w0hZS9R/RbUmmk+DovNZnoVqaqxfa4FDJGE2zhm8BOKTD
   wXwS5TkeZThgfSUOvJnfydE/pnF6glldQnlgBXV48yPJZjs0yCe9phN4C
   LIrWlCg2cH4Czk0tqbpDWW3CvcXwVUtBaEo+ZNk0zl2j7qM2Mmq6Zg+0N
   A==;
X-CSE-ConnectionGUID: prgnj3PwTjKi5teE1OXxcA==
X-CSE-MsgGUID: YD7pFfVgSne0T2AhlM2D+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100424286"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100424286"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:46:04 -0700
X-CSE-ConnectionGUID: r4y3cc+BTRe0JrQJ+ziRJg==
X-CSE-MsgGUID: PhYVrKXnSqW4nsuLO7z9ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272665696"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Sep 2026 09:46:03 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x69oe-0000000037D-3jYV;
	Mon, 14 Sep 2026 16:46:00 +0000
Date: Tue, 15 Sep 2026 00:45:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [phy:next 5/31] drivers/phy/mediatek/phy-mtk-dp.c:334:10:
 sparse: sparse: missing braces around initializer
Message-ID: <202609150030.J13qUPNd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/phy/mediatek/phy-mtk-dp.c:334:10: sparse: sparse: missing braces around initializer"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Vinod Koul <vkoul@kernel.org>
CC: Kishon <kishon@ti.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git next
head:   d837aabce96ef6f4cc6b179e1055d8cdf85cfe38
commit: ae859204b519a384ad0136c21599bab9321090ce [5/31] phy: phy-mtk-dp: Migrate register offsets to SoC specific pdata
:::::: branch date: 30 hours ago
:::::: commit date: 34 hours ago
config: parisc-randconfig-r133-20260914 (https://download.01.org/0day-ci/archive/20260915/202609150030.J13qUPNd-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609150030.J13qUPNd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609150030.J13qUPNd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/mediatek/phy-mtk-dp.c:334:10: sparse: sparse: missing braces around initializer
>> drivers/phy/mediatek/phy-mtk-dp.c:334:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned short @@     got unsigned short const * @@
   drivers/phy/mediatek/phy-mtk-dp.c:334:26: sparse:     expected unsigned short
   drivers/phy/mediatek/phy-mtk-dp.c:334:26: sparse:     got unsigned short const *

vim +334 drivers/phy/mediatek/phy-mtk-dp.c

6a23afad443a8e0 Markus Schneider-Pargmann  2022-06-24  331  
ae859204b519a38 AngeloGioacchino Del Regno 2026-09-10  332  static const struct mtk_dp_phy_pdata mt8195_dp_phy_data = {
ae859204b519a38 AngeloGioacchino Del Regno 2026-09-10  333  	.off_dig_glb = 0x1000,
ae859204b519a38 AngeloGioacchino Del Regno 2026-09-10 @334  	.off_dig_lane = (const u16[]) { 0x1100, 0x1200, 0x1300, 0x1400 },
ae859204b519a38 AngeloGioacchino Del Regno 2026-09-10  335  	.regs_dig_glb = mt8195_phy_dig_glb_regs,
ae859204b519a38 AngeloGioacchino Del Regno 2026-09-10  336  	.regs_dig_lane = mt8195_phy_dig_lane_regs,
ae859204b519a38 AngeloGioacchino Del Regno 2026-09-10  337  };
ae859204b519a38 AngeloGioacchino Del Regno 2026-09-10  338  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
