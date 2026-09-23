Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6684248C9
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 18:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188314; cv=none; b=hAPKf0Czt1qi3B2Z8aRaWzTdYDhxP8YLLjMB7LyMN7inXczNSJkpOfhId1rip7b/NnSMAf1UQoSuTlChHlgPvkTagHA6vJMelzTfKlE+FRVPSufFHSdmfnlgJnaklSce8PZeTY47IIgYJy/B5+MuywxNlU3ZMMXtudcoywsXgMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188314; c=relaxed/simple;
	bh=M9Ds3nyGcr4qnbrudz4lrdAnLcQBAXEdz5fHEC2CG2Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hGGQjuEJAIkHeAz+HTFThC1v0loU1vbPI2F3gXp9eYpRzqwipEn9u4+EcxsW3XVbpGTRrc+nfjYwQthtrUZ0KaQiQOWhkoVJHRwSFRk2BTYHZaPGFEOIY9K4WIlbYdmaAgQXtHSpjoY/5c9GqSgitklkFrEa5UnSUWiT4XShQlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HLoXRdb3; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HLoXRdb3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790188312; x=1821724312;
  h=date:from:to:cc:subject:message-id;
  bh=M9Ds3nyGcr4qnbrudz4lrdAnLcQBAXEdz5fHEC2CG2Y=;
  b=HLoXRdb3nzS9DkgO2W6YPBmqcVzwkV5ip+ZxO+LjUgFSQ7cifDnw16Y4
   jghTTC2aRTPVnNjn1oSILTtz2p6WBIMltP0CNbGny5Rp0GhQQMObfpdyT
   LEoWY0vINtI7o+YbURtbVOwtPkWTfZFleYW37JHlursJUfrRsk03gEmJX
   fmFDfRBr2QrXygeSmGxr+GBI8v1/WU1Gc/Z8G0LgyDNrEZ+f3lEbTgrfS
   spqVmWGKq2QPsvT/imrJ4zgIt8x299wIdnQywemGvEmL3da2NTWzrIWTQ
   5KcPTkrnqw7GMgta/LYNLBwH9IArq3voNkyj3iVGHcR/vGJ7wk2Jv2jGd
   A==;
X-CSE-ConnectionGUID: V5b3QLTSR8O7LwjFdCfc8A==
X-CSE-MsgGUID: pkxGauWFTxSFP9peRBMxYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="94735736"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="94735736"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 11:31:52 -0700
X-CSE-ConnectionGUID: oM7Utxv7Ri6FbBNUfS3Z9Q==
X-CSE-MsgGUID: /IKj4uzoS0KOGFF28Fh9iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="301677015"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 23 Sep 2026 11:31:50 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Rkw-000000000m5-0aYQ;
	Wed, 23 Sep 2026 18:31:46 +0000
Date: Wed, 23 Sep 2026 20:30:46 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pinctrl/renesas/pinctrl-rzt2h.c:197
 rzt2h_pinctrl_set_pfc_mode() warn: subtract is higher precedence than shift
Message-ID: <202609232049.IcVFcnuj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe2ec83746e501645709761605c2464a44fd2929
commit: f9fb67bc77d322568bf573e81335be0e9be2a7c8 pinctrl: renesas: rzt2h: Skip PFC mode configuration if already set
date:   4 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-r2202-20260923 (https://download.01.org/0day-ci/archive/20260923/202609232049.IcVFcnuj-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 4b99afb361a8cfd45fc17aebc637688661e9e472)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f9fb67bc77d3 ("pinctrl: renesas: rzt2h: Skip PFC mode configuration if already set")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609232049.IcVFcnuj-lkp@intel.com/

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
