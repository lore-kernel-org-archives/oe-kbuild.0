Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC1A125D5
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Sep 2024 02:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726539645; cv=none; b=fd2Uh34lmMBn5h65UFqddukcJaZgQrZlYSCHfHm5zXfmMg2iUE4k6endXWIl0TIs5SfjHlwUywpB9U8IVPuR5dNAPVkrfx+Rx8vX571skt6MHqq6oMEj1ZZZIiSZgkvHQ3Ow80+qYd1l01A6SmAZNBFcF1drMMwUpjNaCblrUIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726539645; c=relaxed/simple;
	bh=aprWGQRipHjO1izFtvAsGeymaO8NT7VSK0buA7D74ho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QzKRQpz/vZIkSX26a0dQVlqawZ1wsA+60lCmxXTXnpAvVMn5JdCJusnjfjoW0KcgxLYZM6io9B5GiD9vQ5abOe1eSK0V8RBHKuJ9Sx0Ba2IqIRWhvgBjc6DthNuOUxhyI1PnQnXbaIZDbavDZLON7jC8XELsDraDB1gicdNF+dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=agQXWw5/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="agQXWw5/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726539644; x=1758075644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aprWGQRipHjO1izFtvAsGeymaO8NT7VSK0buA7D74ho=;
  b=agQXWw5/qpwdOi13A0CSV9t6YYGPR7O/cqFR237GbqtfmryUcf1ZmJy1
   BXqqRcX0KiarZKhwOrHGl4CpGxDSKpEE642yocP+nULs6WaYYZRJv3CAW
   pYzHOojzXUFMaTSevLI0hT4Odw2+tGIds5JLGq2QsBD9IDlHS/xlpybbT
   McaMoFNpDXe9GbgSQkDXCKlqziR7z9Hyu1/TCEzJGlfLlffJxhgDeKugc
   zYg6GWmbRoU6dFzaaB52yhK5pO2dyK7Z7Dc4nNuOvtRe6uEgfgXrulp0+
   H0fe5/EO0xfcNbdMO/WtdzxZYhok/nUzec5Tbh+EkEleFtRAU0at3UlTO
   w==;
X-CSE-ConnectionGUID: 0Mmc46K6THC7x9VHnCFu4Q==
X-CSE-MsgGUID: SwbLg3EyQuiT2PUSnlPCHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25540492"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="25540492"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 19:20:43 -0700
X-CSE-ConnectionGUID: JqQUuumpQvCaj1W4SsfVxQ==
X-CSE-MsgGUID: kQ+DgiqaSHySYuBg7mqpMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="73635395"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Sep 2024 19:20:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqNpY-000AiY-0w;
	Tue, 17 Sep 2024 02:20:40 +0000
Date: Tue, 17 Sep 2024 10:20:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 78/447] kernel/time/test_udelay.c:112
 udelay_test_write() warn: potential spectre issue 'lbuf' [w]
Message-ID: <202409171029.ZzFmRDRd-lkp@intel.com>
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
head:   78e9603229ee010d330a9ca61ef1a62ee7317352
commit: a9e7bae8953c4c96b5b2d37869aab6b86f4b282f [78/447] kernel/time: convert to read/write iterators
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: x86_64-randconfig-161-20240917 (https://download.01.org/0day-ci/archive/20240917/202409171029.ZzFmRDRd-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409171029.ZzFmRDRd-lkp@intel.com/

smatch warnings:
kernel/time/test_udelay.c:112 udelay_test_write() warn: potential spectre issue 'lbuf' [w]

vim +/lbuf +112 kernel/time/test_udelay.c

e704f93af5a083c kernel/time/udelay_test.c David Riley 2014-06-16   98  
a9e7bae8953c4c9 kernel/time/test_udelay.c Jens Axboe  2024-04-08   99  static ssize_t udelay_test_write(struct kiocb *iocb, struct iov_iter *from)
e704f93af5a083c kernel/time/udelay_test.c David Riley 2014-06-16  100  {
a9e7bae8953c4c9 kernel/time/test_udelay.c Jens Axboe  2024-04-08  101  	size_t count = iov_iter_count(from);
e704f93af5a083c kernel/time/udelay_test.c David Riley 2014-06-16  102  	char lbuf[32];
e704f93af5a083c kernel/time/udelay_test.c David Riley 2014-06-16  103  	int ret;
e704f93af5a083c kernel/time/udelay_test.c David Riley 2014-06-16  104  	int usecs;
e704f93af5a083c kernel/time/udelay_test.c David Riley 2014-06-16  105  	int iters;
e704f93af5a083c kernel/time/udelay_test.c David Riley 2014-06-16  106  
e704f93af5a083c kernel/time/udelay_test.c David Riley 2014-06-16  107  	if (count >= sizeof(lbuf))
e704f93af5a083c kernel/time/udelay_test.c David Riley 2014-06-16  108  		return -EINVAL;
e704f93af5a083c kernel/time/udelay_test.c David Riley 2014-06-16  109  
a9e7bae8953c4c9 kernel/time/test_udelay.c Jens Axboe  2024-04-08  110  	if (!copy_from_iter_full(lbuf, count, from))
e704f93af5a083c kernel/time/udelay_test.c David Riley 2014-06-16  111  		return -EFAULT;
e704f93af5a083c kernel/time/udelay_test.c David Riley 2014-06-16 @112  	lbuf[count] = '\0';
e704f93af5a083c kernel/time/udelay_test.c David Riley 2014-06-16  113  
e704f93af5a083c kernel/time/udelay_test.c David Riley 2014-06-16  114  	ret = sscanf(lbuf, "%d %d", &usecs, &iters);
e704f93af5a083c kernel/time/udelay_test.c David Riley 2014-06-16  115  	if (ret < 1)
e704f93af5a083c kernel/time/udelay_test.c David Riley 2014-06-16  116  		return -EINVAL;
e704f93af5a083c kernel/time/udelay_test.c David Riley 2014-06-16  117  	else if (ret < 2)
e704f93af5a083c kernel/time/udelay_test.c David Riley 2014-06-16  118  		iters = DEFAULT_ITERATIONS;
e704f93af5a083c kernel/time/udelay_test.c David Riley 2014-06-16  119  
e704f93af5a083c kernel/time/udelay_test.c David Riley 2014-06-16  120  	mutex_lock(&udelay_test_lock);
e704f93af5a083c kernel/time/udelay_test.c David Riley 2014-06-16  121  	udelay_test_usecs = usecs;
e704f93af5a083c kernel/time/udelay_test.c David Riley 2014-06-16  122  	udelay_test_iterations = iters;
e704f93af5a083c kernel/time/udelay_test.c David Riley 2014-06-16  123  	mutex_unlock(&udelay_test_lock);
e704f93af5a083c kernel/time/udelay_test.c David Riley 2014-06-16  124  
e704f93af5a083c kernel/time/udelay_test.c David Riley 2014-06-16  125  	return count;
e704f93af5a083c kernel/time/udelay_test.c David Riley 2014-06-16  126  }
e704f93af5a083c kernel/time/udelay_test.c David Riley 2014-06-16  127  

:::::: The code at line 112 was first introduced by commit
:::::: e704f93af5a083c07b8f722672d63a1d908daf55 kernel: time: Add udelay_test module to validate udelay

:::::: TO: David Riley <davidriley@chromium.org>
:::::: CC: John Stultz <john.stultz@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
