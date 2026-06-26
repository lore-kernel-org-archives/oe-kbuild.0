Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4F73EBF33
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Jun 2026 09:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782467392; cv=none; b=ghE4cbtCLRYS9IU0mpB5tRsOrjCqxqLcvUA1Q/naW7T1I37/TwWgxnGl6LxvSn8F5W9MiJN8tIqoVbuQ5VyARAbq06vA1nRpQBzc7kabP/DwWVcQHgafjoLrjLy4d+FX21xkVHpLhiXF0pb3w1U/smsCGzpdvEu6lcgAeXuEjiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782467392; c=relaxed/simple;
	bh=YsXGRe6LmzqkSqYkeyWlm2Y3xPbHNVDJTIhKVXxq1wc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WoQbNUS8UrbGFLAGrXGdJCra1KUki09DpH0TvTnDsfFvP1OjYVxfGA/j1FJr6DY/IbbAZaIdaPJDyaLOBfYmbRckXB2rRkZX4HF67NCoxdXWQIf1cE1qZ2ybmZ43twhEMjiegbKmp6LU+GP7nt73p3ZJYb6UMaebmUEQPxYQ/Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXqPIvuG; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXqPIvuG"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-69ec2ebec61so489705eaf.3
        for <oe-kbuild@lists.linux.dev>; Fri, 26 Jun 2026 02:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782467390; x=1783072190; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nNulRjoXpig6R94XFBjUYxwXXbGIvQ35c5LNaqA2qds=;
        b=mXqPIvuGuh1TKhMauAUZxKGS97HOQ2ZDpWNgxJN/p0kfF1a2odweXcFfC7QLTTQhzz
         cMH1BZFU9PgHMWscb1WGSqOFAjQn03cxBuY5deFo65/B3Wk8BGTVe36i1+bWAizgSKWW
         dZ5K7UVWp8IAVIPP3wcBhC9atKh2N8HKb4VYi/+HDLVMjERSeTAHUY4vRAXHsuO8rK0x
         kwmkZzMjYJTixi124DT4MaNOwoLU7wDkRBwIMaJ8gUHbuxuO26uPY64KCkekg6zyxhJl
         YFv23nND/nJOramuDpuUdLi/iOJEpbQ9XzWAHcpwolMN/O0DqxtGAOvRI7FxUl9TIFb+
         VFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782467390; x=1783072190;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nNulRjoXpig6R94XFBjUYxwXXbGIvQ35c5LNaqA2qds=;
        b=Ea2Yyc2jN4Dm5IvodcGp+Bq82mySOtH2bjWBeJfeQa/OqtLgEIB/XYZjHFgB+2lTM7
         mSJzZrew/vw+8jBB4nuq7apmnEjGVSqCPsHqu7HZQxD8/LfqCeeZ855sPBRHXWvYiLNH
         tqE1VZfq38c3wFq9RiK/Rx/fBKRoRKyUYZ/OahNPXGlZBfwR0fEX1vOGAQZKjnFF78ZM
         2U1NsZj6NCIkZz6My0JLCIB2C5+gBFKgP5PAb297OdZeQxRnEgf+DOH0AAUlEcdSWQm8
         5b76q4nTFRDYZSGICmE5skbbK3r+eZGDAXQbvX6CBWQxoZIY9TRkX27D1uZJ8wC5a6sV
         +nRQ==
X-Gm-Message-State: AOJu0Yy2Ct2AOv0NtUjv+eSlAu1A0yhpzN60q8XEkAXg68cKWGLFDzxH
	7tzfV4s3A3k2RHAH9SIpgGgrdzKBYnULPFbFect5PMf8Pviu9eSCA0kaeE3eddMm
X-Gm-Gg: AfdE7cnLnf6mk7gbw1SkZzVq89Uw6wubT9IdPu5RqVtR2WK0EVdhHrZYY+VePsH2kle
	GXPTeu9TlHvaKFwnU4Q0tpYRDjq01riQ9+DvM8c0zSnTVohbxbp2fUODfuM/6R3ZjIq08c8315E
	AIC+DLHITiCnJT3pl0bsEn4qSRaa3Uwu6xLebV1iJKSy9OcUVH5GON7fmhl3sFjQRUQP2GIxKrT
	S7EGBsOB3hSt/A6JLZbIotM/yiUPfGaHKSiEFjnLvR/ipyWKzOv7HD4onlTTAbBYfJ6blImOrtG
	rmI/7jB8xErGc1TgxJ5/JDQjdKvg3hRagIXg6UVnfKS5t4TxVeBDm7rLrtPC4Dy0IOVZgwqhoNt
	jeh1jMw1c9oQOqG4N6uOYml84fD9EXZNLgkuR/w/M/oWrdVsGKxJXrluITMY5OQuciamGYVO+Qe
	o5TlvAAfAYc5mwXWU=
X-Received: by 2002:a05:6820:4b89:b0:6a1:1c1:dc84 with SMTP id 006d021491bc7-6a13517b8c1mr5157912eaf.5.1782467389844;
        Fri, 26 Jun 2026 02:49:49 -0700 (PDT)
Received: from localhost ([74.80.182.98])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a1414aba15sm1192005eaf.11.2026.06.26.02.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 02:49:49 -0700 (PDT)
Date: Fri, 26 Jun 2026 12:49:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Johan Hovold <johan@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: drivers/irqchip/irq-qcom-mpm.c:441 qcom_mpm_probe() warn: missing
 unwind goto?
Message-ID: <202606261634.IxvXG6n2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260626094942.eJ7SvpAU0zIYsB1zbVm_Rc0CfL8kEF9D_LSFJrWSs4c@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4edcdefd4083ae04b1a5656f4be6cd83ae919ef4
commit: 1e3e330c07076a0582385bbea029c9cc918fa30d irqchip: Pass platform device to platform drivers
config: arm64-randconfig-r072-20260626 (https://download.01.org/0day-ci/archive/20260626/202606261634.IxvXG6n2-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1e3e330c0707 ("irqchip: Pass platform device to platform drivers")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606261634.IxvXG6n2-lkp@intel.com/

smatch warnings:
drivers/irqchip/irq-qcom-mpm.c:441 qcom_mpm_probe() warn: missing unwind goto?

vim +441 drivers/irqchip/irq-qcom-mpm.c

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

goto remove_genpd?

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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

