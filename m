Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB4B3B19DB
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Mar 2026 07:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774511923; cv=none; b=BNkCaSUyPUksjwJnxCbFvPiStEfuTBb/GBCRJQkMOzzjZun3PL1ce137kNwctx3UDhqx04GGoJhKbvIWeXN2te9BrJuyYt7nwJyHXSZiI4WIhGofKxGaZVIEB4WoUUqe4YGWJdWcvpoSJCUWh1ZLczxLo5qkMp2+bQ8HM1xQPVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774511923; c=relaxed/simple;
	bh=b8cdI9ctw0j2dP+90IWDr2MJPXF9CdayQzz9i6A7qyU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=KGmzbc0410aQgYu1aaVcc9zERzTuPLqnK9hOv2VyeQuERs+9VX9pdsuMkDAFepf2tY1EzKzsE31t0nXiWl5Kdrj0MxCNVIy1iTyKDuv1uFQzl68Rkx0u2slCldNP526V2GmBHwxBawPFQ7g/GX5lCGa3Fzmuy1Lqqg1o9tJYE2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zgojk6Wr; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zgojk6Wr"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43b4f48c47cso458310f8f.0
        for <oe-kbuild@lists.linux.dev>; Thu, 26 Mar 2026 00:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774511919; x=1775116719; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hJidR7QlZb7c5WIdyj3iesak/Jfa6pt2GqscpVScNO0=;
        b=Zgojk6Wr59fzE9Y9N5wXqgfU/yuJ2KQhO0fNsx+hz5SXFTIOhNhbYppNDgzlz3vDDH
         5mo3TZsUVxXZn7Lss6r9ZWOJaa/pXXbR3Um/0+IFVlWSqFrTwQg+4l+8y0nNcjq8bSKO
         fli4gJ5k9DmYb8qWCruQodH+c8HEG2x9F52Yl515p9rJ9R676XQ5TQ+TvQEaNo13K9l0
         V+AvtDbMqiYv3G/bIzfztVj2reJKisjlb/83jyssPvRcI50RAM5PIiFOOgrNZP9i+gez
         o0SrbIRPUAbVIuaJfP1d3qDg2JgQHzem13/vSXVVMI80qYeByQhp35czVi2CC773XG+1
         vquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774511919; x=1775116719;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJidR7QlZb7c5WIdyj3iesak/Jfa6pt2GqscpVScNO0=;
        b=sVXqI/JU/4vbvv9py6MyhbwS7wT6ebnuRVUi4HpTpd+XwPRwoBT3cxVDdslJPimd+U
         QMEr0bBAN3wYgrRW1cRq36wAUdBCoqAHv/0BAud8yejeSjgHP893zM6NFateMEtpv7ky
         JN32ugdbKlGP4erp/eb5S0GzrUiaU6dmyIkFdNucVrjG+8jCjZOS4vCaZ7CGkwltN0P9
         HL7HavhtNlxxZxqNmzBD71dlR1DeQpOI2OdYVITA58b2KP9wfKubkN9zCemBLLPOXCjQ
         RiQ7rQfCW+81WtctrSK7qODeTTYtvQBCgYdRW34Y3wtmJpYspUmVAnz+HdL2ebKDg5B1
         dJdQ==
X-Gm-Message-State: AOJu0Yzucb3HLZVWdN6iFHVkdt4Rqyx56A0fe2YxtEVcD/HK+Xeqtw2G
	wSwRiMyUvhl76O6hSMk1xujebCEvU56aG82gjsczQPJjvAb8CFhwVaW0rz2oB3twLVM/SP2HWPO
	BOVGL
X-Gm-Gg: ATEYQzyiGUmc/YMCbqizpqpP4FSfCoy2jkcn+6w2qpYDMwYzR3NCuA8UfRnDLnmGpLf
	VrPHICFXHvz67dJRVXNY2afS04xumFUcVSU0vRfsclZfujxrPs7/387vn7/xzfYT4x5+R6KCRgH
	c3WnCh8Wm91Sgr8nvKTPxVpnOrdoSnm1avwyqkGMNR5+ebuhZPgpwWCyG1xqO4nTgQTYuvkxroD
	vWPhkOznZvJ6S5Wj81LM3rCaP+ZgTzmlWEIpL6NhNL/6gM1C23PcMJmgJA1xvmVnvouD7ovo2Qz
	2L+1UPWdosGrpg/IIH0M4OzK3/3d6DiAgLUb4G+LJKeQORFSR/wvskNiaR8uYsxORn5GdcCNKX3
	bSGhmz6L13dmRA/1tTwEoEZ0shWUONcsHxXmaVtunguQQRVJsWNBGtNerPqcFGUKX32t3RMWktg
	JAc2WTV/GR6xToZfE8OZ3FEqmfgTdE
X-Received: by 2002:a05:6000:438a:b0:43b:564d:c123 with SMTP id ffacd0b85a97d-43b8898d57amr9770384f8f.3.1774511918517;
        Thu, 26 Mar 2026 00:58:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e7111sm5918551f8f.37.2026.03.26.00.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 00:58:37 -0700 (PDT)
Date: Thu, 26 Mar 2026 10:58:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Chen-Yu Tsai <wenst@chromium.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Chen-Yu Tsai <wenst@chromium.org>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] clk: mediatek: Add mt8173-mfgtop driver
Message-ID: <202603261444.jANdMbNC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325071951.544031-3-wenst@chromium.org>
Message-ID: <20260326075827.pE7SYIQqTZZbJ4-KFrlnC-qWUGdJiPZ6UKKgeUj-f20@z>

Hi Chen-Yu,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/dt-bindings-clock-mediatek-Add-mt8173-mfgtop/20260325-202618
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20260325071951.544031-3-wenst%40chromium.org
patch subject: [PATCH v2 2/5] clk: mediatek: Add mt8173-mfgtop driver
config: csky-randconfig-r073-20260326 (https://download.01.org/0day-ci/archive/20260326/202603261444.jANdMbNC-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603261444.jANdMbNC-lkp@intel.com/

smatch warnings:
drivers/clk/mediatek/clk-mt8173-mfgtop.c:163 clk_mt8173_mfgtop_probe() warn: missing error code 'ret'

vim +/ret +163 drivers/clk/mediatek/clk-mt8173-mfgtop.c

edc2074329e271 Chen-Yu Tsai 2026-03-25  153  	ret = mtk_clk_register_gates(dev, node, mfg_clks, ARRAY_SIZE(mfg_clks),
edc2074329e271 Chen-Yu Tsai 2026-03-25  154  				     data->clk_data);
edc2074329e271 Chen-Yu Tsai 2026-03-25  155  	if (ret) {
edc2074329e271 Chen-Yu Tsai 2026-03-25  156  		dev_err_probe(dev, ret, "Failed to register clock gates\n");
edc2074329e271 Chen-Yu Tsai 2026-03-25  157  		goto put_pm_runtime;
edc2074329e271 Chen-Yu Tsai 2026-03-25  158  	}
edc2074329e271 Chen-Yu Tsai 2026-03-25  159  
edc2074329e271 Chen-Yu Tsai 2026-03-25  160  	data->clk_26m = clk_hw_get_clk(data->clk_data->hws[CLK_MFG_26M], "26m");
edc2074329e271 Chen-Yu Tsai 2026-03-25  161  	if (IS_ERR(data->clk_26m)) {
edc2074329e271 Chen-Yu Tsai 2026-03-25  162  		dev_err_probe(dev, PTR_ERR(data->clk_26m), "Failed to get 26 MHz clock\n");
edc2074329e271 Chen-Yu Tsai 2026-03-25 @163  		goto unregister_clks;

ret = dev_err_probe() or ret = PTR_ERR(data->clk_26m)?

edc2074329e271 Chen-Yu Tsai 2026-03-25  164  	}
edc2074329e271 Chen-Yu Tsai 2026-03-25  165  
edc2074329e271 Chen-Yu Tsai 2026-03-25  166  	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, data->clk_data);
edc2074329e271 Chen-Yu Tsai 2026-03-25  167  	if (ret) {
edc2074329e271 Chen-Yu Tsai 2026-03-25  168  		dev_err_probe(dev, ret, "Failed to add clk OF provider\n");
edc2074329e271 Chen-Yu Tsai 2026-03-25  169  		goto put_26m_clk;
edc2074329e271 Chen-Yu Tsai 2026-03-25  170  	}
edc2074329e271 Chen-Yu Tsai 2026-03-25  171  
edc2074329e271 Chen-Yu Tsai 2026-03-25  172  	data->genpd.name = "mfg-top";
edc2074329e271 Chen-Yu Tsai 2026-03-25  173  	data->genpd.power_on = clk_mt8173_mfgtop_power_on;
edc2074329e271 Chen-Yu Tsai 2026-03-25  174  	data->genpd.power_off = clk_mt8173_mfgtop_power_off;
edc2074329e271 Chen-Yu Tsai 2026-03-25  175  	ret = pm_genpd_init(&data->genpd, NULL, true);
edc2074329e271 Chen-Yu Tsai 2026-03-25  176  	if (ret) {
edc2074329e271 Chen-Yu Tsai 2026-03-25  177  		dev_err_probe(dev, ret, "Failed to add power domain\n");
edc2074329e271 Chen-Yu Tsai 2026-03-25  178  		goto del_clk_provider;
edc2074329e271 Chen-Yu Tsai 2026-03-25  179  	}
edc2074329e271 Chen-Yu Tsai 2026-03-25  180  
edc2074329e271 Chen-Yu Tsai 2026-03-25  181  	ret = of_genpd_add_provider_simple(node, &data->genpd);
edc2074329e271 Chen-Yu Tsai 2026-03-25  182  	if (ret) {
edc2074329e271 Chen-Yu Tsai 2026-03-25  183  		dev_err_probe(dev, ret, "Failed to add power domain OF provider\n");
edc2074329e271 Chen-Yu Tsai 2026-03-25  184  		goto remove_pd;
edc2074329e271 Chen-Yu Tsai 2026-03-25  185  	}
edc2074329e271 Chen-Yu Tsai 2026-03-25  186  
edc2074329e271 Chen-Yu Tsai 2026-03-25  187  	ret = of_genpd_add_subdomain(&data->parent_pd, &data->child_pd);
edc2074329e271 Chen-Yu Tsai 2026-03-25  188  	if (ret) {
edc2074329e271 Chen-Yu Tsai 2026-03-25  189  		dev_err_probe(dev, ret, "Failed to link PM domains\n");
edc2074329e271 Chen-Yu Tsai 2026-03-25  190  		goto del_pd_provider;
edc2074329e271 Chen-Yu Tsai 2026-03-25  191  	}
edc2074329e271 Chen-Yu Tsai 2026-03-25  192  
edc2074329e271 Chen-Yu Tsai 2026-03-25  193  	pm_runtime_put(dev);
edc2074329e271 Chen-Yu Tsai 2026-03-25  194  	return 0;
edc2074329e271 Chen-Yu Tsai 2026-03-25  195  
edc2074329e271 Chen-Yu Tsai 2026-03-25  196  del_pd_provider:
edc2074329e271 Chen-Yu Tsai 2026-03-25  197  	of_genpd_del_provider(node);
edc2074329e271 Chen-Yu Tsai 2026-03-25  198  remove_pd:
edc2074329e271 Chen-Yu Tsai 2026-03-25  199  	pm_genpd_remove(&data->genpd);
edc2074329e271 Chen-Yu Tsai 2026-03-25  200  del_clk_provider:
edc2074329e271 Chen-Yu Tsai 2026-03-25  201  	of_clk_del_provider(node);
edc2074329e271 Chen-Yu Tsai 2026-03-25  202  put_26m_clk:
edc2074329e271 Chen-Yu Tsai 2026-03-25  203  	clk_put(data->clk_26m);
edc2074329e271 Chen-Yu Tsai 2026-03-25  204  unregister_clks:
edc2074329e271 Chen-Yu Tsai 2026-03-25  205  	mtk_clk_unregister_gates(mfg_clks, ARRAY_SIZE(mfg_clks), data->clk_data);
edc2074329e271 Chen-Yu Tsai 2026-03-25  206  put_pm_runtime:
edc2074329e271 Chen-Yu Tsai 2026-03-25  207  	pm_runtime_put(dev);
edc2074329e271 Chen-Yu Tsai 2026-03-25  208  put_of_node:
edc2074329e271 Chen-Yu Tsai 2026-03-25  209  	of_node_put(data->parent_pd.np);
edc2074329e271 Chen-Yu Tsai 2026-03-25  210  	return ret;
edc2074329e271 Chen-Yu Tsai 2026-03-25  211  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

