Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436CF328277
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 23:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763076384; cv=none; b=gjK7bu+MBl0DD0RG4qwvu5fsggiHnrEmwHV0wQvUcLxkVntXu5BMiBFNRbzEjVrM9cNIMOpZW6qSiBGKQEoRbkpdwGyHvKgC5w5/imH5jcRUr4bsZp0tMTsbwzkL0uPR1skHbxmq6DuCiw8Q3fjpPWaVtriC+QhBANs9DicS5vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763076384; c=relaxed/simple;
	bh=1eJzfArwxu3JiphqkvDogCOmP1q/IErMNdp53+f7m7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cmn0kQr5RZkwu3OBSVRZYz2gJjemGd6kmyKJxRvo6nPIDzA8Ffx9ydKQZrnpHP8vSnlq+SaUMtsDEJDSrUToLBzvhQIPSJFUt5qB1o45oENl6vpxnUpHZW3flyfmYhDUt9qA6PYCs5S17PEcJAiu8E31EJSxnjDVyOttq068cqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iXvz/Qgw; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iXvz/Qgw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763076382; x=1794612382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1eJzfArwxu3JiphqkvDogCOmP1q/IErMNdp53+f7m7E=;
  b=iXvz/QgwUkZfvdoZmPq7ww/8qvZ4KUdpIVQGstb+qrJTXhkRmRktOVY7
   hUF9YE/u9kwzfew7jwU40NZGZRHiBfCVypwh6IAcmkIxtpOhu1OisUJrK
   mwU87AlAfdS7HWNcNrHJTiny8Qv179XXLI6g/u8JKLqN46Ll9QwVqCM4S
   EF2wE7+L98xqaUuQubIoLDkzQSskZydXnUSHI2RQ2iS3N9mMh7c6NhkOb
   Htx0trzloEMD0GC/qXLXdfrGQW0BdqxqN/OuodWeCeQ0z/TG2IKtovbUp
   vW5KSYyDFSWqTrLJrVzXb/qGfRp73g6vkYHXnp2v6U0XQRSR9H89b6ZnM
   Q==;
X-CSE-ConnectionGUID: 0dnOzqIAQLeZuNCsqSJWwg==
X-CSE-MsgGUID: vznbRyfVS86rejokYQzZ4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65264368"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="65264368"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 15:26:21 -0800
X-CSE-ConnectionGUID: b5slbARTRP61fI4Qu3c5AA==
X-CSE-MsgGUID: UnhFYaVZRCusmeOkaI1KpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="188914600"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Nov 2025 15:26:20 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJghl-0005yx-3C;
	Thu, 13 Nov 2025 23:26:17 +0000
Date: Fri, 14 Nov 2025 07:25:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:irq/drivers 11/35] drivers/irqchip/irq-qcom-mpm.c:441
 qcom_mpm_probe() warn: missing unwind goto?
Message-ID: <202511140712.l6v7GgP2-lkp@intel.com>
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
CC: x86@kernel.org
TO: Johan Hovold <johan@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Florian Fainelli <florian.fainelli@broadcom.com>
CC: Changhuang Liang <changhuang.liang@starfivetech.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/drivers
head:   1d787348123b34166ad2cccf12c9c00beb4ee3ae
commit: 1e3e330c07076a0582385bbea029c9cc918fa30d [11/35] irqchip: Pass platform device to platform drivers
:::::: branch date: 10 hours ago
:::::: commit date: 4 weeks ago
config: arm64-randconfig-r073-20251113 (https://download.01.org/0day-ci/archive/20251114/202511140712.l6v7GgP2-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 996639d6ebb86ff15a8c99b67f1c2e2117636ae7)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511140712.l6v7GgP2-lkp@intel.com/

smatch warnings:
drivers/irqchip/irq-qcom-mpm.c:441 qcom_mpm_probe() warn: missing unwind goto?

vim +441 drivers/irqchip/irq-qcom-mpm.c

a6199bb514d8a6 Shawn Guo         2022-03-08  322  
1e3e330c07076a Johan Hovold      2025-10-13  323  static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *parent)
a6199bb514d8a6 Shawn Guo         2022-03-08  324  {
1e3e330c07076a Johan Hovold      2025-10-13  325  	struct device_node *np = pdev->dev.of_node;
a6199bb514d8a6 Shawn Guo         2022-03-08  326  	struct device *dev = &pdev->dev;
a6199bb514d8a6 Shawn Guo         2022-03-08  327  	struct irq_domain *parent_domain;
a6199bb514d8a6 Shawn Guo         2022-03-08  328  	struct generic_pm_domain *genpd;
221b110d87c2d3 Konrad Dybcio     2023-11-27  329  	struct device_node *msgram_np;
a6199bb514d8a6 Shawn Guo         2022-03-08  330  	struct qcom_mpm_priv *priv;
a6199bb514d8a6 Shawn Guo         2022-03-08  331  	unsigned int pin_cnt;
221b110d87c2d3 Konrad Dybcio     2023-11-27  332  	struct resource res;
a6199bb514d8a6 Shawn Guo         2022-03-08  333  	int i, irq;
a6199bb514d8a6 Shawn Guo         2022-03-08  334  	int ret;
a6199bb514d8a6 Shawn Guo         2022-03-08  335  
a6199bb514d8a6 Shawn Guo         2022-03-08  336  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
a6199bb514d8a6 Shawn Guo         2022-03-08  337  	if (!priv)
a6199bb514d8a6 Shawn Guo         2022-03-08  338  		return -ENOMEM;
a6199bb514d8a6 Shawn Guo         2022-03-08  339  
a6199bb514d8a6 Shawn Guo         2022-03-08  340  	ret = of_property_read_u32(np, "qcom,mpm-pin-count", &pin_cnt);
a6199bb514d8a6 Shawn Guo         2022-03-08  341  	if (ret) {
a6199bb514d8a6 Shawn Guo         2022-03-08  342  		dev_err(dev, "failed to read qcom,mpm-pin-count: %d\n", ret);
a6199bb514d8a6 Shawn Guo         2022-03-08  343  		return ret;
a6199bb514d8a6 Shawn Guo         2022-03-08  344  	}
a6199bb514d8a6 Shawn Guo         2022-03-08  345  
a6199bb514d8a6 Shawn Guo         2022-03-08  346  	priv->reg_stride = DIV_ROUND_UP(pin_cnt, 32);
a6199bb514d8a6 Shawn Guo         2022-03-08  347  
a6199bb514d8a6 Shawn Guo         2022-03-08  348  	ret = of_property_count_u32_elems(np, "qcom,mpm-pin-map");
a6199bb514d8a6 Shawn Guo         2022-03-08  349  	if (ret < 0) {
a6199bb514d8a6 Shawn Guo         2022-03-08  350  		dev_err(dev, "failed to read qcom,mpm-pin-map: %d\n", ret);
a6199bb514d8a6 Shawn Guo         2022-03-08  351  		return ret;
a6199bb514d8a6 Shawn Guo         2022-03-08  352  	}
a6199bb514d8a6 Shawn Guo         2022-03-08  353  
a6199bb514d8a6 Shawn Guo         2022-03-08  354  	if (ret % 2) {
a6199bb514d8a6 Shawn Guo         2022-03-08  355  		dev_err(dev, "invalid qcom,mpm-pin-map\n");
a6199bb514d8a6 Shawn Guo         2022-03-08  356  		return -EINVAL;
a6199bb514d8a6 Shawn Guo         2022-03-08  357  	}
a6199bb514d8a6 Shawn Guo         2022-03-08  358  
a6199bb514d8a6 Shawn Guo         2022-03-08  359  	priv->map_cnt = ret / 2;
a6199bb514d8a6 Shawn Guo         2022-03-08  360  	priv->maps = devm_kcalloc(dev, priv->map_cnt, sizeof(*priv->maps),
a6199bb514d8a6 Shawn Guo         2022-03-08  361  				  GFP_KERNEL);
a6199bb514d8a6 Shawn Guo         2022-03-08  362  	if (!priv->maps)
a6199bb514d8a6 Shawn Guo         2022-03-08  363  		return -ENOMEM;
a6199bb514d8a6 Shawn Guo         2022-03-08  364  
a6199bb514d8a6 Shawn Guo         2022-03-08  365  	for (i = 0; i < priv->map_cnt; i++) {
a6199bb514d8a6 Shawn Guo         2022-03-08  366  		u32 pin, hwirq;
a6199bb514d8a6 Shawn Guo         2022-03-08  367  
a6199bb514d8a6 Shawn Guo         2022-03-08  368  		of_property_read_u32_index(np, "qcom,mpm-pin-map", i * 2, &pin);
a6199bb514d8a6 Shawn Guo         2022-03-08  369  		of_property_read_u32_index(np, "qcom,mpm-pin-map", i * 2 + 1, &hwirq);
a6199bb514d8a6 Shawn Guo         2022-03-08  370  
a6199bb514d8a6 Shawn Guo         2022-03-08  371  		if (gic_hwirq_is_mapped(priv->maps, i, hwirq)) {
a6199bb514d8a6 Shawn Guo         2022-03-08  372  			dev_warn(dev, "failed to map pin %d as GIC hwirq %d is already mapped\n",
a6199bb514d8a6 Shawn Guo         2022-03-08  373  				 pin, hwirq);
a6199bb514d8a6 Shawn Guo         2022-03-08  374  			continue;
a6199bb514d8a6 Shawn Guo         2022-03-08  375  		}
a6199bb514d8a6 Shawn Guo         2022-03-08  376  
a6199bb514d8a6 Shawn Guo         2022-03-08  377  		priv->maps[i].pin = pin;
a6199bb514d8a6 Shawn Guo         2022-03-08  378  		priv->maps[i].hwirq = hwirq;
a6199bb514d8a6 Shawn Guo         2022-03-08  379  	}
a6199bb514d8a6 Shawn Guo         2022-03-08  380  
a6199bb514d8a6 Shawn Guo         2022-03-08  381  	raw_spin_lock_init(&priv->lock);
a6199bb514d8a6 Shawn Guo         2022-03-08  382  
221b110d87c2d3 Konrad Dybcio     2023-11-27  383  	/* If we have a handle to an RPM message ram partition, use it. */
221b110d87c2d3 Konrad Dybcio     2023-11-27  384  	msgram_np = of_parse_phandle(np, "qcom,rpm-msg-ram", 0);
221b110d87c2d3 Konrad Dybcio     2023-11-27  385  	if (msgram_np) {
221b110d87c2d3 Konrad Dybcio     2023-11-27  386  		ret = of_address_to_resource(msgram_np, 0, &res);
221b110d87c2d3 Konrad Dybcio     2023-11-27  387  		if (ret) {
221b110d87c2d3 Konrad Dybcio     2023-11-27  388  			of_node_put(msgram_np);
221b110d87c2d3 Konrad Dybcio     2023-11-27  389  			return ret;
221b110d87c2d3 Konrad Dybcio     2023-11-27  390  		}
221b110d87c2d3 Konrad Dybcio     2023-11-27  391  
221b110d87c2d3 Konrad Dybcio     2023-11-27  392  		/* Don't use devm_ioremap_resource, as we're accessing a shared region. */
221b110d87c2d3 Konrad Dybcio     2023-11-27  393  		priv->base = devm_ioremap(dev, res.start, resource_size(&res));
221b110d87c2d3 Konrad Dybcio     2023-11-27  394  		of_node_put(msgram_np);
8ad032cc8c499a Dan Carpenter     2024-02-01  395  		if (!priv->base)
8ad032cc8c499a Dan Carpenter     2024-02-01  396  			return -ENOMEM;
221b110d87c2d3 Konrad Dybcio     2023-11-27  397  	} else {
221b110d87c2d3 Konrad Dybcio     2023-11-27  398  		/* Otherwise, fall back to simple MMIO. */
a6199bb514d8a6 Shawn Guo         2022-03-08  399  		priv->base = devm_platform_ioremap_resource(pdev, 0);
76ff614a79152c Yang Yingliang    2022-03-16  400  		if (IS_ERR(priv->base))
a6199bb514d8a6 Shawn Guo         2022-03-08  401  			return PTR_ERR(priv->base);
221b110d87c2d3 Konrad Dybcio     2023-11-27  402  	}
a6199bb514d8a6 Shawn Guo         2022-03-08  403  
a6199bb514d8a6 Shawn Guo         2022-03-08  404  	for (i = 0; i < priv->reg_stride; i++) {
a6199bb514d8a6 Shawn Guo         2022-03-08  405  		qcom_mpm_write(priv, MPM_REG_ENABLE, i, 0);
a6199bb514d8a6 Shawn Guo         2022-03-08  406  		qcom_mpm_write(priv, MPM_REG_FALLING_EDGE, i, 0);
a6199bb514d8a6 Shawn Guo         2022-03-08  407  		qcom_mpm_write(priv, MPM_REG_RISING_EDGE, i, 0);
a6199bb514d8a6 Shawn Guo         2022-03-08  408  		qcom_mpm_write(priv, MPM_REG_POLARITY, i, 0);
a6199bb514d8a6 Shawn Guo         2022-03-08  409  		qcom_mpm_write(priv, MPM_REG_STATUS, i, 0);
a6199bb514d8a6 Shawn Guo         2022-03-08  410  	}
a6199bb514d8a6 Shawn Guo         2022-03-08  411  
a6199bb514d8a6 Shawn Guo         2022-03-08  412  	irq = platform_get_irq(pdev, 0);
a6199bb514d8a6 Shawn Guo         2022-03-08  413  	if (irq < 0)
a6199bb514d8a6 Shawn Guo         2022-03-08  414  		return irq;
a6199bb514d8a6 Shawn Guo         2022-03-08  415  
a6199bb514d8a6 Shawn Guo         2022-03-08  416  	genpd = &priv->genpd;
a6199bb514d8a6 Shawn Guo         2022-03-08  417  	genpd->flags = GENPD_FLAG_IRQ_SAFE;
a6199bb514d8a6 Shawn Guo         2022-03-08  418  	genpd->power_off = mpm_pd_power_off;
a6199bb514d8a6 Shawn Guo         2022-03-08  419  
a6199bb514d8a6 Shawn Guo         2022-03-08  420  	genpd->name = devm_kasprintf(dev, GFP_KERNEL, "%s", dev_name(dev));
a6199bb514d8a6 Shawn Guo         2022-03-08  421  	if (!genpd->name)
a6199bb514d8a6 Shawn Guo         2022-03-08  422  		return -ENOMEM;
a6199bb514d8a6 Shawn Guo         2022-03-08  423  
a6199bb514d8a6 Shawn Guo         2022-03-08  424  	ret = pm_genpd_init(genpd, NULL, false);
a6199bb514d8a6 Shawn Guo         2022-03-08  425  	if (ret) {
a6199bb514d8a6 Shawn Guo         2022-03-08  426  		dev_err(dev, "failed to init genpd: %d\n", ret);
a6199bb514d8a6 Shawn Guo         2022-03-08  427  		return ret;
a6199bb514d8a6 Shawn Guo         2022-03-08  428  	}
a6199bb514d8a6 Shawn Guo         2022-03-08  429  
a6199bb514d8a6 Shawn Guo         2022-03-08  430  	ret = of_genpd_add_provider_simple(np, genpd);
a6199bb514d8a6 Shawn Guo         2022-03-08  431  	if (ret) {
a6199bb514d8a6 Shawn Guo         2022-03-08  432  		dev_err(dev, "failed to add genpd provider: %d\n", ret);
a6199bb514d8a6 Shawn Guo         2022-03-08  433  		goto remove_genpd;
a6199bb514d8a6 Shawn Guo         2022-03-08  434  	}
a6199bb514d8a6 Shawn Guo         2022-03-08  435  
a6199bb514d8a6 Shawn Guo         2022-03-08  436  	priv->mbox_client.dev = dev;
a6199bb514d8a6 Shawn Guo         2022-03-08  437  	priv->mbox_chan = mbox_request_channel(&priv->mbox_client, 0);
a6199bb514d8a6 Shawn Guo         2022-03-08  438  	if (IS_ERR(priv->mbox_chan)) {
a6199bb514d8a6 Shawn Guo         2022-03-08  439  		ret = PTR_ERR(priv->mbox_chan);
a6199bb514d8a6 Shawn Guo         2022-03-08  440  		dev_err(dev, "failed to acquire IPC channel: %d\n", ret);
a6199bb514d8a6 Shawn Guo         2022-03-08 @441  		return ret;
a6199bb514d8a6 Shawn Guo         2022-03-08  442  	}
a6199bb514d8a6 Shawn Guo         2022-03-08  443  
a6199bb514d8a6 Shawn Guo         2022-03-08  444  	parent_domain = irq_find_host(parent);
a6199bb514d8a6 Shawn Guo         2022-03-08  445  	if (!parent_domain) {
a6199bb514d8a6 Shawn Guo         2022-03-08  446  		dev_err(dev, "failed to find MPM parent domain\n");
a6199bb514d8a6 Shawn Guo         2022-03-08  447  		ret = -ENXIO;
a6199bb514d8a6 Shawn Guo         2022-03-08  448  		goto free_mbox;
a6199bb514d8a6 Shawn Guo         2022-03-08  449  	}
a6199bb514d8a6 Shawn Guo         2022-03-08  450  
a6199bb514d8a6 Shawn Guo         2022-03-08  451  	priv->domain = irq_domain_create_hierarchy(parent_domain,
a6199bb514d8a6 Shawn Guo         2022-03-08  452  				IRQ_DOMAIN_FLAG_QCOM_MPM_WAKEUP, pin_cnt,
87228532e7e968 Jiri Slaby (SUSE  2025-03-19  453) 				of_fwnode_handle(np), &qcom_mpm_ops, priv);
a6199bb514d8a6 Shawn Guo         2022-03-08  454  	if (!priv->domain) {
a6199bb514d8a6 Shawn Guo         2022-03-08  455  		dev_err(dev, "failed to create MPM domain\n");
a6199bb514d8a6 Shawn Guo         2022-03-08  456  		ret = -ENOMEM;
a6199bb514d8a6 Shawn Guo         2022-03-08  457  		goto free_mbox;
a6199bb514d8a6 Shawn Guo         2022-03-08  458  	}
a6199bb514d8a6 Shawn Guo         2022-03-08  459  
a6199bb514d8a6 Shawn Guo         2022-03-08  460  	irq_domain_update_bus_token(priv->domain, DOMAIN_BUS_WAKEUP);
a6199bb514d8a6 Shawn Guo         2022-03-08  461  
a6199bb514d8a6 Shawn Guo         2022-03-08  462  	ret = devm_request_irq(dev, irq, qcom_mpm_handler, IRQF_NO_SUSPEND,
a6199bb514d8a6 Shawn Guo         2022-03-08  463  			       "qcom_mpm", priv);
a6199bb514d8a6 Shawn Guo         2022-03-08  464  	if (ret) {
a6199bb514d8a6 Shawn Guo         2022-03-08  465  		dev_err(dev, "failed to request irq: %d\n", ret);
a6199bb514d8a6 Shawn Guo         2022-03-08  466  		goto remove_domain;
a6199bb514d8a6 Shawn Guo         2022-03-08  467  	}
a6199bb514d8a6 Shawn Guo         2022-03-08  468  
a6199bb514d8a6 Shawn Guo         2022-03-08  469  	return 0;
a6199bb514d8a6 Shawn Guo         2022-03-08  470  
a6199bb514d8a6 Shawn Guo         2022-03-08  471  remove_domain:
a6199bb514d8a6 Shawn Guo         2022-03-08  472  	irq_domain_remove(priv->domain);
a6199bb514d8a6 Shawn Guo         2022-03-08  473  free_mbox:
a6199bb514d8a6 Shawn Guo         2022-03-08  474  	mbox_free_channel(priv->mbox_chan);
a6199bb514d8a6 Shawn Guo         2022-03-08  475  remove_genpd:
a6199bb514d8a6 Shawn Guo         2022-03-08  476  	pm_genpd_remove(genpd);
a6199bb514d8a6 Shawn Guo         2022-03-08  477  	return ret;
a6199bb514d8a6 Shawn Guo         2022-03-08  478  }
a6199bb514d8a6 Shawn Guo         2022-03-08  479  

:::::: The code at line 441 was first introduced by commit
:::::: a6199bb514d8a63f61c2a22c1f912376e14d0fb2 irqchip: Add Qualcomm MPM controller driver

:::::: TO: Shawn Guo <shawn.guo@linaro.org>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
