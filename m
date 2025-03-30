Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBD7320F
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Mar 2025 05:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743313300; cv=none; b=Gi8Yg+rHZwA+MGAsU7+/R8xMOT32s+OPR3abtgO7nC+7kVp3qiNJ2ib6Zr87nZwS0Kj2nx5O7lXJy6n/RCMien3UAo5UAGaRHSlCsP7tmCySh0EmtPmWaavejeGSMAzvAkAFXhscb5RkFHYO/a+wfln154BSRWLJPo/qeWfc7Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743313300; c=relaxed/simple;
	bh=lOrkVem4YisD85VjpVJ2pB6R2+EXyBaz6fwW+qm+3eI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ofP4KUbMSxFU5FZZzNJyJYSojHr5ZVobTuAT88ybjRAsUaL1FrRi3DkQJx5yaQM2lhToKG7t80+1Pv0upQJJsTKvMupd8zfW3yi8RPt5By6/CqZ/F+1ixQpKAt1tSit+m8iaIPAPXU8XGoEUMmLFWZeu1ULOaEDY5SBgV8UYcWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BGtj4CUc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BGtj4CUc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743313299; x=1774849299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lOrkVem4YisD85VjpVJ2pB6R2+EXyBaz6fwW+qm+3eI=;
  b=BGtj4CUcwuuZbY2KetIuh2TQeqqitypmPQkohjrWpRss6XtwnptgV/65
   gpdPl3hcXseyuaAhBY1ipxQuQs+23tztAEkQH4p0f65raXve9lAFNgduM
   OjwYo0NVPav2MVaO7aPOluoj9ji4KV8OPF1PzoV3/1JOiGujetAg1Tqb0
   dMTUOXAAvOF5Ktx7N6GdBGkco9iWLgTqOD/QbKONWi7cMTZMXngvO2GHE
   oaGf/ll64UNVArRpYMtQexhT0Q3QW10yso0bp97ABMFN8HD9B5uSWkW70
   FwFPhv4MkIgFo5W82NidCW8HZbYOiJ11VD7zaUm6+SGsduPZmHLnDqqn3
   A==;
X-CSE-ConnectionGUID: 1/BLjhxRReCZArWK+93UuQ==
X-CSE-MsgGUID: hMJc2xYqScedwzyFNWNoIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="44542271"
X-IronPort-AV: E=Sophos;i="6.14,287,1736841600"; 
   d="scan'208";a="44542271"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 22:41:38 -0700
X-CSE-ConnectionGUID: fcbRmosxSPuQPLbxrkAf9g==
X-CSE-MsgGUID: 2y/mxeG3TaibdgRdMLNVOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,287,1736841600"; 
   d="scan'208";a="126048923"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 29 Mar 2025 22:41:37 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tylQH-0008XD-2l;
	Sun, 30 Mar 2025 05:41:31 +0000
Date: Sun, 30 Mar 2025 13:41:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [litex-hub:litex-rebase 6/15] drivers/gpio/gpio-litex.c:228
 litex_gpio_irq_set_type() warn: inconsistent returns '&gpio_s->gpio_lock'.
Message-ID: <202503301335.C7M94pcE-lkp@intel.com>
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
TO: Robert Winkler <rwinkler@internships.antmicro.com>
CC: Gabriel Somlo <gsomlo@gmail.com>
CC: Marek Czerski <m.czerski@ap-tech.pl>
CC: Stafford Horne <shorne@gmail.com>
CC: Geert Uytterhoeven <geert@linux-m68k.org>

tree:   https://github.com/litex-hub/linux litex-rebase
head:   896969d069ea7223671dd1aac991c551baa91bac
commit: 3eb679a2997bf7eb6be1760544632505440a563f [6/15] LiteX: driver for LiteGPIO interface
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: s390-randconfig-r072-20250330 (https://download.01.org/0day-ci/archive/20250330/202503301335.C7M94pcE-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503301335.C7M94pcE-lkp@intel.com/

smatch warnings:
drivers/gpio/gpio-litex.c:228 litex_gpio_irq_set_type() warn: inconsistent returns '&gpio_s->gpio_lock'.

vim +228 drivers/gpio/gpio-litex.c

3eb679a2997bf7 Robert Winkler 2020-12-22  187  
3eb679a2997bf7 Robert Winkler 2020-12-22  188  static int litex_gpio_irq_set_type(struct irq_data *idata, unsigned int type)
3eb679a2997bf7 Robert Winkler 2020-12-22  189  {
3eb679a2997bf7 Robert Winkler 2020-12-22  190  	struct gpio_chip *chip = irq_data_get_irq_chip_data(idata);
3eb679a2997bf7 Robert Winkler 2020-12-22  191  	struct litex_gpio *gpio_s = gpiochip_get_data(chip);
3eb679a2997bf7 Robert Winkler 2020-12-22  192  	int offset = irqd_to_hwirq(idata) % GPIO_PINS_MAX;
3eb679a2997bf7 Robert Winkler 2020-12-22  193  	unsigned long flags;
3eb679a2997bf7 Robert Winkler 2020-12-22  194  	u32 bit = BIT(offset);
3eb679a2997bf7 Robert Winkler 2020-12-22  195  	u32 mode, edge;
3eb679a2997bf7 Robert Winkler 2020-12-22  196  
3eb679a2997bf7 Robert Winkler 2020-12-22  197  	spin_lock_irqsave(&gpio_s->gpio_lock, flags);
3eb679a2997bf7 Robert Winkler 2020-12-22  198  
3eb679a2997bf7 Robert Winkler 2020-12-22  199  	mode = litex_gpio_get_reg(gpio_s, LITEX_GPIO_MODE_OFFSET);
3eb679a2997bf7 Robert Winkler 2020-12-22  200  	edge = litex_gpio_get_reg(gpio_s, LITEX_GPIO_EDGE_OFFSET);
3eb679a2997bf7 Robert Winkler 2020-12-22  201  
3eb679a2997bf7 Robert Winkler 2020-12-22  202  	switch (type & IRQ_TYPE_SENSE_MASK) {
3eb679a2997bf7 Robert Winkler 2020-12-22  203  		case IRQ_TYPE_NONE:
3eb679a2997bf7 Robert Winkler 2020-12-22  204  			break;
3eb679a2997bf7 Robert Winkler 2020-12-22  205  
3eb679a2997bf7 Robert Winkler 2020-12-22  206  		case IRQ_TYPE_EDGE_RISING:
3eb679a2997bf7 Robert Winkler 2020-12-22  207              mode &= ~bit;
3eb679a2997bf7 Robert Winkler 2020-12-22  208  			edge &= ~bit;
3eb679a2997bf7 Robert Winkler 2020-12-22  209  			break;
3eb679a2997bf7 Robert Winkler 2020-12-22  210  
3eb679a2997bf7 Robert Winkler 2020-12-22  211  		case IRQ_TYPE_EDGE_FALLING:
3eb679a2997bf7 Robert Winkler 2020-12-22  212              mode &= ~bit;
3eb679a2997bf7 Robert Winkler 2020-12-22  213  			edge |= bit;
3eb679a2997bf7 Robert Winkler 2020-12-22  214  			break;
3eb679a2997bf7 Robert Winkler 2020-12-22  215  
3eb679a2997bf7 Robert Winkler 2020-12-22  216          case IRQ_TYPE_EDGE_BOTH:
3eb679a2997bf7 Robert Winkler 2020-12-22  217  			mode |= bit;
3eb679a2997bf7 Robert Winkler 2020-12-22  218              break;
3eb679a2997bf7 Robert Winkler 2020-12-22  219  
3eb679a2997bf7 Robert Winkler 2020-12-22  220  		default:
3eb679a2997bf7 Robert Winkler 2020-12-22  221  			return -EINVAL;
3eb679a2997bf7 Robert Winkler 2020-12-22  222  	}
3eb679a2997bf7 Robert Winkler 2020-12-22  223  	litex_gpio_set_reg(gpio_s, LITEX_GPIO_MODE_OFFSET, mode);
3eb679a2997bf7 Robert Winkler 2020-12-22  224  	litex_gpio_set_reg(gpio_s, LITEX_GPIO_EDGE_OFFSET, edge);
3eb679a2997bf7 Robert Winkler 2020-12-22  225  
3eb679a2997bf7 Robert Winkler 2020-12-22  226  	spin_unlock_irqrestore(&gpio_s->gpio_lock, flags);
3eb679a2997bf7 Robert Winkler 2020-12-22  227  
3eb679a2997bf7 Robert Winkler 2020-12-22 @228  	return 0;
3eb679a2997bf7 Robert Winkler 2020-12-22  229  }
3eb679a2997bf7 Robert Winkler 2020-12-22  230  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
