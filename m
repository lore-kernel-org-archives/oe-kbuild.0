Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A8D17BA5
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Apr 2024 20:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712866293; cv=none; b=YrsM/i4vwlwB7t1vFty0di987Wt/QZTjQQaf/Zhqbc7lLMCsEtgylLu3Tm6OHNQKElP74hChkFOYy41EbEe4/U8KOCkXu6rY0FB8HjAR3xa8KmqwYZI6M+K6mGkFegGu6aPCNYspQN5yUUcL1l/owws++H6D1kD2HFV9c6NByKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712866293; c=relaxed/simple;
	bh=UzhR3VBmtnBKm2I6u+Vv3OCYLEEe0nrrUQ8jnjwZ3Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XGCzRLEA6v6FrZOsIBczcfaVWSf2u0cf9qOkRwx4sW96rFCldBKHIyWDFa6PiwELmFDlplX4jHuofYv9W54V/B4BO9WGK5tIMeDSUmK0qpCS9W+eWgH7XXxxssZ30Cr8ixisWU+mL93ZYy+ANR4N1x/wTdp/4hl8ItkD6vX830Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aysjEmd1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aysjEmd1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712866291; x=1744402291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UzhR3VBmtnBKm2I6u+Vv3OCYLEEe0nrrUQ8jnjwZ3Uw=;
  b=aysjEmd1OzDoGMHA5kLbq3xLHezcqeljWq+1ejwWJcjvf2IZDJUTVieL
   lCRjPdnQLT9N757hkvFd/Giw2+ZGGLwS//z73ifyjFLpHXsErLi604A6X
   Leh14A/LJDOBfu4Pzd0H/TSjrfVLLZ2eIOIpTuTop0Cs+yIoGJMnRdMII
   wZz+JFIPjJ352SgJ2gaqM2OA2L3J8lttcmjGirqQ1IBjqPuzoQTHcp0K8
   lvRbSSnhttmMKanEVUZV67Lp6YLeBKkksCYJFbcqRs6L4Cwx59PvaxEtd
   H5jxf04j5a67tO4WZXvgbq0TEV9EGpnzpf+IjYScNneklsYbFqmlunQWL
   g==;
X-CSE-ConnectionGUID: sQbHmSZgRF2xVvaZOESmxw==
X-CSE-MsgGUID: jk01CVQfRdeHVDmk2A3zZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8469965"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8469965"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 13:11:31 -0700
X-CSE-ConnectionGUID: hB36qkxfSRKAT0eVGRleog==
X-CSE-MsgGUID: AAQKINJbSnWaEHG+hS1dqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="21069828"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Apr 2024 13:11:30 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rv0la-0008x9-2x;
	Thu, 11 Apr 2024 20:11:26 +0000
Date: Fri, 12 Apr 2024 04:11:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 83/415] kernel/sched/debug.c:233
 sched_dynamic_write() warn: potential spectre issue 'buf' [w]
Message-ID: <202404120423.lCcgbt5U-lkp@intel.com>
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
commit: 78cbc5818d5b57f53de771c7de9463eefd1b8571 [83/415] sched/debug: convert to read/write iterators
:::::: branch date: 4 hours ago
:::::: commit date: 22 hours ago
config: x86_64-randconfig-161-20240411 (https://download.01.org/0day-ci/archive/20240412/202404120423.lCcgbt5U-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404120423.lCcgbt5U-lkp@intel.com/

smatch warnings:
kernel/sched/debug.c:233 sched_dynamic_write() warn: potential spectre issue 'buf' [w]

vim +/buf +233 kernel/sched/debug.c

1011dcce99f802 Peter Zijlstra 2021-03-25  220  
78cbc5818d5b57 Jens Axboe     2024-04-08  221  static ssize_t sched_dynamic_write(struct kiocb *iocb, struct iov_iter *from)
1011dcce99f802 Peter Zijlstra 2021-03-25  222  {
78cbc5818d5b57 Jens Axboe     2024-04-08  223  	size_t cnt = iov_iter_count(from);
1011dcce99f802 Peter Zijlstra 2021-03-25  224  	char buf[16];
1011dcce99f802 Peter Zijlstra 2021-03-25  225  	int mode;
1011dcce99f802 Peter Zijlstra 2021-03-25  226  
1011dcce99f802 Peter Zijlstra 2021-03-25  227  	if (cnt > 15)
1011dcce99f802 Peter Zijlstra 2021-03-25  228  		cnt = 15;
1011dcce99f802 Peter Zijlstra 2021-03-25  229  
78cbc5818d5b57 Jens Axboe     2024-04-08  230  	if (!copy_from_iter_full(&buf, cnt, from))
1011dcce99f802 Peter Zijlstra 2021-03-25  231  		return -EFAULT;
1011dcce99f802 Peter Zijlstra 2021-03-25  232  
1011dcce99f802 Peter Zijlstra 2021-03-25 @233  	buf[cnt] = 0;
1011dcce99f802 Peter Zijlstra 2021-03-25  234  	mode = sched_dynamic_mode(strstrip(buf));
1011dcce99f802 Peter Zijlstra 2021-03-25  235  	if (mode < 0)
1011dcce99f802 Peter Zijlstra 2021-03-25  236  		return mode;
1011dcce99f802 Peter Zijlstra 2021-03-25  237  
1011dcce99f802 Peter Zijlstra 2021-03-25  238  	sched_dynamic_update(mode);
1011dcce99f802 Peter Zijlstra 2021-03-25  239  
78cbc5818d5b57 Jens Axboe     2024-04-08  240  	iocb->ki_pos += cnt;
1011dcce99f802 Peter Zijlstra 2021-03-25  241  
1011dcce99f802 Peter Zijlstra 2021-03-25  242  	return cnt;
1011dcce99f802 Peter Zijlstra 2021-03-25  243  }
1011dcce99f802 Peter Zijlstra 2021-03-25  244  

:::::: The code at line 233 was first introduced by commit
:::::: 1011dcce99f8026d48fdd7b9cc259e32a8b472be sched,preempt: Move preempt_dynamic to debug.c

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
