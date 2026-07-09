Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D775406285
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 10:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783593308; cv=none; b=Z3eW5CMFwxa8PC1O5FTFZZ44l7s0zRs0n8F5xqOTGRVhoMoTZNtKXiE14YySc92hHiMHhFaHw70faGLTrF0EDjblGzj++UxzQcUrFBJWpHRm5Wan1fc40YVJNln1N0TQBk9HIFoe5NqUeie/mgPkcyXlJIXrntmbG8+ifFg+fa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783593308; c=relaxed/simple;
	bh=0QDK1iivm9Jl7vw4rLEvvLBYp+kMh33uXjAbk41wjpc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PgRha76dmWeryDgEIHv1yCDAfyPVPSJ0Rr5BainkA5XGogtX9ghoJgJtMtT/3CEXx72NsX7FhHwZLXC07BKyRGAXWx4hGwV/6BiA+a6xIodOl0OYCDxglxIIW38djAqwV0VoG4Tl0kuXgkpo+Ta9IDSKFrE89xiLeEHccI9ZzSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BgBErz5S; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BgBErz5S"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-44856d185bcso908865fac.3
        for <oe-kbuild@lists.linux.dev>; Thu, 09 Jul 2026 03:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783593306; x=1784198106; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=47gLJRE6JnV9YXtBC0v5YMmfEZTQ1aXbN/gct6MbuK4=;
        b=BgBErz5SbD6ljT0efrj0tMPyLHz06bBAm5C+H2XolXIfpgJHudd7kTjL8x3spiO6FE
         OBeyze7gCRJAyTG60F1kjW7p3sLxqSZ7jUotP01A5AXbZMRoQeR3uMiKTEIdNaJryNZ6
         S7cb5rXBcBy0t78SO04CXJjU08M+6vS0jIoBVF+DqBkXXSr8caPQeE4wip1eRgMz32Rq
         yp4ValJR2RQOlMSUqy5ggRQD01veStkyBw7e48EcluHFvddr4SL9qtY4bjjBg3RdP/l6
         yCNLN+s9LAz9U0Guw/F3Tq7XcDlESMt5cDrDI10P3fFHFocOI/ynFYSwvmbwi+R1W4Ss
         bWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783593306; x=1784198106;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=47gLJRE6JnV9YXtBC0v5YMmfEZTQ1aXbN/gct6MbuK4=;
        b=cpWV1TY0q+FTkpgHE0/2MbXDS2JFL7ULcZn5OMSIf1RRNoLSVNjEaLAIGeWbpthw87
         sBDcNSCIuuJz8RB47gnalJoRhNDaJ5oz73p85yx9bIK7rx/EefFYIIn1hBNUO0msNPbN
         xbqaDbWc17To55egihkMhY/tj4BUQ16i2eEEeCbNdxkA7Pz9Z9IiJ1uDt73m08d8NyjW
         E3LoLBi1QLA5YfItcbmRpppQa4XL/hZUgyfh/F60VnxFvo62W0nexMzn2YywuRdGbqUd
         8a70vU3OzRvnNzcvwCrzkCsLGPawa6NBKuVOv4kQyLiq2cTNiqCMfrkJDmvx3FVEhh0a
         pdIg==
X-Gm-Message-State: AOJu0YxZqkfgnxW7eg6Ot9H4t3NWCAkb9aAVgFbi03n0nLCj/byGA/zI
	vTmKFPaFdJXokB/RN6mwFIvy9br93XQ6xj3Fc7jsEFSu5KRv3OzMqQk6pcm309/B4Bs=
X-Gm-Gg: AfdE7cn9xoV4h7Ud4eI35nwS9XBv//IcLziblkq7zA4fsesgetKUv43rGf4b0RQ5JR6
	P3pYGKG37uebQXWKEryX2EOFOj991fLtk4zyK6+NPJvo6vJrBySoFVLO/hES7pzefkddbAvzagm
	NPWj3gxD5TNfkiCLO4NgTCgKfEUUfPL/D70Lfw1UV8QtHsNFXBXxHBfqBabUAm59cWjalXUvpZS
	DXumuXAE0XScc+oOUReWeeys2nIRdTw4SRujrsz095UUNvM6QF2syfc728P2uYkyOa6iBWaTZc5
	vZi9h68ba9RqUq2si6mMaSeuuMszCgml72GmzsoO3vFH9h2yoP4EeKIgINWqaZkbei13TQk3B5M
	2oKS67e0CthZ05WAqt2yDkv3ui7GiyMu8Ldf4SX0wkaxN4Pm1dpI0M5dsxZoO2q+WkHEifcEckZ
	XHqlbo
X-Received: by 2002:a05:6870:3482:b0:43d:bcb:3b0b with SMTP id 586e51a60fabf-45163cafa98mr4402739fac.23.1783593305673;
        Thu, 09 Jul 2026 03:35:05 -0700 (PDT)
Received: from localhost ([74.80.182.70])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45191644669sm1556016fac.12.2026.07.09.03.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:35:03 -0700 (PDT)
Date: Thu, 9 Jul 2026 13:34:58 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Valerio Setti <vsetti@baylibre.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: [linux-next:master 1679/3422] sound/soc/meson/aiu.c:313 aiu_probe()
 warn: missing unwind goto?
Message-ID: <202607031022.4wWDCjAs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260709103458.RUcySZ1PvH9lILPoHNHWgtpEWDr_cwd0hxqhtuiD7oM@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6eb8711ece2ce27e52e327a5b7a628ed39b97f45
commit: 83b83024cdbfdddee104f4a84c2c2f1f8e6659f3 [1679/3422] ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data
config: riscv-randconfig-r071-20260703 (https://download.01.org/0day-ci/archive/20260703/202607031022.4wWDCjAs-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607031022.4wWDCjAs-lkp@intel.com/

smatch warnings:
sound/soc/meson/aiu.c:313 aiu_probe() warn: missing unwind goto?

vim +313 sound/soc/meson/aiu.c

6ae9ca9ce986bf Jerome Brunet       2020-02-13  254  static int aiu_probe(struct platform_device *pdev)
6ae9ca9ce986bf Jerome Brunet       2020-02-13  255  {
6ae9ca9ce986bf Jerome Brunet       2020-02-13  256  	struct device *dev = &pdev->dev;
6ae9ca9ce986bf Jerome Brunet       2020-02-13  257  	void __iomem *regs;
6ae9ca9ce986bf Jerome Brunet       2020-02-13  258  	struct regmap *map;
6ae9ca9ce986bf Jerome Brunet       2020-02-13  259  	struct aiu *aiu;
6ae9ca9ce986bf Jerome Brunet       2020-02-13  260  	int ret;
6ae9ca9ce986bf Jerome Brunet       2020-02-13  261  
6ae9ca9ce986bf Jerome Brunet       2020-02-13  262  	aiu = devm_kzalloc(dev, sizeof(*aiu), GFP_KERNEL);
6ae9ca9ce986bf Jerome Brunet       2020-02-13  263  	if (!aiu)
6ae9ca9ce986bf Jerome Brunet       2020-02-13  264  		return -ENOMEM;
edc761805302db Martin Blumenstingl 2020-02-20  265  
edc761805302db Martin Blumenstingl 2020-02-20  266  	aiu->platform = device_get_match_data(dev);
edc761805302db Martin Blumenstingl 2020-02-20  267  	if (!aiu->platform)
edc761805302db Martin Blumenstingl 2020-02-20  268  		return -ENODEV;
edc761805302db Martin Blumenstingl 2020-02-20  269  
6ae9ca9ce986bf Jerome Brunet       2020-02-13  270  	platform_set_drvdata(pdev, aiu);
6ae9ca9ce986bf Jerome Brunet       2020-02-13  271  
6ae9ca9ce986bf Jerome Brunet       2020-02-13  272  	ret = device_reset(dev);
2ff4e003e8e105 Kuninori Morimoto   2021-12-14  273  	if (ret)
2ff4e003e8e105 Kuninori Morimoto   2021-12-14  274  		return dev_err_probe(dev, ret, "Failed to reset device\n");
6ae9ca9ce986bf Jerome Brunet       2020-02-13  275  
6ae9ca9ce986bf Jerome Brunet       2020-02-13  276  	regs = devm_platform_ioremap_resource(pdev, 0);
6ae9ca9ce986bf Jerome Brunet       2020-02-13  277  	if (IS_ERR(regs))
6ae9ca9ce986bf Jerome Brunet       2020-02-13  278  		return PTR_ERR(regs);
6ae9ca9ce986bf Jerome Brunet       2020-02-13  279  
6ae9ca9ce986bf Jerome Brunet       2020-02-13  280  	map = devm_regmap_init_mmio(dev, regs, &aiu_regmap_cfg);
6ae9ca9ce986bf Jerome Brunet       2020-02-13  281  	if (IS_ERR(map)) {
6ae9ca9ce986bf Jerome Brunet       2020-02-13  282  		dev_err(dev, "failed to init regmap: %ld\n",
6ae9ca9ce986bf Jerome Brunet       2020-02-13  283  			PTR_ERR(map));
6ae9ca9ce986bf Jerome Brunet       2020-02-13  284  		return PTR_ERR(map);
6ae9ca9ce986bf Jerome Brunet       2020-02-13  285  	}
6ae9ca9ce986bf Jerome Brunet       2020-02-13  286  
6ae9ca9ce986bf Jerome Brunet       2020-02-13  287  	aiu->i2s.irq = platform_get_irq_byname(pdev, "i2s");
6e700f0672199f Jerome Brunet       2020-02-14  288  	if (aiu->i2s.irq < 0)
6ae9ca9ce986bf Jerome Brunet       2020-02-13  289  		return aiu->i2s.irq;
6ae9ca9ce986bf Jerome Brunet       2020-02-13  290  
6ae9ca9ce986bf Jerome Brunet       2020-02-13  291  	aiu->spdif.irq = platform_get_irq_byname(pdev, "spdif");
6e700f0672199f Jerome Brunet       2020-02-14  292  	if (aiu->spdif.irq < 0)
6ae9ca9ce986bf Jerome Brunet       2020-02-13  293  		return aiu->spdif.irq;
6ae9ca9ce986bf Jerome Brunet       2020-02-13  294  
6ae9ca9ce986bf Jerome Brunet       2020-02-13  295  	ret = aiu_clk_get(dev);
6ae9ca9ce986bf Jerome Brunet       2020-02-13  296  	if (ret)
6ae9ca9ce986bf Jerome Brunet       2020-02-13  297  		return ret;
6ae9ca9ce986bf Jerome Brunet       2020-02-13  298  
83b83024cdbfdd Valerio Setti       2026-06-10  299  	/* Allocate the aiu-formatter into its widget */
83b83024cdbfdd Valerio Setti       2026-06-10  300  	ret = gx_formatter_create(dev, &aiu_cpu_dapm_widgets[AIU_WIDGET_I2S_FORMATTER],
83b83024cdbfdd Valerio Setti       2026-06-10  301  				  &aiu_formatter_i2s_drv, map);
83b83024cdbfdd Valerio Setti       2026-06-10  302  	if (ret) {
83b83024cdbfdd Valerio Setti       2026-06-10  303  		dev_err(dev, "Failed to allocate aiu formatter\n");
83b83024cdbfdd Valerio Setti       2026-06-10  304  		goto err;

This error handling seems wrong.  Goto

83b83024cdbfdd Valerio Setti       2026-06-10  305  	}
83b83024cdbfdd Valerio Setti       2026-06-10  306  
6ae9ca9ce986bf Jerome Brunet       2020-02-13  307  	/* Register the cpu component of the aiu */
6ae9ca9ce986bf Jerome Brunet       2020-02-13  308  	ret = snd_soc_register_component(dev, &aiu_cpu_component,
6ae9ca9ce986bf Jerome Brunet       2020-02-13  309  					 aiu_cpu_dai_drv,
6ae9ca9ce986bf Jerome Brunet       2020-02-13  310  					 ARRAY_SIZE(aiu_cpu_dai_drv));
b82b734c0e9a75 Jerome Brunet       2020-02-13  311  	if (ret) {
6ae9ca9ce986bf Jerome Brunet       2020-02-13  312  		dev_err(dev, "Failed to register cpu component\n");
b82b734c0e9a75 Jerome Brunet       2020-02-13 @313  		return ret;

followed by a direct return

b82b734c0e9a75 Jerome Brunet       2020-02-13  314  	}
6ae9ca9ce986bf Jerome Brunet       2020-02-13  315  
b82b734c0e9a75 Jerome Brunet       2020-02-13  316  	/* Register the hdmi codec control component */
b82b734c0e9a75 Jerome Brunet       2020-02-13  317  	ret = aiu_hdmi_ctrl_register_component(dev);
b82b734c0e9a75 Jerome Brunet       2020-02-13  318  	if (ret) {
b82b734c0e9a75 Jerome Brunet       2020-02-13  319  		dev_err(dev, "Failed to register hdmi control component\n");
b82b734c0e9a75 Jerome Brunet       2020-02-13  320  		goto err;
b82b734c0e9a75 Jerome Brunet       2020-02-13  321  	}
b82b734c0e9a75 Jerome Brunet       2020-02-13  322  
65816025d46169 Jerome Brunet       2020-02-13  323  	/* Register the internal dac control component on gxl */
edc761805302db Martin Blumenstingl 2020-02-20  324  	if (aiu->platform->has_acodec) {
65816025d46169 Jerome Brunet       2020-02-13  325  		ret = aiu_acodec_ctrl_register_component(dev);
65816025d46169 Jerome Brunet       2020-02-13  326  		if (ret) {
65816025d46169 Jerome Brunet       2020-02-13  327  			dev_err(dev,
65816025d46169 Jerome Brunet       2020-02-13  328  			    "Failed to register acodec control component\n");
65816025d46169 Jerome Brunet       2020-02-13  329  			goto err;
65816025d46169 Jerome Brunet       2020-02-13  330  		}
65816025d46169 Jerome Brunet       2020-02-13  331  	}
65816025d46169 Jerome Brunet       2020-02-13  332  
b82b734c0e9a75 Jerome Brunet       2020-02-13  333  	return 0;
b82b734c0e9a75 Jerome Brunet       2020-02-13  334  err:
83b83024cdbfdd Valerio Setti       2026-06-10  335  	gx_formatter_free(&aiu_cpu_dapm_widgets[AIU_WIDGET_I2S_FORMATTER]);
b82b734c0e9a75 Jerome Brunet       2020-02-13  336  	snd_soc_unregister_component(dev);
6ae9ca9ce986bf Jerome Brunet       2020-02-13  337  	return ret;
6ae9ca9ce986bf Jerome Brunet       2020-02-13  338  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

