Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8A92D97A7
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Jul 2025 14:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752243042; cv=none; b=lZMPjGQUf1qqu+aF3ayypgN9gf2ZFz7Il3YYVnQtMs6uu+nTNnSLWvb+64Oo6l+x+iyTC5a8egBf7j3E7PtdUokR/oEt44Z4lHkSo71H5eIatDy/zajNWLg6L/fa0PVv6yBuZWyrC2tBsgLHn3lyKYoLvdE4FPNE3Kfp7SD2KL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752243042; c=relaxed/simple;
	bh=7I3z5Vmp180kV3tHvU8R3lKaNZWCtkt4ekhYy3LNhz0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bKnR+gFa6fOEG0GmJNh82aMFIITEgMVn3rQhApw7YLPXW0cXX+zTY/usrXulzoPzkk2RoYjnZLP126fzWndoOIlIFE62xHdUkurL4K3a1jtl4hF1Abv74FaPDQaZhwkLYvESDCpqv+8EOPbRgzHslDWh0ELDYH+zUOh15TJRr1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0dmWyvw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0dmWyvw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752243040; x=1783779040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7I3z5Vmp180kV3tHvU8R3lKaNZWCtkt4ekhYy3LNhz0=;
  b=b0dmWyvwYg5T45qKPVsRKFvEOtqm6d8HcRszP2PbmfRgNPiWNygUQO6o
   uhmnqix7BlQmGMbmJp0ifCg6FH0PrHIaFUcqPMxhmN7mUo10Zt7W1RTaC
   V7fuY+VcxWtOMyd5lwhTa2jkYR+gGN1rKeXZw5F6x13XRz2oxTVa0lwOA
   iTYodBuF//VbmXQ3zsc/8xjv6pzKfX/oy3MB6dcCXK4upe13lqZ3iiUko
   t4Gkb5WhGF93SSGPZN1A+hcdSJTfVgnUDRhIOvCmVuv+hSILS05ZVHpt3
   joLeryZjH4+WYXaRBVVQyXQgtntnlMtAjao/2eZXiZaMlZPzDxXSqHiGx
   g==;
X-CSE-ConnectionGUID: PBMiSy9aTD6UenDwJfArxQ==
X-CSE-MsgGUID: mKVPwIN3QkqydtLa+511Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53760568"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="53760568"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 07:10:38 -0700
X-CSE-ConnectionGUID: kLdk4apARUKvnZK30Wl3hQ==
X-CSE-MsgGUID: hMfVxR+NQrO7k8j957HksA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="187358361"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Jul 2025 07:10:37 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaESQ-0006Qv-2P;
	Fri, 11 Jul 2025 14:10:34 +0000
Date: Fri, 11 Jul 2025 22:10:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [leon-rdma:rdma-next 82/102] drivers/pci/search.c:640:19-23: ERROR:
 invalid reference to the index variable of the iterator on line 634
Message-ID: <202507112200.Cj7NFLQw-lkp@intel.com>
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
TO: Jason Gunthorpe <jgg@nvidia.com>
CC: Leon Romanovsky <leon@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   0d6c12f6ad3d5539f881b643620382469671b9bf
commit: 4c5d16c7ade032db128f02ee914adfd47b3abbe5 [82/102] PCI: Add pci_reachable_set()
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: loongarch-randconfig-r052-20250711 (https://download.01.org/0day-ci/archive/20250711/202507112200.Cj7NFLQw-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202507112200.Cj7NFLQw-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pci/search.c:640:19-23: ERROR: invalid reference to the index variable of the iterator on line 634

vim +640 drivers/pci/search.c

4c5d16c7ade032 Jason Gunthorpe 2025-06-30  574  
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  575  /**
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  576   * pci_reachable_set - Generate a bitmap of devices within a reachability set
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  577   * @start: First device in the set
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  578   * @devfns: The set of devices on the bus
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  579   * @reachable: Callback to tell if two devices can reach each other
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  580   *
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  581   * Compute a bitmap where every set bit is a device on the bus that is reachable
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  582   * from the start device, including the start device. Reachability between two
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  583   * devices is determined by a callback function.
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  584   *
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  585   * This is a non-recursive implementation that invokes the callback once per
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  586   * pair. The callback must be commutative:
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  587   *    reachable(a, b) == reachable(b, a)
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  588   * reachable() can form a cyclic graph:
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  589   *    reachable(a,b) == reachable(b,c) == reachable(c,a) == true
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  590   *
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  591   * Since this function is limited to a single bus the largest set can be 256
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  592   * devices large.
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  593   */
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  594  void pci_reachable_set(struct pci_dev *start, struct pci_alias_set *devfns,
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  595  		       bool (*reachable)(struct pci_dev *deva,
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  596  					 struct pci_dev *devb))
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  597  {
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  598  	struct pci_alias_set todo_devfns = {};
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  599  	struct pci_alias_set next_devfns = {};
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  600  	struct pci_bus *bus = start->bus;
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  601  	bool again;
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  602  
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  603  	/* Assume devfn of all PCI devices is bounded by MAX_NR_DEVFNS */
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  604  	static_assert(sizeof(next_devfns.devfns) * BITS_PER_BYTE >=
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  605  		      MAX_NR_DEVFNS);
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  606  
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  607  	memset(devfns, 0, sizeof(devfns->devfns));
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  608  	__set_bit(start->devfn, devfns->devfns);
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  609  	__set_bit(start->devfn, next_devfns.devfns);
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  610  
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  611  	down_read(&pci_bus_sem);
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  612  	while (true) {
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  613  		unsigned int devfna;
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  614  		unsigned int i;
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  615  
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  616  		/*
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  617  		 * For each device that hasn't been checked compare every
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  618  		 * device on the bus against it.
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  619  		 */
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  620  		again = false;
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  621  		for_each_set_bit(devfna, next_devfns.devfns, MAX_NR_DEVFNS) {
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  622  			struct pci_dev *deva = NULL;
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  623  			struct pci_dev *devb;
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  624  
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  625  			list_for_each_entry(devb, &bus->devices, bus_list) {
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  626  				if (devb->devfn == devfna)
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  627  					deva = devb;
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  628  
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  629  				if (test_bit(devb->devfn, devfns->devfns))
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  630  					continue;
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  631  
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  632  				if (!deva) {
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  633  					deva = devb;
4c5d16c7ade032 Jason Gunthorpe 2025-06-30 @634  					list_for_each_entry_continue(
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  635  						deva, &bus->devices, bus_list)
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  636  						if (deva->devfn == devfna)
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  637  							break;
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  638  				}
4c5d16c7ade032 Jason Gunthorpe 2025-06-30  639  
4c5d16c7ade032 Jason Gunthorpe 2025-06-30 @640  				if (!reachable(deva, devb))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
