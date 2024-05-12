Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F302F5B
	for <oe-kbuild@lists.linux.dev>; Sun, 12 May 2024 01:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715478637; cv=none; b=JvIYwWtlIIr+sQm3SgmsfiBK+Q0QVjhyBh7jwxNVPSvr/rd5Ol23aSi3Bn5QiSOpfUFHLpmiHDMU81wTTBte8CLKlh8ykIL+dXzY3gYsvEW5m5NbKOkSYjX/N1gk88EGfOEeG4ZZmG+z5vrjYREcTSKGZ8tDybczMNaDWSGg+3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715478637; c=relaxed/simple;
	bh=HSGqu3BCxfJXv4veNJ3xb3QZ2iIE3JMwr+Lq51lzk/8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=USGLPDulPnrPUZWcPphS9GhAGahJpxRg7MWEPUC+q8JWJWNAWBz/HL5Vtx2Q2a9mAtf3oiU3/977pBwr1j0/lmhy860kpkKSSFVSbjvTBk1w8JQfeX97x9zM4XDGBaUPozxpyBr6VyYoaOHKEqGUAQ8LXSMLFw3kvje+Hu6CwcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HqvYWHqb; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HqvYWHqb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715478635; x=1747014635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HSGqu3BCxfJXv4veNJ3xb3QZ2iIE3JMwr+Lq51lzk/8=;
  b=HqvYWHqb3OaXZAPOHy/zTulzrxEvFtdiLafZJvgOyUvpUZJtRqzhuST/
   X2yQOA6BBL9bVPaZXsE3frf/6uXSOrxBcLhRJ1iof2fBFselhpnv0AgsE
   xnqEiDoLX/E7D8BWU/y/FCAvOYd6AWDjXF9vIdhbhNfS8CiMh4CyVtuDk
   engafIMJ7pAX0KAx6PVyefebxVmAi0M5AAgLfKouVA5CkR8l/pgF+Zj4N
   ovzE/NaWGxb7hVKmrNCsGd/tH6HZQrv4SlC1xy4LnS/fnAQJN+JSOuLEF
   7QEkfEq/ayIh2yqQWjen34e1RNndu5zJQ4LlAznOeLweO1EIA3IIPs3IP
   w==;
X-CSE-ConnectionGUID: 42tuxzAUQMOcVeEk5zRXOg==
X-CSE-MsgGUID: PXKHgSPiQDGqKWOY4KG0vw==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="28933837"
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="28933837"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 18:50:34 -0700
X-CSE-ConnectionGUID: pRnyF/QzRSmFH9z0BYFUcw==
X-CSE-MsgGUID: gppB7NMZQ7W7clm/C+qAmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="30067728"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 May 2024 18:50:32 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5yMA-00082t-1j;
	Sun, 12 May 2024 01:50:30 +0000
Date: Sun, 12 May 2024 09:49:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] ASoC: codec: lpass-rx-macro: add suppor for 2.6
 codec version
Message-ID: <202405120902.nPmp732h-lkp@intel.com>
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
In-Reply-To: <20240510175835.286775-3-srinivas.kandagatla@linaro.org>
References: <20240510175835.286775-3-srinivas.kandagatla@linaro.org>
TO: srinivas.kandagatla@linaro.org
TO: broonie@kernel.org
CC: perex@perex.cz
CC: tiwai@suse.com
CC: alsa-devel@alsa-project.org
CC: lgirdwood@gmail.com
CC: linux-kernel@vger.kernel.org
CC: krzysztof.kozlowski@linaro.org
CC: neil.armstrong@linaro.org
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.9-rc7 next-20240510]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/srinivas-kandagatla-linaro-org/ASoC-codecs-lpass-macro-add-helpers-to-get-codec-version/20240511-020042
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240510175835.286775-3-srinivas.kandagatla%40linaro.org
patch subject: [PATCH 2/2] ASoC: codec: lpass-rx-macro: add suppor for 2.6 codec version
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: sparc-randconfig-r081-20240512 (https://download.01.org/0day-ci/archive/20240512/202405120902.nPmp732h-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405120902.nPmp732h-lkp@intel.com/

New smatch warnings:
sound/soc/codecs/lpass-rx-macro.c:3899 rx_macro_probe() error: uninitialized symbol 'reg_defaults'.
sound/soc/codecs/lpass-rx-macro.c:3813 rx_macro_probe() warn: missing unwind goto?

Old smatch warnings:
sound/soc/codecs/lpass-rx-macro.c:1692 rx_macro_int_dem_inp_mux_put() error: uninitialized symbol 'look_ahead_dly_reg'.
sound/soc/codecs/lpass-rx-macro.c:1696 rx_macro_int_dem_inp_mux_put() error: uninitialized symbol 'look_ahead_dly_reg'.
sound/soc/codecs/lpass-rx-macro.c:2412 rx_macro_hd2_control() error: uninitialized symbol 'hd2_enable_reg'.
sound/soc/codecs/lpass-rx-macro.c:2413 rx_macro_hd2_control() error: uninitialized symbol 'hd2_scale_reg'.
sound/soc/codecs/lpass-rx-macro.c:2422 rx_macro_hd2_control() error: uninitialized symbol 'hd2_scale_reg'.

vim +/reg_defaults +3899 sound/soc/codecs/lpass-rx-macro.c

af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3748  
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3749  static int rx_macro_probe(struct platform_device *pdev)
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3750  {
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3751  	struct reg_default *reg_defaults;
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3752  	struct device *dev = &pdev->dev;
492fe974fed075 Krzysztof Kozlowski     2023-03-13  3753  	kernel_ulong_t flags;
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3754  	struct rx_macro *rx;
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3755  	void __iomem *base;
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3756  	int ret, def_count;
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3757  
492fe974fed075 Krzysztof Kozlowski     2023-03-13  3758  	flags = (kernel_ulong_t)device_get_match_data(dev);
492fe974fed075 Krzysztof Kozlowski     2023-03-13  3759  
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3760  	rx = devm_kzalloc(dev, sizeof(*rx), GFP_KERNEL);
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3761  	if (!rx)
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3762  		return -ENOMEM;
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3763  
43b647d9940454 Srinivas Kandagatla     2022-02-24  3764  	rx->macro = devm_clk_get_optional(dev, "macro");
43b647d9940454 Srinivas Kandagatla     2022-02-24  3765  	if (IS_ERR(rx->macro))
f54e3474507427 Bjorn Andersson         2023-07-21  3766  		return dev_err_probe(dev, PTR_ERR(rx->macro), "unable to get macro clock\n");
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3767  
43b647d9940454 Srinivas Kandagatla     2022-02-24  3768  	rx->dcodec = devm_clk_get_optional(dev, "dcodec");
43b647d9940454 Srinivas Kandagatla     2022-02-24  3769  	if (IS_ERR(rx->dcodec))
f54e3474507427 Bjorn Andersson         2023-07-21  3770  		return dev_err_probe(dev, PTR_ERR(rx->dcodec), "unable to get dcodec clock\n");
43b647d9940454 Srinivas Kandagatla     2022-02-24  3771  
43b647d9940454 Srinivas Kandagatla     2022-02-24  3772  	rx->mclk = devm_clk_get(dev, "mclk");
43b647d9940454 Srinivas Kandagatla     2022-02-24  3773  	if (IS_ERR(rx->mclk))
f54e3474507427 Bjorn Andersson         2023-07-21  3774  		return dev_err_probe(dev, PTR_ERR(rx->mclk), "unable to get mclk clock\n");
43b647d9940454 Srinivas Kandagatla     2022-02-24  3775  
492fe974fed075 Krzysztof Kozlowski     2023-03-13  3776  	if (flags & LPASS_MACRO_FLAG_HAS_NPL_CLOCK) {
43b647d9940454 Srinivas Kandagatla     2022-02-24  3777  		rx->npl = devm_clk_get(dev, "npl");
43b647d9940454 Srinivas Kandagatla     2022-02-24  3778  		if (IS_ERR(rx->npl))
f54e3474507427 Bjorn Andersson         2023-07-21  3779  			return dev_err_probe(dev, PTR_ERR(rx->npl), "unable to get npl clock\n");
492fe974fed075 Krzysztof Kozlowski     2023-03-13  3780  	}
43b647d9940454 Srinivas Kandagatla     2022-02-24  3781  
43b647d9940454 Srinivas Kandagatla     2022-02-24  3782  	rx->fsgen = devm_clk_get(dev, "fsgen");
43b647d9940454 Srinivas Kandagatla     2022-02-24  3783  	if (IS_ERR(rx->fsgen))
f54e3474507427 Bjorn Andersson         2023-07-21  3784  		return dev_err_probe(dev, PTR_ERR(rx->fsgen), "unable to get fsgen clock\n");
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3785  
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  3786  	rx->pds = lpass_macro_pds_init(dev);
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  3787  	if (IS_ERR(rx->pds))
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  3788  		return PTR_ERR(rx->pds);
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3789  
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3790  	base = devm_platform_ioremap_resource(pdev, 0);
ddfd5345281466 Christophe JAILLET      2022-04-03  3791  	if (IS_ERR(base)) {
ddfd5345281466 Christophe JAILLET      2022-04-03  3792  		ret = PTR_ERR(base);
ddfd5345281466 Christophe JAILLET      2022-04-03  3793  		goto err;
ddfd5345281466 Christophe JAILLET      2022-04-03  3794  	}
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3795  
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3796  	rx->codec_version = lpass_macro_get_codec_version();
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3797  	switch (rx->codec_version) {
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3798  	case LPASS_CODEC_VERSION_2_6:
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3799  		rx->rxn_reg_offset = 0xc0;
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3800  		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_6_defaults);
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3801  		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3802  		if (!reg_defaults)
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3803  			return -ENOMEM;
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3804  		memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3805  		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3806  				rx_2_6_defaults, sizeof(rx_2_6_defaults));
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3807  		break;
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3808  	default:
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3809  		rx->rxn_reg_offset = 0x80;
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3810  		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_pre_2_6_defaults);
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3811  		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3812  		if (!reg_defaults)
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10 @3813  			return -ENOMEM;
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3814  		memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3815  		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3816  				rx_pre_2_6_defaults, sizeof(rx_pre_2_6_defaults));
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3817  		break;
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3818  	}
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3819  
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3820  	rx_regmap_config.reg_defaults = reg_defaults,
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3821  	rx_regmap_config.num_reg_defaults = def_count;
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3822  
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3823  	rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
ddfd5345281466 Christophe JAILLET      2022-04-03  3824  	if (IS_ERR(rx->regmap)) {
ddfd5345281466 Christophe JAILLET      2022-04-03  3825  		ret = PTR_ERR(rx->regmap);
ddfd5345281466 Christophe JAILLET      2022-04-03  3826  		goto err;
ddfd5345281466 Christophe JAILLET      2022-04-03  3827  	}
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3828  
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3829  	dev_set_drvdata(dev, rx);
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3830  
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3831  	rx->dev = dev;
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3832  
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3833  	/* set MCLK and NPL rates */
43b647d9940454 Srinivas Kandagatla     2022-02-24  3834  	clk_set_rate(rx->mclk, MCLK_FREQ);
e7621434378c40 Srinivas Kandagatla     2023-02-09  3835  	clk_set_rate(rx->npl, MCLK_FREQ);
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3836  
43b647d9940454 Srinivas Kandagatla     2022-02-24  3837  	ret = clk_prepare_enable(rx->macro);
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3838  	if (ret)
43b647d9940454 Srinivas Kandagatla     2022-02-24  3839  		goto err;
43b647d9940454 Srinivas Kandagatla     2022-02-24  3840  
43b647d9940454 Srinivas Kandagatla     2022-02-24  3841  	ret = clk_prepare_enable(rx->dcodec);
43b647d9940454 Srinivas Kandagatla     2022-02-24  3842  	if (ret)
43b647d9940454 Srinivas Kandagatla     2022-02-24  3843  		goto err_dcodec;
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3844  
43b647d9940454 Srinivas Kandagatla     2022-02-24  3845  	ret = clk_prepare_enable(rx->mclk);
43b647d9940454 Srinivas Kandagatla     2022-02-24  3846  	if (ret)
43b647d9940454 Srinivas Kandagatla     2022-02-24  3847  		goto err_mclk;
43b647d9940454 Srinivas Kandagatla     2022-02-24  3848  
43b647d9940454 Srinivas Kandagatla     2022-02-24  3849  	ret = clk_prepare_enable(rx->npl);
43b647d9940454 Srinivas Kandagatla     2022-02-24  3850  	if (ret)
43b647d9940454 Srinivas Kandagatla     2022-02-24  3851  		goto err_npl;
43b647d9940454 Srinivas Kandagatla     2022-02-24  3852  
43b647d9940454 Srinivas Kandagatla     2022-02-24  3853  	ret = clk_prepare_enable(rx->fsgen);
43b647d9940454 Srinivas Kandagatla     2022-02-24  3854  	if (ret)
43b647d9940454 Srinivas Kandagatla     2022-02-24  3855  		goto err_fsgen;
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3856  
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  3857  	/* reset swr block  */
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  3858  	regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL,
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  3859  			   CDC_RX_SWR_RESET_MASK,
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  3860  			   CDC_RX_SWR_RESET);
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  3861  
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  3862  	regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL,
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  3863  			   CDC_RX_SWR_CLK_EN_MASK, 1);
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  3864  
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  3865  	regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL,
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  3866  			   CDC_RX_SWR_RESET_MASK, 0);
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  3867  
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3868  	ret = devm_snd_soc_register_component(dev, &rx_macro_component_drv,
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3869  					      rx_macro_dai,
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3870  					      ARRAY_SIZE(rx_macro_dai));
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3871  	if (ret)
43b647d9940454 Srinivas Kandagatla     2022-02-24  3872  		goto err_clkout;
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3873  
366ff79ed5392a Srinivas Kandagatla     2022-02-24  3874  
366ff79ed5392a Srinivas Kandagatla     2022-02-24  3875  	pm_runtime_set_autosuspend_delay(dev, 3000);
366ff79ed5392a Srinivas Kandagatla     2022-02-24  3876  	pm_runtime_use_autosuspend(dev);
366ff79ed5392a Srinivas Kandagatla     2022-02-24  3877  	pm_runtime_mark_last_busy(dev);
366ff79ed5392a Srinivas Kandagatla     2022-02-24  3878  	pm_runtime_set_active(dev);
366ff79ed5392a Srinivas Kandagatla     2022-02-24  3879  	pm_runtime_enable(dev);
366ff79ed5392a Srinivas Kandagatla     2022-02-24  3880  
1dc3459009c33e Srinivas Kandagatla     2023-02-09  3881  	ret = rx_macro_register_mclk_output(rx);
1dc3459009c33e Srinivas Kandagatla     2023-02-09  3882  	if (ret)
1dc3459009c33e Srinivas Kandagatla     2023-02-09  3883  		goto err_clkout;
1dc3459009c33e Srinivas Kandagatla     2023-02-09  3884  
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3885  	kfree(reg_defaults);
43b647d9940454 Srinivas Kandagatla     2022-02-24  3886  	return 0;
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3887  
43b647d9940454 Srinivas Kandagatla     2022-02-24  3888  err_clkout:
43b647d9940454 Srinivas Kandagatla     2022-02-24  3889  	clk_disable_unprepare(rx->fsgen);
43b647d9940454 Srinivas Kandagatla     2022-02-24  3890  err_fsgen:
43b647d9940454 Srinivas Kandagatla     2022-02-24  3891  	clk_disable_unprepare(rx->npl);
43b647d9940454 Srinivas Kandagatla     2022-02-24  3892  err_npl:
43b647d9940454 Srinivas Kandagatla     2022-02-24  3893  	clk_disable_unprepare(rx->mclk);
43b647d9940454 Srinivas Kandagatla     2022-02-24  3894  err_mclk:
43b647d9940454 Srinivas Kandagatla     2022-02-24  3895  	clk_disable_unprepare(rx->dcodec);
43b647d9940454 Srinivas Kandagatla     2022-02-24  3896  err_dcodec:
43b647d9940454 Srinivas Kandagatla     2022-02-24  3897  	clk_disable_unprepare(rx->macro);
70a5e96bad5921 Srinivas Kandagatla     2022-02-24  3898  err:
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10 @3899  	kfree(reg_defaults);
ddfd5345281466 Christophe JAILLET      2022-04-03  3900  	lpass_macro_pds_exit(rx->pds);
ddfd5345281466 Christophe JAILLET      2022-04-03  3901  
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3902  	return ret;
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3903  }
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3904  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
