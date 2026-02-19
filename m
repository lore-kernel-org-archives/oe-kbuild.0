Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418AD335561
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Feb 2026 08:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771489362; cv=none; b=lUw9WIaMKGRdY61IBhvTL+Q3dFHVhVndIgenBeeZez5mvJhJeg3VmcukxvKUwNxehlAy985AGbk+tUfo56Yo8mWSEWZMMh2M3lMqVlN14gvzU/D4e78md3oCa1koVbqhVWcJcA99iBo0G6BISEKbmmbwkd+ZzLw2XlimYCqWj6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771489362; c=relaxed/simple;
	bh=yJ+COvpiMGz+oVO3xJ3UpYvs+If0stPqHups40gU1fM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=cK6GBVBDAcTFO0jCOFzKUx5FtiHVDJ+wDker1Im0P182UD665RRkRunvCpikX5W9zUxJs5izAWr2iuf0PMMu348OYPvPmn4CdsDNQpklB62jCN21a6iu8vhE/5bM2sxzvcwVYGYk2jccslzbJsw3fkkT3aBJtOW+of4RF68SaKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ddFexdqf; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ddFexdqf"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-483770e0b25so6756855e9.0
        for <oe-kbuild@lists.linux.dev>; Thu, 19 Feb 2026 00:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771489359; x=1772094159; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0D6P+pMy0FNkLSD5nYId8+lNUqZXXTENXB4evIwBeIY=;
        b=ddFexdqfPKwk1KxmosfORi8DhuFiB04+IofuIPy0VdBpGKWgroijqzWV2xsZqnp6l4
         FSIuJUw+69fxCDcd5EkG0gwCNcVzjFTsrjmGadOIi8njVkERlVt4nYX1+yHNVaqdN6BH
         KJJyRJSllq74/cO72dVrpkJogkW37+Tu4443H+Ng/pfq3qpkJCYup9QbI3oQg2seqokT
         cLbaSYnQtiE8njt8QwUbt5qNJ60khioXM/A6rBH9gs/S2HerM5XvE4AUNTDlvA1amcVk
         s7OSpaKTb2a0Lw3BvIa1w3BD7p5OSCQ8HqEBJLvHbIRi58C87L7Dhbmyki/xS7OIAXIO
         e+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771489359; x=1772094159;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D6P+pMy0FNkLSD5nYId8+lNUqZXXTENXB4evIwBeIY=;
        b=nXaBd6Sk4nxziCzYpWJyTG/Z72/sUonwshEQOwAkLK6ceIhWYAF13x+2OQ0LSa97tn
         AJCMitWjySa1VN1cqb41bVkEvRuBb+/ZF6m4uQX58DW1HzBXxoPG1V+RxG6JKvp1ghBQ
         LhjK8dYez402OfpsDdkCqe0S9wJgvi6cY4MnOJRgCU0rhGKdlmE/NSJ0WPN2L7Db7vSU
         yUKojfV/oxNVLGtK5e/RzS2bSnCAzedy6H4LBA9yZbkFfAU1pA5jtBZ5IuRPDE6r5g7f
         OU15ZUtLRJ/mw6QL7XlLoejVoxTYxbyYQRmkLdj93b1MkBqOgjSy6gYkH7PEnfgfOaEu
         Madg==
X-Gm-Message-State: AOJu0YzrxV9hmGpB3ctNtiCf4eaZ4GnOJmsNTxgv4o0MgRuK0eo5OOwm
	khhG/Ti2/UyzCRmFR4JRXRvWJqrq+Yf0W/PgyNBBjybkTkSMyiOAeM6ATDrpUILxXifNk/sCDR7
	2Rn79cMA=
X-Gm-Gg: AZuq6aKwtFx9UDxaaGRbNfXJUls9ET50Xlqz4DquElbnama9+NbmUFIdkEELTyFzJoN
	0IZzZ/BduwAOsqOo8roHxjQbDBhWBKttrRAN/aDTlETix0pYV19lfI7mQULoCKiKdB+VWsASoq+
	X/CyR98mHr0dVcJnSR7lm3JBGj5I01PIRi+VZx8kqqwQRp6xSwmuWvyp5HNW8mbb6v7VS6qayjX
	GzIDG8Y73iZc6oaK0wE+A2dzTxBn2edkGqgvX23WL+vt0oZaYUGf6guKeo9kYalWn5vunIrKkXF
	HHY3hLXZEjs/cRhgXqgkJO4LFKBKhSPMBfGy3YPv5W8R98VDy4dzQ/N9GH8JYEAkB/ASjltn6O9
	KRvgLGdaT9jeLr4OUXqykzaoU/tsmNBQ9rCSdTDY1qlzQ3fUt19SLr7oTkOPA0RWKB2x1u0pNJM
	BbQ2fapJIpqCIe6G4Ja62qW4R4nSKR
X-Received: by 2002:a05:600c:870b:b0:483:6f37:1b56 with SMTP id 5b1f17b1804b1-48371051b15mr358346635e9.10.1771489359323;
        Thu, 19 Feb 2026 00:22:39 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839f986118sm12865185e9.21.2026.02.19.00.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 00:22:38 -0800 (PST)
Date: Thu, 19 Feb 2026 11:22:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Larisa Grigore <larisa.grigore@oss.nxp.com>,
	gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, sumit.semwal@linaro.org,
	christian.koenig@amd.com, chester62515@gmail.com,
	cosmin.stoica@nxp.com, adrian.nitu@freescale.com,
	stefan-gabriel.mirea@nxp.com, Mihaela.Martinas@freescale.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	s32@nxp.com, imx@lists.linux.dev, clizzi@redhat.com,
	aruizrui@redhat.com, eballetb@redhat.com, echanude@redhat.com,
	jkangas@redhat.com, Larisa Grigore <larisa.grigore@oss.nxp.com>,
	Radu Pirea <radu-nicolae.pirea@nxp.com>,
	Phu Luu An <phu.luuan@nxp.com>, Js Ha <js.ha@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH 12/13] serial: linflexuart: Add DMA support
Message-ID: <202602171109.6YSFXcJ3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216150205.212318-13-larisa.grigore@oss.nxp.com>
Message-ID: <20260219082235.vrtrZGAT2oYzqP3O-E1LJKi4QvH_wy130VrTPL4VfYk@z>

Hi Larisa,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Larisa-Grigore/serial-linflexuart-Fix-locking-in-set_termios/20260216-231403
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20260216150205.212318-13-larisa.grigore%40oss.nxp.com
patch subject: [PATCH 12/13] serial: linflexuart: Add DMA support
config: i386-randconfig-141-20260217 (https://download.01.org/0day-ci/archive/20260217/202602171109.6YSFXcJ3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602171109.6YSFXcJ3-lkp@intel.com/

smatch warnings:
drivers/tty/serial/fsl_linflexuart.c:1441 linflex_probe() warn: missing unwind goto?

vim +1441 drivers/tty/serial/fsl_linflexuart.c

09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1377  static int linflex_probe(struct platform_device *pdev)
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1378  {
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1379  	struct device_node *np = pdev->dev.of_node;
1d3f5f07fafc71 Radu Pirea           2026-02-16  1380  	struct linflex_port *lfport;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1381  	struct uart_port *sport;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1382  	struct resource *res;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1383  	int ret;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1384  
1d3f5f07fafc71 Radu Pirea           2026-02-16  1385  	lfport = devm_kzalloc(&pdev->dev, sizeof(*lfport), GFP_KERNEL);
1d3f5f07fafc71 Radu Pirea           2026-02-16  1386  	if (!lfport)
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1387  		return -ENOMEM;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1388  
1d3f5f07fafc71 Radu Pirea           2026-02-16  1389  	sport = &lfport->port;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1390  	sport->dev = &pdev->dev;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1391  
0b34325c5f79f1 Larisa Grigore       2026-02-16  1392  	lfport->dma_tx_chan = dma_request_chan(sport->dev, "tx");
0b34325c5f79f1 Larisa Grigore       2026-02-16  1393  	if (IS_ERR(lfport->dma_tx_chan)) {
0b34325c5f79f1 Larisa Grigore       2026-02-16  1394  		ret = PTR_ERR(lfport->dma_tx_chan);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1395  		if (ret == -EPROBE_DEFER)
0b34325c5f79f1 Larisa Grigore       2026-02-16  1396  			return ret;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1397  
0b34325c5f79f1 Larisa Grigore       2026-02-16  1398  		dev_info(sport->dev,
0b34325c5f79f1 Larisa Grigore       2026-02-16  1399  			 "DMA tx channel request failed, operating without tx DMA %ld\n",
0b34325c5f79f1 Larisa Grigore       2026-02-16  1400  			 PTR_ERR(lfport->dma_tx_chan));
0b34325c5f79f1 Larisa Grigore       2026-02-16  1401  		lfport->dma_tx_chan = NULL;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1402  	}
0b34325c5f79f1 Larisa Grigore       2026-02-16  1403  
0b34325c5f79f1 Larisa Grigore       2026-02-16  1404  	lfport->dma_rx_chan = dma_request_chan(sport->dev, "rx");
0b34325c5f79f1 Larisa Grigore       2026-02-16  1405  	if (IS_ERR(lfport->dma_rx_chan)) {
0b34325c5f79f1 Larisa Grigore       2026-02-16  1406  		ret = PTR_ERR(lfport->dma_rx_chan);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1407  		if (ret == -EPROBE_DEFER) {
0b34325c5f79f1 Larisa Grigore       2026-02-16  1408  			dma_release_channel(lfport->dma_tx_chan);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1409  			return ret;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1410  		}
0b34325c5f79f1 Larisa Grigore       2026-02-16  1411  
0b34325c5f79f1 Larisa Grigore       2026-02-16  1412  		dev_info(sport->dev,
0b34325c5f79f1 Larisa Grigore       2026-02-16  1413  			 "DMA rx channel request failed, operating without rx DMA %ld\n",
0b34325c5f79f1 Larisa Grigore       2026-02-16  1414  			 PTR_ERR(lfport->dma_rx_chan));
0b34325c5f79f1 Larisa Grigore       2026-02-16  1415  		lfport->dma_rx_chan = NULL;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1416  	}
1d3f5f07fafc71 Radu Pirea           2026-02-16  1417  
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1418  	ret = of_alias_get_id(np, "serial");
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1419  	if (ret < 0) {
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1420  		dev_err(&pdev->dev, "failed to get alias id, errno %d\n", ret);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1421  		goto linflex_probe_free_dma;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1422  	}
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1423  	if (ret >= UART_NR) {
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1424  		dev_err(&pdev->dev, "driver limited to %d serial ports\n",
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1425  			UART_NR);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1426  		ret = -ENOMEM;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1427  		goto linflex_probe_free_dma;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1428  	}
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1429  
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1430  	sport->line = ret;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1431  
8c6d7e5fd50b45 Yangtao Li           2023-07-12  1432  	sport->membase = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1433  	if (IS_ERR(sport->membase)) {
0b34325c5f79f1 Larisa Grigore       2026-02-16  1434  		ret = PTR_ERR(sport->membase);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1435  		goto linflex_probe_free_dma;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1436  	}
8c6d7e5fd50b45 Yangtao Li           2023-07-12  1437  	sport->mapbase = res->start;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1438  
4e8da86fc1f767 Zhang Shurong        2023-08-26  1439  	ret = platform_get_irq(pdev, 0);
4e8da86fc1f767 Zhang Shurong        2023-08-26  1440  	if (ret < 0)
4e8da86fc1f767 Zhang Shurong        2023-08-26 @1441  		return ret;

No clean up?

4e8da86fc1f767 Zhang Shurong        2023-08-26  1442  
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1443  	sport->iotype = UPIO_MEM;
4e8da86fc1f767 Zhang Shurong        2023-08-26  1444  	sport->irq = ret;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1445  	sport->ops = &linflex_pops;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1446  	sport->flags = UPF_BOOT_AUTOCONF;
4151bbed79f98b Dmitry Safonov       2019-12-13  1447  	sport->has_sysrq = IS_ENABLED(CONFIG_SERIAL_FSL_LINFLEXUART_CONSOLE);
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1448  
1d3f5f07fafc71 Radu Pirea           2026-02-16  1449  	ret = linflex_init_clk(lfport);
1d3f5f07fafc71 Radu Pirea           2026-02-16  1450  	if (ret)
0b34325c5f79f1 Larisa Grigore       2026-02-16  1451  		goto linflex_probe_free_dma;
1d3f5f07fafc71 Radu Pirea           2026-02-16  1452  
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1453  	linflex_ports[sport->line] = sport;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1454  
1d3f5f07fafc71 Radu Pirea           2026-02-16  1455  	platform_set_drvdata(pdev, lfport);
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1456  
1d3f5f07fafc71 Radu Pirea           2026-02-16  1457  	ret = uart_add_one_port(&linflex_reg, sport);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1458  	if (ret) {
1d3f5f07fafc71 Radu Pirea           2026-02-16  1459  		clk_bulk_disable_unprepare(LINFLEX_CLK_NUM, lfport->clks);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1460  		goto linflex_probe_free_dma;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1461  	}
0b34325c5f79f1 Larisa Grigore       2026-02-16  1462  
0b34325c5f79f1 Larisa Grigore       2026-02-16  1463  	return 0;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1464  
0b34325c5f79f1 Larisa Grigore       2026-02-16  1465  linflex_probe_free_dma:
0b34325c5f79f1 Larisa Grigore       2026-02-16  1466  	if (lfport->dma_tx_chan)
0b34325c5f79f1 Larisa Grigore       2026-02-16  1467  		dma_release_channel(lfport->dma_tx_chan);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1468  	if (lfport->dma_rx_chan)
0b34325c5f79f1 Larisa Grigore       2026-02-16  1469  		dma_release_channel(lfport->dma_rx_chan);
1d3f5f07fafc71 Radu Pirea           2026-02-16  1470  
1d3f5f07fafc71 Radu Pirea           2026-02-16  1471  	return ret;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1472  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

