Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EB859164
	for <oe-kbuild@lists.linux.dev>; Wed, 22 May 2024 03:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716349267; cv=none; b=LOcjExyUbzAf8+5viP4p3MCeS1xkll91AgO9ycIGRONEQLPjE4Dx0hLOkqkbBSi1RRtMBoZlgLFLJalIqQIIfBkRlCy0Dj8fJtLyIJH8TmeV2hikmYXteZ8rqhn6SvL9zG5k6vEk9LbNCObmDF+lneIqkqHgXxgbnMYXNfg//JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716349267; c=relaxed/simple;
	bh=Vi7B/dHKpgROgyUEtQ3l8+1cZZVLMmo/j5fJvH7BPpg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s/JMvkQ6vMf8DlsWvnK2Vqx7DuuNV5h27QT+2szXUC1PG78bi0i6upBdCikOqI06EV2k7BaPsTBgOwimVJHOo0Px6nh6n5G1pGWNs9EUQRZYS1DxcR2rAAeKUkc4ze/+JWUSWtfNxVdSdl1AC2rsy9F2aekkdDdCIP0ZCCyClHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XxhlyF2n; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XxhlyF2n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716349263; x=1747885263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vi7B/dHKpgROgyUEtQ3l8+1cZZVLMmo/j5fJvH7BPpg=;
  b=XxhlyF2nzgUOOAqQOwJ29KLJjLWjJFL0X6dcgV9TLaoPyBszeXZNNjYl
   ZB/vOzclncql4VRKKyClsM/bGJS0Xkf1qKm2pg6n6lGV9guZsCD5MhPxx
   /BNRJiwEtAIU7npDsih3ZygGPVjA7+HQzhCDCTMyVXTD4E6YIS3Z6oTqM
   hQ4fU0Uu2JvpuiQGNH6x8FpyUWEGERp/FVTMR/tVGfJnGvU1h8WUPFeqC
   1v8k0hMstAT7+cpcIbwNuXLszP8Dgb19Uj+/fj05SuUBOLim3H1uVSHVh
   lWxepMiorMh9fgvkODQYyY65VJyvurZvtagRolh7Mq/lQo2Kw+dtlu1oS
   Q==;
X-CSE-ConnectionGUID: WovTX09RQWe8Z92cf1mpvQ==
X-CSE-MsgGUID: CLujWGqzTH+2dFTd9y+6Bg==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="35085629"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="35085629"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 20:41:02 -0700
X-CSE-ConnectionGUID: KfS73Cb4R4+cIgVoYA6OOg==
X-CSE-MsgGUID: vohOwuRMRTik15tuwjaS3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="33195831"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 May 2024 20:41:01 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9cqY-000113-32;
	Wed, 22 May 2024 03:40:58 +0000
Date: Wed, 22 May 2024 11:40:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/amd/iommu.c:2011 init_gcr3_table() warn: missing error
 code? 'ret'
Message-ID: <202405221116.X7cP3GzG-lkp@intel.com>
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
head:   29c73fc794c83505066ee6db893b2a83ac5fac63
commit: c9e8701132e6cc162d082e7dad8a2e9110f5f8fd iommu/amd: Setup GCR3 table in advance if domain is SVA capable
date:   4 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-161-20240522 (https://download.01.org/0day-ci/archive/20240522/202405221116.X7cP3GzG-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405221116.X7cP3GzG-lkp@intel.com/

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
