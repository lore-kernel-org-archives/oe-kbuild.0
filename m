Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD93A3D65
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Feb 2024 07:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707722619; cv=none; b=G9YRipuj1wKyloAs7MGYeq44pU2V9bXLucqdms/cRPhaU1SH/70tJvdfsMG+DlI2tzneghe+Y+MHpbZqLWa2ol4e8Wey64/PiRNxhR6YeK8WYlZqaDHwGR/tmVN1IY+0qwa4dF8fwOx1JsW9RGAUPX1JSL05SG6qaDiCJC4X6mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707722619; c=relaxed/simple;
	bh=IHjLm7v6j4BZy/wL4l2KVEAWanfLWU8d8/UQKMcq96U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N2CidfNch2Mprw3r57lZMdekk/MIif/u9iTSuY5O97DaHrHP0mRcHKHX7IFHV2bjWce7NPBK2xXBmOdnuLwHguSW/xkxtU8GjPAwiZZnwNzJa3A0IiEfKnr4mpVXYUX8R83U/iOlOQYr0+AJ4qdmRgxUHdcsolfmKJ7qnxx0hNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nPrLV0kN; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nPrLV0kN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707722616; x=1739258616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IHjLm7v6j4BZy/wL4l2KVEAWanfLWU8d8/UQKMcq96U=;
  b=nPrLV0kN8sUQHJ9D/zhbo/NaBKV2y+YfBhQ8n025Fs4Jh5hZtQsFl9VK
   OYiTeMKooZapOyl1N16E109Q5qRNER9i9Es5vFfNWJ04O/JPlhMf709I2
   AfYm3KMtwTV342FccFV4CiLJyOr5J85idKhOlw/N2rnPkzdnycZCmtNwg
   14kBgXCiRlYY9bUNTltNFK/2C9y6kaaV1wvykc6x48Ih7Dmq8i5ofj3ZY
   wHnh+zqiQWXc0EhSciG7gsLSutACcReFXpuyFeGxbM/wRG/tn47xNUC9p
   luvBIyuhTSpHYyfAMpD0S4vGDhzMW28RXxkpoBsWkT2gXwFe+cuUFjIcv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="1563568"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="1563568"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2024 23:23:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="911408028"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="911408028"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Feb 2024 23:23:34 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZQf6-0006zC-11;
	Mon, 12 Feb 2024 07:23:32 +0000
Date: Mon, 12 Feb 2024 15:22:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/media/platform/chips-media/wave5/wave5-vpu.c:212:2-9: line
 212 is redundant because platform_get_irq() already prints an error
Message-ID: <202402121530.NU2bb9D3-lkp@intel.com>
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
TO: Nas Chung <nas.chung@chipsnmedia.com>
CC: Hans Verkuil <hverkuil@xs4all.nl>
CC: Sebastian Fricke <sebastian.fricke@collabora.com>
CC: Nicolas Dufresne <nicolas.dufresne@collabora.com>
CC: Robert Beckett <bob.beckett@collabora.com>
CC: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   841c35169323cd833294798e58b9bf63fa4fa1de
commit: 9707a6254a8a6b978bde811a44fe07d86c229d1c media: chips-media: wave5: Add the v4l2 layer
date:   3 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 3 months ago
config: powerpc-randconfig-r062-20240211 (https://download.01.org/0day-ci/archive/20240212/202402121530.NU2bb9D3-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202402121530.NU2bb9D3-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/media/platform/chips-media/wave5/wave5-vpu.c:212:2-9: line 212 is redundant because platform_get_irq() already prints an error

vim +212 drivers/media/platform/chips-media/wave5/wave5-vpu.c

9707a6254a8a6b Nas Chung 2023-11-08  119  
9707a6254a8a6b Nas Chung 2023-11-08  120  static int wave5_vpu_probe(struct platform_device *pdev)
9707a6254a8a6b Nas Chung 2023-11-08  121  {
9707a6254a8a6b Nas Chung 2023-11-08  122  	int ret;
9707a6254a8a6b Nas Chung 2023-11-08  123  	struct vpu_device *dev;
9707a6254a8a6b Nas Chung 2023-11-08  124  	const struct wave5_match_data *match_data;
9707a6254a8a6b Nas Chung 2023-11-08  125  	u32 fw_revision;
9707a6254a8a6b Nas Chung 2023-11-08  126  
9707a6254a8a6b Nas Chung 2023-11-08  127  	match_data = device_get_match_data(&pdev->dev);
9707a6254a8a6b Nas Chung 2023-11-08  128  	if (!match_data) {
9707a6254a8a6b Nas Chung 2023-11-08  129  		dev_err(&pdev->dev, "missing device match data\n");
9707a6254a8a6b Nas Chung 2023-11-08  130  		return -EINVAL;
9707a6254a8a6b Nas Chung 2023-11-08  131  	}
9707a6254a8a6b Nas Chung 2023-11-08  132  
9707a6254a8a6b Nas Chung 2023-11-08  133  	/* physical addresses limited to 32 bits */
9707a6254a8a6b Nas Chung 2023-11-08  134  	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
9707a6254a8a6b Nas Chung 2023-11-08  135  	if (ret) {
9707a6254a8a6b Nas Chung 2023-11-08  136  		dev_err(&pdev->dev, "Failed to set DMA mask: %d\n", ret);
9707a6254a8a6b Nas Chung 2023-11-08  137  		return ret;
9707a6254a8a6b Nas Chung 2023-11-08  138  	}
9707a6254a8a6b Nas Chung 2023-11-08  139  
9707a6254a8a6b Nas Chung 2023-11-08  140  	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
9707a6254a8a6b Nas Chung 2023-11-08  141  	if (!dev)
9707a6254a8a6b Nas Chung 2023-11-08  142  		return -ENOMEM;
9707a6254a8a6b Nas Chung 2023-11-08  143  
9707a6254a8a6b Nas Chung 2023-11-08  144  	dev->vdb_register = devm_platform_ioremap_resource(pdev, 0);
9707a6254a8a6b Nas Chung 2023-11-08  145  	if (IS_ERR(dev->vdb_register))
9707a6254a8a6b Nas Chung 2023-11-08  146  		return PTR_ERR(dev->vdb_register);
9707a6254a8a6b Nas Chung 2023-11-08  147  	ida_init(&dev->inst_ida);
9707a6254a8a6b Nas Chung 2023-11-08  148  
9707a6254a8a6b Nas Chung 2023-11-08  149  	mutex_init(&dev->dev_lock);
9707a6254a8a6b Nas Chung 2023-11-08  150  	mutex_init(&dev->hw_lock);
9707a6254a8a6b Nas Chung 2023-11-08  151  	dev_set_drvdata(&pdev->dev, dev);
9707a6254a8a6b Nas Chung 2023-11-08  152  	dev->dev = &pdev->dev;
9707a6254a8a6b Nas Chung 2023-11-08  153  
9707a6254a8a6b Nas Chung 2023-11-08  154  	ret = devm_clk_bulk_get_all(&pdev->dev, &dev->clks);
9707a6254a8a6b Nas Chung 2023-11-08  155  
9707a6254a8a6b Nas Chung 2023-11-08  156  	/* continue without clock, assume externally managed */
9707a6254a8a6b Nas Chung 2023-11-08  157  	if (ret < 0) {
9707a6254a8a6b Nas Chung 2023-11-08  158  		dev_warn(&pdev->dev, "Getting clocks, fail: %d\n", ret);
9707a6254a8a6b Nas Chung 2023-11-08  159  		ret = 0;
9707a6254a8a6b Nas Chung 2023-11-08  160  	}
9707a6254a8a6b Nas Chung 2023-11-08  161  	dev->num_clks = ret;
9707a6254a8a6b Nas Chung 2023-11-08  162  
9707a6254a8a6b Nas Chung 2023-11-08  163  	ret = clk_bulk_prepare_enable(dev->num_clks, dev->clks);
9707a6254a8a6b Nas Chung 2023-11-08  164  	if (ret) {
9707a6254a8a6b Nas Chung 2023-11-08  165  		dev_err(&pdev->dev, "Enabling clocks, fail: %d\n", ret);
9707a6254a8a6b Nas Chung 2023-11-08  166  		return ret;
9707a6254a8a6b Nas Chung 2023-11-08  167  	}
9707a6254a8a6b Nas Chung 2023-11-08  168  
9707a6254a8a6b Nas Chung 2023-11-08  169  	ret = of_property_read_u32(pdev->dev.of_node, "sram-size",
9707a6254a8a6b Nas Chung 2023-11-08  170  				   &dev->sram_size);
9707a6254a8a6b Nas Chung 2023-11-08  171  	if (ret) {
9707a6254a8a6b Nas Chung 2023-11-08  172  		dev_warn(&pdev->dev, "sram-size not found\n");
9707a6254a8a6b Nas Chung 2023-11-08  173  		dev->sram_size = 0;
9707a6254a8a6b Nas Chung 2023-11-08  174  	}
9707a6254a8a6b Nas Chung 2023-11-08  175  
9707a6254a8a6b Nas Chung 2023-11-08  176  	dev->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
9707a6254a8a6b Nas Chung 2023-11-08  177  	if (!dev->sram_pool)
9707a6254a8a6b Nas Chung 2023-11-08  178  		dev_warn(&pdev->dev, "sram node not found\n");
9707a6254a8a6b Nas Chung 2023-11-08  179  
9707a6254a8a6b Nas Chung 2023-11-08  180  	dev->product_code = wave5_vdi_read_register(dev, VPU_PRODUCT_CODE_REGISTER);
9707a6254a8a6b Nas Chung 2023-11-08  181  	ret = wave5_vdi_init(&pdev->dev);
9707a6254a8a6b Nas Chung 2023-11-08  182  	if (ret < 0) {
9707a6254a8a6b Nas Chung 2023-11-08  183  		dev_err(&pdev->dev, "wave5_vdi_init, fail: %d\n", ret);
9707a6254a8a6b Nas Chung 2023-11-08  184  		goto err_clk_dis;
9707a6254a8a6b Nas Chung 2023-11-08  185  	}
9707a6254a8a6b Nas Chung 2023-11-08  186  	dev->product = wave5_vpu_get_product_id(dev);
9707a6254a8a6b Nas Chung 2023-11-08  187  
9707a6254a8a6b Nas Chung 2023-11-08  188  	INIT_LIST_HEAD(&dev->instances);
9707a6254a8a6b Nas Chung 2023-11-08  189  	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
9707a6254a8a6b Nas Chung 2023-11-08  190  	if (ret) {
9707a6254a8a6b Nas Chung 2023-11-08  191  		dev_err(&pdev->dev, "v4l2_device_register, fail: %d\n", ret);
9707a6254a8a6b Nas Chung 2023-11-08  192  		goto err_vdi_release;
9707a6254a8a6b Nas Chung 2023-11-08  193  	}
9707a6254a8a6b Nas Chung 2023-11-08  194  
9707a6254a8a6b Nas Chung 2023-11-08  195  	if (match_data->flags & WAVE5_IS_DEC) {
9707a6254a8a6b Nas Chung 2023-11-08  196  		ret = wave5_vpu_dec_register_device(dev);
9707a6254a8a6b Nas Chung 2023-11-08  197  		if (ret) {
9707a6254a8a6b Nas Chung 2023-11-08  198  			dev_err(&pdev->dev, "wave5_vpu_dec_register_device, fail: %d\n", ret);
9707a6254a8a6b Nas Chung 2023-11-08  199  			goto err_v4l2_unregister;
9707a6254a8a6b Nas Chung 2023-11-08  200  		}
9707a6254a8a6b Nas Chung 2023-11-08  201  	}
9707a6254a8a6b Nas Chung 2023-11-08  202  	if (match_data->flags & WAVE5_IS_ENC) {
9707a6254a8a6b Nas Chung 2023-11-08  203  		ret = wave5_vpu_enc_register_device(dev);
9707a6254a8a6b Nas Chung 2023-11-08  204  		if (ret) {
9707a6254a8a6b Nas Chung 2023-11-08  205  			dev_err(&pdev->dev, "wave5_vpu_enc_register_device, fail: %d\n", ret);
9707a6254a8a6b Nas Chung 2023-11-08  206  			goto err_dec_unreg;
9707a6254a8a6b Nas Chung 2023-11-08  207  		}
9707a6254a8a6b Nas Chung 2023-11-08  208  	}
9707a6254a8a6b Nas Chung 2023-11-08  209  
9707a6254a8a6b Nas Chung 2023-11-08  210  	dev->irq = platform_get_irq(pdev, 0);
9707a6254a8a6b Nas Chung 2023-11-08  211  	if (dev->irq < 0) {
9707a6254a8a6b Nas Chung 2023-11-08 @212  		dev_err(&pdev->dev, "failed to get irq resource\n");
9707a6254a8a6b Nas Chung 2023-11-08  213  		ret = -ENXIO;
9707a6254a8a6b Nas Chung 2023-11-08  214  		goto err_enc_unreg;
9707a6254a8a6b Nas Chung 2023-11-08  215  	}
9707a6254a8a6b Nas Chung 2023-11-08  216  
9707a6254a8a6b Nas Chung 2023-11-08  217  	ret = devm_request_threaded_irq(&pdev->dev, dev->irq, NULL,
9707a6254a8a6b Nas Chung 2023-11-08  218  					wave5_vpu_irq_thread, IRQF_ONESHOT, "vpu_irq", dev);
9707a6254a8a6b Nas Chung 2023-11-08  219  	if (ret) {
9707a6254a8a6b Nas Chung 2023-11-08  220  		dev_err(&pdev->dev, "Register interrupt handler, fail: %d\n", ret);
9707a6254a8a6b Nas Chung 2023-11-08  221  		goto err_enc_unreg;
9707a6254a8a6b Nas Chung 2023-11-08  222  	}
9707a6254a8a6b Nas Chung 2023-11-08  223  
9707a6254a8a6b Nas Chung 2023-11-08  224  	ret = wave5_vpu_load_firmware(&pdev->dev, match_data->fw_name, &fw_revision);
9707a6254a8a6b Nas Chung 2023-11-08  225  	if (ret) {
9707a6254a8a6b Nas Chung 2023-11-08  226  		dev_err(&pdev->dev, "wave5_vpu_load_firmware, fail: %d\n", ret);
9707a6254a8a6b Nas Chung 2023-11-08  227  		goto err_enc_unreg;
9707a6254a8a6b Nas Chung 2023-11-08  228  	}
9707a6254a8a6b Nas Chung 2023-11-08  229  
9707a6254a8a6b Nas Chung 2023-11-08  230  	dev_info(&pdev->dev, "Added wave5 driver with caps: %s %s\n",
9707a6254a8a6b Nas Chung 2023-11-08  231  		 (match_data->flags & WAVE5_IS_ENC) ? "'ENCODE'" : "",
9707a6254a8a6b Nas Chung 2023-11-08  232  		 (match_data->flags & WAVE5_IS_DEC) ? "'DECODE'" : "");
9707a6254a8a6b Nas Chung 2023-11-08  233  	dev_info(&pdev->dev, "Product Code:      0x%x\n", dev->product_code);
9707a6254a8a6b Nas Chung 2023-11-08  234  	dev_info(&pdev->dev, "Firmware Revision: %u\n", fw_revision);
9707a6254a8a6b Nas Chung 2023-11-08  235  	return 0;
9707a6254a8a6b Nas Chung 2023-11-08  236  
9707a6254a8a6b Nas Chung 2023-11-08  237  err_enc_unreg:
9707a6254a8a6b Nas Chung 2023-11-08  238  	if (match_data->flags & WAVE5_IS_ENC)
9707a6254a8a6b Nas Chung 2023-11-08  239  		wave5_vpu_enc_unregister_device(dev);
9707a6254a8a6b Nas Chung 2023-11-08  240  err_dec_unreg:
9707a6254a8a6b Nas Chung 2023-11-08  241  	if (match_data->flags & WAVE5_IS_DEC)
9707a6254a8a6b Nas Chung 2023-11-08  242  		wave5_vpu_dec_unregister_device(dev);
9707a6254a8a6b Nas Chung 2023-11-08  243  err_v4l2_unregister:
9707a6254a8a6b Nas Chung 2023-11-08  244  	v4l2_device_unregister(&dev->v4l2_dev);
9707a6254a8a6b Nas Chung 2023-11-08  245  err_vdi_release:
9707a6254a8a6b Nas Chung 2023-11-08  246  	wave5_vdi_release(&pdev->dev);
9707a6254a8a6b Nas Chung 2023-11-08  247  err_clk_dis:
9707a6254a8a6b Nas Chung 2023-11-08  248  	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
9707a6254a8a6b Nas Chung 2023-11-08  249  
9707a6254a8a6b Nas Chung 2023-11-08  250  	return ret;
9707a6254a8a6b Nas Chung 2023-11-08  251  }
9707a6254a8a6b Nas Chung 2023-11-08  252  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
