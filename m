Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71625156677
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717533; cv=none; b=t+94WJkTvU7UlGOaftSLIq77d8XCAr3SvSQRIVTes9qx/oeEcTb+wFm56Z+WvFwXoIqXJyath18KfflIHszcr92lf275jwG+Evn7ks02Z/kMS+RK3AqVS7ekzwEi4hMfWwNgnL5EiYp5biY7FMB8BzrWazWxJoJrpel9Im80XAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717533; c=relaxed/simple;
	bh=CI4HDwjJnAUb1DXOtrkMJKVqUY7GivVPFLt94QT9ePM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=APHnTdZZAKpXwy9eTpKmdrNsgSWCKJu+pLm2iDcbTRc9l9vEg4AJneKegPuMDC/pJt3N7HJ5uj3zCblRVAxbTXAfY8ggIEOSggEPCBGqWYk3KX7uTzlET0mMWaNv8pV6cr2st7bxS598Gq8RxQD1YZUGjMQLfJ8BbfbU48Tw33A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+sKn/mt; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+sKn/mt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717532; x=1765253532;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CI4HDwjJnAUb1DXOtrkMJKVqUY7GivVPFLt94QT9ePM=;
  b=V+sKn/mtB/lFKA8gwlIS5KJsfWDbJIKDB1vzZHhOqc1jq3/hEHhpeqK3
   u4sCk5wsa14sw/ah3M9ZaHsv7CvSZuJZNblk1KcDdYgj7d7eg6V2FfQj/
   gNBu2cuf2Xvy8mx6Kcy2t1aSWFhC1kmH19uC5tNW9f/3o2+T2vgJgTccC
   XA13ng5kKWRLvViX0znQ2WSZpepxoz3djmrNWG5nzKPTiWbEOpAhWiQzn
   sKjKd9jt/QGfbp5uvrQBFA+RdnHjizts2quFddiVuoItRwXc00roG8cTo
   880gt/PmUBJI/DAcPa9/7IlUQ02R1A1A3o2X7s8XsP7+L7SipVWqs+1c/
   w==;
X-CSE-ConnectionGUID: RxN1/kuRRICHRDfbKB3f4Q==
X-CSE-MsgGUID: ExfDJwsZQ32+1fOnTREnMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33891391"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33891391"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:12:10 -0800
X-CSE-ConnectionGUID: c2sLZt/sRaqvJ7Ngt/R2gw==
X-CSE-MsgGUID: /tXK2I7GRWSRXYhuaOagJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99775555"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Dec 2024 20:12:08 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKV7t-0003oF-29;
	Mon, 09 Dec 2024 04:12:05 +0000
Date: Mon, 9 Dec 2024 12:11:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH V5 net-next 1/8] debugfs: Add debugfs_create_devm_dir()
 helper
Message-ID: <202412071523.XnSXmPPZ-lkp@intel.com>
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
In-Reply-To: <20241206111629.3521865-2-shaojijie@huawei.com>
References: <20241206111629.3521865-2-shaojijie@huawei.com>
TO: Jijie Shao <shaojijie@huawei.com>
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: andrew+netdev@lunn.ch
TO: horms@kernel.org
TO: gregkh@linuxfoundation.org
CC: shenjian15@huawei.com
CC: wangpeiyang1@huawei.com
CC: liuyonglong@huawei.com
CC: chenhao418@huawei.com
CC: sudongming1@huawei.com
CC: xujunsheng@huawei.com
CC: shiyongbang@huawei.com
CC: libaihan@huawei.com
CC: jonathan.cameron@huawei.com
CC: shameerali.kolothum.thodi@huawei.com
CC: salil.mehta@huawei.com
CC: netdev@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: shaojijie@huawei.com
CC: hkelam@marvell.com

Hi Jijie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jijie-Shao/debugfs-Add-debugfs_create_devm_dir-helper/20241206-192734
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241206111629.3521865-2-shaojijie%40huawei.com
patch subject: [PATCH V5 net-next 1/8] debugfs: Add debugfs_create_devm_dir() helper
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: i386-randconfig-141-20241206 (https://download.01.org/0day-ci/archive/20241207/202412071523.XnSXmPPZ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412071523.XnSXmPPZ-lkp@intel.com/

smatch warnings:
fs/debugfs/inode.c:643 debugfs_create_devm_dir() warn: unchecked 'ERR_PTR'

vim +/ERR_PTR +643 fs/debugfs/inode.c

d44644eefac450 Jijie Shao 2024-12-06  619  
d44644eefac450 Jijie Shao 2024-12-06  620  /**
d44644eefac450 Jijie Shao 2024-12-06  621   * debugfs_create_devm_dir - Managed debugfs_create_dir()
d44644eefac450 Jijie Shao 2024-12-06  622   * @dev: Device that owns the action
d44644eefac450 Jijie Shao 2024-12-06  623   * @name: a pointer to a string containing the name of the directory to
d44644eefac450 Jijie Shao 2024-12-06  624   *        create.
d44644eefac450 Jijie Shao 2024-12-06  625   * @parent: a pointer to the parent dentry for this file.  This should be a
d44644eefac450 Jijie Shao 2024-12-06  626   *          directory dentry if set.  If this parameter is NULL, then the
d44644eefac450 Jijie Shao 2024-12-06  627   *          directory will be created in the root of the debugfs filesystem.
d44644eefac450 Jijie Shao 2024-12-06  628   * Managed debugfs_create_dir(). dentry will automatically be remove on
d44644eefac450 Jijie Shao 2024-12-06  629   * driver detach.
d44644eefac450 Jijie Shao 2024-12-06  630   */
d44644eefac450 Jijie Shao 2024-12-06  631  struct dentry *debugfs_create_devm_dir(struct device *dev, const char *name,
d44644eefac450 Jijie Shao 2024-12-06  632  				       struct dentry *parent)
d44644eefac450 Jijie Shao 2024-12-06  633  {
d44644eefac450 Jijie Shao 2024-12-06  634  	struct dentry *dentry;
d44644eefac450 Jijie Shao 2024-12-06  635  	int ret;
d44644eefac450 Jijie Shao 2024-12-06  636  
d44644eefac450 Jijie Shao 2024-12-06  637  	dentry = debugfs_create_dir(name, parent);
d44644eefac450 Jijie Shao 2024-12-06  638  	if (IS_ERR(dentry))
d44644eefac450 Jijie Shao 2024-12-06  639  		return dentry;
d44644eefac450 Jijie Shao 2024-12-06  640  
d44644eefac450 Jijie Shao 2024-12-06  641  	ret = devm_add_action_or_reset(dev, debugfs_remove_devm, dentry);
d44644eefac450 Jijie Shao 2024-12-06  642  	if (ret)
d44644eefac450 Jijie Shao 2024-12-06 @643  		ERR_PTR(ret);
d44644eefac450 Jijie Shao 2024-12-06  644  
d44644eefac450 Jijie Shao 2024-12-06  645  	return dentry;
d44644eefac450 Jijie Shao 2024-12-06  646  }
d44644eefac450 Jijie Shao 2024-12-06  647  EXPORT_SYMBOL_GPL(debugfs_create_devm_dir);
d44644eefac450 Jijie Shao 2024-12-06  648  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
