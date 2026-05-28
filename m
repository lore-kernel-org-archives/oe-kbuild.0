Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044702E040E
	for <oe-kbuild@lists.linux.dev>; Thu, 28 May 2026 03:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779939770; cv=none; b=nGimvxw/tiCJ53AOaNCHm2Ctefr5LtqG4xBKlJb13yYXteBjedO9xr0TWo00D3EN5QgiGRWgWBJX6KpcLUCu23BE4lPjQiC1cbpJPC8r01PfBKFQfZePDOwWqCsCGvGQCBE4LkylaNes2kH2fHlt1SH6C5uO4nGcDRq9Vd9TnSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779939770; c=relaxed/simple;
	bh=l8SgRyuSKdl3pZRNAdTUcG81OoKmSdskH1Dpy32xSR4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BnWwUbTNP3YBbXTFgpe6XsIeG1A2Bhus97PCgWMUH32yra7smyn2/MMk9UpY1Yw7DCtcMFmKueGmd5OdTZVURSnOjGgsJGulsF74/ajPa4CHojNXDgj0d1yua9rpg/TCMI6feil2Fa5JbOSjUKtRPuW5IugjisCUyGjBQbu556w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NFSf3wqa; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NFSf3wqa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779939769; x=1811475769;
  h=date:from:to:cc:subject:message-id;
  bh=l8SgRyuSKdl3pZRNAdTUcG81OoKmSdskH1Dpy32xSR4=;
  b=NFSf3wqaVMi4sXxrxCNrdk1IcYLX9biTAPIdbkIJv089NkTqHQ9Fcmu0
   J/e9HgmE3xiiOM5vOKSDHZgM3DS4lCrxpKnaozlV8lhk3Vb30pnVtCyad
   93ZwfubCFkrbXyxOItiG6QO7ixnU50sonDU9v/HCvNr63qZyXjSXEnn/q
   h+TC0gTXYNGqB0g4oW9jSwv1ly5Auh8RbiPZNxCC52VsdA3k6qkIJCXRX
   okyo/Oa8yfzf34kmpZYauo7/AitS0+2XOAIl8GpWtE2QFfIX14SP+ajkJ
   FlBqNhjUYchv8VNRO+cJTNGCNWXy07nqiLG+6yygUf4MJpGkWU+P0a0Km
   Q==;
X-CSE-ConnectionGUID: +9PFQzxVQCiqgdHs1+52ow==
X-CSE-MsgGUID: DaagtNJWRaCPHJIXQtXN4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="92167246"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="92167246"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 20:42:48 -0700
X-CSE-ConnectionGUID: XXgALsEhSqKCR9xdXfGwlQ==
X-CSE-MsgGUID: 4Md5G37zS7q9Xr8ri13nNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="239427532"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 May 2026 20:42:47 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSRds-000000005UY-422S;
	Thu, 28 May 2026 03:42:44 +0000
Date: Thu, 28 May 2026 11:41:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7309/8766]
 drivers/pinctrl/renesas/pinctrl-rzt2h.c:197 rzt2h_pinctrl_set_pfc_mode()
 warn: subtract is higher precedence than shift
Message-ID: <202605281126.3E7Ggbfe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e7d700e14934e68f86338c5610cf2ae76798b663
commit: f9fb67bc77d322568bf573e81335be0e9be2a7c8 [7309/8766] pinctrl: renesas: rzt2h: Skip PFC mode configuration if already set
:::::: branch date: 12 hours ago
:::::: commit date: 3 days ago
config: arm64-randconfig-r071-20260528 (https://download.01.org/0day-ci/archive/20260528/202605281126.3E7Ggbfe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605281126.3E7Ggbfe-lkp@intel.com/

New smatch warnings:
drivers/pinctrl/renesas/pinctrl-rzt2h.c:197 rzt2h_pinctrl_set_pfc_mode() warn: subtract is higher precedence than shift
drivers/pinctrl/renesas/pinctrl-rzt2h.c:197 rzt2h_pinctrl_set_pfc_mode() warn: subtract is higher precedence than shift
drivers/pinctrl/renesas/pinctrl-rzt2h.c:197 rzt2h_pinctrl_set_pfc_mode() warn: subtract is higher precedence than shift
drivers/pinctrl/renesas/pinctrl-rzt2h.c:197 rzt2h_pinctrl_set_pfc_mode() warn: subtract is higher precedence than shift

Old smatch warnings:
drivers/pinctrl/renesas/pinctrl-rzt2h.c:523 rzt2h_pinctrl_pinconf_get() warn: subtract is higher precedence than shift
drivers/pinctrl/renesas/pinctrl-rzt2h.c:523 rzt2h_pinctrl_pinconf_get() warn: subtract is higher precedence than shift
drivers/pinctrl/renesas/pinctrl-rzt2h.c:523 rzt2h_pinctrl_pinconf_get() warn: subtract is higher precedence than shift
drivers/pinctrl/renesas/pinctrl-rzt2h.c:523 rzt2h_pinctrl_pinconf_get() warn: subtract is higher precedence than shift
drivers/pinctrl/renesas/pinctrl-rzt2h.c:556 rzt2h_pinctrl_pinconf_get() warn: subtract is higher precedence than shift
drivers/pinctrl/renesas/pinctrl-rzt2h.c:556 rzt2h_pinctrl_pinconf_get() warn: subtract is higher precedence than shift
drivers/pinctrl/renesas/pinctrl-rzt2h.c:556 rzt2h_pinctrl_pinconf_get() warn: subtract is higher precedence than shift
drivers/pinctrl/renesas/pinctrl-rzt2h.c:556 rzt2h_pinctrl_pinconf_get() warn: subtract is higher precedence than shift

vim +197 drivers/pinctrl/renesas/pinctrl-rzt2h.c

ba4a92372bea29 Cosmin Tanislav    2025-12-05  185  
34d4d093077a5c Thierry Bultel     2025-08-08  186  static void rzt2h_pinctrl_set_pfc_mode(struct rzt2h_pinctrl *pctrl,
34d4d093077a5c Thierry Bultel     2025-08-08  187  				       u8 port, u8 pin, u8 func)
34d4d093077a5c Thierry Bultel     2025-08-08  188  {
34d4d093077a5c Thierry Bultel     2025-08-08  189  	u64 reg64;
34d4d093077a5c Thierry Bultel     2025-08-08  190  	u16 reg16;
34d4d093077a5c Thierry Bultel     2025-08-08  191  
ebe7561e9b9203 Cosmin Tanislav    2026-02-05  192  	guard(raw_spinlock_irqsave)(&pctrl->lock);
34d4d093077a5c Thierry Bultel     2025-08-08  193  
f9fb67bc77d322 Lad Prabhakar      2026-05-13  194  	reg64 = rzt2h_pinctrl_readq(pctrl, port, PFC(port));
f9fb67bc77d322 Lad Prabhakar      2026-05-13  195  	/* Check if pin is already configured to the desired function */
f9fb67bc77d322 Lad Prabhakar      2026-05-13  196  	if ((rzt2h_pinctrl_readb(pctrl, port, PMC(port)) & BIT(pin)) &&
f9fb67bc77d322 Lad Prabhakar      2026-05-13 @197  	    field_get(PFC_PIN_MASK(pin), reg64) == func)
f9fb67bc77d322 Lad Prabhakar      2026-05-13  198  		return;
f9fb67bc77d322 Lad Prabhakar      2026-05-13  199  
34d4d093077a5c Thierry Bultel     2025-08-08  200  	/* Set pin to 'Non-use (Hi-Z input protection)'  */
34d4d093077a5c Thierry Bultel     2025-08-08  201  	reg16 = rzt2h_pinctrl_readw(pctrl, port, PM(port));
34d4d093077a5c Thierry Bultel     2025-08-08  202  	reg16 &= ~PM_PIN_MASK(pin);
34d4d093077a5c Thierry Bultel     2025-08-08  203  	rzt2h_pinctrl_writew(pctrl, port, reg16, PM(port));
34d4d093077a5c Thierry Bultel     2025-08-08  204  
34d4d093077a5c Thierry Bultel     2025-08-08  205  	/* Temporarily switch to GPIO mode with PMC register */
ba4a92372bea29 Cosmin Tanislav    2025-12-05  206  	rzt2h_pinctrl_set_gpio_en(pctrl, port, pin, true);
34d4d093077a5c Thierry Bultel     2025-08-08  207  
34d4d093077a5c Thierry Bultel     2025-08-08  208  	/* Select Pin function mode with PFC register */
34d4d093077a5c Thierry Bultel     2025-08-08  209  	reg64 &= ~PFC_PIN_MASK(pin);
34d4d093077a5c Thierry Bultel     2025-08-08  210  	rzt2h_pinctrl_writeq(pctrl, port, reg64 | ((u64)func << (pin * 8)), PFC(port));
34d4d093077a5c Thierry Bultel     2025-08-08  211  
34d4d093077a5c Thierry Bultel     2025-08-08  212  	/* Switch to Peripheral pin function with PMC register */
ba4a92372bea29 Cosmin Tanislav    2025-12-05  213  	rzt2h_pinctrl_set_gpio_en(pctrl, port, pin, false);
bf48f99d95dfd6 Geert Uytterhoeven 2025-09-24  214  }
34d4d093077a5c Thierry Bultel     2025-08-08  215  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
