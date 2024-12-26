Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BB623DE
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Dec 2024 20:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735243333; cv=none; b=qGHQDYNRwu24AKzbM1atQNU1YY2knaj+RQDAL3Rc+QBijEZ8jJrGpet6Cx73F7N/Eoc7hBlfTlrgkDFgJHXvFMKffKCmacMF2/bPoabPmVzVLE7JSGZbG0eRdm9Fl372cjYg0MgbvBxeNNBsPonA+gV+qLAYfCsWjLsVIJHb1r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735243333; c=relaxed/simple;
	bh=GT+mz3VZhmhPCoWtIzNFfxq5d5QdS6iPROtSC/YmwI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RFg/nx0b9yATSdtyxdynorXrI5d4VGWLuMwq9dEsTT4je3b5PuraYXfBAtlbW3W0X9hX4awV8uNekf5BZn7/RDHHXVzADxGime0Dof01Xv+YBeXWyRB1gjfS8nE0kgr6KKuifn4TpI/OH22j+VyD3kbsNtWbJ0AoUQVDjaSKFpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KtUA65D1; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KtUA65D1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735243332; x=1766779332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GT+mz3VZhmhPCoWtIzNFfxq5d5QdS6iPROtSC/YmwI0=;
  b=KtUA65D1/VjZIrzxdADL5zI+YQLB16tsA3oT/gWAzPJr3W925jDx8mPw
   p6FtvFhTvev4MLxnIMd2rQSME61erGxchbIcoHaMvNqU38FBg2+hoLU/c
   AHegUiJ9Y0XBvYe1PnGZk5rlzadSBmY+VbqxFCJgojnYJDHKbpXYIZu8N
   f6G0+LHFrB+sLWgPfedEot7i7iBVJOpcSNDZSg13QV+b4BbWCXza9rEVc
   RyiOgZjtGwDv/jltEHaNkP5x5mfc5lvCXTe66dJouCxd6ERiF56+Mz4iH
   r4mD9ocw26QQbt/Hey0/h6LjKSwr0KoBs8AAzKkeAFyvzHFA9aJehdfX+
   g==;
X-CSE-ConnectionGUID: k49A3p2BS72HIDoN0c9ZEg==
X-CSE-MsgGUID: Tsx/uSo9SemIvdAHoM9FTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="35549102"
X-IronPort-AV: E=Sophos;i="6.12,267,1728975600"; 
   d="scan'208";a="35549102"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 12:02:10 -0800
X-CSE-ConnectionGUID: jotKDXMtTnKya6BjykaUeg==
X-CSE-MsgGUID: 6LAK5BXmSCaGiiQjIMC//Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,267,1728975600"; 
   d="scan'208";a="99851097"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Dec 2024 12:02:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQu3a-0002lW-0y;
	Thu, 26 Dec 2024 20:02:06 +0000
Date: Fri, 27 Dec 2024 04:02:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v8 06/27] cxl: add function for type2 cxl regs setup
Message-ID: <202412270320.Aydp9B4U-lkp@intel.com>
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
In-Reply-To: <20241216161042.42108-7-alejandro.lucero-palau@amd.com>
References: <20241216161042.42108-7-alejandro.lucero-palau@amd.com>
TO: alejandro.lucero-palau@amd.com
TO: linux-cxl@vger.kernel.org
TO: netdev@vger.kernel.org
TO: dan.j.williams@intel.com
TO: martin.habets@xilinx.com
TO: edward.cree@amd.com
TO: davem@davemloft.net
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: edumazet@google.com
TO: dave.jiang@intel.com
CC: Alejandro Lucero <alucerop@amd.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on fac04efc5c793dccbd07e2d59af9f90b7fc0dca4]

url:    https://github.com/intel-lab-lkp/linux/commits/alejandro-lucero-palau-amd-com/cxl-add-type2-device-basic-support/20241217-001923
base:   fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
patch link:    https://lore.kernel.org/r/20241216161042.42108-7-alejandro.lucero-palau%40amd.com
patch subject: [PATCH v8 06/27] cxl: add function for type2 cxl regs setup
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: arm64-randconfig-r072-20241225 (https://download.01.org/0day-ci/archive/20241227/202412270320.Aydp9B4U-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412270320.Aydp9B4U-lkp@intel.com/

smatch warnings:
drivers/cxl/core/pci.c:1134 cxl_pci_accel_setup_regs() warn: missing error code? 'rc'

vim +/rc +1134 drivers/cxl/core/pci.c

cfbd1d00295bff Alejandro Lucero 2024-12-16  1117  
cfbd1d00295bff Alejandro Lucero 2024-12-16  1118  int cxl_pci_accel_setup_regs(struct pci_dev *pdev, struct cxl_dev_state *cxlds)
cfbd1d00295bff Alejandro Lucero 2024-12-16  1119  {
cfbd1d00295bff Alejandro Lucero 2024-12-16  1120  	int rc;
cfbd1d00295bff Alejandro Lucero 2024-12-16  1121  
cfbd1d00295bff Alejandro Lucero 2024-12-16  1122  	rc = cxl_pci_setup_memdev_regs(pdev, cxlds);
cfbd1d00295bff Alejandro Lucero 2024-12-16  1123  	if (rc)
cfbd1d00295bff Alejandro Lucero 2024-12-16  1124  		return rc;
cfbd1d00295bff Alejandro Lucero 2024-12-16  1125  
cfbd1d00295bff Alejandro Lucero 2024-12-16  1126  	rc = cxl_pci_setup_regs(pdev, CXL_REGLOC_RBI_COMPONENT,
cfbd1d00295bff Alejandro Lucero 2024-12-16  1127  				&cxlds->reg_map, cxlds->capabilities);
cfbd1d00295bff Alejandro Lucero 2024-12-16  1128  	if (rc) {
cfbd1d00295bff Alejandro Lucero 2024-12-16  1129  		dev_warn(&pdev->dev, "No component registers (%d)\n", rc);
cfbd1d00295bff Alejandro Lucero 2024-12-16  1130  		return rc;
cfbd1d00295bff Alejandro Lucero 2024-12-16  1131  	}
cfbd1d00295bff Alejandro Lucero 2024-12-16  1132  
cfbd1d00295bff Alejandro Lucero 2024-12-16  1133  	if (!test_bit(CXL_CM_CAP_CAP_ID_RAS, cxlds->capabilities))
cfbd1d00295bff Alejandro Lucero 2024-12-16 @1134  		return rc;
cfbd1d00295bff Alejandro Lucero 2024-12-16  1135  
cfbd1d00295bff Alejandro Lucero 2024-12-16  1136  	rc = cxl_map_component_regs(&cxlds->reg_map,
cfbd1d00295bff Alejandro Lucero 2024-12-16  1137  				    &cxlds->regs.component,
cfbd1d00295bff Alejandro Lucero 2024-12-16  1138  				    BIT(CXL_CM_CAP_CAP_ID_RAS));
cfbd1d00295bff Alejandro Lucero 2024-12-16  1139  	if (rc)
cfbd1d00295bff Alejandro Lucero 2024-12-16  1140  		dev_dbg(&pdev->dev, "Failed to map RAS capability.\n");
cfbd1d00295bff Alejandro Lucero 2024-12-16  1141  
cfbd1d00295bff Alejandro Lucero 2024-12-16  1142  	return rc;
cfbd1d00295bff Alejandro Lucero 2024-12-16  1143  }
cfbd1d00295bff Alejandro Lucero 2024-12-16  1144  EXPORT_SYMBOL_NS_GPL(cxl_pci_accel_setup_regs, "CXL");
cfbd1d00295bff Alejandro Lucero 2024-12-16  1145  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
