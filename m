Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943B6D512
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Nov 2023 15:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AvClVSFk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700925214; x=1732461214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nEneouh6YwOfWOTo3PPB+bad75MlZjjk4Sof0Xev0pc=;
  b=AvClVSFk7kVl5xROeh76WM2M5lSkFJ6bgjNe/uiJyAP8TuRA1Zo3ZRG+
   /vwYDTfmC0wjvQQbNhAPD/8XPfK3SPeNF623CsyfGCT6KKOW2w82ewBTX
   9bU6ouXwrbbUzC71Ok+rRPt4DCLY22nidAXLz69RbwJdQ8xAMqiB9GJpe
   puP01YOyseGYc70qj5jaBFhoxLsPXB2/5vVz9mz3SJ0R5QFEvmaLAEoqt
   cJ+Om5aabFWi5zdjV81ehGIo9FYIxAyChaW0x2yCmAtu7BwxHVFCWw31F
   7jo+GTpsSfylvM+aKuBSfajL0/EkmHY2vTIYj+hpijQ/yxgbvwyCP4AiP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="395344777"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="395344777"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 07:13:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="9211874"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Nov 2023 07:13:32 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6uLa-00047I-0m;
	Sat, 25 Nov 2023 15:13:30 +0000
Date: Sat, 25 Nov 2023 23:13:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [lubaolu-intel-iommu:vtd-static-identity-domain-v1 7/17]
 drivers/iommu/intel/iommu.c:760 device_lookup_iommu() error: we previously
 assumed 'pdev' could be null (see line 733)
Message-ID: <202311252134.WYsfgoaE-lkp@intel.com>
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
TO: Baolu Lu <baolu.lu@linux.intel.com>

Hi Lu,

First bad commit (maybe != root cause):

tree:   https://github.com/LuBaolu/intel-iommu.git vtd-static-identity-domain-v1
head:   c56a30c3f4bbe56eb4ee140b0e56c9b9cfcff683
commit: ab324be6fc742b19d497d901acc74c2269634650 [7/17] iommu/vt-d: Refactor device_to_iommu() to retrieve iommu directly
:::::: branch date: 5 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-161-20231123 (https://download.01.org/0day-ci/archive/20231125/202311252134.WYsfgoaE-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231125/202311252134.WYsfgoaE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311252134.WYsfgoaE-lkp@intel.com/

New smatch warnings:
drivers/iommu/intel/iommu.c:760 device_lookup_iommu() error: we previously assumed 'pdev' could be null (see line 733)

Old smatch warnings:
drivers/iommu/intel/iommu.c:240 clear_context_copied() warn: clear_bit() takes a bit number
drivers/iommu/intel/iommu.c:234 set_context_copied() warn: set_bit() takes a bit number
drivers/iommu/intel/iommu.c:3286 intel_iommu_add() warn: missing unwind goto?

vim +/pdev +760 drivers/iommu/intel/iommu.c

2d33b7d631d9dc drivers/iommu/intel/iommu.c Lu Baolu          2020-09-03  705  
ab324be6fc742b drivers/iommu/intel/iommu.c Lu Baolu          2023-10-31  706  static struct intel_iommu *device_lookup_iommu(struct device *dev, u8 *bus, u8 *devfn)
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
