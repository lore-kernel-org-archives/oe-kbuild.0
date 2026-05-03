Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EB439280A
	for <oe-kbuild@lists.linux.dev>; Sun,  3 May 2026 08:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777796075; cv=none; b=Zlzb9BCxaGuonPuCOAUHJkZGni4CpGCZP5uAqHkxaWKnHPvDUa4L7fkr5DN8EdjeeQM6nVpBKYmjsglb46JJvxzUEImN5cNiLd5Lh/xa6GeIeq0FW8g9y6OpwiXLvMmjYMYNR9Kc6HQSbHqmniV4zfK+PN7kWTrXWhH164BFN3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777796075; c=relaxed/simple;
	bh=vkP3948FtQzSWMjokrTHxGB0K7o+/wb4wKwTE6pZYW8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gkqZD59lDp6wUWVTZzBZxdwhv3M/HibaRuNOmoqVzU+O2jpuZ3EUTbe5vT7q01wxrkLzDnzazIe5FDWpIRsdpXjpsS2sptnZyZBb/skOA35CoGJxYj3Ojvjp+veGsrsYB8YdcYRK9tfSTGUUpczQELvSNfQezyGFgDJSj2YeCS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MRIAXPlX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MRIAXPlX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777796073; x=1809332073;
  h=date:from:to:cc:subject:message-id;
  bh=vkP3948FtQzSWMjokrTHxGB0K7o+/wb4wKwTE6pZYW8=;
  b=MRIAXPlX8UbImUObFStpio8xPQLDu40NmW3YO5Ycc/5nF2pf0Z52xiGS
   lB2QS31yd8aB53dEj4bEta+N2Z3frM6ISF/QYVUF5qxARBsEk0R4FF0md
   e0tc5pW44Q+6Z5Wio9iwCqHOp0vPTmASZOewrfiSW/hrIP4kDTD+ledX1
   BumOSOwHEnrnpP14b0/Ghnvcm6/1JlWCie7eD1N9brGNXE4dT+ZvlJeQx
   nZ0DrA5HJmvojPkskOz4L7rx69G+oINIgU7C1MuOc+OGjkr6IXP1d5BLB
   yw2UGHJMoE7tRdoRtSsxwk+LZMVsbAHBjESJk5yr9XWXuAWDjbiTCGHgc
   w==;
X-CSE-ConnectionGUID: mpUdNIxqSMaQuvi/7TeFKA==
X-CSE-MsgGUID: L3Y04KYeRDKN/5nCbmadPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="78886036"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="78886036"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 01:14:30 -0700
X-CSE-ConnectionGUID: gI2ACI/8RTa1H6qE3ykztQ==
X-CSE-MsgGUID: E0LfvX56Rx6IRVDGl8/+pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="235320374"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 May 2026 01:14:29 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJRy6-000000002LU-1RBz;
	Sun, 03 May 2026 08:14:26 +0000
Date: Sun, 03 May 2026 16:14:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:114
 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <=
 u32max
Message-ID: <202605031655.HeDZ2syL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Keke Li <keke.li@amlogic.com>
CC: Hans Verkuil <hverkuil@kernel.org>
CC: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   66edb901bf874d9e0787326ba12d3548b2da8700
commit: fb2e135208f364f26b7579c191434d38655e813f media: platform: Add C3 ISP driver
date:   12 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 12 months ago
config: hexagon-randconfig-r072-20260503 (https://download.01.org/0day-ci/archive/20260503/202605031655.HeDZ2syL-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: fb2e135208f3 ("media: platform: Add C3 ISP driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605031655.HeDZ2syL-lkp@intel.com/

smatch warnings:
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:114 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:114 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:230 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:230 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max

vim +114 drivers/media/platform/amlogic/c3/isp/c3-isp-params.c

fb2e135208f364 Keke Li 2025-04-27   97  
fb2e135208f364 Keke Li 2025-04-27   98  static void c3_isp_params_awb_wt(struct c3_isp_device *isp,
fb2e135208f364 Keke Li 2025-04-27   99  				 const struct c3_isp_params_awb_config *cfg)
fb2e135208f364 Keke Li 2025-04-27  100  {
fb2e135208f364 Keke Li 2025-04-27  101  	unsigned int zones_num;
fb2e135208f364 Keke Li 2025-04-27  102  	unsigned int base;
fb2e135208f364 Keke Li 2025-04-27  103  	unsigned int data;
fb2e135208f364 Keke Li 2025-04-27  104  	unsigned int i;
fb2e135208f364 Keke Li 2025-04-27  105  
fb2e135208f364 Keke Li 2025-04-27  106  	/* Set the weight address to 0 position */
fb2e135208f364 Keke Li 2025-04-27  107  	c3_isp_write(isp, ISP_AWB_BLK_WT_ADDR, 0);
fb2e135208f364 Keke Li 2025-04-27  108  
fb2e135208f364 Keke Li 2025-04-27  109  	zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
fb2e135208f364 Keke Li 2025-04-27  110  
fb2e135208f364 Keke Li 2025-04-27  111  	/* Need to write 8 weights at once */
fb2e135208f364 Keke Li 2025-04-27  112  	for (i = 0; i < zones_num / 8; i++) {
fb2e135208f364 Keke Li 2025-04-27  113  		base = i * 8;
fb2e135208f364 Keke Li 2025-04-27 @114  		data = ISP_AWB_BLK_WT_DATA_WT(0, cfg->zone_weight[base + 0]) |
fb2e135208f364 Keke Li 2025-04-27  115  		       ISP_AWB_BLK_WT_DATA_WT(1, cfg->zone_weight[base + 1]) |
fb2e135208f364 Keke Li 2025-04-27  116  		       ISP_AWB_BLK_WT_DATA_WT(2, cfg->zone_weight[base + 2]) |
fb2e135208f364 Keke Li 2025-04-27  117  		       ISP_AWB_BLK_WT_DATA_WT(3, cfg->zone_weight[base + 3]) |
fb2e135208f364 Keke Li 2025-04-27  118  		       ISP_AWB_BLK_WT_DATA_WT(4, cfg->zone_weight[base + 4]) |
fb2e135208f364 Keke Li 2025-04-27  119  		       ISP_AWB_BLK_WT_DATA_WT(5, cfg->zone_weight[base + 5]) |
fb2e135208f364 Keke Li 2025-04-27  120  		       ISP_AWB_BLK_WT_DATA_WT(6, cfg->zone_weight[base + 6]) |
fb2e135208f364 Keke Li 2025-04-27  121  		       ISP_AWB_BLK_WT_DATA_WT(7, cfg->zone_weight[base + 7]);
fb2e135208f364 Keke Li 2025-04-27  122  		c3_isp_write(isp, ISP_AWB_BLK_WT_DATA, data);
fb2e135208f364 Keke Li 2025-04-27  123  	}
fb2e135208f364 Keke Li 2025-04-27  124  
fb2e135208f364 Keke Li 2025-04-27  125  	if (zones_num % 8 == 0)
fb2e135208f364 Keke Li 2025-04-27  126  		return;
fb2e135208f364 Keke Li 2025-04-27  127  
fb2e135208f364 Keke Li 2025-04-27  128  	data = 0;
fb2e135208f364 Keke Li 2025-04-27  129  	base = i * 8;
fb2e135208f364 Keke Li 2025-04-27  130  
fb2e135208f364 Keke Li 2025-04-27  131  	for (i = 0; i < zones_num % 8; i++)
fb2e135208f364 Keke Li 2025-04-27  132  		data |= ISP_AWB_BLK_WT_DATA_WT(i, cfg->zone_weight[base + i]);
fb2e135208f364 Keke Li 2025-04-27  133  
fb2e135208f364 Keke Li 2025-04-27  134  	c3_isp_write(isp, ISP_AWB_BLK_WT_DATA, data);
fb2e135208f364 Keke Li 2025-04-27  135  }
fb2e135208f364 Keke Li 2025-04-27  136  
fb2e135208f364 Keke Li 2025-04-27  137  static void c3_isp_params_awb_cood(struct c3_isp_device *isp,
fb2e135208f364 Keke Li 2025-04-27  138  				   const struct c3_isp_params_awb_config *cfg)
fb2e135208f364 Keke Li 2025-04-27  139  {
fb2e135208f364 Keke Li 2025-04-27  140  	unsigned int max_point_num;
fb2e135208f364 Keke Li 2025-04-27  141  
fb2e135208f364 Keke Li 2025-04-27  142  	/* The number of points is one more than the number of edges */
fb2e135208f364 Keke Li 2025-04-27  143  	max_point_num = max(cfg->horiz_zones_num, cfg->vert_zones_num) + 1;
fb2e135208f364 Keke Li 2025-04-27  144  
fb2e135208f364 Keke Li 2025-04-27  145  	/* Set the index address to 0 position */
fb2e135208f364 Keke Li 2025-04-27  146  	c3_isp_write(isp, ISP_AWB_IDX_ADDR, 0);
fb2e135208f364 Keke Li 2025-04-27  147  
fb2e135208f364 Keke Li 2025-04-27  148  	for (unsigned int i = 0; i < max_point_num; i++)
fb2e135208f364 Keke Li 2025-04-27  149  		c3_isp_write(isp, ISP_AWB_IDX_DATA,
fb2e135208f364 Keke Li 2025-04-27  150  			     ISP_AWB_IDX_DATA_HIDX_DATA(cfg->horiz_coord[i]) |
fb2e135208f364 Keke Li 2025-04-27  151  			     ISP_AWB_IDX_DATA_VIDX_DATA(cfg->vert_coord[i]));
fb2e135208f364 Keke Li 2025-04-27  152  }
fb2e135208f364 Keke Li 2025-04-27  153  
fb2e135208f364 Keke Li 2025-04-27  154  static void c3_isp_params_cfg_awb_config(struct c3_isp_device *isp,
fb2e135208f364 Keke Li 2025-04-27  155  					 const union c3_isp_params_block *block)
fb2e135208f364 Keke Li 2025-04-27  156  {
fb2e135208f364 Keke Li 2025-04-27  157  	const struct c3_isp_params_awb_config *awb_cfg = &block->awb_cfg;
fb2e135208f364 Keke Li 2025-04-27  158  
fb2e135208f364 Keke Li 2025-04-27  159  	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
fb2e135208f364 Keke Li 2025-04-27  160  		c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
fb2e135208f364 Keke Li 2025-04-27  161  				   ISP_TOP_3A_STAT_CRTL_AWB_STAT_EN_MASK,
fb2e135208f364 Keke Li 2025-04-27  162  				   ISP_TOP_3A_STAT_CRTL_AWB_STAT_DIS);
fb2e135208f364 Keke Li 2025-04-27  163  		return;
fb2e135208f364 Keke Li 2025-04-27  164  	}
fb2e135208f364 Keke Li 2025-04-27  165  
fb2e135208f364 Keke Li 2025-04-27  166  	c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
fb2e135208f364 Keke Li 2025-04-27  167  			   ISP_TOP_3A_STAT_CRTL_AWB_POINT_MASK,
fb2e135208f364 Keke Li 2025-04-27  168  			   ISP_TOP_3A_STAT_CRTL_AWB_POINT(awb_cfg->tap_point));
fb2e135208f364 Keke Li 2025-04-27  169  
fb2e135208f364 Keke Li 2025-04-27  170  	c3_isp_update_bits(isp, ISP_AWB_STAT_CTRL2,
fb2e135208f364 Keke Li 2025-04-27  171  			   ISP_AWB_STAT_CTRL2_SATUR_CTRL_MASK,
fb2e135208f364 Keke Li 2025-04-27  172  			   ISP_AWB_STAT_CTRL2_SATUR_CTRL(awb_cfg->satur_vald));
fb2e135208f364 Keke Li 2025-04-27  173  
fb2e135208f364 Keke Li 2025-04-27  174  	c3_isp_update_bits(isp, ISP_AWB_HV_BLKNUM,
fb2e135208f364 Keke Li 2025-04-27  175  			   ISP_AWB_HV_BLKNUM_H_NUM_MASK,
fb2e135208f364 Keke Li 2025-04-27  176  			   ISP_AWB_HV_BLKNUM_H_NUM(awb_cfg->horiz_zones_num));
fb2e135208f364 Keke Li 2025-04-27  177  	c3_isp_update_bits(isp, ISP_AWB_HV_BLKNUM,
fb2e135208f364 Keke Li 2025-04-27  178  			   ISP_AWB_HV_BLKNUM_V_NUM_MASK,
fb2e135208f364 Keke Li 2025-04-27  179  			   ISP_AWB_HV_BLKNUM_V_NUM(awb_cfg->vert_zones_num));
fb2e135208f364 Keke Li 2025-04-27  180  
fb2e135208f364 Keke Li 2025-04-27  181  	c3_isp_update_bits(isp, ISP_AWB_STAT_RG, ISP_AWB_STAT_RG_MIN_VALUE_MASK,
fb2e135208f364 Keke Li 2025-04-27  182  			   ISP_AWB_STAT_RG_MIN_VALUE(awb_cfg->rg_min));
fb2e135208f364 Keke Li 2025-04-27  183  	c3_isp_update_bits(isp, ISP_AWB_STAT_RG, ISP_AWB_STAT_RG_MAX_VALUE_MASK,
fb2e135208f364 Keke Li 2025-04-27  184  			   ISP_AWB_STAT_RG_MAX_VALUE(awb_cfg->rg_max));
fb2e135208f364 Keke Li 2025-04-27  185  
fb2e135208f364 Keke Li 2025-04-27  186  	c3_isp_update_bits(isp, ISP_AWB_STAT_BG, ISP_AWB_STAT_BG_MIN_VALUE_MASK,
fb2e135208f364 Keke Li 2025-04-27  187  			   ISP_AWB_STAT_BG_MIN_VALUE(awb_cfg->bg_min));
fb2e135208f364 Keke Li 2025-04-27  188  	c3_isp_update_bits(isp, ISP_AWB_STAT_BG, ISP_AWB_STAT_BG_MAX_VALUE_MASK,
fb2e135208f364 Keke Li 2025-04-27  189  			   ISP_AWB_STAT_BG_MAX_VALUE(awb_cfg->bg_max));
fb2e135208f364 Keke Li 2025-04-27  190  
fb2e135208f364 Keke Li 2025-04-27  191  	c3_isp_update_bits(isp, ISP_AWB_STAT_RG_HL,
fb2e135208f364 Keke Li 2025-04-27  192  			   ISP_AWB_STAT_RG_HL_LOW_VALUE_MASK,
fb2e135208f364 Keke Li 2025-04-27  193  			   ISP_AWB_STAT_RG_HL_LOW_VALUE(awb_cfg->rg_low));
fb2e135208f364 Keke Li 2025-04-27  194  	c3_isp_update_bits(isp, ISP_AWB_STAT_RG_HL,
fb2e135208f364 Keke Li 2025-04-27  195  			   ISP_AWB_STAT_RG_HL_HIGH_VALUE_MASK,
fb2e135208f364 Keke Li 2025-04-27  196  			   ISP_AWB_STAT_RG_HL_HIGH_VALUE(awb_cfg->rg_high));
fb2e135208f364 Keke Li 2025-04-27  197  
fb2e135208f364 Keke Li 2025-04-27  198  	c3_isp_update_bits(isp, ISP_AWB_STAT_BG_HL,
fb2e135208f364 Keke Li 2025-04-27  199  			   ISP_AWB_STAT_BG_HL_LOW_VALUE_MASK,
fb2e135208f364 Keke Li 2025-04-27  200  			   ISP_AWB_STAT_BG_HL_LOW_VALUE(awb_cfg->bg_low));
fb2e135208f364 Keke Li 2025-04-27  201  	c3_isp_update_bits(isp, ISP_AWB_STAT_BG_HL,
fb2e135208f364 Keke Li 2025-04-27  202  			   ISP_AWB_STAT_BG_HL_HIGH_VALUE_MASK,
fb2e135208f364 Keke Li 2025-04-27  203  			   ISP_AWB_STAT_BG_HL_HIGH_VALUE(awb_cfg->bg_high));
fb2e135208f364 Keke Li 2025-04-27  204  
fb2e135208f364 Keke Li 2025-04-27  205  	c3_isp_params_awb_wt(isp, awb_cfg);
fb2e135208f364 Keke Li 2025-04-27  206  	c3_isp_params_awb_cood(isp, awb_cfg);
fb2e135208f364 Keke Li 2025-04-27  207  
fb2e135208f364 Keke Li 2025-04-27  208  	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
fb2e135208f364 Keke Li 2025-04-27  209  		c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
fb2e135208f364 Keke Li 2025-04-27  210  				   ISP_TOP_3A_STAT_CRTL_AWB_STAT_EN_MASK,
fb2e135208f364 Keke Li 2025-04-27  211  				   ISP_TOP_3A_STAT_CRTL_AWB_STAT_EN);
fb2e135208f364 Keke Li 2025-04-27  212  }
fb2e135208f364 Keke Li 2025-04-27  213  
fb2e135208f364 Keke Li 2025-04-27  214  static void c3_isp_params_ae_wt(struct c3_isp_device *isp,
fb2e135208f364 Keke Li 2025-04-27  215  				const struct c3_isp_params_ae_config *cfg)
fb2e135208f364 Keke Li 2025-04-27  216  {
fb2e135208f364 Keke Li 2025-04-27  217  	unsigned int zones_num;
fb2e135208f364 Keke Li 2025-04-27  218  	unsigned int base;
fb2e135208f364 Keke Li 2025-04-27  219  	unsigned int data;
fb2e135208f364 Keke Li 2025-04-27  220  	unsigned int i;
fb2e135208f364 Keke Li 2025-04-27  221  
fb2e135208f364 Keke Li 2025-04-27  222  	/* Set the weight address to 0 position */
fb2e135208f364 Keke Li 2025-04-27  223  	c3_isp_write(isp, ISP_AE_BLK_WT_ADDR, 0);
fb2e135208f364 Keke Li 2025-04-27  224  
fb2e135208f364 Keke Li 2025-04-27  225  	zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
fb2e135208f364 Keke Li 2025-04-27  226  
fb2e135208f364 Keke Li 2025-04-27  227  	/* Need to write 8 weights at once */
fb2e135208f364 Keke Li 2025-04-27  228  	for (i = 0; i < zones_num / 8; i++) {
fb2e135208f364 Keke Li 2025-04-27  229  		base = i * 8;
fb2e135208f364 Keke Li 2025-04-27 @230  		data = ISP_AE_BLK_WT_DATA_WT(0, cfg->zone_weight[base + 0]) |
fb2e135208f364 Keke Li 2025-04-27  231  		       ISP_AE_BLK_WT_DATA_WT(1, cfg->zone_weight[base + 1]) |
fb2e135208f364 Keke Li 2025-04-27  232  		       ISP_AE_BLK_WT_DATA_WT(2, cfg->zone_weight[base + 2]) |
fb2e135208f364 Keke Li 2025-04-27  233  		       ISP_AE_BLK_WT_DATA_WT(3, cfg->zone_weight[base + 3]) |
fb2e135208f364 Keke Li 2025-04-27  234  		       ISP_AE_BLK_WT_DATA_WT(4, cfg->zone_weight[base + 4]) |
fb2e135208f364 Keke Li 2025-04-27  235  		       ISP_AE_BLK_WT_DATA_WT(5, cfg->zone_weight[base + 5]) |
fb2e135208f364 Keke Li 2025-04-27  236  		       ISP_AE_BLK_WT_DATA_WT(6, cfg->zone_weight[base + 6]) |
fb2e135208f364 Keke Li 2025-04-27  237  		       ISP_AE_BLK_WT_DATA_WT(7, cfg->zone_weight[base + 7]);
fb2e135208f364 Keke Li 2025-04-27  238  		c3_isp_write(isp, ISP_AE_BLK_WT_DATA, data);
fb2e135208f364 Keke Li 2025-04-27  239  	}
fb2e135208f364 Keke Li 2025-04-27  240  
fb2e135208f364 Keke Li 2025-04-27  241  	if (zones_num % 8 == 0)
fb2e135208f364 Keke Li 2025-04-27  242  		return;
fb2e135208f364 Keke Li 2025-04-27  243  
fb2e135208f364 Keke Li 2025-04-27  244  	data = 0;
fb2e135208f364 Keke Li 2025-04-27  245  	base = i * 8;
fb2e135208f364 Keke Li 2025-04-27  246  
fb2e135208f364 Keke Li 2025-04-27  247  	/* Write the last weights data */
fb2e135208f364 Keke Li 2025-04-27  248  	for (i = 0; i < zones_num % 8; i++)
fb2e135208f364 Keke Li 2025-04-27  249  		data |= ISP_AE_BLK_WT_DATA_WT(i, cfg->zone_weight[base + i]);
fb2e135208f364 Keke Li 2025-04-27  250  
fb2e135208f364 Keke Li 2025-04-27  251  	c3_isp_write(isp, ISP_AE_BLK_WT_DATA, data);
fb2e135208f364 Keke Li 2025-04-27  252  }
fb2e135208f364 Keke Li 2025-04-27  253  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
