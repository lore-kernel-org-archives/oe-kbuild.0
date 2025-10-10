Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5D71C84CB
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Oct 2025 04:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760070122; cv=none; b=r/0fPAtwMBGRAVFpngQtlOt93LDF9x4PHZBwXjTsnKNh8DYE8Z7zch98iEkVcem4FjMCxsMvpWwn3X9YJXYnQPZFei7xbJEVl05RoLnCG3TFhzDqXxFvf3a+8pi1I2YvgIBxOm0h0q9BRih/1AYDeMCqYju23yC/4vJSmLeKXA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760070122; c=relaxed/simple;
	bh=h6zqp1PzUI11mVnEheN/7UUlRdZPqINJ/y208OGF+GM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AA6AMNYJ/tnFgxC7zc+dXslyarPM5waLHFoqzHEhkVFsDkhZmC5NJFsSK1I1QxLhFBf3OWPg34Zc8cEZF/6ytlc4eEpxWyRs3ow7PqZ0e1M4Lqfi9n0i0HmPIX5tkgKmmaG2vobkSFF0KObYyixhX+zf8txXc0vPX9U3jSDeH+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GztjEHOm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GztjEHOm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760070120; x=1791606120;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=h6zqp1PzUI11mVnEheN/7UUlRdZPqINJ/y208OGF+GM=;
  b=GztjEHOmzMzMIoEThCYe+1m0BDJQGYHwS0wfbegTfgUikGy32GU5Vkcr
   V6k/E5G0euF9b03tywEX5kNYO8/3RpbkH6aGcPp77Nu1G85ZLFS9cvJa7
   rTTqU82GcBnWYyGrnBfhoxtYEMJj9tuSHdMMRC8n8M3ZDIlJ98mBhjtOj
   c0kYveksV+ThP+ZqX2eBF8Fk19/G/EYXMfKWuxGJmz372ccz5SSUmHgyI
   JLCLt//LH010ipw27SfiJ5C8Gh8ch17i3FHOA0MI7/1EIC/JMhFj/Um6O
   CWyYgqmxCy0ow1691W+MictXaFBaDdEiKLii//HnjU86cTqx/KAz5DTku
   A==;
X-CSE-ConnectionGUID: R5au5GTdRuuLZFbD6L92/g==
X-CSE-MsgGUID: FQ9YTP8iSzeM9V4xOFE0fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="79931633"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="79931633"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 21:21:57 -0700
X-CSE-ConnectionGUID: caxRA8E+RW2LHbG7CNwRVQ==
X-CSE-MsgGUID: l6nKrL7fQvuNOVk1C/mzBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="180572613"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Oct 2025 21:21:56 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v74dd-00028p-2y;
	Fri, 10 Oct 2025 04:21:53 +0000
Date: Fri, 10 Oct 2025 12:21:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/mmc/host/pxamci.c:709 pxamci_probe() warn: passing zero to
 'PTR_ERR'
Message-ID: <202510101231.64BMEG9D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5472d60c129f75282d94ae5ad072ee6dfb7c7246
commit: 7cd8db0fb0b2bf309163d56fec585c0f9e0964d1 mmc: add COMPILE_TEST to multiple drivers
date:   3 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-r071-20251004 (https://download.01.org/0day-ci/archive/20251010/202510101231.64BMEG9D-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510101231.64BMEG9D-lkp@intel.com/

smatch warnings:
drivers/mmc/host/pxamci.c:709 pxamci_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +709 drivers/mmc/host/pxamci.c

e6027b467cd5b1 drivers/mmc/host/pxamci.c Daniel Mack        2012-07-28  605  
3ae5eaec1d2d9c drivers/mmc/pxamci.c      Russell King       2005-11-09  606  static int pxamci_probe(struct platform_device *pdev)
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  607  {
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  608  	struct mmc_host *mmc;
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  609  	struct pxamci_host *host = NULL;
23f3ff72bc6f05 drivers/mmc/host/pxamci.c Daniel Mack        2018-07-03  610  	struct device *dev = &pdev->dev;
6b3348f9e6eb35 drivers/mmc/host/pxamci.c Robert Jarzmik     2018-06-17  611  	struct resource *r;
38a8dda908683c drivers/mmc/host/pxamci.c Daniel Mack        2018-07-03  612  	int ret, irq;
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  613  
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  614  	irq = platform_get_irq(pdev, 0);
07e7716c746dd4 drivers/mmc/host/pxamci.c Robert Jarzmik     2016-02-08  615  	if (irq < 0)
07e7716c746dd4 drivers/mmc/host/pxamci.c Robert Jarzmik     2016-02-08  616  		return irq;
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  617  
58c40f3faf742c drivers/mmc/host/pxamci.c Binbin Zhou        2025-06-03  618  	mmc = devm_mmc_alloc_host(dev, sizeof(*host));
58c40f3faf742c drivers/mmc/host/pxamci.c Binbin Zhou        2025-06-03  619  	if (!mmc)
58c40f3faf742c drivers/mmc/host/pxamci.c Binbin Zhou        2025-06-03  620  		return -ENOMEM;
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  621  
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  622  	mmc->ops = &pxamci_ops;
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  623  
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  624  	/*
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  625  	 * We can do SG-DMA, but we don't because we never know how much
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  626  	 * data we successfully wrote to the card.
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  627  	 */
a36274e0184193 drivers/mmc/host/pxamci.c Martin K. Petersen 2010-09-10  628  	mmc->max_segs = NR_SG;
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  629  
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  630  	/*
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  631  	 * Our hardware DMA can handle a maximum of one page per SG entry.
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  632  	 */
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  633  	mmc->max_seg_size = PAGE_SIZE;
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  634  
fe4a3c7a20f14d drivers/mmc/pxamci.c      Pierre Ossman      2006-11-21  635  	/*
fe2dc44eac1223 drivers/mmc/host/pxamci.c Nicolas Pitre      2007-09-24  636  	 * Block length register is only 10 bits before PXA27x.
fe4a3c7a20f14d drivers/mmc/pxamci.c      Pierre Ossman      2006-11-21  637  	 */
0ffcbfd54ea81c drivers/mmc/host/pxamci.c Eric Miao          2008-09-11  638  	mmc->max_blk_size = cpu_is_pxa25x() ? 1023 : 2048;
fe4a3c7a20f14d drivers/mmc/pxamci.c      Pierre Ossman      2006-11-21  639  
55db890a838c7b drivers/mmc/pxamci.c      Pierre Ossman      2006-11-21  640  	/*
55db890a838c7b drivers/mmc/pxamci.c      Pierre Ossman      2006-11-21  641  	 * Block count register is 16 bits.
55db890a838c7b drivers/mmc/pxamci.c      Pierre Ossman      2006-11-21  642  	 */
55db890a838c7b drivers/mmc/pxamci.c      Pierre Ossman      2006-11-21  643  	mmc->max_blk_count = 65535;
55db890a838c7b drivers/mmc/pxamci.c      Pierre Ossman      2006-11-21  644  
fa3a5115469c2d drivers/mmc/host/pxamci.c Daniel Mack        2018-06-30  645  	ret = pxamci_of_init(pdev, mmc);
fa3a5115469c2d drivers/mmc/host/pxamci.c Daniel Mack        2018-06-30  646  	if (ret)
58c40f3faf742c drivers/mmc/host/pxamci.c Binbin Zhou        2025-06-03  647  		return ret;
fa3a5115469c2d drivers/mmc/host/pxamci.c Daniel Mack        2018-06-30  648  
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  649  	host = mmc_priv(mmc);
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  650  	host->mmc = mmc;
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  651  	host->pdata = pdev->dev.platform_data;
d8cb70d10a2d4e drivers/mmc/host/pxamci.c Russell King       2007-10-26  652  	host->clkrt = CLKRT_OFF;
ebebd9b0a1463d drivers/mmc/host/pxamci.c Russell King       2007-08-20  653  
23f3ff72bc6f05 drivers/mmc/host/pxamci.c Daniel Mack        2018-07-03  654  	host->clk = devm_clk_get(dev, NULL);
ebebd9b0a1463d drivers/mmc/host/pxamci.c Russell King       2007-08-20  655  	if (IS_ERR(host->clk)) {
ebebd9b0a1463d drivers/mmc/host/pxamci.c Russell King       2007-08-20  656  		host->clk = NULL;
58c40f3faf742c drivers/mmc/host/pxamci.c Binbin Zhou        2025-06-03  657  		return PTR_ERR(host->clk);
ebebd9b0a1463d drivers/mmc/host/pxamci.c Russell King       2007-08-20  658  	}
ebebd9b0a1463d drivers/mmc/host/pxamci.c Russell King       2007-08-20  659  
ebebd9b0a1463d drivers/mmc/host/pxamci.c Russell King       2007-08-20  660  	host->clkrate = clk_get_rate(host->clk);
ebebd9b0a1463d drivers/mmc/host/pxamci.c Russell King       2007-08-20  661  
ebebd9b0a1463d drivers/mmc/host/pxamci.c Russell King       2007-08-20  662  	/*
ebebd9b0a1463d drivers/mmc/host/pxamci.c Russell King       2007-08-20  663  	 * Calculate minimum clock rate, rounding up.
ebebd9b0a1463d drivers/mmc/host/pxamci.c Russell King       2007-08-20  664  	 */
ebebd9b0a1463d drivers/mmc/host/pxamci.c Russell King       2007-08-20  665  	mmc->f_min = (host->clkrate + 63) / 64;
fa3f99384c2075 drivers/mmc/host/pxamci.c Haojian Zhuang     2009-08-31  666  	mmc->f_max = (mmc_has_26MHz()) ? 26000000 : host->clkrate;
ebebd9b0a1463d drivers/mmc/host/pxamci.c Russell King       2007-08-20  667  
61951fd6cb4959 drivers/mmc/host/pxamci.c Daniel Mack        2018-06-30  668  	ret = pxamci_init_ocr(host);
61951fd6cb4959 drivers/mmc/host/pxamci.c Daniel Mack        2018-06-30  669  	if (ret < 0)
58c40f3faf742c drivers/mmc/host/pxamci.c Binbin Zhou        2025-06-03  670  		return ret;
8385f9cb7f12ef drivers/mmc/host/pxamci.c Daniel Ribeiro     2009-05-21  671  
de3ee99b097dd5 drivers/mmc/host/pxamci.c Linus Walleij      2017-09-20  672  	mmc->caps = 0;
5d3ad4e8a12e53 drivers/mmc/host/pxamci.c Bridge Wu          2007-09-25  673  	host->cmdat = 0;
0ffcbfd54ea81c drivers/mmc/host/pxamci.c Eric Miao          2008-09-11  674  	if (!cpu_is_pxa25x()) {
5d3ad4e8a12e53 drivers/mmc/host/pxamci.c Bridge Wu          2007-09-25  675  		mmc->caps |= MMC_CAP_4_BIT_DATA | MMC_CAP_SDIO_IRQ;
5d3ad4e8a12e53 drivers/mmc/host/pxamci.c Bridge Wu          2007-09-25  676  		host->cmdat |= CMDAT_SDIO_INT_EN;
fa3f99384c2075 drivers/mmc/host/pxamci.c Haojian Zhuang     2009-08-31  677  		if (mmc_has_26MHz())
64eb036af42d38 drivers/mmc/host/pxamci.c Bridge Wu          2007-12-13  678  			mmc->caps |= MMC_CAP_MMC_HIGHSPEED |
64eb036af42d38 drivers/mmc/host/pxamci.c Bridge Wu          2007-12-13  679  				     MMC_CAP_SD_HIGHSPEED;
5d3ad4e8a12e53 drivers/mmc/host/pxamci.c Bridge Wu          2007-09-25  680  	}
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  681  
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  682  	spin_lock_init(&host->lock);
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  683  	host->imask = MMC_I_MASK_ALL;
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  684  
c89a869b67dc6c drivers/mmc/host/pxamci.c Yangtao Li         2023-07-04  685  	host->base = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
58c40f3faf742c drivers/mmc/host/pxamci.c Binbin Zhou        2025-06-03  686  	if (IS_ERR(host->base))
58c40f3faf742c drivers/mmc/host/pxamci.c Binbin Zhou        2025-06-03  687  		return PTR_ERR(host->base);
c89a869b67dc6c drivers/mmc/host/pxamci.c Yangtao Li         2023-07-04  688  	host->res = r;
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  689  
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  690  	/*
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  691  	 * Ensure that the host controller is shut down, and setup
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  692  	 * with our defaults.
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  693  	 */
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  694  	pxamci_stop_clock(host);
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  695  	writel(0, host->base + MMC_SPI);
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  696  	writel(64, host->base + MMC_RESTO);
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  697  	writel(host->imask, host->base + MMC_I_MASK);
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  698  
23f3ff72bc6f05 drivers/mmc/host/pxamci.c Daniel Mack        2018-07-03  699  	ret = devm_request_irq(dev, irq, pxamci_irq, 0,
07e7716c746dd4 drivers/mmc/host/pxamci.c Robert Jarzmik     2016-02-08  700  			       DRIVER_NAME, host);
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  701  	if (ret)
58c40f3faf742c drivers/mmc/host/pxamci.c Binbin Zhou        2025-06-03  702  		return ret;
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  703  
3ae5eaec1d2d9c drivers/mmc/pxamci.c      Russell King       2005-11-09  704  	platform_set_drvdata(pdev, mmc);
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  705  
e1ebb456ae4cd8 drivers/mmc/host/pxamci.c Peter Ujfalusi     2019-12-17  706  	host->dma_chan_rx = dma_request_chan(dev, "rx");
e1ebb456ae4cd8 drivers/mmc/host/pxamci.c Peter Ujfalusi     2019-12-17  707  	if (IS_ERR(host->dma_chan_rx)) {
e1ebb456ae4cd8 drivers/mmc/host/pxamci.c Peter Ujfalusi     2019-12-17  708  		host->dma_chan_rx = NULL;
58c40f3faf742c drivers/mmc/host/pxamci.c Binbin Zhou        2025-06-03 @709  		return dev_err_probe(dev, PTR_ERR(host->dma_chan_rx),
58c40f3faf742c drivers/mmc/host/pxamci.c Binbin Zhou        2025-06-03  710  				     "unable to request rx dma channel\n");
6464b714095119 drivers/mmc/host/pxamci.c Daniel Mack        2015-06-06  711  	}
6464b714095119 drivers/mmc/host/pxamci.c Daniel Mack        2015-06-06  712  
e1ebb456ae4cd8 drivers/mmc/host/pxamci.c Peter Ujfalusi     2019-12-17  713  	host->dma_chan_tx = dma_request_chan(dev, "tx");
e1ebb456ae4cd8 drivers/mmc/host/pxamci.c Peter Ujfalusi     2019-12-17  714  	if (IS_ERR(host->dma_chan_tx)) {
23f3ff72bc6f05 drivers/mmc/host/pxamci.c Daniel Mack        2018-07-03  715  		dev_err(dev, "unable to request tx dma channel\n");
e1ebb456ae4cd8 drivers/mmc/host/pxamci.c Peter Ujfalusi     2019-12-17  716  		ret = PTR_ERR(host->dma_chan_tx);
e1ebb456ae4cd8 drivers/mmc/host/pxamci.c Peter Ujfalusi     2019-12-17  717  		host->dma_chan_tx = NULL;
9a788c6b78802b drivers/mmc/host/pxamci.c Bridge Wu          2007-12-14  718  		goto out;
9a788c6b78802b drivers/mmc/host/pxamci.c Bridge Wu          2007-12-14  719  	}
9a788c6b78802b drivers/mmc/host/pxamci.c Bridge Wu          2007-12-14  720  
b405db6c015fe8 drivers/mmc/host/pxamci.c Robert Jarzmik     2009-06-23  721  	if (host->pdata) {
38a8dda908683c drivers/mmc/host/pxamci.c Daniel Mack        2018-07-03  722  		host->detect_delay_ms = host->pdata->detect_delay_ms;
38a8dda908683c drivers/mmc/host/pxamci.c Daniel Mack        2018-07-03  723  
f54005b508b9a9 drivers/mmc/host/pxamci.c Linus Walleij      2018-12-02  724  		host->power = devm_gpiod_get_optional(dev, "power", GPIOD_OUT_LOW);
f54005b508b9a9 drivers/mmc/host/pxamci.c Linus Walleij      2018-12-02  725  		if (IS_ERR(host->power)) {
d7b819b5d33869 drivers/mmc/host/pxamci.c Zhihao Cheng       2020-11-21  726  			ret = PTR_ERR(host->power);
f54005b508b9a9 drivers/mmc/host/pxamci.c Linus Walleij      2018-12-02  727  			dev_err(dev, "Failed requesting gpio_power\n");
b405db6c015fe8 drivers/mmc/host/pxamci.c Robert Jarzmik     2009-06-23  728  			goto out;
b405db6c015fe8 drivers/mmc/host/pxamci.c Robert Jarzmik     2009-06-23  729  		}
38a8dda908683c drivers/mmc/host/pxamci.c Daniel Mack        2018-07-03  730  
c914a27c92f91f drivers/mmc/host/pxamci.c Linus Walleij      2018-12-02  731  		/* FIXME: should we pass detection delay to debounce? */
d0052ad90e712a drivers/mmc/host/pxamci.c Michał Mirosław    2019-12-11  732  		ret = mmc_gpiod_request_cd(mmc, "cd", 0, false, 0);
c914a27c92f91f drivers/mmc/host/pxamci.c Linus Walleij      2018-12-02  733  		if (ret && ret != -ENOENT) {
c914a27c92f91f drivers/mmc/host/pxamci.c Linus Walleij      2018-12-02  734  			dev_err(dev, "Failed requesting gpio_cd\n");
c914a27c92f91f drivers/mmc/host/pxamci.c Linus Walleij      2018-12-02  735  			goto out;
c914a27c92f91f drivers/mmc/host/pxamci.c Linus Walleij      2018-12-02  736  		}
c914a27c92f91f drivers/mmc/host/pxamci.c Linus Walleij      2018-12-02  737  
9073d10b098973 drivers/mmc/host/pxamci.c Michał Mirosław    2019-12-11  738  		if (!host->pdata->gpio_card_ro_invert)
9073d10b098973 drivers/mmc/host/pxamci.c Michał Mirosław    2019-12-11  739  			mmc->caps2 |= MMC_CAP2_RO_ACTIVE_HIGH;
9073d10b098973 drivers/mmc/host/pxamci.c Michał Mirosław    2019-12-11  740  
d0052ad90e712a drivers/mmc/host/pxamci.c Michał Mirosław    2019-12-11  741  		ret = mmc_gpiod_request_ro(mmc, "wp", 0, 0);
c914a27c92f91f drivers/mmc/host/pxamci.c Linus Walleij      2018-12-02  742  		if (ret && ret != -ENOENT) {
c914a27c92f91f drivers/mmc/host/pxamci.c Linus Walleij      2018-12-02  743  			dev_err(dev, "Failed requesting gpio_ro\n");
c914a27c92f91f drivers/mmc/host/pxamci.c Linus Walleij      2018-12-02  744  			goto out;
c914a27c92f91f drivers/mmc/host/pxamci.c Linus Walleij      2018-12-02  745  		}
9073d10b098973 drivers/mmc/host/pxamci.c Michał Mirosław    2019-12-11  746  		if (!ret)
c914a27c92f91f drivers/mmc/host/pxamci.c Linus Walleij      2018-12-02  747  			host->use_ro_gpio = true;
b405db6c015fe8 drivers/mmc/host/pxamci.c Robert Jarzmik     2009-06-23  748  
38a8dda908683c drivers/mmc/host/pxamci.c Daniel Mack        2018-07-03  749  		if (host->pdata->init)
23f3ff72bc6f05 drivers/mmc/host/pxamci.c Daniel Mack        2018-07-03  750  			host->pdata->init(dev, pxamci_detect_irq, mmc);
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  751  
f54005b508b9a9 drivers/mmc/host/pxamci.c Linus Walleij      2018-12-02  752  		if (host->power && host->pdata->setpower)
23f3ff72bc6f05 drivers/mmc/host/pxamci.c Daniel Mack        2018-07-03  753  			dev_warn(dev, "gpio_power and setpower() both defined\n");
c914a27c92f91f drivers/mmc/host/pxamci.c Linus Walleij      2018-12-02  754  		if (host->use_ro_gpio && host->pdata->get_ro)
23f3ff72bc6f05 drivers/mmc/host/pxamci.c Daniel Mack        2018-07-03  755  			dev_warn(dev, "gpio_ro and get_ro() both defined\n");
38a8dda908683c drivers/mmc/host/pxamci.c Daniel Mack        2018-07-03  756  	}
b405db6c015fe8 drivers/mmc/host/pxamci.c Robert Jarzmik     2009-06-23  757  
80e1ef3afb8bfb drivers/mmc/host/pxamci.c Yang Yingliang     2022-11-01  758  	ret = mmc_add_host(mmc);
80e1ef3afb8bfb drivers/mmc/host/pxamci.c Yang Yingliang     2022-11-01  759  	if (ret) {
80e1ef3afb8bfb drivers/mmc/host/pxamci.c Yang Yingliang     2022-11-01  760  		if (host->pdata && host->pdata->exit)
80e1ef3afb8bfb drivers/mmc/host/pxamci.c Yang Yingliang     2022-11-01  761  			host->pdata->exit(dev, mmc);
80e1ef3afb8bfb drivers/mmc/host/pxamci.c Yang Yingliang     2022-11-01  762  		goto out;
80e1ef3afb8bfb drivers/mmc/host/pxamci.c Yang Yingliang     2022-11-01  763  	}
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  764  
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  765  	return 0;
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  766  
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  767  out:
6464b714095119 drivers/mmc/host/pxamci.c Daniel Mack        2015-06-06  768  	if (host->dma_chan_rx)
6464b714095119 drivers/mmc/host/pxamci.c Daniel Mack        2015-06-06  769  		dma_release_channel(host->dma_chan_rx);
6464b714095119 drivers/mmc/host/pxamci.c Daniel Mack        2015-06-06  770  	if (host->dma_chan_tx)
6464b714095119 drivers/mmc/host/pxamci.c Daniel Mack        2015-06-06  771  		dma_release_channel(host->dma_chan_tx);
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  772  	return ret;
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  773  }
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  774  

:::::: The code at line 709 was first introduced by commit
:::::: 58c40f3faf742c11070d38571dfe4de33b914246 mmc: pxamci: Use devm_mmc_alloc_host() helper

:::::: TO: Binbin Zhou <zhoubinbin@loongson.cn>
:::::: CC: Ulf Hansson <ulf.hansson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
