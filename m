Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8DC37A85E
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Oct 2026 05:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791438688; cv=none; b=ZBtYn/BL1TnqrPpDngeU1DrANPwT90AK9OoRXvfhYurLSWzgo28DxeqE9r/RtaylvIkc0a1361zil78ju4+lTNzbJLnIjizbdazsM5YxSna9EzUHkB71+GHVTV3b3D6yI6/D2uT8v+FKXvS4Y521New+M2dCJklQVYZY1iKmpSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791438688; c=relaxed/simple;
	bh=S1OdkwSNEvVRf0uc0Q4sCvpeRlnlrfOcmQ9QlwBhVPI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GTrj/sOMJ1eoiYgOEToPOs4cGYbyHnLtCiTxJvAsKsybjOImC8NOiGSzCkXYI/QNWM+B2jZbhPwj9jnhy5B3qECWFBYDyrbEoWx2tcugcg7kI6Xn3aExLclLm+KmNs0XFhsXFxBg6c5j8jGAzw8tGQbVIfyfkSndgy5YgVq9JCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gQufx5m0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gQufx5m0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791438687; x=1822974687;
  h=date:from:to:cc:subject:message-id;
  bh=S1OdkwSNEvVRf0uc0Q4sCvpeRlnlrfOcmQ9QlwBhVPI=;
  b=gQufx5m044gY0kuS4Jp/Xs5IUcQt4f2LR48nVdrFaK/L+dE7lvyCwcS/
   UCR7JIRhcqKonRDTa87qQjdoDxpydd1ZLkeRzoz9L7UunAbfvaq7Hay7P
   arvjb5KYm3sg+QfG64f3JzAv9GyzCcjaxiQb5h+7ixf4ZseM9CLNPIyYY
   oMp4ikq2O8Z1L26SDGagRSr2faT6V5d2yJ1xRUw+eU21dQZwvZk68pidj
   e6w7IY93oMippEE9ixBB53WBo1EOfIKDU+IGgZaHX/D496atcaH4hK+Qy
   uc/+PGvHxUoNvOuR6nBws7gBxkA8cNeoJNyG+zcHNpWnFEa6j2vhG1AhL
   A==;
X-CSE-ConnectionGUID: ugZkQuuuSpacS5BVcDnnig==
X-CSE-MsgGUID: f97yMW2HQ/6wK8dfwN42zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="208332"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="208332"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 22:51:25 -0700
X-CSE-ConnectionGUID: tR5E8TonSIuZDREgHc5qlQ==
X-CSE-MsgGUID: ryuCL0FSRG6V3lOXmHOXFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="254181"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 07 Oct 2026 22:51:24 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEh2H-000000004t5-2i2V;
	Thu, 08 Oct 2026 05:51:21 +0000
Date: Thu, 08 Oct 2026 07:50:26 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 13074/15025]
 drivers/media/i2c/maxim-serdes/max96724.c:418 max96724_log_phy_status() warn:
 subtract is higher precedence than shift
Message-ID: <202610080710.Fl8VpyTn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Cosmin Tanislav <demonsingur@gmail.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b018686719706a781c45a874ed51374a2dc4b767
commit: bccc36c35947d3f73009028532833f224176ccbd [13074/15025] media: i2c: maxim-serdes: add MAX96724 driver
:::::: branch date: 16 hours ago
:::::: commit date: 3 days ago
config: m68k-randconfig-r2202-20261008 (https://download.01.org/0day-ci/archive/20261008/202610080710.Fl8VpyTn-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610080710.Fl8VpyTn-lkp@intel.com/

New smatch warnings:
drivers/media/i2c/maxim-serdes/max96724.c:418 max96724_log_phy_status() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:418 max96724_log_phy_status() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:418 max96724_log_phy_status() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:418 max96724_log_phy_status() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:609 max96724_init_phy() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:609 max96724_init_phy() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:609 max96724_init_phy() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:609 max96724_init_phy() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:777 max96724_set_pipe_remap() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:777 max96724_set_pipe_remap() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:777 max96724_set_pipe_remap() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:777 max96724_set_pipe_remap() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:817 max96724_set_pipe_phy() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:817 max96724_set_pipe_phy() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:817 max96724_set_pipe_phy() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:817 max96724_set_pipe_phy() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:839 max96724_set_pipe_stream_id() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:839 max96724_set_pipe_stream_id() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:839 max96724_set_pipe_stream_id() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:839 max96724_set_pipe_stream_id() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:851 max96724_set_pipe_link() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:851 max96724_set_pipe_link() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:851 max96724_set_pipe_link() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:851 max96724_set_pipe_link() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:1008 max96724_set_link_version() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:1008 max96724_set_link_version() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:1008 max96724_set_link_version() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:1008 max96724_set_link_version() warn: subtract is higher precedence than shift

Old smatch warnings:
drivers/media/i2c/maxim-serdes/max96724.c:425 max96724_log_phy_status() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:425 max96724_log_phy_status() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:425 max96724_log_phy_status() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max96724.c:425 max96724_log_phy_status() warn: subtract is higher precedence than shift

vim +418 drivers/media/i2c/maxim-serdes/max96724.c

bccc36c35947d3f Cosmin Tanislav 2026-09-30  405  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  406  static int max96724_log_phy_status(struct max_des *des,
bccc36c35947d3f Cosmin Tanislav 2026-09-30  407  				   struct max_des_phy *phy)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  408  {
bccc36c35947d3f Cosmin Tanislav 2026-09-30  409  	struct max96724_priv *priv = des_to_priv(des);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  410  	unsigned int index = max96724_phy_id(des, phy);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  411  	unsigned int val;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  412  	int ret;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  413  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  414  	ret = regmap_read(priv->regmap, MAX96724_MIPI_PHY25(index), &val);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  415  	if (ret)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  416  		return ret;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  417  
bccc36c35947d3f Cosmin Tanislav 2026-09-30 @418  	dev_info(priv->dev, "\tcsi2_pkt_cnt: %lu\n",
bccc36c35947d3f Cosmin Tanislav 2026-09-30  419  		 field_get(MAX96724_MIPI_PHY25_CSI2_TX_PKT_CNT(index), val));
bccc36c35947d3f Cosmin Tanislav 2026-09-30  420  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  421  	ret = regmap_read(priv->regmap, MAX96724_MIPI_PHY27(index), &val);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  422  	if (ret)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  423  		return ret;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  424  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  425  	dev_info(priv->dev, "\tphy_pkt_cnt: %lu\n",
bccc36c35947d3f Cosmin Tanislav 2026-09-30  426  		 field_get(MAX96724_MIPI_PHY27_PHY_PKT_CNT(index), val));
bccc36c35947d3f Cosmin Tanislav 2026-09-30  427  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  428  	return 0;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  429  }
bccc36c35947d3f Cosmin Tanislav 2026-09-30  430  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  431  static int max96724_set_enable(struct max_des *des, bool enable)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  432  {
bccc36c35947d3f Cosmin Tanislav 2026-09-30  433  	struct max96724_priv *priv = des_to_priv(des);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  434  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  435  	return regmap_assign_bits(priv->regmap, MAX96724_BACKTOP12,
bccc36c35947d3f Cosmin Tanislav 2026-09-30  436  				  MAX96724_BACKTOP12_CSI_OUT_EN, enable);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  437  }
bccc36c35947d3f Cosmin Tanislav 2026-09-30  438  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  439  static const unsigned int max96724_phys_configs_reg_val[] = {
bccc36c35947d3f Cosmin Tanislav 2026-09-30  440  	MAX96724_MIPI_PHY0_PHY_1X4A_2X2,
bccc36c35947d3f Cosmin Tanislav 2026-09-30  441  	MAX96724_MIPI_PHY0_PHY_2X4,
bccc36c35947d3f Cosmin Tanislav 2026-09-30  442  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  443  	MAX96724_MIPI_PHY0_PHY_4X2,
bccc36c35947d3f Cosmin Tanislav 2026-09-30  444  	MAX96724_MIPI_PHY0_PHY_1X4A_2X2,
bccc36c35947d3f Cosmin Tanislav 2026-09-30  445  	MAX96724_MIPI_PHY0_PHY_1X4B_2X2,
bccc36c35947d3f Cosmin Tanislav 2026-09-30  446  	MAX96724_MIPI_PHY0_PHY_2X4,
bccc36c35947d3f Cosmin Tanislav 2026-09-30  447  };
bccc36c35947d3f Cosmin Tanislav 2026-09-30  448  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  449  static const struct max_serdes_phys_config max96724_phys_configs[] = {
bccc36c35947d3f Cosmin Tanislav 2026-09-30  450  	/*
bccc36c35947d3f Cosmin Tanislav 2026-09-30  451  	 * PHY 1 can be in 4-lane mode (combining lanes of PHY 0 and PHY 1)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  452  	 * but only use the data lanes of PHY0, while continuing to use the
bccc36c35947d3f Cosmin Tanislav 2026-09-30  453  	 * clock lane of PHY 1.
bccc36c35947d3f Cosmin Tanislav 2026-09-30  454  	 * Specifying clock-lanes as 5 turns on alternate clocking mode.
bccc36c35947d3f Cosmin Tanislav 2026-09-30  455  	 */
bccc36c35947d3f Cosmin Tanislav 2026-09-30  456  	{ { 2, 0, 2, 2 }, { MAX96724_PHY1_ALT_CLOCK, 0, 0, 0 } },
bccc36c35947d3f Cosmin Tanislav 2026-09-30  457  	{ { 2, 0, 4, 0 }, { MAX96724_PHY1_ALT_CLOCK, 0, 0, 0 } },
bccc36c35947d3f Cosmin Tanislav 2026-09-30  458  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  459  	/*
bccc36c35947d3f Cosmin Tanislav 2026-09-30  460  	 * When combining PHY 0 and PHY 1 to make them function in 4-lane mode,
bccc36c35947d3f Cosmin Tanislav 2026-09-30  461  	 * PHY 1 is the master PHY, but we use PHY 0 here to maintain
bccc36c35947d3f Cosmin Tanislav 2026-09-30  462  	 * compatibility.
bccc36c35947d3f Cosmin Tanislav 2026-09-30  463  	 */
bccc36c35947d3f Cosmin Tanislav 2026-09-30  464  	{ { 2, 2, 2, 2 } },
bccc36c35947d3f Cosmin Tanislav 2026-09-30  465  	{ { 4, 0, 2, 2 } },
bccc36c35947d3f Cosmin Tanislav 2026-09-30  466  	{ { 2, 2, 4, 0 } },
bccc36c35947d3f Cosmin Tanislav 2026-09-30  467  	{ { 4, 0, 4, 0 } },
bccc36c35947d3f Cosmin Tanislav 2026-09-30  468  };
bccc36c35947d3f Cosmin Tanislav 2026-09-30  469  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  470  static int max96724_init_tpg(struct max_des *des)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  471  {
bccc36c35947d3f Cosmin Tanislav 2026-09-30  472  	const struct reg_sequence regs[] = {
bccc36c35947d3f Cosmin Tanislav 2026-09-30  473  		{ MAX96724_GRAD_INCR, MAX_SERDES_GRAD_INCR },
bccc36c35947d3f Cosmin Tanislav 2026-09-30  474  		REG_SEQUENCE_3_LE(MAX96724_CHKR_COLOR_A_L,
bccc36c35947d3f Cosmin Tanislav 2026-09-30  475  				  MAX_SERDES_CHECKER_COLOR_A),
bccc36c35947d3f Cosmin Tanislav 2026-09-30  476  		REG_SEQUENCE_3_LE(MAX96724_CHKR_COLOR_B_L,
bccc36c35947d3f Cosmin Tanislav 2026-09-30  477  				  MAX_SERDES_CHECKER_COLOR_B),
bccc36c35947d3f Cosmin Tanislav 2026-09-30  478  		{ MAX96724_CHKR_RPT_A, MAX_SERDES_CHECKER_SIZE },
bccc36c35947d3f Cosmin Tanislav 2026-09-30  479  		{ MAX96724_CHKR_RPT_B, MAX_SERDES_CHECKER_SIZE },
bccc36c35947d3f Cosmin Tanislav 2026-09-30  480  		{ MAX96724_CHKR_ALT, MAX_SERDES_CHECKER_SIZE },
bccc36c35947d3f Cosmin Tanislav 2026-09-30  481  	};
bccc36c35947d3f Cosmin Tanislav 2026-09-30  482  	struct max96724_priv *priv = des_to_priv(des);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  483  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  484  	return regmap_multi_reg_write(priv->regmap, regs, ARRAY_SIZE(regs));
bccc36c35947d3f Cosmin Tanislav 2026-09-30  485  }
bccc36c35947d3f Cosmin Tanislav 2026-09-30  486  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  487  static int max96724_init(struct max_des *des)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  488  {
bccc36c35947d3f Cosmin Tanislav 2026-09-30  489  	struct max96724_priv *priv = des_to_priv(des);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  490  	unsigned int i;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  491  	int ret;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  492  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  493  	if (priv->info->set_pipe_tunnel_enable) {
bccc36c35947d3f Cosmin Tanislav 2026-09-30  494  		for (i = 0; i < des->info->num_pipes; i++) {
bccc36c35947d3f Cosmin Tanislav 2026-09-30  495  			ret = regmap_set_bits(priv->regmap, MAX96724_MIPI_TX57(i),
bccc36c35947d3f Cosmin Tanislav 2026-09-30  496  					      MAX96724_MIPI_TX57_DIS_AUTO_TUN_DET);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  497  			if (ret)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  498  				return ret;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  499  		}
bccc36c35947d3f Cosmin Tanislav 2026-09-30  500  	}
bccc36c35947d3f Cosmin Tanislav 2026-09-30  501  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  502  	if (priv->info->supports_pipe_stream_autoselect) {
bccc36c35947d3f Cosmin Tanislav 2026-09-30  503  		/* Enable stream autoselect. */
bccc36c35947d3f Cosmin Tanislav 2026-09-30  504  		ret = regmap_set_bits(priv->regmap, MAX96724_VIDEO_PIPE_EN,
bccc36c35947d3f Cosmin Tanislav 2026-09-30  505  				      MAX96724_VIDEO_PIPE_EN_STREAM_SEL_ALL);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  506  		if (ret)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  507  			return ret;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  508  	}
bccc36c35947d3f Cosmin Tanislav 2026-09-30  509  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  510  	/*
bccc36c35947d3f Cosmin Tanislav 2026-09-30  511  	 * The serializer control channel is available through local I2C port 0
bccc36c35947d3f Cosmin Tanislav 2026-09-30  512  	 * by default. Enable crossover only when local port 1 is selected.
bccc36c35947d3f Cosmin Tanislav 2026-09-30  513  	 */
bccc36c35947d3f Cosmin Tanislav 2026-09-30  514  	ret = regmap_update_bits(priv->regmap, MAX96724_REG7,
bccc36c35947d3f Cosmin Tanislav 2026-09-30  515  				 MAX96724_REG7_CC_CROSSOVER_SEL,
bccc36c35947d3f Cosmin Tanislav 2026-09-30  516  				 priv->cc_port_crossover ?
bccc36c35947d3f Cosmin Tanislav 2026-09-30  517  				 MAX96724_REG7_CC_CROSSOVER_SEL : 0);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  518  	if (ret)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  519  		return ret;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  520  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  521  	/* Set PHY mode. */
bccc36c35947d3f Cosmin Tanislav 2026-09-30  522  	ret = regmap_update_bits(priv->regmap, MAX96724_MIPI_PHY0,
bccc36c35947d3f Cosmin Tanislav 2026-09-30  523  				 MAX96724_MIPI_PHY0_PHY_CONFIG,
bccc36c35947d3f Cosmin Tanislav 2026-09-30  524  				 max96724_phys_configs_reg_val[des->phys_config]);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  525  	if (ret)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  526  		return ret;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  527  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  528  	return max96724_init_tpg(des);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  529  }
bccc36c35947d3f Cosmin Tanislav 2026-09-30  530  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  531  static int max96724_init_phy(struct max_des *des, struct max_des_phy *phy)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  532  {
bccc36c35947d3f Cosmin Tanislav 2026-09-30  533  	struct max96724_priv *priv = des_to_priv(des);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  534  	bool is_cphy = phy->bus_type == V4L2_MBUS_CSI2_CPHY;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  535  	unsigned int num_data_lanes = phy->mipi.num_data_lanes;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  536  	unsigned int num_hw_data_lanes;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  537  	unsigned int index;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  538  	unsigned int used_data_lanes = 0;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  539  	unsigned int val, mask;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  540  	unsigned int i;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  541  	u64 dpll_freq;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  542  	int ret;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  543  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  544  	index = max96724_phy_id(des, phy);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  545  	num_hw_data_lanes = max_des_phy_hw_data_lanes(des, phy);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  546  	dpll_freq = is_cphy ? phy->link_frequency
bccc36c35947d3f Cosmin Tanislav 2026-09-30  547  			    : phy->link_frequency * 2;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  548  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  549  	ret = regmap_update_bits(priv->regmap, MAX96724_MIPI_TX10(index),
bccc36c35947d3f Cosmin Tanislav 2026-09-30  550  				 MAX96724_MIPI_TX10_CSI2_LANE_CNT,
bccc36c35947d3f Cosmin Tanislav 2026-09-30  551  				 FIELD_PREP(MAX96724_MIPI_TX10_CSI2_LANE_CNT,
bccc36c35947d3f Cosmin Tanislav 2026-09-30  552  					    num_data_lanes - 1));
bccc36c35947d3f Cosmin Tanislav 2026-09-30  553  	if (ret)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  554  		return ret;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  555  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  556  	ret = regmap_assign_bits(priv->regmap, MAX96724_MIPI_TX10(index),
bccc36c35947d3f Cosmin Tanislav 2026-09-30  557  				 MAX96724_MIPI_TX10_CSI2_CPHY_EN, is_cphy);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  558  	if (ret)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  559  		return ret;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  560  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  561  	/* Configure lane mapping. */
bccc36c35947d3f Cosmin Tanislav 2026-09-30  562  	val = 0;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  563  	for (i = 0; i < num_hw_data_lanes ; i++) {
bccc36c35947d3f Cosmin Tanislav 2026-09-30  564  		unsigned int map;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  565  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  566  		if (i < num_data_lanes)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  567  			map = phy->mipi.data_lanes[i] - 1;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  568  		else
bccc36c35947d3f Cosmin Tanislav 2026-09-30  569  			map = ffz(used_data_lanes);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  570  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  571  		val |= map << (i * 2);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  572  		used_data_lanes |= BIT(map);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  573  	}
bccc36c35947d3f Cosmin Tanislav 2026-09-30  574  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  575  	if (num_hw_data_lanes == 4)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  576  		mask = MAX96724_MIPI_PHY3_PHY_LANE_MAP_4;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  577  	else
bccc36c35947d3f Cosmin Tanislav 2026-09-30  578  		mask = MAX96724_MIPI_PHY3_PHY_LANE_MAP_2(index);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  579  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  580  	ret = regmap_update_bits(priv->regmap, MAX96724_MIPI_PHY3(index),
bccc36c35947d3f Cosmin Tanislav 2026-09-30  581  				 mask, field_prep(mask, val));
bccc36c35947d3f Cosmin Tanislav 2026-09-30  582  	if (ret)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  583  		return ret;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  584  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  585  	/* Configure lane polarity. */
bccc36c35947d3f Cosmin Tanislav 2026-09-30  586  	for (i = 0, val = 0; i < num_data_lanes; i++)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  587  		if (phy->mipi.lane_polarities[i + 1])
bccc36c35947d3f Cosmin Tanislav 2026-09-30  588  			val |= BIT(i);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  589  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  590  	if (num_hw_data_lanes == 4) {
bccc36c35947d3f Cosmin Tanislav 2026-09-30  591  		ret = regmap_update_bits(priv->regmap, MAX96724_MIPI_PHY5(index),
bccc36c35947d3f Cosmin Tanislav 2026-09-30  592  					 MAX96724_MIPI_PHY5_PHY_POL_MAP_4_0_1 |
bccc36c35947d3f Cosmin Tanislav 2026-09-30  593  					 MAX96724_MIPI_PHY5_PHY_POL_MAP_4_2_3,
bccc36c35947d3f Cosmin Tanislav 2026-09-30  594  					 FIELD_PREP(MAX96724_MIPI_PHY5_PHY_POL_MAP_4_0_1,
bccc36c35947d3f Cosmin Tanislav 2026-09-30  595  						    val) |
bccc36c35947d3f Cosmin Tanislav 2026-09-30  596  					 FIELD_PREP(MAX96724_MIPI_PHY5_PHY_POL_MAP_4_2_3,
bccc36c35947d3f Cosmin Tanislav 2026-09-30  597  						    val >> 2));
bccc36c35947d3f Cosmin Tanislav 2026-09-30  598  		if (ret)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  599  			return ret;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  600  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  601  		ret = regmap_assign_bits(priv->regmap, MAX96724_MIPI_PHY5(index),
bccc36c35947d3f Cosmin Tanislav 2026-09-30  602  					 MAX96724_MIPI_PHY5_PHY_POL_MAP_4_CLK,
bccc36c35947d3f Cosmin Tanislav 2026-09-30  603  					 phy->mipi.lane_polarities[0]);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  604  		if (ret)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  605  			return ret;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  606  	} else {
bccc36c35947d3f Cosmin Tanislav 2026-09-30  607  		ret = regmap_update_bits(priv->regmap, MAX96724_MIPI_PHY5(index),
bccc36c35947d3f Cosmin Tanislav 2026-09-30  608  					 MAX96724_MIPI_PHY5_PHY_POL_MAP_2(index),
bccc36c35947d3f Cosmin Tanislav 2026-09-30 @609  					 field_prep(MAX96724_MIPI_PHY5_PHY_POL_MAP_2(index), val));
bccc36c35947d3f Cosmin Tanislav 2026-09-30  610  		if (ret)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  611  			return ret;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  612  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  613  		ret = regmap_assign_bits(priv->regmap, MAX96724_MIPI_PHY5(index),
bccc36c35947d3f Cosmin Tanislav 2026-09-30  614  					 MAX96724_MIPI_PHY5_PHY_POL_MAP_2_CLK(index),
bccc36c35947d3f Cosmin Tanislav 2026-09-30  615  					 phy->mipi.lane_polarities[0]);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  616  		if (ret)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  617  			return ret;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  618  	}
bccc36c35947d3f Cosmin Tanislav 2026-09-30  619  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  620  	if (!is_cphy && dpll_freq > 1500000000ull) {
bccc36c35947d3f Cosmin Tanislav 2026-09-30  621  		/* Enable initial deskew with 2 x 32k UI. */
bccc36c35947d3f Cosmin Tanislav 2026-09-30  622  		ret = regmap_write(priv->regmap, MAX96724_MIPI_TX3(index),
bccc36c35947d3f Cosmin Tanislav 2026-09-30  623  				   MAX96724_MIPI_TX3_DESKEW_INIT_AUTO |
bccc36c35947d3f Cosmin Tanislav 2026-09-30  624  				   MAX96724_MIPI_TX3_DESKEW_INIT_8X32K);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  625  		if (ret)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  626  			return ret;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  627  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  628  		/* Enable periodic deskew with 2 x 1k UI.. */
bccc36c35947d3f Cosmin Tanislav 2026-09-30  629  		ret = regmap_write(priv->regmap, MAX96724_MIPI_TX4(index),
bccc36c35947d3f Cosmin Tanislav 2026-09-30  630  				   MAX96724_MIPI_TX4_DESKEW_PER_AUTO |
bccc36c35947d3f Cosmin Tanislav 2026-09-30  631  				   MAX96724_MIPI_TX4_DESKEW_PER_2K);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  632  		if (ret)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  633  			return ret;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  634  	} else {
bccc36c35947d3f Cosmin Tanislav 2026-09-30  635  		/* Disable initial deskew. */
bccc36c35947d3f Cosmin Tanislav 2026-09-30  636  		ret = regmap_write(priv->regmap, MAX96724_MIPI_TX3(index), 0x0);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  637  		if (ret)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  638  			return ret;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  639  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  640  		/* Disable periodic deskew. */
bccc36c35947d3f Cosmin Tanislav 2026-09-30  641  		ret = regmap_write(priv->regmap, MAX96724_MIPI_TX4(index), 0x0);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  642  		if (ret)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  643  			return ret;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  644  	}
bccc36c35947d3f Cosmin Tanislav 2026-09-30  645  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  646  	if (is_cphy) {
bccc36c35947d3f Cosmin Tanislav 2026-09-30  647  		/* Configure C-PHY timings. */
bccc36c35947d3f Cosmin Tanislav 2026-09-30  648  		ret = regmap_write(priv->regmap, MAX96724_MIPI_PHY13,
bccc36c35947d3f Cosmin Tanislav 2026-09-30  649  				   MAX96724_MIPI_PHY13_T_T3_PREBEGIN_64X7);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  650  		if (ret)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  651  			return ret;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  652  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  653  		ret = regmap_write(priv->regmap, MAX96724_MIPI_PHY14,
bccc36c35947d3f Cosmin Tanislav 2026-09-30  654  				   MAX96724_MIPI_PHY14_T_T3_PREP_55NS |
bccc36c35947d3f Cosmin Tanislav 2026-09-30  655  				   MAX96724_MIPI_PHY14_T_T3_POST_32X7);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  656  		if (ret)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  657  			return ret;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  658  	}
bccc36c35947d3f Cosmin Tanislav 2026-09-30  659  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  660  	/* Put DPLL block into reset. */
bccc36c35947d3f Cosmin Tanislav 2026-09-30  661  	ret = regmap_clear_bits(priv->regmap, MAX96724_DPLL_0(index),
bccc36c35947d3f Cosmin Tanislav 2026-09-30  662  				MAX96724_DPLL_0_CONFIG_SOFT_RST_N);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  663  	if (ret)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  664  		return ret;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  665  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  666  	/* Set DPLL frequency. */
bccc36c35947d3f Cosmin Tanislav 2026-09-30  667  	ret = regmap_update_bits(priv->regmap, MAX96724_BACKTOP22(index),
bccc36c35947d3f Cosmin Tanislav 2026-09-30  668  				 MAX96724_BACKTOP22_PHY_CSI_TX_DPLL,
bccc36c35947d3f Cosmin Tanislav 2026-09-30  669  				 FIELD_PREP(MAX96724_BACKTOP22_PHY_CSI_TX_DPLL,
bccc36c35947d3f Cosmin Tanislav 2026-09-30  670  					    div_u64(dpll_freq, 100000000)));
bccc36c35947d3f Cosmin Tanislav 2026-09-30  671  	if (ret)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  672  		return ret;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  673  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  674  	/* Enable DPLL frequency. */
bccc36c35947d3f Cosmin Tanislav 2026-09-30  675  	ret = regmap_set_bits(priv->regmap, MAX96724_BACKTOP22(index),
bccc36c35947d3f Cosmin Tanislav 2026-09-30  676  			      MAX96724_BACKTOP22_PHY_CSI_TX_DPLL_EN);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  677  	if (ret)
bccc36c35947d3f Cosmin Tanislav 2026-09-30  678  		return ret;
bccc36c35947d3f Cosmin Tanislav 2026-09-30  679  
bccc36c35947d3f Cosmin Tanislav 2026-09-30  680  	/* Pull DPLL block out of reset. */
bccc36c35947d3f Cosmin Tanislav 2026-09-30  681  	return regmap_set_bits(priv->regmap, MAX96724_DPLL_0(index),
bccc36c35947d3f Cosmin Tanislav 2026-09-30  682  			       MAX96724_DPLL_0_CONFIG_SOFT_RST_N);
bccc36c35947d3f Cosmin Tanislav 2026-09-30  683  }
bccc36c35947d3f Cosmin Tanislav 2026-09-30  684  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
