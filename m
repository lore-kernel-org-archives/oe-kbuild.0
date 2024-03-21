Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423E012B171
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Mar 2024 21:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711055168; cv=none; b=Jf4rVF21bNVYVg5Z05bx8nK1pCiAnCWoom6jLKYM+X0poo+Y/fQNTkOXhgciOIiYnGohjyfG7sPQCpFBy2Oe1vWrUL7sD0jf6+PAp0NV0P/aGZRZWfczWsGsZGcI2tbjy25P5RutI68W8iNudJXVh9RP/qXlbfvR2m3sE3SgoU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711055168; c=relaxed/simple;
	bh=k7ecwNg6a3mK7IyJ3dMjxdUahBODMiL4Ii0Lp5mFU/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NWeHAoN++0g+QnSGqiq7gKU+liM1RtN56tzGJvW4S8D0zUYbBWHe4TYks0MUkHrQucA96udPv580hT1AlvzUzzofAU4a7aZX2471cOEFa4vdwYOB1IbaCJYEAviPnmWXlCvIoj+CaQUpG5I3HUPAly1wRXafBkE1Wf9PuA5erJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k8f4pAUj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k8f4pAUj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711055164; x=1742591164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k7ecwNg6a3mK7IyJ3dMjxdUahBODMiL4Ii0Lp5mFU/Y=;
  b=k8f4pAUjGl5GoMLimGgCYUKwIH4Na8FfY5Xf7mA895rVHHaIRZUgpbba
   pAsi5NS885X9ASdZLwRYQ3UyP6cRdhzm9bdLpjZ9JMy8/kBVMnidNFE3v
   4fz/nx0C9I2gB8lyJaPcWke3AWzKfIPWzuMWb/TN5JdJkDUSNYFybbxfD
   0vfj1UYlNUwqJu17LEM76FgWuC/OGz/+NYlzFX4nL1mlz9tfLZ8wvhIXz
   hJGZI5qQj87XE+/Ek46eEuTqtB/acKEoT1fcYUI94Y7NsCEufUVgzASyz
   VLK1+KiDKsbGpn4QZpaRQJGvqtl7g8NqMkj2GTOm+4Obf0a6QoM+2Y0K2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5974717"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="5974717"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 14:06:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="52095323"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Mar 2024 14:06:01 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnPbq-000JmH-2R;
	Thu, 21 Mar 2024 21:05:58 +0000
Date: Fri, 22 Mar 2024 05:05:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:twf-hoist 568/627] fs/iomap/buffered-io.c:364
 iomap_fsverity_init_bioset() warn: missing error code 'error'
Message-ID: <202403220530.n4a9KVdg-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git twf-hoist
head:   709c2aed7586c3ac6a9d636355c623611d5c14d1
commit: f0f93bf8ee6030bdb20d406b20b6632cac7aa8bc [568/627] iomap: dynamically allocate fsverity bioset
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: x86_64-randconfig-161-20240321 (https://download.01.org/0day-ci/archive/20240322/202403220530.n4a9KVdg-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403220530.n4a9KVdg-lkp@intel.com/

smatch warnings:
fs/iomap/buffered-io.c:364 iomap_fsverity_init_bioset() warn: missing error code 'error'

vim +/error +364 fs/iomap/buffered-io.c

f0f93bf8ee6030 Darrick J. Wong    2024-03-20  342  
f0f93bf8ee6030 Darrick J. Wong    2024-03-20  343  static int iomap_fsverity_init_bioset(void)
f0f93bf8ee6030 Darrick J. Wong    2024-03-20  344  {
f0f93bf8ee6030 Darrick J. Wong    2024-03-20  345  	struct bio_set *bs, *old;
f0f93bf8ee6030 Darrick J. Wong    2024-03-20  346  	int error;
f0f93bf8ee6030 Darrick J. Wong    2024-03-20  347  
f0f93bf8ee6030 Darrick J. Wong    2024-03-20  348  	bs = kmalloc(sizeof(*bs), GFP_KERNEL);
f0f93bf8ee6030 Darrick J. Wong    2024-03-20  349  	if (!bs)
f0f93bf8ee6030 Darrick J. Wong    2024-03-20  350  		return -ENOMEM;
f0f93bf8ee6030 Darrick J. Wong    2024-03-20  351  
f0f93bf8ee6030 Darrick J. Wong    2024-03-20  352  	error = bioset_init(bs, IOMAP_FSVERITY_POOL_SIZE,
f0f93bf8ee6030 Darrick J. Wong    2024-03-20  353  			    offsetof(struct iomap_fsverity_bio, bio),
f0f93bf8ee6030 Darrick J. Wong    2024-03-20  354  			    BIOSET_NEED_BVECS);
f0f93bf8ee6030 Darrick J. Wong    2024-03-20  355  	if (error)
f0f93bf8ee6030 Darrick J. Wong    2024-03-20  356  		goto out_exit;
f0f93bf8ee6030 Darrick J. Wong    2024-03-20  357  
f0f93bf8ee6030 Darrick J. Wong    2024-03-20  358  	/*
f0f93bf8ee6030 Darrick J. Wong    2024-03-20  359  	 * This has to be atomic as readaheads can race to create the
f0f93bf8ee6030 Darrick J. Wong    2024-03-20  360  	 * bioset.  If someone set the pointer before us, we drop ours.
f0f93bf8ee6030 Darrick J. Wong    2024-03-20  361  	 */
f0f93bf8ee6030 Darrick J. Wong    2024-03-20  362  	old = cmpxchg(&iomap_fsverity_bioset, NULL, bs);
f0f93bf8ee6030 Darrick J. Wong    2024-03-20  363  	if (old)
f0f93bf8ee6030 Darrick J. Wong    2024-03-20 @364  		goto out_exit;
f0f93bf8ee6030 Darrick J. Wong    2024-03-20  365  
f0f93bf8ee6030 Darrick J. Wong    2024-03-20  366  	return 0;
f0f93bf8ee6030 Darrick J. Wong    2024-03-20  367  out_exit:
f0f93bf8ee6030 Darrick J. Wong    2024-03-20  368  	bioset_exit(bs);
f0f93bf8ee6030 Darrick J. Wong    2024-03-20  369  	kfree(bs);
f0f93bf8ee6030 Darrick J. Wong    2024-03-20  370  	return error;
f0f93bf8ee6030 Darrick J. Wong    2024-03-20  371  }
a4c740bf529f43 Andrey Albershteyn 2024-03-13  372  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
