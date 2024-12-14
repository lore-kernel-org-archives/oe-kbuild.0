Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BECC29CEF
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Dec 2024 22:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734214593; cv=none; b=oaqUwOGWdBqGJg7ZnCwYYPqSqeGXtwibkJ0rsVNEfPR2Qmsgh0Th53OUx4qgOdD+YG3QfZIyRFpe+tPKcvLRKAhyq4HoyBlGqzkkZnD8Qmc+ZuKQruzeP06Cz4MkbYnMPGa7fZRzUKpnmaRsTofNxtFjCi5mhKjSIeUGyN6kWI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734214593; c=relaxed/simple;
	bh=nuEwrzWb2ogFu8qYSaO+5N5c5pNfgoHuBqqos8PKESk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d1c82v9luejLHHOgfqpy1DU6j94duIZnP6lHUyC/j/IRgCq6fseEnOSb0d3qNkv8ww1zaw++aF/7TV2wtAPBbpEwAMfJ9TkaOCTm8/tRMyDy8+NnPk0dbMyCMtyK4lXQb8aB9dlFoGhmdVuNrVDbVM9YnOKL5jOKjBm3yPTOx2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ilXpWUKU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ilXpWUKU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734214591; x=1765750591;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nuEwrzWb2ogFu8qYSaO+5N5c5pNfgoHuBqqos8PKESk=;
  b=ilXpWUKU0Yej2Sjr9XLgEOU0CE+8H4ER4Ock37c9G1na4AmtkgIpKSUo
   bi4q/ev5UoC0XzSZY/89Kfo30B6ApBTeSGXauMRhaTouGwQkEIToMegj/
   6Xp2/zf9Z7leMa7XTeGMwZyBTlKFZeOdM04/hKnzj3Bjgss35U+Xn4WCk
   imgvj9crZ43Idyp7eocuBavBfmxUfM4dt9ybjS+eE+qlPMaP4385aZwo7
   QDzLC6Yf/B4Z4OAomGYgL5YmQV1WEExLv/+ZPoFyFez4HqcX18ZEZkjf6
   xHUyG89eBReg5g77XLRQNKod4GLn40By1KboVgL9zbacVuea1xQvmKbtU
   A==;
X-CSE-ConnectionGUID: 1gZ2xSc8R0SKKq/MYFBsbg==
X-CSE-MsgGUID: enX5arQZTn2XAGPdyxcswQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34782840"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="34782840"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 14:16:30 -0800
X-CSE-ConnectionGUID: 7vlzMw1TTQiU0etj2ClOmQ==
X-CSE-MsgGUID: MO2L45ZzTHGejqMaaNum1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="101875009"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Dec 2024 14:16:30 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMaR1-000DHY-05;
	Sat, 14 Dec 2024 22:16:27 +0000
Date: Sun, 15 Dec 2024 06:15:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] usb: phy-tahvo: fix call balance for tu->ick handling
 routines
Message-ID: <202412150530.f03D8q1a-lkp@intel.com>
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
In-Reply-To: <20241209152604.1918882-1-mordan@ispras.ru>
References: <20241209152604.1918882-1-mordan@ispras.ru>
TO: Vitalii Mordan <mordan@ispras.ru>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Vitalii Mordan <mordan@ispras.ru>
CC: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
CC: Aaro Koskinen <aaro.koskinen@iki.fi>
CC: Felipe Balbi <felipe.balbi@linux.intel.com>
CC: linux-usb@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Fedor Pchelkin <pchelkin@ispras.ru>
CC: Alexey Khoroshilov <khoroshilov@ispras.ru>
CC: Vadim Mutilin <mutilin@ispras.ru>
CC: stable@vger.kernel.org

Hi Vitalii,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.13-rc2 next-20241213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vitalii-Mordan/usb-phy-tahvo-fix-call-balance-for-tu-ick-handling-routines/20241209-232934
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20241209152604.1918882-1-mordan%40ispras.ru
patch subject: [PATCH] usb: phy-tahvo: fix call balance for tu->ick handling routines
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: alpha-randconfig-r072-20241215 (https://download.01.org/0day-ci/archive/20241215/202412150530.f03D8q1a-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412150530.f03D8q1a-lkp@intel.com/

smatch warnings:
drivers/usb/phy/phy-tahvo.c:347 tahvo_usb_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +347 drivers/usb/phy/phy-tahvo.c

9ba96ae5074c9f Aaro Koskinen   2013-12-06  341  
9ba96ae5074c9f Aaro Koskinen   2013-12-06  342  	mutex_init(&tu->serialize);
9ba96ae5074c9f Aaro Koskinen   2013-12-06  343  
125b175df62ecc Vitalii Mordan  2024-12-09  344  	tu->ick = devm_clk_get_enabled(&pdev->dev, "usb_l4_ick");
125b175df62ecc Vitalii Mordan  2024-12-09  345  	if (!IS_ERR(tu->ick)) {
125b175df62ecc Vitalii Mordan  2024-12-09  346  		dev_err(&pdev->dev, "failed to get and enable clock\n");
125b175df62ecc Vitalii Mordan  2024-12-09 @347  		return PTR_ERR(tu->ick);
125b175df62ecc Vitalii Mordan  2024-12-09  348  	}
9ba96ae5074c9f Aaro Koskinen   2013-12-06  349  
9ba96ae5074c9f Aaro Koskinen   2013-12-06  350  	/*
9ba96ae5074c9f Aaro Koskinen   2013-12-06  351  	 * Set initial state, so that we generate kevents only on state changes.
9ba96ae5074c9f Aaro Koskinen   2013-12-06  352  	 */
9ba96ae5074c9f Aaro Koskinen   2013-12-06  353  	tu->vbus_state = retu_read(rdev, TAHVO_REG_IDSR) & TAHVO_STAT_VBUS;
9ba96ae5074c9f Aaro Koskinen   2013-12-06  354  
860d2686fda7e4 Chanwoo Choi    2015-07-01  355  	tu->extcon = devm_extcon_dev_allocate(&pdev->dev, tahvo_cable);
860d2686fda7e4 Chanwoo Choi    2015-07-01  356  	if (IS_ERR(tu->extcon)) {
860d2686fda7e4 Chanwoo Choi    2015-07-01  357  		dev_err(&pdev->dev, "failed to allocate memory for extcon\n");
125b175df62ecc Vitalii Mordan  2024-12-09  358  		return PTR_ERR(tu->extcon);
860d2686fda7e4 Chanwoo Choi    2015-07-01  359  	}
9ba96ae5074c9f Aaro Koskinen   2013-12-06  360  
860d2686fda7e4 Chanwoo Choi    2015-07-01  361  	ret = devm_extcon_dev_register(&pdev->dev, tu->extcon);
9ba96ae5074c9f Aaro Koskinen   2013-12-06  362  	if (ret) {
9ba96ae5074c9f Aaro Koskinen   2013-12-06  363  		dev_err(&pdev->dev, "could not register extcon device: %d\n",
9ba96ae5074c9f Aaro Koskinen   2013-12-06  364  			ret);
125b175df62ecc Vitalii Mordan  2024-12-09  365  		return ret;
9ba96ae5074c9f Aaro Koskinen   2013-12-06  366  	}
9ba96ae5074c9f Aaro Koskinen   2013-12-06  367  
9ba96ae5074c9f Aaro Koskinen   2013-12-06  368  	/* Set the initial cable state. */
746c90857b3bf4 Chanwoo Choi    2017-01-16  369  	extcon_set_state_sync(tu->extcon, EXTCON_USB_HOST,
9ba96ae5074c9f Aaro Koskinen   2013-12-06  370  			       tu->tahvo_mode == TAHVO_MODE_HOST);
746c90857b3bf4 Chanwoo Choi    2017-01-16  371  	extcon_set_state_sync(tu->extcon, EXTCON_USB, tu->vbus_state);
9ba96ae5074c9f Aaro Koskinen   2013-12-06  372  
9ba96ae5074c9f Aaro Koskinen   2013-12-06  373  	/* Create OTG interface */
9ba96ae5074c9f Aaro Koskinen   2013-12-06  374  	tahvo_usb_power_off(tu);
9ba96ae5074c9f Aaro Koskinen   2013-12-06  375  	tu->phy.dev = &pdev->dev;
e47d92545c2972 Antoine Tenart  2014-10-30  376  	tu->phy.otg->state = OTG_STATE_UNDEFINED;
9ba96ae5074c9f Aaro Koskinen   2013-12-06  377  	tu->phy.label = DRIVER_NAME;
9ba96ae5074c9f Aaro Koskinen   2013-12-06  378  	tu->phy.set_suspend = tahvo_usb_set_suspend;
9ba96ae5074c9f Aaro Koskinen   2013-12-06  379  
19c1eac2685b62 Antoine Tenart  2014-10-30  380  	tu->phy.otg->usb_phy = &tu->phy;
9ba96ae5074c9f Aaro Koskinen   2013-12-06  381  	tu->phy.otg->set_host = tahvo_usb_set_host;
9ba96ae5074c9f Aaro Koskinen   2013-12-06  382  	tu->phy.otg->set_peripheral = tahvo_usb_set_peripheral;
9ba96ae5074c9f Aaro Koskinen   2013-12-06  383  
9ba96ae5074c9f Aaro Koskinen   2013-12-06  384  	ret = usb_add_phy(&tu->phy, USB_PHY_TYPE_USB2);
9ba96ae5074c9f Aaro Koskinen   2013-12-06  385  	if (ret < 0) {
9ba96ae5074c9f Aaro Koskinen   2013-12-06  386  		dev_err(&pdev->dev, "cannot register USB transceiver: %d\n",
9ba96ae5074c9f Aaro Koskinen   2013-12-06  387  			ret);
125b175df62ecc Vitalii Mordan  2024-12-09  388  		return ret;
9ba96ae5074c9f Aaro Koskinen   2013-12-06  389  	}
9ba96ae5074c9f Aaro Koskinen   2013-12-06  390  
9ba96ae5074c9f Aaro Koskinen   2013-12-06  391  	dev_set_drvdata(&pdev->dev, tu);
9ba96ae5074c9f Aaro Koskinen   2013-12-06  392  
0d45a1373e6698 Sergey Shtylyov 2021-08-13  393  	tu->irq = ret = platform_get_irq(pdev, 0);
0d45a1373e6698 Sergey Shtylyov 2021-08-13  394  	if (ret < 0)
342161c11403ea Li Yang         2023-04-20  395  		goto err_remove_phy;
a81df9eedf7d29 Fabio Estevam   2015-05-22  396  	ret = request_threaded_irq(tu->irq, NULL, tahvo_usb_vbus_interrupt,
a81df9eedf7d29 Fabio Estevam   2015-05-22  397  				   IRQF_ONESHOT,
9ba96ae5074c9f Aaro Koskinen   2013-12-06  398  				   "tahvo-vbus", tu);
9ba96ae5074c9f Aaro Koskinen   2013-12-06  399  	if (ret) {
9ba96ae5074c9f Aaro Koskinen   2013-12-06  400  		dev_err(&pdev->dev, "could not register tahvo-vbus irq: %d\n",
9ba96ae5074c9f Aaro Koskinen   2013-12-06  401  			ret);
9ba96ae5074c9f Aaro Koskinen   2013-12-06  402  		goto err_remove_phy;
9ba96ae5074c9f Aaro Koskinen   2013-12-06  403  	}
9ba96ae5074c9f Aaro Koskinen   2013-12-06  404  
9ba96ae5074c9f Aaro Koskinen   2013-12-06  405  	return 0;
9ba96ae5074c9f Aaro Koskinen   2013-12-06  406  
9ba96ae5074c9f Aaro Koskinen   2013-12-06  407  err_remove_phy:
9ba96ae5074c9f Aaro Koskinen   2013-12-06  408  	usb_remove_phy(&tu->phy);
9ba96ae5074c9f Aaro Koskinen   2013-12-06  409  
9ba96ae5074c9f Aaro Koskinen   2013-12-06  410  	return ret;
9ba96ae5074c9f Aaro Koskinen   2013-12-06  411  }
9ba96ae5074c9f Aaro Koskinen   2013-12-06  412  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
