Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962BD2C0307
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 17:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764696347; cv=none; b=UMcxrx3pxxmJg9f8iKH5uF526B3FFNoKTtqNM4IKu+QJz1q4vxoc+zWSBn3NWNXLaH3L49qGaXrHYq9jK0JJ8BzRU0CxtJ/MkncVen96JDcLKPkL0BhEbG/uJxMVTwhZCvno2ZetIuoea2GzDox/ONmruuPrAYnk7uctygMxvyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764696347; c=relaxed/simple;
	bh=cVuOepI+8B3Q9tFXl9fUfszcWUqITSEDqfNJ2IftVNM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fd9DfDbf4f6yrUdsX1NMGTf/VAQP/kpg7oqK0x1+VBwVfJu6vV1rgsWaLjqSWbao0cLlcEC/C9KN9ry1naYIco0os/8n9/EFYaBNyeDM2sTYMNlYrgBIcCDVabaPOC7oosin2PyE5qrVdFB4YcsBHVwfMZ1eBNppjn+2otHzsFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QK1N+jyH; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QK1N+jyH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764696345; x=1796232345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cVuOepI+8B3Q9tFXl9fUfszcWUqITSEDqfNJ2IftVNM=;
  b=QK1N+jyH0NZ1m/jb994Ae9f4Eo+s2cWDHg1dOcD+nQSgQolw50Svn5+h
   gFr5t8qnuJvIXY9FKTRSavFbuTdzoDpZKRa0Gqk6oBF5/5grfqCzEVkyx
   o4ESqsu3ZW5SI5o//J69YcNLYIQsObB0/4exy82RPj04sZBykBFlsDPeu
   2k2Gd62B/w8rNNCpDWB+rAYf88omZeMyUlUUUUYtOZnx227xu1Bx9GAKL
   H3Wd91F6a/ouMBBAKQAf7p+Jr6HxoFOX3uet48N9/d1jY84polDMCvzz/
   27eNfuBIzLIFP8AqcjZ8PT/d2AyinMHCRnaNFfoutRKQBQG8+KWYi1EoE
   Q==;
X-CSE-ConnectionGUID: l7wy7ZwdQmS+N1v+TrhELw==
X-CSE-MsgGUID: +J265sU1Qiqv63uNVtS7QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66392924"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="66392924"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 09:25:43 -0800
X-CSE-ConnectionGUID: bYYrN6NjQZKuzmJJIaynsw==
X-CSE-MsgGUID: zoFXfDcWTVSNsNFATkEdoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="194854993"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Dec 2025 09:25:42 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQU8B-00000000A3H-3VoG;
	Tue, 02 Dec 2025 17:25:39 +0000
Date: Wed, 3 Dec 2025 01:25:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 9012/13055] unix_connreset.c:17:10: fatal error:
 stdlib.h: No such file or directory
Message-ID: <202512030115.DRu23OIc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
CC: Paolo Abeni <pabeni@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47b7b5e32bb7264b51b89186043e1ada4090b558
commit: 45a1cd8346ca245a1ca475b26eb6ceb9d8b7c6f0 [9012/13055] selftests: af_unix: Add tests for ECONNRESET and EOF semantics
:::::: branch date: 11 hours ago
:::::: commit date: 2 weeks ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251203/202512030115.DRu23OIc-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030115.DRu23OIc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512030115.DRu23OIc-lkp@intel.com/

Note: the linux-next/master HEAD 47b7b5e32bb7264b51b89186043e1ada4090b558 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> unix_connreset.c:17:10: fatal error: stdlib.h: No such file or directory
      17 | #include <stdlib.h>
         |          ^~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
