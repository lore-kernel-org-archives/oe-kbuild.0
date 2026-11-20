Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135657;
	b=w1ciIwZngHZ18dDeqzPPrc5Qa4ntXmbYI3CH0HehGMRn74W4RwYRFiCwaQcA7ICGNoQc
	 T9YbiL8qsgpIzehYqZ1wArcM85TTkv99Up+pjj5D3lcPXabW/LMp7DHiceCk+eCxKQTyj
	 90SHm/pTWM6mkq2FW6eE2Xo4EcVbVhJRFtfWajdsNhtzcjvNFXwlRamM+/lV9LI0M2GBD
	 1YLHy2IznSZDuWDLPxq7j9yaBjvwpjAvAfnIImvofwWO91CzhaGDplIcEEB6GUQpGg6j3
	 QC3jYtajC6aZzOq8u/LNg0Ogjl0q0hjUfELLl33Vo92J32/cH/2snqJOv8UXgZpQ3Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135657;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=cHQxUxxHyZ1Dasu8AnAANqscnKRaYl1dOVNT8rCNqmQ=;
	b=dKsXP63R25E8L44/zo9c8jePDZ/R/+8N1q7G7rUHVgKUf90V1VmdP+Dtg+jIbEm+wUG5
	 UnokSxt8CqN2STTU3LP28FnSkMBCk1tNgtXBbUqdjqd7RIAcL8DzBMR8rnIPA4sFlipWi
	 +SETBkS+ZqhbDTjCfJE7i3U3OfdQpRxKgibyBbsvK+JsmXiw2/Ai7WCPypnKCBwx/Mpc7
	 grrhC0Z4k94+v6R9QR1UIPEGDeVL1pFhZkS7aBSY16/ur6RNptRMiUZxqjYmoY2FWInjo
	 hrBTBw6P2KhKz+3rS2BNudx5WkrR7QQYbkK8wCn/dDm18Bu8/EyMuyxyE1FnFhagIoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nJ6tfitG;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CDD606A320
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Nov 2026 00:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6CDD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nJ6tfitG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795135658; x=1826671658;
  h=date:from:to:cc:subject:message-id;
  bh=5PTdXNjYRTlCka4WUHq/+iKIvKZAYr2dcXJB2CvkQaY=;
  b=nJ6tfitGrQnX/c7D2VV0ecbcQFyRiJNuClh1dp7zAbUyIXYI4hKbpejP
   7GpliBZoS4IQ/FsKfUmmAsC5gbMhB53UZ8gEDM4njx5lrpgTUcIQgfzG2
   tcUfTE6zodMQ2vrnd7RkX+JWMsXFTREZ9xLExSWijvDKZw6qj2IzW3wUm
   eo6mZFV8JStoVnxgLZy5GgeT6IY+Mk+FpnrrcvGe515Z/CBfbrmsvl+qJ
   PKQyB3hO/R2XXWK8C4B3M04ftH2iw3KYO/2pFTkxAYxF5Gmfth6x/NTDX
   zGkYsYfl3AdSIV+CWKGBNHBhPIFcStxX+8wetJ+OSr4FhjWjH9Z7H2x5U
   w==;
X-CSE-ConnectionGUID: mL1NCVfxRL6vnsvRjHiuOw==
X-CSE-MsgGUID: GPrqUXKxRrKlIDpX/XQn/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4040520"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4040520"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 16:47:37 -0800
X-CSE-ConnectionGUID: IB589QRwQV6DT233MGUEEQ==
X-CSE-MsgGUID: rHGQ9yx2Svyx1KulZpww5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="12278546"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 19 Nov 2026 16:47:35 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUCmm-000000003uP-2Foy;
	Fri, 20 Nov 2026 00:47:28 +0000
Date: Fri, 20 Nov 2026 01:47:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/pci/pwrctrl/core.c:198:1-7: ERROR: missing
 put_device; call of_find_device_by_node on line 168, but without a
 corresponding object release within this function.
Message-ID: <20261120014128.l2GB7Dp0-lkp@intel.com>
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
head:   65e4fd942f72a9dba0e4e257290c4fa1aa756854
commit: 4c413248920106393b35b5e014e6ac525405437e PCI/pwrctrl: Add APIs to create, destroy pwrctrl devices
date:   10 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-r2107-20261115 (https://download.01.org/0day-ci/archive/20261120/20261120014128.l2GB7Dp0-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c0693becb96c1610aeb87445a50df00d58a823cd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4c4132489201 ("PCI/pwrctrl: Add APIs to create, destroy pwrctrl devices")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261120014128.l2GB7Dp0-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pci/pwrctrl/core.c:198:1-7: ERROR: missing put_device; call of_find_device_by_node on line 168, but without a corresponding object release within this function.

vim +198 drivers/pci/pwrctrl/core.c

4565d2652a37e43 drivers/pci/pwrctl/core.c  Bartosz Golaszewski       2024-06-12  154  
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  155  static int pci_pwrctrl_create_device(struct device_node *np,
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  156  				     struct device *parent)
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  157  {
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  158  	struct platform_device *pdev;
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  159  	int ret;
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  160  
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  161  	for_each_available_child_of_node_scoped(np, child) {
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  162  		ret = pci_pwrctrl_create_device(child, parent);
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  163  		if (ret)
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  164  			return ret;
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  165  	}
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  166  
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  167  	/* Bail out if the platform device is already available for the node */
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15 @168  	pdev = of_find_device_by_node(np);
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  169  	if (pdev) {
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  170  		platform_device_put(pdev);
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  171  		return 0;
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  172  	}
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  173  
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  174  	/*
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  175  	 * Sanity check to make sure that the node has the compatible property
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  176  	 * to allow driver binding.
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  177  	 */
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  178  	if (!of_property_present(np, "compatible"))
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  179  		return 0;
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  180  
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  181  	/*
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  182  	 * Check whether the pwrctrl device really needs to be created or not.
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  183  	 * This is decided based on at least one of the power supplies being
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  184  	 * defined in the devicetree node of the device.
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  185  	 */
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  186  	if (!of_pci_supply_present(np)) {
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  187  		dev_dbg(parent, "Skipping OF node: %s\n", np->name);
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  188  		return 0;
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  189  	}
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  190  
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  191  	/* Now create the pwrctrl device */
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  192  	pdev = of_platform_device_create(np, NULL, parent);
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  193  	if (!pdev) {
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  194  		dev_err(parent, "Failed to create pwrctrl device for node: %s\n", np->name);
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  195  		return -EINVAL;
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  196  	}
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  197  
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15 @198  	return 0;
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  199  }
4c4132489201063 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  200  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
