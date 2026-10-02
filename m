Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855543859FC
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Oct 2026 19:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970212; cv=none; b=NDjBGdrC73MI1ckLLT8NBlvJiJ+0rhn0mPQlQaV0KbVxGc4uQcu/5Or2RXb+OHQ4p2Mmb6tePpeuFZPfyrz0OdoA47kF+gtuur5vcuyEQEHzEAtxPkzV6ePNQtDdYQtUatRyeVKX5BfZ5/+PUI0prVn7Qg9/TyoFDDl53wLhDis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970212; c=relaxed/simple;
	bh=HnDszNgDPR09hcP5JOd6N6M9gqiBBeo/7Pq2VIJRJe4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cDgE/ujSQtL1Z3xmSrCeCOtezhM/ACs8y0KXs++7LQWIKH/VwhJBqXrmfGjVhl6Z53n0dFnTL7nSJJe2Gmmh1r+bdNZStJznhvDYCMHXVOg/PIUu6InPHme7Hx+L+jcY7Z/yCEqNmDQ5GqAaTsVwtaIqzIuqm4ofWZMvrx9YERo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HviNcBVd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HviNcBVd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790970211; x=1822506211;
  h=date:from:to:cc:subject:message-id;
  bh=HnDszNgDPR09hcP5JOd6N6M9gqiBBeo/7Pq2VIJRJe4=;
  b=HviNcBVdJI2NvEdhvpWszEe/oX794px/zt1u2L8GxfB5MSnxOLit80qd
   xKvqdlEbe7Dhhd2pPJdZWiZail0YtAs3iG8wZ0gsdAQ6hpQWPquNXDVkY
   jIvPQ89L52ILyDNPhZ+9FHcdJbVqpseJnFUCKUJb11Y/x+iKtwJtzNWJI
   I6uBWScRQj9AzlRbvWmEyKEpUSzyn3NEFucRJQiNBAYm1L6xJthyggL7D
   nAUHPlmINdHR0E2tb9VGH5FAcbxFk/TomWeOnVPpQ/7FIhnHvBldSa3oH
   j96fxRrdQYL0RSYsrQrzc1GeVfrBrpDctf46BwP9a5x3KvBK1zCxlJQkV
   w==;
X-CSE-ConnectionGUID: G86I7Mi+T/O7AdsF2x0Z4w==
X-CSE-MsgGUID: Yi91oSQfSza6ZRjwSZjgAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="102415675"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="102415675"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 12:43:30 -0700
X-CSE-ConnectionGUID: 72WbEz+LS9OS7xlybGaozQ==
X-CSE-MsgGUID: UAJ9XfbZQfek1M+Xbv818g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="399456"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 02 Oct 2026 12:43:29 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCjAE-00000000TPl-3yRs;
	Fri, 02 Oct 2026 19:43:26 +0000
Date: Sat, 03 Oct 2026 03:42:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ld.lld: error: undefined symbol: iommu_put_pages_list
Message-ID: <202610030304.oLF3VaZd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Pranjal-Shrivastava/iommu-Add-reclaim_list-xarray-to-struct-iommu_domain/20261001-230215, commit: 500ec14f96dbb4ca3ad2c39349b778c8a25fe0b7"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Pranjal Shrivastava <praan@google.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pranjal-Shrivastava/iommu-Add-reclaim_list-xarray-to-struct-iommu_domain/20261001-230215
head:   27fca47089358dfe3840aa0b0c9795b3963c21b9
commit: 500ec14f96dbb4ca3ad2c39349b778c8a25fe0b7 iommupt: Introduce lockless page table shrinker
date:   20 hours ago
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: hexagon-randconfig-1000-20261002 (https://download.01.org/0day-ci/archive/20261003/202610030304.oLF3VaZd-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610030304.oLF3VaZd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610030304.oLF3VaZd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: iommu_put_pages_list
   >>> referenced by shrinker.c:117 (drivers/iommu/generic_pt/shrinker.c:117)
   >>>               drivers/iommu/generic_pt/shrinker.o:(generic_pt_shrinker_scan) in archive vmlinux.a
   >>> referenced by shrinker.c:117 (drivers/iommu/generic_pt/shrinker.c:117)
   >>>               drivers/iommu/generic_pt/shrinker.o:(generic_pt_shrinker_scan) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
