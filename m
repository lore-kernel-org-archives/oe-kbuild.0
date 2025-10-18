Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB243595C
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Oct 2025 03:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760757467; cv=none; b=CmZtGx5NgCTqDTDEXDhF5B0lQ/V1ftW8r6e9Z6zlc9UqQH/kApHAnaMETuhx5l2ugb78kPGCL4CMAkx/E096MZQqVZjHmHZh1Uuvcl7msgqr+ZYRi9uwgDTiFXwn59qTsVP9b2Qf7pCfr3LIKM4S1ov2wETOIEVRe8hqbxLQCds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760757467; c=relaxed/simple;
	bh=A8YiIuER7otQCcetf+9/mdL6IjzE9+7pHJf8070ucII=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H35mnY5eMrl6GY6azJ61FZQGNUaJib9vIXuH1eP574OhZRjjWiZRxEhwZrquzzdGjAF2w4A8+IH2Scx1ME7vQ/KFe7IXwOU/uNootTiPSJaPqLk40qpcue4w+yloTO+BCHkcdtRr/C5dFD9v7ZK0aoUqTfhUiRnuUpG5yCqmTL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YYuJQvYD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YYuJQvYD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760757466; x=1792293466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A8YiIuER7otQCcetf+9/mdL6IjzE9+7pHJf8070ucII=;
  b=YYuJQvYDC/GLW/5Mem4eqDc6BBCtpAp2B8MMx2jussqOa6J0329vfgOD
   SI7kkvCnImN4kiUsDQmbBMCgBqbKVLSlv3+hlgo9PjoN/MsgEP8z3k7qH
   eZ5TC/rg52sTIPtNGUQvOv8rz+0PYc621KyRXaBj753mVcEOVPoaBOKZe
   BbmeTlq0FVOMWcj6hB0cX3YPQCWhmvWzioi+w0JQuI2z/PmNHvJ9qVE9J
   qQpB8zaTEdwWRRnXEYz9aUXeV3tHnJI2Ljsj+6tnOx/S4zh0cCnkp8lIA
   L5R52FsnTCEAdDa8BZ7dBI1YnFDOdlcaoA61QU0S2avUri+A1OljNn89V
   A==;
X-CSE-ConnectionGUID: LaB6C54DRaajdEEzxIb0kg==
X-CSE-MsgGUID: fQpQ3nxzR8KFQIwGsG7PxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="80412383"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="80412383"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 20:17:45 -0700
X-CSE-ConnectionGUID: xxKYW46OQLK6QmdvqVJbUQ==
X-CSE-MsgGUID: d5+0aeWmRWWbdk9QUGX41Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; 
   d="scan'208";a="182031022"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 17 Oct 2025 17:55:43 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9vES-0007tf-0r;
	Sat, 18 Oct 2025 00:55:40 +0000
Date: Sat, 18 Oct 2025 08:54:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2032/2588] sound/soc/codecs/lpass-va-macro.c:1635
 va_macro_probe() warn: missing unwind goto?
Message-ID: <202510180829.AWgjgnn0-lkp@intel.com>
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
TO: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Mark Brown <broonie@kernel.org>
CC: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
CC: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   93f3bab4310d4ff73027cc4f87174284d4977acf
commit: 281c97376cfcfc8cef4f5ed5dd961a1b39f5a25e [2032/2588] ASoC: codecs: va-macro: Rework version checking
:::::: branch date: 10 hours ago
:::::: commit date: 33 hours ago
config: x86_64-randconfig-161-20251018 (https://download.01.org/0day-ci/archive/20251018/202510180829.AWgjgnn0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510180829.AWgjgnn0-lkp@intel.com/

smatch warnings:
sound/soc/codecs/lpass-va-macro.c:1635 va_macro_probe() warn: missing unwind goto?
sound/soc/codecs/lpass-va-macro.c:1697 va_macro_probe() warn: 'va->dcodec' from clk_prepare_enable() not released on lines: 1635.
sound/soc/codecs/lpass-va-macro.c:1697 va_macro_probe() warn: 'va->macro' from clk_prepare_enable() not released on lines: 1635.
sound/soc/codecs/lpass-va-macro.c:1697 va_macro_probe() warn: 'va->mclk' from clk_prepare_enable() not released on lines: 1635.
sound/soc/codecs/lpass-va-macro.c:1697 va_macro_probe() warn: 'va->npl' from clk_prepare_enable() not released on lines: 1635.

vim +1635 sound/soc/codecs/lpass-va-macro.c

378918d5918116 Srinivas Kandagatla     2024-06-13  1531  
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1532  static int va_macro_probe(struct platform_device *pdev)
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1533  {
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1534  	struct device *dev = &pdev->dev;
0f47dd211938d5 Srinivas Kandagatla     2022-09-06  1535  	const struct va_macro_data *data;
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1536  	struct va_macro *va;
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1537  	void __iomem *base;
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1538  	u32 sample_rate = 0;
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1539  	int ret;
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1540  
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1541  	va = devm_kzalloc(dev, sizeof(*va), GFP_KERNEL);
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1542  	if (!va)
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1543  		return -ENOMEM;
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1544  
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1545  	va->dev = dev;
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1546  
bed17757521b8b Srinivas Kandagatla     2022-02-24  1547  	va->macro = devm_clk_get_optional(dev, "macro");
bed17757521b8b Srinivas Kandagatla     2022-02-24  1548  	if (IS_ERR(va->macro))
f54e3474507427 Bjorn Andersson         2023-07-21  1549  		return dev_err_probe(dev, PTR_ERR(va->macro), "unable to get macro clock\n");
bed17757521b8b Srinivas Kandagatla     2022-02-24  1550  
bed17757521b8b Srinivas Kandagatla     2022-02-24  1551  	va->dcodec = devm_clk_get_optional(dev, "dcodec");
bed17757521b8b Srinivas Kandagatla     2022-02-24  1552  	if (IS_ERR(va->dcodec))
f54e3474507427 Bjorn Andersson         2023-07-21  1553  		return dev_err_probe(dev, PTR_ERR(va->dcodec), "unable to get dcodec clock\n");
bed17757521b8b Srinivas Kandagatla     2022-02-24  1554  
bed17757521b8b Srinivas Kandagatla     2022-02-24  1555  	va->mclk = devm_clk_get(dev, "mclk");
bed17757521b8b Srinivas Kandagatla     2022-02-24  1556  	if (IS_ERR(va->mclk))
f54e3474507427 Bjorn Andersson         2023-07-21  1557  		return dev_err_probe(dev, PTR_ERR(va->mclk), "unable to get mclk clock\n");
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1558  
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  1559  	va->pds = lpass_macro_pds_init(dev);
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  1560  	if (IS_ERR(va->pds))
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  1561  		return PTR_ERR(va->pds);
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1562  
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1563  	ret = of_property_read_u32(dev->of_node, "qcom,dmic-sample-rate",
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1564  				   &sample_rate);
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1565  	if (ret) {
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1566  		dev_err(dev, "qcom,dmic-sample-rate dt entry missing\n");
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1567  		va->dmic_clk_div = VA_MACRO_CLK_DIV_2;
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1568  	} else {
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1569  		ret = va_macro_validate_dmic_sample_rate(sample_rate, va);
ddfd5345281466 Christophe JAILLET      2022-04-03  1570  		if (!ret) {
ddfd5345281466 Christophe JAILLET      2022-04-03  1571  			ret = -EINVAL;
ddfd5345281466 Christophe JAILLET      2022-04-03  1572  			goto err;
ddfd5345281466 Christophe JAILLET      2022-04-03  1573  		}
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1574  	}
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1575  
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1576  	base = devm_platform_ioremap_resource(pdev, 0);
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1577  	if (IS_ERR(base)) {
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1578  		ret = PTR_ERR(base);
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1579  		goto err;
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1580  	}
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1581  
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1582  	va->regmap = devm_regmap_init_mmio(dev, base,  &va_regmap_config);
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1583  	if (IS_ERR(va->regmap)) {
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1584  		ret = -EINVAL;
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1585  		goto err;
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1586  	}
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1587  
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1588  	dev_set_drvdata(dev, va);
bed17757521b8b Srinivas Kandagatla     2022-02-24  1589  
0f47dd211938d5 Srinivas Kandagatla     2022-09-06  1590  	data = of_device_get_match_data(dev);
0f47dd211938d5 Srinivas Kandagatla     2022-09-06  1591  	va->has_swr_master = data->has_swr_master;
a6eb64e7e32c7a Srinivas Kandagatla     2024-02-03  1592  	va->has_npl_clk = data->has_npl_clk;
0f47dd211938d5 Srinivas Kandagatla     2022-09-06  1593  
bed17757521b8b Srinivas Kandagatla     2022-02-24  1594  	/* mclk rate */
bed17757521b8b Srinivas Kandagatla     2022-02-24  1595  	clk_set_rate(va->mclk, 2 * VA_MACRO_MCLK_FREQ);
bed17757521b8b Srinivas Kandagatla     2022-02-24  1596  
a6eb64e7e32c7a Srinivas Kandagatla     2024-02-03  1597  	if (va->has_npl_clk) {
a6eb64e7e32c7a Srinivas Kandagatla     2024-02-03  1598  		va->npl = devm_clk_get(dev, "npl");
a6eb64e7e32c7a Srinivas Kandagatla     2024-02-03  1599  		if (IS_ERR(va->npl)) {
a6eb64e7e32c7a Srinivas Kandagatla     2024-02-03  1600  			ret = PTR_ERR(va->npl);
a6eb64e7e32c7a Srinivas Kandagatla     2024-02-03  1601  			goto err;
a6eb64e7e32c7a Srinivas Kandagatla     2024-02-03  1602  		}
a6eb64e7e32c7a Srinivas Kandagatla     2024-02-03  1603  
a6eb64e7e32c7a Srinivas Kandagatla     2024-02-03  1604  		clk_set_rate(va->npl, 2 * VA_MACRO_MCLK_FREQ);
a6eb64e7e32c7a Srinivas Kandagatla     2024-02-03  1605  	}
a6eb64e7e32c7a Srinivas Kandagatla     2024-02-03  1606  
bed17757521b8b Srinivas Kandagatla     2022-02-24  1607  	ret = clk_prepare_enable(va->macro);
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1608  	if (ret)
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1609  		goto err;
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1610  
bed17757521b8b Srinivas Kandagatla     2022-02-24  1611  	ret = clk_prepare_enable(va->dcodec);
bed17757521b8b Srinivas Kandagatla     2022-02-24  1612  	if (ret)
bed17757521b8b Srinivas Kandagatla     2022-02-24  1613  		goto err_dcodec;
bed17757521b8b Srinivas Kandagatla     2022-02-24  1614  
bed17757521b8b Srinivas Kandagatla     2022-02-24  1615  	ret = clk_prepare_enable(va->mclk);
bed17757521b8b Srinivas Kandagatla     2022-02-24  1616  	if (ret)
bed17757521b8b Srinivas Kandagatla     2022-02-24  1617  		goto err_mclk;
bed17757521b8b Srinivas Kandagatla     2022-02-24  1618  
a6eb64e7e32c7a Srinivas Kandagatla     2024-02-03  1619  	if (va->has_npl_clk) {
a6eb64e7e32c7a Srinivas Kandagatla     2024-02-03  1620  		ret = clk_prepare_enable(va->npl);
a6eb64e7e32c7a Srinivas Kandagatla     2024-02-03  1621  		if (ret)
a6eb64e7e32c7a Srinivas Kandagatla     2024-02-03  1622  			goto err_npl;
a6eb64e7e32c7a Srinivas Kandagatla     2024-02-03  1623  	}
a6eb64e7e32c7a Srinivas Kandagatla     2024-02-03  1624  
77212f300bfd6f Srinivas Kandagatla     2024-08-16  1625  	/**
77212f300bfd6f Srinivas Kandagatla     2024-08-16  1626  	 * old version of codecs do not have a reliable way to determine the
77212f300bfd6f Srinivas Kandagatla     2024-08-16  1627  	 * version from registers, get them from soc specific data
77212f300bfd6f Srinivas Kandagatla     2024-08-16  1628  	 */
281c97376cfcfc Konrad Dybcio           2025-10-15  1629  	if (data->version) {
77212f300bfd6f Srinivas Kandagatla     2024-08-16  1630  		lpass_macro_set_codec_version(data->version);
281c97376cfcfc Konrad Dybcio           2025-10-15  1631  	} else {
281c97376cfcfc Konrad Dybcio           2025-10-15  1632  		/* read version from register */
281c97376cfcfc Konrad Dybcio           2025-10-15  1633  		ret = va_macro_set_lpass_codec_version(va);
281c97376cfcfc Konrad Dybcio           2025-10-15  1634  		if (ret)
281c97376cfcfc Konrad Dybcio           2025-10-15 @1635  			return ret;
281c97376cfcfc Konrad Dybcio           2025-10-15  1636  	}
378918d5918116 Srinivas Kandagatla     2024-06-13  1637  
0f47dd211938d5 Srinivas Kandagatla     2022-09-06  1638  	if (va->has_swr_master) {
0f47dd211938d5 Srinivas Kandagatla     2022-09-06  1639  		/* Set default CLK div to 1 */
0f47dd211938d5 Srinivas Kandagatla     2022-09-06  1640  		regmap_update_bits(va->regmap, CDC_VA_TOP_CSR_SWR_MIC_CTL0,
0f47dd211938d5 Srinivas Kandagatla     2022-09-06  1641  				  CDC_VA_SWR_MIC_CLK_SEL_0_1_MASK,
0f47dd211938d5 Srinivas Kandagatla     2022-09-06  1642  				  CDC_VA_SWR_MIC_CLK_SEL_0_1_DIV1);
0f47dd211938d5 Srinivas Kandagatla     2022-09-06  1643  		regmap_update_bits(va->regmap, CDC_VA_TOP_CSR_SWR_MIC_CTL1,
0f47dd211938d5 Srinivas Kandagatla     2022-09-06  1644  				  CDC_VA_SWR_MIC_CLK_SEL_0_1_MASK,
0f47dd211938d5 Srinivas Kandagatla     2022-09-06  1645  				  CDC_VA_SWR_MIC_CLK_SEL_0_1_DIV1);
0f47dd211938d5 Srinivas Kandagatla     2022-09-06  1646  		regmap_update_bits(va->regmap, CDC_VA_TOP_CSR_SWR_MIC_CTL2,
0f47dd211938d5 Srinivas Kandagatla     2022-09-06  1647  				  CDC_VA_SWR_MIC_CLK_SEL_0_1_MASK,
0f47dd211938d5 Srinivas Kandagatla     2022-09-06  1648  				  CDC_VA_SWR_MIC_CLK_SEL_0_1_DIV1);
0f47dd211938d5 Srinivas Kandagatla     2022-09-06  1649  
0f47dd211938d5 Srinivas Kandagatla     2022-09-06  1650  	}
0f47dd211938d5 Srinivas Kandagatla     2022-09-06  1651  
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  1652  	if (va->has_swr_master) {
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  1653  		regmap_update_bits(va->regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  1654  				   CDC_VA_SWR_RESET_MASK,  CDC_VA_SWR_RESET_ENABLE);
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  1655  		regmap_update_bits(va->regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  1656  				   CDC_VA_SWR_CLK_EN_MASK, CDC_VA_SWR_CLK_ENABLE);
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  1657  		regmap_update_bits(va->regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  1658  				   CDC_VA_SWR_RESET_MASK, 0x0);
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  1659  	}
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  1660  
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1661  	ret = devm_snd_soc_register_component(dev, &va_macro_component_drv,
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1662  					      va_macro_dais,
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1663  					      ARRAY_SIZE(va_macro_dais));
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1664  	if (ret)
bed17757521b8b Srinivas Kandagatla     2022-02-24  1665  		goto err_clkout;
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1666  
72ad25eabda0ac Srinivas Kandagatla     2022-02-24  1667  	pm_runtime_set_autosuspend_delay(dev, 3000);
72ad25eabda0ac Srinivas Kandagatla     2022-02-24  1668  	pm_runtime_use_autosuspend(dev);
72ad25eabda0ac Srinivas Kandagatla     2022-02-24  1669  	pm_runtime_mark_last_busy(dev);
72ad25eabda0ac Srinivas Kandagatla     2022-02-24  1670  	pm_runtime_set_active(dev);
72ad25eabda0ac Srinivas Kandagatla     2022-02-24  1671  	pm_runtime_enable(dev);
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1672  
1dc3459009c33e Srinivas Kandagatla     2023-02-09  1673  	ret = va_macro_register_fsgen_output(va);
1dc3459009c33e Srinivas Kandagatla     2023-02-09  1674  	if (ret)
1dc3459009c33e Srinivas Kandagatla     2023-02-09  1675  		goto err_clkout;
1dc3459009c33e Srinivas Kandagatla     2023-02-09  1676  
1dc3459009c33e Srinivas Kandagatla     2023-02-09  1677  	va->fsgen = clk_hw_get_clk(&va->hw, "fsgen");
1dc3459009c33e Srinivas Kandagatla     2023-02-09  1678  	if (IS_ERR(va->fsgen)) {
1dc3459009c33e Srinivas Kandagatla     2023-02-09  1679  		ret = PTR_ERR(va->fsgen);
1dc3459009c33e Srinivas Kandagatla     2023-02-09  1680  		goto err_clkout;
1dc3459009c33e Srinivas Kandagatla     2023-02-09  1681  	}
1dc3459009c33e Srinivas Kandagatla     2023-02-09  1682  
bed17757521b8b Srinivas Kandagatla     2022-02-24  1683  	return 0;
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1684  
bed17757521b8b Srinivas Kandagatla     2022-02-24  1685  err_clkout:
a6eb64e7e32c7a Srinivas Kandagatla     2024-02-03  1686  	if (va->has_npl_clk)
a6eb64e7e32c7a Srinivas Kandagatla     2024-02-03  1687  		clk_disable_unprepare(va->npl);
a6eb64e7e32c7a Srinivas Kandagatla     2024-02-03  1688  err_npl:
bed17757521b8b Srinivas Kandagatla     2022-02-24  1689  	clk_disable_unprepare(va->mclk);
bed17757521b8b Srinivas Kandagatla     2022-02-24  1690  err_mclk:
bed17757521b8b Srinivas Kandagatla     2022-02-24  1691  	clk_disable_unprepare(va->dcodec);
bed17757521b8b Srinivas Kandagatla     2022-02-24  1692  err_dcodec:
bed17757521b8b Srinivas Kandagatla     2022-02-24  1693  	clk_disable_unprepare(va->macro);
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1694  err:
ddfd5345281466 Christophe JAILLET      2022-04-03  1695  	lpass_macro_pds_exit(va->pds);
ddfd5345281466 Christophe JAILLET      2022-04-03  1696  
908e6b1df26efc Srinivas Kandagatla     2020-11-05 @1697  	return ret;
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1698  }
908e6b1df26efc Srinivas Kandagatla     2020-11-05  1699  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
