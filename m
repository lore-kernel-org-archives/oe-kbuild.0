Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768252E228D
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 08:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763540361; cv=none; b=IsVM1ZrERA7/wVDtJiX4HPyq6OqF/rUWYrPnqmcQa2UubzoaM9BsfCTECIAUE+MzIoLGH7E5QY+eE1tOU9O6+ZOlb/oOPetgs1Jzt4YnCcZbZs/H6yKNZCsYd7yki4bU/yRa95m4GH2lCyX1B9CMpGUMGjnM4LBSN6XJgirQCOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763540361; c=relaxed/simple;
	bh=k66OJFEXf07IU+GElINRjuciprZT2KtDVDqUlt8txmA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZjWxf+asz9rXK6Oe2Zqp3Nl/y8JeqjZQsWLevkzgawzO2sYofm2QsV+RS+GAk1X0c+Jd2uDAB37EBHv82ejp54oYjy3MGwS9oNUHcUzUMXPFePBoPkV2JhV3qitD0JpaFYYhUGeVmCHV/dHArk28yBufpPKWk2HDoms2FWbzfeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VSyJ8XNR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VSyJ8XNR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763540359; x=1795076359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k66OJFEXf07IU+GElINRjuciprZT2KtDVDqUlt8txmA=;
  b=VSyJ8XNRvdY2x85nT8EObAvGuCoAksbE+SkaYXDHHfo6I1r3wvDibTGE
   xMuLDleC1PGODXWFTexiULwTsNE9fDZlYkL4SKSJSzo0v3+n5k4XFTVIN
   F4mBN3QAhSNl6OKWxiLXPIIFZqbog9bt8LsZu7lmVlANy2Xt4HRJ7JJC4
   xFFRpZuuIXhsYvGBaJRO9RtxGsUtxa31ploTKzANt1eaKQa4H1BKLlNKH
   awGSKF3GdqW1MDvfKaPGhu0PQyF6Dgl81FYJNBLQSm+XHHRDZz/j3T5zf
   /E6KvPiXAMagPitRTZFyWiZzi+vulnqPISl1Y+K9LIOvLJ4BNDJk8RKCY
   g==;
X-CSE-ConnectionGUID: 59lQMvz2SSe+yQSGXNKHcw==
X-CSE-MsgGUID: 5tU5q+cGRHS+Br2bGBhuqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65608625"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65608625"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 00:19:18 -0800
X-CSE-ConnectionGUID: z1RzNigqRqarlD3v7d5zfg==
X-CSE-MsgGUID: iHR5CMqeR629aoa8b2Bwhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="228329844"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Nov 2025 00:19:18 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLdPH-0002bj-2N;
	Wed, 19 Nov 2025 08:19:15 +0000
Date: Wed, 19 Nov 2025 16:19:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: block/blk-mq-dma.o: warning: objtool: blk_rq_map_integrity_sg+0x1bc:
 unreachable instruction
Message-ID: <202511191600.ReBPqBxQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Keith Busch <kbusch@kernel.org>
CC: Jens Axboe <axboe@kernel.dk>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8b690556d8fe074b4f9835075050fba3fb180e93
commit: c16b52a0a095888efdd5d76f7194caf2a4752256 blk-integrity: use iterator for mapping sg
date:   3 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-r071-20251118 (https://download.01.org/0day-ci/archive/20251119/202511191600.ReBPqBxQ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511191600.ReBPqBxQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511191600.ReBPqBxQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-mq-dma.o: warning: objtool: blk_rq_map_integrity_sg+0x1bc: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
