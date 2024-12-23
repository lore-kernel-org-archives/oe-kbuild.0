Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050A7219FF
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Dec 2024 15:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734966586; cv=none; b=QdsLXftDWKILDqePtmXVtqDwaFRbJmoapRajQdg/DKnEA0frK5kcy/lYDTgtIIf56HVWkbE45h9Xi7Qc1DU+42WlUlVG1R753NdAmhHHjBucwF40sVVdd8BCMLU5aMtw+M3ZbWt5qd/CVyV/W4GYJU5bwJdXSaE4erhdcuGwt2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734966586; c=relaxed/simple;
	bh=PX5fL94blGF79HkR8mOZ23+B9n9Ut4S/7k1lGGMSTs4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U1N10ncigGOdizTh583wola8dslR9B5vqFBg5AxOBmNZ34hA/V64lCscigp5fZGepuc1iMcuZrQFSkPPW3JhwVpsQlg7MfqWx3fn2flpAh/8sqFYGBhX3CV83Q/qZRVQcd4vzgMA5nfdyBqCU7KBt1pE3l+ewrZE68wZmQJzdxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CSb8wKyh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CSb8wKyh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734966584; x=1766502584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PX5fL94blGF79HkR8mOZ23+B9n9Ut4S/7k1lGGMSTs4=;
  b=CSb8wKyhPYObrCt5/kZF2oMkOkwhaFXsqO3zcuP8sOn/9FaHxSYpaEoY
   cOdbCVbHiGlHmrZfDVYDU3NL2kbVwW2QZ2SYWAtY9rN5VLqBiLFz9MtHi
   VrG5NTYnizy3OC5MlMF4cDVkHe9fKedmYZvNzwUf344CNM6Ma+++fkmnK
   Re0KTjaB4IMjeqewKSYqNm29do/BoEDijUO23OP+aDqXLeoWm0URZeyk6
   zYRJMX570V/x10uPoMYxsfh4h4rxCNkelA3q1ZJiSz5r1rC7CjupeevS8
   wniHP2OLLZb09Hx7/4Lnm6fm+WPbkEun6jUEWiRCJfIOC6zIKj6X5Sx4l
   w==;
X-CSE-ConnectionGUID: SAr7toB1QUG1BS3KyedJAw==
X-CSE-MsgGUID: Y+rJStnbSaGkqrLX0mwfkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="57897506"
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="57897506"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 07:09:44 -0800
X-CSE-ConnectionGUID: 87CnCYsNQrGYwfLdo+wmig==
X-CSE-MsgGUID: 1HLXlcgQTeiM3T39SGZdmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="104212165"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Dec 2024 07:09:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPk3w-00004V-0S;
	Mon, 23 Dec 2024 15:09:40 +0000
Date: Mon, 23 Dec 2024 23:08:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 1/5] drm/msm: register a fault handler for display mmu
 faults
Message-ID: <202412232320.jOVlNH6W-lkp@intel.com>
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
In-Reply-To: <20241217-abhinavk-smmu-fault-handler-v2-1-451377666cad@quicinc.com>
References: <20241217-abhinavk-smmu-fault-handler-v2-1-451377666cad@quicinc.com>
TO: Jessica Zhang <quic_jesszhan@quicinc.com>

Hi Jessica,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 86313a9cd152330c634b25d826a281c6a002eb77]

url:    https://github.com/intel-lab-lkp/linux/commits/Jessica-Zhang/drm-msm-register-a-fault-handler-for-display-mmu-faults/20241218-082950
base:   86313a9cd152330c634b25d826a281c6a002eb77
patch link:    https://lore.kernel.org/r/20241217-abhinavk-smmu-fault-handler-v2-1-451377666cad%40quicinc.com
patch subject: [PATCH v2 1/5] drm/msm: register a fault handler for display mmu faults
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: powerpc-randconfig-r072-20241223 (https://download.01.org/0day-ci/archive/20241223/202412232320.jOVlNH6W-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412232320.jOVlNH6W-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/msm_kms.c:211 msm_kms_init_aspace() error: 'aspace' dereferencing possible ERR_PTR()

vim +/aspace +211 drivers/gpu/drm/msm/msm_kms.c

0752a7416c0b8f Abhinav Kumar    2024-12-17  175  
506efcba31296e Dmitry Baryshkov 2023-10-09  176  struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
506efcba31296e Dmitry Baryshkov 2023-10-09  177  {
506efcba31296e Dmitry Baryshkov 2023-10-09  178  	struct msm_gem_address_space *aspace;
506efcba31296e Dmitry Baryshkov 2023-10-09  179  	struct msm_mmu *mmu;
506efcba31296e Dmitry Baryshkov 2023-10-09  180  	struct device *mdp_dev = dev->dev;
506efcba31296e Dmitry Baryshkov 2023-10-09  181  	struct device *mdss_dev = mdp_dev->parent;
0752a7416c0b8f Abhinav Kumar    2024-12-17  182  	struct msm_drm_private *priv = dev->dev_private;
0752a7416c0b8f Abhinav Kumar    2024-12-17  183  	struct msm_kms *kms = priv->kms;
506efcba31296e Dmitry Baryshkov 2023-10-09  184  	struct device *iommu_dev;
506efcba31296e Dmitry Baryshkov 2023-10-09  185  
506efcba31296e Dmitry Baryshkov 2023-10-09  186  	/*
506efcba31296e Dmitry Baryshkov 2023-10-09  187  	 * IOMMUs can be a part of MDSS device tree binding, or the
506efcba31296e Dmitry Baryshkov 2023-10-09  188  	 * MDP/DPU device.
506efcba31296e Dmitry Baryshkov 2023-10-09  189  	 */
506efcba31296e Dmitry Baryshkov 2023-10-09  190  	if (device_iommu_mapped(mdp_dev))
506efcba31296e Dmitry Baryshkov 2023-10-09  191  		iommu_dev = mdp_dev;
506efcba31296e Dmitry Baryshkov 2023-10-09  192  	else
506efcba31296e Dmitry Baryshkov 2023-10-09  193  		iommu_dev = mdss_dev;
506efcba31296e Dmitry Baryshkov 2023-10-09  194  
506efcba31296e Dmitry Baryshkov 2023-10-09  195  	mmu = msm_iommu_new(iommu_dev, 0);
506efcba31296e Dmitry Baryshkov 2023-10-09  196  	if (IS_ERR(mmu))
506efcba31296e Dmitry Baryshkov 2023-10-09  197  		return ERR_CAST(mmu);
506efcba31296e Dmitry Baryshkov 2023-10-09  198  
506efcba31296e Dmitry Baryshkov 2023-10-09  199  	if (!mmu) {
506efcba31296e Dmitry Baryshkov 2023-10-09  200  		drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
506efcba31296e Dmitry Baryshkov 2023-10-09  201  		return NULL;
506efcba31296e Dmitry Baryshkov 2023-10-09  202  	}
506efcba31296e Dmitry Baryshkov 2023-10-09  203  
506efcba31296e Dmitry Baryshkov 2023-10-09  204  	aspace = msm_gem_address_space_create(mmu, "mdp_kms",
506efcba31296e Dmitry Baryshkov 2023-10-09  205  		0x1000, 0x100000000 - 0x1000);
506efcba31296e Dmitry Baryshkov 2023-10-09  206  	if (IS_ERR(aspace)) {
506efcba31296e Dmitry Baryshkov 2023-10-09  207  		dev_err(mdp_dev, "aspace create, error %pe\n", aspace);
506efcba31296e Dmitry Baryshkov 2023-10-09  208  		mmu->funcs->destroy(mmu);
506efcba31296e Dmitry Baryshkov 2023-10-09  209  	}
506efcba31296e Dmitry Baryshkov 2023-10-09  210  
0752a7416c0b8f Abhinav Kumar    2024-12-17 @211  	msm_mmu_set_fault_handler(aspace->mmu, kms, msm_kms_fault_handler);
0752a7416c0b8f Abhinav Kumar    2024-12-17  212  
506efcba31296e Dmitry Baryshkov 2023-10-09  213  	return aspace;
506efcba31296e Dmitry Baryshkov 2023-10-09  214  }
506efcba31296e Dmitry Baryshkov 2023-10-09  215  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
