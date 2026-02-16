Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA75517993
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Feb 2026 20:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771273716; cv=none; b=quymyqn64m7tA0f/Lj7f5Zdg+Kj5CVuntTy4reGPVpro60CKmafAvQjq6iad3PJejcHIzJ8tJqiLsRCStgczuwLJ8Y8FJpMZP+hadpS7fKABU1Sp+s3jzeNx9ZTFI/x2888dcih89Anb1V9A/Is7S402+QprXE+qZAq+ENDfXjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771273716; c=relaxed/simple;
	bh=0GD6uP74NCKH0Rro3IMYKv+c73glnyGXcvvPpslrUzc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ONMFS4vmSb37BBlzjRREkJoG77nwugVvlqYyE185SOnjooFhrkj0c3gnWrBME5KpfLfXFSt+lNe+jk6g2xm0ITCXdOq240awWPLJfvNRZ53xt7sz4MVKLjJ8j3yuv4us8q6TKI0oKveLL/buEeV/07msJRprbWFlLNrLT5ujvvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oGyyKPvA; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oGyyKPvA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771273714; x=1802809714;
  h=date:from:to:cc:subject:message-id;
  bh=0GD6uP74NCKH0Rro3IMYKv+c73glnyGXcvvPpslrUzc=;
  b=oGyyKPvADMopzdJmRe8wzKkaFsvNzSpc9cDHdmIe83E/yhFuAykcIawJ
   A7i90aPLcSKejSD4GR32llDr3WnSgqKsnBA9xXVANjrLRQUXGK4W3wiVQ
   PO1s6UTLF9D4wu4Zjo0bl8LYime7L2v4gJWx2j3oBEmydiZHpZ+4rDqOq
   fWoQG+Ob4Xy4j0vMZriE5tMONL5fjGJHmkpJpk7HS9+C2aFw3v0Hcggds
   3DHoBrY8/1WposMdNdopTelC4Q2fn126VfcTqpU3bzBlhBTc8iFZWt4tr
   Eiqo6eV+vDc3XmEbfQFlMnI6l65YzNkssUQA6p5JVVOaNn/+BObMwtBzZ
   w==;
X-CSE-ConnectionGUID: dGOTviAFS2SDg63gEDB2bQ==
X-CSE-MsgGUID: SGCH7VXDSOmq4d02wad/QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="89766483"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="89766483"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 12:28:34 -0800
X-CSE-ConnectionGUID: 8lIBVpCwS7CNeMDU4yoMlw==
X-CSE-MsgGUID: 6E+APYNcTb+kmWhRJ2g9Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="213706751"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Feb 2026 12:28:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vs5Cn-000000010GC-2i1R;
	Mon, 16 Feb 2026 20:28:29 +0000
Date: Tue, 17 Feb 2026 04:27:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-github:vfs.fixes 6/6] fs/namespace.c:3866
 lock_mount_exact() warn: inconsistent returns '&dentry->d_inode->i_rwsem'.
Message-ID: <202602170442.NizNmeUx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git vfs.fixes
head:   85d88a3941593e4a08f95296451dcdc5112347e0
commit: 85d88a3941593e4a08f95296451dcdc5112347e0 [6/6] mount: hold namespace_sem across copy in create_new_namespace()
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: s390-randconfig-r072-20260217 (https://download.01.org/0day-ci/archive/20260217/202602170442.NizNmeUx-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.3.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602170442.NizNmeUx-lkp@intel.com/

New smatch warnings:
fs/namespace.c:3866 lock_mount_exact() warn: inconsistent returns '&dentry->d_inode->i_rwsem'.

Old smatch warnings:
fs/namespace.c:1406 mntput_no_expire() warn: inconsistent returns 'rcu_read'.
fs/namespace.c:2825 may_change_propagation() warn: inconsistent indenting
fs/namespace.c:5782 do_statmount() error: we previously assumed 'ns' could be null (see line 5704)

vim +3866 fs/namespace.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  3835  
2010464cfafb22 Al Viro           2025-08-20  3836  static void lock_mount_exact(const struct path *path,
85d88a3941593e Christian Brauner 2026-02-15  3837  			     struct pinned_mountpoint *mp, bool copy_mount,
85d88a3941593e Christian Brauner 2026-02-15  3838  			     unsigned int copy_flags)
19a167af7c9724 Al Viro           2011-01-17  3839  {
26df6034fdb211 Al Viro           2020-01-11  3840  	struct dentry *dentry = path->dentry;
9bf5d488529b9e Al Viro           2025-08-22  3841  	int err;
9bf5d488529b9e Al Viro           2025-08-22  3842  
85d88a3941593e Christian Brauner 2026-02-15  3843  	/* Assert that inode_lock() locked the correct inode. */
85d88a3941593e Christian Brauner 2026-02-15  3844  	VFS_WARN_ON_ONCE(copy_mount && !path_mounted(path));
85d88a3941593e Christian Brauner 2026-02-15  3845  
9bf5d488529b9e Al Viro           2025-08-22  3846  	inode_lock(dentry->d_inode);
9bf5d488529b9e Al Viro           2025-08-22  3847  	namespace_lock();
9bf5d488529b9e Al Viro           2025-08-22  3848  	if (unlikely(cant_mount(dentry)))
9bf5d488529b9e Al Viro           2025-08-22  3849  		err = -ENOENT;
85d88a3941593e Christian Brauner 2026-02-15  3850  	else if (!copy_mount && path_overmounted(path))
9bf5d488529b9e Al Viro           2025-08-22  3851  		err = -EBUSY;
9bf5d488529b9e Al Viro           2025-08-22  3852  	else
9bf5d488529b9e Al Viro           2025-08-22  3853  		err = get_mountpoint(dentry, mp);
9bf5d488529b9e Al Viro           2025-08-22  3854  	if (unlikely(err)) {
9bf5d488529b9e Al Viro           2025-08-22  3855  		namespace_unlock();
9bf5d488529b9e Al Viro           2025-08-22  3856  		inode_unlock(dentry->d_inode);
2010464cfafb22 Al Viro           2025-08-20  3857  		mp->parent = ERR_PTR(err);
85d88a3941593e Christian Brauner 2026-02-15  3858  		return;
9bf5d488529b9e Al Viro           2025-08-22  3859  	}
85d88a3941593e Christian Brauner 2026-02-15  3860  
85d88a3941593e Christian Brauner 2026-02-15  3861  	if (copy_mount)
85d88a3941593e Christian Brauner 2026-02-15  3862  		mp->parent = clone_mnt(real_mount(path->mnt), dentry, copy_flags);
85d88a3941593e Christian Brauner 2026-02-15  3863  	else
85d88a3941593e Christian Brauner 2026-02-15  3864  		mp->parent = real_mount(path->mnt);
85d88a3941593e Christian Brauner 2026-02-15  3865  	if (unlikely(IS_ERR(mp->parent)))
85d88a3941593e Christian Brauner 2026-02-15 @3866  		__unlock_mount(mp);
9bf5d488529b9e Al Viro           2025-08-22  3867  }
9bf5d488529b9e Al Viro           2025-08-22  3868  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
