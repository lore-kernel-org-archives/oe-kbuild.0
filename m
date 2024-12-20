Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93FF17B50A
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Dec 2024 06:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734677755; cv=none; b=FXuf57idmh/ht2Eg37Ng0+LzUgPNF4f+40s8nsc3t1kjE0GnwK5ZoruJ/kWyz9ZlH++NnjR4bHxgxrVs85waCzznnfkbtP2CcPuE9GSaEM+6/kf4KzNKUan50dedb/ZdtvOBxI3XewYTAFylsbZmgqGEVQ46Cf9+zR1nv6pQ1YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734677755; c=relaxed/simple;
	bh=rMTuekdgeSPAwbxY0ITp73AGmTu+AAw05DmBxT5gOi8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lQhU38VTd/SGEcKtiGUZesXUPwYhhmgzdDXIv68iVXcEBBzDug1aNciwMnrTOdm8A4H59exOaEBmKfuBnBHjLKvvvK0e47UdRPojmOfsbMFsO8AnqaHMunR2hcWrAPTOWpCUr5Kd1Vzqtw05GUMKmzGVKkdT7TIWGKOdtt9GLpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=byBkhaZC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="byBkhaZC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734677754; x=1766213754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rMTuekdgeSPAwbxY0ITp73AGmTu+AAw05DmBxT5gOi8=;
  b=byBkhaZC+Ik36hV5Nb9r93FJb3aIQfLiE/aIETBezdax5xB5r+Ypw/9t
   O889MeT3M0MYwTXJHH8PcMiE4YDXEEkrfVmFRpnJnPRoxfhaA9vScx7QJ
   1XeMc3yWgcvyMb6XQ8fszU/dR7Oo/1n++7d9j867DqAZFR3OrIT1fRBMk
   8Dc8jQJHOAs4ycQUkVqvqK+QpM4YomSDeHZOI5a8uhcIOUkAian1ZCG4Y
   nFy9ZJCL1dd1YSVzVO14O4AayrgLDJJ/IHTB+Ud2VobJMosmtiEkOVLlH
   nicgfTpaqs9RUA9cLvtSQ1ElXg4kQDne2mrAFK6LvZhkP47dIKSOQVW+k
   g==;
X-CSE-ConnectionGUID: xBvVbMEyRnmC91hBay4/aQ==
X-CSE-MsgGUID: xGjzs9e4S6eakEedBifT/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35250968"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="35250968"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 22:55:51 -0800
X-CSE-ConnectionGUID: FsoTvrhYT2mDmiqDLuZYRg==
X-CSE-MsgGUID: o1XCI4aUQhaMbAIOPtcKVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98903033"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Dec 2024 22:55:50 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOWvL-0000vZ-1n;
	Fri, 20 Dec 2024 06:55:47 +0000
Date: Fri, 20 Dec 2024 14:55:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/media/pci/intel/ipu-bridge.c:752 ipu_bridge_ivsc_is_ready()
 warn: iterator 'i' not incremented
Message-ID: <202412201418.Aofs95Sy-lkp@intel.com>
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
head:   8faabc041a001140564f718dabe37753e88b37fa
commit: 93da10eee90b2ffa4b496dd4a6ea276c57461fb6 media: intel/ipu6: Fix direct dependency Kconfig error
date:   8 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 8 months ago
config: sparc64-randconfig-r071-20241219 (https://download.01.org/0day-ci/archive/20241220/202412201418.Aofs95Sy-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412201418.Aofs95Sy-lkp@intel.com/

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
