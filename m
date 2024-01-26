Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C23224CF
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Jan 2024 23:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706313228; cv=none; b=WJm9d4B8h23WwRLzrv/mCL0ksiEAaPd6Tixbnr/eJkWRNwsMT/iHIVkkc+flKhzDMrOl57hz1IlQEMIPbpewhXArRwrrWUhOyLdsK4IaLAMpLQXx/o1OO5bq3l5JuscFTKL48Gvh6EF4tCv/D0r4WSAV0AbnJJkMn0t8OOcfnuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706313228; c=relaxed/simple;
	bh=fnXF7QrJh95QuyKySRd24Pt5nzpCkH4Gjg02b/C+A8s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dHJa0cjdlBSvhzbqX+vg4wAa4pBOBiFZRHj9yxM5+O/zb/mYxFmgAePUQYlgQNz/XXGswAoFKVkSNedpXXuH6kV/E+TpE7F9+yqsSkoBA77OL45N8lRJ76bsRV1AXLVFevyp05leFaPcgn03/BBWtbc+zju5yq36AjiNCI7CaVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mzTlnhO8; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mzTlnhO8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706313225; x=1737849225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fnXF7QrJh95QuyKySRd24Pt5nzpCkH4Gjg02b/C+A8s=;
  b=mzTlnhO8gWMpJwbJgaeKA6d6idZFeSGuWOwNNDtBubSRZcedo58Qd8f3
   81359uXN8jxXMUEUZsAxub8cfaeZxIDEDnRR5+7tLdKCS6yFI4pnN0iNg
   pJIvc58vaJf6INFqvCW+Oi1feT1Mwk41KlIAHNByfwvcWkcUAq8gHB7W3
   SbMUfFGCSeKRQ758gJBU0HtnsiR82Ut5ybUnoaYvK2xvwFIujHWpZAA0L
   6Mo8WLS9K5OpUY7kiw4hOIwmi3hLxc8XYbY3O0met+38luN7cuZU8pOeT
   /PjfRZHM+nAaJ3GbgkGp40KrdoVy3QMo23WoBJVh6jiLbVygR3m4uaC5a
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="399768838"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="399768838"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 15:53:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="21522319"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Jan 2024 15:53:42 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTW0z-0001Sk-2q;
	Fri, 26 Jan 2024 23:53:41 +0000
Date: Sat, 27 Jan 2024 07:53:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 27108/30000]
 arch/x86/events/zhaoxin/uncore.c:1608 uncore_pci_probe() warn: possible
 memory leak of 'boxes'
Message-ID: <202401270704.T1EAEEJC-lkp@intel.com>
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

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   bb2503a5fcdf7f51d403ab34440c497acef3b4e7
commit: 2bb7fd043b4123c569fbbde1f18e98d7565a4997 [27108/30000] x86/perf: Update PMU support for more Zhaoxin CPU
:::::: branch date: 17 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161-20240124 (https://download.01.org/0day-ci/archive/20240127/202401270704.T1EAEEJC-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401270704.T1EAEEJC-lkp@intel.com/

New smatch warnings:
arch/x86/events/zhaoxin/uncore.c:1608 uncore_pci_probe() warn: possible memory leak of 'boxes'

Old smatch warnings:
arch/x86/events/zhaoxin/uncore.c:1340 uncore_pmu_enable() warn: can 'uncore_pmu' even be NULL?
arch/x86/events/zhaoxin/uncore.c:1357 uncore_pmu_disable() warn: can 'uncore_pmu' even be NULL?
arch/x86/events/zhaoxin/uncore.c:1611 uncore_pci_probe() warn: possible memory leak of 'boxes'
arch/x86/events/zhaoxin/uncore.c:1644 uncore_pci_probe() warn: possible memory leak of 'boxes'

vim +/boxes +1608 arch/x86/events/zhaoxin/uncore.c

2bb7fd043b4123 leoliu-oc 2023-10-26  1567  
2bb7fd043b4123 leoliu-oc 2023-10-26  1568  /*
2bb7fd043b4123 leoliu-oc 2023-10-26  1569   * add a pci uncore device
2bb7fd043b4123 leoliu-oc 2023-10-26  1570   */
2bb7fd043b4123 leoliu-oc 2023-10-26  1571  static int uncore_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
2bb7fd043b4123 leoliu-oc 2023-10-26  1572  {
2bb7fd043b4123 leoliu-oc 2023-10-26  1573  	struct zhaoxin_uncore_type *type;
2bb7fd043b4123 leoliu-oc 2023-10-26  1574  	struct zhaoxin_uncore_pmu *pmu;
2bb7fd043b4123 leoliu-oc 2023-10-26  1575  	struct zhaoxin_uncore_box *box;
2bb7fd043b4123 leoliu-oc 2023-10-26  1576  	struct zhaoxin_uncore_box **boxes;
2bb7fd043b4123 leoliu-oc 2023-10-26  1577  
2bb7fd043b4123 leoliu-oc 2023-10-26  1578  	int loop, i, j = 0;
2bb7fd043b4123 leoliu-oc 2023-10-26  1579  
2bb7fd043b4123 leoliu-oc 2023-10-26  1580  	int subnode_id, ret = 0;
2bb7fd043b4123 leoliu-oc 2023-10-26  1581  
2bb7fd043b4123 leoliu-oc 2023-10-26  1582  	subnode_id = uncore_pcibus_to_subnodeid(pdev->bus);
2bb7fd043b4123 leoliu-oc 2023-10-26  1583  	if (subnode_id < 0)
2bb7fd043b4123 leoliu-oc 2023-10-26  1584  		return -EINVAL;
2bb7fd043b4123 leoliu-oc 2023-10-26  1585  
2bb7fd043b4123 leoliu-oc 2023-10-26  1586  	type = uncore_pci_uncores[UNCORE_PCI_DEV_TYPE(id->driver_data)];
2bb7fd043b4123 leoliu-oc 2023-10-26  1587  
2bb7fd043b4123 leoliu-oc 2023-10-26  1588  	if (!strcmp(type->name, "mc0"))
2bb7fd043b4123 leoliu-oc 2023-10-26  1589  		loop = 2;
2bb7fd043b4123 leoliu-oc 2023-10-26  1590  	else
2bb7fd043b4123 leoliu-oc 2023-10-26  1591  		loop = 1;
2bb7fd043b4123 leoliu-oc 2023-10-26  1592  
2bb7fd043b4123 leoliu-oc 2023-10-26  1593  	boxes = kzalloc(loop * sizeof(struct zhaoxin_uncore_box *), GFP_KERNEL);
2bb7fd043b4123 leoliu-oc 2023-10-26  1594  
2bb7fd043b4123 leoliu-oc 2023-10-26  1595  	for (i = 0; i < loop; i++) {
2bb7fd043b4123 leoliu-oc 2023-10-26  1596  		type = uncore_pci_uncores[UNCORE_PCI_DEV_TYPE(id->driver_data) + j];
2bb7fd043b4123 leoliu-oc 2023-10-26  1597  
2bb7fd043b4123 leoliu-oc 2023-10-26  1598  		if (!type)
2bb7fd043b4123 leoliu-oc 2023-10-26  1599  			continue;
2bb7fd043b4123 leoliu-oc 2023-10-26  1600  		/*
2bb7fd043b4123 leoliu-oc 2023-10-26  1601  		 * for performance monitoring unit with multiple boxes,
2bb7fd043b4123 leoliu-oc 2023-10-26  1602  		 * each box has a different function id.
2bb7fd043b4123 leoliu-oc 2023-10-26  1603  		 */
2bb7fd043b4123 leoliu-oc 2023-10-26  1604  
2bb7fd043b4123 leoliu-oc 2023-10-26  1605  		pmu = &type->pmus[UNCORE_PCI_DEV_IDX(id->driver_data)];
2bb7fd043b4123 leoliu-oc 2023-10-26  1606  
2bb7fd043b4123 leoliu-oc 2023-10-26  1607  		if (WARN_ON_ONCE(pmu->boxes[subnode_id] != NULL))
2bb7fd043b4123 leoliu-oc 2023-10-26 @1608  			return -EINVAL;
2bb7fd043b4123 leoliu-oc 2023-10-26  1609  		box = uncore_alloc_box(type, NUMA_NO_NODE);
2bb7fd043b4123 leoliu-oc 2023-10-26  1610  		if (!box)
2bb7fd043b4123 leoliu-oc 2023-10-26  1611  			return -ENOMEM;
2bb7fd043b4123 leoliu-oc 2023-10-26  1612  
2bb7fd043b4123 leoliu-oc 2023-10-26  1613  		if (pmu->func_id < 0)
2bb7fd043b4123 leoliu-oc 2023-10-26  1614  			pmu->func_id = pdev->devfn;
2bb7fd043b4123 leoliu-oc 2023-10-26  1615  		else
2bb7fd043b4123 leoliu-oc 2023-10-26  1616  			WARN_ON_ONCE(pmu->func_id != pdev->devfn);
2bb7fd043b4123 leoliu-oc 2023-10-26  1617  
2bb7fd043b4123 leoliu-oc 2023-10-26  1618  		atomic_inc(&box->refcnt);
2bb7fd043b4123 leoliu-oc 2023-10-26  1619  		box->subnode_id = subnode_id;
2bb7fd043b4123 leoliu-oc 2023-10-26  1620  		box->pci_dev = pdev;
2bb7fd043b4123 leoliu-oc 2023-10-26  1621  		box->pmu = pmu;
2bb7fd043b4123 leoliu-oc 2023-10-26  1622  		uncore_box_init(box);
2bb7fd043b4123 leoliu-oc 2023-10-26  1623  		boxes[i] = box;
2bb7fd043b4123 leoliu-oc 2023-10-26  1624  
2bb7fd043b4123 leoliu-oc 2023-10-26  1625  		pci_set_drvdata(pdev, boxes);
2bb7fd043b4123 leoliu-oc 2023-10-26  1626  		pmu->boxes[subnode_id] = box;
2bb7fd043b4123 leoliu-oc 2023-10-26  1627  		if (atomic_inc_return(&pmu->activeboxes) > 1) {
2bb7fd043b4123 leoliu-oc 2023-10-26  1628  			if (!strcmp(type->name, "mc0"))
2bb7fd043b4123 leoliu-oc 2023-10-26  1629  				goto next_loop;
2bb7fd043b4123 leoliu-oc 2023-10-26  1630  			else
2bb7fd043b4123 leoliu-oc 2023-10-26  1631  				return 0;
2bb7fd043b4123 leoliu-oc 2023-10-26  1632  		}
2bb7fd043b4123 leoliu-oc 2023-10-26  1633  		/* First active box registers the pmu */
2bb7fd043b4123 leoliu-oc 2023-10-26  1634  		ret = uncore_pmu_register(pmu);
2bb7fd043b4123 leoliu-oc 2023-10-26  1635  		if (ret) {
2bb7fd043b4123 leoliu-oc 2023-10-26  1636  			pci_set_drvdata(pdev, NULL);
2bb7fd043b4123 leoliu-oc 2023-10-26  1637  			pmu->boxes[subnode_id] = NULL;
2bb7fd043b4123 leoliu-oc 2023-10-26  1638  			uncore_box_exit(box);
2bb7fd043b4123 leoliu-oc 2023-10-26  1639  			kfree(box);
2bb7fd043b4123 leoliu-oc 2023-10-26  1640  		}
2bb7fd043b4123 leoliu-oc 2023-10-26  1641  next_loop:
2bb7fd043b4123 leoliu-oc 2023-10-26  1642  		j++;
2bb7fd043b4123 leoliu-oc 2023-10-26  1643  	}
2bb7fd043b4123 leoliu-oc 2023-10-26  1644  	return ret;
2bb7fd043b4123 leoliu-oc 2023-10-26  1645  }
2bb7fd043b4123 leoliu-oc 2023-10-26  1646  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
