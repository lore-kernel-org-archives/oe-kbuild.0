Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED5A10A1F
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Mar 2025 03:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742096904; cv=none; b=Ata4BIB/IanOTKhhBesgAV5M1WdkQqWoCL/rjGP6Yf2XdQRS4wG4U+mGEKWkm6iybynynbG3bf9BQ+ex+ECoqI0r1qa2jP3etLstccW182EIp1+Fe20ZaypZVar7O3c7WHcemwFyrNnK2luqgQMT4/0xaFSxbb8l2YBcuK37N8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742096904; c=relaxed/simple;
	bh=afPHJnpkrG0fbWvBL5Ch+RJRAPng2PXYKmWCGXoq1kk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R0l6CANfAWbCWkSzSUq0jV3jmZIIwxrNPWaGZGF23+MH9Tbk2QG8McX1i6wM/seeHrMUPelwQGs15kJZVVY8VG7WkUhxvLqIjFzWTAdULnKLzmdKycuXhS3s5Mt2bsZCWP4FitFWABUoS3NEpj/i7bVA9pi59h8mp7VPUB2UObg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RbDO3WFp; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RbDO3WFp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742096901; x=1773632901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=afPHJnpkrG0fbWvBL5Ch+RJRAPng2PXYKmWCGXoq1kk=;
  b=RbDO3WFphksMn+VdcbDTS2KtPQFyGjWtgPBE+zjlSR+o06n9IjfGZEfK
   AyJYNna4Wch1HJQr6wfGAZ2GmETsnryFvm+FOmgPBQXWGn66klKJR5IYQ
   A/h8CW4Vf3d5/Y35os6T8nkMk1PCXz6Tx/GrmQgsIomhiaUB/V2ziN//H
   zAtCaMp6jVybXtAyNaXEBuCfknyZvTPeiNMonW++ItiT9ziyltEjGRc6S
   4jFiq9kyuqIPXCLUP+6YzawblFuIKMNuf/zNCS/xbOdkDys5wnNhEeIpG
   ws9DCLH6aKTvHitPIN52h0B1uSI2p6Tbkf4dWvirjDTHsnW3lMVj68jy2
   w==;
X-CSE-ConnectionGUID: yuDcJK0hRB2naYM/bOupUA==
X-CSE-MsgGUID: V8+5Ij0BSbm0nWhkF8lH2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="53846471"
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="53846471"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 20:48:20 -0700
X-CSE-ConnectionGUID: FkmEU7raRTa0D9VQPNsnGw==
X-CSE-MsgGUID: Bs3FmFsRQDygwAdfVEy8hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="121821900"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 15 Mar 2025 20:48:19 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttez3-000BqF-0d;
	Sun, 16 Mar 2025 03:48:17 +0000
Date: Sun, 16 Mar 2025 11:47:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20250311 20/30]
 drivers/iommu/iommufd/device.c:478 iommufd_hw_pagetable_attach() warn:
 passing positive error code '4294950918-4294967294' to 'PTR_ERR'
Message-ID: <202503161104.CANtg5Ng-lkp@intel.com>
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

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-20250311
head:   61681190f00a2bd3a65f06f64d4279c5a9987c75
commit: 88f4b638c9af4670720e029522e8fee6e55cb26d [20/30] iommufd/device: Add pasid_attach array to track per-PASID attach
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: openrisc-randconfig-r071-20250314 (https://download.01.org/0day-ci/archive/20250316/202503161104.CANtg5Ng-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503161104.CANtg5Ng-lkp@intel.com/

New smatch warnings:
drivers/iommu/iommufd/device.c:478 iommufd_hw_pagetable_attach() warn: passing positive error code '4294950918-4294967294' to 'PTR_ERR'

Old smatch warnings:
drivers/iommu/iommufd/device.c:843 iommufd_device_change_pt() warn: passing positive error code '(-22)' to 'PTR_ERR'
drivers/iommu/iommufd/device.c:1350 iommufd_access_rw() error: uninitialized symbol 'rc'.

vim +478 drivers/iommu/iommufd/device.c

fb21b1568adaa76 Nicolin Chen    2025-02-03  462  
339fbf3ae144263 Jason Gunthorpe 2023-03-01  463  int iommufd_hw_pagetable_attach(struct iommufd_hw_pagetable *hwpt,
0e3f068ad552018 Yi Liu          2025-02-26  464  				struct iommufd_device *idev, ioasid_t pasid)
e8d57210035b637 Jason Gunthorpe 2022-11-29  465  {
b2f44814680b569 Nicolin Chen    2024-08-06  466  	struct iommufd_hwpt_paging *hwpt_paging = find_hwpt_paging(hwpt);
509c6c6f3098710 Yi Liu          2025-02-26  467  	bool attach_resv = hwpt_paging && pasid == IOMMU_NO_PASID;
88f4b638c9af467 Yi Liu          2025-03-09  468  	struct iommufd_hw_pagetable *old_hwpt = NULL;
481d086162ecc90 Yi Liu          2025-03-06  469  	struct iommufd_group *igroup = idev->igroup;
80ca6ff4d5b9edf Yi Liu          2025-03-08  470  	struct iommufd_attach_handle *handle;
e8d57210035b637 Jason Gunthorpe 2022-11-29  471  	int rc;
e8d57210035b637 Jason Gunthorpe 2022-11-29  472  
481d086162ecc90 Yi Liu          2025-03-06  473  	mutex_lock(&igroup->lock);
339fbf3ae144263 Jason Gunthorpe 2023-03-01  474  
88f4b638c9af467 Yi Liu          2025-03-09  475  	handle = xa_cmpxchg(&igroup->pasid_attach, pasid, NULL,
88f4b638c9af467 Yi Liu          2025-03-09  476  			    XA_ZERO_ENTRY, GFP_KERNEL);
88f4b638c9af467 Yi Liu          2025-03-09  477  	if (xa_is_err(handle)) {
88f4b638c9af467 Yi Liu          2025-03-09 @478  		rc = PTR_ERR(handle);
88f4b638c9af467 Yi Liu          2025-03-09  479  		goto err_unlock;
88f4b638c9af467 Yi Liu          2025-03-09  480  	}
88f4b638c9af467 Yi Liu          2025-03-09  481  
c8cb4382bcb8855 Yi Liu          2025-03-09  482  	if (!handle) {
80ca6ff4d5b9edf Yi Liu          2025-03-08  483  		handle = kzalloc(sizeof(*handle), GFP_KERNEL);
80ca6ff4d5b9edf Yi Liu          2025-03-08  484  		if (!handle) {
80ca6ff4d5b9edf Yi Liu          2025-03-08  485  			rc = -ENOMEM;
88f4b638c9af467 Yi Liu          2025-03-09  486  			goto err_release_id;
80ca6ff4d5b9edf Yi Liu          2025-03-08  487  		}
80ca6ff4d5b9edf Yi Liu          2025-03-08  488  		handle->idev = idev;
405653abe7c7f0c Yi Liu          2025-03-08  489  		xa_init(&handle->device_array);
80ca6ff4d5b9edf Yi Liu          2025-03-08  490  	}
80ca6ff4d5b9edf Yi Liu          2025-03-08  491  
c8cb4382bcb8855 Yi Liu          2025-03-09  492  	old_hwpt = handle->hwpt;
c8cb4382bcb8855 Yi Liu          2025-03-09  493  
405653abe7c7f0c Yi Liu          2025-03-08  494  	rc = xa_insert(&handle->device_array, idev->obj.id, idev, GFP_KERNEL);
3c97e09cef9ed05 Yi Liu          2025-03-08  495  	if (rc) {
3c97e09cef9ed05 Yi Liu          2025-03-08  496  		WARN_ON(rc == -EBUSY && !old_hwpt);
3c97e09cef9ed05 Yi Liu          2025-03-08  497  		goto err_free_handle;
3c97e09cef9ed05 Yi Liu          2025-03-08  498  	}
3c97e09cef9ed05 Yi Liu          2025-03-08  499  
c8cb4382bcb8855 Yi Liu          2025-03-09  500  	if (old_hwpt && old_hwpt != hwpt) {
c8cb4382bcb8855 Yi Liu          2025-03-09  501  		rc = -EINVAL;
3c97e09cef9ed05 Yi Liu          2025-03-08  502  		goto err_erase_dev;
c8cb4382bcb8855 Yi Liu          2025-03-09  503  	}
c8cb4382bcb8855 Yi Liu          2025-03-09  504  
509c6c6f3098710 Yi Liu          2025-02-26  505  	if (attach_resv) {
b2f44814680b569 Nicolin Chen    2024-08-06  506  		rc = iommufd_device_attach_reserved_iova(idev, hwpt_paging);
e8d57210035b637 Jason Gunthorpe 2022-11-29  507  		if (rc)
3c97e09cef9ed05 Yi Liu          2025-03-08  508  			goto err_erase_dev;
58d84f430dc7f73 Jason Gunthorpe 2023-10-25  509  	}
e8d57210035b637 Jason Gunthorpe 2022-11-29  510  
e8d57210035b637 Jason Gunthorpe 2022-11-29  511  	/*
91a2e17e243f70e Jason Gunthorpe 2023-07-17  512  	 * Only attach to the group once for the first device that is in the
91a2e17e243f70e Jason Gunthorpe 2023-07-17  513  	 * group. All the other devices will follow this attachment. The user
91a2e17e243f70e Jason Gunthorpe 2023-07-17  514  	 * should attach every device individually to the hwpt as the per-device
91a2e17e243f70e Jason Gunthorpe 2023-07-17  515  	 * reserved regions are only updated during individual device
91a2e17e243f70e Jason Gunthorpe 2023-07-17  516  	 * attachment.
e8d57210035b637 Jason Gunthorpe 2022-11-29  517  	 */
88f4b638c9af467 Yi Liu          2025-03-09  518  	if (!iommufd_group_device_num(igroup, pasid)) {
80ca6ff4d5b9edf Yi Liu          2025-03-08  519  		rc = iommufd_hwpt_attach_device(hwpt, idev, pasid, handle);
e8d57210035b637 Jason Gunthorpe 2022-11-29  520  		if (rc)
339fbf3ae144263 Jason Gunthorpe 2023-03-01  521  			goto err_unresv;
c8cb4382bcb8855 Yi Liu          2025-03-09  522  		handle->hwpt = hwpt;
88f4b638c9af467 Yi Liu          2025-03-09  523  		WARN_ON(xa_is_err(xa_store(&igroup->pasid_attach, pasid, handle,
88f4b638c9af467 Yi Liu          2025-03-09  524  					   GFP_KERNEL)));
e8d57210035b637 Jason Gunthorpe 2022-11-29  525  	}
91a2e17e243f70e Jason Gunthorpe 2023-07-17  526  	refcount_inc(&hwpt->obj.users);
481d086162ecc90 Yi Liu          2025-03-06  527  	mutex_unlock(&igroup->lock);
339fbf3ae144263 Jason Gunthorpe 2023-03-01  528  	return 0;
339fbf3ae144263 Jason Gunthorpe 2023-03-01  529  err_unresv:
509c6c6f3098710 Yi Liu          2025-02-26  530  	if (attach_resv)
b2f44814680b569 Nicolin Chen    2024-08-06  531  		iopt_remove_reserved_iova(&hwpt_paging->ioas->iopt, idev->dev);
3c97e09cef9ed05 Yi Liu          2025-03-08  532  err_erase_dev:
405653abe7c7f0c Yi Liu          2025-03-08  533  	xa_erase(&handle->device_array, idev->obj.id);
80ca6ff4d5b9edf Yi Liu          2025-03-08  534  err_free_handle:
c8cb4382bcb8855 Yi Liu          2025-03-09  535  	if (!old_hwpt)
80ca6ff4d5b9edf Yi Liu          2025-03-08  536  		kfree(handle);
88f4b638c9af467 Yi Liu          2025-03-09  537  err_release_id:
88f4b638c9af467 Yi Liu          2025-03-09  538  	if (!old_hwpt)
88f4b638c9af467 Yi Liu          2025-03-09  539  		xa_release(&igroup->pasid_attach, pasid);
91a2e17e243f70e Jason Gunthorpe 2023-07-17  540  err_unlock:
481d086162ecc90 Yi Liu          2025-03-06  541  	mutex_unlock(&igroup->lock);
339fbf3ae144263 Jason Gunthorpe 2023-03-01  542  	return rc;
339fbf3ae144263 Jason Gunthorpe 2023-03-01  543  }
339fbf3ae144263 Jason Gunthorpe 2023-03-01  544  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
