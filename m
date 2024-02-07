Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A25823C3
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Feb 2024 19:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707334636; cv=none; b=iFgPz8qCMJNEWXKhfLMl+9upAJB7PjTC0vQ/6K7DxavswkCPq2kG1M2Wt/DTPrmeBBL3xLVGBH0VldMgx6UUG6oBH9tpH1MwWvDAYt1EYsI3Z2j+iv3t8f9Mpa762pP/JeKusS6JSEE5bA6mX6lye3VogMFGDIqvwtMTS+0izDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707334636; c=relaxed/simple;
	bh=lu3d/UiYKJBG8Q+IBmPqv+9if0pzcE+EDhE0iQ+5uGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wy6zG5qrHRtiqP/OnVjREgQi4QyLgylt/OSJoCFKS66faHKvDCqzIF+UqoDOlEeka5mL/QGzZjVnY+5tLyvRU432Gu46RDWJjLdDkDXyPb0ny8hHL1yfnLZWNhKuZJP6eDNqEKg+zWi6EqYu1Fp7rqC9HCxOgn4EBMZfvPBrfWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dqU0j39M; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dqU0j39M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707334634; x=1738870634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lu3d/UiYKJBG8Q+IBmPqv+9if0pzcE+EDhE0iQ+5uGs=;
  b=dqU0j39MERmqYtWEzWaqeMaZ68qfoQNoW9KxWRbZoqXKzIq7R5MhEsNq
   jg7r0WAKv1B9yA6pdYouBnERUyHlDjzm5cwbh9MxIqYn4MGtKRT9UqwjN
   zQ8Qkl0qhQzImBFLHl9rSMCssIWOlFT8pJMlBW4BykBuLQ29FHNZbJPvE
   fTftaQ42D+aTcTdrb8RWcdiT67C4iPduzkicH9f1K5QKWN//qHQ5vxBAp
   lpurWK/5GjIK+9j9ig6pwBEiobq3xiIFDkNnpH4VJqcL2Hxs5vmZ/NWVN
   YGTzEBKwaQo7Jb7PRGffk7p42arf3tny/1eF03tsANK5xb9uenKgfNVkx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="957308"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="957308"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 11:37:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="1421201"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Feb 2024 11:37:12 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXnjJ-0002zI-1c;
	Wed, 07 Feb 2024 19:37:09 +0000
Date: Thu, 8 Feb 2024 03:36:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v12 4/5] iommu/vt-d: pass pdev parameter for
 qi_check_fault() and refactor callers
Message-ID: <202402080321.n77hu71Y-lkp@intel.com>
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
In-Reply-To: <20240129034924.817005-5-haifeng.zhao@linux.intel.com>
References: <20240129034924.817005-5-haifeng.zhao@linux.intel.com>
TO: Ethan Zhao <haifeng.zhao@linux.intel.com>
TO: baolu.lu@linux.intel.com
TO: bhelgaas@google.com
TO: robin.murphy@arm.com
TO: jgg@ziepe.ca
CC: kevin.tian@intel.com
CC: dwmw2@infradead.org
CC: will@kernel.org
CC: lukas@wunner.de
CC: yi.l.liu@intel.com
CC: iommu@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: linux-pci@vger.kernel.org
CC: Ethan Zhao <haifeng.zhao@linux.intel.com>

Hi Ethan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 41bccc98fb7931d63d03f326a746ac4d429c1dd3]

url:    https://github.com/intel-lab-lkp/linux/commits/Ethan-Zhao/PCI-make-pci_dev_is_disconnected-helper-public-for-other-drivers/20240129-115259
base:   41bccc98fb7931d63d03f326a746ac4d429c1dd3
patch link:    https://lore.kernel.org/r/20240129034924.817005-5-haifeng.zhao%40linux.intel.com
patch subject: [PATCH v12 4/5] iommu/vt-d: pass pdev parameter for qi_check_fault() and refactor callers
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: x86_64-randconfig-161-20240207 (https://download.01.org/0day-ci/archive/20240208/202402080321.n77hu71Y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402080321.n77hu71Y-lkp@intel.com/

smatch warnings:
drivers/iommu/intel/dmar.c:1533 qi_flush_dev_iotlb() error: we previously assumed 'info->dev' could be null (see line 1533)

vim +1533 drivers/iommu/intel/dmar.c

3481f21097cb56 drivers/pci/dmar.c         Youquan Song 2008-10-16  1521  
20da7293134024 drivers/iommu/intel/dmar.c Ethan Zhao   2024-01-28  1522  void qi_flush_dev_iotlb(struct intel_iommu *iommu,
20da7293134024 drivers/iommu/intel/dmar.c Ethan Zhao   2024-01-28  1523  			struct device_domain_info *info, u64 addr,
20da7293134024 drivers/iommu/intel/dmar.c Ethan Zhao   2024-01-28  1524  			unsigned int mask)
6ba6c3a4cacfd6 drivers/pci/dmar.c         Yu Zhao      2009-05-18  1525  {
c830e699e08a6c drivers/iommu/intel/dmar.c Ethan Zhao   2024-01-28  1526  	struct pci_dev *pdev = NULL;
20da7293134024 drivers/iommu/intel/dmar.c Ethan Zhao   2024-01-28  1527  	u16 sid, qdep, pfsid;
6ba6c3a4cacfd6 drivers/pci/dmar.c         Yu Zhao      2009-05-18  1528  	struct qi_desc desc;
6ba6c3a4cacfd6 drivers/pci/dmar.c         Yu Zhao      2009-05-18  1529  
20da7293134024 drivers/iommu/intel/dmar.c Ethan Zhao   2024-01-28  1530  	if (!info || !info->ats_enabled)
20da7293134024 drivers/iommu/intel/dmar.c Ethan Zhao   2024-01-28  1531  		return;
20da7293134024 drivers/iommu/intel/dmar.c Ethan Zhao   2024-01-28  1532  
c830e699e08a6c drivers/iommu/intel/dmar.c Ethan Zhao   2024-01-28 @1533  	if (info->dev || !dev_is_pci(info->dev))
c830e699e08a6c drivers/iommu/intel/dmar.c Ethan Zhao   2024-01-28  1534  		return;
c830e699e08a6c drivers/iommu/intel/dmar.c Ethan Zhao   2024-01-28  1535  
c830e699e08a6c drivers/iommu/intel/dmar.c Ethan Zhao   2024-01-28  1536  	pdev = to_pci_dev(info->dev);
20da7293134024 drivers/iommu/intel/dmar.c Ethan Zhao   2024-01-28  1537  	sid = info->bus << 8 | info->devfn;
20da7293134024 drivers/iommu/intel/dmar.c Ethan Zhao   2024-01-28  1538  	qdep = info->ats_qdep;
20da7293134024 drivers/iommu/intel/dmar.c Ethan Zhao   2024-01-28  1539  	pfsid = info->pfsid;
0f5432a9b83984 drivers/iommu/intel/dmar.c Lu Baolu     2023-11-22  1540  	/*
0f5432a9b83984 drivers/iommu/intel/dmar.c Lu Baolu     2023-11-22  1541  	 * VT-d spec, section 4.3:
0f5432a9b83984 drivers/iommu/intel/dmar.c Lu Baolu     2023-11-22  1542  	 *
0f5432a9b83984 drivers/iommu/intel/dmar.c Lu Baolu     2023-11-22  1543  	 * Software is recommended to not submit any Device-TLB invalidation
0f5432a9b83984 drivers/iommu/intel/dmar.c Lu Baolu     2023-11-22  1544  	 * requests while address remapping hardware is disabled.
0f5432a9b83984 drivers/iommu/intel/dmar.c Lu Baolu     2023-11-22  1545  	 */
0f5432a9b83984 drivers/iommu/intel/dmar.c Lu Baolu     2023-11-22  1546  	if (!(iommu->gcmd & DMA_GCMD_TE))
0f5432a9b83984 drivers/iommu/intel/dmar.c Lu Baolu     2023-11-22  1547  		return;
0f5432a9b83984 drivers/iommu/intel/dmar.c Lu Baolu     2023-11-22  1548  
6ba6c3a4cacfd6 drivers/pci/dmar.c         Yu Zhao      2009-05-18  1549  	if (mask) {
c8acb28b331364 drivers/iommu/dmar.c       Joerg Roedel 2017-08-11  1550  		addr |= (1ULL << (VTD_PAGE_SHIFT + mask - 1)) - 1;
5d308fc1ecf535 drivers/iommu/dmar.c       Lu Baolu     2018-12-10  1551  		desc.qw1 = QI_DEV_IOTLB_ADDR(addr) | QI_DEV_IOTLB_SIZE;
6ba6c3a4cacfd6 drivers/pci/dmar.c         Yu Zhao      2009-05-18  1552  	} else
5d308fc1ecf535 drivers/iommu/dmar.c       Lu Baolu     2018-12-10  1553  		desc.qw1 = QI_DEV_IOTLB_ADDR(addr);
6ba6c3a4cacfd6 drivers/pci/dmar.c         Yu Zhao      2009-05-18  1554  
6ba6c3a4cacfd6 drivers/pci/dmar.c         Yu Zhao      2009-05-18  1555  	if (qdep >= QI_DEV_IOTLB_MAX_INVS)
6ba6c3a4cacfd6 drivers/pci/dmar.c         Yu Zhao      2009-05-18  1556  		qdep = 0;
6ba6c3a4cacfd6 drivers/pci/dmar.c         Yu Zhao      2009-05-18  1557  
5d308fc1ecf535 drivers/iommu/dmar.c       Lu Baolu     2018-12-10  1558  	desc.qw0 = QI_DEV_IOTLB_SID(sid) | QI_DEV_IOTLB_QDEP(qdep) |
1c48db44924298 drivers/iommu/dmar.c       Jacob Pan    2018-06-07  1559  		   QI_DIOTLB_TYPE | QI_DEV_IOTLB_PFSID(pfsid);
5d308fc1ecf535 drivers/iommu/dmar.c       Lu Baolu     2018-12-10  1560  	desc.qw2 = 0;
5d308fc1ecf535 drivers/iommu/dmar.c       Lu Baolu     2018-12-10  1561  	desc.qw3 = 0;
6ba6c3a4cacfd6 drivers/pci/dmar.c         Yu Zhao      2009-05-18  1562  
c830e699e08a6c drivers/iommu/intel/dmar.c Ethan Zhao   2024-01-28  1563  	qi_submit_sync(iommu, &desc, 1, 0, pdev);
6ba6c3a4cacfd6 drivers/pci/dmar.c         Yu Zhao      2009-05-18  1564  }
6ba6c3a4cacfd6 drivers/pci/dmar.c         Yu Zhao      2009-05-18  1565  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
