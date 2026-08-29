Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA64E1F12FB
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Aug 2026 00:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787963912; cv=none; b=pSDYLaFZdmxLZfg5bPbeb5JOjf4iN7Uesho+Jh5JpCL2PHBH13K7Pu6KPYSUY2i0gliGkfKKs7cLtX+mCsjhYVgmTl5rxniVHL1DsmpebyS77BTVRfObq1qZcscmB2Y7n3VuRbqT35rO7OxEd5PL7GveE6fEehlkFqrxG+FEMuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787963912; c=relaxed/simple;
	bh=4i4QXnNCH8zssZz0n/I2Rg1jrD49xXC34ReF/tQSkf8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R2rf9iJMWzYyjpz5LBOH7suUQU20AA2z80YGU1vwqngYu4OJ8OWGu7JuNBqXdaRiT8mTXaDsGYKXqjyhDpwz7LbN2+WSKSL3DTo/Fm4b6dfS1Rf2Vu8kc3VP+3hW7N/1cBrBrgrWzPGI+cbvR3qyFKKugANUw0l86YOy7Z0CmHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jy3DRo3G; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jy3DRo3G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787963910; x=1819499910;
  h=date:from:to:cc:subject:message-id;
  bh=4i4QXnNCH8zssZz0n/I2Rg1jrD49xXC34ReF/tQSkf8=;
  b=jy3DRo3Gr32ZOkdRBo3lzodQCjMS33ZhpurSd5lG1jd4bl8Fk/cmU5Uk
   7HFgNud6rEpBGCCehLK/oZXlwkDIQq0RZYOkFezFPDQ89NJ8IQBWieEoy
   bUHvkUPEQQik0b78oRwL+VqKANbHrAeDbpcutE2osiePrpV/J55KMxKG6
   Y8vbs+sEGXQt2ucPQUe3UrIjnpfO3EhOBTbqrAMf9AjzN2dUwYIphiqkT
   ccgw95VOR9IpbiWjjPbx+Nca71a13aCidbWgDxdCyq7gNuukb7uRBfld7
   lNX4AC7SMk8TbS/LFBX0uNtrxUFY8UTnePqqY80JuPRtWlLNt/1L5joxn
   w==;
X-CSE-ConnectionGUID: L8RySGo5TTGj2Pb8poVrhg==
X-CSE-MsgGUID: kGP0aFi9R3SWyPWKOuM+4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="99072130"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="99072130"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 17:38:30 -0700
X-CSE-ConnectionGUID: tGX1rakUS3Oe04r4ysFlPA==
X-CSE-MsgGUID: ytN9OGygRsWC2IWJvtjSkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="267750579"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Aug 2026 17:38:29 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x075W-00000000CAw-3HUb;
	Sat, 29 Aug 2026 00:38:26 +0000
Date: Sat, 29 Aug 2026 08:37:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/rseq_entry.h:880:3: error: call to undeclared
 function 'rseq_clear_one_shot_events'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202608290830.9A528I8Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/odion-efficios-com/rseq-uapi-add-rseq-operation-definitions/20260828-113339, commit: b48f8aaf42196bb53259f19916fd2afcd82ac10c"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Olivier Dion <odion@efficios.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/odion-efficios-com/rseq-uapi-add-rseq-operation-definitions/20260828-113339
head:   6442a4dd9f55ba8a0f39522b330200e1b8548bd5
commit: b48f8aaf42196bb53259f19916fd2afcd82ac10c rseq: apply operations on exit to user space
date:   9 hours ago
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260829/202608290830.9A528I8Q-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260829/202608290830.9A528I8Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608290830.9A528I8Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rseq.c:78:
>> include/linux/rseq_entry.h:880:3: error: call to undeclared function 'rseq_clear_one_shot_events'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     880 |                 rseq_clear_one_shot_events(ev);
         |                 ^
   include/linux/rseq_entry.h:897:2: error: call to undeclared function 'rseq_clear_one_shot_events'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     897 |         rseq_clear_one_shot_events(ev);
         |         ^
   2 errors generated.


vim +/rseq_clear_one_shot_events +880 include/linux/rseq_entry.h

05b44aef709cae5 Thomas Gleixner 2025-10-27  870  
7a5201ea1907534 Thomas Gleixner 2025-10-27  871  static __always_inline void rseq_syscall_exit_to_user_mode(void)
7a5201ea1907534 Thomas Gleixner 2025-10-27  872  {
7a5201ea1907534 Thomas Gleixner 2025-10-27  873  	struct rseq_event *ev = &current->rseq.event;
7a5201ea1907534 Thomas Gleixner 2025-10-27  874  
7a5201ea1907534 Thomas Gleixner 2025-10-27  875  	rseq_stat_inc(rseq_stats.exit);
7a5201ea1907534 Thomas Gleixner 2025-10-27  876  
7a5201ea1907534 Thomas Gleixner 2025-10-27  877  	/* Needed to remove the store for the !lockdep case */
7a5201ea1907534 Thomas Gleixner 2025-10-27  878  	if (IS_ENABLED(CONFIG_LOCKDEP)) {
7a5201ea1907534 Thomas Gleixner 2025-10-27  879  		WARN_ON_ONCE(ev->sched_switch);
b48f8aaf42196bb Olivier Dion    2026-08-28 @880  		rseq_clear_one_shot_events(ev);
7a5201ea1907534 Thomas Gleixner 2025-10-27  881  	}
7a5201ea1907534 Thomas Gleixner 2025-10-27  882  }
7a5201ea1907534 Thomas Gleixner 2025-10-27  883  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
