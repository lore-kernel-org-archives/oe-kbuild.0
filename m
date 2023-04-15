Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63E92103
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Apr 2023 13:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681564243; x=1713100243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pBkDLJAnlPZMzTL57MiaRj6oHRFrvO0gphdqoXno2CU=;
  b=CZJw1+wc0M2KRxYuRcc1YQ2r6qrXZItN3tV94rIJXHqptjIXDnYXIPA8
   2dVwoLXT7/n5+JXOufLSO22chpAIBOyiTjjWXNIcTJtmxpIJnX1Z8D/jo
   6HFJaiKX3z0HQU2iaTrCYEPsfuXgFcGVvT5ar8XeeMIgxOTlzbGtjlprz
   MhqYSFS/h0efoFg07ny4MeC6mRVE1QpVdQiobPmCx7FEWY7RhisHQuXmG
   mbjIUyZkU9FEPLFhFgdAL84E6bzkvlb/3B5O/xkDe+UkmpzGDUsFCADzq
   EthetuXgZLVMFJXUY5LasL3EkajJTKtfoff1G/GhnSBK3Sc8E9AypaJBd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="342138352"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="342138352"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 06:10:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="692770274"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="692770274"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 15 Apr 2023 06:10:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnffs-000b2x-1B;
	Sat, 15 Apr 2023 13:10:40 +0000
Date: Sat, 15 Apr 2023 21:10:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/ath/ath11k/debugfs.c:1009
 ath11k_debugfs_soc_create() warn: passing zero to 'PTR_ERR'
Message-ID: <202304152142.ssXYxFdQ-lkp@intel.com>
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
TO: Kalle Valo <quic_kvalo@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7a934f4bd7d6f9da84c8812da3ba42ee10f5778e
commit: 323d91d4684d238f6bc3693fed93caf795378fe0 wifi: ath11k: debugfs: fix to work with multiple PCI devices
date:   3 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 3 months ago
config: openrisc-randconfig-m041-20230414 (https://download.01.org/0day-ci/archive/20230415/202304152142.ssXYxFdQ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304152142.ssXYxFdQ-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath11k/debugfs.c:1009 ath11k_debugfs_soc_create() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/net/wireless/ath/ath11k/debugfs.c:882 ath11k_write_fw_dbglog() warn: potential spectre issue 'ar->debug.module_id_bitmap' [w] (local cap)
drivers/net/wireless/ath/ath11k/debugfs.c:1022 ath11k_debugfs_soc_create() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1009 drivers/net/wireless/ath/ath11k/debugfs.c

da3a9d3c15769b Kalle Valo 2020-09-16   997  
cb4e57db2ff0c8 Kalle Valo 2020-09-16   998  int ath11k_debugfs_soc_create(struct ath11k_base *ab)
da3a9d3c15769b Kalle Valo 2020-09-16   999  {
323d91d4684d23 Kalle Valo 2022-12-22  1000  	struct dentry *root;
323d91d4684d23 Kalle Valo 2022-12-22  1001  	bool dput_needed;
323d91d4684d23 Kalle Valo 2022-12-22  1002  	char name[64];
323d91d4684d23 Kalle Valo 2022-12-22  1003  	int ret;
323d91d4684d23 Kalle Valo 2022-12-22  1004  
323d91d4684d23 Kalle Valo 2022-12-22  1005  	root = debugfs_lookup("ath11k", NULL);
323d91d4684d23 Kalle Valo 2022-12-22  1006  	if (!root) {
323d91d4684d23 Kalle Valo 2022-12-22  1007  		root = debugfs_create_dir("ath11k", NULL);
323d91d4684d23 Kalle Valo 2022-12-22  1008  		if (IS_ERR_OR_NULL(root))
323d91d4684d23 Kalle Valo 2022-12-22 @1009  			return PTR_ERR(root);
323d91d4684d23 Kalle Valo 2022-12-22  1010  
323d91d4684d23 Kalle Valo 2022-12-22  1011  		dput_needed = false;
323d91d4684d23 Kalle Valo 2022-12-22  1012  	} else {
323d91d4684d23 Kalle Valo 2022-12-22  1013  		/* a dentry from lookup() needs dput() after we don't use it */
323d91d4684d23 Kalle Valo 2022-12-22  1014  		dput_needed = true;
323d91d4684d23 Kalle Valo 2022-12-22  1015  	}
323d91d4684d23 Kalle Valo 2022-12-22  1016  
323d91d4684d23 Kalle Valo 2022-12-22  1017  	scnprintf(name, sizeof(name), "%s-%s", ath11k_bus_str(ab->hif.bus),
323d91d4684d23 Kalle Valo 2022-12-22  1018  		  dev_name(ab->dev));
da3a9d3c15769b Kalle Valo 2020-09-16  1019  
323d91d4684d23 Kalle Valo 2022-12-22  1020  	ab->debugfs_soc = debugfs_create_dir(name, root);
323d91d4684d23 Kalle Valo 2022-12-22  1021  	if (IS_ERR_OR_NULL(ab->debugfs_soc)) {
323d91d4684d23 Kalle Valo 2022-12-22  1022  		ret = PTR_ERR(ab->debugfs_soc);
323d91d4684d23 Kalle Valo 2022-12-22  1023  		goto out;
323d91d4684d23 Kalle Valo 2022-12-22  1024  	}
323d91d4684d23 Kalle Valo 2022-12-22  1025  
323d91d4684d23 Kalle Valo 2022-12-22  1026  	ret = 0;
323d91d4684d23 Kalle Valo 2022-12-22  1027  
323d91d4684d23 Kalle Valo 2022-12-22  1028  out:
323d91d4684d23 Kalle Valo 2022-12-22  1029  	if (dput_needed)
323d91d4684d23 Kalle Valo 2022-12-22  1030  		dput(root);
323d91d4684d23 Kalle Valo 2022-12-22  1031  
323d91d4684d23 Kalle Valo 2022-12-22  1032  	return ret;
da3a9d3c15769b Kalle Valo 2020-09-16  1033  }
da3a9d3c15769b Kalle Valo 2020-09-16  1034  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
