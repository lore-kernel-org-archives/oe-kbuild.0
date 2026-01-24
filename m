Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417AF3EBF2C
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 12:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769259556; cv=none; b=Y2kr0nAK7npSEBPDEiG1EPaw0gDTerAgE8F5albwgFdtIxiYxt47LrLbKLFT0DouHEqSrqWfu37NwPdLoXG3gT1KT60jUp1gHFfqrrsjpvUc/eYgbK3g/N+pEtBp0Okq9IkTmsBp+xSP2EyEsm6QEkE/MNpYQMRZNhqgu4xHPow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769259556; c=relaxed/simple;
	bh=weopjTBWALkhnIWA56b0gaqi94zUwjSxevaE5gVIqko=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LYjMYZ3qzeKCL0IALQkQGcx5WApJDWEnBWXaqfXpfQTjaaS0oS7xUn5owQ0DW/Fe0KTC1PyaqBb9n2VJLNizYlb9cSWobIPgqtslxZ2lsycuvBE56EpMY1Uum5XT+ObaKg0ow0yfbBe3tEPbZW4Vei6APbTJQlhkI/G+7is5q/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FYgjX6lj; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FYgjX6lj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769259554; x=1800795554;
  h=date:from:to:cc:subject:message-id;
  bh=weopjTBWALkhnIWA56b0gaqi94zUwjSxevaE5gVIqko=;
  b=FYgjX6lj4+cJdSVRkmBvT05k3E1+7aFCx1kDZBr7+ACuNO4qtGjJXQrL
   7YdgpPokS2XF0jc9K7nVEQ2ZJ1lw/AhP641fgHV5huhH1gMSVH3IxjwiS
   IM5rp4H61WaSa4XH6out6KaZJLUav1LNX+bK2y4/F7Ex316PWiAb+98Mm
   noY1ESenqq0YrIZoZoYZZCjWwUHFLi7O2ezvpLJnFrBGzKflFGjZZ1DzS
   Oje8A7l1bHcxVwqD5Smp48qjDF8DR1ODhSmDlVUJUIGfD6pRtcggy1Mjf
   fIycjwrwT1CwnAyv9y5ypwXXKTLZ18FCMhcD6XSYj0PqnOWcR14qHK2eq
   w==;
X-CSE-ConnectionGUID: VbksFAYzQeyFmptrXth3/Q==
X-CSE-MsgGUID: znwSYcetSraqNKXYBhc9Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="74122109"
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="74122109"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 04:59:13 -0800
X-CSE-ConnectionGUID: jv7n91L4RwGwlqP95LYAUw==
X-CSE-MsgGUID: ixO/gdylRvqGudTU1AH7gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="207505311"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Jan 2026 04:59:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjdEL-00000000VBq-3P97;
	Sat, 24 Jan 2026 12:59:09 +0000
Date: Sat, 24 Jan 2026 20:58:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tglx-devel:timers/clocksource 7/7]
 kernel/time/clocksource.c:318 watchdog_check_skew() error: buffer overflow
 'wd->cpu_ts' 2 <= 7
Message-ID: <202601242056.dsSZRYxd-lkp@intel.com>
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
head:   b0d625cda6d12b60b10a0018c784fe42be4a9604
commit: b0d625cda6d12b60b10a0018c784fe42be4a9604 [7/7] clocksource: Rewrite watchdog code completely
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: x86_64-randconfig-161-20260124 (https://download.01.org/0day-ci/archive/20260124/202601242056.dsSZRYxd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601242056.dsSZRYxd-lkp@intel.com/

smatch warnings:
kernel/time/clocksource.c:318 watchdog_check_skew() error: buffer overflow 'wd->cpu_ts' 2 <= 7

vim +318 kernel/time/clocksource.c

db3a34e17433de Paul E. McKenney 2021-05-27  298  
b0d625cda6d12b Thomas Gleixner  2025-12-20  299  static void watchdog_check_skew(struct watchdog_cpu_data *wd, int index)
fa218f1cce6ba4 Paul E. McKenney 2021-05-27  300  {
b0d625cda6d12b Thomas Gleixner  2025-12-20  301  	u64 prev, now, delta, start = ktime_get_raw_fast_ns();
b0d625cda6d12b Thomas Gleixner  2025-12-20  302  	int local = index, remote = (index + 1) & 0x1;
b0d625cda6d12b Thomas Gleixner  2025-12-20  303  	struct clocksource *cs = wd->cs;
fa218f1cce6ba4 Paul E. McKenney 2021-05-27  304  
b0d625cda6d12b Thomas Gleixner  2025-12-20  305  	/* Set the local timestamp so that the first iteration works correctly */
b0d625cda6d12b Thomas Gleixner  2025-12-20  306  	wd->cpu_ts[local] = cs->read(cs);
fa218f1cce6ba4 Paul E. McKenney 2021-05-27  307  
b0d625cda6d12b Thomas Gleixner  2025-12-20  308  	/* Signal arrival */
b0d625cda6d12b Thomas Gleixner  2025-12-20  309  	atomic_inc(&wd->seq);
fa218f1cce6ba4 Paul E. McKenney 2021-05-27  310  
b0d625cda6d12b Thomas Gleixner  2025-12-20  311  	for (int seq = local + 2; seq < WATCHDOG_REMOTE_MAX_SEQ; seq += 2) {
b0d625cda6d12b Thomas Gleixner  2025-12-20  312  		if (!watchdog_wait_seq(wd, start, seq))
fa218f1cce6ba4 Paul E. McKenney 2021-05-27  313  			return;
fa218f1cce6ba4 Paul E. McKenney 2021-05-27  314  
b0d625cda6d12b Thomas Gleixner  2025-12-20  315  		prev = wd->cpu_ts[remote];
b0d625cda6d12b Thomas Gleixner  2025-12-20  316  		now = cs->read(cs);
b0d625cda6d12b Thomas Gleixner  2025-12-20  317  		delta = (now - prev) & cs->mask;
b0d625cda6d12b Thomas Gleixner  2025-12-20 @318  		wd->cpu_ts[local] = now;
fa218f1cce6ba4 Paul E. McKenney 2021-05-27  319  
b0d625cda6d12b Thomas Gleixner  2025-12-20  320  		if (delta > cs->max_raw_delta) {
b0d625cda6d12b Thomas Gleixner  2025-12-20  321  			watchdog_set_result(wd, WD_CPU_SKEWED);
b0d625cda6d12b Thomas Gleixner  2025-12-20  322  			return;
fa218f1cce6ba4 Paul E. McKenney 2021-05-27  323  		}
fa218f1cce6ba4 Paul E. McKenney 2021-05-27  324  
b0d625cda6d12b Thomas Gleixner  2025-12-20  325  		/* Hand over to the remote CPU */
b0d625cda6d12b Thomas Gleixner  2025-12-20  326  		atomic_inc(&wd->seq);
b0d625cda6d12b Thomas Gleixner  2025-12-20  327  	}
fa218f1cce6ba4 Paul E. McKenney 2021-05-27  328  }
7560c02bdffb7c Paul E. McKenney 2021-05-27  329  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
