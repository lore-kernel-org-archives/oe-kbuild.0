Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75D0273D84
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 06:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768804681; cv=none; b=F9toZUKSh8I+NKrn1HeMbpWOly/5Br5+LB8K0E04PIyvgaWpw/1De/pjmcfpkod7Tl4j2910+3pDyV4sCSoeZ7tIbA0+B6Q0744k0CurYxBDVZaNh8k6KnN/nkCu1sC6GIhp/88wH+BQ46YoBRL9yAcHonQxGsMun0qc8e4K9To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768804681; c=relaxed/simple;
	bh=VQIElQkHzSoB4CojSAcKrVgZGqKfDuF8onKxP7DS2/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=iOtQf54sSavsVwVzJgxTGmjqnwiu66h9W2ixKf8GLiMnHV+UWDF2ofVSCyGTmRfptWDVBBeGX2+Catgb/3i+k079nuuF0XMgABKrSorKbsue4g7VjLstZCXnk62KqMQE2szr3Sc17axGST1mkbm4o6zyO4FC61i2r7CQkYeaVf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NIGEwW17; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NIGEwW17"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-47ee807a4c5so28426805e9.2
        for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 22:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768804677; x=1769409477; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CbWcz9mMKDIu3Eeo2pw/1X+znIUuGvzIKZFjWHoDt0Q=;
        b=NIGEwW17t2PsjE0k2UKSb0PfB3WjUq4zLY04vSQ2azWIcSzME1/8RLEcGhG3uh3ewd
         MKKWiXSnZDz5EHO8DT6QA8NCBmLvWqOM5xUh2DcLmQU9Fl4w52ZrCXWycdblL1KYch8V
         ZCYYp65PnuX/oBcYlAS4vzBaMM2Wcni+CTfNm43o16+PMsL3Of30GGdM0MtPZy1EdnTf
         yWwwshnZFvmZdqwIbfun9eqLb7uF045DnbNWmOaU6wys8aQrWgrUV4scvXXCvKzRl0ji
         a94q0CEVm+FceifviQDcWJHSEWbaEftEN6BBysaK6CFrT60aIkESRkih5UTUOsPbe4Hs
         mv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768804677; x=1769409477;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbWcz9mMKDIu3Eeo2pw/1X+znIUuGvzIKZFjWHoDt0Q=;
        b=KL2X1yAtu0chKs57BZWygrCLlb6emYon4bUUdk+LZnWZqytppG/9rOnbJN6xcxGWAF
         syHXsKgJJAUWvs/g21DXSweVpIu8j9ERp6xI3JynZVe6uCaOX0f2lmnYZoUp8WlQy8DD
         sZSVSMuYBSfAq3Hz2EUpD+zusLiKbHWW01RpICALXwWeUcXkNPS1+w2uePRarSG3p74M
         HAxGZqc/e2s2mHMk9VSrLnHLZptqHBKwQ6ruDzb9BXUrFrS/B15fvELn0WJ8PraaeQvG
         ZN1DSlo7Hi8rXbMYPklhpvVUr8rrYAhSMVlakADzfYV6s5V2yWMcdr7E6hIwynVPSjBX
         Z9AA==
X-Gm-Message-State: AOJu0Yx5hbMfCXesyh7LN4XjENtFMfRffyOknp6/TOEFpneQWRAUAsc1
	fuW1Muv44KmB831bChAn56s4CsfbdIgK960IjggoaU575DfYm8gIzE5eCfuS3toyG2TfWT38k4R
	ekV+DTnE=
X-Gm-Gg: AY/fxX6nmO85wucoIfZiTEZ97lFcWQ7NMxZmRovxWdB7ci6bU+L69y3/1uyAZQoqhM6
	EDEeqlkzymw/YMCizE5pvwe8v1wnNUD9c+39HENI2tjxdZMW9hfVMw1RXNDB6T1PL1rB2k8JjJs
	xK1aDj6uOdIcoLBSfTP7QPsxkm5Y2F3r885Nfq067G9SnIDXytR529KB6aw6O8tFFIKAssu9vrv
	bQLZxJlglExVApzfKUiMv145iX9XHWZJ/ddZFS6IwqlrBaQzVAIpzxhuk581cX8FERk8LW/oNzI
	5jottxOLnYG6Lt10LaqGcLWzlWiR2Vp9s05yiqZ9FW61MMzyiO9UFxgqNZw2sYglQ3hdt0VH1pf
	/BG5rSeGm9HBmmGN0m+O5/Hh00EzPRDUwpyY+Poj9pph3YU6piBEsbv6KQ7yQLSKXX5X/th6n71
	Ah4mCJiJw6RAIrH3IhyCtqN1G7acA=
X-Received: by 2002:a05:600c:37c8:b0:47e:e87f:4bba with SMTP id 5b1f17b1804b1-4801eb0e1cfmr109058555e9.29.1768804677011;
        Sun, 18 Jan 2026 22:37:57 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe6d9a7sm75156405e9.17.2026.01.18.22.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 22:37:56 -0800 (PST)
Date: Mon, 19 Jan 2026 09:37:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Shengjiu Wang <shengjiu.wang@nxp.com>,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] ASoC: fsl_audmix: Add support for i.MX952 platform
Message-ID: <202601170203.upPyGvI2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116101648.377952-3-shengjiu.wang@nxp.com>
Message-ID: <20260119063753.Uvao79tmjD0052PWhk3sALLhhN159muWicENPx-NXEo@z>

Hi Shengjiu,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shengjiu-Wang/ASoC-dt-bindings-fsl-audmix-Add-support-for-i-MX952-platform/20260116-182050
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260116101648.377952-3-shengjiu.wang%40nxp.com
patch subject: [PATCH 2/2] ASoC: fsl_audmix: Add support for i.MX952 platform
config: s390-randconfig-r071-20260116 (https://download.01.org/0day-ci/archive/20260117/202601170203.upPyGvI2-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601170203.upPyGvI2-lkp@intel.com/

smatch warnings:
sound/soc/fsl/fsl_audmix.c:522 fsl_audmix_probe() warn: missing error code 'ret'

vim +/ret +522 sound/soc/fsl/fsl_audmix.c

be1df61cf06efb Viorel Suman  2019-01-22  465  static int fsl_audmix_probe(struct platform_device *pdev)
be1df61cf06efb Viorel Suman  2019-01-22  466  {
0c44e9e9e61cde Shengjiu Wang 2026-01-16  467  	const struct fsl_audmix_soc_data *soc_data;
62be484f7ad844 Viorel Suman  2019-04-10  468  	struct device *dev = &pdev->dev;
be1df61cf06efb Viorel Suman  2019-01-22  469  	struct fsl_audmix *priv;
be1df61cf06efb Viorel Suman  2019-01-22  470  	void __iomem *regs;
be1df61cf06efb Viorel Suman  2019-01-22  471  	int ret;
f2a36a78423ee8 Viorel Suman  2019-04-10  472  
62be484f7ad844 Viorel Suman  2019-04-10  473  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
be1df61cf06efb Viorel Suman  2019-01-22  474  	if (!priv)
be1df61cf06efb Viorel Suman  2019-01-22  475  		return -ENOMEM;
be1df61cf06efb Viorel Suman  2019-01-22  476  
be1df61cf06efb Viorel Suman  2019-01-22  477  	/* Get the addresses */
959bb6b54d7086 YueHaibing    2019-07-27  478  	regs = devm_platform_ioremap_resource(pdev, 0);
be1df61cf06efb Viorel Suman  2019-01-22  479  	if (IS_ERR(regs))
be1df61cf06efb Viorel Suman  2019-01-22  480  		return PTR_ERR(regs);
be1df61cf06efb Viorel Suman  2019-01-22  481  
3feaba79d8f701 Shengjiu Wang 2021-03-24  482  	priv->regmap = devm_regmap_init_mmio(dev, regs, &fsl_audmix_regmap_config);
be1df61cf06efb Viorel Suman  2019-01-22  483  	if (IS_ERR(priv->regmap)) {
62be484f7ad844 Viorel Suman  2019-04-10  484  		dev_err(dev, "failed to init regmap\n");
be1df61cf06efb Viorel Suman  2019-01-22  485  		return PTR_ERR(priv->regmap);
be1df61cf06efb Viorel Suman  2019-01-22  486  	}
be1df61cf06efb Viorel Suman  2019-01-22  487  
62be484f7ad844 Viorel Suman  2019-04-10  488  	priv->ipg_clk = devm_clk_get(dev, "ipg");
be1df61cf06efb Viorel Suman  2019-01-22  489  	if (IS_ERR(priv->ipg_clk)) {
62be484f7ad844 Viorel Suman  2019-04-10  490  		dev_err(dev, "failed to get ipg clock\n");
be1df61cf06efb Viorel Suman  2019-01-22  491  		return PTR_ERR(priv->ipg_clk);
be1df61cf06efb Viorel Suman  2019-01-22  492  	}
be1df61cf06efb Viorel Suman  2019-01-22  493  
fe965096c9495d Shengjiu Wang 2019-11-11  494  	spin_lock_init(&priv->lock);
be1df61cf06efb Viorel Suman  2019-01-22  495  	platform_set_drvdata(pdev, priv);
62be484f7ad844 Viorel Suman  2019-04-10  496  	pm_runtime_enable(dev);
be1df61cf06efb Viorel Suman  2019-01-22  497  
62be484f7ad844 Viorel Suman  2019-04-10  498  	ret = devm_snd_soc_register_component(dev, &fsl_audmix_component,
be1df61cf06efb Viorel Suman  2019-01-22  499  					      fsl_audmix_dai,
be1df61cf06efb Viorel Suman  2019-01-22  500  					      ARRAY_SIZE(fsl_audmix_dai));
be1df61cf06efb Viorel Suman  2019-01-22  501  	if (ret) {
62be484f7ad844 Viorel Suman  2019-04-10  502  		dev_err(dev, "failed to register ASoC DAI\n");
77fffa742285f2 Chuhong Yuan  2019-12-03  503  		goto err_disable_pm;
be1df61cf06efb Viorel Suman  2019-01-22  504  	}
be1df61cf06efb Viorel Suman  2019-01-22  505  
294a60e5e98300 Shengjiu Wang 2025-02-26  506  	/*
294a60e5e98300 Shengjiu Wang 2025-02-26  507  	 * If dais property exist, then register the imx-audmix card driver.
294a60e5e98300 Shengjiu Wang 2025-02-26  508  	 * otherwise, it should be linked by audio graph card.
294a60e5e98300 Shengjiu Wang 2025-02-26  509  	 */
294a60e5e98300 Shengjiu Wang 2025-02-26  510  	if (of_find_property(pdev->dev.of_node, "dais", NULL)) {
5057d108d69a55 Fabio Estevam 2020-12-02  511  		priv->pdev = platform_device_register_data(dev, "imx-audmix", 0, NULL, 0);
be1df61cf06efb Viorel Suman  2019-01-22  512  		if (IS_ERR(priv->pdev)) {
be1df61cf06efb Viorel Suman  2019-01-22  513  			ret = PTR_ERR(priv->pdev);
5057d108d69a55 Fabio Estevam 2020-12-02  514  			dev_err(dev, "failed to register platform: %d\n", ret);
77fffa742285f2 Chuhong Yuan  2019-12-03  515  			goto err_disable_pm;
be1df61cf06efb Viorel Suman  2019-01-22  516  		}
294a60e5e98300 Shengjiu Wang 2025-02-26  517  	}
be1df61cf06efb Viorel Suman  2019-01-22  518  
0c44e9e9e61cde Shengjiu Wang 2026-01-16  519  	soc_data = of_device_get_match_data(dev);
0c44e9e9e61cde Shengjiu Wang 2026-01-16  520  	if (!soc_data) {
0c44e9e9e61cde Shengjiu Wang 2026-01-16  521  		dev_err(dev, "failed to match device\n");
0c44e9e9e61cde Shengjiu Wang 2026-01-16 @522  		goto err_disable_pm;

missing error code.

0c44e9e9e61cde Shengjiu Wang 2026-01-16  523  	}
0c44e9e9e61cde Shengjiu Wang 2026-01-16  524  
0c44e9e9e61cde Shengjiu Wang 2026-01-16  525  	if (of_property_read_bool(pdev->dev.of_node, "fsl,amix-bypass") &&
0c44e9e9e61cde Shengjiu Wang 2026-01-16  526  	    soc_data->bypass_index > 0) {
0c44e9e9e61cde Shengjiu Wang 2026-01-16  527  		ret = scmi_imx_misc_ctrl_set(soc_data->bypass_index, 0);
0c44e9e9e61cde Shengjiu Wang 2026-01-16  528  		if (ret)
0c44e9e9e61cde Shengjiu Wang 2026-01-16  529  			goto err_disable_pm;
0c44e9e9e61cde Shengjiu Wang 2026-01-16  530  	}
0c44e9e9e61cde Shengjiu Wang 2026-01-16  531  
77fffa742285f2 Chuhong Yuan  2019-12-03  532  	return 0;
77fffa742285f2 Chuhong Yuan  2019-12-03  533  
77fffa742285f2 Chuhong Yuan  2019-12-03  534  err_disable_pm:
77fffa742285f2 Chuhong Yuan  2019-12-03  535  	pm_runtime_disable(dev);
be1df61cf06efb Viorel Suman  2019-01-22  536  	return ret;
be1df61cf06efb Viorel Suman  2019-01-22  537  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

