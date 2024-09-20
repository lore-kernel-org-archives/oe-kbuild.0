Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B5B18DF66
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Sep 2024 23:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726874963; cv=none; b=U/XLVk+nz9zBqX2So4JygArtC44y68HXagTEeqSZAM5qSziIkV5RwTy8tvVO+zAHcrR2wtav8AnYzM6edHD74T31xMZVDUmH+mS2vSGMxNqqwkCRBbeyQxIsGVwBB+a0ra4xjK6FB8kLj3vYgtBvY9eMWf+N6ai73ZCXJFRzksI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726874963; c=relaxed/simple;
	bh=t45fvfETlo76L9sumvptYJp3nHZaDnkQdSkC2vDjl8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ioM4zS1sRJzPt5kac/wimDfJi/9hK/Y+lU+BNbW/gYbuQCEk9qWCQBEQZnfsJGg109WbdWbeFEAuGIJ7z1/hMF/rX9IeK3IZhV1HWxTjADpJ0CuB/Om4LKepC105uQdIyFNA7FrQVnJNXoaPWtsIPT3w3AQJ1Dw09C1AzLsp9bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aCi7oEuj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aCi7oEuj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726874962; x=1758410962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t45fvfETlo76L9sumvptYJp3nHZaDnkQdSkC2vDjl8Q=;
  b=aCi7oEujFC6YUQuCeK79at9i4CuUs8WYhctaVQxX0wx9qPsNRhnzt7ga
   HkXEYO8ZBf8bQfQ36lKEIoL7/dg++Fap6s5QBb9sEszlaf2ZM9wZtJr8Q
   JZatWc4265RMOEAXFfG25UpNaoimF/DRsfdvYVNf5+erITq/7HAf8rlQP
   aHeIwsVjb/ygphDaifQnJ6XY40RGtmK+D4iaDre2KTV1JTdlUtFxmvxKj
   bkwlhhh8g3meOq+C7udw0eQV0A/UTGPp9RLgdvtfH+tFCrI0J5scZspuq
   TRIxJYno9Glgmhs+PhwTmGiVbQfEJ7vjeh8JN4AbBDnHPtU7cvnhE3xg7
   Q==;
X-CSE-ConnectionGUID: K86KqpBTQXOR3MTXCyoYDQ==
X-CSE-MsgGUID: NdrtyfpXRI6Gxg79Q0xGlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="29795000"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="29795000"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 16:29:19 -0700
X-CSE-ConnectionGUID: o8+zuUdCSZSXqubGFc3Bzw==
X-CSE-MsgGUID: W8s5tT7mR+ilr68ahO6p+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="70461217"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Sep 2024 16:29:18 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srn3r-000EwR-2Q;
	Fri, 20 Sep 2024 23:29:15 +0000
Date: Sat, 21 Sep 2024 07:28:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 3/3] power: supply: initial support for TWL6030/32
Message-ID: <202409210718.b43qaz5s-lkp@intel.com>
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
In-Reply-To: <20240918084132.928295-4-andreas@kemnade.info>
References: <20240918084132.928295-4-andreas@kemnade.info>
TO: Andreas Kemnade <andreas@kemnade.info>
TO: tony@atomide.com
TO: Sebastian Reichel <sre@kernel.org>
TO: linux-omap@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: Lee Jones <lee@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: linux-kernel@vger.kernel.org
TO: Conor Dooley <conor+dt@kernel.org>
TO: linux-pm@vger.kernel.org
CC: Andreas Kemnade <andreas@kemnade.info>

Hi Andreas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sre-power-supply/for-next]
[also build test WARNING on lee-mfd/for-mfd-next lee-leds/for-leds-next linus/master v6.11 next-20240920]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Kemnade/dt-bindings-power-supply-Add-TI-TWL603X-charger/20240918-164406
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git for-next
patch link:    https://lore.kernel.org/r/20240918084132.928295-4-andreas%40kemnade.info
patch subject: [PATCH 3/3] power: supply: initial support for TWL6030/32
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: sparc-randconfig-r071-20240921 (https://download.01.org/0day-ci/archive/20240921/202409210718.b43qaz5s-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409210718.b43qaz5s-lkp@intel.com/

smatch warnings:
drivers/power/supply/twl6030_charger.c:360 twl6030_charger_usb_get_property() warn: statement has no effect 3

vim +360 drivers/power/supply/twl6030_charger.c

bf11ecea7779f3d Andreas Kemnade 2024-09-18  345  
bf11ecea7779f3d Andreas Kemnade 2024-09-18  346  static int twl6030_charger_usb_get_property(struct power_supply *psy,
bf11ecea7779f3d Andreas Kemnade 2024-09-18  347  					    enum power_supply_property psp,
bf11ecea7779f3d Andreas Kemnade 2024-09-18  348  					    union power_supply_propval *val)
bf11ecea7779f3d Andreas Kemnade 2024-09-18  349  {
bf11ecea7779f3d Andreas Kemnade 2024-09-18  350  	struct twl6030_charger_info *charger = power_supply_get_drvdata(psy);
bf11ecea7779f3d Andreas Kemnade 2024-09-18  351  	int ret;
bf11ecea7779f3d Andreas Kemnade 2024-09-18  352  	u8 stat1;
bf11ecea7779f3d Andreas Kemnade 2024-09-18  353  
bf11ecea7779f3d Andreas Kemnade 2024-09-18  354  	ret = twl6030_charger_read(CONTROLLER_STAT1, &stat1);
bf11ecea7779f3d Andreas Kemnade 2024-09-18  355  	if (ret)
bf11ecea7779f3d Andreas Kemnade 2024-09-18  356  		return ret;
bf11ecea7779f3d Andreas Kemnade 2024-09-18  357  
bf11ecea7779f3d Andreas Kemnade 2024-09-18  358  	switch (psp) {
bf11ecea7779f3d Andreas Kemnade 2024-09-18  359  	case POWER_SUPPLY_PROP_STATUS:
bf11ecea7779f3d Andreas Kemnade 2024-09-18 @360  		u8 intstat;
bf11ecea7779f3d Andreas Kemnade 2024-09-18  361  
bf11ecea7779f3d Andreas Kemnade 2024-09-18  362  		if (!(stat1 & VBUS_DET)) {
bf11ecea7779f3d Andreas Kemnade 2024-09-18  363  			val->intval = POWER_SUPPLY_STATUS_NOT_CHARGING;
bf11ecea7779f3d Andreas Kemnade 2024-09-18  364  			break;
bf11ecea7779f3d Andreas Kemnade 2024-09-18  365  		}
bf11ecea7779f3d Andreas Kemnade 2024-09-18  366  		ret = twl6030_charger_read(CHARGERUSB_STATUS_INT2, &intstat);
bf11ecea7779f3d Andreas Kemnade 2024-09-18  367  		if (ret)
bf11ecea7779f3d Andreas Kemnade 2024-09-18  368  			return ret;
bf11ecea7779f3d Andreas Kemnade 2024-09-18  369  
bf11ecea7779f3d Andreas Kemnade 2024-09-18  370  		if (intstat & CHARGE_DONE)
bf11ecea7779f3d Andreas Kemnade 2024-09-18  371  			val->intval = POWER_SUPPLY_STATUS_FULL;
bf11ecea7779f3d Andreas Kemnade 2024-09-18  372  		else if (intstat & CURRENT_TERM)
bf11ecea7779f3d Andreas Kemnade 2024-09-18  373  			val->intval = POWER_SUPPLY_STATUS_NOT_CHARGING;
bf11ecea7779f3d Andreas Kemnade 2024-09-18  374  		else
bf11ecea7779f3d Andreas Kemnade 2024-09-18  375  			val->intval = POWER_SUPPLY_STATUS_CHARGING;
bf11ecea7779f3d Andreas Kemnade 2024-09-18  376  		break;
bf11ecea7779f3d Andreas Kemnade 2024-09-18  377  	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
bf11ecea7779f3d Andreas Kemnade 2024-09-18  378  		if (!charger->channel_vusb)
bf11ecea7779f3d Andreas Kemnade 2024-09-18  379  			return -ENODATA;
bf11ecea7779f3d Andreas Kemnade 2024-09-18  380  
bf11ecea7779f3d Andreas Kemnade 2024-09-18  381  		ret = iio_read_channel_processed_scale(charger->channel_vusb, &val->intval, 1000);
bf11ecea7779f3d Andreas Kemnade 2024-09-18  382  		if (ret < 0)
bf11ecea7779f3d Andreas Kemnade 2024-09-18  383  			return ret;
bf11ecea7779f3d Andreas Kemnade 2024-09-18  384  
bf11ecea7779f3d Andreas Kemnade 2024-09-18  385  		break;
bf11ecea7779f3d Andreas Kemnade 2024-09-18  386  	case POWER_SUPPLY_PROP_ONLINE:
bf11ecea7779f3d Andreas Kemnade 2024-09-18  387  		val->intval = !!(stat1 & VBUS_DET);
bf11ecea7779f3d Andreas Kemnade 2024-09-18  388  		break;
bf11ecea7779f3d Andreas Kemnade 2024-09-18  389  	case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
bf11ecea7779f3d Andreas Kemnade 2024-09-18  390  		val->intval = charger->input_current_limit;
bf11ecea7779f3d Andreas Kemnade 2024-09-18  391  		break;
bf11ecea7779f3d Andreas Kemnade 2024-09-18  392  	default:
bf11ecea7779f3d Andreas Kemnade 2024-09-18  393  		return -EINVAL;
bf11ecea7779f3d Andreas Kemnade 2024-09-18  394  	}
bf11ecea7779f3d Andreas Kemnade 2024-09-18  395  
bf11ecea7779f3d Andreas Kemnade 2024-09-18  396  	return 0;
bf11ecea7779f3d Andreas Kemnade 2024-09-18  397  }
bf11ecea7779f3d Andreas Kemnade 2024-09-18  398  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
