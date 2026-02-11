Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852AA1FF1AE
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Feb 2026 21:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770846294; cv=none; b=ga2licSWPMIGfErQBroX6gkpZdQTYJoEWxx1yKliplOjtbATWsyCqEJq0BMEOGtAKqQp7k5DUUqX7ghXFC24XAdTYLGiQHcYnkvUw++efon815jp/Eqd7WHRVoxIXDQ82qBoeXou8bdiaOT2Ah6WX60FeGKrnr4iUqFZNw+qzBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770846294; c=relaxed/simple;
	bh=Nc9E6YvbJfsevEzQatTpWBGTEztHVZN0eE+AtVWCQXo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HdTVR795UAFs9tJBQsm8BxoMzVz7f3u94DaWHWQBg7xUuCi2QRA8P6w74xEZzDQBqazoX0qhqmyMHnLww4e8O2us/BYQmmESOos27YXp6CZVeaY6CfxlbOAztx6Wk+erTAyyfdy2EVI9vwRTIRVTCVUJt6PU21p/dDc/A6J97wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JduvxYDV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JduvxYDV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770846293; x=1802382293;
  h=date:from:to:cc:subject:message-id;
  bh=Nc9E6YvbJfsevEzQatTpWBGTEztHVZN0eE+AtVWCQXo=;
  b=JduvxYDVpYcNYGhZqB64MmonOVQ4IlZ91iSOJcC26mz0JJFPlYLOYG6a
   Vi6nV+q03RjoxgaCaXP8ccuM04yVtwS9a8DvBZaIhp/hDGh7/VNuwXuxt
   p4yyEyPCrFVpXCvwhpJGTVDwoX6Q4IHHWnsHTGRc6S+un86D6MVnlREIy
   JYp3XJPKm+Ffn0V/De5R1F8kerNUTFvO69qoCtPSLCREJ4oXzvHICkMth
   bj79I3BgGrT2rPdFpHnB3bBFmzf3jKbfkNXZ76jTQSMBoxZcHasraBaM/
   wdPtrP7iaMWa5xRoRazs4JlBcTmjkRJU8u42629wbet0uKS1Gz/2nNUA8
   w==;
X-CSE-ConnectionGUID: ST5OgoSeTRmxZ9fRj72dMw==
X-CSE-MsgGUID: aca46GxXQCeQxj4eHzMOQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71905108"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="71905108"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 13:44:53 -0800
X-CSE-ConnectionGUID: s6aODvPGQGSwYAOIdRDuAw==
X-CSE-MsgGUID: +lyF+xemTnekDQTdFRvEfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="211711858"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Feb 2026 13:44:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqI0v-00000000qPg-2jV0;
	Wed, 11 Feb 2026 21:44:49 +0000
Date: Thu, 12 Feb 2026 05:44:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1990/12577]
 drivers/remoteproc/st_slim_rproc.c:126 slim_rproc_start() warn: potential !
 vs ~ typo
Message-ID: <202602120535.U9ogVKSt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Rosen Penev <rosenp@gmail.com>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9152bc8cebcb14dc16b03ec81f2377ee8ce12268
commit: c3af05623e079c2a9a9363386796fdea20defa18 [1990/12577] dmaengine: st_fdma: add COMPILE_TEST support
:::::: branch date: 7 hours ago
:::::: commit date: 7 weeks ago
config: hexagon-randconfig-r073-20260212 (https://download.01.org/0day-ci/archive/20260212/202602120535.U9ogVKSt-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602120535.U9ogVKSt-lkp@intel.com/

smatch warnings:
drivers/remoteproc/st_slim_rproc.c:126 slim_rproc_start() warn: potential ! vs ~ typo
drivers/remoteproc/st_slim_rproc.c:165 slim_rproc_stop() warn: potential ! vs ~ typo

vim +126 drivers/remoteproc/st_slim_rproc.c

bb6869b2147817 Peter Griffin 2016-10-18  107  
bb6869b2147817 Peter Griffin 2016-10-18  108  /*
bb6869b2147817 Peter Griffin 2016-10-18  109   * Remoteproc slim specific device handlers
bb6869b2147817 Peter Griffin 2016-10-18  110   */
bb6869b2147817 Peter Griffin 2016-10-18  111  static int slim_rproc_start(struct rproc *rproc)
bb6869b2147817 Peter Griffin 2016-10-18  112  {
bb6869b2147817 Peter Griffin 2016-10-18  113  	struct device *dev = &rproc->dev;
bb6869b2147817 Peter Griffin 2016-10-18  114  	struct st_slim_rproc *slim_rproc = rproc->priv;
bb6869b2147817 Peter Griffin 2016-10-18  115  	unsigned long hw_id, hw_ver, fw_rev;
bb6869b2147817 Peter Griffin 2016-10-18  116  	u32 val;
bb6869b2147817 Peter Griffin 2016-10-18  117  
bb6869b2147817 Peter Griffin 2016-10-18  118  	/* disable CPU pipeline clock & reset CPU pipeline */
bb6869b2147817 Peter Griffin 2016-10-18  119  	val = SLIM_CLK_GATE_DIS | SLIM_CLK_GATE_RESET;
bb6869b2147817 Peter Griffin 2016-10-18  120  	writel(val, slim_rproc->slimcore + SLIM_CLK_GATE_OFST);
bb6869b2147817 Peter Griffin 2016-10-18  121  
bb6869b2147817 Peter Griffin 2016-10-18  122  	/* disable SLIM core STBus sync */
bb6869b2147817 Peter Griffin 2016-10-18  123  	writel(SLIM_STBUS_SYNC_DIS, slim_rproc->peri + SLIM_STBUS_SYNC_OFST);
bb6869b2147817 Peter Griffin 2016-10-18  124  
bb6869b2147817 Peter Griffin 2016-10-18  125  	/* enable cpu pipeline clock */
bb6869b2147817 Peter Griffin 2016-10-18 @126  	writel(!SLIM_CLK_GATE_DIS,
bb6869b2147817 Peter Griffin 2016-10-18  127  		slim_rproc->slimcore + SLIM_CLK_GATE_OFST);
bb6869b2147817 Peter Griffin 2016-10-18  128  
bb6869b2147817 Peter Griffin 2016-10-18  129  	/* clear int & cmd mailbox */
bb6869b2147817 Peter Griffin 2016-10-18  130  	writel(~0U, slim_rproc->peri + SLIM_INT_CLR_OFST);
bb6869b2147817 Peter Griffin 2016-10-18  131  	writel(~0U, slim_rproc->peri + SLIM_CMD_CLR_OFST);
bb6869b2147817 Peter Griffin 2016-10-18  132  
bb6869b2147817 Peter Griffin 2016-10-18  133  	/* enable all channels cmd & int */
bb6869b2147817 Peter Griffin 2016-10-18  134  	writel(~0U, slim_rproc->peri + SLIM_INT_MASK_OFST);
bb6869b2147817 Peter Griffin 2016-10-18  135  	writel(~0U, slim_rproc->peri + SLIM_CMD_MASK_OFST);
bb6869b2147817 Peter Griffin 2016-10-18  136  
bb6869b2147817 Peter Griffin 2016-10-18  137  	/* enable cpu */
bb6869b2147817 Peter Griffin 2016-10-18  138  	writel(SLIM_EN_RUN, slim_rproc->slimcore + SLIM_EN_OFST);
bb6869b2147817 Peter Griffin 2016-10-18  139  
bb6869b2147817 Peter Griffin 2016-10-18  140  	hw_id = readl_relaxed(slim_rproc->slimcore + SLIM_ID_OFST);
bb6869b2147817 Peter Griffin 2016-10-18  141  	hw_ver = readl_relaxed(slim_rproc->slimcore + SLIM_VER_OFST);
bb6869b2147817 Peter Griffin 2016-10-18  142  
bb6869b2147817 Peter Griffin 2016-10-18  143  	fw_rev = readl(slim_rproc->mem[ST_SLIM_DMEM].cpu_addr +
bb6869b2147817 Peter Griffin 2016-10-18  144  			SLIM_REV_ID_OFST);
bb6869b2147817 Peter Griffin 2016-10-18  145  
bb6869b2147817 Peter Griffin 2016-10-18  146  	dev_info(dev, "fw rev:%ld.%ld on SLIM %ld.%ld\n",
bb6869b2147817 Peter Griffin 2016-10-18  147  		 SLIM_REV_ID_MAJ(fw_rev), SLIM_REV_ID_MIN(fw_rev),
bb6869b2147817 Peter Griffin 2016-10-18  148  		 hw_id, hw_ver);
bb6869b2147817 Peter Griffin 2016-10-18  149  
bb6869b2147817 Peter Griffin 2016-10-18  150  	return 0;
bb6869b2147817 Peter Griffin 2016-10-18  151  }
bb6869b2147817 Peter Griffin 2016-10-18  152  
bb6869b2147817 Peter Griffin 2016-10-18  153  static int slim_rproc_stop(struct rproc *rproc)
bb6869b2147817 Peter Griffin 2016-10-18  154  {
bb6869b2147817 Peter Griffin 2016-10-18  155  	struct st_slim_rproc *slim_rproc = rproc->priv;
bb6869b2147817 Peter Griffin 2016-10-18  156  	u32 val;
bb6869b2147817 Peter Griffin 2016-10-18  157  
bb6869b2147817 Peter Griffin 2016-10-18  158  	/* mask all (cmd & int) channels */
bb6869b2147817 Peter Griffin 2016-10-18  159  	writel(0UL, slim_rproc->peri + SLIM_INT_MASK_OFST);
bb6869b2147817 Peter Griffin 2016-10-18  160  	writel(0UL, slim_rproc->peri + SLIM_CMD_MASK_OFST);
bb6869b2147817 Peter Griffin 2016-10-18  161  
bb6869b2147817 Peter Griffin 2016-10-18  162  	/* disable cpu pipeline clock */
bb6869b2147817 Peter Griffin 2016-10-18  163  	writel(SLIM_CLK_GATE_DIS, slim_rproc->slimcore + SLIM_CLK_GATE_OFST);
bb6869b2147817 Peter Griffin 2016-10-18  164  
bb6869b2147817 Peter Griffin 2016-10-18 @165  	writel(!SLIM_EN_RUN, slim_rproc->slimcore + SLIM_EN_OFST);
bb6869b2147817 Peter Griffin 2016-10-18  166  
bb6869b2147817 Peter Griffin 2016-10-18  167  	val = readl(slim_rproc->slimcore + SLIM_EN_OFST);
bb6869b2147817 Peter Griffin 2016-10-18  168  	if (val & SLIM_EN_RUN)
bb6869b2147817 Peter Griffin 2016-10-18  169  		dev_warn(&rproc->dev, "Failed to disable SLIM");
bb6869b2147817 Peter Griffin 2016-10-18  170  
bb6869b2147817 Peter Griffin 2016-10-18  171  	dev_dbg(&rproc->dev, "slim stopped\n");
bb6869b2147817 Peter Griffin 2016-10-18  172  
bb6869b2147817 Peter Griffin 2016-10-18  173  	return 0;
bb6869b2147817 Peter Griffin 2016-10-18  174  }
bb6869b2147817 Peter Griffin 2016-10-18  175  

:::::: The code at line 126 was first introduced by commit
:::::: bb6869b2147817385e0261f928b942f466f74a63 remoteproc: st_slim_rproc: add a slimcore rproc driver

:::::: TO: Peter Griffin <peter.griffin@linaro.org>
:::::: CC: Vinod Koul <vinod.koul@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
