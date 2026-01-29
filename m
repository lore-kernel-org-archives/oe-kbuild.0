Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92807330B30
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Jan 2026 20:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769717657; cv=none; b=Fk6vxk8wrTRPC4Fr/OHayQtURaygyNEcm/u9dvrEA9n3GZmdiV1sKExitYzYMDvmo8uA6ABOhbpeLTOkGuWjNtAM9igwHzx1DUPb5JlzyQdOJbCvgALA6tDCwBYmtkIadEz9U4KDWUuJo2DxwV+WoLlD51IqzQUTQvXi4KPMwOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769717657; c=relaxed/simple;
	bh=SAOUSJJMsLWroAI7ZbAIENVPrGbocZJlCeGA5TT5VsM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c5SCjxKmO/0hyKU6UQCs1XonTRKhm5pP4fpYhS2iBEllUQH51IDgignpD+egoxfX9ihU8i/bb334jI8a6TCASeqLVLYhIkodI+JuHfQc7zu3vfN9wyYI6ZAB5GUHgGGoItZFsKmB4nZjEbJnmT7v38hI7q2TYvZpgtaII66X8C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YgGEo3FD; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YgGEo3FD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769717654; x=1801253654;
  h=date:from:to:cc:subject:message-id;
  bh=SAOUSJJMsLWroAI7ZbAIENVPrGbocZJlCeGA5TT5VsM=;
  b=YgGEo3FDXd2Zf7DI5hAAAjfs8sBzOQsrHvST7FdTD4FtGq/HJ58czdFf
   pZ+2AmPCzZaQkCyLJ1Y80UOrXIr4gpcw5mxslv5yUawWTL22jkRUEHPak
   TFUqApEafgpMFQ5S2vKj1Xih8NDay/72LT6D4qygrWdO+xlmqpD+Tsq8q
   w3MNnB8POsBJJLA1uJC1Jgq97MBW82mKXwMRblOFunjajHY+eh0qOIaxS
   DBhjjfF2SHasRPlqWLTHaC82zbGQRuRviB33+VzqEQPIimccBQmX5qN42
   c53m0NLUHJbklHraCgiiq0DSLs2HsSDxXVulpmY1inQBkxlYkb/6Q09e/
   Q==;
X-CSE-ConnectionGUID: fHLVq8HCQn6y4iuygEFhCQ==
X-CSE-MsgGUID: D7Ie5N3rQvCU1GRuN0PZxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70879695"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="70879695"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 12:14:14 -0800
X-CSE-ConnectionGUID: GofSfnxjTf6A+455tvMOYg==
X-CSE-MsgGUID: rfcv7lD5Sg6Qj/63yd09Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="209094525"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Jan 2026 12:14:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlYP4-00000000bqI-38Tn;
	Thu, 29 Jan 2026 20:14:10 +0000
Date: Fri, 30 Jan 2026 04:13:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iio/imu/bmi160/bmi160_core.o: error: objtool:
 bmi160_setup_irq(): unexpected end of section .text.bmi160_setup_irq
Message-ID: <202601300412.33ejjJ1o-lkp@intel.com>
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
CC: Ingo Molnar <mingo@kernel.org>

Hi Josh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8dfce8991b95d8625d0a1d2896e42f93b9d7f68d
commit: 188d90f817e13b66e03e110eb6f82e8f5f0d654b objtool: Append "()" to function name in "unexpected end of section" warning
date:   10 months ago
:::::: branch date: 28 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-074-20260130 (https://download.01.org/0day-ci/archive/20260130/202601300412.33ejjJ1o-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601300412.33ejjJ1o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601300412.33ejjJ1o-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/imu/bmi160/bmi160_core.o: error: objtool: bmi160_setup_irq(): unexpected end of section .text.bmi160_setup_irq

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
