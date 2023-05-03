Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510A13C27
	for <oe-kbuild@lists.linux.dev>; Wed,  3 May 2023 15:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683129144; x=1714665144;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u0Q8SZaLMlPN9jjSU/0o7NJvAJ1pEji27I6RKusEaAE=;
  b=e106eI++MI3p+iTKzFb1++ho6i/1ibtjN88mCG5ZShlKhACwO4W3M4TS
   3qSNGB5EE2dTIv9GwVcHXxH5wBn1SY0wat0sj8TAKYLhS204ZFIkRS+0Q
   DKiqPoYIUwFZ/2RX1VbxvEqQL8zWotfNVFAfacf0mzxBme1lhNncssnL/
   BScsEBdV7T7L0NiLaA6PDFqWdCruSgJu8V3W4bGCgaw5JzRfUpQv7GaL+
   xnxjlXRzov5yykJjeMqsGwemwN5bBUhGnDE0iBAFQ/2d1MKSOuGlb2fcy
   goMbOrt6oQimw7lYI2CLJYwdgULWuee0eRjQ86NAu7HJif1PkoJJv/Wvn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="351666498"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; 
   d="scan'208";a="351666498"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 08:52:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="729384402"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; 
   d="scan'208";a="729384402"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 03 May 2023 08:52:22 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puEmD-000272-1m;
	Wed, 03 May 2023 15:52:21 +0000
Date: Wed, 3 May 2023 23:52:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tnguy-next-queue:dev-queue 13/36]
 drivers/net/ethernet/intel/ice/ice_irq.c:348 ice_free_irq() error: we
 previously assumed 'entry' could be null (see line 342)
Message-ID: <202305032317.RAOFS8W5-lkp@intel.com>
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
CC: Intel Wired LAN <intel-wired-lan@lists.osuosl.org>
TO: Piotr Raczynski <piotr.raczynski@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   cf8d73244f3a7bf78ae4042f4d700da212be3dcc
commit: 1181d50520d25da05f2da1235054fd91964cc3d1 [13/36] ice: add dynamic interrupt allocation
:::::: branch date: 24 hours ago
:::::: commit date: 5 days ago
config: openrisc-randconfig-m031-20230430 (https://download.01.org/0day-ci/archive/20230503/202305032317.RAOFS8W5-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305032317.RAOFS8W5-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/intel/ice/ice_irq.c:348 ice_free_irq() error: we previously assumed 'entry' could be null (see line 342)

vim +/entry +348 drivers/net/ethernet/intel/ice/ice_irq.c

f71fc417ba04cac Piotr Raczynski 2023-03-23  327  
f71fc417ba04cac Piotr Raczynski 2023-03-23  328  /**
f71fc417ba04cac Piotr Raczynski 2023-03-23  329   * ice_free_irq - Free interrupt vector
f71fc417ba04cac Piotr Raczynski 2023-03-23  330   * @pf: board private structure
f71fc417ba04cac Piotr Raczynski 2023-03-23  331   * @map: map with interrupt details
f71fc417ba04cac Piotr Raczynski 2023-03-23  332   *
1181d50520d25da Piotr Raczynski 2023-03-23  333   * Remove allocated interrupt from the interrupt tracker. If interrupt was
1181d50520d25da Piotr Raczynski 2023-03-23  334   * allocated dynamically, free respective interrupt vector.
f71fc417ba04cac Piotr Raczynski 2023-03-23  335   */
f71fc417ba04cac Piotr Raczynski 2023-03-23  336  void ice_free_irq(struct ice_pf *pf, struct msi_map map)
f71fc417ba04cac Piotr Raczynski 2023-03-23  337  {
1181d50520d25da Piotr Raczynski 2023-03-23  338  	struct ice_irq_entry *entry;
1181d50520d25da Piotr Raczynski 2023-03-23  339  
1181d50520d25da Piotr Raczynski 2023-03-23  340  	entry = xa_load(&pf->irq_tracker.entries, map.index);
1181d50520d25da Piotr Raczynski 2023-03-23  341  
1181d50520d25da Piotr Raczynski 2023-03-23 @342  	if (!entry)
1181d50520d25da Piotr Raczynski 2023-03-23  343  		dev_err(ice_pf_to_dev(pf), "Failed to get MSIX interrupt entry at index %d",
1181d50520d25da Piotr Raczynski 2023-03-23  344  			map.index);
1181d50520d25da Piotr Raczynski 2023-03-23  345  
1181d50520d25da Piotr Raczynski 2023-03-23  346  	dev_dbg(ice_pf_to_dev(pf), "Free irq at index %d\n", map.index);
1181d50520d25da Piotr Raczynski 2023-03-23  347  
1181d50520d25da Piotr Raczynski 2023-03-23 @348  	if (entry->dynamic)
1181d50520d25da Piotr Raczynski 2023-03-23  349  		pci_msix_free_irq(pf->pdev, map);
1181d50520d25da Piotr Raczynski 2023-03-23  350  
1261628bc347e3d Piotr Raczynski 2023-03-23  351  	ice_free_irq_res(pf, map.index);
f71fc417ba04cac Piotr Raczynski 2023-03-23  352  }
1181d50520d25da Piotr Raczynski 2023-03-23  353  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
