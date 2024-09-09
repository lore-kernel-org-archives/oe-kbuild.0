Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BB21B2507
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Sep 2024 08:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725872336; cv=none; b=bLKZ+DZ47W1hXQcz66UV/JdRjQ9Q+A/sr8ZEEl6F2B3+RcHrm1sho41jx/64T0ep7yhoyPOFVproolRWkg+ax0CZPOm/gaAPp8Slqddi5TXTJybG8jowxtSPgK6XNW/neqsp4MVf3Cmo9T+2RsyFUed17lqYsLqo1UnbDzv5NFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725872336; c=relaxed/simple;
	bh=GuDRBTP9cWrXBMI/WKS/zwgWpMyC+wZOuMQjcp/yd50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZqHMMrI1NGFn4Svqqs+5ZI8n5bRXAeOisumL++3LMAnBNkAkytdmzWsHTT7rzk9mVWJ7B0kfZzBFOlpQW92W1PlF2lxhpI7zTTyZjo9knw14MMz/+ATr6Pq7donKHxr4mIYVv88WDVPcMASfKBCsChgDLGkfUWYfcfUZNHL4YB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kSKRX8Uq; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kSKRX8Uq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725872334; x=1757408334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GuDRBTP9cWrXBMI/WKS/zwgWpMyC+wZOuMQjcp/yd50=;
  b=kSKRX8UqaDa0bOjoObWXmT5MV+pma4yqya/7mSXwsLIMUDyRQe8p1uCa
   IAhHbc0fIXb6xPCtoKHPqKTu4dj5whL9Sv7u9H3T2AmUFRuI5B7RIpqzo
   1jRF7/eQO4ZL2G3uKGxjPqyTHnJr3S9PFkrkChohFbk7+mVD0zwnzlqbg
   ihxh/ZOcpzBDgENadhk38oBGpMtspR8r/selRmdjOHzUcR8T2st7yIC/q
   TQMr6zeNpyuB7P67ISt6/Q6H1MieOaCxEzEfbScxp9phG3VJ8yVOeyzoI
   cbbv0G3on1V7/woxqojA/xoXwN274jIOX55Whdf9SNdp2yddNQ73jTGNz
   w==;
X-CSE-ConnectionGUID: ZpP8QPlQTeij7fOhkLhFiw==
X-CSE-MsgGUID: tIfzZDv7TYW78/V6CvmTgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="35132339"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="35132339"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 01:58:54 -0700
X-CSE-ConnectionGUID: l08bu6LwSymfl0pwk1nchw==
X-CSE-MsgGUID: JX9j0uQ0QL+p1R1XKPhFtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="66910814"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Sep 2024 01:58:52 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snaEU-000EXO-1h;
	Mon, 09 Sep 2024 08:58:50 +0000
Date: Mon, 9 Sep 2024 16:58:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20240905 24/29]
 drivers/iommu/iommufd/pasid.c:37 iommufd_device_pasid_do_attach() warn:
 passing zero to 'ERR_PTR'
Message-ID: <202409091622.yfNTNCSQ-lkp@intel.com>
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

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-20240905
head:   4291b5d19a8845a8dbe31516094fd1e01ac5ef5e
commit: eca216f94e05faab6b4e6d67ec3d95f2c6024ad3 [24/29] iommufd: Support attach/replace hwpt per pasid
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20240909 (https://download.01.org/0day-ci/archive/20240909/202409091622.yfNTNCSQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409091622.yfNTNCSQ-lkp@intel.com/

smatch warnings:
drivers/iommu/iommufd/pasid.c:37 iommufd_device_pasid_do_attach() warn: passing zero to 'ERR_PTR'
drivers/iommu/iommufd/pasid.c:78 iommufd_device_pasid_do_replace() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +37 drivers/iommu/iommufd/pasid.c

eca216f94e05fa Yi Liu 2024-03-18   9  
eca216f94e05fa Yi Liu 2024-03-18  10  struct iommufd_hw_pagetable *
eca216f94e05fa Yi Liu 2024-03-18  11  iommufd_device_pasid_do_attach(struct iommufd_device *idev, ioasid_t pasid,
eca216f94e05fa Yi Liu 2024-03-18  12  			       struct iommufd_hw_pagetable *hwpt)
eca216f94e05fa Yi Liu 2024-03-18  13  {
eca216f94e05fa Yi Liu 2024-03-18  14  	void *curr;
eca216f94e05fa Yi Liu 2024-03-18  15  	int rc;
eca216f94e05fa Yi Liu 2024-03-18  16  
eca216f94e05fa Yi Liu 2024-03-18  17  	refcount_inc(&hwpt->obj.users);
eca216f94e05fa Yi Liu 2024-03-18  18  	curr = xa_cmpxchg(&idev->pasid_hwpts, pasid, NULL, hwpt, GFP_KERNEL);
eca216f94e05fa Yi Liu 2024-03-18  19  	if (curr) {
eca216f94e05fa Yi Liu 2024-03-18  20  		if (curr == hwpt)
eca216f94e05fa Yi Liu 2024-03-18  21  			rc = 0;
eca216f94e05fa Yi Liu 2024-03-18  22  		else
eca216f94e05fa Yi Liu 2024-03-18  23  			rc = xa_err(curr) ? : -EBUSY;
eca216f94e05fa Yi Liu 2024-03-18  24  		goto err_put_hwpt;
eca216f94e05fa Yi Liu 2024-03-18  25  	}
eca216f94e05fa Yi Liu 2024-03-18  26  
eca216f94e05fa Yi Liu 2024-03-18  27  	rc = iommufd_hwpt_attach_device(hwpt, idev, pasid);
eca216f94e05fa Yi Liu 2024-03-18  28  	if (rc) {
eca216f94e05fa Yi Liu 2024-03-18  29  		xa_erase(&idev->pasid_hwpts, pasid);
eca216f94e05fa Yi Liu 2024-03-18  30  		goto err_put_hwpt;
eca216f94e05fa Yi Liu 2024-03-18  31  	}
eca216f94e05fa Yi Liu 2024-03-18  32  
eca216f94e05fa Yi Liu 2024-03-18  33  	return NULL;
eca216f94e05fa Yi Liu 2024-03-18  34  
eca216f94e05fa Yi Liu 2024-03-18  35  err_put_hwpt:
eca216f94e05fa Yi Liu 2024-03-18  36  	refcount_dec(&hwpt->obj.users);
eca216f94e05fa Yi Liu 2024-03-18 @37  	return ERR_PTR(rc);
eca216f94e05fa Yi Liu 2024-03-18  38  }
eca216f94e05fa Yi Liu 2024-03-18  39  
eca216f94e05fa Yi Liu 2024-03-18  40  struct iommufd_hw_pagetable *
eca216f94e05fa Yi Liu 2024-03-18  41  iommufd_device_pasid_do_replace(struct iommufd_device *idev, ioasid_t pasid,
eca216f94e05fa Yi Liu 2024-03-18  42  				struct iommufd_hw_pagetable *hwpt)
eca216f94e05fa Yi Liu 2024-03-18  43  {
eca216f94e05fa Yi Liu 2024-03-18  44  	void *curr;
eca216f94e05fa Yi Liu 2024-03-18  45  	int rc;
eca216f94e05fa Yi Liu 2024-03-18  46  
eca216f94e05fa Yi Liu 2024-03-18  47  	refcount_inc(&hwpt->obj.users);
eca216f94e05fa Yi Liu 2024-03-18  48  	curr = xa_store(&idev->pasid_hwpts, pasid, hwpt, GFP_KERNEL);
eca216f94e05fa Yi Liu 2024-03-18  49  	rc = xa_err(curr);
eca216f94e05fa Yi Liu 2024-03-18  50  	if (rc)
eca216f94e05fa Yi Liu 2024-03-18  51  		goto out_put_hwpt;
eca216f94e05fa Yi Liu 2024-03-18  52  
eca216f94e05fa Yi Liu 2024-03-18  53  	if (!curr) {
eca216f94e05fa Yi Liu 2024-03-18  54  		xa_erase(&idev->pasid_hwpts, pasid);
eca216f94e05fa Yi Liu 2024-03-18  55  		rc = -EINVAL;
eca216f94e05fa Yi Liu 2024-03-18  56  		goto out_put_hwpt;
eca216f94e05fa Yi Liu 2024-03-18  57  	}
eca216f94e05fa Yi Liu 2024-03-18  58  
eca216f94e05fa Yi Liu 2024-03-18  59  	if (curr == hwpt)
eca216f94e05fa Yi Liu 2024-03-18  60  		goto out_put_hwpt;
eca216f94e05fa Yi Liu 2024-03-18  61  
eca216f94e05fa Yi Liu 2024-03-18  62  	/*
eca216f94e05fa Yi Liu 2024-03-18  63  	 * After replacement, the reference on the old hwpt is retained
eca216f94e05fa Yi Liu 2024-03-18  64  	 * in this thread as caller would free it.
eca216f94e05fa Yi Liu 2024-03-18  65  	 */
eca216f94e05fa Yi Liu 2024-03-18  66  	rc = iommufd_hwpt_replace_device(idev, pasid, hwpt, curr);
eca216f94e05fa Yi Liu 2024-03-18  67  	if (rc) {
eca216f94e05fa Yi Liu 2024-03-18  68  		WARN_ON(xa_err(xa_store(&idev->pasid_hwpts, pasid,
eca216f94e05fa Yi Liu 2024-03-18  69  					curr, GFP_KERNEL)));
eca216f94e05fa Yi Liu 2024-03-18  70  		goto out_put_hwpt;
eca216f94e05fa Yi Liu 2024-03-18  71  	}
eca216f94e05fa Yi Liu 2024-03-18  72  
eca216f94e05fa Yi Liu 2024-03-18  73  	/* Caller must destroy old_hwpt */
eca216f94e05fa Yi Liu 2024-03-18  74  	return curr;
eca216f94e05fa Yi Liu 2024-03-18  75  
eca216f94e05fa Yi Liu 2024-03-18  76  out_put_hwpt:
eca216f94e05fa Yi Liu 2024-03-18  77  	refcount_dec(&hwpt->obj.users);
eca216f94e05fa Yi Liu 2024-03-18 @78  	return ERR_PTR(rc);
eca216f94e05fa Yi Liu 2024-03-18  79  }
eca216f94e05fa Yi Liu 2024-03-18  80  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
