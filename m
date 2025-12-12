Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F138155757
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 20:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765571973; cv=none; b=T8Nuqf4oX5Zi88+8/XRhok4/lnEYmbgDKKQFmM0MLXU0LX6XqmrP40C+UBzIhLisotkY1XJawKNhMAp26rEgG0Rjin+TW9ORgyUsmLm99gjmxmhCXsaMt0NaphmAH6gI3iSP4tOlDHwARQYrHSWlWgO776G/3KzDUc67g7ivaEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765571973; c=relaxed/simple;
	bh=dDUFfbbNLTo3usx5gCotEQC9z58xg/8WXY6lHbNvDAY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mOtKhg4GsGBHRUi3+TbRiNN1A4Ugd7r513+ZwEffUKhD5xBeXXRcIZRLzAwP1yeUzfP1eqch+tDSls/4ZaHzChtC9LSqZhPgbyE57WAycmrXgel+VpkipsAIoL6dD/QE/A6w4O9aYAqz4Bw/7sCp01ePyKL7hthQhhuK2VumLBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AQV2ds4K; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AQV2ds4K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765571972; x=1797107972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dDUFfbbNLTo3usx5gCotEQC9z58xg/8WXY6lHbNvDAY=;
  b=AQV2ds4K+UsOfOjITW0jy92pTP9D9llbc1qiDRIZhgRPr8W/idBnV7+U
   cxJDAovmKfkxtzgSP4cHTH3n+GUzkBJ9I79QQkrZAcpmZ04jctJFrvq/A
   s5jZ0LvJtAg9Lqi7ktu1akOIYBpBQ3ekJvaBLRdcmhr0qxCU9TKs3mN0s
   Ni+3AoinePxiqlygFRngsM1ytnRi6o9/5yro5dtEvXoHobKk4bSQJ6K9f
   vhKdP1HYpL2n+y9gr6lX9/E2PY12jHabpV3V4FGYKISy6tl5oZKe3DAkv
   vdFZhDe3hvp6s+jv/YazjBWqdOebjh0XLvYcZEFDRXF63B2UOFbW5a4FH
   Q==;
X-CSE-ConnectionGUID: LesdOYaNQH+fJgH32FCFWg==
X-CSE-MsgGUID: 6B57PCuPQXKWKz+hp8uJAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="77896165"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="77896165"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 12:39:29 -0800
X-CSE-ConnectionGUID: xokWj6XdTfywWcJbwIj6hA==
X-CSE-MsgGUID: zQkiP1SMSbOHrEbgJUQBQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="201666554"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Dec 2025 12:39:28 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU9vB-000000006al-1dNO;
	Fri, 12 Dec 2025 20:39:25 +0000
Date: Sat, 13 Dec 2025 04:39:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/spi/spi-amlogic-spisg.c:652 aml_spisg_clk_init() warn:
 passing zero to 'PTR_ERR'
Message-ID: <202512130437.kqaTs97H-lkp@intel.com>
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
TO: Sunny Luo <sunny.luo@amlogic.com>
CC: Mark Brown <broonie@kernel.org>
CC: Xianwei Zhao <xianwei.zhao@amlogic.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: cef9991e04aed3305c61c392e880f6e01a0c2ea4 spi: Add Amlogic SPISG driver
date:   5 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 5 months ago
config: m68k-randconfig-r072-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130437.kqaTs97H-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512130437.kqaTs97H-lkp@intel.com/

New smatch warnings:
drivers/spi/spi-amlogic-spisg.c:652 aml_spisg_clk_init() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/spi/spi-amlogic-spisg.c:175 spi_delay_to_sclk() warn: unsigned 'ns' is never less than zero.
drivers/spi/spi-amlogic-spisg.c:314 aml_spisg_setup_transfer() error: we previously assumed 'exdesc' could be null (see line 261)
drivers/spi/spi-amlogic-spisg.c:658 aml_spisg_clk_init() warn: passing zero to 'PTR_ERR'
drivers/spi/spi-amlogic-spisg.c:708 aml_spisg_clk_init() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +652 drivers/spi/spi-amlogic-spisg.c

cef9991e04aed3 Sunny Luo 2025-07-18  639  
cef9991e04aed3 Sunny Luo 2025-07-18  640  static int aml_spisg_clk_init(struct spisg_device *spisg, void __iomem *base)
cef9991e04aed3 Sunny Luo 2025-07-18  641  {
cef9991e04aed3 Sunny Luo 2025-07-18  642  	struct device *dev = &spisg->pdev->dev;
cef9991e04aed3 Sunny Luo 2025-07-18  643  	struct clk_init_data init;
cef9991e04aed3 Sunny Luo 2025-07-18  644  	struct clk_divider *div;
cef9991e04aed3 Sunny Luo 2025-07-18  645  	struct clk_div_table *tbl;
cef9991e04aed3 Sunny Luo 2025-07-18  646  	char name[32];
cef9991e04aed3 Sunny Luo 2025-07-18  647  	int ret, i;
cef9991e04aed3 Sunny Luo 2025-07-18  648  
cef9991e04aed3 Sunny Luo 2025-07-18  649  	spisg->core = devm_clk_get_enabled(dev, "core");
cef9991e04aed3 Sunny Luo 2025-07-18  650  	if (IS_ERR_OR_NULL(spisg->core)) {
cef9991e04aed3 Sunny Luo 2025-07-18  651  		dev_err(dev, "core clock request failed\n");
cef9991e04aed3 Sunny Luo 2025-07-18 @652  		return PTR_ERR(spisg->core);
cef9991e04aed3 Sunny Luo 2025-07-18  653  	}
cef9991e04aed3 Sunny Luo 2025-07-18  654  
cef9991e04aed3 Sunny Luo 2025-07-18  655  	spisg->pclk = devm_clk_get_enabled(dev, "pclk");
cef9991e04aed3 Sunny Luo 2025-07-18  656  	if (IS_ERR_OR_NULL(spisg->pclk)) {
cef9991e04aed3 Sunny Luo 2025-07-18  657  		dev_err(dev, "pclk clock request failed\n");
cef9991e04aed3 Sunny Luo 2025-07-18  658  		return PTR_ERR(spisg->pclk);
cef9991e04aed3 Sunny Luo 2025-07-18  659  	}
cef9991e04aed3 Sunny Luo 2025-07-18  660  
cef9991e04aed3 Sunny Luo 2025-07-18  661  	clk_set_min_rate(spisg->pclk, SPISG_PCLK_RATE_MIN);
cef9991e04aed3 Sunny Luo 2025-07-18  662  
cef9991e04aed3 Sunny Luo 2025-07-18  663  	clk_disable_unprepare(spisg->pclk);
cef9991e04aed3 Sunny Luo 2025-07-18  664  
cef9991e04aed3 Sunny Luo 2025-07-18  665  	tbl = devm_kzalloc(dev, sizeof(struct clk_div_table) * (DIV_NUM + 1), GFP_KERNEL);
cef9991e04aed3 Sunny Luo 2025-07-18  666  	if (!tbl)
cef9991e04aed3 Sunny Luo 2025-07-18  667  		return -ENOMEM;
cef9991e04aed3 Sunny Luo 2025-07-18  668  
cef9991e04aed3 Sunny Luo 2025-07-18  669  	for (i = 0; i < DIV_NUM; i++) {
cef9991e04aed3 Sunny Luo 2025-07-18  670  		tbl[i].val = i + SPISG_CLK_DIV_MIN - 1;
cef9991e04aed3 Sunny Luo 2025-07-18  671  		tbl[i].div = i + SPISG_CLK_DIV_MIN;
cef9991e04aed3 Sunny Luo 2025-07-18  672  	}
cef9991e04aed3 Sunny Luo 2025-07-18  673  	spisg->tbl = tbl;
cef9991e04aed3 Sunny Luo 2025-07-18  674  
cef9991e04aed3 Sunny Luo 2025-07-18  675  	div = devm_kzalloc(dev, sizeof(*div), GFP_KERNEL);
cef9991e04aed3 Sunny Luo 2025-07-18  676  	if (!div)
cef9991e04aed3 Sunny Luo 2025-07-18  677  		return -ENOMEM;
cef9991e04aed3 Sunny Luo 2025-07-18  678  
cef9991e04aed3 Sunny Luo 2025-07-18  679  	div->flags = CLK_DIVIDER_ROUND_CLOSEST;
cef9991e04aed3 Sunny Luo 2025-07-18  680  	div->reg = base + SPISG_REG_CFG_BUS;
cef9991e04aed3 Sunny Luo 2025-07-18  681  	div->shift = __bf_shf(CFG_CLK_DIV);
cef9991e04aed3 Sunny Luo 2025-07-18  682  	div->width = CLK_DIV_WIDTH;
cef9991e04aed3 Sunny Luo 2025-07-18  683  	div->table = tbl;
cef9991e04aed3 Sunny Luo 2025-07-18  684  
cef9991e04aed3 Sunny Luo 2025-07-18  685  	/* Register value should not be outside of the table */
cef9991e04aed3 Sunny Luo 2025-07-18  686  	regmap_update_bits(spisg->map, SPISG_REG_CFG_BUS, CFG_CLK_DIV,
cef9991e04aed3 Sunny Luo 2025-07-18  687  			   FIELD_PREP(CFG_CLK_DIV, SPISG_CLK_DIV_MIN - 1));
cef9991e04aed3 Sunny Luo 2025-07-18  688  
cef9991e04aed3 Sunny Luo 2025-07-18  689  	/* Register clk-divider */
cef9991e04aed3 Sunny Luo 2025-07-18  690  	snprintf(name, sizeof(name), "%s_div", dev_name(dev));
cef9991e04aed3 Sunny Luo 2025-07-18  691  	init.name = name;
cef9991e04aed3 Sunny Luo 2025-07-18  692  	init.ops = &clk_divider_ops;
cef9991e04aed3 Sunny Luo 2025-07-18  693  	init.flags = CLK_SET_RATE_PARENT;
cef9991e04aed3 Sunny Luo 2025-07-18  694  	init.parent_data = &(const struct clk_parent_data) {
cef9991e04aed3 Sunny Luo 2025-07-18  695  				.fw_name = "pclk",
cef9991e04aed3 Sunny Luo 2025-07-18  696  			   };
cef9991e04aed3 Sunny Luo 2025-07-18  697  	init.num_parents = 1;
cef9991e04aed3 Sunny Luo 2025-07-18  698  	div->hw.init = &init;
cef9991e04aed3 Sunny Luo 2025-07-18  699  	ret = devm_clk_hw_register(dev, &div->hw);
cef9991e04aed3 Sunny Luo 2025-07-18  700  	if (ret) {
cef9991e04aed3 Sunny Luo 2025-07-18  701  		dev_err(dev, "clock registration failed\n");
cef9991e04aed3 Sunny Luo 2025-07-18  702  		return ret;
cef9991e04aed3 Sunny Luo 2025-07-18  703  	}
cef9991e04aed3 Sunny Luo 2025-07-18  704  
cef9991e04aed3 Sunny Luo 2025-07-18  705  	spisg->sclk = devm_clk_hw_get_clk(dev, &div->hw, NULL);
cef9991e04aed3 Sunny Luo 2025-07-18  706  	if (IS_ERR_OR_NULL(spisg->sclk)) {
cef9991e04aed3 Sunny Luo 2025-07-18  707  		dev_err(dev, "get clock failed\n");
cef9991e04aed3 Sunny Luo 2025-07-18  708  		return PTR_ERR(spisg->sclk);
cef9991e04aed3 Sunny Luo 2025-07-18  709  	}
cef9991e04aed3 Sunny Luo 2025-07-18  710  
cef9991e04aed3 Sunny Luo 2025-07-18  711  	clk_prepare_enable(spisg->sclk);
cef9991e04aed3 Sunny Luo 2025-07-18  712  
cef9991e04aed3 Sunny Luo 2025-07-18  713  	return 0;
cef9991e04aed3 Sunny Luo 2025-07-18  714  }
cef9991e04aed3 Sunny Luo 2025-07-18  715  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
