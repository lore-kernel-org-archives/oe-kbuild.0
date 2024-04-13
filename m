Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373593A8D8
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Apr 2024 09:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712999991; cv=none; b=oo+76rqkDc0cABeqG58Qi7GlYUc8+fjOoTEP8HqzFpnTZIyg7G0vbnFllOHvOVW1dYWOC9OUWwRFRZQK0ZzpyBKPFgE8LPUp3HRlaj8a4ieCq6ZM74tne/tMNFQjxbi457bLO3dnz6FZKCP7q/BYsy1oBmbHcStwRqhxsg65VOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712999991; c=relaxed/simple;
	bh=tUmtO65cg4Dw2KPJ3uQZ70kQTA2foJK/v2o1HszthNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HRPoOeih9+fLQKck0LsDSJQrazJKoVvDcSdbS3nS6S+lftBkV9fZ8aqJ3pvKJJfKENieSwqlcYtunBwOAwaxfNDvrn6bOKEHbDkvBL8URkiMVQ6n9PyEJFUQrSw+wPztfjuB56Aar4sOhNyNdwQKoH0DsmHt8I1Y49uiVzitZmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dzBWYqI9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dzBWYqI9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712999989; x=1744535989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tUmtO65cg4Dw2KPJ3uQZ70kQTA2foJK/v2o1HszthNU=;
  b=dzBWYqI9Z23HuHoxLUDrKktoCkgw+02nbkD2vQFDAVc6dvgL5dj472e8
   gA9MH7YEE1xbXlyiBwlfbQvbs1gso/JngTofiy7VhLWYcHabFty2sNNkF
   kFgBW2VwJaLKUDgQKi3QAxmFpzQ30BxTU2MEiiBWUsU0PXulF6I8FEBHv
   BW+aTaVb8fPBH1B1Li5k7+Yf3mv+jUUBhHC4clNwKn40SWaqHQOmks3r3
   i3wSPQnAYY0NjrgyH46dUEhl4qcJUhrYa+HbJd/Q2K9qqO9Zn4B06t7qU
   ZIWl0SogXA96wVhZ9tilnqCJxBWE9lqQwLSCf1GwuJ8uaxCJ+yV1jsjLm
   g==;
X-CSE-ConnectionGUID: aCgYD9oNTvqpW/ETNKxgoA==
X-CSE-MsgGUID: z1aG2lYtTy+GNqngglHjag==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8310771"
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="8310771"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 02:19:48 -0700
X-CSE-ConnectionGUID: 4Wi+Y+mZTAOhMzzUo2oo9A==
X-CSE-MsgGUID: qdnmmJjiTBWnflBS10hiHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="25871228"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 13 Apr 2024 02:19:47 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvZY1-0002BY-09;
	Sat, 13 Apr 2024 09:19:45 +0000
Date: Sat, 13 Apr 2024 17:19:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 2954/30000] drivers/iommu/intel/dmar.c:770
 dmar_acpi_bus_add_dev() error: uninitialized symbol 'ret'.
Message-ID: <202404131747.x1YZL3XL-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Zheng Zengkai <zhengzengkai@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   14b3ddaf4c377eb7fa805821170ee799707511db
commit: d660222861c468ce77fe3197ddc5189deb1665c6 [2954/30000] iommu/vt-d:Add support for detecting ACPI device, in RMRR
:::::: branch date: 2 hours ago
:::::: commit date: 2 years, 9 months ago
config: x86_64-randconfig-161-20240331 (https://download.01.org/0day-ci/archive/20240413/202404131747.x1YZL3XL-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404131747.x1YZL3XL-lkp@intel.com/

smatch warnings:
drivers/iommu/intel/dmar.c:770 dmar_acpi_bus_add_dev() error: uninitialized symbol 'ret'.

vim +/ret +770 drivers/iommu/intel/dmar.c

d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  753  
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  754  static int dmar_acpi_bus_add_dev(u8 device_number, struct acpi_device *adev)
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  755  {
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  756  	struct dmar_drhd_unit *dmaru;
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  757  	struct acpi_dmar_hardware_unit *drhd;
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  758  	int ret;
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  759  
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  760  	for_each_drhd_unit(dmaru) {
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  761  		drhd = container_of(dmaru->hdr,
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  762  				    struct acpi_dmar_hardware_unit,
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  763  				    header);
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  764  		ret = dmar_acpi_insert_dev_scope(device_number, adev, (void *)(drhd+1),
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  765  						((void *)drhd)+drhd->header.length,
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  766  						dmaru->devices, dmaru->devices_cnt);
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  767  		if (ret)
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  768  			break;
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  769  	}
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23 @770  	if (ret > 0)
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  771  		ret = dmar_rmrr_add_acpi_dev(device_number, adev);
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  772  
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  773  	return ret;
ed40356b5fcf1c drivers/iommu/dmar.c       David Woodhouse 2014-03-07  774  }
ed40356b5fcf1c drivers/iommu/dmar.c       David Woodhouse 2014-03-07  775  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
