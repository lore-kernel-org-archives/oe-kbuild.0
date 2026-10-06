Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB64A547061
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Oct 2026 02:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791253576; cv=none; b=AZlUUm+2wrdjCTIfXt63wU97m7FkpRiB63o1TomhrChYil6OdUj/AKMFKk53zV1E/FdV6IMe9FbCWNr50epYjGRKT5NNU2ECl2MjaWoj4H0L9JJOW1pImi50cKoKK3U5TYBaHk9RmRqwGXI7JmbfTat9ke2RDCo9L2ara25ZkLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791253576; c=relaxed/simple;
	bh=pNfPLRIyumw4vGxGIh0wZlY5T979lWdK50xtetE9ihY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K5h7TOmbyXr6XdKakB+QJbumQBXiPNbsgUdX2ULmksWYJPG83UNrXBlKQx4jzCw8BYWeBEhA2nUKYS8RR7oITNElntDJG9P/9TEeDf04IC+v98uGEc2NE/HANlEHOalQSjAIjrHEbEJn3B4oj5A8mM+4I5elhxpr3NT3ltqhTY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L5LG6QDj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L5LG6QDj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791253574; x=1822789574;
  h=date:from:to:cc:subject:message-id;
  bh=pNfPLRIyumw4vGxGIh0wZlY5T979lWdK50xtetE9ihY=;
  b=L5LG6QDjzDCOQ+BAQJv8OzvRiehlPLtgTu9eMpDke+j73ukIaa/LLJJ5
   ZgCYpjvjY4VPZKwqeR6Rk1ZVAF64WQdaXWbsbDeKGQWK4C/sCepH+FIh3
   UcGAAgSGuzqyjMPwcKmaSBuT8XeIwhswF8GpST2ZdOEjxxkC8ziPL91cq
   vvYm/n0rKxiig7XGMehGpd4qGYlBXi4SpcSQjPWDmqe1UMWZKluzCQNFH
   6ZQt1z2hW9Eu9I2iTWP/u6dpDxlST3HYDelMK9u3Uqfbe3K1P98evK3bs
   nHq1CzP44q6joHMemCp6It3BpMDSMrs58tmhx69iPJXJWnjedzH062Acb
   g==;
X-CSE-ConnectionGUID: afmtxCKxSoy5oAbs+C4D+A==
X-CSE-MsgGUID: 9GgBn5HWSraluhLJ97+VKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="94424146"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="94424146"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 19:26:14 -0700
X-CSE-ConnectionGUID: dw3InV0gSZux+gOkzyi5Fw==
X-CSE-MsgGUID: ko96p5DfR+GqCcwAdpi4RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="273383119"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 05 Oct 2026 19:26:13 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDusc-000000000at-2sLz;
	Tue, 06 Oct 2026 02:26:10 +0000
Date: Tue, 06 Oct 2026 04:25:36 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:irq/drivers 3/22] drivers/irqchip/irq-qcom-mpm.c:444
 qcom_mpm_probe() warn: missing unwind goto?
Message-ID: <202610060433.10zppuxU-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Thomas Gleixner <tglx@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/drivers
head:   0c65a1331928d0207c385f03fb5eba0cfecce0e6
commit: 1b852de05f74cfc96c58caad9df4cc1fa2dc7689 [3/22] irqchip/qcom: Enable compile testing for QCOM_PDC and QCOM_MPM
:::::: branch date: 4 weeks ago
:::::: commit date: 5 weeks ago
config: microblaze-randconfig-r2201-20261006 (https://download.01.org/0day-ci/archive/20261006/202610060433.10zppuxU-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610060433.10zppuxU-lkp@intel.com/

smatch warnings:
drivers/irqchip/irq-qcom-mpm.c:444 qcom_mpm_probe() warn: missing unwind goto?

vim +444 drivers/irqchip/irq-qcom-mpm.c

a6199bb514d8a63 Shawn Guo         2022-03-08  324  
1e3e330c07076a0 Johan Hovold      2025-10-13  325  static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *parent)
a6199bb514d8a63 Shawn Guo         2022-03-08  326  {
1e3e330c07076a0 Johan Hovold      2025-10-13  327  	struct device_node *np = pdev->dev.of_node;
a6199bb514d8a63 Shawn Guo         2022-03-08  328  	struct device *dev = &pdev->dev;
a6199bb514d8a63 Shawn Guo         2022-03-08  329  	struct irq_domain *parent_domain;
a6199bb514d8a63 Shawn Guo         2022-03-08  330  	struct generic_pm_domain *genpd;
221b110d87c2d3e Konrad Dybcio     2023-11-27  331  	struct device_node *msgram_np;
a6199bb514d8a63 Shawn Guo         2022-03-08  332  	struct qcom_mpm_priv *priv;
a6199bb514d8a63 Shawn Guo         2022-03-08  333  	unsigned int pin_cnt;
221b110d87c2d3e Konrad Dybcio     2023-11-27  334  	struct resource res;
a6199bb514d8a63 Shawn Guo         2022-03-08  335  	int i, irq;
a6199bb514d8a63 Shawn Guo         2022-03-08  336  	int ret;
a6199bb514d8a63 Shawn Guo         2022-03-08  337  
a6199bb514d8a63 Shawn Guo         2022-03-08  338  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
a6199bb514d8a63 Shawn Guo         2022-03-08  339  	if (!priv)
a6199bb514d8a63 Shawn Guo         2022-03-08  340  		return -ENOMEM;
a6199bb514d8a63 Shawn Guo         2022-03-08  341  
a6199bb514d8a63 Shawn Guo         2022-03-08  342  	ret = of_property_read_u32(np, "qcom,mpm-pin-count", &pin_cnt);
a6199bb514d8a63 Shawn Guo         2022-03-08  343  	if (ret) {
a6199bb514d8a63 Shawn Guo         2022-03-08  344  		dev_err(dev, "failed to read qcom,mpm-pin-count: %d\n", ret);
a6199bb514d8a63 Shawn Guo         2022-03-08  345  		return ret;
a6199bb514d8a63 Shawn Guo         2022-03-08  346  	}
a6199bb514d8a63 Shawn Guo         2022-03-08  347  
a6199bb514d8a63 Shawn Guo         2022-03-08  348  	priv->reg_stride = DIV_ROUND_UP(pin_cnt, 32);
a6199bb514d8a63 Shawn Guo         2022-03-08  349  
a6199bb514d8a63 Shawn Guo         2022-03-08  350  	ret = of_property_count_u32_elems(np, "qcom,mpm-pin-map");
a6199bb514d8a63 Shawn Guo         2022-03-08  351  	if (ret < 0) {
a6199bb514d8a63 Shawn Guo         2022-03-08  352  		dev_err(dev, "failed to read qcom,mpm-pin-map: %d\n", ret);
a6199bb514d8a63 Shawn Guo         2022-03-08  353  		return ret;
a6199bb514d8a63 Shawn Guo         2022-03-08  354  	}
a6199bb514d8a63 Shawn Guo         2022-03-08  355  
a6199bb514d8a63 Shawn Guo         2022-03-08  356  	if (ret % 2) {
a6199bb514d8a63 Shawn Guo         2022-03-08  357  		dev_err(dev, "invalid qcom,mpm-pin-map\n");
a6199bb514d8a63 Shawn Guo         2022-03-08  358  		return -EINVAL;
a6199bb514d8a63 Shawn Guo         2022-03-08  359  	}
a6199bb514d8a63 Shawn Guo         2022-03-08  360  
a6199bb514d8a63 Shawn Guo         2022-03-08  361  	priv->map_cnt = ret / 2;
a6199bb514d8a63 Shawn Guo         2022-03-08  362  	priv->maps = devm_kcalloc(dev, priv->map_cnt, sizeof(*priv->maps),
a6199bb514d8a63 Shawn Guo         2022-03-08  363  				  GFP_KERNEL);
a6199bb514d8a63 Shawn Guo         2022-03-08  364  	if (!priv->maps)
a6199bb514d8a63 Shawn Guo         2022-03-08  365  		return -ENOMEM;
a6199bb514d8a63 Shawn Guo         2022-03-08  366  
a6199bb514d8a63 Shawn Guo         2022-03-08  367  	for (i = 0; i < priv->map_cnt; i++) {
a6199bb514d8a63 Shawn Guo         2022-03-08  368  		u32 pin, hwirq;
a6199bb514d8a63 Shawn Guo         2022-03-08  369  
a6199bb514d8a63 Shawn Guo         2022-03-08  370  		of_property_read_u32_index(np, "qcom,mpm-pin-map", i * 2, &pin);
a6199bb514d8a63 Shawn Guo         2022-03-08  371  		of_property_read_u32_index(np, "qcom,mpm-pin-map", i * 2 + 1, &hwirq);
a6199bb514d8a63 Shawn Guo         2022-03-08  372  
a6199bb514d8a63 Shawn Guo         2022-03-08  373  		if (gic_hwirq_is_mapped(priv->maps, i, hwirq)) {
a6199bb514d8a63 Shawn Guo         2022-03-08  374  			dev_warn(dev, "failed to map pin %d as GIC hwirq %d is already mapped\n",
a6199bb514d8a63 Shawn Guo         2022-03-08  375  				 pin, hwirq);
a6199bb514d8a63 Shawn Guo         2022-03-08  376  			continue;
a6199bb514d8a63 Shawn Guo         2022-03-08  377  		}
a6199bb514d8a63 Shawn Guo         2022-03-08  378  
a6199bb514d8a63 Shawn Guo         2022-03-08  379  		priv->maps[i].pin = pin;
a6199bb514d8a63 Shawn Guo         2022-03-08  380  		priv->maps[i].hwirq = hwirq;
a6199bb514d8a63 Shawn Guo         2022-03-08  381  	}
a6199bb514d8a63 Shawn Guo         2022-03-08  382  
a6199bb514d8a63 Shawn Guo         2022-03-08  383  	raw_spin_lock_init(&priv->lock);
a6199bb514d8a63 Shawn Guo         2022-03-08  384  
221b110d87c2d3e Konrad Dybcio     2023-11-27  385  	/* If we have a handle to an RPM message ram partition, use it. */
221b110d87c2d3e Konrad Dybcio     2023-11-27  386  	msgram_np = of_parse_phandle(np, "qcom,rpm-msg-ram", 0);
221b110d87c2d3e Konrad Dybcio     2023-11-27  387  	if (msgram_np) {
221b110d87c2d3e Konrad Dybcio     2023-11-27  388  		ret = of_address_to_resource(msgram_np, 0, &res);
221b110d87c2d3e Konrad Dybcio     2023-11-27  389  		if (ret) {
221b110d87c2d3e Konrad Dybcio     2023-11-27  390  			of_node_put(msgram_np);
221b110d87c2d3e Konrad Dybcio     2023-11-27  391  			return ret;
221b110d87c2d3e Konrad Dybcio     2023-11-27  392  		}
221b110d87c2d3e Konrad Dybcio     2023-11-27  393  
221b110d87c2d3e Konrad Dybcio     2023-11-27  394  		/* Don't use devm_ioremap_resource, as we're accessing a shared region. */
221b110d87c2d3e Konrad Dybcio     2023-11-27  395  		priv->base = devm_ioremap(dev, res.start, resource_size(&res));
221b110d87c2d3e Konrad Dybcio     2023-11-27  396  		of_node_put(msgram_np);
8ad032cc8c499af Dan Carpenter     2024-02-01  397  		if (!priv->base)
8ad032cc8c499af Dan Carpenter     2024-02-01  398  			return -ENOMEM;
221b110d87c2d3e Konrad Dybcio     2023-11-27  399  	} else {
221b110d87c2d3e Konrad Dybcio     2023-11-27  400  		/* Otherwise, fall back to simple MMIO. */
a6199bb514d8a63 Shawn Guo         2022-03-08  401  		priv->base = devm_platform_ioremap_resource(pdev, 0);
76ff614a79152ce Yang Yingliang    2022-03-16  402  		if (IS_ERR(priv->base))
a6199bb514d8a63 Shawn Guo         2022-03-08  403  			return PTR_ERR(priv->base);
221b110d87c2d3e Konrad Dybcio     2023-11-27  404  	}
a6199bb514d8a63 Shawn Guo         2022-03-08  405  
a6199bb514d8a63 Shawn Guo         2022-03-08  406  	for (i = 0; i < priv->reg_stride; i++) {
a6199bb514d8a63 Shawn Guo         2022-03-08  407  		qcom_mpm_write(priv, MPM_REG_ENABLE, i, 0);
a6199bb514d8a63 Shawn Guo         2022-03-08  408  		qcom_mpm_write(priv, MPM_REG_FALLING_EDGE, i, 0);
a6199bb514d8a63 Shawn Guo         2022-03-08  409  		qcom_mpm_write(priv, MPM_REG_RISING_EDGE, i, 0);
a6199bb514d8a63 Shawn Guo         2022-03-08  410  		qcom_mpm_write(priv, MPM_REG_POLARITY, i, 0);
a6199bb514d8a63 Shawn Guo         2022-03-08  411  		qcom_mpm_write(priv, MPM_REG_STATUS, i, 0);
a6199bb514d8a63 Shawn Guo         2022-03-08  412  	}
a6199bb514d8a63 Shawn Guo         2022-03-08  413  
a6199bb514d8a63 Shawn Guo         2022-03-08  414  	irq = platform_get_irq(pdev, 0);
a6199bb514d8a63 Shawn Guo         2022-03-08  415  	if (irq < 0)
a6199bb514d8a63 Shawn Guo         2022-03-08  416  		return irq;
a6199bb514d8a63 Shawn Guo         2022-03-08  417  
a6199bb514d8a63 Shawn Guo         2022-03-08  418  	genpd = &priv->genpd;
a6199bb514d8a63 Shawn Guo         2022-03-08  419  	genpd->flags = GENPD_FLAG_IRQ_SAFE;
a6199bb514d8a63 Shawn Guo         2022-03-08  420  	genpd->power_off = mpm_pd_power_off;
a6199bb514d8a63 Shawn Guo         2022-03-08  421  
a6199bb514d8a63 Shawn Guo         2022-03-08  422  	genpd->name = devm_kasprintf(dev, GFP_KERNEL, "%s", dev_name(dev));
a6199bb514d8a63 Shawn Guo         2022-03-08  423  	if (!genpd->name)
a6199bb514d8a63 Shawn Guo         2022-03-08  424  		return -ENOMEM;
a6199bb514d8a63 Shawn Guo         2022-03-08  425  
a6199bb514d8a63 Shawn Guo         2022-03-08  426  	ret = pm_genpd_init(genpd, NULL, false);
a6199bb514d8a63 Shawn Guo         2022-03-08  427  	if (ret) {
a6199bb514d8a63 Shawn Guo         2022-03-08  428  		dev_err(dev, "failed to init genpd: %d\n", ret);
a6199bb514d8a63 Shawn Guo         2022-03-08  429  		return ret;
a6199bb514d8a63 Shawn Guo         2022-03-08  430  	}
a6199bb514d8a63 Shawn Guo         2022-03-08  431  
a6199bb514d8a63 Shawn Guo         2022-03-08  432  	ret = of_genpd_add_provider_simple(np, genpd);
a6199bb514d8a63 Shawn Guo         2022-03-08  433  	if (ret) {
a6199bb514d8a63 Shawn Guo         2022-03-08  434  		dev_err(dev, "failed to add genpd provider: %d\n", ret);
a6199bb514d8a63 Shawn Guo         2022-03-08  435  		goto remove_genpd;
a6199bb514d8a63 Shawn Guo         2022-03-08  436  	}
a6199bb514d8a63 Shawn Guo         2022-03-08  437  
a6199bb514d8a63 Shawn Guo         2022-03-08  438  	priv->mbox_client.dev = dev;
cfe02147e86307a Jassi Brar        2026-03-22  439  	priv->mbox_client.knows_txdone = true;
a6199bb514d8a63 Shawn Guo         2022-03-08  440  	priv->mbox_chan = mbox_request_channel(&priv->mbox_client, 0);
a6199bb514d8a63 Shawn Guo         2022-03-08  441  	if (IS_ERR(priv->mbox_chan)) {
a6199bb514d8a63 Shawn Guo         2022-03-08  442  		ret = PTR_ERR(priv->mbox_chan);
a6199bb514d8a63 Shawn Guo         2022-03-08  443  		dev_err(dev, "failed to acquire IPC channel: %d\n", ret);
a6199bb514d8a63 Shawn Guo         2022-03-08 @444  		return ret;
a6199bb514d8a63 Shawn Guo         2022-03-08  445  	}
a6199bb514d8a63 Shawn Guo         2022-03-08  446  
a6199bb514d8a63 Shawn Guo         2022-03-08  447  	parent_domain = irq_find_host(parent);
a6199bb514d8a63 Shawn Guo         2022-03-08  448  	if (!parent_domain) {
a6199bb514d8a63 Shawn Guo         2022-03-08  449  		dev_err(dev, "failed to find MPM parent domain\n");
a6199bb514d8a63 Shawn Guo         2022-03-08  450  		ret = -ENXIO;
a6199bb514d8a63 Shawn Guo         2022-03-08  451  		goto free_mbox;
a6199bb514d8a63 Shawn Guo         2022-03-08  452  	}
a6199bb514d8a63 Shawn Guo         2022-03-08  453  
a6199bb514d8a63 Shawn Guo         2022-03-08  454  	priv->domain = irq_domain_create_hierarchy(parent_domain,
a6199bb514d8a63 Shawn Guo         2022-03-08  455  				IRQ_DOMAIN_FLAG_QCOM_MPM_WAKEUP, pin_cnt,
87228532e7e9687 Jiri Slaby (SUSE  2025-03-19  456) 				of_fwnode_handle(np), &qcom_mpm_ops, priv);
a6199bb514d8a63 Shawn Guo         2022-03-08  457  	if (!priv->domain) {
a6199bb514d8a63 Shawn Guo         2022-03-08  458  		dev_err(dev, "failed to create MPM domain\n");
a6199bb514d8a63 Shawn Guo         2022-03-08  459  		ret = -ENOMEM;
a6199bb514d8a63 Shawn Guo         2022-03-08  460  		goto free_mbox;
a6199bb514d8a63 Shawn Guo         2022-03-08  461  	}
a6199bb514d8a63 Shawn Guo         2022-03-08  462  
a6199bb514d8a63 Shawn Guo         2022-03-08  463  	irq_domain_update_bus_token(priv->domain, DOMAIN_BUS_WAKEUP);
a6199bb514d8a63 Shawn Guo         2022-03-08  464  
a6199bb514d8a63 Shawn Guo         2022-03-08  465  	ret = devm_request_irq(dev, irq, qcom_mpm_handler, IRQF_NO_SUSPEND,
a6199bb514d8a63 Shawn Guo         2022-03-08  466  			       "qcom_mpm", priv);
9023960b74ab32b Pan Chuang        2026-07-14  467  	if (ret)
a6199bb514d8a63 Shawn Guo         2022-03-08  468  		goto remove_domain;
a6199bb514d8a63 Shawn Guo         2022-03-08  469  
a6199bb514d8a63 Shawn Guo         2022-03-08  470  	return 0;
a6199bb514d8a63 Shawn Guo         2022-03-08  471  
a6199bb514d8a63 Shawn Guo         2022-03-08  472  remove_domain:
a6199bb514d8a63 Shawn Guo         2022-03-08  473  	irq_domain_remove(priv->domain);
a6199bb514d8a63 Shawn Guo         2022-03-08  474  free_mbox:
a6199bb514d8a63 Shawn Guo         2022-03-08  475  	mbox_free_channel(priv->mbox_chan);
a6199bb514d8a63 Shawn Guo         2022-03-08  476  remove_genpd:
a6199bb514d8a63 Shawn Guo         2022-03-08  477  	pm_genpd_remove(genpd);
a6199bb514d8a63 Shawn Guo         2022-03-08  478  	return ret;
a6199bb514d8a63 Shawn Guo         2022-03-08  479  }
a6199bb514d8a63 Shawn Guo         2022-03-08  480  

:::::: The code at line 444 was first introduced by commit
:::::: a6199bb514d8a63f61c2a22c1f912376e14d0fb2 irqchip: Add Qualcomm MPM controller driver

:::::: TO: Shawn Guo <shawn.guo@linaro.org>
:::::: CC: Marc Zyngier <maz@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
