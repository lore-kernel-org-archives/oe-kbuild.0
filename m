Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81489201100
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Oct 2024 17:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729273379; cv=none; b=Lr7vqLj+HP6tb705cCCRFe/CXawy25B2MgW9L+/q8+QAXd263r5n9BGbbNfLqA7R0QbscjrcNnUFpX7RI4sjC9OZrurgVnHCvGxUiclHv4UysFwoCaYs+zny1dvXaukAIWWvhYtfRHjEh3xI+ScCvc2G5EKtaL6ej5wOMrMYtLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729273379; c=relaxed/simple;
	bh=Vw+Q2COJnpPsvDaj2bWNt+s4sdBz1mC9FgGvISIhY5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GDPN/A/60PQ0GCebYWIG6zRP/Pfxahk6DReaNaYwOqJTgqXpG5oUldxIZoW8BjKf/+PAwkWslZQMG581KoXj67PzLpXLZ0FBdV7gbUD/HZ9USNVzCiPlxaqBIbuvxPTr/YWyb3TZ/SnCrBKFgYROS01AocdruGWKdRezx9Lslhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JziTglOW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JziTglOW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729273378; x=1760809378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vw+Q2COJnpPsvDaj2bWNt+s4sdBz1mC9FgGvISIhY5U=;
  b=JziTglOW8qhaSeR4Yx649LpQhRKfXit/WeFIh8g7R4LHdMqhVNGTjjbA
   sez5oe+aQ9zZIp7HETO3PWpPZeW/n2bmPxLkgHj0OZcRIRugEl2uBRZe8
   lh0RWLfTMVKLvAH/3wWRZJ/54ItLodycJ/Us5/pVGTBf02G91OV+8GZu9
   VLqxOmDKzCtd2Laa/1/ObQfO026r6uNMjS7tW4HIjc/HmBUVbV07b5lE2
   4jhYmOTcM44waQyBQwfPKGwgHzlL++8bB/qw2hX/VMAgunJsGD/KhvETE
   JPRh+VmHjfP7b+PAsHBVsfglLOZvICbkHDKc6V2xkhfUV7cUOCU5MsThy
   w==;
X-CSE-ConnectionGUID: QEg8ZOspTv2cB76LEWh22Q==
X-CSE-MsgGUID: U4U6nVeWRXSbWG1IQ87KXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28905786"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="28905786"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 10:42:57 -0700
X-CSE-ConnectionGUID: IR/KO6PqQs+Mzvt8aRiozQ==
X-CSE-MsgGUID: 7siP2EVjRZWO1odZvoDn/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="78837622"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Oct 2024 10:42:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1r01-000O8j-22;
	Fri, 18 Oct 2024 17:42:53 +0000
Date: Sat, 19 Oct 2024 01:42:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20241017 20/32]
 drivers/iommu/iommufd/pasid.c:37 iommufd_device_pasid_do_attach() warn:
 passing zero to 'ERR_PTR'
Message-ID: <202410190159.6ti6SP4k-lkp@intel.com>
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

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-20241017
head:   b3c07d7850f4cb1c69da62b60220b81ac3d59996
commit: 470dc7b8b42d7d87fd7a7c8710c28a6c35019e53 [20/32] iommufd: Support pasid attach/replace
:::::: branch date: 29 hours ago
:::::: commit date: 32 hours ago
config: i386-randconfig-141-20241018 (https://download.01.org/0day-ci/archive/20241019/202410190159.6ti6SP4k-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410190159.6ti6SP4k-lkp@intel.com/

smatch warnings:
drivers/iommu/iommufd/pasid.c:37 iommufd_device_pasid_do_attach() warn: passing zero to 'ERR_PTR'
drivers/iommu/iommufd/pasid.c:78 iommufd_device_pasid_do_replace() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +37 drivers/iommu/iommufd/pasid.c

470dc7b8b42d7d Yi Liu 2024-03-18   9  
470dc7b8b42d7d Yi Liu 2024-03-18  10  struct iommufd_hw_pagetable *
470dc7b8b42d7d Yi Liu 2024-03-18  11  iommufd_device_pasid_do_attach(struct iommufd_device *idev, ioasid_t pasid,
470dc7b8b42d7d Yi Liu 2024-03-18  12  			       struct iommufd_hw_pagetable *hwpt)
470dc7b8b42d7d Yi Liu 2024-03-18  13  {
470dc7b8b42d7d Yi Liu 2024-03-18  14  	void *curr;
470dc7b8b42d7d Yi Liu 2024-03-18  15  	int rc;
470dc7b8b42d7d Yi Liu 2024-03-18  16  
470dc7b8b42d7d Yi Liu 2024-03-18  17  	refcount_inc(&hwpt->obj.users);
470dc7b8b42d7d Yi Liu 2024-03-18  18  	curr = xa_cmpxchg(&idev->pasid_hwpts, pasid, NULL, hwpt, GFP_KERNEL);
470dc7b8b42d7d Yi Liu 2024-03-18  19  	if (curr) {
470dc7b8b42d7d Yi Liu 2024-03-18  20  		if (curr == hwpt)
470dc7b8b42d7d Yi Liu 2024-03-18  21  			rc = 0;
470dc7b8b42d7d Yi Liu 2024-03-18  22  		else
470dc7b8b42d7d Yi Liu 2024-03-18  23  			rc = xa_err(curr) ? : -EBUSY;
470dc7b8b42d7d Yi Liu 2024-03-18  24  		goto err_put_hwpt;
470dc7b8b42d7d Yi Liu 2024-03-18  25  	}
470dc7b8b42d7d Yi Liu 2024-03-18  26  
470dc7b8b42d7d Yi Liu 2024-03-18  27  	rc = iommufd_hwpt_attach_device(hwpt, idev, pasid);
470dc7b8b42d7d Yi Liu 2024-03-18  28  	if (rc) {
470dc7b8b42d7d Yi Liu 2024-03-18  29  		xa_erase(&idev->pasid_hwpts, pasid);
470dc7b8b42d7d Yi Liu 2024-03-18  30  		goto err_put_hwpt;
470dc7b8b42d7d Yi Liu 2024-03-18  31  	}
470dc7b8b42d7d Yi Liu 2024-03-18  32  
470dc7b8b42d7d Yi Liu 2024-03-18  33  	return NULL;
470dc7b8b42d7d Yi Liu 2024-03-18  34  
470dc7b8b42d7d Yi Liu 2024-03-18  35  err_put_hwpt:
470dc7b8b42d7d Yi Liu 2024-03-18  36  	refcount_dec(&hwpt->obj.users);
470dc7b8b42d7d Yi Liu 2024-03-18 @37  	return ERR_PTR(rc);
470dc7b8b42d7d Yi Liu 2024-03-18  38  }
470dc7b8b42d7d Yi Liu 2024-03-18  39  
470dc7b8b42d7d Yi Liu 2024-03-18  40  struct iommufd_hw_pagetable *
470dc7b8b42d7d Yi Liu 2024-03-18  41  iommufd_device_pasid_do_replace(struct iommufd_device *idev, ioasid_t pasid,
470dc7b8b42d7d Yi Liu 2024-03-18  42  				struct iommufd_hw_pagetable *hwpt)
470dc7b8b42d7d Yi Liu 2024-03-18  43  {
470dc7b8b42d7d Yi Liu 2024-03-18  44  	void *curr;
470dc7b8b42d7d Yi Liu 2024-03-18  45  	int rc;
470dc7b8b42d7d Yi Liu 2024-03-18  46  
470dc7b8b42d7d Yi Liu 2024-03-18  47  	refcount_inc(&hwpt->obj.users);
470dc7b8b42d7d Yi Liu 2024-03-18  48  	curr = xa_store(&idev->pasid_hwpts, pasid, hwpt, GFP_KERNEL);
470dc7b8b42d7d Yi Liu 2024-03-18  49  	rc = xa_err(curr);
470dc7b8b42d7d Yi Liu 2024-03-18  50  	if (rc)
470dc7b8b42d7d Yi Liu 2024-03-18  51  		goto out_put_hwpt;
470dc7b8b42d7d Yi Liu 2024-03-18  52  
470dc7b8b42d7d Yi Liu 2024-03-18  53  	if (!curr) {
470dc7b8b42d7d Yi Liu 2024-03-18  54  		xa_erase(&idev->pasid_hwpts, pasid);
470dc7b8b42d7d Yi Liu 2024-03-18  55  		rc = -EINVAL;
470dc7b8b42d7d Yi Liu 2024-03-18  56  		goto out_put_hwpt;
470dc7b8b42d7d Yi Liu 2024-03-18  57  	}
470dc7b8b42d7d Yi Liu 2024-03-18  58  
470dc7b8b42d7d Yi Liu 2024-03-18  59  	if (curr == hwpt)
470dc7b8b42d7d Yi Liu 2024-03-18  60  		goto out_put_hwpt;
470dc7b8b42d7d Yi Liu 2024-03-18  61  
470dc7b8b42d7d Yi Liu 2024-03-18  62  	/*
470dc7b8b42d7d Yi Liu 2024-03-18  63  	 * After replacement, the reference on the old hwpt is retained
470dc7b8b42d7d Yi Liu 2024-03-18  64  	 * in this thread as caller would free it.
470dc7b8b42d7d Yi Liu 2024-03-18  65  	 */
470dc7b8b42d7d Yi Liu 2024-03-18  66  	rc = iommufd_hwpt_replace_device(idev, pasid, hwpt, curr);
470dc7b8b42d7d Yi Liu 2024-03-18  67  	if (rc) {
470dc7b8b42d7d Yi Liu 2024-03-18  68  		WARN_ON(xa_err(xa_store(&idev->pasid_hwpts, pasid,
470dc7b8b42d7d Yi Liu 2024-03-18  69  					curr, GFP_KERNEL)));
470dc7b8b42d7d Yi Liu 2024-03-18  70  		goto out_put_hwpt;
470dc7b8b42d7d Yi Liu 2024-03-18  71  	}
470dc7b8b42d7d Yi Liu 2024-03-18  72  
470dc7b8b42d7d Yi Liu 2024-03-18  73  	/* Caller must destroy old_hwpt */
470dc7b8b42d7d Yi Liu 2024-03-18  74  	return curr;
470dc7b8b42d7d Yi Liu 2024-03-18  75  
470dc7b8b42d7d Yi Liu 2024-03-18  76  out_put_hwpt:
470dc7b8b42d7d Yi Liu 2024-03-18  77  	refcount_dec(&hwpt->obj.users);
470dc7b8b42d7d Yi Liu 2024-03-18 @78  	return ERR_PTR(rc);
470dc7b8b42d7d Yi Liu 2024-03-18  79  }
470dc7b8b42d7d Yi Liu 2024-03-18  80  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
