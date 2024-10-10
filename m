Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BB4188000
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Oct 2024 02:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728528825; cv=none; b=QVGVTihokFJGXrsWeFaWDIy5deJEXDrOZ5ZgcH9Iez6q8hJ+kE/xLphXl+iJOFOc1isOxoJuVKHiG6Gyt6u9ExDUggN5ZqGV8l/ign8VwBM4eWlHhh4onemQl0+JPg8oMAEFEXsftHDteO5oiDHrzVyUzMrP02SXyNkJuDGCeL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728528825; c=relaxed/simple;
	bh=hg9WTrVoeOjH01IoaXMuSd4LkHKOpBsny9YG3fimhpU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KRs3UiJyBda4qjnWrmH4V8JIM40DGpOFhAbiEvDvSONGklzVFSnHkT8hws9j22G9/qe1hXxP659sEuoCtFsrKSiJni5NalO0KFEM63+P9l/oaWbIcFUGhpNHdPtVKMQkKXvsf/EJwlGzSnwi4wR2NLkk92xhf9uZRglmOy1A9Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WrLQe8Jp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WrLQe8Jp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728528824; x=1760064824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hg9WTrVoeOjH01IoaXMuSd4LkHKOpBsny9YG3fimhpU=;
  b=WrLQe8JpsszQaXvWV4+J57wUT5ku1hEbojzcnLABPv+qkSmKwtsAlMxE
   Z+DjJz5r154R8G2aedDRQSKc6bKAUUyQf0Iv7vZiNSqkHMlZLibMOCpJ3
   NVLvbEqpKuFuchkknZWBnCJOofXQrkowt8P1bpY/JnTphGU9BuR6hzN/u
   4gi7xaS/yYpbPnuULkJmCvQP4RZ9Fp3wHtjxStcs/vOEp0CtJV2uHxMt3
   OkaW6dCALlIkyeCaubKUvcrzmDU2O4evH3isz7eaGSa6flu4v5L8UBoRy
   SToNpBJLIYwB1KoVp5mw+14lwfyNfK3xK98X6La4m8wP+ZCuPOJFwNOS1
   A==;
X-CSE-ConnectionGUID: /UWyJgeJRJaRe/cCT/Qf7A==
X-CSE-MsgGUID: irUxDcRBQT+GjVCIE/V5Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27996545"
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="27996545"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 19:53:43 -0700
X-CSE-ConnectionGUID: NAAANZGyScGXq5EZqrpm8Q==
X-CSE-MsgGUID: U1IYHhmQQS2yURipeAGCbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="113925438"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Oct 2024 19:53:41 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syjJ4-000A5J-11;
	Thu, 10 Oct 2024 02:53:38 +0000
Date: Thu, 10 Oct 2024 10:53:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/intel/iommu.c:760 device_lookup_iommu() error: we
 previously assumed 'pdev' could be null (see line 733)
Message-ID: <202410101027.p2fluL6L-lkp@intel.com>
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
TO: Lu Baolu <baolu.lu@linux.intel.com>
CC: Joerg Roedel <jroedel@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d3d1556696c1a993eec54ac585fe5bf677e07474
commit: 1903ef8f0d77680e6eb36bd0cc3ea3aa6e95a050 iommu/vt-d: Refactor device_to_iommu() to retrieve iommu directly
date:   10 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-141-20241010 (https://download.01.org/0day-ci/archive/20241010/202410101027.p2fluL6L-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410101027.p2fluL6L-lkp@intel.com/

New smatch warnings:
drivers/iommu/intel/iommu.c:760 device_lookup_iommu() error: we previously assumed 'pdev' could be null (see line 733)

Old smatch warnings:
drivers/iommu/intel/iommu.c:469 domain_update_iommu_coherency() warn: iterator 'i' not incremented
drivers/iommu/intel/iommu.c:240 clear_context_copied() warn: clear_bit() takes a bit number
drivers/iommu/intel/iommu.c:2164 switch_to_super_page() warn: iterator 'i' not incremented
drivers/iommu/intel/iommu.c:234 set_context_copied() warn: set_bit() takes a bit number
drivers/iommu/intel/iommu.c:3286 intel_iommu_add() warn: missing unwind goto?
drivers/iommu/intel/iommu.c:4282 intel_iommu_tlb_sync() warn: iterator 'i' not incremented
drivers/iommu/intel/iommu.c:4720 intel_iommu_iotlb_sync_map() warn: iterator 'i' not incremented

vim +/pdev +760 drivers/iommu/intel/iommu.c

2d33b7d631d9dc drivers/iommu/intel/iommu.c Lu Baolu          2020-09-03  705  
1903ef8f0d7768 drivers/iommu/intel/iommu.c Lu Baolu          2023-12-18  706  static struct intel_iommu *device_lookup_iommu(struct device *dev, u8 *bus, u8 *devfn)
c7151a8dfefd11 drivers/pci/intel-iommu.c   Weidong Han       2008-12-08  707  {
c7151a8dfefd11 drivers/pci/intel-iommu.c   Weidong Han       2008-12-08  708  	struct dmar_drhd_unit *drhd = NULL;
dd6692f1b883ba drivers/iommu/intel/iommu.c Lu Baolu          2020-07-24  709  	struct pci_dev *pdev = NULL;
b683b230a244c3 drivers/iommu/intel-iommu.c Jiang Liu         2014-02-19  710  	struct intel_iommu *iommu;
156baca8d31e1a drivers/iommu/intel-iommu.c David Woodhouse   2014-03-09  711  	struct device *tmp;
aa4d066a2a8041 drivers/iommu/intel-iommu.c Yijing Wang       2014-05-26  712  	u16 segment = 0;
c7151a8dfefd11 drivers/pci/intel-iommu.c   Weidong Han       2008-12-08  713  	int i;
c7151a8dfefd11 drivers/pci/intel-iommu.c   Weidong Han       2008-12-08  714  
2d33b7d631d9dc drivers/iommu/intel/iommu.c Lu Baolu          2020-09-03  715  	if (!dev)
4ed6a540fab8ea drivers/iommu/intel-iommu.c David Woodhouse   2015-05-11  716  		return NULL;
4ed6a540fab8ea drivers/iommu/intel-iommu.c David Woodhouse   2015-05-11  717  
156baca8d31e1a drivers/iommu/intel-iommu.c David Woodhouse   2014-03-09  718  	if (dev_is_pci(dev)) {
1c387188c60f53 drivers/iommu/intel-iommu.c Ashok Raj         2016-10-21  719  		struct pci_dev *pf_pdev;
1c387188c60f53 drivers/iommu/intel-iommu.c Ashok Raj         2016-10-21  720  
e3560ee4cfb29e drivers/iommu/intel-iommu.c Jon Derrick       2020-01-21  721  		pdev = pci_real_dma_dev(to_pci_dev(dev));
5823e330b58c52 drivers/iommu/intel-iommu.c Jon Derrick       2017-08-30  722  
1c387188c60f53 drivers/iommu/intel-iommu.c Ashok Raj         2016-10-21  723  		/* VFs aren't listed in scope tables; we need to look up
1c387188c60f53 drivers/iommu/intel-iommu.c Ashok Raj         2016-10-21  724  		 * the PF instead to find the IOMMU. */
1c387188c60f53 drivers/iommu/intel-iommu.c Ashok Raj         2016-10-21  725  		pf_pdev = pci_physfn(pdev);
1c387188c60f53 drivers/iommu/intel-iommu.c Ashok Raj         2016-10-21  726  		dev = &pf_pdev->dev;
156baca8d31e1a drivers/iommu/intel-iommu.c David Woodhouse   2014-03-09  727  		segment = pci_domain_nr(pdev->bus);
ca5b74d2675a44 drivers/iommu/intel-iommu.c Rafael J. Wysocki 2015-03-16  728  	} else if (has_acpi_companion(dev))
156baca8d31e1a drivers/iommu/intel-iommu.c David Woodhouse   2014-03-09  729  		dev = &ACPI_COMPANION(dev)->dev;
156baca8d31e1a drivers/iommu/intel-iommu.c David Woodhouse   2014-03-09  730  
0e242612d9cdb4 drivers/iommu/intel-iommu.c Jiang Liu         2014-02-19  731  	rcu_read_lock();
2d33b7d631d9dc drivers/iommu/intel/iommu.c Lu Baolu          2020-09-03  732  	for_each_iommu(iommu, drhd) {
156baca8d31e1a drivers/iommu/intel-iommu.c David Woodhouse   2014-03-09 @733  		if (pdev && segment != drhd->segment)
276dbf997043cb drivers/pci/intel-iommu.c   David Woodhouse   2009-04-04  734  			continue;
c7151a8dfefd11 drivers/pci/intel-iommu.c   Weidong Han       2008-12-08  735  
b683b230a244c3 drivers/iommu/intel-iommu.c Jiang Liu         2014-02-19  736  		for_each_active_dev_scope(drhd->devices,
156baca8d31e1a drivers/iommu/intel-iommu.c David Woodhouse   2014-03-09  737  					  drhd->devices_cnt, i, tmp) {
156baca8d31e1a drivers/iommu/intel-iommu.c David Woodhouse   2014-03-09  738  			if (tmp == dev) {
1c387188c60f53 drivers/iommu/intel-iommu.c Ashok Raj         2016-10-21  739  				/* For a VF use its original BDF# not that of the PF
1c387188c60f53 drivers/iommu/intel-iommu.c Ashok Raj         2016-10-21  740  				 * which we used for the IOMMU lookup. Strictly speaking
1c387188c60f53 drivers/iommu/intel-iommu.c Ashok Raj         2016-10-21  741  				 * we could do this for all PCI devices; we only need to
1c387188c60f53 drivers/iommu/intel-iommu.c Ashok Raj         2016-10-21  742  				 * get the BDF# from the scope table for ACPI matches. */
5003ae1e735e6b drivers/iommu/intel-iommu.c Koos Vriezen      2017-03-01  743  				if (pdev && pdev->is_virtfn)
1c387188c60f53 drivers/iommu/intel-iommu.c Ashok Raj         2016-10-21  744  					goto got_pdev;
1c387188c60f53 drivers/iommu/intel-iommu.c Ashok Raj         2016-10-21  745  
dd6692f1b883ba drivers/iommu/intel/iommu.c Lu Baolu          2020-07-24  746  				if (bus && devfn) {
156baca8d31e1a drivers/iommu/intel-iommu.c David Woodhouse   2014-03-09  747  					*bus = drhd->devices[i].bus;
156baca8d31e1a drivers/iommu/intel-iommu.c David Woodhouse   2014-03-09  748  					*devfn = drhd->devices[i].devfn;
dd6692f1b883ba drivers/iommu/intel/iommu.c Lu Baolu          2020-07-24  749  				}
b683b230a244c3 drivers/iommu/intel-iommu.c Jiang Liu         2014-02-19  750  				goto out;
924b6231edfaf1 drivers/pci/intel-iommu.c   David Woodhouse   2009-04-04  751  			}
c7151a8dfefd11 drivers/pci/intel-iommu.c   Weidong Han       2008-12-08  752  
b9a7f9816483b1 drivers/iommu/intel-iommu.c Eric Auger        2019-06-03  753  			if (is_downstream_to_pci_bridge(dev, tmp))
156baca8d31e1a drivers/iommu/intel-iommu.c David Woodhouse   2014-03-09  754  				goto got_pdev;
156baca8d31e1a drivers/iommu/intel-iommu.c David Woodhouse   2014-03-09  755  		}
156baca8d31e1a drivers/iommu/intel-iommu.c David Woodhouse   2014-03-09  756  
156baca8d31e1a drivers/iommu/intel-iommu.c David Woodhouse   2014-03-09  757  		if (pdev && drhd->include_all) {
156baca8d31e1a drivers/iommu/intel-iommu.c David Woodhouse   2014-03-09  758  got_pdev:
dd6692f1b883ba drivers/iommu/intel/iommu.c Lu Baolu          2020-07-24  759  			if (bus && devfn) {
156baca8d31e1a drivers/iommu/intel-iommu.c David Woodhouse   2014-03-09 @760  				*bus = pdev->bus->number;
156baca8d31e1a drivers/iommu/intel-iommu.c David Woodhouse   2014-03-09  761  				*devfn = pdev->devfn;
dd6692f1b883ba drivers/iommu/intel/iommu.c Lu Baolu          2020-07-24  762  			}
b683b230a244c3 drivers/iommu/intel-iommu.c Jiang Liu         2014-02-19  763  			goto out;
c7151a8dfefd11 drivers/pci/intel-iommu.c   Weidong Han       2008-12-08  764  		}
156baca8d31e1a drivers/iommu/intel-iommu.c David Woodhouse   2014-03-09  765  	}
b683b230a244c3 drivers/iommu/intel-iommu.c Jiang Liu         2014-02-19  766  	iommu = NULL;
b683b230a244c3 drivers/iommu/intel-iommu.c Jiang Liu         2014-02-19  767  out:
2d33b7d631d9dc drivers/iommu/intel/iommu.c Lu Baolu          2020-09-03  768  	if (iommu_is_dummy(iommu, dev))
2d33b7d631d9dc drivers/iommu/intel/iommu.c Lu Baolu          2020-09-03  769  		iommu = NULL;
2d33b7d631d9dc drivers/iommu/intel/iommu.c Lu Baolu          2020-09-03  770  
0e242612d9cdb4 drivers/iommu/intel-iommu.c Jiang Liu         2014-02-19  771  	rcu_read_unlock();
c7151a8dfefd11 drivers/pci/intel-iommu.c   Weidong Han       2008-12-08  772  
b683b230a244c3 drivers/iommu/intel-iommu.c Jiang Liu         2014-02-19  773  	return iommu;
c7151a8dfefd11 drivers/pci/intel-iommu.c   Weidong Han       2008-12-08  774  }
c7151a8dfefd11 drivers/pci/intel-iommu.c   Weidong Han       2008-12-08  775  

:::::: The code at line 760 was first introduced by commit
:::::: 156baca8d31e1aced2c8a14262637aef1ab416b9 iommu/vt-d: Make device_to_iommu() cope with non-PCI devices

:::::: TO: David Woodhouse <David.Woodhouse@intel.com>
:::::: CC: David Woodhouse <David.Woodhouse@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
