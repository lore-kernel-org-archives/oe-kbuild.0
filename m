Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ECB253B57
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Feb 2025 10:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739527377; cv=none; b=FLfGlFLU4Y25NhojAAiDhq9lyqFCvcOY+zSHepnjOIhsbaWlA4CLUhkAi1FQLVSSV9gb+50YgdPorIX1L5QAN1oibfPXsfrIkUgtdB3VTSwFtQguOYV07BBO+PghnBmHj/MCQQGOak5iKwb0iMor72QQjgCN737HY/plREOJnfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739527377; c=relaxed/simple;
	bh=rdedPW0n5S+IdPH44aP6gFbq6BBs6ZGLard4d672QKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S4l8OTLBkZjJBvQ1gyw8WZsuVxStOR4jyiI+be5VgR6El+xTToULxdOBrCuLUKYeuVQERS7i93LNg/iJxrImAtzCT8Lr+LpOxdOGUmL1EUMyqKRuh2LS11OZlTvyvY6/irON1ufgrvAF2F9OXg23iizLqXpqAtzRdsbcQov9nxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mBohexzS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mBohexzS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739527376; x=1771063376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rdedPW0n5S+IdPH44aP6gFbq6BBs6ZGLard4d672QKU=;
  b=mBohexzSbkrjgLL1KtxvddP7x3kHol1WqzUfftdd7EVw/XfkDgmeqeLZ
   UU8VmeYaJ8TZun5cjzbagLl3ACKEhb9tw1LI91bKlDBs5x3HORLWU8lk/
   Vq463AL4HGyxSxFflv5XYEaZegA+eQ90g1GzISFGkAvJ4LZr9doV50iG8
   jdjrbqxVGNZcA6/eDzHgp5X0BnA6JtdJwt9UMjh6vHOtLbzBWJ6zkqd/i
   ZSD2tS+iu8IoKnZloNgncp+tUR8YqqK4IL4Mg7D87i3PTj10YVtsZCe0H
   fhR+xMcjIJHOVWl1p6om4mgR4xXysjOTSF7L9KqVDYPNgW7Yrp+w1tnKi
   A==;
X-CSE-ConnectionGUID: sI5/ZE/9Q3m2qcmZUVknKA==
X-CSE-MsgGUID: egVcow3dSSW8Ol6jS+otgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="57677859"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="57677859"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 02:02:53 -0800
X-CSE-ConnectionGUID: Nv0MAs1BRR2Pmn9/S7JSFA==
X-CSE-MsgGUID: VNDXl/8wSNKZTvM3COfsMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="114058114"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Feb 2025 02:02:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tisX3-0019Mb-0A;
	Fri, 14 Feb 2025 10:02:49 +0000
Date: Fri, 14 Feb 2025 18:02:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [asahilinux:bits/020-dart 17/22] drivers/iommu/apple-dart.c:1400
 apple_dart_probe() warn: missing error code 'ret'
Message-ID: <202502141719.xWYJBNmg-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/020-dart
head:   20a369d106d69cb8fb5e42c09f6a1881dbbdfd2c
commit: 5dfbd033f4a67bb174d466b1c52fa28e14bf6653 [17/22] iommu: apple-dart: Support specifying the DMA aperture in the DT
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-r073-20250214 (https://download.01.org/0day-ci/archive/20250214/202502141719.xWYJBNmg-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502141719.xWYJBNmg-lkp@intel.com/

smatch warnings:
drivers/iommu/apple-dart.c:1400 apple_dart_probe() warn: missing error code 'ret'

vim +/ret +1400 drivers/iommu/apple-dart.c

91379c79dece39 Alyssa Rosenzweig 2021-08-26  1315  
46d1fb072e76b1 Sven Peter        2021-08-03  1316  static int apple_dart_probe(struct platform_device *pdev)
46d1fb072e76b1 Sven Peter        2021-08-03  1317  {
46d1fb072e76b1 Sven Peter        2021-08-03  1318  	int ret;
d8bcc870d99d7e Hector Martin     2023-01-13  1319  	u32 dart_params[4];
46d1fb072e76b1 Sven Peter        2021-08-03  1320  	struct resource *res;
46d1fb072e76b1 Sven Peter        2021-08-03  1321  	struct apple_dart *dart;
46d1fb072e76b1 Sven Peter        2021-08-03  1322  	struct device *dev = &pdev->dev;
5dfbd033f4a67b Hector Martin     2023-04-11  1323  	u64 dma_range[2];
46d1fb072e76b1 Sven Peter        2021-08-03  1324  
46d1fb072e76b1 Sven Peter        2021-08-03  1325  	dart = devm_kzalloc(dev, sizeof(*dart), GFP_KERNEL);
46d1fb072e76b1 Sven Peter        2021-08-03  1326  	if (!dart)
46d1fb072e76b1 Sven Peter        2021-08-03  1327  		return -ENOMEM;
46d1fb072e76b1 Sven Peter        2021-08-03  1328  
46d1fb072e76b1 Sven Peter        2021-08-03  1329  	dart->dev = dev;
a380b8dcf22ccb Sven Peter        2022-09-16  1330  	dart->hw = of_device_get_match_data(dev);
46d1fb072e76b1 Sven Peter        2021-08-03  1331  	spin_lock_init(&dart->lock);
46d1fb072e76b1 Sven Peter        2021-08-03  1332  
a15932f4377062 Yang Yingliang    2022-04-25  1333  	dart->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
a15932f4377062 Yang Yingliang    2022-04-25  1334  	if (IS_ERR(dart->regs))
a15932f4377062 Yang Yingliang    2022-04-25  1335  		return PTR_ERR(dart->regs);
a15932f4377062 Yang Yingliang    2022-04-25  1336  
46d1fb072e76b1 Sven Peter        2021-08-03  1337  	if (resource_size(res) < 0x4000) {
46d1fb072e76b1 Sven Peter        2021-08-03  1338  		dev_err(dev, "MMIO region too small (%pr)\n", res);
46d1fb072e76b1 Sven Peter        2021-08-03  1339  		return -EINVAL;
46d1fb072e76b1 Sven Peter        2021-08-03  1340  	}
46d1fb072e76b1 Sven Peter        2021-08-03  1341  
46d1fb072e76b1 Sven Peter        2021-08-03  1342  	dart->irq = platform_get_irq(pdev, 0);
46d1fb072e76b1 Sven Peter        2021-08-03  1343  	if (dart->irq < 0)
46d1fb072e76b1 Sven Peter        2021-08-03  1344  		return -ENODEV;
46d1fb072e76b1 Sven Peter        2021-08-03  1345  
46d1fb072e76b1 Sven Peter        2021-08-03  1346  	ret = devm_clk_bulk_get_all(dev, &dart->clks);
46d1fb072e76b1 Sven Peter        2021-08-03  1347  	if (ret < 0)
46d1fb072e76b1 Sven Peter        2021-08-03  1348  		return ret;
46d1fb072e76b1 Sven Peter        2021-08-03  1349  	dart->num_clks = ret;
46d1fb072e76b1 Sven Peter        2021-08-03  1350  
46d1fb072e76b1 Sven Peter        2021-08-03  1351  	ret = clk_bulk_prepare_enable(dart->num_clks, dart->clks);
46d1fb072e76b1 Sven Peter        2021-08-03  1352  	if (ret)
46d1fb072e76b1 Sven Peter        2021-08-03  1353  		return ret;
46d1fb072e76b1 Sven Peter        2021-08-03  1354  
32fea06ecc2ce7 Hector Martin     2022-12-12  1355  	pm_runtime_get_noresume(dev);
32fea06ecc2ce7 Hector Martin     2022-12-12  1356  	pm_runtime_set_active(dev);
32fea06ecc2ce7 Hector Martin     2022-12-12  1357  	pm_runtime_irq_safe(dev);
32fea06ecc2ce7 Hector Martin     2022-12-12  1358  
32fea06ecc2ce7 Hector Martin     2022-12-12  1359  	ret = devm_pm_runtime_enable(dev);
32fea06ecc2ce7 Hector Martin     2022-12-12  1360  	if (ret)
32fea06ecc2ce7 Hector Martin     2022-12-12  1361  		goto err_clk_disable;
32fea06ecc2ce7 Hector Martin     2022-12-12  1362  
46d1fb072e76b1 Sven Peter        2021-08-03  1363  	dart_params[0] = readl(dart->regs + DART_PARAMS1);
46d1fb072e76b1 Sven Peter        2021-08-03  1364  	dart_params[1] = readl(dart->regs + DART_PARAMS2);
a772a02c18342b Hector Martin     2023-01-13  1365  	dart->pgsize = 1 << FIELD_GET(DART_PARAMS1_PAGE_SHIFT, dart_params[0]);
a772a02c18342b Hector Martin     2023-01-13  1366  	dart->supports_bypass = dart_params[1] & DART_PARAMS2_BYPASS_SUPPORT;
510d4072df7fcf Hector Martin     2023-01-13  1367  
d8bcc870d99d7e Hector Martin     2023-01-13  1368  	switch (dart->hw->type) {
d8bcc870d99d7e Hector Martin     2023-01-13  1369  	case DART_T8020:
d8bcc870d99d7e Hector Martin     2023-01-13  1370  	case DART_T6000:
d8bcc870d99d7e Hector Martin     2023-01-13  1371  		dart->ias = 32;
d8bcc870d99d7e Hector Martin     2023-01-13  1372  		dart->oas = dart->hw->oas;
510d4072df7fcf Hector Martin     2023-01-13  1373  		dart->num_streams = dart->hw->max_sid_count;
d8bcc870d99d7e Hector Martin     2023-01-13  1374  		break;
d8bcc870d99d7e Hector Martin     2023-01-13  1375  
d8bcc870d99d7e Hector Martin     2023-01-13  1376  	case DART_T8110:
d8bcc870d99d7e Hector Martin     2023-01-13  1377  		dart_params[2] = readl(dart->regs + DART_T8110_PARAMS3);
d8bcc870d99d7e Hector Martin     2023-01-13  1378  		dart_params[3] = readl(dart->regs + DART_T8110_PARAMS4);
d8bcc870d99d7e Hector Martin     2023-01-13  1379  		dart->ias = FIELD_GET(DART_T8110_PARAMS3_VA_WIDTH, dart_params[2]);
d8bcc870d99d7e Hector Martin     2023-01-13  1380  		dart->oas = FIELD_GET(DART_T8110_PARAMS3_PA_WIDTH, dart_params[2]);
d8bcc870d99d7e Hector Martin     2023-01-13  1381  		dart->num_streams = FIELD_GET(DART_T8110_PARAMS4_NUM_SIDS, dart_params[3]);
662211b238c70e Hector Martin     2023-04-10  1382  		dart->four_level = dart->ias > 36;
d8bcc870d99d7e Hector Martin     2023-01-13  1383  		break;
d8bcc870d99d7e Hector Martin     2023-01-13  1384  	}
510d4072df7fcf Hector Martin     2023-01-13  1385  
5dfbd033f4a67b Hector Martin     2023-04-11  1386  	dart->dma_min = 0;
5dfbd033f4a67b Hector Martin     2023-04-11  1387  	dart->dma_max = DMA_BIT_MASK(dart->ias);
5dfbd033f4a67b Hector Martin     2023-04-11  1388  
5dfbd033f4a67b Hector Martin     2023-04-11  1389  	ret = of_property_read_u64_array(dev->of_node, "apple,dma-range", dma_range, 2);
5dfbd033f4a67b Hector Martin     2023-04-11  1390  	if (ret == -EINVAL) {
5dfbd033f4a67b Hector Martin     2023-04-11  1391  		ret = 0;
5dfbd033f4a67b Hector Martin     2023-04-11  1392  	} else if (ret) {
5dfbd033f4a67b Hector Martin     2023-04-11  1393  		goto err_clk_disable;
5dfbd033f4a67b Hector Martin     2023-04-11  1394  	} else {
5dfbd033f4a67b Hector Martin     2023-04-11  1395  		dart->dma_min = dma_range[0];
5dfbd033f4a67b Hector Martin     2023-04-11  1396  		dart->dma_max = dma_range[0] + dma_range[1] - 1;
5dfbd033f4a67b Hector Martin     2023-04-11  1397  		if ((dart->dma_min ^ dart->dma_max) & ~DMA_BIT_MASK(dart->ias)) {
5dfbd033f4a67b Hector Martin     2023-04-11  1398  			dev_err(&pdev->dev, "Invalid DMA range for ias=%d\n",
5dfbd033f4a67b Hector Martin     2023-04-11  1399  				dart->ias);
5dfbd033f4a67b Hector Martin     2023-04-11 @1400  			goto err_clk_disable;
5dfbd033f4a67b Hector Martin     2023-04-11  1401  		}
5dfbd033f4a67b Hector Martin     2023-04-11  1402  		dev_info(&pdev->dev, "Limiting DMA range to %pad..%pad\n",
5dfbd033f4a67b Hector Martin     2023-04-11  1403  			 &dart->dma_min, &dart->dma_max);
5dfbd033f4a67b Hector Martin     2023-04-11  1404  	}
5dfbd033f4a67b Hector Martin     2023-04-11  1405  
510d4072df7fcf Hector Martin     2023-01-13  1406  	if (dart->num_streams > DART_MAX_STREAMS) {
510d4072df7fcf Hector Martin     2023-01-13  1407  		dev_err(&pdev->dev, "Too many streams (%d > %d)\n",
510d4072df7fcf Hector Martin     2023-01-13  1408  			dart->num_streams, DART_MAX_STREAMS);
510d4072df7fcf Hector Martin     2023-01-13  1409  		ret = -EINVAL;
510d4072df7fcf Hector Martin     2023-01-13  1410  		goto err_clk_disable;
510d4072df7fcf Hector Martin     2023-01-13  1411  	}
510d4072df7fcf Hector Martin     2023-01-13  1412  
91379c79dece39 Alyssa Rosenzweig 2021-08-26  1413  	dart->locked = apple_dart_is_locked(dart);
db16a0d77e10a9 Alyssa Rosenzweig 2021-08-26  1414  	if (!dart->locked) {
510d4072df7fcf Hector Martin     2023-01-13  1415  		ret = apple_dart_hw_reset(dart);
510d4072df7fcf Hector Martin     2023-01-13  1416  		if (ret)
510d4072df7fcf Hector Martin     2023-01-13  1417  			goto err_clk_disable;
db16a0d77e10a9 Alyssa Rosenzweig 2021-08-26  1418  	}
510d4072df7fcf Hector Martin     2023-01-13  1419  
b76c68fcb44025 Hector Martin     2023-01-13  1420  	ret = request_irq(dart->irq, dart->hw->irq_handler, IRQF_SHARED,
46d1fb072e76b1 Sven Peter        2021-08-03  1421  			  "apple-dart fault handler", dart);
46d1fb072e76b1 Sven Peter        2021-08-03  1422  	if (ret)
46d1fb072e76b1 Sven Peter        2021-08-03  1423  		goto err_clk_disable;
46d1fb072e76b1 Sven Peter        2021-08-03  1424  
46d1fb072e76b1 Sven Peter        2021-08-03  1425  	platform_set_drvdata(pdev, dart);
46d1fb072e76b1 Sven Peter        2021-08-03  1426  
46d1fb072e76b1 Sven Peter        2021-08-03  1427  	ret = iommu_device_sysfs_add(&dart->iommu, dev, NULL, "apple-dart.%s",
46d1fb072e76b1 Sven Peter        2021-08-03  1428  				     dev_name(&pdev->dev));
46d1fb072e76b1 Sven Peter        2021-08-03  1429  	if (ret)
006abbe36acdac Robin Murphy      2022-08-15  1430  		goto err_free_irq;
46d1fb072e76b1 Sven Peter        2021-08-03  1431  
46d1fb072e76b1 Sven Peter        2021-08-03  1432  	ret = iommu_device_register(&dart->iommu, &apple_dart_iommu_ops, dev);
46d1fb072e76b1 Sven Peter        2021-08-03  1433  	if (ret)
46d1fb072e76b1 Sven Peter        2021-08-03  1434  		goto err_sysfs_remove;
46d1fb072e76b1 Sven Peter        2021-08-03  1435  
32fea06ecc2ce7 Hector Martin     2022-12-12  1436  	pm_runtime_put(dev);
32fea06ecc2ce7 Hector Martin     2022-12-12  1437  
46d1fb072e76b1 Sven Peter        2021-08-03  1438  	dev_info(
46d1fb072e76b1 Sven Peter        2021-08-03  1439  		&pdev->dev,
662211b238c70e Hector Martin     2023-04-10  1440  		"DART [pagesize %x, %d streams, bypass support: %d, bypass forced: %d, locked: %d, AS %d -> %d] initialized\n",
bbc70e0aec287e Jason Gunthorpe   2023-09-27  1441  		dart->pgsize, dart->num_streams, dart->supports_bypass,
662211b238c70e Hector Martin     2023-04-10  1442  		dart->pgsize > PAGE_SIZE, dart->locked, dart->ias, dart->oas);
46d1fb072e76b1 Sven Peter        2021-08-03  1443  	return 0;
46d1fb072e76b1 Sven Peter        2021-08-03  1444  
46d1fb072e76b1 Sven Peter        2021-08-03  1445  err_sysfs_remove:
46d1fb072e76b1 Sven Peter        2021-08-03  1446  	iommu_device_sysfs_remove(&dart->iommu);
46d1fb072e76b1 Sven Peter        2021-08-03  1447  err_free_irq:
46d1fb072e76b1 Sven Peter        2021-08-03  1448  	free_irq(dart->irq, dart);
46d1fb072e76b1 Sven Peter        2021-08-03  1449  err_clk_disable:
32fea06ecc2ce7 Hector Martin     2022-12-12  1450  	pm_runtime_put(dev);
46d1fb072e76b1 Sven Peter        2021-08-03  1451  	clk_bulk_disable_unprepare(dart->num_clks, dart->clks);
46d1fb072e76b1 Sven Peter        2021-08-03  1452  
46d1fb072e76b1 Sven Peter        2021-08-03  1453  	return ret;
46d1fb072e76b1 Sven Peter        2021-08-03  1454  }
46d1fb072e76b1 Sven Peter        2021-08-03  1455  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
