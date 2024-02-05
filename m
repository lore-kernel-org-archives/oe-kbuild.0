Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E8EC126
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Feb 2024 06:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707113179; cv=none; b=Wq4Oe9uD2MFNbZQnELHRlIHuItycLa2OTFlL0dz7c13eDvwgVyLVGQQDkaCP5H++wJtmQTqI7hPRVnTuBoSTTcmeUJIdTQyLhFDbBSPZI39DioqJtuqMBfsx5N2zKmWxNzHQ0Hzm55cvYr0OXeQ+ib45X3pqpCvWtMqVFj00ndw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707113179; c=relaxed/simple;
	bh=qvAVMLLmXw2oUlAqpItvkq5NyEVtnTac2eyLQojSOG0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h99EcVhzKPFH3zcFYg2VQwafxb/e9SSDSghNnGbNAbyUzmXa16mVQYUwg8eRfI2CHNaOaJ5dhupipH5F3S5XEhmXQX+j1ZYg9+74s8FcpP8BF7pKs2yipTovQry6ZiVPrz1a3UvnBjn7ixK94TupMu7o/QDTwTSm7BydJZ4GCZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mMC5Bbgk; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mMC5Bbgk"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a30e445602cso1052887866b.0
        for <oe-kbuild@lists.linux.dev>; Sun, 04 Feb 2024 22:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707113176; x=1707717976; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vMKn6dWnoFgLcMj3TcFkdrJlKUEbwjsU8LXWsXCupvw=;
        b=mMC5BbgkS9TE/O+MG2xs5PY2PQoP4RDEO19JDCJ9lodX25fotgjOmnN2xR8lcZFEgl
         9u/2DUKhk6s5nPxu4D77UJFXDksK0R0d9SVuisnSdwKw4naM6zhi7GfbBfMe3PhB+UZl
         LcI/oBYLi6I5MOMZ034mIzqT03FKXKqAy57wM6atlCNPMz4E0BcGeCrQhyOYeNOgzTXc
         xGqSYHlq02TnALDZwc8AUumhm5kWekYLQDEHbbPFKgj5wHpy3gS0NzrQUhzGL1IEwac0
         3T2Imj7253twy21t6LfT4j/eMBOS5AHbTOLdMyjuNuPQC8t3fNyzvwJWfyks1JsdVH22
         KJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707113176; x=1707717976;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vMKn6dWnoFgLcMj3TcFkdrJlKUEbwjsU8LXWsXCupvw=;
        b=EH5PCEFCSzm6KAiTZKjXZUwy/GeGNK0ke2N697sWLcoWW7wxFo7LfqD3oRX658lLF8
         bd+3svErqKus6QTEV0PUBSLuL+WVZv3/qE3GMpezjVmdDRlB+xMVT84PnAXTGPeaCTID
         nV8QXpqk8hHW/iBr5ekKd05dsYgONaaKPDIbL4BZMLmO2z3yXSLOAcQbSwWSpRI8jJtz
         PiPUXJM21RWzRxd/wxgc684hazBhW+GQhMWGFuU+tJ5EbCyegld5sLjgfzP/ZLlIegKp
         tR7Nd71mLiaa896ronq0N8xSy6kJ3/fO/497FH/L0bAiPA6bYtyyliX+Spcj5giNtJde
         6mpA==
X-Gm-Message-State: AOJu0Yw5sBnhi4XGLeWZPAFJDpvkXQ5dJJLaWmJV7YO5JT3EZPztnM4c
	MUIstwtdkucwtPSm0Igi5qcGBvm48oNhCa5A0Ljx1pqiadsvOtNaifboOIfWT/rFCQ8IISBlGzZ
	v
X-Google-Smtp-Source: AGHT+IEp38aXzEc4L48rpuG4ETebt5xuyCwi9M3kmyUU4Vx297plB/Ul5js6raSnRvFVOXfDgivILg==
X-Received: by 2002:a17:906:6849:b0:a35:3718:997c with SMTP id a9-20020a170906684900b00a353718997cmr4894669ejs.28.1707113175651;
        Sun, 04 Feb 2024 22:06:15 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUiQ1gp7A/J0hwKDI7+uWOZ9Fa338/7YBROBTsWcZSSLLcA0xNy7wwAtMvEM9N/OnltnIa3GhMuiiNVraZvVDmqOyF8WlJtCL5nDmjYUYIsVCfieRuKT3vqDNP/xiVAhwRZhnQF7nubjJTNLAtVRb5+I/Zqfe/hcNA5YFCdNTfLnnYCNfJ/4bmTEqHhCXA=
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id vo7-20020a170907a80700b00a36f9941d6dsm3845944ejc.112.2024.02.04.22.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 22:06:15 -0800 (PST)
Date: Mon, 5 Feb 2024 09:06:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:fix/sdw-jd 6/12] drivers/soundwire/intel.c:448
 intel_link_power_up() warn: inconsistent returns 'sdw->link_res->shim_lock'.
Message-ID: <17a8ab24-989d-438f-a219-8931a27565b6@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound fix/sdw-jd
head:   3e0ec7682118696556df190024c476ad3ce3909f
commit: bb96c1f7a330eab199937c37611f14ff579cd2f5 [6/12] soundwire: intel: add support for MeteorLake additional clocks
config: i386-randconfig-141-20240204 (https://download.01.org/0day-ci/archive/20240204/202402041508.xKhlqGcY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202402041508.xKhlqGcY-lkp@intel.com/

smatch warnings:
drivers/soundwire/intel.c:448 intel_link_power_up() warn: inconsistent returns 'sdw->link_res->shim_lock'.

vim +448 drivers/soundwire/intel.c

bc8729476a537f Pierre-Louis Bossart 2022-09-20  338  static int intel_link_power_up(struct sdw_intel *sdw)
bc8729476a537f Pierre-Louis Bossart 2022-09-20  339  {
bc8729476a537f Pierre-Louis Bossart 2022-09-20  340  	unsigned int link_id = sdw->instance;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  341  	void __iomem *shim = sdw->link_res->shim;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  342  	u32 *shim_mask = sdw->link_res->shim_mask;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  343  	struct sdw_bus *bus = &sdw->cdns.bus;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  344  	struct sdw_master_prop *prop = &bus->prop;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  345  	u32 spa_mask, cpa_mask;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  346  	u32 link_control;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  347  	int ret = 0;
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  348  	u32 clock_source;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  349  	u32 syncprd;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  350  	u32 sync_reg;
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  351  	bool lcap_mlcs;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  352  
bc8729476a537f Pierre-Louis Bossart 2022-09-20  353  	mutex_lock(sdw->link_res->shim_lock);
bc8729476a537f Pierre-Louis Bossart 2022-09-20  354  
bc8729476a537f Pierre-Louis Bossart 2022-09-20  355  	/*
bc8729476a537f Pierre-Louis Bossart 2022-09-20  356  	 * The hardware relies on an internal counter, typically 4kHz,
bc8729476a537f Pierre-Louis Bossart 2022-09-20  357  	 * to generate the SoundWire SSP - which defines a 'safe'
bc8729476a537f Pierre-Louis Bossart 2022-09-20  358  	 * synchronization point between commands and audio transport
bc8729476a537f Pierre-Louis Bossart 2022-09-20  359  	 * and allows for multi link synchronization. The SYNCPRD value
bc8729476a537f Pierre-Louis Bossart 2022-09-20  360  	 * is only dependent on the oscillator clock provided to
bc8729476a537f Pierre-Louis Bossart 2022-09-20  361  	 * the IP, so adjust based on _DSD properties reported in DSDT
bc8729476a537f Pierre-Louis Bossart 2022-09-20  362  	 * tables. The values reported are based on either 24MHz
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  363  	 * (CNL/CML) or 38.4 MHz (ICL/TGL+). On MeteorLake additional
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  364  	 * frequencies are available with the MLCS clock source selection.
bc8729476a537f Pierre-Louis Bossart 2022-09-20  365  	 */
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  366  	lcap_mlcs = intel_readl(shim, SDW_SHIM_LCAP) & SDW_SHIM_LCAP_MLCS_MASK;
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  367  
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  368  	if (prop->mclk_freq % 6000000) {
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  369  		if (prop->mclk_freq % 2400000) {
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  370  			if (lcap_mlcs) {
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  371  				syncprd = SDW_SHIM_SYNC_SYNCPRD_VAL_24_576;
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  372  				clock_source = SDW_SHIM_MLCS_CARDINAL_CLK;
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  373  			} else {
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  374  				dev_err(sdw->cdns.dev, "%s: invalid clock configuration, mclk %d lcap_mlcs %d\n",
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  375  					__func__, prop->mclk_freq, lcap_mlcs);
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  376  				return -EINVAL;

Needs to unlock before returning

bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  377  			}
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  378  		} else {
bc8729476a537f Pierre-Louis Bossart 2022-09-20  379  			syncprd = SDW_SHIM_SYNC_SYNCPRD_VAL_38_4;
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  380  			clock_source = SDW_SHIM_MLCS_XTAL_CLK;
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  381  		}
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  382  	} else {
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  383  		if (lcap_mlcs) {
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  384  			syncprd = SDW_SHIM_SYNC_SYNCPRD_VAL_96;
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  385  			clock_source = SDW_SHIM_MLCS_AUDIO_PLL_CLK;
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  386  		} else {
bc8729476a537f Pierre-Louis Bossart 2022-09-20  387  			syncprd = SDW_SHIM_SYNC_SYNCPRD_VAL_24;
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  388  			clock_source = SDW_SHIM_MLCS_XTAL_CLK;
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  389  		}
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  390  	}
bc8729476a537f Pierre-Louis Bossart 2022-09-20  391  
bc8729476a537f Pierre-Louis Bossart 2022-09-20  392  	if (!*shim_mask) {
bc8729476a537f Pierre-Louis Bossart 2022-09-20  393  		dev_dbg(sdw->cdns.dev, "powering up all links\n");
bc8729476a537f Pierre-Louis Bossart 2022-09-20  394  
bc8729476a537f Pierre-Louis Bossart 2022-09-20  395  		/* we first need to program the SyncPRD/CPU registers */
bc8729476a537f Pierre-Louis Bossart 2022-09-20  396  		dev_dbg(sdw->cdns.dev,
bc8729476a537f Pierre-Louis Bossart 2022-09-20  397  			"first link up, programming SYNCPRD\n");
bc8729476a537f Pierre-Louis Bossart 2022-09-20  398  
bc8729476a537f Pierre-Louis Bossart 2022-09-20  399  		/* set SyncPRD period */
bc8729476a537f Pierre-Louis Bossart 2022-09-20  400  		sync_reg = intel_readl(shim, SDW_SHIM_SYNC);
bc8729476a537f Pierre-Louis Bossart 2022-09-20  401  		u32p_replace_bits(&sync_reg, syncprd, SDW_SHIM_SYNC_SYNCPRD);
bc8729476a537f Pierre-Louis Bossart 2022-09-20  402  
bc8729476a537f Pierre-Louis Bossart 2022-09-20  403  		/* Set SyncCPU bit */
bc8729476a537f Pierre-Louis Bossart 2022-09-20  404  		sync_reg |= SDW_SHIM_SYNC_SYNCCPU;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  405  		intel_writel(shim, SDW_SHIM_SYNC, sync_reg);
bc8729476a537f Pierre-Louis Bossart 2022-09-20  406  
bc8729476a537f Pierre-Louis Bossart 2022-09-20  407  		/* Link power up sequence */
bc8729476a537f Pierre-Louis Bossart 2022-09-20  408  		link_control = intel_readl(shim, SDW_SHIM_LCTL);
bc8729476a537f Pierre-Louis Bossart 2022-09-20  409  
bc8729476a537f Pierre-Louis Bossart 2022-09-20  410  		/* only power-up enabled links */
bc8729476a537f Pierre-Louis Bossart 2022-09-20  411  		spa_mask = FIELD_PREP(SDW_SHIM_LCTL_SPA_MASK, sdw->link_res->link_mask);
bc8729476a537f Pierre-Louis Bossart 2022-09-20  412  		cpa_mask = FIELD_PREP(SDW_SHIM_LCTL_CPA_MASK, sdw->link_res->link_mask);
bc8729476a537f Pierre-Louis Bossart 2022-09-20  413  
bc8729476a537f Pierre-Louis Bossart 2022-09-20  414  		link_control |=  spa_mask;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  415  
bc8729476a537f Pierre-Louis Bossart 2022-09-20  416  		ret = intel_set_bit(shim, SDW_SHIM_LCTL, link_control, cpa_mask);
bc8729476a537f Pierre-Louis Bossart 2022-09-20  417  		if (ret < 0) {
bc8729476a537f Pierre-Louis Bossart 2022-09-20  418  			dev_err(sdw->cdns.dev, "Failed to power up link: %d\n", ret);
bc8729476a537f Pierre-Louis Bossart 2022-09-20  419  			goto out;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  420  		}
bc8729476a537f Pierre-Louis Bossart 2022-09-20  421  
bc8729476a537f Pierre-Louis Bossart 2022-09-20  422  		/* SyncCPU will change once link is active */
bc8729476a537f Pierre-Louis Bossart 2022-09-20  423  		ret = intel_wait_bit(shim, SDW_SHIM_SYNC,
bc8729476a537f Pierre-Louis Bossart 2022-09-20  424  				     SDW_SHIM_SYNC_SYNCCPU, 0);
bc8729476a537f Pierre-Louis Bossart 2022-09-20  425  		if (ret < 0) {
bc8729476a537f Pierre-Louis Bossart 2022-09-20  426  			dev_err(sdw->cdns.dev,
bc8729476a537f Pierre-Louis Bossart 2022-09-20  427  				"Failed to set SHIM_SYNC: %d\n", ret);
bc8729476a537f Pierre-Louis Bossart 2022-09-20  428  			goto out;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  429  		}
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  430  
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  431  		/* update link clock if needed */
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  432  		if (lcap_mlcs) {
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  433  			link_control = intel_readl(shim, SDW_SHIM_LCTL);
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  434  			u32p_replace_bits(&link_control, clock_source, SDW_SHIM_LCTL_MLCS_MASK);
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  435  			intel_writel(shim, SDW_SHIM_LCTL, link_control);
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  436  		}
bc8729476a537f Pierre-Louis Bossart 2022-09-20  437  	}
bc8729476a537f Pierre-Louis Bossart 2022-09-20  438  
bc8729476a537f Pierre-Louis Bossart 2022-09-20  439  	*shim_mask |= BIT(link_id);
bc8729476a537f Pierre-Louis Bossart 2022-09-20  440  
bc8729476a537f Pierre-Louis Bossart 2022-09-20  441  	sdw->cdns.link_up = true;
b81bcdb424d05a Pierre-Louis Bossart 2022-09-20  442  
b81bcdb424d05a Pierre-Louis Bossart 2022-09-20  443  	intel_shim_init(sdw);
b81bcdb424d05a Pierre-Louis Bossart 2022-09-20  444  
bc8729476a537f Pierre-Louis Bossart 2022-09-20  445  out:
bc8729476a537f Pierre-Louis Bossart 2022-09-20  446  	mutex_unlock(sdw->link_res->shim_lock);
bc8729476a537f Pierre-Louis Bossart 2022-09-20  447  
bc8729476a537f Pierre-Louis Bossart 2022-09-20 @448  	return ret;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  449  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

