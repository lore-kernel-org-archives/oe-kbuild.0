Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F866A935
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Oct 2024 00:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728088910; cv=none; b=t910pqkfjbIbfAkgF6paNMXlXLgVMNLpP1JDEc1hOzVdD2TSpFYMqsLT3stXbuf9d54HTojMmn+ThgFNd77egfwIhoGwIzQ3ELKmnsBqPnz7LA0igfsxDpVC73Ky+0oNNQAVxDnRJp5+RIn4krJMlEQnjVPenzejd9vehqx/qX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728088910; c=relaxed/simple;
	bh=2M/D9Typdkn5WPBvULuEV2b4prvbbWg2bBEFAeElKkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UexaPIjNboEP4KLWEzx/rLmzxtnYBXAEQjHCnJBg0J5p3d2tfAvWGScXMOBPq3x/EZ92GWoicrw1ZHWhix4aqGgprY47aalZHgaSk5uWC9JSacIKGKI3UtMQMiV65fWwoDZtoOvUM1JsbXncE02cTd6C19epLyHmS+QOeY0v3wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D2OzIHjq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D2OzIHjq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728088908; x=1759624908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2M/D9Typdkn5WPBvULuEV2b4prvbbWg2bBEFAeElKkg=;
  b=D2OzIHjqEGBN8wj203FIXSgvNHXaqEfzDQFp4+OBmSy7/k8+GG3UCgLV
   Vp7R8FaH89Oa7czWWkDIGfm17XpYnntYLCWrehBVWi0jXoq3REcFKtlC+
   muzW/IVs6QTLkZSHmehMrpG4CrcC0mGgT3RKAJPv8P17F18fb1d9MIS4C
   qQG4EdCVbHy/ng1hHq/J44sNc8qJWDvJ/n26L3hVDmHUoQCQu1yL52mci
   4BoOKDk2tBMv7I4GCl4Dmu1r+LTBnE+jJeKq6ZRr0Q7sEcxPKk2eO1Y3f
   5rovUBbex610TQBuwHtBJZRh+aM4jfnWyHe+WgmGDzO6yT1ZdI3DKRHSn
   g==;
X-CSE-ConnectionGUID: BcMe7c5lTQm0Wj/nq4tsNA==
X-CSE-MsgGUID: w50G7nMtTS+Vgk7r3u1flw==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="44789726"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="44789726"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 17:41:48 -0700
X-CSE-ConnectionGUID: SksO++2cRd68j/LoRPtwLQ==
X-CSE-MsgGUID: SMgijH0JSquFU+8GigIYrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="74454309"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Oct 2024 17:41:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swsrh-0002Nk-00;
	Sat, 05 Oct 2024 00:41:45 +0000
Date: Sat, 5 Oct 2024 08:41:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/amd/io_pgtable_v2.c:355 v2_free_pgtable() warn: can
 'pgtable' even be NULL?
Message-ID: <202410050801.g5aHqBpc-lkp@intel.com>
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
head:   ac308609567d31fe44be80ab757a5ddf062362ef
commit: e8e1aac33458d80545e5ad37b2a3e4243eee278e iommu/amd: Refactor helper function for setting / clearing GCR3
date:   8 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-161-20241005 (https://download.01.org/0day-ci/archive/20241005/202410050801.g5aHqBpc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410050801.g5aHqBpc-lkp@intel.com/

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
