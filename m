Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4353AEF3D
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Aug 2026 06:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786947757; cv=none; b=kLaMXie2G/gakiaNPKscdIRvrCS2xVDdW5KTc01gn5Y/kve452O1UjUoT+GNj9DX7b0qlEfzML8plOwNDC8QLsPh+fHWjWo2m6X66ECpVb5iqVlpaL1oJM2jV06xQPeLRFAsILFhsNAHsszFTwOfFKZAq1EjcYcEdYYo2ejqrW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786947757; c=relaxed/simple;
	bh=hLf7jzlIuPyl/xvkB5f7VrFQNTTZxm7J2hdqwxsMYew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mQ1GpRemvrkjsceQSIuX+Nt4ulA7CX+VIqEzxY3llcnrxmHhrxrTJuJ6KQ/yOQWCA3BqaNG3FFz5FDe4haXCM0z+plVYcxoySaWOc2p0/HvIAXqHc7cEvIbxbMbfksa3GezcVvE2Dgf1XubMm0eCZ//fTuvs3st2iiYTLNT1Nkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yf5wxYfK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yf5wxYfK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786947755; x=1818483755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hLf7jzlIuPyl/xvkB5f7VrFQNTTZxm7J2hdqwxsMYew=;
  b=Yf5wxYfKnBPD9YkNBLIhfiiU8p5anIEJPBDo3sP5S7KR7GQkJ2bwRsou
   04itE1oL5U6fcWh26/GTaK6HhVY2kzqLsnk1D+VgMECjYLEIUf+B0EMHU
   siO9kMAafq6T5BFCAbNwHBuUE/Jd2h6Ux77CfcjPN35V0qo3D3Qy8ZlU0
   HnNMNs0QC9b5CnEAw1PdNmowve/DXXdbWNTUUSKUPbQdCPJnS546KTvhK
   Uq5ZYk97KgMLoIaXZl8W0kuZDMdZ/DBncwpypj59jF830pa1+x/EGjnP6
   qeKDxYhulLE2ldOPJQcIUN4k9Qko51FJHHVkyr7576RlPLSH18b9ui8B/
   A==;
X-CSE-ConnectionGUID: 7kGnE2J1T16qmPsAqREmRA==
X-CSE-MsgGUID: 5dHpibb1QWqzpISKIqu4UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="91093278"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="91093278"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 23:22:34 -0700
X-CSE-ConnectionGUID: PQOZ3oE1TVyb9sV+LKpZ1g==
X-CSE-MsgGUID: DkJ5wxpoRGqjlsx3iHnbLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="265441721"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 16 Aug 2026 23:22:34 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvqjr-000000006lF-18Az;
	Mon, 17 Aug 2026 06:22:27 +0000
Date: Mon, 17 Aug 2026 08:21:59 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: syscall: Ensure saved x0 is kept in-sync with
 tracer updates
Message-ID: <202608170808.txxj5kR9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260714143600.23853-1-will@kernel.org>
References: <20260714143600.23853-1-will@kernel.org>
TO: Will Deacon <will@kernel.org>
TO: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Will Deacon <will@kernel.org>
CC: Kees Cook <kees@kernel.org>
CC: Jinjie Ruan <ruanjinjie@huawei.com>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Yiqi Sun <sunyiqixm@gmail.com>
CC: Catalin Marinas <catalin.marinas@arm.com>

Hi Will,

kernel test robot noticed the following build errors:

[auto build test ERROR on linux-review/Yiqi-Sun/arm64-ptrace-use-live-x0-for-seccomp-and-audit-after-ptrace/20260815-210721]

url:    https://github.com/intel-lab-lkp/linux/commits/Will-Deacon/arm64-syscall-Ensure-saved-x0-is-kept-in-sync-with-tracer-updates/20260815-220235
base:   https://github.com/intel-lab-lkp/linux Yiqi-Sun/arm64-ptrace-use-live-x0-for-seccomp-and-audit-after-ptrace/20260815-210721
patch link:    https://lore.kernel.org/r/20260714143600.23853-1-will%40kernel.org
patch subject: [PATCH] arm64: syscall: Ensure saved x0 is kept in-sync with tracer updates
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260817/202608170808.txxj5kR9-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608170808.txxj5kR9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608170808.txxj5kR9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/ptrace.c:2461:13: error: conflicting types for 'update_syscall_orig_x0_after_ptrace'; have 'void(struct pt_regs *)'
    2461 | static void update_syscall_orig_x0_after_ptrace(struct pt_regs *regs)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/ptrace.c:563:13: note: previous definition of 'update_syscall_orig_x0_after_ptrace' with type 'void(struct task_struct *)'
     563 | static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +2461 arch/arm64/kernel/ptrace.c

3157858feff8919 AKASHI Takahiro 2014-04-30  2460  
f579bf33f3c09c9 Will Deacon     2026-07-14 @2461  static void update_syscall_orig_x0_after_ptrace(struct pt_regs *regs)
f579bf33f3c09c9 Will Deacon     2026-07-14  2462  {
f579bf33f3c09c9 Will Deacon     2026-07-14  2463  	/*
f579bf33f3c09c9 Will Deacon     2026-07-14  2464  	 * Keep orig_x0 authoritative so that seccomp (via
f579bf33f3c09c9 Will Deacon     2026-07-14  2465  	 * syscall_get_arguments()), audit and the restart path all see the same
f579bf33f3c09c9 Will Deacon     2026-07-14  2466  	 * first argument the syscall is dispatched with, even if it has been
f579bf33f3c09c9 Will Deacon     2026-07-14  2467  	 * updated by a tracer. Skip this for NO_SYSCALL (set either by the user
f579bf33f3c09c9 Will Deacon     2026-07-14  2468  	 * or the tracer), as regs[0] holds the return value (see the comment in
f579bf33f3c09c9 Will Deacon     2026-07-14  2469  	 * el0_svc_common()) and can be unwound using syscall_rollback().
f579bf33f3c09c9 Will Deacon     2026-07-14  2470  	 * For compat tasks, orig_r0 is provided directly through GPR index 17.
f579bf33f3c09c9 Will Deacon     2026-07-14  2471  	 */
f579bf33f3c09c9 Will Deacon     2026-07-14  2472  	if (!is_compat_task() && regs->syscallno != NO_SYSCALL)
f579bf33f3c09c9 Will Deacon     2026-07-14  2473  		regs->orig_x0 = regs->regs[0];
f579bf33f3c09c9 Will Deacon     2026-07-14  2474  }
f579bf33f3c09c9 Will Deacon     2026-07-14  2475  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
