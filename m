Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319092940B
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 05:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763010265; cv=none; b=o4lcKDbOK+hJ/SQG+NtCYzSnENks7EsNEkOFmWQ3q2ewTXfxVd/+gKrcRNe+JYTGDTdaMQh3ZaeIVQg27skxIaXRUxLbDDYVO2uX16MzGEMvRl2Mcp3FbPYZqwtjA3OfMnCfP7EdQpQWvrGg83+JAxO9BRyyogZtyp+ZTA+PC3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763010265; c=relaxed/simple;
	bh=XRAwNnjyYiyx/7fdZOG3BHaTaWMSHhq54bd3zDObjQg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BQvuifFgjcSyCLaqN39LTSi2mSKKAMoW2T1D3D+9wzPGIRGs6hv45+qgcb1Kmc4Xy2+rVYzNUX8k7knaMZWERjpIkS+g8Kn/uXvGaM0l4I+om8AFDg83zVnFPIJeuCmuUwn3Gwqryh11+f7W6SVL60tvLVxvaBIhY+q6v1nR0as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PHJVGPcW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PHJVGPcW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763010264; x=1794546264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XRAwNnjyYiyx/7fdZOG3BHaTaWMSHhq54bd3zDObjQg=;
  b=PHJVGPcWNLGekPwQnP9Tx9wMYEzf/DC3IrWC99d2afv+lMrDEHbhH+qX
   XUHumnyLfCyOkIxS5B3IL31QQaIJ+F0uMli03b9qHP4roZW0qKVIshhdD
   fLodGBU7NYg7sbVkaDv0kYhYnPGhFJCoaK8crg3R8SGc/4X0TPICBES8y
   6QzTiKL1gyGNXVl4mSHFGSJsXWFbovVm1VLCswzjFd9kPz7fmARuPH6u8
   dIyyOm0P1Z8oChT9mgeYSgaehhi287pL7RDRwP3GyqrLRxg8+dQ5XKBlN
   7fUuxS9yZXBLvtggvZ//YeE/aLnxEzY+yyf16AqLgrP3S9j+bSs7p0bfv
   Q==;
X-CSE-ConnectionGUID: bd3PhycXTD+Rw4COU5M35w==
X-CSE-MsgGUID: iW61IdstRC6QLYHc+k6XpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65120425"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="65120425"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 21:04:24 -0800
X-CSE-ConnectionGUID: ygq+HhqZQtOyn80nfmfa2Q==
X-CSE-MsgGUID: X2U58AKQTRm1v3anR0Od9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189829142"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Nov 2025 21:04:23 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJPVM-0004uz-1M;
	Thu, 13 Nov 2025 05:04:20 +0000
Date: Thu, 13 Nov 2025 13:04:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/ufs/host/ufs-mediatek.c:1045 ufs_mtk_vreg_fix_vcc() error:
 we previously assumed 'info->vcc' could be null (see line 1021)
Message-ID: <202511131231.k9WIu3zZ-lkp@intel.com>
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
TO: Peter Wang <peter.wang@mediatek.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   24172e0d79900908cf5ebf366600616d29c9b417
commit: 6c00c493a344b65fb0a356cb3f328a647085687b scsi: ufs: host: mediatek: Simplify variable usage
date:   3 months ago
:::::: branch date: 34 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-r072-20251113 (https://download.01.org/0day-ci/archive/20251113/202511131231.k9WIu3zZ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 996639d6ebb86ff15a8c99b67f1c2e2117636ae7)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511131231.k9WIu3zZ-lkp@intel.com/

smatch warnings:
drivers/ufs/host/ufs-mediatek.c:1045 ufs_mtk_vreg_fix_vcc() error: we previously assumed 'info->vcc' could be null (see line 1021)

vim +1045 drivers/ufs/host/ufs-mediatek.c

b7dbc686f60b28 Po-Wen Kao          2022-08-03  1010  
ece418d0291117 Stanley Chu         2022-06-16  1011  #define MAX_VCC_NAME 30
ece418d0291117 Stanley Chu         2022-06-16  1012  static int ufs_mtk_vreg_fix_vcc(struct ufs_hba *hba)
ece418d0291117 Stanley Chu         2022-06-16  1013  {
ece418d0291117 Stanley Chu         2022-06-16  1014  	struct ufs_vreg_info *info = &hba->vreg_info;
ece418d0291117 Stanley Chu         2022-06-16  1015  	struct device_node *np = hba->dev->of_node;
ece418d0291117 Stanley Chu         2022-06-16  1016  	struct device *dev = hba->dev;
ece418d0291117 Stanley Chu         2022-06-16  1017  	char vcc_name[MAX_VCC_NAME];
ece418d0291117 Stanley Chu         2022-06-16  1018  	struct arm_smccc_res res;
ece418d0291117 Stanley Chu         2022-06-16  1019  	int err, ver;
ece418d0291117 Stanley Chu         2022-06-16  1020  
6c00c493a344b6 Peter Wang          2025-08-11 @1021  	if (info->vcc)
ece418d0291117 Stanley Chu         2022-06-16  1022  		return 0;
ece418d0291117 Stanley Chu         2022-06-16  1023  
ece418d0291117 Stanley Chu         2022-06-16  1024  	if (of_property_read_bool(np, "mediatek,ufs-vcc-by-num")) {
ece418d0291117 Stanley Chu         2022-06-16  1025  		ufs_mtk_get_vcc_num(res);
ece418d0291117 Stanley Chu         2022-06-16  1026  		if (res.a1 > UFS_VCC_NONE && res.a1 < UFS_VCC_MAX)
f54912b228a8df Ren Zhijie          2022-06-19  1027  			snprintf(vcc_name, MAX_VCC_NAME, "vcc-opt%lu", res.a1);
ece418d0291117 Stanley Chu         2022-06-16  1028  		else
ece418d0291117 Stanley Chu         2022-06-16  1029  			return -ENODEV;
ece418d0291117 Stanley Chu         2022-06-16  1030  	} else if (of_property_read_bool(np, "mediatek,ufs-vcc-by-ver")) {
ece418d0291117 Stanley Chu         2022-06-16  1031  		ver = (hba->dev_info.wspecversion & 0xF00) >> 8;
ece418d0291117 Stanley Chu         2022-06-16  1032  		snprintf(vcc_name, MAX_VCC_NAME, "vcc-ufs%u", ver);
ece418d0291117 Stanley Chu         2022-06-16  1033  	} else {
ece418d0291117 Stanley Chu         2022-06-16  1034  		return 0;
ece418d0291117 Stanley Chu         2022-06-16  1035  	}
ece418d0291117 Stanley Chu         2022-06-16  1036  
2c99e3d7d2cba9 Krzysztof Kozlowski 2023-09-06  1037  	err = ufshcd_populate_vreg(dev, vcc_name, &info->vcc, false);
ece418d0291117 Stanley Chu         2022-06-16  1038  	if (err)
ece418d0291117 Stanley Chu         2022-06-16  1039  		return err;
ece418d0291117 Stanley Chu         2022-06-16  1040  
ece418d0291117 Stanley Chu         2022-06-16  1041  	err = ufshcd_get_vreg(dev, info->vcc);
ece418d0291117 Stanley Chu         2022-06-16  1042  	if (err)
ece418d0291117 Stanley Chu         2022-06-16  1043  		return err;
ece418d0291117 Stanley Chu         2022-06-16  1044  
ece418d0291117 Stanley Chu         2022-06-16 @1045  	err = regulator_enable(info->vcc->reg);
ece418d0291117 Stanley Chu         2022-06-16  1046  	if (!err) {
ece418d0291117 Stanley Chu         2022-06-16  1047  		info->vcc->enabled = true;
ece418d0291117 Stanley Chu         2022-06-16  1048  		dev_info(dev, "%s: %s enabled\n", __func__, vcc_name);
ece418d0291117 Stanley Chu         2022-06-16  1049  	}
ece418d0291117 Stanley Chu         2022-06-16  1050  
ece418d0291117 Stanley Chu         2022-06-16  1051  	return err;
ece418d0291117 Stanley Chu         2022-06-16  1052  }
ece418d0291117 Stanley Chu         2022-06-16  1053  

:::::: The code at line 1045 was first introduced by commit
:::::: ece418d0291117e3fc700f10e7fa9187010e38a0 scsi: ufs: ufs-mediatek: Support multiple VCC sources

:::::: TO: Stanley Chu <stanley.chu@mediatek.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
