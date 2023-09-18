Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB3A28DD6
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Sep 2023 22:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695077535; x=1726613535;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F+tgaMz9qYOwR+ECmjlLXkY+45ptqTiwzknpwrkyXL8=;
  b=BMXmsuYR7Td0YJrq0mMICVHArREjWx3xjwz62WrYk6aLvL4vlNpqm+s1
   n0/sOEk58UrEToCwmLDOY50AjFKqcxSATmPdhznvyK+T49DVpwVLmfNUH
   aBZ8Lz1QDMC0sEDesMGFk82FoeTCWxrFVAbNjBjOQITJi5FoMuqJyf2aX
   /y40R3FdEiOYbLX0s3N0L3WvB0e3oR4QVuhi9LLZ4kc/Ruk4Ns7epd1WX
   hOCEwFiUAwUMxpBstSIq93vqpH9Z96UbpFZXv45EkrhK40KvKWrzBeCs9
   3XZnTBxqR7KoQToGf7kjF/NQL7W97mN/+IQunxNsWMwFuog8QztmmVv3F
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="443885466"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; 
   d="scan'208";a="443885466"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 15:52:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="889270526"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; 
   d="scan'208";a="889270526"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 18 Sep 2023 15:51:17 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiN5z-0006bT-1r;
	Mon, 18 Sep 2023 22:51:59 +0000
Date: Tue, 19 Sep 2023 06:51:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/char/hw_random/jh7110-trng.c:303 starfive_trng_probe() warn:
 passing zero to 'dev_err_probe'
Message-ID: <202309190603.3VtRfc4z-lkp@intel.com>
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
TO: Herbert Xu <herbert@gondor.apana.org.au>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Jia Jie Ho <jiajie.ho@starfivetech.com>

Hi Herbert,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2cf0f715623872823a72e451243bbf555d10d032
commit: c7410b425de40e9b163eef781e1bdacf1bf2962e hwrng: starfive - Enable compile testing
date:   8 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
config: csky-randconfig-r071-20230917 (https://download.01.org/0day-ci/archive/20230919/202309190603.3VtRfc4z-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230919/202309190603.3VtRfc4z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309190603.3VtRfc4z-lkp@intel.com/

smatch warnings:
drivers/char/hw_random/jh7110-trng.c:303 starfive_trng_probe() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +303 drivers/char/hw_random/jh7110-trng.c

c388f458bc34eb Jia Jie Ho 2023-01-17  273  
c388f458bc34eb Jia Jie Ho 2023-01-17  274  static int starfive_trng_probe(struct platform_device *pdev)
c388f458bc34eb Jia Jie Ho 2023-01-17  275  {
c388f458bc34eb Jia Jie Ho 2023-01-17  276  	int ret;
c388f458bc34eb Jia Jie Ho 2023-01-17  277  	int irq;
c388f458bc34eb Jia Jie Ho 2023-01-17  278  	struct starfive_trng *trng;
c388f458bc34eb Jia Jie Ho 2023-01-17  279  
c388f458bc34eb Jia Jie Ho 2023-01-17  280  	trng = devm_kzalloc(&pdev->dev, sizeof(*trng), GFP_KERNEL);
c388f458bc34eb Jia Jie Ho 2023-01-17  281  	if (!trng)
c388f458bc34eb Jia Jie Ho 2023-01-17  282  		return -ENOMEM;
c388f458bc34eb Jia Jie Ho 2023-01-17  283  
c388f458bc34eb Jia Jie Ho 2023-01-17  284  	platform_set_drvdata(pdev, trng);
c388f458bc34eb Jia Jie Ho 2023-01-17  285  	trng->dev = &pdev->dev;
c388f458bc34eb Jia Jie Ho 2023-01-17  286  
c388f458bc34eb Jia Jie Ho 2023-01-17  287  	trng->base = devm_platform_ioremap_resource(pdev, 0);
c388f458bc34eb Jia Jie Ho 2023-01-17  288  	if (IS_ERR(trng->base))
c388f458bc34eb Jia Jie Ho 2023-01-17  289  		return dev_err_probe(&pdev->dev, PTR_ERR(trng->base),
c388f458bc34eb Jia Jie Ho 2023-01-17  290  				     "Error remapping memory for platform device.\n");
c388f458bc34eb Jia Jie Ho 2023-01-17  291  
c388f458bc34eb Jia Jie Ho 2023-01-17  292  	irq = platform_get_irq(pdev, 0);
c388f458bc34eb Jia Jie Ho 2023-01-17  293  	if (irq < 0)
c388f458bc34eb Jia Jie Ho 2023-01-17  294  		return irq;
c388f458bc34eb Jia Jie Ho 2023-01-17  295  
c388f458bc34eb Jia Jie Ho 2023-01-17  296  	init_completion(&trng->random_done);
c388f458bc34eb Jia Jie Ho 2023-01-17  297  	init_completion(&trng->reseed_done);
c388f458bc34eb Jia Jie Ho 2023-01-17  298  	spin_lock_init(&trng->write_lock);
c388f458bc34eb Jia Jie Ho 2023-01-17  299  
c388f458bc34eb Jia Jie Ho 2023-01-17  300  	ret = devm_request_irq(&pdev->dev, irq, starfive_trng_irq, 0, pdev->name,
c388f458bc34eb Jia Jie Ho 2023-01-17  301  			       (void *)trng);
c388f458bc34eb Jia Jie Ho 2023-01-17  302  	if (ret)
c388f458bc34eb Jia Jie Ho 2023-01-17 @303  		return dev_err_probe(&pdev->dev, irq,
c388f458bc34eb Jia Jie Ho 2023-01-17  304  				     "Failed to register interrupt handler\n");
c388f458bc34eb Jia Jie Ho 2023-01-17  305  
c388f458bc34eb Jia Jie Ho 2023-01-17  306  	trng->hclk = devm_clk_get(&pdev->dev, "hclk");
c388f458bc34eb Jia Jie Ho 2023-01-17  307  	if (IS_ERR(trng->hclk))
c388f458bc34eb Jia Jie Ho 2023-01-17  308  		return dev_err_probe(&pdev->dev, PTR_ERR(trng->hclk),
c388f458bc34eb Jia Jie Ho 2023-01-17  309  				     "Error getting hardware reference clock\n");
c388f458bc34eb Jia Jie Ho 2023-01-17  310  
c388f458bc34eb Jia Jie Ho 2023-01-17  311  	trng->ahb = devm_clk_get(&pdev->dev, "ahb");
c388f458bc34eb Jia Jie Ho 2023-01-17  312  	if (IS_ERR(trng->ahb))
c388f458bc34eb Jia Jie Ho 2023-01-17  313  		return dev_err_probe(&pdev->dev, PTR_ERR(trng->ahb),
c388f458bc34eb Jia Jie Ho 2023-01-17  314  				     "Error getting ahb reference clock\n");
c388f458bc34eb Jia Jie Ho 2023-01-17  315  
c388f458bc34eb Jia Jie Ho 2023-01-17  316  	trng->rst = devm_reset_control_get_shared(&pdev->dev, NULL);
c388f458bc34eb Jia Jie Ho 2023-01-17  317  	if (IS_ERR(trng->rst))
c388f458bc34eb Jia Jie Ho 2023-01-17  318  		return dev_err_probe(&pdev->dev, PTR_ERR(trng->rst),
c388f458bc34eb Jia Jie Ho 2023-01-17  319  				     "Error getting hardware reset line\n");
c388f458bc34eb Jia Jie Ho 2023-01-17  320  
c388f458bc34eb Jia Jie Ho 2023-01-17  321  	clk_prepare_enable(trng->hclk);
c388f458bc34eb Jia Jie Ho 2023-01-17  322  	clk_prepare_enable(trng->ahb);
c388f458bc34eb Jia Jie Ho 2023-01-17  323  	reset_control_deassert(trng->rst);
c388f458bc34eb Jia Jie Ho 2023-01-17  324  
c388f458bc34eb Jia Jie Ho 2023-01-17  325  	trng->rng.name = dev_driver_string(&pdev->dev);
c388f458bc34eb Jia Jie Ho 2023-01-17  326  	trng->rng.init = starfive_trng_init;
c388f458bc34eb Jia Jie Ho 2023-01-17  327  	trng->rng.cleanup = starfive_trng_cleanup;
c388f458bc34eb Jia Jie Ho 2023-01-17  328  	trng->rng.read = starfive_trng_read;
c388f458bc34eb Jia Jie Ho 2023-01-17  329  
c388f458bc34eb Jia Jie Ho 2023-01-17  330  	trng->mode = PRNG_256BIT;
c388f458bc34eb Jia Jie Ho 2023-01-17  331  	trng->mission = 1;
c388f458bc34eb Jia Jie Ho 2023-01-17  332  	trng->reseed = RANDOM_RESEED;
c388f458bc34eb Jia Jie Ho 2023-01-17  333  
c388f458bc34eb Jia Jie Ho 2023-01-17  334  	pm_runtime_use_autosuspend(&pdev->dev);
c388f458bc34eb Jia Jie Ho 2023-01-17  335  	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
c388f458bc34eb Jia Jie Ho 2023-01-17  336  	pm_runtime_enable(&pdev->dev);
c388f458bc34eb Jia Jie Ho 2023-01-17  337  
c388f458bc34eb Jia Jie Ho 2023-01-17  338  	ret = devm_hwrng_register(&pdev->dev, &trng->rng);
c388f458bc34eb Jia Jie Ho 2023-01-17  339  	if (ret) {
c388f458bc34eb Jia Jie Ho 2023-01-17  340  		pm_runtime_disable(&pdev->dev);
c388f458bc34eb Jia Jie Ho 2023-01-17  341  
c388f458bc34eb Jia Jie Ho 2023-01-17  342  		reset_control_assert(trng->rst);
c388f458bc34eb Jia Jie Ho 2023-01-17  343  		clk_disable_unprepare(trng->ahb);
c388f458bc34eb Jia Jie Ho 2023-01-17  344  		clk_disable_unprepare(trng->hclk);
c388f458bc34eb Jia Jie Ho 2023-01-17  345  
c388f458bc34eb Jia Jie Ho 2023-01-17  346  		return dev_err_probe(&pdev->dev, ret, "Failed to register hwrng\n");
c388f458bc34eb Jia Jie Ho 2023-01-17  347  	}
c388f458bc34eb Jia Jie Ho 2023-01-17  348  
c388f458bc34eb Jia Jie Ho 2023-01-17  349  	return 0;
c388f458bc34eb Jia Jie Ho 2023-01-17  350  }
c388f458bc34eb Jia Jie Ho 2023-01-17  351  

:::::: The code at line 303 was first introduced by commit
:::::: c388f458bc34eb3a5728b67f6614f9375cd99087 hwrng: starfive - Add TRNG driver for StarFive SoC

:::::: TO: Jia Jie Ho <jiajie.ho@starfivetech.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
