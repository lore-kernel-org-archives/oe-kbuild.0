Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756CAD502
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Apr 2024 01:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712022274; cv=none; b=gbmtDSo9V/oFZqzcd97IpS6DN/feTdxWDxzjG1vBbHrngUCZrvSmYMEdt+CnN0LfRt5ktvxE1xFdd07hQi/Az7Z3iKp3ulTp7v6F+Ueyqeco7SLJ6/jIJWJpHJPSXtAz7CM+D3Jg1c6W3DWyQz4YJSadbGikgibMBkyaPaWe2sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712022274; c=relaxed/simple;
	bh=9FN28ynQ528DZRA3rVe/rEFpI0ltf+nbNirmm8PPY1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iRz8bO8C7+3KESLHn5ryEpu6O8zI8ESTudr+BH/CjSQswDGwATaZJMDOD4WNZEqQP4wqf9IHlnPvvktQPft58pDaDNJOgVDNXETWVLCDU7A6ubPlNiENrw41KyvrYrHJsmqigO+065ATD92VmwuCiwNff/LlSbFEcZgCwG4KXQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lSB86oKj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lSB86oKj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712022271; x=1743558271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9FN28ynQ528DZRA3rVe/rEFpI0ltf+nbNirmm8PPY1Y=;
  b=lSB86oKjFvNYOfopyZZMYdhuGpB+dKjTlIWkr0xx8cY94BZ/QtALDUrC
   XdHbVLDD6gN++HIZ0LWNlmtJ4e4m+0IBY6H7Le9IhCqh4ouMWn75iQL2f
   feRiYqLBeC1qb+ctAHGxH0M+AHoDDCGUfi9bXBsxT50upMmAf+A3K3sk8
   ty9bc10W9HPFe3Mu4taLSFsMDUbmtBZM+1brmkFg9Zthk3/h3EGal3rXz
   nDbr04cXGiXdOkBAcMzTDkF6JMbZd3Eqxn3CfBfX2WGQvk7i/PQg1yLtC
   kZCRw3n+51kdMwkaRMPHaPP87ZLguZKLMFG/OSOqUIzTu1Fz3v+U/xbCY
   Q==;
X-CSE-ConnectionGUID: v2fjjSPCTimR1nRHy/GLvA==
X-CSE-MsgGUID: ryMOd4zfQr6TlqY1RQSlgQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="17895483"
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="17895483"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 18:44:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="18298892"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Apr 2024 18:44:29 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrTCM-0000lN-0w;
	Tue, 02 Apr 2024 01:44:26 +0000
Date: Tue, 2 Apr 2024 09:43:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 3284/30000] drivers/iommu/intel/dmar.c:770
 dmar_acpi_bus_add_dev() error: uninitialized symbol 'ret'.
Message-ID: <202404020906.Ssio3VM8-lkp@intel.com>
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
:::::: branch date: 17 hours ago
:::::: commit date: 2 years, 8 months ago
config: x86_64-randconfig-161-20240331 (https://download.01.org/0day-ci/archive/20240402/202404020906.Ssio3VM8-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404020906.Ssio3VM8-lkp@intel.com/

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
