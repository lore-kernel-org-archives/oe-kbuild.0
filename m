Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018626;
	b=c74ub9hmHSPhKMu0oVzcnKEf6TzbZoh4KOmhfgiOnQaItj9VjiS2TY+IK87pGFXkPSEm
	 4zTjIonLq/nB+7it8mM02tlkXHt6XRLkGoesm5PVq3EZuC8SlXTlxS/5vflvNq0z9gXko
	 056cU96yrQ4T7KgoIe0IfjdYEeL5vrFvMGLTMbMTaAag+bS87hkVbYovLtc6uvDffgKaa
	 P8/klcad/30lsgZjq/hhKciIYsopFzgjiPwg44ELhz8qgDJL29Q4y4mKmjdvD0cHoOSMe
	 nJK+tzm8M8fwfrESHrI/3W9gK78nurSkNDVHWVLhk/hT2+7+pF9uLntPfluK5+PKZKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018626;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mYZ4A7iBAdelGvyT5r2g/Rig0aTTma/MguYsA6qcnwE=;
	b=XLwSvyLxROxmUhfehuLtuE88gKcca2cFo5/eOTGNHpkLIXSZiFubwlYvx5aTvgdl8Oav
	 sZ23NgWQMNtwZSINr+q/Nzqb64z5hirrOiGa+syU8oD3orUfMrLHJqk33DnkfCKdCivf+
	 +ozrUR8PLk+xOv9VFo1CBNmyvQ5brNYMnWxrBq81BBn4iBCPfASGCfjzFbQiTfuComIFU
	 /+dLeIqZ3sXsp6WHeN9lJTSYK6ZjENYYhobzA5auLDFJ5MHgDKXnkP9NlfKaQDUHki7HL
	 0pq1LYnYvwErF1xVPAf6kUZ9gYpIifeGbbuWPuH7f8HCMRsHHc7SCCQ92kLzHCUa3zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c2i7Bv8N;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FDF606A338
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Nov 2026 16:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8FDF606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c2i7Bv8N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795018626; x=1826554626;
  h=date:from:to:cc:subject:message-id;
  bh=NWaPlzJ62oe6dFRsQgHFtGpv/NpxFeE/wuUPxIV6KvE=;
  b=c2i7Bv8NX65FkrZAinSw+oyqaYUwvMXh6FoaF22mM7mr7kkcQj6ffyKw
   FE0L4khucyocCL+ZCFm7uMa3QT4wrQApKwxl0AcrCXnhisce4wZZtLFHZ
   PL0/XzgH6uknUUXIoGvV7eQZ7rKbBArR17KykqM74GPW6oTh6osJcHYlt
   oejSVsxoKhrZZCGORQkLGZHJLPIAgjFcXdxL4Wm19cFhGvsJfbVVI5YeM
   z9GYgFSfCNcWMBGDkuMCErjfpZ2IqQe0OH7nB8emyI+rOWN8vbOFex/t+
   LefXLkd0vLdHEaNdvnjKD6I83awHFpXgTkGJGbsHMWOZ1l85q8F7j8/4x
   w==;
X-CSE-ConnectionGUID: JzZ+d8HCRT68Z6+duhKCvw==
X-CSE-MsgGUID: rt/7ed7fRgS96aTQuvbKSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3720990"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3720990"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 08:17:05 -0800
X-CSE-ConnectionGUID: WDOwPG+iS2SIooCPDT7EMA==
X-CSE-MsgGUID: xLnAYwraQKqHp8BRdSfZkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10186361"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Nov 2026 08:17:05 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTiLG-000000003Qc-2bFs;
	Wed, 18 Nov 2026 16:17:02 +0000
Date: Wed, 18 Nov 2026 17:16:20 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 5140/8636] WARNING: modpost: vmlinux:
 section mismatch in reference: seq_buf_terminate+0x0 (section: .text) ->
 0xffffffff (section: .init.data)
Message-ID: <20261118171346.FH6VoALE-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kees Cook <kees@kernel.org>
CC: Steven Rostedt <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7cfbf79c66c63e807ea452abf0546e6f6d6833a6
commit: 7b8cd26b6aab8cf147165610d13964f79200a5a7 [5140/8636] seq_buf: Mark a seq_buf overflowed when terminating it loses a byte
:::::: branch date: 17 hours ago
:::::: commit date: 8 days ago
config: mips-randconfig-r2102-20261118 (https://download.01.org/0day-ci/archive/20261118/20261118171346.FH6VoALE-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 51d7f08b16b68285b1a400f413215b69f07a65e3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261118/20261118171346.FH6VoALE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261118171346.FH6VoALE-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x0 (section: .text) -> 0xffffffff (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x4 (section: .text) -> bootup_event_seq (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0xf4 (section: .text) -> 0xffffffff (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0xf8 (section: .text) -> bootup_event_seq (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x18c (section: .text) -> 0xffffffff (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x190 (section: .text) -> bootup_event_seq (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x198 (section: .text) -> 0xffffffff (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x19c (section: .text) -> bootup_event_seq (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x204 (section: .text) -> 0xffffffff (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x208 (section: .text) -> bootup_event_seq (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x240 (section: .text) -> 0xffffffff (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x244 (section: .text) -> bootup_event_seq (section: .init.data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
