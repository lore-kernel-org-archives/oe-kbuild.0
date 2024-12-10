Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4390423DE85
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Dec 2024 10:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733824916; cv=none; b=sQf/Qz0EHCazU03W5dxQzKji3O1AiHNTwXllEAqJkNGSLNsZyDaqIyHKU23Uhwi5nbaJxq23sDthvvYvn7iw8+bqejUsNos4MvxyhQfCdYIv00A+fDpzhu0xhYn430WkIz2p8Svto9at+h5CEOCH2zhO2QwyyUBTcG6LLOjv6QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733824916; c=relaxed/simple;
	bh=n/PkbFqSE0BNAw0ZRA98NSKth3yBkewJQxa42A2AoJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u5fjybgqpvw+AuMBsXKVUcc+WlmneQDO8tuXq2bR28QgXeQkXG7GWtZqb8gFEasXCy046EXB9TjRu5Nv4q5bjRlY4576NKQT1CZmVO8f42gMowbbRlCQjLMYnwBf2TQsN564StTFr699DDoVAV8Q/kmABM+cl2RrXDUqbpnsyC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xm+dSbGV; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xm+dSbGV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733824914; x=1765360914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n/PkbFqSE0BNAw0ZRA98NSKth3yBkewJQxa42A2AoJ8=;
  b=Xm+dSbGVvcPYjLs1j9el90md4A56dEmdxceU+DyKhYVXcQaHp857ebnt
   RtN/UwacYjrkEs+cVSwNw9dhGNPBifvf0zTXZ3NRIuu+gk9BWgAt1RlUR
   EF6g5CxFmY358hk0IzYy+FnBgX+BkrZiUlrHsllZdV4yhKfqDmMGe3o3k
   NuZ08WPdqiOc11KCCBRySPLsnkG97gux9SdyB3JrQxMjEmg4q6naA8AN1
   EREMOXzukIjgu9mbGwTowHLtqwWXBRinz4Kdb324yReCmHnmKYhSfnBJL
   ymw7bIktpL4tbW0tS0EPAAnfK6ZhCMauh06n/UwZR6g0/fa3HJS0TfqlH
   A==;
X-CSE-ConnectionGUID: 7W2VXp+GTqqUD6eJ4b4GTw==
X-CSE-MsgGUID: 3EmGZnrbSdq7UnHBCJ93RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="56640718"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="56640718"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 02:01:54 -0800
X-CSE-ConnectionGUID: JADx7k10QOCS+sbbtoefyA==
X-CSE-MsgGUID: w47eveIuRJeYyFF2T2HaYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="95703328"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Dec 2024 02:01:52 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKx3t-0005NH-2E;
	Tue, 10 Dec 2024 10:01:49 +0000
Date: Tue, 10 Dec 2024 18:00:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/amd/io_pgtable_v2.c:355 v2_free_pgtable() warn: can
 'pgtable' even be NULL?
Message-ID: <202412101745.E2pIhRjQ-lkp@intel.com>
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
head:   7cb1b466315004af98f6ba6c2546bb713ca3c237
commit: e8e1aac33458d80545e5ad37b2a3e4243eee278e iommu/amd: Refactor helper function for setting / clearing GCR3
date:   10 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-r073-20241208 (https://download.01.org/0day-ci/archive/20241210/202412101745.E2pIhRjQ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412101745.E2pIhRjQ-lkp@intel.com/

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
