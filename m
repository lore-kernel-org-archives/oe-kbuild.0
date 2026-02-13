Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D1226ED3E
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Feb 2026 05:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770961940; cv=none; b=jcFbDK1cec9WG0bQiqnNPKQBJgfzWAtdu982TkrmU6tRHfM0xBTcHh9d94JHAv0eg7SUU3sH7aJWXOPFLaECzwY3ZsDfdVDqwJoXOS9uRQ+3RQ3GyKLFL7s9HYFv0jit10q6FNnaUWrUBQRBTZyIPYUuXHKJptsyTB+qLxIqg9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770961940; c=relaxed/simple;
	bh=ouhvh5dAJn0nlruxNvPbrCN+rqgBJfI7GooTQ1w/6fM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aBBqUTrSkQ0HqTdcfWjZzj17+gk2GZy52zaycYhuz8ZXiTYLv3txC6lyu7PjfOF0RRetFE5oZGcY5T1cLM+ylNnnG69+MI5JN+JQza50l0gFvK9e5e9YcsHmE3snBPN+VTrnrMLFiSRMWDv8XyjIljY9Vuv5jKuJUwU8gYkpHzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H+Rj0j/O; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H+Rj0j/O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770961939; x=1802497939;
  h=date:from:to:cc:subject:message-id;
  bh=ouhvh5dAJn0nlruxNvPbrCN+rqgBJfI7GooTQ1w/6fM=;
  b=H+Rj0j/O5ejwp2RuCF0T49/a1PrRx7PZPiOiHgjGPLz4MF3A5iRzHAp/
   ZDLUE258T7dkjoHBY80r0u9i/uXRzQbox2q9v01xvl2acVLawjVp+T+L2
   WZ7MOFbcpJQAEi4D9avhUEtwcJArRy02bd7/daZAEUc4bpeQRX/yL2jg4
   vJDajTMLzmky52rCTuwF8iZ6lLn6rz4m0r4xNKxEhNsx3ay9/hAtM0tVF
   1EoYvoeMk5TPzez3UuQqR0GdQfn8lQb/iF8K76fy3N1lkH/O9ZFld/Nmw
   dhnO6ctyfrKPjc4DLZuosjpnkxIVOquEcKXpE5soxRirOiIV9xqHiYhbK
   g==;
X-CSE-ConnectionGUID: 0qJOklE+RyetdW/W/Dz5cQ==
X-CSE-MsgGUID: lItifKe7RiS5M3pDO9oIjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="75990984"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="75990984"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 21:52:16 -0800
X-CSE-ConnectionGUID: +zuR43bcR7KfaJAli727fQ==
X-CSE-MsgGUID: AAjymp1YSLCAUDbVox8dyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="211744069"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Feb 2026 21:52:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqm69-00000000v8M-2zKW;
	Fri, 13 Feb 2026 05:52:13 +0000
Date: Fri, 13 Feb 2026 13:51:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-github:work.xattr.socket 5/15] fs/pidfs.c:1051
 pidfs_xattr_set() warn: passing zero to 'PTR_ERR'
Message-ID: <202602131331.tuJ4AbSd-lkp@intel.com>
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

tree:   https://github.com/brauner/linux.git work.xattr.socket
head:   71497e95abd2418d5b924ce01a3c395b9fa08932
commit: 97ff25d91014a5e99c3bb4d185a6fab03553f9a2 [5/15] pidfs: adapt to rhashtable-based simple_xattrs
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: m68k-randconfig-r073-20260213 (https://download.01.org/0day-ci/archive/20260213/202602131331.tuJ4AbSd-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.4.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602131331.tuJ4AbSd-lkp@intel.com/

smatch warnings:
fs/pidfs.c:1051 pidfs_xattr_set() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1051 fs/pidfs.c

91d837cae3c785 Christian Brauner 2025-06-18  1034  
91d837cae3c785 Christian Brauner 2025-06-18  1035  static int pidfs_xattr_set(const struct xattr_handler *handler,
91d837cae3c785 Christian Brauner 2025-06-18  1036  			   struct mnt_idmap *idmap, struct dentry *unused,
91d837cae3c785 Christian Brauner 2025-06-18  1037  			   struct inode *inode, const char *suffix,
91d837cae3c785 Christian Brauner 2025-06-18  1038  			   const void *value, size_t size, int flags)
91d837cae3c785 Christian Brauner 2025-06-18  1039  {
91d837cae3c785 Christian Brauner 2025-06-18  1040  	struct pid *pid = inode->i_private;
91d837cae3c785 Christian Brauner 2025-06-18  1041  	struct pidfs_attr *attr = pid->attr;
91d837cae3c785 Christian Brauner 2025-06-18  1042  	const char *name;
91d837cae3c785 Christian Brauner 2025-06-18  1043  	struct simple_xattrs *xattrs;
91d837cae3c785 Christian Brauner 2025-06-18  1044  	struct simple_xattr *old_xattr;
91d837cae3c785 Christian Brauner 2025-06-18  1045  
91d837cae3c785 Christian Brauner 2025-06-18  1046  	/* Ensure we're the only one to set @attr->xattrs. */
91d837cae3c785 Christian Brauner 2025-06-18  1047  	WARN_ON_ONCE(!inode_is_locked(inode));
91d837cae3c785 Christian Brauner 2025-06-18  1048  
97ff25d91014a5 Christian Brauner 2026-02-10  1049  	xattrs = simple_xattrs_lazy_alloc(&attr->xattrs, value, flags);
97ff25d91014a5 Christian Brauner 2026-02-10  1050  	if (IS_ERR_OR_NULL(xattrs))
97ff25d91014a5 Christian Brauner 2026-02-10 @1051  		return PTR_ERR(xattrs);
91d837cae3c785 Christian Brauner 2025-06-18  1052  
91d837cae3c785 Christian Brauner 2025-06-18  1053  	name = xattr_full_name(handler, suffix);
91d837cae3c785 Christian Brauner 2025-06-18  1054  	old_xattr = simple_xattr_set(xattrs, name, value, size, flags);
91d837cae3c785 Christian Brauner 2025-06-18  1055  	if (IS_ERR(old_xattr))
91d837cae3c785 Christian Brauner 2025-06-18  1056  		return PTR_ERR(old_xattr);
91d837cae3c785 Christian Brauner 2025-06-18  1057  
97ff25d91014a5 Christian Brauner 2026-02-10  1058  	simple_xattr_free_rcu(old_xattr);
91d837cae3c785 Christian Brauner 2025-06-18  1059  	return 0;
91d837cae3c785 Christian Brauner 2025-06-18  1060  }
91d837cae3c785 Christian Brauner 2025-06-18  1061  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
