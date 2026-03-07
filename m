Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABB21917F1
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Mar 2026 18:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772906519; cv=none; b=LdfPNcqa9eD88o/lHtLpF0JdKBDYQqGWOk1v+c3SkeWO5eikdR5gfN8cjnnlJ9wivRCGgegFp2/xaAYtlgaHzMilqhPyrjo4VJCBEpGnjNfXJHa8K0THEXtlgmzsjHLu81i+XiDxe/9zSL4tbCV96y8Y9hYUcadPVs5ec2rYmbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772906519; c=relaxed/simple;
	bh=e9nPflrU4cerQYZRXIiLwAGjzzleUHV/yKqX/fZ3fAo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SqVrAiJ3SBB50pnKLQlxwuTk+MJz625B5fYyBntOowQSGFdiZqVPxcss7AC7TBBQsC0tFziW2QjsSk3/XKHwMuUdtl3f4HO6UF3FdZPF7+Sa6i8DYQWlhdsTxljPTft22VO+Lxjj/5gFgvC/blyHT5FJmUUSauRTmENQSG22J3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UtekucE5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UtekucE5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772906518; x=1804442518;
  h=date:from:to:cc:subject:message-id;
  bh=e9nPflrU4cerQYZRXIiLwAGjzzleUHV/yKqX/fZ3fAo=;
  b=UtekucE5Z9jUkTmXx1+Xh69upwYBqBF3YYXGcKtqVRnTRCndArFA+ulN
   BnjuhMNg9mOGri8kMBhJ5Nuri/PHlw3SZh+y23GgF4GE9d1Dx6ax1I2AI
   zdrPR5pJdsaj8uiZ+TnbCbgsYwkR6lK/ab7ss+La+OcOsdrySgICwMEhb
   0xFgJwgSwDYKvf5mpO3PZs4nF7Dv0aQKPYuCD10qqJ50LNqyESD0TEL1m
   3W3pb2SiZp+R13IeggtQBtrgUnI+Y1ta9cNIAuihlv41GOjcrQPzvGeXM
   5g/bp+Zx1wKrpDrpqjweW0X9B/xV1fI+XmyYMP9E5KeFjQXyiLw63e1PZ
   Q==;
X-CSE-ConnectionGUID: LXYKVRLWTduWexVW2tQUog==
X-CSE-MsgGUID: SaiIH5ViRVmHOQ0CPiKBig==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="73957231"
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="73957231"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 10:01:58 -0800
X-CSE-ConnectionGUID: RTTYeR8KQD2fF9g6pa+viA==
X-CSE-MsgGUID: M7cHEvN2QpafvfQBv+Aubw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="218537824"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Mar 2026 10:01:56 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyvyM-000000002Uv-0Dex;
	Sat, 07 Mar 2026 18:01:54 +0000
Date: Sun, 08 Mar 2026 02:01:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 78/471] kernel/time/test_udelay.c:112
 udelay_test_write() warn: potential spectre issue 'lbuf' [w]
Message-ID: <202603080139.kPQTU4kp-lkp@intel.com>
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
:::::: branch date: 31 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20260307 (https://download.01.org/0day-ci/archive/20260308/202603080139.kPQTU4kp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603080139.kPQTU4kp-lkp@intel.com/

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
