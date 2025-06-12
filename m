Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7F51EC018
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Jun 2025 12:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749732253; cv=none; b=f4Hh/JMHOKiuoxtPSLAXUbpouF6wppovkJf7TbIpdhpdbaTuTH/67DXuVfy3cHByeqPXQnWAQkjPWsVafWCA6bgUFE2q9wql+Ohl1RfsHgQTwPMMwDFEm0q4nvFvc6p/BHNjXQDsfpsHc3m7XOIpb7ZUL0sqL72m9KtpoWui9ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749732253; c=relaxed/simple;
	bh=k+j7bs4pHa2dvGmpiTjFK6OsWTQxDYPeZ099VVOOdZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J7KJInhdxFQcwx+tN4BI6zxW3HmI7xOSMtz8T7HcgiiKgOgsU3GvP2KF/rLq0bjRj1v0LQ+cipe0XFb3hyoH8gybw9RhNqhv1wnSB2KnEANE33FSHh3ImhVCQkWtlcwKqu+OD1Vmpp0vnlquDNlSP1iZ9q0i6LR2QLED6dYROiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mp0jbpOb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mp0jbpOb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749732252; x=1781268252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k+j7bs4pHa2dvGmpiTjFK6OsWTQxDYPeZ099VVOOdZE=;
  b=mp0jbpOblBeMC/2mxWJOvIgofqxye2n9pgel7wksBWtf4cVQyLPsyZzN
   emHmRoe3s4Cdd43VJdfVJamj18i6BueKBKAJCiHqt6G0mcd+sDpe712r3
   mqTViX0OePPUoF0OERk0l9xlReiHhZ6Bx3bhDgb664e9JgMMlYtnCMzhp
   J5Vv+gXoFbawf4y358nm5XBLU9oqP1xjzy9Oe3wCxjt8fK5keaCcYFVFy
   A7MiA442GAMTa+sly3gpgfn3qINjwOQNk59EO4PbWl7d4XYDztqSuvkVd
   CRg/tXKDXm3NDIaKdFkiWWkmg+eweDCXSuKVdvDRN4aHgcXtNclw99k60
   A==;
X-CSE-ConnectionGUID: 9DEf92xVTW60TbGcNDcdtg==
X-CSE-MsgGUID: RChxUex7Rs69M+0VRbpmIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="52005415"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="52005415"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 05:44:11 -0700
X-CSE-ConnectionGUID: ETzzN2A/SeGvDWi9l7WANQ==
X-CSE-MsgGUID: sd8T2XtFSPimtrxkU9IoOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="147389413"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Jun 2025 05:44:10 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPhHs-000BXS-12;
	Thu, 12 Jun 2025 12:44:08 +0000
Date: Thu, 12 Jun 2025 20:43:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dhowells-fs:container 10/12] fs/namespace.c:4736
 __do_sys_move_mount() warn: error code type promoted to positive: 'nlen'
Message-ID: <202506122037.4RY3AX7S-lkp@intel.com>
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
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git container
head:   9c7dfe5d079eae551e81631cf2ec09d4f1de43b0
commit: fa4df9e25bfe66b9d92d6eefa8afb384787bbfd8 [10/12] vfs: Allow mounting to other namespaces
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: mips-randconfig-r072-20250612 (https://download.01.org/0day-ci/archive/20250612/202506122037.4RY3AX7S-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506122037.4RY3AX7S-lkp@intel.com/

New smatch warnings:
fs/namespace.c:4736 __do_sys_move_mount() warn: error code type promoted to positive: 'nlen'
fs/namespace.c:4736 __do_sys_move_mount() warn: error code type promoted to positive: 'nlen'

Old smatch warnings:
fs/namespace.c:4736 __do_sys_move_mount() warn: unsigned 'nlen' is never less than zero.
fs/namespace.c:4738 __do_sys_move_mount() warn: error code type promoted to positive: 'nlen'
fs/namespace.c:4777 __do_sys_move_mount() warn: fd re-used after fget(): 'to_dfd'
fs/namespace.c:4736 __do_sys_move_mount() warn: unsigned 'nlen' is never less than zero.
fs/namespace.c:4738 __do_sys_move_mount() warn: error code type promoted to positive: 'nlen'
fs/namespace.c:4777 __do_sys_move_mount() warn: fd re-used after fget(): 'to_dfd'
fs/namespace.c:5050 mount_setattr_prepare() error: uninitialized symbol 'err'.

vim +/nlen +4736 fs/namespace.c

0aa5f5116dc94a David Howells     2019-02-01  4687  
93766fbd2696c2 David Howells     2018-11-01  4688  /*
93766fbd2696c2 David Howells     2018-11-01  4689   * Move a mount from one place to another.  In combination with
93766fbd2696c2 David Howells     2018-11-01  4690   * fsopen()/fsmount() this is used to install a new mount and in combination
93766fbd2696c2 David Howells     2018-11-01  4691   * with open_tree(OPEN_TREE_CLONE [| AT_RECURSIVE]) it can be used to copy
93766fbd2696c2 David Howells     2018-11-01  4692   * a mount subtree.
2db154b3ea8e14 David Howells     2018-11-05  4693   *
2db154b3ea8e14 David Howells     2018-11-05  4694   * Note the flags value is a combination of MOVE_MOUNT_* flags.
2db154b3ea8e14 David Howells     2018-11-05  4695   */
2db154b3ea8e14 David Howells     2018-11-05  4696  SYSCALL_DEFINE5(move_mount,
2658ce095df583 Ben Dooks         2019-10-15  4697  		int, from_dfd, const char __user *, from_pathname,
2658ce095df583 Ben Dooks         2019-10-15  4698  		int, to_dfd, const char __user *, to_pathname,
2db154b3ea8e14 David Howells     2018-11-05  4699  		unsigned int, flags)
2db154b3ea8e14 David Howells     2018-11-05  4700  {
f9fde814de3755 Christian Brauner 2025-02-21  4701  	struct path to_path __free(path_put) = {};
f9fde814de3755 Christian Brauner 2025-02-21  4702  	struct path from_path __free(path_put) = {};
f9fde814de3755 Christian Brauner 2025-02-21  4703  	struct filename *to_name __free(putname) = NULL;
f9fde814de3755 Christian Brauner 2025-02-21  4704  	struct filename *from_name __free(putname) = NULL;
f9fde814de3755 Christian Brauner 2025-02-21  4705  	unsigned int lflags, uflags;
f9fde814de3755 Christian Brauner 2025-02-21  4706  	enum mnt_tree_flags_t mflags = 0;
0aa5f5116dc94a David Howells     2019-02-01  4707  	char buf[2];
2db154b3ea8e14 David Howells     2018-11-05  4708  	int ret = 0;
2db154b3ea8e14 David Howells     2018-11-05  4709  
2db154b3ea8e14 David Howells     2018-11-05  4710  	if (!may_mount())
2db154b3ea8e14 David Howells     2018-11-05  4711  		return -EPERM;
2db154b3ea8e14 David Howells     2018-11-05  4712  
2db154b3ea8e14 David Howells     2018-11-05  4713  	if (flags & ~MOVE_MOUNT__MASK)
2db154b3ea8e14 David Howells     2018-11-05  4714  		return -EINVAL;
2db154b3ea8e14 David Howells     2018-11-05  4715  
6ac392815628f3 Christian Brauner 2023-05-03  4716  	if ((flags & (MOVE_MOUNT_BENEATH | MOVE_MOUNT_SET_GROUP)) ==
6ac392815628f3 Christian Brauner 2023-05-03  4717  	    (MOVE_MOUNT_BENEATH | MOVE_MOUNT_SET_GROUP))
6ac392815628f3 Christian Brauner 2023-05-03  4718  		return -EINVAL;
6ac392815628f3 Christian Brauner 2023-05-03  4719  
f9fde814de3755 Christian Brauner 2025-02-21  4720  	if (flags & MOVE_MOUNT_SET_GROUP)	mflags |= MNT_TREE_PROPAGATION;
f9fde814de3755 Christian Brauner 2025-02-21  4721  	if (flags & MOVE_MOUNT_BENEATH)		mflags |= MNT_TREE_BENEATH;
f9fde814de3755 Christian Brauner 2025-02-21  4722  
2db154b3ea8e14 David Howells     2018-11-05  4723  	lflags = 0;
2db154b3ea8e14 David Howells     2018-11-05  4724  	if (flags & MOVE_MOUNT_F_SYMLINKS)	lflags |= LOOKUP_FOLLOW;
2db154b3ea8e14 David Howells     2018-11-05  4725  	if (flags & MOVE_MOUNT_F_AUTOMOUNTS)	lflags |= LOOKUP_AUTOMOUNT;
99b6a1dee086e6 Arnd Bergmann     2025-02-26  4726  	uflags = 0;
f9fde814de3755 Christian Brauner 2025-02-21  4727  	if (flags & MOVE_MOUNT_F_EMPTY_PATH)	uflags = AT_EMPTY_PATH;
f9fde814de3755 Christian Brauner 2025-02-21  4728  	from_name = getname_maybe_null(from_pathname, uflags);
f9fde814de3755 Christian Brauner 2025-02-21  4729  	if (IS_ERR(from_name))
f9fde814de3755 Christian Brauner 2025-02-21  4730  		return PTR_ERR(from_name);
2db154b3ea8e14 David Howells     2018-11-05  4731  
0aa5f5116dc94a David Howells     2019-02-01  4732  	if (unlikely(flags & MOVE_MOUNT_T_CONTAINER_ROOT)) {
fa4df9e25bfe66 David Howells     2019-02-01  4733  		if (flags & MOVE_MOUNT_T_EMPTY_PATH)
0aa5f5116dc94a David Howells     2019-02-01  4734  			return -EINVAL;
fa4df9e25bfe66 David Howells     2019-02-01  4735  		size_t nlen = strncpy_from_user(buf, to_pathname, 2);
fa4df9e25bfe66 David Howells     2019-02-01 @4736  		if (nlen < 0)
0aa5f5116dc94a David Howells     2019-02-01  4737  			return -EFAULT;
fa4df9e25bfe66 David Howells     2019-02-01  4738  		if (nlen < 1)
0aa5f5116dc94a David Howells     2019-02-01  4739  			return -EINVAL;
fa4df9e25bfe66 David Howells     2019-02-01  4740  		if (buf[0] == '/' && buf[1] == '\0') {
fa4df9e25bfe66 David Howells     2019-02-01  4741  			/* Set the root.  This might be better done by
fa4df9e25bfe66 David Howells     2019-02-01  4742  			 * requiring to_pathname to be NULL.
fa4df9e25bfe66 David Howells     2019-02-01  4743  			 */
0aa5f5116dc94a David Howells     2019-02-01  4744  			ret = filename_lookup(from_dfd, from_name, lflags, &from_path, NULL);
0aa5f5116dc94a David Howells     2019-02-01  4745  			if (ret)
0aa5f5116dc94a David Howells     2019-02-01  4746  				return ret;
0aa5f5116dc94a David Howells     2019-02-01  4747  			return set_container_root(&from_path, to_dfd);
0aa5f5116dc94a David Howells     2019-02-01  4748  		}
0aa5f5116dc94a David Howells     2019-02-01  4749  
fa4df9e25bfe66 David Howells     2019-02-01  4750  		/* Check the fd is a container handle.  This isn't a perfect
fa4df9e25bfe66 David Howells     2019-02-01  4751  		 * check as another thread can jump in and change the fd
fa4df9e25bfe66 David Howells     2019-02-01  4752  		 * between now and when pathwalk looks it up.
fa4df9e25bfe66 David Howells     2019-02-01  4753  		 */
fa4df9e25bfe66 David Howells     2019-02-01  4754  		if (buf[0] == '/')
fa4df9e25bfe66 David Howells     2019-02-01  4755  			return -EINVAL;
fa4df9e25bfe66 David Howells     2019-02-01  4756  		struct fd f = fdget(to_dfd);
fa4df9e25bfe66 David Howells     2019-02-01  4757  		if (fd_empty(f))
fa4df9e25bfe66 David Howells     2019-02-01  4758  			return -EBADF;
fa4df9e25bfe66 David Howells     2019-02-01  4759  		if (!is_container_file(fd_file(f))) {
fa4df9e25bfe66 David Howells     2019-02-01  4760  			fdput(f);
fa4df9e25bfe66 David Howells     2019-02-01  4761  			return -EINVAL;
fa4df9e25bfe66 David Howells     2019-02-01  4762  		}
fa4df9e25bfe66 David Howells     2019-02-01  4763  		fdput(f);
fa4df9e25bfe66 David Howells     2019-02-01  4764  		mflags |= MNT_TREE_CONTAINER;
fa4df9e25bfe66 David Howells     2019-02-01  4765  	}
fa4df9e25bfe66 David Howells     2019-02-01  4766  
2db154b3ea8e14 David Howells     2018-11-05  4767  	lflags = 0;
2db154b3ea8e14 David Howells     2018-11-05  4768  	if (flags & MOVE_MOUNT_T_SYMLINKS)	lflags |= LOOKUP_FOLLOW;
2db154b3ea8e14 David Howells     2018-11-05  4769  	if (flags & MOVE_MOUNT_T_AUTOMOUNTS)	lflags |= LOOKUP_AUTOMOUNT;
99b6a1dee086e6 Arnd Bergmann     2025-02-26  4770  	uflags = 0;
f9fde814de3755 Christian Brauner 2025-02-21  4771  	if (flags & MOVE_MOUNT_T_EMPTY_PATH)	uflags = AT_EMPTY_PATH;
f9fde814de3755 Christian Brauner 2025-02-21  4772  	to_name = getname_maybe_null(to_pathname, uflags);
f9fde814de3755 Christian Brauner 2025-02-21  4773  	if (IS_ERR(to_name))
f9fde814de3755 Christian Brauner 2025-02-21  4774  		return PTR_ERR(to_name);
f9fde814de3755 Christian Brauner 2025-02-21  4775  
f9fde814de3755 Christian Brauner 2025-02-21  4776  	if (!to_name && to_dfd >= 0) {
f9fde814de3755 Christian Brauner 2025-02-21  4777  		CLASS(fd_raw, f_to)(to_dfd);
f9fde814de3755 Christian Brauner 2025-02-21  4778  		if (fd_empty(f_to))
f9fde814de3755 Christian Brauner 2025-02-21  4779  			return -EBADF;
2db154b3ea8e14 David Howells     2018-11-05  4780  
f9fde814de3755 Christian Brauner 2025-02-21  4781  		to_path = fd_file(f_to)->f_path;
f9fde814de3755 Christian Brauner 2025-02-21  4782  		path_get(&to_path);
f9fde814de3755 Christian Brauner 2025-02-21  4783  	} else {
f9fde814de3755 Christian Brauner 2025-02-21  4784  		ret = filename_lookup(to_dfd, to_name, lflags, &to_path, NULL);
f9fde814de3755 Christian Brauner 2025-02-21  4785  		if (ret)
f9fde814de3755 Christian Brauner 2025-02-21  4786  			return ret;
f9fde814de3755 Christian Brauner 2025-02-21  4787  	}
2db154b3ea8e14 David Howells     2018-11-05  4788  
f9fde814de3755 Christian Brauner 2025-02-21  4789  	if (!from_name && from_dfd >= 0) {
f9fde814de3755 Christian Brauner 2025-02-21  4790  		CLASS(fd_raw, f_from)(from_dfd);
f9fde814de3755 Christian Brauner 2025-02-21  4791  		if (fd_empty(f_from))
f9fde814de3755 Christian Brauner 2025-02-21  4792  			return -EBADF;
2db154b3ea8e14 David Howells     2018-11-05  4793  
f9fde814de3755 Christian Brauner 2025-02-21  4794  		return vfs_move_mount(&fd_file(f_from)->f_path, &to_path, mflags);
f9fde814de3755 Christian Brauner 2025-02-21  4795  	}
2db154b3ea8e14 David Howells     2018-11-05  4796  
f9fde814de3755 Christian Brauner 2025-02-21  4797  	ret = filename_lookup(from_dfd, from_name, lflags, &from_path, NULL);
f9fde814de3755 Christian Brauner 2025-02-21  4798  	if (ret)
2db154b3ea8e14 David Howells     2018-11-05  4799  		return ret;
f9fde814de3755 Christian Brauner 2025-02-21  4800  
f9fde814de3755 Christian Brauner 2025-02-21  4801  	return vfs_move_mount(&from_path, &to_path, mflags);
2db154b3ea8e14 David Howells     2018-11-05  4802  }
2db154b3ea8e14 David Howells     2018-11-05  4803  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
