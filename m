Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872D42E7394
	for <oe-kbuild@lists.linux.dev>; Sat, 30 May 2026 05:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780118660; cv=none; b=tZfnl8ieCP3AVQzwTZJ7+MqqqUpaS0HPksIoYifOPpDzX8X8RaiGliiiDx5+h6Ers05Xb/Z8rbhdpvfx6K0Q95EH7b3ElVKGUDqKSqW2+QSU9hiyA40k136bI2Xmakr5Nn85nh7qLj2vU4e33tvKSFnkPbe6di019YEh59EDkvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780118660; c=relaxed/simple;
	bh=xxJ+s6gP7CkwgYbCsPM2HFnyZ0L1fRG+6ZGDaIShTCs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mB1cVF4r3h3Bs7x0dBpwmO9udSnQYo7ZZ6eyOgcJ9lUkUPeH/FV9HHKyWjYFB3BFUqWCCaQKE0O8w7xMCIUsr2GHxN634qidkVKknROSyuu/KRrFxuSbC428JDq8sqeLDfuGfbhfiBlRm0xS3FyuEP8m2xOBFWmG81wD0Lw81/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XxasuUmK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XxasuUmK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780118657; x=1811654657;
  h=date:from:to:cc:subject:message-id;
  bh=xxJ+s6gP7CkwgYbCsPM2HFnyZ0L1fRG+6ZGDaIShTCs=;
  b=XxasuUmKgzwyJgfU9eR/jEvmgdfSqeNvpnPOs7vPcGEMo/yNvt6luhXL
   SM4l2dyVK7hJCmJ6RLZDM7U/pAJTzcjxCyigxgjjN5hoNgYHjgjnygDGo
   V5txv171wLTBkhGC4Fl1R3VgD10jmU30UIwApJTFMzj18l+KwVG1YjmfF
   1Ss6cISpMFjZnW5JN0ElJclSxF54k7SPYRCmj3PQJZAoFETweF1NrcNUO
   0AN/urDbmKxr9LLz1ExOWnbM/ptBhjTVL2clApKBhocWduAN+Pr2I/bfh
   QBZqWUrWmrWflbq6Rx/IvkK6aq6J1j4qkjb72Md8q402YbfAPv/REFP8q
   Q==;
X-CSE-ConnectionGUID: Usl26FcQRZiS86DcWcr0Mg==
X-CSE-MsgGUID: Xw/i+1jVQda+JRh9Y5VS/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80861999"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="80861999"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 22:24:17 -0700
X-CSE-ConnectionGUID: dJg79Jg5SYamfPUz0gVRLg==
X-CSE-MsgGUID: rql5SfRCRn2znuT1pyit6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="266898873"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 May 2026 22:24:15 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTCBB-0000000088G-1dwd;
	Sat, 30 May 2026 05:24:13 +0000
Date: Sat, 30 May 2026 13:23:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8747/9870]
 drivers/gpu/drm/tegra/sor.c:3762 tegra_sor_probe() warn: missing unwind goto?
Message-ID: <202605301327.Gb7tRDue-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Thierry Reding <treding@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7da7f07112610a520567421dd2ffcb51beaefbcc
commit: e68c4244136b8e9c2a9fc3aaa4d748be83afddef [8747/9870] drm/tegra: Explicitly specify PMC instance to use
:::::: branch date: 6 hours ago
:::::: commit date: 33 hours ago
config: powerpc64-randconfig-r071-20260530 (https://download.01.org/0day-ci/archive/20260530/202605301327.Gb7tRDue-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605301327.Gb7tRDue-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/tegra/sor.c:3762 tegra_sor_probe() warn: missing unwind goto?

vim +3762 drivers/gpu/drm/tegra/sor.c

8e2988a76c26f2 Thierry Reding 2018-12-03  3712  
6b6b604215c646 Thierry Reding 2013-11-15  3713  static int tegra_sor_probe(struct platform_device *pdev)
6b6b604215c646 Thierry Reding 2013-11-15  3714  {
6b6b604215c646 Thierry Reding 2013-11-15  3715  	struct device_node *np;
6b6b604215c646 Thierry Reding 2013-11-15  3716  	struct tegra_sor *sor;
6b6b604215c646 Thierry Reding 2013-11-15  3717  	int err;
6b6b604215c646 Thierry Reding 2013-11-15  3718  
6b6b604215c646 Thierry Reding 2013-11-15  3719  	sor = devm_kzalloc(&pdev->dev, sizeof(*sor), GFP_KERNEL);
6b6b604215c646 Thierry Reding 2013-11-15  3720  	if (!sor)
6b6b604215c646 Thierry Reding 2013-11-15  3721  		return -ENOMEM;
6b6b604215c646 Thierry Reding 2013-11-15  3722  
5faea3d0f80f4f Thierry Reding 2017-08-21  3723  	sor->soc = of_device_get_match_data(&pdev->dev);
6b6b604215c646 Thierry Reding 2013-11-15  3724  	sor->output.dev = sor->dev = &pdev->dev;
459cc2c6800b54 Thierry Reding 2015-07-30  3725  
459cc2c6800b54 Thierry Reding 2015-07-30  3726  	sor->settings = devm_kmemdup(&pdev->dev, sor->soc->settings,
459cc2c6800b54 Thierry Reding 2015-07-30  3727  				     sor->soc->num_settings *
459cc2c6800b54 Thierry Reding 2015-07-30  3728  					sizeof(*sor->settings),
459cc2c6800b54 Thierry Reding 2015-07-30  3729  				     GFP_KERNEL);
459cc2c6800b54 Thierry Reding 2015-07-30  3730  	if (!sor->settings)
459cc2c6800b54 Thierry Reding 2015-07-30  3731  		return -ENOMEM;
459cc2c6800b54 Thierry Reding 2015-07-30  3732  
459cc2c6800b54 Thierry Reding 2015-07-30  3733  	sor->num_settings = sor->soc->num_settings;
6b6b604215c646 Thierry Reding 2013-11-15  3734  
e68c4244136b8e Thierry Reding 2025-02-03  3735  	sor->pmc = devm_tegra_pmc_get(&pdev->dev);
e68c4244136b8e Thierry Reding 2025-02-03  3736  	if (IS_ERR(sor->pmc)) {
e68c4244136b8e Thierry Reding 2025-02-03  3737  		err = PTR_ERR(sor->pmc);
e68c4244136b8e Thierry Reding 2025-02-03  3738  		goto put_aux;
e68c4244136b8e Thierry Reding 2025-02-03  3739  	}
e68c4244136b8e Thierry Reding 2025-02-03  3740  
6b6b604215c646 Thierry Reding 2013-11-15  3741  	np = of_parse_phandle(pdev->dev.of_node, "nvidia,dpaux", 0);
6b6b604215c646 Thierry Reding 2013-11-15  3742  	if (np) {
9542c2376efaf5 Thierry Reding 2015-07-08  3743  		sor->aux = drm_dp_aux_find_by_of_node(np);
6b6b604215c646 Thierry Reding 2013-11-15  3744  		of_node_put(np);
6b6b604215c646 Thierry Reding 2013-11-15  3745  
9542c2376efaf5 Thierry Reding 2015-07-08  3746  		if (!sor->aux)
6b6b604215c646 Thierry Reding 2013-11-15  3747  			return -EPROBE_DEFER;
6f684de537bcd8 Thierry Reding 2015-07-21  3748  
b79b6081c440c0 Thierry Reding 2021-05-27  3749  		if (get_device(sor->aux->dev))
6f684de537bcd8 Thierry Reding 2015-07-21  3750  			sor->output.ddc = &sor->aux->ddc;
6b6b604215c646 Thierry Reding 2013-11-15  3751  	}
6b6b604215c646 Thierry Reding 2013-11-15  3752  
9542c2376efaf5 Thierry Reding 2015-07-08  3753  	if (!sor->aux) {
459cc2c6800b54 Thierry Reding 2015-07-30  3754  		if (sor->soc->supports_hdmi) {
459cc2c6800b54 Thierry Reding 2015-07-30  3755  			sor->ops = &tegra_sor_hdmi_ops;
c57997bce423fb Thierry Reding 2017-10-12  3756  			sor->pad = TEGRA_IO_PAD_HDMI;
459cc2c6800b54 Thierry Reding 2015-07-30  3757  		} else if (sor->soc->supports_lvds) {
459cc2c6800b54 Thierry Reding 2015-07-30  3758  			dev_err(&pdev->dev, "LVDS not supported yet\n");
459cc2c6800b54 Thierry Reding 2015-07-30  3759  			return -ENODEV;
459cc2c6800b54 Thierry Reding 2015-07-30  3760  		} else {
459cc2c6800b54 Thierry Reding 2015-07-30  3761  			dev_err(&pdev->dev, "unknown (non-DP) support\n");
459cc2c6800b54 Thierry Reding 2015-07-30 @3762  			return -ENODEV;
459cc2c6800b54 Thierry Reding 2015-07-30  3763  		}
459cc2c6800b54 Thierry Reding 2015-07-30  3764  	} else {
d278e4a9714d9c Thierry Reding 2019-06-27  3765  		np = of_parse_phandle(pdev->dev.of_node, "nvidia,panel", 0);
d278e4a9714d9c Thierry Reding 2019-06-27  3766  		/*
d278e4a9714d9c Thierry Reding 2019-06-27  3767  		 * No need to keep this around since we only use it as a check
d278e4a9714d9c Thierry Reding 2019-06-27  3768  		 * to see if a panel is connected (eDP) or not (DP).
d278e4a9714d9c Thierry Reding 2019-06-27  3769  		 */
d278e4a9714d9c Thierry Reding 2019-06-27  3770  		of_node_put(np);
d278e4a9714d9c Thierry Reding 2019-06-27  3771  
0472c21b83192c Thierry Reding 2019-10-15  3772  		sor->ops = &tegra_sor_dp_ops;
d23691f647855f Thierry Reding 2019-07-24  3773  		sor->pad = TEGRA_IO_PAD_LVDS;
459cc2c6800b54 Thierry Reding 2015-07-30  3774  	}
459cc2c6800b54 Thierry Reding 2015-07-30  3775  
c57997bce423fb Thierry Reding 2017-10-12  3776  	err = tegra_sor_parse_dt(sor);
c57997bce423fb Thierry Reding 2017-10-12  3777  	if (err < 0)
b79b6081c440c0 Thierry Reding 2021-05-27  3778  		goto put_aux;
c57997bce423fb Thierry Reding 2017-10-12  3779  
6b6b604215c646 Thierry Reding 2013-11-15  3780  	err = tegra_output_probe(&sor->output);
b79b6081c440c0 Thierry Reding 2021-05-27  3781  	if (err < 0) {
b79b6081c440c0 Thierry Reding 2021-05-27  3782  		dev_err_probe(&pdev->dev, err, "failed to probe output\n");
b79b6081c440c0 Thierry Reding 2021-05-27  3783  		goto put_aux;
b79b6081c440c0 Thierry Reding 2021-05-27  3784  	}
6b6b604215c646 Thierry Reding 2013-11-15  3785  
459cc2c6800b54 Thierry Reding 2015-07-30  3786  	if (sor->ops && sor->ops->probe) {
459cc2c6800b54 Thierry Reding 2015-07-30  3787  		err = sor->ops->probe(sor);
459cc2c6800b54 Thierry Reding 2015-07-30  3788  		if (err < 0) {
459cc2c6800b54 Thierry Reding 2015-07-30  3789  			dev_err(&pdev->dev, "failed to probe %s: %d\n",
459cc2c6800b54 Thierry Reding 2015-07-30  3790  				sor->ops->name, err);
5c1d644c09dbc1 Marc Zyngier   2020-10-13  3791  			goto remove;
459cc2c6800b54 Thierry Reding 2015-07-30  3792  		}
459cc2c6800b54 Thierry Reding 2015-07-30  3793  	}
459cc2c6800b54 Thierry Reding 2015-07-30  3794  
2f6b3f0b10afca Yangtao Li     2023-07-10  3795  	sor->regs = devm_platform_ioremap_resource(pdev, 0);
459cc2c6800b54 Thierry Reding 2015-07-30  3796  	if (IS_ERR(sor->regs)) {
459cc2c6800b54 Thierry Reding 2015-07-30  3797  		err = PTR_ERR(sor->regs);
459cc2c6800b54 Thierry Reding 2015-07-30  3798  		goto remove;
459cc2c6800b54 Thierry Reding 2015-07-30  3799  	}
6b6b604215c646 Thierry Reding 2013-11-15  3800  
8e2988a76c26f2 Thierry Reding 2018-12-03  3801  	err = platform_get_irq(pdev, 0);
3105e42c75e0f8 Deepak R Varma 2023-03-02  3802  	if (err < 0)
8e2988a76c26f2 Thierry Reding 2018-12-03  3803  		goto remove;
8e2988a76c26f2 Thierry Reding 2018-12-03  3804  
8e2988a76c26f2 Thierry Reding 2018-12-03  3805  	sor->irq = err;
8e2988a76c26f2 Thierry Reding 2018-12-03  3806  
8e2988a76c26f2 Thierry Reding 2018-12-03  3807  	err = devm_request_irq(sor->dev, sor->irq, tegra_sor_irq, 0,
8e2988a76c26f2 Thierry Reding 2018-12-03  3808  			       dev_name(sor->dev), sor);
8e2988a76c26f2 Thierry Reding 2018-12-03  3809  	if (err < 0) {
8e2988a76c26f2 Thierry Reding 2018-12-03  3810  		dev_err(&pdev->dev, "failed to request IRQ: %d\n", err);
8e2988a76c26f2 Thierry Reding 2018-12-03  3811  		goto remove;
8e2988a76c26f2 Thierry Reding 2018-12-03  3812  	}
8e2988a76c26f2 Thierry Reding 2018-12-03  3813  
11c632e1cfd3dc Thierry Reding 2019-02-18  3814  	sor->rst = devm_reset_control_get_exclusive_released(&pdev->dev, "sor");
4dbdc740c4beec Thierry Reding 2015-04-27  3815  	if (IS_ERR(sor->rst)) {
459cc2c6800b54 Thierry Reding 2015-07-30  3816  		err = PTR_ERR(sor->rst);
180b46ecdc9f77 Thierry Reding 2018-12-06  3817  
180b46ecdc9f77 Thierry Reding 2018-12-06  3818  		if (err != -EBUSY || WARN_ON(!pdev->dev.pm_domain)) {
f8c79120aa1d9e Jon Hunter     2016-07-01  3819  			dev_err(&pdev->dev, "failed to get reset control: %d\n",
f8c79120aa1d9e Jon Hunter     2016-07-01  3820  				err);
459cc2c6800b54 Thierry Reding 2015-07-30  3821  			goto remove;
4dbdc740c4beec Thierry Reding 2015-04-27  3822  		}
180b46ecdc9f77 Thierry Reding 2018-12-06  3823  
180b46ecdc9f77 Thierry Reding 2018-12-06  3824  		/*
180b46ecdc9f77 Thierry Reding 2018-12-06  3825  		 * At this point, the reset control is most likely being used
180b46ecdc9f77 Thierry Reding 2018-12-06  3826  		 * by the generic power domain implementation. With any luck
180b46ecdc9f77 Thierry Reding 2018-12-06  3827  		 * the power domain will have taken care of resetting the SOR
180b46ecdc9f77 Thierry Reding 2018-12-06  3828  		 * and we don't have to do anything.
180b46ecdc9f77 Thierry Reding 2018-12-06  3829  		 */
180b46ecdc9f77 Thierry Reding 2018-12-06  3830  		sor->rst = NULL;
f8c79120aa1d9e Jon Hunter     2016-07-01  3831  	}
6b6b604215c646 Thierry Reding 2013-11-15  3832  
6b6b604215c646 Thierry Reding 2013-11-15  3833  	sor->clk = devm_clk_get(&pdev->dev, NULL);
4dbdc740c4beec Thierry Reding 2015-04-27  3834  	if (IS_ERR(sor->clk)) {
459cc2c6800b54 Thierry Reding 2015-07-30  3835  		err = PTR_ERR(sor->clk);
459cc2c6800b54 Thierry Reding 2015-07-30  3836  		dev_err(&pdev->dev, "failed to get module clock: %d\n", err);
459cc2c6800b54 Thierry Reding 2015-07-30  3837  		goto remove;
4dbdc740c4beec Thierry Reding 2015-04-27  3838  	}
6b6b604215c646 Thierry Reding 2013-11-15  3839  
618dee3941a43d Thierry Reding 2016-06-09  3840  	if (sor->soc->supports_hdmi || sor->soc->supports_dp) {
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3841  		struct device_node *np = pdev->dev.of_node;
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3842  		const char *name;
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3843  
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3844  		/*
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3845  		 * For backwards compatibility with Tegra210 device trees,
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3846  		 * fall back to the old clock name "source" if the new "out"
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3847  		 * clock is not available.
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3848  		 */
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3849  		if (of_property_match_string(np, "clock-names", "out") < 0)
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3850  			name = "source";
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3851  		else
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3852  			name = "out";
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3853  
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3854  		sor->clk_out = devm_clk_get(&pdev->dev, name);
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3855  		if (IS_ERR(sor->clk_out)) {
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3856  			err = PTR_ERR(sor->clk_out);
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3857  			dev_err(sor->dev, "failed to get %s clock: %d\n",
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3858  				name, err);
618dee3941a43d Thierry Reding 2016-06-09  3859  			goto remove;
618dee3941a43d Thierry Reding 2016-06-09  3860  		}
1087fac18b8e3e Thierry Reding 2017-12-14  3861  	} else {
d780537f9b49e9 Thierry Reding 2018-01-10  3862  		/* fall back to the module clock on SOR0 (eDP/LVDS only) */
1087fac18b8e3e Thierry Reding 2017-12-14  3863  		sor->clk_out = sor->clk;
618dee3941a43d Thierry Reding 2016-06-09  3864  	}
618dee3941a43d Thierry Reding 2016-06-09  3865  
6b6b604215c646 Thierry Reding 2013-11-15  3866  	sor->clk_parent = devm_clk_get(&pdev->dev, "parent");
4dbdc740c4beec Thierry Reding 2015-04-27  3867  	if (IS_ERR(sor->clk_parent)) {
459cc2c6800b54 Thierry Reding 2015-07-30  3868  		err = PTR_ERR(sor->clk_parent);
459cc2c6800b54 Thierry Reding 2015-07-30  3869  		dev_err(&pdev->dev, "failed to get parent clock: %d\n", err);
459cc2c6800b54 Thierry Reding 2015-07-30  3870  		goto remove;
4dbdc740c4beec Thierry Reding 2015-04-27  3871  	}
6b6b604215c646 Thierry Reding 2013-11-15  3872  
6b6b604215c646 Thierry Reding 2013-11-15  3873  	sor->clk_safe = devm_clk_get(&pdev->dev, "safe");
4dbdc740c4beec Thierry Reding 2015-04-27  3874  	if (IS_ERR(sor->clk_safe)) {
459cc2c6800b54 Thierry Reding 2015-07-30  3875  		err = PTR_ERR(sor->clk_safe);
459cc2c6800b54 Thierry Reding 2015-07-30  3876  		dev_err(&pdev->dev, "failed to get safe clock: %d\n", err);
459cc2c6800b54 Thierry Reding 2015-07-30  3877  		goto remove;
4dbdc740c4beec Thierry Reding 2015-04-27  3878  	}
6b6b604215c646 Thierry Reding 2013-11-15  3879  
6b6b604215c646 Thierry Reding 2013-11-15  3880  	sor->clk_dp = devm_clk_get(&pdev->dev, "dp");
4dbdc740c4beec Thierry Reding 2015-04-27  3881  	if (IS_ERR(sor->clk_dp)) {
459cc2c6800b54 Thierry Reding 2015-07-30  3882  		err = PTR_ERR(sor->clk_dp);
459cc2c6800b54 Thierry Reding 2015-07-30  3883  		dev_err(&pdev->dev, "failed to get DP clock: %d\n", err);
459cc2c6800b54 Thierry Reding 2015-07-30  3884  		goto remove;
4dbdc740c4beec Thierry Reding 2015-04-27  3885  	}
6b6b604215c646 Thierry Reding 2013-11-15  3886  
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3887  	/*
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3888  	 * Starting with Tegra186, the BPMP provides an implementation for
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3889  	 * the pad output clock, so we have to look it up from device tree.
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3890  	 */
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3891  	sor->clk_pad = devm_clk_get(&pdev->dev, "pad");
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3892  	if (IS_ERR(sor->clk_pad)) {
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3893  		if (sor->clk_pad != ERR_PTR(-ENOENT)) {
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3894  			err = PTR_ERR(sor->clk_pad);
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3895  			goto remove;
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3896  		}
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3897  
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3898  		/*
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3899  		 * If the pad output clock is not available, then we assume
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3900  		 * we're on Tegra210 or earlier and have to provide our own
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3901  		 * implementation.
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3902  		 */
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3903  		sor->clk_pad = NULL;
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3904  	}
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3905  
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3906  	/*
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3907  	 * The bootloader may have set up the SOR such that it's module clock
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3908  	 * is sourced by one of the display PLLs. However, that doesn't work
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3909  	 * without properly having set up other bits of the SOR.
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3910  	 */
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3911  	err = clk_set_parent(sor->clk_out, sor->clk_safe);
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3912  	if (err < 0) {
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3913  		dev_err(&pdev->dev, "failed to use safe clock: %d\n", err);
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3914  		goto remove;
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3915  	}
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3916  
aaff8bd2e824b6 Thierry Reding 2015-08-07  3917  	platform_set_drvdata(pdev, sor);
aaff8bd2e824b6 Thierry Reding 2015-08-07  3918  	pm_runtime_enable(&pdev->dev);
aaff8bd2e824b6 Thierry Reding 2015-08-07  3919  
5dea42759bcef7 Thierry Reding 2021-04-01  3920  	host1x_client_init(&sor->client);
c472a0b0a1fd16 Thierry Reding 2020-01-31  3921  	sor->client.ops = &sor_client_ops;
c472a0b0a1fd16 Thierry Reding 2020-01-31  3922  	sor->client.dev = &pdev->dev;
c472a0b0a1fd16 Thierry Reding 2020-01-31  3923  
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3924  	/*
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3925  	 * On Tegra210 and earlier, provide our own implementation for the
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3926  	 * pad output clock.
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3927  	 */
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3928  	if (!sor->clk_pad) {
4bdf4710e00a50 Thierry Reding 2019-06-24  3929  		char *name;
4bdf4710e00a50 Thierry Reding 2019-06-24  3930  
a5127a2dbe95dd Thierry Reding 2020-01-31  3931  		name = devm_kasprintf(sor->dev, GFP_KERNEL, "sor%u_pad_clkout",
a5127a2dbe95dd Thierry Reding 2020-01-31  3932  				      sor->index);
a5127a2dbe95dd Thierry Reding 2020-01-31  3933  		if (!name) {
a5127a2dbe95dd Thierry Reding 2020-01-31  3934  			err = -ENOMEM;
5dea42759bcef7 Thierry Reding 2021-04-01  3935  			goto uninit;
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3936  		}
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3937  
fd67e9c6ed5af2 Thierry Reding 2019-12-02  3938  		err = host1x_client_resume(&sor->client);
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3939  		if (err < 0) {
fd67e9c6ed5af2 Thierry Reding 2019-12-02  3940  			dev_err(sor->dev, "failed to resume: %d\n", err);
5dea42759bcef7 Thierry Reding 2021-04-01  3941  			goto uninit;
4bdf4710e00a50 Thierry Reding 2019-06-24  3942  		}
4bdf4710e00a50 Thierry Reding 2019-06-24  3943  
4bdf4710e00a50 Thierry Reding 2019-06-24  3944  		sor->clk_pad = tegra_clk_sor_pad_register(sor, name);
fd67e9c6ed5af2 Thierry Reding 2019-12-02  3945  		host1x_client_suspend(&sor->client);
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3946  	}
b299221ca99683 Thierry Reding 2015-10-01  3947  
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3948  	if (IS_ERR(sor->clk_pad)) {
e1335e2f0cfcd3 Thierry Reding 2017-10-12  3949  		err = PTR_ERR(sor->clk_pad);
c472a0b0a1fd16 Thierry Reding 2020-01-31  3950  		dev_err(sor->dev, "failed to register SOR pad clock: %d\n",
6b6b604215c646 Thierry Reding 2013-11-15  3951  			err);
5dea42759bcef7 Thierry Reding 2021-04-01  3952  		goto uninit;
5dea42759bcef7 Thierry Reding 2021-04-01  3953  	}
5dea42759bcef7 Thierry Reding 2021-04-01  3954  
5dea42759bcef7 Thierry Reding 2021-04-01  3955  	err = __host1x_client_register(&sor->client);
5dea42759bcef7 Thierry Reding 2021-04-01  3956  	if (err < 0) {
5dea42759bcef7 Thierry Reding 2021-04-01  3957  		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
5dea42759bcef7 Thierry Reding 2021-04-01  3958  			err);
5dea42759bcef7 Thierry Reding 2021-04-01  3959  		goto uninit;
6b6b604215c646 Thierry Reding 2013-11-15  3960  	}
6b6b604215c646 Thierry Reding 2013-11-15  3961  
6b6b604215c646 Thierry Reding 2013-11-15  3962  	return 0;
459cc2c6800b54 Thierry Reding 2015-07-30  3963  
5dea42759bcef7 Thierry Reding 2021-04-01  3964  uninit:
5dea42759bcef7 Thierry Reding 2021-04-01  3965  	host1x_client_exit(&sor->client);
ad2139cb80a7a9 Thierry Reding 2020-01-31  3966  	pm_runtime_disable(&pdev->dev);
459cc2c6800b54 Thierry Reding 2015-07-30  3967  remove:
b79b6081c440c0 Thierry Reding 2021-05-27  3968  	if (sor->aux)
b79b6081c440c0 Thierry Reding 2021-05-27  3969  		sor->output.ddc = NULL;
b79b6081c440c0 Thierry Reding 2021-05-27  3970  
459cc2c6800b54 Thierry Reding 2015-07-30  3971  	tegra_output_remove(&sor->output);
b79b6081c440c0 Thierry Reding 2021-05-27  3972  put_aux:
b79b6081c440c0 Thierry Reding 2021-05-27  3973  	if (sor->aux)
b79b6081c440c0 Thierry Reding 2021-05-27  3974  		put_device(sor->aux->dev);
b79b6081c440c0 Thierry Reding 2021-05-27  3975  
459cc2c6800b54 Thierry Reding 2015-07-30  3976  	return err;
6b6b604215c646 Thierry Reding 2013-11-15  3977  }
6b6b604215c646 Thierry Reding 2013-11-15  3978  

:::::: The code at line 3762 was first introduced by commit
:::::: 459cc2c6800b545a482e428a631d99bca8da7790 drm/tegra: sor: Add HDMI support

:::::: TO: Thierry Reding <treding@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
