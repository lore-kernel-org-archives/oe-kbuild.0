Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0C6433DC
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Jun 2024 16:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718986697; cv=none; b=FsGb0Bh+FyghKgLDBqre8tLI2hqpHhJujaUcFMbFMcd5+e/n2mvsFw0PejnbrmNCbxviRM6yeBIx9usP45Rpd/RiTKGk9WfxIi102G48sYsWUQe31G0y6zYmbwcrEIVTMb3B5xUGX27mpnfg+rhwD4Rb2jLQLvM3mcT1mhjYywo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718986697; c=relaxed/simple;
	bh=/mGvu+4kjoJCLe3BMGKyHm6eXMLS0W8W9DiV7Yt2pUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tiz0xfxBk6grOqP4IRzqwNuws6wH3OM1w9gpb4QOFJjVzLlh6rttE26Zd/1gu8t+z8euVjFqPUvc9Ha4XppZwG6cmMd60ISIrLN5j6LGfYy+/7QEQsPOv965eW+XHPWycBbDtJSYEf5fB09+QG9Gf7qWS42qN3VyJ3yFQj4PL4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V93NEqS6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V93NEqS6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718986696; x=1750522696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/mGvu+4kjoJCLe3BMGKyHm6eXMLS0W8W9DiV7Yt2pUc=;
  b=V93NEqS6H2oJR6Mad8QF1E09ps85DJBuKbK65Wv2PxkgWbcjp1oVufVQ
   lPpKtrvDp02Pm74fBZ1HCtTWCXzdFM3xewcfcVVO+mQpB4tZBDLCYS1xC
   jvvuItSahr8X+CcsN0VLi6hoTxlbL2/CGdDddH5D5bP7syvvkFRvp3vMc
   FW/Ph/8a8MRREPc12SWdfORzbwU5lqkGad77tNFf+NsKmHOXMOC0Khy19
   cNd1u+DUanundDan3JXkbfkMC0cpdXMxhzkWZLYLLfk8BtK89jMVfiLCU
   ekgKzy71l5YXpsD48AtVdR+YNnPb4+upIM44Z42v4YgVo3HvkMbxfuXlS
   g==;
X-CSE-ConnectionGUID: ms5pU1afQSWp8qCC66me/w==
X-CSE-MsgGUID: QET0kXo+T4COcxF55JVbCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="19913850"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="19913850"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 09:17:13 -0700
X-CSE-ConnectionGUID: acET+9IoSiaK20Yp1QVvLg==
X-CSE-MsgGUID: ufl0weNTQD+gJ0JzpU52FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="65886856"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Jun 2024 09:17:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKgwn-0008kA-2D;
	Fri, 21 Jun 2024 16:17:09 +0000
Date: Sat, 22 Jun 2024 00:16:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cip:linux-4.4.y-cip 6099/9999] drivers/base/power/opp/debugfs.c:166
 opp_migrate_dentry() warn: iterator used outside loop: 'new_dev'
Message-ID: <202406220055.EHZ0YBTG-lkp@intel.com>
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
TO: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
TO: Pavel Machek <pavel@denx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-cip
head:   bffa4a10103910f87f99a27cf26a0ac17a612b58
commit: 71a6dee18e9b677772dcd33c7180c5cdb71b1f25 [6099/9999] PM / OPP: Add debugfs support
:::::: branch date: 4 days ago
:::::: commit date: 4 years ago
config: i386-randconfig-141-20240621 (https://download.01.org/0day-ci/archive/20240622/202406220055.EHZ0YBTG-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406220055.EHZ0YBTG-lkp@intel.com/

smatch warnings:
drivers/base/power/opp/debugfs.c:166 opp_migrate_dentry() warn: iterator used outside loop: 'new_dev'

vim +/new_dev +166 drivers/base/power/opp/debugfs.c

71a6dee18e9b67 Viresh Kumar 2020-06-09  152  
71a6dee18e9b67 Viresh Kumar 2020-06-09  153  static void opp_migrate_dentry(struct device_list_opp *list_dev,
71a6dee18e9b67 Viresh Kumar 2020-06-09  154  			       struct device_opp *dev_opp)
71a6dee18e9b67 Viresh Kumar 2020-06-09  155  {
71a6dee18e9b67 Viresh Kumar 2020-06-09  156  	struct device_list_opp *new_dev;
71a6dee18e9b67 Viresh Kumar 2020-06-09  157  	const struct device *dev;
71a6dee18e9b67 Viresh Kumar 2020-06-09  158  	struct dentry *dentry;
71a6dee18e9b67 Viresh Kumar 2020-06-09  159  
71a6dee18e9b67 Viresh Kumar 2020-06-09  160  	/* Look for next list-dev */
71a6dee18e9b67 Viresh Kumar 2020-06-09  161  	list_for_each_entry(new_dev, &dev_opp->dev_list, node)
71a6dee18e9b67 Viresh Kumar 2020-06-09  162  		if (new_dev != list_dev)
71a6dee18e9b67 Viresh Kumar 2020-06-09  163  			break;
71a6dee18e9b67 Viresh Kumar 2020-06-09  164  
71a6dee18e9b67 Viresh Kumar 2020-06-09  165  	/* new_dev is guaranteed to be valid here */
71a6dee18e9b67 Viresh Kumar 2020-06-09 @166  	dev = new_dev->dev;
71a6dee18e9b67 Viresh Kumar 2020-06-09  167  	debugfs_remove_recursive(new_dev->dentry);
71a6dee18e9b67 Viresh Kumar 2020-06-09  168  
71a6dee18e9b67 Viresh Kumar 2020-06-09  169  	opp_set_dev_name(dev, dev_opp->dentry_name);
71a6dee18e9b67 Viresh Kumar 2020-06-09  170  
71a6dee18e9b67 Viresh Kumar 2020-06-09  171  	dentry = debugfs_rename(rootdir, list_dev->dentry, rootdir,
71a6dee18e9b67 Viresh Kumar 2020-06-09  172  				dev_opp->dentry_name);
71a6dee18e9b67 Viresh Kumar 2020-06-09  173  	if (!dentry) {
71a6dee18e9b67 Viresh Kumar 2020-06-09  174  		dev_err(dev, "%s: Failed to rename link from: %s to %s\n",
71a6dee18e9b67 Viresh Kumar 2020-06-09  175  			__func__, dev_name(list_dev->dev), dev_name(dev));
71a6dee18e9b67 Viresh Kumar 2020-06-09  176  		return;
71a6dee18e9b67 Viresh Kumar 2020-06-09  177  	}
71a6dee18e9b67 Viresh Kumar 2020-06-09  178  
71a6dee18e9b67 Viresh Kumar 2020-06-09  179  	new_dev->dentry = dentry;
71a6dee18e9b67 Viresh Kumar 2020-06-09  180  	dev_opp->dentry = dentry;
71a6dee18e9b67 Viresh Kumar 2020-06-09  181  }
71a6dee18e9b67 Viresh Kumar 2020-06-09  182  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
