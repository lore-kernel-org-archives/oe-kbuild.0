Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5949136AB69
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Mar 2026 10:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772879108; cv=none; b=Od2p8+ak8XDL9w2SgQGexnm/PNw5i3giwWUMgQu+u9jxNf0zqlDrxxvecS4hRRwpCyPtNFOsNJhIlhTGx418tWUHALBQ2NSKqiGoHJhwTkY5+kiwlB9yy+wtabUGosw/7Rfagv/EzgOjg6gqE1R3ye2RHJnQIJCEpOwbdtjzMz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772879108; c=relaxed/simple;
	bh=MNw035/g1UsWZdYkA6bv1Ll6df4MyHMeTqZq7fxbru0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jr58d0er4wi8gjfpz7J4k6Y/FQEqWxzswHRxzFNOGCxzC1CySc52r3Qke4/5Qmm+6DXaFTKmLb+kkX6FQ8vfUwz/ickD8DOV31CRpire46koknaNFV7mRaVdfCSiL5R+kyJ9juqS1DBqYB9r6vE7MTGjXBb5s4U0TCMa+8ipuAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H4lgpEa7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H4lgpEa7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772879106; x=1804415106;
  h=date:from:to:cc:subject:message-id;
  bh=MNw035/g1UsWZdYkA6bv1Ll6df4MyHMeTqZq7fxbru0=;
  b=H4lgpEa7XK0wyZN3UfLYMr4/S0BtDks25UtK6ugQPiQp46vJzWCfswVa
   G+FMtxoewXF8wfDV7ljZTEvjLv5nSDo9ziTHOFEk+5gMY+vzprjBVY6pS
   y2GtvQc9hosAywcR5+lX5KSJnoPnztF+CEC/7Gg8maBu6SVWbM0M9F9Op
   VKlXxALRmp5OC+mHirQR+ydxJvxwP6NipBx9YINaAjqhJBLfUFlRQtcKx
   MMIsFr7tDKrrmETVtGwcLiDox/C8X8DbSgIggmbclwna4GLy8cvV17uGR
   QdyQoY1JPW7pXZeFCgKodlu/tgZv1GK3/HWNpb8XVJIIOoISbXdbvjnqE
   g==;
X-CSE-ConnectionGUID: /It+EwnyTJGRR95RRbm10Q==
X-CSE-MsgGUID: j1V6IgWISZyhXLrfWS5XUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73000689"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="73000689"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 02:25:05 -0800
X-CSE-ConnectionGUID: dNpV04xUST27qvefbzqnSA==
X-CSE-MsgGUID: TyQqa8BLSx21sDAtudklgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="257175912"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Mar 2026 02:25:04 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyoqD-000000001sj-1yZw;
	Sat, 07 Mar 2026 10:25:01 +0000
Date: Sat, 07 Mar 2026 18:24:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 78/471] kernel/time/test_udelay.c:112
 udelay_test_write() warn: potential spectre issue 'lbuf' [w]
Message-ID: <202603071828.uchkrOqx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   0a49759be1c3b29207758e467fdc1a90d0716d06
commit: c560d52b8ecc57f284b2e6dbcee39fff2fc3d1a7 [78/471] kernel/time: convert to read/write iterators
:::::: branch date: 23 hours ago
:::::: commit date: 32 hours ago
config: i386-randconfig-141-20260307 (https://download.01.org/0day-ci/archive/20260307/202603071828.uchkrOqx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603071828.uchkrOqx-lkp@intel.com/

smatch warnings:
kernel/time/test_udelay.c:112 udelay_test_write() warn: potential spectre issue 'lbuf' [w]

vim +/lbuf +112 kernel/time/test_udelay.c

e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16   98  
c560d52b8ecc57 kernel/time/test_udelay.c Jens Axboe  2024-04-08   99  static ssize_t udelay_test_write(struct kiocb *iocb, struct iov_iter *from)
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  100  {
c560d52b8ecc57 kernel/time/test_udelay.c Jens Axboe  2024-04-08  101  	size_t count = iov_iter_count(from);
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  102  	char lbuf[32];
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  103  	int ret;
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  104  	int usecs;
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  105  	int iters;
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  106  
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  107  	if (count >= sizeof(lbuf))
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  108  		return -EINVAL;
e704f93af5a083 kernel/time/udelay_test.c David Riley 2014-06-16  109  
c560d52b8ecc57 kernel/time/test_udelay.c Jens Axboe  2024-04-08  110  	if (!copy_from_iter_full(lbuf, count, from))
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
