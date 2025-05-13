Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4511BC2A
	for <oe-kbuild@lists.linux.dev>; Tue, 13 May 2025 02:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747104719; cv=none; b=E2+JIykPF4eG8n20wI5aEyjNy6twGnlzqpmizm/KqoO8EoQFoAEitoIGQGYzHWGJpVcgLZwimWbJ07NgXKvZrfkzTmAZFLg05HAujXQbQgf39HUU/2XC2V0RrPjuzoUHlvMs1LeYK7jLEZCzPbRmZ8KGdUP4S/TnZJNyzVN3MWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747104719; c=relaxed/simple;
	bh=7lsGIm4y/aV3knwYnAS9zDBLuKbZuTwkpXRyTteGwMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ebvpsqhw4wTvzMNlRz5W1H8ZOe03cEqCjyJMKiFijg3g1SF5bSKpN8niuhTa4oiIcuNqNmzB6qOkpcTrnC5nQoxIbD2ZXkJCNMgjAIQkr+3iVDP0+jNLe/oWWZE+JAan4uG/HyntE/HO6lrS4e4Xiicsc5guXcmnD1L8hj+j6X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PkbbQMBc; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PkbbQMBc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747104718; x=1778640718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7lsGIm4y/aV3knwYnAS9zDBLuKbZuTwkpXRyTteGwMY=;
  b=PkbbQMBcY04/ZE4QEh6u89JQ+M21t4NIHx2ri9ThDFg5TplENUziOoIM
   tyZu60GIiVb7QODnQfJD74Q340nkYzPROyYanjsxrVzgaeE3fH4oE9T7u
   myA4MQCQu8IyDawnoOQSmoy026d7UC6pFUcchWBLsyZ5J5vyMKGmidnkf
   x2SjFesOoYpoLvdg1KnUs/QbvZE9QQNv9VU0vjyDZA1UgGqmzVsbi0yx+
   3WAGWbadkwMKdrn1hCVM5/kCDQ3zxR/7Qad8tW3FUe9NUPogu5hwh5hA8
   zovvUjOlKflT/HRzpv+oc6ruExJ7GSCeM+ga6siI3nKD66ZK7NCYEt8Yy
   g==;
X-CSE-ConnectionGUID: ID2rApbUSLaCkF6vSBlvAQ==
X-CSE-MsgGUID: CzcwipXbRfaXReLXPDtKXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="66475480"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="66475480"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 19:51:57 -0700
X-CSE-ConnectionGUID: /ghCZdbmQwiaSrmG4ZeQOg==
X-CSE-MsgGUID: gBQAItd8RWiiYz/WuUqDLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="168650629"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 May 2025 19:51:56 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEfkH-000Fbv-34;
	Tue, 13 May 2025 02:51:53 +0000
Date: Tue, 13 May 2025 10:50:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 6/6] iommu: make inclusion of iommufd directory
 conditional
Message-ID: <202505131001.hEIJFgMF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <5568089.Sb9uPGUboI@devpool92.emlix.com>
References: <5568089.Sb9uPGUboI@devpool92.emlix.com>
TO: Rolf Eike Beer <eb@emlix.com>
TO: Joerg Roedel <joro@8bytes.org>
TO: Will Deacon <will@kernel.org>
CC: iommu@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: Robin Murphy <robin.murphy@arm.com>
CC: Jason Gunthorpe <jgg@ziepe.ca>

Hi Rolf,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250512]
[also build test ERROR on v6.15-rc6]
[cannot apply to arm-perf/for-next/perf linus/master v6.15-rc6 v6.15-rc5 v6.15-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rolf-Eike-Beer/iommu-remove-duplicate-selection-of-DMAR_TABLE/20250512-212423
base:   next-20250512
patch link:    https://lore.kernel.org/r/5568089.Sb9uPGUboI%40devpool92.emlix.com
patch subject: [PATCH 6/6] iommu: make inclusion of iommufd directory conditional
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arm64-randconfig-003-20250513 (https://download.01.org/0day-ci/archive/20250513/202505131001.hEIJFgMF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505131001.hEIJFgMF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505131001.hEIJFgMF-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/vfio/vfio_main.o: in function `vfio_ioctl_device_feature':
>> vfio_main.c:(.text+0x34fc): undefined reference to `iova_bitmap_alloc'
>> aarch64-linux-ld: vfio_main.c:(.text+0x351c): undefined reference to `iova_bitmap_for_each'
>> aarch64-linux-ld: vfio_main.c:(.text+0x3528): undefined reference to `iova_bitmap_free'
   aarch64-linux-ld: drivers/vfio/pci/pds/dirty.o: in function `pds_vfio_dma_logging_report':
>> dirty.c:(.text+0x13c4): undefined reference to `iova_bitmap_set'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
