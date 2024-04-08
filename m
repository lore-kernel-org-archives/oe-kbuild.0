Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4AD495CB
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Apr 2024 21:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712611508; cv=none; b=mH7P9mqeR+NmyQkKENkHx+QeMIKa882VLYHV44UvJXcFHzejOkMcj2rtR443PAL2OwY0iX8X3/1LcpPNlhZZ3FFkvKsUALHqyh+BOinDiewU7FEm+RcgPF+o/Mlzt0aTYFr/Af+v9U5UrvDhjJQsaC1wd89MhCYpx9qBh0TQPqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712611508; c=relaxed/simple;
	bh=WaREcPINvCo78zkj/EJXiYRPJ5OUpAyvLhkO9y7qqUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jLD805TBncHSUp+ifP6bmT2jIzwv8/tE2XF8NOZfVqLNf1m+zwbJwn41VPZBr53kfWffaxVoxzVoZgx7FSOJ0XgcHSo1PFTHPqyzUYHM18+YZ/lfmUKN2c8UeWN+sZYYl5q+iWgw++NXvxCpayZQcRD1jHnINo2adjopNueiRZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mcs6A1w1; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mcs6A1w1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712611507; x=1744147507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WaREcPINvCo78zkj/EJXiYRPJ5OUpAyvLhkO9y7qqUc=;
  b=Mcs6A1w1AjZ8AXDDM1YnmuS5M1Ei9Eyo+0RMsbPJp65BmCqsjBoUp2UT
   TMUGF4VoWPZFlJz0fXkItyyvRMZl/AsVokRwq8PX80dUjRxHDwEE3vwNX
   tos9D7/RnnT8LUNpUXAx9yvJ+5M7H+7PUl+VGknAL+TWTqnOZhwMC6LM5
   pz71oUjAPEuxbugHh3uq2+HnXH72dfBEHkzpaixVLwYGOSAuZ6KwGw2wc
   LvtkGxffYFm/EGyEhi1JZ34xNuYwtBuv5hiqt7QH6CtfkW86ttec0f379
   Ga0wV/2q7rw8nwknebRoMx1gn3CcHtYI4CLV/tM0bcpLcPBVgDKGcb4W3
   g==;
X-CSE-ConnectionGUID: qpHCeLZZT2OgVcaTKCr2gw==
X-CSE-MsgGUID: /KuIMHSrQG6JbwGIUVkwqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="25354691"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="25354691"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 14:25:06 -0700
X-CSE-ConnectionGUID: beZq4PmrTVGKjWJPyFXD6w==
X-CSE-MsgGUID: uH6H5LjYS3ylU544juevQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="19879529"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Apr 2024 14:25:04 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtwU9-0005VJ-2v;
	Mon, 08 Apr 2024 21:25:01 +0000
Date: Tue, 9 Apr 2024 05:24:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 3070/30000] drivers/iommu/intel/dmar.c:770
 dmar_acpi_bus_add_dev() error: uninitialized symbol 'ret'.
Message-ID: <202404090500.cqb5iT3B-lkp@intel.com>
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
head:   0b6927f0e8945e882320b46ccba94f4ea3826509
commit: d660222861c468ce77fe3197ddc5189deb1665c6 [3070/30000] iommu/vt-d:Add support for detecting ACPI device, in RMRR
:::::: branch date: 9 hours ago
:::::: commit date: 2 years, 9 months ago
config: x86_64-randconfig-161-20240331 (https://download.01.org/0day-ci/archive/20240409/202404090500.cqb5iT3B-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404090500.cqb5iT3B-lkp@intel.com/

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
