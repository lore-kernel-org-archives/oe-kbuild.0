Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB71D6D1C7
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Mar 2024 12:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711457933; cv=none; b=S1tS9SIWcftxZ6XTDQzQtiyrVTUryRkkCv7qmRKREeP8Esv6meb9W45S9nrCxdgrAj2souTPD608Z6Rzax26ttkQ1fZFhiISIDb8dqyygOAPiDFCeejNEu+moTXv0ta3VdlLAENsQFB/HXFWs93PYi2010gIvODu8XC0zCHcH38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711457933; c=relaxed/simple;
	bh=jK7t7K046W817hnZLbiWyri8X94SFBD+/q3l81jJ9TY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W1bHwRCpkLyaNEigZiF36txQ1sU235zWZJcetM9Fpf5YnkAKpR12qrRJ9VbnK9wx/vRaYxLcTmtIeB8AM083h+CTRAlVpPmTFgUTFvHOBbB1jGWKGOLV0IzNbvQH2d2gavNLPbTJsHmXE3rkIBLXhAxFkl7s5yy6WyVhzfUdD60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WxoE26eA; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WxoE26eA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711457930; x=1742993930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jK7t7K046W817hnZLbiWyri8X94SFBD+/q3l81jJ9TY=;
  b=WxoE26eAP9QmRjAtvGCWRbeO9GP+cW+24Yn3eoZ3ZqqkX0qFPSVqLT5Y
   AEccrTb3kxCtIDzD/wdhisTIcLB8TPE58CAR8zW4LmcGWjrGv/r/e5xg5
   hspW2QAMGiY/1qbgbmJ11ifl6Rr4czcthHg8kr4ztcSoUIFltUK3qvGAf
   0sawiUpWwuO1zFBM2y4tTEBWjAoGaKq3Ul8yyI7RGq4JsXXJxTZWJTU9h
   IIy99h5gusTpLzgIA4oBQr8xdJFh7KM+ylvE4vSDi/nc1lUqI762NmxFh
   cmIsmSULuHwXgQW2z20vw50veKMo2bzJKkLhVz9UZG3Hu+2s2oGMCYCD4
   w==;
X-CSE-ConnectionGUID: nBPIcgffQiydev8/ZBD0ow==
X-CSE-MsgGUID: Iyb0BTDLTue0S2BbB0R8Ww==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6717066"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="6717066"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 05:58:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="46972401"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Mar 2024 05:58:47 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rp6O4-00003O-22;
	Tue, 26 Mar 2024 12:58:44 +0000
Date: Tue, 26 Mar 2024 20:58:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20240325 14/26]
 drivers/iommu/iommufd/pasid.c:37 iommufd_device_pasid_do_attach() warn:
 passing zero to 'ERR_PTR'
Message-ID: <202403262020.otycu3fa-lkp@intel.com>
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

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-20240325
head:   7bb9cc1c3a745ec3330323eebdf73f9a9e87376e
commit: d14d15b07135ca14f5008f865b371fc7a1aef36d [14/26] iommufd: Support attach/replace hwpt per pasid
:::::: branch date: 24 hours ago
:::::: commit date: 27 hours ago
config: i386-randconfig-141-20240326 (https://download.01.org/0day-ci/archive/20240326/202403262020.otycu3fa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403262020.otycu3fa-lkp@intel.com/

smatch warnings:
drivers/iommu/iommufd/pasid.c:37 iommufd_device_pasid_do_attach() warn: passing zero to 'ERR_PTR'
drivers/iommu/iommufd/pasid.c:74 iommufd_device_pasid_do_replace() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +37 drivers/iommu/iommufd/pasid.c

d14d15b07135ca Yi Liu 2024-03-18   9  
d14d15b07135ca Yi Liu 2024-03-18  10  struct iommufd_hw_pagetable *
d14d15b07135ca Yi Liu 2024-03-18  11  iommufd_device_pasid_do_attach(struct iommufd_device *idev, u32 pasid,
d14d15b07135ca Yi Liu 2024-03-18  12  			       struct iommufd_hw_pagetable *hwpt)
d14d15b07135ca Yi Liu 2024-03-18  13  {
d14d15b07135ca Yi Liu 2024-03-18  14  	void *curr;
d14d15b07135ca Yi Liu 2024-03-18  15  	int rc;
d14d15b07135ca Yi Liu 2024-03-18  16  
d14d15b07135ca Yi Liu 2024-03-18  17  	refcount_inc(&hwpt->obj.users);
d14d15b07135ca Yi Liu 2024-03-18  18  	curr = xa_cmpxchg(&idev->pasid_hwpts, pasid, NULL, hwpt, GFP_KERNEL);
d14d15b07135ca Yi Liu 2024-03-18  19  	if (curr) {
d14d15b07135ca Yi Liu 2024-03-18  20  		if (curr == hwpt)
d14d15b07135ca Yi Liu 2024-03-18  21  			rc = 0;
d14d15b07135ca Yi Liu 2024-03-18  22  		else
d14d15b07135ca Yi Liu 2024-03-18  23  			rc = xa_err(curr) ? : -EBUSY;
d14d15b07135ca Yi Liu 2024-03-18  24  		goto err_put_hwpt;
d14d15b07135ca Yi Liu 2024-03-18  25  	}
d14d15b07135ca Yi Liu 2024-03-18  26  
d14d15b07135ca Yi Liu 2024-03-18  27  	rc = iommu_attach_device_pasid(hwpt->domain, idev->dev, pasid);
d14d15b07135ca Yi Liu 2024-03-18  28  	if (rc) {
d14d15b07135ca Yi Liu 2024-03-18  29  		xa_erase(&idev->pasid_hwpts, pasid);
d14d15b07135ca Yi Liu 2024-03-18  30  		goto err_put_hwpt;
d14d15b07135ca Yi Liu 2024-03-18  31  	}
d14d15b07135ca Yi Liu 2024-03-18  32  
d14d15b07135ca Yi Liu 2024-03-18  33  	return NULL;
d14d15b07135ca Yi Liu 2024-03-18  34  
d14d15b07135ca Yi Liu 2024-03-18  35  err_put_hwpt:
d14d15b07135ca Yi Liu 2024-03-18  36  	refcount_dec(&hwpt->obj.users);
d14d15b07135ca Yi Liu 2024-03-18 @37  	return ERR_PTR(rc);
d14d15b07135ca Yi Liu 2024-03-18  38  }
d14d15b07135ca Yi Liu 2024-03-18  39  
d14d15b07135ca Yi Liu 2024-03-18  40  struct iommufd_hw_pagetable *
d14d15b07135ca Yi Liu 2024-03-18  41  iommufd_device_pasid_do_replace(struct iommufd_device *idev, u32 pasid,
d14d15b07135ca Yi Liu 2024-03-18  42  				struct iommufd_hw_pagetable *hwpt)
d14d15b07135ca Yi Liu 2024-03-18  43  {
d14d15b07135ca Yi Liu 2024-03-18  44  	void *curr;
d14d15b07135ca Yi Liu 2024-03-18  45  	int rc;
d14d15b07135ca Yi Liu 2024-03-18  46  
d14d15b07135ca Yi Liu 2024-03-18  47  	refcount_inc(&hwpt->obj.users);
d14d15b07135ca Yi Liu 2024-03-18  48  	curr = xa_store(&idev->pasid_hwpts, pasid, hwpt, GFP_KERNEL);
d14d15b07135ca Yi Liu 2024-03-18  49  	rc = xa_err(curr);
d14d15b07135ca Yi Liu 2024-03-18  50  	if (rc)
d14d15b07135ca Yi Liu 2024-03-18  51  		goto out_put_hwpt;
d14d15b07135ca Yi Liu 2024-03-18  52  
d14d15b07135ca Yi Liu 2024-03-18  53  	if (!curr) {
d14d15b07135ca Yi Liu 2024-03-18  54  		xa_erase(&idev->pasid_hwpts, pasid);
d14d15b07135ca Yi Liu 2024-03-18  55  		rc = -EINVAL;
d14d15b07135ca Yi Liu 2024-03-18  56  		goto out_put_hwpt;
d14d15b07135ca Yi Liu 2024-03-18  57  	}
d14d15b07135ca Yi Liu 2024-03-18  58  
d14d15b07135ca Yi Liu 2024-03-18  59  	if (curr == hwpt)
d14d15b07135ca Yi Liu 2024-03-18  60  		goto out_put_hwpt;
d14d15b07135ca Yi Liu 2024-03-18  61  
d14d15b07135ca Yi Liu 2024-03-18  62  	rc = iommu_replace_device_pasid(hwpt->domain, idev->dev, pasid);
d14d15b07135ca Yi Liu 2024-03-18  63  	if (rc) {
d14d15b07135ca Yi Liu 2024-03-18  64  		WARN_ON(xa_err(xa_store(&idev->pasid_hwpts, pasid,
d14d15b07135ca Yi Liu 2024-03-18  65  					curr, GFP_KERNEL)));
d14d15b07135ca Yi Liu 2024-03-18  66  		goto out_put_hwpt;
d14d15b07135ca Yi Liu 2024-03-18  67  	}
d14d15b07135ca Yi Liu 2024-03-18  68  
d14d15b07135ca Yi Liu 2024-03-18  69  	/* Caller must destroy old_hwpt */
d14d15b07135ca Yi Liu 2024-03-18  70  	return curr;
d14d15b07135ca Yi Liu 2024-03-18  71  
d14d15b07135ca Yi Liu 2024-03-18  72  out_put_hwpt:
d14d15b07135ca Yi Liu 2024-03-18  73  	refcount_dec(&hwpt->obj.users);
d14d15b07135ca Yi Liu 2024-03-18 @74  	return ERR_PTR(rc);
d14d15b07135ca Yi Liu 2024-03-18  75  }
d14d15b07135ca Yi Liu 2024-03-18  76  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
