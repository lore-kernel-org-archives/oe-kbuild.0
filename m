Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ECE1714AF
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Sep 2024 07:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725262642; cv=none; b=YneRXYeQWZ330dmTcm7PvNfXl9NwQHCO9Ok+kN6YNnZ4Tj0u0TRWmXMDjcTfGp1IErx+n9ppjsP+hxK+72qu8kDiE8ELZDTi91bK08aT72QDSDerwdYemDfYT+HhY297GRplV+CsaWIR5vy1ar1DeNhIc43VjRnef3P0QNRtRes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725262642; c=relaxed/simple;
	bh=ZqV7LNsiVGHoUM5UGbtwqKTKpF3Q0UUwmwKyZ9B64k4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Ps9rIfvMpVeaEkkKVJnQOEid2qFP3B0kajwZFCYmWWDQtPGH+dRPrKGIkEIEDS4YODqDsbSCY1Ct9THyw7FzgKzTbiuf9M+4+J94C+xoXaq7mq+YpphFF0Y8yHf8u4GerI0MkOD6vTVP7rpICLoj2WfARa677JL22+Tllc/g7e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PUV/13zB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PUV/13zB"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42c2e50ec13so16060625e9.0
        for <oe-kbuild@lists.linux.dev>; Mon, 02 Sep 2024 00:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725262638; x=1725867438; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lFxf56tpsu9MCJOLHsalfoP4zZVv/tiIqwxHml+ydYU=;
        b=PUV/13zBkdnoqkS/XZUzhAV33gMcb3NOp3+QAYh3ZEqT7iqLa3VV+DmhmEAj6ZUVSB
         WUA1hMpTYJRxThsPLgXT3h43BEt+t+mcvbSGkjavVJp6r2LHfE9w52u2LpRkT0MGPUEi
         XQlZD47MjVfTFfV36iYMqupDonRquyyj78/dNuGCB5VSZg8l8L9nsT7dvDcLyWcoetOc
         p6rB2F6ki3d47lxoouAgdidO8k3T6PYifYCEiFEjT+mUGNlCyZykyQxmvCYiqKJjiUl+
         aweHwzN5aqI4PpSK42e4hYPJAmIAyB7b+ViI6snFTDeKY7meoNI/m9mc6qVQVmoyp4Gz
         7stQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725262638; x=1725867438;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFxf56tpsu9MCJOLHsalfoP4zZVv/tiIqwxHml+ydYU=;
        b=rNW91WwAph1i/eFO9msB0PM6xkxE4aEIUNM6WcTcVj0+ochioXjnCYmG6Ym7x4RZI5
         5Bh6VfiJ4VxHC+/hxjlW/szq4KSI/3CmEXGZrSTYDSiA1IZsE2Gk2ndN6sDwQzrAwTlU
         1DS2Jwl8JI5XyhVCe2Ihux8/1C5am0/9i6VyapRPqotRG005xnRf8lJadtSx6RyJT13O
         EKxIfxUpN0DWN5lKJweSqsHAUd4rOfFDg06Ul550OOYfNLIqBUNm2AETlysZT394smYQ
         DBjakGvZLHdGyRgmhqbKoFcMSibzJzTt9G92bUKgyfNClp9177QKh7UZofNHBAiHSZwY
         K8GA==
X-Gm-Message-State: AOJu0Yx4onvSuB1mzELkPuQzsci1nle2KjytK3pTizRAO1B1Aao0i5on
	K5jI3Zy7fsrtIO0Ik+UT65vFQT1BkakH6mJcaLNO4b+9A45gdHFxjEvRaoKTAQxNPm7ES+UbN0P
	XDN0=
X-Google-Smtp-Source: AGHT+IH3Qcwv2NC2E574s+f0osfse5E8+QD0KTABLXftqeISTl0ZTPFa2vr6Y/cwqXkJEIRkULQ/NQ==
X-Received: by 2002:a05:600c:1554:b0:428:18d9:9963 with SMTP id 5b1f17b1804b1-42bbb436e16mr71077435e9.22.1725262638228;
        Mon, 02 Sep 2024 00:37:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df7c5bsm128058675e9.23.2024.09.02.00.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 00:37:17 -0700 (PDT)
Date: Mon, 2 Sep 2024 10:37:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Lorenzo Bianconi <lorenzo@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	ansuelsmth@gmail.com, Lorenzo Bianconi <lorenzo@kernel.org>
Subject: Re: [PATCH 4/7] clk: en7523: introduce chip_scu regmap
Message-ID: <891de723-5e14-4540-8716-a465afd7a440@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240831-clk-en7581-syscon-v1-4-5c2683541068@kernel.org>

Hi Lorenzo,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/dt-bindings-clock-airoha-update-reg-mapping-for-EN7581-SoC/20240831-152135
base:   f0e992956eb617c8f16119944bfe101dea074147
patch link:    https://lore.kernel.org/r/20240831-clk-en7581-syscon-v1-4-5c2683541068%40kernel.org
patch subject: [PATCH 4/7] clk: en7523: introduce chip_scu regmap
config: nios2-randconfig-r072-20240902 (https://download.01.org/0day-ci/archive/20240902/202409021114.11d1W3PJ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409021114.11d1W3PJ-lkp@intel.com/

New smatch warnings:
drivers/clk/clk-en7523.c:471 en7581_register_clocks() error: uninitialized symbol 'hw'.
drivers/clk/clk-en7523.c:471 en7581_register_clocks() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/clk/clk-en7523.c:478 en7581_register_clocks() error: uninitialized symbol 'hw'.
drivers/clk/clk-en7523.c:478 en7581_register_clocks() warn: passing zero to 'PTR_ERR'

vim +/hw +471 drivers/clk/clk-en7523.c

f114fc7e44857f Lorenzo Bianconi 2024-08-31  459  static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
f114fc7e44857f Lorenzo Bianconi 2024-08-31  460  				   struct regmap *map, void __iomem *base)
f114fc7e44857f Lorenzo Bianconi 2024-08-31  461  {
f114fc7e44857f Lorenzo Bianconi 2024-08-31  462  	struct clk_hw *hw;
f114fc7e44857f Lorenzo Bianconi 2024-08-31  463  	u32 rate;
f114fc7e44857f Lorenzo Bianconi 2024-08-31  464  	int i;
f114fc7e44857f Lorenzo Bianconi 2024-08-31  465  
f114fc7e44857f Lorenzo Bianconi 2024-08-31  466  	for (i = 0; i < ARRAY_SIZE(en7523_base_clks); i++) {
f114fc7e44857f Lorenzo Bianconi 2024-08-31  467  		const struct en_clk_desc *desc = &en7523_base_clks[i];
f114fc7e44857f Lorenzo Bianconi 2024-08-31  468  		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
f114fc7e44857f Lorenzo Bianconi 2024-08-31  469  
f114fc7e44857f Lorenzo Bianconi 2024-08-31  470  		if (regmap_read(map, desc->base_reg, &val)) {
f114fc7e44857f Lorenzo Bianconi 2024-08-31 @471  			pr_err("Failed reading fixed clk rate %s: %ld\n",
f114fc7e44857f Lorenzo Bianconi 2024-08-31  472  			       desc->name, PTR_ERR(hw));
                                                                                                   ^^
Uninitialized

f114fc7e44857f Lorenzo Bianconi 2024-08-31  473  			continue;
f114fc7e44857f Lorenzo Bianconi 2024-08-31  474  		}
f114fc7e44857f Lorenzo Bianconi 2024-08-31  475  		rate = en7523_get_base_rate(desc, val);
f114fc7e44857f Lorenzo Bianconi 2024-08-31  476  
f114fc7e44857f Lorenzo Bianconi 2024-08-31  477  		if (regmap_read(map, reg, &val)) {
f114fc7e44857f Lorenzo Bianconi 2024-08-31  478  			pr_err("Failed reading fixed clk div %s: %ld\n",
f114fc7e44857f Lorenzo Bianconi 2024-08-31  479  			       desc->name, PTR_ERR(hw));
                                                                                                   ^^
Uniniitialized

f114fc7e44857f Lorenzo Bianconi 2024-08-31  480  			continue;
f114fc7e44857f Lorenzo Bianconi 2024-08-31  481  		}
f114fc7e44857f Lorenzo Bianconi 2024-08-31  482  		rate /= en7523_get_div(desc, val);
f114fc7e44857f Lorenzo Bianconi 2024-08-31  483  
f114fc7e44857f Lorenzo Bianconi 2024-08-31  484  		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
f114fc7e44857f Lorenzo Bianconi 2024-08-31  485  		if (IS_ERR(hw)) {
f114fc7e44857f Lorenzo Bianconi 2024-08-31  486  			pr_err("Failed to register clk %s: %ld\n",
f114fc7e44857f Lorenzo Bianconi 2024-08-31  487  			       desc->name, PTR_ERR(hw));
f114fc7e44857f Lorenzo Bianconi 2024-08-31  488  			continue;
f114fc7e44857f Lorenzo Bianconi 2024-08-31  489  		}
f114fc7e44857f Lorenzo Bianconi 2024-08-31  490  
f114fc7e44857f Lorenzo Bianconi 2024-08-31  491  		clk_data->hws[desc->id] = hw;
f114fc7e44857f Lorenzo Bianconi 2024-08-31  492  	}
f114fc7e44857f Lorenzo Bianconi 2024-08-31  493  
f114fc7e44857f Lorenzo Bianconi 2024-08-31  494  	hw = en7523_register_pcie_clk(dev, base);
f114fc7e44857f Lorenzo Bianconi 2024-08-31  495  	clk_data->hws[EN7523_CLK_PCIE] = hw;
f114fc7e44857f Lorenzo Bianconi 2024-08-31  496  
f114fc7e44857f Lorenzo Bianconi 2024-08-31  497  	clk_data->num = EN7523_NUM_CLOCKS;
f114fc7e44857f Lorenzo Bianconi 2024-08-31  498  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

