Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083F417993
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Dec 2025 16:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764953531; cv=none; b=hSkK+8ef+ZV3d8jKP3flH9DGXv+nIiFiEQiCBW6jyhI8E4SrMmo9mE/thjQo3SvxFPZ6PihHIiiTNBqmQDcUR3JAZ4Rc7DHWiz4w6slzUfbSdR7GvDZu0ajINHIf+rG4PtXR3lWowynSH56I66Z6cl/31A5d7rBfHftWvSeIplQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764953531; c=relaxed/simple;
	bh=bJ+BStXTZSG9rH/tiv9UYLXii9YTjehHAiMLsUsyE28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=usdejbbP/ACcRqf/e+SSGcU6QiiGveqzzek6UyLpYTdFcAk/CAP2lbrehYntiuKV3/w4EVU1tu8wSs9peDC4OHHogtt3m15bjwH4HkSR5km5lFbmzwMJyFymXZ1Fzij8eu8q9On0iDc+ad1hkJx8nLClN9Toy2eF27mqlEXlP2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HGOX8YnX; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HGOX8YnX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764953526; x=1796489526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bJ+BStXTZSG9rH/tiv9UYLXii9YTjehHAiMLsUsyE28=;
  b=HGOX8YnXIqYxD6SGozaFSm/Br02JLT7Z+BOoRoyEdujnJIKz/p9uGcpi
   9WnsfO1mR8sCutYROyfutkXSEnlYYWM/iGL6ORy4e+ugT4UrIaVV2ISH0
   zrUq/9JeljxYSZcP79Kx2djchmtV3J8rSEBF8wXbtagUtxZdenNWANAvv
   9BuMOaCzY0IjMipz/agt0p35EPVl4pcdc7Rqov09a5SO8iKSDn2AsjSBi
   5Bp7NTl5V2GNsraJxSenKov4SjN9eB1QyrHaacIlIIMUZH5MuwGHT1WGR
   HgStEKH/dZ8vMJGfL1mv2KsGL5eQTEVO4PyG0gYXI4aYJiEQZoDMuFR/c
   Q==;
X-CSE-ConnectionGUID: yfEXEA5aQVaRwvTZoAAE/Q==
X-CSE-MsgGUID: nlq24M8cRDqked+dScIxNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="78341024"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="78341024"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 08:52:01 -0800
X-CSE-ConnectionGUID: KXWmJTBzRN6fosPOpdSxTw==
X-CSE-MsgGUID: a2SfvzNZRIK53MKWQfn67w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="199515999"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Dec 2025 08:52:00 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRZ2D-00000000FF3-2YJo;
	Fri, 05 Dec 2025 16:51:57 +0000
Date: Sat, 6 Dec 2025 00:51:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [morimoto:renesas-lts/v6.18.0-2025-12-04-x5h-ironhide 21/36]
 drivers/mfd/rcar-mfis.c:95 mfis_reg_probe() error: we previously assumed
 'res' could be null (see line 87)
Message-ID: <202512060036.J4lQtW7u-lkp@intel.com>
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
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://github.com/morimoto/linux renesas-lts/v6.18.0-2025-12-04-x5h-ironhide
head:   be1a1d6c7bcaf888882374737ff9215c73dc6f4a
commit: 67fb488bd4bd3a0f89bebde4e2f6bf6dca8c9199 [21/36] mfd: Add driver for Renesas R-Car MFIS module
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: loongarch-randconfig-r073-20251205 (https://download.01.org/0day-ci/archive/20251206/202512060036.J4lQtW7u-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512060036.J4lQtW7u-lkp@intel.com/

smatch warnings:
drivers/mfd/rcar-mfis.c:95 mfis_reg_probe() error: we previously assumed 'res' could be null (see line 87)

vim +/res +95 drivers/mfd/rcar-mfis.c

67fb488bd4bd3a Kuninori Morimoto 2025-11-29   76  
67fb488bd4bd3a Kuninori Morimoto 2025-11-29   77  static int mfis_reg_probe(struct platform_device *pdev, struct mfis_priv *priv,
67fb488bd4bd3a Kuninori Morimoto 2025-11-29   78  			  struct mfis_reg *mreg, const char *name)
67fb488bd4bd3a Kuninori Morimoto 2025-11-29   79  {
67fb488bd4bd3a Kuninori Morimoto 2025-11-29   80  	struct device *dev = &pdev->dev;
67fb488bd4bd3a Kuninori Morimoto 2025-11-29   81  	struct resource *res;
67fb488bd4bd3a Kuninori Morimoto 2025-11-29   82  	struct regmap *regmap;
67fb488bd4bd3a Kuninori Morimoto 2025-11-29   83  	void __iomem *base;
67fb488bd4bd3a Kuninori Morimoto 2025-11-29   84  
67fb488bd4bd3a Kuninori Morimoto 2025-11-29   85  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
67fb488bd4bd3a Kuninori Morimoto 2025-11-29   86  	/* Everything except "common" is optional */
67fb488bd4bd3a Kuninori Morimoto 2025-11-29  @87  	if (!res && !strcmp(name, MFIS_RES_NAME_COMMON))
67fb488bd4bd3a Kuninori Morimoto 2025-11-29   88  		return 0;
67fb488bd4bd3a Kuninori Morimoto 2025-11-29   89  
67fb488bd4bd3a Kuninori Morimoto 2025-11-29   90  	base = devm_ioremap_resource(dev, res);
67fb488bd4bd3a Kuninori Morimoto 2025-11-29   91  	if (IS_ERR(base))
67fb488bd4bd3a Kuninori Morimoto 2025-11-29   92  		return PTR_ERR(base);
67fb488bd4bd3a Kuninori Morimoto 2025-11-29   93  
67fb488bd4bd3a Kuninori Morimoto 2025-11-29   94  	mfis_regmap_config.name = name;
67fb488bd4bd3a Kuninori Morimoto 2025-11-29  @95  	mfis_regmap_config.max_register = resource_size(res) - 1;
67fb488bd4bd3a Kuninori Morimoto 2025-11-29   96  
67fb488bd4bd3a Kuninori Morimoto 2025-11-29   97  	mreg->base = base;
67fb488bd4bd3a Kuninori Morimoto 2025-11-29   98  	mreg->start = res->start;
67fb488bd4bd3a Kuninori Morimoto 2025-11-29   99  	mreg->priv = priv;
67fb488bd4bd3a Kuninori Morimoto 2025-11-29  100  
67fb488bd4bd3a Kuninori Morimoto 2025-11-29  101  	regmap = devm_regmap_init(dev, NULL, mreg, &mfis_regmap_config);
67fb488bd4bd3a Kuninori Morimoto 2025-11-29  102  	if (IS_ERR(regmap))
67fb488bd4bd3a Kuninori Morimoto 2025-11-29  103  		return PTR_ERR(regmap);
67fb488bd4bd3a Kuninori Morimoto 2025-11-29  104  
67fb488bd4bd3a Kuninori Morimoto 2025-11-29  105  	return 0;
67fb488bd4bd3a Kuninori Morimoto 2025-11-29  106  }
67fb488bd4bd3a Kuninori Morimoto 2025-11-29  107  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
