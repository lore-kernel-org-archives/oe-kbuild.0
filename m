Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446C73126DF
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Jul 2026 13:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784899206; cv=none; b=IIr3eSLUtb8co3xJwmpb6jrDlrf2dM3MxzfQmGICxaGkY7M+3BVIxok5IqfiCDrbMXF7r0t3f4K2CGK/bX3Zo/DXAiWQf597pe8Xn70+BdG0YCw2oxRObij4FoFfRemVJ/wioTfsb4l9/6MeQt8Ba/eUKQv8BenG6vY/LPUQ9+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784899206; c=relaxed/simple;
	bh=LOQpPCcH3Z5Ow5/RQCH7Cbu53oteRlSTt7I0VWVllfw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qHMs/CcZ8yGO8az+sYpafkTS61h+13NQMjw7UvYbZgKP4orH4A//kfQ2u+y1Xb1Jeq/oGdjMyLTzIuFTCjSXxwj/ZC0046oFJGgH+IbWX8YtALCjyfrtSycjoBb5BfHaKpd8DDrp6+4ySX1iCEQCL7uVl6hgf0KAr4pHtzy43K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jWrGKS5J; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jWrGKS5J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784899204; x=1816435204;
  h=date:from:to:cc:subject:message-id;
  bh=LOQpPCcH3Z5Ow5/RQCH7Cbu53oteRlSTt7I0VWVllfw=;
  b=jWrGKS5J9DRFPTtuQTb9KbJWQ34ANkx6tLFcRm3VhT5t2JUVSmjdyNDV
   xofRp0qQPJ4air2pi4zbUwSIZuoKwv5tbDLwnLYd8k8HHeO7ZGRNxTtkt
   BIy7RuK0sXRP240WBlb3nCAMdMA2lcXcyVZvNSo4JopseTkmqHO3O4fGw
   uiF2jJ5gZJWNicXcwJ9bR5lp3WG/GMZwJDZpgS5dVTZBPp968DHAMZKDQ
   5NoUpai6TjUAUYuCiGWBE+/K9Tz3k+v4tL87fCgWT6i500nNQArS8nUnr
   1JS839KVcQSdaaBKo28dKe/WYmio6mmyboxGMueFGQwnZ7EHeIpTHXoRm
   g==;
X-CSE-ConnectionGUID: HsniXPYrTG27n6UsaSnSFg==
X-CSE-MsgGUID: gH9TL9e1TMqzjqx222rCBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96157812"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="96157812"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 06:20:03 -0700
X-CSE-ConnectionGUID: p8JhBZl+SwikMurcKIVtLA==
X-CSE-MsgGUID: XcYqnTTiSkCjmlhg/8yrCw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 24 Jul 2026 06:20:02 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnFom-00000000aog-0MwQ;
	Fri, 24 Jul 2026 13:20:00 +0000
Date: Fri, 24 Jul 2026 21:19:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/bluetooth/btintel_pcie.c:2402
 btintel_pcie_reset_work() warn: can 'data' even be NULL?
Message-ID: <202607242101.CNbLehyS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>
CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
CC: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4539944e515183668109bdf4d0c3d7d228383d88
commit: 2d00975c841fa2e52921353392ce9780843bfee7 Bluetooth: btintel_pcie: Support Product level reset
date:   6 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260724/202607242101.CNbLehyS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2d00975c841f ("Bluetooth: btintel_pcie: Support Product level reset")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607242101.CNbLehyS-lkp@intel.com/

smatch warnings:
drivers/bluetooth/btintel_pcie.c:2402 btintel_pcie_reset_work() warn: can 'data' even be NULL?

vim +/data +2402 drivers/bluetooth/btintel_pcie.c

2d00975c841fa2 Chandrashekar Devegowda 2026-04-13  2389  
2d00975c841fa2 Chandrashekar Devegowda 2026-04-13  2390  static void btintel_pcie_reset_work(struct work_struct *wk)
2d00975c841fa2 Chandrashekar Devegowda 2026-04-13  2391  {
2d00975c841fa2 Chandrashekar Devegowda 2026-04-13  2392  	struct btintel_pcie_data *data =
2d00975c841fa2 Chandrashekar Devegowda 2026-04-13  2393  		container_of(wk, struct btintel_pcie_data, reset_work);
2d00975c841fa2 Chandrashekar Devegowda 2026-04-13  2394  	struct pci_dev *pdev = data->pdev;
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2395  	int err;
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2396  
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2397  	pci_lock_rescan_remove();
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2398  
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2399  	if (!pdev->bus)
2d00975c841fa2 Chandrashekar Devegowda 2026-04-13  2400  		goto out;
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2401  
2d00975c841fa2 Chandrashekar Devegowda 2026-04-13 @2402  	if (!data)
2d00975c841fa2 Chandrashekar Devegowda 2026-04-13  2403  		goto out;
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2404  
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2405  	btintel_pcie_disable_interrupts(data);
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2406  	btintel_pcie_synchronize_irqs(data);
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2407  
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2408  	flush_work(&data->rx_work);
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2409  
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2410  	bt_dev_dbg(data->hdev, "Release bluetooth interface");
2d00975c841fa2 Chandrashekar Devegowda 2026-04-13  2411  	if (data->reset_type == BTINTEL_PCIE_IOSF_PRR_PLDR) {
2d00975c841fa2 Chandrashekar Devegowda 2026-04-13  2412  		/* This function holds pci_lock_rescan_remove(), which acquires
2d00975c841fa2 Chandrashekar Devegowda 2026-04-13  2413  		 * pci_rescan_remove_lock. This mutex serializes against PCI device
2d00975c841fa2 Chandrashekar Devegowda 2026-04-13  2414  		 * addition/removal (hotplug), so no device can be added to or
2d00975c841fa2 Chandrashekar Devegowda 2026-04-13  2415  		 * removed from the bus list while this code runs.
2d00975c841fa2 Chandrashekar Devegowda 2026-04-13  2416  		 */
2d00975c841fa2 Chandrashekar Devegowda 2026-04-13  2417  		btintel_pcie_perform_pldr(data);
2d00975c841fa2 Chandrashekar Devegowda 2026-04-13  2418  		goto out;
2d00975c841fa2 Chandrashekar Devegowda 2026-04-13  2419  	}
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2420  	btintel_pcie_release_hdev(data);
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2421  
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2422  	err = pci_reset_function(pdev);
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2423  	if (err) {
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2424  		BT_ERR("Failed resetting the pcie device (%d)", err);
2d00975c841fa2 Chandrashekar Devegowda 2026-04-13  2425  		goto out;
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2426  	}
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2427  
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2428  	btintel_pcie_enable_interrupts(data);
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2429  	btintel_pcie_config_msix(data);
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2430  
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2431  	err = btintel_pcie_enable_bt(data);
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2432  	if (err) {
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2433  		BT_ERR("Failed to enable bluetooth hardware after reset (%d)",
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2434  		       err);
2d00975c841fa2 Chandrashekar Devegowda 2026-04-13  2435  		goto out;
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2436  	}
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2437  
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2438  	btintel_pcie_reset_ia(data);
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2439  	btintel_pcie_start_rx(data);
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2440  	data->flags = 0;
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2441  
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2442  	err = btintel_pcie_setup_hdev(data);
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2443  	if (err) {
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2444  		BT_ERR("Failed registering hdev (%d)", err);
2d00975c841fa2 Chandrashekar Devegowda 2026-04-13  2445  		goto out;
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2446  	}
2d00975c841fa2 Chandrashekar Devegowda 2026-04-13  2447  out:
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2448  	pci_dev_put(pdev);
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2449  	pci_unlock_rescan_remove();
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2450  }
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2451  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
