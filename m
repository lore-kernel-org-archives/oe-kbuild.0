Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F9B1C39
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Sep 2023 20:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694206591; x=1725742591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dvIKS5o5Xduv49keEXbx+4a0UcAEEjjck/zbOB0Wv28=;
  b=X351hd8930kPCPTRPbSiVI4PI/NLsZtb9Z1Ymgxdx+2qJ8FZfO6kCxjQ
   VqbNq1MzIIVPhyMLoClFrZ1GHawsIWrkfyj+2JLJUni9FQj8NTETro4+2
   M3Hx1OhAi8mj5bKoP3v1VkqSlpIoQWNoJylW157uynUKvaCOsQEX0IHf+
   IWBsgaXft1kEjQeVmy3o9pp+XyVbwMYVH0jGd2I4TlIW5WQQ6gAz0xYsP
   SZ81XgWmjnFddfueGK1iOKczfKeMYN7l7QFgRLOKPc0yvggm/eE2shHX7
   kHfNyB6JtEAYNJitM6XQxNs2QYXOoixrSqJbJOTf8EtC5/f4+qH4hZFxH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="380476335"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="380476335"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 13:56:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="742637549"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="742637549"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Sep 2023 13:56:29 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeiWh-0002bt-2T;
	Fri, 08 Sep 2023 20:56:27 +0000
Date: Sat, 9 Sep 2023 04:56:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [yiliu1765-iommufd:wip/iommufd_nesting_09042023-yi-not-tested 13/26]
 drivers/iommu/iommufd/hw_pagetable.c:325 iommufd_hwpt_alloc() error:
 potentially dereferencing uninitialized 'parent'.
Message-ID: <202309090432.uLNWDOfL-lkp@intel.com>
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

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting_09042023-yi-not-tested
head:   19df4ebfe078e091791110a53bfcc1abc6f72fb3
commit: 56bfc2cb8d81259247dcedd479140554c66f9aa3 [13/26] iommufd: Add user-managed hw_pagetable support
:::::: branch date: 4 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-161-20230907 (https://download.01.org/0day-ci/archive/20230909/202309090432.uLNWDOfL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230909/202309090432.uLNWDOfL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309090432.uLNWDOfL-lkp@intel.com/

smatch warnings:
drivers/iommu/iommufd/hw_pagetable.c:325 iommufd_hwpt_alloc() error: potentially dereferencing uninitialized 'parent'.

vim +/parent +325 drivers/iommu/iommufd/hw_pagetable.c

7074d7bd67d495 Jason Gunthorpe 2023-07-17  283  
7074d7bd67d495 Jason Gunthorpe 2023-07-17  284  int iommufd_hwpt_alloc(struct iommufd_ucmd *ucmd)
7074d7bd67d495 Jason Gunthorpe 2023-07-17  285  {
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  286  	struct iommufd_hw_pagetable *(*alloc_fn)(
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  287  					struct iommufd_ctx *ictx,
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  288  					struct iommufd_object *pt_obj,
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  289  					struct iommufd_device *idev,
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  290  					u32 flags, enum iommu_hwpt_type type,
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  291  					struct iommu_user_data *user_data,
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  292  					bool flag);
56bfc2cb8d8125 Nicolin Chen    2023-08-02  293  	struct iommufd_hw_pagetable *hwpt, *parent;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  294  	struct iommu_hwpt_alloc *cmd = ucmd->cmd;
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  295  	struct iommufd_object *pt_obj;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  296  	struct iommufd_device *idev;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  297  	struct iommufd_ioas *ioas;
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  298  	struct mutex *mutex;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  299  	int rc;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  300  
08fa18dbae1178 Yi Liu          2023-09-01  301  	if (cmd->flags & (~IOMMU_HWPT_ALLOC_NEST_PARENT) || cmd->__reserved)
7074d7bd67d495 Jason Gunthorpe 2023-07-17  302  		return -EOPNOTSUPP;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  303  
7074d7bd67d495 Jason Gunthorpe 2023-07-17  304  	idev = iommufd_get_device(ucmd, cmd->dev_id);
7074d7bd67d495 Jason Gunthorpe 2023-07-17  305  	if (IS_ERR(idev))
7074d7bd67d495 Jason Gunthorpe 2023-07-17  306  		return PTR_ERR(idev);
7074d7bd67d495 Jason Gunthorpe 2023-07-17  307  
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  308  	pt_obj = iommufd_get_object(ucmd->ictx, cmd->pt_id, IOMMUFD_OBJ_ANY);
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  309  	if (IS_ERR(pt_obj)) {
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  310  		rc = -EINVAL;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  311  		goto out_put_idev;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  312  	}
7074d7bd67d495 Jason Gunthorpe 2023-07-17  313  
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  314  	switch (pt_obj->type) {
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  315  	case IOMMUFD_OBJ_IOAS:
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  316  		ioas = container_of(pt_obj, struct iommufd_ioas, obj);
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  317  		mutex = &ioas->mutex;
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  318  		alloc_fn = iommufd_hw_pagetable_alloc;
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  319  		break;
56bfc2cb8d8125 Nicolin Chen    2023-08-02  320  	case IOMMUFD_OBJ_HW_PAGETABLE:
56bfc2cb8d8125 Nicolin Chen    2023-08-02  321  		/*
56bfc2cb8d8125 Nicolin Chen    2023-08-02  322  		 * No user-managed HWPT on top of an user-managed one,
56bfc2cb8d8125 Nicolin Chen    2023-08-02  323  		 * parent should be allocated with NEST_PARENT flag.
56bfc2cb8d8125 Nicolin Chen    2023-08-02  324  		 */
56bfc2cb8d8125 Nicolin Chen    2023-08-02 @325  		if (parent->user_managed || !parent->nest_parent) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
