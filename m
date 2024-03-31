Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B088BE8
	for <oe-kbuild@lists.linux.dev>; Sun, 31 Mar 2024 09:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711877425; cv=none; b=ItGP3+USYbWrwQqlG4yFEhmBSW3NcSh8OOcCx8ELeUr+w9aEiRGqUay7vsEgysBTZmUTCRQl+wv2RVyIxbjbQVf0yeT0DZtRIFW07aag5N6sm7bohznuCA1TTc8+T4t0R+kRLP0LQ/OpzaY2ZaoNv+xExzh21LoFXJ/5YzKEepA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711877425; c=relaxed/simple;
	bh=yXfo5RaaDsYQ2Hov6zJzPU0G++CTTcqRXHcimW1kdpE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aHbZGRX7ba3v6qJ9FCzajBnXU6qMNMek/nKc/aPVZ7KoFJDteaRi1rSMF7AFJptm1c3HAJYtnF9MOfGE5jMnfB6UxZXsSi4ebpEJtOUp/tn0vOF06ciIBkShxeUM44Ld8nmFcYtZJtaoCC22iRJK6aiPZ2hhOd+T1d/VBep8yVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xk8uycCI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xk8uycCI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711877423; x=1743413423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yXfo5RaaDsYQ2Hov6zJzPU0G++CTTcqRXHcimW1kdpE=;
  b=Xk8uycCIelfeD9QOrHNWjif8f2Tqs741cdlwoxhwKQD7uJzwqwD9+MxS
   Pjgo5MDaBJ7Os2WofAOHyyoMHKXBo1hSW1JGHkOCkO+sw/6iO63e+jCHo
   RUF1QdGPcxA42pxFNbIQQlpK8yWPbeMlZ8wKlzrAYAcn6Cf7liWe1YEor
   CMJKGdSa6t/FMxWfG/SFlDR6YKJryP6HPYu8B39ih3qlLBXprf4Z8rUhR
   XlognbQfHwy2T4mew/fG8jJ3wy2OjjZ5LSI0CYbynXHHzk7uwppOn78i0
   CNE0uIRy0bNIvbHRP6cxwXydO6eXxESdPfjxobmHlEVCqs9qvIH2oGj9X
   w==;
X-CSE-ConnectionGUID: 8iezOQqSRSWQFoSODk/gjA==
X-CSE-MsgGUID: EZ8vulgXSiO2gNNrUzAsgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11029"; a="18162357"
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="18162357"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 02:30:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="18038790"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 31 Mar 2024 02:30:22 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqrW7-0000z2-1X;
	Sun, 31 Mar 2024 09:30:19 +0000
Date: Sun, 31 Mar 2024 17:29:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/amd/io_pgtable_v2.c:355 v2_free_pgtable() warn: can
 'pgtable' even be NULL?
Message-ID: <202403311704.uQeQ5FDv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
CC: Joerg Roedel <jroedel@suse.de>
CC: Vasant Hegde <vasant.hegde@amd.com>
CC: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   712e14250dd2907346617eba275c46f53db8fae7
commit: e8e1aac33458d80545e5ad37b2a3e4243eee278e iommu/amd: Refactor helper function for setting / clearing GCR3
date:   7 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-161-20240331 (https://download.01.org/0day-ci/archive/20240331/202403311704.uQeQ5FDv-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403311704.uQeQ5FDv-lkp@intel.com/

smatch warnings:
drivers/iommu/amd/io_pgtable_v2.c:355 v2_free_pgtable() warn: can 'pgtable' even be NULL?

vim +/pgtable +355 drivers/iommu/amd/io_pgtable_v2.c

aaac38f614871d Vasant Hegde          2022-08-25  350  
aaac38f614871d Vasant Hegde          2022-08-25  351  static void v2_free_pgtable(struct io_pgtable *iop)
aaac38f614871d Vasant Hegde          2022-08-25  352  {
aaac38f614871d Vasant Hegde          2022-08-25  353  	struct amd_io_pgtable *pgtable = container_of(iop, struct amd_io_pgtable, iop);
aaac38f614871d Vasant Hegde          2022-08-25  354  
e8e1aac33458d8 Suravee Suthikulpanit 2024-02-05 @355  	if (!pgtable || !pgtable->pgd)
aaac38f614871d Vasant Hegde          2022-08-25  356  		return;
aaac38f614871d Vasant Hegde          2022-08-25  357  
aaac38f614871d Vasant Hegde          2022-08-25  358  	/* Free page table */
aaac38f614871d Vasant Hegde          2022-08-25  359  	free_pgtable(pgtable->pgd, get_pgtable_level());
e8e1aac33458d8 Suravee Suthikulpanit 2024-02-05  360  	pgtable->pgd = NULL;
aaac38f614871d Vasant Hegde          2022-08-25  361  }
aaac38f614871d Vasant Hegde          2022-08-25  362  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
