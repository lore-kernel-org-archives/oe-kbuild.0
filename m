Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A121118E
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Oct 2023 09:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJE06L2f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697190680; x=1728726680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IyHhHK+zLCpraOPphypETIsGl4DvGk5mnFZeHAIDdDo=;
  b=UJE06L2f7G1IPtJQ1WjtJnqbZh8N5A7wr+Sku56XzFnaPuoxIMXK5uN3
   EaGtoZySFpR9JdovreqfPvubsjvjwgzs7AxIrrRxC1EVcvokvX9+xA1xy
   Mgs3ZZ1E40/kmGxtn6HCDSkM9H17wzYkHpXYmQ/t1hrApWNEamY2VKW1z
   q35CGRPJATseO+NywARzB2DmfyYdyJTK3WT+pEUfDwGko2NaPezJQgSKj
   q5k5dCVj9UCJHJhVaxgaoRAt8nHrjbbW72/9udU9SoJyGZjcHX9S6b8b1
   yWKDZ4r4u5WbYeKzKi/i06hEtLBDW3TwpFxPKrzP/8kxI2SnPl67gAkQK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="364509644"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="364509644"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 02:51:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="784094399"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="784094399"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 13 Oct 2023 02:51:17 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrEp9-0004b7-0L;
	Fri, 13 Oct 2023 09:51:15 +0000
Date: Fri, 13 Oct 2023 17:51:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-0829 18/95]
 drivers/iommu/iommufd/device.c:364 iommufd_must_remove_rr() error: we
 previously assumed 'new_hwpt' could be null (see line 347)
Message-ID: <202310131732.VsaAX8mi-lkp@intel.com>
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

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-0829
head:   39409b7fc57036afdb9ea1b641c827951ffbd32e
commit: 53ea52db7df766f9d17fd631b8594b34357a8979 [18/95] iommufd: Handle IOMMU_RESV_SW_MSI complication with user-managed HWPTs
:::::: branch date: 6 weeks ago
:::::: commit date: 9 weeks ago
config: x86_64-randconfig-161-20230826 (https://download.01.org/0day-ci/archive/20231013/202310131732.VsaAX8mi-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310131732.VsaAX8mi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310131732.VsaAX8mi-lkp@intel.com/

New smatch warnings:
drivers/iommu/iommufd/device.c:364 iommufd_must_remove_rr() error: we previously assumed 'new_hwpt' could be null (see line 347)
drivers/iommu/iommufd/device.c:441 iommufd_must_enforce_rr() error: we previously assumed 'old_hwpt' could be null (see line 422)

Old smatch warnings:
drivers/iommu/iommufd/device.c:1273 iommufd_access_rw() error: uninitialized symbol 'rc'.

vim +/new_hwpt +364 drivers/iommu/iommufd/device.c

e8d57210035b63 Jason Gunthorpe 2022-11-29  333  
4d6345ce28d32c Nicolin Chen    2023-08-01  334  static bool iommufd_must_remove_rr(struct iommufd_hw_pagetable *old_hwpt,
53ea52db7df766 Nicolin Chen    2023-08-02  335  				   struct iommufd_hw_pagetable *new_hwpt,
53ea52db7df766 Nicolin Chen    2023-08-02  336  				   bool *keep_sw_msi)
4d6345ce28d32c Nicolin Chen    2023-08-01  337  {
53ea52db7df766 Nicolin Chen    2023-08-02  338  	struct iommufd_ioas *old_ioas, *new_ioas;
53ea52db7df766 Nicolin Chen    2023-08-02  339  
53ea52db7df766 Nicolin Chen    2023-08-02  340  	if (!old_hwpt)
53ea52db7df766 Nicolin Chen    2023-08-02  341  		return false;
53ea52db7df766 Nicolin Chen    2023-08-02  342  	else if (old_hwpt->user_managed)
53ea52db7df766 Nicolin Chen    2023-08-02  343  		old_ioas = old_hwpt->parent->ioas;
53ea52db7df766 Nicolin Chen    2023-08-02  344  	else
53ea52db7df766 Nicolin Chen    2023-08-02  345  		old_ioas = old_hwpt->ioas;
4d6345ce28d32c Nicolin Chen    2023-08-01  346  
4d6345ce28d32c Nicolin Chen    2023-08-01 @347  	if (!new_hwpt)
4d6345ce28d32c Nicolin Chen    2023-08-01  348  		new_ioas = NULL;
53ea52db7df766 Nicolin Chen    2023-08-02  349  	else if (new_hwpt->user_managed)
53ea52db7df766 Nicolin Chen    2023-08-02  350  		new_ioas = new_hwpt->parent->ioas;
4d6345ce28d32c Nicolin Chen    2023-08-01  351  	else
4d6345ce28d32c Nicolin Chen    2023-08-01  352  		new_ioas = new_hwpt->ioas;
4d6345ce28d32c Nicolin Chen    2023-08-01  353  
4d6345ce28d32c Nicolin Chen    2023-08-01  354  	/* When switching IOAS, cleaning up the old IOAS is a must */
53ea52db7df766 Nicolin Chen    2023-08-02  355  	if (old_ioas != new_ioas) {
53ea52db7df766 Nicolin Chen    2023-08-02  356  		*keep_sw_msi = false;
53ea52db7df766 Nicolin Chen    2023-08-02  357  		return true;
53ea52db7df766 Nicolin Chen    2023-08-02  358  	}
53ea52db7df766 Nicolin Chen    2023-08-02  359  
53ea52db7df766 Nicolin Chen    2023-08-02  360  	/*
53ea52db7df766 Nicolin Chen    2023-08-02  361  	 * Must keep IOMMU_RESV_SW_MSI when switching from a kernel-managed
53ea52db7df766 Nicolin Chen    2023-08-02  362  	 * hw_pagetable to its associated user-managed hw_pagetable.
53ea52db7df766 Nicolin Chen    2023-08-02  363  	 */
53ea52db7df766 Nicolin Chen    2023-08-02 @364  	if (!old_hwpt->user_managed && new_hwpt->user_managed) {
53ea52db7df766 Nicolin Chen    2023-08-02  365  		*keep_sw_msi = true;
4d6345ce28d32c Nicolin Chen    2023-08-01  366  		return true;
53ea52db7df766 Nicolin Chen    2023-08-02  367  	}
53ea52db7df766 Nicolin Chen    2023-08-02  368  	/*
53ea52db7df766 Nicolin Chen    2023-08-02  369  	 * Do not remove in the remaining cases when IOAS isn't changed:
53ea52db7df766 Nicolin Chen    2023-08-02  370  	 * - switching from a kernel-managed hw_pagetable to another kernel-
53ea52db7df766 Nicolin Chen    2023-08-02  371  	 *   managed hw_pagetable associated to the same IOAS. All the existing
53ea52db7df766 Nicolin Chen    2023-08-02  372  	 *   reserved regions remain in the IOAS in this case.
53ea52db7df766 Nicolin Chen    2023-08-02  373  	 * - switching from a user-managed hw_pagetable to an associated kernel-
53ea52db7df766 Nicolin Chen    2023-08-02  374  	 *   managed hw_pagetable. In this case, all reserved regions must have
53ea52db7df766 Nicolin Chen    2023-08-02  375  	 *   been enforced in the IOAS, i.e. no removal after the enforcement.
53ea52db7df766 Nicolin Chen    2023-08-02  376  	 * - switching from a user-managed hw_pagetable to another user-managed
53ea52db7df766 Nicolin Chen    2023-08-02  377  	 *   hw_pagetable associated to the same parent hw_pagetable (or IOAS).
53ea52db7df766 Nicolin Chen    2023-08-02  378  	 *   In this case, the existing IOMMU_RESV_SW_MSI regions must be kept.
53ea52db7df766 Nicolin Chen    2023-08-02  379  	 */
4d6345ce28d32c Nicolin Chen    2023-08-01  380  	return false;
4d6345ce28d32c Nicolin Chen    2023-08-01  381  }
4d6345ce28d32c Nicolin Chen    2023-08-01  382  
4d6345ce28d32c Nicolin Chen    2023-08-01  383  /*
4d6345ce28d32c Nicolin Chen    2023-08-01  384   * Remove device's reserved regions from the reserved list of an iopt
4d6345ce28d32c Nicolin Chen    2023-08-01  385   * @idev: Device to remove its owned reserved regions
4d6345ce28d32c Nicolin Chen    2023-08-01  386   * @hwpt: Detaching hw_pagetable
4d6345ce28d32c Nicolin Chen    2023-08-01  387   * @new_hwpt: Optionally new hw_pagetable to replace with
4d6345ce28d32c Nicolin Chen    2023-08-01  388   *
4d6345ce28d32c Nicolin Chen    2023-08-01  389   * Call this function when an idev detaches or replaces an attached hwpt
4d6345ce28d32c Nicolin Chen    2023-08-01  390   */
4d6345ce28d32c Nicolin Chen    2023-08-01  391  static void iommufd_device_remove_rr(struct iommufd_device *idev,
4d6345ce28d32c Nicolin Chen    2023-08-01  392  				     struct iommufd_hw_pagetable *hwpt,
4d6345ce28d32c Nicolin Chen    2023-08-01  393  				     struct iommufd_hw_pagetable *new_hwpt)
4d6345ce28d32c Nicolin Chen    2023-08-01  394  {
53ea52db7df766 Nicolin Chen    2023-08-02  395  	struct iommufd_ioas *ioas;
53ea52db7df766 Nicolin Chen    2023-08-02  396  	bool keep_sw_msi;
53ea52db7df766 Nicolin Chen    2023-08-02  397  
4d6345ce28d32c Nicolin Chen    2023-08-01  398  	if (WARN_ON(!hwpt))
4d6345ce28d32c Nicolin Chen    2023-08-01  399  		return;
53ea52db7df766 Nicolin Chen    2023-08-02  400  	if (!iommufd_must_remove_rr(hwpt, new_hwpt, &keep_sw_msi))
4d6345ce28d32c Nicolin Chen    2023-08-01  401  		return;
53ea52db7df766 Nicolin Chen    2023-08-02  402  	if (hwpt->user_managed)
53ea52db7df766 Nicolin Chen    2023-08-02  403  		ioas = hwpt->parent->ioas;
53ea52db7df766 Nicolin Chen    2023-08-02  404  	else
53ea52db7df766 Nicolin Chen    2023-08-02  405  		ioas = hwpt->ioas;
53ea52db7df766 Nicolin Chen    2023-08-02  406  	iopt_remove_reserved_iova(&ioas->iopt, idev->dev, keep_sw_msi);
4d6345ce28d32c Nicolin Chen    2023-08-01  407  }
4d6345ce28d32c Nicolin Chen    2023-08-01  408  
4d6345ce28d32c Nicolin Chen    2023-08-01  409  static bool iommufd_must_enforce_rr(struct iommufd_hw_pagetable *old_hwpt,
53ea52db7df766 Nicolin Chen    2023-08-02  410  				    struct iommufd_hw_pagetable *new_hwpt,
53ea52db7df766 Nicolin Chen    2023-08-02  411  				    bool *sw_msi_only)
4d6345ce28d32c Nicolin Chen    2023-08-01  412  {
53ea52db7df766 Nicolin Chen    2023-08-02  413  	struct iommufd_ioas *old_ioas, *new_ioas;
53ea52db7df766 Nicolin Chen    2023-08-02  414  
53ea52db7df766 Nicolin Chen    2023-08-02  415  	if (!new_hwpt)
53ea52db7df766 Nicolin Chen    2023-08-02  416  		return false;
53ea52db7df766 Nicolin Chen    2023-08-02  417  	else if (new_hwpt->user_managed)
53ea52db7df766 Nicolin Chen    2023-08-02  418  		new_ioas = new_hwpt->parent->ioas;
53ea52db7df766 Nicolin Chen    2023-08-02  419  	else
53ea52db7df766 Nicolin Chen    2023-08-02  420  		new_ioas = new_hwpt->ioas;
4d6345ce28d32c Nicolin Chen    2023-08-01  421  
4d6345ce28d32c Nicolin Chen    2023-08-01 @422  	if (!old_hwpt)
4d6345ce28d32c Nicolin Chen    2023-08-01  423  		old_ioas = NULL;
53ea52db7df766 Nicolin Chen    2023-08-02  424  	else if (old_hwpt->user_managed)
53ea52db7df766 Nicolin Chen    2023-08-02  425  		old_ioas = old_hwpt->parent->ioas;
4d6345ce28d32c Nicolin Chen    2023-08-01  426  	else
4d6345ce28d32c Nicolin Chen    2023-08-01  427  		old_ioas = old_hwpt->ioas;
4d6345ce28d32c Nicolin Chen    2023-08-01  428  
53ea52db7df766 Nicolin Chen    2023-08-02  429  	if (new_hwpt->user_managed)
53ea52db7df766 Nicolin Chen    2023-08-02  430  		*sw_msi_only = true;
53ea52db7df766 Nicolin Chen    2023-08-02  431  	else
53ea52db7df766 Nicolin Chen    2023-08-02  432  		*sw_msi_only = false;
53ea52db7df766 Nicolin Chen    2023-08-02  433  
4d6345ce28d32c Nicolin Chen    2023-08-01  434  	/* When switching IOAS, enforcing the new IOAS is a must */
53ea52db7df766 Nicolin Chen    2023-08-02  435  	if (old_ioas != new_ioas)
4d6345ce28d32c Nicolin Chen    2023-08-01  436  		return true;
53ea52db7df766 Nicolin Chen    2023-08-02  437  	/*
53ea52db7df766 Nicolin Chen    2023-08-02  438  	 * Do not forget to enforce all regions when switching from a user-
53ea52db7df766 Nicolin Chen    2023-08-02  439  	 * managed hw_pagetable to its parent kernel-managed hw_pagetable.
53ea52db7df766 Nicolin Chen    2023-08-02  440  	 */
53ea52db7df766 Nicolin Chen    2023-08-02 @441  	if (old_hwpt->user_managed && !new_hwpt->user_managed)
53ea52db7df766 Nicolin Chen    2023-08-02  442  		return true;
53ea52db7df766 Nicolin Chen    2023-08-02  443  	/*
53ea52db7df766 Nicolin Chen    2023-08-02  444  	 * Do not enforce in the remaining cases when IOAS isn't changed:
53ea52db7df766 Nicolin Chen    2023-08-02  445  	 * - switching from a kernel-managed hw_pagetable to another kernel-
53ea52db7df766 Nicolin Chen    2023-08-02  446  	 *   managed hw_pagetable associated to the same IOAS. All the existing
53ea52db7df766 Nicolin Chen    2023-08-02  447  	 *   reserved regions remain in the IOAS in this case.
53ea52db7df766 Nicolin Chen    2023-08-02  448  	 * - switching from a kernel-managed hw_pagetable to its associated
53ea52db7df766 Nicolin Chen    2023-08-02  449  	 *   user-managed hw_pagetable. In this case, all the reserved regions
53ea52db7df766 Nicolin Chen    2023-08-02  450  	 *   except IOMMU_RESV_SW_MSI will be removed from the reserved list.
53ea52db7df766 Nicolin Chen    2023-08-02  451  	 * - switching from a user-managed hw_pagetable to another user-managed
53ea52db7df766 Nicolin Chen    2023-08-02  452  	 *   hw_pagetable associated to the same parent hw_pagetable (or IOAS).
53ea52db7df766 Nicolin Chen    2023-08-02  453  	 *   In this case, IOMMU_RESV_SW_MSI is already enforced in the IOAS.
53ea52db7df766 Nicolin Chen    2023-08-02  454  	 */
4d6345ce28d32c Nicolin Chen    2023-08-01  455  	return false;
4d6345ce28d32c Nicolin Chen    2023-08-01  456  }
4d6345ce28d32c Nicolin Chen    2023-08-01  457  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
