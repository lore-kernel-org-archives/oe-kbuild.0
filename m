Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F399221DB1
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Dec 2025 04:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766550718; cv=none; b=LfbK3q+S7UtXt9hNAfozux+fOX9Pw8wwvabpOayUZVFJDH9AOZr8Tnix9rz9S2QZcWNlfXvikPA+LdX7ku6m3yA9St/owcWB9lCO3ticuc1OM4HVVoGOmE14uY/sOQ4Vmr2hz6VyO25aRD0sVmEj0h7AuwrKjahSP4ypFVQIXyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766550718; c=relaxed/simple;
	bh=Ilc/kBQ31s6nUKYc+y+rVvbnnUMWc0/qWw7D4HQNBg0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q9qBR+O/i1LHztqSDm4VNutgJGciwg98F41x1u1m+Ja5n5J4aVgHAXUG9MV4d4sGSnVNg5ZUu0Vir2X4d8OHyXSHvuHVmO7Hw2BeHM9UV482ra/Oe0baEQD/WsQzTyJncpqeGR+h4imNNR4P5MzHAlT2vxj7JkASKjIiksP80Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fQlYKqBe; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fQlYKqBe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766550716; x=1798086716;
  h=date:from:to:cc:subject:message-id;
  bh=Ilc/kBQ31s6nUKYc+y+rVvbnnUMWc0/qWw7D4HQNBg0=;
  b=fQlYKqBebRgdVG0qZKNuElcd3TTuD4dH2B9p/q/iH5LVdzIhHc+gAE3X
   y+lJBZFQkohf/V08RGZH2zYj7HD+shle7C3X7ZfaqPETVTQase7c6FTx2
   u+ZVhb/rtaQSmcpEP6mN+bora7ENt8qncDOH7YyCubySS3S32BlQO9/Vw
   Y4Lmg6u0FZ63GkUqIzwEuJNvh8Ylvdend0xKCkkPoyMyDniGz4RPcFUBI
   GVsQRsc2qZ0qANgZd5Lk0nZcXD+75AuL3QA97F0INT+AAjD5gF/Ddi35B
   gRUcLtKpZ8RWhJwm/atOaZLiPXJ/aOQHK7i9xFyS/YoSaB4xPsKMKrDkq
   A==;
X-CSE-ConnectionGUID: KCBxGVv5Tp2ufe+7jcKH6g==
X-CSE-MsgGUID: C7HtT4BBRk+3pDPuQZuP7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68289738"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="68289738"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 20:31:56 -0800
X-CSE-ConnectionGUID: eRPno8rXTqe460TfVXMOoQ==
X-CSE-MsgGUID: 5fdVx3WvQleC09J80fTgSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="200822220"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 23 Dec 2025 20:31:54 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYGWr-000000002fR-0Pdd;
	Wed, 24 Dec 2025 04:31:30 +0000
Date: Wed, 24 Dec 2025 12:30:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jgunthorpe:iommu_pt_riscv 6/7]
 drivers/iommu/riscv/iommu.c:1468:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202512241220.omy7JfKd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/iommu/riscv/iommu.c:1468:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://github.com/jgunthorpe/linux iommu_pt_riscv
head:   cde8a040db2d66ed49a2e93a0bbbbbf1cb83d7a7
commit: 937e886354f0940f3d8506553007cea935b81646 [6/7] iommu/riscv: Allow RISC_VIOMMU to COMPILE_TEST
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: loongarch-randconfig-r121-20251224 (https://download.01.org/0day-ci/archive/20251224/202512241220.omy7JfKd-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512241220.omy7JfKd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512241220.omy7JfKd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/riscv/iommu.c:1380:13: sparse: sparse: too long token expansion
   drivers/iommu/riscv/iommu.c:1380:13: sparse: sparse: too long token expansion
   drivers/iommu/riscv/iommu.c:1380:13: sparse: sparse: too long token expansion
   drivers/iommu/riscv/iommu.c:1380:13: sparse: sparse: too long token expansion
   drivers/iommu/riscv/iommu.c:1380:13: sparse: sparse: too long token expansion
   drivers/iommu/riscv/iommu.c:1380:13: sparse: sparse: too long token expansion
>> drivers/iommu/riscv/iommu.c:1468:1: sparse: sparse: bad integer constant expression
   drivers/iommu/riscv/iommu.c:1468:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"

vim +1468 drivers/iommu/riscv/iommu.c

e89e825351115d Jason Gunthorpe 2025-05-07  1467  
e89e825351115d Jason Gunthorpe 2025-05-07 @1468  MODULE_IMPORT_NS("GENERIC_PT_IOMMU");

:::::: The code at line 1468 was first introduced by commit
:::::: e89e825351115d0aaec359d3651f28c4913a476f iommu/riscv: Use the generic iommu page table

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
