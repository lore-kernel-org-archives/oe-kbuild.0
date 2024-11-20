Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600EFAD27
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Nov 2024 13:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732110657; cv=none; b=FQc4Q59dk/MCgubZ/6BS2Nh84RA1GS+7/2NRofjlhziTIrAM9RCrXm+gypM+LOmcOPkZXw/NjqQYH1JVlqr0dHWAk3F3noryhpnGAFFLP75lAlSNbayv5WJSe4PZcZItkQHatAdc3VPJARhrpdaJTxWJsj+xf6dDK5VLPNmeGZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732110657; c=relaxed/simple;
	bh=S+eUI/WQ2n7rv6AOpwOLmNfPyb8qXg2CyXP69/KKdmg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VOZfzCUL23pLvFxNTf7aA8Vds1MTNmUPw5NSsvrDpd4TMCYC+QI3T5JakXmt/JMvxW1VnWCgI7WqddEuqbpQdJdVoN4olMkMQa4r9UAjV0dQK1mgaGSJKv+8JcG9JAlBbtH++sLao9YjTrwB7QWUE1RiemDAE0qwoJ40Ac2nFoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eG1js0sR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eG1js0sR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732110655; x=1763646655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S+eUI/WQ2n7rv6AOpwOLmNfPyb8qXg2CyXP69/KKdmg=;
  b=eG1js0sR5nBrx3C3KJ5h7cNoxyaI2rIear2jhiYIPLdzV22zZXupEUjr
   a0RUN0tp2Rx7ahG820vFsbxfIxC61X4mMpqCEnNzB697JHO0N8r/dBAAB
   6K7CyA5H0x/kf76gijwfQDEEr8UJefqp2pT8z7JdxCFn6Fq/azVnq0Bm1
   DAnHlei+jqW/P8OrvzuqwiZ3kelIB74o3VB5oexl/SPyHiYmawfTWBQnQ
   oYFmH9dMMiq3dtFjda547HHLSJxdI7s/Bft1C1gLNybi2CY90udam6+8W
   4p/c8P4K+7AIHEAjsIbKImmVk4ledFiSoQqCwpkQgqKQjAoA3uTn1EXcd
   g==;
X-CSE-ConnectionGUID: s6S4gQDsQSW6MNB7li/4Zw==
X-CSE-MsgGUID: jTm/ah1nSv+yCfwBVcWyYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="43549780"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="43549780"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 05:50:55 -0800
X-CSE-ConnectionGUID: jnhXPqqbSy2Di2Jjzbq/ZQ==
X-CSE-MsgGUID: /tDmrtSfS5mSQGWICXdvjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="120771074"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Nov 2024 05:50:54 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDl6Z-0000u5-1m;
	Wed, 20 Nov 2024 13:50:51 +0000
Date: Wed, 20 Nov 2024 21:50:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/hwtracing/coresight/coresight-stm.c:921 __stm_probe() warn:
 'drvdata->atclk' from clk_prepare_enable() not released on lines:
 843,848,854,859,872,883,921.
Message-ID: <202411202106.U6qG5VJ9-lkp@intel.com>
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
TO: Anshuman Khandual <anshuman.khandual@arm.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>
CC: James Clark <james.clark@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bf9aa14fc523d2763fc9a10672a709224e8fcaf4
commit: 057256aaacc862356417a75ceeb1cfa41408dbf0 coresight: stm: Move ACPI support from AMBA driver to platform driver
date:   7 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-r073-20241119 (https://download.01.org/0day-ci/archive/20241120/202411202106.U6qG5VJ9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411202106.U6qG5VJ9-lkp@intel.com/

New smatch warnings:
drivers/hwtracing/coresight/coresight-stm.c:921 __stm_probe() warn: 'drvdata->atclk' from clk_prepare_enable() not released on lines: 843,848,854,859,872,883,921.

Old smatch warnings:
drivers/hwtracing/coresight/coresight-stm.c:334 stm_generic_link() warn: can 'drvdata' even be NULL?
drivers/hwtracing/coresight/coresight-stm.c:345 stm_generic_unlink() warn: can 'drvdata' even be NULL?
drivers/hwtracing/coresight/coresight-stm.c:376 stm_generic_set_options() warn: can 'drvdata' even be NULL?
drivers/hwtracing/coresight/coresight-stm.c:411 stm_generic_packet() warn: can 'drvdata' even be NULL?

vim +921 drivers/hwtracing/coresight/coresight-stm.c

852e9a32058a73 Anshuman Khandual  2024-03-14  816  
057256aaacc862 Anshuman Khandual  2024-03-14  817  static int __stm_probe(struct device *dev, struct resource *res)
237483aa5cf431 Pratik Patel       2016-05-03  818  {
8d1091c785e159 Mike Leach         2023-01-16  819  	int ret, trace_id;
237483aa5cf431 Pratik Patel       2016-05-03  820  	void __iomem *base;
237483aa5cf431 Pratik Patel       2016-05-03  821  	struct coresight_platform_data *pdata = NULL;
237483aa5cf431 Pratik Patel       2016-05-03  822  	struct stm_drvdata *drvdata;
237483aa5cf431 Pratik Patel       2016-05-03  823  	struct resource ch_res;
9486295ad159fa Suzuki K Poulose   2016-08-25  824  	struct coresight_desc desc = { 0 };
237483aa5cf431 Pratik Patel       2016-05-03  825  
0f5f9b6ba9e1a7 Suzuki K Poulose   2019-06-19  826  	desc.name = coresight_alloc_device_name(&stm_devs, dev);
0f5f9b6ba9e1a7 Suzuki K Poulose   2019-06-19  827  	if (!desc.name)
0f5f9b6ba9e1a7 Suzuki K Poulose   2019-06-19  828  		return -ENOMEM;
0f5f9b6ba9e1a7 Suzuki K Poulose   2019-06-19  829  
237483aa5cf431 Pratik Patel       2016-05-03  830  	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
237483aa5cf431 Pratik Patel       2016-05-03  831  	if (!drvdata)
237483aa5cf431 Pratik Patel       2016-05-03  832  		return -ENOMEM;
237483aa5cf431 Pratik Patel       2016-05-03  833  
057256aaacc862 Anshuman Khandual  2024-03-14  834  	drvdata->atclk = devm_clk_get(dev, "atclk"); /* optional */
237483aa5cf431 Pratik Patel       2016-05-03  835  	if (!IS_ERR(drvdata->atclk)) {
237483aa5cf431 Pratik Patel       2016-05-03  836  		ret = clk_prepare_enable(drvdata->atclk);
237483aa5cf431 Pratik Patel       2016-05-03  837  		if (ret)
237483aa5cf431 Pratik Patel       2016-05-03  838  			return ret;
237483aa5cf431 Pratik Patel       2016-05-03  839  	}
057256aaacc862 Anshuman Khandual  2024-03-14  840  
057256aaacc862 Anshuman Khandual  2024-03-14  841  	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
057256aaacc862 Anshuman Khandual  2024-03-14  842  	if (IS_ERR(drvdata->pclk))
057256aaacc862 Anshuman Khandual  2024-03-14  843  		return -ENODEV;
237483aa5cf431 Pratik Patel       2016-05-03  844  	dev_set_drvdata(dev, drvdata);
237483aa5cf431 Pratik Patel       2016-05-03  845  
237483aa5cf431 Pratik Patel       2016-05-03  846  	base = devm_ioremap_resource(dev, res);
237483aa5cf431 Pratik Patel       2016-05-03  847  	if (IS_ERR(base))
237483aa5cf431 Pratik Patel       2016-05-03  848  		return PTR_ERR(base);
237483aa5cf431 Pratik Patel       2016-05-03  849  	drvdata->base = base;
6e736c60a9fe90 Suzuki K Poulose   2021-02-01  850  	desc.access = CSDEV_ACCESS_IOMEM(base);
237483aa5cf431 Pratik Patel       2016-05-03  851  
18e46e1109b41a Suzuki K Poulose   2019-06-19  852  	ret = stm_get_stimulus_area(dev, &ch_res);
237483aa5cf431 Pratik Patel       2016-05-03  853  	if (ret)
237483aa5cf431 Pratik Patel       2016-05-03  854  		return ret;
f3864d85624a80 Chunyan Zhang      2016-08-25  855  	drvdata->chs.phys = ch_res.start;
237483aa5cf431 Pratik Patel       2016-05-03  856  
237483aa5cf431 Pratik Patel       2016-05-03  857  	base = devm_ioremap_resource(dev, &ch_res);
237483aa5cf431 Pratik Patel       2016-05-03  858  	if (IS_ERR(base))
237483aa5cf431 Pratik Patel       2016-05-03  859  		return PTR_ERR(base);
237483aa5cf431 Pratik Patel       2016-05-03  860  	drvdata->chs.base = base;
237483aa5cf431 Pratik Patel       2016-05-03  861  
237483aa5cf431 Pratik Patel       2016-05-03  862  	drvdata->write_bytes = stm_fundamental_data_size(drvdata);
237483aa5cf431 Pratik Patel       2016-05-03  863  
a7325a6ca45f6a YueHaibing         2019-02-05  864  	if (boot_nr_channel)
237483aa5cf431 Pratik Patel       2016-05-03  865  		drvdata->numsp = boot_nr_channel;
a7325a6ca45f6a YueHaibing         2019-02-05  866  	else
237483aa5cf431 Pratik Patel       2016-05-03  867  		drvdata->numsp = stm_num_stimulus_port(drvdata);
a7325a6ca45f6a YueHaibing         2019-02-05  868  
934a5dc1546b1c Christophe JAILLET 2021-11-03  869  	drvdata->chs.guaranteed = devm_bitmap_zalloc(dev, drvdata->numsp,
934a5dc1546b1c Christophe JAILLET 2021-11-03  870  						     GFP_KERNEL);
934a5dc1546b1c Christophe JAILLET 2021-11-03  871  	if (!drvdata->chs.guaranteed)
237483aa5cf431 Pratik Patel       2016-05-03  872  		return -ENOMEM;
237483aa5cf431 Pratik Patel       2016-05-03  873  
237483aa5cf431 Pratik Patel       2016-05-03  874  	spin_lock_init(&drvdata->spinlock);
237483aa5cf431 Pratik Patel       2016-05-03  875  
237483aa5cf431 Pratik Patel       2016-05-03  876  	stm_init_default_data(drvdata);
0f5f9b6ba9e1a7 Suzuki K Poulose   2019-06-19  877  	stm_init_generic_data(drvdata, desc.name);
237483aa5cf431 Pratik Patel       2016-05-03  878  
237483aa5cf431 Pratik Patel       2016-05-03  879  	if (stm_register_device(dev, &drvdata->stm, THIS_MODULE)) {
237483aa5cf431 Pratik Patel       2016-05-03  880  		dev_info(dev,
0f5f9b6ba9e1a7 Suzuki K Poulose   2019-06-19  881  			 "%s : stm_register_device failed, probing deferred\n",
0f5f9b6ba9e1a7 Suzuki K Poulose   2019-06-19  882  			 desc.name);
237483aa5cf431 Pratik Patel       2016-05-03  883  		return -EPROBE_DEFER;
237483aa5cf431 Pratik Patel       2016-05-03  884  	}
237483aa5cf431 Pratik Patel       2016-05-03  885  
af7cfd0f80d7cf Suzuki K Poulose   2019-06-19  886  	pdata = coresight_get_platform_data(dev);
af7cfd0f80d7cf Suzuki K Poulose   2019-06-19  887  	if (IS_ERR(pdata)) {
af7cfd0f80d7cf Suzuki K Poulose   2019-06-19  888  		ret = PTR_ERR(pdata);
af7cfd0f80d7cf Suzuki K Poulose   2019-06-19  889  		goto stm_unregister;
af7cfd0f80d7cf Suzuki K Poulose   2019-06-19  890  	}
057256aaacc862 Anshuman Khandual  2024-03-14  891  	dev->platform_data = pdata;
af7cfd0f80d7cf Suzuki K Poulose   2019-06-19  892  
9486295ad159fa Suzuki K Poulose   2016-08-25  893  	desc.type = CORESIGHT_DEV_TYPE_SOURCE;
9486295ad159fa Suzuki K Poulose   2016-08-25  894  	desc.subtype.source_subtype = CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE;
9486295ad159fa Suzuki K Poulose   2016-08-25  895  	desc.ops = &stm_cs_ops;
9486295ad159fa Suzuki K Poulose   2016-08-25  896  	desc.pdata = pdata;
9486295ad159fa Suzuki K Poulose   2016-08-25  897  	desc.dev = dev;
9486295ad159fa Suzuki K Poulose   2016-08-25  898  	desc.groups = coresight_stm_groups;
9486295ad159fa Suzuki K Poulose   2016-08-25  899  	drvdata->csdev = coresight_register(&desc);
237483aa5cf431 Pratik Patel       2016-05-03  900  	if (IS_ERR(drvdata->csdev)) {
237483aa5cf431 Pratik Patel       2016-05-03  901  		ret = PTR_ERR(drvdata->csdev);
237483aa5cf431 Pratik Patel       2016-05-03  902  		goto stm_unregister;
237483aa5cf431 Pratik Patel       2016-05-03  903  	}
237483aa5cf431 Pratik Patel       2016-05-03  904  
8d1091c785e159 Mike Leach         2023-01-16  905  	trace_id = coresight_trace_id_get_system_id();
8d1091c785e159 Mike Leach         2023-01-16  906  	if (trace_id < 0) {
8d1091c785e159 Mike Leach         2023-01-16  907  		ret = trace_id;
8d1091c785e159 Mike Leach         2023-01-16  908  		goto cs_unregister;
8d1091c785e159 Mike Leach         2023-01-16  909  	}
8d1091c785e159 Mike Leach         2023-01-16  910  	drvdata->traceid = (u8)trace_id;
8d1091c785e159 Mike Leach         2023-01-16  911  
ec62db1b2f18c2 Suzuki K Poulose   2019-06-19  912  	dev_info(&drvdata->csdev->dev, "%s initialized\n",
852e9a32058a73 Anshuman Khandual  2024-03-14  913  		 stm_csdev_name(drvdata->csdev));
237483aa5cf431 Pratik Patel       2016-05-03  914  	return 0;
237483aa5cf431 Pratik Patel       2016-05-03  915  
8d1091c785e159 Mike Leach         2023-01-16  916  cs_unregister:
8d1091c785e159 Mike Leach         2023-01-16  917  	coresight_unregister(drvdata->csdev);
8d1091c785e159 Mike Leach         2023-01-16  918  
237483aa5cf431 Pratik Patel       2016-05-03  919  stm_unregister:
237483aa5cf431 Pratik Patel       2016-05-03  920  	stm_unregister_device(&drvdata->stm);
237483aa5cf431 Pratik Patel       2016-05-03 @921  	return ret;
237483aa5cf431 Pratik Patel       2016-05-03  922  }
237483aa5cf431 Pratik Patel       2016-05-03  923  

:::::: The code at line 921 was first introduced by commit
:::::: 237483aa5cf43105d148d3f03b29eed47c3e6cf9 coresight: stm: adding driver for CoreSight STM component

:::::: TO: Pratik Patel <pratikp@codeaurora.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
