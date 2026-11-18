Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981697;
	b=P24UM3Ww2YD07bZAOOioizfC1h8TiRueqSfKbCgO/tvVUn2ExYTauHqzVwq7bpt5dD9k
	 /tgXsuClHjvGyeCf98PMg6Xv54k2ZVAnqyYq687s78m9jZtjnHhTMf+0LFbDKEWO4v5RT
	 opCUlGXRe7urdqqH+FyoeCTZSRtdblfP9oIhRquq9zA2DVUkj6/EecpbBYluiNO/TUaAR
	 YHzQtFFMVbnsxoIOlMqZZYpbFbFz0zpvcrA326bVS0glcNKyl1/lTa2qxwZTRIIZdq8dn
	 yzqWq92IUY3eDj6MoyZLMdQOeNPeGGwqJ2dXVQDy/7SNPjBF2cUSDCU4XTClFD0Akzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981697;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=JNzKbFbxMVEIYHJB3fkRc8h7TJR13CbTvd9RegpKkiw=;
	b=NcOEZ2ZJYEHopecrdDLwsfvYCUL6AVgTmWzfmhJhWMksGGyPrwtysyFTZm3+kHrHf8+O
	 haMgIS/WTlWpe/WyaNsyjVL2X2UJZaaIXMlXlwd0YAKXT+7MN2jkYUk9BvjiVx6UGoRtw
	 E6cEl9Q/zrn1oYwWGdyKrsFoY0oH9P8e7jT11nvcXQBeGl7zzAfEjzaxlFk8vfGb1dxsI
	 VWzTTVKYfQ6ZSsiE+jda7R7QMF6q/0nXJtEFy4Od6qz+aVy6OFrg1czyOo53TvK1fXzZm
	 JdxEnO6qyq+TNw2ypiqEuAwu9jB7YUzc94NECIM/j0UnMykQPd9Tdzl/bMnk8ypj9Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nGJuW4b9;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6300E606A31C
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Nov 2026 06:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6300E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nGJuW4b9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794981696; x=1826517696;
  h=date:from:to:cc:subject:message-id;
  bh=VRMTR/3/Aoqo7UhlVlVNAscVgGmwKflmFtAyCAI023o=;
  b=nGJuW4b9BQhxSKEH5eaGZIq3Ve7h/nBq2hz2SCcYliyLoq8lOBuPid7B
   MEFF+hJevzRQxV5RsefoZRK+jowNMg5KEpHoLdtJCELK1MlgqCLFaqftG
   Kzf7D9OORt5ee4oLqxwCX17UMdiXc+sG2FCeFhWy4rzH1s+pHohrhusPc
   LMFieUCxTfu6wLDencVuBhMpjtamZLu7xy2Z6ubGzU48ZMgX81tmAdDx6
   LlpnIlq1ETMSDrnPfUhq5f1vLaCaeFEJojpxXZ5lQcsfcnBO+aZu/5M/i
   aJxKdvBZEaH63d+ME1EM+Qvy5cu0segAsN5JRLtL6zQ8ovQzREDZze2UJ
   g==;
X-CSE-ConnectionGUID: uv3z37kVTCyNx/5ZSNMXNw==
X-CSE-MsgGUID: D/I8vEm1RCS8i43zFVEOKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3821548"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3821548"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 22:01:35 -0800
X-CSE-ConnectionGUID: d60ry/7PQzaPy9xyRUshuA==
X-CSE-MsgGUID: 09FRy01OQ3y1mqP4Tr6rsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10104008"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 17 Nov 2026 22:01:34 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTYja-000000003LS-2HBV;
	Wed, 18 Nov 2026 06:01:30 +0000
Date: Wed, 18 Nov 2026 07:00:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/pci/pwrctrl/core.c:198:1-7: ERROR: missing
 put_device; call of_find_device_by_node on line 168, but without a
 corresponding object release within this function.
Message-ID: <20261118065443.yy428iNv-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
CC: Bjorn Helgaas <helgaas@kernel.org>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
CC: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
commit: 4c413248920106393b35b5e014e6ac525405437e PCI/pwrctrl: Add APIs to create, destroy pwrctrl devices
date:   10 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-r2107-20261115 (https://download.01.org/0day-ci/archive/20261118/20261118065443.yy428iNv-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c0693becb96c1610aeb87445a50df00d58a823cd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4c4132489201 ("PCI/pwrctrl: Add APIs to create, destroy pwrctrl devices")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261118065443.yy428iNv-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pci/pwrctrl/core.c:198:1-7: ERROR: missing put_device; call of_find_device_by_node on line 168, but without a corresponding object release within this function.

vim +198 drivers/pci/pwrctrl/core.c

4565d2652a37e4 drivers/pci/pwrctl/core.c  Bartosz Golaszewski       2024-06-12  154  
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  155  static int pci_pwrctrl_create_device(struct device_node *np,
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  156  				     struct device *parent)
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  157  {
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  158  	struct platform_device *pdev;
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  159  	int ret;
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  160  
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  161  	for_each_available_child_of_node_scoped(np, child) {
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  162  		ret = pci_pwrctrl_create_device(child, parent);
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  163  		if (ret)
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  164  			return ret;
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  165  	}
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  166  
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  167  	/* Bail out if the platform device is already available for the node */
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15 @168  	pdev = of_find_device_by_node(np);
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  169  	if (pdev) {
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  170  		platform_device_put(pdev);
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  171  		return 0;
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  172  	}
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  173  
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  174  	/*
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  175  	 * Sanity check to make sure that the node has the compatible property
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  176  	 * to allow driver binding.
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  177  	 */
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  178  	if (!of_property_present(np, "compatible"))
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  179  		return 0;
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  180  
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  181  	/*
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  182  	 * Check whether the pwrctrl device really needs to be created or not.
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  183  	 * This is decided based on at least one of the power supplies being
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  184  	 * defined in the devicetree node of the device.
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  185  	 */
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  186  	if (!of_pci_supply_present(np)) {
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  187  		dev_dbg(parent, "Skipping OF node: %s\n", np->name);
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  188  		return 0;
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  189  	}
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  190  
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  191  	/* Now create the pwrctrl device */
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  192  	pdev = of_platform_device_create(np, NULL, parent);
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  193  	if (!pdev) {
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  194  		dev_err(parent, "Failed to create pwrctrl device for node: %s\n", np->name);
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  195  		return -EINVAL;
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  196  	}
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  197  
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15 @198  	return 0;
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  199  }
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  200  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
