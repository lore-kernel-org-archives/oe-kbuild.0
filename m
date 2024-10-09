Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBFA1E1A0A
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Oct 2024 20:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728504685; cv=none; b=F96Ld44AJRDs26cRRPPPNDLkcblKijTJbVbdUry//hr95mAUyNWRidXrGvtDVaAnpFwaZX0X7TW6ioIZxFPNwP9596Z20iCsG5gwzDQJNHDmHsLjep1eVbw3c6ljIPqeSkBfxBZ+5TzUGiCU3Dc2hRz9Dfw6kc3mwBFQOtNYrb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728504685; c=relaxed/simple;
	bh=JeqfWrKLp8CSIOrUUCvXxzixq/id9FpTIGPYEkFkhjA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l0VBn3NuapsxZU+ulZQEtaKH9QFbtfXtISixecrmibVMV/08Wqic8egCR/YB/u1cs2gv8ODRwwXxUFuzjfwAt81TAECmsXNELyn/p0dk3M9zrNKlS0ENKpAxRD2GD8etUBcUzMc3JgQ2ZiEUMB6tPa41Xo5nnEnmOV98XZgZ3iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RdKv+0L0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RdKv+0L0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728504684; x=1760040684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JeqfWrKLp8CSIOrUUCvXxzixq/id9FpTIGPYEkFkhjA=;
  b=RdKv+0L0KxtO8YRx0URg2tXcDJtGH7d6mLEtOPvCk8OXviRQh2+ux+H2
   8VW83+jZDCAO5z+A07jLf6HWSCuPeT93roZ8V/lFFz5F4QvfsbpoTIMXg
   0f2d1RNjQlXKJnGzykOMgGN+62P0BY4ENfuiA6CihG1iY9DxRoT4ZQRLD
   7yyG0up9lfxTWQqtCym/tFagZU/kMFIEZOT6sRVF7ZDdukbrQl1OrRi/X
   tkduCAPA1tdr5zAJzTqJB4mk3MhPouuDvu5CujHhMGs+/KcwA+VhXr163
   Pj424SfamZCnRWAm4bWzb2HKKwhhWN36sJvZ4sPJtbYZ4jxSxWLz7ZHMa
   w==;
X-CSE-ConnectionGUID: jFacuEX/TWiUh8/o/xyo4Q==
X-CSE-MsgGUID: 3drRxMP8T/Cb+N0RjHikEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27781129"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="27781129"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 13:11:21 -0700
X-CSE-ConnectionGUID: L/Eis91uSjugpmaIExo30w==
X-CSE-MsgGUID: /co26PLFR82BaFTibAp4mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="76464299"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Oct 2024 13:11:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syd1h-0009lM-08;
	Wed, 09 Oct 2024 20:11:17 +0000
Date: Thu, 10 Oct 2024 04:10:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/ufs/core/ufshcd.c:5732:13-19: opportunity for
 str_enabled_disabled(enable)
Message-ID: <202410100424.yhban3O6-lkp@intel.com>
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
TO: Bart Van Assche <bvanassche@acm.org>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Bean Huo <beanhuo@micron.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   75b607fab38d149f232f01eae5e6392b394dd659
commit: dd11376b9f1b73aca3f8c6eb541486bbb6996f05 scsi: ufs: Split the drivers/scsi/ufs directory
date:   2 years, 5 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 2 years, 5 months ago
config: x86_64-randconfig-101-20241009 (https://download.01.org/0day-ci/archive/20241010/202410100424.yhban3O6-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410100424.yhban3O6-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
   drivers/ufs/core/ufshcd.c:1054:4-12: opportunity for str_up_down(scale_up)
   drivers/ufs/core/ufshcd.c:1383:3-11: opportunity for str_up_down(scale_up)
   drivers/ufs/core/ufshcd.c:5726:13-19: opportunity for str_enable_disable(enable)
   drivers/ufs/core/ufshcd.c:5763:3-9: opportunity for str_enable_disable(enable)
   drivers/ufs/core/ufshcd.c:5745:13-16: opportunity for str_enable_disable(set)
>> drivers/ufs/core/ufshcd.c:5732:13-19: opportunity for str_enabled_disabled(enable)
   drivers/ufs/core/ufshcd.c:5770:13-19: opportunity for str_enabled_disabled(enable)
   drivers/ufs/core/ufshcd.c:5749:13-16: opportunity for str_enabled_disabled(set)
>> drivers/ufs/core/ufshcd.c:8517:4-6: opportunity for str_on_off(on)

vim +5732 drivers/ufs/core/ufshcd.c

3b5f3c0d0548b8 drivers/scsi/ufs/ufshcd.c Yue Hu      2021-03-18  5712  
3b5f3c0d0548b8 drivers/scsi/ufs/ufshcd.c Yue Hu      2021-03-18  5713  int ufshcd_wb_toggle(struct ufs_hba *hba, bool enable)
3b5f3c0d0548b8 drivers/scsi/ufs/ufshcd.c Yue Hu      2021-03-18  5714  {
3b5f3c0d0548b8 drivers/scsi/ufs/ufshcd.c Yue Hu      2021-03-18  5715  	int ret;
3d17b9b5ab1155 drivers/scsi/ufs/ufshcd.c Asutosh Das 2020-04-22  5716  
79e3520f82cb91 drivers/scsi/ufs/ufshcd.c Stanley Chu 2020-05-08  5717  	if (!ufshcd_is_wb_allowed(hba))
3d17b9b5ab1155 drivers/scsi/ufs/ufshcd.c Asutosh Das 2020-04-22  5718  		return 0;
3d17b9b5ab1155 drivers/scsi/ufs/ufshcd.c Asutosh Das 2020-04-22  5719  
4cd48995645b45 drivers/scsi/ufs/ufshcd.c Bean Huo    2021-01-19  5720  	if (!(enable ^ hba->dev_info.wb_enabled))
3d17b9b5ab1155 drivers/scsi/ufs/ufshcd.c Asutosh Das 2020-04-22  5721  		return 0;
3d17b9b5ab1155 drivers/scsi/ufs/ufshcd.c Asutosh Das 2020-04-22  5722  
3b5f3c0d0548b8 drivers/scsi/ufs/ufshcd.c Yue Hu      2021-03-18  5723  	ret = __ufshcd_wb_toggle(hba, enable, QUERY_FLAG_IDN_WB_EN);
3d17b9b5ab1155 drivers/scsi/ufs/ufshcd.c Asutosh Das 2020-04-22  5724  	if (ret) {
3b5f3c0d0548b8 drivers/scsi/ufs/ufshcd.c Yue Hu      2021-03-18  5725  		dev_err(hba->dev, "%s Write Booster %s failed %d\n",
3d17b9b5ab1155 drivers/scsi/ufs/ufshcd.c Asutosh Das 2020-04-22  5726  			__func__, enable ? "enable" : "disable", ret);
3d17b9b5ab1155 drivers/scsi/ufs/ufshcd.c Asutosh Das 2020-04-22  5727  		return ret;
3d17b9b5ab1155 drivers/scsi/ufs/ufshcd.c Asutosh Das 2020-04-22  5728  	}
3d17b9b5ab1155 drivers/scsi/ufs/ufshcd.c Asutosh Das 2020-04-22  5729  
4cd48995645b45 drivers/scsi/ufs/ufshcd.c Bean Huo    2021-01-19  5730  	hba->dev_info.wb_enabled = enable;
3b5f3c0d0548b8 drivers/scsi/ufs/ufshcd.c Yue Hu      2021-03-18  5731  	dev_info(hba->dev, "%s Write Booster %s\n",
3b5f3c0d0548b8 drivers/scsi/ufs/ufshcd.c Yue Hu      2021-03-18 @5732  			__func__, enable ? "enabled" : "disabled");
3d17b9b5ab1155 drivers/scsi/ufs/ufshcd.c Asutosh Das 2020-04-22  5733  
3d17b9b5ab1155 drivers/scsi/ufs/ufshcd.c Asutosh Das 2020-04-22  5734  	return ret;
3d17b9b5ab1155 drivers/scsi/ufs/ufshcd.c Asutosh Das 2020-04-22  5735  }
3d17b9b5ab1155 drivers/scsi/ufs/ufshcd.c Asutosh Das 2020-04-22  5736  

:::::: The code at line 5732 was first introduced by commit
:::::: 3b5f3c0d0548b8d963030b8728e380d6d57aa471 scsi: ufs: core: Tidy up WB configuration code

:::::: TO: Yue Hu <huyue2@yulong.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
