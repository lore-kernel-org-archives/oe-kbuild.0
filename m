Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9934179F9
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Apr 2023 14:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680792358; x=1712328358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zx2O8udvJH0I5LJ6in3Z36iR8xCjPuiNLYm6/Lph6qw=;
  b=WqLy4PmksB5I/lgkr6fYofY5q4Ir0XWUpJg2IlJ4hzfbLFv/V/JCPwrf
   oF9HV1FhTXyh1abYBFUxVhK84aG0kFcoGRF/huxOKZBwu8kLy4frxK1oc
   nJT/sqbnsm/QdhAtgpkuj/4AwDi/QmqoRgFz9fBwZwKqiFATDka+xup6E
   6p6tZ7NQlFxMWyMoujb2zX15Bj04WdirUyifHyVaUEr6ubq8XUNbQGaCO
   Hzub7U1hQZ9L0IDV+UO5J5VhZtR2vV7SteHwNOzp2nuaQtRSxb/rK1TqG
   GrynJQL/j0NW1BfqBL0TZWkj0vYHNKWTEX4A6fpko4xYGkndRfqua/DUq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="326818038"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="326818038"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 07:45:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="756384851"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="756384851"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Apr 2023 07:45:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkQs7-000RRy-1V;
	Thu, 06 Apr 2023 14:45:55 +0000
Date: Thu, 6 Apr 2023 22:45:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-03292023-yi 3/42]
 drivers/iommu/iommufd/device.c:329 iommufd_device_get_hw_info() error:
 uninitialized symbol 'rc'.
Message-ID: <202304062233.7sW2ckXj-lkp@intel.com>
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
commit: 06ac6c12f5cac61638684e9d6f3fee0fca1287d3 [3/42] iommufd: Add IOMMU_DEVICE_GET_HW_INFO
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: i386-randconfig-m021-20230403 (https://download.01.org/0day-ci/archive/20230406/202304062233.7sW2ckXj-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304062233.7sW2ckXj-lkp@intel.com/

New smatch warnings:
drivers/iommu/iommufd/device.c:329 iommufd_device_get_hw_info() error: uninitialized symbol 'rc'.
drivers/iommu/iommufd/device.c:335 iommufd_device_get_hw_info() error: 'data' dereferencing possible ERR_PTR()

Old smatch warnings:
drivers/iommu/iommufd/device.c:1151 iommufd_access_rw() error: uninitialized symbol 'rc'.

vim +/rc +329 drivers/iommu/iommufd/device.c

06ac6c12f5cac6 Yi Liu 2023-01-12  276  
06ac6c12f5cac6 Yi Liu 2023-01-12  277  int iommufd_device_get_hw_info(struct iommufd_ucmd *ucmd)
06ac6c12f5cac6 Yi Liu 2023-01-12  278  {
06ac6c12f5cac6 Yi Liu 2023-01-12  279  	struct iommu_hw_info *cmd = ucmd->cmd;
06ac6c12f5cac6 Yi Liu 2023-01-12  280  	unsigned int length, data_len;
06ac6c12f5cac6 Yi Liu 2023-01-12  281  	struct iommufd_device *idev;
06ac6c12f5cac6 Yi Liu 2023-01-12  282  	const struct iommu_ops *ops;
06ac6c12f5cac6 Yi Liu 2023-01-12  283  	void *data = NULL;
06ac6c12f5cac6 Yi Liu 2023-01-12  284  	int rc;
06ac6c12f5cac6 Yi Liu 2023-01-12  285  
06ac6c12f5cac6 Yi Liu 2023-01-12  286  	if (cmd->flags || cmd->__reserved || !cmd->data_len)
06ac6c12f5cac6 Yi Liu 2023-01-12  287  		return -EOPNOTSUPP;
06ac6c12f5cac6 Yi Liu 2023-01-12  288  
06ac6c12f5cac6 Yi Liu 2023-01-12  289  	idev = iommufd_get_device(ucmd, cmd->dev_id);
06ac6c12f5cac6 Yi Liu 2023-01-12  290  	if (IS_ERR(idev))
06ac6c12f5cac6 Yi Liu 2023-01-12  291  		return PTR_ERR(idev);
06ac6c12f5cac6 Yi Liu 2023-01-12  292  
06ac6c12f5cac6 Yi Liu 2023-01-12  293  	ops = dev_iommu_ops(idev->dev);
06ac6c12f5cac6 Yi Liu 2023-01-12  294  	if (!ops->hw_info) {
06ac6c12f5cac6 Yi Liu 2023-01-12  295  		rc = 0;
06ac6c12f5cac6 Yi Liu 2023-01-12  296  		length = 0;
06ac6c12f5cac6 Yi Liu 2023-01-12  297  		goto out;
06ac6c12f5cac6 Yi Liu 2023-01-12  298  	}
06ac6c12f5cac6 Yi Liu 2023-01-12  299  
06ac6c12f5cac6 Yi Liu 2023-01-12  300  	/* driver has hw_info callback should have a unique hw_info_type */
06ac6c12f5cac6 Yi Liu 2023-01-12  301  	if (ops->hw_info_type == IOMMU_HW_INFO_TYPE_NONE) {
06ac6c12f5cac6 Yi Liu 2023-01-12  302  		pr_warn_ratelimited("iommu driver set an invalid type\n");
06ac6c12f5cac6 Yi Liu 2023-01-12  303  		rc = -ENODEV;
06ac6c12f5cac6 Yi Liu 2023-01-12  304  		goto out;
06ac6c12f5cac6 Yi Liu 2023-01-12  305  	}
06ac6c12f5cac6 Yi Liu 2023-01-12  306  
06ac6c12f5cac6 Yi Liu 2023-01-12  307  	data = ops->hw_info(idev->dev, &data_len);
06ac6c12f5cac6 Yi Liu 2023-01-12  308  	if (IS_ERR(data)) {
06ac6c12f5cac6 Yi Liu 2023-01-12  309  		rc = PTR_ERR(data);
06ac6c12f5cac6 Yi Liu 2023-01-12  310  		goto out;
06ac6c12f5cac6 Yi Liu 2023-01-12  311  	}
06ac6c12f5cac6 Yi Liu 2023-01-12  312  
06ac6c12f5cac6 Yi Liu 2023-01-12  313  	length = min(cmd->data_len, data_len);
06ac6c12f5cac6 Yi Liu 2023-01-12  314  	if (copy_to_user(u64_to_user_ptr(cmd->data_ptr), data, length)) {
06ac6c12f5cac6 Yi Liu 2023-01-12  315  		rc = -EFAULT;
06ac6c12f5cac6 Yi Liu 2023-01-12  316  		goto out;
06ac6c12f5cac6 Yi Liu 2023-01-12  317  	}
06ac6c12f5cac6 Yi Liu 2023-01-12  318  
06ac6c12f5cac6 Yi Liu 2023-01-12  319  	/*
06ac6c12f5cac6 Yi Liu 2023-01-12  320  	 * Zero the trailing bytes if the user buffer is bigger than the
06ac6c12f5cac6 Yi Liu 2023-01-12  321  	 * data size kernel actually has.
06ac6c12f5cac6 Yi Liu 2023-01-12  322  	 */
06ac6c12f5cac6 Yi Liu 2023-01-12  323  	if (length < cmd->data_len) {
06ac6c12f5cac6 Yi Liu 2023-01-12  324  		rc = iommufd_zero_fill_user(cmd->data_ptr + length,
06ac6c12f5cac6 Yi Liu 2023-01-12  325  					    cmd->data_len - length);
06ac6c12f5cac6 Yi Liu 2023-01-12  326  	}
06ac6c12f5cac6 Yi Liu 2023-01-12  327  
06ac6c12f5cac6 Yi Liu 2023-01-12  328  out:
06ac6c12f5cac6 Yi Liu 2023-01-12 @329  	if (!rc) {
06ac6c12f5cac6 Yi Liu 2023-01-12  330  		cmd->out_data_type = ops->hw_info_type;
06ac6c12f5cac6 Yi Liu 2023-01-12  331  		cmd->data_len = length;
06ac6c12f5cac6 Yi Liu 2023-01-12  332  		rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
06ac6c12f5cac6 Yi Liu 2023-01-12  333  	}
06ac6c12f5cac6 Yi Liu 2023-01-12  334  
06ac6c12f5cac6 Yi Liu 2023-01-12 @335  	kfree(data);
06ac6c12f5cac6 Yi Liu 2023-01-12  336  	iommufd_put_object(&idev->obj);
06ac6c12f5cac6 Yi Liu 2023-01-12  337  	return rc;
06ac6c12f5cac6 Yi Liu 2023-01-12  338  }
06ac6c12f5cac6 Yi Liu 2023-01-12  339  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
