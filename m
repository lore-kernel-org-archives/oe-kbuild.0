Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6F99443
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Nov 2023 07:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G3rwisGv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700898222; x=1732434222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fRBBvdZ0ksuZaNL227sYqX9kFg4+PYnwaEHp7js8ORY=;
  b=G3rwisGvOMQujTCCeNvMg/F6cs+LqN1JwuAsuKKiFKsPQ/9TMgipHj5i
   Ha/GIoeTHG7K1D61hElcafmaRS+dnPFh8edxh5azDWNPlW8G9LYhvEI5G
   dKDjXGjVTDIp9O2bYXWg26NWBWfuATNmgQWSuCCT3u9fsC3zxEUJa4P0i
   a+RBVh1wn8QJL7L8UlcwwSJCDXzjuzXPK27rOzYWwhT+CQqblfqAKtTdr
   5AunYpxeloUpB+cZQ33K/VbeqFa8uBSPBGqm6u8OgdB665nLoMjjfdvCw
   PCGH1waxZiRpLN/GuDPIjLM6kwGU81duV3/eqt5Hc59xdMLnJ6XQ1cKs9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="395321539"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="395321539"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 23:43:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="9329663"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Nov 2023 23:43:41 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6nKE-0003kK-2J;
	Sat, 25 Nov 2023 07:43:38 +0000
Date: Sat, 25 Nov 2023 15:42:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [peterz-queue:x86/ibt 9/10] module.c:undefined reference to
 `apply_direct_call_offset'
Message-ID: <202311251458.OHjWvwKp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "has Makefile file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/ibt
head:   9ba52bc66d03d8fa986fb5a6d5a026702eb90747
commit: f421d1db8a29dbc00303f50c2c01a495cd620a24 [9/10] x86/ibt: Implement IBT+
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: um-randconfig-001-20231125 (https://download.01.org/0day-ci/archive/20231125/202311251458.OHjWvwKp-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311251458.OHjWvwKp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311251458.OHjWvwKp-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: arch/x86/kernel/module.o: in function `module_finalize':
>> module.c:(.text+0x4ac): undefined reference to `apply_direct_call_offset'
>> /usr/bin/ld: module.c:(.text+0x4c8): undefined reference to `apply_direct_call_offset'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
