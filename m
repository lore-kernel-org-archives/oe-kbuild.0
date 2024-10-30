Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30DE1C4612
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Oct 2024 23:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730331646; cv=none; b=MQdAizGz0+4U3kPj1yVS80lbPozbe5A2OgDzRGgt8A3DHBWrtdzXvCeHavF5+16Ect/i9Dlc2F+zic68i6iTg9RAcMlXvd2v5o8kXBug7cKuQFkIPvtTmUybS8oqDyvUALR4ODCvRLzeX5VRTTaL8DOBlPQlfI5irWErDugig3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730331646; c=relaxed/simple;
	bh=tAkSj5s71TqQaRTiFPKt1kq097hFBHK2HaHFhLG6Ea8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=McVDs7DoYiW3Cq8K7xHyzBMDX3nyKey3X9k/VPKPmjft8lKpl6b7+foyaf/IGcj6tvWdzCfQ5t4xln4ZROOuquskoDR2hogE57GowZMU34pGtTtqgA8//S/d5tItIMAXwf7gWgKSW9DDuhJo7wpd4RdLaDCUoHxrVPUfCPY2+g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TJrikR9e; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TJrikR9e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730331644; x=1761867644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tAkSj5s71TqQaRTiFPKt1kq097hFBHK2HaHFhLG6Ea8=;
  b=TJrikR9erGTyJErhFuc/3IXTYEwhO79qPbr/iRp3SplsbSax2PZ2bc8J
   Z9NaPeWONGCF8SITvuJZzlhHJ2hH50BoDW/L2ZmblKXo6cQJrO/BHJLIT
   5OVWNheChuxfDgQl3XKnactWhILtmzDBvQrzPfvhVlhz0b4H6Z89/LZ6v
   KxMsx2a8Gw+M9wQo235QH1/WSU0w+pbM3qNsTwXLmgssiW24Yfh0EK79I
   CxzQcJbYiL8JT90RmZpfMQpjpBpnVEW+KMrBTVpT7yLk/Q4xpL8K9IhRZ
   h1LiWTXq8n2wYSjh8T8I9uXL2Hf0r0+0xnRCAwgnZyEs+5Cz96Oh+7n6K
   g==;
X-CSE-ConnectionGUID: J1RNRGNoTPWTv/QwG7a6mQ==
X-CSE-MsgGUID: cKGd1olPSGyyD//FRaXAEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="40632753"
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="40632753"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 16:40:43 -0700
X-CSE-ConnectionGUID: yJ7H2lJuSMeU8UoSRQ9sHA==
X-CSE-MsgGUID: tLptNYAdRe6xmowuQEhjyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="113262294"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Oct 2024 16:40:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6IIp-000fQg-0r;
	Wed, 30 Oct 2024 23:40:39 +0000
Date: Thu, 31 Oct 2024 07:40:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/phy/starfive/phy-jh7110-dphy-tx.c:335 stf_dphy_init() warn:
 'dphy->txesc_clk' from clk_prepare_enable() not released on lines: 332.
Message-ID: <202410310715.duo3ShR4-lkp@intel.com>
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
head:   0fc810ae3ae110f9e2fcccce80fc8c8d62f97907
commit: d3ab7955330843699cdcc413edd7993923e6c016 phy: starfive: Add mipi dphy tx support
date:   5 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 5 months ago
config: riscv-randconfig-r071-20241030 (https://download.01.org/0day-ci/archive/20241031/202410310715.duo3ShR4-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410310715.duo3ShR4-lkp@intel.com/

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
