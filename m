Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA531E834E
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Oct 2025 05:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761800976; cv=none; b=I6Wwt0kvclVeujNYbpeJr3doNssncbn4p/8dAxbuwu9gIpZfRO+C8xgZCC4N8OdtUsPpuTx+ulxjwW/Px+1V9btXbYTgT9P44xKwWytZEN77favO5xzN0Btw2u0Q7N556hkwS7BydRhFQ8V5nM+uWec8FCk8O3/D015BHW9Sric=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761800976; c=relaxed/simple;
	bh=TqWYm58adCe8BIjRE0hT6bgDh8k8Ml5yn6tkkATyJnU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bPpXwINksMJrKH8eAMQjtxw78dbCZVQ1MsHRvXYpKQE1PsbGCVGvEKuT3CvMunmN4XO8Rqlt197C0sNt5G95PoWLnisRzZnSzdYzFhuvdZFZ+DUSn+41v//b851y+clgCskA1qMWIZ6xo9e221STH2+0SGTLSwInpjnEbuLETiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vmh764pj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vmh764pj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761800973; x=1793336973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TqWYm58adCe8BIjRE0hT6bgDh8k8Ml5yn6tkkATyJnU=;
  b=Vmh764pjhzjZdQ+KqBMG51wOdKB1LvEvDTFhu0CvKtwq/U2bs7TSCvOI
   n9qvSXrDVy0HybogqsN6JFLMhIEepYfrW3/urd67cRE8IV2Om9jOqptGX
   jC80vBONq8GQnjIHOyg/w5lC2CGOlrhXOlVY3oBGnk5J3nTye4U0gl2fk
   t53VDzI371lgFCLhfFxmNAhymQkbxWxAu+nkQZCYptGyeoEBKYhij009C
   XOujf1FCi7nMuHPZZJG3ApA9e85ML4KhsW+93aXwuZPl9J5Hh99WZWJJl
   mAYIYV5Me8lEGsaZ3aWtGGNgiXnP7p8qp6WnQqmNRR76OUO4/5wHckoYX
   g==;
X-CSE-ConnectionGUID: AC5ExQQCR22s4GrEdATENg==
X-CSE-MsgGUID: LVwFYxFdRSe4FdJ8xFQwtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="75280899"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="75280899"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 22:09:33 -0700
X-CSE-ConnectionGUID: 0zDTsh1tTCOEe0QoqAWH9g==
X-CSE-MsgGUID: 3wCSWBWpRF6ZdPbhEnMIMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="185049609"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 29 Oct 2025 22:09:30 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEKud-000LU8-3A;
	Thu, 30 Oct 2025 05:09:27 +0000
Date: Thu, 30 Oct 2025 13:08:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/iommu/iommufd/viommu.c:252:1-7: preceding lock on line 173
Message-ID: <202510301327.ss7OGGT3-lkp@intel.com>
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
TO: Xu Yilun <yilun.xu@linux.intel.com>
CC: Jason Gunthorpe <jgg@ziepe.ca>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Nicolin Chen <nicolinc@nvidia.com>
CC: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
commit: 850f14f5b91986e586b66565c9c75bdd4c834571 iommufd: Destroy vdevice on idevice destroy
date:   3 months ago
:::::: branch date: 28 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-r064-20251030 (https://download.01.org/0day-ci/archive/20251030/202510301327.ss7OGGT3-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510301327.ss7OGGT3-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iommu/iommufd/viommu.c:252:1-7: preceding lock on line 173

vim +252 drivers/iommu/iommufd/viommu.c

850f14f5b91986 Xu Yilun     2025-07-16  143  
0ce5c2477af2e2 Nicolin Chen 2024-11-05  144  int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
0ce5c2477af2e2 Nicolin Chen 2024-11-05  145  {
0ce5c2477af2e2 Nicolin Chen 2024-11-05  146  	struct iommu_vdevice_alloc *cmd = ucmd->cmd;
0ce5c2477af2e2 Nicolin Chen 2024-11-05  147  	struct iommufd_vdevice *vdev, *curr;
ed42eee797ff3d Nicolin Chen 2025-07-09  148  	size_t vdev_size = sizeof(*vdev);
0ce5c2477af2e2 Nicolin Chen 2024-11-05  149  	struct iommufd_viommu *viommu;
0ce5c2477af2e2 Nicolin Chen 2024-11-05  150  	struct iommufd_device *idev;
0ce5c2477af2e2 Nicolin Chen 2024-11-05  151  	u64 virt_id = cmd->virt_id;
0ce5c2477af2e2 Nicolin Chen 2024-11-05  152  	int rc = 0;
0ce5c2477af2e2 Nicolin Chen 2024-11-05  153  
0ce5c2477af2e2 Nicolin Chen 2024-11-05  154  	/* virt_id indexes an xarray */
0ce5c2477af2e2 Nicolin Chen 2024-11-05  155  	if (virt_id > ULONG_MAX)
0ce5c2477af2e2 Nicolin Chen 2024-11-05  156  		return -EINVAL;
0ce5c2477af2e2 Nicolin Chen 2024-11-05  157  
0ce5c2477af2e2 Nicolin Chen 2024-11-05  158  	viommu = iommufd_get_viommu(ucmd, cmd->viommu_id);
0ce5c2477af2e2 Nicolin Chen 2024-11-05  159  	if (IS_ERR(viommu))
0ce5c2477af2e2 Nicolin Chen 2024-11-05  160  		return PTR_ERR(viommu);
0ce5c2477af2e2 Nicolin Chen 2024-11-05  161  
0ce5c2477af2e2 Nicolin Chen 2024-11-05  162  	idev = iommufd_get_device(ucmd, cmd->dev_id);
0ce5c2477af2e2 Nicolin Chen 2024-11-05  163  	if (IS_ERR(idev)) {
0ce5c2477af2e2 Nicolin Chen 2024-11-05  164  		rc = PTR_ERR(idev);
0ce5c2477af2e2 Nicolin Chen 2024-11-05  165  		goto out_put_viommu;
0ce5c2477af2e2 Nicolin Chen 2024-11-05  166  	}
0ce5c2477af2e2 Nicolin Chen 2024-11-05  167  
0ce5c2477af2e2 Nicolin Chen 2024-11-05  168  	if (viommu->iommu_dev != __iommu_get_iommu_dev(idev->dev)) {
0ce5c2477af2e2 Nicolin Chen 2024-11-05  169  		rc = -EINVAL;
0ce5c2477af2e2 Nicolin Chen 2024-11-05  170  		goto out_put_idev;
0ce5c2477af2e2 Nicolin Chen 2024-11-05  171  	}
0ce5c2477af2e2 Nicolin Chen 2024-11-05  172  
850f14f5b91986 Xu Yilun     2025-07-16 @173  	mutex_lock(&idev->igroup->lock);
850f14f5b91986 Xu Yilun     2025-07-16  174  	if (idev->destroying) {
850f14f5b91986 Xu Yilun     2025-07-16  175  		rc = -ENOENT;
850f14f5b91986 Xu Yilun     2025-07-16  176  		goto out_unlock_igroup;
850f14f5b91986 Xu Yilun     2025-07-16  177  	}
850f14f5b91986 Xu Yilun     2025-07-16  178  
850f14f5b91986 Xu Yilun     2025-07-16  179  	if (idev->vdev) {
850f14f5b91986 Xu Yilun     2025-07-16  180  		rc = -EEXIST;
850f14f5b91986 Xu Yilun     2025-07-16  181  		goto out_unlock_igroup;
850f14f5b91986 Xu Yilun     2025-07-16  182  	}
850f14f5b91986 Xu Yilun     2025-07-16  183  
ed42eee797ff3d Nicolin Chen 2025-07-09  184  	if (viommu->ops && viommu->ops->vdevice_size) {
ed42eee797ff3d Nicolin Chen 2025-07-09  185  		/*
ed42eee797ff3d Nicolin Chen 2025-07-09  186  		 * It is a driver bug for:
ed42eee797ff3d Nicolin Chen 2025-07-09  187  		 * - ops->vdevice_size smaller than the core structure size
ed42eee797ff3d Nicolin Chen 2025-07-09  188  		 * - not implementing a pairing ops->vdevice_init op
ed42eee797ff3d Nicolin Chen 2025-07-09  189  		 */
ed42eee797ff3d Nicolin Chen 2025-07-09  190  		if (WARN_ON_ONCE(viommu->ops->vdevice_size < vdev_size ||
ed42eee797ff3d Nicolin Chen 2025-07-09  191  				 !viommu->ops->vdevice_init)) {
ed42eee797ff3d Nicolin Chen 2025-07-09  192  			rc = -EOPNOTSUPP;
ed42eee797ff3d Nicolin Chen 2025-07-09  193  			goto out_put_idev;
ed42eee797ff3d Nicolin Chen 2025-07-09  194  		}
ed42eee797ff3d Nicolin Chen 2025-07-09  195  		vdev_size = viommu->ops->vdevice_size;
ed42eee797ff3d Nicolin Chen 2025-07-09  196  	}
ed42eee797ff3d Nicolin Chen 2025-07-09  197  
a64bae68adf1f8 Xu Yilun     2025-07-16  198  	vdev = (struct iommufd_vdevice *)_iommufd_object_alloc(
a64bae68adf1f8 Xu Yilun     2025-07-16  199  		ucmd->ictx, vdev_size, IOMMUFD_OBJ_VDEVICE);
0ce5c2477af2e2 Nicolin Chen 2024-11-05  200  	if (IS_ERR(vdev)) {
0ce5c2477af2e2 Nicolin Chen 2024-11-05  201  		rc = PTR_ERR(vdev);
850f14f5b91986 Xu Yilun     2025-07-16  202  		goto out_unlock_igroup;
0ce5c2477af2e2 Nicolin Chen 2024-11-05  203  	}
0ce5c2477af2e2 Nicolin Chen 2024-11-05  204  
c50a5de2c46523 Nicolin Chen 2025-07-09  205  	vdev->virt_id = virt_id;
0ce5c2477af2e2 Nicolin Chen 2024-11-05  206  	vdev->dev = idev->dev;
0ce5c2477af2e2 Nicolin Chen 2024-11-05  207  	get_device(idev->dev);
0ce5c2477af2e2 Nicolin Chen 2024-11-05  208  	vdev->viommu = viommu;
0ce5c2477af2e2 Nicolin Chen 2024-11-05  209  	refcount_inc(&viommu->obj.users);
850f14f5b91986 Xu Yilun     2025-07-16  210  	/*
850f14f5b91986 Xu Yilun     2025-07-16  211  	 * A short term users reference is held on the idev so long as we have
850f14f5b91986 Xu Yilun     2025-07-16  212  	 * the pointer. iommufd_device_pre_destroy() will revoke it before the
850f14f5b91986 Xu Yilun     2025-07-16  213  	 * idev real destruction.
850f14f5b91986 Xu Yilun     2025-07-16  214  	 */
850f14f5b91986 Xu Yilun     2025-07-16  215  	vdev->idev = idev;
850f14f5b91986 Xu Yilun     2025-07-16  216  
850f14f5b91986 Xu Yilun     2025-07-16  217  	/*
850f14f5b91986 Xu Yilun     2025-07-16  218  	 * iommufd_device_destroy() delays until idev->vdev is NULL before
850f14f5b91986 Xu Yilun     2025-07-16  219  	 * freeing the idev, which only happens once the vdev is finished
850f14f5b91986 Xu Yilun     2025-07-16  220  	 * destruction.
850f14f5b91986 Xu Yilun     2025-07-16  221  	 */
850f14f5b91986 Xu Yilun     2025-07-16  222  	idev->vdev = vdev;
0ce5c2477af2e2 Nicolin Chen 2024-11-05  223  
0ce5c2477af2e2 Nicolin Chen 2024-11-05  224  	curr = xa_cmpxchg(&viommu->vdevs, virt_id, NULL, vdev, GFP_KERNEL);
0ce5c2477af2e2 Nicolin Chen 2024-11-05  225  	if (curr) {
0ce5c2477af2e2 Nicolin Chen 2024-11-05  226  		rc = xa_err(curr) ?: -EEXIST;
a64bae68adf1f8 Xu Yilun     2025-07-16  227  		goto out_abort;
0ce5c2477af2e2 Nicolin Chen 2024-11-05  228  	}
0ce5c2477af2e2 Nicolin Chen 2024-11-05  229  
ed42eee797ff3d Nicolin Chen 2025-07-09  230  	if (viommu->ops && viommu->ops->vdevice_init) {
ed42eee797ff3d Nicolin Chen 2025-07-09  231  		rc = viommu->ops->vdevice_init(vdev);
ed42eee797ff3d Nicolin Chen 2025-07-09  232  		if (rc)
a64bae68adf1f8 Xu Yilun     2025-07-16  233  			goto out_abort;
ed42eee797ff3d Nicolin Chen 2025-07-09  234  	}
ed42eee797ff3d Nicolin Chen 2025-07-09  235  
0ce5c2477af2e2 Nicolin Chen 2024-11-05  236  	cmd->out_vdevice_id = vdev->obj.id;
0ce5c2477af2e2 Nicolin Chen 2024-11-05  237  	rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
a64bae68adf1f8 Xu Yilun     2025-07-16  238  	if (rc)
a64bae68adf1f8 Xu Yilun     2025-07-16  239  		goto out_abort;
a64bae68adf1f8 Xu Yilun     2025-07-16  240  	iommufd_object_finalize(ucmd->ictx, &vdev->obj);
850f14f5b91986 Xu Yilun     2025-07-16  241  	goto out_unlock_igroup;
0ce5c2477af2e2 Nicolin Chen 2024-11-05  242  
a64bae68adf1f8 Xu Yilun     2025-07-16  243  out_abort:
a64bae68adf1f8 Xu Yilun     2025-07-16  244  	iommufd_object_abort_and_destroy(ucmd->ictx, &vdev->obj);
850f14f5b91986 Xu Yilun     2025-07-16  245  out_unlock_igroup:
850f14f5b91986 Xu Yilun     2025-07-16  246  	mutex_unlock(&idev->igroup->lock);
0ce5c2477af2e2 Nicolin Chen 2024-11-05  247  out_put_idev:
850f14f5b91986 Xu Yilun     2025-07-16  248  	if (rc)
0ce5c2477af2e2 Nicolin Chen 2024-11-05  249  		iommufd_put_object(ucmd->ictx, &idev->obj);
0ce5c2477af2e2 Nicolin Chen 2024-11-05  250  out_put_viommu:
0ce5c2477af2e2 Nicolin Chen 2024-11-05  251  	iommufd_put_object(ucmd->ictx, &viommu->obj);
0ce5c2477af2e2 Nicolin Chen 2024-11-05 @252  	return rc;
0ce5c2477af2e2 Nicolin Chen 2024-11-05  253  }
2238ddc2b05607 Nicolin Chen 2025-07-09  254  

:::::: The code at line 252 was first introduced by commit
:::::: 0ce5c2477af2e2284b9c70474e4dae85db211680 iommufd/viommu: Add IOMMUFD_OBJ_VDEVICE and IOMMU_VDEVICE_ALLOC ioctl

:::::: TO: Nicolin Chen <nicolinc@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
