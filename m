Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2623322B659
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Oct 2024 19:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729798340; cv=none; b=LBp/Fyf67A8UTAiMs/rBQHDUFAJYLZ4NncDxs+6T0c6p5Rb29kE9hakZFbIBmss17A0ySkBRUUBQYaAWKtuhVXxO5QXysgDfJMf4USviTy4WrdUMXrhNy2kRgoCjIKGgDFMJNu2deK3lWuzC6FfKDNaevcAg0gZP6Uz3Eeu9uiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729798340; c=relaxed/simple;
	bh=IJy+PoAouMfAuIDagu8g9Ukq5PRkqrlqbcQfve5oZW0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jBVFQiMiQ/GHb6JaAf9AL1Pl12h98VKwHPXxPJ1FKVRQH7iwyT+IWVvTltuPPgcIjbFP4dR9q9jIb7s0h0OniDjUNGP7V050NgfRHs0tcKZDEQqfRRgoxt5Gj5ORUkpdJKN+i5hYJc+KpQEwTUJkiWQ2FN9pDlUdkNkIItZON84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JMBGo+Qu; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JMBGo+Qu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729798337; x=1761334337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IJy+PoAouMfAuIDagu8g9Ukq5PRkqrlqbcQfve5oZW0=;
  b=JMBGo+QuUvkPIdr1mPlXcEBcvKaaBiP3Rt2vdBiXUuu5vatrQobx5sHM
   L6yUpevZfBjnxaO0NxpCk7oR8YJ6HHovvg9xRrWdzNyFD4Jxgmta2Uupl
   ajUKfqYPgPhBuAP4Fws5oEy/FNU6YlqobAOuWh4FiNYeqb7nJ2BhD41ic
   YJEH3Juqnz8LcJAMhAO3U+vj+TK5HKS/jj2mBZZ/PuF074wdGKmWamPxP
   0H9eMouyh/x+6X+q9ofTsiv3UFHMKM7uF1jA9d6TsDhMtnQdQ/crYaB6H
   l7067lZHY3nRUZLPpmUWFThGX7OxbzoQSHfrZ5E/GQnMcNMLLpehbPq7h
   Q==;
X-CSE-ConnectionGUID: V+rWVOF3RIWDVq2w61CvNg==
X-CSE-MsgGUID: W8dzaqAFRouL5sw1kZcjug==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52004053"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52004053"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 12:32:16 -0700
X-CSE-ConnectionGUID: jF/uslVkSwCtKY42K5MKDw==
X-CSE-MsgGUID: A44lKPMvTla9FEpMyVBByg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="85286910"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Oct 2024 12:32:15 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t43Z6-000Wvs-3D;
	Thu, 24 Oct 2024 19:32:13 +0000
Date: Fri, 25 Oct 2024 03:31:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/video/fbdev/sh_mobile_lcdcfb.c:2649 sh_mobile_lcdc_probe()
 warn: 'irq' from request_irq() not released on lines: 2649.
Message-ID: <202410250325.afFicEO2-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Adrian Hunter <adrian.hunter@intel.com>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c2ee9f594da826bea183ed14f2cc029c719bf4da
commit: 5284984a4fbacb0883bfebe905902cdda2891a07 bug: Fix no-return-statement warning with !CONFIG_BUG
date:   7 months ago
:::::: branch date: 3 days ago
:::::: commit date: 7 months ago
config: nios2-randconfig-r071-20241024 (https://download.01.org/0day-ci/archive/20241025/202410250325.afFicEO2-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410250325.afFicEO2-lkp@intel.com/

smatch warnings:
drivers/video/fbdev/sh_mobile_lcdcfb.c:2649 sh_mobile_lcdc_probe() warn: 'irq' from request_irq() not released on lines: 2649.
drivers/video/fbdev/sh_mobile_lcdcfb.c:2649 sh_mobile_lcdc_probe() warn: 'priv->base' from ioremap() not released on lines: 2649.
drivers/mmc/host/omap_hsmmc.c:1155 omap_hsmmc_switch_opcond() warn: 'host->dbclk' from clk_prepare_enable() not released on lines: 1155.
drivers/gpu/drm/exynos/exynos_mixer.c:1322 exynos_mixer_resume() warn: 'ctx->hdmi' from clk_prepare_enable() not released on lines: 1308,1317.
drivers/gpu/drm/exynos/exynos_mixer.c:1322 exynos_mixer_resume() warn: 'ctx->mixer' from clk_prepare_enable() not released on lines: 1300,1308,1317.
drivers/gpu/drm/exynos/exynos_mixer.c:1322 exynos_mixer_resume() warn: 'ctx->vp' from clk_prepare_enable() not released on lines: 1317.

vim +/irq +2649 drivers/video/fbdev/sh_mobile_lcdcfb.c

3ce05599907c60 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-08-31  2505  
48c68c4f1b5424 drivers/video/sh_mobile_lcdcfb.c       Greg Kroah-Hartman        2012-12-21  2506  static int sh_mobile_lcdc_probe(struct platform_device *pdev)
3ce05599907c60 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-08-31  2507  {
01ac25b59f08c0 drivers/video/sh_mobile_lcdcfb.c       Guennadi Liakhovetski     2010-09-03  2508  	struct sh_mobile_lcdc_info *pdata = pdev->dev.platform_data;
3ce05599907c60 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-08-31  2509  	struct sh_mobile_lcdc_priv *priv;
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2510  	struct resource *res;
3ce05599907c60 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-08-31  2511  	int num_channels;
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2512  	int error;
7374ccc0c322a6 drivers/video/fbdev/sh_mobile_lcdcfb.c Geert Uytterhoeven        2015-04-03  2513  	int irq, i;
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2514  
01ac25b59f08c0 drivers/video/sh_mobile_lcdcfb.c       Guennadi Liakhovetski     2010-09-03  2515  	if (!pdata) {
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2516  		dev_err(&pdev->dev, "no platform data defined\n");
8bed90557d2600 drivers/video/sh_mobile_lcdcfb.c       Guennadi Liakhovetski     2010-04-30  2517  		return -EINVAL;
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2518  	}
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2519  
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2520  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
7374ccc0c322a6 drivers/video/fbdev/sh_mobile_lcdcfb.c Geert Uytterhoeven        2015-04-03  2521  	irq = platform_get_irq(pdev, 0);
7374ccc0c322a6 drivers/video/fbdev/sh_mobile_lcdcfb.c Geert Uytterhoeven        2015-04-03  2522  	if (!res || irq < 0) {
8564557a03c12a drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-12-19  2523  		dev_err(&pdev->dev, "cannot get platform resources\n");
8bed90557d2600 drivers/video/sh_mobile_lcdcfb.c       Guennadi Liakhovetski     2010-04-30  2524  		return -ENOENT;
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2525  	}
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2526  
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2527  	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
e281018b0b2562 drivers/video/fbdev/sh_mobile_lcdcfb.c Markus Elfring            2018-04-26  2528  	if (!priv)
8bed90557d2600 drivers/video/sh_mobile_lcdcfb.c       Guennadi Liakhovetski     2010-04-30  2529  		return -ENOMEM;
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2530  
4774c12aacafc0 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-09-07  2531  	priv->dev = &pdev->dev;
9076aa994a9e3b drivers/video/fbdev/sh_mobile_lcdcfb.c Bartlomiej Zolnierkiewicz 2018-05-14  2532  
7374ccc0c322a6 drivers/video/fbdev/sh_mobile_lcdcfb.c Geert Uytterhoeven        2015-04-03  2533  	for (i = 0; i < ARRAY_SIZE(priv->ch); i++)
7374ccc0c322a6 drivers/video/fbdev/sh_mobile_lcdcfb.c Geert Uytterhoeven        2015-04-03  2534  		mutex_init(&priv->ch[i].open_lock);
8bed90557d2600 drivers/video/sh_mobile_lcdcfb.c       Guennadi Liakhovetski     2010-04-30  2535  	platform_set_drvdata(pdev, priv);
8bed90557d2600 drivers/video/sh_mobile_lcdcfb.c       Guennadi Liakhovetski     2010-04-30  2536  
7374ccc0c322a6 drivers/video/fbdev/sh_mobile_lcdcfb.c Geert Uytterhoeven        2015-04-03  2537  	error = request_irq(irq, sh_mobile_lcdc_irq, 0,
7ad33e74857f16 drivers/video/sh_mobile_lcdcfb.c       Kay Sievers               2009-03-24  2538  			    dev_name(&pdev->dev), priv);
8564557a03c12a drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-12-19  2539  	if (error) {
8564557a03c12a drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-12-19  2540  		dev_err(&pdev->dev, "unable to request irq\n");
8564557a03c12a drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-12-19  2541  		goto err1;
8564557a03c12a drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-12-19  2542  	}
8564557a03c12a drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-12-19  2543  
7374ccc0c322a6 drivers/video/fbdev/sh_mobile_lcdcfb.c Geert Uytterhoeven        2015-04-03  2544  	priv->irq = irq;
5ef6b505d9df45 drivers/video/sh_mobile_lcdcfb.c       Guennadi Liakhovetski     2010-09-03  2545  	atomic_set(&priv->hw_usecnt, -1);
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2546  
3ce05599907c60 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-08-31  2547  	for (i = 0, num_channels = 0; i < ARRAY_SIZE(pdata->ch); i++) {
3ce05599907c60 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-08-31  2548  		struct sh_mobile_lcdc_chan *ch = priv->ch + num_channels;
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2549  
01ac25b59f08c0 drivers/video/sh_mobile_lcdcfb.c       Guennadi Liakhovetski     2010-09-03  2550  		ch->lcdc = priv;
b5ef967df13d4d drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-11-22  2551  		ch->cfg = &pdata->ch[i];
01ac25b59f08c0 drivers/video/sh_mobile_lcdcfb.c       Guennadi Liakhovetski     2010-09-03  2552  
01ac25b59f08c0 drivers/video/sh_mobile_lcdcfb.c       Guennadi Liakhovetski     2010-09-03  2553  		error = sh_mobile_lcdc_check_interface(ch);
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2554  		if (error) {
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2555  			dev_err(&pdev->dev, "unsupported interface type\n");
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2556  			goto err1;
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2557  		}
01ac25b59f08c0 drivers/video/sh_mobile_lcdcfb.c       Guennadi Liakhovetski     2010-09-03  2558  		init_waitqueue_head(&ch->frame_end_wait);
01ac25b59f08c0 drivers/video/sh_mobile_lcdcfb.c       Guennadi Liakhovetski     2010-09-03  2559  		init_completion(&ch->vsync_completion);
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2560  
3b0fd9d7559858 drivers/video/sh_mobile_lcdcfb.c       Alexandre Courbot         2011-02-16  2561  		/* probe the backlight is there is one defined */
b5ef967df13d4d drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-11-22  2562  		if (ch->cfg->bl_info.max_brightness)
3b0fd9d7559858 drivers/video/sh_mobile_lcdcfb.c       Alexandre Courbot         2011-02-16  2563  			ch->bl = sh_mobile_lcdc_bl_probe(&pdev->dev, ch);
3b0fd9d7559858 drivers/video/sh_mobile_lcdcfb.c       Alexandre Courbot         2011-02-16  2564  
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2565  		switch (pdata->ch[i].chan) {
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2566  		case LCDC_CHAN_MAINLCD:
ce1c0b0873bf4e drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-07-13  2567  			ch->enabled = LDCNT2R_ME;
01ac25b59f08c0 drivers/video/sh_mobile_lcdcfb.c       Guennadi Liakhovetski     2010-09-03  2568  			ch->reg_offs = lcdc_offs_mainlcd;
3ce05599907c60 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-08-31  2569  			num_channels++;
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2570  			break;
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2571  		case LCDC_CHAN_SUBLCD:
ce1c0b0873bf4e drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-07-13  2572  			ch->enabled = LDCNT2R_SE;
01ac25b59f08c0 drivers/video/sh_mobile_lcdcfb.c       Guennadi Liakhovetski     2010-09-03  2573  			ch->reg_offs = lcdc_offs_sublcd;
3ce05599907c60 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-08-31  2574  			num_channels++;
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2575  			break;
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2576  		}
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2577  	}
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2578  
3ce05599907c60 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-08-31  2579  	if (!num_channels) {
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2580  		dev_err(&pdev->dev, "no channels defined\n");
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2581  		error = -EINVAL;
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2582  		goto err1;
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2583  	}
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2584  
edd153a3e4f734 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-12-13  2585  	/* for dual channel LCDC (MAIN + SUB) force shared format setting */
3ce05599907c60 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-08-31  2586  	if (num_channels == 2)
edd153a3e4f734 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-12-13  2587  		priv->forced_fourcc = pdata->ch[0].fourcc;
417d48274e755e drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2011-01-05  2588  
4bdc0d676a6431 drivers/video/fbdev/sh_mobile_lcdcfb.c Christoph Hellwig         2020-01-06  2589  	priv->base = ioremap(res->start, resource_size(res));
b49898ce606da2 drivers/video/fbdev/sh_mobile_lcdcfb.c Wei Yongjun               2017-02-08  2590  	if (!priv->base) {
b49898ce606da2 drivers/video/fbdev/sh_mobile_lcdcfb.c Wei Yongjun               2017-02-08  2591  		error = -ENOMEM;
dba6f385b83d7f drivers/video/sh_mobile_lcdcfb.c       Guennadi Liakhovetski     2010-06-30  2592  		goto err1;
b49898ce606da2 drivers/video/fbdev/sh_mobile_lcdcfb.c Wei Yongjun               2017-02-08  2593  	}
dba6f385b83d7f drivers/video/sh_mobile_lcdcfb.c       Guennadi Liakhovetski     2010-06-30  2594  
0a7f17aa3d6b69 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-09-07  2595  	error = sh_mobile_lcdc_setup_clocks(priv, pdata->clock_source);
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2596  	if (error) {
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2597  		dev_err(&pdev->dev, "unable to setup clocks\n");
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2598  		goto err1;
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2599  	}
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2600  
4774c12aacafc0 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-09-07  2601  	/* Enable runtime PM. */
4774c12aacafc0 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-09-07  2602  	pm_runtime_enable(&pdev->dev);
7caa4342ca5b37 drivers/video/sh_mobile_lcdcfb.c       Damian Hobson-Garcia      2011-05-18  2603  
3ce05599907c60 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-08-31  2604  	for (i = 0; i < num_channels; i++) {
0707330b337cec drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2012-08-13  2605  		struct sh_mobile_lcdc_chan *ch = &priv->ch[i];
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2606  
0707330b337cec drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2012-08-13  2607  		error = sh_mobile_lcdc_channel_init(ch);
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2608  		if (error)
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2609  			goto err1;
3ce05599907c60 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-08-31  2610  	}
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2611  
c5deac3c9b2284 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-12-12  2612  	for (i = 0; i < ARRAY_SIZE(pdata->overlays); i++) {
c5deac3c9b2284 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-12-12  2613  		struct sh_mobile_lcdc_overlay *ovl = &priv->overlays[i];
c5deac3c9b2284 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-12-12  2614  
c5deac3c9b2284 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-12-12  2615  		ovl->cfg = &pdata->overlays[i];
c5deac3c9b2284 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-12-12  2616  		ovl->channel = &priv->ch[0];
c5deac3c9b2284 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-12-12  2617  
0707330b337cec drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2012-08-13  2618  		error = sh_mobile_lcdc_overlay_init(ovl);
c5deac3c9b2284 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-12-12  2619  		if (error)
c5deac3c9b2284 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-12-12  2620  			goto err1;
c5deac3c9b2284 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-12-12  2621  	}
c5deac3c9b2284 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-12-12  2622  
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2623  	error = sh_mobile_lcdc_start(priv);
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2624  	if (error) {
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2625  		dev_err(&pdev->dev, "unable to start hardware\n");
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2626  		goto err1;
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2627  	}
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2628  
3ce05599907c60 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-08-31  2629  	for (i = 0; i < num_channels; i++) {
1c6a307a54668e drivers/video/sh_mobile_lcdcfb.c       Paul Mundt                2009-07-01  2630  		struct sh_mobile_lcdc_chan *ch = priv->ch + i;
1c6a307a54668e drivers/video/sh_mobile_lcdcfb.c       Paul Mundt                2009-07-01  2631  
a67f379d364874 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-11-29  2632  		error = sh_mobile_lcdc_channel_fb_register(ch);
a67f379d364874 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-11-29  2633  		if (error)
1c6a307a54668e drivers/video/sh_mobile_lcdcfb.c       Paul Mundt                2009-07-01  2634  			goto err1;
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2635  	}
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2636  
c5deac3c9b2284 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-12-12  2637  	for (i = 0; i < ARRAY_SIZE(pdata->overlays); i++) {
c5deac3c9b2284 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-12-12  2638  		struct sh_mobile_lcdc_overlay *ovl = &priv->overlays[i];
c5deac3c9b2284 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-12-12  2639  
c5deac3c9b2284 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-12-12  2640  		error = sh_mobile_lcdc_overlay_fb_register(ovl);
c5deac3c9b2284 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-12-12  2641  		if (error)
c5deac3c9b2284 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-12-12  2642  			goto err1;
c5deac3c9b2284 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-12-12  2643  	}
c5deac3c9b2284 drivers/video/sh_mobile_lcdcfb.c       Laurent Pinchart          2011-12-12  2644  
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2645  	return 0;
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2646  err1:
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2647  	sh_mobile_lcdc_remove(pdev);
8bed90557d2600 drivers/video/sh_mobile_lcdcfb.c       Guennadi Liakhovetski     2010-04-30  2648  
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23 @2649  	return error;
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2650  }
cfb4f5d1750e05 drivers/video/sh_mobile_lcdcfb.c       Magnus Damm               2008-07-23  2651  

:::::: The code at line 2649 was first introduced by commit
:::::: cfb4f5d1750e05f43902197713c50c29e7dfbc99 fbdev: SuperH Mobile LCDC Driver

:::::: TO: Magnus Damm <magnus.damm@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
