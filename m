Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71863171088
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Sep 2024 03:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726975697; cv=none; b=ekPAdgBwoK4dsOB2nr70RMKwG3/uv7rFlGuAOxTecqSOFF9QiHU34XDwtYwT6jUTdTOHT9FdQ6jK8VhMQzA2EwNbzglFOO9Fk6mp0SFCIjnHaKIbTb+EbVBDDpGtKQby1FmFS4nsK0Dp2lYGO0TL2mI6DqhF58bh5G1+pU6ACu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726975697; c=relaxed/simple;
	bh=zRjHJGSL4aowBRC6NtpzE+zqF2i2VX9IbBGnCy915eM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YmghN5Sblu8wxGqCgQHnMmaB4JZW9W/Cj9evfDjlztwc3p3A1Wl+2kTCtZd1LeES0mwNxrFoHvZCLugS1jcFSSzlJ67vEIbKjazmmM9mRDA22SSeUOlKzVFguulCCyYXxO/Tp2q1nYNMSbKFOyVge6Wv7Y/qVja5Pm3kJZ13Lvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H9z7knTE; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H9z7knTE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726975695; x=1758511695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zRjHJGSL4aowBRC6NtpzE+zqF2i2VX9IbBGnCy915eM=;
  b=H9z7knTEjtY3ny3enVnxETzgJ3exms9nEAZol6jBHLmKDO7fNJXyJtEJ
   tZ4IZASyGQvXnHJyzeEvppGtpwxzgmhFNIj1rYfb8G9NzNocUBOPKgwJv
   4+bo85xLtPGJ4PVshm4tU0d1WOqpGxODEf7QZUVDrF7V8OPvXmbcVP29p
   p1Z59DPZEVflPpt/5vr3lzSwxim7BHTXsoQdqdkmmrn5GxGp88Hs9nApE
   KlUxaaF3Pvd0rGZ9byO457vbgwvEa5n97wM1+8Vyye+uWXpEj114uiuAG
   2pjfBXhMh4raDAUttQ8lKZ4qdz6mM+YM3sHSOZy9sRNq8Tuh9KMRDUoMD
   w==;
X-CSE-ConnectionGUID: sJHC/3AZT/mfTplNSYz3YQ==
X-CSE-MsgGUID: K77J1OwmRA2RrreBkMg2MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="29840784"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="29840784"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 20:28:15 -0700
X-CSE-ConnectionGUID: mppOiuW9TiiFJ8zcBHsAmQ==
X-CSE-MsgGUID: x5tozDo+RBextNM1HJvVqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="70747362"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Sep 2024 20:28:14 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssDGd-000Fzm-0p;
	Sun, 22 Sep 2024 03:28:11 +0000
Date: Sun, 22 Sep 2024 11:27:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 73/448] kernel/kcsan/debugfs.c:232
 debugfs_write() warn: potential spectre issue 'kbuf' [w]
Message-ID: <202409221118.qBB4FE7u-lkp@intel.com>
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
head:   4eb81ae46886ce90863b6f10c4fe8cd45c6719cf
commit: 2d8f2a91db9233d319f186538c3b0b3c7722c6bd [73/448] kcsan: convert to read/write iterators
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240922 (https://download.01.org/0day-ci/archive/20240922/202409221118.qBB4FE7u-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409221118.qBB4FE7u-lkp@intel.com/

smatch warnings:
kernel/kcsan/debugfs.c:232 debugfs_write() warn: potential spectre issue 'kbuf' [w]

vim +/kbuf +232 kernel/kcsan/debugfs.c

dfd402a4c4baae Marco Elver   2019-11-14  222  
2d8f2a91db9233 Jens Axboe    2024-04-08  223  static ssize_t debugfs_write(struct kiocb *iocb, struct iov_iter *from)
dfd402a4c4baae Marco Elver   2019-11-14  224  {
dfd402a4c4baae Marco Elver   2019-11-14  225  	char kbuf[KSYM_NAME_LEN];
dfd402a4c4baae Marco Elver   2019-11-14  226  	char *arg;
2d8f2a91db9233 Jens Axboe    2024-04-08  227  	size_t count = iov_iter_count(from);
43d631bf06ec96 Thorsten Blum 2024-06-24  228  	const size_t read_len = min(count, sizeof(kbuf) - 1);
dfd402a4c4baae Marco Elver   2019-11-14  229  
2d8f2a91db9233 Jens Axboe    2024-04-08  230  	if (!copy_from_iter_full(kbuf, read_len, from))
dfd402a4c4baae Marco Elver   2019-11-14  231  		return -EFAULT;
dfd402a4c4baae Marco Elver   2019-11-14 @232  	kbuf[read_len] = '\0';
dfd402a4c4baae Marco Elver   2019-11-14  233  	arg = strstrip(kbuf);
dfd402a4c4baae Marco Elver   2019-11-14  234  
dfd402a4c4baae Marco Elver   2019-11-14  235  	if (!strcmp(arg, "on")) {
dfd402a4c4baae Marco Elver   2019-11-14  236  		WRITE_ONCE(kcsan_enabled, true);
dfd402a4c4baae Marco Elver   2019-11-14  237  	} else if (!strcmp(arg, "off")) {
dfd402a4c4baae Marco Elver   2019-11-14  238  		WRITE_ONCE(kcsan_enabled, false);
a4e74fa5f0d3e2 Marco Elver   2020-07-31  239  	} else if (str_has_prefix(arg, "microbench=")) {
dfd402a4c4baae Marco Elver   2019-11-14  240  		unsigned long iters;
dfd402a4c4baae Marco Elver   2019-11-14  241  
a4e74fa5f0d3e2 Marco Elver   2020-07-31  242  		if (kstrtoul(&arg[strlen("microbench=")], 0, &iters))
dfd402a4c4baae Marco Elver   2019-11-14  243  			return -EINVAL;
dfd402a4c4baae Marco Elver   2019-11-14  244  		microbenchmark(iters);
dfd402a4c4baae Marco Elver   2019-11-14  245  	} else if (!strcmp(arg, "whitelist")) {
dfd402a4c4baae Marco Elver   2019-11-14  246  		set_report_filterlist_whitelist(true);
dfd402a4c4baae Marco Elver   2019-11-14  247  	} else if (!strcmp(arg, "blacklist")) {
dfd402a4c4baae Marco Elver   2019-11-14  248  		set_report_filterlist_whitelist(false);
dfd402a4c4baae Marco Elver   2019-11-14  249  	} else if (arg[0] == '!') {
dfd402a4c4baae Marco Elver   2019-11-14  250  		ssize_t ret = insert_report_filterlist(&arg[1]);
dfd402a4c4baae Marco Elver   2019-11-14  251  
dfd402a4c4baae Marco Elver   2019-11-14  252  		if (ret < 0)
dfd402a4c4baae Marco Elver   2019-11-14  253  			return ret;
dfd402a4c4baae Marco Elver   2019-11-14  254  	} else {
dfd402a4c4baae Marco Elver   2019-11-14  255  		return -EINVAL;
dfd402a4c4baae Marco Elver   2019-11-14  256  	}
dfd402a4c4baae Marco Elver   2019-11-14  257  
dfd402a4c4baae Marco Elver   2019-11-14  258  	return count;
dfd402a4c4baae Marco Elver   2019-11-14  259  }
dfd402a4c4baae Marco Elver   2019-11-14  260  

:::::: The code at line 232 was first introduced by commit
:::::: dfd402a4c4baae42398ce9180ff424d589b8bffc kcsan: Add Kernel Concurrency Sanitizer infrastructure

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
