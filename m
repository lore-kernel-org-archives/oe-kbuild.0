Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451322E8B69
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Oct 2025 09:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760347371; cv=none; b=S9mWU8LXsSlOxbl65CwPrZyjfFup1sJtArQutatevTR/82FgKf2E+jRk+fuhUywt7bECEZULW6w7OjajtGSCFvhk7bXC6rbSeKyBeLSqtwTatDXAbsyGPnr8aPr2VxXblp4CmOcIyb2opKaB2EMLuyik2Z5Bdiiu3C4qXm/D660=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760347371; c=relaxed/simple;
	bh=CenBEt3dKgRkjqhBJRP/9JYqmRlgH4RicISG1U8nFqk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tel7HlVz9DyHP6PATdei3c5Zb7UkHGxqLt+WBk3d01Gx8sU3r4yhMuC0o9c0TUuogziJLIT91ekKJQUAAcSKlxFsPqdz0jvUfsdTmry8EaocHdQG5ViGoQFBpozNk5EzjQNBxB5QcE/uuUBcCl/6pUU0IV8xNSj5gHLERo+Vy0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fl0Exqb1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fl0Exqb1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760347369; x=1791883369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CenBEt3dKgRkjqhBJRP/9JYqmRlgH4RicISG1U8nFqk=;
  b=Fl0Exqb18XOb1Z3hCpc5HcLwt4M/NNtt6gHNW4+Ls3Hj/kr42U9Eo0ZF
   ftTxmUwWrxbdQjD/VpfVMGkUj4zKSdPo7Um+QgKBvLTNdyPqHiv8jrKz+
   C5Ymf5qtDSC2sjKCxkf5gRtd0K8Lq7J1tmDNwOTUV5qguFP2X0EuGNLBM
   kLCu6eu1DQdtZHVgv2XZf4R70XDo9ru9+YPlEwgjLXJBTUFpgM5NpLAvr
   3YW65jeU5zkaWKBGIT0Z86/x+po/+J3Kfg9Oa+D6g4neaYF4PU70l3rWN
   AJufvTJsQ8yRpMkXapMiAF0hLgHtWMXJ9sSlwmPpOAyZ5xPNKcqG3XYub
   g==;
X-CSE-ConnectionGUID: jCRHNepES16uyPz0pN6A+Q==
X-CSE-MsgGUID: ExN7LQZsQ9qTBUdYaXdv0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66306984"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="66306984"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 02:22:46 -0700
X-CSE-ConnectionGUID: KXFb/J6yTM+8JF7jZaoxKw==
X-CSE-MsgGUID: i+CF4AS4SPCLbO2ZEhX7bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="181120394"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 13 Oct 2025 02:22:45 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8ElP-0000Jb-0C;
	Mon, 13 Oct 2025 09:22:43 +0000
Date: Mon, 13 Oct 2025 17:22:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
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

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251011111216.570-1-hehuan1@eswincomputing.com>
References: <20251011111216.570-1-hehuan1@eswincomputing.com>
TO: hehuan1@eswincomputing.com
TO: ulf.hansson@linaro.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: jszhang@kernel.org
TO: adrian.hunter@intel.com
TO: p.zabel@pengutronix.de
TO: linux-mmc@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: ningyu@eswincomputing.com
CC: linmin@eswincomputing.com
CC: pinkesh.vaghela@einfochips.com
CC: xuxiang@eswincomputing.com
CC: luyulin@eswincomputing.com
CC: dongxuyang@eswincomputing.com
CC: zhangsenchuan@eswincomputing.com
CC: weishangjuan@eswincomputing.com
CC: lizhi2@eswincomputing.com
CC: caohang@eswincomputing.com
CC: hehuan1@eswincomputing.com
CC: kernel test robot <lkp@intel.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on ulf-hansson-mmc-mirror/next v6.18-rc1 next-20251010]
[cannot apply to robh/for-next pza/reset/next pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/hehuan1-eswincomputing-com/dt-bindings-mmc-sdhci-of-dwcmshc-Add-Eswin-EIC7700/20251011-191312
base:   linus/master
patch link:    https://lore.kernel.org/r/20251011111216.570-1-hehuan1%40eswincomputing.com
patch subject: [PATCH v4 2/2] mmc: sdhci-of-dwcmshc: Add support for Eswin EIC7700
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: s390-randconfig-r073-20251013 (https://download.01.org/0day-ci/archive/20251013/202510131636.lJ5QxMpK-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510131636.lJ5QxMpK-lkp@intel.com/

New smatch warnings:
drivers/mmc/host/sdhci-of-dwcmshc.c:1547 eic7700_init() warn: missing error code? 'ret'

Old smatch warnings:
drivers/mmc/host/sdhci-of-dwcmshc.c:1079 cv18xx_sdhci_execute_tuning() error: uninitialized symbol 'target_min'.
drivers/mmc/host/sdhci-of-dwcmshc.c:1079 cv18xx_sdhci_execute_tuning() error: uninitialized symbol 'target_max'.

vim +/ret +1547 drivers/mmc/host/sdhci-of-dwcmshc.c

3c5c200f02eee8 Huan He 2025-10-11  1515  
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
3c5c200f02eee8 Huan He 2025-10-11  1548  	}
3c5c200f02eee8 Huan He 2025-10-11  1549  	hsp_int_status = args.args[0];
3c5c200f02eee8 Huan He 2025-10-11  1550  	hsp_pwr_ctrl = args.args[1];
3c5c200f02eee8 Huan He 2025-10-11  1551  	of_node_put(args.np);
3c5c200f02eee8 Huan He 2025-10-11  1552  	/*
3c5c200f02eee8 Huan He 2025-10-11  1553  	 * Assert clock stability: write EIC7700_INT_CLK_STABLE to hsp_int_status.
3c5c200f02eee8 Huan He 2025-10-11  1554  	 * This signals to the eMMC controller that platform clocks (card, ACLK,
3c5c200f02eee8 Huan He 2025-10-11  1555  	 * BCLK, TMCLK) are enabled and stable.
3c5c200f02eee8 Huan He 2025-10-11  1556  	 */
3c5c200f02eee8 Huan He 2025-10-11  1557  	regmap_write(hsp_regmap, hsp_int_status, EIC7700_INT_CLK_STABLE);
3c5c200f02eee8 Huan He 2025-10-11  1558  	/*
3c5c200f02eee8 Huan He 2025-10-11  1559  	 * Assert voltage stability: write EIC7700_HOST_VAL_STABLE to hsp_pwr_ctrl.
3c5c200f02eee8 Huan He 2025-10-11  1560  	 * This signals that VDD is stable and permits transition to high-speed
3c5c200f02eee8 Huan He 2025-10-11  1561  	 * modes (e.g., UHS-I).
3c5c200f02eee8 Huan He 2025-10-11  1562  	 */
3c5c200f02eee8 Huan He 2025-10-11  1563  	regmap_write(hsp_regmap, hsp_pwr_ctrl, EIC7700_HOST_VAL_STABLE);
3c5c200f02eee8 Huan He 2025-10-11  1564  
3c5c200f02eee8 Huan He 2025-10-11  1565  	if ((host->mmc->caps2 & emmc_caps) == emmc_caps)
3c5c200f02eee8 Huan He 2025-10-11  1566  		dwc_priv->delay_line = PHY_DELAY_CODE_EMMC;
3c5c200f02eee8 Huan He 2025-10-11  1567  	else
3c5c200f02eee8 Huan He 2025-10-11  1568  		dwc_priv->delay_line = PHY_DELAY_CODE_SD;
3c5c200f02eee8 Huan He 2025-10-11  1569  
3c5c200f02eee8 Huan He 2025-10-11  1570  	if (!of_property_read_u32(dev->of_node, "eswin,drive-impedance-ohms", &val))
3c5c200f02eee8 Huan He 2025-10-11  1571  		priv->drive_impedance = eic7700_convert_drive_impedance_ohm(dev, val);
3c5c200f02eee8 Huan He 2025-10-11  1572  	return 0;
3c5c200f02eee8 Huan He 2025-10-11  1573  }
3c5c200f02eee8 Huan He 2025-10-11  1574  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
