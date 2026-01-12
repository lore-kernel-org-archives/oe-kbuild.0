Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A236345CAA
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 09:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768210021; cv=none; b=SvkvTvAjijE8fDb8F3D6rZhdapGF8/C/VcPemdVL8JQcKcJinZ0bV3CuaD0rb+6o42BDKJ42BzezidS1pdj9Pq+HFOrPOttulUW0M4ViZCo6hBlLlaeX0qBK3GkTF/GVgmV4nT1U8ZdXs1475pFnFodxTIHWTjFTSybXEqLof7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768210021; c=relaxed/simple;
	bh=WE1gkvvNFTePzVSRLj4fyywJxh9ciYHrWJwEHBTOnk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYxF3dHy96oC3TeDrCDiRFuv233bW68YkRXetxuPLtXihyKLPcdt5vaV4hh5QwgcPvfH6uB/YPL6Z+HEUrB5GH9qQA/VSx1xWSwbP+Sg/JLKmB4ivp+d8TEDi66zuF1/3uSxwwieh87LnJKmVFdEJMRe1ESxhoFMIY2CqQpcgFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vfECE-0007GN-Ax; Mon, 12 Jan 2026 10:26:46 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vfECD-000E5F-2t;
	Mon, 12 Jan 2026 10:26:45 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vfECD-007v7b-0I;
	Mon, 12 Jan 2026 10:26:45 +0100
Date: Mon, 12 Jan 2026 10:26:45 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Peng Fan <peng.fan@nxp.com>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: drivers/soc/imx/soc-imx8m.c:143 imx8m_soc_prepare() warn:
 'drvdata->ocotp_base' from of_iomap() not released on lines: 139.
Message-ID: <20260112092645.cmfh7lz7wd5n5fe4@pengutronix.de>
References: <202601111406.ZVV3YaiU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601111406.ZVV3YaiU-lkp@intel.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: oe-kbuild@lists.linux.dev

On 26-01-12, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   755bc1335e3b116b702205b72eb57b7b8aef2bb2
> commit: 390c01073f5d0bd64db37926ddb232f33b83620d soc: imx8m: Cleanup with adding imx8m_soc_[un]prepare
> config: m68k-randconfig-r072-20260111 (https://download.01.org/0day-ci/archive/20260111/202601111406.ZVV3YaiU-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 14.3.0
> smatch version: v0.5.0-8985-g2614ff1a
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202601111406.ZVV3YaiU-lkp@intel.com/
> 
> smatch warnings:
> drivers/soc/imx/soc-imx8m.c:143 imx8m_soc_prepare() warn: 'drvdata->ocotp_base' from of_iomap() not released on lines: 139.
> 
> vim +143 drivers/soc/imx/soc-imx8m.c
> 
> 390c01073f5d0b Peng Fan 2025-04-23  119  static int imx8m_soc_prepare(struct platform_device *pdev, const char *ocotp_compatible)
> 390c01073f5d0b Peng Fan 2025-04-23  120  {
> 390c01073f5d0b Peng Fan 2025-04-23  121  	struct device_node *np __free(device_node) =
> 390c01073f5d0b Peng Fan 2025-04-23  122  		of_find_compatible_node(NULL, NULL, ocotp_compatible);
> 390c01073f5d0b Peng Fan 2025-04-23  123  	struct imx8_soc_drvdata *drvdata = platform_get_drvdata(pdev);
> 390c01073f5d0b Peng Fan 2025-04-23  124  	int ret = 0;
> 390c01073f5d0b Peng Fan 2025-04-23  125  
> 390c01073f5d0b Peng Fan 2025-04-23  126  	if (!np)
> 390c01073f5d0b Peng Fan 2025-04-23  127  		return -EINVAL;
> 390c01073f5d0b Peng Fan 2025-04-23  128  
> 390c01073f5d0b Peng Fan 2025-04-23  129  	drvdata->ocotp_base = of_iomap(np, 0);
> 390c01073f5d0b Peng Fan 2025-04-23  130  	if (!drvdata->ocotp_base)
> 390c01073f5d0b Peng Fan 2025-04-23  131  		return -EINVAL;
> 390c01073f5d0b Peng Fan 2025-04-23  132  
> 390c01073f5d0b Peng Fan 2025-04-23  133  	drvdata->clk = of_clk_get_by_name(np, NULL);
> 390c01073f5d0b Peng Fan 2025-04-23  134  	if (IS_ERR(drvdata->clk)) {
> 390c01073f5d0b Peng Fan 2025-04-23  135  		ret = PTR_ERR(drvdata->clk);
> 390c01073f5d0b Peng Fan 2025-04-23  136  		goto err_clk;
> 390c01073f5d0b Peng Fan 2025-04-23  137  	}
> 390c01073f5d0b Peng Fan 2025-04-23  138  
> 390c01073f5d0b Peng Fan 2025-04-23  139  	return clk_prepare_enable(drvdata->clk);
> 
> Call iounmap() if clk_prepare_enable() fails?

Yes, we need to check the clk_prepare_enable() return as well.

Regards,
  Marco

> 
> 390c01073f5d0b Peng Fan 2025-04-23  140  
> 390c01073f5d0b Peng Fan 2025-04-23  141  err_clk:
> 390c01073f5d0b Peng Fan 2025-04-23  142  	iounmap(drvdata->ocotp_base);
> 390c01073f5d0b Peng Fan 2025-04-23 @143  	return ret;
> 390c01073f5d0b Peng Fan 2025-04-23  144  }
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
