Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9213D1862B4
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Aug 2024 16:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723479489; cv=none; b=BMUNniImYIyg2DC1bgJi4UjZy0C43frpXTgLA4WjGMJEnJfbSmq614cj/gv+Z1kKMpIym8AhM4ufvW4w8FKDwzah2LdZpCGHVCKpv6csqirN+tf/9UYtFY9XSKgrva7JXemiX/JsuW5Kus864A8kvVbTa1Bu+rv4pqMsup5/5cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723479489; c=relaxed/simple;
	bh=qzW8TDWOWAyUWmYmoj2Mx6saxfwNDQu1PDUaQEz/PMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O461nQKaDE9Bx28Nqb0dSWHerBCBuK7I8QuzhnWt939Rn/JZTGRTPXHf0rNyj0n0E5UBY9BT5rRrB2iiZHAhgy8FDif0Pz22E2udCE/gfFjFCBoQaLu5jOc4AKGA6f+R9otiIvU8HqoA2xDUuFsGlus9Yva5kyW0iIolzM4pAAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cLTdrXzx; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cLTdrXzx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723479487; x=1755015487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qzW8TDWOWAyUWmYmoj2Mx6saxfwNDQu1PDUaQEz/PMM=;
  b=cLTdrXzxD2zeBCZJy+xMJTKRyP+dG7Yt0u350Lmc9MikiuAUGcFEyANZ
   eQeF5EMGiXF0Dkl2DxukIXn58Lef4D53j/iBX8mPZqp/y45EfCaFtCC3U
   ETmP9bB0M7oZkg6QI8qY3T4t6i4isH/yCDklwoIkSVCy//PM5U2NzwBP/
   2NlzH4IS1HLB8eziI+9A1S87bo7tub75Y+OUUABVsD0hdjL7o3bYp/g/I
   w+c0+Jg01G/0aZQ0h7ec0lzYHPkYw4dUt7fR4NQhvHf3Tl59PUBZQhjv7
   6hdN+PA8R40cDnQUJExxwvwa2ePlYBVwsQ8KKrh5lQ9oULIEG3R17yWP3
   A==;
X-CSE-ConnectionGUID: 1lVr0JysTn6Js4gjnXkazw==
X-CSE-MsgGUID: S+YVTShbROWw8RJvbrM1lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="25367171"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="25367171"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 09:18:07 -0700
X-CSE-ConnectionGUID: BuJpLG1aSAihFaUfPrmdBA==
X-CSE-MsgGUID: AOngcc62SuWm+FqIsHaOLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="57981284"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 12 Aug 2024 09:18:05 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdXkB-000Bxf-1e;
	Mon, 12 Aug 2024 16:18:03 +0000
Date: Tue, 13 Aug 2024 00:17:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iommu/io-pgtable-dart.o: warning: objtool:
 __dart_alloc_pages+0x40: unreachable instruction
Message-ID: <202408130050.GsKeNdBE-lkp@intel.com>
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
TO: Pasha Tatashin <pasha.tatashin@soleen.com>
CC: Joerg Roedel <jroedel@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7c626ce4bae1ac14f60076d00eafe71af30450ba
commit: bd3520a93a84cd8c3897283e5891a9106fcf5acc iommu: observability of the IOMMU allocations
date:   4 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 4 months ago
config: loongarch-randconfig-r131-20240809 (https://download.01.org/0day-ci/archive/20240813/202408130050.GsKeNdBE-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240813/202408130050.GsKeNdBE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408130050.GsKeNdBE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/io-pgtable-dart.o: warning: objtool: __dart_alloc_pages+0x40: unreachable instruction


objdump-func vmlinux.o __dart_alloc_pages:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
