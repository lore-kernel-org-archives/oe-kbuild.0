Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AA93A8EB
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Feb 2024 03:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706758943; cv=none; b=N/4KlLpPJ1gaS/4tpSFEGLilbwQMLcYxqtujzats2CpAsO6FNNWAGkPg8PKt0nTddO4BSqDbUiiNMEE6+Cz46czBTtOurZGd+onKZi3a/pEe5LBZyJXPoJbRGx+O0RiTakMOPF3aQuf3ZyjSVISHBbKzPsGlSYj7G9Zjl3zld9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706758943; c=relaxed/simple;
	bh=GT7JJhn58gciJ4sdUuPqYLylplFp+//Pit3KZxIqiQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YHEQPJ9VhRiqZK0mLV3sXre7Cpg65NfPajfWNd16qbapPZz8mRb4v0pHZRm6IJTT8Ccruz1IcE6vhm0C8pFm3myjkeAhKQ/znMEk9SM1+cYUNU0tcVxplJpnaTOS6XJAI8mG/terio4Agwv2y223Tz61U12WMbYY/K/QfqOoYA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d2WUXqcS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d2WUXqcS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706758941; x=1738294941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GT7JJhn58gciJ4sdUuPqYLylplFp+//Pit3KZxIqiQ4=;
  b=d2WUXqcS5O2tmQ2K6pqvcuPEgmMRr7un2hX5psXIqBz/MzivgMS5bp1R
   RFDAYdbU1HupSG5q4uAOiCsZn2c9X3Pd2q8WhjMdIsEMsEt+Y0VrqfhHQ
   8X7MNrRLxXpeMLe3DaiZh/CBznybykiJ827LtLfReYBPXU4jOUe6JNneQ
   VIOETeSGjpRbKbz90sxRuBXeR05wefhqaDRu4OsSNXsClvMbJVSMSiEAQ
   YYbS4T3IUysY5+L0DwsyGXVg9wJ6wXhB2NGrAPAj5M/HWENydOk9r+ftU
   o6cleSwtfIGAstJmt12BAKxdWswyM+wac5GfAmZvPuUvnfZaSOlELIQ+9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3661501"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="3661501"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 19:42:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4291913"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 31 Jan 2024 19:42:19 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVNxx-0002LK-0V;
	Thu, 01 Feb 2024 03:42:17 +0000
Date: Thu, 1 Feb 2024 11:41:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/ufs/host/ufs-qcom.c:1467 ufs_qcom_mcq_config_resource()
 error: potentially dereferencing uninitialized 'res_mem'.
Message-ID: <202402011121.cTeIFw1w-lkp@intel.com>
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
TO: Asutosh Das <quic_asutoshd@quicinc.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Can Guo <quic_cang@quicinc.com>
CC: Manivannan Sadhasivam <mani@kernel.org>
CC: Bart Van Assche <bvanassche@acm.org>
CC: Stanley Chu <stanley.chu@mediatek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6764c317b6bb91bd806ef79adf6d9c0e428b191e
commit: c263b4ef737e622e2a908c58ca4bb68a89376387 scsi: ufs: core: mcq: Configure resource regions
date:   1 year, 1 month ago
:::::: branch date: 9 hours ago
:::::: commit date: 1 year, 1 month ago
config: arm64-randconfig-r081-20240129 (https://download.01.org/0day-ci/archive/20240201/202402011121.cTeIFw1w-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4a39d08908942b2d415db405844cbe4af73e75d4)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402011121.cTeIFw1w-lkp@intel.com/

New smatch warnings:
drivers/ufs/host/ufs-qcom.c:1467 ufs_qcom_mcq_config_resource() error: potentially dereferencing uninitialized 'res_mem'.

Old smatch warnings:
drivers/ufs/host/ufs-qcom.c:1451 ufs_qcom_mcq_config_resource() warn: passing zero to 'PTR_ERR'

vim +/res_mem +1467 drivers/ufs/host/ufs-qcom.c

c263b4ef737e62 Asutosh Das 2023-01-13  1420  
c263b4ef737e62 Asutosh Das 2023-01-13  1421  static int ufs_qcom_mcq_config_resource(struct ufs_hba *hba)
c263b4ef737e62 Asutosh Das 2023-01-13  1422  {
c263b4ef737e62 Asutosh Das 2023-01-13  1423  	struct platform_device *pdev = to_platform_device(hba->dev);
c263b4ef737e62 Asutosh Das 2023-01-13  1424  	struct ufshcd_res_info *res;
c263b4ef737e62 Asutosh Das 2023-01-13  1425  	struct resource *res_mem, *res_mcq;
c263b4ef737e62 Asutosh Das 2023-01-13  1426  	int i, ret = 0;
c263b4ef737e62 Asutosh Das 2023-01-13  1427  
c263b4ef737e62 Asutosh Das 2023-01-13  1428  	memcpy(hba->res, ufs_res_info, sizeof(ufs_res_info));
c263b4ef737e62 Asutosh Das 2023-01-13  1429  
c263b4ef737e62 Asutosh Das 2023-01-13  1430  	for (i = 0; i < RES_MAX; i++) {
c263b4ef737e62 Asutosh Das 2023-01-13  1431  		res = &hba->res[i];
c263b4ef737e62 Asutosh Das 2023-01-13  1432  		res->resource = platform_get_resource_byname(pdev,
c263b4ef737e62 Asutosh Das 2023-01-13  1433  							     IORESOURCE_MEM,
c263b4ef737e62 Asutosh Das 2023-01-13  1434  							     res->name);
c263b4ef737e62 Asutosh Das 2023-01-13  1435  		if (!res->resource) {
c263b4ef737e62 Asutosh Das 2023-01-13  1436  			dev_info(hba->dev, "Resource %s not provided\n", res->name);
c263b4ef737e62 Asutosh Das 2023-01-13  1437  			if (i == RES_UFS)
c263b4ef737e62 Asutosh Das 2023-01-13  1438  				return -ENOMEM;
c263b4ef737e62 Asutosh Das 2023-01-13  1439  			continue;
c263b4ef737e62 Asutosh Das 2023-01-13  1440  		} else if (i == RES_UFS) {
c263b4ef737e62 Asutosh Das 2023-01-13  1441  			res_mem = res->resource;
c263b4ef737e62 Asutosh Das 2023-01-13  1442  			res->base = hba->mmio_base;
c263b4ef737e62 Asutosh Das 2023-01-13  1443  			continue;
c263b4ef737e62 Asutosh Das 2023-01-13  1444  		}
c263b4ef737e62 Asutosh Das 2023-01-13  1445  
c263b4ef737e62 Asutosh Das 2023-01-13  1446  		res->base = devm_ioremap_resource(hba->dev, res->resource);
c263b4ef737e62 Asutosh Das 2023-01-13  1447  		if (IS_ERR(res->base)) {
c263b4ef737e62 Asutosh Das 2023-01-13  1448  			dev_err(hba->dev, "Failed to map res %s, err=%d\n",
c263b4ef737e62 Asutosh Das 2023-01-13  1449  					 res->name, (int)PTR_ERR(res->base));
c263b4ef737e62 Asutosh Das 2023-01-13  1450  			res->base = NULL;
c263b4ef737e62 Asutosh Das 2023-01-13  1451  			ret = PTR_ERR(res->base);
c263b4ef737e62 Asutosh Das 2023-01-13  1452  			return ret;
c263b4ef737e62 Asutosh Das 2023-01-13  1453  		}
c263b4ef737e62 Asutosh Das 2023-01-13  1454  	}
c263b4ef737e62 Asutosh Das 2023-01-13  1455  
c263b4ef737e62 Asutosh Das 2023-01-13  1456  	/* MCQ resource provided in DT */
c263b4ef737e62 Asutosh Das 2023-01-13  1457  	res = &hba->res[RES_MCQ];
c263b4ef737e62 Asutosh Das 2023-01-13  1458  	/* Bail if MCQ resource is provided */
c263b4ef737e62 Asutosh Das 2023-01-13  1459  	if (res->base)
c263b4ef737e62 Asutosh Das 2023-01-13  1460  		goto out;
c263b4ef737e62 Asutosh Das 2023-01-13  1461  
c263b4ef737e62 Asutosh Das 2023-01-13  1462  	/* Explicitly allocate MCQ resource from ufs_mem */
c263b4ef737e62 Asutosh Das 2023-01-13  1463  	res_mcq = devm_kzalloc(hba->dev, sizeof(*res_mcq), GFP_KERNEL);
c263b4ef737e62 Asutosh Das 2023-01-13  1464  	if (!res_mcq)
c263b4ef737e62 Asutosh Das 2023-01-13  1465  		return ret;
c263b4ef737e62 Asutosh Das 2023-01-13  1466  
c263b4ef737e62 Asutosh Das 2023-01-13 @1467  	res_mcq->start = res_mem->start +
c263b4ef737e62 Asutosh Das 2023-01-13  1468  			 MCQ_SQATTR_OFFSET(hba->mcq_capabilities);
c263b4ef737e62 Asutosh Das 2023-01-13  1469  	res_mcq->end = res_mcq->start + hba->nr_hw_queues * MCQ_QCFG_SIZE - 1;
c263b4ef737e62 Asutosh Das 2023-01-13  1470  	res_mcq->flags = res_mem->flags;
c263b4ef737e62 Asutosh Das 2023-01-13  1471  	res_mcq->name = "mcq";
c263b4ef737e62 Asutosh Das 2023-01-13  1472  
c263b4ef737e62 Asutosh Das 2023-01-13  1473  	ret = insert_resource(&iomem_resource, res_mcq);
c263b4ef737e62 Asutosh Das 2023-01-13  1474  	if (ret) {
c263b4ef737e62 Asutosh Das 2023-01-13  1475  		dev_err(hba->dev, "Failed to insert MCQ resource, err=%d\n",
c263b4ef737e62 Asutosh Das 2023-01-13  1476  			ret);
c263b4ef737e62 Asutosh Das 2023-01-13  1477  		goto insert_res_err;
c263b4ef737e62 Asutosh Das 2023-01-13  1478  	}
c263b4ef737e62 Asutosh Das 2023-01-13  1479  
c263b4ef737e62 Asutosh Das 2023-01-13  1480  	res->base = devm_ioremap_resource(hba->dev, res_mcq);
c263b4ef737e62 Asutosh Das 2023-01-13  1481  	if (IS_ERR(res->base)) {
c263b4ef737e62 Asutosh Das 2023-01-13  1482  		dev_err(hba->dev, "MCQ registers mapping failed, err=%d\n",
c263b4ef737e62 Asutosh Das 2023-01-13  1483  			(int)PTR_ERR(res->base));
c263b4ef737e62 Asutosh Das 2023-01-13  1484  		ret = PTR_ERR(res->base);
c263b4ef737e62 Asutosh Das 2023-01-13  1485  		goto ioremap_err;
c263b4ef737e62 Asutosh Das 2023-01-13  1486  	}
c263b4ef737e62 Asutosh Das 2023-01-13  1487  
c263b4ef737e62 Asutosh Das 2023-01-13  1488  out:
c263b4ef737e62 Asutosh Das 2023-01-13  1489  	hba->mcq_base = res->base;
c263b4ef737e62 Asutosh Das 2023-01-13  1490  	return 0;
c263b4ef737e62 Asutosh Das 2023-01-13  1491  ioremap_err:
c263b4ef737e62 Asutosh Das 2023-01-13  1492  	res->base = NULL;
c263b4ef737e62 Asutosh Das 2023-01-13  1493  	remove_resource(res_mcq);
c263b4ef737e62 Asutosh Das 2023-01-13  1494  insert_res_err:
c263b4ef737e62 Asutosh Das 2023-01-13  1495  	devm_kfree(hba->dev, res_mcq);
c263b4ef737e62 Asutosh Das 2023-01-13  1496  	return ret;
c263b4ef737e62 Asutosh Das 2023-01-13  1497  }
c263b4ef737e62 Asutosh Das 2023-01-13  1498  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
