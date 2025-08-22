Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717BB287276
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Aug 2025 08:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755851905; cv=none; b=fxVl2QyFAM2cNVDvlEK0ClfgykZoMRsnv9Fn4DdebpqUTtIvhH27u1MlRY64LXVR7/YKnckU7mJ6m6Qa53yEK9SJPGwUxiyzwH/03PPDen3PGWg+gW2ZGEPXYCkYQqXu0n/NS2Lbbmqupgix185eIFD7/xuM6bFfYUspeXuTHi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755851905; c=relaxed/simple;
	bh=Tb01CG4dyun5onIkXeJiN7SO3/k59PfpSuRhWapnRyI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=au4ZjBTkxkVDqI1OR6lwTFfOIfgXkFxHVok00tWx5xAQBFG5l/OSdYB2iIP1kPzn4fVuFrtDWxLPWhhSjlQbC3bL13MvgFfVE9P+eoZSoQIbtVyHamrMmu6BKRH6154bBPFk6SzvmVfrAZlrsdaD7c4UDy74jBzIFlKpCzUwI8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j1zqYLVD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j1zqYLVD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755851904; x=1787387904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tb01CG4dyun5onIkXeJiN7SO3/k59PfpSuRhWapnRyI=;
  b=j1zqYLVDAEgOblKXjrd/wzILbAeF88E4xx0a3/uy/VxFZL6BSHpVuvU+
   gkQJ+tohgXRqYYCKXN0KdrJo/rPDCgfOf0zqYz32/iUWc8CpXGmpfnUj5
   G1zQQY4ZCQnn/qRbXpSWLEwoq4nIB/k8uim8yK7n13QEHlZz8P69xqH8O
   OrX8dDKvB7DQmZuVXwmcDQfCaCaXLp5RhJ9/NKIEIS0ECkZWwus+qk1gZ
   0B1aMGIPm2IOVo1zvh/yrQ8s+PoVvS9gJDRy6f/4+J0EEC1rzW83V8OUh
   ltT+lUReuwSJdUpindn4SE6FanSJ1dkSo9esalDKpEhoymsLXV6Mk8CVw
   Q==;
X-CSE-ConnectionGUID: nmWpjmfNRRuNN5w+SOoLRw==
X-CSE-MsgGUID: ZgiZw48eT2OAleWP7aEWAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58018805"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="58018805"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 01:38:23 -0700
X-CSE-ConnectionGUID: 3eMlu4/NS3m3DrqBVcimhg==
X-CSE-MsgGUID: yfQ52O9NQiyjgp+B7ikk+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="168161511"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 22 Aug 2025 01:38:21 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upNHo-000L4b-2w;
	Fri, 22 Aug 2025 08:38:15 +0000
Date: Fri, 22 Aug 2025 16:37:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/file_attr.c:402 __do_sys_file_getattr() warn: comparison of a
 potentially tagged address (__do_sys_file_getattr, 3, usize)
Message-ID: <202508221602.RAXj7KF9-lkp@intel.com>
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
TO: Andrey Albershteyn <aalbersh@redhat.com>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3957a5720157264dcc41415fbec7c51c4000fc2d
commit: be7efb2d20d67f334a7de2aef77ae6c69367e646 fs: introduce file_getattr and file_setattr syscalls
date:   7 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 7 weeks ago
config: arm64-randconfig-r071-20250822 (https://download.01.org/0day-ci/archive/20250822/202508221602.RAXj7KF9-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508221602.RAXj7KF9-lkp@intel.com/

smatch warnings:
fs/file_attr.c:402 __do_sys_file_getattr() warn: comparison of a potentially tagged address (__do_sys_file_getattr, 3, usize)
fs/file_attr.c:402 __do_sys_file_getattr() warn: comparison of a potentially tagged address (__do_sys_file_getattr, 3, usize)
fs/file_attr.c:457 __do_sys_file_setattr() warn: comparison of a potentially tagged address (__do_sys_file_setattr, 3, usize)
fs/file_attr.c:457 __do_sys_file_setattr() warn: comparison of a potentially tagged address (__do_sys_file_setattr, 3, usize)

vim +402 fs/file_attr.c

be7efb2d20d67f Andrey Albershteyn 2025-06-30  381  
be7efb2d20d67f Andrey Albershteyn 2025-06-30  382  SYSCALL_DEFINE5(file_getattr, int, dfd, const char __user *, filename,
be7efb2d20d67f Andrey Albershteyn 2025-06-30  383  		struct file_attr __user *, ufattr, size_t, usize,
be7efb2d20d67f Andrey Albershteyn 2025-06-30  384  		unsigned int, at_flags)
be7efb2d20d67f Andrey Albershteyn 2025-06-30  385  {
be7efb2d20d67f Andrey Albershteyn 2025-06-30  386  	struct path filepath __free(path_put) = {};
be7efb2d20d67f Andrey Albershteyn 2025-06-30  387  	struct filename *name __free(putname) = NULL;
be7efb2d20d67f Andrey Albershteyn 2025-06-30  388  	unsigned int lookup_flags = 0;
be7efb2d20d67f Andrey Albershteyn 2025-06-30  389  	struct file_attr fattr;
be7efb2d20d67f Andrey Albershteyn 2025-06-30  390  	struct fileattr fa;
be7efb2d20d67f Andrey Albershteyn 2025-06-30  391  	int error;
be7efb2d20d67f Andrey Albershteyn 2025-06-30  392  
be7efb2d20d67f Andrey Albershteyn 2025-06-30  393  	BUILD_BUG_ON(sizeof(struct file_attr) < FILE_ATTR_SIZE_VER0);
be7efb2d20d67f Andrey Albershteyn 2025-06-30  394  	BUILD_BUG_ON(sizeof(struct file_attr) != FILE_ATTR_SIZE_LATEST);
be7efb2d20d67f Andrey Albershteyn 2025-06-30  395  
be7efb2d20d67f Andrey Albershteyn 2025-06-30  396  	if ((at_flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) != 0)
be7efb2d20d67f Andrey Albershteyn 2025-06-30  397  		return -EINVAL;
be7efb2d20d67f Andrey Albershteyn 2025-06-30  398  
be7efb2d20d67f Andrey Albershteyn 2025-06-30  399  	if (!(at_flags & AT_SYMLINK_NOFOLLOW))
be7efb2d20d67f Andrey Albershteyn 2025-06-30  400  		lookup_flags |= LOOKUP_FOLLOW;
be7efb2d20d67f Andrey Albershteyn 2025-06-30  401  
be7efb2d20d67f Andrey Albershteyn 2025-06-30 @402  	if (usize > PAGE_SIZE)
be7efb2d20d67f Andrey Albershteyn 2025-06-30  403  		return -E2BIG;
be7efb2d20d67f Andrey Albershteyn 2025-06-30  404  
be7efb2d20d67f Andrey Albershteyn 2025-06-30  405  	if (usize < FILE_ATTR_SIZE_VER0)
be7efb2d20d67f Andrey Albershteyn 2025-06-30  406  		return -EINVAL;
be7efb2d20d67f Andrey Albershteyn 2025-06-30  407  
be7efb2d20d67f Andrey Albershteyn 2025-06-30  408  	name = getname_maybe_null(filename, at_flags);
be7efb2d20d67f Andrey Albershteyn 2025-06-30  409  	if (IS_ERR(name))
be7efb2d20d67f Andrey Albershteyn 2025-06-30  410  		return PTR_ERR(name);
be7efb2d20d67f Andrey Albershteyn 2025-06-30  411  
be7efb2d20d67f Andrey Albershteyn 2025-06-30  412  	if (!name && dfd >= 0) {
be7efb2d20d67f Andrey Albershteyn 2025-06-30  413  		CLASS(fd, f)(dfd);
be7efb2d20d67f Andrey Albershteyn 2025-06-30  414  		if (fd_empty(f))
be7efb2d20d67f Andrey Albershteyn 2025-06-30  415  			return -EBADF;
be7efb2d20d67f Andrey Albershteyn 2025-06-30  416  
be7efb2d20d67f Andrey Albershteyn 2025-06-30  417  		filepath = fd_file(f)->f_path;
be7efb2d20d67f Andrey Albershteyn 2025-06-30  418  		path_get(&filepath);
be7efb2d20d67f Andrey Albershteyn 2025-06-30  419  	} else {
be7efb2d20d67f Andrey Albershteyn 2025-06-30  420  		error = filename_lookup(dfd, name, lookup_flags, &filepath,
be7efb2d20d67f Andrey Albershteyn 2025-06-30  421  					NULL);
be7efb2d20d67f Andrey Albershteyn 2025-06-30  422  		if (error)
be7efb2d20d67f Andrey Albershteyn 2025-06-30  423  			return error;
be7efb2d20d67f Andrey Albershteyn 2025-06-30  424  	}
be7efb2d20d67f Andrey Albershteyn 2025-06-30  425  
be7efb2d20d67f Andrey Albershteyn 2025-06-30  426  	error = vfs_fileattr_get(filepath.dentry, &fa);
be7efb2d20d67f Andrey Albershteyn 2025-06-30  427  	if (error)
be7efb2d20d67f Andrey Albershteyn 2025-06-30  428  		return error;
be7efb2d20d67f Andrey Albershteyn 2025-06-30  429  
be7efb2d20d67f Andrey Albershteyn 2025-06-30  430  	fileattr_to_file_attr(&fa, &fattr);
be7efb2d20d67f Andrey Albershteyn 2025-06-30  431  	error = copy_struct_to_user(ufattr, usize, &fattr,
be7efb2d20d67f Andrey Albershteyn 2025-06-30  432  				    sizeof(struct file_attr), NULL);
be7efb2d20d67f Andrey Albershteyn 2025-06-30  433  
be7efb2d20d67f Andrey Albershteyn 2025-06-30  434  	return error;
be7efb2d20d67f Andrey Albershteyn 2025-06-30  435  }
be7efb2d20d67f Andrey Albershteyn 2025-06-30  436  
be7efb2d20d67f Andrey Albershteyn 2025-06-30  437  SYSCALL_DEFINE5(file_setattr, int, dfd, const char __user *, filename,
be7efb2d20d67f Andrey Albershteyn 2025-06-30  438  		struct file_attr __user *, ufattr, size_t, usize,
be7efb2d20d67f Andrey Albershteyn 2025-06-30  439  		unsigned int, at_flags)
be7efb2d20d67f Andrey Albershteyn 2025-06-30  440  {
be7efb2d20d67f Andrey Albershteyn 2025-06-30  441  	struct path filepath __free(path_put) = {};
be7efb2d20d67f Andrey Albershteyn 2025-06-30  442  	struct filename *name __free(putname) = NULL;
be7efb2d20d67f Andrey Albershteyn 2025-06-30  443  	unsigned int lookup_flags = 0;
be7efb2d20d67f Andrey Albershteyn 2025-06-30  444  	struct file_attr fattr;
be7efb2d20d67f Andrey Albershteyn 2025-06-30  445  	struct fileattr fa;
be7efb2d20d67f Andrey Albershteyn 2025-06-30  446  	int error;
be7efb2d20d67f Andrey Albershteyn 2025-06-30  447  
be7efb2d20d67f Andrey Albershteyn 2025-06-30  448  	BUILD_BUG_ON(sizeof(struct file_attr) < FILE_ATTR_SIZE_VER0);
be7efb2d20d67f Andrey Albershteyn 2025-06-30  449  	BUILD_BUG_ON(sizeof(struct file_attr) != FILE_ATTR_SIZE_LATEST);
be7efb2d20d67f Andrey Albershteyn 2025-06-30  450  
be7efb2d20d67f Andrey Albershteyn 2025-06-30  451  	if ((at_flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) != 0)
be7efb2d20d67f Andrey Albershteyn 2025-06-30  452  		return -EINVAL;
be7efb2d20d67f Andrey Albershteyn 2025-06-30  453  
be7efb2d20d67f Andrey Albershteyn 2025-06-30  454  	if (!(at_flags & AT_SYMLINK_NOFOLLOW))
be7efb2d20d67f Andrey Albershteyn 2025-06-30  455  		lookup_flags |= LOOKUP_FOLLOW;
be7efb2d20d67f Andrey Albershteyn 2025-06-30  456  
be7efb2d20d67f Andrey Albershteyn 2025-06-30 @457  	if (usize > PAGE_SIZE)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
