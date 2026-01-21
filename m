Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCD54508F2
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Jan 2026 22:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769033558; cv=none; b=s3wiiLeHqaTSTnNxRwU3G9oYPOriH2vxUaM1akgNbIlZEZaSX3/ieiq3DGU+L9md5UszzYiMvf4I2PwYgLja1XdCtlf4LeTWILo5m+uaqy0er02kZ5wHPz8aVxQKjzzk7lVr7HiXDqs6wL7CPP7KkJtm7U1sC77VFe4xzx/ncTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769033558; c=relaxed/simple;
	bh=PwE9L2YkzZGoQ+l89uRbrUA5R3XEvC+7g0nMtHrwzqU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WuAWUCHHnxnTm8RyLMSyr6Yo6fYsBXwcM0Ns0nHJgckee7lTS6sBMyNNzL4i4ZPD8AdXUyt55LuBg3bI13VT/Mzl6yKVF0/TlljGm5drjjiF2LYtF+wLdmqJ+rR8i8jocIBLwa9SowBpQoJhVsgV/GX2R8DtkXP5hpj5msCV678=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CRspgNmO; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CRspgNmO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769033554; x=1800569554;
  h=date:from:to:cc:subject:message-id;
  bh=PwE9L2YkzZGoQ+l89uRbrUA5R3XEvC+7g0nMtHrwzqU=;
  b=CRspgNmOLU5oViZnRY37UQtSrJ7RBkSklceVAW0Y0f40z4wSy1B39Jco
   EW8K4qj/wkCDCiiE+GNyUwP4uDorSoAYS4pnnLgD7BfACtdQxUZTHG6da
   9fy1XZV+D7FukFeUlpatqAHdeINUEm4bLPgDRL0AcN/F2bWDFVsi4cuVW
   v8YzahvS/PO5cQnkOQavASc9F5OHhmxpU/oKzYnBapM5aTWnCZ2taLsDE
   PfcAbmi6adTlD55Z0Zyj7z2rshfTRlEueWAokSqPTe59ufUdlUlkcO7+6
   +3PLvHclvYS08n/9iXphmr7ah2u0iN1nvpkEJUgDiE+nj9KqyEVRwuj8Y
   g==;
X-CSE-ConnectionGUID: Xyg0nYDpSq6ZcidaIpGCPQ==
X-CSE-MsgGUID: xdOhxercTEug6ZdcaT/rsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70322096"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="70322096"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 14:12:32 -0800
X-CSE-ConnectionGUID: cfDElnd+QOKfgdgG+yI57A==
X-CSE-MsgGUID: tgEYihyxTi+xEXCqVjRn0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="206618605"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 21 Jan 2026 14:12:30 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vigR9-000000000Nx-3qUL;
	Wed, 21 Jan 2026 22:12:27 +0000
Date: Wed, 21 Jan 2026 23:12:26 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hch-xfs:xfs-buf-hash 1/4] kismet: WARNING: unmet direct
 dependencies detected for PROVE_LOCKING when selected by DEBUG_NET_SMALL_RTNL
Message-ID: <202601212357.fYu8quod-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/xfs xfs-buf-hash
head:   980989721de907c1cf4031997df45f6a63ccf747
commit: 86793f36204d34531f49d904f9d92590dc965c23 [1/4] disable lockdep
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-kismet-CONFIG_PROVE_LOCKING-CONFIG_DEBUG_NET_SMALL_RTNL-0-0 (https://download.01.org/0day-ci/archive/20260121/202601212357.fYu8quod-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260121/202601212357.fYu8quod-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601212357.fYu8quod-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PROVE_LOCKING when selected by DEBUG_NET_SMALL_RTNL
   WARNING: unmet direct dependencies detected for PROVE_LOCKING
     Depends on [n]: DEBUG_KERNEL [=y] && LOCK_DEBUGGING_SUPPORT [=y] && BROKEN [=n]
     Selected by [y]:
     - DEBUG_NET_SMALL_RTNL [=y] && DEBUG_KERNEL [=y] && NET [=y] && LOCK_DEBUGGING_SUPPORT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
