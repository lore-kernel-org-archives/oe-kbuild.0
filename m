Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4ED17A31C
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Feb 2026 03:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770263540; cv=none; b=BDrB1Qf31MN8RnFwodgCUuBhfhrqB0OMF9R8FG96UpmmRe6SXP6ZGfGEcOCQePB89fobGE5TAgG6G5Rd4K/XJ6qJVbcguXwuoglLCGPaJwNQZG/Awb90i+fwMLOfG+sNzRuhfIjhPz9LYBNbb59fWKaf0JzPq2G8YKlO8Rvb6JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770263540; c=relaxed/simple;
	bh=8bRHgIFKsAU2YCb65ejKiu2LOvWqWO6d849SFD6x/Xc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jetusuypTd1OlfIewbuIX3CwNK+N0y0yuWluU3K0ytWTrjFxwBX4tGPYh9cyn/eeGorB8GiBiZ/abqBW4nf3wQ/+Fq662LQgi2EJaPPJmCF2YRxfzobLVAWMCZkct1ScXCfhixg59seMZjST41xfeH5wrY0xaS4PTgRdfJHmVTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bAXZLbU9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bAXZLbU9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770263539; x=1801799539;
  h=date:from:to:cc:subject:message-id;
  bh=8bRHgIFKsAU2YCb65ejKiu2LOvWqWO6d849SFD6x/Xc=;
  b=bAXZLbU9//3aYCjXdJIFSzvcja1PzY2tE6zAOUGWZgYuL77+Uhw41MMP
   frf/p3YzjEqBEI4RHkAih/JZYZac7mmwKhPz9roErt3xerNHuYDS1KWEs
   Toc6HurKBKaSZLDT/JpGtg1Hoj3eHYMzMB0WhsWtVFzed5Ycq9y0VtgmQ
   0+e+yAEZpZxRj81rK3AQdFDM6CEYnwzMXCTju3i3Cv1xH1pbNzh8qbmxU
   NcmUS12hu8fhpLOHgNOWcJ1vfHzF3ZXAiE3xDrc3BOtgnu0vD3ql8x9tD
   PVzM391UN7fIven/79YUaq7GFoHm7hreqaOYYSZAnL6FMQo+1SQpPtMKn
   A==;
X-CSE-ConnectionGUID: CyROpDbYRPO535SPiI6cyg==
X-CSE-MsgGUID: LjOxTPoWQjqkm5+lyEANdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70652925"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="70652925"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 19:52:19 -0800
X-CSE-ConnectionGUID: ZakNF+ygR/ChS88Vzz0eIQ==
X-CSE-MsgGUID: BY6Jo/MLQU+ctLQZ2Vajgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="241033150"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 04 Feb 2026 19:52:16 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnqPe-000000003yH-0sEq;
	Thu, 05 Feb 2026 03:52:14 +0000
Date: Thu, 05 Feb 2026 04:52:02 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: error: unknown target triple 'unknown'
Message-ID: <202602050432.CWC319L4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Leo Yan <leo.yan@arm.com>
CC: Arnaldo Carvalho de Melo <acme@redhat.com>
CC: Ian Rogers <irogers@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f14faaf3a1fb3b9e4cf2e56269711fb85fba9458
commit: 4772e66cb45e0dd2c3c9ac649532756c523afd1e perf build: Support build with clang
date:   4 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 months ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260205/202602050432.CWC319L4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260205/202602050432.CWC319L4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602050432.CWC319L4-lkp@intel.com/

All errors (new ones prefixed by >>):

   make[1]: -gcc: No such file or directory
   clang: error: no such file or directory: './-'
   clang: warning: /usr/bin/: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: ./: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: /usr/bin: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: tools/perf: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: tools: 'linker' input unused [-Wunused-command-line-argument]
   Illegal option -p
   make[2]: -gcc: No such file or directory
   make[2]: -gcc: No such file or directory
   clang: error: no such file or directory: './-'
   clang: error: no such file or directory: './-'
   clang: warning: /usr/bin/: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: ./: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: /usr/bin: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: tools/perf: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: tools: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: /usr/bin/: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: ./: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: /usr/bin: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: tools/perf: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: tools: 'linker' input unused [-Wunused-command-line-argument]
   Illegal option -p
>> error: unknown target triple 'unknown'
   sh: 1: command: Illegal option -k
   Makefile.config:237: *** Error: -pkg-config needed by libtraceevent is missing on this system, please install it.  Stop.
   make[1]: *** [Makefile.perf:289: sub-make] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
