Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265881102
	for <oe-kbuild@lists.linux.dev>; Sat, 13 May 2023 08:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683968170; x=1715504170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CAGH/vZo2IHUa95ZcBn3DbQ5Rnd7FLCnRHNCDbCBEVk=;
  b=XVl7OfUlVNlGdgMmMsIiTs9cg2sC3tGSElRSHQW6aHT5z2a8TFnqV+V3
   i+NzsO6CTIDtJOISR5dFgHjF4DpSkTlQ2yJ9PF6DsAvb6aA1Xt37Rk28d
   gbEHyiQKcJ5EJYknmQXuTeySn04S3M9hBqk/RxSGUyWzu+rmsHV7Y83dY
   z5d2LQ7ciqerLZtnHa8i+RThN23mUxyEP4gHKg4VB3u+7JkitID9HtOR/
   Arm2DvTznITbM5XTKzuPQ+EZAbtIWpGyVzSJmikDsZ8Vi4e8CDfRj0Ryg
   xQfWO4TxPTGrmz6PCjZSS/gUY8g8ViXOoEKa8lE6fL9/sbLLk7q9WACfK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="437275560"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; 
   d="scan'208";a="437275560"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 01:56:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="733318750"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; 
   d="scan'208";a="733318750"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 13 May 2023 01:56:08 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxl2t-0005Pg-1e;
	Sat, 13 May 2023 08:56:07 +0000
Date: Sat, 13 May 2023 16:55:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/soc/qcom/icc-bwmon.c:360 bwmon_probe() warn: passing zero to
 'dev_err_probe'
Message-ID: <202305131657.76XeHDjF-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Thara Gopinath <thara.gopinath@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9a48d604672220545d209e9996c2a1edbb5637f6
commit: b9c2ae6cac403dee3195fda9eb28d8ee733b225b soc: qcom: icc-bwmon: Add bandwidth monitoring driver
date:   10 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 10 months ago
config: openrisc-randconfig-m031-20230509 (https://download.01.org/0day-ci/archive/20230513/202305131657.76XeHDjF-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305131657.76XeHDjF-lkp@intel.com/

New smatch warnings:
drivers/soc/qcom/icc-bwmon.c:360 bwmon_probe() warn: passing zero to 'dev_err_probe'

Old smatch warnings:
drivers/soc/qcom/icc-bwmon.c:365 bwmon_probe() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +360 drivers/soc/qcom/icc-bwmon.c

b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  326  
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  327  static int bwmon_probe(struct platform_device *pdev)
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  328  {
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  329  	struct device *dev = &pdev->dev;
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  330  	struct dev_pm_opp *opp;
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  331  	struct icc_bwmon *bwmon;
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  332  	const struct icc_bwmon_data *data;
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  333  	int ret;
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  334  
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  335  	bwmon = devm_kzalloc(dev, sizeof(*bwmon), GFP_KERNEL);
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  336  	if (!bwmon)
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  337  		return -ENOMEM;
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  338  
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  339  	data = of_device_get_match_data(dev);
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  340  
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  341  	bwmon->base = devm_platform_ioremap_resource(pdev, 0);
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  342  	if (IS_ERR(bwmon->base)) {
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  343  		dev_err(dev, "failed to map bwmon registers\n");
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  344  		return PTR_ERR(bwmon->base);
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  345  	}
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  346  
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  347  	bwmon->irq = platform_get_irq(pdev, 0);
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  348  	if (bwmon->irq < 0) {
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  349  		dev_err(dev, "failed to acquire bwmon IRQ\n");
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  350  		return bwmon->irq;
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  351  	}
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  352  
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  353  	ret = devm_pm_opp_of_add_table(dev);
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  354  	if (ret)
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  355  		return dev_err_probe(dev, ret, "failed to add OPP table\n");
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  356  
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  357  	bwmon->max_bw_kbps = UINT_MAX;
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  358  	opp = dev_pm_opp_find_bw_floor(dev, &bwmon->max_bw_kbps, 0);
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  359  	if (IS_ERR(opp))
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04 @360  		return dev_err_probe(dev, ret, "failed to find max peak bandwidth\n");
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  361  
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  362  	bwmon->min_bw_kbps = 0;
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  363  	opp = dev_pm_opp_find_bw_ceil(dev, &bwmon->min_bw_kbps, 0);
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  364  	if (IS_ERR(opp))
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  365  		return dev_err_probe(dev, ret, "failed to find min peak bandwidth\n");
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  366  
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  367  	bwmon->sample_ms = data->sample_ms;
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  368  	bwmon->default_lowbw_kbps = data->default_lowbw_kbps;
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  369  	bwmon->dev = dev;
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  370  
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  371  	bwmon_disable(bwmon);
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  372  	ret = devm_request_threaded_irq(dev, bwmon->irq, bwmon_intr,
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  373  					bwmon_intr_thread,
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  374  					IRQF_ONESHOT, dev_name(dev), bwmon);
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  375  	if (ret)
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  376  		return dev_err_probe(dev, ret, "failed to request IRQ\n");
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  377  
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  378  	platform_set_drvdata(pdev, bwmon);
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  379  	bwmon_start(bwmon, data);
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  380  
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  381  	return 0;
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  382  }
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  383  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
