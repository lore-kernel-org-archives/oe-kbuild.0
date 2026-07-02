Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DFE2571A0
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 21:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783026174; cv=none; b=jQ4cXcPJ4lbGVRvPjLWQU8dx0KkGydvMNsEZC8jrYTMyru4PS8HsFHTrl03kPcW7X/Zgbk9rbqy0xJyfxmCC4ELypbLhCSvc5jOYa9Y2xq1TfnFj9fdzTffKF5wCDXPHvBzxlh/V1MAvWQIWf3llmpZqWZPG+3DEKyrEk1FRtYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783026174; c=relaxed/simple;
	bh=FmnXVV44iyGU8enrKOaHiTR23jXCGaIqLfZSoNtjfkk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jtj6gjh5psWfkzw1aJakDbExK1sY61wbYfq0McBvSOrf7aEuj7RiyzTe7Lu6PRy2+CP10UBSxoonWtg8j42JlzNSFEWYGuu+PBUEk78PiDnL09zPLrq/5uUtHHfy0wPprKKZeHiGBzY6v4KIaWdHXwiTlrPIijA006vDGmvrIYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GIqL5rsH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GIqL5rsH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783026172; x=1814562172;
  h=date:from:to:cc:subject:message-id;
  bh=FmnXVV44iyGU8enrKOaHiTR23jXCGaIqLfZSoNtjfkk=;
  b=GIqL5rsHoynZJL1OFwNnDZRfbf7XbIBmHU0XPuGyE4nh83NvhBHALMXG
   ALDMavurqSP7DYGtVtjeAYKeuspDuWd/95TjF6K+eqBiTuRd8rQw+rnYs
   3t4yMI8Yer1uBBxQ/NtPSrBsrxDtX4uu/3v/Hv0MLIkSkfGIHXfuXoqrU
   Au2GOG5QItPyZvhFUyskxpUxrjGToheKeWYSFjCou9bsd23XwezJhm9jf
   oOr4jEfgDDKpcvj2PTfNdjonnmp8W9UFHcvocoWxX5fdFOVOOBq2bbKtW
   W3uZAl5937WdYrqr/lzPhl7wib8tk+xI5kXGLoHVqL1CBftYuDltsLUZR
   g==;
X-CSE-ConnectionGUID: x3OCg5NuSC+sNme8CmLSuw==
X-CSE-MsgGUID: ZgUQW2/3RwKQrdeYqGDoyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="94436138"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="94436138"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 14:02:51 -0700
X-CSE-ConnectionGUID: RiWxk3FsS7qv8G7r/5YEWg==
X-CSE-MsgGUID: E/DXTz0MQyK26C50O6Tg+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="257292937"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 02 Jul 2026 14:02:51 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfOYZ-00000000BEp-1vig;
	Thu, 02 Jul 2026 21:02:47 +0000
Date: Fri, 03 Jul 2026 05:02:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12 1/1] block/blk-merge.c:969
 blk_rq_merge_ok() warn: variable dereferenced before check 'rq->bio' (see
 line 958)
Message-ID: <202607030420.y7EO6sQZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   d36feda1de5741a9d2bfe0fd6a0391c77047f5bb
commit: 7f82cf03ba776076d22aebf90449ec2b83618cef [1/1] UPSTREAM: block: remove the write_hint field from struct request
:::::: branch date: 12 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260703/202607030420.y7EO6sQZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607030420.y7EO6sQZ-lkp@intel.com/

smatch warnings:
block/blk-merge.c:969 blk_rq_merge_ok() warn: variable dereferenced before check 'rq->bio' (see line 958)

vim +969 block/blk-merge.c

050c8ea80e3e900 Tejun Heo          2012-02-08  944  
050c8ea80e3e900 Tejun Heo          2012-02-08  945  bool blk_rq_merge_ok(struct request *rq, struct bio *bio)
050c8ea80e3e900 Tejun Heo          2012-02-08  946  {
e2a60da74fc8215 Martin K. Petersen 2012-09-18  947  	if (!rq_mergeable(rq) || !bio_mergeable(bio))
050c8ea80e3e900 Tejun Heo          2012-02-08  948  		return false;
050c8ea80e3e900 Tejun Heo          2012-02-08  949  
288dab8a35a0bde Christoph Hellwig  2016-06-09  950  	if (req_op(rq) != bio_op(bio))
f31dc1cd490539e Martin K. Petersen 2012-09-18  951  		return false;
f31dc1cd490539e Martin K. Petersen 2012-09-18  952  
050c8ea80e3e900 Tejun Heo          2012-02-08  953  	/* different data direction or already started, don't merge */
050c8ea80e3e900 Tejun Heo          2012-02-08  954  	if (bio_data_dir(bio) != rq_data_dir(rq))
050c8ea80e3e900 Tejun Heo          2012-02-08  955  		return false;
050c8ea80e3e900 Tejun Heo          2012-02-08  956  
6b2b04590b51aa4 Tejun Heo          2022-03-14  957  	/* don't merge across cgroup boundaries */
6b2b04590b51aa4 Tejun Heo          2022-03-14 @958  	if (!blk_cgroup_mergeable(rq, bio))
6b2b04590b51aa4 Tejun Heo          2022-03-14  959  		return false;
6b2b04590b51aa4 Tejun Heo          2022-03-14  960  
050c8ea80e3e900 Tejun Heo          2012-02-08  961  	/* only merge integrity protected bio into ditto rq */
4eaf99beadcefbf Martin K. Petersen 2014-09-26  962  	if (blk_integrity_merge_bio(rq->q, rq, bio) == false)
050c8ea80e3e900 Tejun Heo          2012-02-08  963  		return false;
050c8ea80e3e900 Tejun Heo          2012-02-08  964  
a892c8d52c02284 Satya Tangirala    2020-05-14  965  	/* Only merge if the crypt contexts are compatible */
a892c8d52c02284 Satya Tangirala    2020-05-14  966  	if (!bio_crypt_rq_ctx_compatible(rq, bio))
a892c8d52c02284 Satya Tangirala    2020-05-14  967  		return false;
a892c8d52c02284 Satya Tangirala    2020-05-14  968  
7f82cf03ba77607 Christoph Hellwig  2024-11-12 @969  	if (rq->bio) {
449813515d3e5ef Bart Van Assche    2024-02-02  970  		/* Don't merge requests with different write hints. */
7f82cf03ba77607 Christoph Hellwig  2024-11-12  971  		if (rq->bio->bi_write_hint != bio->bi_write_hint)
449813515d3e5ef Bart Van Assche    2024-02-02  972  			return false;
7f82cf03ba77607 Christoph Hellwig  2024-11-12  973  	}
668ffc03418bc77 Damien Le Moal     2018-11-20  974  
69db0304309a7e4 Greg Kroah-Hartman 2025-05-21  975  	if (rq->ioprio != bio_prio(bio))
69db0304309a7e4 Greg Kroah-Hartman 2025-05-21  976  		return false;
69db0304309a7e4 Greg Kroah-Hartman 2025-05-21  977  
9da3d1e912f3953 John Garry         2024-06-20  978  	if (blk_atomic_write_mergeable_rq_bio(rq, bio) == false)
9da3d1e912f3953 John Garry         2024-06-20  979  		return false;
9da3d1e912f3953 John Garry         2024-06-20  980  
050c8ea80e3e900 Tejun Heo          2012-02-08  981  	return true;
050c8ea80e3e900 Tejun Heo          2012-02-08  982  }
050c8ea80e3e900 Tejun Heo          2012-02-08  983  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
