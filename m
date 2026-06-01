Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603093E1CE1
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Jun 2026 18:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780337117; cv=none; b=QEjVNVFXuJs3+9mQJhQjTz+zkGy6TAbvmQqyUI2uWsTCI3GSY87eaPbiQUIMhsWeCOQahPlA2hr2qSoIeXBTZ9M4e1ahDfu/XbNFW/i+OVnWkeRh8RLIj/nlzhvHwAoYa1R8HlfBb9De65oAzUFWID2Cc7J6XiFFR+T1O6mZghM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780337117; c=relaxed/simple;
	bh=VYccNQver61r1KpdUJPZZPhmXi0O5ec3VEVwkX43Plg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mUsm+DsSNHKpYr9Kw6LUgFferCwQS2U8EzV3MrBwH3E1Srts8JOPK8WG14BZB5y4YvRBTvgwqZlHj12zPJukemiNrhR3C3i6p1bk4h7S1ie8e92ptsbebH+zriYr5pPHIcgZ+/F0TalZy8uHwlcr8NBqIToA1dGbuNIxfWwacHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MmpPnNK3; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MmpPnNK3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780337116; x=1811873116;
  h=date:from:to:cc:subject:message-id;
  bh=VYccNQver61r1KpdUJPZZPhmXi0O5ec3VEVwkX43Plg=;
  b=MmpPnNK3z3pkY5k+mG3vS3Eu7tqqE/uwPHLh7kN2cwm8NthyMsfYubCI
   9UvNHfVkKuO981TFrpf0SpnmdwKzaoZN28v6xAQGpHxkLFURXpr62cFO1
   TBXAQTDLKnbE/IENMbJrb7IczY5e0KKjOMGDZPP0MwYakL/I1Df+NRE2A
   Iom5cbgT+p2j4hDBEDBQmyRHCxXHeK618Q9k4r98cEyUnET7SuP2zYYmR
   EgGSG2Y9XnQUCiYV5LNWClgJFlsgTeEf5AZr4OiU7SVhzcHV+0FSSG3lj
   NKXDO32KteroyCjDWrDzAjbC/5yF+OrxJuZhfUwW7bxbgZXleUk9tahv8
   Q==;
X-CSE-ConnectionGUID: 8eA+I55NSZCdWnJyoNq91A==
X-CSE-MsgGUID: rhSCWZAuTWe19vHeEE2p3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="80952577"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="80952577"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 11:05:16 -0700
X-CSE-ConnectionGUID: RqfwYb2nSraadNG2KBftKA==
X-CSE-MsgGUID: mmtIbNfkRe2pEA1SEF0mKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="267531611"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 Jun 2026 11:05:15 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU70i-00000000Auu-2i6U;
	Mon, 01 Jun 2026 18:05:12 +0000
Date: Tue, 02 Jun 2026 02:04:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 632/2910] fs/namespace.c:3865
 lock_mount_exact() warn: inconsistent returns '&dentry->d_inode->i_rwsem'.
Message-ID: <202606020145.I1sIvDYo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7da7f07112610a520567421dd2ffcb51beaefbcc
commit: a41dbf5e004edbe1260883c43a8bd134d9cb0c1c [632/2910] mount: hold namespace_sem across copy in create_new_namespace()
:::::: branch date: 3 days ago
:::::: commit date: 3 months ago
config: sparc-randconfig-r071-20260601 (https://download.01.org/0day-ci/archive/20260602/202606020145.I1sIvDYo-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606020145.I1sIvDYo-lkp@intel.com/

New smatch warnings:
fs/namespace.c:3865 lock_mount_exact() warn: inconsistent returns '&dentry->d_inode->i_rwsem'.

Old smatch warnings:
fs/namespace.c:1406 mntput_no_expire() warn: inconsistent returns 'rcu_read'.
fs/namespace.c:2825 may_change_propagation() warn: inconsistent indenting
fs/namespace.c:5781 do_statmount() error: we previously assumed 'ns' could be null (see line 5703)

vim +3865 fs/namespace.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  3834  
2010464cfafb22 Al Viro           2025-08-20  3835  static void lock_mount_exact(const struct path *path,
a41dbf5e004edb Christian Brauner 2026-02-14  3836  			     struct pinned_mountpoint *mp, bool copy_mount,
a41dbf5e004edb Christian Brauner 2026-02-14  3837  			     unsigned int copy_flags)
19a167af7c9724 Al Viro           2011-01-17  3838  {
26df6034fdb211 Al Viro           2020-01-11  3839  	struct dentry *dentry = path->dentry;
9bf5d488529b9e Al Viro           2025-08-22  3840  	int err;
9bf5d488529b9e Al Viro           2025-08-22  3841  
a41dbf5e004edb Christian Brauner 2026-02-14  3842  	/* Assert that inode_lock() locked the correct inode. */
a41dbf5e004edb Christian Brauner 2026-02-14  3843  	VFS_WARN_ON_ONCE(copy_mount && !path_mounted(path));
a41dbf5e004edb Christian Brauner 2026-02-14  3844  
9bf5d488529b9e Al Viro           2025-08-22  3845  	inode_lock(dentry->d_inode);
9bf5d488529b9e Al Viro           2025-08-22  3846  	namespace_lock();
9bf5d488529b9e Al Viro           2025-08-22  3847  	if (unlikely(cant_mount(dentry)))
9bf5d488529b9e Al Viro           2025-08-22  3848  		err = -ENOENT;
a41dbf5e004edb Christian Brauner 2026-02-14  3849  	else if (!copy_mount && path_overmounted(path))
9bf5d488529b9e Al Viro           2025-08-22  3850  		err = -EBUSY;
9bf5d488529b9e Al Viro           2025-08-22  3851  	else
9bf5d488529b9e Al Viro           2025-08-22  3852  		err = get_mountpoint(dentry, mp);
9bf5d488529b9e Al Viro           2025-08-22  3853  	if (unlikely(err)) {
9bf5d488529b9e Al Viro           2025-08-22  3854  		namespace_unlock();
9bf5d488529b9e Al Viro           2025-08-22  3855  		inode_unlock(dentry->d_inode);
2010464cfafb22 Al Viro           2025-08-20  3856  		mp->parent = ERR_PTR(err);
a41dbf5e004edb Christian Brauner 2026-02-14  3857  		return;
9bf5d488529b9e Al Viro           2025-08-22  3858  	}
a41dbf5e004edb Christian Brauner 2026-02-14  3859  
a41dbf5e004edb Christian Brauner 2026-02-14  3860  	if (copy_mount)
a41dbf5e004edb Christian Brauner 2026-02-14  3861  		mp->parent = clone_mnt(real_mount(path->mnt), dentry, copy_flags);
a41dbf5e004edb Christian Brauner 2026-02-14  3862  	else
a41dbf5e004edb Christian Brauner 2026-02-14  3863  		mp->parent = real_mount(path->mnt);
a41dbf5e004edb Christian Brauner 2026-02-14  3864  	if (unlikely(IS_ERR(mp->parent)))
a41dbf5e004edb Christian Brauner 2026-02-14 @3865  		__unlock_mount(mp);
9bf5d488529b9e Al Viro           2025-08-22  3866  }
9bf5d488529b9e Al Viro           2025-08-22  3867  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
