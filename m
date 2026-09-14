Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E643630B3
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Sep 2026 23:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789429255; cv=none; b=M+4KjZ8FbvhgndMplJpYMSJ8Ex7V7W7FneTS1MFFyqjI0cLz8NNfn+Mou2Pv3z0gzybyuNdj/T4Ko1Rr3UySRYwUDqKjXZIWZxrNKDKq6kExiR9roCHwGuaPLjDZZXgSkYAnC5tPgfq9bCLD5KmcqxB9kwO6dOEmwl9lbYUY0u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789429255; c=relaxed/simple;
	bh=4Ncvi1XQDscjtyzd0cGOgYWMOuh9IDlWO8c7Sx0iKUg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I1s73eoc/4izYRg3Im9Q/HLwf8Fmwtf+Lg33B7HwjLYeW4LLmjEHXcveYvjfLLu4+VavDewVgC/m0pf161UnoixGc6I/8JkhRRmRPFdJ1XSy3kR0zUjzM5z27tJj0mVaSxR2wbxi0V5UTLJr/cyY/MNQhuE03DPBDoszvmpA6YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T7unicgG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T7unicgG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789429254; x=1820965254;
  h=date:from:to:cc:subject:message-id;
  bh=4Ncvi1XQDscjtyzd0cGOgYWMOuh9IDlWO8c7Sx0iKUg=;
  b=T7unicgG0zjxdqeTJ7hgtLA+JKr1oxbl661Wqp4cb4cWxoMc8TST1vu2
   qWUU7XCC21RaYhwSyLiOE4zOXNRVFPdfw1SL7jmVo+pdBa9Dez0GuWBgi
   nWm9PLe1cIMpNA6xg6Fr5xyQUdgL135yxCLxjmgen8cpJFHV1NYBCPlzX
   +sTLTPAitt3XR6x08GXLgczoXIDUZBX7C5GZlnpVmrbFRwvjmwvauKxyH
   qNj7bV26xQuLklgBiMG8QfGX11xw5jtFsGtOdpNRUr5ZL4i9bmyGZFK+7
   OAZor6htyrrsWOE1SKhGVJdCBl9iCNZUHpwAQzb5viEG0CLJNKptezLD/
   g==;
X-CSE-ConnectionGUID: GBMyPd72TUug9Rlr4dj+vw==
X-CSE-MsgGUID: 8g/R4Q4uT5qKLipTzaNJHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92296547"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92296547"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 16:40:53 -0700
X-CSE-ConnectionGUID: j8DWgLyUTvmDePHluf+hUA==
X-CSE-MsgGUID: 8PdF/5eES4qolmCBCx2ZaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269097904"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Sep 2026 16:40:52 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6GI6-000000003cl-0k1l;
	Mon, 14 Sep 2026 23:40:50 +0000
Date: Tue, 15 Sep 2026 07:40:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [phy:next 5/31] drivers/phy/mediatek/phy-mtk-dp.c:334:10:
 sparse: sparse: missing braces around initializer
Message-ID: <202609150736.x8tGAimG-lkp@intel.com>
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
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: parisc-randconfig-r133-20260914 (https://download.01.org/0day-ci/archive/20260915/202609150736.x8tGAimG-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609150736.x8tGAimG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609150736.x8tGAimG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/mediatek/phy-mtk-dp.c:334:10: sparse: sparse: missing braces around initializer
>> drivers/phy/mediatek/phy-mtk-dp.c:334:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned short @@     got unsigned short const * @@
   drivers/phy/mediatek/phy-mtk-dp.c:334:26: sparse:     expected unsigned short
   drivers/phy/mediatek/phy-mtk-dp.c:334:26: sparse:     got unsigned short const *

vim +334 drivers/phy/mediatek/phy-mtk-dp.c

6a23afad443a8e Markus Schneider-Pargmann  2022-06-24  331  
ae859204b519a3 AngeloGioacchino Del Regno 2026-09-10  332  static const struct mtk_dp_phy_pdata mt8195_dp_phy_data = {
ae859204b519a3 AngeloGioacchino Del Regno 2026-09-10  333  	.off_dig_glb = 0x1000,
ae859204b519a3 AngeloGioacchino Del Regno 2026-09-10 @334  	.off_dig_lane = (const u16[]) { 0x1100, 0x1200, 0x1300, 0x1400 },
ae859204b519a3 AngeloGioacchino Del Regno 2026-09-10  335  	.regs_dig_glb = mt8195_phy_dig_glb_regs,
ae859204b519a3 AngeloGioacchino Del Regno 2026-09-10  336  	.regs_dig_lane = mt8195_phy_dig_lane_regs,
ae859204b519a3 AngeloGioacchino Del Regno 2026-09-10  337  };
ae859204b519a3 AngeloGioacchino Del Regno 2026-09-10  338  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
