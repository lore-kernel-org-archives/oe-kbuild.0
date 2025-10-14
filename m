Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915CC3101C8
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Oct 2025 08:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760431350; cv=none; b=kEHNwqwbupZlAI8e+epYjlPbfQ3HsznW13uLbJtvO51cLOTtN1QM8jO2qhRPalZnljX6HN1YY+eBkj+VgCrQwjPrRze3kHNrcz6D7JEyc/QMK8qmABiZGfI1+fwlAAf5ABdWR5+sX+OpjsWzCNZ4umRHFtjyZHvI2PFclYYIPKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760431350; c=relaxed/simple;
	bh=HVI9WkSGPWOkAXQUy/ASJnp79EZmelndScNQlQVMQvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=WwqyzVeQfJkAk3zaVwkJYH6NY9juMfD/Emz2r0tddVv8DtRzK/KKPNLxwvUmGdsrRrwWVSHTbdgSmbqodCTBFYQNdP67idCpMO85og+Zyp02utNAHaQkhXTv0dTrMZUuHTVST38tKAvl9oM6MGXPSa4pRW0DzDJSzugm8bXIll8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wNKWSGmB; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wNKWSGmB"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e34052bb7so59871315e9.2
        for <oe-kbuild@lists.linux.dev>; Tue, 14 Oct 2025 01:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760431347; x=1761036147; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bux6a4GJjBSEbuQlF9lC1lsY4+VsrC6xtyeGzyjuopE=;
        b=wNKWSGmBfW9VuvMh3d5p30jwM1Yqq4dSi8TpqcpIyW3eXvk4uYvlMALrkJ17r4xdpT
         3B8FQjafmC4IVXY0nj6agmbAS9+X/6MoXbBKm94iCS3jnjvrZoEzolCGE/M1ZMr9LJft
         aU/6Gf9bmEVtlCefHqS33plRQj+mMoH0ZRwrSh34M/JBgoTQynwDZqjtzLJ45v03pOfu
         nPZiV3qilpDJTImoiY91xNYnHWO8978FlTd24wxJsJz9neaIS7fDvWgU4zwIhi6B6fGp
         o+byHaTA3H/9fuRD9brc3DuT32Ry3o24GZydpdKplHVYXEwlk/3CI29UKCpmUuiHigLp
         QH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760431347; x=1761036147;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bux6a4GJjBSEbuQlF9lC1lsY4+VsrC6xtyeGzyjuopE=;
        b=mczpDW8HTv32YzCOlRTx0v/I6fsQgWh+7ZfeBJ2uBZDbEZ6k7DXKUgKyUUeiH5Iuj1
         UvhecybkAB72C1Fnu/9KjQnlkKD9S29d0syBbyOmzEpXEk8aqS1QZ5x2jdL1DWyGp2FG
         P+J/l6DAuRkS1McfmTPTmUQvGRuBBX4ISHXdMO9fpYQtBNoMMVcmJxZ2Dk5s74vINazz
         aDP+tY+6kb20gb6Suk9dZgsQNz4Wrrc+lBZxsCmQJXWjnmXuxSyNd0BRBrbV7KN6Go09
         9/HIejKxKjFw8ojlTF+cTxwjaBJckmz7jNY1Wqs4LunfnlfnHyIno34QbuBTrgEJyG8Q
         OoaQ==
X-Gm-Message-State: AOJu0YwrBU+YRHQWHxTINerXDIHJMVDUg8J9vc+auLQ11QDP44A3f8+J
	v+UDVslVnOju4SJ7foEbLuOe/X2oluFGgUQ05b0kSJbczIO2JY6obN0GW5jWuqRD3p+4i7+ToBE
	d0l5m
X-Gm-Gg: ASbGncs+sn+IVtMNVv1uFpOXmyL0eOURwKRsPOhkzEMbUawi9vG/Zwl6n2nDj2YW6sQ
	Eayvq487mhET4gdmofsWmtGp6hbkaybLPIxEjRPKQ3b87tFJIAZJa4EFVAPQdGXolfPs6yZpWnh
	hYO5HwIe7lMbOZzhGuWdL1Bsnr6jma8Z2mrP4+o5PJThGw3MwSjczwntvWjEHlZLBm+dTTcq1Ft
	JZc/O0gYlF1zrGIXKtwgTMM8IPseBly4fPz7BLaGkTRP0C9T/JoUe+Csos0lbAPWDc56VX1l2XW
	pvHGyEc5yF4ieCr7C+9LX0gYxqxkTNth9TMN7vg4B6gAVV6prnAC5iQoLQgd99TfpdQ4izvX0B8
	71vmBg48mTm1iACziUnQfQ7pg82gDP0Wmn+gmkjY0qPtAQgh8uxreZaB4gxdR+u/hiLiO0kP6
X-Google-Smtp-Source: AGHT+IEPeQ80dYAy/EoJvHRwS61zYc5L1iet9i9NnbknYK2xCI/PKnPoz8i4rHOQpXQTbmI6ft/ptQ==
X-Received: by 2002:a05:600c:c083:b0:46f:b32e:5292 with SMTP id 5b1f17b1804b1-46fb32e5338mr94133085e9.8.1760431346590;
        Tue, 14 Oct 2025 01:42:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46fb482b99fsm234828405e9.3.2025.10.14.01.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 01:42:26 -0700 (PDT)
Date: Tue, 14 Oct 2025 11:42:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, hehuan1@eswincomputing.com,
	ulf.hansson@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jszhang@kernel.org, adrian.hunter@intel.com,
	p.zabel@pengutronix.de, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	xuxiang@eswincomputing.com, luyulin@eswincomputing.com,
	dongxuyang@eswincomputing.com, zhangsenchuan@eswincomputing.com,
	weishangjuan@eswincomputing.com, lizhi2@eswincomputing.com,
	caohang@eswincomputing.com, hehuan1@eswincomputing.com
Subject: Re: [PATCH v4 2/2] mmc: sdhci-of-dwcmshc: Add support for Eswin
 EIC7700
Message-ID: <202510131636.lJ5QxMpK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011111216.570-1-hehuan1@eswincomputing.com>
Message-ID: <20251014084222.2R8yiNJr1bilvC-m6KJ0dos3wYwX53SEDe0pKHhY3Uc@z>

Hi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/hehuan1-eswincomputing-com/dt-bindings-mmc-sdhci-of-dwcmshc-Add-Eswin-EIC7700/20251011-191312
base:   linus/master
patch link:    https://lore.kernel.org/r/20251011111216.570-1-hehuan1%40eswincomputing.com
patch subject: [PATCH v4 2/2] mmc: sdhci-of-dwcmshc: Add support for Eswin EIC7700
config: s390-randconfig-r073-20251013 (https://download.01.org/0day-ci/archive/20251013/202510131636.lJ5QxMpK-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510131636.lJ5QxMpK-lkp@intel.com/

New smatch warnings:
drivers/mmc/host/sdhci-of-dwcmshc.c:1547 eic7700_init() warn: missing error code? 'ret'

vim +/ret +1547 drivers/mmc/host/sdhci-of-dwcmshc.c

3c5c200f02eee8 Huan He 2025-10-11  1516  static int eic7700_init(struct device *dev, struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
3c5c200f02eee8 Huan He 2025-10-11  1517  {
3c5c200f02eee8 Huan He 2025-10-11  1518  	u32 emmc_caps = MMC_CAP2_NO_SD | MMC_CAP2_NO_SDIO;
3c5c200f02eee8 Huan He 2025-10-11  1519  	unsigned int val, hsp_int_status, hsp_pwr_ctrl;
3c5c200f02eee8 Huan He 2025-10-11  1520  	struct of_phandle_args args;
3c5c200f02eee8 Huan He 2025-10-11  1521  	struct eic7700_priv *priv;
3c5c200f02eee8 Huan He 2025-10-11  1522  	struct regmap *hsp_regmap;
3c5c200f02eee8 Huan He 2025-10-11  1523  	int ret;
3c5c200f02eee8 Huan He 2025-10-11  1524  
3c5c200f02eee8 Huan He 2025-10-11  1525  	priv = devm_kzalloc(dev, sizeof(struct eic7700_priv), GFP_KERNEL);
3c5c200f02eee8 Huan He 2025-10-11  1526  	if (!priv)
3c5c200f02eee8 Huan He 2025-10-11  1527  		return -ENOMEM;
3c5c200f02eee8 Huan He 2025-10-11  1528  
3c5c200f02eee8 Huan He 2025-10-11  1529  	dwc_priv->priv = priv;
3c5c200f02eee8 Huan He 2025-10-11  1530  
3c5c200f02eee8 Huan He 2025-10-11  1531  	ret = sdhci_eic7700_reset_init(dev, dwc_priv->priv);
3c5c200f02eee8 Huan He 2025-10-11  1532  	if (ret) {
3c5c200f02eee8 Huan He 2025-10-11  1533  		dev_err(dev, "failed to reset\n");
3c5c200f02eee8 Huan He 2025-10-11  1534  		return ret;
3c5c200f02eee8 Huan He 2025-10-11  1535  	}
3c5c200f02eee8 Huan He 2025-10-11  1536  
3c5c200f02eee8 Huan He 2025-10-11  1537  	ret = of_parse_phandle_with_fixed_args(dev->of_node, "eswin,hsp-sp-csr", 2, 0, &args);
3c5c200f02eee8 Huan He 2025-10-11  1538  	if (ret) {
3c5c200f02eee8 Huan He 2025-10-11  1539  		dev_err(dev, "Fail to parse 'eswin,hsp-sp-csr' phandle (%d)\n", ret);
3c5c200f02eee8 Huan He 2025-10-11  1540  		return ret;
3c5c200f02eee8 Huan He 2025-10-11  1541  	}
3c5c200f02eee8 Huan He 2025-10-11  1542  
3c5c200f02eee8 Huan He 2025-10-11  1543  	hsp_regmap = syscon_node_to_regmap(args.np);
3c5c200f02eee8 Huan He 2025-10-11  1544  	if (IS_ERR(hsp_regmap)) {
3c5c200f02eee8 Huan He 2025-10-11  1545  		dev_err(dev, "Failed to get regmap for 'eswin,hsp-sp-csr'\n");
3c5c200f02eee8 Huan He 2025-10-11  1546  		of_node_put(args.np);
3c5c200f02eee8 Huan He 2025-10-11 @1547  		return ret;

return PTR_ERR(hsp_regmap);

3c5c200f02eee8 Huan He 2025-10-11  1548  	}
3c5c200f02eee8 Huan He 2025-10-11  1549  	hsp_int_status = args.args[0];
3c5c200f02eee8 Huan He 2025-10-11  1550  	hsp_pwr_ctrl = args.args[1];
3c5c200f02eee8 Huan He 2025-10-11  1551  	of_node_put(args.np);
3c5c200f02eee8 Huan He 2025-10-11  1552  	/*
3c5c200f02eee8 Huan He 2025-10-11  1553  	 * Assert clock stability: write EIC7700_INT_CLK_STABLE to hsp_int_status.
3c5c200f02eee8 Huan He 2025-10-11  1554  	 * This signals to the eMMC controller that platform clocks (card, ACLK,
3c5c200f02eee8 Huan He 2025-10-11  1555  	 * BCLK, TMCLK) are enabled and stable.
3c5c200f02eee8 Huan He 2025-10-11  1556  	 */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

