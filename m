Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22308111AD
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Oct 2024 01:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729127695; cv=none; b=HpU2sZkOHydugYzMnHCDSztuFLRtNl34W+uJ3w8CCPNnfPWgE2Alill70us+LzjX1Rv1bd9NbEDqtuX6kGkYOg4RsRLm8de0ppDCYCrWI6BlHtVOoQ2KW5/KSei3mCyMAQFnf/LS7pt3Ltj/yb0Chi4JW3ZUUxEE3zv6LUsG7PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729127695; c=relaxed/simple;
	bh=kSMWQo8yJPmvMsVZ79lZ83Z/Bdar3mv3GMfW14N4B38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bvb7EI273XA0S5fbrs5pt+fP3/BiJO2STBOzzHEquHlnm90oA2tyPjWadJpvSn9CFoEmgL/1kaO3GH6D/6Xmuv+4xbJiAyVtSHYsKhUT6af+OdUnIU56DonVgooOi9xIFUSO2cqFPiMfv+d0vmc/rh5HFrGAPucRKlxqnhg03v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CKI3GoBc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CKI3GoBc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729127693; x=1760663693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kSMWQo8yJPmvMsVZ79lZ83Z/Bdar3mv3GMfW14N4B38=;
  b=CKI3GoBclGvF0oQh+BgLTNuZNg+44FH+YcufpdAq7+uFfzGJ2j4VZJJs
   k1JK+nJLowwOZeDZ5qXWmTuiNTuuLxX2c8crdY/7HHjcCLWRCjrKg//Pq
   FLIgmAlcBeImrj3J6ipNIQ+MOQCQHwrjmEdsRHAALfN3yWEyKwKv2Cf99
   yorsQY2VVXlc4+alA/0B8yKYK1QhrwvhigOziipU+Uabk0OpMNVMhxHfJ
   mPk6MhQYZQTnFcwEV1wP5gecPqVEGFHjWQC6sktn2PbgLYumxby+xS1Lu
   fsvi2/hSuyUaGKw5HO/657MwMHgR6NEFhA9/TjBE36f1PVNTjgQDrYTGR
   w==;
X-CSE-ConnectionGUID: +XfBGyU3Sp2IptKF0KzAbw==
X-CSE-MsgGUID: +Kr57lS/SiOOBUrilAtcmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28553230"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28553230"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 18:14:52 -0700
X-CSE-ConnectionGUID: FiH7vhEySPKSQxPzYl7c1A==
X-CSE-MsgGUID: KoP9kmytT9q/ntIfudG8Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="83225826"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Oct 2024 18:14:51 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1F6G-000LaX-1n;
	Thu, 17 Oct 2024 01:14:48 +0000
Date: Thu, 17 Oct 2024 09:14:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/mtk_iommu_v1.c:487 mtk_iommu_v1_probe_device() error:
 we previously assumed 'fwspec' could be null (see line 465)
Message-ID: <202410170948.gfVfAuei-lkp@intel.com>
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
head:   c964ced7726294d40913f2127c3f185a92cb4a41
commit: e7080665c977ea1aafb8547a9c7bd08b199311d6 iommu: Clean up open-coded ownership checks
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-r072-20241016 (https://download.01.org/0day-ci/archive/20241017/202410170948.gfVfAuei-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410170948.gfVfAuei-lkp@intel.com/

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
