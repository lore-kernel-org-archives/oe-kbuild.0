Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD39243956
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Oct 2026 04:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791086809; cv=none; b=g7Km+Fc/dx3u/h0zfg78Mc77Y8ohmDfml9bSnbAKVzlR7CaySaI2r1ieFaPHM8IWyQ5/0v/iHZDsDpIcbTrDQZPY1o2iMgIJs+YbpVz+EaioQia/cmVZdxVWxkUJ2ZMJkENzhoxYYORPWT3uLQhyNcPpmMOf6zn9ouoGv96uYAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791086809; c=relaxed/simple;
	bh=KYo+fz3k+h5N/QfXv8ZVQ9D4d8/Rt27NO5uZqST2bzk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mygAxR2sZTMx01CkXqRkiORkIlZ9DEXZiiPom/+NnoO5OdjgJAj7Tp4oZYuw0zY0x8joBopH9VnpyHxI30BHEL4ER+Gbt0uezD02mLsiL+aOEn1D2l9w6AJhS7QMBdSZG0Qk2U1ervhEK7cBkwlqMpuEDy2Ya8kjH6tgaW+UDbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OxoAwSQV; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OxoAwSQV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791086807; x=1822622807;
  h=date:from:to:cc:subject:message-id;
  bh=KYo+fz3k+h5N/QfXv8ZVQ9D4d8/Rt27NO5uZqST2bzk=;
  b=OxoAwSQV9UHMnZqYD2trbPaA6txjNe9stgIs90ajLDE89VlnHQq/dDz6
   NS3Zov/ZHh6LJLqp3k/mwoWnJ0a81yw1IOXHkM5JVT/ofIuifhgMwO2Wo
   3cvfIUrE/ZosqSRVN2PWHOrWjEOM+nyG0VNqLmBcc2Kil8JKuFtDKVqZd
   LVY/cXWd71iWycPvu65gjaJCTEiumw/4xTskMiHuH39Y5/C25LWRnB86V
   yGXx5X22qnlP7qhrh5tgZzU5S4NO+rqqvUVHoblPjLbsesLikCh+ke1TO
   YS3ycp2kbZ+jNI4RkfhybyWXmSY28Zlx18EzQYFLqoj+QBbYlfFzfGrUJ
   w==;
X-CSE-ConnectionGUID: jpL60NDlTPCYsgF6UsUvRQ==
X-CSE-MsgGUID: CJcOHXInQMSTGgTEs9yzpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="94282558"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="94282558"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 21:06:46 -0700
X-CSE-ConnectionGUID: oRE28mdXQBCULMoH5ZYNOA==
X-CSE-MsgGUID: lqMdq0lVSvOKh2Hvdwg38A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="279798777"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Oct 2026 21:06:45 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDDUp-00000000URR-05AJ;
	Sun, 04 Oct 2026 04:06:43 +0000
Date: Sun, 04 Oct 2026 12:06:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/clocksource/timer-mediatek.c:351:(.text+0x297):
 dangerous relocation: windowed longcall crosses 1GB boundary; return may
 fail: *UND*
Message-ID: <202610041116.5K7blOpy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Luca-Leonardo-Scorcia/clocksource-drivers-timer-mediatek-Fix-random-crash-at-boot/20261002-091926, commit: 322dca3aa6d9da75845506ad72b09bd570b0d451"
:::::: Manual check reason: "xtensa: dangerous relocation"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Luca Leonardo Scorcia <l.scorcia@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Luca-Leonardo-Scorcia/clocksource-drivers-timer-mediatek-Fix-random-crash-at-boot/20261002-091926
head:   0c8c1bddeb603ee5834db94da982745e97c68119
commit: 322dca3aa6d9da75845506ad72b09bd570b0d451 clocksource/drivers/timer-mediatek: Convert to OF probing
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: xtensa-randconfig-1000-20261003 (https://download.01.org/0day-ci/archive/20261004/202610041116.5K7blOpy-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610041116.5K7blOpy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610041116.5K7blOpy-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clocksource/timer-mediatek.o: in function `mtk_timer_probe':
>> drivers/clocksource/timer-mediatek.c:351:(.text+0x297): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: *UND*


vim +351 drivers/clocksource/timer-mediatek.c

322dca3aa6d9da7 Luca Leonardo Scorcia 2026-10-02  344  
322dca3aa6d9da7 Luca Leonardo Scorcia 2026-10-02  345  static int mtk_timer_probe(struct platform_device *pdev)
322dca3aa6d9da7 Luca Leonardo Scorcia 2026-10-02  346  {
322dca3aa6d9da7 Luca Leonardo Scorcia 2026-10-02  347  	int (*timer_init)(struct device_node *node);
322dca3aa6d9da7 Luca Leonardo Scorcia 2026-10-02  348  	struct device_node *np = pdev->dev.of_node;
322dca3aa6d9da7 Luca Leonardo Scorcia 2026-10-02  349  
322dca3aa6d9da7 Luca Leonardo Scorcia 2026-10-02  350  	timer_init = of_device_get_match_data(&pdev->dev);
322dca3aa6d9da7 Luca Leonardo Scorcia 2026-10-02 @351  	return timer_init(np);
322dca3aa6d9da7 Luca Leonardo Scorcia 2026-10-02  352  }
322dca3aa6d9da7 Luca Leonardo Scorcia 2026-10-02  353  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
