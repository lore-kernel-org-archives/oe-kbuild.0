Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA31E13A3EE
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Apr 2024 18:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712859110; cv=none; b=b2LWn/sF2/LNC/zJ4jxyEepuAUySH1NJDnu1zztgNV2Efm3cXLK+jrBwq+CJ4GTu8cqixwALiQH78vxUbLbZoNBpfrf4WIEHbiJ3KeoBK/QGhh14xtrzsmrQiasiqrWU+/AWWf9jJmHXhUwWDhnnqpZvZkssRAwzcHe29pnKRWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712859110; c=relaxed/simple;
	bh=5wXf5Gt3klhmLBUk3cD/9g3WxVFLFLX1oixm96zl8sc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YUPdJniSDKMUUizyS9ZqEiFfs1IwuQAMaKWApKuy7OI74Yq7mSHHNxJScBLnHTaGEIoSVSS50qBUeOh6+PFsskocuhayn4z85mSLsD4ySGIKPp30m0yuoSXubGhw2/uSoKj1BPhTSqaF+sN+b+tIc5IX8LsxwdrhkRIqCtIjwZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ewe9H8Nu; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ewe9H8Nu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712859109; x=1744395109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5wXf5Gt3klhmLBUk3cD/9g3WxVFLFLX1oixm96zl8sc=;
  b=Ewe9H8Nu9URzk8joi7Oh4gVXgOHR0TKjwvFKwTzpXzucJEFeoM6aRL4f
   +xgcKBGf2b7DWjaJwfCi7Fe71BQJ9tfwv4Qhp5UxJNgwIRH668bT4E3S7
   jFo58Qm85+iYJR185Ck66xaCicrYy2OA4l9jm3+RQEsmSMXDSdu0sW+U0
   QaqxXakqt5gtTpOuywGpdfWUsIihMRrg4ngkeebJPEq93s5Po2EX8UGHS
   MjE0MpYgpybYgK3d52Fh2pGKKKW/5EpgTGUbeT6TiC9GFcZly28hqZU3j
   1joYDLgbaeky5iLs9DX3zEveTrkoziEsW6a4fu0g2UtiJQ0f+R6zFbOC8
   Q==;
X-CSE-ConnectionGUID: AUaQBLDgRQ2CzBSm/HAH2Q==
X-CSE-MsgGUID: KaGoRtMgTzec7+hvtv5ohA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8211071"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8211071"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 11:11:23 -0700
X-CSE-ConnectionGUID: TNd2uS0vTzCl3JreHBqF7w==
X-CSE-MsgGUID: bmId7rbCRXCPTCr69W6uWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="21475311"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Apr 2024 11:11:21 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruytK-0008rz-1o;
	Thu, 11 Apr 2024 18:11:18 +0000
Date: Fri, 12 Apr 2024 02:10:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 79/415] kernel/time/test_udelay.c:112
 udelay_test_write() warn: potential spectre issue 'lbuf' [w]
Message-ID: <202404120214.rzmLN0cI-lkp@intel.com>
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
head:   4697e7b2960e76dc525f676f4729d1bf219e0ccd
commit: 99faf2122db10e555ebd87072639ca6ac8e2fb92 [79/415] kernel/time: convert to read/write iterators
:::::: branch date: 2 hours ago
:::::: commit date: 20 hours ago
config: x86_64-randconfig-161-20240411 (https://download.01.org/0day-ci/archive/20240412/202404120214.rzmLN0cI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404120214.rzmLN0cI-lkp@intel.com/

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
