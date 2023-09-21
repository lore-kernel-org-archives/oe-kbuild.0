Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D79199AB
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Sep 2023 15:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695309775; x=1726845775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=larwVEDfVTXE94vums0Vpb5ZYbLjL7qsjB0aJ0hMV1Y=;
  b=WrQS38VkAj+U1iBAzfHR+Z4hpws9b6EqiFEGaSydeBqj726Q7asoTwjq
   qltr7q/YGaMp/W5f+gbDC6uYOFbzh1p1h0cM3BHDBwhfCyjRnQRBNCK1B
   n5ARI/1F3FJRc0jJbSiGTyzi5PowFT4P850eHGF0Aop6/KhG2Dl7w6riw
   m9PSbOdp9zphzmdjUNqEpwgd8cFeFQbuNqnzcKsFxwNLGI4wi3dOF8/jJ
   LgS3B7hbNoVERI0uLvF7ViwcyB3YbLYTWqNb+JCChFlEKkltGjo+AGMWn
   kbrFsUrchlcxs/MbCG8OV54ZXHqAAT4733+KdKknLqxmTYH/DTztcMXzm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="444669429"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="444669429"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 08:22:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="994120438"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="994120438"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 21 Sep 2023 08:22:53 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjLVx-00005b-0s;
	Thu, 21 Sep 2023 15:22:49 +0000
Date: Thu, 21 Sep 2023 23:21:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/starfive/jh7110-cryp.c:160 starfive_cryp_probe()
 warn: 'cryp->ahb' from clk_prepare_enable() not released on lines: 160.
Message-ID: <202309212326.NEkDw5cu-lkp@intel.com>
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
head:   42dc814987c1feb6410904e58cfd4c36c4146150
commit: 42ef0e944b0119e9987819af0a5a04d32d5e5edf crypto: starfive - Add crypto engine support
date:   4 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 4 months ago
config: csky-randconfig-r071-20230917 (https://download.01.org/0day-ci/archive/20230921/202309212326.NEkDw5cu-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230921/202309212326.NEkDw5cu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309212326.NEkDw5cu-lkp@intel.com/

smatch warnings:
drivers/crypto/starfive/jh7110-cryp.c:160 starfive_cryp_probe() warn: 'cryp->ahb' from clk_prepare_enable() not released on lines: 160.
drivers/crypto/starfive/jh7110-cryp.c:160 starfive_cryp_probe() warn: 'cryp->hclk' from clk_prepare_enable() not released on lines: 160.

vim +160 drivers/crypto/starfive/jh7110-cryp.c

42ef0e944b0119e Jia Jie Ho 2023-05-15   81  
42ef0e944b0119e Jia Jie Ho 2023-05-15   82  static int starfive_cryp_probe(struct platform_device *pdev)
42ef0e944b0119e Jia Jie Ho 2023-05-15   83  {
42ef0e944b0119e Jia Jie Ho 2023-05-15   84  	struct starfive_cryp_dev *cryp;
42ef0e944b0119e Jia Jie Ho 2023-05-15   85  	struct resource *res;
42ef0e944b0119e Jia Jie Ho 2023-05-15   86  	int ret;
42ef0e944b0119e Jia Jie Ho 2023-05-15   87  
42ef0e944b0119e Jia Jie Ho 2023-05-15   88  	cryp = devm_kzalloc(&pdev->dev, sizeof(*cryp), GFP_KERNEL);
42ef0e944b0119e Jia Jie Ho 2023-05-15   89  	if (!cryp)
42ef0e944b0119e Jia Jie Ho 2023-05-15   90  		return -ENOMEM;
42ef0e944b0119e Jia Jie Ho 2023-05-15   91  
42ef0e944b0119e Jia Jie Ho 2023-05-15   92  	platform_set_drvdata(pdev, cryp);
42ef0e944b0119e Jia Jie Ho 2023-05-15   93  	cryp->dev = &pdev->dev;
42ef0e944b0119e Jia Jie Ho 2023-05-15   94  
42ef0e944b0119e Jia Jie Ho 2023-05-15   95  	cryp->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
42ef0e944b0119e Jia Jie Ho 2023-05-15   96  	if (IS_ERR(cryp->base))
42ef0e944b0119e Jia Jie Ho 2023-05-15   97  		return dev_err_probe(&pdev->dev, PTR_ERR(cryp->base),
42ef0e944b0119e Jia Jie Ho 2023-05-15   98  				     "Error remapping memory for platform device\n");
42ef0e944b0119e Jia Jie Ho 2023-05-15   99  
42ef0e944b0119e Jia Jie Ho 2023-05-15  100  	cryp->phys_base = res->start;
42ef0e944b0119e Jia Jie Ho 2023-05-15  101  	cryp->dma_maxburst = 32;
42ef0e944b0119e Jia Jie Ho 2023-05-15  102  
42ef0e944b0119e Jia Jie Ho 2023-05-15  103  	cryp->hclk = devm_clk_get(&pdev->dev, "hclk");
42ef0e944b0119e Jia Jie Ho 2023-05-15  104  	if (IS_ERR(cryp->hclk))
42ef0e944b0119e Jia Jie Ho 2023-05-15  105  		return dev_err_probe(&pdev->dev, PTR_ERR(cryp->hclk),
42ef0e944b0119e Jia Jie Ho 2023-05-15  106  				     "Error getting hardware reference clock\n");
42ef0e944b0119e Jia Jie Ho 2023-05-15  107  
42ef0e944b0119e Jia Jie Ho 2023-05-15  108  	cryp->ahb = devm_clk_get(&pdev->dev, "ahb");
42ef0e944b0119e Jia Jie Ho 2023-05-15  109  	if (IS_ERR(cryp->ahb))
42ef0e944b0119e Jia Jie Ho 2023-05-15  110  		return dev_err_probe(&pdev->dev, PTR_ERR(cryp->ahb),
42ef0e944b0119e Jia Jie Ho 2023-05-15  111  				     "Error getting ahb reference clock\n");
42ef0e944b0119e Jia Jie Ho 2023-05-15  112  
42ef0e944b0119e Jia Jie Ho 2023-05-15  113  	cryp->rst = devm_reset_control_get_shared(cryp->dev, NULL);
42ef0e944b0119e Jia Jie Ho 2023-05-15  114  	if (IS_ERR(cryp->rst))
42ef0e944b0119e Jia Jie Ho 2023-05-15  115  		return dev_err_probe(&pdev->dev, PTR_ERR(cryp->rst),
42ef0e944b0119e Jia Jie Ho 2023-05-15  116  				     "Error getting hardware reset line\n");
42ef0e944b0119e Jia Jie Ho 2023-05-15  117  
42ef0e944b0119e Jia Jie Ho 2023-05-15  118  	clk_prepare_enable(cryp->hclk);
42ef0e944b0119e Jia Jie Ho 2023-05-15  119  	clk_prepare_enable(cryp->ahb);
42ef0e944b0119e Jia Jie Ho 2023-05-15  120  	reset_control_deassert(cryp->rst);
42ef0e944b0119e Jia Jie Ho 2023-05-15  121  
42ef0e944b0119e Jia Jie Ho 2023-05-15  122  	spin_lock(&dev_list.lock);
42ef0e944b0119e Jia Jie Ho 2023-05-15  123  	list_add(&cryp->list, &dev_list.dev_list);
42ef0e944b0119e Jia Jie Ho 2023-05-15  124  	spin_unlock(&dev_list.lock);
42ef0e944b0119e Jia Jie Ho 2023-05-15  125  
42ef0e944b0119e Jia Jie Ho 2023-05-15  126  	ret = starfive_dma_init(cryp);
42ef0e944b0119e Jia Jie Ho 2023-05-15  127  	if (ret) {
42ef0e944b0119e Jia Jie Ho 2023-05-15  128  		if (ret == -EPROBE_DEFER)
42ef0e944b0119e Jia Jie Ho 2023-05-15  129  			goto err_probe_defer;
42ef0e944b0119e Jia Jie Ho 2023-05-15  130  		else
42ef0e944b0119e Jia Jie Ho 2023-05-15  131  			goto err_dma_init;
42ef0e944b0119e Jia Jie Ho 2023-05-15  132  	}
42ef0e944b0119e Jia Jie Ho 2023-05-15  133  
42ef0e944b0119e Jia Jie Ho 2023-05-15  134  	/* Initialize crypto engine */
42ef0e944b0119e Jia Jie Ho 2023-05-15  135  	cryp->engine = crypto_engine_alloc_init(&pdev->dev, 1);
42ef0e944b0119e Jia Jie Ho 2023-05-15  136  	if (!cryp->engine) {
42ef0e944b0119e Jia Jie Ho 2023-05-15  137  		ret = -ENOMEM;
42ef0e944b0119e Jia Jie Ho 2023-05-15  138  		goto err_engine;
42ef0e944b0119e Jia Jie Ho 2023-05-15  139  	}
42ef0e944b0119e Jia Jie Ho 2023-05-15  140  
42ef0e944b0119e Jia Jie Ho 2023-05-15  141  	ret = crypto_engine_start(cryp->engine);
42ef0e944b0119e Jia Jie Ho 2023-05-15  142  	if (ret)
42ef0e944b0119e Jia Jie Ho 2023-05-15  143  		goto err_engine_start;
42ef0e944b0119e Jia Jie Ho 2023-05-15  144  
42ef0e944b0119e Jia Jie Ho 2023-05-15  145  	return 0;
42ef0e944b0119e Jia Jie Ho 2023-05-15  146  
42ef0e944b0119e Jia Jie Ho 2023-05-15  147  err_engine_start:
42ef0e944b0119e Jia Jie Ho 2023-05-15  148  	crypto_engine_exit(cryp->engine);
42ef0e944b0119e Jia Jie Ho 2023-05-15  149  err_engine:
42ef0e944b0119e Jia Jie Ho 2023-05-15  150  	starfive_dma_cleanup(cryp);
42ef0e944b0119e Jia Jie Ho 2023-05-15  151  err_dma_init:
42ef0e944b0119e Jia Jie Ho 2023-05-15  152  	spin_lock(&dev_list.lock);
42ef0e944b0119e Jia Jie Ho 2023-05-15  153  	list_del(&cryp->list);
42ef0e944b0119e Jia Jie Ho 2023-05-15  154  	spin_unlock(&dev_list.lock);
42ef0e944b0119e Jia Jie Ho 2023-05-15  155  
42ef0e944b0119e Jia Jie Ho 2023-05-15  156  	clk_disable_unprepare(cryp->hclk);
42ef0e944b0119e Jia Jie Ho 2023-05-15  157  	clk_disable_unprepare(cryp->ahb);
42ef0e944b0119e Jia Jie Ho 2023-05-15  158  	reset_control_assert(cryp->rst);
42ef0e944b0119e Jia Jie Ho 2023-05-15  159  err_probe_defer:
42ef0e944b0119e Jia Jie Ho 2023-05-15 @160  	return ret;
42ef0e944b0119e Jia Jie Ho 2023-05-15  161  }
42ef0e944b0119e Jia Jie Ho 2023-05-15  162  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
