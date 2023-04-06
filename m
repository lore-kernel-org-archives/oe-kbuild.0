Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EB32F3A
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Apr 2023 22:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680821364; x=1712357364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6RU+sdoiMLTLnFQirYNIGvnwIQlWb0b226gfiEjVfwQ=;
  b=Fl5ZO6IAmAaQ5y60knCH+debHicxpsRT0CLxaiiQZqxRBgfj+5Tawn+U
   oGO5rb0lhB4DUUdM5qMskxRUc8W38ipHTpy/IycsZ/+FsEH/ZW/8ISq+i
   vX7srpox7g95B+BZpfch8Bodv31YBak4Cq4U6f9n00B5wetv2ANNZV0dw
   qTVCMSA+1Rh9wAXaIbuute1z2gzryxIjyOXyd5Q+ML4YJyBxQWRUQgK0G
   VwvPQhx1HtwKVA88ODcQZR+5CyQ1OUUxaBSwCcaRSLmxPKgF6LuSWgeA4
   UWCypAWdy0zSWMKMMiPi8YXAxD9B2MHIFmVq1BhS0UWLTsRsel6ErEJxH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="326932086"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="326932086"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 15:49:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="719869087"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="719869087"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Apr 2023 15:49:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkYPs-000Rsw-2S;
	Thu, 06 Apr 2023 22:49:16 +0000
Date: Fri, 7 Apr 2023 06:48:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-03292023-yi 18/42]
 drivers/iommu/iommufd/hw_pagetable.c:329 iommufd_hwpt_invalidate() error:
 uninitialized symbol 'klen'.
Message-ID: <202304070656.pdx7M6xV-lkp@intel.com>
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

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-03292023-yi
head:   032ce679f2322b426350f8721d7a1afca1bb7aab
commit: 7c7afc988c9e13edc817899c9ace9504f2483dfe [18/42] iommufd/selftest: Add coverage for IOMMU_HWPT_INVALIDATE ioctl
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: i386-randconfig-m021-20230403 (https://download.01.org/0day-ci/archive/20230407/202304070656.pdx7M6xV-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304070656.pdx7M6xV-lkp@intel.com/

New smatch warnings:
drivers/iommu/iommufd/hw_pagetable.c:329 iommufd_hwpt_invalidate() error: uninitialized symbol 'klen'.

Old smatch warnings:
drivers/iommu/iommufd/hw_pagetable.c:162 iommufd_hw_pagetable_alloc() error: uninitialized symbol 'rc'.
drivers/iommu/iommufd/hw_pagetable.c:247 iommufd_hwpt_alloc() error: uninitialized symbol 'klen'.
drivers/iommu/iommufd/hw_pagetable.c:310 iommufd_hwpt_invalidate() warn: always true condition '(cmd->data_type >= (0 / 4 + (0))) => (0-u32max >= 0)'

vim +/klen +329 drivers/iommu/iommufd/hw_pagetable.c

e23c914d2fef0e Yi Liu       2023-01-13  298  
e23c914d2fef0e Yi Liu       2023-01-13  299  int iommufd_hwpt_invalidate(struct iommufd_ucmd *ucmd)
e23c914d2fef0e Yi Liu       2023-01-13  300  {
e23c914d2fef0e Yi Liu       2023-01-13  301  	struct iommu_hwpt_invalidate *cmd = ucmd->cmd;
e23c914d2fef0e Yi Liu       2023-01-13  302  	struct iommufd_hw_pagetable *hwpt;
e23c914d2fef0e Yi Liu       2023-01-13  303  	u64 user_ptr;
e23c914d2fef0e Yi Liu       2023-01-13  304  	u32 user_data_len, klen;
e23c914d2fef0e Yi Liu       2023-01-13  305  	int rc = 0;
e23c914d2fef0e Yi Liu       2023-01-13  306  
e23c914d2fef0e Yi Liu       2023-01-13  307  	/* For a user-managed HWPT, type should not be IOMMU_HWPT_TYPE_DEFAULT */
e23c914d2fef0e Yi Liu       2023-01-13  308  	if (cmd->data_type == IOMMU_HWPT_TYPE_DEFAULT || !cmd->data_len ||
7c7afc988c9e13 Nicolin Chen 2022-12-14  309  	    (cmd->data_type != IOMMU_HWPT_TYPE_SELFTTEST &&
7c7afc988c9e13 Nicolin Chen 2022-12-14  310  	     cmd->data_type >= ARRAY_SIZE(iommufd_hwpt_invalidate_info_size)))
e23c914d2fef0e Yi Liu       2023-01-13  311  		return -EOPNOTSUPP;
e23c914d2fef0e Yi Liu       2023-01-13  312  
e23c914d2fef0e Yi Liu       2023-01-13  313  	hwpt = iommufd_get_hwpt(ucmd, cmd->hwpt_id);
e23c914d2fef0e Yi Liu       2023-01-13  314  	if (IS_ERR(hwpt))
e23c914d2fef0e Yi Liu       2023-01-13  315  		return PTR_ERR(hwpt);
e23c914d2fef0e Yi Liu       2023-01-13  316  
e23c914d2fef0e Yi Liu       2023-01-13  317  	/* Do not allow any kernel-managed hw_pagetable */
e23c914d2fef0e Yi Liu       2023-01-13  318  	if (!hwpt->parent) {
e23c914d2fef0e Yi Liu       2023-01-13  319  		rc = -EINVAL;
e23c914d2fef0e Yi Liu       2023-01-13  320  		goto out_put_hwpt;
e23c914d2fef0e Yi Liu       2023-01-13  321  	}
e23c914d2fef0e Yi Liu       2023-01-13  322  
7c7afc988c9e13 Nicolin Chen 2022-12-14  323  	if (cmd->data_type != IOMMU_HWPT_TYPE_SELFTTEST)
e23c914d2fef0e Yi Liu       2023-01-13  324  		klen = iommufd_hwpt_invalidate_info_size[cmd->data_type];
7c7afc988c9e13 Nicolin Chen 2022-12-14  325  #ifdef CONFIG_IOMMUFD_TEST
7c7afc988c9e13 Nicolin Chen 2022-12-14  326  	else
7c7afc988c9e13 Nicolin Chen 2022-12-14  327  		klen = sizeof(struct iommu_hwpt_invalidate_selftest);
7c7afc988c9e13 Nicolin Chen 2022-12-14  328  #endif
e23c914d2fef0e Yi Liu       2023-01-13 @329  	if (!klen) {

:::::: The code at line 329 was first introduced by commit
:::::: e23c914d2fef0e1001935f10419232bfe811d5b9 iommufd: Add IOMMU_HWPT_INVALIDATE

:::::: TO: Yi Liu <yi.l.liu@intel.com>
:::::: CC: Yi Liu <yi.l.liu@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
