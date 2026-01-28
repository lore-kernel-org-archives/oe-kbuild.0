Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245AE376460
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Jan 2026 20:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769630984; cv=none; b=VvwEiGrDukmQWHkBrBkqbKTHMDm+tpETi7bzAGe8A37vqN9JnKJtODC7Gv24E4bcfoR5mPidMcTf49v351yrAfZ/ITk/nXBy5yfx66gID7Ss7p0zR/llOLWtzf3c2kpT+tUbRnsz22ijozgCTdeMGL7XRKeHvwP0sbbPZYC5vgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769630984; c=relaxed/simple;
	bh=zPEb3jekhGVOqaAfabwW8e0Z6vEL+IOuI1xbUZi6yIc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eX6bOwgtUa93KvUacGIHyhBeC5iC7UTAy31UGe15qVdqGPVDEC/91NLoWEchxnm6qugReTzx0sovF2oPd5vfn5AU/voF/3KBobsQxHrMwubhgw/IJIjSPNK4MAiHGUOm1tLOYBUj/wqTXvKMEDIelIpmjkINyoEU5V4HoMffHhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b2GmTl6W; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b2GmTl6W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769630982; x=1801166982;
  h=date:from:to:cc:subject:message-id;
  bh=zPEb3jekhGVOqaAfabwW8e0Z6vEL+IOuI1xbUZi6yIc=;
  b=b2GmTl6WZR4dFHjUpMdD1i/IylSKQ3qXDsTPKPi3NfOyD8jKujMsCFle
   xLFdNA7b4OS1RqRjtOs2QZrxEE0OuR/24/7E2hLB5DzL6UQrMpvqQGBsM
   Rvr+MoqdMVakq5y8qstkE4WK/smfqbgfVNvEv0ZtWRkQshuNi7fLScv1P
   ecmG/+2Ti2p0wTs2B1BYlizHR/EUVHpKDBoPRCCJRvPygmosrSmlxhUPv
   omw76afxi8uMvm+ybPd9VjJ5famfdImeounyFP/hAeGKXkl2S94Pw6vus
   oXBgDUPcE/dZf1mC8It14ofV1Z0E7jCymRDczUJQL+b6oDUawgP6xi5r8
   g==;
X-CSE-ConnectionGUID: 0Nd6m5LXR6mbXmPJZQBmQg==
X-CSE-MsgGUID: F3Q2gBtvRP6DdLyKTDtWjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70946069"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70946069"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 12:09:41 -0800
X-CSE-ConnectionGUID: OKcDuFW+QtalgIr2uxguGQ==
X-CSE-MsgGUID: UUV7+4MdSDWmPQ0Zr7+f/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="207495319"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Jan 2026 12:09:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlBr7-00000000alO-1UAB;
	Wed, 28 Jan 2026 20:09:37 +0000
Date: Thu, 29 Jan 2026 04:08:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vmlinux.o: error: objtool: .altinstr_replacement+0x11c8:
 redundant UACCESS disable
Message-ID: <202601290447.1DJ4MbUI-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>

Hi Josh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8dfce8991b95d8625d0a1d2896e42f93b9d7f68d
commit: 36799069b48198e5ce92d99310060c4aecb4b3e3 objtool: Add CONFIG_OBJTOOL_WERROR
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-013-20260127 (https://download.01.org/0day-ci/archive/20260129/202601290447.1DJ4MbUI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601290447.1DJ4MbUI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601290447.1DJ4MbUI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: .altinstr_replacement+0x11c8: redundant UACCESS disable
   vmlinux.o: error: objtool:   pcpu_build_alloc_info+0x1c9: (alt)
   vmlinux.o: error: objtool:   pcpu_build_alloc_info+0x1b1f: (branch)
   vmlinux.o: error: objtool:   pcpu_build_alloc_info+0x1b64: (branch)
   vmlinux.o: error: objtool:   pcpu_build_alloc_info+0x1b0f: (branch)
   vmlinux.o: error: objtool:   pcpu_build_alloc_info+0x16e1: (branch)
   vmlinux.o: error: objtool:   pcpu_build_alloc_info+0x1b2: (branch)
   vmlinux.o: error: objtool:   pcpu_build_alloc_info+0x15a6: (branch)
   vmlinux.o: error: objtool:   pcpu_build_alloc_info+0x16b4: (branch)
   vmlinux.o: error: objtool:   pcpu_build_alloc_info+0x1586: (branch)
   vmlinux.o: error: objtool:   pcpu_build_alloc_info+0x1394: (branch)
   vmlinux.o: error: objtool:   pcpu_build_alloc_info+0x132d: (branch)
   vmlinux.o: error: objtool:   pcpu_build_alloc_info+0x167d: (branch)
   vmlinux.o: error: objtool:   pcpu_build_alloc_info+0x1302: (branch)
   vmlinux.o: error: objtool:   pcpu_build_alloc_info+0x166e: (branch)
   vmlinux.o: error: objtool:   pcpu_build_alloc_info+0x12f6: (branch)
   vmlinux.o: error: objtool:   pcpu_build_alloc_info+0x1625: (branch)
   vmlinux.o: error: objtool:   pcpu_build_alloc_info+0x12e8: (branch)
   vmlinux.o: error: objtool:   pcpu_build_alloc_info+0x1616: (branch)
   vmlinux.o: error: objtool:   pcpu_build_alloc_info+0x12c2: (branch)
   vmlinux.o: error: objtool:   pcpu_build_alloc_info+0x15d7: (branch)
   vmlinux.o: error: objtool:   pcpu_build_alloc_info+0x12ae: (branch)
   vmlinux.o: error: objtool:   pcpu_build_alloc_info+0x15c8: (branch)
   vmlinux.o: error: objtool:   pcpu_build_alloc_info+0x1293: (branch)
   vmlinux.o: error: objtool:   pcpu_build_alloc_info+0x1a0: (branch)
   vmlinux.o: error: objtool:   pcpu_build_alloc_info+0x16b: (branch)
   vmlinux.o: error: objtool:   pcpu_build_alloc_info+0x127: (branch)
   vmlinux.o: error: objtool:   pcpu_build_alloc_info+0x7c: (branch)
   vmlinux.o: error: objtool:   pcpu_build_alloc_info+0x4c: (branch)
   vmlinux.o: error: objtool:   pcpu_build_alloc_info+0x0: <=== (sym)
   vmlinux.o: error: objtool: .text.rk806_set_mode_dcdc: unexpected end of section
   vmlinux.o: error: objtool:   rk806_set_mode_dcdc+0x8c: (branch)
   vmlinux.o: error: objtool:   rk806_set_mode_dcdc+0x36: (branch)
   vmlinux.o: error: objtool:   rk806_set_mode_dcdc+0x0: <=== (sym)
   vmlinux.o: error: objtool: .text.bmi160_setup_irq: unexpected end of section
   vmlinux.o: error: objtool:   bmi160_setup_irq+0x193: (branch)
   vmlinux.o: error: objtool:   bmi160_setup_irq+0x180: (branch)
   vmlinux.o: error: objtool:   bmi160_setup_irq+0x16a: (branch)
   vmlinux.o: error: objtool:   bmi160_setup_irq+0x140: (branch)
   vmlinux.o: error: objtool:   bmi160_setup_irq+0x109: (branch)
   vmlinux.o: error: objtool:   bmi160_setup_irq+0xed: (branch)
   vmlinux.o: error: objtool:   bmi160_setup_irq+0xdc: (branch)
   vmlinux.o: error: objtool:   bmi160_setup_irq+0xb0: (branch)
   vmlinux.o: error: objtool:   bmi160_setup_irq+0x8d: (branch)
   vmlinux.o: error: objtool:   bmi160_setup_irq+0x2b5: (branch)
   vmlinux.o: error: objtool:   bmi160_setup_irq+0x6d: (branch)
   vmlinux.o: error: objtool:   bmi160_setup_irq+0x53: (branch)
   vmlinux.o: error: objtool:   bmi160_setup_irq+0x0: <=== (sym)
   vmlinux.o: error: objtool: 3 warning(s) upgraded to errors
   ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --ibt --mcount --mnop --retpoline --sls --stackval --static-call --uaccess --Werror --backtrace --link vmlinux.o.orig -o vmlinux.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
