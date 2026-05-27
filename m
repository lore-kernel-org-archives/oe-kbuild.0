Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636E026E706
	for <oe-kbuild@lists.linux.dev>; Wed, 27 May 2026 07:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779867037; cv=none; b=UF0BUjyTc9B2X7iLnE1W7GCgEU/0bjzwDtpngWpEvdmHeEZ3st1ktWXwAnabbPsiQ9ci4yumXGRp/OwRhlmP/bQ0oVfa7DYU5/iHzeeqwi42ULx2X53KD0cFUFY0nv9wO74hIQwfQNYuKm/5Dg1Jc/4wCU0X4H6eZceLrhqR4+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779867037; c=relaxed/simple;
	bh=S7ruvnVMJ3tYEytSowxsyU6kjMw67WhmYdgtDlzQYKI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YaT6NmvZRhCbcFGigrsTNpMGdEZG+4B4yoGB3lmmHFEHxmQpSynZjkGdG+W2Ovdb4jXTOTNIrUh1z3zqKFFH4tYI832r1u/LWaOOFG8eAi4MI/7Wf5YQp84f18GPiPH5FYKticNBY8FoSd9LWD0J//47VaZRLyuMEp/dcw/jy8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gDhHPi91; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gDhHPi91"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779867036; x=1811403036;
  h=date:from:to:cc:subject:message-id;
  bh=S7ruvnVMJ3tYEytSowxsyU6kjMw67WhmYdgtDlzQYKI=;
  b=gDhHPi91Ii/OoGGf3BscPXArHY7AghXyUen9CCRgwBDUiJFgSibWjJHr
   q1YaqlFH5MfeCD/K1vOJlQX+h7D3hHkKsfzg9yrQLUombFKqtCQUrJ3oI
   PccgR/TLKN+LanX/Lo5TuWaCVDvlbVdJ/jZeEmyX7E2pPy1t7EPvur2gU
   QoWsiS612JfAir6gKoP4AM5wbVMSnDKrcyQk8qJpFNR4IcANIgVtT2p/1
   554GKZe6DfXYn6Sa76GFhVy0YOmp+g1grcPwlpdUuvgJzhveqELZzgLI3
   RNJenvDhZO9bLExsmaGI/d/t6HgPzbuE622A+o16T48w4TYE6br6SLWrm
   Q==;
X-CSE-ConnectionGUID: Phr2S33uTteQbx43C8pjQA==
X-CSE-MsgGUID: evfPdKfkTWOdRzPVqnW+fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="83268941"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="83268941"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 00:30:36 -0700
X-CSE-ConnectionGUID: ZOYfkPU7Qre/XWCZLwJ2cA==
X-CSE-MsgGUID: icE5CKKjR36AHzm1Vs6wDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="266031825"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 May 2026 00:30:34 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wS8im-000000003bU-1p1X;
	Wed, 27 May 2026 07:30:32 +0000
Date: Wed, 27 May 2026 15:29:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: block/genhd.c:150:23-24: WARNING opportunity for max()
Message-ID: <202605271546.UHLAoFdd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Yu Kuai <yukuai3@huawei.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eb3f4b7426cfd2b79d65b7d37155480b32259a11
commit: c007062188d8e402c294117db53a24b2bed2b83f block: fix false warning in bdev_count_inflight_rw()
date:   11 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 months ago
config: m68k-randconfig-r063-20260527 (https://download.01.org/0day-ci/archive/20260527/202605271546.UHLAoFdd-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c007062188d8 ("block: fix false warning in bdev_count_inflight_rw()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202605271546.UHLAoFdd-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> block/genhd.c:150:23-24: WARNING opportunity for max()
   block/genhd.c:151:25-26: WARNING opportunity for max()

vim +150 block/genhd.c

ea18e0f0a63af9 Konstantin Khlebnikov 2020-03-25  127  
f2987c5816bda0 Yu Kuai               2025-05-06  128  static void bdev_count_inflight_rw(struct block_device *part,
6b6c3a97abdebf Yu Kuai               2025-05-06  129  		unsigned int inflight[2], bool mq_driver)
bf0ddaba65ddbb Omar Sandoval         2018-04-26  130  {
c007062188d8e4 Yu Kuai               2025-06-26  131  	int write = 0;
c007062188d8e4 Yu Kuai               2025-06-26  132  	int read = 0;
1226b8dd0e9133 Mikulas Patocka       2018-12-06  133  	int cpu;
1226b8dd0e9133 Mikulas Patocka       2018-12-06  134  
6b6c3a97abdebf Yu Kuai               2025-05-06  135  	if (mq_driver) {
6b6c3a97abdebf Yu Kuai               2025-05-06  136  		blk_mq_in_driver_rw(part, inflight);
c007062188d8e4 Yu Kuai               2025-06-26  137  		return;
6b6c3a97abdebf Yu Kuai               2025-05-06  138  	}
c007062188d8e4 Yu Kuai               2025-06-26  139  
c007062188d8e4 Yu Kuai               2025-06-26  140  	for_each_possible_cpu(cpu) {
c007062188d8e4 Yu Kuai               2025-06-26  141  		read += part_stat_local_read_cpu(part, in_flight[READ], cpu);
c007062188d8e4 Yu Kuai               2025-06-26  142  		write += part_stat_local_read_cpu(part, in_flight[WRITE], cpu);
1226b8dd0e9133 Mikulas Patocka       2018-12-06  143  	}
6b6c3a97abdebf Yu Kuai               2025-05-06  144  
c007062188d8e4 Yu Kuai               2025-06-26  145  	/*
c007062188d8e4 Yu Kuai               2025-06-26  146  	 * While iterating all CPUs, some IOs may be issued from a CPU already
c007062188d8e4 Yu Kuai               2025-06-26  147  	 * traversed and complete on a CPU that has not yet been traversed,
c007062188d8e4 Yu Kuai               2025-06-26  148  	 * causing the inflight number to be negative.
c007062188d8e4 Yu Kuai               2025-06-26  149  	 */
c007062188d8e4 Yu Kuai               2025-06-26 @150  	inflight[READ] = read > 0 ? read : 0;
c007062188d8e4 Yu Kuai               2025-06-26  151  	inflight[WRITE] = write > 0 ? write : 0;
bf0ddaba65ddbb Omar Sandoval         2018-04-26  152  }
bf0ddaba65ddbb Omar Sandoval         2018-04-26  153  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
