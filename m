Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4247513AD05
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 04:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772686714; cv=none; b=s1fN7U87cG1tE1KdIuMOfkx2NFzXAX7nbNrej7CnoHlprrXnRVFdyuxIsGtxyf5+0i4RIifxZpHui+Z7gLusHi7s4NwzkW9esmnTvUQXjz0i2fgoRlp30/rujMPfaBU1kt7cigleti5dwn5TUZQ4UQwZdtFJl3ChjSCAz1ln4FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772686714; c=relaxed/simple;
	bh=A/dr23LbyrvcNcmhfNIXCYrT+xjZQBmq+s3eSGS78Ck=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oVD8CpyXBc2fAvgtyICDihgMLPRUsIaBNQ9dlwpLnMt4wn5Ysv5xUX9yIQ3+zjqXABTgR9xgURYT7WggUrAzmv+JiSB1PiXdy1YjdknxoUCABGVFH38M53VzKNd6pdBqor9d6dC1Hq69PzpJ+K2z/mkmuKFqfAJujruPiXTmTUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JxdSgrcS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JxdSgrcS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772686713; x=1804222713;
  h=date:from:to:cc:subject:message-id;
  bh=A/dr23LbyrvcNcmhfNIXCYrT+xjZQBmq+s3eSGS78Ck=;
  b=JxdSgrcSM9Cq7C8zgQsmXc2/Xa4Nl3X1H8kYrJZGGAAFXNMgilkoQOeg
   EPxOxEjG/uTZ/HXVgFPMz7OfSVFOYeN7R3atZsIlIKLBcBiF8Fefm7nCq
   4eguTK67X/8/TXa9PH9ThnRn4PB5FIWWIapDDDjAXuSujnoB5H/fMXFn5
   BCqNBXQCeaePIfZW5uX6/xjbpsH6BIRk9y1kULVOL/Ce3LkRSbG2bcGK2
   h4Q2Qk7b4Qp/mUP9tHPHx9cHqjV5w//KwgIdf4wHXkAE6ufi8vpccrDHW
   wFnMYJ5x8C21tMUC8v8PWUgVWJVf2tQXHEd/UqVuVKp/Tx2Kjd3RkSGFU
   w==;
X-CSE-ConnectionGUID: cLcJPV8uSgWNqlTpoCArZA==
X-CSE-MsgGUID: hLGrD3sMRkqa3avbqsdyJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73634273"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="73634273"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 20:58:33 -0800
X-CSE-ConnectionGUID: vg8AK3tXSnCW+1h2HboN6w==
X-CSE-MsgGUID: Z6JB6f0SSXuhgBlz56oMMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="245095959"
Received: from lkp-server02.sh.intel.com (HELO 456988d8841c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 04 Mar 2026 20:58:31 -0800
Received: from kbuild by 456988d8841c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy0n6-0000000007L-3kWL;
	Thu, 05 Mar 2026 04:58:28 +0000
Date: Thu, 05 Mar 2026 12:55:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:upstream-linux-6.12.y 955/955]
 block/blk-merge.c:1003 blk_rq_merge_ok() warn: variable dereferenced before
 check 'rq->bio' (see line 992)
Message-ID: <202603051221.AJe3uAID-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common upstream-linux-6.12.y
head:   c1924e059c728edf4138c6343fafb2c6d234ac35
commit: 3e12e8c273ebcf346bfafdf7066764324912b070 [955/955] block: remove the write_hint field from struct request
:::::: branch date: 16 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-141-20260305 (https://download.01.org/0day-ci/archive/20260305/202603051221.AJe3uAID-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603051221.AJe3uAID-lkp@intel.com/

smatch warnings:
block/blk-merge.c:1003 blk_rq_merge_ok() warn: variable dereferenced before check 'rq->bio' (see line 992)

vim +1003 block/blk-merge.c

050c8ea80e3e900 Tejun Heo          2012-02-08   978  
050c8ea80e3e900 Tejun Heo          2012-02-08   979  bool blk_rq_merge_ok(struct request *rq, struct bio *bio)
050c8ea80e3e900 Tejun Heo          2012-02-08   980  {
e2a60da74fc8215 Martin K. Petersen 2012-09-18   981  	if (!rq_mergeable(rq) || !bio_mergeable(bio))
050c8ea80e3e900 Tejun Heo          2012-02-08   982  		return false;
050c8ea80e3e900 Tejun Heo          2012-02-08   983  
288dab8a35a0bde Christoph Hellwig  2016-06-09   984  	if (req_op(rq) != bio_op(bio))
f31dc1cd490539e Martin K. Petersen 2012-09-18   985  		return false;
f31dc1cd490539e Martin K. Petersen 2012-09-18   986  
050c8ea80e3e900 Tejun Heo          2012-02-08   987  	/* different data direction or already started, don't merge */
050c8ea80e3e900 Tejun Heo          2012-02-08   988  	if (bio_data_dir(bio) != rq_data_dir(rq))
050c8ea80e3e900 Tejun Heo          2012-02-08   989  		return false;
050c8ea80e3e900 Tejun Heo          2012-02-08   990  
6b2b04590b51aa4 Tejun Heo          2022-03-14   991  	/* don't merge across cgroup boundaries */
6b2b04590b51aa4 Tejun Heo          2022-03-14  @992  	if (!blk_cgroup_mergeable(rq, bio))
6b2b04590b51aa4 Tejun Heo          2022-03-14   993  		return false;
6b2b04590b51aa4 Tejun Heo          2022-03-14   994  
050c8ea80e3e900 Tejun Heo          2012-02-08   995  	/* only merge integrity protected bio into ditto rq */
4eaf99beadcefbf Martin K. Petersen 2014-09-26   996  	if (blk_integrity_merge_bio(rq->q, rq, bio) == false)
050c8ea80e3e900 Tejun Heo          2012-02-08   997  		return false;
050c8ea80e3e900 Tejun Heo          2012-02-08   998  
a892c8d52c02284 Satya Tangirala    2020-05-14   999  	/* Only merge if the crypt contexts are compatible */
a892c8d52c02284 Satya Tangirala    2020-05-14  1000  	if (!bio_crypt_rq_ctx_compatible(rq, bio))
a892c8d52c02284 Satya Tangirala    2020-05-14  1001  		return false;
a892c8d52c02284 Satya Tangirala    2020-05-14  1002  
3e12e8c273ebcf3 Christoph Hellwig  2024-11-12 @1003  	if (rq->bio) {
449813515d3e5ef Bart Van Assche    2024-02-02  1004  		/* Don't merge requests with different write hints. */
3e12e8c273ebcf3 Christoph Hellwig  2024-11-12  1005  		if (rq->bio->bi_write_hint != bio->bi_write_hint)
449813515d3e5ef Bart Van Assche    2024-02-02  1006  			return false;
3e12e8c273ebcf3 Christoph Hellwig  2024-11-12  1007  	}
449813515d3e5ef Bart Van Assche    2024-02-02  1008  
668ffc03418bc77 Damien Le Moal     2018-11-20  1009  	if (rq->ioprio != bio_prio(bio))
668ffc03418bc77 Damien Le Moal     2018-11-20  1010  		return false;
668ffc03418bc77 Damien Le Moal     2018-11-20  1011  
9da3d1e912f3953 John Garry         2024-06-20  1012  	if (blk_atomic_write_mergeable_rq_bio(rq, bio) == false)
9da3d1e912f3953 John Garry         2024-06-20  1013  		return false;
9da3d1e912f3953 John Garry         2024-06-20  1014  
050c8ea80e3e900 Tejun Heo          2012-02-08  1015  	return true;
050c8ea80e3e900 Tejun Heo          2012-02-08  1016  }
050c8ea80e3e900 Tejun Heo          2012-02-08  1017  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
