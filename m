Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179C0405F7
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Apr 2025 03:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743739132; cv=none; b=qkk/zufr5sFXDGan5IdU3hNmwaRWBdrGZ1hjsL6PQVETYugnocOW1d9N5qQO8OeC3HhfCc+UUQMiQ6nW2FKJ20EhP+7gR9qzeUM3FH3+ZVEpLvjU5gC6ZAY/82JsUShMRYj90gA+viPgairyd9leVIPKDIi6fgkc/J1TYyOkolw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743739132; c=relaxed/simple;
	bh=kPrIBLwNdI5YaVvTqRGbT7KTz0lTF5EMTOTbUFLSfUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uvfj03N++cXc0/f4ER1xGFFby2E5y6yUY3z3YfLhHA680GUhYWRJcNHnoWB/2D+7y+WRgB8cOg83OrnlY1m0BDTG9HZO1wgR5nezuV8BFfjroQiOkXvX8Bop8qDtFHNR/iXLXy+uggaD/DmA27sZL35kSwwVZzOW4Rzi7UakvDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gz1BKCUu; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gz1BKCUu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743739130; x=1775275130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kPrIBLwNdI5YaVvTqRGbT7KTz0lTF5EMTOTbUFLSfUc=;
  b=gz1BKCUuPU3RMzcXyuBe3NXn1ZUqh/bIYAaTzgI5Qj4frvIt6b8Ko5AH
   tVHsCh+V8BVO/efCVlz2VgzvC/L2kUb5gTdqcgbDqMvXAoaXb44z7s7G5
   R8p7v8nlpyxXV36+1YopdzrjU3/KiUHyrYzOnnRSsQr0N7GKSePp5wed7
   vsSXzBEcaQMmtRKKZbkjxx6aQS+BmbSW5KRHNdQLRuz9n5cRW3jhgL6/B
   mETSUfP8fq0FZYUOFa4U/SMr71yaR+aLyMKK/baJes9qXZpAylHPhcSB0
   E2q1JEmUQcSNFYma7ETlpnhGe/iHcasuZov4HOyxc/5oFplnsl0HqAEXf
   Q==;
X-CSE-ConnectionGUID: 7uhQnKIrTMK5npRAKxdPlA==
X-CSE-MsgGUID: RmCXtL8JQhGmuHMIJvO6qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45266891"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="45266891"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 20:58:49 -0700
X-CSE-ConnectionGUID: crSU2n6zSk63iZ3RTJ7gQQ==
X-CSE-MsgGUID: X6btTHfOQkCXpILUP1VlrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="127495377"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Apr 2025 20:58:36 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0YCQ-0000yh-1B;
	Fri, 04 Apr 2025 03:58:34 +0000
Date: Fri, 4 Apr 2025 11:57:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ast-bpf:trylock 6/7] drivers/connector/cn_proc.c:92 send_msg()
 warn: statement has no effect 31
Message-ID: <202504041146.lvvNhYSs-lkp@intel.com>
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
TO: Alexei Starovoitov <ast@kernel.org>
CC: Shakeel Butt <shakeel.butt@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git trylock
head:   ba0c224914b31e80b0b9e310d72f508a639fb465
commit: a77ef21f99e8a7fb857b4ec27fd7ba01f8b2dc7f [6/7] locking/local_lock, mm: Replace localtry_ helpers with local_trylock_t type
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: i386-randconfig-141-20250404 (https://download.01.org/0day-ci/archive/20250404/202504041146.lvvNhYSs-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504041146.lvvNhYSs-lkp@intel.com/

New smatch warnings:
drivers/connector/cn_proc.c:92 send_msg() warn: statement has no effect 31
mm/swapfile.c:1284 folio_alloc_swap() warn: statement has no effect 31
include/linux/radix-tree.h:260 radix_tree_preload_end() warn: statement has no effect 31
include/linux/radix-tree.h:260 radix_tree_preload_end() warn: statement has no effect 31

Old smatch warnings:
drivers/connector/cn_proc.c:114 send_msg() warn: statement has no effect 31
fs/xfs/xfs_mru_cache.c:272 _xfs_mru_cache_reap() warn: can 'mru' even be NULL?

vim +92 drivers/connector/cn_proc.c

2aa1f7a1f47ce8 Anjali Kulkarni 2023-07-19   87  
ab8ed951080e8f Aaron Campbell  2016-06-24   88  static inline void send_msg(struct cn_msg *msg)
9f46080c41d5f3 Matt Helsley    2005-11-07   89  {
743acf351bae1f Anjali Kulkarni 2023-07-19   90  	__u32 filter_data[2];
743acf351bae1f Anjali Kulkarni 2023-07-19   91  
3e92fd7bd2b841 Mike Galbraith  2020-05-27  @92  	local_lock(&local_event.lock);
ab8ed951080e8f Aaron Campbell  2016-06-24   93  
3e92fd7bd2b841 Mike Galbraith  2020-05-27   94  	msg->seq = __this_cpu_inc_return(local_event.count) - 1;
ab8ed951080e8f Aaron Campbell  2016-06-24   95  	((struct proc_event *)msg->data)->cpu = smp_processor_id();
ab8ed951080e8f Aaron Campbell  2016-06-24   96  
ab8ed951080e8f Aaron Campbell  2016-06-24   97  	/*
3e92fd7bd2b841 Mike Galbraith  2020-05-27   98  	 * local_lock() disables preemption during send to ensure the messages
3e92fd7bd2b841 Mike Galbraith  2020-05-27   99  	 * are ordered according to their sequence numbers.
ab8ed951080e8f Aaron Campbell  2016-06-24  100  	 *
ab8ed951080e8f Aaron Campbell  2016-06-24  101  	 * If cn_netlink_send() fails, the data is not sent.
ab8ed951080e8f Aaron Campbell  2016-06-24  102  	 */
743acf351bae1f Anjali Kulkarni 2023-07-19  103  	filter_data[0] = ((struct proc_event *)msg->data)->what;
743acf351bae1f Anjali Kulkarni 2023-07-19  104  	if (filter_data[0] == PROC_EVENT_EXIT) {
743acf351bae1f Anjali Kulkarni 2023-07-19  105  		filter_data[1] =
743acf351bae1f Anjali Kulkarni 2023-07-19  106  		((struct proc_event *)msg->data)->event_data.exit.exit_code;
743acf351bae1f Anjali Kulkarni 2023-07-19  107  	} else {
743acf351bae1f Anjali Kulkarni 2023-07-19  108  		filter_data[1] = 0;
743acf351bae1f Anjali Kulkarni 2023-07-19  109  	}
743acf351bae1f Anjali Kulkarni 2023-07-19  110  
8929f95b2b5877 Keqi Wang       2024-02-09  111  	cn_netlink_send_mult(msg, msg->len, 0, CN_IDX_PROC, GFP_NOWAIT,
8929f95b2b5877 Keqi Wang       2024-02-09  112  			     cn_filter, (void *)filter_data);
ab8ed951080e8f Aaron Campbell  2016-06-24  113  
3e92fd7bd2b841 Mike Galbraith  2020-05-27  114  	local_unlock(&local_event.lock);
9f46080c41d5f3 Matt Helsley    2005-11-07  115  }
9f46080c41d5f3 Matt Helsley    2005-11-07  116  

:::::: The code at line 92 was first introduced by commit
:::::: 3e92fd7bd2b8418b53cb7304855b8b69bedbe2b4 connector/cn_proc: Protect send_msg() with a local lock

:::::: TO: Mike Galbraith <umgwanakikbuti@gmail.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
