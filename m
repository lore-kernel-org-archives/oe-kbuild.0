Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0772AEFD
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Aug 2025 04:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754800334; cv=none; b=QVQqjCTw4E5q9jQPKdmPM6VlCx9XeFooXLdmfbScCaa+fq0nZEMXIyhuRNOmqlXw21WtQ+FN+LcssqzfC9WGC5AYbld8PoHKMq+G//ZdykJE6lEaYTsFsqTPvGhMz6/S3yzr3VGpc8oGqa4bu2/7vy1VIx6fgEBSzVGIVWFWqYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754800334; c=relaxed/simple;
	bh=5YHCyBhdD4odaUlV6DXp7xyr1CsGVHaD08ovy53CbrM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=naon9dMMoOyn0P8nQwKjP5oILH9TN6tyUHVwaa1kU36s+akRVUQ85qI7O8hi4nykRe4Y7FgjtrsdQlja+De5hQzkpCpfIFP9rS1D/OnWGks/0iJvtXb63+BHmvhaQbtSSQ85hpLJ4u4Zsch0iQc+VZZeWh8fP0EqomReyA5t0KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fRnQkXz3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fRnQkXz3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754800332; x=1786336332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5YHCyBhdD4odaUlV6DXp7xyr1CsGVHaD08ovy53CbrM=;
  b=fRnQkXz3y8v1tPxZqfvBIQ/d1oRKPuU+K/NVB+rOSUaHdw6yRlIt9/YA
   DIFJzFFy2E0PQ5r8JiVYHExsuhOVQRNh8kcpdsRglG54Jv8Vmgj4q/jDC
   neV2foqFtpKi4kNH/42kXL+IqBFQwbKCGDt3YSQEnF29Oswy4oSzBU9nT
   i4nzOVWfJ3SxnhdcUnhsKrShm7izqmj09HSDNWx2bXY7hABxo78C/l57a
   i/7VT6nBV0t0pSbo7xnC1sMc6UL/c7SCDeezbxWqC+jCEPkDzxEjWxZoq
   N+DrQtN5C/HYkbIYHPbs9FKVumFWXxp4YPTR8eq20nJtSWrsN9WFtC3H8
   Q==;
X-CSE-ConnectionGUID: asLSTIZZRMyMFT2ND19/9A==
X-CSE-MsgGUID: thkoRafHQraOhJ0xfIA/MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="56966693"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="56966693"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 21:32:12 -0700
X-CSE-ConnectionGUID: z/iP5iaJSV6iNVh5SGnWzw==
X-CSE-MsgGUID: 02gGfcCdRHmrXvRf6kUQmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165278681"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 09 Aug 2025 21:32:10 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukxj6-00059c-0N;
	Sun, 10 Aug 2025 04:32:08 +0000
Date: Sun, 10 Aug 2025 12:31:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] rtc: pcf85363: add support for additional features
Message-ID: <202508101234.9f8Bejne-lkp@intel.com>
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
In-Reply-To: <20250808112246.4169280-2-lakshay.piplani@nxp.com>
References: <20250808112246.4169280-2-lakshay.piplani@nxp.com>
TO: Lakshay Piplani <lakshay.piplani@nxp.com>
TO: alexandre.belloni@bootlin.com
TO: linux-rtc@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: devicetree@vger.kernel.org
CC: vikash.bansal@nxp.com
CC: priyanka.jain@nxp.com
CC: shashank.rebbapragada@nxp.com
CC: Lakshay Piplani <lakshay.piplani@nxp.com>

Hi Lakshay,

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on linus/master v6.16 next-20250808]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lakshay-Piplani/rtc-pcf85363-add-support-for-additional-features/20250808-192449
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20250808112246.4169280-2-lakshay.piplani%40nxp.com
patch subject: [PATCH 2/2] rtc: pcf85363: add support for additional features
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-r071-20250810 (https://download.01.org/0day-ci/archive/20250810/202508101234.9f8Bejne-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508101234.9f8Bejne-lkp@intel.com/

smatch warnings:
drivers/rtc/rtc-pcf85363.c:634 pcf85363_watchdog_init() error: uninitialized symbol 'ret'.

vim +/ret +634 drivers/rtc/rtc-pcf85363.c

9ca6579ec239f99 Lakshay Piplani 2025-08-08  605  
9ca6579ec239f99 Lakshay Piplani 2025-08-08  606  /*
9ca6579ec239f99 Lakshay Piplani 2025-08-08  607   * Parses watchdog configuration from device tree and registers the
9ca6579ec239f99 Lakshay Piplani 2025-08-08  608   * watchdog with the Linux watchdog subsystem.
9ca6579ec239f99 Lakshay Piplani 2025-08-08  609   */
9ca6579ec239f99 Lakshay Piplani 2025-08-08  610  static int pcf85363_watchdog_init(struct device *dev, struct regmap *regmap)
9ca6579ec239f99 Lakshay Piplani 2025-08-08  611  {
9ca6579ec239f99 Lakshay Piplani 2025-08-08  612  	struct pcf85363_watchdog *wd;
9ca6579ec239f99 Lakshay Piplani 2025-08-08  613  	u32 timeout = 10, clock = 0;
9ca6579ec239f99 Lakshay Piplani 2025-08-08  614  	int ret;
9ca6579ec239f99 Lakshay Piplani 2025-08-08  615  
9ca6579ec239f99 Lakshay Piplani 2025-08-08  616  	if (!IS_ENABLED(CONFIG_WATCHDOG) || !device_property_read_bool(dev, "nxp,enable-watchdog"))
9ca6579ec239f99 Lakshay Piplani 2025-08-08  617  		return 0;
9ca6579ec239f99 Lakshay Piplani 2025-08-08  618  
9ca6579ec239f99 Lakshay Piplani 2025-08-08  619  	wd = devm_kzalloc(dev, sizeof(*wd), GFP_KERNEL);
9ca6579ec239f99 Lakshay Piplani 2025-08-08  620  	if (!wd)
9ca6579ec239f99 Lakshay Piplani 2025-08-08  621  		return -ENOMEM;
9ca6579ec239f99 Lakshay Piplani 2025-08-08  622  
9ca6579ec239f99 Lakshay Piplani 2025-08-08  623  	wd->regmap = regmap;
9ca6579ec239f99 Lakshay Piplani 2025-08-08  624  	wd->dev = dev;
9ca6579ec239f99 Lakshay Piplani 2025-08-08  625  
9ca6579ec239f99 Lakshay Piplani 2025-08-08  626  	device_property_read_u32(dev, "nxp,watchdog-timeout", &timeout);
9ca6579ec239f99 Lakshay Piplani 2025-08-08  627  	wd->timeout_val = clamp(timeout, WD_TIMEOUT_MIN, WD_TIMEOUT_MAX);
9ca6579ec239f99 Lakshay Piplani 2025-08-08  628  
9ca6579ec239f99 Lakshay Piplani 2025-08-08  629  	device_property_read_u32(dev, "nxp,watchdog-stepsize", &clock);
9ca6579ec239f99 Lakshay Piplani 2025-08-08  630  	wd->clock_sel = clock & WD_CLKSEL_MASK;
9ca6579ec239f99 Lakshay Piplani 2025-08-08  631  
9ca6579ec239f99 Lakshay Piplani 2025-08-08  632  	wd->repeat = device_property_read_bool(dev, "nxp,watchdog-repeat");
9ca6579ec239f99 Lakshay Piplani 2025-08-08  633  
9ca6579ec239f99 Lakshay Piplani 2025-08-08 @634  	if (ret)
9ca6579ec239f99 Lakshay Piplani 2025-08-08  635  		return ret;
9ca6579ec239f99 Lakshay Piplani 2025-08-08  636  
9ca6579ec239f99 Lakshay Piplani 2025-08-08  637  	/* Clear any stale WDF flag */
9ca6579ec239f99 Lakshay Piplani 2025-08-08  638  	regmap_update_bits(regmap, CTRL_FLAGS, FLAGS_WDF, 0);
9ca6579ec239f99 Lakshay Piplani 2025-08-08  639  
9ca6579ec239f99 Lakshay Piplani 2025-08-08  640  	/* Register the watchdog device */
9ca6579ec239f99 Lakshay Piplani 2025-08-08  641  	wd->wdd.info = &pcf85363_wdt_info;
9ca6579ec239f99 Lakshay Piplani 2025-08-08  642  	wd->wdd.ops = &pcf85363_wdt_ops;
9ca6579ec239f99 Lakshay Piplani 2025-08-08  643  	wd->wdd.min_timeout = WD_TIMEOUT_MIN;
9ca6579ec239f99 Lakshay Piplani 2025-08-08  644  	wd->wdd.max_timeout = WD_TIMEOUT_MAX;
9ca6579ec239f99 Lakshay Piplani 2025-08-08  645  	wd->wdd.timeout = wd->timeout_val;
9ca6579ec239f99 Lakshay Piplani 2025-08-08  646  	wd->wdd.parent = dev;
9ca6579ec239f99 Lakshay Piplani 2025-08-08  647  
9ca6579ec239f99 Lakshay Piplani 2025-08-08  648  	/*
9ca6579ec239f99 Lakshay Piplani 2025-08-08  649  	 * For testing purposes, it's recommended to enable CONFIG_WATCHDOG_NOWAYOUT
9ca6579ec239f99 Lakshay Piplani 2025-08-08  650  	 * in the kernel configuration. If this option is not set, the watchdog may stop
9ca6579ec239f99 Lakshay Piplani 2025-08-08  651  	 * immediately after being started, especially if the user-space daemon closes
9ca6579ec239f99 Lakshay Piplani 2025-08-08  652  	 * /dev/watchdog without keeping it alive. Enabling NOWAYOUT ensures the watchdog
9ca6579ec239f99 Lakshay Piplani 2025-08-08  653  	 * remains active and can properly test system reset behavior.
9ca6579ec239f99 Lakshay Piplani 2025-08-08  654  	 */
9ca6579ec239f99 Lakshay Piplani 2025-08-08  655  	wd->wdd.status = WATCHDOG_NOWAYOUT_INIT_STATUS;
9ca6579ec239f99 Lakshay Piplani 2025-08-08  656  
9ca6579ec239f99 Lakshay Piplani 2025-08-08  657  	watchdog_set_drvdata(&wd->wdd, wd);
9ca6579ec239f99 Lakshay Piplani 2025-08-08  658  
9ca6579ec239f99 Lakshay Piplani 2025-08-08  659  	dev_info(dev, "pcf85363: watchdog initialized successfully\n");
9ca6579ec239f99 Lakshay Piplani 2025-08-08  660  
9ca6579ec239f99 Lakshay Piplani 2025-08-08  661  	return devm_watchdog_register_device(dev, &wd->wdd);
9ca6579ec239f99 Lakshay Piplani 2025-08-08  662  }
9ca6579ec239f99 Lakshay Piplani 2025-08-08  663  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
