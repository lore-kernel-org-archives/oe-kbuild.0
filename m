Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0540F1FF5E3
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jan 2026 13:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768656902; cv=none; b=mP6eExmaDbJPEO3db8J4nVaMafiM4KLEMOUyHxVlFiziTBo5Ug58aZef3LVj5lKvXKkVBV6SHNy3YmsdpQMfma3zreG3JyPCoo9vddB2Whd/jTD4qgICTSwELrxIewrI50nWIMIlm6huwKJ0BXk+prbDwdH6GXZMIwHX90+Da6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768656902; c=relaxed/simple;
	bh=3lYDp8b92ZV0Gf6wjW+0kyKdXxt+P+GT7NUnhZ2MqIA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VrTNDo0Ypf82f+0jeM3FrH0j9BJk2V7+clzf3oowCQdtVXF6Yhe8DiqANZDpia1uqEmhzSXvenSiuFRCA7fuKBTk24p1qIdyxj2lMrnmsHyri+Wg/7Q9zV6VLUyhn0LjOJuIWNxTO9Yl5F3R4QcbPREjuvoVeBMfAOMgnqZTa08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ox5UJVck; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ox5UJVck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768656901; x=1800192901;
  h=date:from:to:cc:subject:message-id;
  bh=3lYDp8b92ZV0Gf6wjW+0kyKdXxt+P+GT7NUnhZ2MqIA=;
  b=Ox5UJVckTmnJllFVMHedOCoPuHTCcC/R93UNETobJF9Ij486J/ssxK0x
   0or3AprlCeNV3axNHf6XT96B9fjoJwMYan+BG4jQloFwsNkrWPDsVYOls
   effgSVFetmwn+DvkTn7VqF4rm/VcX0L5i4BNHqeyL8WgHnyB0umJWEnpp
   rK57kOB4DiH74z/8iqJxIYkVhl5snYMCSuAunFWGl8z6YlxZ8Q+99vBTi
   1O965sPd0kSOvP4S4ezQuKb8blIzmb+jTVTSNINC3KN7Zfvh8pELvTloc
   3BL4x5zmMaiE5NNCaEmsrwfPzieTt9CF6ZfePB14lVAE36qblgJur0Kkh
   g==;
X-CSE-ConnectionGUID: PRahUFwFQCyBNX3EZjD94Q==
X-CSE-MsgGUID: zHZHIfYdRUSW9RrfMWtfFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="95418858"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="95418858"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 05:35:00 -0800
X-CSE-ConnectionGUID: Ut4kwzVVQuyuGYIv7MyTWQ==
X-CSE-MsgGUID: 4ZCv6o+NQ/uDy64XeXY3DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="210482906"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Jan 2026 05:34:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh6S7-00000000Lsg-3ngu;
	Sat, 17 Jan 2026 13:34:55 +0000
Date: Sat, 17 Jan 2026 21:34:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [pci:pwrctrl 10/15] drivers/pci/pwrctrl/core.c:198:1-7:
 ERROR: missing put_device; call of_find_device_by_node on line 168, but
 without a corresponding object release within this function.
Message-ID: <202601172152.z7zStOZL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-pci@vger.kernel.org
TO: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
CC: Bjorn Helgaas <helgaas@kernel.org>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
CC: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git pwrctrl
head:   8822f062e59a4daf070cb58666cec30b63db2d3b
commit: 4c413248920106393b35b5e014e6ac525405437e [10/15] PCI/pwrctrl: Add APIs to create, destroy pwrctrl devices
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: microblaze-randconfig-r051-20260117 (https://download.01.org/0day-ci/archive/20260117/202601172152.z7zStOZL-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601172152.z7zStOZL-lkp@intel.com/

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
