Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8C023AE62
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Aug 2026 16:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786896084; cv=none; b=JOs855nKftwJj5gU1nXk9E8LydcMJ2dqVa+VUU0KBMT8tmZ5cvZZDu5enPCF3hqLJ0iEvirn/q0O1sWN8qwXz/b5EbbVYqnTCmUjVjra483gBHwOxMHJuf+DlTu6p/MVOjntfXl5zvjHsuWE7U/Oo9O1gihYbyBdRY91Ttoczus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786896084; c=relaxed/simple;
	bh=6qvYvC/ZGtZXEPbfCp3YMukM8H0maL+wJhaGnvlZYDY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ui5UlAER/FPfRRs9jNKDEdqPx4xw1iq1GGDMZFi/1+GS2u+wl8hYaTJtaZ8GplSzbnvOcGITryE4mPcAdjmWHx5s1m4mggF1Ay9phoLcK/avyRPrm4mNbr0P5syjLEdnJ0hcusWn9P3i3iweuaDxMTAmyMLYkCblMOLuGwB/qCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S2+kUKQK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S2+kUKQK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786896082; x=1818432082;
  h=date:from:to:cc:subject:message-id;
  bh=6qvYvC/ZGtZXEPbfCp3YMukM8H0maL+wJhaGnvlZYDY=;
  b=S2+kUKQKlwoOuGqd5Gzb5H6BEUb8wPFA4UX5heHraiDvw7XQslxhp54z
   sKm/8/WZzjukGExEhTIxaDaCxjzyzzxxS7MpVw1mXmHnLCMymXIdJtxgV
   0m2Giw+9LxabSvlZ37kHsZE+NyWHZyokPXC5WXZCGq5sWmyPw3UK8vBDt
   kWgzusn7YywuwG0NJKLAriCTQeMngpL9eGcdRpxTXbMhQzfz/uh/d3iFA
   MW8yHFE+S9XUQgRLteEI6SYfBIiM9lbBd5DorKZygyMyRiSQQVJkJtwaj
   F0l5h9jmJA4WjKFVGf0I8RmIa78Bp/74E+xofotp+PUDkBhnCnu4rBhkt
   A==;
X-CSE-ConnectionGUID: A+1QFsndQs+MVdZatJw74w==
X-CSE-MsgGUID: +nLPO+uFSRWMRZfRCycLyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87245716"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="87245716"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 09:01:21 -0700
X-CSE-ConnectionGUID: Zee5e5SYQLuT4bEcZu2RGQ==
X-CSE-MsgGUID: wdhEQ47rQ8OEOhqYQCu4Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="269892107"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 16 Aug 2026 09:01:20 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvdIU-000000006bx-3nrh;
	Sun, 16 Aug 2026 16:01:18 +0000
Date: Sun, 16 Aug 2026 18:01:04 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ./include/linux/sched/signal.h:83:28: error: field
 'dumpable' has incomplete type
Message-ID: <202608161756.9RDdh6kA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Eric W. Biederman" <ebiederm@xmission.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Eric-W-Biederman/signal-Generalize-posixtimer_queue_sigqueue-into-enqueue_signal/20260815-092530
head:   abc0c99c9e0b38872512681cc481b9b3e90b46ca
commit: 4ac29929e23ac8ad0a07a62755058da989a62f5f signal: Use the thread killing in get_signal for coredumps
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260816/202608161756.9RDdh6kA-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608161756.9RDdh6kA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608161756.9RDdh6kA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./include/linux/ptrace.h:7,
                    from ./include/linux/audit.h:13,
                    from kernel/capability.c:13:
>> ./include/linux/sched/signal.h:83:28: error: field 'dumpable' has incomplete type
      83 |         enum task_dumpable dumpable;
         |                            ^~~~~~~~


vim +/dumpable +83 ./include/linux/sched/signal.h

0258b5fd7c7124 Eric W. Biederman 2021-09-22  80  
0258b5fd7c7124 Eric W. Biederman 2021-09-22  81  struct core_state {
0258b5fd7c7124 Eric W. Biederman 2021-09-22  82  	atomic_t nr_threads;
4ac29929e23ac8 Eric W. Biederman 2026-07-03 @83  	enum task_dumpable dumpable;
0258b5fd7c7124 Eric W. Biederman 2021-09-22  84  	struct core_thread dumper;
0258b5fd7c7124 Eric W. Biederman 2021-09-22  85  	struct completion startup;
0258b5fd7c7124 Eric W. Biederman 2021-09-22  86  };
0258b5fd7c7124 Eric W. Biederman 2021-09-22  87  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
