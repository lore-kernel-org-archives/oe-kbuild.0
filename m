Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A881B1D5143
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Dec 2024 11:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735212610; cv=none; b=JRcVfdtFsxnHi5IQLTFK99WS2RM1QcoFYoXkILFzHVQYDjhOoardL2w5TFymQtMWMMbDjrFfowdOg67OprSkOFfQ44LmKVU9xMnRT0mjstu9ut3gOLfIVII+A/AT3OaYDeakHsyrwbbgOk32Ikh33xv3FOib80hkIYV01J9ctTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735212610; c=relaxed/simple;
	bh=fALPwc7oLcV7CBMDVM3v+DJ79wSZvWBQZtcHVM5pKq8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KA3BwDxxF98w9Mjpu5Z4uKcVFI5Du12oJ8Xs2aVeu993O7rEbdZzYmeQBbOT8Gi2ECU2EY8D+iZIHgeWpdg+YgXoAILvvi3w+3/LaKcU+m4RLhMzwqWX9k2MEMFoJiXE3XpOlrmC5dWfpV8nEkj6B5hXHS6sgLhBwaajuE19Ya8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/4Pi7+Y; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/4Pi7+Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735212609; x=1766748609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fALPwc7oLcV7CBMDVM3v+DJ79wSZvWBQZtcHVM5pKq8=;
  b=i/4Pi7+YNHpEXaZSrQRCwczeHP9m07H9sPc7OHuzb3nfY1VzNAhnR8vQ
   Vla+Qwo3c53O61+SeVHUx0qOrenXwPSbNj1G2OhBM/iiIbDVQK0oJpn5f
   CekrDHc8kUBjHIZKU3g9G5lAbFAaAUJJHm010cEuDmHr1QVuW87qcqe5h
   hSvOMX6+cnEkBH1rDf/6lTRjoLvVX9X9CQnqn2WrJ0aX+NtHLbcqn/oLZ
   xqFJqSUmFwS6KogLhQK0uvLXX5lf9CTR7khLFwFcmcq8yI+ZPOm46BCCB
   L7zmOyiavLBZj5kjh2OnwOMJNrbUgXAfC9w0SAGdceiCVHQTl6nDC0cnI
   A==;
X-CSE-ConnectionGUID: bj39QMQzTOy9+wPH0azNKA==
X-CSE-MsgGUID: QNQlENYOQFu4D1UD1BSIvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="46312049"
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="46312049"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 03:30:08 -0800
X-CSE-ConnectionGUID: WPBeYLjdT9Wl8QrKuhz29A==
X-CSE-MsgGUID: lcPYd62pTy2uVBihXITLAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137242440"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Dec 2024 03:30:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQm44-0002Xo-1G;
	Thu, 26 Dec 2024 11:30:04 +0000
Date: Thu, 26 Dec 2024 19:29:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpio/gpio-davinci.c:599 davinci_gpio_save_context() error:
 potentially dereferencing uninitialized 'g'.
Message-ID: <202412261936.Ab2roJgJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b2ffa6148b1e4468d08f7e0e7e371c43cac9ffe
commit: 56d6ff4b8faf1c2d5c850ed8b4e5dfa6cd81413b gpio: davinci: allow building the module with COMPILE_TEST=y
date:   2 months ago
:::::: branch date: 2 days ago
:::::: commit date: 2 months ago
config: sh-randconfig-r071-20241225 (https://download.01.org/0day-ci/archive/20241226/202412261936.Ab2roJgJ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412261936.Ab2roJgJ-lkp@intel.com/

smatch warnings:
drivers/gpio/gpio-davinci.c:599 davinci_gpio_save_context() error: potentially dereferencing uninitialized 'g'.

vim +/g +599 drivers/gpio/gpio-davinci.c

118150f22d6b44 KV Sujith       2013-08-18  577  
0651a730924b17 Devarsh Thakkar 2022-06-13  578  static void davinci_gpio_save_context(struct davinci_gpio_controller *chips,
0651a730924b17 Devarsh Thakkar 2022-06-13  579  				      u32 nbank)
0651a730924b17 Devarsh Thakkar 2022-06-13  580  {
0651a730924b17 Devarsh Thakkar 2022-06-13  581  	struct davinci_gpio_regs __iomem *g;
0651a730924b17 Devarsh Thakkar 2022-06-13  582  	struct davinci_gpio_regs *context;
0651a730924b17 Devarsh Thakkar 2022-06-13  583  	u32 bank;
0651a730924b17 Devarsh Thakkar 2022-06-13  584  	void __iomem *base;
0651a730924b17 Devarsh Thakkar 2022-06-13  585  
0651a730924b17 Devarsh Thakkar 2022-06-13  586  	base = chips->regs[0] - offset_array[0];
0651a730924b17 Devarsh Thakkar 2022-06-13  587  	chips->binten_context = readl_relaxed(base + BINTEN);
0651a730924b17 Devarsh Thakkar 2022-06-13  588  
0651a730924b17 Devarsh Thakkar 2022-06-13  589  	for (bank = 0; bank < nbank; bank++) {
0651a730924b17 Devarsh Thakkar 2022-06-13  590  		g = chips->regs[bank];
0651a730924b17 Devarsh Thakkar 2022-06-13  591  		context = &chips->context[bank];
0651a730924b17 Devarsh Thakkar 2022-06-13  592  		context->dir = readl_relaxed(&g->dir);
0651a730924b17 Devarsh Thakkar 2022-06-13  593  		context->set_data = readl_relaxed(&g->set_data);
0651a730924b17 Devarsh Thakkar 2022-06-13  594  		context->set_rising = readl_relaxed(&g->set_rising);
0651a730924b17 Devarsh Thakkar 2022-06-13  595  		context->set_falling = readl_relaxed(&g->set_falling);
0651a730924b17 Devarsh Thakkar 2022-06-13  596  	}
0651a730924b17 Devarsh Thakkar 2022-06-13  597  
0651a730924b17 Devarsh Thakkar 2022-06-13  598  	/* Clear all interrupt status registers */
0651a730924b17 Devarsh Thakkar 2022-06-13 @599  	writel_relaxed(GENMASK(31, 0), &g->intstat);
0651a730924b17 Devarsh Thakkar 2022-06-13  600  }
0651a730924b17 Devarsh Thakkar 2022-06-13  601  

:::::: The code at line 599 was first introduced by commit
:::::: 0651a730924b172476f67c7c6e01e898f84cd8f3 gpio: davinci: Add support for system suspend/resume PM

:::::: TO: Devarsh Thakkar <devarsht@ti.com>
:::::: CC: Bartosz Golaszewski <brgl@bgdev.pl>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
