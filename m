Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4AE196DA2
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Jun 2024 17:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717694096; cv=none; b=Sa5fwS06nGcy2IA/NxexaHOOFDp1MoJ5A9nlC4WFpaWrpE1TTpvclh888EEfqCX4aM39nJyq9PNnwFc3lHojjd5DcUuQaocly6FSSdvkpPE8skanvRXLZJzbDfmVkng72YOj7T+/tL/BJzFecqxZ6KBI2Y4y4r93zPo7qaUJgoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717694096; c=relaxed/simple;
	bh=BoLGK3qFynV3MUcHKtxm34QxFAX+vfBfW9lmbQADw4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uhbDbMWIrHLT3Z/PAuJjCKgU5JJKDCsAZ08ROMYT3MlYa6q9X3SogfnpYysw9QfOX167Ou3lEC0wJv8/KdVrXqbg9tyF9Ah3Dg+YMJ9bSzj4ik/QsCFEmL6CmyRXNh3vd2n2rub42MFg1IGtWwUmD8nZQpvAU62ZAYQDHhXgRYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SnennpKG; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SnennpKG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717694095; x=1749230095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BoLGK3qFynV3MUcHKtxm34QxFAX+vfBfW9lmbQADw4E=;
  b=SnennpKGtvAoIWIU2OwYGRy124HTbhvtB/+o/HAof9m2AFB0148ByGFZ
   Ou9M5JJZukk3JFoV6IUikglgU8BcF2YU18RdEXyigc6UJhdxI3W0BEcmT
   eLW7WNvk1XBbmu+LfJVzZiste+bNrHkS/wJ4GFj+oZx0/ZrmedS6qriOz
   XSaEwu9yXtw4ysgAVT75C6hIKZTjlDsPUAQ9oOHfW/OC5biyEjd2FuN5t
   yjLaTKm1e3eeVCHJn6d7IBIjjlC822rDwYAyfmFfZYy8LJRCiGFzIVana
   +oW2KNRCwWmG4m2SNLY6FGFn9OCvWrCG12nPm/4LKPmcwzbPwfGCvyor5
   w==;
X-CSE-ConnectionGUID: CRzu1yprRQ6zv/FvUlehNQ==
X-CSE-MsgGUID: uGH77vTLRfukuG3DP/YoNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14605141"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14605141"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 10:14:54 -0700
X-CSE-ConnectionGUID: 3Hyq2iiMRImNE5nF55kKCQ==
X-CSE-MsgGUID: yXcDgdmmR/ullJkbpgYHlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="42464465"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 06 Jun 2024 10:14:53 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFGhP-0003St-10;
	Thu, 06 Jun 2024 17:14:51 +0000
Date: Fri, 7 Jun 2024 01:14:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-vfs:vfs.open_tree 5/7] fs/namespace.c:4149
 __do_sys_fsmount() error: uninitialized symbol 'ret'.
Message-ID: <202406070149.3roPeXKi-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.open_tree
head:   6d2ad41f48768f325a552666b71724bc40ba52c3
commit: 5612eb55c0193003973838c198268730bd4682ce [5/7] fs: add open_tree() context
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: hexagon-randconfig-r071-20240606 (https://download.01.org/0day-ci/archive/20240607/202406070149.3roPeXKi-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406070149.3roPeXKi-lkp@intel.com/

New smatch warnings:
fs/namespace.c:4149 __do_sys_fsmount() error: uninitialized symbol 'ret'.
fs/namespace.c:4149 __do_sys_fsmount() error: uninitialized symbol 'ret'.

Old smatch warnings:
fs/namespace.c:3485 finish_automount() warn: inconsistent returns '&dentry->d_inode->i_rwsem'.
fs/namespace.c:4459 mount_setattr_prepare() error: uninitialized symbol 'err'.

vim +/ret +4149 fs/namespace.c

5612eb55c019300 Christian Brauner 2024-05-31  4093  
5612eb55c019300 Christian Brauner 2024-05-31  4094  /*
5612eb55c019300 Christian Brauner 2024-05-31  4095   * Create a kernel mount representation and attach to an open_tree-like file
5612eb55c019300 Christian Brauner 2024-05-31  4096   * descriptor.
5612eb55c019300 Christian Brauner 2024-05-31  4097   */
5612eb55c019300 Christian Brauner 2024-05-31  4098  SYSCALL_DEFINE3(fsmount, int, fs_fd, unsigned int, flags,
5612eb55c019300 Christian Brauner 2024-05-31  4099  		unsigned int, attr_flags)
5612eb55c019300 Christian Brauner 2024-05-31  4100  {
5612eb55c019300 Christian Brauner 2024-05-31  4101  	struct fs_context *fc;
5612eb55c019300 Christian Brauner 2024-05-31  4102  	unsigned int mnt_flags = 0;
5612eb55c019300 Christian Brauner 2024-05-31  4103  	long ret;
5612eb55c019300 Christian Brauner 2024-05-31  4104  
5612eb55c019300 Christian Brauner 2024-05-31  4105  	if (!may_mount())
5612eb55c019300 Christian Brauner 2024-05-31  4106  		return -EPERM;
5612eb55c019300 Christian Brauner 2024-05-31  4107  
5612eb55c019300 Christian Brauner 2024-05-31  4108  	if ((flags & ~(FSMOUNT_CLOEXEC)) != 0)
5612eb55c019300 Christian Brauner 2024-05-31  4109  		return -EINVAL;
5612eb55c019300 Christian Brauner 2024-05-31  4110  
5612eb55c019300 Christian Brauner 2024-05-31  4111  	if (attr_flags & ~FSMOUNT_VALID_FLAGS)
5612eb55c019300 Christian Brauner 2024-05-31  4112  		return -EINVAL;
5612eb55c019300 Christian Brauner 2024-05-31  4113  
5612eb55c019300 Christian Brauner 2024-05-31  4114  	mnt_flags = attr_flags_to_mnt_flags(attr_flags);
5612eb55c019300 Christian Brauner 2024-05-31  4115  
5612eb55c019300 Christian Brauner 2024-05-31  4116  	switch (attr_flags & MOUNT_ATTR__ATIME) {
5612eb55c019300 Christian Brauner 2024-05-31  4117  	case MOUNT_ATTR_STRICTATIME:
5612eb55c019300 Christian Brauner 2024-05-31  4118  		break;
5612eb55c019300 Christian Brauner 2024-05-31  4119  	case MOUNT_ATTR_NOATIME:
5612eb55c019300 Christian Brauner 2024-05-31  4120  		mnt_flags |= MNT_NOATIME;
5612eb55c019300 Christian Brauner 2024-05-31  4121  		break;
5612eb55c019300 Christian Brauner 2024-05-31  4122  	case MOUNT_ATTR_RELATIME:
5612eb55c019300 Christian Brauner 2024-05-31  4123  		mnt_flags |= MNT_RELATIME;
5612eb55c019300 Christian Brauner 2024-05-31  4124  		break;
5612eb55c019300 Christian Brauner 2024-05-31  4125  	default:
5612eb55c019300 Christian Brauner 2024-05-31  4126  		return -EINVAL;
5612eb55c019300 Christian Brauner 2024-05-31  4127  	}
5612eb55c019300 Christian Brauner 2024-05-31  4128  
5612eb55c019300 Christian Brauner 2024-05-31  4129  	CLASS(fd, f)(fs_fd);
5612eb55c019300 Christian Brauner 2024-05-31  4130  	if (!f.file)
5612eb55c019300 Christian Brauner 2024-05-31  4131  		return -EBADF;
5612eb55c019300 Christian Brauner 2024-05-31  4132  
5612eb55c019300 Christian Brauner 2024-05-31  4133  	if (!(f.file->f_op->fop_flags & FOP_FS_CONTEXT_OPS))
5612eb55c019300 Christian Brauner 2024-05-31  4134  		return -EINVAL;
5612eb55c019300 Christian Brauner 2024-05-31  4135  
5612eb55c019300 Christian Brauner 2024-05-31  4136  	if ((f.file->f_op == &mount_context_ops) && attr_flags)
5612eb55c019300 Christian Brauner 2024-05-31  4137  		return -EINVAL;
5612eb55c019300 Christian Brauner 2024-05-31  4138  
5612eb55c019300 Christian Brauner 2024-05-31  4139  	fc = f.file->private_data;
5612eb55c019300 Christian Brauner 2024-05-31  4140  	scoped_cond_guard(mutex_intr, return -EINTR, &fc->uapi_mutex) {
5612eb55c019300 Christian Brauner 2024-05-31  4141  		if (fc->phase != FS_CONTEXT_AWAITING_MOUNT)
5612eb55c019300 Christian Brauner 2024-05-31  4142  			return -EBUSY;
5612eb55c019300 Christian Brauner 2024-05-31  4143  		if (f.file->f_op == &fscontext_fops)
5612eb55c019300 Christian Brauner 2024-05-31  4144  			ret = fsmount_fscontext(fc, flags, mnt_flags);
5612eb55c019300 Christian Brauner 2024-05-31  4145  		else if (f.file->f_op == &mount_context_ops)
5612eb55c019300 Christian Brauner 2024-05-31  4146  			ret = fsmount_mount_context(fc, flags);
5612eb55c019300 Christian Brauner 2024-05-31  4147  	}
5612eb55c019300 Christian Brauner 2024-05-31  4148  
93766fbd2696c2c David Howells     2018-11-01 @4149  	return ret;
93766fbd2696c2c David Howells     2018-11-01  4150  }
93766fbd2696c2c David Howells     2018-11-01  4151  

:::::: The code at line 4149 was first introduced by commit
:::::: 93766fbd2696c2c4453dd8e1070977e9cd4e6b6d vfs: syscall: Add fsmount() to create a mount for a superblock

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
