Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706FC3ABD95
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Jun 2026 10:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781345801; cv=none; b=f8EG3dhsntRV3P//ltJxQ1RqmygLgZGE9huQ7CZVl7Mdy141Eshrv57DRTd5Y4wDtYxib0ICfX6vaABA1qtV+OSHoRbrCAkxXLbbKjKde2xrSPcxpTF6Z939NmJ55Qb91ItMMJn14I5qI12kHgS8UuCXEuRXG4DJPd2vSBSg+VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781345801; c=relaxed/simple;
	bh=QUWUur12sCVMZz+NnAIPWFyxj5sHtkDN2Xdc9Sn7sAY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sc+U6ne5X/ImnUn9jXMFn1BFMEQ9g6fQgdDp2ipwqQED5zFxB/GtIeGLv83e3Nx4mvceSfmv9Sq0hiQRzQf4pnVgnbE6UFWNkzvdEbeeRLSJmoU0MheZA9hL0FN8Mb63VLy5D96V7ZohG3CnMItbscRrwpkEyyGKx9UdhFphQXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=alW2foJu; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="alW2foJu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781345799; x=1812881799;
  h=date:from:to:cc:subject:message-id;
  bh=QUWUur12sCVMZz+NnAIPWFyxj5sHtkDN2Xdc9Sn7sAY=;
  b=alW2foJufPn1GfriGtLB6Ib9OVkrK/+BZozNOwrK2TknjHPrcHAO8CaH
   iY1udgvYajN1l9ANDLLUvmKZ4z381Ln7I6gd32hHzN7SJt16sYdBQTwKX
   nPQK/h3Cf5Qa7/9vSko/5I6mnc3IJIEguIbfqqhqDb5ci4t33JpSpy14b
   V8ydnuNB1IVpc3Tzt8+VlVgDWS7nLPO3BlBQ7S/C3BGXzWC2qLIR3qLBJ
   6H0NC/6WpU57B0oJeY8xzPYTQdZhXvAGUorPog/SQ9CosxDX1myxbcaPe
   RZNk5l9PtRT5hD2JPb7kwkjUM3QFuzv+yq/Vu/B8OE6vs18Wea6z0jLP/
   g==;
X-CSE-ConnectionGUID: Tzi5uh2sQfak+oaEIt804A==
X-CSE-MsgGUID: kMq0G4T5Rs60OPFcGCnu3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="92840207"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="92840207"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 03:16:37 -0700
X-CSE-ConnectionGUID: bO1YGADVTWq7E0Qf2PkPlg==
X-CSE-MsgGUID: PmRnD8JRTxW+ai71KC9fXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="246134220"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Jun 2026 03:16:36 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYLPk-00000000Pqa-2nZI;
	Sat, 13 Jun 2026 10:16:32 +0000
Date: Sat, 13 Jun 2026 18:15:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/ufs/host/ufs-mediatek.c:1045 ufs_mtk_vreg_fix_vcc()
 error: we previously assumed 'info->vcc' could be null (see line 1021)
Message-ID: <202606131841.9qfAKJHo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Peter Wang <peter.wang@mediatek.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   062871f1371b2e02a272ff5279c6479aff0a37ef
commit: 6c00c493a344b65fb0a356cb3f328a647085687b scsi: ufs: host: mediatek: Simplify variable usage
date:   10 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-r071-20260613 (https://download.01.org/0day-ci/archive/20260613/202606131841.9qfAKJHo-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6c00c493a344 ("scsi: ufs: host: mediatek: Simplify variable usage")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606131841.9qfAKJHo-lkp@intel.com/

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
