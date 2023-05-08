Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278835CB0
	for <oe-kbuild@lists.linux.dev>; Mon,  8 May 2023 05:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683522026; x=1715058026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2rV0EfwSIt6XHpk9NmXzAsVe8Bk3xx2O2m47q4l8NOE=;
  b=DrC/TTwtfgHdZNytkcw4XQlf69U8WGF1PAngfADDaq7tNMTqFMWyl8Dn
   3vZGEKt2zqsaDUxkmbWEl2V9gKVuD+DdrRd5AXAyGaKvrCEWRHd3kLWop
   Hgfzx3Jy8qPBYpe8OR8PaCbzj2DthGOyHXiX4L2bKr5K/E4tJ8Kl1EV5x
   M9d9v/3CU3s2aaosdfx7oaPwXv030p033ytK5pGaldWquLTc95TLpbK7n
   nTVXCrXN1Hwbd99jbJZdlIupCbc89wU8EZ61guXpplewy1Y8aaOd9lg70
   LjzGJO1kiyRtAs1vO0SxFYb8hUN10MHVB9ddp058S9M9RyWj2XreP2W9T
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="347025623"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="347025623"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 22:00:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="822544216"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="822544216"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 May 2023 22:00:23 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvsz1-00013Z-09;
	Mon, 08 May 2023 05:00:23 +0000
Date: Mon, 8 May 2023 13:00:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/ath/ath11k/debugfs.c:1009
 ath11k_debugfs_soc_create() warn: passing zero to 'PTR_ERR'
Message-ID: <202305081256.SwAOnoIq-lkp@intel.com>
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
head:   ac9a78681b921877518763ba0e89202254349d1b
commit: 323d91d4684d238f6bc3693fed93caf795378fe0 wifi: ath11k: debugfs: fix to work with multiple PCI devices
date:   4 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-m041-20230428 (https://download.01.org/0day-ci/archive/20230508/202305081256.SwAOnoIq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305081256.SwAOnoIq-lkp@intel.com/

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
