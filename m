Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB375A867
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Dec 2023 17:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eR2I9zvc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702920071; x=1734456071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QLyRJhXe/iIJ4gg7yyzIGIGmj50R7xf+JDztkfzHHcc=;
  b=eR2I9zvcK+0vTdZfZNp+4CPEvZ48+DliCSLY7rUpI43LhEZ0TrqayF2i
   +PC3nq5x40ISyebe2rPxHiY349NBpjbhdQv8CR5hIwhw0HUMCHumpZzIF
   tHAdr/uKsUcTQWTqlkrBytLwZRmycbIvqQn75AOOX6yrypm6KeXAWwAnB
   516GxcSTr7lSqxR3tfGhTlH0i0n7OUFEWtNiNR0eTtHhudGvlSse9OYUy
   rWZlmcfhwhdu+trLnMc4n8+pW7HH64wgKMI5umXZHnvH7eNvLv9R3foJm
   yGh0gWLsvoPw33J93uIpOoJ+lbgt0nE3GszBQYy3QIQjF4JkceBAw76cc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="394415519"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="394415519"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 09:21:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="866303381"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="866303381"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Dec 2023 09:21:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFHIh-0004N5-1A;
	Mon, 18 Dec 2023 17:21:07 +0000
Date: Tue, 19 Dec 2023 01:20:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mutex.c:(.sched.text+0x14b6): relocation truncated to fit:
 R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
Message-ID: <202312190128.q9FdIpgi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "csky general problem: relocation truncated to fit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ceb6a6f023fd3e8b07761ed900352ef574010bcb
commit: c2679254b9c9980d9045f0f722cf093a2b1f7590 tracing: Make tracepoint lockdep check actually test something
date:   9 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 9 months ago
config: csky-randconfig-r025-20220323 (https://download.01.org/0day-ci/archive/20231219/202312190128.q9FdIpgi-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312190128.q9FdIpgi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312190128.q9FdIpgi-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/locking/mutex.o: in function `__ww_mutex_lock.constprop.0':
>> mutex.c:(.sched.text+0x14b6): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   mutex.c:(.sched.text+0x14be): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   mutex.c:(.sched.text+0x14ce): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   mutex.c:(.sched.text+0x14e0): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   mutex.c:(.sched.text+0x14ee): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   mutex.c:(.sched.text+0x14fc): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   mutex.c:(.sched.text+0x1520): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   mutex.c:(.sched.text+0x1534): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   mutex.c:(.sched.text+0x153c): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   mutex.c:(.sched.text+0x1558): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   mutex.c:(.sched.text+0x1570): additional relocation overflows omitted from the output

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
