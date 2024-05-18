Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD96107B6
	for <oe-kbuild@lists.linux.dev>; Sat, 18 May 2024 09:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716025741; cv=none; b=UWf07m45Mmz0TA/b0nmpLNW6tOAZ4fSxSyz8Vl8c4K8LrAXCg3qWyG79Xg8ET5KqtiYNolujFuJZHvI9wXltR34pIeDltPotfEo77oAxySPmzsEbzxRP1LAOnTLbnyBUc3bMA6XNQ1MYx3+GLhKF3hvKhw1Uy+DYYlhNPG7ce80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716025741; c=relaxed/simple;
	bh=3iGFeCK+kYL7w8S0hjvSyNGVYUJn7ZnI5u8JCNmAvNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M1sEIrbwYadSEDo4wYX2RWzwNOpnIwhhsbEM0bT9LgeW0t2m0iEyAah4UJGmc76Ao732VwLBE1bXv2W9vHZ/RH0M+Jp3LxWA0Z1M7mAw7Hnkt9JWOKIb0SfntHQixPs8PT5y5rysIcSrCG/7kcUUuVYWUrbtUO0vjituGzblXvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7HKhY5D; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7HKhY5D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716025737; x=1747561737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3iGFeCK+kYL7w8S0hjvSyNGVYUJn7ZnI5u8JCNmAvNI=;
  b=l7HKhY5D+uaohTtyN4sWYFOh/mM/sISj/cV2Zm33GOeFG3ak3rZqXkxL
   mCKVIVytpkoOrJ1MUInUfs01ry8W2p21KtsozUwON7GA0X8dr2QcB6U5H
   AqTzYZ5VGJNjM01FaK4wKO/JlYIVFtsrjcjsJfMHRc7cCe3JZ+NIhIq/d
   aG0XYudhoyXOiISw4JI+KRYpk2R5UmaiKDgyHAQyRMA+6GfPEFY/8kWwr
   WYwhPh1dJ7T/7SGBcXOcFvMlN/zIWV4wE4HVHNADDvD/mSA2sYlnrM+IW
   J4yIlNAWJiIOXoQMndTLVM/ClbATIr2wY+S4haHO8L40B/ErCE+Q6/B+2
   A==;
X-CSE-ConnectionGUID: wumaje5MTXO4H2d88T5y4g==
X-CSE-MsgGUID: rGo0YB+2RnKpWdVenCCfIQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12397473"
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="12397473"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 02:48:54 -0700
X-CSE-ConnectionGUID: mPfrx6+2T0KdK0wjUqW/rg==
X-CSE-MsgGUID: vogadTPRQpuA3xJvFx51jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="36448067"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 May 2024 02:48:52 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8GgM-0001zi-12;
	Sat, 18 May 2024 09:48:50 +0000
Date: Sat, 18 May 2024 17:48:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 10171/13355] drivers/dma/mcf-edma-main.c:116
 mcf_edma_irq_init() warn: 'res->start' from request_irq() not released on
 lines: 88,93,98,105,113.
Message-ID: <202405181756.tJmMmyWW-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Frank Li <Frank.Li@nxp.com>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c75962170e49f24399141276ae119e6a879f36dc
commit: 3f2282931f00c4c9c5057bb02f46778ba64ff625 [10171/13355] dmaengine: fsl-edma: use _Generic to handle difference type
:::::: branch date: 30 hours ago
:::::: commit date: 2 weeks ago
config: csky-randconfig-r081-20240518 (https://download.01.org/0day-ci/archive/20240518/202405181756.tJmMmyWW-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405181756.tJmMmyWW-lkp@intel.com/

New smatch warnings:
drivers/dma/mcf-edma-main.c:116 mcf_edma_irq_init() warn: 'res->start' from request_irq() not released on lines: 88,93,98,105,113.
drivers/dma/mcf-edma-main.c:205 mcf_edma_probe() warn: statement has no effect 31
drivers/dma/mcf-edma-main.c:205 mcf_edma_probe() warn: statement has no effect 31

Old smatch warnings:
drivers/dma/mcf-edma-main.c:116 mcf_edma_irq_init() warn: 'res->start' from request_irq() not released on lines: 98,105,113.
drivers/dma/mcf-edma-main.c:116 mcf_edma_irq_init() warn: 'ret' from request_irq() not released on lines: 113.

vim +116 drivers/dma/mcf-edma-main.c

e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   73  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   74  static int mcf_edma_irq_init(struct platform_device *pdev,
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   75  				struct fsl_edma_engine *mcf_edma)
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   76  {
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   77  	int ret = 0, i;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   78  	struct resource *res;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   79  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   80  	res = platform_get_resource_byname(pdev,
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   81  				IORESOURCE_IRQ, "edma-tx-00-15");
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   82  	if (!res)
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   83  		return -1;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   84  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   85  	for (ret = 0, i = res->start; i <= res->end; ++i)
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   86  		ret |= request_irq(i, mcf_edma_tx_handler, 0, "eDMA", mcf_edma);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   87  	if (ret)
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   88  		return ret;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   89  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   90  	res = platform_get_resource_byname(pdev,
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   91  			IORESOURCE_IRQ, "edma-tx-16-55");
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   92  	if (!res)
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   93  		return -1;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   94  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   95  	for (ret = 0, i = res->start; i <= res->end; ++i)
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   96  		ret |= request_irq(i, mcf_edma_tx_handler, 0, "eDMA", mcf_edma);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   97  	if (ret)
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   98  		return ret;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   99  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  100  	ret = platform_get_irq_byname(pdev, "edma-tx-56-63");
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  101  	if (ret != -ENXIO) {
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  102  		ret = request_irq(ret, mcf_edma_tx_handler,
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  103  				  0, "eDMA", mcf_edma);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  104  		if (ret)
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  105  			return ret;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  106  	}
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  107  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  108  	ret = platform_get_irq_byname(pdev, "edma-err");
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  109  	if (ret != -ENXIO) {
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  110  		ret = request_irq(ret, mcf_edma_err_handler,
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  111  				  0, "eDMA", mcf_edma);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  112  		if (ret)
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  113  			return ret;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  114  	}
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  115  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19 @116  	return 0;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  117  }
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  118  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  119  static void mcf_edma_irq_free(struct platform_device *pdev,
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  120  				struct fsl_edma_engine *mcf_edma)
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  121  {
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  122  	int irq;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  123  	struct resource *res;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  124  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  125  	res = platform_get_resource_byname(pdev,
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  126  			IORESOURCE_IRQ, "edma-tx-00-15");
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  127  	if (res) {
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  128  		for (irq = res->start; irq <= res->end; irq++)
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  129  			free_irq(irq, mcf_edma);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  130  	}
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  131  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  132  	res = platform_get_resource_byname(pdev,
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  133  			IORESOURCE_IRQ, "edma-tx-16-55");
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  134  	if (res) {
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  135  		for (irq = res->start; irq <= res->end; irq++)
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  136  			free_irq(irq, mcf_edma);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  137  	}
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  138  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  139  	irq = platform_get_irq_byname(pdev, "edma-tx-56-63");
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  140  	if (irq != -ENXIO)
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  141  		free_irq(irq, mcf_edma);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  142  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  143  	irq = platform_get_irq_byname(pdev, "edma-err");
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  144  	if (irq != -ENXIO)
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  145  		free_irq(irq, mcf_edma);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  146  }
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  147  
af802728e4ab07 drivers/dma/mcf-edma.c      Robin Gong         2019-06-25  148  static struct fsl_edma_drvdata mcf_data = {
c26e611433aaa0 drivers/dma/mcf-edma-main.c Frank Li           2023-08-21  149  	.flags = FSL_EDMA_DRV_EDMA64,
af802728e4ab07 drivers/dma/mcf-edma.c      Robin Gong         2019-06-25  150  	.setup_irq = mcf_edma_irq_init,
af802728e4ab07 drivers/dma/mcf-edma.c      Robin Gong         2019-06-25  151  };
af802728e4ab07 drivers/dma/mcf-edma.c      Robin Gong         2019-06-25  152  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  153  static int mcf_edma_probe(struct platform_device *pdev)
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  154  {
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  155  	struct mcf_edma_platform_data *pdata;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  156  	struct fsl_edma_engine *mcf_edma;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  157  	struct edma_regs *regs;
923b138388928a drivers/dma/mcf-edma.c      Christophe JAILLET 2023-05-06  158  	int ret, i, chans;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  159  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  160  	pdata = dev_get_platdata(&pdev->dev);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  161  	if (!pdata) {
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  162  		dev_err(&pdev->dev, "no platform data supplied\n");
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  163  		return -EINVAL;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  164  	}
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  165  
0a46781c89dece drivers/dma/mcf-edma.c      Christophe JAILLET 2023-07-12  166  	if (!pdata->dma_channels) {
0a46781c89dece drivers/dma/mcf-edma.c      Christophe JAILLET 2023-07-12  167  		dev_info(&pdev->dev, "setting default channel number to 64");
0a46781c89dece drivers/dma/mcf-edma.c      Christophe JAILLET 2023-07-12  168  		chans = 64;
0a46781c89dece drivers/dma/mcf-edma.c      Christophe JAILLET 2023-07-12  169  	} else {
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  170  		chans = pdata->dma_channels;
0a46781c89dece drivers/dma/mcf-edma.c      Christophe JAILLET 2023-07-12  171  	}
0a46781c89dece drivers/dma/mcf-edma.c      Christophe JAILLET 2023-07-12  172  
923b138388928a drivers/dma/mcf-edma.c      Christophe JAILLET 2023-05-06  173  	mcf_edma = devm_kzalloc(&pdev->dev, struct_size(mcf_edma, chans, chans),
923b138388928a drivers/dma/mcf-edma.c      Christophe JAILLET 2023-05-06  174  				GFP_KERNEL);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  175  	if (!mcf_edma)
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  176  		return -ENOMEM;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  177  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  178  	mcf_edma->n_chans = chans;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  179  
af802728e4ab07 drivers/dma/mcf-edma.c      Robin Gong         2019-06-25  180  	/* Set up drvdata for ColdFire edma */
af802728e4ab07 drivers/dma/mcf-edma.c      Robin Gong         2019-06-25  181  	mcf_edma->drvdata = &mcf_data;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  182  	mcf_edma->big_endian = 1;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  183  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  184  	mutex_init(&mcf_edma->fsl_edma_mutex);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  185  
4b23603a251d24 drivers/dma/mcf-edma.c      Tudor Ambarus      2022-11-10  186  	mcf_edma->membase = devm_platform_ioremap_resource(pdev, 0);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  187  	if (IS_ERR(mcf_edma->membase))
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  188  		return PTR_ERR(mcf_edma->membase);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  189  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  190  	fsl_edma_setup_regs(mcf_edma);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  191  	regs = &mcf_edma->regs;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  192  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  193  	INIT_LIST_HEAD(&mcf_edma->dma_dev.channels);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  194  	for (i = 0; i < mcf_edma->n_chans; i++) {
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  195  		struct fsl_edma_chan *mcf_chan = &mcf_edma->chans[i];
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  196  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  197  		mcf_chan->edma = mcf_edma;
cee8cbfc7be8ff drivers/dma/mcf-edma-main.c Frank Li           2024-03-23  198  		mcf_chan->srcid = i;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  199  		mcf_chan->idle = true;
0fa89f972da607 drivers/dma/mcf-edma.c      Laurentiu Tudor    2019-01-18  200  		mcf_chan->dma_dir = DMA_NONE;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  201  		mcf_chan->vchan.desc_free = fsl_edma_free_desc;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  202  		vchan_init(&mcf_chan->vchan, &mcf_edma->dma_dev);
7536f8b371adcc drivers/dma/mcf-edma-main.c Frank Li           2023-08-21  203  		mcf_chan->tcd = mcf_edma->membase + EDMA_TCD
7536f8b371adcc drivers/dma/mcf-edma-main.c Frank Li           2023-08-21  204  				+ i * sizeof(struct fsl_edma_hw_tcd);
b51dd7c8aac292 drivers/dma/mcf-edma-main.c Frank Li           2023-12-21 @205  		edma_write_tcdreg(mcf_chan, cpu_to_le32(0), csr);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  206  	}
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  207  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  208  	iowrite32(~0, regs->inth);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  209  	iowrite32(~0, regs->intl);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  210  
af802728e4ab07 drivers/dma/mcf-edma.c      Robin Gong         2019-06-25  211  	ret = mcf_edma->drvdata->setup_irq(pdev, mcf_edma);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  212  	if (ret)
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  213  		return ret;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  214  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  215  	dma_cap_set(DMA_PRIVATE, mcf_edma->dma_dev.cap_mask);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  216  	dma_cap_set(DMA_SLAVE, mcf_edma->dma_dev.cap_mask);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  217  	dma_cap_set(DMA_CYCLIC, mcf_edma->dma_dev.cap_mask);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  218  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  219  	mcf_edma->dma_dev.dev = &pdev->dev;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  220  	mcf_edma->dma_dev.device_alloc_chan_resources =
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  221  			fsl_edma_alloc_chan_resources;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  222  	mcf_edma->dma_dev.device_free_chan_resources =
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  223  			fsl_edma_free_chan_resources;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  224  	mcf_edma->dma_dev.device_config = fsl_edma_slave_config;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  225  	mcf_edma->dma_dev.device_prep_dma_cyclic =
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  226  			fsl_edma_prep_dma_cyclic;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  227  	mcf_edma->dma_dev.device_prep_slave_sg = fsl_edma_prep_slave_sg;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  228  	mcf_edma->dma_dev.device_tx_status = fsl_edma_tx_status;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  229  	mcf_edma->dma_dev.device_pause = fsl_edma_pause;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  230  	mcf_edma->dma_dev.device_resume = fsl_edma_resume;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  231  	mcf_edma->dma_dev.device_terminate_all = fsl_edma_terminate_all;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  232  	mcf_edma->dma_dev.device_issue_pending = fsl_edma_issue_pending;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  233  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  234  	mcf_edma->dma_dev.src_addr_widths = FSL_EDMA_BUSWIDTHS;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  235  	mcf_edma->dma_dev.dst_addr_widths = FSL_EDMA_BUSWIDTHS;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  236  	mcf_edma->dma_dev.directions =
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  237  			BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  238  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  239  	mcf_edma->dma_dev.filter.fn = mcf_edma_filter_fn;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  240  	mcf_edma->dma_dev.filter.map = pdata->slave_map;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  241  	mcf_edma->dma_dev.filter.mapcnt = pdata->slavecnt;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  242  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  243  	platform_set_drvdata(pdev, mcf_edma);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  244  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  245  	ret = dma_async_device_register(&mcf_edma->dma_dev);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  246  	if (ret) {
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  247  		dev_err(&pdev->dev,
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  248  			"Can't register Freescale eDMA engine. (%d)\n", ret);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  249  		return ret;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  250  	}
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  251  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  252  	/* Enable round robin arbitration */
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  253  	iowrite32(EDMA_CR_ERGA | EDMA_CR_ERCA, regs->cr);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  254  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  255  	return 0;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  256  }
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  257  

:::::: The code at line 116 was first introduced by commit
:::::: e7a3ff92eaf19eab14e8149758428e680c61706b dmaengine: fsl-edma: add ColdFire mcf5441x edma support

:::::: TO: Angelo Dureghello <angelo@sysam.it>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
