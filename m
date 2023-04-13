Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700EF2F31
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Apr 2023 21:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681421536; x=1712957536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cIK+ap+4HIONYf6e99PpkE9ODL1Qqhng3woSHOeKuuA=;
  b=fiV3ulXrREstDFu+K0s/n1waLvZpKXHA2gDvIk9X6dwd7ZQCCDDV2h+0
   dU2Yo/aqpGNXfPLkH9eSXEzFwBndj3zFNybaU51GaAek0idUrKdWXebis
   ZCoFtnhIHjUAlzEobVdDrYP8zgXuYaJLd4/OuI7+4qnHTkPC6KRrAb7lX
   kmLzSY4YEh37HsAR8M7/AobduOj84Yyudnzcm33XLoJX81Ll1vuHvcajU
   bB6CbbL9w3ku2G7p8JhrfwqTqqLRcFiqPjHX1VHkkTFbvPW5BOmnl+8Mb
   RSdZHLIhjTMxbGUxrIbk5ZWsBDtpoxLjDu5BeC0AL4cZP2jYpYlB4yGHo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="328451002"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="328451002"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 14:32:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="758836112"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="758836112"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Apr 2023 14:32:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pn4Xz-000Yxq-0G;
	Thu, 13 Apr 2023 21:32:03 +0000
Date: Fri, 14 Apr 2023 05:31:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-linux-5.10.y 20597/22025]
 drivers/media/platform/chips-media/wave5/wave5-vpu.c:284:52: sparse: sparse:
 shift too big (32) for type unsigned int
Message-ID: <202304140543.ZuAZrvWV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/media/platform/chips-media/wave5/wave5-vpu.c:284:52: sparse: sparse: shift too big (32) for type unsigned int"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: vigneshr@ti.com
CC: nm@ti.com
CC: Brandon Brnich <b-brnich@ti.com>
CC: Prasanth Babu Mantena <p-mantena@ti.com>
CC: Andrew Davis <afd@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-5.10.y
head:   991c5ce91e43cb620f534dc9fe7b0ad21f4f4388
commit: 0701e20ef09c97d8bd786ac9489284e8eb5401b7 [20597/22025] wave5: Support 48bit memory address.
:::::: branch date: 7 days ago
:::::: commit date: 3 months ago
config: xtensa-randconfig-s041-20230413 (https://download.01.org/0day-ci/archive/20230414/202304140543.ZuAZrvWV-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-linux-5.10.y
        git checkout 0701e20ef09c97d8bd786ac9489284e8eb5401b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=xtensa SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304140543.ZuAZrvWV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/platform/chips-media/wave5/wave5-vpu.c:284:52: sparse: sparse: shift too big (32) for type unsigned int
--
>> drivers/media/platform/chips-media/wave5/wave5-hw.c:122:31: sparse: sparse: shift too big (32) for type unsigned int

vim +284 drivers/media/platform/chips-media/wave5/wave5-vpu.c

1d909c6b831b2ce Nas Chung       2022-12-27  215  
1d909c6b831b2ce Nas Chung       2022-12-27  216  static int wave5_vpu_probe(struct platform_device *pdev)
1d909c6b831b2ce Nas Chung       2022-12-27  217  {
1d909c6b831b2ce Nas Chung       2022-12-27  218  	int ret;
1d909c6b831b2ce Nas Chung       2022-12-27  219  	struct vpu_device *dev;
1d909c6b831b2ce Nas Chung       2022-12-27  220  	struct device_node *np;
1d909c6b831b2ce Nas Chung       2022-12-27  221  	const struct wave5_match_data *match_data;
1d909c6b831b2ce Nas Chung       2022-12-27  222  	struct resource sram;
1d909c6b831b2ce Nas Chung       2022-12-27  223  
1d909c6b831b2ce Nas Chung       2022-12-27  224  	match_data = device_get_match_data(&pdev->dev);
1d909c6b831b2ce Nas Chung       2022-12-27  225  	if (!match_data) {
1d909c6b831b2ce Nas Chung       2022-12-27  226  		dev_err(&pdev->dev, "missing device match data\n");
1d909c6b831b2ce Nas Chung       2022-12-27  227  		return -EINVAL;
1d909c6b831b2ce Nas Chung       2022-12-27  228  	}
1d909c6b831b2ce Nas Chung       2022-12-27  229  
0701e20ef09c97d Nas Chung       2023-01-11  230  	/* physical addresses limited to 48  bits */
0701e20ef09c97d Nas Chung       2023-01-11  231  	dma_set_mask(&pdev->dev, DMA_BIT_MASK(48));
0701e20ef09c97d Nas Chung       2023-01-11  232  	dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(48));
1d909c6b831b2ce Nas Chung       2022-12-27  233  
1d909c6b831b2ce Nas Chung       2022-12-27  234  	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
1d909c6b831b2ce Nas Chung       2022-12-27  235  	if (!dev)
1d909c6b831b2ce Nas Chung       2022-12-27  236  		return -ENOMEM;
1d909c6b831b2ce Nas Chung       2022-12-27  237  
1d909c6b831b2ce Nas Chung       2022-12-27  238  	dev->vdb_register = devm_platform_ioremap_resource(pdev, 0);
1d909c6b831b2ce Nas Chung       2022-12-27  239  	if (IS_ERR(dev->vdb_register))
1d909c6b831b2ce Nas Chung       2022-12-27  240  		return PTR_ERR(dev->vdb_register);
1d909c6b831b2ce Nas Chung       2022-12-27  241  	ida_init(&dev->inst_ida);
1d909c6b831b2ce Nas Chung       2022-12-27  242  
1d909c6b831b2ce Nas Chung       2022-12-27  243  	mutex_init(&dev->dev_lock);
1d909c6b831b2ce Nas Chung       2022-12-27  244  	mutex_init(&dev->hw_lock);
1d909c6b831b2ce Nas Chung       2022-12-27  245  	dev_set_drvdata(&pdev->dev, dev);
1d909c6b831b2ce Nas Chung       2022-12-27  246  	dev->dev = &pdev->dev;
1d909c6b831b2ce Nas Chung       2022-12-27  247  
1d909c6b831b2ce Nas Chung       2022-12-27  248  	ret = devm_clk_bulk_get_all(&pdev->dev, &dev->clks);
1d909c6b831b2ce Nas Chung       2022-12-27  249  
1d909c6b831b2ce Nas Chung       2022-12-27  250  	/* continue without clock, assume externally managed */
1d909c6b831b2ce Nas Chung       2022-12-27  251  	if (ret < 0) {
1d909c6b831b2ce Nas Chung       2022-12-27  252  		dev_warn(&pdev->dev, "Getting clocks, fail: %d\n", ret);
1d909c6b831b2ce Nas Chung       2022-12-27  253  		ret = 0;
1d909c6b831b2ce Nas Chung       2022-12-27  254  	}
1d909c6b831b2ce Nas Chung       2022-12-27  255  	dev->num_clks = ret;
1d909c6b831b2ce Nas Chung       2022-12-27  256  
1d909c6b831b2ce Nas Chung       2022-12-27  257  	ret = clk_bulk_prepare_enable(dev->num_clks, dev->clks);
1d909c6b831b2ce Nas Chung       2022-12-27  258  	if (ret) {
1d909c6b831b2ce Nas Chung       2022-12-27  259  		dev_err(&pdev->dev, "Enabling clocks, fail: %d\n", ret);
1d909c6b831b2ce Nas Chung       2022-12-27  260  		return ret;
1d909c6b831b2ce Nas Chung       2022-12-27  261  	}
1d909c6b831b2ce Nas Chung       2022-12-27  262  
1d909c6b831b2ce Nas Chung       2022-12-27  263  	np = of_parse_phandle(pdev->dev.of_node, "sram", 0);
1d909c6b831b2ce Nas Chung       2022-12-27  264  	if (!np) {
1d909c6b831b2ce Nas Chung       2022-12-27  265  		dev_warn(&pdev->dev, "sram node not found\n");
1d909c6b831b2ce Nas Chung       2022-12-27  266  	} else {
1d909c6b831b2ce Nas Chung       2022-12-27  267  		ret = of_address_to_resource(np, 0, &sram);
1d909c6b831b2ce Nas Chung       2022-12-27  268  		if (ret) {
1d909c6b831b2ce Nas Chung       2022-12-27  269  			dev_err(&pdev->dev, "sram resource not available\n");
1d909c6b831b2ce Nas Chung       2022-12-27  270  			goto err_put_node;
1d909c6b831b2ce Nas Chung       2022-12-27  271  		}
1d909c6b831b2ce Nas Chung       2022-12-27  272  		dev->sram_buf.daddr = sram.start;
1d909c6b831b2ce Nas Chung       2022-12-27  273  		dev->sram_buf.size = resource_size(&sram);
1d909c6b831b2ce Nas Chung       2022-12-27  274  		dev_dbg(&pdev->dev, "%s: sram daddr: %pad, size: 0x%lx\n",
1d909c6b831b2ce Nas Chung       2022-12-27  275  			__func__, &dev->sram_buf.daddr, dev->sram_buf.size);
1d909c6b831b2ce Nas Chung       2022-12-27  276  	}
1d909c6b831b2ce Nas Chung       2022-12-27  277  
1d909c6b831b2ce Nas Chung       2022-12-27  278  	dev->product_code = wave5_vdi_readl(dev, VPU_PRODUCT_CODE_REGISTER);
1d909c6b831b2ce Nas Chung       2022-12-27  279  	ret = wave5_vdi_init(&pdev->dev);
1d909c6b831b2ce Nas Chung       2022-12-27  280  	if (ret < 0) {
1d909c6b831b2ce Nas Chung       2022-12-27  281  		dev_err(&pdev->dev, "wave5_vdi_init, fail: %d\n", ret);
1d909c6b831b2ce Nas Chung       2022-12-27  282  		goto err_clk_dis;
1d909c6b831b2ce Nas Chung       2022-12-27  283  	}
0701e20ef09c97d Nas Chung       2023-01-11 @284  	dev->ext_addr = ((dev->common_mem.daddr >> 32) & 0xFFFF);
1d909c6b831b2ce Nas Chung       2022-12-27  285  	dev->product = wave5_vpu_get_product_id(dev);
1d909c6b831b2ce Nas Chung       2022-12-27  286  
1d909c6b831b2ce Nas Chung       2022-12-27  287  	INIT_LIST_HEAD(&dev->instances);
1d909c6b831b2ce Nas Chung       2022-12-27  288  	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
1d909c6b831b2ce Nas Chung       2022-12-27  289  	if (ret) {
1d909c6b831b2ce Nas Chung       2022-12-27  290  		dev_err(&pdev->dev, "v4l2_device_register, fail: %d\n", ret);
1d909c6b831b2ce Nas Chung       2022-12-27  291  		goto err_vdi_release;
1d909c6b831b2ce Nas Chung       2022-12-27  292  	}
1d909c6b831b2ce Nas Chung       2022-12-27  293  
1d909c6b831b2ce Nas Chung       2022-12-27  294  	if (match_data->flags & WAVE5_IS_DEC) {
1d909c6b831b2ce Nas Chung       2022-12-27  295  		ret = wave5_vpu_dec_register_device(dev);
1d909c6b831b2ce Nas Chung       2022-12-27  296  		if (ret) {
1d909c6b831b2ce Nas Chung       2022-12-27  297  			dev_err(&pdev->dev, "wave5_vpu_dec_register_device, fail: %d\n", ret);
1d909c6b831b2ce Nas Chung       2022-12-27  298  			goto err_v4l2_unregister;
1d909c6b831b2ce Nas Chung       2022-12-27  299  		}
1d909c6b831b2ce Nas Chung       2022-12-27  300  	}
1d909c6b831b2ce Nas Chung       2022-12-27  301  	if (match_data->flags & WAVE5_IS_ENC) {
1d909c6b831b2ce Nas Chung       2022-12-27  302  		ret = wave5_vpu_enc_register_device(dev);
1d909c6b831b2ce Nas Chung       2022-12-27  303  		if (ret) {
1d909c6b831b2ce Nas Chung       2022-12-27  304  			dev_err(&pdev->dev, "wave5_vpu_enc_register_device, fail: %d\n", ret);
1d909c6b831b2ce Nas Chung       2022-12-27  305  			goto err_dec_unreg;
1d909c6b831b2ce Nas Chung       2022-12-27  306  		}
1d909c6b831b2ce Nas Chung       2022-12-27  307  	}
1d909c6b831b2ce Nas Chung       2022-12-27  308  
1d909c6b831b2ce Nas Chung       2022-12-27  309  	dev->irq = platform_get_irq(pdev, 0);
1d909c6b831b2ce Nas Chung       2022-12-27  310  	if (dev->irq < 0) {
1d909c6b831b2ce Nas Chung       2022-12-27  311  		dev_err(&pdev->dev, "failed to get irq resource\n");
3381a2e5128541a Devarsh Thakkar 2023-01-02  312  		ret = mutex_lock_interruptible(&dev->dev_lock);
3381a2e5128541a Devarsh Thakkar 2023-01-02  313  		if (ret)
3381a2e5128541a Devarsh Thakkar 2023-01-02  314  			return ret;
3381a2e5128541a Devarsh Thakkar 2023-01-02  315  
3381a2e5128541a Devarsh Thakkar 2023-01-02  316  		hrtimer_init(&dev->hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_PINNED);
3381a2e5128541a Devarsh Thakkar 2023-01-02  317  		dev->hrtimer.function = &wave5_vpu_timer_callback;
3381a2e5128541a Devarsh Thakkar 2023-01-02  318  		dev->worker = kthread_create_worker(0, "vpu_irq_thread");
3381a2e5128541a Devarsh Thakkar 2023-01-02  319  		if (IS_ERR(dev->worker)) {
3381a2e5128541a Devarsh Thakkar 2023-01-02  320  			dev_err(&pdev->dev, "failed to create vpu irq worker\n");
3381a2e5128541a Devarsh Thakkar 2023-01-02  321  			mutex_unlock(&dev->dev_lock);
3381a2e5128541a Devarsh Thakkar 2023-01-02  322  			return PTR_ERR(dev->worker);
1d909c6b831b2ce Nas Chung       2022-12-27  323  		}
1d909c6b831b2ce Nas Chung       2022-12-27  324  
3381a2e5128541a Devarsh Thakkar 2023-01-02  325  		kthread_init_work(&dev->work, wave5_vpu_irq_work_fn);
3381a2e5128541a Devarsh Thakkar 2023-01-02  326  		mutex_unlock(&dev->dev_lock);
3381a2e5128541a Devarsh Thakkar 2023-01-02  327  	} else {
1d909c6b831b2ce Nas Chung       2022-12-27  328  		ret = devm_request_threaded_irq(&pdev->dev, dev->irq, wave5_vpu_irq,
1d909c6b831b2ce Nas Chung       2022-12-27  329  						wave5_vpu_irq_thread, 0, "vpu_irq", dev);
1d909c6b831b2ce Nas Chung       2022-12-27  330  		if (ret) {
1d909c6b831b2ce Nas Chung       2022-12-27  331  			dev_err(&pdev->dev, "Register interrupt handler, fail: %d\n", ret);
1d909c6b831b2ce Nas Chung       2022-12-27  332  			goto err_enc_unreg;
1d909c6b831b2ce Nas Chung       2022-12-27  333  		}
3381a2e5128541a Devarsh Thakkar 2023-01-02  334  	}
1d909c6b831b2ce Nas Chung       2022-12-27  335  
1d909c6b831b2ce Nas Chung       2022-12-27  336  	ret = wave5_vpu_load_firmware(&pdev->dev, match_data->fw_name);
1d909c6b831b2ce Nas Chung       2022-12-27  337  	if (ret) {
1d909c6b831b2ce Nas Chung       2022-12-27  338  		dev_err(&pdev->dev, "wave5_vpu_load_firmware, fail: %d\n", ret);
1d909c6b831b2ce Nas Chung       2022-12-27  339  		goto err_enc_unreg;
1d909c6b831b2ce Nas Chung       2022-12-27  340  	}
1d909c6b831b2ce Nas Chung       2022-12-27  341  
1d909c6b831b2ce Nas Chung       2022-12-27  342  	dev_dbg(&pdev->dev, "Added wave5 driver with caps: %s %s and product code: 0x%x\n",
1d909c6b831b2ce Nas Chung       2022-12-27  343  		(match_data->flags & WAVE5_IS_ENC) ? "'ENCODE'" : "",
1d909c6b831b2ce Nas Chung       2022-12-27  344  		(match_data->flags & WAVE5_IS_DEC) ? "'DECODE'" : "",
1d909c6b831b2ce Nas Chung       2022-12-27  345  		dev->product_code);
1d909c6b831b2ce Nas Chung       2022-12-27  346  	return 0;
1d909c6b831b2ce Nas Chung       2022-12-27  347  
1d909c6b831b2ce Nas Chung       2022-12-27  348  err_enc_unreg:
1d909c6b831b2ce Nas Chung       2022-12-27  349  	if (match_data->flags & WAVE5_IS_ENC)
1d909c6b831b2ce Nas Chung       2022-12-27  350  		wave5_vpu_enc_unregister_device(dev);
1d909c6b831b2ce Nas Chung       2022-12-27  351  err_dec_unreg:
1d909c6b831b2ce Nas Chung       2022-12-27  352  	if (match_data->flags & WAVE5_IS_DEC)
1d909c6b831b2ce Nas Chung       2022-12-27  353  		wave5_vpu_dec_unregister_device(dev);
1d909c6b831b2ce Nas Chung       2022-12-27  354  err_v4l2_unregister:
1d909c6b831b2ce Nas Chung       2022-12-27  355  	v4l2_device_unregister(&dev->v4l2_dev);
1d909c6b831b2ce Nas Chung       2022-12-27  356  err_vdi_release:
1d909c6b831b2ce Nas Chung       2022-12-27  357  	wave5_vdi_release(&pdev->dev);
1d909c6b831b2ce Nas Chung       2022-12-27  358  err_clk_dis:
1d909c6b831b2ce Nas Chung       2022-12-27  359  	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
1d909c6b831b2ce Nas Chung       2022-12-27  360  err_put_node:
1d909c6b831b2ce Nas Chung       2022-12-27  361  	of_node_put(np);
1d909c6b831b2ce Nas Chung       2022-12-27  362  
1d909c6b831b2ce Nas Chung       2022-12-27  363  	return ret;
1d909c6b831b2ce Nas Chung       2022-12-27  364  }
1d909c6b831b2ce Nas Chung       2022-12-27  365  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
