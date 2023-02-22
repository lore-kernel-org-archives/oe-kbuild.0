Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450B62F3F
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Feb 2023 15:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677079642; x=1708615642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WLNw0YyxxsvSF1pSsyxpZLf8Rnq3BejAHspd4S0tsm0=;
  b=OSAwAfbPl2MtgjgjuEJyDp9h3fxIvHDSvtsTTQAnl+9qZC+VPWPinxMd
   63E/Sr6iwpa1zjts0lmVU7bX5LZ9vHVuORW9fSX7JQB6i+eIYqh+EGH7v
   98ECeX3pVMmzt8EQhhWwEll3K6th44idXBS3ysbJ15gK86NObNzvMKF4s
   2Z0ZQUMKX33KPaoAoKXWGfnW+GsyuEBqVSJ1/yKMyyqpAoLd9lL2CtWz7
   AMP9H6AzVTCARh5TCgwF+WOxoB+vpyCYt6JdvyF4BjJeKG7wXpwz/HcpI
   aIu0SRguGZYKkjCwVPB7lBjCx+u4hFDxZWN4SCLX95jLOS5YnVNFBsk3m
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="312578198"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="312578198"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 07:27:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="1001033901"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="1001033901"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 22 Feb 2023 07:27:20 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUr1c-0000Up-04;
	Wed, 22 Feb 2023 15:27:20 +0000
Date: Wed, 22 Feb 2023 23:26:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iommu/iommufd/device.c:192:29: warning: Parameter 'group'
 can be declared as pointer to const [constParameter]
Message-ID: <202302222303.ENqQr5eq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/iommu/iommufd/device.c:192:29: warning: Parameter 'group' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jason Gunthorpe <jgg@nvidia.com>
CC: Kevin Tian <kevin.tian@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5b7c4cabbb65f5c469464da6c5f614cbd7f730f2
commit: e8d57210035b6377d424ba964961892d01127cf6 iommufd: Add kAPI toward external drivers for physical devices
date:   3 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 3 months ago
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout e8d57210035b6377d424ba964961892d01127cf6
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302222303.ENqQr5eq-lkp@intel.com/


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/iommu/iommufd/device.c:192:29: warning: Parameter 'group' can be declared as pointer to const [constParameter]
           struct iommu_group *group)
                               ^
>> drivers/iommu/iommufd/device.c:287:14: warning: Uninitialized variable: hwpt->auto_domain [uninitvar]
     if (!hwpt->auto_domain)
                ^

vim +/group +192 drivers/iommu/iommufd/device.c

e8d57210035b63 Jason Gunthorpe 2022-11-29  190  
e8d57210035b63 Jason Gunthorpe 2022-11-29  191  static bool iommufd_hw_pagetable_has_group(struct iommufd_hw_pagetable *hwpt,
e8d57210035b63 Jason Gunthorpe 2022-11-29 @192  					   struct iommu_group *group)
e8d57210035b63 Jason Gunthorpe 2022-11-29  193  {
e8d57210035b63 Jason Gunthorpe 2022-11-29  194  	struct iommufd_device *cur_dev;
e8d57210035b63 Jason Gunthorpe 2022-11-29  195  
e8d57210035b63 Jason Gunthorpe 2022-11-29  196  	list_for_each_entry(cur_dev, &hwpt->devices, devices_item)
e8d57210035b63 Jason Gunthorpe 2022-11-29  197  		if (cur_dev->group == group)
e8d57210035b63 Jason Gunthorpe 2022-11-29  198  			return true;
e8d57210035b63 Jason Gunthorpe 2022-11-29  199  	return false;
e8d57210035b63 Jason Gunthorpe 2022-11-29  200  }
e8d57210035b63 Jason Gunthorpe 2022-11-29  201  
e8d57210035b63 Jason Gunthorpe 2022-11-29  202  static int iommufd_device_do_attach(struct iommufd_device *idev,
e8d57210035b63 Jason Gunthorpe 2022-11-29  203  				    struct iommufd_hw_pagetable *hwpt)
e8d57210035b63 Jason Gunthorpe 2022-11-29  204  {
e8d57210035b63 Jason Gunthorpe 2022-11-29  205  	phys_addr_t sw_msi_start = 0;
e8d57210035b63 Jason Gunthorpe 2022-11-29  206  	int rc;
e8d57210035b63 Jason Gunthorpe 2022-11-29  207  
e8d57210035b63 Jason Gunthorpe 2022-11-29  208  	mutex_lock(&hwpt->devices_lock);
e8d57210035b63 Jason Gunthorpe 2022-11-29  209  
e8d57210035b63 Jason Gunthorpe 2022-11-29  210  	/*
e8d57210035b63 Jason Gunthorpe 2022-11-29  211  	 * Try to upgrade the domain we have, it is an iommu driver bug to
e8d57210035b63 Jason Gunthorpe 2022-11-29  212  	 * report IOMMU_CAP_ENFORCE_CACHE_COHERENCY but fail
e8d57210035b63 Jason Gunthorpe 2022-11-29  213  	 * enforce_cache_coherency when there are no devices attached to the
e8d57210035b63 Jason Gunthorpe 2022-11-29  214  	 * domain.
e8d57210035b63 Jason Gunthorpe 2022-11-29  215  	 */
e8d57210035b63 Jason Gunthorpe 2022-11-29  216  	if (idev->enforce_cache_coherency && !hwpt->enforce_cache_coherency) {
e8d57210035b63 Jason Gunthorpe 2022-11-29  217  		if (hwpt->domain->ops->enforce_cache_coherency)
e8d57210035b63 Jason Gunthorpe 2022-11-29  218  			hwpt->enforce_cache_coherency =
e8d57210035b63 Jason Gunthorpe 2022-11-29  219  				hwpt->domain->ops->enforce_cache_coherency(
e8d57210035b63 Jason Gunthorpe 2022-11-29  220  					hwpt->domain);
e8d57210035b63 Jason Gunthorpe 2022-11-29  221  		if (!hwpt->enforce_cache_coherency) {
e8d57210035b63 Jason Gunthorpe 2022-11-29  222  			WARN_ON(list_empty(&hwpt->devices));
e8d57210035b63 Jason Gunthorpe 2022-11-29  223  			rc = -EINVAL;
e8d57210035b63 Jason Gunthorpe 2022-11-29  224  			goto out_unlock;
e8d57210035b63 Jason Gunthorpe 2022-11-29  225  		}
e8d57210035b63 Jason Gunthorpe 2022-11-29  226  	}
e8d57210035b63 Jason Gunthorpe 2022-11-29  227  
e8d57210035b63 Jason Gunthorpe 2022-11-29  228  	rc = iopt_table_enforce_group_resv_regions(&hwpt->ioas->iopt, idev->dev,
e8d57210035b63 Jason Gunthorpe 2022-11-29  229  						   idev->group, &sw_msi_start);
e8d57210035b63 Jason Gunthorpe 2022-11-29  230  	if (rc)
e8d57210035b63 Jason Gunthorpe 2022-11-29  231  		goto out_unlock;
e8d57210035b63 Jason Gunthorpe 2022-11-29  232  
e8d57210035b63 Jason Gunthorpe 2022-11-29  233  	rc = iommufd_device_setup_msi(idev, hwpt, sw_msi_start);
e8d57210035b63 Jason Gunthorpe 2022-11-29  234  	if (rc)
e8d57210035b63 Jason Gunthorpe 2022-11-29  235  		goto out_iova;
e8d57210035b63 Jason Gunthorpe 2022-11-29  236  
e8d57210035b63 Jason Gunthorpe 2022-11-29  237  	/*
e8d57210035b63 Jason Gunthorpe 2022-11-29  238  	 * FIXME: Hack around missing a device-centric iommu api, only attach to
e8d57210035b63 Jason Gunthorpe 2022-11-29  239  	 * the group once for the first device that is in the group.
e8d57210035b63 Jason Gunthorpe 2022-11-29  240  	 */
e8d57210035b63 Jason Gunthorpe 2022-11-29  241  	if (!iommufd_hw_pagetable_has_group(hwpt, idev->group)) {
e8d57210035b63 Jason Gunthorpe 2022-11-29  242  		rc = iommu_attach_group(hwpt->domain, idev->group);
e8d57210035b63 Jason Gunthorpe 2022-11-29  243  		if (rc)
e8d57210035b63 Jason Gunthorpe 2022-11-29  244  			goto out_iova;
e8d57210035b63 Jason Gunthorpe 2022-11-29  245  
e8d57210035b63 Jason Gunthorpe 2022-11-29  246  		if (list_empty(&hwpt->devices)) {
e8d57210035b63 Jason Gunthorpe 2022-11-29  247  			rc = iopt_table_add_domain(&hwpt->ioas->iopt,
e8d57210035b63 Jason Gunthorpe 2022-11-29  248  						   hwpt->domain);
e8d57210035b63 Jason Gunthorpe 2022-11-29  249  			if (rc)
e8d57210035b63 Jason Gunthorpe 2022-11-29  250  				goto out_detach;
e8d57210035b63 Jason Gunthorpe 2022-11-29  251  		}
e8d57210035b63 Jason Gunthorpe 2022-11-29  252  	}
e8d57210035b63 Jason Gunthorpe 2022-11-29  253  
e8d57210035b63 Jason Gunthorpe 2022-11-29  254  	idev->hwpt = hwpt;
e8d57210035b63 Jason Gunthorpe 2022-11-29  255  	refcount_inc(&hwpt->obj.users);
e8d57210035b63 Jason Gunthorpe 2022-11-29  256  	list_add(&idev->devices_item, &hwpt->devices);
e8d57210035b63 Jason Gunthorpe 2022-11-29  257  	mutex_unlock(&hwpt->devices_lock);
e8d57210035b63 Jason Gunthorpe 2022-11-29  258  	return 0;
e8d57210035b63 Jason Gunthorpe 2022-11-29  259  
e8d57210035b63 Jason Gunthorpe 2022-11-29  260  out_detach:
e8d57210035b63 Jason Gunthorpe 2022-11-29  261  	iommu_detach_group(hwpt->domain, idev->group);
e8d57210035b63 Jason Gunthorpe 2022-11-29  262  out_iova:
e8d57210035b63 Jason Gunthorpe 2022-11-29  263  	iopt_remove_reserved_iova(&hwpt->ioas->iopt, idev->dev);
e8d57210035b63 Jason Gunthorpe 2022-11-29  264  out_unlock:
e8d57210035b63 Jason Gunthorpe 2022-11-29  265  	mutex_unlock(&hwpt->devices_lock);
e8d57210035b63 Jason Gunthorpe 2022-11-29  266  	return rc;
e8d57210035b63 Jason Gunthorpe 2022-11-29  267  }
e8d57210035b63 Jason Gunthorpe 2022-11-29  268  
e8d57210035b63 Jason Gunthorpe 2022-11-29  269  /*
e8d57210035b63 Jason Gunthorpe 2022-11-29  270   * When automatically managing the domains we search for a compatible domain in
e8d57210035b63 Jason Gunthorpe 2022-11-29  271   * the iopt and if one is found use it, otherwise create a new domain.
e8d57210035b63 Jason Gunthorpe 2022-11-29  272   * Automatic domain selection will never pick a manually created domain.
e8d57210035b63 Jason Gunthorpe 2022-11-29  273   */
e8d57210035b63 Jason Gunthorpe 2022-11-29  274  static int iommufd_device_auto_get_domain(struct iommufd_device *idev,
e8d57210035b63 Jason Gunthorpe 2022-11-29  275  					  struct iommufd_ioas *ioas)
e8d57210035b63 Jason Gunthorpe 2022-11-29  276  {
e8d57210035b63 Jason Gunthorpe 2022-11-29  277  	struct iommufd_hw_pagetable *hwpt;
e8d57210035b63 Jason Gunthorpe 2022-11-29  278  	int rc;
e8d57210035b63 Jason Gunthorpe 2022-11-29  279  
e8d57210035b63 Jason Gunthorpe 2022-11-29  280  	/*
e8d57210035b63 Jason Gunthorpe 2022-11-29  281  	 * There is no differentiation when domains are allocated, so any domain
e8d57210035b63 Jason Gunthorpe 2022-11-29  282  	 * that is willing to attach to the device is interchangeable with any
e8d57210035b63 Jason Gunthorpe 2022-11-29  283  	 * other.
e8d57210035b63 Jason Gunthorpe 2022-11-29  284  	 */
e8d57210035b63 Jason Gunthorpe 2022-11-29  285  	mutex_lock(&ioas->mutex);
e8d57210035b63 Jason Gunthorpe 2022-11-29  286  	list_for_each_entry(hwpt, &ioas->hwpt_list, hwpt_item) {
e8d57210035b63 Jason Gunthorpe 2022-11-29 @287  		if (!hwpt->auto_domain)
e8d57210035b63 Jason Gunthorpe 2022-11-29  288  			continue;
e8d57210035b63 Jason Gunthorpe 2022-11-29  289  
e8d57210035b63 Jason Gunthorpe 2022-11-29  290  		rc = iommufd_device_do_attach(idev, hwpt);
e8d57210035b63 Jason Gunthorpe 2022-11-29  291  
e8d57210035b63 Jason Gunthorpe 2022-11-29  292  		/*
e8d57210035b63 Jason Gunthorpe 2022-11-29  293  		 * -EINVAL means the domain is incompatible with the device.
e8d57210035b63 Jason Gunthorpe 2022-11-29  294  		 * Other error codes should propagate to userspace as failure.
e8d57210035b63 Jason Gunthorpe 2022-11-29  295  		 * Success means the domain is attached.
e8d57210035b63 Jason Gunthorpe 2022-11-29  296  		 */
e8d57210035b63 Jason Gunthorpe 2022-11-29  297  		if (rc == -EINVAL)
e8d57210035b63 Jason Gunthorpe 2022-11-29  298  			continue;
e8d57210035b63 Jason Gunthorpe 2022-11-29  299  		goto out_unlock;
e8d57210035b63 Jason Gunthorpe 2022-11-29  300  	}
e8d57210035b63 Jason Gunthorpe 2022-11-29  301  
e8d57210035b63 Jason Gunthorpe 2022-11-29  302  	hwpt = iommufd_hw_pagetable_alloc(idev->ictx, ioas, idev->dev);
e8d57210035b63 Jason Gunthorpe 2022-11-29  303  	if (IS_ERR(hwpt)) {
e8d57210035b63 Jason Gunthorpe 2022-11-29  304  		rc = PTR_ERR(hwpt);
e8d57210035b63 Jason Gunthorpe 2022-11-29  305  		goto out_unlock;
e8d57210035b63 Jason Gunthorpe 2022-11-29  306  	}
e8d57210035b63 Jason Gunthorpe 2022-11-29  307  	hwpt->auto_domain = true;
e8d57210035b63 Jason Gunthorpe 2022-11-29  308  
e8d57210035b63 Jason Gunthorpe 2022-11-29  309  	rc = iommufd_device_do_attach(idev, hwpt);
e8d57210035b63 Jason Gunthorpe 2022-11-29  310  	if (rc)
e8d57210035b63 Jason Gunthorpe 2022-11-29  311  		goto out_abort;
e8d57210035b63 Jason Gunthorpe 2022-11-29  312  	list_add_tail(&hwpt->hwpt_item, &ioas->hwpt_list);
e8d57210035b63 Jason Gunthorpe 2022-11-29  313  
e8d57210035b63 Jason Gunthorpe 2022-11-29  314  	mutex_unlock(&ioas->mutex);
e8d57210035b63 Jason Gunthorpe 2022-11-29  315  	iommufd_object_finalize(idev->ictx, &hwpt->obj);
e8d57210035b63 Jason Gunthorpe 2022-11-29  316  	return 0;
e8d57210035b63 Jason Gunthorpe 2022-11-29  317  
e8d57210035b63 Jason Gunthorpe 2022-11-29  318  out_abort:
e8d57210035b63 Jason Gunthorpe 2022-11-29  319  	iommufd_object_abort_and_destroy(idev->ictx, &hwpt->obj);
e8d57210035b63 Jason Gunthorpe 2022-11-29  320  out_unlock:
e8d57210035b63 Jason Gunthorpe 2022-11-29  321  	mutex_unlock(&ioas->mutex);
e8d57210035b63 Jason Gunthorpe 2022-11-29  322  	return rc;
e8d57210035b63 Jason Gunthorpe 2022-11-29  323  }
e8d57210035b63 Jason Gunthorpe 2022-11-29  324  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
