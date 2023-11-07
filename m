Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6C234567
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Nov 2023 23:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDpXeRAY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699401337; x=1730937337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BcIiV1f36jNlOZohKtRpB7X5WhE13RCBEWnPLTl46Vw=;
  b=oDpXeRAYhtamdpLADvX6W4+D9Z3qgk0/8PfjB37rhjYQTFr/B2INHgBY
   l7ke4g+ETuTNKQ3Fqv6O/FYhc09broKO//w1U+wCbppSNxGftwMzYzF4d
   61KMPkF6oJVFL7CW5um+E8G8lXLeA6RFsfSmLty8+qLHdB8oQqJDHf3u+
   sUqMdmdaXxxYP6yIF5ceuFtrXyQ3kOCL01v/JZFuCV5dH8tjomJOuBbGh
   Z/WZ/dal6EheXzzL8eyK5BpOwNhPBUc++r2enBmBuakWuUjMEJ5p5Davv
   aSGRfkRx8jEzho1Zsuo0AzYKcjYNu8F1+utjEZJOea4VramSnRm59HMki
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="374691570"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="374691570"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 15:55:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="880009493"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="880009493"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Nov 2023 15:55:21 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0Vuh-0007V2-1A;
	Tue, 07 Nov 2023 23:55:19 +0000
Date: Wed, 8 Nov 2023 07:54:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/scsi/scsi_debug.c:1148 sdebug_target_alloc() error:
 uninitialized symbol 'dentry'.
Message-ID: <202311080710.O86r0PYt-lkp@intel.com>
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
TO: Wenchao Hao <haowenchao2@huawei.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   13d88ac54ddd1011b6e94443958e798aa06eb835
commit: f084fe52c640775de51056670f568ec7104b922a scsi: scsi_debug: Add debugfs interface to fail target reset
date:   3 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-161-20231107 (https://download.01.org/0day-ci/archive/20231108/202311080710.O86r0PYt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231108/202311080710.O86r0PYt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311080710.O86r0PYt-lkp@intel.com/

New smatch warnings:
drivers/scsi/scsi_debug.c:1148 sdebug_target_alloc() error: uninitialized symbol 'dentry'.

Old smatch warnings:
drivers/scsi/scsi_debug.c:8112 scsi_debug_queuecommand() warn: missing error code? 'ret'

vim +/dentry +1148 drivers/scsi/scsi_debug.c

f084fe52c640775 Wenchao Hao 2023-10-10  1130  
f084fe52c640775 Wenchao Hao 2023-10-10  1131  static int sdebug_target_alloc(struct scsi_target *starget)
f084fe52c640775 Wenchao Hao 2023-10-10  1132  {
f084fe52c640775 Wenchao Hao 2023-10-10  1133  	struct sdebug_target_info *targetip;
f084fe52c640775 Wenchao Hao 2023-10-10  1134  	struct dentry *dentry;
f084fe52c640775 Wenchao Hao 2023-10-10  1135  
f084fe52c640775 Wenchao Hao 2023-10-10  1136  	targetip = kzalloc(sizeof(struct sdebug_target_info), GFP_KERNEL);
f084fe52c640775 Wenchao Hao 2023-10-10  1137  	if (!targetip)
f084fe52c640775 Wenchao Hao 2023-10-10  1138  		return -ENOMEM;
f084fe52c640775 Wenchao Hao 2023-10-10  1139  
f084fe52c640775 Wenchao Hao 2023-10-10  1140  	targetip->debugfs_entry = debugfs_create_dir(dev_name(&starget->dev),
f084fe52c640775 Wenchao Hao 2023-10-10  1141  				sdebug_debugfs_root);
f084fe52c640775 Wenchao Hao 2023-10-10  1142  	if (IS_ERR_OR_NULL(targetip->debugfs_entry))
f084fe52c640775 Wenchao Hao 2023-10-10  1143  		pr_info("%s: failed to create debugfs directory for target %s\n",
f084fe52c640775 Wenchao Hao 2023-10-10  1144  			__func__, dev_name(&starget->dev));
f084fe52c640775 Wenchao Hao 2023-10-10  1145  
f084fe52c640775 Wenchao Hao 2023-10-10  1146  	debugfs_create_file("fail_reset", 0600, targetip->debugfs_entry, starget,
f084fe52c640775 Wenchao Hao 2023-10-10  1147  				&sdebug_target_reset_fail_fops);
f084fe52c640775 Wenchao Hao 2023-10-10 @1148  	if (IS_ERR_OR_NULL(dentry))
f084fe52c640775 Wenchao Hao 2023-10-10  1149  		pr_info("%s: failed to create fail_reset file for target %s\n",
f084fe52c640775 Wenchao Hao 2023-10-10  1150  			__func__, dev_name(&starget->dev));
f084fe52c640775 Wenchao Hao 2023-10-10  1151  
f084fe52c640775 Wenchao Hao 2023-10-10  1152  	starget->hostdata = targetip;
f084fe52c640775 Wenchao Hao 2023-10-10  1153  
f084fe52c640775 Wenchao Hao 2023-10-10  1154  	return 0;
f084fe52c640775 Wenchao Hao 2023-10-10  1155  }
f084fe52c640775 Wenchao Hao 2023-10-10  1156  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
