Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4F733D1
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Oct 2024 03:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729393696; cv=none; b=W/vknOX9bmSoyEyZtOZAXW8Vn6tDl/bD6+DFFb3eLM4/Nk3puYYG1h81yHzMJGGYCi/zEfwd1uKWdMTdVfaQ3mBftKed1t0QPSKvEZCXisP74adXVtJGTErDw88+Ni/7i4zu7E+gim8+9r7BgnC6hk7YmNZUMdLORDkxcUaA0i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729393696; c=relaxed/simple;
	bh=pBH1Z9S+CIE8kNCYsYNB53O243DP4pR9CA8Rm2bLPbE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kekH9eD/N1+0E1OwKVk9aHFY55xWwofLP4y15Sb9CgIEQ7aFrrUfMXoY16N6N6uZlANMXuLH9HiwWxc+bglJFWiL6WyHJv9I9K/blkRhK4S1skv0JzUPaiomPPgYfP1T1MfwAKtUJDSsc1VvwSMKs1+w9hsp4LTkKIHIo1TfvIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gtEmrNp+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gtEmrNp+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729393695; x=1760929695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pBH1Z9S+CIE8kNCYsYNB53O243DP4pR9CA8Rm2bLPbE=;
  b=gtEmrNp+UuXxcTDtiKsrN6irMQFFjxYECRyzjRhBn1fkt5NuQ63KE97D
   dkdTz4OfpfmnPtm5F/GcZ857de/3oSiJJkSEGRuFzR+FRMrwLQp2bWudu
   4M1k4MkLyRvvnJGYBHtyivgncpzNZIqlj0FmGMO2HNSSPb2CFOvkMcjvZ
   j0KVg0WVId1135uo+P826zeiuAyO8iKERDozUcRtaIIzLHJSxuHcpWOY2
   IHtfzQXxorkTQ3KgIeWv/OA8NgKajg55zW45jgjK+UMS7xZWmOWIv/t8c
   nAdJh/PvcdFxELo2sqbCVQZMli0YZ4IISVHsZ1mpV01yGDixvbH8WMIry
   Q==;
X-CSE-ConnectionGUID: f1c7p8wQQ1+cYWE+8lmtuQ==
X-CSE-MsgGUID: 9FbQlUGbTJKfk44RuWvcJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39442879"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39442879"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 20:08:13 -0700
X-CSE-ConnectionGUID: lj+Eq8mdQTuCOH9kVdMqxQ==
X-CSE-MsgGUID: aB/WjI0RQDaRuvNbsdNZZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="79167640"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Oct 2024 20:08:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2MIc-000Pog-06;
	Sun, 20 Oct 2024 03:08:10 +0000
Date: Sun, 20 Oct 2024 11:07:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/iommufd/selftest.c:310 mock_domain_alloc_user() warn:
 can 'mock_parent' even be NULL?
Message-ID: <202410201106.w4WSpLW7-lkp@intel.com>
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
TO: Nicolin Chen <nicolinc@nvidia.com>
CC: Jason Gunthorpe <jgg@ziepe.ca>
CC: Yi Liu <yi.l.liu@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   715ca9dd687f89ddaac8ec8ccb3b5e5a30311a99
commit: 65fe32f7a4472e19331a524b9c980b3444dd20a2 iommufd/selftest: Add nested domain allocation for mock domain
date:   12 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 12 months ago
config: alpha-randconfig-r073-20241020 (https://download.01.org/0day-ci/archive/20241020/202410201106.w4WSpLW7-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410201106.w4WSpLW7-lkp@intel.com/

smatch warnings:
drivers/iommu/iommufd/selftest.c:310 mock_domain_alloc_user() warn: can 'mock_parent' even be NULL?

vim +/mock_parent +310 drivers/iommu/iommufd/selftest.c

65fe32f7a4472e Nicolin Chen 2023-10-25  278  
408663619fcfc8 Yi Liu       2023-09-28  279  static struct iommu_domain *
2bdabb8e82f564 Yi Liu       2023-10-25  280  mock_domain_alloc_user(struct device *dev, u32 flags,
2bdabb8e82f564 Yi Liu       2023-10-25  281  		       struct iommu_domain *parent,
2bdabb8e82f564 Yi Liu       2023-10-25  282  		       const struct iommu_user_data *user_data)
408663619fcfc8 Yi Liu       2023-09-28  283  {
65fe32f7a4472e Nicolin Chen 2023-10-25  284  	struct mock_iommu_domain *mock_parent;
65fe32f7a4472e Nicolin Chen 2023-10-25  285  	struct iommu_hwpt_selftest user_cfg;
65fe32f7a4472e Nicolin Chen 2023-10-25  286  	int rc;
65fe32f7a4472e Nicolin Chen 2023-10-25  287  
65fe32f7a4472e Nicolin Chen 2023-10-25  288  	/* must be mock_domain */
65fe32f7a4472e Nicolin Chen 2023-10-25  289  	if (!parent) {
266ce58989ba05 Joao Martins 2023-10-24  290  		struct mock_dev *mdev = container_of(dev, struct mock_dev, dev);
65fe32f7a4472e Nicolin Chen 2023-10-25  291  		bool has_dirty_flag = flags & IOMMU_HWPT_ALLOC_DIRTY_TRACKING;
65fe32f7a4472e Nicolin Chen 2023-10-25  292  		bool no_dirty_ops = mdev->flags & MOCK_FLAGS_DEVICE_NO_DIRTY;
408663619fcfc8 Yi Liu       2023-09-28  293  
65fe32f7a4472e Nicolin Chen 2023-10-25  294  		if (flags & (~(IOMMU_HWPT_ALLOC_NEST_PARENT |
65fe32f7a4472e Nicolin Chen 2023-10-25  295  			       IOMMU_HWPT_ALLOC_DIRTY_TRACKING)))
266ce58989ba05 Joao Martins 2023-10-24  296  			return ERR_PTR(-EOPNOTSUPP);
65fe32f7a4472e Nicolin Chen 2023-10-25  297  		if (user_data || (has_dirty_flag && no_dirty_ops))
2bdabb8e82f564 Yi Liu       2023-10-25  298  			return ERR_PTR(-EOPNOTSUPP);
65fe32f7a4472e Nicolin Chen 2023-10-25  299  		return __mock_domain_alloc_paging(IOMMU_DOMAIN_UNMANAGED,
65fe32f7a4472e Nicolin Chen 2023-10-25  300  						  has_dirty_flag);
65fe32f7a4472e Nicolin Chen 2023-10-25  301  	}
2bdabb8e82f564 Yi Liu       2023-10-25  302  
65fe32f7a4472e Nicolin Chen 2023-10-25  303  	/* must be mock_domain_nested */
65fe32f7a4472e Nicolin Chen 2023-10-25  304  	if (user_data->type != IOMMU_HWPT_DATA_SELFTEST || flags)
408663619fcfc8 Yi Liu       2023-09-28  305  		return ERR_PTR(-EOPNOTSUPP);
65fe32f7a4472e Nicolin Chen 2023-10-25  306  	if (!parent || parent->ops != mock_ops.default_domain_ops)
65fe32f7a4472e Nicolin Chen 2023-10-25  307  		return ERR_PTR(-EINVAL);
408663619fcfc8 Yi Liu       2023-09-28  308  
65fe32f7a4472e Nicolin Chen 2023-10-25  309  	mock_parent = container_of(parent, struct mock_iommu_domain, domain);
65fe32f7a4472e Nicolin Chen 2023-10-25 @310  	if (!mock_parent)
65fe32f7a4472e Nicolin Chen 2023-10-25  311  		return ERR_PTR(-EINVAL);
65fe32f7a4472e Nicolin Chen 2023-10-25  312  
65fe32f7a4472e Nicolin Chen 2023-10-25  313  	rc = iommu_copy_struct_from_user(&user_cfg, user_data,
65fe32f7a4472e Nicolin Chen 2023-10-25  314  					 IOMMU_HWPT_DATA_SELFTEST, iotlb);
65fe32f7a4472e Nicolin Chen 2023-10-25  315  	if (rc)
65fe32f7a4472e Nicolin Chen 2023-10-25  316  		return ERR_PTR(rc);
65fe32f7a4472e Nicolin Chen 2023-10-25  317  
65fe32f7a4472e Nicolin Chen 2023-10-25  318  	return __mock_domain_alloc_nested(mock_parent, &user_cfg);
408663619fcfc8 Yi Liu       2023-09-28  319  }
408663619fcfc8 Yi Liu       2023-09-28  320  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
