Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842AD1E0B66
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Jan 2025 16:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737391944; cv=none; b=hPL9badxaK5DjZmwU6HdYP/Ojhrha3FwMv9zKdlmrZh9bDJHO5uK0R6jDBZPtWg0QfOz5ee5y3anipeGnl/cdiMDs1i67uEHfHtNRPY1MCnFjMfCg2yUvlchkX4VDKZeJd5/aysvRPg6QSabKX+MpWsoSSpydBKV77cmk1JkYLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737391944; c=relaxed/simple;
	bh=hqWJ2fARvomU8HQY4OiSoE4ASGYdSpkfyZhvx+54yWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KTlj9oMTCPR2Zy/vwaC8eXQN/0zcCfY/HOY8bd7f7yjAsA+6cfsUC2JYPiHfZ0A962+8D33ieOsRfUiBgSep/1ZD+3LTvDbfBz//ShHARPMU6xg+ZLQ0wH5IwmMsNr6zKCq5oCV/A9Ex0Bmv1u2Vnbk/PIAXJNaLl/wYwAIvUu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hNd4t1T+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hNd4t1T+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737391942; x=1768927942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hqWJ2fARvomU8HQY4OiSoE4ASGYdSpkfyZhvx+54yWM=;
  b=hNd4t1T+WL5uQ1BpDnMXM7yFeyWDK2MSTEwpQYEzj59mniDSaB0zV4Da
   mv+U0vyUBny4HalimCTOsdBDCEyvmB1L9on3vAqRO7xMZfI8QgeWD0Hx/
   hQ6YF6cOZ4KBKuTzSTdBIefa7e+BxEV8GnQaoDgtKkexBT7dp2j3J0FHI
   avwhG2cw6l0oTzHdLw+HWAY/zlDTQ5yLwKudAuTnGJTT7RqkOSxAsak+x
   HAtr/3/3zia7broDIiX4crvFwxeAJFXE0RnsSEBYCpNxVHikMwDG+pJB8
   iEj/XBS26+eod1xLgnCyLboMsSej6LBlbVWHgY2YNF+BVKrt1iIjloVVP
   g==;
X-CSE-ConnectionGUID: iPyWCuLPSjqUB6sBMAiB0g==
X-CSE-MsgGUID: 8YtP1nHdT6m/89hNsvJwMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="49192052"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="49192052"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 08:52:22 -0800
X-CSE-ConnectionGUID: SMQSCBXoTbOuryUOM1Rbgg==
X-CSE-MsgGUID: oD0Q46NvQ0WOvs1ifI1hvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="111552465"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Jan 2025 08:52:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZv0c-000Wlu-23;
	Mon, 20 Jan 2025 16:52:18 +0000
Date: Tue, 21 Jan 2025 00:52:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/phy/starfive/phy-jh7110-dphy-tx.c:335 stf_dphy_init() warn:
 'dphy->txesc_clk' from clk_prepare_enable() not released on lines: 332.
Message-ID: <202501210027.JxOWebVn-lkp@intel.com>
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
TO: Shengyang Chen <shengyang.chen@starfivetech.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: Changhuang Liang <changhuang.liang@starfivetech.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ffd294d346d185b70e28b1a28abe367bbfe53c04
commit: d3ab7955330843699cdcc413edd7993923e6c016 phy: starfive: Add mipi dphy tx support
date:   7 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 7 months ago
config: riscv-randconfig-r073-20250118 (https://download.01.org/0day-ci/archive/20250121/202501210027.JxOWebVn-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501210027.JxOWebVn-lkp@intel.com/

smatch warnings:
drivers/phy/starfive/phy-jh7110-dphy-tx.c:335 stf_dphy_init() warn: 'dphy->txesc_clk' from clk_prepare_enable() not released on lines: 332.

vim +335 drivers/phy/starfive/phy-jh7110-dphy-tx.c

d3ab7955330843 Shengyang Chen 2024-04-18  308  
d3ab7955330843 Shengyang Chen 2024-04-18  309  static int stf_dphy_init(struct phy *phy)
d3ab7955330843 Shengyang Chen 2024-04-18  310  {
d3ab7955330843 Shengyang Chen 2024-04-18  311  	struct stf_dphy *dphy = phy_get_drvdata(phy);
d3ab7955330843 Shengyang Chen 2024-04-18  312  	int ret;
d3ab7955330843 Shengyang Chen 2024-04-18  313  
d3ab7955330843 Shengyang Chen 2024-04-18  314  	stf_dphy_hw_reset(dphy, 1);
d3ab7955330843 Shengyang Chen 2024-04-18  315  
d3ab7955330843 Shengyang Chen 2024-04-18  316  	writel(FIELD_PREP(STF_DPHY_SCFG_PPI_C_READY_SEL, 0) |
d3ab7955330843 Shengyang Chen 2024-04-18  317  	       FIELD_PREP(STF_DPHY_SCFG_DSI_TXREADY_ESC_SEL, 0),
d3ab7955330843 Shengyang Chen 2024-04-18  318  	       dphy->topsys + STF_DPHY_APBIFSAIF_SYSCFG(48));
d3ab7955330843 Shengyang Chen 2024-04-18  319  
d3ab7955330843 Shengyang Chen 2024-04-18  320  	writel(FIELD_PREP(STF_DPHY_SCFG_C_HS_PRE_ZERO_TIME, 0x30),
d3ab7955330843 Shengyang Chen 2024-04-18  321  	       dphy->topsys + STF_DPHY_APBIFSAIF_SYSCFG(44));
d3ab7955330843 Shengyang Chen 2024-04-18  322  
d3ab7955330843 Shengyang Chen 2024-04-18  323  	ret = clk_prepare_enable(dphy->txesc_clk);
d3ab7955330843 Shengyang Chen 2024-04-18  324  	if (ret) {
d3ab7955330843 Shengyang Chen 2024-04-18  325  		dev_err(dphy->dev, "Failed to prepare/enable txesc_clk\n");
d3ab7955330843 Shengyang Chen 2024-04-18  326  		return ret;
d3ab7955330843 Shengyang Chen 2024-04-18  327  	}
d3ab7955330843 Shengyang Chen 2024-04-18  328  
d3ab7955330843 Shengyang Chen 2024-04-18  329  	ret = reset_control_deassert(dphy->sys_rst);
d3ab7955330843 Shengyang Chen 2024-04-18  330  	if (ret) {
d3ab7955330843 Shengyang Chen 2024-04-18  331  		dev_err(dphy->dev, "Failed to deassert sys_rst\n");
d3ab7955330843 Shengyang Chen 2024-04-18  332  		return ret;
d3ab7955330843 Shengyang Chen 2024-04-18  333  	}
d3ab7955330843 Shengyang Chen 2024-04-18  334  
d3ab7955330843 Shengyang Chen 2024-04-18 @335  	return 0;
d3ab7955330843 Shengyang Chen 2024-04-18  336  }
d3ab7955330843 Shengyang Chen 2024-04-18  337  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
