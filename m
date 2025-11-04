Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6010530ACE4
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Nov 2025 07:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762241974; cv=none; b=cP5fAqo5kyvwHh9NvnOgcxQhtnmiLUKzXzyMmFnufnZ+EAB9fEIoMHybn9eFJkKCh6Z9WcOHSQV5u8FsxwCpe5NSRqUeTNC9tb3b673vslfYVBC2XTo2dWWhd0TgBjvsZrU5sxjb0gpeJN3kAhiNAxkcbqo5L2nmVTlfq8YzhoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762241974; c=relaxed/simple;
	bh=FzqxWsUq4ixAoBlVlGCv4hvSwTPVspRT6bO9JfSNMcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CHzudewHjnUPatAxGl2shykUx3M16Z0PrWRyNqi70GOo9gv54jIsDgKXcNPTDH4v9V+jdMug1JiyDmQPTeDL4NEoRhwMiLrS7fd+rWIc45WTpH4zwW44AJy2oaonZGUUpO37uKBvpJkI3KpLg6wMOZ88Nx3WAgQidvGpReeQXe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TSaBQE7q; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TSaBQE7q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762241972; x=1793777972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FzqxWsUq4ixAoBlVlGCv4hvSwTPVspRT6bO9JfSNMcc=;
  b=TSaBQE7qddk0XAUjbVOSLxAnfyu32Fd3ifNG8SqOtFGBXZDf/R1Nt9gY
   to6O3POkjLR0K/UpgIdPSMwBdQlIJ6pHIi+bOZvK+4Ev88czh0fB6oESX
   2AbIoQXcuTphk7HbGQxpJCNlG0Ib4eWHRPly5zeKoZrson4RBXm2ecmys
   h3ziCoVReFwSDtqj9+gqus+hO3XU/YOhYOgg2xCeCLEDPYcmWd67HPyZJ
   eIdRp9zqvKB+4vyGAqbn8I1tPI+VDOYn/FvMY8EKPFmAuH0IVAUYlGJbW
   I4etZQFCg4X1pdc2nCEq3rsLGqoNCnqeU6TahnED4VnBHX83E8C0EKr5E
   g==;
X-CSE-ConnectionGUID: aC57T5HvRJK4UMoBLebrqw==
X-CSE-MsgGUID: VOC1rw/URrCkaabFoCuW3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="81958294"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="81958294"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 23:39:32 -0800
X-CSE-ConnectionGUID: UuKwAYLaS8KSkK29Z844/A==
X-CSE-MsgGUID: b0/JHEuET7+pbMn3FwV/Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="217897670"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 03 Nov 2025 23:39:31 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGBdC-000R3W-2n;
	Tue, 04 Nov 2025 07:39:12 +0000
Date: Tue, 4 Nov 2025 15:36:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-github:kernel-6.19.cred 14/39] fs/backing-file.c:297
 backing_file_splice_read() error: uninitialized symbol 'ret'.
Message-ID: <202511041555.7Uif8uYv-lkp@intel.com>
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
CC: Amir Goldstein <amir73il@gmail.com>

tree:   https://github.com/brauner/linux.git kernel-6.19.cred
head:   59e578cf86c391d6595e005247ebefd4f371242c
commit: 2f4578e9ab5536bffe1b1287b6346b15f1e08e2c [14/39] backing-file: use credential guards for splice read
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: sparc-randconfig-r073-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041555.7Uif8uYv-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511041555.7Uif8uYv-lkp@intel.com/

New smatch warnings:
fs/backing-file.c:297 backing_file_splice_read() error: uninitialized symbol 'ret'.

Old smatch warnings:
fs/backing-file.c:209 backing_file_read_iter() error: uninitialized symbol 'ret'.

vim +/ret +297 fs/backing-file.c

a6293b3e285cd0 Amir Goldstein    2023-11-22  280  
48b50624aec454 Miklos Szeredi    2024-10-21  281  ssize_t backing_file_splice_read(struct file *in, struct kiocb *iocb,
9b7e9e2f5d5c3d Amir Goldstein    2023-10-13  282  				 struct pipe_inode_info *pipe, size_t len,
9b7e9e2f5d5c3d Amir Goldstein    2023-10-13  283  				 unsigned int flags,
9b7e9e2f5d5c3d Amir Goldstein    2023-10-13  284  				 struct backing_file_ctx *ctx)
9b7e9e2f5d5c3d Amir Goldstein    2023-10-13  285  {
9b7e9e2f5d5c3d Amir Goldstein    2023-10-13  286  	ssize_t ret;
9b7e9e2f5d5c3d Amir Goldstein    2023-10-13  287  
9b7e9e2f5d5c3d Amir Goldstein    2023-10-13  288  	if (WARN_ON_ONCE(!(in->f_mode & FMODE_BACKING)))
9b7e9e2f5d5c3d Amir Goldstein    2023-10-13  289  		return -EIO;
9b7e9e2f5d5c3d Amir Goldstein    2023-10-13  290  
2f4578e9ab5536 Christian Brauner 2025-11-03  291  	scoped_with_creds(ctx->cred)
48b50624aec454 Miklos Szeredi    2024-10-21  292  		ret = vfs_splice_read(in, &iocb->ki_pos, pipe, len, flags);
9b7e9e2f5d5c3d Amir Goldstein    2023-10-13  293  
9b7e9e2f5d5c3d Amir Goldstein    2023-10-13  294  	if (ctx->accessed)
48b50624aec454 Miklos Szeredi    2024-10-21  295  		ctx->accessed(iocb->ki_filp);
9b7e9e2f5d5c3d Amir Goldstein    2023-10-13  296  
9b7e9e2f5d5c3d Amir Goldstein    2023-10-13 @297  	return ret;
9b7e9e2f5d5c3d Amir Goldstein    2023-10-13  298  }
9b7e9e2f5d5c3d Amir Goldstein    2023-10-13  299  EXPORT_SYMBOL_GPL(backing_file_splice_read);
9b7e9e2f5d5c3d Amir Goldstein    2023-10-13  300  

:::::: The code at line 297 was first introduced by commit
:::::: 9b7e9e2f5d5c3d079ec46bc71b114012e362ea6e fs: factor out backing_file_splice_{read,write}() helpers

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Amir Goldstein <amir73il@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
