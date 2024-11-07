Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233F843169
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 03:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730950799; cv=none; b=qEn6SpWFoU7CvzUm3WnEvmSPutersP+sZPhwx6+dRmZnaRtV9SnDuj6+xsUZE0JzJ8R/39Rm8oM/V52zNjCQ9dTiJbJ5WlJiAxQ4eeNeCgniWGCvJqQbunCg9KAnAMcKCvYGFddh/RVnvUjhT1pVy4lRJC44Ii5TO2Jt9GLVLmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730950799; c=relaxed/simple;
	bh=/sEYpUiEArVwEAnOESvOahZsNzXLoP0vITm/hnpTuQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l5xulUIrztDwGparkZmk4DDgdqPNcHNmE9N4lltmBszWek0SHTbYEi6buiMrQDyyHiQkZ/8g/eHU1NhgrWOCgJMKuP2VwNj3JlS99TTvkWT8/LsT8ld9ziVoOCujRV8yzCYHteWfaYs1GYrtJJb8LFjBSgdKI5qaxrjWiQTx+iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HfMnI774; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HfMnI774"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730950798; x=1762486798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/sEYpUiEArVwEAnOESvOahZsNzXLoP0vITm/hnpTuQ8=;
  b=HfMnI774rm89zxTzAiP2bsKb7RzrLG4hcARLWEF6pu+7dGz0vcmjCtOG
   CBq/QXIQEe3wMy6UkK87OBo32hVpd9V32WgdqdQJ7aVMNsr2MleQZLNVE
   Q6DZ0VosAEnbpNHl2STEv9+2Qkf2ZBATvvBY7Mg2eORXi6SFtBZoxmBGe
   8rvtw1Q9xLwZ+LnY5QzVIQYJn0Kn8mTSPYCXPZF8Zw62wwlNDFsBlc9SM
   3Lod722YhmEAB9GOfVvf1+s3bJWncp4VWHjB1JGpGA0/VazF9QdZ6zJGh
   hikgbIq5q2uR43KdppbTwQZKJB+k7LCYskbfhQ35oIOwtubQeFaEpf+/K
   g==;
X-CSE-ConnectionGUID: pFOgXF4DSZqSpu0qmWfxvA==
X-CSE-MsgGUID: ydtq8H6KRRSavuejeXb14g==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="34698425"
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="34698425"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 19:39:55 -0800
X-CSE-ConnectionGUID: RbBDkGeoRHKri6TS4SD9yQ==
X-CSE-MsgGUID: sTYEkKuAR8OC1QdYQQiICA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="89687013"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Nov 2024 19:39:54 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8tN9-000pnG-20;
	Thu, 07 Nov 2024 03:39:51 +0000
Date: Thu, 7 Nov 2024 11:39:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/amd/io_pgtable_v2.c:355 v2_free_pgtable() warn: can
 'pgtable' even be NULL?
Message-ID: <202411071105.PMHr50zb-lkp@intel.com>
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
head:   ff7afaeca1a15fbeaa2c4795ee806c0667bd77b2
commit: e8e1aac33458d80545e5ad37b2a3e4243eee278e iommu/amd: Refactor helper function for setting / clearing GCR3
date:   9 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-161-20241107 (https://download.01.org/0day-ci/archive/20241107/202411071105.PMHr50zb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411071105.PMHr50zb-lkp@intel.com/

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
