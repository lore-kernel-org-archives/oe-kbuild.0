Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154EB39E6FC
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Aug 2026 22:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786574527; cv=none; b=jtgP0Mn/qwWFHgle2IpNDgdCR3k+QSbeYUyBhLFO2FLcmIEDcYw1oBKwgsGZVK43Ke9nmtdhLyKNSW3REkWWdjWjgSbLxrLkGTb8yjpUlB7E5eFq+6XbupBiAViSgOda08CuvA3OMKHxANo+0TCg46hMXzfHj9nfJyjPTML7+X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786574527; c=relaxed/simple;
	bh=vR2yapaMY/5SH49Ub/fYAh6IGWRb15ttkiquhLp+jCs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=quyBEq2nJXF90RLta8q2Y2Q0j7cLR3mgFGGAtPq5m81VleMYroMEChl8U1DuHqYR9HxEsrQ9dY+sBOvI6LFZelrXGMiBNGhxYUCLvSnCT65hXzBU2dAHuc1w50cUhOHp25b266qBf/Gn4TsbyA1oxSufI6oI799p0JjRaSOtvqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Owl5xCjh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Owl5xCjh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786574525; x=1818110525;
  h=date:from:to:cc:subject:message-id;
  bh=vR2yapaMY/5SH49Ub/fYAh6IGWRb15ttkiquhLp+jCs=;
  b=Owl5xCjhLUnt/NcpqaPoKs6pS8AKXk+t1mPh/LgDPWOytgnbmLd9x/Le
   EfywycJ4lGE9Ek1A+xMLIlFm8cm1hYB1w/zu+fPyqvP53zACboT5qu7fW
   USoV8YdT3qqk5q+6OlBGy+BpALoxc7lCdox5YzU70Fd/im8JgRRwy0vNK
   vr89oJMSCs+k7DAHdb2dZje+uXRFrpCgVN0BaHe8Un5GgUaPjr2tLOvPK
   p55poaJwlio8jWpLuCj1vaCgAc9lQQzUq+DK4+cR22KpNAUZJveSS9pbR
   4SCM1L4DorqqjHL2QkCtsX8bz5MR+wVxkf9BJfaha9fcPIuMSGbRdigQu
   w==;
X-CSE-ConnectionGUID: tXQqegqjQO+7fd+kXXFNsA==
X-CSE-MsgGUID: ZF5L1VSxSZCQeEXaX+zLKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87360336"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="87360336"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 15:42:04 -0700
X-CSE-ConnectionGUID: ABe9akmNTJeONTFJI7YtOg==
X-CSE-MsgGUID: AaFG214kSJyVVyCy+JBSQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="261150935"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Aug 2026 15:42:03 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuHe4-00000000RwY-3Ovb;
	Wed, 12 Aug 2026 22:42:00 +0000
Date: Thu, 13 Aug 2026 06:41:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/irqchip/irq-renesas-rzv2h.c:382
 rzv2h_tint_set_type() warn: subtract is higher precedence than shift
Message-ID: <202608130621.Vv7d0kKY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Biju Das <biju.das.jz@bp.renesas.com>
CC: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f5bbbfec59b4e2fb7520a91de3df8a6174325d6a
commit: cd4a3ced4d1cdb14ffe905657b98a91e9d239dfb irqchip/renesas-rzv2h: Prevent TINT spurious interrupt during resume
date:   7 months ago
:::::: branch date: 33 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-r073-20260812 (https://download.01.org/0day-ci/archive/20260813/202608130621.Vv7d0kKY-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: cd4a3ced4d1c ("irqchip/renesas-rzv2h: Prevent TINT spurious interrupt during resume")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608130621.Vv7d0kKY-lkp@intel.com/

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
