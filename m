Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66F6BA23
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Apr 2023 20:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680812115; x=1712348115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hHRNe8axlupyAB61FnmcT9ooeq/h/M7dnv0IQ53bb/E=;
  b=Xbg7CMxNmu8AzZNYQW74rL0f0ETC58KBn97tli4/e3jWm1gV9A0Sbt6q
   Ae45S+0wiYLVM8PaEfb3toSQ2OcfFOAjcDjMEWA5KhZvmBFtLidlnV1oV
   Tofv2IXwOeX1yukCJmkHQEOAwj/pWhqsIbxe09E4orYxpaQa+gQN0xxl+
   BC1wiFfNEdzbp4q8iHaHQCbt/2SdgCTS9II9SD07dgT36gXjXGe1qdx68
   pIgAG4fAeE9G9VA4t+A2nNgHNLogY0ok/1WDNc0HESMoyLqtcCP2PfjTR
   80IbZAhP7d+LU/UqTmlWQ+DORvDhiF91riFI9DYq6XgPmcysjeDxB9f4G
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="326900872"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="326900872"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 13:15:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="687269279"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="687269279"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Apr 2023 13:15:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkW0j-000RjS-02;
	Thu, 06 Apr 2023 20:15:09 +0000
Date: Fri, 7 Apr 2023 04:14:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-03292023-yi 15/42]
 drivers/iommu/iommufd/hw_pagetable.c:247 iommufd_hwpt_alloc() error:
 uninitialized symbol 'klen'.
Message-ID: <202304070422.X4wpZb1u-lkp@intel.com>
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
commit: cfab6d45ee4dd485bc223d0135643093a7778923 [15/42] iommufd/selftest: Add domain_alloc_user() support in iommu mock
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: i386-randconfig-m021-20230403 (https://download.01.org/0day-ci/archive/20230407/202304070422.X4wpZb1u-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304070422.X4wpZb1u-lkp@intel.com/

New smatch warnings:
drivers/iommu/iommufd/hw_pagetable.c:247 iommufd_hwpt_alloc() error: uninitialized symbol 'klen'.

Old smatch warnings:
drivers/iommu/iommufd/hw_pagetable.c:162 iommufd_hw_pagetable_alloc() error: uninitialized symbol 'rc'.
drivers/iommu/iommufd/hw_pagetable.c:309 iommufd_hwpt_invalidate() warn: always true condition '(cmd->data_type >= (0 / 4 + (0))) => (0-u32max >= 0)'

vim +/klen +247 drivers/iommu/iommufd/hw_pagetable.c

a5314a527b1ab8 Yi Liu          2023-03-03  172  
654fb5316ca27c Jason Gunthorpe 2023-02-16  173  int iommufd_hwpt_alloc(struct iommufd_ucmd *ucmd)
654fb5316ca27c Jason Gunthorpe 2023-02-16  174  {
a5314a527b1ab8 Yi Liu          2023-03-03  175  	struct iommufd_hw_pagetable *hwpt, *parent = NULL;
654fb5316ca27c Jason Gunthorpe 2023-02-16  176  	struct iommu_hwpt_alloc *cmd = ucmd->cmd;
a5314a527b1ab8 Yi Liu          2023-03-03  177  	struct iommufd_object *pt_obj;
a5314a527b1ab8 Yi Liu          2023-03-03  178  	const struct iommu_ops *ops;
654fb5316ca27c Jason Gunthorpe 2023-02-16  179  	struct iommufd_device *idev;
654fb5316ca27c Jason Gunthorpe 2023-02-16  180  	struct iommufd_ioas *ioas;
a5314a527b1ab8 Yi Liu          2023-03-03  181  	void *data = NULL;
a5314a527b1ab8 Yi Liu          2023-03-03  182  	u32 klen;
654fb5316ca27c Jason Gunthorpe 2023-02-16  183  	int rc;
654fb5316ca27c Jason Gunthorpe 2023-02-16  184  
654fb5316ca27c Jason Gunthorpe 2023-02-16  185  	if (cmd->flags || cmd->__reserved)
654fb5316ca27c Jason Gunthorpe 2023-02-16  186  		return -EOPNOTSUPP;
654fb5316ca27c Jason Gunthorpe 2023-02-16  187  
654fb5316ca27c Jason Gunthorpe 2023-02-16  188  	idev = iommufd_get_device(ucmd, cmd->dev_id);
654fb5316ca27c Jason Gunthorpe 2023-02-16  189  	if (IS_ERR(idev))
654fb5316ca27c Jason Gunthorpe 2023-02-16  190  		return PTR_ERR(idev);
654fb5316ca27c Jason Gunthorpe 2023-02-16  191  
a5314a527b1ab8 Yi Liu          2023-03-03  192  	ops = dev_iommu_ops(idev->dev);
a5314a527b1ab8 Yi Liu          2023-03-03  193  
ee19e9e5b92641 Yi Liu          2023-03-03  194  	/*
ee19e9e5b92641 Yi Liu          2023-03-03  195  	 * cmd->data_type should be a supported type marked in the
ee19e9e5b92641 Yi Liu          2023-03-03  196  	 * ops->hwpt_type_bitmap. Otherwise, the allocation can continue
ee19e9e5b92641 Yi Liu          2023-03-03  197  	 * only when the ops->hw_info_type==IOMMU_HW_INFO_TYPE_NONE and
ee19e9e5b92641 Yi Liu          2023-03-03  198  	 * cmd->data_type==IOMMU_HWPT_TYPE_DEFAULT.
ee19e9e5b92641 Yi Liu          2023-03-03  199  	 */
ee19e9e5b92641 Yi Liu          2023-03-03  200  	if (!((1 << cmd->data_type) & ops->hwpt_type_bitmap) &&
ee19e9e5b92641 Yi Liu          2023-03-03  201  	    ((ops->hw_info_type != IOMMU_HW_INFO_TYPE_NONE) ||
ee19e9e5b92641 Yi Liu          2023-03-03  202  	     (cmd->data_type != IOMMU_HWPT_TYPE_DEFAULT))) {
a5314a527b1ab8 Yi Liu          2023-03-03  203  		rc = -EINVAL;
a5314a527b1ab8 Yi Liu          2023-03-03  204  		goto out_put_idev;
a5314a527b1ab8 Yi Liu          2023-03-03  205  	}
a5314a527b1ab8 Yi Liu          2023-03-03  206  
a5314a527b1ab8 Yi Liu          2023-03-03  207  	pt_obj = iommufd_get_object(ucmd->ictx, cmd->pt_id, IOMMUFD_OBJ_ANY);
a5314a527b1ab8 Yi Liu          2023-03-03  208  	if (IS_ERR(pt_obj)) {
a5314a527b1ab8 Yi Liu          2023-03-03  209  		rc = -EINVAL;
654fb5316ca27c Jason Gunthorpe 2023-02-16  210  		goto out_put_idev;
654fb5316ca27c Jason Gunthorpe 2023-02-16  211  	}
654fb5316ca27c Jason Gunthorpe 2023-02-16  212  
a5314a527b1ab8 Yi Liu          2023-03-03  213  	switch (pt_obj->type) {
a5314a527b1ab8 Yi Liu          2023-03-03  214  	case IOMMUFD_OBJ_IOAS:
a5314a527b1ab8 Yi Liu          2023-03-03  215  		ioas = container_of(pt_obj, struct iommufd_ioas, obj);
a5314a527b1ab8 Yi Liu          2023-03-03  216  		break;
a5314a527b1ab8 Yi Liu          2023-03-03  217  	case IOMMUFD_OBJ_HW_PAGETABLE:
a5314a527b1ab8 Yi Liu          2023-03-03  218  		/* pt_id points HWPT only when data_type is !IOMMU_HWPT_TYPE_DEFAULT */
a5314a527b1ab8 Yi Liu          2023-03-03  219  		if (cmd->data_type == IOMMU_HWPT_TYPE_DEFAULT) {
a5314a527b1ab8 Yi Liu          2023-03-03  220  			rc = -EINVAL;
a5314a527b1ab8 Yi Liu          2023-03-03  221  			goto out_put_pt;
a5314a527b1ab8 Yi Liu          2023-03-03  222  		}
a5314a527b1ab8 Yi Liu          2023-03-03  223  
a5314a527b1ab8 Yi Liu          2023-03-03  224  		parent = container_of(pt_obj, struct iommufd_hw_pagetable, obj);
a5314a527b1ab8 Yi Liu          2023-03-03  225  		/*
a5314a527b1ab8 Yi Liu          2023-03-03  226  		 * Cannot allocate user-managed hwpt linking to auto_created
a5314a527b1ab8 Yi Liu          2023-03-03  227  		 * hwpt. If the parent hwpt is already a user-managed hwpt,
a5314a527b1ab8 Yi Liu          2023-03-03  228  		 * don't allocate another user-managed hwpt linking to it.
a5314a527b1ab8 Yi Liu          2023-03-03  229  		 */
a5314a527b1ab8 Yi Liu          2023-03-03  230  		if (parent->auto_domain || parent->parent) {
a5314a527b1ab8 Yi Liu          2023-03-03  231  			rc = -EINVAL;
a5314a527b1ab8 Yi Liu          2023-03-03  232  			goto out_put_pt;
a5314a527b1ab8 Yi Liu          2023-03-03  233  		}
a5314a527b1ab8 Yi Liu          2023-03-03  234  		ioas = parent->ioas;
a5314a527b1ab8 Yi Liu          2023-03-03  235  		break;
a5314a527b1ab8 Yi Liu          2023-03-03  236  	default:
a5314a527b1ab8 Yi Liu          2023-03-03  237  		rc = -EINVAL;
a5314a527b1ab8 Yi Liu          2023-03-03  238  		goto out_put_pt;
a5314a527b1ab8 Yi Liu          2023-03-03  239  	}
a5314a527b1ab8 Yi Liu          2023-03-03  240  
cfab6d45ee4dd4 Nicolin Chen    2023-02-26  241  	if (cmd->data_type != IOMMU_HWPT_TYPE_SELFTTEST)
a5314a527b1ab8 Yi Liu          2023-03-03  242  		klen = iommufd_hwpt_alloc_data_size[cmd->data_type];
cfab6d45ee4dd4 Nicolin Chen    2023-02-26  243  #ifdef CONFIG_IOMMUFD_TEST
cfab6d45ee4dd4 Nicolin Chen    2023-02-26  244  	else
cfab6d45ee4dd4 Nicolin Chen    2023-02-26  245  		klen = sizeof(struct iommu_hwpt_selftest);
cfab6d45ee4dd4 Nicolin Chen    2023-02-26  246  #endif
a5314a527b1ab8 Yi Liu          2023-03-03 @247  	if (klen) {
a5314a527b1ab8 Yi Liu          2023-03-03  248  		if (!cmd->data_len) {
a5314a527b1ab8 Yi Liu          2023-03-03  249  			rc = -EINVAL;
a5314a527b1ab8 Yi Liu          2023-03-03  250  			goto out_put_pt;
a5314a527b1ab8 Yi Liu          2023-03-03  251  		}
a5314a527b1ab8 Yi Liu          2023-03-03  252  
a5314a527b1ab8 Yi Liu          2023-03-03  253  		data = kzalloc(klen, GFP_KERNEL);
a5314a527b1ab8 Yi Liu          2023-03-03  254  		if (!data) {
a5314a527b1ab8 Yi Liu          2023-03-03  255  			rc = -ENOMEM;
a5314a527b1ab8 Yi Liu          2023-03-03  256  			goto out_put_pt;
a5314a527b1ab8 Yi Liu          2023-03-03  257  		}
a5314a527b1ab8 Yi Liu          2023-03-03  258  
a5314a527b1ab8 Yi Liu          2023-03-03  259  		rc = copy_struct_from_user(data, klen,
a5314a527b1ab8 Yi Liu          2023-03-03  260  					   u64_to_user_ptr(cmd->data_uptr),
a5314a527b1ab8 Yi Liu          2023-03-03  261  					   cmd->data_len);
a5314a527b1ab8 Yi Liu          2023-03-03  262  		if (rc)
a5314a527b1ab8 Yi Liu          2023-03-03  263  			goto out_free_data;
a5314a527b1ab8 Yi Liu          2023-03-03  264  	}
a5314a527b1ab8 Yi Liu          2023-03-03  265  
654fb5316ca27c Jason Gunthorpe 2023-02-16  266  	mutex_lock(&ioas->mutex);
c1cf862f230cf3 Yi Liu          2023-03-03  267  	hwpt = iommufd_hw_pagetable_alloc(ucmd->ictx, ioas, idev,
a5314a527b1ab8 Yi Liu          2023-03-03  268  					  parent, data, false);
654fb5316ca27c Jason Gunthorpe 2023-02-16  269  	mutex_unlock(&ioas->mutex);
654fb5316ca27c Jason Gunthorpe 2023-02-16  270  	if (IS_ERR(hwpt)) {
654fb5316ca27c Jason Gunthorpe 2023-02-16  271  		rc = PTR_ERR(hwpt);
a5314a527b1ab8 Yi Liu          2023-03-03  272  		goto out_free_data;
654fb5316ca27c Jason Gunthorpe 2023-02-16  273  	}
654fb5316ca27c Jason Gunthorpe 2023-02-16  274  
654fb5316ca27c Jason Gunthorpe 2023-02-16  275  	cmd->out_hwpt_id = hwpt->obj.id;
654fb5316ca27c Jason Gunthorpe 2023-02-16  276  	rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
654fb5316ca27c Jason Gunthorpe 2023-02-16  277  	if (rc)
654fb5316ca27c Jason Gunthorpe 2023-02-16  278  		goto out_hwpt;
654fb5316ca27c Jason Gunthorpe 2023-02-16  279  	iommufd_object_finalize(ucmd->ictx, &hwpt->obj);
a5314a527b1ab8 Yi Liu          2023-03-03  280  	goto out_free_data;
654fb5316ca27c Jason Gunthorpe 2023-02-16  281  
654fb5316ca27c Jason Gunthorpe 2023-02-16  282  out_hwpt:
654fb5316ca27c Jason Gunthorpe 2023-02-16  283  	iommufd_object_abort_and_destroy(ucmd->ictx, &hwpt->obj);
a5314a527b1ab8 Yi Liu          2023-03-03  284  out_free_data:
a5314a527b1ab8 Yi Liu          2023-03-03  285  	kfree(data);
a5314a527b1ab8 Yi Liu          2023-03-03  286  out_put_pt:
a5314a527b1ab8 Yi Liu          2023-03-03  287  	iommufd_put_object(pt_obj);
654fb5316ca27c Jason Gunthorpe 2023-02-16  288  out_put_idev:
654fb5316ca27c Jason Gunthorpe 2023-02-16  289  	iommufd_put_object(&idev->obj);
654fb5316ca27c Jason Gunthorpe 2023-02-16  290  	return rc;
654fb5316ca27c Jason Gunthorpe 2023-02-16  291  }
e23c914d2fef0e Yi Liu          2023-01-13  292  

:::::: The code at line 247 was first introduced by commit
:::::: a5314a527b1ab86bbedc4b15c1bd993a8aed231e iommufd: IOMMU_HWPT_ALLOC allocation with user data

:::::: TO: Yi Liu <yi.l.liu@intel.com>
:::::: CC: Yi Liu <yi.l.liu@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
