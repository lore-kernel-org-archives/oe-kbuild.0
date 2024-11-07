Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CB1192B90
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 05:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730958420; cv=none; b=gFEgYo4iOYFN4ns1MMdKuOm6nYUH5TelyogCkD63hdv4M7QZptLIXLPS19ArxRl0qP3CCi7C34yY4EZC9qIsEzZu1QRNWGINgLFWwYuYj4C+aWF4j+14rQqq/s892PFkr8xAJFrmI6DRkIRPf3+tJKr9CIi9c/aF0kqw0VfTRJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730958420; c=relaxed/simple;
	bh=aaAHcRm68WFtK4gzsRywrE1YBwoYqmjgd5pTmFLY1Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fwkhX7sp1x0TDPTeX04FZQMcv0DMoiEBW8XYwzD+ZV1o4xBdqXdlQBtCMb6ivX0ufApQ4vaXY5uNC9ptgBikf2bGx0KYtKMxa2PsgaTwKtRKOavF2Md6ve3F7Qc3BvQbWe06glfPr+u+xXYF13rsGtfHDlg11l/dONf5FrlGz5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bwwahBOX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bwwahBOX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730958419; x=1762494419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aaAHcRm68WFtK4gzsRywrE1YBwoYqmjgd5pTmFLY1Tc=;
  b=bwwahBOXXGR6nR13J0Z9PbCRC8i+YG6vOxgk40HD6mMZkKQm2K72vnBR
   jF6JRfv30EBws7gXPCCH5m1Omeuy2YBTw8+QX2OrMn3VvoDFuuB3e65Gn
   2+mkNJw9aUm5UYGlWO+5svpG5IlH+Aktj5pfuHuf/WnC3Wvzt+h4o4k7X
   QMtb24TD/dtkCvycEP62V3dez2R+X6zId/OlY5kGTqGCuiatjVTveCsed
   ONkTL8haogDMuHOfw/AwUGVLaTG1SYi9Ir7URzxRk64AAmvoi4Wz1oD+y
   vZit+F3OmOv96tRa4A/fDL5+cqf3VNNbigOq8MtAlS9+ABIerontvWvIN
   g==;
X-CSE-ConnectionGUID: YjjT+NbiRFq554DHlDMlyQ==
X-CSE-MsgGUID: 5SFVHHqiT9CdhxWB++/Qiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="56183960"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="56183960"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 21:46:58 -0800
X-CSE-ConnectionGUID: VqcvNMHnSDeefcECjSoXzQ==
X-CSE-MsgGUID: R3Q9eQZ5QoqR2r5tPoWW0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="84482532"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Nov 2024 21:46:56 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8vM6-000prW-2E;
	Thu, 07 Nov 2024 05:46:54 +0000
Date: Thu, 7 Nov 2024 13:45:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/amd/iommu.c:2011 init_gcr3_table() warn: missing error
 code? 'ret'
Message-ID: <202411071356.ZGPCgGEQ-lkp@intel.com>
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
TO: Vasant Hegde <vasant.hegde@amd.com>
CC: Joerg Roedel <jroedel@suse.de>
CC: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ff7afaeca1a15fbeaa2c4795ee806c0667bd77b2
commit: c9e8701132e6cc162d082e7dad8a2e9110f5f8fd iommu/amd: Setup GCR3 table in advance if domain is SVA capable
date:   7 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-161-20241107 (https://download.01.org/0day-ci/archive/20241107/202411071356.ZGPCgGEQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411071356.ZGPCgGEQ-lkp@intel.com/

smatch warnings:
drivers/iommu/amd/iommu.c:2011 init_gcr3_table() warn: missing error code? 'ret'

vim +/ret +2011 drivers/iommu/amd/iommu.c

c5ebd096253910 Vasant Hegde 2024-04-18  1981  
c9e8701132e6cc Vasant Hegde 2024-04-18  1982  /*
c9e8701132e6cc Vasant Hegde 2024-04-18  1983   * If domain is SVA capable then initialize GCR3 table. Also if domain is
c9e8701132e6cc Vasant Hegde 2024-04-18  1984   * in v2 page table mode then update GCR3[0].
c9e8701132e6cc Vasant Hegde 2024-04-18  1985   */
c9e8701132e6cc Vasant Hegde 2024-04-18  1986  static int init_gcr3_table(struct iommu_dev_data *dev_data,
c9e8701132e6cc Vasant Hegde 2024-04-18  1987  			   struct protection_domain *pdom)
c9e8701132e6cc Vasant Hegde 2024-04-18  1988  {
c9e8701132e6cc Vasant Hegde 2024-04-18  1989  	struct amd_iommu *iommu = get_amd_iommu_from_dev_data(dev_data);
c9e8701132e6cc Vasant Hegde 2024-04-18  1990  	int max_pasids = dev_data->max_pasids;
c9e8701132e6cc Vasant Hegde 2024-04-18  1991  	int ret = 0;
c9e8701132e6cc Vasant Hegde 2024-04-18  1992  
c9e8701132e6cc Vasant Hegde 2024-04-18  1993  	 /*
c9e8701132e6cc Vasant Hegde 2024-04-18  1994  	  * If domain is in pt mode then setup GCR3 table only if device
c9e8701132e6cc Vasant Hegde 2024-04-18  1995  	  * is PASID capable
c9e8701132e6cc Vasant Hegde 2024-04-18  1996  	  */
c9e8701132e6cc Vasant Hegde 2024-04-18  1997  	if (pdom_is_in_pt_mode(pdom) && !pdev_pasid_supported(dev_data))
c9e8701132e6cc Vasant Hegde 2024-04-18  1998  		return ret;
c9e8701132e6cc Vasant Hegde 2024-04-18  1999  
c9e8701132e6cc Vasant Hegde 2024-04-18  2000  	/*
c9e8701132e6cc Vasant Hegde 2024-04-18  2001  	 * By default, setup GCR3 table to support MAX PASIDs
c9e8701132e6cc Vasant Hegde 2024-04-18  2002  	 * supported by the device/IOMMU.
c9e8701132e6cc Vasant Hegde 2024-04-18  2003  	 */
c9e8701132e6cc Vasant Hegde 2024-04-18  2004  	ret = setup_gcr3_table(&dev_data->gcr3_info, iommu,
c9e8701132e6cc Vasant Hegde 2024-04-18  2005  			       max_pasids > 0 ?  max_pasids : 1);
c9e8701132e6cc Vasant Hegde 2024-04-18  2006  	if (ret)
c9e8701132e6cc Vasant Hegde 2024-04-18  2007  		return ret;
c9e8701132e6cc Vasant Hegde 2024-04-18  2008  
c9e8701132e6cc Vasant Hegde 2024-04-18  2009  	/* Setup GCR3[0] only if domain is setup with v2 page table mode */
c9e8701132e6cc Vasant Hegde 2024-04-18  2010  	if (!pdom_is_v2_pgtbl_mode(pdom))
c9e8701132e6cc Vasant Hegde 2024-04-18 @2011  		return ret;
c9e8701132e6cc Vasant Hegde 2024-04-18  2012  
c9e8701132e6cc Vasant Hegde 2024-04-18  2013  	ret = update_gcr3(dev_data, 0, iommu_virt_to_phys(pdom->iop.pgd), true);
c9e8701132e6cc Vasant Hegde 2024-04-18  2014  	if (ret)
c9e8701132e6cc Vasant Hegde 2024-04-18  2015  		free_gcr3_table(&dev_data->gcr3_info);
c9e8701132e6cc Vasant Hegde 2024-04-18  2016  
c9e8701132e6cc Vasant Hegde 2024-04-18  2017  	return ret;
c9e8701132e6cc Vasant Hegde 2024-04-18  2018  }
c9e8701132e6cc Vasant Hegde 2024-04-18  2019  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
