Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7D02FDC41
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Nov 2025 22:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763504486; cv=none; b=lFNbMKkQeJTMj9UqK8ayD9goviSuu9HnDGj88zm1z0ELB8bqwePmTDH3p0CThM79KFBDjjKF0yb2xpLLDHq6bO9KWijlQO6TK5ps7E2981JQlvRJXV6ubtZWkjb1fVjHLGoiJ31JtPKzFsFkKnUu7FdDpD+xmdt0mWPO4AgPGYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763504486; c=relaxed/simple;
	bh=t2z0h4ERjH4T0Io9aOzCrd1eCRBplqCU6fjMdDQ3kvg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RD7De8sN45osweN3//VbXIkJjI7QhkzVHMvJvqqwmf0GiYmFoxrSsANttiTCd7QKG51FLMxTSeYSl9P1xEr9M8CT4UX/sTPae0eF+/rMoUa1vE+/u7NXsv9G8kA1sDtZBosDcaXa9prz7LWUwZqfltKPyOSbuNYugiCElKqjSsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NqIA6GvA; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NqIA6GvA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763504484; x=1795040484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t2z0h4ERjH4T0Io9aOzCrd1eCRBplqCU6fjMdDQ3kvg=;
  b=NqIA6GvAZ3XgWN6UaYZAVyRTkaJm6OprWXIaJ2B7ofcF3cuBeKbr0LCZ
   40ft8NJbtsFxIIZ7OGIheIQa7TL/8x+ZZkiUQ3F3OOxFRuzMp7yKaDekQ
   rdS1+xYPN81yCip90Bn7FqjNZC9q3NbVf92tWSJ+R3xMIIZzU2LoWdlx7
   8BTsDNyQ4KFSqHyssvBsdvQBAbhy6Q8I2+oTIBGDs++InIN1fLwJ4YxPV
   6kO6vp6wgaiSaL+dR37yF2968Fg3+/8GqXFJ//EjYsv8p7aIyD9VKbjOg
   4UBGYvwvO08gYm0hFPvy1g6v/HGpS17dmY/HWoAPmH52HqfMTChkguRpJ
   Q==;
X-CSE-ConnectionGUID: k/359PTpTI+F1xZvPMw3Xw==
X-CSE-MsgGUID: IPb1oxM5T6qOs0QI4wg6Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="53112155"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="53112155"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 14:21:24 -0800
X-CSE-ConnectionGUID: M9S8A51JSiay2SezgBZCkA==
X-CSE-MsgGUID: 7NxJB44ESMmhFVAGs/X2eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190682856"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Nov 2025 14:21:22 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLU4e-0002EV-0u;
	Tue, 18 Nov 2025 22:21:20 +0000
Date: Wed, 19 Nov 2025 06:21:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-github:work.fd.prepare 31/43] fs/namespace.c:4376
 __do_sys_fsmount() error: uninitialized symbol 'file'.
Message-ID: <202511190607.2Y9PvVQN-lkp@intel.com>
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
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git work.fd.prepare
head:   7eb06f9f7a76175a82d3c6b9d94219d7b64b6bce
commit: 7a6aae3e938ed79442f55c1f2b6d4a73a2cf0c51 [31/43] fs: namespace
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: powerpc-randconfig-r072-20251119 (https://download.01.org/0day-ci/archive/20251119/202511190607.2Y9PvVQN-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511190607.2Y9PvVQN-lkp@intel.com/

New smatch warnings:
fs/namespace.c:4376 __do_sys_fsmount() error: uninitialized symbol 'file'.
fs/namespace.c:4376 __do_sys_fsmount() error: uninitialized symbol 'file'.

Old smatch warnings:
fs/namespace.c:2827 may_change_propagation() warn: inconsistent indenting
fs/namespace.c:4712 mount_setattr_prepare() error: uninitialized symbol 'err'.

vim +/file +4376 fs/namespace.c

5b490500f91b21 Christian Brauner 2021-01-21  4271  
2db154b3ea8e14 David Howells     2018-11-05  4272  /*
93766fbd2696c2 David Howells     2018-11-01  4273   * Create a kernel mount representation for a new, prepared superblock
93766fbd2696c2 David Howells     2018-11-01  4274   * (specified by fs_fd) and attach to an open_tree-like file descriptor.
93766fbd2696c2 David Howells     2018-11-01  4275   */
93766fbd2696c2 David Howells     2018-11-01  4276  SYSCALL_DEFINE3(fsmount, int, fs_fd, unsigned int, flags,
93766fbd2696c2 David Howells     2018-11-01  4277  		unsigned int, attr_flags)
93766fbd2696c2 David Howells     2018-11-01  4278  {
93766fbd2696c2 David Howells     2018-11-01  4279  	struct mnt_namespace *ns;
93766fbd2696c2 David Howells     2018-11-01  4280  	struct fs_context *fc;
93766fbd2696c2 David Howells     2018-11-01  4281  	struct file *file;
7a6aae3e938ed7 Christian Brauner 2025-11-18  4282  	struct path newmount __free(path_put) = {};
93766fbd2696c2 David Howells     2018-11-01  4283  	struct mount *mnt;
93766fbd2696c2 David Howells     2018-11-01  4284  	unsigned int mnt_flags = 0;
93766fbd2696c2 David Howells     2018-11-01  4285  	long ret;
93766fbd2696c2 David Howells     2018-11-01  4286  
93766fbd2696c2 David Howells     2018-11-01  4287  	if (!may_mount())
93766fbd2696c2 David Howells     2018-11-01  4288  		return -EPERM;
93766fbd2696c2 David Howells     2018-11-01  4289  
93766fbd2696c2 David Howells     2018-11-01  4290  	if ((flags & ~(FSMOUNT_CLOEXEC)) != 0)
93766fbd2696c2 David Howells     2018-11-01  4291  		return -EINVAL;
93766fbd2696c2 David Howells     2018-11-01  4292  
5b490500f91b21 Christian Brauner 2021-01-21  4293  	if (attr_flags & ~FSMOUNT_VALID_FLAGS)
93766fbd2696c2 David Howells     2018-11-01  4294  		return -EINVAL;
93766fbd2696c2 David Howells     2018-11-01  4295  
5b490500f91b21 Christian Brauner 2021-01-21  4296  	mnt_flags = attr_flags_to_mnt_flags(attr_flags);
93766fbd2696c2 David Howells     2018-11-01  4297  
93766fbd2696c2 David Howells     2018-11-01  4298  	switch (attr_flags & MOUNT_ATTR__ATIME) {
93766fbd2696c2 David Howells     2018-11-01  4299  	case MOUNT_ATTR_STRICTATIME:
93766fbd2696c2 David Howells     2018-11-01  4300  		break;
93766fbd2696c2 David Howells     2018-11-01  4301  	case MOUNT_ATTR_NOATIME:
93766fbd2696c2 David Howells     2018-11-01  4302  		mnt_flags |= MNT_NOATIME;
93766fbd2696c2 David Howells     2018-11-01  4303  		break;
93766fbd2696c2 David Howells     2018-11-01  4304  	case MOUNT_ATTR_RELATIME:
93766fbd2696c2 David Howells     2018-11-01  4305  		mnt_flags |= MNT_RELATIME;
93766fbd2696c2 David Howells     2018-11-01  4306  		break;
93766fbd2696c2 David Howells     2018-11-01  4307  	default:
93766fbd2696c2 David Howells     2018-11-01  4308  		return -EINVAL;
93766fbd2696c2 David Howells     2018-11-01  4309  	}
93766fbd2696c2 David Howells     2018-11-01  4310  
8152f820108835 Al Viro           2024-07-19  4311  	CLASS(fd, f)(fs_fd);
8152f820108835 Al Viro           2024-07-19  4312  	if (fd_empty(f))
93766fbd2696c2 David Howells     2018-11-01  4313  		return -EBADF;
93766fbd2696c2 David Howells     2018-11-01  4314  
1da91ea87aefe2 Al Viro           2024-05-31  4315  	if (fd_file(f)->f_op != &fscontext_fops)
8152f820108835 Al Viro           2024-07-19  4316  		return -EINVAL;
93766fbd2696c2 David Howells     2018-11-01  4317  
1da91ea87aefe2 Al Viro           2024-05-31  4318  	fc = fd_file(f)->private_data;
93766fbd2696c2 David Howells     2018-11-01  4319  
7a6aae3e938ed7 Christian Brauner 2025-11-18  4320  	ACQUIRE(mutex_intr, uapi_mutex)(&fc->uapi_mutex);
7a6aae3e938ed7 Christian Brauner 2025-11-18  4321  	ret = ACQUIRE_ERR(mutex_intr, &uapi_mutex);
7a6aae3e938ed7 Christian Brauner 2025-11-18  4322  	if (ret)
8152f820108835 Al Viro           2024-07-19  4323  		return ret;
93766fbd2696c2 David Howells     2018-11-01  4324  
93766fbd2696c2 David Howells     2018-11-01  4325  	/* There must be a valid superblock or we can't mount it */
93766fbd2696c2 David Howells     2018-11-01  4326  	ret = -EINVAL;
93766fbd2696c2 David Howells     2018-11-01  4327  	if (!fc->root)
7a6aae3e938ed7 Christian Brauner 2025-11-18  4328  		return ret;
93766fbd2696c2 David Howells     2018-11-01  4329  
93766fbd2696c2 David Howells     2018-11-01  4330  	ret = -EPERM;
93766fbd2696c2 David Howells     2018-11-01  4331  	if (mount_too_revealing(fc->root->d_sb, &mnt_flags)) {
807602d8cfc8b6 Aleksa Sarai      2025-08-06  4332  		errorfcp(fc, "VFS", "Mount too revealing");
7a6aae3e938ed7 Christian Brauner 2025-11-18  4333  		return ret;
93766fbd2696c2 David Howells     2018-11-01  4334  	}
93766fbd2696c2 David Howells     2018-11-01  4335  
93766fbd2696c2 David Howells     2018-11-01  4336  	ret = -EBUSY;
93766fbd2696c2 David Howells     2018-11-01  4337  	if (fc->phase != FS_CONTEXT_AWAITING_MOUNT)
7a6aae3e938ed7 Christian Brauner 2025-11-18  4338  		return ret;
93766fbd2696c2 David Howells     2018-11-01  4339  
f7e33bdbd6d1bd Jeff Layton       2021-08-19  4340  	if (fc->sb_flags & SB_MANDLOCK)
f7e33bdbd6d1bd Jeff Layton       2021-08-19  4341  		warn_mandlock();
93766fbd2696c2 David Howells     2018-11-01  4342  
93766fbd2696c2 David Howells     2018-11-01  4343  	newmount.mnt = vfs_create_mount(fc);
7a6aae3e938ed7 Christian Brauner 2025-11-18  4344  	if (IS_ERR(newmount.mnt))
7a6aae3e938ed7 Christian Brauner 2025-11-18  4345  		return PTR_ERR(newmount.mnt);
93766fbd2696c2 David Howells     2018-11-01  4346  	newmount.dentry = dget(fc->root);
93766fbd2696c2 David Howells     2018-11-01  4347  	newmount.mnt->mnt_flags = mnt_flags;
93766fbd2696c2 David Howells     2018-11-01  4348  
93766fbd2696c2 David Howells     2018-11-01  4349  	/* We've done the mount bit - now move the file context into more or
93766fbd2696c2 David Howells     2018-11-01  4350  	 * less the same state as if we'd done an fspick().  We don't want to
93766fbd2696c2 David Howells     2018-11-01  4351  	 * do any memory allocation or anything like that at this point as we
93766fbd2696c2 David Howells     2018-11-01  4352  	 * don't want to have to handle any errors incurred.
93766fbd2696c2 David Howells     2018-11-01  4353  	 */
93766fbd2696c2 David Howells     2018-11-01  4354  	vfs_clean_context(fc);
93766fbd2696c2 David Howells     2018-11-01  4355  
93766fbd2696c2 David Howells     2018-11-01  4356  	ns = alloc_mnt_ns(current->nsproxy->mnt_ns->user_ns, true);
7a6aae3e938ed7 Christian Brauner 2025-11-18  4357  	if (IS_ERR(ns))
7a6aae3e938ed7 Christian Brauner 2025-11-18  4358  		return PTR_ERR(ns);
93766fbd2696c2 David Howells     2018-11-01  4359  	mnt = real_mount(newmount.mnt);
93766fbd2696c2 David Howells     2018-11-01  4360  	ns->root = mnt;
2eea9ce4310d8c Miklos Szeredi    2023-10-25  4361  	ns->nr_mounts = 1;
2eea9ce4310d8c Miklos Szeredi    2023-10-25  4362  	mnt_add_to_ns(ns, mnt);
1b0b9cc8d3793e Eric Biggers      2019-06-12  4363  	mntget(newmount.mnt);
93766fbd2696c2 David Howells     2018-11-01  4364  
7a6aae3e938ed7 Christian Brauner 2025-11-18  4365  	FD_PREPARE(fdprep, (flags & FSMOUNT_CLOEXEC) ? O_CLOEXEC : 0,
7a6aae3e938ed7 Christian Brauner 2025-11-18  4366  		   dentry_open(&newmount, O_PATH, fc->cred));
7a6aae3e938ed7 Christian Brauner 2025-11-18  4367  	if (fd_prepare_failed(fdprep)) {
93766fbd2696c2 David Howells     2018-11-01  4368  		dissolve_on_fput(newmount.mnt);
7a6aae3e938ed7 Christian Brauner 2025-11-18  4369  		return fd_prepare_error(fdprep);
93766fbd2696c2 David Howells     2018-11-01  4370  	}
93766fbd2696c2 David Howells     2018-11-01  4371  
7a6aae3e938ed7 Christian Brauner 2025-11-18  4372  	/*
7a6aae3e938ed7 Christian Brauner 2025-11-18  4373  	 * Attach to an apparent O_PATH fd with a note that we
7a6aae3e938ed7 Christian Brauner 2025-11-18  4374  	 * need to unmount it, not just simply put it.
7a6aae3e938ed7 Christian Brauner 2025-11-18  4375  	 */
7a6aae3e938ed7 Christian Brauner 2025-11-18 @4376  	file->f_mode |= FMODE_NEED_UNMOUNT;
7a6aae3e938ed7 Christian Brauner 2025-11-18  4377  	return fd_publish(fdprep);
93766fbd2696c2 David Howells     2018-11-01  4378  }
93766fbd2696c2 David Howells     2018-11-01  4379  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
