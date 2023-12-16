Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B544935280
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Dec 2023 21:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RzDBf5jQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702761418; x=1734297418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sXtKcbfYaxwIMLBMElmP4nRJeI8xbKRQIB/S9yAs13U=;
  b=RzDBf5jQbXyfLPwieNRzKhLvtdtHiFHaTSVyhCjPHpokOQYDU1TIrru/
   ria8c0VXpR9cgDcv1MzluDu9qdFgB5kfMhofeeK7xjSGxNU3mDQV01H5l
   AtJqqsLZGbuBsuItyq+H68fTpa7nr7KeO9y3Kdsh2iir3vXmSCRem4JzD
   zbdaqVtBNMRw9q95ERUw0piX42AQJqyL8obJ5TCqR4OY4l0suC0CN5N9b
   98LFYPquQXYLlUUIPp7hAAkOXPZjca13Aktgt6Z/lZ510JzUCiwddBxwi
   Agi4SkjWNmQ8ykE0kkGZ5lvNUPRRgwBnrmbuHIdUILfiYUtnLWdogK+6B
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="14073855"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="14073855"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 13:16:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="768384076"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="768384076"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Dec 2023 13:16:56 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEc1k-0002DX-1t;
	Sat, 16 Dec 2023 21:16:52 +0000
Date: Sun, 17 Dec 2023 05:16:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fair.c:(.text+0x8d64): relocation truncated to fit:
 R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
Message-ID: <202312170539.m2363vtj-lkp@intel.com>
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
TO: Abel Wu <wuyun.abel@bytedance.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b8a9b2e6809d281890dd0a1102dc14d2cd11caf
commit: eab03c23c2a162085b13200d7942fc5a00b5ccc8 sched/eevdf: Fix vruntime adjustment on reweight
date:   5 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 weeks ago
config: csky-buildonly-randconfig-r001-20220407 (https://download.01.org/0day-ci/archive/20231217/202312170539.m2363vtj-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170539.m2363vtj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312170539.m2363vtj-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.o: in function `enqueue_entity':
>> fair.c:(.text+0x8d64): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fair.c:(.text+0x8d76): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fair.c:(.text+0x8d84): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fair.c:(.text+0x8d8a): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fair.c:(.text+0x8d94): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fair.c:(.text+0x8daa): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fair.c:(.text+0x8dc0): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   kernel/sched/fair.o: in function `__sched_group_set_shares':
   fair.c:(.text+0x8dfe): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fair.c:(.text+0x8e46): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fair.c:(.text+0x8e4c): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fair.c:(.text+0x8e54): additional relocation overflows omitted from the output

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
