Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BF01D959B
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Dec 2024 09:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734772761; cv=none; b=rXGM1U7ErdmyEIu4Ma8Yvaf+3gLqhHdG8Wg1seONpgw+t2nXPHl+KTHOkBIQj8yHYx97M153rgV+06FQ+wruThW+0Edp7HAZmAe2xSBbSwRJ2IrdFXeZEUjvLyEQmEz4F4N9mHHpKAUS8ZnrHBNsj8dknMTPcq18HUQHFGWnpVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734772761; c=relaxed/simple;
	bh=dzE3MOcy+GbKBk3RDiWP33WMGn+w1t2SwZK9Y3Nda1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nnAiCDeH8L1YvPH5lvVQWYTPs2cxNwsfPTiV4+cPwIwCNq1oycphM8/IgoaLQ8tTtvAD5g5JI1H5pBq6QNIgNYJ1WHWsfiMhvGJJRN0gpfQYQas/X342FAAwA4gUv7JJr8lvsU5MklblFiLYEadCyqa32ljh0/WAB2W97ju4648=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BNIcA2c6; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BNIcA2c6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734772759; x=1766308759;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dzE3MOcy+GbKBk3RDiWP33WMGn+w1t2SwZK9Y3Nda1A=;
  b=BNIcA2c6+JRnEOxpxNthPfZW5ufxHOIu3fOj/e1bHV9oVPNDYT/WLleq
   AVoiy0VmHbxiqMhwRCDADAQNAksTtCIvbkJTuDXCKjuIBRA+Hel3qg7+a
   NbWbfn/YXM1J1kYW6XVy7WXKSa55or6lA8dngnG/UiIrAjy6GB1ezc/bl
   gxZXPggeIUXFQ0oaMclnCoBXIGfNj/mp+3H2sF6YVIaRn7FoWz1F+FG/N
   tezEZM41nPo7FZxZrpLPS/HkcWEM3wYjj7oR+VB4Mj/Mhuu0jD2fxBdyk
   YrJaobZvE4H1ujiUPsHBPzFK+Inyp/z0HB/O0ZbE689naz28ufwjGgpHb
   A==;
X-CSE-ConnectionGUID: X3cunDQsTCmSF7lLA9OUug==
X-CSE-MsgGUID: ZvtLx5RIR1C2NRMSsPo/ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="38997318"
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="38997318"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 01:19:19 -0800
X-CSE-ConnectionGUID: X6Z1ZRaeQRa8vBXmQS9apg==
X-CSE-MsgGUID: dTHgqbKdTf2B61Y9Gyui5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99588312"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Dec 2024 01:19:17 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOvdi-00026t-36;
	Sat, 21 Dec 2024 09:19:14 +0000
Date: Sat, 21 Dec 2024 17:19:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] usb: chipidea: ci_hdrc_imx: decrement device's refcount
 on the error path of .probe()
Message-ID: <202412211736.mqsiCz0g-lkp@intel.com>
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
In-Reply-To: <20241212094945.3784866-1-joe@pf.is.s.u-tokyo.ac.jp>
References: <20241212094945.3784866-1-joe@pf.is.s.u-tokyo.ac.jp>
TO: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
TO: peter.chen@kernel.org
TO: gregkh@linuxfoundation.org
TO: shawnguo@kernel.org
TO: s.hauer@pengutronix.de
TO: kernel@pengutronix.de
TO: festevam@gmail.com
CC: linux-usb@vger.kernel.org
CC: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
CC: stable@vger.kernel.org

Hi Joe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.13-rc3 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joe-Hattori/usb-chipidea-ci_hdrc_imx-decrement-device-s-refcount-on-the-error-path-of-probe/20241212-175039
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20241212094945.3784866-1-joe%40pf.is.s.u-tokyo.ac.jp
patch subject: [PATCH] usb: chipidea: ci_hdrc_imx: decrement device's refcount on the error path of .probe()
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: riscv-randconfig-r072-20241221 (https://download.01.org/0day-ci/archive/20241221/202412211736.mqsiCz0g-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412211736.mqsiCz0g-lkp@intel.com/

New smatch warnings:
drivers/usb/chipidea/ci_hdrc_imx.c:537 ci_hdrc_imx_probe() error: we previously assumed 'data->usbmisc_data' could be null (see line 367)

Old smatch warnings:
arch/riscv/include/asm/atomic.h:218 arch_atomic_fetch_add_unless() warn: inconsistent indenting

vim +537 drivers/usb/chipidea/ci_hdrc_imx.c

7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  338  
8e22978c57087a drivers/usb/chipidea/ci_hdrc_imx.c Alexander Shishkin  2013-06-24  339  static int ci_hdrc_imx_probe(struct platform_device *pdev)
f6a3b3a37c4772 drivers/usb/chipidea/ci13xxx_imx.c Michael Grzeschik   2013-06-13  340  {
8e22978c57087a drivers/usb/chipidea/ci_hdrc_imx.c Alexander Shishkin  2013-06-24  341  	struct ci_hdrc_imx_data *data;
8e22978c57087a drivers/usb/chipidea/ci_hdrc_imx.c Alexander Shishkin  2013-06-24  342  	struct ci_hdrc_platform_data pdata = {
c844d6c884f372 drivers/usb/chipidea/ci_hdrc_imx.c Alexander Shiyan    2014-03-11  343  		.name		= dev_name(&pdev->dev),
f6a3b3a37c4772 drivers/usb/chipidea/ci13xxx_imx.c Michael Grzeschik   2013-06-13  344  		.capoffset	= DEF_CAPOFFSET,
ec841b8d73cff3 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2024-09-23  345  		.flags		= CI_HDRC_HAS_SHORT_PKT_LIMIT,
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  346  		.notify_event	= ci_hdrc_imx_notify_event,
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-07-07  347  	};
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-07-07  348  	int ret;
6f51bc340d2a1c drivers/usb/chipidea/ci_hdrc_imx.c LABBE Corentin      2015-11-12  349  	const struct ci_hdrc_imx_platform_flag *imx_platform_flag;
be9cae2479f48d drivers/usb/chipidea/ci_hdrc_imx.c Sebastian Reichel   2018-03-29  350  	struct device_node *np = pdev->dev.of_node;
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  351  	struct device *dev = &pdev->dev;
6f51bc340d2a1c drivers/usb/chipidea/ci_hdrc_imx.c LABBE Corentin      2015-11-12  352  
59b7c6a8fd6c44 drivers/usb/chipidea/ci_hdrc_imx.c Fabio Estevam       2020-11-24  353  	imx_platform_flag = of_device_get_match_data(&pdev->dev);
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-07-07  354  
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-07-07  355  	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
73529828cf896d drivers/usb/chipidea/ci_hdrc_imx.c Fabio Estevam       2014-11-26  356  	if (!data)
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-07-07  357  		return -ENOMEM;
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-07-07  358  
d1609c312d42f3 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-04-28  359  	data->plat_data = imx_platform_flag;
d1609c312d42f3 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-04-28  360  	pdata.flags |= imx_platform_flag->flags;
ae3e57ae26cdcc drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2015-09-16  361  	platform_set_drvdata(pdev, data);
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  362  	data->usbmisc_data = usbmisc_get_init_data(dev);
05986ba9b025ae drivers/usb/chipidea/ci_hdrc_imx.c Sascha Hauer        2013-08-14  363  	if (IS_ERR(data->usbmisc_data))
05986ba9b025ae drivers/usb/chipidea/ci_hdrc_imx.c Sascha Hauer        2013-08-14  364  		return PTR_ERR(data->usbmisc_data);
05986ba9b025ae drivers/usb/chipidea/ci_hdrc_imx.c Sascha Hauer        2013-08-14  365  
8ff396fe56f559 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-01-17  366  	if ((of_usb_get_phy_mode(dev->of_node) == USBPHY_INTERFACE_MODE_HSIC)
8ff396fe56f559 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-01-17 @367  		&& data->usbmisc_data) {
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  368  		pdata.flags |= CI_HDRC_IMX_IS_HSIC;
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  369  		data->usbmisc_data->hsic = 1;
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  370  		data->pinctrl = devm_pinctrl_get(dev);
3f4aad6e1a4c26 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-10-10  371  		if (PTR_ERR(data->pinctrl) == -ENODEV)
3f4aad6e1a4c26 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-10-10  372  			data->pinctrl = NULL;
686b7eb85418f9 drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-12-12  373  		else if (IS_ERR(data->pinctrl)) {
686b7eb85418f9 drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-12-12  374  			ret = dev_err_probe(dev, PTR_ERR(data->pinctrl),
18171cfc3c236a drivers/usb/chipidea/ci_hdrc_imx.c Alexander Stein     2022-06-14  375  					     "pinctrl get failed\n");
686b7eb85418f9 drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-12-12  376  			goto err_put;
686b7eb85418f9 drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-12-12  377  		}
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  378  
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-10-10  379  		data->hsic_pad_regulator =
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-10-10  380  				devm_regulator_get_optional(dev, "hsic");
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-10-10  381  		if (PTR_ERR(data->hsic_pad_regulator) == -ENODEV) {
9c3959bb4cbf2b drivers/usb/chipidea/ci_hdrc_imx.c Jonathan Neuschäfer 2022-11-04  382  			/* no pad regulator is needed */
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-10-10  383  			data->hsic_pad_regulator = NULL;
686b7eb85418f9 drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-12-12  384  		} else if (IS_ERR(data->hsic_pad_regulator)) {
686b7eb85418f9 drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-12-12  385  			ret = dev_err_probe(dev, PTR_ERR(data->hsic_pad_regulator),
18171cfc3c236a drivers/usb/chipidea/ci_hdrc_imx.c Alexander Stein     2022-06-14  386  					     "Get HSIC pad regulator error\n");
686b7eb85418f9 drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-12-12  387  			goto err_put;
686b7eb85418f9 drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-12-12  388  		}
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-10-10  389  
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-10-10  390  		if (data->hsic_pad_regulator) {
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-10-10  391  			ret = regulator_enable(data->hsic_pad_regulator);
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-10-10  392  			if (ret) {
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-10-10  393  				dev_err(dev,
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-10-10  394  					"Failed to enable HSIC pad regulator\n");
686b7eb85418f9 drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-12-12  395  				goto err_put;
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-10-10  396  			}
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-10-10  397  		}
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-10-10  398  	}
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-10-10  399  
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-10-10  400  	/* HSIC pinctrl handling */
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-10-10  401  	if (data->pinctrl) {
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-10-10  402  		struct pinctrl_state *pinctrl_hsic_idle;
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-10-10  403  
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  404  		pinctrl_hsic_idle = pinctrl_lookup_state(data->pinctrl, "idle");
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  405  		if (IS_ERR(pinctrl_hsic_idle)) {
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  406  			dev_err(dev,
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  407  				"pinctrl_hsic_idle lookup failed, err=%ld\n",
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  408  					PTR_ERR(pinctrl_hsic_idle));
686b7eb85418f9 drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-12-12  409  			ret = PTR_ERR(pinctrl_hsic_idle);
686b7eb85418f9 drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-12-12  410  			goto err_put;
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  411  		}
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  412  
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  413  		ret = pinctrl_select_state(data->pinctrl, pinctrl_hsic_idle);
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  414  		if (ret) {
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  415  			dev_err(dev, "hsic_idle select failed, err=%d\n", ret);
686b7eb85418f9 drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-12-12  416  			goto err_put;
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  417  		}
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-07-07  418  
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  419  		data->pinctrl_hsic_active = pinctrl_lookup_state(data->pinctrl,
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  420  								"active");
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  421  		if (IS_ERR(data->pinctrl_hsic_active)) {
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  422  			dev_err(dev,
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  423  				"pinctrl_hsic_active lookup failed, err=%ld\n",
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  424  					PTR_ERR(data->pinctrl_hsic_active));
686b7eb85418f9 drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-12-12  425  			ret = PTR_ERR(data->pinctrl_hsic_active);
686b7eb85418f9 drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-12-12  426  			goto err_put;
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  427  		}
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  428  	}
d1609c312d42f3 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-04-28  429  
d1609c312d42f3 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-04-28  430  	if (pdata.flags & CI_HDRC_PMQOS)
77b352456941e8 drivers/usb/chipidea/ci_hdrc_imx.c Rafael J. Wysocki   2020-02-12  431  		cpu_latency_qos_add_request(&data->pm_qos_req, 0);
d1609c312d42f3 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-04-28  432  
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  433  	ret = imx_get_clks(dev);
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  434  	if (ret)
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  435  		goto disable_hsic_regulator;
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  436  
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  437  	ret = imx_prepare_enable_clks(dev);
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  438  	if (ret)
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  439  		goto disable_hsic_regulator;
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-07-07  440  
5dbe9ac28355fd drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2023-12-28  441  	ret = clk_prepare_enable(data->clk_wakeup);
5dbe9ac28355fd drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2023-12-28  442  	if (ret)
5dbe9ac28355fd drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2023-12-28  443  		goto err_wakeup_clk;
5dbe9ac28355fd drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2023-12-28  444  
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  445  	data->phy = devm_usb_get_phy_by_phandle(dev, "fsl,usbphy", 0);
af59a8b120d189 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2013-09-24  446  	if (IS_ERR(data->phy)) {
af59a8b120d189 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2013-09-24  447  		ret = PTR_ERR(data->phy);
3a1bd0494352bd drivers/usb/chipidea/ci_hdrc_imx.c Alexander Stein     2023-01-30  448  		if (ret != -ENODEV) {
3a1bd0494352bd drivers/usb/chipidea/ci_hdrc_imx.c Alexander Stein     2023-01-30  449  			dev_err_probe(dev, ret, "Failed to parse fsl,usbphy\n");
d4d2e5329ae9df drivers/usb/chipidea/ci_hdrc_imx.c Dan Carpenter       2021-11-17  450  			goto err_clk;
3a1bd0494352bd drivers/usb/chipidea/ci_hdrc_imx.c Alexander Stein     2023-01-30  451  		}
8253a34bfae327 drivers/usb/chipidea/ci_hdrc_imx.c Fabio Estevam       2021-09-21  452  		data->phy = devm_usb_get_phy_by_phandle(dev, "phys", 0);
8253a34bfae327 drivers/usb/chipidea/ci_hdrc_imx.c Fabio Estevam       2021-09-21  453  		if (IS_ERR(data->phy)) {
8253a34bfae327 drivers/usb/chipidea/ci_hdrc_imx.c Fabio Estevam       2021-09-21  454  			ret = PTR_ERR(data->phy);
3a1bd0494352bd drivers/usb/chipidea/ci_hdrc_imx.c Alexander Stein     2023-01-30  455  			if (ret == -ENODEV) {
ed5a419bb0195c drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-05-07  456  				data->phy = NULL;
3a1bd0494352bd drivers/usb/chipidea/ci_hdrc_imx.c Alexander Stein     2023-01-30  457  			} else {
3a1bd0494352bd drivers/usb/chipidea/ci_hdrc_imx.c Alexander Stein     2023-01-30  458  				dev_err_probe(dev, ret, "Failed to parse phys\n");
ea1418b5f1a394 drivers/usb/chipidea/ci13xxx_imx.c Sascha Hauer        2013-06-13  459  				goto err_clk;
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-07-07  460  			}
8253a34bfae327 drivers/usb/chipidea/ci_hdrc_imx.c Fabio Estevam       2021-09-21  461  		}
3a1bd0494352bd drivers/usb/chipidea/ci_hdrc_imx.c Alexander Stein     2023-01-30  462  	}
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-07-07  463  
ef44cb4226d132 drivers/usb/chipidea/ci_hdrc_imx.c Antoine Tenart      2014-10-30  464  	pdata.usb_phy = data->phy;
746f316b753a83 drivers/usb/chipidea/ci_hdrc_imx.c Jun Li              2020-01-23  465  	if (data->usbmisc_data)
746f316b753a83 drivers/usb/chipidea/ci_hdrc_imx.c Jun Li              2020-01-23  466  		data->usbmisc_data->usb_phy = data->phy;
be9cae2479f48d drivers/usb/chipidea/ci_hdrc_imx.c Sebastian Reichel   2018-03-29  467  
03e6275ae38108 drivers/usb/chipidea/ci_hdrc_imx.c Andrey Smirnov      2018-05-30  468  	if ((of_device_is_compatible(np, "fsl,imx53-usb") ||
03e6275ae38108 drivers/usb/chipidea/ci_hdrc_imx.c Andrey Smirnov      2018-05-30  469  	     of_device_is_compatible(np, "fsl,imx51-usb")) && pdata.usb_phy &&
be9cae2479f48d drivers/usb/chipidea/ci_hdrc_imx.c Sebastian Reichel   2018-03-29  470  	    of_usb_get_phy_mode(np) == USBPHY_INTERFACE_MODE_ULPI) {
be9cae2479f48d drivers/usb/chipidea/ci_hdrc_imx.c Sebastian Reichel   2018-03-29  471  		pdata.flags |= CI_HDRC_OVERRIDE_PHY_CONTROL;
be9cae2479f48d drivers/usb/chipidea/ci_hdrc_imx.c Sebastian Reichel   2018-03-29  472  		data->override_phy_control = true;
be9cae2479f48d drivers/usb/chipidea/ci_hdrc_imx.c Sebastian Reichel   2018-03-29  473  		usb_phy_init(pdata.usb_phy);
be9cae2479f48d drivers/usb/chipidea/ci_hdrc_imx.c Sebastian Reichel   2018-03-29  474  	}
be9cae2479f48d drivers/usb/chipidea/ci_hdrc_imx.c Sebastian Reichel   2018-03-29  475  
e14db48dfcf3ab drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2015-02-11  476  	if (pdata.flags & CI_HDRC_SUPPORTS_RUNTIME_PM)
e14db48dfcf3ab drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2015-02-11  477  		data->supports_runtime_pm = true;
1071055e2a118a drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2014-01-10  478  
05986ba9b025ae drivers/usb/chipidea/ci_hdrc_imx.c Sascha Hauer        2013-08-14  479  	ret = imx_usbmisc_init(data->usbmisc_data);
d142d6be231713 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-09-12  480  	if (ret) {
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  481  		dev_err(dev, "usbmisc init failed, ret=%d\n", ret);
af59a8b120d189 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2013-09-24  482  		goto err_clk;
d142d6be231713 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-09-12  483  	}
d142d6be231713 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-09-12  484  
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  485  	data->ci_pdev = ci_hdrc_add_device(dev,
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-07-07  486  				pdev->resource, pdev->num_resources,
f6a3b3a37c4772 drivers/usb/chipidea/ci13xxx_imx.c Michael Grzeschik   2013-06-13  487  				&pdata);
770719df7b2cee drivers/usb/chipidea/ci13xxx_imx.c Fabio Estevam       2013-06-13  488  	if (IS_ERR(data->ci_pdev)) {
770719df7b2cee drivers/usb/chipidea/ci13xxx_imx.c Fabio Estevam       2013-06-13  489  		ret = PTR_ERR(data->ci_pdev);
18171cfc3c236a drivers/usb/chipidea/ci_hdrc_imx.c Alexander Stein     2022-06-14  490  		dev_err_probe(dev, ret, "ci_hdrc_add_device failed\n");
af59a8b120d189 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2013-09-24  491  		goto err_clk;
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-07-07  492  	}
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-07-07  493  
df17aa9fb31f6a drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-10-09  494  	if (data->usbmisc_data) {
93c2c7330a3b6d drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-09-09  495  		if (!IS_ERR(pdata.id_extcon.edev) ||
93c2c7330a3b6d drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-09-09  496  		    of_property_read_bool(np, "usb-role-switch"))
93c2c7330a3b6d drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-09-09  497  			data->usbmisc_data->ext_id = 1;
93c2c7330a3b6d drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-09-09  498  
93c2c7330a3b6d drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-09-09  499  		if (!IS_ERR(pdata.vbus_extcon.edev) ||
93c2c7330a3b6d drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-09-09  500  		    of_property_read_bool(np, "usb-role-switch"))
93c2c7330a3b6d drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-09-09  501  			data->usbmisc_data->ext_vbus = 1;
d6f93d21001e43 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2020-07-28  502  
d6f93d21001e43 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2020-07-28  503  		/* usbmisc needs to know dr mode to choose wakeup setting */
d6f93d21001e43 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2020-07-28  504  		data->usbmisc_data->available_role =
d6f93d21001e43 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2020-07-28  505  			ci_hdrc_query_available_role(data->ci_pdev);
df17aa9fb31f6a drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-10-09  506  	}
93c2c7330a3b6d drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-09-09  507  
05986ba9b025ae drivers/usb/chipidea/ci_hdrc_imx.c Sascha Hauer        2013-08-14  508  	ret = imx_usbmisc_init_post(data->usbmisc_data);
a068533079a0a1 drivers/usb/chipidea/ci13xxx_imx.c Michael Grzeschik   2013-03-30  509  	if (ret) {
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  510  		dev_err(dev, "usbmisc post failed, ret=%d\n", ret);
770719df7b2cee drivers/usb/chipidea/ci13xxx_imx.c Fabio Estevam       2013-06-13  511  		goto disable_device;
a068533079a0a1 drivers/usb/chipidea/ci13xxx_imx.c Michael Grzeschik   2013-03-30  512  	}
a068533079a0a1 drivers/usb/chipidea/ci13xxx_imx.c Michael Grzeschik   2013-03-30  513  
e14db48dfcf3ab drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2015-02-11  514  	if (data->supports_runtime_pm) {
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  515  		pm_runtime_set_active(dev);
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  516  		pm_runtime_enable(dev);
e14db48dfcf3ab drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2015-02-11  517  	}
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-07-07  518  
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  519  	device_set_wakeup_capable(dev, true);
6d6531104d2069 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2015-02-11  520  
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-07-07  521  	return 0;
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-07-07  522  
770719df7b2cee drivers/usb/chipidea/ci13xxx_imx.c Fabio Estevam       2013-06-13  523  disable_device:
8e22978c57087a drivers/usb/chipidea/ci_hdrc_imx.c Alexander Shishkin  2013-06-24  524  	ci_hdrc_remove_device(data->ci_pdev);
ea1418b5f1a394 drivers/usb/chipidea/ci13xxx_imx.c Sascha Hauer        2013-06-13  525  err_clk:
5dbe9ac28355fd drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2023-12-28  526  	clk_disable_unprepare(data->clk_wakeup);
5dbe9ac28355fd drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2023-12-28  527  err_wakeup_clk:
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  528  	imx_disable_unprepare_clks(dev);
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  529  disable_hsic_regulator:
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  530  	if (data->hsic_pad_regulator)
141822aa3f79ef drivers/usb/chipidea/ci_hdrc_imx.c André Draszik       2019-08-10  531  		/* don't overwrite original ret (cf. EPROBE_DEFER) */
141822aa3f79ef drivers/usb/chipidea/ci_hdrc_imx.c André Draszik       2019-08-10  532  		regulator_disable(data->hsic_pad_regulator);
d1609c312d42f3 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-04-28  533  	if (pdata.flags & CI_HDRC_PMQOS)
77b352456941e8 drivers/usb/chipidea/ci_hdrc_imx.c Rafael J. Wysocki   2020-02-12  534  		cpu_latency_qos_remove_request(&data->pm_qos_req);
141822aa3f79ef drivers/usb/chipidea/ci_hdrc_imx.c André Draszik       2019-08-10  535  	data->ci_pdev = NULL;
686b7eb85418f9 drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-12-12  536  err_put:
686b7eb85418f9 drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-12-12 @537  	put_device(data->usbmisc_data->dev);
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-07-07  538  	return ret;
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-07-07  539  }
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-07-07  540  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
