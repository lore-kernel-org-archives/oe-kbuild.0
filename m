Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACC43321BF
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Jan 2026 21:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769029338; cv=none; b=J1m4xP6ww1dvAor3N8O/kP8vFJJi4Z9cahmPdWsbEzFskbq+6l/CcYjoaCTXoU+J9txyqsByPB6c8zEjxLSUlWOxenWTTLnLKJEqtdEnlAPntHTa+orI3RU/8o/nBLzBGASG6yhvDEj8m3NaETJ7bPQzn5ty6vWDFiUc3ca255w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769029338; c=relaxed/simple;
	bh=4uPMJ4KltQpfgEoRqtUscI1H7lO/LEcpjSudY+6zR0o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TxkD++a3j0oGVkGnnvWso+0OQBSV++sTq5Rct9M3BqpCAzCW6Mvi4cjYHUTWDXufrj6LonX2cC9cZWDkOyIpAu9AOiqJvyL2NeTS/ldjiMHVkcQ2yucotq7p+0CSwTRkhobA9Q4RBCOVSZNtfHiYpfBUEwpsfmKOrC4X1mBZ0h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G1/q929F; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G1/q929F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769029336; x=1800565336;
  h=date:from:to:cc:subject:message-id;
  bh=4uPMJ4KltQpfgEoRqtUscI1H7lO/LEcpjSudY+6zR0o=;
  b=G1/q929FJdIBiMpazwkmmdwbAqOVoCUh6ZjMu5Q7WCMxQxY9i5bMxI8c
   P0MMbb4vo/LFkZX6fM6tqShzqm0QBLhu7tAWSIeNOLIsQ+KmrksPKTLSP
   aRdk1kLrQnCZox1x/1yLD2RRz5ECwSCjrrYi3ACpyVLcQfteX0Evw/EJ6
   qIa79Ks4ROvxjWL2atcTqTcomktWRbuGbF4hpmGQ+vzt7SzOpVAyBLh0E
   z9kJk6b6vXTAwzTWnMvbzVjx8a1ZhRDTEL9Q/yeyA1L+ClRx2wXxstnf5
   MUijH2D+rNhWRMtF+gASuJJlCdsJd3QnS5palRiAHbQ5dObe7XHDJxa8+
   Q==;
X-CSE-ConnectionGUID: m5z9nij6QfyoQZzm86CQLw==
X-CSE-MsgGUID: HUv/hQ+vTKOdozXaR4OHNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70359315"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="70359315"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 13:02:14 -0800
X-CSE-ConnectionGUID: OLtG6SutS/ayRQPkkCVAOA==
X-CSE-MsgGUID: VUwaZ3cHR7yuFIIOaqL0Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="206979992"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Jan 2026 13:02:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vifL8-00000000S0d-3gTU;
	Wed, 21 Jan 2026 21:02:10 +0000
Date: Thu, 22 Jan 2026 05:01:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tglx-devel:timers/clocksource 6/6]
 kernel/time/clocksource.c:331 __watchdog_check_skew() error: buffer overflow
 'wd->cpu_ts' 2 <= 7
Message-ID: <202601220406.KF4enpoF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/clocksource
head:   b69a88525b5d119e9571d2052242e2c4ca559f36
commit: b69a88525b5d119e9571d2052242e2c4ca559f36 [6/6] clocksource: Rewrite watchdog code completely
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: x86_64-randconfig-161-20260122 (https://download.01.org/0day-ci/archive/20260122/202601220406.KF4enpoF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601220406.KF4enpoF-lkp@intel.com/

smatch warnings:
kernel/time/clocksource.c:331 __watchdog_check_skew() error: buffer overflow 'wd->cpu_ts' 2 <= 7

vim +331 kernel/time/clocksource.c

db3a34e17433de Paul E. McKenney 2021-05-27  310  
b69a88525b5d11 Thomas Gleixner  2025-12-20  311  static void __watchdog_check_skew(struct watchdog_cpu_data *wd, int index)
fa218f1cce6ba4 Paul E. McKenney 2021-05-27  312  {
b69a88525b5d11 Thomas Gleixner  2025-12-20  313  	u64 prev, now, delta, start = ktime_get_raw_fast_ns();
b69a88525b5d11 Thomas Gleixner  2025-12-20  314  	int local = index, remote = (index + 1) & 0x1;
b69a88525b5d11 Thomas Gleixner  2025-12-20  315  	struct clocksource *cs = wd->cs;
fa218f1cce6ba4 Paul E. McKenney 2021-05-27  316  
b69a88525b5d11 Thomas Gleixner  2025-12-20  317  	/* Set the local timestamp so that the first iteration works correctly */
b69a88525b5d11 Thomas Gleixner  2025-12-20  318  	wd->cpu_ts[local] = cs->read(cs);
fa218f1cce6ba4 Paul E. McKenney 2021-05-27  319  
b69a88525b5d11 Thomas Gleixner  2025-12-20  320  	/* Signal arrival */
b69a88525b5d11 Thomas Gleixner  2025-12-20  321  	atomic_inc(&wd->seq);
fa218f1cce6ba4 Paul E. McKenney 2021-05-27  322  
b69a88525b5d11 Thomas Gleixner  2025-12-20  323  	for (int seq = local + 2; seq < WATCHDOG_REMOTE_MAX_SEQ; seq += 2) {
b69a88525b5d11 Thomas Gleixner  2025-12-20  324  		if (!watchdog_wait_seq(wd, start, seq))
fa218f1cce6ba4 Paul E. McKenney 2021-05-27  325  			return;
fa218f1cce6ba4 Paul E. McKenney 2021-05-27  326  
b69a88525b5d11 Thomas Gleixner  2025-12-20  327  		prev = wd->cpu_ts[remote];
b69a88525b5d11 Thomas Gleixner  2025-12-20  328  		now = cs->read(cs);
b69a88525b5d11 Thomas Gleixner  2025-12-20  329  		delta = (now - prev) & cs->mask;
fa218f1cce6ba4 Paul E. McKenney 2021-05-27  330  
b69a88525b5d11 Thomas Gleixner  2025-12-20 @331  		wd->cpu_ts[local] = now;
b69a88525b5d11 Thomas Gleixner  2025-12-20  332  		if (delta > cs->max_raw_delta) {
b69a88525b5d11 Thomas Gleixner  2025-12-20  333  			watchdog_set_result(wd, WD_CPU_SKEWED);
b69a88525b5d11 Thomas Gleixner  2025-12-20  334  			return;
fa218f1cce6ba4 Paul E. McKenney 2021-05-27  335  		}
fa218f1cce6ba4 Paul E. McKenney 2021-05-27  336  
b69a88525b5d11 Thomas Gleixner  2025-12-20  337  		/* Hand over to the remote CPU */
b69a88525b5d11 Thomas Gleixner  2025-12-20  338  		atomic_inc(&wd->seq);
b69a88525b5d11 Thomas Gleixner  2025-12-20  339  	}
fa218f1cce6ba4 Paul E. McKenney 2021-05-27  340  }
7560c02bdffb7c Paul E. McKenney 2021-05-27  341  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
