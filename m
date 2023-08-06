Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606B928EF
	for <oe-kbuild@lists.linux.dev>; Sun,  6 Aug 2023 13:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691329994; x=1722865994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5ffAehBBSMKzQQnLPXGMuhX1chUFpWXNjbNTP6mhGoM=;
  b=Tpd6QbtFRHzCcRYga7dnjiXgC7sQfOA+SN3w9mh2t+lCY6BZH5qyXmJO
   83vsuouqa0dHKMKhytQLkynIuiE6M6seAGN2/iIWn6SIupC0SY5Bemm6F
   A09XK+MRHLEMpqIm6pd93oAZQ6CBjOsqJSpLfrJl5LqVRNyL4pplTd0rj
   F1+0Q4/JKZ0N3ErOYSBreq8CxDcHaZ3dLplvfhKYajHDieBWwETApdNjc
   u5xRiJULtwipQr8pY4HUsCXvkW0+e27iBQwAUXxjE+Pn8lkmzENmESHr1
   mTXuoFeqQlarbJ8RV1lJLUALYAc5huTk7bSB5Mn7Fc7AZJtAriws3hHTw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="349980195"
X-IronPort-AV: E=Sophos;i="6.01,260,1684825200"; 
   d="scan'208";a="349980195"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2023 06:53:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="854354997"
X-IronPort-AV: E=Sophos;i="6.01,260,1684825200"; 
   d="scan'208";a="854354997"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 Aug 2023 06:53:11 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSeBy-0004FZ-37;
	Sun, 06 Aug 2023 13:53:10 +0000
Date: Sun, 6 Aug 2023 21:52:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [yiliu1765-iommufd:wip/iommufd_nesting_08042023-yi 12/57]
 drivers/iommu/iommufd/device.c:358 iommufd_must_remove_rr() error: we
 previously assumed 'new_hwpt' could be null (see line 341)
Message-ID: <202308062128.ASglP8pP-lkp@intel.com>
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
TO: Yi Liu <yi.l.liu@intel.com>
TO: Kevin Tian <kevin.tian@intel.com>

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting_08042023-yi
head:   298b42007955fc150cad88c629de50dab7050f15
commit: cec938742db5c16708db0642a49e51085bee34f6 [12/57] iommufd: Handle IOMMU_RESV_SW_MSI complication with user-managed HWPTs
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-m021-20230806 (https://download.01.org/0day-ci/archive/20230806/202308062128.ASglP8pP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230806/202308062128.ASglP8pP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308062128.ASglP8pP-lkp@intel.com/

New smatch warnings:
drivers/iommu/iommufd/device.c:358 iommufd_must_remove_rr() error: we previously assumed 'new_hwpt' could be null (see line 341)
drivers/iommu/iommufd/device.c:433 iommufd_must_enforce_rr() error: we previously assumed 'old_hwpt' could be null (see line 414)

Old smatch warnings:
drivers/iommu/iommufd/device.c:1265 iommufd_access_rw() error: uninitialized symbol 'rc'.

vim +/new_hwpt +358 drivers/iommu/iommufd/device.c

e8d57210035b637 Jason Gunthorpe 2022-11-29  329  
588f26078f3dfd4 Nicolin Chen    2023-08-01  330  static bool iommufd_must_remove_rr(struct iommufd_hw_pagetable *old_hwpt,
cec938742db5c16 Nicolin Chen    2023-08-02  331  				   struct iommufd_hw_pagetable *new_hwpt,
cec938742db5c16 Nicolin Chen    2023-08-02  332  				   bool *keep_sw_msi)
588f26078f3dfd4 Nicolin Chen    2023-08-01  333  {
cec938742db5c16 Nicolin Chen    2023-08-02  334  	struct iommufd_ioas *old_ioas, *new_ioas;
cec938742db5c16 Nicolin Chen    2023-08-02  335  
cec938742db5c16 Nicolin Chen    2023-08-02  336  	if (old_hwpt->user_managed)
cec938742db5c16 Nicolin Chen    2023-08-02  337  		old_ioas = old_hwpt->parent->ioas;
cec938742db5c16 Nicolin Chen    2023-08-02  338  	else
cec938742db5c16 Nicolin Chen    2023-08-02  339  		old_ioas = old_hwpt->ioas;
588f26078f3dfd4 Nicolin Chen    2023-08-01  340  
588f26078f3dfd4 Nicolin Chen    2023-08-01 @341  	if (!new_hwpt)
588f26078f3dfd4 Nicolin Chen    2023-08-01  342  		new_ioas = NULL;
cec938742db5c16 Nicolin Chen    2023-08-02  343  	else if (new_hwpt->user_managed)
cec938742db5c16 Nicolin Chen    2023-08-02  344  		new_ioas = new_hwpt->parent->ioas;
588f26078f3dfd4 Nicolin Chen    2023-08-01  345  	else
588f26078f3dfd4 Nicolin Chen    2023-08-01  346  		new_ioas = new_hwpt->ioas;
588f26078f3dfd4 Nicolin Chen    2023-08-01  347  
588f26078f3dfd4 Nicolin Chen    2023-08-01  348  	/* When switching IOAS, cleaning up the old IOAS is a must */
cec938742db5c16 Nicolin Chen    2023-08-02  349  	if (old_ioas != new_ioas) {
cec938742db5c16 Nicolin Chen    2023-08-02  350  		*keep_sw_msi = false;
cec938742db5c16 Nicolin Chen    2023-08-02  351  		return true;
cec938742db5c16 Nicolin Chen    2023-08-02  352  	}
cec938742db5c16 Nicolin Chen    2023-08-02  353  
cec938742db5c16 Nicolin Chen    2023-08-02  354  	/*
cec938742db5c16 Nicolin Chen    2023-08-02  355  	 * Must keep IOMMU_RESV_SW_MSI when switching from a kernel-managed
cec938742db5c16 Nicolin Chen    2023-08-02  356  	 * hw_pagetable to its associated user-managed hw_pagetable.
cec938742db5c16 Nicolin Chen    2023-08-02  357  	 */
cec938742db5c16 Nicolin Chen    2023-08-02 @358  	if (!old_hwpt->user_managed && new_hwpt->user_managed) {
cec938742db5c16 Nicolin Chen    2023-08-02  359  		*keep_sw_msi = true;
588f26078f3dfd4 Nicolin Chen    2023-08-01  360  		return true;
cec938742db5c16 Nicolin Chen    2023-08-02  361  	}
cec938742db5c16 Nicolin Chen    2023-08-02  362  	/*
cec938742db5c16 Nicolin Chen    2023-08-02  363  	 * Do not remove in the remaining cases when IOAS isn't changed:
cec938742db5c16 Nicolin Chen    2023-08-02  364  	 * - switching from a kernel-managed hw_pagetable to another kernel-
cec938742db5c16 Nicolin Chen    2023-08-02  365  	 *   managed hw_pagetable associated to the same IOAS. All the existing
cec938742db5c16 Nicolin Chen    2023-08-02  366  	 *   reserved regions remain in the IOAS in this case.
cec938742db5c16 Nicolin Chen    2023-08-02  367  	 * - switching from a user-managed hw_pagetable to an associated kernel-
cec938742db5c16 Nicolin Chen    2023-08-02  368  	 *   managed hw_pagetable. In this case, all reserved regions must have
cec938742db5c16 Nicolin Chen    2023-08-02  369  	 *   been enforced in the IOAS, i.e. no removal after the enforcement.
cec938742db5c16 Nicolin Chen    2023-08-02  370  	 * - switching from a user-managed hw_pagetable to another user-managed
cec938742db5c16 Nicolin Chen    2023-08-02  371  	 *   hw_pagetable associated to the same parent hw_pagetable (or IOAS).
cec938742db5c16 Nicolin Chen    2023-08-02  372  	 *   In this case, the existing IOMMU_RESV_SW_MSI regions must be kept.
cec938742db5c16 Nicolin Chen    2023-08-02  373  	 */
588f26078f3dfd4 Nicolin Chen    2023-08-01  374  	return false;
588f26078f3dfd4 Nicolin Chen    2023-08-01  375  }
588f26078f3dfd4 Nicolin Chen    2023-08-01  376  
588f26078f3dfd4 Nicolin Chen    2023-08-01  377  /*
588f26078f3dfd4 Nicolin Chen    2023-08-01  378   * Remove device's reserved regions from the reserved list of an iopt
588f26078f3dfd4 Nicolin Chen    2023-08-01  379   * @idev: Device to remove its owned reserved regions
588f26078f3dfd4 Nicolin Chen    2023-08-01  380   * @hwpt: Detaching hw_pagetable
588f26078f3dfd4 Nicolin Chen    2023-08-01  381   * @new_hwpt: Optionally new hw_pagetable to replace with
588f26078f3dfd4 Nicolin Chen    2023-08-01  382   *
588f26078f3dfd4 Nicolin Chen    2023-08-01  383   * Call this function when an idev detaches or replaces an attached hwpt
588f26078f3dfd4 Nicolin Chen    2023-08-01  384   */
588f26078f3dfd4 Nicolin Chen    2023-08-01  385  static void iommufd_device_remove_rr(struct iommufd_device *idev,
588f26078f3dfd4 Nicolin Chen    2023-08-01  386  				     struct iommufd_hw_pagetable *hwpt,
588f26078f3dfd4 Nicolin Chen    2023-08-01  387  				     struct iommufd_hw_pagetable *new_hwpt)
588f26078f3dfd4 Nicolin Chen    2023-08-01  388  {
cec938742db5c16 Nicolin Chen    2023-08-02  389  	struct iommufd_ioas *ioas;
cec938742db5c16 Nicolin Chen    2023-08-02  390  	bool keep_sw_msi;
cec938742db5c16 Nicolin Chen    2023-08-02  391  
588f26078f3dfd4 Nicolin Chen    2023-08-01  392  	if (WARN_ON(!hwpt))
588f26078f3dfd4 Nicolin Chen    2023-08-01  393  		return;
cec938742db5c16 Nicolin Chen    2023-08-02  394  	if (!iommufd_must_remove_rr(hwpt, new_hwpt, &keep_sw_msi))
588f26078f3dfd4 Nicolin Chen    2023-08-01  395  		return;
cec938742db5c16 Nicolin Chen    2023-08-02  396  	if (hwpt->user_managed)
cec938742db5c16 Nicolin Chen    2023-08-02  397  		ioas = hwpt->parent->ioas;
cec938742db5c16 Nicolin Chen    2023-08-02  398  	else
cec938742db5c16 Nicolin Chen    2023-08-02  399  		ioas = hwpt->ioas;
cec938742db5c16 Nicolin Chen    2023-08-02  400  	iopt_remove_reserved_iova(&ioas->iopt, idev->dev, keep_sw_msi);
588f26078f3dfd4 Nicolin Chen    2023-08-01  401  }
588f26078f3dfd4 Nicolin Chen    2023-08-01  402  
588f26078f3dfd4 Nicolin Chen    2023-08-01  403  static bool iommufd_must_enforce_rr(struct iommufd_hw_pagetable *old_hwpt,
cec938742db5c16 Nicolin Chen    2023-08-02  404  				    struct iommufd_hw_pagetable *new_hwpt,
cec938742db5c16 Nicolin Chen    2023-08-02  405  				    bool *sw_msi_only)
588f26078f3dfd4 Nicolin Chen    2023-08-01  406  {
cec938742db5c16 Nicolin Chen    2023-08-02  407  	struct iommufd_ioas *old_ioas, *new_ioas;
cec938742db5c16 Nicolin Chen    2023-08-02  408  
cec938742db5c16 Nicolin Chen    2023-08-02  409  	if (new_hwpt->user_managed)
cec938742db5c16 Nicolin Chen    2023-08-02  410  		new_ioas = new_hwpt->parent->ioas;
cec938742db5c16 Nicolin Chen    2023-08-02  411  	else
cec938742db5c16 Nicolin Chen    2023-08-02  412  		new_ioas = new_hwpt->ioas;
588f26078f3dfd4 Nicolin Chen    2023-08-01  413  
588f26078f3dfd4 Nicolin Chen    2023-08-01 @414  	if (!old_hwpt)
588f26078f3dfd4 Nicolin Chen    2023-08-01  415  		old_ioas = NULL;
cec938742db5c16 Nicolin Chen    2023-08-02  416  	else if (old_hwpt->user_managed)
cec938742db5c16 Nicolin Chen    2023-08-02  417  		old_ioas = old_hwpt->parent->ioas;
588f26078f3dfd4 Nicolin Chen    2023-08-01  418  	else
588f26078f3dfd4 Nicolin Chen    2023-08-01  419  		old_ioas = old_hwpt->ioas;
588f26078f3dfd4 Nicolin Chen    2023-08-01  420  
cec938742db5c16 Nicolin Chen    2023-08-02  421  	if (new_hwpt->user_managed)
cec938742db5c16 Nicolin Chen    2023-08-02  422  		*sw_msi_only = true;
cec938742db5c16 Nicolin Chen    2023-08-02  423  	else
cec938742db5c16 Nicolin Chen    2023-08-02  424  		*sw_msi_only = false;
cec938742db5c16 Nicolin Chen    2023-08-02  425  
588f26078f3dfd4 Nicolin Chen    2023-08-01  426  	/* When switching IOAS, enforcing the new IOAS is a must */
cec938742db5c16 Nicolin Chen    2023-08-02  427  	if (old_ioas != new_ioas)
cec938742db5c16 Nicolin Chen    2023-08-02  428  		return true;
cec938742db5c16 Nicolin Chen    2023-08-02  429  	/*
cec938742db5c16 Nicolin Chen    2023-08-02  430  	 * Do not forget to enforce all regions when switching from a user-
cec938742db5c16 Nicolin Chen    2023-08-02  431  	 * managed hw_pagetable to its parent kernel-managed hw_pagetable.
cec938742db5c16 Nicolin Chen    2023-08-02  432  	 */
cec938742db5c16 Nicolin Chen    2023-08-02 @433  	if (old_hwpt->user_managed && !new_hwpt->user_managed)
588f26078f3dfd4 Nicolin Chen    2023-08-01  434  		return true;
cec938742db5c16 Nicolin Chen    2023-08-02  435  	/*
cec938742db5c16 Nicolin Chen    2023-08-02  436  	 * Do not enforce in the remaining cases when IOAS isn't changed:
cec938742db5c16 Nicolin Chen    2023-08-02  437  	 * - switching from a kernel-managed hw_pagetable to another kernel-
cec938742db5c16 Nicolin Chen    2023-08-02  438  	 *   managed hw_pagetable associated to the same IOAS. All the existing
cec938742db5c16 Nicolin Chen    2023-08-02  439  	 *   reserved regions remain in the IOAS in this case.
cec938742db5c16 Nicolin Chen    2023-08-02  440  	 * - switching from a kernel-managed hw_pagetable to its associated
cec938742db5c16 Nicolin Chen    2023-08-02  441  	 *   user-managed hw_pagetable. In this case, all the reserved regions
cec938742db5c16 Nicolin Chen    2023-08-02  442  	 *   except IOMMU_RESV_SW_MSI will be removed from the reserved list.
cec938742db5c16 Nicolin Chen    2023-08-02  443  	 * - switching from a user-managed hw_pagetable to another user-managed
cec938742db5c16 Nicolin Chen    2023-08-02  444  	 *   hw_pagetable associated to the same parent hw_pagetable (or IOAS).
cec938742db5c16 Nicolin Chen    2023-08-02  445  	 *   In this case, IOMMU_RESV_SW_MSI is already enforced in the IOAS.
cec938742db5c16 Nicolin Chen    2023-08-02  446  	 */
588f26078f3dfd4 Nicolin Chen    2023-08-01  447  	return false;
588f26078f3dfd4 Nicolin Chen    2023-08-01  448  }
588f26078f3dfd4 Nicolin Chen    2023-08-01  449  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
