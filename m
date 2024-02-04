Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6673B79D2
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Feb 2024 06:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707029115; cv=none; b=Dzlo7fOykMhc18mJ5VqCOaDmwk3tbjAVfPai5and3B2S2yFlSrYjWp/rM0jDpeKPxGz0hgFpHDs7Z+nHXgRud0KgayJDVDsvQkNM/He8QVe0vqxSIJ5OfSs+W6d++gjfn582R1BGvcTCQtPADCFJmjNFQw0N6fPb7cZxS+DHRZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707029115; c=relaxed/simple;
	bh=w5E3zWqXeI1pEWRS+tjjfGeGIGuIKQYD3DMNYsT7fJM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=suws9vVxXiJW2+YDwuNrtVzaSL9ex7iO+1YyDwOtgqct8lT23nZW7ahTX3zJZuEy4tthSYQVBIQFONYK/yNiCJsaGQbDtgeK8NznOzbb6eSsnOx4TPMexldFPxb8uVtw7w5ASezeLn5GPfrGvkK5QGq+V4ZtevjdMH79tlfyT4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hMjK3C4v; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hMjK3C4v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707029113; x=1738565113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w5E3zWqXeI1pEWRS+tjjfGeGIGuIKQYD3DMNYsT7fJM=;
  b=hMjK3C4vevKAq3QfUMtyvFiXfni7bQgt4GZduptA+BIaLhVRAvUyLrHD
   msNG+SN8aWj6gX2oP7w0Wgf1vXClLQwh9/3jzwFTXGeA3Xeq8MIK2ZS62
   3g+rqlig5khebwQf4bIWNyQigI8kSvBjFK9g/D1A47MJmvDPNaTt+cibQ
   qP2Mkbemjr3whjnGv2U1zIOcOrzpN9MvEHjF09a2x335ABKpB9+Zh7iIP
   Bacv+Ba7HBUatxYtzdQ9VbAMghD5cMIzuva01796z9/FZj3kyd4Mg+zJm
   EdmkOu3Iw5zBAsiQzy7tHqZPp0dGLn3cI7sbnWyONKskGhLngZ9Jun4VF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="258982"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="258982"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 22:45:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="5064481"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 03 Feb 2024 22:45:11 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWWFZ-00065Y-0p;
	Sun, 04 Feb 2024 06:45:09 +0000
Date: Sun, 4 Feb 2024 14:44:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kdave-btrfs-devel:fix-6.7-device-scanning 1/1]
 fs/btrfs/super.c:2307 btrfs_show_devname() warn: '"/dev/"'
 2990484215268388864 can't fit into 255 'real[0]'
Message-ID: <202402041421.rSSxBjWq-lkp@intel.com>
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
TO: David Sterba <dsterba@suse.com>

tree:   https://github.com/kdave/btrfs-devel.git fix-6.7-device-scanning
head:   c9a96c234f18aeb5d5760a8e90a20971ec75be41
commit: c9a96c234f18aeb5d5760a8e90a20971ec75be41 [1/1] btrfs: fix device name in /proc/self/mountinfo
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: x86_64-randconfig-161-20240204 (https://download.01.org/0day-ci/archive/20240204/202402041421.rSSxBjWq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402041421.rSSxBjWq-lkp@intel.com/

New smatch warnings:
fs/btrfs/super.c:2307 btrfs_show_devname() warn: '"/dev/"' 2990484215268388864 can't fit into 255 'real[0]'

Old smatch warnings:
fs/btrfs/super.c:2180 btrfs_control_ioctl() warn: passing zero to 'PTR_ERR'

vim +2307 fs/btrfs/super.c

9e7cc91a6d18a4 Wang Xiaoguang 2016-08-01  2303  
9c5085c147989d Josef Bacik    2012-06-05  2304  static int btrfs_show_devname(struct seq_file *m, struct dentry *root)
9c5085c147989d Josef Bacik    2012-06-05  2305  {
9c5085c147989d Josef Bacik    2012-06-05  2306  	struct btrfs_fs_info *fs_info = btrfs_sb(root->d_sb);
c9a96c234f18ae David Sterba   2024-02-03 @2307  	char real[4096] = { "/dev/" };
9c5085c147989d Josef Bacik    2012-06-05  2308  
88c14590cdd6f3 David Sterba   2018-03-16  2309  	/*
6605fd2f394bba Anand Jain     2021-08-24  2310  	 * There should be always a valid pointer in latest_dev, it may be stale
6605fd2f394bba Anand Jain     2021-08-24  2311  	 * for a short moment in case it's being deleted but still valid until
6605fd2f394bba Anand Jain     2021-08-24  2312  	 * the end of RCU grace period.
88c14590cdd6f3 David Sterba   2018-03-16  2313  	 */
88c14590cdd6f3 David Sterba   2018-03-16  2314  	rcu_read_lock();
c9a96c234f18ae David Sterba   2024-02-03  2315  	scnprintf(real + 5, sizeof(real) - 5, "%pg", fs_info->fs_devices->latest_dev->bdev);
c9a96c234f18ae David Sterba   2024-02-03  2316  	seq_puts(m, real);
88c14590cdd6f3 David Sterba   2018-03-16  2317  	rcu_read_unlock();
6605fd2f394bba Anand Jain     2021-08-24  2318  
9c5085c147989d Josef Bacik    2012-06-05  2319  	return 0;
9c5085c147989d Josef Bacik    2012-06-05  2320  }
9c5085c147989d Josef Bacik    2012-06-05  2321  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
