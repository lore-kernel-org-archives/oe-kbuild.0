Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DDC4AEFE
	for <oe-kbuild@lists.linux.dev>; Sun, 31 Mar 2024 09:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711877426; cv=none; b=WX4YxKNIkKfGV98yOWiGpbBXTCW3EpEPyWJ3v4mDbAQRGAHrpF8VWFhoKNkIDw1WClbBWJThjQm8QP7JTVd9nExHtxb45Lomun+MwMExJNc65jvHw719OcfBJAIAvvpYBHOH/gBfn+K4jA8VFmTEPdzNEOGW13L/aEC06vzf6OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711877426; c=relaxed/simple;
	bh=8H5rldwqJ4gCOnI8dh+nwY9bHxvt5FtQeSoR6bFcs8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TFX65yruzX7Mku2MjGYFtNKbDpQWhwg+J7Y+M91GaiYHxMgN/UcXaT5ryzj/nLXFfRmC2S0+Luqgb4Tg1DGCuyDgI38nYdsHUTLmifcSY3m8Lsuhk2G+uDh7SLVvTQRryst2MCJdPGfW75Lv5oDnGUP7gpTgLtQoeM/PPQFuCKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ClecpBZb; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ClecpBZb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711877424; x=1743413424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8H5rldwqJ4gCOnI8dh+nwY9bHxvt5FtQeSoR6bFcs8Q=;
  b=ClecpBZbdpkB0/mKE1+G41ihyx0tWAGr834icvMBVUJ0bNPTc4DrQDE2
   C7/XOqRmpzDoRqITPfNXoCKbfLkOU9S27MoE7n/ludav7zE+jki+u0rbS
   1vM0n6cAHSzuefNBox6pwLrv1tTrfbSLUXxMzrueygQHHmBerHBJlY926
   fnSHNzluCCIswIR9v0btrk/K6QJp3tcsa9nqAdRXM5SYCOHXIF7cnDnvd
   leUW5Fe6yU5whkCRsSJxSGcd2VwZ3bfcuSjHHQoMq2Xrb+VXySGo2Q842
   8+gZHkm8Lq+/Ao7YSS9cSC59eEXS9AmancqXCsCQlrpUCCd3oSCVc3eoD
   w==;
X-CSE-ConnectionGUID: zowGvHicTNmsqtdnR8CQOw==
X-CSE-MsgGUID: Xy9i3MSLTCOnprTLb9ns/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11029"; a="24472807"
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="24472807"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 02:30:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="17495664"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Mar 2024 02:30:21 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqrW7-0000z8-1n;
	Sun, 31 Mar 2024 09:30:19 +0000
Date: Sun, 31 Mar 2024 17:29:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:openEuler-1.0-LTS 15530/22010] drivers/iommu/dmar.c:750
 dmar_acpi_bus_add_dev() error: uninitialized symbol 'ret'.
Message-ID: <202403311708.wZJ05bN5-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Cheng Jian <cj.chengjian@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   6726609c5990ede3a9fdb318d1dc759d03678a1a
commit: 0f7d0c8b66a415734cbd2c8a7afc586c4a1d61cc [15530/22010] iommu/vt-d:Add support for detecting ACPI device in RMRR
:::::: branch date: 26 hours ago
:::::: commit date: 3 years ago
config: x86_64-randconfig-161-20240329 (https://download.01.org/0day-ci/archive/20240331/202403311708.wZJ05bN5-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403311708.wZJ05bN5-lkp@intel.com/

smatch warnings:
drivers/iommu/dmar.c:750 dmar_acpi_bus_add_dev() error: uninitialized symbol 'ret'.

vim +/ret +750 drivers/iommu/dmar.c

0f7d0c8b66a415 LeoLiu-oc       2021-04-07  732  
0f7d0c8b66a415 LeoLiu-oc       2021-04-07  733  static int dmar_acpi_bus_add_dev(u8 device_number, struct acpi_device *adev)
0f7d0c8b66a415 LeoLiu-oc       2021-04-07  734  {
0f7d0c8b66a415 LeoLiu-oc       2021-04-07  735  	struct dmar_drhd_unit *dmaru;
0f7d0c8b66a415 LeoLiu-oc       2021-04-07  736  	struct acpi_dmar_hardware_unit *drhd;
0f7d0c8b66a415 LeoLiu-oc       2021-04-07  737  	int ret;
0f7d0c8b66a415 LeoLiu-oc       2021-04-07  738  
0f7d0c8b66a415 LeoLiu-oc       2021-04-07  739  	for_each_drhd_unit(dmaru) {
0f7d0c8b66a415 LeoLiu-oc       2021-04-07  740  		drhd = container_of(dmaru->hdr,
0f7d0c8b66a415 LeoLiu-oc       2021-04-07  741  				    struct acpi_dmar_hardware_unit,
0f7d0c8b66a415 LeoLiu-oc       2021-04-07  742  				    header);
0f7d0c8b66a415 LeoLiu-oc       2021-04-07  743  
0f7d0c8b66a415 LeoLiu-oc       2021-04-07  744  		ret = dmar_acpi_insert_dev_scope(device_number, adev, (void *)(drhd+1),
0f7d0c8b66a415 LeoLiu-oc       2021-04-07  745  						((void *)drhd)+drhd->header.length,
0f7d0c8b66a415 LeoLiu-oc       2021-04-07  746  						dmaru->devices, dmaru->devices_cnt);
0f7d0c8b66a415 LeoLiu-oc       2021-04-07  747  		if (ret)
0f7d0c8b66a415 LeoLiu-oc       2021-04-07  748  			break;
0f7d0c8b66a415 LeoLiu-oc       2021-04-07  749  	}
0f7d0c8b66a415 LeoLiu-oc       2021-04-07 @750  	if (ret > 0)
0f7d0c8b66a415 LeoLiu-oc       2021-04-07  751  		ret = dmar_rmrr_add_acpi_dev(device_number, adev);
0f7d0c8b66a415 LeoLiu-oc       2021-04-07  752  	return ret;
ed40356b5fcf1c David Woodhouse 2014-03-07  753  }
ed40356b5fcf1c David Woodhouse 2014-03-07  754  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
