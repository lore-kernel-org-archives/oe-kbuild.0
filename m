Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B712639FD8
	for <oe-kbuild@lists.linux.dev>; Mon, 13 May 2024 21:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715637421; cv=none; b=HtE9zv1edbxCmYUIDlq5y7Zkpaavbd87VoQXM8iwgUdzO4FvxK1vgXxtyFHkouRuUNpFT8K9Mf+DgfToRRzL6bcJjYtl0NjAy6NbChXyzPuj4+twW2wrXnVjeQ9avXTivPzyJaXmiUvIHrs2WlVWgEnwUjiu43+M7OYR+KK1ImM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715637421; c=relaxed/simple;
	bh=lVC7k4O+UG5xJd9V/Cw+eUWizAlQIcRIBCPxoNGRmbY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EL3QHuk3Pq2S43xvK2OVx4SGX1S0WmLdUa8FOemih4SV/tlMXShBPT68p1iDVlrzx9/EfeatHxnZGGM6BRTd9C9X48g+r1YvKHIbiLtNV8mb7WuHc60s71UxBfAUuHIj3RSqJdHO7DzmdU7hFW2AgDPMTP2Pe+2qzERh0RTgJZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lFpWnOtr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lFpWnOtr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715637419; x=1747173419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lVC7k4O+UG5xJd9V/Cw+eUWizAlQIcRIBCPxoNGRmbY=;
  b=lFpWnOtrxR0wbQLg9fqHkvn+ZVi0yJBVOpsEgeO0UCIUe6JNXkM4MszD
   9rbOstcoZeJtP05XkHsiB8AYu7c6zVNXpKLKZx4RpKTCo5O0ocvGy54VH
   wGvfVP+zN2NiCLVSHrdH3ZwfWlbFJO5sg24as5ssjxjvOHEaZe5tLhdjS
   Airn9ykQQglB8KFLYNGh7wdBVP9UtGx+F5AVO7P9Rych3SL+w6Dx8ihKy
   NPQGo2OaW2PBr4kxoQv3nxmSVXmVJMJuv0QO3YsC3v7YEY4dPXTg48gSn
   3H8JWUj4ti5gbLy6bA5GTfzqSkP+N36KRLFE8A8MHQxmn8GFh6zC5+sBc
   w==;
X-CSE-ConnectionGUID: 90O0YeQaRzOTBekiUi02sw==
X-CSE-MsgGUID: g/dU03ggREur/vVXbx3X6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="29085555"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="29085555"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 14:56:58 -0700
X-CSE-ConnectionGUID: 17YlX5HbTf+1WEmlJiksRg==
X-CSE-MsgGUID: VrddgvA0RZGGvmP56KqEdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="53668925"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 May 2024 14:56:56 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6dfB-000AjL-2Y;
	Mon, 13 May 2024 21:56:53 +0000
Date: Tue, 14 May 2024 05:55:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5083/12793]
 drivers/hwtracing/coresight/coresight-stm.c:921 __stm_probe() warn:
 'drvdata->atclk' from clk_prepare_enable() not released on lines:
 843,848,854,859,872,883,921.
Message-ID: <202405140527.SWAN8lhi-lkp@intel.com>
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
TO: Anshuman Khandual <anshuman.khandual@arm.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>
CC: James Clark <james.clark@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6ba6c795dc73c22ce2c86006f17c4aa802db2a60
commit: 057256aaacc862356417a75ceeb1cfa41408dbf0 [5083/12793] coresight: stm: Move ACPI support from AMBA driver to platform driver
:::::: branch date: 15 hours ago
:::::: commit date: 4 weeks ago
config: arm-randconfig-r081-20240513 (https://download.01.org/0day-ci/archive/20240514/202405140527.SWAN8lhi-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405140527.SWAN8lhi-lkp@intel.com/

New smatch warnings:
drivers/hwtracing/coresight/coresight-stm.c:921 __stm_probe() warn: 'drvdata->atclk' from clk_prepare_enable() not released on lines: 843,848,854,859,872,883,921.

Old smatch warnings:
drivers/hwtracing/coresight/coresight-stm.c:334 stm_generic_link() warn: can 'drvdata' even be NULL?
drivers/hwtracing/coresight/coresight-stm.c:345 stm_generic_unlink() warn: can 'drvdata' even be NULL?
drivers/hwtracing/coresight/coresight-stm.c:376 stm_generic_set_options() warn: can 'drvdata' even be NULL?
drivers/hwtracing/coresight/coresight-stm.c:411 stm_generic_packet() warn: can 'drvdata' even be NULL?

vim +921 drivers/hwtracing/coresight/coresight-stm.c

852e9a32058a737 Anshuman Khandual  2024-03-14  816  
057256aaacc8623 Anshuman Khandual  2024-03-14  817  static int __stm_probe(struct device *dev, struct resource *res)
237483aa5cf4310 Pratik Patel       2016-05-03  818  {
8d1091c785e1599 Mike Leach         2023-01-16  819  	int ret, trace_id;
237483aa5cf4310 Pratik Patel       2016-05-03  820  	void __iomem *base;
237483aa5cf4310 Pratik Patel       2016-05-03  821  	struct coresight_platform_data *pdata = NULL;
237483aa5cf4310 Pratik Patel       2016-05-03  822  	struct stm_drvdata *drvdata;
237483aa5cf4310 Pratik Patel       2016-05-03  823  	struct resource ch_res;
9486295ad159fac Suzuki K Poulose   2016-08-25  824  	struct coresight_desc desc = { 0 };
237483aa5cf4310 Pratik Patel       2016-05-03  825  
0f5f9b6ba9e1a70 Suzuki K Poulose   2019-06-19  826  	desc.name = coresight_alloc_device_name(&stm_devs, dev);
0f5f9b6ba9e1a70 Suzuki K Poulose   2019-06-19  827  	if (!desc.name)
0f5f9b6ba9e1a70 Suzuki K Poulose   2019-06-19  828  		return -ENOMEM;
0f5f9b6ba9e1a70 Suzuki K Poulose   2019-06-19  829  
237483aa5cf4310 Pratik Patel       2016-05-03  830  	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
237483aa5cf4310 Pratik Patel       2016-05-03  831  	if (!drvdata)
237483aa5cf4310 Pratik Patel       2016-05-03  832  		return -ENOMEM;
237483aa5cf4310 Pratik Patel       2016-05-03  833  
057256aaacc8623 Anshuman Khandual  2024-03-14  834  	drvdata->atclk = devm_clk_get(dev, "atclk"); /* optional */
237483aa5cf4310 Pratik Patel       2016-05-03  835  	if (!IS_ERR(drvdata->atclk)) {
237483aa5cf4310 Pratik Patel       2016-05-03  836  		ret = clk_prepare_enable(drvdata->atclk);
237483aa5cf4310 Pratik Patel       2016-05-03  837  		if (ret)
237483aa5cf4310 Pratik Patel       2016-05-03  838  			return ret;
237483aa5cf4310 Pratik Patel       2016-05-03  839  	}
057256aaacc8623 Anshuman Khandual  2024-03-14  840  
057256aaacc8623 Anshuman Khandual  2024-03-14  841  	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
057256aaacc8623 Anshuman Khandual  2024-03-14  842  	if (IS_ERR(drvdata->pclk))
057256aaacc8623 Anshuman Khandual  2024-03-14  843  		return -ENODEV;
237483aa5cf4310 Pratik Patel       2016-05-03  844  	dev_set_drvdata(dev, drvdata);
237483aa5cf4310 Pratik Patel       2016-05-03  845  
237483aa5cf4310 Pratik Patel       2016-05-03  846  	base = devm_ioremap_resource(dev, res);
237483aa5cf4310 Pratik Patel       2016-05-03  847  	if (IS_ERR(base))
237483aa5cf4310 Pratik Patel       2016-05-03  848  		return PTR_ERR(base);
237483aa5cf4310 Pratik Patel       2016-05-03  849  	drvdata->base = base;
6e736c60a9fe905 Suzuki K Poulose   2021-02-01  850  	desc.access = CSDEV_ACCESS_IOMEM(base);
237483aa5cf4310 Pratik Patel       2016-05-03  851  
18e46e1109b41a8 Suzuki K Poulose   2019-06-19  852  	ret = stm_get_stimulus_area(dev, &ch_res);
237483aa5cf4310 Pratik Patel       2016-05-03  853  	if (ret)
237483aa5cf4310 Pratik Patel       2016-05-03  854  		return ret;
f3864d85624a802 Chunyan Zhang      2016-08-25  855  	drvdata->chs.phys = ch_res.start;
237483aa5cf4310 Pratik Patel       2016-05-03  856  
237483aa5cf4310 Pratik Patel       2016-05-03  857  	base = devm_ioremap_resource(dev, &ch_res);
237483aa5cf4310 Pratik Patel       2016-05-03  858  	if (IS_ERR(base))
237483aa5cf4310 Pratik Patel       2016-05-03  859  		return PTR_ERR(base);
237483aa5cf4310 Pratik Patel       2016-05-03  860  	drvdata->chs.base = base;
237483aa5cf4310 Pratik Patel       2016-05-03  861  
237483aa5cf4310 Pratik Patel       2016-05-03  862  	drvdata->write_bytes = stm_fundamental_data_size(drvdata);
237483aa5cf4310 Pratik Patel       2016-05-03  863  
a7325a6ca45f6a5 YueHaibing         2019-02-05  864  	if (boot_nr_channel)
237483aa5cf4310 Pratik Patel       2016-05-03  865  		drvdata->numsp = boot_nr_channel;
a7325a6ca45f6a5 YueHaibing         2019-02-05  866  	else
237483aa5cf4310 Pratik Patel       2016-05-03  867  		drvdata->numsp = stm_num_stimulus_port(drvdata);
a7325a6ca45f6a5 YueHaibing         2019-02-05  868  
934a5dc1546b1c6 Christophe JAILLET 2021-11-03  869  	drvdata->chs.guaranteed = devm_bitmap_zalloc(dev, drvdata->numsp,
934a5dc1546b1c6 Christophe JAILLET 2021-11-03  870  						     GFP_KERNEL);
934a5dc1546b1c6 Christophe JAILLET 2021-11-03  871  	if (!drvdata->chs.guaranteed)
237483aa5cf4310 Pratik Patel       2016-05-03  872  		return -ENOMEM;
237483aa5cf4310 Pratik Patel       2016-05-03  873  
237483aa5cf4310 Pratik Patel       2016-05-03  874  	spin_lock_init(&drvdata->spinlock);
237483aa5cf4310 Pratik Patel       2016-05-03  875  
237483aa5cf4310 Pratik Patel       2016-05-03  876  	stm_init_default_data(drvdata);
0f5f9b6ba9e1a70 Suzuki K Poulose   2019-06-19  877  	stm_init_generic_data(drvdata, desc.name);
237483aa5cf4310 Pratik Patel       2016-05-03  878  
237483aa5cf4310 Pratik Patel       2016-05-03  879  	if (stm_register_device(dev, &drvdata->stm, THIS_MODULE)) {
237483aa5cf4310 Pratik Patel       2016-05-03  880  		dev_info(dev,
0f5f9b6ba9e1a70 Suzuki K Poulose   2019-06-19  881  			 "%s : stm_register_device failed, probing deferred\n",
0f5f9b6ba9e1a70 Suzuki K Poulose   2019-06-19  882  			 desc.name);
237483aa5cf4310 Pratik Patel       2016-05-03  883  		return -EPROBE_DEFER;
237483aa5cf4310 Pratik Patel       2016-05-03  884  	}
237483aa5cf4310 Pratik Patel       2016-05-03  885  
af7cfd0f80d7cfb Suzuki K Poulose   2019-06-19  886  	pdata = coresight_get_platform_data(dev);
af7cfd0f80d7cfb Suzuki K Poulose   2019-06-19  887  	if (IS_ERR(pdata)) {
af7cfd0f80d7cfb Suzuki K Poulose   2019-06-19  888  		ret = PTR_ERR(pdata);
af7cfd0f80d7cfb Suzuki K Poulose   2019-06-19  889  		goto stm_unregister;
af7cfd0f80d7cfb Suzuki K Poulose   2019-06-19  890  	}
057256aaacc8623 Anshuman Khandual  2024-03-14  891  	dev->platform_data = pdata;
af7cfd0f80d7cfb Suzuki K Poulose   2019-06-19  892  
9486295ad159fac Suzuki K Poulose   2016-08-25  893  	desc.type = CORESIGHT_DEV_TYPE_SOURCE;
9486295ad159fac Suzuki K Poulose   2016-08-25  894  	desc.subtype.source_subtype = CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE;
9486295ad159fac Suzuki K Poulose   2016-08-25  895  	desc.ops = &stm_cs_ops;
9486295ad159fac Suzuki K Poulose   2016-08-25  896  	desc.pdata = pdata;
9486295ad159fac Suzuki K Poulose   2016-08-25  897  	desc.dev = dev;
9486295ad159fac Suzuki K Poulose   2016-08-25  898  	desc.groups = coresight_stm_groups;
9486295ad159fac Suzuki K Poulose   2016-08-25  899  	drvdata->csdev = coresight_register(&desc);
237483aa5cf4310 Pratik Patel       2016-05-03  900  	if (IS_ERR(drvdata->csdev)) {
237483aa5cf4310 Pratik Patel       2016-05-03  901  		ret = PTR_ERR(drvdata->csdev);
237483aa5cf4310 Pratik Patel       2016-05-03  902  		goto stm_unregister;
237483aa5cf4310 Pratik Patel       2016-05-03  903  	}
237483aa5cf4310 Pratik Patel       2016-05-03  904  
8d1091c785e1599 Mike Leach         2023-01-16  905  	trace_id = coresight_trace_id_get_system_id();
8d1091c785e1599 Mike Leach         2023-01-16  906  	if (trace_id < 0) {
8d1091c785e1599 Mike Leach         2023-01-16  907  		ret = trace_id;
8d1091c785e1599 Mike Leach         2023-01-16  908  		goto cs_unregister;
8d1091c785e1599 Mike Leach         2023-01-16  909  	}
8d1091c785e1599 Mike Leach         2023-01-16  910  	drvdata->traceid = (u8)trace_id;
8d1091c785e1599 Mike Leach         2023-01-16  911  
ec62db1b2f18c2d Suzuki K Poulose   2019-06-19  912  	dev_info(&drvdata->csdev->dev, "%s initialized\n",
852e9a32058a737 Anshuman Khandual  2024-03-14  913  		 stm_csdev_name(drvdata->csdev));
237483aa5cf4310 Pratik Patel       2016-05-03  914  	return 0;
237483aa5cf4310 Pratik Patel       2016-05-03  915  
8d1091c785e1599 Mike Leach         2023-01-16  916  cs_unregister:
8d1091c785e1599 Mike Leach         2023-01-16  917  	coresight_unregister(drvdata->csdev);
8d1091c785e1599 Mike Leach         2023-01-16  918  
237483aa5cf4310 Pratik Patel       2016-05-03  919  stm_unregister:
237483aa5cf4310 Pratik Patel       2016-05-03  920  	stm_unregister_device(&drvdata->stm);
237483aa5cf4310 Pratik Patel       2016-05-03 @921  	return ret;
237483aa5cf4310 Pratik Patel       2016-05-03  922  }
237483aa5cf4310 Pratik Patel       2016-05-03  923  

:::::: The code at line 921 was first introduced by commit
:::::: 237483aa5cf43105d148d3f03b29eed47c3e6cf9 coresight: stm: adding driver for CoreSight STM component

:::::: TO: Pratik Patel <pratikp@codeaurora.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
