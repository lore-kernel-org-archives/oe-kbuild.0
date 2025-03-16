Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECA713632B
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Mar 2025 12:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742128829; cv=none; b=HmWMNmj6U9f7z1GHYHw8hHOCTwdESB2CPGpoNiLQkifOdpWZMDPnl4C9Tz21zbcjcTyfXZDrN/3chYFvYfx5/poJaBUhIbSnO+tfXKFkRFxncdD8rn/fW5eZ/4/i+JsxG7ma5A7Wea7r2+ljXALMPUTfOGNL+YhYgVjnCMSc93s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742128829; c=relaxed/simple;
	bh=AOjGkAx8DIRgaqh/7z8qj+uf+SdpjoJOxNXsl9fmtNo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hEdGLvxbsdhvszy9V0O8t9cJSpTVQbORwsWrpMtOPKlruuyCJZbVk+MulmUEUg+Vmlapl7W2eMY9Wwoy7xKRfxjJ9U2kPJwif5obkSqUx+SFg7xFCFiYMAZBwxWz0yIz8zvB902+VB106HiXinXYq9CZBVvof01hZSqaqsSlLn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UJ0KkWoa; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJ0KkWoa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742128827; x=1773664827;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AOjGkAx8DIRgaqh/7z8qj+uf+SdpjoJOxNXsl9fmtNo=;
  b=UJ0KkWoankSZuOh8rA/omX9JjcuIt+BuMyQ/rAYpFS0YFB6WCWIwndIa
   1ZqUkiid5VRauQNSyL7RleTy2N36AJBlUce2VqTY+mUaAZZpljGK0GZlW
   vzIgo2JQubbIIZ13aYlVt1xdYFzDi/fGWJ2F163TTgQvAgRQf1WhrpAsk
   A7Kc3X+4kb1/rpbiQ/LjIaTPhSYt9pUPgSBD2YJmlUOyr1b+YeT3467dU
   PlWHiAB5lUAvKB3O+qsVK3Id+kJS/We98Az9tIkmcXbWPw7Z+XUfPHl1/
   7ZyBYFosvgI7+CHHH6quCh1BPcymphufsAj0AQaas9Kx74fFxYcoLBAtm
   w==;
X-CSE-ConnectionGUID: ++WA7czdQPurfWv45tx4Zg==
X-CSE-MsgGUID: lKY6CqDhTH2tCi/nXr1hCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="53890873"
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="53890873"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 05:40:26 -0700
X-CSE-ConnectionGUID: R3ehNR/MTqm2uFrxnVN7pw==
X-CSE-MsgGUID: gBShRLV1SgiSkMEcIL0T1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="126893408"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 16 Mar 2025 05:40:26 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttnHy-000C09-3D;
	Sun, 16 Mar 2025 12:40:23 +0000
Date: Sun, 16 Mar 2025 20:40:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/tty/serial/xilinx_uartps.c:1557 cdns_uart_probe() warn:
 passing positive error code '(-517)' to 'PTR_ERR'
Message-ID: <202503162056.R964tUQP-lkp@intel.com>
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
TO: Rajan Vaja <rajan.vaja@xilinx.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cb82ca153949c6204af793de24b18a04236e79fd
commit: f694936c3b5a4c140ded5b673555d95aedc866b9 tty: xilinx_uartps: Correct return value in probe
date:   6 years ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 years ago
config: i386-randconfig-141-20250314 (https://download.01.org/0day-ci/archive/20250316/202503162056.R964tUQP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503162056.R964tUQP-lkp@intel.com/

New smatch warnings:
drivers/tty/serial/xilinx_uartps.c:1557 cdns_uart_probe() warn: passing positive error code '(-517)' to 'PTR_ERR'

Old smatch warnings:
drivers/tty/serial/xilinx_uartps.c:1572 cdns_uart_probe() warn: passing positive error code '(-517)' to 'PTR_ERR'

vim +1557 drivers/tty/serial/xilinx_uartps.c

10a5315b47b09ea Michal Simek       2018-09-03  1532  
024ca329bfb9a94 Michal Simek       2018-09-03  1533  	rc = uart_register_driver(cdns_uart_uart_driver);
e4bbb5194ea3bc7 Michal Simek       2018-09-03  1534  	if (rc < 0) {
e4bbb5194ea3bc7 Michal Simek       2018-09-03  1535  		dev_err(&pdev->dev, "Failed to register driver\n");
ae1cca3fa3478be Michal Simek       2018-09-20  1536  		goto err_out_id;
e4bbb5194ea3bc7 Michal Simek       2018-09-03  1537  	}
e4bbb5194ea3bc7 Michal Simek       2018-09-03  1538  
024ca329bfb9a94 Michal Simek       2018-09-03  1539  	cdns_uart_data->cdns_uart_driver = cdns_uart_uart_driver;
024ca329bfb9a94 Michal Simek       2018-09-03  1540  
024ca329bfb9a94 Michal Simek       2018-09-03  1541  	/*
024ca329bfb9a94 Michal Simek       2018-09-03  1542  	 * Setting up proper name_base needs to be done after uart
024ca329bfb9a94 Michal Simek       2018-09-03  1543  	 * registration because tty_driver structure is not filled.
024ca329bfb9a94 Michal Simek       2018-09-03  1544  	 * name_base is 0 by default.
024ca329bfb9a94 Michal Simek       2018-09-03  1545  	 */
bed25ac0e2b6ab8 Michal Simek       2018-09-03  1546  	cdns_uart_uart_driver->tty_driver->name_base = cdns_uart_data->id;
46a460f0150ab47 Michal Simek       2018-09-03  1547  
3816b2f886d0918 Nava kishore Manne 2016-09-15  1548  	match = of_match_node(cdns_uart_of_match, pdev->dev.of_node);
3816b2f886d0918 Nava kishore Manne 2016-09-15  1549  	if (match && match->data) {
3816b2f886d0918 Nava kishore Manne 2016-09-15  1550  		const struct cdns_platform_data *data = match->data;
3816b2f886d0918 Nava kishore Manne 2016-09-15  1551  
3816b2f886d0918 Nava kishore Manne 2016-09-15  1552  		cdns_uart_data->quirks = data->quirks;
3816b2f886d0918 Nava kishore Manne 2016-09-15  1553  	}
3816b2f886d0918 Nava kishore Manne 2016-09-15  1554  
d9bb3fb12685209 Soren Brinkmann    2014-04-04  1555  	cdns_uart_data->pclk = devm_clk_get(&pdev->dev, "pclk");
f694936c3b5a4c1 Rajan Vaja         2019-03-01  1556  	if (PTR_ERR(cdns_uart_data->pclk) == -EPROBE_DEFER) {
f694936c3b5a4c1 Rajan Vaja         2019-03-01 @1557  		rc = PTR_ERR(cdns_uart_data->pclk);
f694936c3b5a4c1 Rajan Vaja         2019-03-01  1558  		goto err_out_unregister_driver;
f694936c3b5a4c1 Rajan Vaja         2019-03-01  1559  	}
f694936c3b5a4c1 Rajan Vaja         2019-03-01  1560  
d9bb3fb12685209 Soren Brinkmann    2014-04-04  1561  	if (IS_ERR(cdns_uart_data->pclk)) {
d9bb3fb12685209 Soren Brinkmann    2014-04-04  1562  		cdns_uart_data->pclk = devm_clk_get(&pdev->dev, "aper_clk");
82ca0d5487d4e14 Greg Kroah-Hartman 2018-12-06  1563  		if (IS_ERR(cdns_uart_data->pclk)) {
82ca0d5487d4e14 Greg Kroah-Hartman 2018-12-06  1564  			rc = PTR_ERR(cdns_uart_data->pclk);
82ca0d5487d4e14 Greg Kroah-Hartman 2018-12-06  1565  			goto err_out_unregister_driver;
82ca0d5487d4e14 Greg Kroah-Hartman 2018-12-06  1566  		}
f694936c3b5a4c1 Rajan Vaja         2019-03-01  1567  		dev_err(&pdev->dev, "clock name 'aper_clk' is deprecated.\n");
f694936c3b5a4c1 Rajan Vaja         2019-03-01  1568  	}
d9bb3fb12685209 Soren Brinkmann    2014-04-04  1569  
d9bb3fb12685209 Soren Brinkmann    2014-04-04  1570  	cdns_uart_data->uartclk = devm_clk_get(&pdev->dev, "uart_clk");
f694936c3b5a4c1 Rajan Vaja         2019-03-01  1571  	if (PTR_ERR(cdns_uart_data->uartclk) == -EPROBE_DEFER) {
f694936c3b5a4c1 Rajan Vaja         2019-03-01  1572  		rc = PTR_ERR(cdns_uart_data->uartclk);
f694936c3b5a4c1 Rajan Vaja         2019-03-01  1573  		goto err_out_unregister_driver;
f694936c3b5a4c1 Rajan Vaja         2019-03-01  1574  	}
f694936c3b5a4c1 Rajan Vaja         2019-03-01  1575  
d9bb3fb12685209 Soren Brinkmann    2014-04-04  1576  	if (IS_ERR(cdns_uart_data->uartclk)) {
d9bb3fb12685209 Soren Brinkmann    2014-04-04  1577  		cdns_uart_data->uartclk = devm_clk_get(&pdev->dev, "ref_clk");
82ca0d5487d4e14 Greg Kroah-Hartman 2018-12-06  1578  		if (IS_ERR(cdns_uart_data->uartclk)) {
82ca0d5487d4e14 Greg Kroah-Hartman 2018-12-06  1579  			rc = PTR_ERR(cdns_uart_data->uartclk);
82ca0d5487d4e14 Greg Kroah-Hartman 2018-12-06  1580  			goto err_out_unregister_driver;
82ca0d5487d4e14 Greg Kroah-Hartman 2018-12-06  1581  		}
f694936c3b5a4c1 Rajan Vaja         2019-03-01  1582  		dev_err(&pdev->dev, "clock name 'ref_clk' is deprecated.\n");
f694936c3b5a4c1 Rajan Vaja         2019-03-01  1583  	}
2326669ccbd901d Josh Cartwright    2013-01-21  1584  
ecfc5771ef0617d Shubhrajyoti Datta 2017-04-06  1585  	rc = clk_prepare_enable(cdns_uart_data->pclk);
30e1e28598c2674 Soren Brinkmann    2013-05-13  1586  	if (rc) {
d9bb3fb12685209 Soren Brinkmann    2014-04-04  1587  		dev_err(&pdev->dev, "Unable to enable pclk clock.\n");
e4bbb5194ea3bc7 Michal Simek       2018-09-03  1588  		goto err_out_unregister_driver;
30e1e28598c2674 Soren Brinkmann    2013-05-13  1589  	}
ecfc5771ef0617d Shubhrajyoti Datta 2017-04-06  1590  	rc = clk_prepare_enable(cdns_uart_data->uartclk);
2326669ccbd901d Josh Cartwright    2013-01-21  1591  	if (rc) {
30e1e28598c2674 Soren Brinkmann    2013-05-13  1592  		dev_err(&pdev->dev, "Unable to enable device clock.\n");
d9bb3fb12685209 Soren Brinkmann    2014-04-04  1593  		goto err_out_clk_dis_pclk;
61ec9016988f5c0 John Linn          2011-04-30  1594  	}
61ec9016988f5c0 John Linn          2011-04-30  1595  
61ec9016988f5c0 John Linn          2011-04-30  1596  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
30e1e28598c2674 Soren Brinkmann    2013-05-13  1597  	if (!res) {
30e1e28598c2674 Soren Brinkmann    2013-05-13  1598  		rc = -ENODEV;
30e1e28598c2674 Soren Brinkmann    2013-05-13  1599  		goto err_out_clk_disable;
30e1e28598c2674 Soren Brinkmann    2013-05-13  1600  	}
61ec9016988f5c0 John Linn          2011-04-30  1601  
5c90c07b98c0219 Michal Simek       2015-04-13  1602  	irq = platform_get_irq(pdev, 0);
5c90c07b98c0219 Michal Simek       2015-04-13  1603  	if (irq <= 0) {
5c90c07b98c0219 Michal Simek       2015-04-13  1604  		rc = -ENXIO;
30e1e28598c2674 Soren Brinkmann    2013-05-13  1605  		goto err_out_clk_disable;
30e1e28598c2674 Soren Brinkmann    2013-05-13  1606  	}
61ec9016988f5c0 John Linn          2011-04-30  1607  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
