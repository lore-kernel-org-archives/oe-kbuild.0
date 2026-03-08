Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2161625
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Mar 2026 01:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772934395; cv=none; b=efLl65P5lGpXQO6Rd6J/zxO9PIX39JRcbV26EEAKvH5opO2MP3H3D4SsYB+D/vAwyZdg5yupWV916v3InT0uwrd2yMdAUQhTBDdMF6Ecddr34nWCxxaXMIrfHHGsEWVb0cqEJ5Iwz5lzF8M/I/y6Mbeun5eXtqamnMr/tdKJFJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772934395; c=relaxed/simple;
	bh=fGbeDP5yRbW9RZ8TMD2TsMVuGCXKW0TyXk791BG70tY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VhmhaQx3mivr+R+qbkAjg2z+ej6L/nBeJnfj2h86SVM7I8QvxeczkmmliTdarxtrivfiswdUvt1At3qZFUR7Pqw3P7N5TZxCZerivilRRMANrJPlU0DhBizQlPJBeSKJOvAhb9UKf9etMwJphJ+RpifEh7QPl22yODIF3sT8ukg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J1bPY8fs; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J1bPY8fs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772934393; x=1804470393;
  h=date:from:to:cc:subject:message-id;
  bh=fGbeDP5yRbW9RZ8TMD2TsMVuGCXKW0TyXk791BG70tY=;
  b=J1bPY8fsm5U8nIiLaGeHR4eCpawYPBYiDJzi9g5RkIhI1SVs7w4SG+eH
   6Tqpq7Pfo3z29t3xNQmueV7hktr7zD8t6xhY5GzJGP23t7nMTVGP3f6iq
   rdETqYBx1MnhgvQYs1qAWsY2RwkQ2qEmAt1pOKvsPV0n1H6x8QesgsYKv
   WGGk91bU/oornJE4YZxQfg7v2RQdhz5j1JdYt0RdTyFs0A3Tyt4aGNdbM
   AKArw0XExsQlAdMulV7wxsE3X1b8fLHwkAyYoQqpHT4Sp+ivQFvPwlBJ3
   Ljp305AVvpi3IbgU9S/qTHarbGQcAemjChw7jgffbiVUOmuniFNArYZee
   w==;
X-CSE-ConnectionGUID: vk5gAqsiRtK7tYN+Ni3lDw==
X-CSE-MsgGUID: 7osq+wuLTZeMIFzhv51gbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="74111094"
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="74111094"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 17:46:32 -0800
X-CSE-ConnectionGUID: evtwY416SPaqW0/JE8qxRg==
X-CSE-MsgGUID: eEsrfzKJQeqH9dcMz1CWlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="219488925"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Mar 2026 17:46:30 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vz3Dw-000000002mt-1mut;
	Sun, 08 Mar 2026 01:46:28 +0000
Date: Sun, 08 Mar 2026 09:45:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 424/471] kernel/sched/debug.c:226
 sched_dynamic_write() warn: potential spectre issue 'buf' [w]
Message-ID: <202603080954.z5HaptDN-lkp@intel.com>
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
commit: dee2a50905cf3505d706c0bdb2648900b643b4d3 [424/471] sched/debug: convert to read/write iterators
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20260307 (https://download.01.org/0day-ci/archive/20260308/202603080954.z5HaptDN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603080954.z5HaptDN-lkp@intel.com/

smatch warnings:
kernel/sched/debug.c:226 sched_dynamic_write() warn: potential spectre issue 'buf' [w]

vim +/buf +226 kernel/sched/debug.c

1011dcce99f802 Peter Zijlstra 2021-03-25  213  
dee2a50905cf35 Jens Axboe     2026-03-04  214  static ssize_t sched_dynamic_write(struct kiocb *iocb, struct iov_iter *from)
1011dcce99f802 Peter Zijlstra 2021-03-25  215  {
dee2a50905cf35 Jens Axboe     2026-03-04  216  	size_t cnt = iov_iter_count(from);
1011dcce99f802 Peter Zijlstra 2021-03-25  217  	char buf[16];
1011dcce99f802 Peter Zijlstra 2021-03-25  218  	int mode;
1011dcce99f802 Peter Zijlstra 2021-03-25  219  
1011dcce99f802 Peter Zijlstra 2021-03-25  220  	if (cnt > 15)
1011dcce99f802 Peter Zijlstra 2021-03-25  221  		cnt = 15;
1011dcce99f802 Peter Zijlstra 2021-03-25  222  
dee2a50905cf35 Jens Axboe     2026-03-04  223  	if (!copy_from_iter_full(buf, cnt, from))
1011dcce99f802 Peter Zijlstra 2021-03-25  224  		return -EFAULT;
1011dcce99f802 Peter Zijlstra 2021-03-25  225  
1011dcce99f802 Peter Zijlstra 2021-03-25 @226  	buf[cnt] = 0;
1011dcce99f802 Peter Zijlstra 2021-03-25  227  	mode = sched_dynamic_mode(strstrip(buf));
1011dcce99f802 Peter Zijlstra 2021-03-25  228  	if (mode < 0)
1011dcce99f802 Peter Zijlstra 2021-03-25  229  		return mode;
1011dcce99f802 Peter Zijlstra 2021-03-25  230  
1011dcce99f802 Peter Zijlstra 2021-03-25  231  	sched_dynamic_update(mode);
1011dcce99f802 Peter Zijlstra 2021-03-25  232  
dee2a50905cf35 Jens Axboe     2026-03-04  233  	iocb->ki_pos += cnt;
1011dcce99f802 Peter Zijlstra 2021-03-25  234  
1011dcce99f802 Peter Zijlstra 2021-03-25  235  	return cnt;
1011dcce99f802 Peter Zijlstra 2021-03-25  236  }
1011dcce99f802 Peter Zijlstra 2021-03-25  237  

:::::: The code at line 226 was first introduced by commit
:::::: 1011dcce99f8026d48fdd7b9cc259e32a8b472be sched,preempt: Move preempt_dynamic to debug.c

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
