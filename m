Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F3B382
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Dec 2024 02:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733019823; cv=none; b=fmvcr0Iyolig9RkDBABriCzzYqWMaVThVlKiXO0bD3Hk3+MxtQe2qIiObC19NADcqEMy8pSwQOqkSKbJiUIEEhsfuS74KdQS4Ufg1YB8gbmakyuIdYs68XtGpLv8rOxeGEj8tKtxyioBYIIRAW6KRhWpDIjgRb8h17sCw5ABg14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733019823; c=relaxed/simple;
	bh=qDOUxZ6xh9qpSZGLZUtijPOA20tvVWje9qqg36Ngl3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sKk7h6kfzp5Bj6EboVba3hxsqhSByhMAP3LStP6N/xCn6IXGBRFhO+dkRUl4W1mOr8xk8X6rShu8r6XVffckwYjZkTuiAGQJTWgWZ7KkPgrZLgXt8rd6HJsskeJxJlN5AuEBeBaLdwr7BC+f6AiFqPFi+Dd4lf1ZYtXHx7l78EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bTYjqgI/; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bTYjqgI/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733019821; x=1764555821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qDOUxZ6xh9qpSZGLZUtijPOA20tvVWje9qqg36Ngl3Q=;
  b=bTYjqgI/OoJUmjTStvPheMAR5n0kjmqDwqUCSnr1340tnvgb2VddGMQH
   FJX0IwHxobo9voIRVm9SnIhxgVlTEHTJ7G+hK/G29VZ+QIK5BnvYbgMvq
   bsHuNxiov5SGeD4tI0o8HAGQLKFvDljuiRkkwj3a3D3Zx59Nz0iyt4qJk
   vU+70tEGFeu6l4w7oWIkHJRHKw8QV2j5grch0ZJZLvMTuxKvjIWhm39pE
   nA8k+u/4NwvGS7jCnRokzEwLcKWTKG0VQ75F5o8jw8a3xuTZ8xM054Krj
   Wb1+tvwSDv3PkUDURtoOGuwMqYlAwAQ7mFYsL9GkAB4+9fGavayUDskLv
   Q==;
X-CSE-ConnectionGUID: a+Psn7IfT/63FMSFQPESCA==
X-CSE-MsgGUID: pYhoBXzPQqOPyOeBEbDi4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="33130766"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="33130766"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 18:23:40 -0800
X-CSE-ConnectionGUID: 4/PX1zMbTMCZEYwUjnC11w==
X-CSE-MsgGUID: lRS6ZbXeTUyt9PcT63CCNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="92656423"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 30 Nov 2024 18:23:39 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHZcD-00019F-2H;
	Sun, 01 Dec 2024 02:23:18 +0000
Date: Sun, 1 Dec 2024 10:22:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RFC] ext4: don't treat fhandle lookup of ea_inode as FS
 corruption
Message-ID: <202412011019.8YqtRbIu-lkp@intel.com>
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
In-Reply-To: <20241129-ext4-ignore-ea-fhandle-v1-1-e532c0d1cee0@google.com>
References: <20241129-ext4-ignore-ea-fhandle-v1-1-e532c0d1cee0@google.com>
TO: Jann Horn <jannh@google.com>

Hi Jann,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on b86545e02e8c22fb89218f29d381fa8e8b91d815]

url:    https://github.com/intel-lab-lkp/linux/commits/Jann-Horn/ext4-don-t-treat-fhandle-lookup-of-ea_inode-as-FS-corruption/20241130-042341
base:   b86545e02e8c22fb89218f29d381fa8e8b91d815
patch link:    https://lore.kernel.org/r/20241129-ext4-ignore-ea-fhandle-v1-1-e532c0d1cee0%40google.com
patch subject: [PATCH RFC] ext4: don't treat fhandle lookup of ea_inode as FS corruption
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: x86_64-randconfig-161-20241201 (https://download.01.org/0day-ci/archive/20241201/202412011019.8YqtRbIu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412011019.8YqtRbIu-lkp@intel.com/

New smatch warnings:
fs/ext4/inode.c:4731 check_igot_inode() warn: missing unwind goto?

Old smatch warnings:
fs/ext4/inode.c:2467 mpage_prepare_extent_to_map() warn: missing error code 'err'
fs/ext4/inode.c:6263 ext4_page_mkwrite() error: uninitialized symbol 'get_block'.

vim +4731 fs/ext4/inode.c

e254d1afac83fd Eryu Guan     2018-05-10  4707  
9ea29c229f07c6 Jann Horn     2024-11-29  4708  static int check_igot_inode(struct inode *inode, ext4_iget_flags flags,
9ea29c229f07c6 Jann Horn     2024-11-29  4709  			    const char *function, unsigned int line)
b3e6bcb94590de Theodore Ts'o 2023-05-23  4710  {
9ea29c229f07c6 Jann Horn     2024-11-29  4711  	const char *err_str;
9ea29c229f07c6 Jann Horn     2024-11-29  4712  
b3e6bcb94590de Theodore Ts'o 2023-05-23  4713  	if (flags & EXT4_IGET_EA_INODE) {
9ea29c229f07c6 Jann Horn     2024-11-29  4714  		if (!(EXT4_I(inode)->i_flags & EXT4_EA_INODE_FL)) {
9ea29c229f07c6 Jann Horn     2024-11-29  4715  			err_str = "missing EA_INODE flag";
9ea29c229f07c6 Jann Horn     2024-11-29  4716  			goto error;
9ea29c229f07c6 Jann Horn     2024-11-29  4717  		}
2bc7e7c1a3bc9b Theodore Ts'o 2023-05-23  4718  		if (ext4_test_inode_state(inode, EXT4_STATE_XATTR) ||
9ea29c229f07c6 Jann Horn     2024-11-29  4719  		    EXT4_I(inode)->i_file_acl) {
9ea29c229f07c6 Jann Horn     2024-11-29  4720  			err_str = "ea_inode with extended attributes";
9ea29c229f07c6 Jann Horn     2024-11-29  4721  			goto error;
9ea29c229f07c6 Jann Horn     2024-11-29  4722  		}
b3e6bcb94590de Theodore Ts'o 2023-05-23  4723  	} else {
9ea29c229f07c6 Jann Horn     2024-11-29  4724  		if ((EXT4_I(inode)->i_flags & EXT4_EA_INODE_FL)) {
9ea29c229f07c6 Jann Horn     2024-11-29  4725  			/*
9ea29c229f07c6 Jann Horn     2024-11-29  4726  			 * open_by_handle_at() could provide an old inode number
9ea29c229f07c6 Jann Horn     2024-11-29  4727  			 * that has since been reused for an ea_inode; this does
9ea29c229f07c6 Jann Horn     2024-11-29  4728  			 * not indicate filesystem corruption
9ea29c229f07c6 Jann Horn     2024-11-29  4729  			 */
9ea29c229f07c6 Jann Horn     2024-11-29  4730  			if (flags & EXT4_IGET_HANDLE)
9ea29c229f07c6 Jann Horn     2024-11-29 @4731  				return -ESTALE;
9ea29c229f07c6 Jann Horn     2024-11-29  4732  			err_str = "unexpected EA_INODE flag";
9ea29c229f07c6 Jann Horn     2024-11-29  4733  			goto error;
b3e6bcb94590de Theodore Ts'o 2023-05-23  4734  		}
9ea29c229f07c6 Jann Horn     2024-11-29  4735  	}
9ea29c229f07c6 Jann Horn     2024-11-29  4736  	if (is_bad_inode(inode) && !(flags & EXT4_IGET_BAD)) {
9ea29c229f07c6 Jann Horn     2024-11-29  4737  		err_str = "unexpected bad inode w/o EXT4_IGET_BAD";
9ea29c229f07c6 Jann Horn     2024-11-29  4738  		goto error;
9ea29c229f07c6 Jann Horn     2024-11-29  4739  	}
9ea29c229f07c6 Jann Horn     2024-11-29  4740  	return 0;
9ea29c229f07c6 Jann Horn     2024-11-29  4741  
9ea29c229f07c6 Jann Horn     2024-11-29  4742  error:
9ea29c229f07c6 Jann Horn     2024-11-29  4743  	ext4_error_inode(inode, function, line, 0, err_str);
9ea29c229f07c6 Jann Horn     2024-11-29  4744  	return -EFSCORRUPTED;
b3e6bcb94590de Theodore Ts'o 2023-05-23  4745  }
b3e6bcb94590de Theodore Ts'o 2023-05-23  4746  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
