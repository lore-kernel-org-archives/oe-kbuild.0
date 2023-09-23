Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9770610A08
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Sep 2023 10:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695464044; x=1727000044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TwrBYcz4vwgDNmQ3CHJQKmMeik9g246KomeKnyWKqvc=;
  b=ZbBD8NODTW87QlYMZ636PgW97x+HYNnxILuNVwiI3xSnpbxSuP3lKCc+
   zIaWNZVpadNgsu9TvP6UbysC8tlCC7ERkRp/hfENGTh+JKlnjlnrNqnYR
   dPc71Uu7n0OrxyVgSISkUhHA3/WscA9pJKt2QpuP9Vn9YCKrF88ek+kCi
   e/VOVXXykg+7qj9w+6JDRBTsr5XrhRLsPHBlaLFUPk0yMiD/gNX+hZeXf
   WUgKG0jV9AGIBWjorN3mwqa6M54ZOQsSuNhYeujYkEui8kEfXCvRgZRW6
   hkyW52imku5IIGCJalS18oafw2/FwmkIe8AzxPh+zt0akF/bN/MzMxSyb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="366063463"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="366063463"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 03:14:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="921458866"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="921458866"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 23 Sep 2023 03:14:02 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjzeC-00028X-0e;
	Sat, 23 Sep 2023 10:14:00 +0000
Date: Sat, 23 Sep 2023 18:13:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/starfive/jh7110-cryp.c:142 starfive_cryp_probe()
 warn: passing zero to 'dev_err_probe'
Message-ID: <202309231825.HPhlTQwu-lkp@intel.com>
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
TO: Jia Jie Ho <jiajie.ho@starfivetech.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Huan Feng <huan.feng@starfivetech.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d90b0276af8f25a0b8ae081a30d1b2a61263393b
commit: 7883d1b28a2b0e62edcacea22de6b36a1918b15a crypto: starfive - Add hash and HMAC support
date:   4 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 4 months ago
config: csky-randconfig-r071-20230917 (https://download.01.org/0day-ci/archive/20230923/202309231825.HPhlTQwu-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230923/202309231825.HPhlTQwu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309231825.HPhlTQwu-lkp@intel.com/

smatch warnings:
drivers/crypto/starfive/jh7110-cryp.c:142 starfive_cryp_probe() warn: passing zero to 'dev_err_probe'
drivers/crypto/starfive/jh7110-cryp.c:195 starfive_cryp_probe() warn: 'cryp->ahb' from clk_prepare_enable() not released on lines: 195.
drivers/crypto/starfive/jh7110-cryp.c:195 starfive_cryp_probe() warn: 'cryp->hclk' from clk_prepare_enable() not released on lines: 195.

vim +/dev_err_probe +142 drivers/crypto/starfive/jh7110-cryp.c

7883d1b28a2b0e Jia Jie Ho 2023-05-15   95  
42ef0e944b0119 Jia Jie Ho 2023-05-15   96  static int starfive_cryp_probe(struct platform_device *pdev)
42ef0e944b0119 Jia Jie Ho 2023-05-15   97  {
42ef0e944b0119 Jia Jie Ho 2023-05-15   98  	struct starfive_cryp_dev *cryp;
42ef0e944b0119 Jia Jie Ho 2023-05-15   99  	struct resource *res;
7883d1b28a2b0e Jia Jie Ho 2023-05-15  100  	int irq;
42ef0e944b0119 Jia Jie Ho 2023-05-15  101  	int ret;
42ef0e944b0119 Jia Jie Ho 2023-05-15  102  
42ef0e944b0119 Jia Jie Ho 2023-05-15  103  	cryp = devm_kzalloc(&pdev->dev, sizeof(*cryp), GFP_KERNEL);
42ef0e944b0119 Jia Jie Ho 2023-05-15  104  	if (!cryp)
42ef0e944b0119 Jia Jie Ho 2023-05-15  105  		return -ENOMEM;
42ef0e944b0119 Jia Jie Ho 2023-05-15  106  
42ef0e944b0119 Jia Jie Ho 2023-05-15  107  	platform_set_drvdata(pdev, cryp);
42ef0e944b0119 Jia Jie Ho 2023-05-15  108  	cryp->dev = &pdev->dev;
42ef0e944b0119 Jia Jie Ho 2023-05-15  109  
42ef0e944b0119 Jia Jie Ho 2023-05-15  110  	cryp->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
42ef0e944b0119 Jia Jie Ho 2023-05-15  111  	if (IS_ERR(cryp->base))
42ef0e944b0119 Jia Jie Ho 2023-05-15  112  		return dev_err_probe(&pdev->dev, PTR_ERR(cryp->base),
42ef0e944b0119 Jia Jie Ho 2023-05-15  113  				     "Error remapping memory for platform device\n");
42ef0e944b0119 Jia Jie Ho 2023-05-15  114  
7883d1b28a2b0e Jia Jie Ho 2023-05-15  115  	tasklet_init(&cryp->hash_done, starfive_hash_done_task, (unsigned long)cryp);
7883d1b28a2b0e Jia Jie Ho 2023-05-15  116  
42ef0e944b0119 Jia Jie Ho 2023-05-15  117  	cryp->phys_base = res->start;
42ef0e944b0119 Jia Jie Ho 2023-05-15  118  	cryp->dma_maxburst = 32;
42ef0e944b0119 Jia Jie Ho 2023-05-15  119  
42ef0e944b0119 Jia Jie Ho 2023-05-15  120  	cryp->hclk = devm_clk_get(&pdev->dev, "hclk");
42ef0e944b0119 Jia Jie Ho 2023-05-15  121  	if (IS_ERR(cryp->hclk))
42ef0e944b0119 Jia Jie Ho 2023-05-15  122  		return dev_err_probe(&pdev->dev, PTR_ERR(cryp->hclk),
42ef0e944b0119 Jia Jie Ho 2023-05-15  123  				     "Error getting hardware reference clock\n");
42ef0e944b0119 Jia Jie Ho 2023-05-15  124  
42ef0e944b0119 Jia Jie Ho 2023-05-15  125  	cryp->ahb = devm_clk_get(&pdev->dev, "ahb");
42ef0e944b0119 Jia Jie Ho 2023-05-15  126  	if (IS_ERR(cryp->ahb))
42ef0e944b0119 Jia Jie Ho 2023-05-15  127  		return dev_err_probe(&pdev->dev, PTR_ERR(cryp->ahb),
42ef0e944b0119 Jia Jie Ho 2023-05-15  128  				     "Error getting ahb reference clock\n");
42ef0e944b0119 Jia Jie Ho 2023-05-15  129  
42ef0e944b0119 Jia Jie Ho 2023-05-15  130  	cryp->rst = devm_reset_control_get_shared(cryp->dev, NULL);
42ef0e944b0119 Jia Jie Ho 2023-05-15  131  	if (IS_ERR(cryp->rst))
42ef0e944b0119 Jia Jie Ho 2023-05-15  132  		return dev_err_probe(&pdev->dev, PTR_ERR(cryp->rst),
42ef0e944b0119 Jia Jie Ho 2023-05-15  133  				     "Error getting hardware reset line\n");
42ef0e944b0119 Jia Jie Ho 2023-05-15  134  
7883d1b28a2b0e Jia Jie Ho 2023-05-15  135  	irq = platform_get_irq(pdev, 0);
7883d1b28a2b0e Jia Jie Ho 2023-05-15  136  	if (irq < 0)
7883d1b28a2b0e Jia Jie Ho 2023-05-15  137  		return irq;
7883d1b28a2b0e Jia Jie Ho 2023-05-15  138  
7883d1b28a2b0e Jia Jie Ho 2023-05-15  139  	ret = devm_request_irq(&pdev->dev, irq, starfive_cryp_irq, 0, pdev->name,
7883d1b28a2b0e Jia Jie Ho 2023-05-15  140  			       (void *)cryp);
7883d1b28a2b0e Jia Jie Ho 2023-05-15  141  	if (ret)
7883d1b28a2b0e Jia Jie Ho 2023-05-15 @142  		return dev_err_probe(&pdev->dev, irq,
7883d1b28a2b0e Jia Jie Ho 2023-05-15  143  				     "Failed to register interrupt handler\n");
7883d1b28a2b0e Jia Jie Ho 2023-05-15  144  
42ef0e944b0119 Jia Jie Ho 2023-05-15  145  	clk_prepare_enable(cryp->hclk);
42ef0e944b0119 Jia Jie Ho 2023-05-15  146  	clk_prepare_enable(cryp->ahb);
42ef0e944b0119 Jia Jie Ho 2023-05-15  147  	reset_control_deassert(cryp->rst);
42ef0e944b0119 Jia Jie Ho 2023-05-15  148  
42ef0e944b0119 Jia Jie Ho 2023-05-15  149  	spin_lock(&dev_list.lock);
42ef0e944b0119 Jia Jie Ho 2023-05-15  150  	list_add(&cryp->list, &dev_list.dev_list);
42ef0e944b0119 Jia Jie Ho 2023-05-15  151  	spin_unlock(&dev_list.lock);
42ef0e944b0119 Jia Jie Ho 2023-05-15  152  
42ef0e944b0119 Jia Jie Ho 2023-05-15  153  	ret = starfive_dma_init(cryp);
42ef0e944b0119 Jia Jie Ho 2023-05-15  154  	if (ret) {
42ef0e944b0119 Jia Jie Ho 2023-05-15  155  		if (ret == -EPROBE_DEFER)
42ef0e944b0119 Jia Jie Ho 2023-05-15  156  			goto err_probe_defer;
42ef0e944b0119 Jia Jie Ho 2023-05-15  157  		else
42ef0e944b0119 Jia Jie Ho 2023-05-15  158  			goto err_dma_init;
42ef0e944b0119 Jia Jie Ho 2023-05-15  159  	}
42ef0e944b0119 Jia Jie Ho 2023-05-15  160  
42ef0e944b0119 Jia Jie Ho 2023-05-15  161  	/* Initialize crypto engine */
42ef0e944b0119 Jia Jie Ho 2023-05-15  162  	cryp->engine = crypto_engine_alloc_init(&pdev->dev, 1);
42ef0e944b0119 Jia Jie Ho 2023-05-15  163  	if (!cryp->engine) {
42ef0e944b0119 Jia Jie Ho 2023-05-15  164  		ret = -ENOMEM;
42ef0e944b0119 Jia Jie Ho 2023-05-15  165  		goto err_engine;
42ef0e944b0119 Jia Jie Ho 2023-05-15  166  	}
42ef0e944b0119 Jia Jie Ho 2023-05-15  167  
42ef0e944b0119 Jia Jie Ho 2023-05-15  168  	ret = crypto_engine_start(cryp->engine);
42ef0e944b0119 Jia Jie Ho 2023-05-15  169  	if (ret)
42ef0e944b0119 Jia Jie Ho 2023-05-15  170  		goto err_engine_start;
42ef0e944b0119 Jia Jie Ho 2023-05-15  171  
7883d1b28a2b0e Jia Jie Ho 2023-05-15  172  	ret = starfive_hash_register_algs();
7883d1b28a2b0e Jia Jie Ho 2023-05-15  173  	if (ret)
7883d1b28a2b0e Jia Jie Ho 2023-05-15  174  		goto err_algs_hash;
7883d1b28a2b0e Jia Jie Ho 2023-05-15  175  
42ef0e944b0119 Jia Jie Ho 2023-05-15  176  	return 0;
42ef0e944b0119 Jia Jie Ho 2023-05-15  177  
7883d1b28a2b0e Jia Jie Ho 2023-05-15  178  err_algs_hash:
7883d1b28a2b0e Jia Jie Ho 2023-05-15  179  	crypto_engine_stop(cryp->engine);
42ef0e944b0119 Jia Jie Ho 2023-05-15  180  err_engine_start:
42ef0e944b0119 Jia Jie Ho 2023-05-15  181  	crypto_engine_exit(cryp->engine);
42ef0e944b0119 Jia Jie Ho 2023-05-15  182  err_engine:
42ef0e944b0119 Jia Jie Ho 2023-05-15  183  	starfive_dma_cleanup(cryp);
42ef0e944b0119 Jia Jie Ho 2023-05-15  184  err_dma_init:
42ef0e944b0119 Jia Jie Ho 2023-05-15  185  	spin_lock(&dev_list.lock);
42ef0e944b0119 Jia Jie Ho 2023-05-15  186  	list_del(&cryp->list);
42ef0e944b0119 Jia Jie Ho 2023-05-15  187  	spin_unlock(&dev_list.lock);
42ef0e944b0119 Jia Jie Ho 2023-05-15  188  
42ef0e944b0119 Jia Jie Ho 2023-05-15  189  	clk_disable_unprepare(cryp->hclk);
42ef0e944b0119 Jia Jie Ho 2023-05-15  190  	clk_disable_unprepare(cryp->ahb);
42ef0e944b0119 Jia Jie Ho 2023-05-15  191  	reset_control_assert(cryp->rst);
7883d1b28a2b0e Jia Jie Ho 2023-05-15  192  
7883d1b28a2b0e Jia Jie Ho 2023-05-15  193  	tasklet_kill(&cryp->hash_done);
42ef0e944b0119 Jia Jie Ho 2023-05-15  194  err_probe_defer:
42ef0e944b0119 Jia Jie Ho 2023-05-15 @195  	return ret;
42ef0e944b0119 Jia Jie Ho 2023-05-15  196  }
42ef0e944b0119 Jia Jie Ho 2023-05-15  197  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
