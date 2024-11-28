Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9891494B5
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Nov 2024 08:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732782796; cv=none; b=h6xg1REsyE548njgeM3BwQKOT7y2cVc7+mzpVYF1R9/TacO7zOGK1DXKaaXjiBEuJicp/yLZe9YYFzemvaUgsaqRAFa9v+ia/RSyNVYCY03hOuOqAR+XckU+TnhhMBTolPJH5Gui80Y5mMFFoVXACIJ2jnWSQCZBpYHKi3QA5Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732782796; c=relaxed/simple;
	bh=9/VuygAsm7WvzQXD4AMrcIC09H1HvbYZ2NO3ldGbwJM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KOmM/r7sjM94V8UofXrDQ3bs0xMVQjdiZb0Tiim32PrGHGrFLVOQLHWZ3sfsDRKe5mq9+P49he1AKtV+ZNUo1EtUc4kxqqe7mAOLZWuzUDHGEtiF2sCZNdQBS9c0RVrq0CHPyMS1FThPHaiXBc2K5A/IH5q+5qxo4uldFpNIdqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g+qhPlb4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+qhPlb4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732782795; x=1764318795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9/VuygAsm7WvzQXD4AMrcIC09H1HvbYZ2NO3ldGbwJM=;
  b=g+qhPlb4qhMvkryerMjVVjnaSpZ6NQrZonV97gYSwTUuBh5wee1XhSQH
   qQc9a6TADsv6PXQsxZSgmQIRm0jeft99i9BhKu5oN7bZuaRPW1Dx9b8BM
   fCSEkHpIH32he2/y/rlvaUSzztrs/rYFt/breQ5KG1KRatXNa7kpdTcqo
   06uRj+p8q9BcljGGuPxXY55SzU7asyv10iMd3gtLYoC15nJcz1GdbP9JU
   jQeHAHczG1bWzwskWkKruMhKojvj3KndmB3swjh3bhpU2hTh2Q+zVjbKI
   7bEV6HcESJOS14nx3T0zyHwG3JFEbFh6so6dpmxx2djTC33dJFePvNTOm
   Q==;
X-CSE-ConnectionGUID: YS/if0elQ42z+mWZ5Nh1zA==
X-CSE-MsgGUID: 6jmj3OTHRM6D5t93VeC9xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="36791974"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="36791974"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 00:33:15 -0800
X-CSE-ConnectionGUID: urJXzze8RPmx+WJfb3o8Hw==
X-CSE-MsgGUID: SEq6GJF1Rqud5ZxglBG9SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="96606575"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Nov 2024 00:33:13 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGZxW-0009Ll-1O;
	Thu, 28 Nov 2024 08:33:10 +0000
Date: Thu, 28 Nov 2024 16:32:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/xfs/xfs_log_recover.c:173:5-23: opportunity for str_write_read(op
 == REQ_OP_WRITE)
Message-ID: <202411281626.NpBKMKT8-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>
CC: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b86545e02e8c22fb89218f29d381fa8e8b91d815
commit: 6ad5b3255b9e3d6d94154738aacd5119bf9c8f6e xfs: use bios directly to read and write the log recovery buffers
date:   5 years ago
:::::: branch date: 10 hours ago
:::::: commit date: 5 years ago
config: x86_64-randconfig-104-20241115 (https://download.01.org/0day-ci/archive/20241128/202411281626.NpBKMKT8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411281626.NpBKMKT8-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_log_recover.c:173:5-23: opportunity for str_write_read(op == REQ_OP_WRITE)

vim +173 fs/xfs/xfs_log_recover.c

076e6acb8f0d95 Christoph Hellwig 2009-03-16  145  
6ad5b3255b9e3d Christoph Hellwig 2019-06-28  146  static int
6ad5b3255b9e3d Christoph Hellwig 2019-06-28  147  xlog_do_io(
9a8d2fdbb47aaa Mark Tinguely     2012-06-14  148  	struct xlog		*log,
^1da177e4c3f41 Linus Torvalds    2005-04-16  149  	xfs_daddr_t		blk_no,
6ad5b3255b9e3d Christoph Hellwig 2019-06-28  150  	unsigned int		nbblks,
6ad5b3255b9e3d Christoph Hellwig 2019-06-28  151  	char			*data,
6ad5b3255b9e3d Christoph Hellwig 2019-06-28  152  	unsigned int		op)
^1da177e4c3f41 Linus Torvalds    2005-04-16  153  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  154  	int			error;
^1da177e4c3f41 Linus Torvalds    2005-04-16  155  
99c265950b55f1 Brian Foster      2017-10-26  156  	if (!xlog_verify_bp(log, blk_no, nbblks)) {
99c265950b55f1 Brian Foster      2017-10-26  157  		xfs_warn(log->l_mp,
99c265950b55f1 Brian Foster      2017-10-26  158  			 "Invalid log block/length (0x%llx, 0x%x) for buffer",
99c265950b55f1 Brian Foster      2017-10-26  159  			 blk_no, nbblks);
ff30a6221d95b6 Alex Elder        2010-04-13  160  		XFS_ERROR_REPORT(__func__, XFS_ERRLEVEL_HIGH, log->l_mp);
2451337dd04390 Dave Chinner      2014-06-25  161  		return -EFSCORRUPTED;
3228149ceb8b04 Dave Chinner      2009-01-22  162  	}
3228149ceb8b04 Dave Chinner      2009-01-22  163  
69ce58f08a3c45 Alex Elder        2010-04-20  164  	blk_no = round_down(blk_no, log->l_sectBBsize);
69ce58f08a3c45 Alex Elder        2010-04-20  165  	nbblks = round_up(nbblks, log->l_sectBBsize);
^1da177e4c3f41 Linus Torvalds    2005-04-16  166  	ASSERT(nbblks > 0);
^1da177e4c3f41 Linus Torvalds    2005-04-16  167  
6ad5b3255b9e3d Christoph Hellwig 2019-06-28  168  	error = xfs_rw_bdev(log->l_targ->bt_bdev, log->l_logBBstart + blk_no,
6ad5b3255b9e3d Christoph Hellwig 2019-06-28  169  			BBTOB(nbblks), data, op);
6ad5b3255b9e3d Christoph Hellwig 2019-06-28  170  	if (error && !XFS_FORCED_SHUTDOWN(log->l_mp)) {
6ad5b3255b9e3d Christoph Hellwig 2019-06-28  171  		xfs_alert(log->l_mp,
6ad5b3255b9e3d Christoph Hellwig 2019-06-28  172  			  "log recovery %s I/O error at daddr 0x%llx len %d error %d",
6ad5b3255b9e3d Christoph Hellwig 2019-06-28 @173  			  op == REQ_OP_WRITE ? "write" : "read",
6ad5b3255b9e3d Christoph Hellwig 2019-06-28  174  			  blk_no, nbblks, error);
6ad5b3255b9e3d Christoph Hellwig 2019-06-28  175  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  176  	return error;
^1da177e4c3f41 Linus Torvalds    2005-04-16  177  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  178  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
