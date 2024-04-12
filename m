Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0650D53E2B
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Apr 2024 11:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712920789; cv=none; b=uIPfRMzJ6QzhzQsmdIbWZTZT9aIA6hZnJS1/8t7dx9UherKES5Kpj2tatGipfuGcjLyggqgUPKVz2WYbMTaui3lcRRE9M/99lJlDVltbJ07Aa+7Lx50aXtSFnOXydezV1m2T9y/S2cV0bIwbqhoLib7m9SctrsBSPXUGZXrw7zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712920789; c=relaxed/simple;
	bh=g2wVTjt8Csa5Z7VJ/DasFTIGsWm/feRJ1A6Ck0UlTbE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c306iGElLth178pMUlslh5T3M/FNPnHlFWCJvB6z8PtpJsNU6mLGE7ZPW3KTEC92P2SQCQWWfeVfBLY+xETQDrY53Tv4UnQJvpeT2pI+iE4k2++HCGeEEG9DvwXpxSQHg87DbDXdQpbMeIZynXnRcJcSl4RuVfRYNzxTNuHjV9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HPZnMBQV; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HPZnMBQV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712920787; x=1744456787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g2wVTjt8Csa5Z7VJ/DasFTIGsWm/feRJ1A6Ck0UlTbE=;
  b=HPZnMBQVScD2Txm6l6yf5fX5uSkLYryBzZYP3bb8iUgWPVe3HguL3jHy
   /HlAMituIzDvc7m6qLM6m4NA6D6rPZRfIg3eTdblwR9exZ8UQgDadUQfb
   nirBoqgDedCFcpX3cy0zBRo8iM2I199UhDX+JO6D9UgfHWr18eZL6sHp3
   1d8NhWuBhpb8SraQV2Vv01sgk5mNLQOtV/RrmycmL2fCD0TK4+pmBQsp5
   W7K7QlcxIYGSXJJ1Uf7DQ80Bsg3Csi9jGgYnqjToRPGpYIuMYEyyk+PKv
   7WH8GJhdnwwGyKqfzGY4Enh/ukaSJJo0DoopSzHHZ3HlW4tv5qdOS8ZLR
   w==;
X-CSE-ConnectionGUID: fbGYPP8iQGus/0Rgldnvmw==
X-CSE-MsgGUID: PRn3vTCqS+2GUhLCNROE4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8590842"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="8590842"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 04:19:44 -0700
X-CSE-ConnectionGUID: dXzfxku1RiyFnb/QL132bQ==
X-CSE-MsgGUID: lq6OqtAPSrOT3eq2wLrCpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="21247824"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Apr 2024 04:19:43 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvEwW-0009hs-1q;
	Fri, 12 Apr 2024 11:19:40 +0000
Date: Fri, 12 Apr 2024 19:19:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 79/415] kernel/time/test_udelay.c:112
 udelay_test_write() warn: potential spectre issue 'lbuf' [w]
Message-ID: <202404121955.fDJYmETD-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   8e79f6c3d0a118031e843758491803e38794f6e8
commit: 99faf2122db10e555ebd87072639ca6ac8e2fb92 [79/415] kernel/time: convert to read/write iterators
:::::: branch date: 16 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240411 (https://download.01.org/0day-ci/archive/20240412/202404121955.fDJYmETD-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404121955.fDJYmETD-lkp@intel.com/

smatch warnings:
kernel/time/test_udelay.c:112 udelay_test_write() warn: potential spectre issue 'lbuf' [w]

vim +/lbuf +112 kernel/time/test_udelay.c

e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16   98  
99faf2122db10e kernel/time/test_udelay.c Jens Axboe  2024-04-08   99  static ssize_t udelay_test_write(struct kiocb *iocb, struct iov_iter *from)
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  100  {
99faf2122db10e kernel/time/test_udelay.c Jens Axboe  2024-04-08  101  	size_t count = iov_iter_count(from);
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  102  	char lbuf[32];
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  103  	int ret;
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  104  	int usecs;
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  105  	int iters;
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  106  
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  107  	if (count >= sizeof(lbuf))
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  108  		return -EINVAL;
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  109  
99faf2122db10e kernel/time/test_udelay.c Jens Axboe  2024-04-08  110  	if (!copy_from_iter_full(lbuf, count, from))
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  111  		return -EFAULT;
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16 @112  	lbuf[count] = '\0';
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  113  
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  114  	ret = sscanf(lbuf, "%d %d", &usecs, &iters);
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  115  	if (ret < 1)
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  116  		return -EINVAL;
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  117  	else if (ret < 2)
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  118  		iters = DEFAULT_ITERATIONS;
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  119  
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  120  	mutex_lock(&udelay_test_lock);
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  121  	udelay_test_usecs = usecs;
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  122  	udelay_test_iterations = iters;
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  123  	mutex_unlock(&udelay_test_lock);
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  124  
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  125  	return count;
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  126  }
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  127  

:::::: The code at line 112 was first introduced by commit
:::::: e704f93af5a083c07b8f722672d63a1d908daf55 kernel: time: Add udelay_test module to validate udelay

:::::: TO: David Riley <davidriley@chromium.org>
:::::: CC: John Stultz <john.stultz@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
