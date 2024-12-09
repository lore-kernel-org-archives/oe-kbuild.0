Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3E8156225
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717351; cv=none; b=rgubAdOdvTloXiysjbDk8Odi/N/LQTx6f9bBFwh6u5VqF6YPxkzU/vy2ZcrKhXx2Zmh8++OSiMWiGb+A15VH9rpV31Yiv+H3eULLOiZyvzIopkbJ0GDRGJN5xuonNNgw8U2ihaiCvS/mhVzstVU+oj+YbnFJxD8NwsFUftMVs0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717351; c=relaxed/simple;
	bh=ZBF6IUJ065EzSISm7tt7aJz3KN5Rukkg2DeK/KSOzBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m5Mn1ICaQra/kuBuyC0huajiEFPH2rb2KXPeP/bMqUDckm+SstNBT5ONHcRb/2X+cIYubECFkhoI/2EG9L9v1myXEuA6slsZXPoUZbPISx4yy5SKnXG3XlOMJwPU75C4Vat5qtBfO2fHYRTMWAordUXRU2I1HGs22wPIBnsdCrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CmTIO8o7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CmTIO8o7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717350; x=1765253350;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZBF6IUJ065EzSISm7tt7aJz3KN5Rukkg2DeK/KSOzBk=;
  b=CmTIO8o7E8PVx5JzxjuFem99IgFh3H9D1qhv74/J7A/eMah5yH5pw689
   2aQXCslMl17CFwDoSK4fZOXw3YXXcNF7IKdPqzzC+k98czmCJ2PZbeSl7
   zFsD8tHQJ5vnwVcf7YqwK7C0OfpGqPstzI2WhBY7neghV0uAh/3yY3W4l
   2d+dnmkBXgtCZHcCsBlZue5KAfxddLsKYSeFU2wt+jzDT6aioGYqVlj8J
   dqwTv9nQrsvFs9lt5IkSH2DVai4BP0zrjyVnTF6eoVh+PT7uwFIDrMKfE
   vikELSJMWHjQcdHAAM4z+NHTecZ8RmbT4mWJG4yOVFN8G8Km2U6Ax9W+W
   w==;
X-CSE-ConnectionGUID: vWZSKKefTUO1ToKS6hxykg==
X-CSE-MsgGUID: HwhyKg05Q42qSCwIhgLDyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="36841935"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="36841935"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:09:08 -0800
X-CSE-ConnectionGUID: sVrOJ6d0Q96fZk5JF0HIxQ==
X-CSE-MsgGUID: +T26XKJLSy2tcS3KgZT+VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95044970"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Dec 2024 20:09:06 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKV4x-0003nR-2L;
	Mon, 09 Dec 2024 04:09:03 +0000
Date: Mon, 9 Dec 2024 12:08:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/clocksource/timer-npcm7xx.c:205 npcm7xx_timer_init() warn:
 'clk' is an error pointer or valid
Message-ID: <202412071351.QbZLwNfF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Helge Deller <deller@gmx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5f217084ab3ddd4bdd03cd437f8e3b7e2d1f5b6
commit: b5ff52be891347f8847872c49d7a5c2fa29400a7 parisc: Convert to generic clockevents
date:   3 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 months ago
config: parisc-randconfig-r072-20241207 (https://download.01.org/0day-ci/archive/20241207/202412071351.QbZLwNfF-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412071351.QbZLwNfF-lkp@intel.com/

smatch warnings:
drivers/clocksource/timer-npcm7xx.c:205 npcm7xx_timer_init() warn: 'clk' is an error pointer or valid

vim +/clk +205 drivers/clocksource/timer-npcm7xx.c

1c00289ecd1247 Tomer Maimon        2018-03-08  188  
1c00289ecd1247 Tomer Maimon        2018-03-08  189  static int __init npcm7xx_timer_init(struct device_node *np)
1c00289ecd1247 Tomer Maimon        2018-03-08  190  {
db78539fc95cf6 Jonathan Neuschäfer 2022-11-04  191  	struct clk *clk;
1c00289ecd1247 Tomer Maimon        2018-03-08  192  	int ret;
1c00289ecd1247 Tomer Maimon        2018-03-08  193  
1c00289ecd1247 Tomer Maimon        2018-03-08  194  	ret = timer_of_init(np, &npcm7xx_to);
1c00289ecd1247 Tomer Maimon        2018-03-08  195  	if (ret)
1c00289ecd1247 Tomer Maimon        2018-03-08  196  		return ret;
1c00289ecd1247 Tomer Maimon        2018-03-08  197  
1c00289ecd1247 Tomer Maimon        2018-03-08  198  	/* Clock input is divided by PRESCALE + 1 before it is fed */
1c00289ecd1247 Tomer Maimon        2018-03-08  199  	/* to the counter */
1c00289ecd1247 Tomer Maimon        2018-03-08  200  	npcm7xx_to.of_clk.rate = npcm7xx_to.of_clk.rate /
1c00289ecd1247 Tomer Maimon        2018-03-08  201  		(NPCM7XX_Tx_MIN_PRESCALE + 1);
1c00289ecd1247 Tomer Maimon        2018-03-08  202  
db78539fc95cf6 Jonathan Neuschäfer 2022-11-04  203  	/* Enable the clock for timer1, if it exists */
db78539fc95cf6 Jonathan Neuschäfer 2022-11-04  204  	clk = of_clk_get(np, 1);
db78539fc95cf6 Jonathan Neuschäfer 2022-11-04 @205  	if (clk) {
db78539fc95cf6 Jonathan Neuschäfer 2022-11-04  206  		if (!IS_ERR(clk))
db78539fc95cf6 Jonathan Neuschäfer 2022-11-04  207  			clk_prepare_enable(clk);
db78539fc95cf6 Jonathan Neuschäfer 2022-11-04  208  		else
db78539fc95cf6 Jonathan Neuschäfer 2022-11-04  209  			pr_warn("%pOF: Failed to get clock for timer1: %pe", np, clk);
db78539fc95cf6 Jonathan Neuschäfer 2022-11-04  210  	}
db78539fc95cf6 Jonathan Neuschäfer 2022-11-04  211  
1c00289ecd1247 Tomer Maimon        2018-03-08  212  	npcm7xx_clocksource_init();
1c00289ecd1247 Tomer Maimon        2018-03-08  213  	npcm7xx_clockevents_init();
1c00289ecd1247 Tomer Maimon        2018-03-08  214  
1c00289ecd1247 Tomer Maimon        2018-03-08  215  	pr_info("Enabling NPCM7xx clocksource timer base: %px, IRQ: %d ",
1c00289ecd1247 Tomer Maimon        2018-03-08  216  		timer_of_base(&npcm7xx_to), timer_of_irq(&npcm7xx_to));
1c00289ecd1247 Tomer Maimon        2018-03-08  217  
1c00289ecd1247 Tomer Maimon        2018-03-08  218  	return 0;
1c00289ecd1247 Tomer Maimon        2018-03-08  219  }
1c00289ecd1247 Tomer Maimon        2018-03-08  220  

:::::: The code at line 205 was first introduced by commit
:::::: db78539fc95cf62b0b8f274368fcd8202eac91f9 clocksource/drivers/timer-npcm7xx: Enable timer 1 clock before use

:::::: TO: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
:::::: CC: Daniel Lezcano <daniel.lezcano@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
