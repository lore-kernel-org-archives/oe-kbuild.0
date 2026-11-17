Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895749;
	b=IhhV7k3gnX/KuGpNTA8h1OFn35+3ius4j9jgm5sPpP502SjOOLoFoMQSoCDylncgEQgK
	 MN39UL+c3OE9xdbit1GbDOAv5cpNABndZn+Sv5uRzhTFYVcsUlDyg7e5OJOrKN3/rpZju
	 h94jVimLDLRRRM9QBzmc+px/FKMMbJ1n6wz7DcuTQfT+o4I6SDHGE+9/fci74n1QmxXFI
	 SefwVC/hAbjf6v2EAvr7A7+iLTRF6N+146JxugkOfdDzmwG9rWcCELyUWkzKUMsN8WHqO
	 Tq9Fqlj00wBgV1v7F38HlTLl6mGEleGIKwkQhOQq2vR4UobJDTTt5RT48swgCdLNP7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895749;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=yVoh7qkdJERiaRERgpPuFYwLzER32meFRvze/0qgLyc=;
	b=FJ4jcpeoWiwMRU8FpsFA/h+4mRfE6o+POSzA8YgfWqsZiRec/ukavBUlqUrzKPTlTfJI
	 PAJqHeuWYK9yDPQoFNu4VTcRonUXAf/ipEitSXkgWfWNVqiFlDK67hIgA6m2Z7mVKy3/l
	 wlqU05lyDQQMr+rQkS90U+FVAKV0+1Lgs/3cbkOrW4YETWV0vrDF3DSc5WfEwWGNZwwYz
	 JYVG6perCh5TOPl3tgk6DtwcnSVnJuNg6f1X2afbcblQsZLSrK4E89Vmjg7pzaz0lTYh0
	 nzX+H/+FX/AzqW+hwxAVDfY0oxE5bSQ21IHWRuw/NU9S+jm7jZVI8ncA1ge9GauYk5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R0BqAxzd;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B5B606A885
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Nov 2026 06:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8B5B606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R0BqAxzd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794895749; x=1826431749;
  h=date:from:to:cc:subject:message-id;
  bh=fM4Ict5tPVMCvhyvE4xr8sx0REuXOJIkL2C7EmNbSw0=;
  b=R0BqAxzdza/nqCE8qwNdkgxLcYtd9H9ym5SpE3i7DD5yIYrFPECBPCB/
   YkZYUlo64aIGMUOGkyuA59Oi5e2Fbk39dLqidetSuNg7jS2/ksrN7sARD
   3IVrbGj014RDGQfAROkEN14CGbBKjqed7euc6AJ4KcK+lvRpM3GWxmQlg
   cBk7yU5Dr6/3ULR3LXJABFw6oRT7bKTf9hLuWxNxgnsyJvbsYaYJiaKYL
   6kMupKy6R2HfwdLl2r0sqZIpZotsZLq8raSIRqrs/yaq6yxhQLFN1acPi
   NI5U3QVfCFHjJu11VNF2+SkSNP4jM/RAQGir72P4nKJuldFxdLkgCbbYo
   A==;
X-CSE-ConnectionGUID: 3WQQWLlNR2uwalZMCddZXA==
X-CSE-MsgGUID: wSxGnypbSxyzJ5lwFPB9AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3543951"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3543951"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 22:09:08 -0800
X-CSE-ConnectionGUID: 1Q/RAqVpQVGYqKKbO3+Ikw==
X-CSE-MsgGUID: KZJIDC7yQl+E23phljhFnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10269046"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 16 Nov 2026 22:09:08 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTCNM-000000002zQ-04b2;
	Tue, 17 Nov 2026 06:09:04 +0000
Date: Tue, 17 Nov 2026 07:08:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/pci/pwrctrl/core.c:198:1-7: ERROR: missing
 put_device; call of_find_device_by_node on line 168, but without a
 corresponding object release within this function.
Message-ID: <202611170753.HuhsNXwh-lkp@intel.com>
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
head:   666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
commit: 4c413248920106393b35b5e014e6ac525405437e PCI/pwrctrl: Add APIs to create, destroy pwrctrl devices
date:   10 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-r2107-20261115 (https://download.01.org/0day-ci/archive/20261117/202611170753.HuhsNXwh-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c0693becb96c1610aeb87445a50df00d58a823cd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4c4132489201 ("PCI/pwrctrl: Add APIs to create, destroy pwrctrl devices")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611170753.HuhsNXwh-lkp@intel.com/

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
