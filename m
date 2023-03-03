Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B89538C
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Mar 2023 11:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677843915; x=1709379915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vvNyPskH5hm63FKUW65KnoBXfne16eJKlVsM1L7VzOY=;
  b=CpzgndPt9HuK8fjfm9oRMbT2IW8ABv8XaCOKMRPlVPER+s/eOGiFlAH9
   erm5dCH6rOkjNTt/ttQknIjdHMG+YEekO1Z3a7wy6lVYpcIxAj/UkOfxy
   l3OeVTohz6V6rlKILcsgldoIlH7LSEm587zouCPIohT9z7xkNzujD6sPZ
   zAy1rjjQDaZTTevr32nkZc897pFu3p9/OLp1KQenwypQQA9zKPB0+rzjy
   K6X32D7BpUAx2Xo6hVGtPfgzU1kIkDGpBdWq7+uDDKoNKUBTUgDg3AL7V
   xUTJZ8wgKTZT/yOUo1rWmY2th7b6YD918cl/pbE2WCQ338QrCjHvwl1GH
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="362619614"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="362619614"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 03:45:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="849435518"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="849435518"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 03 Mar 2023 03:45:13 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pY3qa-0001QC-2n;
	Fri, 03 Mar 2023 11:45:12 +0000
Date: Fri, 3 Mar 2023 19:44:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [jgunthorpe:iommufd_hwpt 28/43]
 drivers/iommu/iommufd/hw_pagetable.c:142:5-11: inconsistent IS_ERR and
 PTR_ERR on line 143.
Message-ID: <202303031954.3LVe3aFq-lkp@intel.com>
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
TO: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://github.com/jgunthorpe/linux iommufd_hwpt
head:   d3282ba3ccf913d4b7fc93ad8b3c2f27927d8b68
commit: bdd1cf77bed7af23eb904b658da24daadce6acd0 [28/43] iommufd: Add IOMMU_HWPT_ALLOC
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: ia64-randconfig-c034-20230302 (https://download.01.org/0day-ci/archive/20230303/202303031954.3LVe3aFq-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202303031954.3LVe3aFq-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iommu/iommufd/hw_pagetable.c:142:5-11: inconsistent IS_ERR and PTR_ERR on line 143.
   drivers/iommu/iommufd/hw_pagetable.c:150:5-11: inconsistent IS_ERR and PTR_ERR on line 151.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
