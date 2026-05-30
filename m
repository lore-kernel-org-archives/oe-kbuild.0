Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C634026ED3A
	for <oe-kbuild@lists.linux.dev>; Sat, 30 May 2026 21:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780175252; cv=none; b=MwXM8bBJLeMrQIcSRkD+ri3UGHqq1lKo6lGZ2/In4NC15TD6uvcGpT++KZa2R43cLdFcAa8n/O9bz4M1VCGlu/38oCjfkKtTydGqb+zKIjq94iywZptFkB37bOJ95bLSxbcMMzR+Pk3+jpsYQfOY/Ot7+zB0PLT6KcLIYMs/D5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780175252; c=relaxed/simple;
	bh=DQWol3FY/wgB3PeUrH7qesWZcMLzQuzMvKCOhenuVj8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jdmfFETxcC38+5yEK1k5lGOSyALi7/ApvYfVJpHZjCKNy3YyRNjk1MjScUp0bJProkDqcRB6UwW2Xkq3vrKTQEukodshZe4oDmxkVW1ZC3+PRJLQpIiJydtBXK56wrLycOPWQp9WOMTzG7eElihwDpQx6yGk66pRYdGV16+n5/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bJGc/eVq; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bJGc/eVq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780175250; x=1811711250;
  h=date:from:to:cc:subject:message-id;
  bh=DQWol3FY/wgB3PeUrH7qesWZcMLzQuzMvKCOhenuVj8=;
  b=bJGc/eVqn5S/3t1lucVip3b/w6GM0L3/bpNkr0qEuy2ENKb5zqL1/qY1
   oXKQqYf15q8vTKz4fJGAdlfaDQEreF3Xt1o1/Jrz3AROkHXLJ2EAq1p+L
   YvDK3crEd0GMTYOhA1tV+dj/QWiMGTXGI4DEsPIdUxAMfIs9CUiK0Cj4p
   BXBTrxjEUgSUGZk0LzkNwxNTVCljr5pQ+09DXpmzxWpIZ+J5pBxU+U6e5
   7QTjGFh3rAss2kxGaDX7OJF+3tdcIVC+YYto1fZzgqluoDyufo0xvUCSX
   HGe2Yos9T5P9qDLhg95vsQu4mpdayqXwyKTUFy+lGlI1WGOtxS76MwmGm
   Q==;
X-CSE-ConnectionGUID: +raRsbo9SBqFRbAP+1JQnw==
X-CSE-MsgGUID: 3gRgQ8C3T+aQRRlsYLO++g==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="92368624"
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; 
   d="scan'208";a="92368624"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 14:07:29 -0700
X-CSE-ConnectionGUID: 3Te2j7d4QdqSHr0fCvC4cQ==
X-CSE-MsgGUID: I7KfzQumRRGrAtyS4qt3sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; 
   d="scan'208";a="243295056"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 May 2026 14:07:28 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTQtx-000000008uI-0ntq;
	Sat, 30 May 2026 21:07:25 +0000
Date: Sun, 31 May 2026 05:07:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jarkko-tpmdd:rootns 19/23] fs/namespace.c:4814
 __do_sys_move_mount() warn: fd re-used after fget(): 'to_dfd'
Message-ID: <202605310516.uyVKXRuQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jarkko Sakkinen <jarkko@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git rootns
head:   86a21721c8c825e8a083fff56e37007e355c0bc1
commit: 6bfd165709414b55f083dc9fea5983f018cbaaf4 [19/23] rootns, vfs: Install and populate rootns mount trees
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20260530 (https://download.01.org/0day-ci/archive/20260531/202605310516.uyVKXRuQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605310516.uyVKXRuQ-lkp@intel.com/

New smatch warnings:
fs/namespace.c:4814 __do_sys_move_mount() warn: fd re-used after fget(): 'to_dfd'
fs/namespace.c:4814 __do_sys_move_mount() warn: fd re-used after fget(): 'to_dfd'

Old smatch warnings:
fs/namespace.c:1415 mntput_no_expire() warn: inconsistent returns 'rcu_read'.
fs/namespace.c:2858 may_change_propagation() warn: inconsistent indenting
fs/namespace.c:3884 lock_mount_exact() warn: inconsistent returns '&dentry->d_inode->i_rwsem'.
fs/namespace.c:6046 do_statmount() error: we previously assumed 'ns' could be null (see line 5968)

vim +/to_dfd +4814 fs/namespace.c

6bfd165709414b Jarkko Sakkinen   2019-02-01  4690  
93766fbd2696c2 David Howells     2018-11-01  4691  /*
93766fbd2696c2 David Howells     2018-11-01  4692   * Move a mount from one place to another.  In combination with
93766fbd2696c2 David Howells     2018-11-01  4693   * fsopen()/fsmount() this is used to install a new mount and in combination
93766fbd2696c2 David Howells     2018-11-01  4694   * with open_tree(OPEN_TREE_CLONE [| AT_RECURSIVE]) it can be used to copy
93766fbd2696c2 David Howells     2018-11-01  4695   * a mount subtree.
2db154b3ea8e14 David Howells     2018-11-05  4696   *
2db154b3ea8e14 David Howells     2018-11-05  4697   * Note the flags value is a combination of MOVE_MOUNT_* flags.
2db154b3ea8e14 David Howells     2018-11-05  4698   */
2db154b3ea8e14 David Howells     2018-11-05  4699  SYSCALL_DEFINE5(move_mount,
2658ce095df583 Ben Dooks         2019-10-15  4700  		int, from_dfd, const char __user *, from_pathname,
2658ce095df583 Ben Dooks         2019-10-15  4701  		int, to_dfd, const char __user *, to_pathname,
2db154b3ea8e14 David Howells     2018-11-05  4702  		unsigned int, flags)
2db154b3ea8e14 David Howells     2018-11-05  4703  {
f9fde814de3755 Christian Brauner 2025-02-21  4704  	struct path to_path __free(path_put) = {};
f9fde814de3755 Christian Brauner 2025-02-21  4705  	struct path from_path __free(path_put) = {};
6bfd165709414b Jarkko Sakkinen   2019-02-01  4706  	struct path rootns_root __free(path_put) = {};
f9fde814de3755 Christian Brauner 2025-02-21  4707  	unsigned int lflags, uflags;
f9fde814de3755 Christian Brauner 2025-02-21  4708  	enum mnt_tree_flags_t mflags = 0;
6bfd165709414b Jarkko Sakkinen   2019-02-01  4709  	bool to_rootns = false;
6bfd165709414b Jarkko Sakkinen   2019-02-01  4710  	char buf[2];
2db154b3ea8e14 David Howells     2018-11-05  4711  	int ret = 0;
2db154b3ea8e14 David Howells     2018-11-05  4712  
2db154b3ea8e14 David Howells     2018-11-05  4713  	if (!may_mount())
2db154b3ea8e14 David Howells     2018-11-05  4714  		return -EPERM;
2db154b3ea8e14 David Howells     2018-11-05  4715  
2db154b3ea8e14 David Howells     2018-11-05  4716  	if (flags & ~MOVE_MOUNT__MASK)
2db154b3ea8e14 David Howells     2018-11-05  4717  		return -EINVAL;
2db154b3ea8e14 David Howells     2018-11-05  4718  
6ac392815628f3 Christian Brauner 2023-05-03  4719  	if ((flags & (MOVE_MOUNT_BENEATH | MOVE_MOUNT_SET_GROUP)) ==
6ac392815628f3 Christian Brauner 2023-05-03  4720  	    (MOVE_MOUNT_BENEATH | MOVE_MOUNT_SET_GROUP))
6ac392815628f3 Christian Brauner 2023-05-03  4721  		return -EINVAL;
6ac392815628f3 Christian Brauner 2023-05-03  4722  
f9fde814de3755 Christian Brauner 2025-02-21  4723  	if (flags & MOVE_MOUNT_SET_GROUP)	mflags |= MNT_TREE_PROPAGATION;
f9fde814de3755 Christian Brauner 2025-02-21  4724  	if (flags & MOVE_MOUNT_BENEATH)		mflags |= MNT_TREE_BENEATH;
f9fde814de3755 Christian Brauner 2025-02-21  4725  
99b6a1dee086e6 Arnd Bergmann     2025-02-26  4726  	uflags = 0;
593d9e4c3d634c Yuntao Wang       2025-08-11  4727  	if (flags & MOVE_MOUNT_T_EMPTY_PATH)
593d9e4c3d634c Yuntao Wang       2025-08-11  4728  		uflags = AT_EMPTY_PATH;
2db154b3ea8e14 David Howells     2018-11-05  4729  
cbe9e300a2c196 Al Viro           2025-12-14  4730  	CLASS(filename_maybe_null,to_name)(to_pathname, uflags);
6bfd165709414b Jarkko Sakkinen   2019-02-01  4731  
6bfd165709414b Jarkko Sakkinen   2019-02-01  4732  	uflags = 0;
6bfd165709414b Jarkko Sakkinen   2019-02-01  4733  	if (flags & MOVE_MOUNT_F_EMPTY_PATH)
6bfd165709414b Jarkko Sakkinen   2019-02-01  4734  		uflags = AT_EMPTY_PATH;
6bfd165709414b Jarkko Sakkinen   2019-02-01  4735  
6bfd165709414b Jarkko Sakkinen   2019-02-01  4736  	CLASS(filename_maybe_null, from_name)(from_pathname, uflags);
6bfd165709414b Jarkko Sakkinen   2019-02-01  4737  
6bfd165709414b Jarkko Sakkinen   2019-02-01  4738  	if (unlikely(flags & MOVE_MOUNT_T_ROOTNS_ROOT)) {
6bfd165709414b Jarkko Sakkinen   2019-02-01  4739  		struct fd f;
6bfd165709414b Jarkko Sakkinen   2019-02-01  4740  		struct rootns *rootns;
6bfd165709414b Jarkko Sakkinen   2019-02-01  4741  
6bfd165709414b Jarkko Sakkinen   2019-02-01  4742  		if (flags & MOVE_MOUNT_T_EMPTY_PATH)
6bfd165709414b Jarkko Sakkinen   2019-02-01  4743  			return -EINVAL;
6bfd165709414b Jarkko Sakkinen   2019-02-01  4744  		long nlen = strncpy_from_user(buf, to_pathname, 2);
6bfd165709414b Jarkko Sakkinen   2019-02-01  4745  
6bfd165709414b Jarkko Sakkinen   2019-02-01  4746  		if (nlen < 0)
6bfd165709414b Jarkko Sakkinen   2019-02-01  4747  			return -EFAULT;
6bfd165709414b Jarkko Sakkinen   2019-02-01  4748  		if (nlen < 1)
6bfd165709414b Jarkko Sakkinen   2019-02-01  4749  			return -EINVAL;
6bfd165709414b Jarkko Sakkinen   2019-02-01  4750  		if (buf[0] == '/' && buf[1] == '\0') {
6bfd165709414b Jarkko Sakkinen   2019-02-01  4751  			/*
6bfd165709414b Jarkko Sakkinen   2019-02-01  4752  			 * Set the root mount.
6bfd165709414b Jarkko Sakkinen   2019-02-01  4753  			 * Replace this pathname form with a dedicated API.
6bfd165709414b Jarkko Sakkinen   2019-02-01  4754  			 */
6bfd165709414b Jarkko Sakkinen   2019-02-01  4755  			if (IS_ERR(from_name))
6bfd165709414b Jarkko Sakkinen   2019-02-01  4756  				return PTR_ERR(from_name);
6bfd165709414b Jarkko Sakkinen   2019-02-01  4757  
6bfd165709414b Jarkko Sakkinen   2019-02-01  4758  			if (!from_name && from_dfd >= 0) {
6bfd165709414b Jarkko Sakkinen   2019-02-01  4759  				CLASS(fd_raw, f_from)(from_dfd);
6bfd165709414b Jarkko Sakkinen   2019-02-01  4760  				if (fd_empty(f_from))
6bfd165709414b Jarkko Sakkinen   2019-02-01  4761  					return -EBADF;
6bfd165709414b Jarkko Sakkinen   2019-02-01  4762  
6bfd165709414b Jarkko Sakkinen   2019-02-01  4763  				from_path = fd_file(f_from)->f_path;
6bfd165709414b Jarkko Sakkinen   2019-02-01  4764  				path_get(&from_path);
6bfd165709414b Jarkko Sakkinen   2019-02-01  4765  			} else {
6bfd165709414b Jarkko Sakkinen   2019-02-01  4766  				lflags = 0;
6bfd165709414b Jarkko Sakkinen   2019-02-01  4767  				if (flags & MOVE_MOUNT_F_SYMLINKS)
6bfd165709414b Jarkko Sakkinen   2019-02-01  4768  					lflags |= LOOKUP_FOLLOW;
6bfd165709414b Jarkko Sakkinen   2019-02-01  4769  				if (flags & MOVE_MOUNT_F_AUTOMOUNTS)
6bfd165709414b Jarkko Sakkinen   2019-02-01  4770  					lflags |= LOOKUP_AUTOMOUNT;
6bfd165709414b Jarkko Sakkinen   2019-02-01  4771  				ret = filename_lookup(from_dfd, from_name, lflags,
6bfd165709414b Jarkko Sakkinen   2019-02-01  4772  						      &from_path, NULL);
6bfd165709414b Jarkko Sakkinen   2019-02-01  4773  				if (ret)
6bfd165709414b Jarkko Sakkinen   2019-02-01  4774  					return ret;
6bfd165709414b Jarkko Sakkinen   2019-02-01  4775  			}
6bfd165709414b Jarkko Sakkinen   2019-02-01  4776  			return set_rootns_root(&from_path, to_dfd);
6bfd165709414b Jarkko Sakkinen   2019-02-01  4777  		}
6bfd165709414b Jarkko Sakkinen   2019-02-01  4778  
6bfd165709414b Jarkko Sakkinen   2019-02-01  4779  		/* Validate the fd as a rootns handle.
6bfd165709414b Jarkko Sakkinen   2019-02-01  4780  		 * The check is incomplete because another thread can
6bfd165709414b Jarkko Sakkinen   2019-02-01  4781  		 * replace the fd before pathwalk lookup.
6bfd165709414b Jarkko Sakkinen   2019-02-01  4782  		 */
6bfd165709414b Jarkko Sakkinen   2019-02-01  4783  		if (buf[0] == '/')
6bfd165709414b Jarkko Sakkinen   2019-02-01  4784  			return -EINVAL;
6bfd165709414b Jarkko Sakkinen   2019-02-01  4785  		f = fdget(to_dfd);
6bfd165709414b Jarkko Sakkinen   2019-02-01  4786  		if (fd_empty(f))
6bfd165709414b Jarkko Sakkinen   2019-02-01  4787  			return -EBADF;
6bfd165709414b Jarkko Sakkinen   2019-02-01  4788  		if (!is_rootns_file(fd_file(f))) {
6bfd165709414b Jarkko Sakkinen   2019-02-01  4789  			fdput(f);
6bfd165709414b Jarkko Sakkinen   2019-02-01  4790  			return -EINVAL;
6bfd165709414b Jarkko Sakkinen   2019-02-01  4791  		}
6bfd165709414b Jarkko Sakkinen   2019-02-01  4792  		rootns = fd_file(f)->private_data;
6bfd165709414b Jarkko Sakkinen   2019-02-01  4793  		if (!ns_capable(rootns->cred->user_ns, CAP_SYS_ADMIN)) {
6bfd165709414b Jarkko Sakkinen   2019-02-01  4794  			fdput(f);
6bfd165709414b Jarkko Sakkinen   2019-02-01  4795  			return -EPERM;
6bfd165709414b Jarkko Sakkinen   2019-02-01  4796  		}
6bfd165709414b Jarkko Sakkinen   2019-02-01  4797  		spin_lock(&rootns->members_lock);
6bfd165709414b Jarkko Sakkinen   2019-02-01  4798  		if (!rootns->fs_ready) {
6bfd165709414b Jarkko Sakkinen   2019-02-01  4799  			spin_unlock(&rootns->members_lock);
6bfd165709414b Jarkko Sakkinen   2019-02-01  4800  			fdput(f);
6bfd165709414b Jarkko Sakkinen   2019-02-01  4801  			return -ENOENT;
6bfd165709414b Jarkko Sakkinen   2019-02-01  4802  		}
6bfd165709414b Jarkko Sakkinen   2019-02-01  4803  		rootns_root = rootns->root;
6bfd165709414b Jarkko Sakkinen   2019-02-01  4804  		path_get(&rootns_root);
6bfd165709414b Jarkko Sakkinen   2019-02-01  4805  		spin_unlock(&rootns->members_lock);
6bfd165709414b Jarkko Sakkinen   2019-02-01  4806  		fdput(f);
6bfd165709414b Jarkko Sakkinen   2019-02-01  4807  		mflags |= MNT_TREE_ROOTNS;
6bfd165709414b Jarkko Sakkinen   2019-02-01  4808  		to_rootns = true;
6bfd165709414b Jarkko Sakkinen   2019-02-01  4809  	}
6bfd165709414b Jarkko Sakkinen   2019-02-01  4810  	if (IS_ERR(to_name))
6bfd165709414b Jarkko Sakkinen   2019-02-01  4811  		return PTR_ERR(to_name);
6bfd165709414b Jarkko Sakkinen   2019-02-01  4812  
f9fde814de3755 Christian Brauner 2025-02-21  4813  	if (!to_name && to_dfd >= 0) {
f9fde814de3755 Christian Brauner 2025-02-21 @4814  		CLASS(fd_raw, f_to)(to_dfd);
f9fde814de3755 Christian Brauner 2025-02-21  4815  		if (fd_empty(f_to))
f9fde814de3755 Christian Brauner 2025-02-21  4816  			return -EBADF;
2db154b3ea8e14 David Howells     2018-11-05  4817  
f9fde814de3755 Christian Brauner 2025-02-21  4818  		to_path = fd_file(f_to)->f_path;
f9fde814de3755 Christian Brauner 2025-02-21  4819  		path_get(&to_path);
f9fde814de3755 Christian Brauner 2025-02-21  4820  	} else {
593d9e4c3d634c Yuntao Wang       2025-08-11  4821  		lflags = 0;
593d9e4c3d634c Yuntao Wang       2025-08-11  4822  		if (flags & MOVE_MOUNT_T_SYMLINKS)
593d9e4c3d634c Yuntao Wang       2025-08-11  4823  			lflags |= LOOKUP_FOLLOW;
593d9e4c3d634c Yuntao Wang       2025-08-11  4824  		if (flags & MOVE_MOUNT_T_AUTOMOUNTS)
593d9e4c3d634c Yuntao Wang       2025-08-11  4825  			lflags |= LOOKUP_AUTOMOUNT;
6bfd165709414b Jarkko Sakkinen   2019-02-01  4826  		if (to_rootns) {
6bfd165709414b Jarkko Sakkinen   2019-02-01  4827  			if (!to_name)
6bfd165709414b Jarkko Sakkinen   2019-02-01  4828  				return -EINVAL;
6bfd165709414b Jarkko Sakkinen   2019-02-01  4829  			ret = vfs_path_lookup(rootns_root.dentry,
6bfd165709414b Jarkko Sakkinen   2019-02-01  4830  					      rootns_root.mnt,
6bfd165709414b Jarkko Sakkinen   2019-02-01  4831  					      to_name->name, lflags, &to_path);
6bfd165709414b Jarkko Sakkinen   2019-02-01  4832  		} else {
f9fde814de3755 Christian Brauner 2025-02-21  4833  			ret = filename_lookup(to_dfd, to_name, lflags, &to_path, NULL);
6bfd165709414b Jarkko Sakkinen   2019-02-01  4834  		}
f9fde814de3755 Christian Brauner 2025-02-21  4835  		if (ret)
f9fde814de3755 Christian Brauner 2025-02-21  4836  			return ret;
f9fde814de3755 Christian Brauner 2025-02-21  4837  	}
2db154b3ea8e14 David Howells     2018-11-05  4838  
593d9e4c3d634c Yuntao Wang       2025-08-11  4839  	uflags = 0;
593d9e4c3d634c Yuntao Wang       2025-08-11  4840  	if (flags & MOVE_MOUNT_F_EMPTY_PATH)
593d9e4c3d634c Yuntao Wang       2025-08-11  4841  		uflags = AT_EMPTY_PATH;
593d9e4c3d634c Yuntao Wang       2025-08-11  4842  
f9fde814de3755 Christian Brauner 2025-02-21  4843  	if (!from_name && from_dfd >= 0) {
f9fde814de3755 Christian Brauner 2025-02-21  4844  		CLASS(fd_raw, f_from)(from_dfd);
f9fde814de3755 Christian Brauner 2025-02-21  4845  		if (fd_empty(f_from))
f9fde814de3755 Christian Brauner 2025-02-21  4846  			return -EBADF;
2db154b3ea8e14 David Howells     2018-11-05  4847  
f9fde814de3755 Christian Brauner 2025-02-21  4848  		return vfs_move_mount(&fd_file(f_from)->f_path, &to_path, mflags);
f9fde814de3755 Christian Brauner 2025-02-21  4849  	}
2db154b3ea8e14 David Howells     2018-11-05  4850  
593d9e4c3d634c Yuntao Wang       2025-08-11  4851  	lflags = 0;
593d9e4c3d634c Yuntao Wang       2025-08-11  4852  	if (flags & MOVE_MOUNT_F_SYMLINKS)
593d9e4c3d634c Yuntao Wang       2025-08-11  4853  		lflags |= LOOKUP_FOLLOW;
593d9e4c3d634c Yuntao Wang       2025-08-11  4854  	if (flags & MOVE_MOUNT_F_AUTOMOUNTS)
593d9e4c3d634c Yuntao Wang       2025-08-11  4855  		lflags |= LOOKUP_AUTOMOUNT;
f9fde814de3755 Christian Brauner 2025-02-21  4856  	ret = filename_lookup(from_dfd, from_name, lflags, &from_path, NULL);
f9fde814de3755 Christian Brauner 2025-02-21  4857  	if (ret)
2db154b3ea8e14 David Howells     2018-11-05  4858  		return ret;
f9fde814de3755 Christian Brauner 2025-02-21  4859  
f9fde814de3755 Christian Brauner 2025-02-21  4860  	return vfs_move_mount(&from_path, &to_path, mflags);
2db154b3ea8e14 David Howells     2018-11-05  4861  }
2db154b3ea8e14 David Howells     2018-11-05  4862  

:::::: The code at line 4814 was first introduced by commit
:::::: f9fde814de3755d5d3818fe51244c45699f7252e fs: support getname_maybe_null() in move_mount()

:::::: TO: Christian Brauner <brauner@kernel.org>
:::::: CC: Christian Brauner <brauner@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
