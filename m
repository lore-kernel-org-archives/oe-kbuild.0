Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EAF2C2358
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Oct 2025 02:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759457544; cv=none; b=Ud4Ly1KKUzyMzbFc0lM2qeN7HlnqcA/j8aQmz7BdqJccQDkUqZd8u1STvUQmWl13xDdco2+7rEHTSsC04p/ZdR8+/mCI/6PBUzhvmVCyAu/8+qPDrP65xmYVrSDnuU54ri4Wlam3Ma+7ciJd4zjghHqa64MQkcBcxK3qo3JJRP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759457544; c=relaxed/simple;
	bh=Gzjdz6QTmhvho0jGNaGvfhx9/uUB/xAnjQtpT0oVv18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kdV8YxN+sgzJROjEayMMyOarIbd1/LbVE/fvep9dN1FQg48V3rMsxSPUP+2rx8vOAYBrA72Z0upos6GTY5AtwTump2GjVWAumQmdTZEmNB5Pi44zqsYyEwMtQDJP3PdG47TyFzJiKrA+bOiZeyw9PCXiM7tQtdDmV0CdmQ4PxTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EqTuUlVF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EqTuUlVF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759457538; x=1790993538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gzjdz6QTmhvho0jGNaGvfhx9/uUB/xAnjQtpT0oVv18=;
  b=EqTuUlVFFNTPS+f1/YTq8kR2mhDLiaDot2ug52bnTa0QTbfAxokThlpB
   vI89vhEMkVelSYHPre0LsYGxCvpTgfpDdWyHSY0RuOMsbMc2IUB6VunET
   /T5N5FZx8Wo+a4AX4johUXKFpjNwuAOd4o1ahAe6Ur0xYBkk70RRaZrHm
   6ZPHjtkvcfzgPVh9sUTrI034U9JnKbfZRINWVb5/7iuVctQKJE+s8LO0p
   7l3eFpoJXDz68PQcKhPhGeBokylETILiwx6voEx9jevnJMwizK8mWhpI0
   unemxu9dmwbT8dx0zvVEQ1gydvVrbRCMdHldUA9PkBSmwfkS5Xum631sW
   A==;
X-CSE-ConnectionGUID: WjUpLUN/Q1yGuMXk6SwJcw==
X-CSE-MsgGUID: 9M8vMZvoTVinKBdDMWb33A==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="73097454"
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; 
   d="scan'208";a="73097454"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 19:12:17 -0700
X-CSE-ConnectionGUID: WC1vSrjsTwyILtRPpc7XpQ==
X-CSE-MsgGUID: lh8BiM9GRjG3x5kHKxOqmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; 
   d="scan'208";a="184384777"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Oct 2025 19:12:14 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4VHI-0004FH-0K;
	Fri, 03 Oct 2025 02:12:12 +0000
Date: Fri, 3 Oct 2025 10:12:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v7 6/9] regulator: Add support for MediaTek MT6373 SPMI
 PMIC Regulators
Message-ID: <202510030902.aQS5rL8n-lkp@intel.com>
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
In-Reply-To: <20251002090028.1796462-7-angelogioacchino.delregno@collabora.com>
References: <20251002090028.1796462-7-angelogioacchino.delregno@collabora.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: linux-mediatek@lists.infradead.org
CC: lee@kernel.org
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: matthias.bgg@gmail.com
CC: angelogioacchino.delregno@collabora.com
CC: lgirdwood@gmail.com
CC: broonie@kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: kernel@collabora.com
CC: wenst@chromium.org
CC: igor.belwon@mentallysanemainliners.org

Hi AngeloGioacchino,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-regulator/for-next]
[also build test WARNING on lee-mfd/for-mfd-next jic23-iio/togreg lee-leds/for-leds-next lee-mfd/for-mfd-fixes linus/master v6.17 next-20251002]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-regulator-Document-MediaTek-MT6316-PMIC-Regulators/20251002-170532
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20251002090028.1796462-7-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v7 6/9] regulator: Add support for MediaTek MT6373 SPMI PMIC Regulators
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: arm-randconfig-r071-20251003 (https://download.01.org/0day-ci/archive/20251003/202510030902.aQS5rL8n-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510030902.aQS5rL8n-lkp@intel.com/

smatch warnings:
drivers/regulator/mt6373-regulator.c:664 mt6373_regulator_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +664 drivers/regulator/mt6373-regulator.c

910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  644  
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  645  static int mt6373_regulator_probe(struct platform_device *pdev)
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  646  {
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  647  	struct irq_fwspec fwspec = {
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  648  		.param_count = 2,
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  649  		.param = { 0, IRQ_TYPE_LEVEL_HIGH },
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  650  	};
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  651  	struct device_node *interrupt_parent;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  652  	struct regulator_config config = {};
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  653  	struct mt6373_regulator_info *info;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  654  	struct device *dev = &pdev->dev;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  655  	struct regulator_dev *rdev;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  656  	struct irq_domain *domain;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  657  	bool is_vbuck4_hw_ctrl;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  658  	bool is_cw_variant;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  659  	int i, ret;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  660  	u32 val;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  661  
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  662  	config.regmap = mt6373_spmi_register_regmap(dev);
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  663  	if (!config.regmap)
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02 @664  		return dev_err_probe(dev, PTR_ERR(config.regmap),
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  665  				     "Cannot get regmap\n");
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  666  	config.dev = dev;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  667  
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  668  	interrupt_parent = of_irq_find_parent(dev->of_node);
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  669  	if (!interrupt_parent)
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  670  		return -EINVAL;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  671  
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  672  	domain = irq_find_host(interrupt_parent);
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  673  	of_node_put(interrupt_parent);
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  674  	fwspec.fwnode = domain->fwnode;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  675  
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  676  	/* Read PMIC variant information */
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  677  	ret = regmap_read(config.regmap, MT6373_PLG_CFG_ELR1, &val);
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  678  	if (ret)
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  679  		return dev_err_probe(dev, ret, "Cannot read ID register\n");
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  680  
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  681  	val = FIELD_GET(MT6373_ELR_VARIANT_MASK, val);
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  682  	is_cw_variant = (val == MT6373_ELR_VARIANT_MT6373CW);
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  683  
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  684  	/* Read Reserved-SW information */
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  685  	ret = regmap_read(config.regmap, MT6373_RG_RSV_SWREG_H, &val);
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  686  	if (ret)
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  687  		return dev_err_probe(dev, ret, "Cannot read RSV_SW register\n");
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  688  
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  689  	is_vbuck4_hw_ctrl = val & MT6373_RG_RSV_SWREG_VBUCK4_HW_CTRL;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  690  
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  691  	for (i = 0; i < ARRAY_SIZE(mt6373_regulators); i++) {
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  692  		info = &mt6373_regulators[i];
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  693  
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  694  		/* MT6373CW VBUCK4 constraints are different */
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  695  		if (info->desc.id == MT6373_ID_VBUCK4) {
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  696  			unsigned int vbuck4_max_uV;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  697  
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  698  			/* VBUCK4 vreg software control not allowed in hw_ctrl mode */
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  699  			if (is_vbuck4_hw_ctrl)
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  700  				continue;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  701  
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  702  			if (is_cw_variant) {
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  703  				info->desc.uV_step = 6250;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  704  				vbuck4_max_uV = 1193750;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  705  			} else {
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  706  				info->desc.uV_step = 13875;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  707  				vbuck4_max_uV = 2650125;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  708  			}
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  709  			info->desc.n_voltages = vbuck4_max_uV / info->desc.uV_step + 1;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  710  		}
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  711  
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  712  		fwspec.param[0] = info->hwirq;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  713  		info->virq = irq_create_fwspec_mapping(&fwspec);
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  714  		if (!info->virq)
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  715  			return dev_err_probe(dev, -EINVAL,
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  716  					     "Failed to map IRQ%d\n", info->hwirq);
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  717  
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  718  		ret = devm_add_action_or_reset(dev, mt6373_irq_remove, &info->virq);
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  719  		if (ret) {
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  720  			irq_dispose_mapping(info->virq);
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  721  			return ret;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  722  		}
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  723  
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  724  		config.driver_data = info;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  725  		INIT_DELAYED_WORK(&info->oc_work, mt6373_oc_irq_enable_work);
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  726  
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  727  		rdev = devm_regulator_register(dev, &info->desc, &config);
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  728  		if (IS_ERR(rdev))
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  729  			return dev_err_probe(dev, PTR_ERR(rdev),
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  730  					     "failed to register %s\n", info->desc.name);
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  731  	}
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  732  	dev_set_drvdata(dev, config.regmap);
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  733  
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  734  	return 0;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  735  }
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  736  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
