Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417B814EC59
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Nov 2024 04:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730693862; cv=none; b=XCq0jQhwppquYFnw1un3WbuVMR/MW+MbfBx8zJb4oXBCFfSYBE8jDdVfT8An7GP98/dfv+oN0ZxLOzuPZ7TPSGHAMoQX6WveaXCoDKE6fYeDUzuaOJyPm1pmPxAlqAkQ9Vo3yaITwlOJR4cP9egWhkJAhViCo3HQlAMYjrrq2Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730693862; c=relaxed/simple;
	bh=e973arVooNPfBAQbTiOGr2ul0j5GoH2A7k5quydLMfM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TyqaIzTnjY65wNbClgN5F33rzEbVztvox3iFfAG1FCzQcTdjJHDy7kPQtiZlQw6vsYbb8KV0LxJBr5OleOsHF4wuUfCMPoewGqmz0Yi9yHUsyMF+1n/akf7pgGgZnUBDO/6rGNQVxucGdKWm9iaye6oUA2r27GvoLaThdfmbkIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b3LwApZA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b3LwApZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730693860; x=1762229860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e973arVooNPfBAQbTiOGr2ul0j5GoH2A7k5quydLMfM=;
  b=b3LwApZARJxh4hJG/MSx9mSTfEUOxZKLfViUtv++DmCon1/cGscc8CfR
   /q1OqtORg6/CH/IjqwNoaQWiMmBzTN/P6i/V/0bo7hYA1bTa4Ad9M3L1l
   OyKu+wkd79ajAZXBqLlo0lbD0y8hGtcKTFTlaIFK6/5mEZkAcfqcw6pwq
   d3/A6Mvt9zoTSxCrYp+bPGLq+GXbnQJhLY9Y0zVmFv6zfGEz+FbUZ95QF
   k6Fbzhhx+YX8yQwcG+bndYo8kZ8rXLYxYt46VpZBs8BZcge2X221Zvh2+
   yaNa9iTGaeO2iRS+ervJ+idD9pMLcwFjsYRwm4vOKDEUZBj+bKiHOdC43
   A==;
X-CSE-ConnectionGUID: /TB71LONT4yeGXeHtqOuGQ==
X-CSE-MsgGUID: 9UZWZI0TScyB12Cp890URA==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="30481270"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="30481270"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 20:17:39 -0800
X-CSE-ConnectionGUID: qsTJtWTwQDugpGkYiWePWg==
X-CSE-MsgGUID: wY0Y5DB1RsWF/oZEXxGsnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83981650"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Nov 2024 20:17:39 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7oX2-000kS1-0B;
	Mon, 04 Nov 2024 04:17:36 +0000
Date: Mon, 4 Nov 2024 12:16:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20241103 41/56]
 drivers/iommu/iommufd/pasid.c:37 iommufd_device_pasid_do_attach() warn:
 passing zero to 'ERR_PTR'
Message-ID: <202411041248.Q3sU7ydU-lkp@intel.com>
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

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-20241103
head:   9f6b94753a6072dee5a3f688e5ef539696369803
commit: 4313c4f0775f28c67de24b51be6fbeee374deed9 [41/56] iommufd: Support pasid attach/replace
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: x86_64-randconfig-161-20241104 (https://download.01.org/0day-ci/archive/20241104/202411041248.Q3sU7ydU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411041248.Q3sU7ydU-lkp@intel.com/

smatch warnings:
drivers/iommu/iommufd/pasid.c:37 iommufd_device_pasid_do_attach() warn: passing zero to 'ERR_PTR'
drivers/iommu/iommufd/pasid.c:78 iommufd_device_pasid_do_replace() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +37 drivers/iommu/iommufd/pasid.c

4313c4f0775f28 Yi Liu 2024-03-18   9  
4313c4f0775f28 Yi Liu 2024-03-18  10  struct iommufd_hw_pagetable *
4313c4f0775f28 Yi Liu 2024-03-18  11  iommufd_device_pasid_do_attach(struct iommufd_device *idev, ioasid_t pasid,
4313c4f0775f28 Yi Liu 2024-03-18  12  			       struct iommufd_hw_pagetable *hwpt)
4313c4f0775f28 Yi Liu 2024-03-18  13  {
4313c4f0775f28 Yi Liu 2024-03-18  14  	void *curr;
4313c4f0775f28 Yi Liu 2024-03-18  15  	int rc;
4313c4f0775f28 Yi Liu 2024-03-18  16  
4313c4f0775f28 Yi Liu 2024-03-18  17  	refcount_inc(&hwpt->obj.users);
4313c4f0775f28 Yi Liu 2024-03-18  18  	curr = xa_cmpxchg(&idev->pasid_hwpts, pasid, NULL, hwpt, GFP_KERNEL);
4313c4f0775f28 Yi Liu 2024-03-18  19  	if (curr) {
4313c4f0775f28 Yi Liu 2024-03-18  20  		if (curr == hwpt)
4313c4f0775f28 Yi Liu 2024-03-18  21  			rc = 0;
4313c4f0775f28 Yi Liu 2024-03-18  22  		else
4313c4f0775f28 Yi Liu 2024-03-18  23  			rc = xa_err(curr) ? : -EBUSY;
4313c4f0775f28 Yi Liu 2024-03-18  24  		goto err_put_hwpt;
4313c4f0775f28 Yi Liu 2024-03-18  25  	}
4313c4f0775f28 Yi Liu 2024-03-18  26  
4313c4f0775f28 Yi Liu 2024-03-18  27  	rc = iommufd_hwpt_attach_device(hwpt, idev, pasid);
4313c4f0775f28 Yi Liu 2024-03-18  28  	if (rc) {
4313c4f0775f28 Yi Liu 2024-03-18  29  		xa_erase(&idev->pasid_hwpts, pasid);
4313c4f0775f28 Yi Liu 2024-03-18  30  		goto err_put_hwpt;
4313c4f0775f28 Yi Liu 2024-03-18  31  	}
4313c4f0775f28 Yi Liu 2024-03-18  32  
4313c4f0775f28 Yi Liu 2024-03-18  33  	return NULL;
4313c4f0775f28 Yi Liu 2024-03-18  34  
4313c4f0775f28 Yi Liu 2024-03-18  35  err_put_hwpt:
4313c4f0775f28 Yi Liu 2024-03-18  36  	refcount_dec(&hwpt->obj.users);
4313c4f0775f28 Yi Liu 2024-03-18 @37  	return ERR_PTR(rc);
4313c4f0775f28 Yi Liu 2024-03-18  38  }
4313c4f0775f28 Yi Liu 2024-03-18  39  
4313c4f0775f28 Yi Liu 2024-03-18  40  struct iommufd_hw_pagetable *
4313c4f0775f28 Yi Liu 2024-03-18  41  iommufd_device_pasid_do_replace(struct iommufd_device *idev, ioasid_t pasid,
4313c4f0775f28 Yi Liu 2024-03-18  42  				struct iommufd_hw_pagetable *hwpt)
4313c4f0775f28 Yi Liu 2024-03-18  43  {
4313c4f0775f28 Yi Liu 2024-03-18  44  	void *curr;
4313c4f0775f28 Yi Liu 2024-03-18  45  	int rc;
4313c4f0775f28 Yi Liu 2024-03-18  46  
4313c4f0775f28 Yi Liu 2024-03-18  47  	refcount_inc(&hwpt->obj.users);
4313c4f0775f28 Yi Liu 2024-03-18  48  	curr = xa_store(&idev->pasid_hwpts, pasid, hwpt, GFP_KERNEL);
4313c4f0775f28 Yi Liu 2024-03-18  49  	rc = xa_err(curr);
4313c4f0775f28 Yi Liu 2024-03-18  50  	if (rc)
4313c4f0775f28 Yi Liu 2024-03-18  51  		goto out_put_hwpt;
4313c4f0775f28 Yi Liu 2024-03-18  52  
4313c4f0775f28 Yi Liu 2024-03-18  53  	if (!curr) {
4313c4f0775f28 Yi Liu 2024-03-18  54  		xa_erase(&idev->pasid_hwpts, pasid);
4313c4f0775f28 Yi Liu 2024-03-18  55  		rc = -EINVAL;
4313c4f0775f28 Yi Liu 2024-03-18  56  		goto out_put_hwpt;
4313c4f0775f28 Yi Liu 2024-03-18  57  	}
4313c4f0775f28 Yi Liu 2024-03-18  58  
4313c4f0775f28 Yi Liu 2024-03-18  59  	if (curr == hwpt)
4313c4f0775f28 Yi Liu 2024-03-18  60  		goto out_put_hwpt;
4313c4f0775f28 Yi Liu 2024-03-18  61  
4313c4f0775f28 Yi Liu 2024-03-18  62  	/*
4313c4f0775f28 Yi Liu 2024-03-18  63  	 * After replacement, the reference on the old hwpt is retained
4313c4f0775f28 Yi Liu 2024-03-18  64  	 * in this thread as caller would free it.
4313c4f0775f28 Yi Liu 2024-03-18  65  	 */
4313c4f0775f28 Yi Liu 2024-03-18  66  	rc = iommufd_hwpt_replace_device(idev, pasid, hwpt, curr);
4313c4f0775f28 Yi Liu 2024-03-18  67  	if (rc) {
4313c4f0775f28 Yi Liu 2024-03-18  68  		WARN_ON(xa_err(xa_store(&idev->pasid_hwpts, pasid,
4313c4f0775f28 Yi Liu 2024-03-18  69  					curr, GFP_KERNEL)));
4313c4f0775f28 Yi Liu 2024-03-18  70  		goto out_put_hwpt;
4313c4f0775f28 Yi Liu 2024-03-18  71  	}
4313c4f0775f28 Yi Liu 2024-03-18  72  
4313c4f0775f28 Yi Liu 2024-03-18  73  	/* Caller must destroy old_hwpt */
4313c4f0775f28 Yi Liu 2024-03-18  74  	return curr;
4313c4f0775f28 Yi Liu 2024-03-18  75  
4313c4f0775f28 Yi Liu 2024-03-18  76  out_put_hwpt:
4313c4f0775f28 Yi Liu 2024-03-18  77  	refcount_dec(&hwpt->obj.users);
4313c4f0775f28 Yi Liu 2024-03-18 @78  	return ERR_PTR(rc);
4313c4f0775f28 Yi Liu 2024-03-18  79  }
4313c4f0775f28 Yi Liu 2024-03-18  80  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
