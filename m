Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861988;
	b=gK6OTXU7M4ZYCPE5PntJXgf7+ihrsY/tgie08oObCWwNYamMbirfJkK8XjflQH/2Gg6o
	 z4FUlZOGxmTtLbLb4gsxKjqMfP9YHBpoyoHkxVZqn8qSUihvi3CybswQA1yeoQYKnlp8a
	 EbAFGHWyYc8ut+ffXKo0GQubXg4GwUt4IvmiOFv4CWig3C9yWgvDbtPcFQ3ndM+6ZRqJz
	 C7D2JoFmsIpGl3GQdPdguO9vypez1nMIzkDpMBx/k4kClQ6ecNU5akImQuCedVZAL0mkF
	 e9/h1TWre1STmcDV9D/qQyp2QtFNVSRoWqTWZvq06c7mwKymzdXCVaooEKDoZaB2oPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861988;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=7DqrhhFMuRGsxmzkFa4bifXE162hvgOiw9hKCvD4yA4=;
	b=KDCG5/iUzaiOmFm2J1NkrhJWoASGQ3OGjBHXfg3TLBZghi3wRBwCveNVNo1h+gfy9a8e
	 qpFsnRuUIlaheWAqNmKAF3HbWwrdDL9Za0q7MZIs8orRkZPdb5cEVie/ExSKHne6R5or4
	 6xloaF1fOY8rsfmTbJB3+L7jgsrpHYvTkr0FY5ebaB+MSIGrACKb62OCBVIHUwFTR6zZQ
	 UarZsn7bSQmqhBH9HrggbAKXE2kvEVBSWFF3GnDQPdfCBtALo22HrbuJh3WxFAvsjb1cP
	 LMdSENHk9lBnbZCVHbwgoiPlWfZHJWaJWA+UkIEE35rqkNlRMNysZffaW07Uzqp+GBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DiQoJrzj;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E564606A322
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Nov 2026 20:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E564606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DiQoJrzj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794861987; x=1826397987;
  h=date:from:to:cc:subject:message-id;
  bh=k6CunJLc3sUGhEdLW8T6D/X/K13JalxNt28iWXeODDw=;
  b=DiQoJrzjsmAhrr3/IPAvLffG3EDjq5F0mRNJQfJBCiRNlEZCSIeh2zDf
   tWKWk3kLZA6mAEUjiKdB66y3l0jW0w+nBbZW7h6nhsojf6+U43qt/wDxV
   L19pZs2ZmmcLewWcwTdmmJpqNqkO55DWosIZDNpagtrFJAMVwgeqNMwfq
   XQ3vkYH/Tub8V+7eG2ofTtJRg5J3DTEe7C+dJL9Z8qfqXLVZIv8faFEKz
   K5xGlxy0es9rtbZSYoo2oYS46DGvow0zCkFR4q6Lmgq0+Y5ttJ87FuQkj
   uRg7ak7LEb/HWMfywu40idPYJb03yEkkFfc6stc8DB59JZTJ61Oy7/gOj
   g==;
X-CSE-ConnectionGUID: jcc3G6DnSO2478J++z457w==
X-CSE-MsgGUID: h9N1ErB6Qb2PG0SXjSeEdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3463617"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3463617"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 12:46:27 -0800
X-CSE-ConnectionGUID: R1Notj9tSz+ym8f91T9bpg==
X-CSE-MsgGUID: CyDKuNDwT/Wu0d8wX4q72A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9569489"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 16 Nov 2026 12:46:26 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT3aq-000000002oE-0CVR;
	Mon, 16 Nov 2026 20:46:24 +0000
Date: Mon, 16 Nov 2026 21:45:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/jbd2/journal.o: warning: objtool: init_module+0xb4:
 unreachable instruction
Message-ID: <202611162158.0gjYCxY6-lkp@intel.com>
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
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   141b164bbe186423e295b139e40e8e2d11cf1341
commit: 9205a322cf96f16a49e412dfa3f09431f3e02fc5 objtool: Return canonical symbol when aliases exist in symbol finding helpers
date:   12 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 12 months ago
config: loongarch-randconfig-r2302-20261115 (https://download.01.org/0day-ci/archive/20261116/202611162158.0gjYCxY6-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611162158.0gjYCxY6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9205a322cf96 ("objtool: Return canonical symbol when aliases exist in symbol finding helpers")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611162158.0gjYCxY6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/jbd2/journal.o: warning: objtool: get_slab+0x60: unreachable instruction
   fs/jbd2/journal.o: warning: objtool: jbd2_journal_destroy+0x148: unreachable instruction
   fs/jbd2/journal.o: warning: objtool: jbd2_journal_flush+0x178: unreachable instruction
   fs/jbd2/journal.o: warning: objtool: jbd2_alloc+0x44: unreachable instruction
   fs/jbd2/journal.o: warning: objtool: jbd2_journal_put_journal_head+0x48: unreachable instruction
>> fs/jbd2/journal.o: warning: objtool: init_module+0xb4: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
