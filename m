Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8719878F29
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Apr 2026 14:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775832410; cv=none; b=sivTK+ErEEMtgf5BjLmhgPIpgh5Q5Iu/No1MlJriI0wfM2p/jzTeLrRYtsXA4Z4BHAcJ6HKLzcKI8knRiwOnQfwmd/pmfqrt6DYjsJtYFqtVf53hEh0F1OciPYFZN2ET3pFTFepWndtH8swxdgRvZ6clrKrWWrzoDHOO5kYMACg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775832410; c=relaxed/simple;
	bh=k1aJ0XNoxMemUpRwo1h0jNkKe0q8SgQX0wZnRtfgFR8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IZ0qFi4XoVynoHmCBowtp80Mut8DQ1GpEbH16ZVaAuIKDVrwdWs/UNerIawhNmsIS0xOSoF/Vs+t9SL9qt/haVALXurWsRgPds4G7VK3Bk9WC2zl/8sTPfaZTDZNh++AKp0nA3KP3+vwzK78LJ3Dx4ofzI1NarhgfLADruaNSmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZO6Fbmf7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZO6Fbmf7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775832408; x=1807368408;
  h=date:from:to:cc:subject:message-id;
  bh=k1aJ0XNoxMemUpRwo1h0jNkKe0q8SgQX0wZnRtfgFR8=;
  b=ZO6Fbmf7a1rYCYdKCkt13cZLDJeqn2+fi3zQwzSLUTgW5NVCg2bSPp+F
   O2opnOgkl2+nwnjAD9dMfeLhzH/U/7/6+rRY7bwU/s52k5BX+GgsejgFg
   HxtEzCF05nNw1ESD5Ol1Tr02E2BecYCO6cSXtj5fyoosnpawnbtCpCe5g
   nAGirQ4hEE9SUB1MOndOTxs3mpsWqG9nXw9rwOqypabtnXqeWx3gcDh8z
   cCULZeYRPg4eu+DrsJ38R1QKq7GvUtHDinX+tycCsKUJ85dPZGdYIsh/A
   A20kA/c0bEYg7TBT+wQFqZikkllDdF8gIEpz5KdTRio0eAtUGQLvqEvb6
   g==;
X-CSE-ConnectionGUID: G2sWTCZBQ0i1ONtzqhe40w==
X-CSE-MsgGUID: WsTI800HRe64DSYrLcEQ1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87549639"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="87549639"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 07:46:48 -0700
X-CSE-ConnectionGUID: v1P0LqlBTqmx6wIvL8hGdg==
X-CSE-MsgGUID: 868S9QhrSTmihxQ0klXz3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="226381140"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Apr 2026 07:46:47 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBD88-000000003pt-3mvV;
	Fri, 10 Apr 2026 14:46:44 +0000
Date: Fri, 10 Apr 2026 22:46:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bvanassche:thread-safety 89/94]
 drivers/block/sunvdc.c:1124:2: warning: releasing spinlock 'port->vio.lock'
 that was not held
Message-ID: <202604102249.9uYKbva4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Bart Van Assche <bvanassche@acm.org>

tree:   https://github.com/bvanassche/linux thread-safety
head:   c7cad077ed44c1b494c41ee8f1b368e4f0f61c59
commit: 5266915d6dffa5b63bd017892258762fcde34657 [89/94] block: Enable lock context analysis for all block drivers
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260410/202604102249.9uYKbva4-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project ae825cb8cea7f3ac8e5e4096f22713845cf5e501)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604102249.9uYKbva4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604102249.9uYKbva4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/sunvdc.c:1124:2: warning: releasing spinlock 'port->vio.lock' that was not held [-Wthread-safety-analysis]
    1124 |         spin_unlock_irq(&port->vio.lock);
         |         ^
>> drivers/block/sunvdc.c:1133:1: warning: spinlock 'port->vio.lock' is still held at the end of function [-Wthread-safety-analysis]
    1133 | }
         | ^
   drivers/block/sunvdc.c:1129:2: note: spinlock acquired here
    1129 |         spin_lock_irq(&port->vio.lock);
         |         ^
   2 warnings generated.


vim +1124 drivers/block/sunvdc.c

76e74bbe0a38c6 Dwight Engen      2014-12-11  1113  
76e74bbe0a38c6 Dwight Engen      2014-12-11  1114  static void vdc_queue_drain(struct vdc_port *port)
76e74bbe0a38c6 Dwight Engen      2014-12-11  1115  {
fa182a1fa97dff Jens Axboe        2018-10-15  1116  	struct request_queue *q = port->disk->queue;
1e1a9cecfab3f2 Christoph Hellwig 2025-01-31  1117  	unsigned int memflags;
fa182a1fa97dff Jens Axboe        2018-10-15  1118  
fa182a1fa97dff Jens Axboe        2018-10-15  1119  	/*
fa182a1fa97dff Jens Axboe        2018-10-15  1120  	 * Mark the queue as draining, then freeze/quiesce to ensure
fa182a1fa97dff Jens Axboe        2018-10-15  1121  	 * that all existing requests are seen in ->queue_rq() and killed
fa182a1fa97dff Jens Axboe        2018-10-15  1122  	 */
fa182a1fa97dff Jens Axboe        2018-10-15  1123  	port->drain = 1;
fa182a1fa97dff Jens Axboe        2018-10-15 @1124  	spin_unlock_irq(&port->vio.lock);
76e74bbe0a38c6 Dwight Engen      2014-12-11  1125  
1e1a9cecfab3f2 Christoph Hellwig 2025-01-31  1126  	memflags = blk_mq_freeze_queue(q);
fa182a1fa97dff Jens Axboe        2018-10-15  1127  	blk_mq_quiesce_queue(q);
fa182a1fa97dff Jens Axboe        2018-10-15  1128  
fa182a1fa97dff Jens Axboe        2018-10-15  1129  	spin_lock_irq(&port->vio.lock);
fa182a1fa97dff Jens Axboe        2018-10-15  1130  	port->drain = 0;
64b48ec36dbed5 Stephen Rothwell  2025-02-03  1131  	blk_mq_unquiesce_queue(q);
64b48ec36dbed5 Stephen Rothwell  2025-02-03  1132  	blk_mq_unfreeze_queue(q, memflags);
76e74bbe0a38c6 Dwight Engen      2014-12-11 @1133  }
76e74bbe0a38c6 Dwight Engen      2014-12-11  1134  

:::::: The code at line 1124 was first introduced by commit
:::::: fa182a1fa97dff56cda742f22d17d666420cd27f sunvdc: convert to blk-mq

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
