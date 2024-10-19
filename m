Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D113B18C910
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Oct 2024 06:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729319428; cv=none; b=AGCCWb9lv8bp+2/RTM8hd7g+Gzl+HuCro7hJbE1bf+DdsxNTxWP2X8DCnSLRko1e82EAUzRQE0NqwME2BRM5ptBeTibu/PykvQqs83IT0dx1fEBkcf1lXPNkIX9Pg6+kTsuAqk6+bMCvKGLtqpvqveSeRabT7CQkOI8xMSsoyzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729319428; c=relaxed/simple;
	bh=wWBudfUyuYiNDRb2/n84Yfa6lKITq2V+4AwoHP3It4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RzNtGHBWPxy7qi99i0inJ8wurZCw4m81lOlqaemTids4BSk/0+BxSC4UvyDnoFi0Cd/aerFAgbNU9qwEx01wX+kM+5lB15YnbpErGMbe6rI/PzQc695Mwv0g4IBAliVnP4f41Cu/RMIWe6wBul17qMgRyXtQrCkmSrK+p7+Dvwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S0r7e8Qk; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S0r7e8Qk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729319426; x=1760855426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wWBudfUyuYiNDRb2/n84Yfa6lKITq2V+4AwoHP3It4M=;
  b=S0r7e8QkOtO6dc/SxiCVqPg7OCEuASdjcgd6VFbeNNjI4tsjKR1e9v4m
   gM1W0LX2uaT5Po6hYc/X7TMF+TcMCSr3vB8wo4fjhKVsHrzRJJGY/zdpD
   BA9o4NHzc7blL1MT/Rq7FEMNemT44LcdrmOoFXK433UMGXpByjBPbUomn
   5J8aGvpuV/8Ez544RoiFWeek7Dqud47kMR+wwWEEInTZIwojeyXgvmhfc
   Q2r2SJ91ObrlR0FuwTEEzlL09CQFoMX6xeRE4TLDPRBNsq17pXgEURJuT
   T5AfeGTBTp1z2KxVSPOqMRP+G5WL+NaqE5mDQM6DHrwkfKqnshmQnkTb1
   A==;
X-CSE-ConnectionGUID: b++W4sFOR3SOKc78WzkHZw==
X-CSE-MsgGUID: KlQuA2XASCW8pMAfJqpg5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28966531"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28966531"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 23:30:25 -0700
X-CSE-ConnectionGUID: urVHfpt3QLyELbPS0FyxeQ==
X-CSE-MsgGUID: jUhcLDQRSbKsWJ1vVl0tww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="102369400"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Oct 2024 23:30:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t22yj-000Okn-1i;
	Sat, 19 Oct 2024 06:30:21 +0000
Date: Sat, 19 Oct 2024 14:29:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
Message-ID: <202410191416.NyqQCvE3-lkp@intel.com>
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
In-Reply-To: <20241015075134.1449458-3-TroyMitchell988@gmail.com>
References: <20241015075134.1449458-3-TroyMitchell988@gmail.com>
TO: Troy Mitchell <troymitchell988@gmail.com>
TO: andi.shyti@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: troymitchell988@gmail.com
CC: linux-i2c@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Troy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on robh/for-next linus/master v6.12-rc3 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Troy-Mitchell/dt-bindings-i2c-spacemit-add-support-for-K1-SoC/20241015-155402
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20241015075134.1449458-3-TroyMitchell988%40gmail.com
patch subject: [PATCH v1 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: alpha-randconfig-r071-20241019 (https://download.01.org/0day-ci/archive/20241019/202410191416.NyqQCvE3-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410191416.NyqQCvE3-lkp@intel.com/

smatch warnings:
drivers/i2c/busses/i2c-k1.c:621 spacemit_i2c_probe() warn: passing zero to 'PTR_ERR'
drivers/i2c/busses/i2c-k1.c:622 spacemit_i2c_probe() warn: passing zero to 'dev_err_probe'

vim +/PTR_ERR +621 drivers/i2c/busses/i2c-k1.c

aede17b17b7dfb Troy Mitchell 2024-10-15  603  
aede17b17b7dfb Troy Mitchell 2024-10-15  604  static int spacemit_i2c_probe(struct platform_device *pdev)
aede17b17b7dfb Troy Mitchell 2024-10-15  605  {
aede17b17b7dfb Troy Mitchell 2024-10-15  606  	struct spacemit_i2c_dev *i2c;
aede17b17b7dfb Troy Mitchell 2024-10-15  607  	struct device_node *of_node = pdev->dev.of_node;
aede17b17b7dfb Troy Mitchell 2024-10-15  608  	struct clk *clk;
aede17b17b7dfb Troy Mitchell 2024-10-15  609  	int ret = 0;
aede17b17b7dfb Troy Mitchell 2024-10-15  610  
aede17b17b7dfb Troy Mitchell 2024-10-15  611  	i2c = devm_kzalloc(&pdev->dev,
aede17b17b7dfb Troy Mitchell 2024-10-15  612  			   sizeof(struct spacemit_i2c_dev),
aede17b17b7dfb Troy Mitchell 2024-10-15  613  			   GFP_KERNEL);
aede17b17b7dfb Troy Mitchell 2024-10-15  614  	if (!i2c)
aede17b17b7dfb Troy Mitchell 2024-10-15  615  		return -ENOMEM;
aede17b17b7dfb Troy Mitchell 2024-10-15  616  
aede17b17b7dfb Troy Mitchell 2024-10-15  617  	i2c->dev = &pdev->dev;
aede17b17b7dfb Troy Mitchell 2024-10-15  618  
aede17b17b7dfb Troy Mitchell 2024-10-15  619  	i2c->base = devm_platform_ioremap_resource(pdev, 0);
aede17b17b7dfb Troy Mitchell 2024-10-15  620  	if (!i2c->base) {
aede17b17b7dfb Troy Mitchell 2024-10-15 @621  		ret = PTR_ERR(i2c->base);
aede17b17b7dfb Troy Mitchell 2024-10-15 @622  		return dev_err_probe(&pdev->dev, ret, "failed to do ioremap");
aede17b17b7dfb Troy Mitchell 2024-10-15  623  	}
aede17b17b7dfb Troy Mitchell 2024-10-15  624  
aede17b17b7dfb Troy Mitchell 2024-10-15  625  	i2c->irq = platform_get_irq(pdev, 0);
aede17b17b7dfb Troy Mitchell 2024-10-15  626  	if (i2c->irq < 0) {
aede17b17b7dfb Troy Mitchell 2024-10-15  627  		ret = i2c->irq;
aede17b17b7dfb Troy Mitchell 2024-10-15  628  		return dev_err_probe(&pdev->dev, ret, "failed to get irq resource");
aede17b17b7dfb Troy Mitchell 2024-10-15  629  	}
aede17b17b7dfb Troy Mitchell 2024-10-15  630  
aede17b17b7dfb Troy Mitchell 2024-10-15  631  	ret = devm_request_irq(i2c->dev, i2c->irq,
aede17b17b7dfb Troy Mitchell 2024-10-15  632  			       spacemit_i2c_irq_handler,
aede17b17b7dfb Troy Mitchell 2024-10-15  633  			       IRQF_NO_SUSPEND | IRQF_ONESHOT,
aede17b17b7dfb Troy Mitchell 2024-10-15  634  			       dev_name(i2c->dev), i2c);
aede17b17b7dfb Troy Mitchell 2024-10-15  635  
aede17b17b7dfb Troy Mitchell 2024-10-15  636  	if (ret)
aede17b17b7dfb Troy Mitchell 2024-10-15  637  		return dev_err_probe(&pdev->dev, ret, "failed to request irq");
aede17b17b7dfb Troy Mitchell 2024-10-15  638  
aede17b17b7dfb Troy Mitchell 2024-10-15  639  	disable_irq(i2c->irq);
aede17b17b7dfb Troy Mitchell 2024-10-15  640  
aede17b17b7dfb Troy Mitchell 2024-10-15  641  	clk = devm_clk_get_enabled(&pdev->dev, NULL);
aede17b17b7dfb Troy Mitchell 2024-10-15  642  	if (IS_ERR(clk)) {
aede17b17b7dfb Troy Mitchell 2024-10-15  643  		ret = PTR_ERR(clk);
aede17b17b7dfb Troy Mitchell 2024-10-15  644  		return dev_err_probe(&pdev->dev, ret, "failed to enable clock");
aede17b17b7dfb Troy Mitchell 2024-10-15  645  	}
aede17b17b7dfb Troy Mitchell 2024-10-15  646  
aede17b17b7dfb Troy Mitchell 2024-10-15  647  	i2c_set_adapdata(&i2c->adapt, i2c);
aede17b17b7dfb Troy Mitchell 2024-10-15  648  	i2c->adapt.owner = THIS_MODULE;
aede17b17b7dfb Troy Mitchell 2024-10-15  649  	i2c->adapt.algo = &spacemit_i2c_algo;
aede17b17b7dfb Troy Mitchell 2024-10-15  650  	i2c->adapt.dev.parent = i2c->dev;
aede17b17b7dfb Troy Mitchell 2024-10-15  651  	i2c->adapt.nr = pdev->id;
aede17b17b7dfb Troy Mitchell 2024-10-15  652  
aede17b17b7dfb Troy Mitchell 2024-10-15  653  	i2c->adapt.dev.of_node = of_node;
aede17b17b7dfb Troy Mitchell 2024-10-15  654  	i2c->adapt.algo_data = i2c;
aede17b17b7dfb Troy Mitchell 2024-10-15  655  
aede17b17b7dfb Troy Mitchell 2024-10-15  656  	strscpy(i2c->adapt.name, "spacemit-i2c-adapter", sizeof(i2c->adapt.name));
aede17b17b7dfb Troy Mitchell 2024-10-15  657  
aede17b17b7dfb Troy Mitchell 2024-10-15  658  	init_completion(&i2c->complete);
aede17b17b7dfb Troy Mitchell 2024-10-15  659  
aede17b17b7dfb Troy Mitchell 2024-10-15  660  	ret = i2c_add_numbered_adapter(&i2c->adapt);
aede17b17b7dfb Troy Mitchell 2024-10-15  661  
aede17b17b7dfb Troy Mitchell 2024-10-15  662  	if (ret)
aede17b17b7dfb Troy Mitchell 2024-10-15  663  		return dev_err_probe(&pdev->dev, ret, "failed to add i2c adapter");
aede17b17b7dfb Troy Mitchell 2024-10-15  664  
aede17b17b7dfb Troy Mitchell 2024-10-15  665  	platform_set_drvdata(pdev, i2c);
aede17b17b7dfb Troy Mitchell 2024-10-15  666  
aede17b17b7dfb Troy Mitchell 2024-10-15  667  	return 0;
aede17b17b7dfb Troy Mitchell 2024-10-15  668  }
aede17b17b7dfb Troy Mitchell 2024-10-15  669  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
