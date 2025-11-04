Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEDA72614
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Nov 2025 05:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762234875; cv=none; b=GJtoQr9KeujK9fOX4SPJrkrbZBRZEuhYiRhn0cdBfog2+nE7iahtPiiPiXQaCmjsYbHmWJY4H1e8A3dK+1LvxP8MHFgwvvalaGFmG8V+kIabCrgZ9dYIbIwKmfuv+FM4gfbkRGmmmsK9JG5y7D+LGUqxOFbJpdISO4gIQZNDcHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762234875; c=relaxed/simple;
	bh=ZWvKAzbBTaplN4WoHoHwCqf47X0zSetZEePC52RbrZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l3DJbOdWPXyZ6gAavZq1RNwa5mXbiFjLOZxwpmOQQVnQuzQL75OHGQaI1r9rsb7/D38qqOccYeLuW/s0dQjVNERQf7fFtnoZ+quX5dfzxsfjIzIutFs7muNloeeL5GtMP237XFFIY/AztrABYfStYGHqRxybm36sY3iXCaekg0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CuK9bA0l; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CuK9bA0l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762234873; x=1793770873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZWvKAzbBTaplN4WoHoHwCqf47X0zSetZEePC52RbrZM=;
  b=CuK9bA0lnv7XrK0FbEKvuLackVPg4HfNBf6NkWWZ7h6yueQmXVy+Um9K
   fL9IqNMNyDWq8kXyEqU9WdE0C6xoM/o9atlwjAFYUWffk5Wp4DexVVIXn
   Pyu4lLeTHP0q56yo3grD3NK9sKq54tvefQgnQ5CoQ5AoEgbMSq0fU0Haj
   ezHHFo5hS02SxRLP93FHj4ijD65U7Q82qcxHFQQ3d19JQY7eOJxj+hqDC
   R9n1fjZu4Edo8zdPcQ1me2Y4z6/olhIlD+OXNQz7XgUe+uWqBX8QTniXL
   ePI6AP1MXdrMR7J9z9ozmQQzXoN+Y79y5U1mCrPOa6wr38VSZnk56qkMd
   g==;
X-CSE-ConnectionGUID: 3SiKwRpVQwajDwIpcdw3Pg==
X-CSE-MsgGUID: AG0znMWdT16o7zgNGrC4KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="86947800"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="86947800"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 21:41:12 -0800
X-CSE-ConnectionGUID: LXlg2oo1QYiXLWieFgTSOg==
X-CSE-MsgGUID: C5qUU9PpT66oAbijP84Y+A==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 03 Nov 2025 21:41:11 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vG9n3-000Qxa-15;
	Tue, 04 Nov 2025 05:41:09 +0000
Date: Tue, 4 Nov 2025 13:40:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-github:kernel-6.19.cred 12/39] fs/backing-file.c:209
 backing_file_read_iter() error: uninitialized symbol 'ret'.
Message-ID: <202511041355.mEBz2euY-lkp@intel.com>
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
commit: b9455f57e32048146ad5b98fb477b96eba6e8ffd [12/39] backing-file: use credential guards for reads
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: sparc-randconfig-r073-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041355.mEBz2euY-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511041355.mEBz2euY-lkp@intel.com/

smatch warnings:
fs/backing-file.c:209 backing_file_read_iter() error: uninitialized symbol 'ret'.

vim +/ret +209 fs/backing-file.c

b9455f57e320481 Christian Brauner 2025-11-03  186  
b9455f57e320481 Christian Brauner 2025-11-03  187  ssize_t backing_file_read_iter(struct file *file, struct iov_iter *iter,
b9455f57e320481 Christian Brauner 2025-11-03  188  			       struct kiocb *iocb, int flags,
b9455f57e320481 Christian Brauner 2025-11-03  189  			       struct backing_file_ctx *ctx)
b9455f57e320481 Christian Brauner 2025-11-03  190  {
b9455f57e320481 Christian Brauner 2025-11-03  191  	ssize_t ret;
b9455f57e320481 Christian Brauner 2025-11-03  192  
b9455f57e320481 Christian Brauner 2025-11-03  193  	if (WARN_ON_ONCE(!(file->f_mode & FMODE_BACKING)))
b9455f57e320481 Christian Brauner 2025-11-03  194  		return -EIO;
b9455f57e320481 Christian Brauner 2025-11-03  195  
b9455f57e320481 Christian Brauner 2025-11-03  196  	if (!iov_iter_count(iter))
b9455f57e320481 Christian Brauner 2025-11-03  197  		return 0;
b9455f57e320481 Christian Brauner 2025-11-03  198  
b9455f57e320481 Christian Brauner 2025-11-03  199  	if (iocb->ki_flags & IOCB_DIRECT &&
b9455f57e320481 Christian Brauner 2025-11-03  200  	    !(file->f_mode & FMODE_CAN_ODIRECT))
b9455f57e320481 Christian Brauner 2025-11-03  201  		return -EINVAL;
b9455f57e320481 Christian Brauner 2025-11-03  202  
b9455f57e320481 Christian Brauner 2025-11-03  203  	scoped_with_creds(ctx->cred)
b9455f57e320481 Christian Brauner 2025-11-03  204  		do_backing_file_read_iter(file, iter, iocb, flags);
a6293b3e285cd0d Amir Goldstein    2023-11-22  205  
a6293b3e285cd0d Amir Goldstein    2023-11-22  206  	if (ctx->accessed)
48b50624aec454c Miklos Szeredi    2024-10-21  207  		ctx->accessed(iocb->ki_filp);
a6293b3e285cd0d Amir Goldstein    2023-11-22  208  
a6293b3e285cd0d Amir Goldstein    2023-11-22 @209  	return ret;
a6293b3e285cd0d Amir Goldstein    2023-11-22  210  }
a6293b3e285cd0d Amir Goldstein    2023-11-22  211  EXPORT_SYMBOL_GPL(backing_file_read_iter);
a6293b3e285cd0d Amir Goldstein    2023-11-22  212  

:::::: The code at line 209 was first introduced by commit
:::::: a6293b3e285cd0d7692141d7981a5f144f0e2f0b fs: factor out backing_file_{read,write}_iter() helpers

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Amir Goldstein <amir73il@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
