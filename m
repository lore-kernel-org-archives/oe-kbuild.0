Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588DF1FBF
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Oct 2023 03:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CSrHLLSQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698203448; x=1729739448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/nFzkh/Ted5kaRoLRVLTpbmpMepnI9+/QNKJQgEbsj4=;
  b=CSrHLLSQc59Ver6g1H2zF3+4Kp0TAhp6XDnNBzX5KZpV5IXYT0Ws77Kk
   EqfPljDm+X0HldP1i1XpJY+rRvOATLNyZ93MNx2eFE7V7gIH3RqOqdymH
   7K9E3umOaoJa8jDpQyjwZn08lTJ8TBEID7LYwtsOuKDC6Jxx+jlhemXaL
   95UNewlFZvg7Z4jWvkAhAUJn54UWTAIaH+IyQNoJHTK5Gks9bfrLPJWzT
   /xZ2UJyZ3fXmL1qelkEoJEry/klDVUWmnADO1BXMpaoE1dDjpTSRLgEqs
   tY4EYHhsxSPc8RENBBlKE6+i9PJzsIh4NqkREBxW9degyHJ2zqJcYCsyy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="451451351"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="451451351"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 20:10:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="758726517"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="758726517"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Oct 2023 20:10:44 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvUI6-0008ZB-00;
	Wed, 25 Oct 2023 03:10:42 +0000
Date: Wed, 25 Oct 2023 11:10:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-10202023-yi 9/54]
 drivers/iommu/iommufd/selftest.c:232 mock_domain_alloc_user() warn: can
 'mock_parent' even be NULL?
Message-ID: <202310251111.VbtSeoru-lkp@intel.com>
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

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-10202023-yi
head:   7e413d2798f93759b4500bd7bfdc9a6186bf68ae
commit: e8d915274cfedb8169b63ceae4cb015c63e92af8 [9/54] iommufd/selftest: Add nested domain allocation for mock domain
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-161-20231025 (https://download.01.org/0day-ci/archive/20231025/202310251111.VbtSeoru-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231025/202310251111.VbtSeoru-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310251111.VbtSeoru-lkp@intel.com/

smatch warnings:
drivers/iommu/iommufd/selftest.c:232 mock_domain_alloc_user() warn: can 'mock_parent' even be NULL?

vim +/mock_parent +232 drivers/iommu/iommufd/selftest.c

e8d915274cfedb Nicolin Chen 2023-02-26  206  
408663619fcfc8 Yi Liu       2023-09-28  207  static struct iommu_domain *
530905d6710537 Yi Liu       2023-09-01  208  mock_domain_alloc_user(struct device *dev, u32 flags,
530905d6710537 Yi Liu       2023-09-01  209  		       struct iommu_domain *parent,
530905d6710537 Yi Liu       2023-09-01  210  		       const struct iommu_user_data *user_data)
408663619fcfc8 Yi Liu       2023-09-28  211  {
e8d915274cfedb Nicolin Chen 2023-02-26  212  	struct mock_iommu_domain *mock_parent;
e8d915274cfedb Nicolin Chen 2023-02-26  213  	struct iommu_hwpt_selftest user_cfg;
e8d915274cfedb Nicolin Chen 2023-02-26  214  	int rc;
408663619fcfc8 Yi Liu       2023-09-28  215  
408663619fcfc8 Yi Liu       2023-09-28  216  	if (flags & (~IOMMU_HWPT_ALLOC_NEST_PARENT))
408663619fcfc8 Yi Liu       2023-09-28  217  		return ERR_PTR(-EOPNOTSUPP);
408663619fcfc8 Yi Liu       2023-09-28  218  
e8d915274cfedb Nicolin Chen 2023-02-26  219  	if (!user_data) {	/* must be mock_domain */
e8d915274cfedb Nicolin Chen 2023-02-26  220  		if (parent)
e8d915274cfedb Nicolin Chen 2023-02-26  221  			return ERR_PTR(-EINVAL);
e8d915274cfedb Nicolin Chen 2023-02-26  222  		return __mock_domain_alloc_paging(IOMMU_DOMAIN_UNMANAGED);
e8d915274cfedb Nicolin Chen 2023-02-26  223  	}
e8d915274cfedb Nicolin Chen 2023-02-26  224  
e8d915274cfedb Nicolin Chen 2023-02-26  225  	/* must be mock_domain_nested */
e8d915274cfedb Nicolin Chen 2023-02-26  226  	if (user_data->type != IOMMU_HWPT_DATA_SELFTEST)
e8d915274cfedb Nicolin Chen 2023-02-26  227  		return ERR_PTR(-EOPNOTSUPP);
e8d915274cfedb Nicolin Chen 2023-02-26  228  	if (!parent || parent->ops != mock_ops.default_domain_ops)
e8d915274cfedb Nicolin Chen 2023-02-26  229  		return ERR_PTR(-EINVAL);
e8d915274cfedb Nicolin Chen 2023-02-26  230  
e8d915274cfedb Nicolin Chen 2023-02-26  231  	mock_parent = container_of(parent, struct mock_iommu_domain, domain);
e8d915274cfedb Nicolin Chen 2023-02-26 @232  	if (!mock_parent)
e8d915274cfedb Nicolin Chen 2023-02-26  233  		return ERR_PTR(-EINVAL);
e8d915274cfedb Nicolin Chen 2023-02-26  234  
e8d915274cfedb Nicolin Chen 2023-02-26  235  	rc = iommu_copy_struct_from_user(&user_cfg, user_data,
e8d915274cfedb Nicolin Chen 2023-02-26  236  					 IOMMU_HWPT_DATA_SELFTEST, iotlb);
e8d915274cfedb Nicolin Chen 2023-02-26  237  	if (rc)
e8d915274cfedb Nicolin Chen 2023-02-26  238  		return ERR_PTR(rc);
e8d915274cfedb Nicolin Chen 2023-02-26  239  
e8d915274cfedb Nicolin Chen 2023-02-26  240  	return __mock_domain_alloc_nested(mock_parent, &user_cfg);
408663619fcfc8 Yi Liu       2023-09-28  241  }
408663619fcfc8 Yi Liu       2023-09-28  242  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
