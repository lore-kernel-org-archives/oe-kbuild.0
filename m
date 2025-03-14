Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288181FFC46
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Mar 2025 13:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741958922; cv=none; b=gi5BFl6UO36Qxf6+tEQE/eCiFs1OpyNknDlChOKdQRmR5urNG9j24PvFKQySxw5ob7lmftAhtTZ9TEUBRmV11WkShi6OGMb1KI8F43fbCiJ0CKsAnX9FFB+oINP3s4ox8/cpjFt8QLKG3xmboFdtlx9pbWfNj+vx09SmapbPBm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741958922; c=relaxed/simple;
	bh=nZrLwxjxmU/xv7C9dHr/K1QUFI2RbNSPmAqmrytgW7c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FndDGTclwg5Giw127+LosFibiUnFt/hGmGiqrAwQbsIFEHq9RCUnvMeQrIMkaDfIW+WVlsf7i2X8cnPi6lw0jCkRqQ2kXdOeXwjl/h/6lOfJ9TSxh/NPdf9l4ciPdNtam+1PPP9taY6c+qVodyioJCwXQIisp5RZ5xNa1+1HYXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lqt2r1Xk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lqt2r1Xk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741958920; x=1773494920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nZrLwxjxmU/xv7C9dHr/K1QUFI2RbNSPmAqmrytgW7c=;
  b=lqt2r1XkkgM+ZQXtZF1anSWGDujLMVsqfBt8pkE0IEKRxC9dUzAKdyoe
   9ID0TI2DDcWXwpXFTGKAnraDrFY4kZ3GcAS2tvmPhWW03wy/S9EzUDLdh
   Vns0cb01q07XAobhSfge/tagBwOu5Dmih8Y6X9AMP5Fbpaa7dnq3rWcV2
   7jPE7he/pydmAp1OS3hhrRbkd0KW/77i5gY94ZPjMYcPe4Fs/GM+pINOJ
   aK/biuGvX1iJ3qZWUQWmxojzGgiEr8v56UWuqSHmoJcqbSqO2XacJm1cY
   me0Kcth1q5GTksyA8iLkpSTMgYeYKxjrLOV5QSjHYGzHGZJoiWBuN3OWn
   Q==;
X-CSE-ConnectionGUID: StDFojRoT4O9VoWNS34yFg==
X-CSE-MsgGUID: zGrMXFFFQ6qB7JSatx6Bfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="47006358"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="47006358"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 06:28:39 -0700
X-CSE-ConnectionGUID: JSBbhp6eQRCuh24CBrP9ug==
X-CSE-MsgGUID: J8TGpSpvRfqXL3D6FpC4gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="121240105"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 14 Mar 2025 06:28:39 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tt55W-000AUW-2q;
	Fri, 14 Mar 2025 13:28:34 +0000
Date: Fri, 14 Mar 2025 21:28:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5945/11207] fs/ocfs2/namei.c:660 ocfs2_mkdir()
 warn: passing positive error code '(-512),(-122),(-28),(-4),524289' to
 'ERR_PTR'
Message-ID: <202503142107.ULjWIlkO-lkp@intel.com>
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
TO: NeilBrown <neilb@suse.de>
CC: Christian Brauner <brauner@kernel.org>
CC: Jeff Layton <jlayton@kernel.org>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   da920b7df701770e006928053672147075587fb2
commit: 88d5baf69082e5b410296435008329676b687549 [5945/11207] Change inode_operations.mkdir to return struct dentry *
:::::: branch date: 6 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-161-20250314 (https://download.01.org/0day-ci/archive/20250314/202503142107.ULjWIlkO-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503142107.ULjWIlkO-lkp@intel.com/

New smatch warnings:
fs/ocfs2/namei.c:660 ocfs2_mkdir() warn: passing positive error code '(-512),(-122),(-28),(-4),524289' to 'ERR_PTR'

Old smatch warnings:
fs/ocfs2/namei.c:164 ocfs2_lookup() warn: passing positive error code '(-512),(-122),(-28),(-4),524289' to 'ERR_PTR'

vim +660 fs/ocfs2/namei.c

021960cab320ae3 Mark Fasheh       2010-08-13  646  
88d5baf69082e5b NeilBrown         2025-02-27  647  static struct dentry *ocfs2_mkdir(struct mnt_idmap *idmap,
549c7297717c32e Christian Brauner 2021-01-21  648  				  struct inode *dir,
ccd979bdbce9fba Mark Fasheh       2005-12-15  649  				  struct dentry *dentry,
18bb1db3e7607e4 Al Viro           2011-07-26  650  				  umode_t mode)
ccd979bdbce9fba Mark Fasheh       2005-12-15  651  {
ccd979bdbce9fba Mark Fasheh       2005-12-15  652  	int ret;
ccd979bdbce9fba Mark Fasheh       2005-12-15  653  
8990e44a2bceaa6 Tao Ma            2011-02-23  654  	trace_ocfs2_mkdir(dir, dentry, dentry->d_name.len, dentry->d_name.name,
8990e44a2bceaa6 Tao Ma            2011-02-23  655  			  OCFS2_I(dir)->ip_blkno, mode);
5ebb29bee8d5fc1 Christian Brauner 2023-01-13  656  	ret = ocfs2_mknod(&nop_mnt_idmap, dir, dentry, mode | S_IFDIR, 0);
c1e8d35ef5ffb39 Tao Ma            2011-03-07  657  	if (ret)
c1e8d35ef5ffb39 Tao Ma            2011-03-07  658  		mlog_errno(ret);
ccd979bdbce9fba Mark Fasheh       2005-12-15  659  
88d5baf69082e5b NeilBrown         2025-02-27 @660  	return ERR_PTR(ret);
ccd979bdbce9fba Mark Fasheh       2005-12-15  661  }
ccd979bdbce9fba Mark Fasheh       2005-12-15  662  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
