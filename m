Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629B21A5B9E
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Mar 2026 07:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773386666; cv=none; b=IavbaNuuPtOXJJ4mtKgKge04IhLPz7Kxun/2Z3qWrEOhMfvf74UHF5DXY1XU2CuBaYdfnLeGqWhaN9+4vTafISZ7fqW93hp366eSLRZ4vh8CdtxlmcEKDeMdb/ZwGVQmwtjHVRVW6SDqW4MMOzwD+2mjoQWybOnzecoYs38lqsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773386666; c=relaxed/simple;
	bh=67hK6U4wVvLyqLZXM76nOm1AreubVnudtSb3nOwynLA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tYcfy66esBlk2NriA7PE2XGRc9Ao7ZRQCbBfytrvc80cTF459k1GisKcE7rWzllcbkrbwX8JP9LCe/nd8JDl0XckR5B4roGj1IBz3WgugGU79QNaBjGrYwaHSGu0a3A+Ga7vEZQw/PUSFec5OeEWcF4bhF4yrXlFKVIm1ggKo1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F0uCQ24a; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F0uCQ24a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773386665; x=1804922665;
  h=date:from:to:cc:subject:message-id;
  bh=67hK6U4wVvLyqLZXM76nOm1AreubVnudtSb3nOwynLA=;
  b=F0uCQ24a4POjX2lBT/XVJa+LqGAL2ptRTzp6Qh29BsO3PTh4pBS0JZOZ
   ps1D2FARDgB3lVsz2IYtTrxFIhnT7W4oI3U+R0y86fpEHPiAQdedrtElI
   ovnFE0Mh1B5bzoNqM4eO3v22oLM2oBHwY230SNVm+S1a3hsnaZfmRD2eg
   Ev1kLigJole3aVVq7bjZANzUEF51KYfOdg/81PUPgT1TeSMkHnT2tdXle
   wH/DJ+EG/ZM+w+yB+9ko8Wivm4eR19zg/tf5rY4UdUZ9Wy/IcaVfQmf4A
   GxEWogtSlNYuv/JQuEvgkJ+EiFQfksl/5TnbjONyfDnmwrS/DHET9WC5Y
   g==;
X-CSE-ConnectionGUID: hvp3kjY8Rv6ABaV3yW6UUA==
X-CSE-MsgGUID: 3wbbggECT96SJMu1aKUgOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85972358"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="85972358"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 00:24:25 -0700
X-CSE-ConnectionGUID: UlApFBhxQfSj0AAsFhaQrA==
X-CSE-MsgGUID: XCkFl2dXR7SY8xO6yFb7CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="220164496"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Mar 2026 00:24:23 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0wse-000000003Zv-0EZd;
	Fri, 13 Mar 2026 07:24:20 +0000
Date: Fri, 13 Mar 2026 15:23:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 424/471] kernel/sched/debug.c:141
 sched_feat_write() warn: potential spectre issue 'buf' [w]
Message-ID: <202603131526.wBA9qa4z-lkp@intel.com>
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
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: openrisc-randconfig-r071-20260307 (https://download.01.org/0day-ci/archive/20260313/202603131526.wBA9qa4z-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603131526.wBA9qa4z-lkp@intel.com/

smatch warnings:
kernel/sched/debug.c:141 sched_feat_write() warn: potential spectre issue 'buf' [w]

vim +/buf +141 kernel/sched/debug.c

d6ca41d7922ce01 Steven Rostedt (Red Hat  2016-02-22  125) 
d6ca41d7922ce01 Steven Rostedt (Red Hat  2016-02-22  126) static ssize_t
dee2a50905cf350 Jens Axboe               2026-03-04  127  sched_feat_write(struct kiocb *iocb, struct iov_iter *from)
d6ca41d7922ce01 Steven Rostedt (Red Hat  2016-02-22  128) {
dee2a50905cf350 Jens Axboe               2026-03-04  129  	size_t cnt = iov_iter_count(from);
d6ca41d7922ce01 Steven Rostedt (Red Hat  2016-02-22  130) 	char buf[64];
d6ca41d7922ce01 Steven Rostedt (Red Hat  2016-02-22  131) 	char *cmp;
8f894bf47dc9e8b Yisheng Xie              2018-05-31  132  	int ret;
d6ca41d7922ce01 Steven Rostedt (Red Hat  2016-02-22  133) 	struct inode *inode;
d6ca41d7922ce01 Steven Rostedt (Red Hat  2016-02-22  134) 
d6ca41d7922ce01 Steven Rostedt (Red Hat  2016-02-22  135) 	if (cnt > 63)
d6ca41d7922ce01 Steven Rostedt (Red Hat  2016-02-22  136) 		cnt = 63;
d6ca41d7922ce01 Steven Rostedt (Red Hat  2016-02-22  137) 
dee2a50905cf350 Jens Axboe               2026-03-04  138  	if (!copy_from_iter_full(buf, cnt, from))
d6ca41d7922ce01 Steven Rostedt (Red Hat  2016-02-22  139) 		return -EFAULT;
d6ca41d7922ce01 Steven Rostedt (Red Hat  2016-02-22  140) 
d6ca41d7922ce01 Steven Rostedt (Red Hat  2016-02-22 @141) 	buf[cnt] = 0;
d6ca41d7922ce01 Steven Rostedt (Red Hat  2016-02-22  142) 	cmp = strstrip(buf);
d6ca41d7922ce01 Steven Rostedt (Red Hat  2016-02-22  143) 
d6ca41d7922ce01 Steven Rostedt (Red Hat  2016-02-22  144) 	/* Ensure the static_key remains in a consistent state */
dee2a50905cf350 Jens Axboe               2026-03-04  145  	inode = file_inode(iocb->ki_filp);
e73e81975f2447e Jiada Wang               2018-07-31  146  	cpus_read_lock();
d6ca41d7922ce01 Steven Rostedt (Red Hat  2016-02-22  147) 	inode_lock(inode);
8f894bf47dc9e8b Yisheng Xie              2018-05-31  148  	ret = sched_feat_set(cmp);
d6ca41d7922ce01 Steven Rostedt (Red Hat  2016-02-22  149) 	inode_unlock(inode);
e73e81975f2447e Jiada Wang               2018-07-31  150  	cpus_read_unlock();
8f894bf47dc9e8b Yisheng Xie              2018-05-31  151  	if (ret < 0)
8f894bf47dc9e8b Yisheng Xie              2018-05-31  152  		return ret;
d6ca41d7922ce01 Steven Rostedt (Red Hat  2016-02-22  153) 
dee2a50905cf350 Jens Axboe               2026-03-04  154  	iocb->ki_pos += cnt;
d6ca41d7922ce01 Steven Rostedt (Red Hat  2016-02-22  155) 
d6ca41d7922ce01 Steven Rostedt (Red Hat  2016-02-22  156) 	return cnt;
d6ca41d7922ce01 Steven Rostedt (Red Hat  2016-02-22  157) }
d6ca41d7922ce01 Steven Rostedt (Red Hat  2016-02-22  158) 

:::::: The code at line 141 was first introduced by commit
:::::: d6ca41d7922ce0110a840ef4f8ec4afdd5a239d3 sched/debug: Move the /sys/kernel/debug/sched_features file setup into debug.c

:::::: TO: Steven Rostedt (Red Hat) <rostedt@goodmis.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
