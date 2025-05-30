Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF59C211A27
	for <oe-kbuild@lists.linux.dev>; Fri, 30 May 2025 21:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748641224; cv=none; b=J4fNje+O3+F1s3RmQ5bnpoHfTUCyeFY9CcTv9I0ZnzSRD/fb7D0Nsl/8ojD4jNN+mx1TbRQL/FzbRhtvyMR8/cfOvrnLEljAUfccNdt7jnGmj9cJ2fPk+aP11Yzh6JyuwP6m/HpjuyAlkaf3Fv8mxFmiLw4SsLumrp3VAvKcZN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748641224; c=relaxed/simple;
	bh=2vXtEZ9ZsSkFiOh+lJraemItlWGck9pas7a8wOu9oNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n0pF2cTRaw/F9tPx1UUp9j+ypxvlXpHxa6EX6I1dBpl7H53XzPzF1tgDINBnuS6wbovTsT64V4vy/bgbU8yhlEIk/TZjjpXDOoNr9o9Z5cQQV12Xspil4e3NHjxlrnIOJq0K0cdV/X6F2yRSXsTmoy/uVnJV6aUWs7NXi+KLxIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dspjh/en; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dspjh/en"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748641223; x=1780177223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2vXtEZ9ZsSkFiOh+lJraemItlWGck9pas7a8wOu9oNI=;
  b=Dspjh/enulyqdOxHw1lEyxFR13iCgk16Z4JbIuBHAsppQbrb0xFD/znp
   estE1CAiEV8eH8PC91OEHA+jkJwZK7iGI6WJm5seUxd2pDBsgDouXtdc0
   nvFmyA+U+O5V60fK63QrOufBt22sXSItI11p8S2Zi0ylratpz8O7Rc5aY
   XTTBVjpt8HmIi4O5FNLrpQVZAGO+pD+o3UpZiLrfC/yhs0K+n8FVU76hZ
   ucjUeGdy8mOfGON/DgPEiR3dpSpBUnPI0S9bYCC2IGv+cN/mQZBrLVZKw
   7GDAJiq55d6IOePC85gMaMFJCGq+fC3mogdOIA5ZdjJCDShdj6NJyHCOO
   Q==;
X-CSE-ConnectionGUID: kZU7rsWbS8CpD0Uf9IChcQ==
X-CSE-MsgGUID: 8z8md9XKRpu71J4+FY0tQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="61368548"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="61368548"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 14:40:02 -0700
X-CSE-ConnectionGUID: /OW/cmBFSF2BvjfaREclDA==
X-CSE-MsgGUID: UfBsJ5UNQfmDZ77gM0iEkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="181191784"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 May 2025 14:40:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uL7SI-000XzE-1N;
	Fri, 30 May 2025 21:39:58 +0000
Date: Sat, 31 May 2025 05:39:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 32/35] mmc: sdhci-xenon: Drop the use of
 sdhci_pltfm_free()
Message-ID: <202505310526.Nh371Swn-lkp@intel.com>
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
In-Reply-To: <b79920fa8bff8f7cf2f407863846446344d2eab7.1748515612.git.zhoubinbin@loongson.cn>
References: <b79920fa8bff8f7cf2f407863846446344d2eab7.1748515612.git.zhoubinbin@loongson.cn>
TO: Binbin Zhou <zhoubinbin@loongson.cn>
TO: Binbin Zhou <zhoubb.aaron@gmail.com>
TO: Huacai Chen <chenhuacai@loongson.cn>
TO: Ulf Hansson <ulf.hansson@linaro.org>
TO: Adrian Hunter <adrian.hunter@intel.com>
CC: linux-mmc@vger.kernel.org
CC: Andrew Jeffery <andrew@codeconstruct.com.au>
CC: Hu Ziji <huziji@marvell.com>

Hi Binbin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d2c6acff6386f43ed307822454b970c831c48f1b]

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/mmc-sdhci-Use-devm_mmc_alloc_host-helper/20250529-212928
base:   d2c6acff6386f43ed307822454b970c831c48f1b
patch link:    https://lore.kernel.org/r/b79920fa8bff8f7cf2f407863846446344d2eab7.1748515612.git.zhoubinbin%40loongson.cn
patch subject: [PATCH v2 32/35] mmc: sdhci-xenon: Drop the use of sdhci_pltfm_free()
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: i386-randconfig-141-20250530 (https://download.01.org/0day-ci/archive/20250531/202505310526.Nh371Swn-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505310526.Nh371Swn-lkp@intel.com/

smatch warnings:
drivers/mmc/host/sdhci-xenon.c:536 xenon_probe() error: uninitialized symbol 'err'.

vim +/err +536 drivers/mmc/host/sdhci-xenon.c

3a3748dba881ed Hu Ziji         2017-03-30  508  
3a3748dba881ed Hu Ziji         2017-03-30  509  static int xenon_probe(struct platform_device *pdev)
3a3748dba881ed Hu Ziji         2017-03-30  510  {
3a3748dba881ed Hu Ziji         2017-03-30  511  	struct sdhci_pltfm_host *pltfm_host;
1542488031deed Marcin Wojtas   2020-12-04  512  	struct device *dev = &pdev->dev;
3a3748dba881ed Hu Ziji         2017-03-30  513  	struct sdhci_host *host;
bb16ea1742c8f3 Gregory CLEMENT 2017-10-02  514  	struct xenon_priv *priv;
3a3748dba881ed Hu Ziji         2017-03-30  515  	int err;
3a3748dba881ed Hu Ziji         2017-03-30  516  
3a3748dba881ed Hu Ziji         2017-03-30  517  	host = sdhci_pltfm_init(pdev, &sdhci_xenon_pdata,
3a3748dba881ed Hu Ziji         2017-03-30  518  				sizeof(struct xenon_priv));
3a3748dba881ed Hu Ziji         2017-03-30  519  	if (IS_ERR(host))
3a3748dba881ed Hu Ziji         2017-03-30  520  		return PTR_ERR(host);
3a3748dba881ed Hu Ziji         2017-03-30  521  
3a3748dba881ed Hu Ziji         2017-03-30  522  	pltfm_host = sdhci_priv(host);
bb16ea1742c8f3 Gregory CLEMENT 2017-10-02  523  	priv = sdhci_pltfm_priv(pltfm_host);
3a3748dba881ed Hu Ziji         2017-03-30  524  
f75fda3730728e Marcin Wojtas   2020-12-04  525  	priv->hw_version = (unsigned long)device_get_match_data(&pdev->dev);
f75fda3730728e Marcin Wojtas   2020-12-04  526  
3a3748dba881ed Hu Ziji         2017-03-30  527  	/*
3a3748dba881ed Hu Ziji         2017-03-30  528  	 * Link Xenon specific mmc_host_ops function,
3a3748dba881ed Hu Ziji         2017-03-30  529  	 * to replace standard ones in sdhci_ops.
3a3748dba881ed Hu Ziji         2017-03-30  530  	 */
3a3748dba881ed Hu Ziji         2017-03-30  531  	xenon_replace_mmc_host_ops(host);
3a3748dba881ed Hu Ziji         2017-03-30  532  
1542488031deed Marcin Wojtas   2020-12-04  533  	if (dev->of_node) {
3a3748dba881ed Hu Ziji         2017-03-30  534  		pltfm_host->clk = devm_clk_get(&pdev->dev, "core");
3a3748dba881ed Hu Ziji         2017-03-30  535  		if (IS_ERR(pltfm_host->clk)) {
3a3748dba881ed Hu Ziji         2017-03-30 @536  			dev_err(&pdev->dev, "Failed to setup input clk: %d\n", err);
6773eb1cf68bcb Binbin Zhou     2025-05-29  537  			return PTR_ERR(pltfm_host->clk);
3a3748dba881ed Hu Ziji         2017-03-30  538  		}
3a3748dba881ed Hu Ziji         2017-03-30  539  		err = clk_prepare_enable(pltfm_host->clk);
3a3748dba881ed Hu Ziji         2017-03-30  540  		if (err)
6773eb1cf68bcb Binbin Zhou     2025-05-29  541  			return err;
3a3748dba881ed Hu Ziji         2017-03-30  542  
bb16ea1742c8f3 Gregory CLEMENT 2017-10-02  543  		priv->axi_clk = devm_clk_get(&pdev->dev, "axi");
bb16ea1742c8f3 Gregory CLEMENT 2017-10-02  544  		if (IS_ERR(priv->axi_clk)) {
bb16ea1742c8f3 Gregory CLEMENT 2017-10-02  545  			err = PTR_ERR(priv->axi_clk);
bb16ea1742c8f3 Gregory CLEMENT 2017-10-02  546  			if (err == -EPROBE_DEFER)
bb16ea1742c8f3 Gregory CLEMENT 2017-10-02  547  				goto err_clk;
bb16ea1742c8f3 Gregory CLEMENT 2017-10-02  548  		} else {
bb16ea1742c8f3 Gregory CLEMENT 2017-10-02  549  			err = clk_prepare_enable(priv->axi_clk);
3a3748dba881ed Hu Ziji         2017-03-30  550  			if (err)
3a3748dba881ed Hu Ziji         2017-03-30  551  				goto err_clk;
bb16ea1742c8f3 Gregory CLEMENT 2017-10-02  552  		}
1542488031deed Marcin Wojtas   2020-12-04  553  	}
bb16ea1742c8f3 Gregory CLEMENT 2017-10-02  554  
bb16ea1742c8f3 Gregory CLEMENT 2017-10-02  555  	err = mmc_of_parse(host->mmc);
bb16ea1742c8f3 Gregory CLEMENT 2017-10-02  556  	if (err)
bb16ea1742c8f3 Gregory CLEMENT 2017-10-02  557  		goto err_clk_axi;
3a3748dba881ed Hu Ziji         2017-03-30  558  
f29bf660bf4137 Marcin Wojtas   2020-12-04  559  	sdhci_get_property(pdev);
3a3748dba881ed Hu Ziji         2017-03-30  560  
3a3748dba881ed Hu Ziji         2017-03-30  561  	xenon_set_acg(host, false);
3a3748dba881ed Hu Ziji         2017-03-30  562  
f29bf660bf4137 Marcin Wojtas   2020-12-04  563  	/* Xenon specific parameters parse */
f29bf660bf4137 Marcin Wojtas   2020-12-04  564  	err = xenon_probe_params(pdev);
3a3748dba881ed Hu Ziji         2017-03-30  565  	if (err)
bb16ea1742c8f3 Gregory CLEMENT 2017-10-02  566  		goto err_clk_axi;
3a3748dba881ed Hu Ziji         2017-03-30  567  
3a3748dba881ed Hu Ziji         2017-03-30  568  	err = xenon_sdhc_prepare(host);
3a3748dba881ed Hu Ziji         2017-03-30  569  	if (err)
bb16ea1742c8f3 Gregory CLEMENT 2017-10-02  570  		goto err_clk_axi;
3a3748dba881ed Hu Ziji         2017-03-30  571  
a027b2c5fed788 Zhoujie Wu      2017-08-29  572  	pm_runtime_get_noresume(&pdev->dev);
a027b2c5fed788 Zhoujie Wu      2017-08-29  573  	pm_runtime_set_active(&pdev->dev);
a027b2c5fed788 Zhoujie Wu      2017-08-29  574  	pm_runtime_set_autosuspend_delay(&pdev->dev, 50);
a027b2c5fed788 Zhoujie Wu      2017-08-29  575  	pm_runtime_use_autosuspend(&pdev->dev);
a027b2c5fed788 Zhoujie Wu      2017-08-29  576  	pm_runtime_enable(&pdev->dev);
a027b2c5fed788 Zhoujie Wu      2017-08-29  577  	pm_suspend_ignore_children(&pdev->dev, 1);
a027b2c5fed788 Zhoujie Wu      2017-08-29  578  
3a3748dba881ed Hu Ziji         2017-03-30  579  	err = sdhci_add_host(host);
3a3748dba881ed Hu Ziji         2017-03-30  580  	if (err)
3a3748dba881ed Hu Ziji         2017-03-30  581  		goto remove_sdhc;
3a3748dba881ed Hu Ziji         2017-03-30  582  
a027b2c5fed788 Zhoujie Wu      2017-08-29  583  	pm_runtime_put_autosuspend(&pdev->dev);
5d40213347480e Elad Nachman    2024-01-04  584  	/*
5d40213347480e Elad Nachman    2024-01-04  585  	 * If we previously detected AC5 with over 2GB of memory,
5d40213347480e Elad Nachman    2024-01-04  586  	 * then we disable ADMA and 64-bit DMA.
5d40213347480e Elad Nachman    2024-01-04  587  	 * This means generic SDHCI driver has set the DMA mask to
5d40213347480e Elad Nachman    2024-01-04  588  	 * 32-bit. Since DDR starts at 0x2_0000_0000, we must use
5d40213347480e Elad Nachman    2024-01-04  589  	 * 34-bit DMA mask to access this DDR memory:
5d40213347480e Elad Nachman    2024-01-04  590  	 */
5d40213347480e Elad Nachman    2024-01-04  591  	if (priv->hw_version == XENON_AC5 &&
5d40213347480e Elad Nachman    2024-01-04  592  	    host->quirks2 & SDHCI_QUIRK2_BROKEN_64_BIT_DMA)
5d40213347480e Elad Nachman    2024-01-04  593  		dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
a027b2c5fed788 Zhoujie Wu      2017-08-29  594  
3a3748dba881ed Hu Ziji         2017-03-30  595  	return 0;
3a3748dba881ed Hu Ziji         2017-03-30  596  
3a3748dba881ed Hu Ziji         2017-03-30  597  remove_sdhc:
a027b2c5fed788 Zhoujie Wu      2017-08-29  598  	pm_runtime_disable(&pdev->dev);
a027b2c5fed788 Zhoujie Wu      2017-08-29  599  	pm_runtime_put_noidle(&pdev->dev);
3a3748dba881ed Hu Ziji         2017-03-30  600  	xenon_sdhc_unprepare(host);
bb16ea1742c8f3 Gregory CLEMENT 2017-10-02  601  err_clk_axi:
bb16ea1742c8f3 Gregory CLEMENT 2017-10-02  602  	clk_disable_unprepare(priv->axi_clk);
3a3748dba881ed Hu Ziji         2017-03-30  603  err_clk:
3a3748dba881ed Hu Ziji         2017-03-30  604  	clk_disable_unprepare(pltfm_host->clk);
3a3748dba881ed Hu Ziji         2017-03-30  605  	return err;
3a3748dba881ed Hu Ziji         2017-03-30  606  }
3a3748dba881ed Hu Ziji         2017-03-30  607  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
