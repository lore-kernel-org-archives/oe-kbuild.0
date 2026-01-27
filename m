Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B63345722
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jan 2026 11:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769513847; cv=none; b=pcoUkBsls1JzWvcfTSMlR5lt16AxGi5tYtkDmz36Dnn0gBjTLQnkXuZI0RWz3cSL09aeqmvxAjKFsOwrrVt55YwDao7u1+r/hgDrtv2UZ29b8TXLEzGIzRUcfIQ3e9WLixxn8yPEQ6VudMK9h4ZMldBFIKHdEev/QDAGK5y7cnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769513847; c=relaxed/simple;
	bh=lo+EMrzGHMK/rYs+0jg28nst3cGHs1dvoMaMODssI6M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oW76+flVMlZbXHkPCBnA/WMDv/SWxtFVdRK4FyYXlFbrNnVl1bpVKHTKSgRbVCp3wliuXJT+F0FP1iMHJqas6XtdSEchRDVWuoz1aa/y6piLvW3N6N26YuFIALueFI63G9wJ91WqiSg2Etn8Mr/0w1vmaW8iAI7a8Vt1pg6un20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TWvRxmTw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TWvRxmTw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769513845; x=1801049845;
  h=date:from:to:cc:subject:message-id;
  bh=lo+EMrzGHMK/rYs+0jg28nst3cGHs1dvoMaMODssI6M=;
  b=TWvRxmTw71C9rlaz1qTn4eOfA4TxlF5Zrksaokv85iuMsluV24CHzajF
   W8fad4962LCdwqYGpz7riBvXEyuIh1f4Unjq96NgbAHvAsKRTMd5g054x
   wzm1ObUJV/YO98NJ0D2/uVTK+FRGUUUW2I8rhnOhcKcQjiKOxL6JbBHLC
   lZYx7S4SjbI9S+L6CpTM++9zUKyBfK/XU8p6yv64WKl63rbiw+Bu6QzcX
   PVw7WY2xj8Vur31/jyU0nDCIvPkiUjYynm05QkPchmPx0LXN03f0ffAgD
   8T5vjxAOYgFTtEE3Pq8DnrpCTJod0Ip5UGoB7ET4MmFR6JXIYjZ6N67ED
   Q==;
X-CSE-ConnectionGUID: 5GafvOvYS9WT4wnvhZBF9Q==
X-CSE-MsgGUID: 2FZs9093QaK6ZdwXTgLpdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="82135737"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="82135737"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 03:37:24 -0800
X-CSE-ConnectionGUID: KewSBzOcSZWxM4yYH+PhBA==
X-CSE-MsgGUID: Q4x2NfM6SkWasa4j21F1Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="208192383"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Jan 2026 03:37:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkhNo-00000000YQI-3f9h;
	Tue, 27 Jan 2026 11:37:20 +0000
Date: Tue, 27 Jan 2026 19:36:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 4637/9596]
 drivers/regulator/tps65185.c:452:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601271913.U3SOQeVk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/regulator/tps65185.c:452:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Andreas Kemnade <andreas@kemnade.info>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   615aad0f61e0c7a898184a394dc895c610100d4f
commit: b0fc1e7701940d12ea2c41f386aa552bc4cc3629 [4637/9596] regulator: Add TPS65185 driver
:::::: branch date: 12 hours ago
:::::: commit date: 2 weeks ago
config: parisc-randconfig-r121-20260127 (https://download.01.org/0day-ci/archive/20260127/202601271913.U3SOQeVk-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601271913.U3SOQeVk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601271913.U3SOQeVk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/regulator/tps65185.c:452:1: sparse: sparse: bad integer constant expression
   drivers/regulator/tps65185.c:452:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/regulator/tps65185.c:453:1: sparse: sparse: bad integer constant expression
   drivers/regulator/tps65185.c:453:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/regulator/tps65185.c:453:1: sparse: sparse: bad integer constant expression
   drivers/regulator/tps65185.c:453:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +452 drivers/regulator/tps65185.c

b0fc1e7701940d Andreas Kemnade 2026-01-02  450  
b0fc1e7701940d Andreas Kemnade 2026-01-02  451  /* Module information */
b0fc1e7701940d Andreas Kemnade 2026-01-02 @452  MODULE_DESCRIPTION("TPS65185 regulator driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
