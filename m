Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A1C246788
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Oct 2026 05:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791438693; cv=none; b=F3uEr2nG864EqQFp8u07SJrlEK0PC/8OnNgauqO4RMvZ0VgSjY6v6kpP6tY8GegegXP08F4utoWjYlk04xn396DA6yWh9rV3l5jdcoUB0aSHOVdv4YR7ev7b6eUYN22teObSogVGO8rfqgyOszhpLfCzN2hK+u9Oc7K/PRigbf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791438693; c=relaxed/simple;
	bh=rfxUDClQ1eEJRbFNnILQAgpfGR9YflGjTcikXjFTdSQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ByKcPRyuQiA06JAyN2om5V3q31WesBNHr5LQg5gajNKrQZa5bXmTIk+TPDddstRQaEl+3a/BUwyuT1GGtQGt5a9MbTCKLJQGZu/1uet0Fzy3pNuZTmI9v+qvuh6F9sze9Fb47AGyOt2phk8CPw8lXSNRATuqYgVCPwUbGLNdEK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kDMzMgXU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kDMzMgXU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791438692; x=1822974692;
  h=date:from:to:cc:subject:message-id;
  bh=rfxUDClQ1eEJRbFNnILQAgpfGR9YflGjTcikXjFTdSQ=;
  b=kDMzMgXUclZF62BwnVYH/p6wgGePLxD+TEahITU2Y+OmwXfF+6xQBsDj
   z3lBU24YWbWOszSIZ0aaX6FSMx7oqMIkpKgo3rhPM+EHF+RF6ono5eQO8
   1j6PKpXhoo0jWsmIlj4yc3Y2fCLlb8fbRo2OKGonsNDOD3YsgV8agCa+8
   fGfJLSPFII7aUlzslPmOjWXogtf/x2gnhozewowkCUPkXomtUAeqJlKMR
   6S58CC3hgsYPmNSgW7n6C3iQTJPy+3YlymsNjy17mCWOEOrrHxHZWdquu
   ajjH4L+QgkxahyUlJSkOjFn8Ou/OWBBKbhV1F0BxdiJ/sF6MKxnG+enRb
   A==;
X-CSE-ConnectionGUID: EXlF9HZTQ6uxHmG2nGbaLg==
X-CSE-MsgGUID: ZfrIUCICSHuEEAoc9EMhDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="99862"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="99862"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 22:51:24 -0700
X-CSE-ConnectionGUID: crFmAtF5Rdaaac9tz59zdA==
X-CSE-MsgGUID: U0vbvOPhT9C3vipSgpQP0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="1756027"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 07 Oct 2026 22:51:24 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEh2H-000000004t7-2uZE;
	Thu, 08 Oct 2026 05:51:21 +0000
Date: Thu, 08 Oct 2026 07:50:24 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:sched/core 18/25] kernel/dma/mapping.o: warning:
 objtool: dma_alloc_noncontiguous+0x15c: unreachable instruction
Message-ID: <202610080734.A3hjhVfv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Mark Rutland <mark.rutland@arm.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Jinjie Ruan <ruanjinjie@huawei.com>
CC: Shrikanth Hegde <sshegde@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
head:   4a3b51aab6e25244d97936aa65e6d5425adf98e1
commit: 5b9a28eeed37513778ca6b636253aa8dcf39d55f [18/25] sched: dynamic: Remove HAVE_PREEMPT_DYNAMIC_{CALL,KEY}
:::::: branch date: 7 days ago
:::::: commit date: 5 weeks ago
config: loongarch-randconfig-r2105-20261007 (https://download.01.org/0day-ci/archive/20261008/202610080734.A3hjhVfv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610080734.A3hjhVfv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610080734.A3hjhVfv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/dma/mapping.o: warning: objtool: dma_alloc_noncontiguous+0x15c: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
