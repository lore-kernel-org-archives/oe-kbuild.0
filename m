Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E4A30CD87
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 05:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768281010; cv=none; b=LnBXN8Evg30VwpTACW2UrCUlzFBczaRoTxR8QHtYFLotcSuNOOxpjYLLaQhvtjaF4O7h/YYXBOoaUsbD5l8UCg7e/fGDhsiypAFVSRrpFqzG1v3NlR6ms1Bfebj8hAl+h+toIE9WJQDB5YRSq4W4buYUcRYWCYXDqotynkzdf+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768281010; c=relaxed/simple;
	bh=Wjv6Zaz6XrT0tJfxu9I4tq4S2Pax+FQGOFWkpQzMz2k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bagEoQTeM1Gro6lP6kUXq9BFX6rp6kbBCed5XbgWhj40PVq5O+WlDE/C139akRjHKnFA15wiOXsNybeerheXlBUiJInkCO6O9gr+e4Oj5czIjBzYNmrL/yZLbiiZ5wO1LcITBxfBidzQhFAVfZk8O0M33EG9E1GSLW+PDn/5BZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iz0DorWF; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iz0DorWF"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-47d3ffb0f44so49251665e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 21:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768281007; x=1768885807; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ka9s37IOQpf1n4F84ka//EI6cLx2h6p9ldAIxcvSXSs=;
        b=iz0DorWFIJ/2Yy25c3x/FP4cP2EIvAuQM7MPebvlJYPfxzjhkgpMmmmA0nxl62pZPV
         xNdcbM+S9bk8t6pMLP7hZHRhdBvTY4+NYAJnY4/+J5HQFAgUrLc2gR9R8wGG/cWqS7n4
         T6RWUsGCdh5e48MmXVmYlC5XDFxnYvGlBNRjMNocdw/KwchIJ3CB7cB/cqhoH5UsbJc9
         GIPwj4t33p9vj9O9mlMPtyEdnLa3aNHKXN0cIMUQSwLpVMjGnTmxoKEllxkKwAWhZuGQ
         I6D6eGAQTjrkCv6wnphIZm5AUuyaH8cSnM0iLqXNPkoSYcXrJhZxiP7/7nB6qBCsx9mA
         snjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768281007; x=1768885807;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ka9s37IOQpf1n4F84ka//EI6cLx2h6p9ldAIxcvSXSs=;
        b=OHimG8cpWIFEFGVarrnUi0zhzxxUYyTLZPO6CorLvlGEGI9jdKN42yfXbWIrC0jQRN
         Y7TMvsVxRNqTQiHvvGMkWZGm+ZybpcIUaxWksd7fBHSVrfh9j/bViKy7HpV74fEMUAEP
         T/YuUh+VU05fyrBNorJSAP1ObIC+N9DNuZOrzxskDnQQkhKM3QaQEBXvtWTwmoJ3acyQ
         ZVWpQ6U7zP2iwfqIFMHCfZJoLoOowoQfarK9KxPR4aP9DsRC7oh1KyIrvrzyjrvKFoH9
         TaQdetR9fLTnPnKP9JMVPFKVhkZ7Lf9PKwIH4hsG74shWhRzU95Xr42qEBDRcZSgLAtk
         E23Q==
X-Gm-Message-State: AOJu0YyABp9G3NS0+xWVUJB+jnrCWknPQz6fpueeJFSZsR6MapPvMWkm
	KQmH9kY4G9F1HN/ffwl8WFL3Fxs2YMeq/RajEdDZNB8rid5xxnllDTCLs6moUbNofCvB/LtIceZ
	nHa2VMRw=
X-Gm-Gg: AY/fxX4RuTCgNiaatuhjksadSLq+IMMq4UD2u8roATxzVCCaIhYk6fnGcLkqMPOQkMk
	XMR/t5TzfbDO8MBGildh16thVnfmsf8YyDuY6a9cJ5VoeknIFAVmurlJDXyS3khJq2P/S8n2aXy
	APCfA6poN02CLM9lkRTvJslrXyECbizH8tNvWyB11WfCQnTO5qJRm4T9PjLK8qtLN4sJIkaYFF3
	1nbeks+osxa7YeCdYJqg/o18ec9s9x5bLZM+owoPkSphP5Gtf0UkaIBJrn4+UCjqK5zI4+uip2E
	5STGQwrj3vtRXBLXMim559yLUyTt/LjmjkzBRbgORKBBQ8FR5qw845XWb2Z3Boika3y0LC1dHmT
	1bW8nFGzcS7WctMD2JdHsHrxFPo9tsM1LMSWyjo2+p7oZLLTAAJsZs7GpiNwM4FH2QgHtrCiJER
	1PFH/477fTghheQNAh
X-Google-Smtp-Source: AGHT+IEyaRLJd9Y4u+qQUZuuxa9DXiE3wFCOSM338VWiA5DPbkRF7hTq5Cq55p5My4D4lkbA6XYZVQ==
X-Received: by 2002:a05:600c:a106:b0:47d:73a4:45a7 with SMTP id 5b1f17b1804b1-47d84b3badfmr218580905e9.24.1768281006753;
        Mon, 12 Jan 2026 21:10:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47eda5784e4sm6508885e9.18.2026.01.12.21.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 21:10:06 -0800 (PST)
Date: Tue, 13 Jan 2026 08:10:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/freescale/ucc_geth.c:1608 ugeth_mac_config()
 error: we previously assumed 'tbiphy' could be null (see line 1605)
Message-ID: <202601130843.rFGNXA5a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260113051003.Jzs56a-rPqd0MmAt2GUuYfTBCgjXnbuEDvzzUqalCnk@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: 53036aa8d03178a8d056a24a52a301ad290877d4 net: freescale: ucc_geth: phylink conversion
config: powerpc-randconfig-r072-20260113 (https://download.01.org/0day-ci/archive/20260113/202601130843.rFGNXA5a-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601130843.rFGNXA5a-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/freescale/ucc_geth.c:1608 ugeth_mac_config() error: we previously assumed 'tbiphy' could be null (see line 1605)

vim +/tbiphy +1608 drivers/net/ethernet/freescale/ucc_geth.c

53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1589  static void ugeth_mac_config(struct phylink_config *config, unsigned int mode,
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1590  			     const struct phylink_link_state *state)
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1591  {
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1592  	struct net_device *ndev = to_net_dev(config->dev);
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1593  	struct ucc_geth_private *ugeth = netdev_priv(ndev);
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1594  	struct ucc_geth_info *ug_info = ugeth->ug_info;
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1595  	u16 value;
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1596  
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1597  	if (state->interface == PHY_INTERFACE_MODE_TBI ||
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1598  	    state->interface == PHY_INTERFACE_MODE_RTBI) {
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1599  		struct phy_device *tbiphy;
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1600  
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1601  		if (!ug_info->tbi_node)
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1602  			pr_warn("TBI mode requires that the device tree specify a tbi-handle\n");
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1603  
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1604  		tbiphy = of_phy_find_device(ug_info->tbi_node);
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03 @1605  		if (!tbiphy)
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1606  			pr_warn("Could not get TBI device\n");

We may as well return here instead of crashing on the next line.

047584ce941080 drivers/net/ucc_geth.c                    Haiying Wang      2009-06-02  1607  
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03 @1608  		value = phy_read(tbiphy, ENET_TBI_MII_CR);
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1609  		value &= ~0x1000;	/* Turn off autonegotiation */
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1610  		phy_write(tbiphy, ENET_TBI_MII_CR, value);
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1611  
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1612  		put_device(&tbiphy->mdio.dev);
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1613  	}
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1614  
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1615  	if (phylink_autoneg_inband(mode)) {
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1616  		ug_info->aufc = 1;
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1617  
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1618  		init_flow_control_params(ug_info->aufc, 1, 1,
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1619  					 ug_info->pausePeriod,
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1620  					 ug_info->extensionField,
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1621  					 &ugeth->uccf->uf_regs->upsmr,
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1622  					 &ugeth->ug_regs->uempr,
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1623  					 &ugeth->ug_regs->maccfg1);
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1624  	}
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1625  }
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1626  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

