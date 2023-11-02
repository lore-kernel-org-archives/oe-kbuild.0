Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8E028FA
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Nov 2023 18:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PgCi1PKi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698950221; x=1730486221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a7m3TiOeH3mjvFaATsNIdvBCsMc43n4hrPCrfHuT+rg=;
  b=PgCi1PKiapNRKTEVDqpzvyIsyQxWA9BAicGsT/4aaf1+HV9lgGFGarRG
   /td+NP6Tgw5WenUJHHDb9yKPNI+fcwrZ8sV5FK70jYt5+vgLAafckc8d9
   m2u3y2XFdxHovJqu9Z+eRnc4jOTKoKpudDNv86eQmqy/uMEV1jAeKwpq2
   Xf82IRS2leaMDxxA33X/jcDai+mYVQUPRDlkhGzLDHT61eDWNJnz1rS3G
   5IwcjuwMks8pEo94BMDk10+/t19BK+mZlSao6siiqqNHORSAGVZF8PBwZ
   XJqjnb0n2NbsgF+i/s4sqoS473VtUm6wGOxcx3m5CCrk5ygPKkAjh6xB1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="373823543"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="373823543"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 11:37:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="711249459"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="711249459"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Nov 2023 11:37:00 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qycYr-0001lc-1O;
	Thu, 02 Nov 2023 18:36:57 +0000
Date: Fri, 3 Nov 2023 02:36:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/phy/mediatek/phy-mtk-tphy.c:477:25: sparse: sparse: dubious:
 x & !y
Message-ID: <202311030234.CCNXN9Rs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/phy/mediatek/phy-mtk-tphy.c:477:25: sparse: sparse: dubious: x & !y"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Chunfeng Yun <chunfeng.yun@mediatek.com>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   21e80f3841c01aeaf32d7aee7bbc87b3db1aa0c6
commit: e45076007e358ff1e934ab009cf68ee723f6f1fd phy: mediatek: tphy: add debugfs files
date:   6 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 6 months ago
config: nios2-randconfig-r132-20231102 (https://download.01.org/0day-ci/archive/20231103/202311030234.CCNXN9Rs-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231103/202311030234.CCNXN9Rs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311030234.CCNXN9Rs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/mediatek/phy-mtk-tphy.c:477:25: sparse: sparse: dubious: x & !y
   drivers/phy/mediatek/phy-mtk-tphy.c:594:17: sparse: sparse: dubious: x & !y

vim +477 drivers/phy/mediatek/phy-mtk-tphy.c

e45076007e358f Chunfeng Yun 2023-05-13  445  
e45076007e358f Chunfeng Yun 2023-05-13  446  static ssize_t u2_phy_params_write(struct file *file, const char __user *ubuf,
e45076007e358f Chunfeng Yun 2023-05-13  447  				   size_t count, loff_t *ppos)
e45076007e358f Chunfeng Yun 2023-05-13  448  {
e45076007e358f Chunfeng Yun 2023-05-13  449  	const char *fname = file_dentry(file)->d_iname;
e45076007e358f Chunfeng Yun 2023-05-13  450  	struct seq_file *sf = file->private_data;
e45076007e358f Chunfeng Yun 2023-05-13  451  	struct mtk_phy_instance *inst = sf->private;
e45076007e358f Chunfeng Yun 2023-05-13  452  	struct u2phy_banks *u2_banks = &inst->u2_banks;
e45076007e358f Chunfeng Yun 2023-05-13  453  	void __iomem *com = u2_banks->com;
e45076007e358f Chunfeng Yun 2023-05-13  454  	ssize_t rc;
e45076007e358f Chunfeng Yun 2023-05-13  455  	u32 val;
e45076007e358f Chunfeng Yun 2023-05-13  456  	int ret;
e45076007e358f Chunfeng Yun 2023-05-13  457  
e45076007e358f Chunfeng Yun 2023-05-13  458  	rc = kstrtouint_from_user(ubuf, USER_BUF_LEN(count), 0, &val);
e45076007e358f Chunfeng Yun 2023-05-13  459  	if (rc)
e45076007e358f Chunfeng Yun 2023-05-13  460  		return rc;
e45076007e358f Chunfeng Yun 2023-05-13  461  
e45076007e358f Chunfeng Yun 2023-05-13  462  	ret = match_string(u2_phy_files, ARRAY_SIZE(u2_phy_files), fname);
e45076007e358f Chunfeng Yun 2023-05-13  463  	if (ret < 0)
e45076007e358f Chunfeng Yun 2023-05-13  464  		return (ssize_t)ret;
e45076007e358f Chunfeng Yun 2023-05-13  465  
e45076007e358f Chunfeng Yun 2023-05-13  466  	switch (ret) {
e45076007e358f Chunfeng Yun 2023-05-13  467  	case U2P_EYE_VRT:
e45076007e358f Chunfeng Yun 2023-05-13  468  		mtk_phy_update_field(com + U3P_USBPHYACR1, PA1_RG_VRT_SEL, val);
e45076007e358f Chunfeng Yun 2023-05-13  469  		break;
e45076007e358f Chunfeng Yun 2023-05-13  470  
e45076007e358f Chunfeng Yun 2023-05-13  471  	case U2P_EYE_TERM:
e45076007e358f Chunfeng Yun 2023-05-13  472  		mtk_phy_update_field(com + U3P_USBPHYACR1, PA1_RG_TERM_SEL, val);
e45076007e358f Chunfeng Yun 2023-05-13  473  		break;
e45076007e358f Chunfeng Yun 2023-05-13  474  
e45076007e358f Chunfeng Yun 2023-05-13  475  	case U2P_EFUSE_EN:
e45076007e358f Chunfeng Yun 2023-05-13  476  		if (u2_banks->misc)
e45076007e358f Chunfeng Yun 2023-05-13 @477  			mtk_phy_update_field(u2_banks->misc + U3P_MISC_REG1,
e45076007e358f Chunfeng Yun 2023-05-13  478  					     MR1_EFUSE_AUTO_LOAD_DIS, !!val);
e45076007e358f Chunfeng Yun 2023-05-13  479  		break;
e45076007e358f Chunfeng Yun 2023-05-13  480  
e45076007e358f Chunfeng Yun 2023-05-13  481  	case U2P_EFUSE_INTR:
e45076007e358f Chunfeng Yun 2023-05-13  482  		mtk_phy_update_field(com + U3P_USBPHYACR1, PA1_RG_INTR_CAL, val);
e45076007e358f Chunfeng Yun 2023-05-13  483  		break;
e45076007e358f Chunfeng Yun 2023-05-13  484  
e45076007e358f Chunfeng Yun 2023-05-13  485  	case U2P_DISCTH:
e45076007e358f Chunfeng Yun 2023-05-13  486  		mtk_phy_update_field(com + U3P_USBPHYACR6, PA6_RG_U2_DISCTH, val);
e45076007e358f Chunfeng Yun 2023-05-13  487  		break;
e45076007e358f Chunfeng Yun 2023-05-13  488  
e45076007e358f Chunfeng Yun 2023-05-13  489  	case U2P_PRE_EMPHASIS:
e45076007e358f Chunfeng Yun 2023-05-13  490  		mtk_phy_update_field(com + U3P_USBPHYACR6, PA6_RG_U2_PRE_EMP, val);
e45076007e358f Chunfeng Yun 2023-05-13  491  		break;
e45076007e358f Chunfeng Yun 2023-05-13  492  
e45076007e358f Chunfeng Yun 2023-05-13  493  	default:
e45076007e358f Chunfeng Yun 2023-05-13  494  		break;
e45076007e358f Chunfeng Yun 2023-05-13  495  	}
e45076007e358f Chunfeng Yun 2023-05-13  496  
e45076007e358f Chunfeng Yun 2023-05-13  497  	return count;
e45076007e358f Chunfeng Yun 2023-05-13  498  }
e45076007e358f Chunfeng Yun 2023-05-13  499  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
