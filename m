Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1154ECA42
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Feb 2024 01:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706752543; cv=none; b=R9K5XOx/yZ2YY82fU1kpmPT6I3Usi4A8cF8pNZvW8bavKy6vcQNrcAPWQPFvketNy78sEBTHMkARm7LXq3FuGnhVISC7cKALvUl/Sf+YYNnUkhJUV0T95gBYKG97y54v55gcadRPCNBufMhszuz+XsBhS9sOR3bomD4a8poOM/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706752543; c=relaxed/simple;
	bh=T7gxJWXw5PqZCT8ZlPVuk2qXyyhIzI1s0THJ+kaj7uY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b/ApIudk5cSLzdrbjXL1MKuQ5UgID0enxbuYTP0CgSkjhC7cgOuF2Mwt2r5RriuqtArQ5ASj2dXjrL49+zdYWtrXyWOPOLfIhIpA+HTEHPJUiGekfEqqx7YjfIENOiOrYQSB//ux2ZOHNeYpSQ3q8+d4X7OtJSv0XwkgoNvWPwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ewy6TdqK; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ewy6TdqK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706752541; x=1738288541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T7gxJWXw5PqZCT8ZlPVuk2qXyyhIzI1s0THJ+kaj7uY=;
  b=ewy6TdqKkvDB8Z3/4If4VB7m9SHDVvLEryfZELdur4ojVlocDC82fJB+
   YOJxTHqmHIe6o+sEPMTFA2MsXZ4AaIctbksDNweIefOu+MyG3gV0PMX+r
   rh7bsE0wJ/WWp813W6chp6hDAe3qsml5ss1SXqZeZ5J/mhRtTvtERCXSV
   9dkaPFw5yNFFHW/oos5yLSIIXEUhxhBgkILRAlD/pNRiXir/yNNU9X4CU
   Sjy2d14EePTt3AOB8i4m8jzxR4JzKlpB/h1jnRAlagyNlMZlLFvtKG0Ck
   9IYvo6n3xXiHlFsNfu1JGVTMGuu2x7zkLaw0ODVQtu+1BuIb7XLakjO+4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="25243532"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="25243532"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 17:55:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="22968538"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 31 Jan 2024 17:55:38 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVMHw-0002GY-0A;
	Thu, 01 Feb 2024 01:55:18 +0000
Date: Thu, 1 Feb 2024 09:54:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-block:blk-limits-base 5/14] block/blk-sysfs.c:187
 queue_discard_max_store() warn: impossible condition '((max_discard_bytes >>
 9) > (~0)) => (0-u32max > u32max)'
Message-ID: <202402010945.hhOt8Lhh-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/block.git blk-limits-base
head:   d9e82988c99337a7070237a2fb25d2de89546160
commit: a492c3cda708bc470f4e949c0b0cdf4d49e2cd93 [5/14] block: add a max_user_discard_sectors queue limit
:::::: branch date: 18 hours ago
:::::: commit date: 6 days ago
config: i386-randconfig-141-20240128 (https://download.01.org/0day-ci/archive/20240201/202402010945.hhOt8Lhh-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402010945.hhOt8Lhh-lkp@intel.com/

New smatch warnings:
block/blk-sysfs.c:187 queue_discard_max_store() warn: impossible condition '((max_discard_bytes >> 9) > (~0)) => (0-u32max > u32max)'

Old smatch warnings:
block/blk-sysfs.c:42 queue_var_store() warn: impossible condition '(v > (~0)) => (0-u32max > u32max)'

vim +187 block/blk-sysfs.c

86b37281411cf1 Martin K. Petersen 2009-11-10  173  
0034af036554c3 Jens Axboe         2015-07-16  174  static ssize_t queue_discard_max_store(struct request_queue *q,
0034af036554c3 Jens Axboe         2015-07-16  175  				       const char *page, size_t count)
0034af036554c3 Jens Axboe         2015-07-16  176  {
a492c3cda708bc Christoph Hellwig  2024-01-22  177  	unsigned long max_discard_bytes;
a492c3cda708bc Christoph Hellwig  2024-01-22  178  	ssize_t ret;
0034af036554c3 Jens Axboe         2015-07-16  179  
a492c3cda708bc Christoph Hellwig  2024-01-22  180  	ret = queue_var_store(&max_discard_bytes, page, count);
0034af036554c3 Jens Axboe         2015-07-16  181  	if (ret < 0)
0034af036554c3 Jens Axboe         2015-07-16  182  		return ret;
0034af036554c3 Jens Axboe         2015-07-16  183  
a492c3cda708bc Christoph Hellwig  2024-01-22  184  	if (max_discard_bytes & (q->limits.discard_granularity - 1))
0034af036554c3 Jens Axboe         2015-07-16  185  		return -EINVAL;
0034af036554c3 Jens Axboe         2015-07-16  186  
a492c3cda708bc Christoph Hellwig  2024-01-22 @187  	if ((max_discard_bytes >> SECTOR_SHIFT) > UINT_MAX)
0034af036554c3 Jens Axboe         2015-07-16  188  		return -EINVAL;
0034af036554c3 Jens Axboe         2015-07-16  189  
a492c3cda708bc Christoph Hellwig  2024-01-22  190  	q->limits.max_user_discard_sectors = max_discard_bytes >> SECTOR_SHIFT;
a492c3cda708bc Christoph Hellwig  2024-01-22  191  	q->limits.max_discard_sectors =
a492c3cda708bc Christoph Hellwig  2024-01-22  192  		min_not_zero(q->limits.max_hw_discard_sectors,
a492c3cda708bc Christoph Hellwig  2024-01-22  193  			     q->limits.max_user_discard_sectors);
0034af036554c3 Jens Axboe         2015-07-16  194  	return ret;
0034af036554c3 Jens Axboe         2015-07-16  195  }
0034af036554c3 Jens Axboe         2015-07-16  196  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
