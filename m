Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108D71FBF
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Sep 2023 23:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694214999; x=1725750999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lylEQ/NvLrNLc7K7nI52Y10d2Odxk0Xo5D/6BOJfYio=;
  b=llZugJmItwgDOv/YtUASWkWo81RhP1y0KluKZA3UTzra0sk+UStcj6+1
   tFRAMrHzb9wOXA4qGBSh2/6WPQd+8yCzC5/sZZwi0qOyfKzxStUf4Mzmd
   NwNJSTTYl6pYQPZYCI+j53ydaoP8X111WTsL21AW98sjFViv96PV2zho2
   expysLB1VwaYPCRTXQK9YDYmdZKscfE+awcKDAOOdnl1U7rsfdHndOKg8
   E6v4VG4uuLGz9+wYImAebhL0wqLIfh69h4SNJYdKBO3nooViEQyPfvF3j
   O22IDEH0wckKwiQnZD5uNoz2/kFmNiOoEifW5V4EOxmtIpiOaCXDiQpVA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="368030228"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="368030228"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 16:16:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="777752005"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="777752005"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Sep 2023 16:16:35 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qekiH-0002ix-1h;
	Fri, 08 Sep 2023 23:16:33 +0000
Date: Sat, 9 Sep 2023 07:15:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [yiliu1765-iommufd:wip/iommufd_nesting_09042023-yi-not-tested 18/26]
 drivers/iommu/iommufd/device.c:362 iommufd_must_remove_rr() error: we
 previously assumed 'new_hwpt' could be null (see line 345)
Message-ID: <202309090753.acgHoqjq-lkp@intel.com>
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

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting_09042023-yi-not-tested
head:   19df4ebfe078e091791110a53bfcc1abc6f72fb3
commit: a004e3ce4be092cfd0959a385df18445dd0bf193 [18/26] iommufd: Handle IOMMU_RESV_SW_MSI complication with user-managed HWPTs
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-161-20230907 (https://download.01.org/0day-ci/archive/20230909/202309090753.acgHoqjq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230909/202309090753.acgHoqjq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309090753.acgHoqjq-lkp@intel.com/

New smatch warnings:
drivers/iommu/iommufd/device.c:362 iommufd_must_remove_rr() error: we previously assumed 'new_hwpt' could be null (see line 345)
drivers/iommu/iommufd/device.c:439 iommufd_must_enforce_rr() error: we previously assumed 'old_hwpt' could be null (see line 420)

Old smatch warnings:
drivers/iommu/iommufd/device.c:1268 iommufd_access_rw() error: uninitialized symbol 'rc'.

vim +/new_hwpt +362 drivers/iommu/iommufd/device.c

e8d57210035b63 Jason Gunthorpe 2022-11-29  331  
39cfab38b364cc Nicolin Chen    2023-08-01  332  static bool iommufd_must_remove_rr(struct iommufd_hw_pagetable *old_hwpt,
a004e3ce4be092 Nicolin Chen    2023-08-02  333  				   struct iommufd_hw_pagetable *new_hwpt,
a004e3ce4be092 Nicolin Chen    2023-08-02  334  				   bool *keep_sw_msi)
39cfab38b364cc Nicolin Chen    2023-08-01  335  {
a004e3ce4be092 Nicolin Chen    2023-08-02  336  	struct iommufd_ioas *old_ioas, *new_ioas;
a004e3ce4be092 Nicolin Chen    2023-08-02  337  
a004e3ce4be092 Nicolin Chen    2023-08-02  338  	if (!old_hwpt)
a004e3ce4be092 Nicolin Chen    2023-08-02  339  		return false;
a004e3ce4be092 Nicolin Chen    2023-08-02  340  	else if (old_hwpt->user_managed)
a004e3ce4be092 Nicolin Chen    2023-08-02  341  		old_ioas = old_hwpt->parent->ioas;
a004e3ce4be092 Nicolin Chen    2023-08-02  342  	else
a004e3ce4be092 Nicolin Chen    2023-08-02  343  		old_ioas = old_hwpt->ioas;
39cfab38b364cc Nicolin Chen    2023-08-01  344  
39cfab38b364cc Nicolin Chen    2023-08-01 @345  	if (!new_hwpt)
39cfab38b364cc Nicolin Chen    2023-08-01  346  		new_ioas = NULL;
a004e3ce4be092 Nicolin Chen    2023-08-02  347  	else if (new_hwpt->user_managed)
a004e3ce4be092 Nicolin Chen    2023-08-02  348  		new_ioas = new_hwpt->parent->ioas;
39cfab38b364cc Nicolin Chen    2023-08-01  349  	else
39cfab38b364cc Nicolin Chen    2023-08-01  350  		new_ioas = new_hwpt->ioas;
39cfab38b364cc Nicolin Chen    2023-08-01  351  
39cfab38b364cc Nicolin Chen    2023-08-01  352  	/* When switching IOAS, cleaning up the old IOAS is a must */
a004e3ce4be092 Nicolin Chen    2023-08-02  353  	if (old_ioas != new_ioas) {
a004e3ce4be092 Nicolin Chen    2023-08-02  354  		*keep_sw_msi = false;
a004e3ce4be092 Nicolin Chen    2023-08-02  355  		return true;
a004e3ce4be092 Nicolin Chen    2023-08-02  356  	}
a004e3ce4be092 Nicolin Chen    2023-08-02  357  
a004e3ce4be092 Nicolin Chen    2023-08-02  358  	/*
a004e3ce4be092 Nicolin Chen    2023-08-02  359  	 * Must keep IOMMU_RESV_SW_MSI when switching from a kernel-managed
a004e3ce4be092 Nicolin Chen    2023-08-02  360  	 * hw_pagetable to its associated user-managed hw_pagetable.
a004e3ce4be092 Nicolin Chen    2023-08-02  361  	 */
a004e3ce4be092 Nicolin Chen    2023-08-02 @362  	if (!old_hwpt->user_managed && new_hwpt->user_managed) {
a004e3ce4be092 Nicolin Chen    2023-08-02  363  		*keep_sw_msi = true;
39cfab38b364cc Nicolin Chen    2023-08-01  364  		return true;
a004e3ce4be092 Nicolin Chen    2023-08-02  365  	}
a004e3ce4be092 Nicolin Chen    2023-08-02  366  	/*
a004e3ce4be092 Nicolin Chen    2023-08-02  367  	 * Do not remove in the remaining cases when IOAS isn't changed:
a004e3ce4be092 Nicolin Chen    2023-08-02  368  	 * - switching from a kernel-managed hw_pagetable to another kernel-
a004e3ce4be092 Nicolin Chen    2023-08-02  369  	 *   managed hw_pagetable associated to the same IOAS. All the existing
a004e3ce4be092 Nicolin Chen    2023-08-02  370  	 *   reserved regions remain in the IOAS in this case.
a004e3ce4be092 Nicolin Chen    2023-08-02  371  	 * - switching from a user-managed hw_pagetable to an associated kernel-
a004e3ce4be092 Nicolin Chen    2023-08-02  372  	 *   managed hw_pagetable. In this case, all reserved regions must have
a004e3ce4be092 Nicolin Chen    2023-08-02  373  	 *   been enforced in the IOAS, i.e. no removal after the enforcement.
a004e3ce4be092 Nicolin Chen    2023-08-02  374  	 * - switching from a user-managed hw_pagetable to another user-managed
a004e3ce4be092 Nicolin Chen    2023-08-02  375  	 *   hw_pagetable associated to the same parent hw_pagetable (or IOAS).
a004e3ce4be092 Nicolin Chen    2023-08-02  376  	 *   In this case, the existing IOMMU_RESV_SW_MSI regions must be kept.
a004e3ce4be092 Nicolin Chen    2023-08-02  377  	 */
39cfab38b364cc Nicolin Chen    2023-08-01  378  	return false;
39cfab38b364cc Nicolin Chen    2023-08-01  379  }
39cfab38b364cc Nicolin Chen    2023-08-01  380  
39cfab38b364cc Nicolin Chen    2023-08-01  381  /*
39cfab38b364cc Nicolin Chen    2023-08-01  382   * Remove device's reserved regions from the reserved list of an iopt
39cfab38b364cc Nicolin Chen    2023-08-01  383   * @idev: Device to remove its owned reserved regions
39cfab38b364cc Nicolin Chen    2023-08-01  384   * @hwpt: Detaching hw_pagetable
39cfab38b364cc Nicolin Chen    2023-08-01  385   * @new_hwpt: Optionally new hw_pagetable to replace with
39cfab38b364cc Nicolin Chen    2023-08-01  386   *
39cfab38b364cc Nicolin Chen    2023-08-01  387   * Call this function when an idev detaches or replaces an attached hwpt
39cfab38b364cc Nicolin Chen    2023-08-01  388   */
39cfab38b364cc Nicolin Chen    2023-08-01  389  static void iommufd_device_remove_rr(struct iommufd_device *idev,
39cfab38b364cc Nicolin Chen    2023-08-01  390  				     struct iommufd_hw_pagetable *hwpt,
39cfab38b364cc Nicolin Chen    2023-08-01  391  				     struct iommufd_hw_pagetable *new_hwpt)
39cfab38b364cc Nicolin Chen    2023-08-01  392  {
a004e3ce4be092 Nicolin Chen    2023-08-02  393  	struct iommufd_ioas *ioas;
a004e3ce4be092 Nicolin Chen    2023-08-02  394  	bool keep_sw_msi;
a004e3ce4be092 Nicolin Chen    2023-08-02  395  
39cfab38b364cc Nicolin Chen    2023-08-01  396  	if (WARN_ON(!hwpt))
39cfab38b364cc Nicolin Chen    2023-08-01  397  		return;
a004e3ce4be092 Nicolin Chen    2023-08-02  398  	if (!iommufd_must_remove_rr(hwpt, new_hwpt, &keep_sw_msi))
39cfab38b364cc Nicolin Chen    2023-08-01  399  		return;
a004e3ce4be092 Nicolin Chen    2023-08-02  400  	if (hwpt->user_managed)
a004e3ce4be092 Nicolin Chen    2023-08-02  401  		ioas = hwpt->parent->ioas;
a004e3ce4be092 Nicolin Chen    2023-08-02  402  	else
a004e3ce4be092 Nicolin Chen    2023-08-02  403  		ioas = hwpt->ioas;
a004e3ce4be092 Nicolin Chen    2023-08-02  404  	iopt_remove_reserved_iova(&ioas->iopt, idev->dev, keep_sw_msi);
39cfab38b364cc Nicolin Chen    2023-08-01  405  }
39cfab38b364cc Nicolin Chen    2023-08-01  406  
39cfab38b364cc Nicolin Chen    2023-08-01  407  static bool iommufd_must_enforce_rr(struct iommufd_hw_pagetable *old_hwpt,
a004e3ce4be092 Nicolin Chen    2023-08-02  408  				    struct iommufd_hw_pagetable *new_hwpt,
a004e3ce4be092 Nicolin Chen    2023-08-02  409  				    bool *sw_msi_only)
39cfab38b364cc Nicolin Chen    2023-08-01  410  {
a004e3ce4be092 Nicolin Chen    2023-08-02  411  	struct iommufd_ioas *old_ioas, *new_ioas;
a004e3ce4be092 Nicolin Chen    2023-08-02  412  
a004e3ce4be092 Nicolin Chen    2023-08-02  413  	if (!new_hwpt)
a004e3ce4be092 Nicolin Chen    2023-08-02  414  		return false;
a004e3ce4be092 Nicolin Chen    2023-08-02  415  	else if (new_hwpt->user_managed)
a004e3ce4be092 Nicolin Chen    2023-08-02  416  		new_ioas = new_hwpt->parent->ioas;
a004e3ce4be092 Nicolin Chen    2023-08-02  417  	else
a004e3ce4be092 Nicolin Chen    2023-08-02  418  		new_ioas = new_hwpt->ioas;
39cfab38b364cc Nicolin Chen    2023-08-01  419  
39cfab38b364cc Nicolin Chen    2023-08-01 @420  	if (!old_hwpt)
39cfab38b364cc Nicolin Chen    2023-08-01  421  		old_ioas = NULL;
a004e3ce4be092 Nicolin Chen    2023-08-02  422  	else if (old_hwpt->user_managed)
a004e3ce4be092 Nicolin Chen    2023-08-02  423  		old_ioas = old_hwpt->parent->ioas;
39cfab38b364cc Nicolin Chen    2023-08-01  424  	else
39cfab38b364cc Nicolin Chen    2023-08-01  425  		old_ioas = old_hwpt->ioas;
39cfab38b364cc Nicolin Chen    2023-08-01  426  
a004e3ce4be092 Nicolin Chen    2023-08-02  427  	if (new_hwpt->user_managed)
a004e3ce4be092 Nicolin Chen    2023-08-02  428  		*sw_msi_only = true;
a004e3ce4be092 Nicolin Chen    2023-08-02  429  	else
a004e3ce4be092 Nicolin Chen    2023-08-02  430  		*sw_msi_only = false;
a004e3ce4be092 Nicolin Chen    2023-08-02  431  
39cfab38b364cc Nicolin Chen    2023-08-01  432  	/* When switching IOAS, enforcing the new IOAS is a must */
a004e3ce4be092 Nicolin Chen    2023-08-02  433  	if (old_ioas != new_ioas)
39cfab38b364cc Nicolin Chen    2023-08-01  434  		return true;
a004e3ce4be092 Nicolin Chen    2023-08-02  435  	/*
a004e3ce4be092 Nicolin Chen    2023-08-02  436  	 * Do not forget to enforce all regions when switching from a user-
a004e3ce4be092 Nicolin Chen    2023-08-02  437  	 * managed hw_pagetable to its parent kernel-managed hw_pagetable.
a004e3ce4be092 Nicolin Chen    2023-08-02  438  	 */
a004e3ce4be092 Nicolin Chen    2023-08-02 @439  	if (old_hwpt->user_managed && !new_hwpt->user_managed)
a004e3ce4be092 Nicolin Chen    2023-08-02  440  		return true;
a004e3ce4be092 Nicolin Chen    2023-08-02  441  	/*
a004e3ce4be092 Nicolin Chen    2023-08-02  442  	 * Do not enforce in the remaining cases when IOAS isn't changed:
a004e3ce4be092 Nicolin Chen    2023-08-02  443  	 * - switching from a kernel-managed hw_pagetable to another kernel-
a004e3ce4be092 Nicolin Chen    2023-08-02  444  	 *   managed hw_pagetable associated to the same IOAS. All the existing
a004e3ce4be092 Nicolin Chen    2023-08-02  445  	 *   reserved regions remain in the IOAS in this case.
a004e3ce4be092 Nicolin Chen    2023-08-02  446  	 * - switching from a kernel-managed hw_pagetable to its associated
a004e3ce4be092 Nicolin Chen    2023-08-02  447  	 *   user-managed hw_pagetable. In this case, all the reserved regions
a004e3ce4be092 Nicolin Chen    2023-08-02  448  	 *   except IOMMU_RESV_SW_MSI will be removed from the reserved list.
a004e3ce4be092 Nicolin Chen    2023-08-02  449  	 * - switching from a user-managed hw_pagetable to another user-managed
a004e3ce4be092 Nicolin Chen    2023-08-02  450  	 *   hw_pagetable associated to the same parent hw_pagetable (or IOAS).
a004e3ce4be092 Nicolin Chen    2023-08-02  451  	 *   In this case, IOMMU_RESV_SW_MSI is already enforced in the IOAS.
a004e3ce4be092 Nicolin Chen    2023-08-02  452  	 */
39cfab38b364cc Nicolin Chen    2023-08-01  453  	return false;
39cfab38b364cc Nicolin Chen    2023-08-01  454  }
39cfab38b364cc Nicolin Chen    2023-08-01  455  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
