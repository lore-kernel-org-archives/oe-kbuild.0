Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9635C29D28B
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 10:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768213578; cv=none; b=jbC9lXInuLNZdm5TYpw5HJ7OmGmPbrKCbuUMCapGZSYp9MgTibvZzA9qOVOI06Y6HMxRQMaqmUTrb0C4zlJLMmk6pm/JLnhYXBFgsfU1+f4TX/QpVfRfW3OIRHERi9YD0gCFYtMwuAlaE+P6bLq6etYZ8v4WlHZP81YnYEZmvuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768213578; c=relaxed/simple;
	bh=DjnLea4r+8Vm14K8rhPfk3o0n/l7tvBphBxoPvC5/AQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ePiCf/czZ5FH1vucGUJFbe29KHqJH/4qNE+Y0a/lCR/2aGbPE3SEmn0JVl3wtJBg1HH4dpAsZmOraAFralQY3sULihUS0sPDuJTLZvcU04q2c9l4rbm3Co9GHuidzRUksrkXtPRz1YLyruy7Cm4Ic/sw2IitLnRctEau8BzfRUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uo6/nYx8; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uo6/nYx8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768213575; x=1799749575;
  h=date:from:to:cc:subject:message-id;
  bh=DjnLea4r+8Vm14K8rhPfk3o0n/l7tvBphBxoPvC5/AQ=;
  b=Uo6/nYx8cy4vkmUY/9xD+3CKHulaUPDK+alRDVys6Rp+iY+YSc93Pjuv
   Rg04E1OmsA7/U7uInz/7LWavky5oN9NyGmfWNVq5VVJtgJ3veU4voMReE
   PEKhRqUMZdTCgmpXhGeo031u2x+z7KdajLJg0Do7dqTMPi/NsjbvngNq2
   avGV8d0BU6yPKpiT1WeTf+YclGQmHYKfF7rZ1TEs/hSHalxdQ4pkbNvTq
   MxxCkBBhUOL+Frd2UT1CkvyYLfG9q40bGGzCo7h+GRlWr4cwoVyYxqDAm
   LxPum5e8/cu0pQj3pDOrQAbZ7Sg/Bgwfz7h9WzgCObgvmmeZsJLRJs60z
   Q==;
X-CSE-ConnectionGUID: lvkhDNvVQYSNiThSEzGanw==
X-CSE-MsgGUID: 3U2Iq0xdTOSsYCJCv0y86g==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="73337454"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="73337454"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:26:14 -0800
X-CSE-ConnectionGUID: yglf13m5TQiGPZqM28mPkg==
X-CSE-MsgGUID: 01648G3wS8WkXH01BNqvEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="204135383"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Jan 2026 02:26:14 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfF7i-00000000DG8-3X0M;
	Mon, 12 Jan 2026 10:26:10 +0000
Date: Mon, 12 Jan 2026 18:26:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/truncate.o: warning: objtool:
 folio_unmap_invalidate.part.0+0x13c: unreachable instruction
Message-ID: <202601121813.Kwm7rM2n-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jens Axboe <axboe@kernel.dk>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Jens,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0f61b1860cc3f52aef9036d7235ed1f017632193
commit: 4a9e23159fd37677efc0c2c53e3b45a5d260a90a mm/truncate: add folio_unmap_invalidate() helper
date:   12 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 12 months ago
config: loongarch-randconfig-r053-20260108 (https://download.01.org/0day-ci/archive/20260112/202601121813.Kwm7rM2n-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601121813.Kwm7rM2n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601121813.Kwm7rM2n-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/truncate.o: warning: objtool: folio_unmap_invalidate.part.0+0x13c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
