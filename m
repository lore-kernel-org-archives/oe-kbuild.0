Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9044B23098B
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Nov 2024 03:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732246901; cv=none; b=H0RDv+5wSxQn21VeTkhW9GQjpg8oH3aYJp+aEjtpzRxD6H7wYAzX+wIQGPtPJLflEvKUNiL7Qi4jDlnQNStMJEOK95p+tSOGY1xnE65IxbrYF55ou877XG6K22OA91DVOlbO+I9NPNQse3RpA9qPtZVvbbxhuYy/JVT/GrYlzco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732246901; c=relaxed/simple;
	bh=cUAJD3VufD2+tiS79ZzK/hdPC7rUo84Lw66FmkEd7MI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XeEvHgC/H0Koxq3Vq1hzcRKF6oRCQdZtjCRRMLGVhHvwwrw4osKaBAXBllC4E8FKwsw48eNrytbl962N2cqXKPVan9KJCSPdLiK/StobMutLLVHX1SiuRAmpciwwHwyCflQc5mqCTMETcvQyUQwlH17HZ2A2hYz8RP3kgxAWvAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C/oE2QKR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C/oE2QKR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732246899; x=1763782899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cUAJD3VufD2+tiS79ZzK/hdPC7rUo84Lw66FmkEd7MI=;
  b=C/oE2QKR5T9AkjjQ8A6twdjH7ISsTuSkWt0hRfofJcAs3l5BF9JBAF4R
   H8UFNBB1aNAczTBtMlwat5N484VApJtCRYilMukjKRAWNad67Fih3nv2I
   PcBln37zCilLHOoRpaQs/3JmVpy38QeOqoH8rG98iRVdbwxwd/iWRezK+
   c7zOokif+v0Eu0Yx7G16FUtDRLU2bWu3DR41XSxtKzhL0rXOWNcme2Ib2
   TdYhK2NwqHNSWRt5ctahQ1/YNOC4chctWq0ILh4AWIDwMHhPVZprTEugN
   boIH87b9WU63x/ty+uVmd2gNi4Iw/j59onz/I3UldRoaPrELU/SQJbnXT
   g==;
X-CSE-ConnectionGUID: v1SgGBBLT8uar+drlSfVYg==
X-CSE-MsgGUID: 4hcikXAkR1S6RcsoX+qqag==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="54897236"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="54897236"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 19:41:39 -0800
X-CSE-ConnectionGUID: eGqX4DDlT/WCITU+6+kOPQ==
X-CSE-MsgGUID: 4hBhmROHRI2xhOEl/F3aOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="90615371"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Nov 2024 19:41:38 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEKY3-0003dn-38;
	Fri, 22 Nov 2024 03:41:35 +0000
Date: Fri, 22 Nov 2024 11:41:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/media/pci/intel/ipu-bridge.c:752 ipu_bridge_ivsc_is_ready()
 warn: iterator 'i' not incremented
Message-ID: <202411221147.N6w23gDo-lkp@intel.com>
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
TO: Ricardo Ribalda <ribalda@chromium.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   28eb75e178d389d325f1666e422bc13bbbb9804c
commit: 93da10eee90b2ffa4b496dd4a6ea276c57461fb6 media: intel/ipu6: Fix direct dependency Kconfig error
date:   7 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
config: alpha-randconfig-r072-20241122 (https://download.01.org/0day-ci/archive/20241122/202411221147.N6w23gDo-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411221147.N6w23gDo-lkp@intel.com/

smatch warnings:
drivers/media/pci/intel/ipu-bridge.c:752 ipu_bridge_ivsc_is_ready() warn: iterator 'i' not incremented

vim +/i +752 drivers/media/pci/intel/ipu-bridge.c

803abec64ef9d3 drivers/media/pci/intel/ipu3/cio2-bridge.c Daniel Scally   2021-01-07  744  
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  745  static int ipu_bridge_ivsc_is_ready(void)
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  746  {
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  747  	struct acpi_device *sensor_adev, *adev;
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  748  	struct device *csi_dev;
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  749  	bool ready = true;
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  750  	unsigned int i;
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  751  
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03 @752  	for (i = 0; i < ARRAY_SIZE(ipu_supported_sensors); i++) {
8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  753  #if IS_ENABLED(CONFIG_ACPI)
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  754  		const struct ipu_sensor_config *cfg =
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  755  			&ipu_supported_sensors[i];
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  756  
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  757  		for_each_acpi_dev_match(sensor_adev, cfg->hid, NULL, -1) {
8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  758  #else
8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  759  		while (true) {
8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  760  			sensor_adev = NULL;
8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  761  #endif
8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  762  			if (!ACPI_PTR(sensor_adev->status.enabled))
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  763  				continue;
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  764  
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  765  			adev = ipu_bridge_get_ivsc_acpi_dev(sensor_adev);
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  766  			if (!adev)
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  767  				continue;
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  768  
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  769  			csi_dev = ipu_bridge_get_ivsc_csi_dev(adev);
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  770  			if (!csi_dev)
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  771  				ready = false;
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  772  
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  773  			put_device(csi_dev);
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  774  			acpi_dev_put(adev);
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  775  		}
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  776  	}
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  777  
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  778  	return ready;
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  779  }
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  780  

:::::: The code at line 752 was first introduced by commit
:::::: c66821f381aed2c7c754d6ac8920a8665a3a01f7 media: pci: intel: Add IVSC support for IPU bridge driver

:::::: TO: Wentong Wu <wentong.wu@intel.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
