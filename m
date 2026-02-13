Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00AF2C11EF
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Feb 2026 07:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770968844; cv=none; b=aH9HjMNIv6QCmr/yk3PESWPvAmKKGsnpZdG4VXvuThTNr/qTjjzdqlbuQSIFVhkS8JNnWV3W92gYcjsDEj5u4DYkvaNn0G1jfu8CeGY66tMwM7WZn3jdtBjhzKxJ470w1SpHLroAYSwEDtneo+LD5aMK+qUAqNxLneoHwULOcyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770968844; c=relaxed/simple;
	bh=bbFqVAVVmdGQZW9j+RtuQtlPzt8MK3FXNz/7yVRvB1A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Jb5XJCxnyh7Kjq1g9gAwtetSc4B6I/zsTNBRnkV9U//Dr7r6OkoxYDh/l5r8NmaEv3UqBtTITUUkTciSKlVKQ7HvRMfeRmdJ8+xYaT0/cwnw2xpVIo5QD5TISwjZB5iTcZy99pOSfOR8NZ4DILkzYzIozKYXSYzQT0Q+ENh7YBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uk5JJq37; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uk5JJq37"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770968842; x=1802504842;
  h=date:from:to:cc:subject:message-id;
  bh=bbFqVAVVmdGQZW9j+RtuQtlPzt8MK3FXNz/7yVRvB1A=;
  b=Uk5JJq37dcGhTM0i4UL7/QHaczLjxuOWyixio9N+pdQImA4k5N1KEvai
   6CIRLwE4M1Or0VCzaDxwDFJih/hV7NYF48UZApEuD4soIOJBy+rjfU+Xe
   QavtPbCEOG/Dnw9WJc0WMMmPnZG+usOv/VXVnovP8CuvYHW6d8I162Mdp
   3LQlGzvr4I9OMxDRAYklgSCa/b/O6Wl15tSLvmxI/8tEzCMiKBS740CNs
   WfHan0izAv6EIBmLzAh08oOo5/yRz73DkmLFNdXBDOKHCmmVAZeb0nTot
   LCZmduyv81XHl3oMESvWF776iPAGCBoSOHRbe/MnyulMATzI09WmwlSdB
   Q==;
X-CSE-ConnectionGUID: qPLNyUWEQV6UZ6hKmqQ0GA==
X-CSE-MsgGUID: mvDa6cJOQF+kXOf+Io16mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72057584"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="72057584"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 23:47:21 -0800
X-CSE-ConnectionGUID: RV2K8PJ4SDO+FCei6vK6oA==
X-CSE-MsgGUID: gwusEJwUQ3eluQjvAvNjaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="211765810"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Feb 2026 23:47:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqntW-00000000vCU-0cWR;
	Fri, 13 Feb 2026 07:47:18 +0000
Date: Fri, 13 Feb 2026 15:46:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-github:work.xattr.socket 10/15] net/socket.c:472
 sockfs_user_xattr_set() warn: passing zero to 'PTR_ERR'
Message-ID: <202602131546.yZv3WIh2-lkp@intel.com>
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
commit: 24359ce010ccd6ab683e32ec57da13971fa5c4a7 [10/15] xattr,net: support limited amount of extended attributes on sockfs sockets
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: m68k-randconfig-r073-20260213 (https://download.01.org/0day-ci/archive/20260213/202602131546.yZv3WIh2-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.4.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602131546.yZv3WIh2-lkp@intel.com/

smatch warnings:
net/socket.c:472 sockfs_user_xattr_set() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +472 net/socket.c

24359ce010ccd6 Christian Brauner 2026-02-10  459  
24359ce010ccd6 Christian Brauner 2026-02-10  460  static int sockfs_user_xattr_set(const struct xattr_handler *handler,
24359ce010ccd6 Christian Brauner 2026-02-10  461  				 struct mnt_idmap *idmap,
24359ce010ccd6 Christian Brauner 2026-02-10  462  				 struct dentry *dentry, struct inode *inode,
24359ce010ccd6 Christian Brauner 2026-02-10  463  				 const char *suffix, const void *value,
24359ce010ccd6 Christian Brauner 2026-02-10  464  				 size_t size, int flags)
24359ce010ccd6 Christian Brauner 2026-02-10  465  {
24359ce010ccd6 Christian Brauner 2026-02-10  466  	const char *name = xattr_full_name(handler, suffix);
24359ce010ccd6 Christian Brauner 2026-02-10  467  	struct sockfs_inode *si = SOCKFS_I(inode);
24359ce010ccd6 Christian Brauner 2026-02-10  468  	struct simple_xattrs *xattrs;
24359ce010ccd6 Christian Brauner 2026-02-10  469  
24359ce010ccd6 Christian Brauner 2026-02-10  470  	xattrs = simple_xattrs_lazy_alloc(&si->xattrs, value, flags);
24359ce010ccd6 Christian Brauner 2026-02-10  471  	if (IS_ERR_OR_NULL(xattrs))
24359ce010ccd6 Christian Brauner 2026-02-10 @472  		return PTR_ERR(xattrs);
24359ce010ccd6 Christian Brauner 2026-02-10  473  
24359ce010ccd6 Christian Brauner 2026-02-10  474  	return simple_xattr_set_limited(xattrs, &si->xattr_limits,
24359ce010ccd6 Christian Brauner 2026-02-10  475  					name, value, size, flags);
24359ce010ccd6 Christian Brauner 2026-02-10  476  }
24359ce010ccd6 Christian Brauner 2026-02-10  477  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
