Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5AD38DC77
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Sep 2026 22:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789425935; cv=none; b=GlR74feUOb39vT/ADkpausBbYUpFBOPMohRrccQh3wkVNqlOnUhZFo1j4dNZW213GpoDkPwIBUNBfdgOI6WIcEcC2A3DRpIA66ndZQGcv1vhTnv0rxB8JZfEiZWt8x8T4LWgRxsXMuCbFb61xDFkE5kVTUmg5unN3fyZSMeCsK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789425935; c=relaxed/simple;
	bh=a7zwJp3Jsa5cP2i0IwRxtprhSr+6WIMJZilkR7Kniss=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZGVYpFUqtVz8DAh22e6qeoJYlBx+fYEC03oyn3F03aac6gBghAzwsoO+ztCL/a80eIbmgV2C3StsSauxT+3EJZCERZ1CG2IAVIuNhSu37qx1HX8qO2p83J6rqv9G9G+/NjKQ2nFqj4IRSu7TPyQqMLXUJaSGP3xwo8owrzjYWLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9Wgp4ap; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9Wgp4ap"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789425932; x=1820961932;
  h=date:from:to:cc:subject:message-id;
  bh=a7zwJp3Jsa5cP2i0IwRxtprhSr+6WIMJZilkR7Kniss=;
  b=i9Wgp4apRkMjfVzbZJgt06LmR1I3z1uhNek0wbhz4BKyHz20XGskVEus
   pAjp4Uw6DYGMVZU0Vr/crmKX6n44gymkND08wzR/bUi/rMX4W6NFATgLw
   P7H6w6bAse5T9HtMSyjoHJdaRwuemneIQZZGkVOuNv8eAc2CYdyWwOPIK
   r2jHL3SFqRpGcW4KM9tyXORaKEHFeZg/N28VL1T2y7LyGOF9688z7gpRR
   uGj7ynvWr2ETwgmU4wCQ7L9jcTRmpWrBwH0LnUJgGKVOrbXgiIwlRCnTl
   CgDu+caK4uG2uscqWICFSJxpt0KStFHpuIw5lEW6FleJFLOD9qgD7kWLI
   Q==;
X-CSE-ConnectionGUID: usEpxW4+T8KlpAmZJc888g==
X-CSE-MsgGUID: ejuoLrb2S72cUkQloR/rDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93483098"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93483098"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 15:45:28 -0700
X-CSE-ConnectionGUID: cK3TE6diQimaDkoz6EV4uw==
X-CSE-MsgGUID: 2Fl1WxiEQyetE0b2uz0J3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269088033"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 14 Sep 2026 15:45:27 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6FQT-000000000Kv-14g6;
	Mon, 14 Sep 2026 22:45:25 +0000
Date: Tue, 15 Sep 2026 00:45:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/f2fs/extent_cache.o: warning: objtool:
 __update_extent_tree_range+0x338: unreachable instruction
Message-ID: <202609150024.OmG6Oy9V-lkp@intel.com>
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
TO: Chao Yu <chao@kernel.org>
CC: Jaegeuk Kim <jaegeuk@kernel.org>
CC: wangzijie <wangzijie1@honor.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   587858367581b9c55c3690f4e63382ad622719d4
commit: 45b70947a425fa121a8b9bcbb77472d9e35def6a f2fs: add sanity check on ei.len in __update_extent_tree_range()
date:   12 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 12 months ago
config: loongarch-randconfig-r063-20260914 (https://download.01.org/0day-ci/archive/20260915/202609150024.OmG6Oy9V-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609150024.OmG6Oy9V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 45b70947a425 ("f2fs: add sanity check on ei.len in __update_extent_tree_range()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609150024.OmG6Oy9V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/extent_cache.o: warning: objtool: __update_extent_tree_range+0x338: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
