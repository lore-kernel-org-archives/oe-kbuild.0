Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8DE288C3D
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 19:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765480125; cv=none; b=K+6zdyjFa6rCrFfDcd8wi/A6Bf5bNP+bXly2r+vaYBzsoKTrVhy2dCzD0PP0MgQmFrzHeBlfyGP8ZzWkhDwHv4m8ttuIfx4Qp7gGCCtu0TW5bPYCH7cE77I0fXUQ++coLqGggL0A7zPwFWjouPp7wbSx8XtPq7adD0BIwGL7PGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765480125; c=relaxed/simple;
	bh=UMRgtngrXgrPczRv8mcDDtHCnXzcd2U3HrUeUC4PCeM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fSipRNyQBfQmCey1iQ2sSt8sBqtWPqM8S2dxUFqq68YUQjrF8xQ+lAaOngPmNYfmg+6p3U05xVdUxjp0XdjNx0T8B6BbAuT0kKgtNYvJobtWlF2lw3Qc7KfXeoF+J4hbsCHLmjPDWpTGCQ/JvTIF4IB3Yz2hidf+LhvNm3/KgDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nxt/r0PN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nxt/r0PN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765480123; x=1797016123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UMRgtngrXgrPczRv8mcDDtHCnXzcd2U3HrUeUC4PCeM=;
  b=Nxt/r0PNMMwr4yKYQ8cS+s4arrycP5iam7Swrna94JzeLwhb7VXOHtKI
   Utuhhog4VEKaHpzw+DPuZFuhBiJ3tke+/6vCtAIlV4VnFh+pTUrO/9OYS
   CXjxy7oWDExMnwSRgCvrzpZ0u6D8XldPfjlvxazB7LzKcPIVmyyXaVfun
   U6Yc9+uZZglWDZhpfD8L8iEtz4mi84TSdQ9jfXWSz4SZq51mtN3zco2Lq
   +id9I0h09riu3uPSiMm6ma8+Q7I33MavnXroqh9PVIu0eAUQ07FA3KNQ2
   XNcZElhCBrRXp78/DE1qSFzo5XUlQRubofUJJBQB4WfjtXmU7gEbZHmlL
   w==;
X-CSE-ConnectionGUID: noTFzZLPQayDehdBnC8KpA==
X-CSE-MsgGUID: Z3dnsSb0RlCSJSHvBNCQ4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78093784"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="78093784"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 11:08:43 -0800
X-CSE-ConnectionGUID: I/fI5EHKTkilN8JkRaa1kA==
X-CSE-MsgGUID: /InZWTHCSf6a301YR7ouMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="197695250"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Dec 2025 11:08:42 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTm1n-000000004zp-3mXg;
	Thu, 11 Dec 2025 19:08:39 +0000
Date: Fri, 12 Dec 2025 03:08:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vmlinux.o: warning: objtool: gntdev_copy+0x187: unknown CFA base reg
 -1
Message-ID: <202512120312.LCyew7T7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>

Hi Josh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 0a7fb6f07e3ad497d31ae9a2082d2cacab43d54a objtool: Increase per-function WARN_FUNC() rate limit
date:   9 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-075-20251211 (https://download.01.org/0day-ci/archive/20251212/202512120312.LCyew7T7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120312.LCyew7T7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512120312.LCyew7T7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ftrace_likely_update+0x447: call to __stack_chk_fail() with UACCESS enabled
   vmlinux.o: warning: objtool: gntdev_copy+0x373: stack state mismatch: cfa1=4+96 cfa2=-1+0
   vmlinux.o: warning: objtool: .text.rk806_set_mode_dcdc: unexpected end of section
   vmlinux.o: warning: objtool: .text.nvmet_ctrl_state_show: unexpected end of section
>> vmlinux.o: warning: objtool: gntdev_copy+0x187: unknown CFA base reg -1

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
