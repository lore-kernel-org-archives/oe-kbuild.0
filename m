Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147C23FD960
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Oct 2026 18:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791399199; cv=none; b=eIwhfapLi1gltNRvWmC8iXp2lOR+X39AMMC+cxiWcyZmSjYvsgyK+006OewHvtvrcX4pRcBBoo1KC3RrS8N25Tt5tsMVZE7ctC8UK3RhUNnUZn6FBptvktZDj1pv6mzky+3CileOcw6vfxnDdcRHrbKgCEQFHwJZ+o+4GYWSW1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791399199; c=relaxed/simple;
	bh=mjAFmaqoJzY4/ULuKZaC44l1XOVjQWyWdM8xc+WBujU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Zlk1aTT54cvijk5dCu/rT9d3O4BzQS+/Ku/3lVKibvB8X8Vz2U2aJduSkjLNQz2E2yNxjG+xbv7Z3N8eKN9QljoGbQdJEULG2veahuSvbuiYy3G0ui3E0TQDT0zlpwXkPtMGx67gx28OvmIhc9BhWx1TbvxRNVkSzYMA95TdrfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ePXYUPqr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ePXYUPqr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791399198; x=1822935198;
  h=date:from:to:cc:subject:message-id;
  bh=mjAFmaqoJzY4/ULuKZaC44l1XOVjQWyWdM8xc+WBujU=;
  b=ePXYUPqrwbtPgtO35KJvRwy0JPnHUAnDLX6fGuWKyOv2QlsKeS62cvdf
   E43m1Y6Ol1GobHf6Ad+reLC8yOUcfeoq3d+xyaMWm6Cu/l2Wc8UXnmYdp
   Yaug13LCQG/8Z36Ai/1U16wFPCjojigadCAXQuX34J1LMClZUWm/1h0xw
   DBCMJx3TBFPmt11XLRUIBiqrilPx/oOBvsWpOSGSz2UkI9/FRginKBDel
   IkYzQqM40+Pq5xd9sgcCHeGhhZzHvw6miEzVl3ypIjia3rwG4vcAC13oO
   0cqS65394CenDgEy7J6hiHSE0xcgu3mov12Wthwiksdt4C2zEoenMGgWF
   Q==;
X-CSE-ConnectionGUID: mpkISPYgRoSY3LHPAsxSmA==
X-CSE-MsgGUID: TE0LuxjhRHqWRCSgJrK+WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="177187"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="177187"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 11:53:18 -0700
X-CSE-ConnectionGUID: s6Voq+DKSTGIWgzRPJFosQ==
X-CSE-MsgGUID: QqxTkazpSwSPjrjLhVAC1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="285448537"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 07 Oct 2026 11:53:17 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEWlP-000000003q3-1rpc;
	Wed, 07 Oct 2026 18:53:15 +0000
Date: Wed, 07 Oct 2026 20:52:09 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: block/blk-mq-dma.o: warning: objtool: sg_assign_page+0x1c:
 unreachable instruction
Message-ID: <202610072016.Z2B8meKI-lkp@intel.com>
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
TO: Keith Busch <kbusch@kernel.org>
CC: Jens Axboe <axboe@kernel.dk>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7b63ef2d55f24519e7e9e5f4d15dbea03f126e40
commit: c16b52a0a095888efdd5d76f7194caf2a4752256 blk-integrity: use iterator for mapping sg
date:   1 year, 1 month ago
:::::: branch date: 5 hours ago
:::::: commit date: 1 year, 1 month ago
config: loongarch-randconfig-r2105-20261007 (https://download.01.org/0day-ci/archive/20261007/202610072016.Z2B8meKI-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610072016.Z2B8meKI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c16b52a0a095 ("blk-integrity: use iterator for mapping sg")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610072016.Z2B8meKI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-mq-dma.o: warning: objtool: sg_assign_page+0x1c: unreachable instruction
   block/blk-mq-dma.o: warning: objtool: blk_rq_map_integrity_sg+0x130: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
