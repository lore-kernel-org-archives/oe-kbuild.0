Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79456440C
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jun 2023 07:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687764005; x=1719300005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ra7ZXgqrwn9rN/531sX9cxnnIai9u715J02DQxIViOQ=;
  b=N6UhQnApCAxctx9Q/8D1EGe9NMByow87MsdrSn9bcYTa6uBcu9s2iYT0
   Gz15yjZApPybKI4Zb1yl8cp54THwu/BGhTpLmsM08VjIAShQZCoi17rDX
   s2UrMtMc7mc40IT8vOMBl7pQ1dYkV6g18YbeN+dSw8JGsZ0YKBMll/yeZ
   7PHJja+QoCvwQavlkciLnjJ/mNjllyL37PO9wKPt/1PtcEEzyaoLrm7i5
   OyDjHlhk4Wl0qgQm9zKCvxEq8tWL61gywAPoqzvK/Q/4XrmbY1U7mxRii
   CLjutHX7BBAYPs1khCJmXqGZ9cagX2fdQA1oAySNi/h11EmmXctbSXccP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="447578817"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="447578817"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 00:20:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="666199084"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="666199084"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 26 Jun 2023 00:20:01 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDgW0-000AYT-1E;
	Mon, 26 Jun 2023 07:20:00 +0000
Date: Mon, 26 Jun 2023 15:19:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 22/24] Input: bcm-keypad - Simplify with
 dev_err_probe()
Message-ID: <202306261505.wTjCXRIO-lkp@intel.com>
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
In-Reply-To: <20230625162817.100397-23-krzysztof.kozlowski@linaro.org>
References: <20230625162817.100397-23-krzysztof.kozlowski@linaro.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>

Hi Krzysztof,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on next-20230623]
[cannot apply to dtor-input/for-linus linus/master v6.4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/Input-gpio_keys_polled-Simplify-with-dev_err_probe/20230626-003156
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20230625162817.100397-23-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH v4 22/24] Input: bcm-keypad - Simplify with dev_err_probe()
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: i386-randconfig-m021-20230625 (https://download.01.org/0day-ci/archive/20230626/202306261505.wTjCXRIO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230626/202306261505.wTjCXRIO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306261505.wTjCXRIO-lkp@intel.com/

smatch warnings:
drivers/input/keyboard/bcm-keypad.c:370 bcm_kp_probe() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +370 drivers/input/keyboard/bcm-keypad.c

0c7e67a928ac53 Scott Branden       2015-02-28  304  
0c7e67a928ac53 Scott Branden       2015-02-28  305  
0c7e67a928ac53 Scott Branden       2015-02-28  306  static int bcm_kp_probe(struct platform_device *pdev)
0c7e67a928ac53 Scott Branden       2015-02-28  307  {
0c7e67a928ac53 Scott Branden       2015-02-28  308  	struct bcm_kp *kp;
0c7e67a928ac53 Scott Branden       2015-02-28  309  	struct input_dev *input_dev;
0c7e67a928ac53 Scott Branden       2015-02-28  310  	struct resource *res;
0c7e67a928ac53 Scott Branden       2015-02-28  311  	int error;
0c7e67a928ac53 Scott Branden       2015-02-28  312  
0c7e67a928ac53 Scott Branden       2015-02-28  313  	kp = devm_kzalloc(&pdev->dev, sizeof(*kp), GFP_KERNEL);
0c7e67a928ac53 Scott Branden       2015-02-28  314  	if (!kp)
0c7e67a928ac53 Scott Branden       2015-02-28  315  		return -ENOMEM;
0c7e67a928ac53 Scott Branden       2015-02-28  316  
0c7e67a928ac53 Scott Branden       2015-02-28  317  	input_dev = devm_input_allocate_device(&pdev->dev);
0c7e67a928ac53 Scott Branden       2015-02-28  318  	if (!input_dev) {
0c7e67a928ac53 Scott Branden       2015-02-28  319  		dev_err(&pdev->dev, "failed to allocate the input device\n");
0c7e67a928ac53 Scott Branden       2015-02-28  320  		return -ENOMEM;
0c7e67a928ac53 Scott Branden       2015-02-28  321  	}
0c7e67a928ac53 Scott Branden       2015-02-28  322  
0c7e67a928ac53 Scott Branden       2015-02-28  323  	__set_bit(EV_KEY, input_dev->evbit);
0c7e67a928ac53 Scott Branden       2015-02-28  324  
0c7e67a928ac53 Scott Branden       2015-02-28  325  	/* Enable auto repeat feature of Linux input subsystem */
0c7e67a928ac53 Scott Branden       2015-02-28  326  	if (of_property_read_bool(pdev->dev.of_node, "autorepeat"))
0c7e67a928ac53 Scott Branden       2015-02-28  327  		__set_bit(EV_REP, input_dev->evbit);
0c7e67a928ac53 Scott Branden       2015-02-28  328  
0c7e67a928ac53 Scott Branden       2015-02-28  329  	input_dev->name = pdev->name;
0c7e67a928ac53 Scott Branden       2015-02-28  330  	input_dev->phys = "keypad/input0";
0c7e67a928ac53 Scott Branden       2015-02-28  331  	input_dev->dev.parent = &pdev->dev;
0c7e67a928ac53 Scott Branden       2015-02-28  332  	input_dev->open = bcm_kp_open;
0c7e67a928ac53 Scott Branden       2015-02-28  333  	input_dev->close = bcm_kp_close;
0c7e67a928ac53 Scott Branden       2015-02-28  334  
0c7e67a928ac53 Scott Branden       2015-02-28  335  	input_dev->id.bustype = BUS_HOST;
0c7e67a928ac53 Scott Branden       2015-02-28  336  	input_dev->id.vendor = 0x0001;
0c7e67a928ac53 Scott Branden       2015-02-28  337  	input_dev->id.product = 0x0001;
0c7e67a928ac53 Scott Branden       2015-02-28  338  	input_dev->id.version = 0x0100;
0c7e67a928ac53 Scott Branden       2015-02-28  339  
0c7e67a928ac53 Scott Branden       2015-02-28  340  	input_set_drvdata(input_dev, kp);
0c7e67a928ac53 Scott Branden       2015-02-28  341  
0c7e67a928ac53 Scott Branden       2015-02-28  342  	kp->input_dev = input_dev;
0c7e67a928ac53 Scott Branden       2015-02-28  343  
0c7e67a928ac53 Scott Branden       2015-02-28  344  	error = bcm_kp_matrix_key_parse_dt(kp);
0c7e67a928ac53 Scott Branden       2015-02-28  345  	if (error)
0c7e67a928ac53 Scott Branden       2015-02-28  346  		return error;
0c7e67a928ac53 Scott Branden       2015-02-28  347  
0c7e67a928ac53 Scott Branden       2015-02-28  348  	error = matrix_keypad_build_keymap(NULL, NULL,
0c7e67a928ac53 Scott Branden       2015-02-28  349  					   kp->n_rows, kp->n_cols,
0c7e67a928ac53 Scott Branden       2015-02-28  350  					   NULL, input_dev);
0c7e67a928ac53 Scott Branden       2015-02-28  351  	if (error) {
0c7e67a928ac53 Scott Branden       2015-02-28  352  		dev_err(&pdev->dev, "failed to build keymap\n");
0c7e67a928ac53 Scott Branden       2015-02-28  353  		return error;
0c7e67a928ac53 Scott Branden       2015-02-28  354  	}
0c7e67a928ac53 Scott Branden       2015-02-28  355  
0c7e67a928ac53 Scott Branden       2015-02-28  356  	/* Get the KEYPAD base address */
0c7e67a928ac53 Scott Branden       2015-02-28  357  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
0c7e67a928ac53 Scott Branden       2015-02-28  358  	if (!res) {
0c7e67a928ac53 Scott Branden       2015-02-28  359  		dev_err(&pdev->dev, "Missing keypad base address resource\n");
0c7e67a928ac53 Scott Branden       2015-02-28  360  		return -ENODEV;
0c7e67a928ac53 Scott Branden       2015-02-28  361  	}
0c7e67a928ac53 Scott Branden       2015-02-28  362  
0c7e67a928ac53 Scott Branden       2015-02-28  363  	kp->base = devm_ioremap_resource(&pdev->dev, res);
0c7e67a928ac53 Scott Branden       2015-02-28  364  	if (IS_ERR(kp->base))
0c7e67a928ac53 Scott Branden       2015-02-28  365  		return PTR_ERR(kp->base);
0c7e67a928ac53 Scott Branden       2015-02-28  366  
0c7e67a928ac53 Scott Branden       2015-02-28  367  	/* Enable clock */
5d0380bcb07530 Krzysztof Kozlowski 2023-06-25  368  	kp->clk = devm_clk_get_optional(&pdev->dev, "peri_clk");
0c7e67a928ac53 Scott Branden       2015-02-28  369  	if (IS_ERR(kp->clk)) {
5d0380bcb07530 Krzysztof Kozlowski 2023-06-25 @370  		return dev_err_probe(&pdev->dev, error, "Failed to get clock\n");
5d0380bcb07530 Krzysztof Kozlowski 2023-06-25  371  	} else if (!kp->clk) {
5d0380bcb07530 Krzysztof Kozlowski 2023-06-25  372  		dev_dbg(&pdev->dev, "No clock specified. Assuming it's enabled\n");
0c7e67a928ac53 Scott Branden       2015-02-28  373  	} else {
0c7e67a928ac53 Scott Branden       2015-02-28  374  		unsigned int desired_rate;
0c7e67a928ac53 Scott Branden       2015-02-28  375  		long actual_rate;
0c7e67a928ac53 Scott Branden       2015-02-28  376  
0c7e67a928ac53 Scott Branden       2015-02-28  377  		error = of_property_read_u32(pdev->dev.of_node,
0c7e67a928ac53 Scott Branden       2015-02-28  378  					     "clock-frequency", &desired_rate);
0c7e67a928ac53 Scott Branden       2015-02-28  379  		if (error < 0)
0c7e67a928ac53 Scott Branden       2015-02-28  380  			desired_rate = DEFAULT_CLK_HZ;
0c7e67a928ac53 Scott Branden       2015-02-28  381  
0c7e67a928ac53 Scott Branden       2015-02-28  382  		actual_rate = clk_round_rate(kp->clk, desired_rate);
0c7e67a928ac53 Scott Branden       2015-02-28  383  		if (actual_rate <= 0)
0c7e67a928ac53 Scott Branden       2015-02-28  384  			return -EINVAL;
0c7e67a928ac53 Scott Branden       2015-02-28  385  
0c7e67a928ac53 Scott Branden       2015-02-28  386  		error = clk_set_rate(kp->clk, actual_rate);
0c7e67a928ac53 Scott Branden       2015-02-28  387  		if (error)
0c7e67a928ac53 Scott Branden       2015-02-28  388  			return error;
0c7e67a928ac53 Scott Branden       2015-02-28  389  
0c7e67a928ac53 Scott Branden       2015-02-28  390  		error = clk_prepare_enable(kp->clk);
0c7e67a928ac53 Scott Branden       2015-02-28  391  		if (error)
0c7e67a928ac53 Scott Branden       2015-02-28  392  			return error;
0c7e67a928ac53 Scott Branden       2015-02-28  393  	}
0c7e67a928ac53 Scott Branden       2015-02-28  394  
0c7e67a928ac53 Scott Branden       2015-02-28  395  	/* Put the kp into a known sane state */
0c7e67a928ac53 Scott Branden       2015-02-28  396  	bcm_kp_stop(kp);
0c7e67a928ac53 Scott Branden       2015-02-28  397  
0c7e67a928ac53 Scott Branden       2015-02-28  398  	kp->irq = platform_get_irq(pdev, 0);
0bec8b7e5ca1a6 Stephen Boyd        2019-08-14  399  	if (kp->irq < 0)
0c7e67a928ac53 Scott Branden       2015-02-28  400  		return -EINVAL;
0c7e67a928ac53 Scott Branden       2015-02-28  401  
0c7e67a928ac53 Scott Branden       2015-02-28  402  	error = devm_request_threaded_irq(&pdev->dev, kp->irq,
0c7e67a928ac53 Scott Branden       2015-02-28  403  					  NULL, bcm_kp_isr_thread,
0c7e67a928ac53 Scott Branden       2015-02-28  404  					  IRQF_ONESHOT, pdev->name, kp);
0c7e67a928ac53 Scott Branden       2015-02-28  405  	if (error) {
0c7e67a928ac53 Scott Branden       2015-02-28  406  		dev_err(&pdev->dev, "failed to request IRQ\n");
0c7e67a928ac53 Scott Branden       2015-02-28  407  		return error;
0c7e67a928ac53 Scott Branden       2015-02-28  408  	}
0c7e67a928ac53 Scott Branden       2015-02-28  409  
0c7e67a928ac53 Scott Branden       2015-02-28  410  	error = input_register_device(input_dev);
0c7e67a928ac53 Scott Branden       2015-02-28  411  	if (error) {
0c7e67a928ac53 Scott Branden       2015-02-28  412  		dev_err(&pdev->dev, "failed to register input device\n");
0c7e67a928ac53 Scott Branden       2015-02-28  413  		return error;
0c7e67a928ac53 Scott Branden       2015-02-28  414  	}
0c7e67a928ac53 Scott Branden       2015-02-28  415  
0c7e67a928ac53 Scott Branden       2015-02-28  416  	return 0;
0c7e67a928ac53 Scott Branden       2015-02-28  417  }
0c7e67a928ac53 Scott Branden       2015-02-28  418  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
