Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5893D188722
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Dec 2024 10:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734864474; cv=none; b=W6R8bmGMGH52Os3QbvtDr85O4Ua3XLI8j8jxFMXZYyeFwS1dh8j2IeFOt+lFQaoaUH2X5uGps8pWlY9XNQuMmhBcalxfOyzKSLSuoZhdkYqT1biM1ekGK6atCbAzJeNffL1XxxbwWYS32cR89u54Z0hW0EdmQjMragjh7VCUn3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734864474; c=relaxed/simple;
	bh=7GHVhzALZfHqS5rdFB99aetCrNRl/FjfwICTIiJcPII=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XadV9a8oJOxCFqiFJ0+UvdpHIaYVuoanJxFRoZmeasX/creYS42ZaqUj+6rnXde6GABXbg1xx4UolRAHJsUUAFYBSai3hlT8eM+96MhjuTMS8aoak2ge+vXkusi5K6ZkwmVLngQq/fUwVdU2422/CfbpmD+D/OOAhI6Brw27jec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ALYBhd4H; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ALYBhd4H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734864472; x=1766400472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7GHVhzALZfHqS5rdFB99aetCrNRl/FjfwICTIiJcPII=;
  b=ALYBhd4HZ/YlMQAia+qvixutRYmaQAOQG410rX9vgLcRhNei28L/+Z6d
   rlXXTq46tv84X6WPD+ZM+OdAks+LBvOW+f8Ix6nfjzM1iMF9+3fONN5uh
   VTLdI9E/0tyC8LwS3se9RRgprRndLgWkz12Y1bMaDfmprfMaQMialHMkC
   lMMonwVvfC7kmnt+K/ly9lwB5b/dx3C1l91Gi4wIIjvkf/m5GjMsTRf2k
   B2A8wF4wo/tWtYWV5Aui+fpSda/X7jtswxJJrFT9fsIF01BJmsUe4kJIY
   AOu075m7T8QL5agTLWLZOXl6IEDCoxw5eqSla7ZrqwwQkf3fxg4FlMVvD
   w==;
X-CSE-ConnectionGUID: h0O6hI9mRlOcAhufJuYULg==
X-CSE-MsgGUID: 13QT8rmtT5CeDzdxuCFusw==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="34673137"
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="34673137"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 02:47:51 -0800
X-CSE-ConnectionGUID: 9dR1qaH2Srezpkk8Gq3smw==
X-CSE-MsgGUID: tCg7d3+yTpW+Re/FoBANtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="99162270"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Dec 2024 02:47:50 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPJUy-0002rt-0d;
	Sun, 22 Dec 2024 10:47:48 +0000
Date: Sun, 22 Dec 2024 18:47:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/mtk_iommu_v1.c:487 mtk_iommu_v1_probe_device() error:
 we previously assumed 'fwspec' could be null (see line 465)
Message-ID: <202412221827.sqvR5wz9-lkp@intel.com>
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
TO: Robin Murphy <robin.murphy@arm.com>
CC: Joerg Roedel <jroedel@suse.de>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: Jerry Snitselaar <jsnitsel@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   48f506ad0b683d3e7e794efa60c5785c4fdc86fa
commit: e7080665c977ea1aafb8547a9c7bd08b199311d6 iommu: Clean up open-coded ownership checks
date:   1 year, 1 month ago
:::::: branch date: 11 hours ago
:::::: commit date: 1 year, 1 month ago
config: arm-randconfig-r072-20241219 (https://download.01.org/0day-ci/archive/20241222/202412221827.sqvR5wz9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412221827.sqvR5wz9-lkp@intel.com/

smatch warnings:
drivers/iommu/mtk_iommu_v1.c:487 mtk_iommu_v1_probe_device() error: we previously assumed 'fwspec' could be null (see line 465)

vim +/fwspec +487 drivers/iommu/mtk_iommu_v1.c

b17336c55d8928c Honghui Zhang 2016-06-08  451  
ad9b10e533f6fb3 Yong Wu       2022-05-03  452  static struct iommu_device *mtk_iommu_v1_probe_device(struct device *dev)
b17336c55d8928c Honghui Zhang 2016-06-08  453  {
a9bf2eec5a6fc01 Joerg Roedel  2018-11-29  454  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
b17336c55d8928c Honghui Zhang 2016-06-08  455  	struct of_phandle_args iommu_spec;
ad9b10e533f6fb3 Yong Wu       2022-05-03  456  	struct mtk_iommu_v1_data *data;
635319a4a7444ca Yong Wu       2022-01-17  457  	int err, idx = 0, larbid, larbidx;
635319a4a7444ca Yong Wu       2022-01-17  458  	struct device_link *link;
635319a4a7444ca Yong Wu       2022-01-17  459  	struct device *larbdev;
b17336c55d8928c Honghui Zhang 2016-06-08  460  
822a2ed8c606caf Yong Wu       2022-01-17  461  	/*
822a2ed8c606caf Yong Wu       2022-01-17  462  	 * In the deferred case, free the existed fwspec.
822a2ed8c606caf Yong Wu       2022-01-17  463  	 * Always initialize the fwspec internally.
822a2ed8c606caf Yong Wu       2022-01-17  464  	 */
822a2ed8c606caf Yong Wu       2022-01-17 @465  	if (fwspec) {
822a2ed8c606caf Yong Wu       2022-01-17  466  		iommu_fwspec_free(dev);
822a2ed8c606caf Yong Wu       2022-01-17  467  		fwspec = dev_iommu_fwspec_get(dev);
822a2ed8c606caf Yong Wu       2022-01-17  468  	}
822a2ed8c606caf Yong Wu       2022-01-17  469  
f90a9a85fb946e1 Yong Wu       2021-04-12  470  	while (!of_parse_phandle_with_args(dev->of_node, "iommus",
f90a9a85fb946e1 Yong Wu       2021-04-12  471  					   "#iommu-cells",
f90a9a85fb946e1 Yong Wu       2021-04-12  472  					   idx, &iommu_spec)) {
b17336c55d8928c Honghui Zhang 2016-06-08  473  
ad9b10e533f6fb3 Yong Wu       2022-05-03  474  		err = mtk_iommu_v1_create_mapping(dev, &iommu_spec);
f90a9a85fb946e1 Yong Wu       2021-04-12  475  		of_node_put(iommu_spec.np);
f90a9a85fb946e1 Yong Wu       2021-04-12  476  		if (err)
f90a9a85fb946e1 Yong Wu       2021-04-12  477  			return ERR_PTR(err);
da5d2748e4a4512 Joerg Roedel  2019-01-23  478  
da5d2748e4a4512 Joerg Roedel  2019-01-23  479  		/* dev->iommu_fwspec might have changed */
da5d2748e4a4512 Joerg Roedel  2019-01-23  480  		fwspec = dev_iommu_fwspec_get(dev);
f90a9a85fb946e1 Yong Wu       2021-04-12  481  		idx++;
b17336c55d8928c Honghui Zhang 2016-06-08  482  	}
b17336c55d8928c Honghui Zhang 2016-06-08  483  
57dbf81f50c82a0 Joerg Roedel  2020-04-29  484  	data = dev_iommu_priv_get(dev);
b17336c55d8928c Honghui Zhang 2016-06-08  485  
635319a4a7444ca Yong Wu       2022-01-17  486  	/* Link the consumer device with the smi-larb device(supplier) */
635319a4a7444ca Yong Wu       2022-01-17 @487  	larbid = mt2701_m4u_to_larb(fwspec->ids[0]);
de78657e16f4141 Miles Chen    2022-05-05  488  	if (larbid >= MT2701_LARB_NR_MAX)
de78657e16f4141 Miles Chen    2022-05-05  489  		return ERR_PTR(-EINVAL);
de78657e16f4141 Miles Chen    2022-05-05  490  
635319a4a7444ca Yong Wu       2022-01-17  491  	for (idx = 1; idx < fwspec->num_ids; idx++) {
635319a4a7444ca Yong Wu       2022-01-17  492  		larbidx = mt2701_m4u_to_larb(fwspec->ids[idx]);
635319a4a7444ca Yong Wu       2022-01-17  493  		if (larbid != larbidx) {
635319a4a7444ca Yong Wu       2022-01-17  494  			dev_err(dev, "Can only use one larb. Fail@larb%d-%d.\n",
635319a4a7444ca Yong Wu       2022-01-17  495  				larbid, larbidx);
635319a4a7444ca Yong Wu       2022-01-17  496  			return ERR_PTR(-EINVAL);
635319a4a7444ca Yong Wu       2022-01-17  497  		}
635319a4a7444ca Yong Wu       2022-01-17  498  	}
635319a4a7444ca Yong Wu       2022-01-17  499  
635319a4a7444ca Yong Wu       2022-01-17  500  	larbdev = data->larb_imu[larbid].dev;
de78657e16f4141 Miles Chen    2022-05-05  501  	if (!larbdev)
de78657e16f4141 Miles Chen    2022-05-05  502  		return ERR_PTR(-EINVAL);
de78657e16f4141 Miles Chen    2022-05-05  503  
635319a4a7444ca Yong Wu       2022-01-17  504  	link = device_link_add(dev, larbdev,
635319a4a7444ca Yong Wu       2022-01-17  505  			       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
635319a4a7444ca Yong Wu       2022-01-17  506  	if (!link)
635319a4a7444ca Yong Wu       2022-01-17  507  		dev_err(dev, "Unable to link %s\n", dev_name(larbdev));
635319a4a7444ca Yong Wu       2022-01-17  508  
57dbf81f50c82a0 Joerg Roedel  2020-04-29  509  	return &data->iommu;
57dbf81f50c82a0 Joerg Roedel  2020-04-29  510  }
57dbf81f50c82a0 Joerg Roedel  2020-04-29  511  

:::::: The code at line 487 was first introduced by commit
:::::: 635319a4a7444ca97124d781cd96deb277ff4d40 media: iommu/mediatek: Add device_link between the consumer and the larb devices

:::::: TO: Yong Wu <yong.wu@mediatek.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
