Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E739B313551
	for <oe-kbuild@lists.linux.dev>; Sun, 10 May 2026 14:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778424028; cv=none; b=hSjaM2JrVRvMCsfh8QQyTHwrwlg3OJQpa82cQp946x3DzoWwsiix8OPLt12Y8pqcDlbHVZQUCoOazjqMgy6XdMrxQBfTb1+W4NUXXGVBVkMTtyHjKz8OqqqAgtPk+fqNpAeQoEFi5QhaxCNUd8FM3angos9ZewAXquzJv5jUWUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778424028; c=relaxed/simple;
	bh=W0VLAyaMYkkMSSVpRMhbU6LW8gBJROjED+szsYyxC2s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DxBH45C2T+kYTaCv+hpSA0PJLFyatsrqHAtDhFvPrc7TMw4GWgzqwVTgoE/5e8Fig2v4SuBlMEbObihEs++EuAzni6DYBRPQo7CV+lho6kprFmJyF+ICrHVKponzj/b8Q5L3miOEKtID+h5FxBD8iT0Q4+smu38bc6M2P4DiE6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KJhOHaS0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJhOHaS0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778424026; x=1809960026;
  h=date:from:to:cc:subject:message-id;
  bh=W0VLAyaMYkkMSSVpRMhbU6LW8gBJROjED+szsYyxC2s=;
  b=KJhOHaS0PyxpjchCHswuJv7UicOtmnzITRMMkECEy6jBVazt8kJZuCSK
   BN2BnWpARcfJdgYMlZQ2Rgwn4+dcEmnv44b112SIOyLO4HIw1NnQ7t1hI
   PhY5DfxpW0rftRWAWEHZML8YbSk43YANJ4FcC2sCLVo2Nc7UbDGbFEoNS
   NPtLYDktnD8DAtG2ZJh4CXf+6QYsRHtDQfsBZnE5YfzDcrqB6Ib3VZ9Ri
   QuoDqUmjLEWYKTnUlArDceAAYROFjrQoMb69ENFwiXPA5y3V/coyOA8sA
   2l6gVfPCGaNYs/7DugSR6ZaUbGhwg1GqJ1OA16EChQ/B9ep+NjwMlimFK
   Q==;
X-CSE-ConnectionGUID: HZ9ZAU3eSJiGFGnz48b3eQ==
X-CSE-MsgGUID: UXIeI7eITYapMLuVj2op6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="90030343"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="90030343"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 07:40:25 -0700
X-CSE-ConnectionGUID: 5YrUxvc0Qbe9b5fpAaUP4A==
X-CSE-MsgGUID: KVp4LomKQ0aDumawNaxq8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="267593735"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 May 2026 07:40:23 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wM5KP-000000002JT-2Fr3;
	Sun, 10 May 2026 14:40:21 +0000
Date: Sun, 10 May 2026 22:40:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [asahilinux:bits/020-dart 4/20]
 drivers/iommu/apple-dart.c:1236 apple_dart_probe() warn: missing error code
 'ret'
Message-ID: <202605102224.vlvlpsIR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/020-dart
head:   1fe2c37040cfeced8a9d0161c2d7093cf8c9c1d0
commit: 66bff25252bfad1ee4298c3c998404e8f92f19e8 [4/20] iommu: apple-dart: Support specifying the DMA aperture in the DT
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: um-randconfig-r072-20260509 (https://download.01.org/0day-ci/archive/20260510/202605102224.vlvlpsIR-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605102224.vlvlpsIR-lkp@intel.com/

smatch warnings:
drivers/iommu/apple-dart.c:1236 apple_dart_probe() warn: missing error code 'ret'

vim +/ret +1236 drivers/iommu/apple-dart.c

206b3243aaa8bc Asahi Lina      2023-09-29  1151  
46d1fb072e76b1 Sven Peter      2021-08-03  1152  static int apple_dart_probe(struct platform_device *pdev)
46d1fb072e76b1 Sven Peter      2021-08-03  1153  {
46d1fb072e76b1 Sven Peter      2021-08-03  1154  	int ret;
d8bcc870d99d7e Hector Martin   2023-01-13  1155  	u32 dart_params[4];
46d1fb072e76b1 Sven Peter      2021-08-03  1156  	struct resource *res;
46d1fb072e76b1 Sven Peter      2021-08-03  1157  	struct apple_dart *dart;
46d1fb072e76b1 Sven Peter      2021-08-03  1158  	struct device *dev = &pdev->dev;
66bff25252bfad Hector Martin   2023-04-11  1159  	u64 dma_range[2];
46d1fb072e76b1 Sven Peter      2021-08-03  1160  
46d1fb072e76b1 Sven Peter      2021-08-03  1161  	dart = devm_kzalloc(dev, sizeof(*dart), GFP_KERNEL);
46d1fb072e76b1 Sven Peter      2021-08-03  1162  	if (!dart)
46d1fb072e76b1 Sven Peter      2021-08-03  1163  		return -ENOMEM;
46d1fb072e76b1 Sven Peter      2021-08-03  1164  
46d1fb072e76b1 Sven Peter      2021-08-03  1165  	dart->dev = dev;
a380b8dcf22ccb Sven Peter      2022-09-16  1166  	dart->hw = of_device_get_match_data(dev);
46d1fb072e76b1 Sven Peter      2021-08-03  1167  	spin_lock_init(&dart->lock);
46d1fb072e76b1 Sven Peter      2021-08-03  1168  
a15932f4377062 Yang Yingliang  2022-04-25  1169  	dart->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
a15932f4377062 Yang Yingliang  2022-04-25  1170  	if (IS_ERR(dart->regs))
a15932f4377062 Yang Yingliang  2022-04-25  1171  		return PTR_ERR(dart->regs);
a15932f4377062 Yang Yingliang  2022-04-25  1172  
46d1fb072e76b1 Sven Peter      2021-08-03  1173  	if (resource_size(res) < 0x4000) {
46d1fb072e76b1 Sven Peter      2021-08-03  1174  		dev_err(dev, "MMIO region too small (%pr)\n", res);
46d1fb072e76b1 Sven Peter      2021-08-03  1175  		return -EINVAL;
46d1fb072e76b1 Sven Peter      2021-08-03  1176  	}
46d1fb072e76b1 Sven Peter      2021-08-03  1177  
46d1fb072e76b1 Sven Peter      2021-08-03  1178  	dart->irq = platform_get_irq(pdev, 0);
46d1fb072e76b1 Sven Peter      2021-08-03  1179  	if (dart->irq < 0)
46d1fb072e76b1 Sven Peter      2021-08-03  1180  		return -ENODEV;
46d1fb072e76b1 Sven Peter      2021-08-03  1181  
46d1fb072e76b1 Sven Peter      2021-08-03  1182  	ret = devm_clk_bulk_get_all(dev, &dart->clks);
46d1fb072e76b1 Sven Peter      2021-08-03  1183  	if (ret < 0)
46d1fb072e76b1 Sven Peter      2021-08-03  1184  		return ret;
46d1fb072e76b1 Sven Peter      2021-08-03  1185  	dart->num_clks = ret;
46d1fb072e76b1 Sven Peter      2021-08-03  1186  
46d1fb072e76b1 Sven Peter      2021-08-03  1187  	ret = clk_bulk_prepare_enable(dart->num_clks, dart->clks);
46d1fb072e76b1 Sven Peter      2021-08-03  1188  	if (ret)
46d1fb072e76b1 Sven Peter      2021-08-03  1189  		return ret;
46d1fb072e76b1 Sven Peter      2021-08-03  1190  
00751168c3b96e Hector Martin   2022-12-12  1191  	pm_runtime_get_noresume(dev);
00751168c3b96e Hector Martin   2022-12-12  1192  	pm_runtime_set_active(dev);
00751168c3b96e Hector Martin   2022-12-12  1193  	pm_runtime_irq_safe(dev);
00751168c3b96e Hector Martin   2022-12-12  1194  
00751168c3b96e Hector Martin   2022-12-12  1195  	ret = devm_pm_runtime_enable(dev);
00751168c3b96e Hector Martin   2022-12-12  1196  	if (ret)
00751168c3b96e Hector Martin   2022-12-12  1197  		goto err_clk_disable;
00751168c3b96e Hector Martin   2022-12-12  1198  
46d1fb072e76b1 Sven Peter      2021-08-03  1199  	dart_params[0] = readl(dart->regs + DART_PARAMS1);
46d1fb072e76b1 Sven Peter      2021-08-03  1200  	dart_params[1] = readl(dart->regs + DART_PARAMS2);
a772a02c18342b Hector Martin   2023-01-13  1201  	dart->pgsize = 1 << FIELD_GET(DART_PARAMS1_PAGE_SHIFT, dart_params[0]);
a772a02c18342b Hector Martin   2023-01-13  1202  	dart->supports_bypass = dart_params[1] & DART_PARAMS2_BYPASS_SUPPORT;
510d4072df7fcf Hector Martin   2023-01-13  1203  
d8bcc870d99d7e Hector Martin   2023-01-13  1204  	switch (dart->hw->type) {
d8bcc870d99d7e Hector Martin   2023-01-13  1205  	case DART_T8020:
d8bcc870d99d7e Hector Martin   2023-01-13  1206  	case DART_T6000:
d8bcc870d99d7e Hector Martin   2023-01-13  1207  		dart->ias = 32;
d8bcc870d99d7e Hector Martin   2023-01-13  1208  		dart->oas = dart->hw->oas;
510d4072df7fcf Hector Martin   2023-01-13  1209  		dart->num_streams = dart->hw->max_sid_count;
d8bcc870d99d7e Hector Martin   2023-01-13  1210  		break;
d8bcc870d99d7e Hector Martin   2023-01-13  1211  
d8bcc870d99d7e Hector Martin   2023-01-13  1212  	case DART_T8110:
d8bcc870d99d7e Hector Martin   2023-01-13  1213  		dart_params[2] = readl(dart->regs + DART_T8110_PARAMS3);
d8bcc870d99d7e Hector Martin   2023-01-13  1214  		dart_params[3] = readl(dart->regs + DART_T8110_PARAMS4);
d8bcc870d99d7e Hector Martin   2023-01-13  1215  		dart->ias = FIELD_GET(DART_T8110_PARAMS3_VA_WIDTH, dart_params[2]);
d8bcc870d99d7e Hector Martin   2023-01-13  1216  		dart->oas = FIELD_GET(DART_T8110_PARAMS3_PA_WIDTH, dart_params[2]);
d8bcc870d99d7e Hector Martin   2023-01-13  1217  		dart->num_streams = FIELD_GET(DART_T8110_PARAMS4_NUM_SIDS, dart_params[3]);
5229bd5f9e3dbc Hector Martin   2025-08-21  1218  		dart->four_level = dart->ias > 36;
d8bcc870d99d7e Hector Martin   2023-01-13  1219  		break;
d8bcc870d99d7e Hector Martin   2023-01-13  1220  	}
510d4072df7fcf Hector Martin   2023-01-13  1221  
66bff25252bfad Hector Martin   2023-04-11  1222  	dart->dma_min = 0;
66bff25252bfad Hector Martin   2023-04-11  1223  	dart->dma_max = DMA_BIT_MASK(dart->ias);
66bff25252bfad Hector Martin   2023-04-11  1224  
66bff25252bfad Hector Martin   2023-04-11  1225  	ret = of_property_read_u64_array(dev->of_node, "apple,dma-range", dma_range, 2);
66bff25252bfad Hector Martin   2023-04-11  1226  	if (ret == -EINVAL) {
66bff25252bfad Hector Martin   2023-04-11  1227  		ret = 0;
66bff25252bfad Hector Martin   2023-04-11  1228  	} else if (ret) {
66bff25252bfad Hector Martin   2023-04-11  1229  		goto err_clk_disable;
66bff25252bfad Hector Martin   2023-04-11  1230  	} else {
66bff25252bfad Hector Martin   2023-04-11  1231  		dart->dma_min = dma_range[0];
66bff25252bfad Hector Martin   2023-04-11  1232  		dart->dma_max = dma_range[0] + dma_range[1] - 1;
66bff25252bfad Hector Martin   2023-04-11  1233  		if ((dart->dma_min ^ dart->dma_max) & ~DMA_BIT_MASK(dart->ias)) {
66bff25252bfad Hector Martin   2023-04-11  1234  			dev_err(&pdev->dev, "Invalid DMA range for ias=%d\n",
66bff25252bfad Hector Martin   2023-04-11  1235  				dart->ias);
66bff25252bfad Hector Martin   2023-04-11 @1236  			goto err_clk_disable;
66bff25252bfad Hector Martin   2023-04-11  1237  		}
66bff25252bfad Hector Martin   2023-04-11  1238  		dev_info(&pdev->dev, "Limiting DMA range to %pad..%pad\n",
66bff25252bfad Hector Martin   2023-04-11  1239  			 &dart->dma_min, &dart->dma_max);
66bff25252bfad Hector Martin   2023-04-11  1240  	}
66bff25252bfad Hector Martin   2023-04-11  1241  
510d4072df7fcf Hector Martin   2023-01-13  1242  	if (dart->num_streams > DART_MAX_STREAMS) {
510d4072df7fcf Hector Martin   2023-01-13  1243  		dev_err(&pdev->dev, "Too many streams (%d > %d)\n",
510d4072df7fcf Hector Martin   2023-01-13  1244  			dart->num_streams, DART_MAX_STREAMS);
510d4072df7fcf Hector Martin   2023-01-13  1245  		ret = -EINVAL;
510d4072df7fcf Hector Martin   2023-01-13  1246  		goto err_clk_disable;
510d4072df7fcf Hector Martin   2023-01-13  1247  	}
510d4072df7fcf Hector Martin   2023-01-13  1248  
510d4072df7fcf Hector Martin   2023-01-13  1249  	ret = apple_dart_hw_reset(dart);
510d4072df7fcf Hector Martin   2023-01-13  1250  	if (ret)
510d4072df7fcf Hector Martin   2023-01-13  1251  		goto err_clk_disable;
510d4072df7fcf Hector Martin   2023-01-13  1252  
206b3243aaa8bc Asahi Lina      2023-09-29  1253  	ret = request_irq(dart->irq, apple_dart_irq, IRQF_SHARED,
46d1fb072e76b1 Sven Peter      2021-08-03  1254  			  "apple-dart fault handler", dart);
46d1fb072e76b1 Sven Peter      2021-08-03  1255  	if (ret)
46d1fb072e76b1 Sven Peter      2021-08-03  1256  		goto err_clk_disable;
46d1fb072e76b1 Sven Peter      2021-08-03  1257  
46d1fb072e76b1 Sven Peter      2021-08-03  1258  	platform_set_drvdata(pdev, dart);
46d1fb072e76b1 Sven Peter      2021-08-03  1259  
46d1fb072e76b1 Sven Peter      2021-08-03  1260  	ret = iommu_device_sysfs_add(&dart->iommu, dev, NULL, "apple-dart.%s",
46d1fb072e76b1 Sven Peter      2021-08-03  1261  				     dev_name(&pdev->dev));
46d1fb072e76b1 Sven Peter      2021-08-03  1262  	if (ret)
006abbe36acdac Robin Murphy    2022-08-15  1263  		goto err_free_irq;
46d1fb072e76b1 Sven Peter      2021-08-03  1264  
46d1fb072e76b1 Sven Peter      2021-08-03  1265  	ret = iommu_device_register(&dart->iommu, &apple_dart_iommu_ops, dev);
46d1fb072e76b1 Sven Peter      2021-08-03  1266  	if (ret)
46d1fb072e76b1 Sven Peter      2021-08-03  1267  		goto err_sysfs_remove;
46d1fb072e76b1 Sven Peter      2021-08-03  1268  
00751168c3b96e Hector Martin   2022-12-12  1269  	pm_runtime_put(dev);
00751168c3b96e Hector Martin   2022-12-12  1270  
46d1fb072e76b1 Sven Peter      2021-08-03  1271  	dev_info(
46d1fb072e76b1 Sven Peter      2021-08-03  1272  		&pdev->dev,
5229bd5f9e3dbc Hector Martin   2025-08-21  1273  		"DART [pagesize %x, %d streams, bypass support: %d, bypass forced: %d, AS %d -> %d] initialized\n",
bbc70e0aec287e Jason Gunthorpe 2023-09-27  1274  		dart->pgsize, dart->num_streams, dart->supports_bypass,
5229bd5f9e3dbc Hector Martin   2025-08-21  1275  		dart->pgsize > PAGE_SIZE, dart->ias, dart->oas);
46d1fb072e76b1 Sven Peter      2021-08-03  1276  	return 0;
46d1fb072e76b1 Sven Peter      2021-08-03  1277  
46d1fb072e76b1 Sven Peter      2021-08-03  1278  err_sysfs_remove:
46d1fb072e76b1 Sven Peter      2021-08-03  1279  	iommu_device_sysfs_remove(&dart->iommu);
46d1fb072e76b1 Sven Peter      2021-08-03  1280  err_free_irq:
46d1fb072e76b1 Sven Peter      2021-08-03  1281  	free_irq(dart->irq, dart);
46d1fb072e76b1 Sven Peter      2021-08-03  1282  err_clk_disable:
00751168c3b96e Hector Martin   2022-12-12  1283  	pm_runtime_put(dev);
46d1fb072e76b1 Sven Peter      2021-08-03  1284  	clk_bulk_disable_unprepare(dart->num_clks, dart->clks);
46d1fb072e76b1 Sven Peter      2021-08-03  1285  
46d1fb072e76b1 Sven Peter      2021-08-03  1286  	return ret;
46d1fb072e76b1 Sven Peter      2021-08-03  1287  }
46d1fb072e76b1 Sven Peter      2021-08-03  1288  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
