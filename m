Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988F02101AA
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 06:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733727117; cv=none; b=VsJRs3ThgIo9RuTYS7nsTqU4RwBANDZ3Gq6glPLr/SiT9HNdXG7vcmU5XYebYv539QeeTNmSETj99aaSk/8zrNamHevEUWM9+9Id0yPhTyyM/1KzPaFiYhALQfKsS5ZKMzae/96gsFXTR1Lo1Pw8luLSmNWw9C8SjxBW8bUJjG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733727117; c=relaxed/simple;
	bh=gjWi9UfQlY8GyExiw+avsaQCZ/mlkQOOqNPCHaN/8Mc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=mEkJmC7qAFD7SnT/8+2sk1BNZhFYEAKhmb2ER29jGRTZj1e5A9DNC4ptOXxcC/YYMqQJUJjVFQPVCsazse6pSE9UVT2EikBUSASbwyZBmlWfSbZg6xXqs5ex69emkzu4/05D61IHoJtmiN9jSwmTHZqgaJJz3IzIecu0JVjXM0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pNg01lwq; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pNg01lwq"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434e8aa84f7so15029765e9.0
        for <oe-kbuild@lists.linux.dev>; Sun, 08 Dec 2024 22:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733727113; x=1734331913; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UU+rFrYBqU+HyZU9fxW7fsHHwD25k+Ib4ntmd1sD3tw=;
        b=pNg01lwqUFlMO6A9LWuyqvPoxgEie92HsWKRticCtFslBED4CFt7PYCaDR3LpX1m+4
         vXi8cjcTLOvKGFEv6DICW+/IdDzXJ36HWWe+Yo0I3FMO63eaA19c201Wl0iLrdApkbzm
         3Eas+eDCfc3bEgyZMk5XH67Vz524El48PwO5VU//+g+noeCuECm9VuvdQ17WE3hDEg/N
         exzcvc1h+8pek1ugVyJ6SS9TPUAC0xQPIRoEDB2AT9hH7VOHvuw1yL2M9BZTDYFi6pUP
         M3dzEiek1KkADtceWcedqFyppxRsn8qDrwi/z+1h57RdpPmEt6Ay2A3ao6w4bAeLisi+
         o6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733727113; x=1734331913;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UU+rFrYBqU+HyZU9fxW7fsHHwD25k+Ib4ntmd1sD3tw=;
        b=TaFXVYSsvQoNCyHPhFgOJMuKzZppJC2Y1KxjbPQTwOaIRMx6d9rijD2bCHtPW0v9L3
         pFjUfN1xLORA2hehSioHHJulpCMAv/B2dZLrCkkqSq8hoAb0qdllALxHpm5mU0l+knd1
         uQc8B4x0jlx3yAN1DtFyoJi5m68fyprFP0feKSnrOyprfAQd48rHlBOk6wLi0SFN6S4D
         qCoqrwFyGzKdPeO3Zi5s9CuzaWdU5ZbGmg7AD2w8cmy9bIuDdohe/7I65CfOvTfEzljV
         L26R3O6qFIdfLSl3JDat8BIskOEE2hnvNVundG2TpoFox3GnVCEDyMU+1KZoJ/+CBGQC
         YKiQ==
X-Gm-Message-State: AOJu0YxDhrtcrFKoAGTu+CLX7+1ymw1egvolvGu6+FN9PH+Gat4s9UG/
	l/LHQ8iWwDZmBR2ipCrisZVAOD+tTFsEkNmK1TXts4Mz4FMRNauWA2CX7YEZRp/JVOTG5aqv5TW
	A
X-Gm-Gg: ASbGncv72yeLt1dp9nZc7dZwEu0zN5vBS+yawQxnAjgEbSA4Cm0EzdXcYqhaFCnQZnU
	gfq9ckYHFsPIyr6X+k+lcKxl9Kc9cizG9yyNCW6rhMrUlR02oLb/or0Agk1VFQZ1ons12b8AIJa
	8t+YbxGFEe98+1L5j4aTK1W0fwgSisx1M9cNwO9rZIQo8N8VVOb5j3ka9u62GSDaUFraIAJ6k94
	MkKUR43jW/Xjzkfj9LLkAwZMxv6AIixmQMleS8ptqT91DkNtUVJF6M=
X-Google-Smtp-Source: AGHT+IGEzc4vwHmaIfvTMIfIV37e15tsohqeHODjPaefoObT5Iz92AFnPqv8LysQYDOG0yI6+qlhwA==
X-Received: by 2002:a05:600c:3155:b0:431:52b7:a499 with SMTP id 5b1f17b1804b1-434dded67b1mr79239335e9.20.1733727112718;
        Sun, 08 Dec 2024 22:51:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434eb8f18fcsm72397395e9.24.2024.12.08.22.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 22:51:52 -0800 (PST)
Date: Mon, 9 Dec 2024 09:51:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Haylen Chu <heylenay@4d2.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v3 3/3] clk: spacemit: Add clock support for Spacemit K1
 SoC
Message-ID: <9a3f6975-d99d-430b-9a09-697638667e97@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126143125.9980-7-heylenay@4d2.org>

Hi Haylen,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Haylen-Chu/dt-bindings-clock-spacemit-Add-clock-controllers-of-Spacemit-K1-SoC/20241128-101248
base:   2d5404caa8c7bb5c4e0435f94b28834ae5456623
patch link:    https://lore.kernel.org/r/20241126143125.9980-7-heylenay%404d2.org
patch subject: [PATCH v3 3/3] clk: spacemit: Add clock support for Spacemit K1 SoC
config: arm64-randconfig-r073-20241207 (https://download.01.org/0day-ci/archive/20241207/202412072123.ne7GnRyJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412072123.ne7GnRyJ-lkp@intel.com/

smatch warnings:
drivers/clk/spacemit/ccu-k1.c:1686 k1_ccu_probe() error: uninitialized symbol 'lock_map'.

vim +/lock_map +1686 drivers/clk/spacemit/ccu-k1.c

e71e4621b06cd42 Haylen Chu 2024-11-26  1651  static int k1_ccu_probe(struct platform_device *pdev)
e71e4621b06cd42 Haylen Chu 2024-11-26  1652  {
e71e4621b06cd42 Haylen Chu 2024-11-26  1653  	const struct spacemit_ccu_data *data;
e71e4621b06cd42 Haylen Chu 2024-11-26  1654  	struct regmap *base_map, *lock_map;
e71e4621b06cd42 Haylen Chu 2024-11-26  1655  	struct device *dev = &pdev->dev;
e71e4621b06cd42 Haylen Chu 2024-11-26  1656  	struct spacemit_ccu_priv *priv;
e71e4621b06cd42 Haylen Chu 2024-11-26  1657  	struct device_node *parent;
e71e4621b06cd42 Haylen Chu 2024-11-26  1658  	int ret;
e71e4621b06cd42 Haylen Chu 2024-11-26  1659  
e71e4621b06cd42 Haylen Chu 2024-11-26  1660  	data = of_device_get_match_data(dev);
e71e4621b06cd42 Haylen Chu 2024-11-26  1661  	if (WARN_ON(!data))
e71e4621b06cd42 Haylen Chu 2024-11-26  1662  		return -EINVAL;
e71e4621b06cd42 Haylen Chu 2024-11-26  1663  
e71e4621b06cd42 Haylen Chu 2024-11-26  1664  	parent   = of_get_parent(dev->of_node);
e71e4621b06cd42 Haylen Chu 2024-11-26  1665  	base_map = syscon_node_to_regmap(parent);
e71e4621b06cd42 Haylen Chu 2024-11-26  1666  	of_node_put(parent);
e71e4621b06cd42 Haylen Chu 2024-11-26  1667  
e71e4621b06cd42 Haylen Chu 2024-11-26  1668  	if (IS_ERR(base_map))
e71e4621b06cd42 Haylen Chu 2024-11-26  1669  		return dev_err_probe(dev, PTR_ERR(base_map),
e71e4621b06cd42 Haylen Chu 2024-11-26  1670  				     "failed to get regmap\n");
e71e4621b06cd42 Haylen Chu 2024-11-26  1671  
e71e4621b06cd42 Haylen Chu 2024-11-26  1672  	if (data->need_pll_lock) {
e71e4621b06cd42 Haylen Chu 2024-11-26  1673  		lock_map = syscon_regmap_lookup_by_phandle(dev->of_node,
e71e4621b06cd42 Haylen Chu 2024-11-26  1674  							   "spacemit,mpmu");
e71e4621b06cd42 Haylen Chu 2024-11-26  1675  		if (IS_ERR(lock_map))
e71e4621b06cd42 Haylen Chu 2024-11-26  1676  			return dev_err_probe(dev, PTR_ERR(lock_map),
e71e4621b06cd42 Haylen Chu 2024-11-26  1677  					     "failed to get lock regmap\n");
e71e4621b06cd42 Haylen Chu 2024-11-26  1678  	}

lock_map not initialized on else path.

e71e4621b06cd42 Haylen Chu 2024-11-26  1679  
e71e4621b06cd42 Haylen Chu 2024-11-26  1680  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
e71e4621b06cd42 Haylen Chu 2024-11-26  1681  	if (!priv)
e71e4621b06cd42 Haylen Chu 2024-11-26  1682  		return -ENOMEM;
e71e4621b06cd42 Haylen Chu 2024-11-26  1683  
e71e4621b06cd42 Haylen Chu 2024-11-26  1684  	priv->data	= data;
e71e4621b06cd42 Haylen Chu 2024-11-26  1685  	priv->base	= base_map;
e71e4621b06cd42 Haylen Chu 2024-11-26 @1686  	priv->lock_base	= lock_map;
                                                                  ^^^^^^^^^

e71e4621b06cd42 Haylen Chu 2024-11-26  1687  
e71e4621b06cd42 Haylen Chu 2024-11-26  1688  	ret = spacemit_ccu_register(dev, priv);
e71e4621b06cd42 Haylen Chu 2024-11-26  1689  	if (ret)
e71e4621b06cd42 Haylen Chu 2024-11-26  1690  		return dev_err_probe(dev, ret, "failed to register clocks\n");
e71e4621b06cd42 Haylen Chu 2024-11-26  1691  
e71e4621b06cd42 Haylen Chu 2024-11-26  1692  	return 0;
e71e4621b06cd42 Haylen Chu 2024-11-26  1693  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

