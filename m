Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3732B45023
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Oct 2024 11:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727953470; cv=none; b=gKQvRzkfHczkrH9c3oUmISPMhmxBCg9zqYNiwuNwuiEfHcjLzHZgcz/H+ORMjFZSAmippgJG6q4DfFm3NBFzjZe3aY/suhba7f5tS6pho9McM+nABBADUTxFMPT0aI4VwifrIK6I+U46vEfhR856VUEUZnmFEJMfH3zTjlIWT6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727953470; c=relaxed/simple;
	bh=G7KPeHFaAhS92nkYBDAFbzOAE1kGdFt0VbQ+cyUcY1U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bMuVk7W8Ib2uSgizuuJPGPN6gDFTvS010Pc9lJgrYpUf2mCQwNfplQ/kNxP77yRHDsXWKqqO+jPD3/Xb2LjN7OXV6F/gu2qMnHrWTnJH8Dc/TdtURU87TJQqGaxbSX/qJMLDHqhYx8o8Kr91DiQVbaaAemyl63ldGuMhH34krEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SSohyoZl; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SSohyoZl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727953468; x=1759489468;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=G7KPeHFaAhS92nkYBDAFbzOAE1kGdFt0VbQ+cyUcY1U=;
  b=SSohyoZljcK5wSm4PqxqWwiPIz+vZo7adzg7jDlfz2OwjMyN7s6fP3wP
   dd0WSLMiXNJJYlofEIjMA/KvVW5Nv/FF3t8H7Rwj6x33im4gpti7KTumR
   YZcQl3kR3GdFKFUgie0GyUE6MzhziZ05eVNPEUgiAqQ9twVSuAWqLSvdL
   EvnakAZJSCNDVB5qCCShwkR0t3nIdrSddtDysr5Iw+JkuKeUYoabjsAk0
   ijfDl+YW5ek7BNDGpe07B1qj2cGuIwO0lJyw/IW3TE1DGWGo9846OA4r9
   tVosM+NW18UmFejD06MzdDPPoLaUWJu9iDa5mM8TDp6fK3393K/dK05Ry
   w==;
X-CSE-ConnectionGUID: r5QCpf5uQPSri28yB8dSzA==
X-CSE-MsgGUID: Dfxh06epSiWqtm073hDAiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26650471"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="26650471"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 04:04:27 -0700
X-CSE-ConnectionGUID: bw3pUXGhT+qrRhH6nOysRg==
X-CSE-MsgGUID: dKLbhwYNQguHQwO0LmJgHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="74749806"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Oct 2024 04:04:26 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swJd9-0000K2-0Q;
	Thu, 03 Oct 2024 11:04:23 +0000
Date: Thu, 3 Oct 2024 19:03:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/5] crypto: cesa: use enabled variants for clk_get
Message-ID: <202410031841.JyZSemmn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241001232547.355947-3-rosenp@gmail.com>
References: <20241001232547.355947-3-rosenp@gmail.com>
TO: Rosen Penev <rosenp@gmail.com>
TO: linux-crypto@vger.kernel.org
CC: Boris Brezillon <bbrezillon@kernel.org>
CC: Arnaud Ebalard <arno@natisbad.org>
CC: Srujana Challa <schalla@marvell.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Rosen Penev <rosenp@gmail.com>
CC: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
CC: linux-kernel@vger.kernel.org

Hi Rosen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linus/master v6.12-rc1 next-20241003]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/crypto-cesa-add-COMPILE_TEST/20241002-072835
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20241001232547.355947-3-rosenp%40gmail.com
patch subject: [PATCH 2/5] crypto: cesa: use enabled variants for clk_get
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: um-randconfig-r073-20241003 (https://download.01.org/0day-ci/archive/20241003/202410031841.JyZSemmn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410031841.JyZSemmn-lkp@intel.com/

smatch warnings:
drivers/crypto/marvell/cesa/cesa.c:517 mv_cesa_probe() warn: missing error code 'ret'

vim +/ret +517 drivers/crypto/marvell/cesa/cesa.c

f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  431  
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  432  static int mv_cesa_probe(struct platform_device *pdev)
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  433  {
0bf6948995f9f7 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  434  	const struct mv_cesa_caps *caps = &orion_caps;
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  435  	const struct mbus_dram_target_info *dram;
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  436  	const struct of_device_id *match;
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  437  	struct device *dev = &pdev->dev;
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  438  	struct mv_cesa_dev *cesa;
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  439  	struct mv_cesa_engine *engines;
28ee8b0912ca2f drivers/crypto/marvell/cesa/cesa.c Sven Auhagen    2020-07-21  440  	int irq, ret, i, cpu;
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  441  	u32 sram_size;
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  442  
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  443  	if (cesa_dev) {
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  444  		dev_err(&pdev->dev, "Only one CESA device authorized\n");
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  445  		return -EEXIST;
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  446  	}
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  447  
0bf6948995f9f7 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  448  	if (dev->of_node) {
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  449  		match = of_match_node(mv_cesa_of_match_table, dev->of_node);
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  450  		if (!match || !match->data)
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  451  			return -ENOTSUPP;
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  452  
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  453  		caps = match->data;
0bf6948995f9f7 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  454  	}
0bf6948995f9f7 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  455  
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  456  	cesa = devm_kzalloc(dev, sizeof(*cesa), GFP_KERNEL);
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  457  	if (!cesa)
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  458  		return -ENOMEM;
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  459  
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  460  	cesa->caps = caps;
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  461  	cesa->dev = dev;
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  462  
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  463  	sram_size = CESA_SA_DEFAULT_SRAM_SIZE;
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  464  	of_property_read_u32(cesa->dev->of_node, "marvell,crypto-sram-size",
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  465  			     &sram_size);
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  466  	if (sram_size < CESA_SA_MIN_SRAM_SIZE)
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  467  		sram_size = CESA_SA_MIN_SRAM_SIZE;
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  468  
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  469  	cesa->sram_size = sram_size;
a86854d0c599b3 drivers/crypto/marvell/cesa.c      Kees Cook       2018-06-12  470  	cesa->engines = devm_kcalloc(dev, caps->nengines, sizeof(*engines),
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  471  				     GFP_KERNEL);
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  472  	if (!cesa->engines)
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  473  		return -ENOMEM;
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  474  
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  475  	spin_lock_init(&cesa->lock);
bf8f91e711926c drivers/crypto/marvell/cesa.c      Romain Perier   2016-06-21  476  
3cea6b36a43405 drivers/crypto/marvell/cesa/cesa.c Zhang Qilong    2020-09-17  477  	cesa->regs = devm_platform_ioremap_resource_byname(pdev, "regs");
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  478  	if (IS_ERR(cesa->regs))
dfe97ad30e8c03 drivers/crypto/marvell/cesa.c      Boris Brezillon 2016-03-17  479  		return PTR_ERR(cesa->regs);
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  480  
db509a45339fd7 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  481  	ret = mv_cesa_dev_dma_init(cesa);
db509a45339fd7 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  482  	if (ret)
db509a45339fd7 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  483  		return ret;
db509a45339fd7 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  484  
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  485  	dram = mv_mbus_dram_info_nooverlap();
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  486  
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  487  	platform_set_drvdata(pdev, cesa);
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  488  
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  489  	for (i = 0; i < caps->nengines; i++) {
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  490  		struct mv_cesa_engine *engine = &cesa->engines[i];
0501d0d1494900 drivers/crypto/marvell/cesa/cesa.c Herbert Xu      2023-10-27  491  		char res_name[16];
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  492  
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  493  		engine->id = i;
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  494  		spin_lock_init(&engine->lock);
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  495  
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  496  		ret = mv_cesa_get_sram(pdev, i);
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  497  		if (ret)
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  498  			goto err_cleanup;
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  499  
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  500  		irq = platform_get_irq(pdev, i);
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  501  		if (irq < 0) {
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  502  			ret = irq;
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  503  			goto err_cleanup;
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  504  		}
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  505  
28ee8b0912ca2f drivers/crypto/marvell/cesa/cesa.c Sven Auhagen    2020-07-21  506  		engine->irq = irq;
28ee8b0912ca2f drivers/crypto/marvell/cesa/cesa.c Sven Auhagen    2020-07-21  507  
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  508  		/*
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  509  		 * Not all platforms can gate the CESA clocks: do not complain
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  510  		 * if the clock does not exist.
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  511  		 */
0501d0d1494900 drivers/crypto/marvell/cesa/cesa.c Herbert Xu      2023-10-27  512  		snprintf(res_name, sizeof(res_name), "cesa%u", i);
4d5eba631bcc35 drivers/crypto/marvell/cesa/cesa.c Rosen Penev     2024-10-01  513  		engine->clk = devm_clk_get_optional_enabled(dev, res_name);
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  514  		if (IS_ERR(engine->clk)) {
4d5eba631bcc35 drivers/crypto/marvell/cesa/cesa.c Rosen Penev     2024-10-01  515  			engine->clk = devm_clk_get_optional_enabled(dev, NULL);
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  516  			if (IS_ERR(engine->clk))
4d5eba631bcc35 drivers/crypto/marvell/cesa/cesa.c Rosen Penev     2024-10-01 @517  				goto err_cleanup;
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  518  		}
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  519  
0501d0d1494900 drivers/crypto/marvell/cesa/cesa.c Herbert Xu      2023-10-27  520  		snprintf(res_name, sizeof(res_name), "cesaz%u", i);
4d5eba631bcc35 drivers/crypto/marvell/cesa/cesa.c Rosen Penev     2024-10-01  521  		engine->zclk = devm_clk_get_optional_enabled(dev, res_name);
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  522  		if (IS_ERR(engine->zclk))
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  523  			goto err_cleanup;
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  524  
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  525  		engine->regs = cesa->regs + CESA_ENGINE_OFF(i);
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  526  
db509a45339fd7 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  527  		if (dram && cesa->caps->has_tdma)
21ec757d2dd865 drivers/crypto/marvell/cesa.c      Romain Perier   2016-04-19  528  			mv_cesa_conf_mbus_windows(engine, dram);
db509a45339fd7 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  529  
21ec757d2dd865 drivers/crypto/marvell/cesa.c      Romain Perier   2016-04-19  530  		writel(0, engine->regs + CESA_SA_INT_STATUS);
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  531  		writel(CESA_SA_CFG_STOP_DIG_ERR,
21ec757d2dd865 drivers/crypto/marvell/cesa.c      Romain Perier   2016-04-19  532  		       engine->regs + CESA_SA_CFG);
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  533  		writel(engine->sram_dma & CESA_SA_SRAM_MSK,
21ec757d2dd865 drivers/crypto/marvell/cesa.c      Romain Perier   2016-04-19  534  		       engine->regs + CESA_SA_DESC_P0);
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  535  
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  536  		ret = devm_request_threaded_irq(dev, irq, NULL, mv_cesa_int,
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  537  						IRQF_ONESHOT,
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  538  						dev_name(&pdev->dev),
21ec757d2dd865 drivers/crypto/marvell/cesa.c      Romain Perier   2016-04-19  539  						engine);
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  540  		if (ret)
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  541  			goto err_cleanup;
bf8f91e711926c drivers/crypto/marvell/cesa.c      Romain Perier   2016-06-21  542  
28ee8b0912ca2f drivers/crypto/marvell/cesa/cesa.c Sven Auhagen    2020-07-21  543  		/* Set affinity */
28ee8b0912ca2f drivers/crypto/marvell/cesa/cesa.c Sven Auhagen    2020-07-21  544  		cpu = cpumask_local_spread(engine->id, NUMA_NO_NODE);
28ee8b0912ca2f drivers/crypto/marvell/cesa/cesa.c Sven Auhagen    2020-07-21  545  		irq_set_affinity_hint(irq, get_cpu_mask(cpu));
28ee8b0912ca2f drivers/crypto/marvell/cesa/cesa.c Sven Auhagen    2020-07-21  546  
bf8f91e711926c drivers/crypto/marvell/cesa.c      Romain Perier   2016-06-21  547  		crypto_init_queue(&engine->queue, CESA_CRYPTO_DEFAULT_MAX_QLEN);
bf8f91e711926c drivers/crypto/marvell/cesa.c      Romain Perier   2016-06-21  548  		atomic_set(&engine->load, 0);
85030c5168f1df drivers/crypto/marvell/cesa.c      Romain Perier   2016-06-21  549  		INIT_LIST_HEAD(&engine->complete_queue);
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  550  	}
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  551  
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  552  	cesa_dev = cesa;
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  553  
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  554  	ret = mv_cesa_add_algs(cesa);
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  555  	if (ret) {
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  556  		cesa_dev = NULL;
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  557  		goto err_cleanup;
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  558  	}
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  559  
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  560  	dev_info(dev, "CESA device successfully registered\n");
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  561  
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  562  	return 0;
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  563  
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  564  err_cleanup:
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  565  	for (i = 0; i < caps->nengines; i++) {
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  566  		mv_cesa_put_sram(pdev, i);
28ee8b0912ca2f drivers/crypto/marvell/cesa/cesa.c Sven Auhagen    2020-07-21  567  		if (cesa->engines[i].irq > 0)
28ee8b0912ca2f drivers/crypto/marvell/cesa/cesa.c Sven Auhagen    2020-07-21  568  			irq_set_affinity_hint(cesa->engines[i].irq, NULL);
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  569  	}
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  570  
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  571  	return ret;
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  572  }
f63601fd616ab3 drivers/crypto/marvell/cesa.c      Boris Brezillon 2015-06-18  573  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
