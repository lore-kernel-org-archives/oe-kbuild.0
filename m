Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E49E2222AA
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Feb 2025 12:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740571978; cv=none; b=lRrdDU+mIxqzem56obsXydjnfcqY7e5VcoseBykK/nHd8YkXWbFWVJP8SUez1/s2yp00JO5d9+z2jrwc44BV0ZP0PS+/p7VcTCHFyKSVYYP7sRdesr9qWOw/HXdvE4CQuWSr4Hgdeh+1spw8CaOg8YkzpWGVWKY61xd3EQl5hE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740571978; c=relaxed/simple;
	bh=nxgHoQdXTZK7hdM9uRUKWzqI1s9oRysJZRHhdFA1FHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IM5/KdIJFUCYlRlRCld/cZInGZN0UWPnGr8I5A2R0fKctukwYXgvAqlRIjrrmmU5j/qYDljAugmKmvQmMGK2OqeCZ06ZdCSv9s+E6/gVYIw6VNt+XPIZK1WFXGkbth8l2lfW56AAWob8mTBq32Nnv3DsNZaVA17t3q7sDk7+40c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A74IpTrp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A74IpTrp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740571976; x=1772107976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nxgHoQdXTZK7hdM9uRUKWzqI1s9oRysJZRHhdFA1FHk=;
  b=A74IpTrp9Fn8vy4JG3HAYYLH+W5vJfZzS7gEJM/DGrpHUPTiOEUmVQ0q
   BJwp27u/aHZh84rlEsOacHVYb5ZZPRdInsbY54Fq5eGwEsTESSaNd28g1
   h/BlwqpFmq7B4nnaWtgRU5llSV/CxzXQ6+dmfyAYU/QSRARIP3Pt52Y/3
   nO1e10w/pGR7xZSelMfigMLZWK1HNunHNbvB2Jjf5xwlWyWhjBF+ziZn/
   vcL/uK7hoK0uQjGQuMHva8SQu9sMALBeqVfVXRhnaf9SQZdwc6GTz2qAd
   9KYlK0rywJinu6WiYjmo5w9NMBaEUTk8/2u2Tk4vA9hpvFNhUOBjErG6Q
   w==;
X-CSE-ConnectionGUID: 4XUNdzjZRfu5hyZB36t76g==
X-CSE-MsgGUID: 3JXbbV+7Ri+Xv7/5H+L1uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="44237386"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="44237386"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 04:12:56 -0800
X-CSE-ConnectionGUID: dpUKpdABRpWfcH0rCul+Tw==
X-CSE-MsgGUID: KeM/0QmWQsC6bAz4Uur0xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117180836"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 26 Feb 2025 04:12:54 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnGHT-000BeZ-2P;
	Wed, 26 Feb 2025 12:12:51 +0000
Date: Wed, 26 Feb 2025 20:12:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6012/6583] fs/namespace.c:4442
 __do_sys_move_mount() error: uninitialized symbol 'uflags'.
Message-ID: <202502262044.uRrhoaDw-lkp@intel.com>
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
TO: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8433c776e1eb1371f5cd40b5fd3a61f9c7b7f3ad
commit: b1e9423d65e330346f9e80e819872ab66f1e35b6 [6012/6583] fs: support getname_maybe_null() in move_mount()
:::::: branch date: 7 hours ago
:::::: commit date: 28 hours ago
config: x86_64-randconfig-161-20250226 (https://download.01.org/0day-ci/archive/20250226/202502262044.uRrhoaDw-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502262044.uRrhoaDw-lkp@intel.com/

New smatch warnings:
fs/namespace.c:4442 __do_sys_move_mount() error: uninitialized symbol 'uflags'.
fs/namespace.c:4442 __do_sys_move_mount() error: uninitialized symbol 'uflags'.

Old smatch warnings:
fs/namespace.c:4727 mount_setattr_prepare() error: uninitialized symbol 'err'.

vim +/uflags +4442 fs/namespace.c

b1e9423d65e330 Christian Brauner 2025-02-21  4403  
93766fbd2696c2 David Howells     2018-11-01  4404  /*
93766fbd2696c2 David Howells     2018-11-01  4405   * Move a mount from one place to another.  In combination with
93766fbd2696c2 David Howells     2018-11-01  4406   * fsopen()/fsmount() this is used to install a new mount and in combination
93766fbd2696c2 David Howells     2018-11-01  4407   * with open_tree(OPEN_TREE_CLONE [| AT_RECURSIVE]) it can be used to copy
93766fbd2696c2 David Howells     2018-11-01  4408   * a mount subtree.
2db154b3ea8e14 David Howells     2018-11-05  4409   *
2db154b3ea8e14 David Howells     2018-11-05  4410   * Note the flags value is a combination of MOVE_MOUNT_* flags.
2db154b3ea8e14 David Howells     2018-11-05  4411   */
2db154b3ea8e14 David Howells     2018-11-05  4412  SYSCALL_DEFINE5(move_mount,
2658ce095df583 Ben Dooks         2019-10-15  4413  		int, from_dfd, const char __user *, from_pathname,
2658ce095df583 Ben Dooks         2019-10-15  4414  		int, to_dfd, const char __user *, to_pathname,
2db154b3ea8e14 David Howells     2018-11-05  4415  		unsigned int, flags)
2db154b3ea8e14 David Howells     2018-11-05  4416  {
b1e9423d65e330 Christian Brauner 2025-02-21  4417  	struct path to_path __free(path_put) = {};
b1e9423d65e330 Christian Brauner 2025-02-21  4418  	struct path from_path __free(path_put) = {};
b1e9423d65e330 Christian Brauner 2025-02-21  4419  	struct filename *to_name __free(putname) = NULL;
b1e9423d65e330 Christian Brauner 2025-02-21  4420  	struct filename *from_name __free(putname) = NULL;
b1e9423d65e330 Christian Brauner 2025-02-21  4421  	unsigned int lflags, uflags;
b1e9423d65e330 Christian Brauner 2025-02-21  4422  	enum mnt_tree_flags_t mflags = 0;
2db154b3ea8e14 David Howells     2018-11-05  4423  	int ret = 0;
2db154b3ea8e14 David Howells     2018-11-05  4424  
2db154b3ea8e14 David Howells     2018-11-05  4425  	if (!may_mount())
2db154b3ea8e14 David Howells     2018-11-05  4426  		return -EPERM;
2db154b3ea8e14 David Howells     2018-11-05  4427  
2db154b3ea8e14 David Howells     2018-11-05  4428  	if (flags & ~MOVE_MOUNT__MASK)
2db154b3ea8e14 David Howells     2018-11-05  4429  		return -EINVAL;
2db154b3ea8e14 David Howells     2018-11-05  4430  
6ac392815628f3 Christian Brauner 2023-05-03  4431  	if ((flags & (MOVE_MOUNT_BENEATH | MOVE_MOUNT_SET_GROUP)) ==
6ac392815628f3 Christian Brauner 2023-05-03  4432  	    (MOVE_MOUNT_BENEATH | MOVE_MOUNT_SET_GROUP))
6ac392815628f3 Christian Brauner 2023-05-03  4433  		return -EINVAL;
6ac392815628f3 Christian Brauner 2023-05-03  4434  
b1e9423d65e330 Christian Brauner 2025-02-21  4435  	if (flags & MOVE_MOUNT_SET_GROUP)	mflags |= MNT_TREE_PROPAGATION;
b1e9423d65e330 Christian Brauner 2025-02-21  4436  	if (flags & MOVE_MOUNT_BENEATH)		mflags |= MNT_TREE_BENEATH;
b1e9423d65e330 Christian Brauner 2025-02-21  4437  
2db154b3ea8e14 David Howells     2018-11-05  4438  	lflags = 0;
2db154b3ea8e14 David Howells     2018-11-05  4439  	if (flags & MOVE_MOUNT_F_SYMLINKS)	lflags |= LOOKUP_FOLLOW;
2db154b3ea8e14 David Howells     2018-11-05  4440  	if (flags & MOVE_MOUNT_F_AUTOMOUNTS)	lflags |= LOOKUP_AUTOMOUNT;
b1e9423d65e330 Christian Brauner 2025-02-21  4441  	if (flags & MOVE_MOUNT_F_EMPTY_PATH)	uflags = AT_EMPTY_PATH;
b1e9423d65e330 Christian Brauner 2025-02-21 @4442  	from_name = getname_maybe_null(from_pathname, uflags);
b1e9423d65e330 Christian Brauner 2025-02-21  4443  	if (IS_ERR(from_name))
b1e9423d65e330 Christian Brauner 2025-02-21  4444  		return PTR_ERR(from_name);
2db154b3ea8e14 David Howells     2018-11-05  4445  
2db154b3ea8e14 David Howells     2018-11-05  4446  	lflags = 0;
2db154b3ea8e14 David Howells     2018-11-05  4447  	if (flags & MOVE_MOUNT_T_SYMLINKS)	lflags |= LOOKUP_FOLLOW;
2db154b3ea8e14 David Howells     2018-11-05  4448  	if (flags & MOVE_MOUNT_T_AUTOMOUNTS)	lflags |= LOOKUP_AUTOMOUNT;
b1e9423d65e330 Christian Brauner 2025-02-21  4449  	if (flags & MOVE_MOUNT_T_EMPTY_PATH)	uflags = AT_EMPTY_PATH;
b1e9423d65e330 Christian Brauner 2025-02-21  4450  	to_name = getname_maybe_null(to_pathname, uflags);
b1e9423d65e330 Christian Brauner 2025-02-21  4451  	if (IS_ERR(to_name))
b1e9423d65e330 Christian Brauner 2025-02-21  4452  		return PTR_ERR(to_name);
b1e9423d65e330 Christian Brauner 2025-02-21  4453  
b1e9423d65e330 Christian Brauner 2025-02-21  4454  	if (!to_name && to_dfd >= 0) {
b1e9423d65e330 Christian Brauner 2025-02-21  4455  		CLASS(fd_raw, f_to)(to_dfd);
b1e9423d65e330 Christian Brauner 2025-02-21  4456  		if (fd_empty(f_to))
b1e9423d65e330 Christian Brauner 2025-02-21  4457  			return -EBADF;
2db154b3ea8e14 David Howells     2018-11-05  4458  
b1e9423d65e330 Christian Brauner 2025-02-21  4459  		to_path = fd_file(f_to)->f_path;
b1e9423d65e330 Christian Brauner 2025-02-21  4460  		path_get(&to_path);
b1e9423d65e330 Christian Brauner 2025-02-21  4461  	} else {
b1e9423d65e330 Christian Brauner 2025-02-21  4462  		ret = filename_lookup(to_dfd, to_name, lflags, &to_path, NULL);
b1e9423d65e330 Christian Brauner 2025-02-21  4463  		if (ret)
b1e9423d65e330 Christian Brauner 2025-02-21  4464  			return ret;
b1e9423d65e330 Christian Brauner 2025-02-21  4465  	}
2db154b3ea8e14 David Howells     2018-11-05  4466  
b1e9423d65e330 Christian Brauner 2025-02-21  4467  	if (!from_name && from_dfd >= 0) {
b1e9423d65e330 Christian Brauner 2025-02-21  4468  		CLASS(fd_raw, f_from)(from_dfd);
b1e9423d65e330 Christian Brauner 2025-02-21  4469  		if (fd_empty(f_from))
b1e9423d65e330 Christian Brauner 2025-02-21  4470  			return -EBADF;
2db154b3ea8e14 David Howells     2018-11-05  4471  
b1e9423d65e330 Christian Brauner 2025-02-21  4472  		return vfs_move_mount(&fd_file(f_from)->f_path, &to_path, mflags);
b1e9423d65e330 Christian Brauner 2025-02-21  4473  	}
2db154b3ea8e14 David Howells     2018-11-05  4474  
b1e9423d65e330 Christian Brauner 2025-02-21  4475  	ret = filename_lookup(from_dfd, from_name, lflags, &from_path, NULL);
b1e9423d65e330 Christian Brauner 2025-02-21  4476  	if (ret)
2db154b3ea8e14 David Howells     2018-11-05  4477  		return ret;
b1e9423d65e330 Christian Brauner 2025-02-21  4478  
b1e9423d65e330 Christian Brauner 2025-02-21  4479  	return vfs_move_mount(&from_path, &to_path, mflags);
2db154b3ea8e14 David Howells     2018-11-05  4480  }
2db154b3ea8e14 David Howells     2018-11-05  4481  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
