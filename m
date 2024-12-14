Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBFB63C
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Dec 2024 13:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734183170; cv=none; b=FSzsF8Wg+x4/kEQozjTaCbJEnEtQ9U6MblxPwGzCWC9VgqP5A5tCL+lUs+gLE56N+mMUTrMhC0xGy6A4bzYSQLhR+mebzb96ph4MvNFbx0grtvFBL18k8JI+8URSG5PyROFpyQwc4WoRkf85RlkUvjKLaDgUN46B4q+bn3pWS8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734183170; c=relaxed/simple;
	bh=gs+feSx451B2wg4slf0M7OE60JnNF0Dl4gS4KEPIDd8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tm4N6FIQruqd/6ptWxN/si/REUwcK3OzfiFQhDrB7RS9vOYMaKA8hufZz2++oIgY1hffuTizvTDKABdixM1xw8R5Xi5Wk/AyY0uWBOmx25JUXmWBqPPrBUt5ibN3sikuw+8TLaLj93ltiZCs/3iBYDENLoiP4lYqdaiEqlx2grg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZNVvQz3w; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZNVvQz3w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734183168; x=1765719168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gs+feSx451B2wg4slf0M7OE60JnNF0Dl4gS4KEPIDd8=;
  b=ZNVvQz3whEhers2LuWtWNcJtyUkDvNaPTd0y/UWLStZNP8pmi82t/tmf
   rjFxCFSXfK1v1meGara1Wi7Owwx3Kq/fGH5ZUSa59DkJ40l5tnMWyn3Tq
   8w4/M5rH8dEpp4eEdMZxl9J0u41Oj00sD17+ZPGDhtwA6kZgPYSOKm5Ig
   74GrJ/9y63szYay7cq/ZFTUzbafT5dZjP+svCbT4lLrqmkc8CyEtqleRP
   P03LrU0c6/FuW5XTmdBazSnAPCi7nw00CM4LvrpgKWXOfXH1Mc2+BmlYX
   UG2ljOe7BomDQZzKhh4tQbk+Ap4Mx62GulFpl94DoGwp45pzAgaWwqkSf
   g==;
X-CSE-ConnectionGUID: fmZ55ombTaG3ULp6xB4Opw==
X-CSE-MsgGUID: VQ0M4xiqRL29Dogm9R2SrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34670837"
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="34670837"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 05:32:47 -0800
X-CSE-ConnectionGUID: z8RIRpCpQw+uMAi+H65rUg==
X-CSE-MsgGUID: qbRwwDbrQbS6xchVN3K23g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="96657242"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Dec 2024 05:32:46 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMSGC-000CxD-03;
	Sat, 14 Dec 2024 13:32:44 +0000
Date: Sat, 14 Dec 2024 21:32:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/amd/io_pgtable_v2.c:355 v2_free_pgtable() warn: can
 'pgtable' even be NULL?
Message-ID: <202412142124.wxOrOpUF-lkp@intel.com>
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
head:   a446e965a188ee8f745859e63ce046fe98577d45
commit: e8e1aac33458d80545e5ad37b2a3e4243eee278e iommu/amd: Refactor helper function for setting / clearing GCR3
date:   10 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-r073-20241208 (https://download.01.org/0day-ci/archive/20241214/202412142124.wxOrOpUF-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412142124.wxOrOpUF-lkp@intel.com/

smatch warnings:
drivers/iommu/amd/io_pgtable_v2.c:355 v2_free_pgtable() warn: can 'pgtable' even be NULL?

vim +/pgtable +355 drivers/iommu/amd/io_pgtable_v2.c

aaac38f614871df Vasant Hegde          2022-08-25  350  
aaac38f614871df Vasant Hegde          2022-08-25  351  static void v2_free_pgtable(struct io_pgtable *iop)
aaac38f614871df Vasant Hegde          2022-08-25  352  {
aaac38f614871df Vasant Hegde          2022-08-25  353  	struct amd_io_pgtable *pgtable = container_of(iop, struct amd_io_pgtable, iop);
aaac38f614871df Vasant Hegde          2022-08-25  354  
e8e1aac33458d80 Suravee Suthikulpanit 2024-02-05 @355  	if (!pgtable || !pgtable->pgd)
aaac38f614871df Vasant Hegde          2022-08-25  356  		return;
aaac38f614871df Vasant Hegde          2022-08-25  357  
aaac38f614871df Vasant Hegde          2022-08-25  358  	/* Free page table */
aaac38f614871df Vasant Hegde          2022-08-25  359  	free_pgtable(pgtable->pgd, get_pgtable_level());
e8e1aac33458d80 Suravee Suthikulpanit 2024-02-05  360  	pgtable->pgd = NULL;
aaac38f614871df Vasant Hegde          2022-08-25  361  }
aaac38f614871df Vasant Hegde          2022-08-25  362  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
