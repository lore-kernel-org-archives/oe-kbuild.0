Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3F778F35
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Feb 2025 10:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739700655; cv=none; b=HU/XD8uC3bj6wuzFaQ28blC75WhY3cS8phpT8fmOGSAJqp+2tD4MgepjpUTBK0su/PPlHuxprY3SjKDkjXrjEit0a0gc/YNJlVtqZPZypD/EzW+OA/NpRMMbYzDNAc51+kdQCqWhia93akqILRTYOPWnwDVNYWTjdCV0Jk0+k5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739700655; c=relaxed/simple;
	bh=TA1owmdNMrKLYATIBt+V8/8CTJ50v7wUi8XYhD3X9rI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QNdgmgKxNhNdU/zKLN//n3sVxvxS9f96fkxTr6mPpvp9D0ciGNbjtHzGb5sTwRNQKB0DcYrU2MKb276P7zo2SUevncKXsuu7wEIxUZ4XbLzzubqBIp9VStiBVsZWlN15hIRUO3G5CmsO8RuinDShAAKirgQnAOdAzCzME8shyxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DHcVoNBp; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DHcVoNBp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739700654; x=1771236654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TA1owmdNMrKLYATIBt+V8/8CTJ50v7wUi8XYhD3X9rI=;
  b=DHcVoNBpAvMIcpbEFwDC+3zf81lrTDqX0zDXn5YQkFBmdBYc8RsCxmcU
   xY4ryGKxbeBjxsQ6I9HFFxXw+La5dwJkCQFZo/+3+WyhNttzCRj6OTyHa
   Coiw9WSwlJqtQtkmbWt2DZIkPHt/zdDFicph7dXDbQxmYtb0uwTsfneeR
   Ann10AcW1pv/XoOFpvWMQsqARcx2nu09bYG7Q6dzJ02pXhMijRfHq9oiH
   lJo4c5VThR+aUVYN1VPDEVkmFQ7osbl6zFk5tXrl6cdDhTRdv8th+tHjo
   J81JZKkPMn7C+Iiwx8MMAmzhxvpew2rcf2tNJCg3fGTt13j5wOyi9Nqs9
   A==;
X-CSE-ConnectionGUID: 9aM5eduXSXqskmCOvlMRZw==
X-CSE-MsgGUID: N78Pv/hwSQ2MRV1ZO9jiiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="65755576"
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; 
   d="scan'208";a="65755576"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 02:10:53 -0800
X-CSE-ConnectionGUID: Dv6NzcBdS8am7Xu+DAtccQ==
X-CSE-MsgGUID: AWHpJYVyQzGisAbmaLhT3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114341088"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Feb 2025 02:10:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjbbt-001Bp5-0d;
	Sun, 16 Feb 2025 10:10:49 +0000
Date: Sun, 16 Feb 2025 18:09:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12-desktop 1/1] fs/fuse/file.c:387
 fuse_file_release() error: we previously assumed 'ra' could be null (see
 line 373)
Message-ID: <202502161830.f3ssKogv-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   0f556311bc475a36a147f111a9c5f0769a655730
commit: 8be90ef631b70dedc3c43b247aeae296a633dcb2 [1/1] ANDROID: fuse-bpf: fuse-bpf v1.2
:::::: branch date: 31 hours ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20250216 (https://download.01.org/0day-ci/archive/20250216/202502161830.f3ssKogv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502161830.f3ssKogv-lkp@intel.com/

smatch warnings:
fs/fuse/file.c:387 fuse_file_release() error: we previously assumed 'ra' could be null (see line 373)

vim +/ra +387 fs/fuse/file.c

fd72faac95d7e4 Miklos Szeredi   2005-11-07  363  
b9d54c6f29d9dc Miklos Szeredi   2021-04-07  364  void fuse_file_release(struct inode *inode, struct fuse_file *ff,
b9d54c6f29d9dc Miklos Szeredi   2021-04-07  365  		       unsigned int open_flags, fl_owner_t id, bool isdir)
fd72faac95d7e4 Miklos Szeredi   2005-11-07  366  {
b9d54c6f29d9dc Miklos Szeredi   2021-04-07  367  	struct fuse_inode *fi = get_fuse_inode(inode);
fc8ff397b2a915 Amir Goldstein   2024-02-09  368  	struct fuse_release_args *ra = &ff->args->release_args;
2e64ff154ce6ce Chad Austin      2018-12-10  369  	int opcode = isdir ? FUSE_RELEASEDIR : FUSE_RELEASE;
6b2db28a7a2da1 Tejun Heo        2009-04-14  370  
e26ee4efbc7961 Amir Goldstein   2024-02-01  371  	fuse_prepare_release(fi, ff, open_flags, opcode, false);
51eb01e73599ef Miklos Szeredi   2006-06-25  372  
e26ee4efbc7961 Amir Goldstein   2024-02-01 @373  	if (ra && ff->flock) {
4cb548666e4c13 Miklos Szeredi   2019-09-10  374  		ra->inarg.release_flags |= FUSE_RELEASE_FLOCK_UNLOCK;
b9d54c6f29d9dc Miklos Szeredi   2021-04-07  375  		ra->inarg.lock_owner = fuse_lock_owner_id(ff->fm->fc, id);
37fb3a30b46237 Miklos Szeredi   2011-08-08  376  	}
93a8c3cd9e9834 Miklos Szeredi   2007-10-18  377  
c756e0a4d79202 Miklos Szeredi   2007-10-16  378  	/*
6b2db28a7a2da1 Tejun Heo        2009-04-14  379  	 * Normally this will send the RELEASE request, however if
6b2db28a7a2da1 Tejun Heo        2009-04-14  380  	 * some asynchronous READ or WRITE requests are outstanding,
6b2db28a7a2da1 Tejun Heo        2009-04-14  381  	 * the sending will be delayed.
5a18ec176c934c Miklos Szeredi   2011-02-25  382  	 *
5a18ec176c934c Miklos Szeredi   2011-02-25  383  	 * Make the release synchronous if this is a fuseblk mount,
5a18ec176c934c Miklos Szeredi   2011-02-25  384  	 * synchronous RELEASE is allowed (and desirable) in this case
5a18ec176c934c Miklos Szeredi   2011-02-25  385  	 * because the server can be trusted not to screw up.
c756e0a4d79202 Miklos Szeredi   2007-10-16  386  	 */
8be90ef631b70d Daniel Rosenberg 2021-12-02 @387  	fuse_file_put(ra->inode, ff, ff->fm->fc->destroy);
b6aeadeda22a9a Miklos Szeredi   2005-09-09  388  }
b6aeadeda22a9a Miklos Szeredi   2005-09-09  389  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
