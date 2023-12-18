Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2476131
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Dec 2023 05:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lRTjSuQ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702876306; x=1734412306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Dd0OfnsoJG8/ZUgw7JQmOPpBUZMQZSxmV8cd0i4I4o=;
  b=lRTjSuQ/vQrNJQaIAUkMVonizaRMiR5IyYs7tHF1pdKiikvP3mFB/Gkg
   NfvUPQXn8+wciaXRdBfX5cEmnJxdSSJtg8yjFwLT5+a+BDLNPmtm8ysh5
   pMhrDA+vjh0HIP4if9qPj6B0ubUzC67IPExXeh1WHeQ7XhKyarEHcNUis
   lASMadvcfTA5qZNoetiGp1shreNtU0wxfXc6aa4lvsPlIWlQfePYbaBME
   OLEyG2aZycALDoc6grCyszyP3McUhSzDGApi+8pDtFiig+J7L0Vjz2h75
   ijjzgK17jkzwd69RxHPocr/lXi9dslez9tQ5lphrqatLmMvfS3NLp2zSk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="426590329"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="426590329"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 21:11:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="23635434"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 17 Dec 2023 21:11:44 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rF5un-0003mj-0C;
	Mon, 18 Dec 2023 05:11:41 +0000
Date: Mon, 18 Dec 2023 13:10:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: btree.c:(.text+0x97a): relocation truncated to fit:
 R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
Message-ID: <202312181337.lRdkUcX3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "csky general problem: relocation truncated to fit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ceb6a6f023fd3e8b07761ed900352ef574010bcb
commit: c2679254b9c9980d9045f0f722cf093a2b1f7590 tracing: Make tracepoint lockdep check actually test something
date:   9 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 9 months ago
config: csky-randconfig-s043-20230101 (https://download.01.org/0day-ci/archive/20231218/202312181337.lRdkUcX3-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312181337.lRdkUcX3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312181337.lRdkUcX3-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/md/bcache/btree.o: in function `btree_gc_mark_node':
>> btree.c:(.text+0x97a): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   btree.c:(.text+0x998): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   btree.c:(.text+0x9ac): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   btree.c:(.text+0x9c0): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   btree.c:(.text+0x9d2): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   btree.c:(.text+0xa2a): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   btree.c:(.text+0xaac): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   btree.c:(.text+0xab4): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   drivers/md/bcache/btree.o: in function `btree_gc_count_keys':
   btree.c:(.text+0xb14): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   btree.c:(.text+0xb20): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   btree.c:(.text+0xb2c): additional relocation overflows omitted from the output

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
