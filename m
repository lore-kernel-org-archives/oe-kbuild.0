Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273FD50095F
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 00:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768781254; cv=none; b=D2RH1zltym6jR92jNhTC1oULDqgJTWNb+Qq76JqBRHfXQ0OwH7/MXGBF4pONXHrH+sEqjiCR17tGPSQ8IaTMRAC9JhE58MPbP9COoIYnpCKoPp56nWmEem/flkiE8kyabyz59wcWX9VFeVxIWTv1bOx4JLLbMPMWlnDcJW/kQIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768781254; c=relaxed/simple;
	bh=Pmf0qum1JIBjzxXcQaSKvHXwtNtlmTEAUN+FXI2Z5A4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dzQU80FyxfwpF98kLn2IhW8dvFW+OC0HWnTJzvnmYCKk8pA3RPVdmfObpKWBekN3A3m/CM88D4zh0PykGvgz79zZXyI1Cvnorn5aViQwRazKR3psuKrw0ainRJxQe0INurcSthO8GJpG1AuVL+NKfRG9XnbrrhprAZod4HP591A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ibxr56M3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ibxr56M3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768781250; x=1800317250;
  h=date:from:to:cc:subject:message-id;
  bh=Pmf0qum1JIBjzxXcQaSKvHXwtNtlmTEAUN+FXI2Z5A4=;
  b=Ibxr56M3Heb7XB68+F21tIyIeJuOsZ7tPqMSExa3PNit5hPJDvrFpoYQ
   ozqakh5U5x7h60wsRh3sXZEUIZ2GOdt5vz+cR5gEbo46HgV8NbQAMgkln
   FXo0nrkb9m6xkRTKMiREX4vzSa7fZ0u9sRaiGAit2vyWTDLl35m4sjgHf
   /dgLMhuq/9Xpwe0apu8godksfU0Ljsm6gnuVyybLK/78OwJX8wbEy7hbp
   zUS3LgddfbpehB6+NTUwyc1cKU4Ql7/nw1iynm3L1wWbWvP9U4Gv4RBkX
   Q/r+bCbdm3pw66NlE+P/nl8Ph6PbNpeOO2RuYILgijrk5WJz0XhLzcR6b
   Q==;
X-CSE-ConnectionGUID: l65zWd4DQYujb6gw1R1obQ==
X-CSE-MsgGUID: ky3n2tfYTH+Ujzk+apDcHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="73844726"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="73844726"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 16:07:29 -0800
X-CSE-ConnectionGUID: U0cjcR05TwqDaUNVvu/+Zg==
X-CSE-MsgGUID: J35smDpCRBW2voG60stpbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="210210745"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Jan 2026 16:07:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhcnl-00000000NIh-2jHf;
	Mon, 19 Jan 2026 00:07:25 +0000
Date: Mon, 19 Jan 2026 08:07:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:irq/urgent 2/2] drivers/irqchip/irq-renesas-rzv2h.c:382
 rzv2h_tint_set_type() warn: subtract is higher precedence than shift
Message-ID: <202601190721.4U9mwCej-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Biju Das <biju.das.jz@bp.renesas.com>
CC: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/urgent
head:   cd4a3ced4d1cdb14ffe905657b98a91e9d239dfb
commit: cd4a3ced4d1cdb14ffe905657b98a91e9d239dfb [2/2] irqchip/renesas-rzv2h: Prevent TINT spurious interrupt during resume
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: alpha-randconfig-r072-20260119 (https://download.01.org/0day-ci/archive/20260119/202601190721.4U9mwCej-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601190721.4U9mwCej-lkp@intel.com/

smatch warnings:
drivers/irqchip/irq-renesas-rzv2h.c:382 rzv2h_tint_set_type() warn: subtract is higher precedence than shift
drivers/irqchip/irq-renesas-rzv2h.c:382 rzv2h_tint_set_type() warn: subtract is higher precedence than shift
drivers/irqchip/irq-renesas-rzv2h.c:382 rzv2h_tint_set_type() warn: subtract is higher precedence than shift
drivers/irqchip/irq-renesas-rzv2h.c:382 rzv2h_tint_set_type() warn: subtract is higher precedence than shift

vim +382 drivers/irqchip/irq-renesas-rzv2h.c

0d7605e75ac2d8 Fabrizio Castro 2024-10-10  325  
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  326  static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  327  {
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  328  	u32 titsr, titsr_k, titsel_n, tien;
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  329  	struct rzv2h_icu_priv *priv;
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  330  	u32 tssr, tssr_k, tssel_n;
cd4a3ced4d1cdb Biju Das        2026-01-13  331  	u32 titsr_cur, tssr_cur;
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  332  	unsigned int hwirq;
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  333  	u32 tint, sense;
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  334  	int tint_nr;
1a6ebcc10b138a Biju Das        2025-02-24  335  	u8 nr_tint;
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  336  
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  337  	switch (type & IRQ_TYPE_SENSE_MASK) {
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  338  	case IRQ_TYPE_LEVEL_LOW:
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  339  		sense = ICU_TINT_LEVEL_LOW;
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  340  		break;
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  341  
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  342  	case IRQ_TYPE_LEVEL_HIGH:
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  343  		sense = ICU_TINT_LEVEL_HIGH;
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  344  		break;
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  345  
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  346  	case IRQ_TYPE_EDGE_RISING:
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  347  		sense = ICU_TINT_EDGE_RISING;
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  348  		break;
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  349  
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  350  	case IRQ_TYPE_EDGE_FALLING:
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  351  		sense = ICU_TINT_EDGE_FALLING;
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  352  		break;
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  353  
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  354  	default:
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  355  		return -EINVAL;
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  356  	}
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  357  
eb23d23d082d09 Biju Das        2025-02-24  358  	priv = irq_data_to_priv(d);
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  359  	tint = (u32)(uintptr_t)irq_data_get_irq_chip_data(d);
eb23d23d082d09 Biju Das        2025-02-24  360  	if (tint > priv->info->max_tssel)
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  361  		return -EINVAL;
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  362  
399b2799985237 Biju Das        2025-02-24  363  	if (priv->info->tssel_lut)
399b2799985237 Biju Das        2025-02-24  364  		tint = priv->info->tssel_lut[tint];
399b2799985237 Biju Das        2025-02-24  365  
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  366  	hwirq = irqd_to_hwirq(d);
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  367  	tint_nr = hwirq - ICU_TINT_START;
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  368  
1a6ebcc10b138a Biju Das        2025-02-24  369  	nr_tint = 32 / priv->info->field_width;
1a6ebcc10b138a Biju Das        2025-02-24  370  	tssr_k = tint_nr / nr_tint;
1a6ebcc10b138a Biju Das        2025-02-24  371  	tssel_n = tint_nr % nr_tint;
76c3b774734feb Biju Das        2025-02-24  372  	tien = ICU_TSSR_TIEN(tssel_n, priv->info->field_width);
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  373  
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  374  	titsr_k = ICU_TITSR_K(tint_nr);
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  375  	titsel_n = ICU_TITSR_TITSEL_N(tint_nr);
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  376  
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  377  	guard(raw_spinlock)(&priv->lock);
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  378  
0a9d6ef64e5e91 Biju Das        2025-02-24  379  	tssr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TSSR(tssr_k));
cd4a3ced4d1cdb Biju Das        2026-01-13  380  	titsr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TITSR(titsr_k));
cd4a3ced4d1cdb Biju Das        2026-01-13  381  
cd4a3ced4d1cdb Biju Das        2026-01-13 @382  	tssr_cur = field_get(ICU_TSSR_TSSEL_MASK(tssel_n, priv->info->field_width), tssr);
cd4a3ced4d1cdb Biju Das        2026-01-13  383  	titsr_cur = field_get(ICU_TITSR_TITSEL_MASK(titsel_n), titsr);
cd4a3ced4d1cdb Biju Das        2026-01-13  384  	if (tssr_cur == tint && titsr_cur == sense)
cd4a3ced4d1cdb Biju Das        2026-01-13  385  		return 0;
cd4a3ced4d1cdb Biju Das        2026-01-13  386  
e3a16c33db69ff Biju Das        2025-02-24  387  	tssr &= ~(ICU_TSSR_TSSEL_MASK(tssel_n, priv->info->field_width) | tien);
e3a16c33db69ff Biju Das        2025-02-24  388  	tssr |= ICU_TSSR_TSSEL_PREP(tint, tssel_n, priv->info->field_width);
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  389  
0a9d6ef64e5e91 Biju Das        2025-02-24  390  	writel_relaxed(tssr, priv->base + priv->info->t_offs + ICU_TSSR(tssr_k));
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  391  
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  392  	titsr &= ~ICU_TITSR_TITSEL_MASK(titsel_n);
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  393  	titsr |= ICU_TITSR_TITSEL_PREP(sense, titsel_n);
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  394  
0a9d6ef64e5e91 Biju Das        2025-02-24  395  	writel_relaxed(titsr, priv->base + priv->info->t_offs + ICU_TITSR(titsr_k));
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  396  
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  397  	rzv2h_clear_tint_int(priv, hwirq);
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  398  
0a9d6ef64e5e91 Biju Das        2025-02-24  399  	writel_relaxed(tssr | tien, priv->base + priv->info->t_offs + ICU_TSSR(tssr_k));
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  400  
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  401  	return 0;
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  402  }
0d7605e75ac2d8 Fabrizio Castro 2024-10-10  403  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
