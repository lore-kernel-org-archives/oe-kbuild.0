Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48194CB4A
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Apr 2024 18:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711994834; cv=none; b=bFxG5MOsnf06VGB4Y0EKt0lo3Ggu+gj9/FeBLdUwu8eW7S4onfH08oj7ff4VPBRI9Op4U6R17BkFUZKcCEyXgi0ZE2hfrMTRl6/Yc6gia6BHWru3s9jDk12i1EYAETxi5F0jLUPWCsAyuKCA9pazu6BwdNWXv+BSVWdPa28s0sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711994834; c=relaxed/simple;
	bh=UfAvAYPZgcqmEhXMOrG80vtxSYIR+b7dFKU+KTB0RfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OAo9j64SWvXPG7MD6Syn/u4aWNDZHXlxnKpAl3za4ZRouHyQef+8bEUjovU46tts5HM6nYU7whf5zn9fngdS3+ig3oJbJj2TaHI7sP9KWTGcg4djjO8pKU9wUw7lG7xNAMLzlrGNqlGmQWTjB+Ev1Wy/08+gPJz4OQvIufebRI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iBXZ/7Gm; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iBXZ/7Gm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711994833; x=1743530833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UfAvAYPZgcqmEhXMOrG80vtxSYIR+b7dFKU+KTB0RfU=;
  b=iBXZ/7Gm6sPv1Ux+QImsuYuPnw7xhDDPWYhljwrzrYy9W/MT/BiJV+Tt
   4zSs0+O37hqF4OZQX9QERtg6+ReIZZMiPGIrgBb/nzIs18oaLc8ksEmzA
   bm/HUNYRVlVYjg5/meBWW8b9nO67I7pqTUAYhBITSbJMgtOyiD04Xfr0T
   cZXX+ee6rfM24MZ70hR5vZVR1ndmSEUPAEHsl/je6pHhl6yVepzq2EhC/
   yE7LEhW4fkx1CqZaCKcuoru2waghg+t46MxD0oTf3PCSHz3+gnIHmZONW
   oglXluq6hB2yeWM4MGWnJyA0sZwpRzA54VLCeOYTTj23ile97MzhKvMI3
   Q==;
X-CSE-ConnectionGUID: eYX/kGkLRqaYmvX2E8NuLw==
X-CSE-MsgGUID: sJS4ZJoHTUCU3j2sLBnvuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="18493382"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="18493382"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 11:07:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="22459381"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Apr 2024 11:07:11 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrM3o-0000Wz-2Y;
	Mon, 01 Apr 2024 18:07:08 +0000
Date: Tue, 2 Apr 2024 02:06:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 3284/30000] drivers/iommu/intel/dmar.c:770
 dmar_acpi_bus_add_dev() error: uninitialized symbol 'ret'.
Message-ID: <202404020144.WDkLs0cy-lkp@intel.com>
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
head:   5eb5993150caee0f8e8e761ccdcc84f072ec36cd
commit: d660222861c468ce77fe3197ddc5189deb1665c6 [3284/30000] iommu/vt-d:Add support for detecting ACPI device, in RMRR
:::::: branch date: 9 hours ago
:::::: commit date: 2 years, 8 months ago
config: x86_64-randconfig-161-20240331 (https://download.01.org/0day-ci/archive/20240402/202404020144.WDkLs0cy-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404020144.WDkLs0cy-lkp@intel.com/

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
