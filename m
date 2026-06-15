Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500C72FDC27
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Jun 2026 06:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781505920; cv=none; b=ncnyk7bM4hUP1AqWgpFEae+wjp3sIl8exhsEB3/pY4u9THZcqE2TXVrmfN5A7T+ruFBjOPq4jxhsRmr2oqEKmHR7NpX5nYGD7IhbZDJIZbrc8MgBT0jNGvZZjPCrnCOoP1sWWjZECbalr5MtIVXRIzk+PXr4maz6pb/4LKNT6u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781505920; c=relaxed/simple;
	bh=Jk4f5wjVYY+RT9T6uB8BJ7eyTpy7q35QnOc9HCYKngM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gEXDiok65rf/sN9w3MoU+Rtg7PGnUy3HlpDeqxFW4fl2+dGWpI7O3bCNMK/7J/GU5hYOqxWAv1mXyVI3q5sVGueygsQt+w8IjCq6NJ3XhoF+ffSR5PQYhtu18EFnIJtUVpkAxxKptB8YeOpPHc5zFYX1mF0rGx3gOmcPwyBGC6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OEnwMxbu; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OEnwMxbu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781505918; x=1813041918;
  h=date:from:to:cc:subject:message-id;
  bh=Jk4f5wjVYY+RT9T6uB8BJ7eyTpy7q35QnOc9HCYKngM=;
  b=OEnwMxbuCfgQyGiw1rC4vhD1La/Cl4BwK8z7Pu9qhBj3TOMLfI96F+4R
   Y/9a0tWULp5nEwpluw4Hx79T0MyNhqUDfFm46HzADZIintNy9+PMSjayx
   An87vpr+/CK8ataznDOS5nLzkYNXEuBoeDXygWjmHlNC/HTm0Am7aNNek
   Gk3ggmjjVlTKXUih6mvSMiKkoVnib+zc5YFqu12658TP1sdX/AMaeXsoN
   ZV1cvyODYmKxIccrDNNYYL/dspdh1V5WHDTtBk5kCP9G1MSCdnHPBALp/
   wYOW5yGeJU1VPV7UJLIrGcUJOdgfuELSypN7B/3M7eYc6GGcCePlOqLsF
   A==;
X-CSE-ConnectionGUID: 0JDqysFeRpylOqYh7WfFqQ==
X-CSE-MsgGUID: /B0iG6ITSlGqFE3uHozdvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82429528"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="82429528"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 23:45:18 -0700
X-CSE-ConnectionGUID: kIU0lNYhQlqTH73oZdWYtQ==
X-CSE-MsgGUID: B9ockYNFTvi9zKd562h/cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="277587086"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Jun 2026 23:45:17 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZ14M-00000000RYk-2q8E;
	Mon, 15 Jun 2026 06:45:14 +0000
Date: Mon, 15 Jun 2026 14:45:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: block/blk-mq-dma.o: warning: objtool:
 blk_rq_map_integrity_sg+0x1fc: unreachable instruction
Message-ID: <202606151429.yNmxj2u8-lkp@intel.com>
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

Hi Keith,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cd9520d35a6c38db6567e97dd93b1f11f185dc6
commit: c16b52a0a095888efdd5d76f7194caf2a4752256 blk-integrity: use iterator for mapping sg
date:   10 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 10 months ago
config: loongarch-randconfig-r064-20260608 (https://download.01.org/0day-ci/archive/20260615/202606151429.yNmxj2u8-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606151429.yNmxj2u8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c16b52a0a095 ("blk-integrity: use iterator for mapping sg")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606151429.yNmxj2u8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-mq-dma.o: warning: objtool: blk_rq_map_integrity_sg+0x1fc: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
