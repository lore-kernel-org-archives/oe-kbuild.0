Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE51E2D7391
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Nov 2025 13:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762347798; cv=none; b=YZBl0SCTSk755GFpukFQXyw33UUxedpLZmGPka7Rd2AMN1i5U2KLlKFVBhQJQjSSDTNeZZoEIwKrhGYYqkJvN4PSzCmvL2fEHDWF2cD0lTKSMJoXsC+tOqAhcWQ1t8f55JkSLZigmtThSed/7d+ebHU5QLG5DO0rKm0j0IjzFEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762347798; c=relaxed/simple;
	bh=VvB6KGlDOFFUPc6PPCG/SfDvqdlS6HVTguRkjHbYbOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hcc9NgxbaSNwubQI0Ys1/pXWuKs6xUvcLlt7CQs0CfUZjhCeKAh6LaxOk4n5wamDrKzhA1HGRUTTTUPQGMsqFKN9xDk8KrSsyw/mYJl3SXNKuIyfmFH3OEntsfPhbJftSNitcxcmcZ2FqKWIn8QBkqHpz+ZYfWMiOh/YY60nXV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OuK8Jp/H; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OuK8Jp/H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762347797; x=1793883797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VvB6KGlDOFFUPc6PPCG/SfDvqdlS6HVTguRkjHbYbOQ=;
  b=OuK8Jp/HVB/BcKSjhvvvZgl8BHhNg+metYH/+mizTJeaaA1RRHvooVh8
   a0NoWr4iwIO0UPGBdBK3ITcDJnZpsLFAIIU4DBJRDmDLC8CkPJ4IUCKaE
   WUr+nJmsERh6oPPSRibIF2l3eCL69qI2ZCsDh8XhQ+IIW2rZWxKp5zid5
   tRlz+nkoVlvMgp/jZ8bZWtekrI8cPY5uS+b4iJ2OK3hVQ8/uQFB5nzBaw
   o1hiE06t314K49yIHYXD0RjASU6aiZkWE1mbV0u2FIegT5z8dEie6rcOT
   Nf3VAfqrrUohWCmy/yyX6FITQCXesfzX9vpxF29OKejQrzN0YOpC6ABs4
   g==;
X-CSE-ConnectionGUID: u1rLG/WdSS289e6fhQ2l3g==
X-CSE-MsgGUID: Nhc9Z/SGS86lyT8AQ5Ijsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64560295"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="64560295"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 05:03:16 -0800
X-CSE-ConnectionGUID: FH8klGesTEmF2GIkzgc/Bg==
X-CSE-MsgGUID: YFgoYTtqSLe5x3g67NSv1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="187900037"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 05 Nov 2025 05:03:15 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGdAK-000Sa2-25;
	Wed, 05 Nov 2025 13:03:10 +0000
Date: Wed, 5 Nov 2025 21:02:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6061/6507] fs/erofs/fileio.c:65
 erofs_fileio_rq_submit() error: uninitialized symbol 'ret'.
Message-ID: <202511052057.dU1s9Y6h-lkp@intel.com>
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
CC: Amir Goldstein <amir73il@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   84d39fb9d529f27d2f3d295430d1be0abdae7a6d
commit: 5e88d1aadcd20a8e2cf317839cac0c94006cee64 [6061/6507] erofs: use credential guards
:::::: branch date: 7 hours ago
:::::: commit date: 25 hours ago
config: parisc-randconfig-r071-20251105 (https://download.01.org/0day-ci/archive/20251105/202511052057.dU1s9Y6h-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511052057.dU1s9Y6h-lkp@intel.com/

smatch warnings:
fs/erofs/fileio.c:65 erofs_fileio_rq_submit() error: uninitialized symbol 'ret'.

vim +/ret +65 fs/erofs/fileio.c

ce63cb62d794c9 Gao Xiang         2024-09-05  47  
ce63cb62d794c9 Gao Xiang         2024-09-05  48  static void erofs_fileio_rq_submit(struct erofs_fileio_rq *rq)
ce63cb62d794c9 Gao Xiang         2024-09-05  49  {
ce63cb62d794c9 Gao Xiang         2024-09-05  50  	struct iov_iter iter;
ce63cb62d794c9 Gao Xiang         2024-09-05  51  	int ret;
ce63cb62d794c9 Gao Xiang         2024-09-05  52  
ce63cb62d794c9 Gao Xiang         2024-09-05  53  	if (!rq)
ce63cb62d794c9 Gao Xiang         2024-09-05  54  		return;
ce63cb62d794c9 Gao Xiang         2024-09-05  55  	rq->iocb.ki_pos = rq->bio.bi_iter.bi_sector << SECTOR_SHIFT;
ce63cb62d794c9 Gao Xiang         2024-09-05  56  	rq->iocb.ki_ioprio = get_current_ioprio();
ce63cb62d794c9 Gao Xiang         2024-09-05  57  	rq->iocb.ki_complete = erofs_fileio_ki_complete;
6422cde1b0d5a3 Gao Xiang         2024-12-12  58  	if (test_opt(&EROFS_SB(rq->sb)->opt, DIRECT_IO) &&
6422cde1b0d5a3 Gao Xiang         2024-12-12  59  	    rq->iocb.ki_filp->f_mode & FMODE_CAN_ODIRECT)
6422cde1b0d5a3 Gao Xiang         2024-12-12  60  		rq->iocb.ki_flags = IOCB_DIRECT;
ce63cb62d794c9 Gao Xiang         2024-09-05  61  	iov_iter_bvec(&iter, ITER_DEST, rq->bvecs, rq->bio.bi_vcnt,
ce63cb62d794c9 Gao Xiang         2024-09-05  62  		      rq->bio.bi_iter.bi_size);
5e88d1aadcd20a Christian Brauner 2025-11-03  63  	scoped_with_creds(rq->iocb.ki_filp->f_cred)
ce63cb62d794c9 Gao Xiang         2024-09-05  64  		ret = vfs_iocb_iter_read(rq->iocb.ki_filp, &rq->iocb, &iter);
ce63cb62d794c9 Gao Xiang         2024-09-05 @65  	if (ret != -EIOCBQUEUED)
ce63cb62d794c9 Gao Xiang         2024-09-05  66  		erofs_fileio_ki_complete(&rq->iocb, ret);
ce63cb62d794c9 Gao Xiang         2024-09-05  67  }
ce63cb62d794c9 Gao Xiang         2024-09-05  68  

:::::: The code at line 65 was first introduced by commit
:::::: ce63cb62d794c98c7631c2296fa845f2a8d0a4a1 erofs: support unencoded inodes for fileio

:::::: TO: Gao Xiang <hsiangkao@linux.alibaba.com>
:::::: CC: Gao Xiang <hsiangkao@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
