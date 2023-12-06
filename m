Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13531ECD
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Dec 2023 01:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QB/ew4SC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701826374; x=1733362374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CzkToTY7aq8cWLdA+muIkGrRTxaVjaosxcZg51IOKtQ=;
  b=QB/ew4SCvitt2xmNsPTKGttdNhZR2gIHG6Nvclizcqck/UcbncZauzuD
   miSSHR73zsNUslmyDQiluBeD17yAlnA6xOA/LFl3+ZwJReSPOrIE8TMLW
   wPBHdZ4LxuNPnucT7bPi+2LtKcJA8QvPG9lTAcYYkOE58iLJ28wl09paG
   YvAsQgZrs7ny09f8kdhXFesrWAR3DXXzkFawuYzHVsPky3/4ctxjWQICb
   SZC7Nj0TeTyqXF0mAXud3UrLa2cG38qho/oxRGEm9ClU/4Tr8n7Ke+UZl
   pvqhbp2UJ8YurUA3DpnvVvC9WQ0n2Eu22Ttaga/Lk1IjzZLu0dxO21n31
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="460474978"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="460474978"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 17:32:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1102649150"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1102649150"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 05 Dec 2023 17:32:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAgmM-000A1Y-1A;
	Wed, 06 Dec 2023 01:32:46 +0000
Date: Wed, 6 Dec 2023 09:31:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/iommu/iommufd/hw_pagetable.c:226:1-7: preceding lock on line
 197
Message-ID: <202312060947.C52WRrtX-lkp@intel.com>
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
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: b5021cb264e67baf051569a41debe277c279952b iommufd: Share iommufd_hwpt_alloc with IOMMUFD_OBJ_HWPT_NESTED
date:   6 weeks ago
:::::: branch date: 28 hours ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-103-20231202 (https://download.01.org/0day-ci/archive/20231206/202312060947.C52WRrtX-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060947.C52WRrtX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312060947.C52WRrtX-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iommu/iommufd/hw_pagetable.c:226:1-7: preceding lock on line 197

vim +226 drivers/iommu/iommufd/hw_pagetable.c

7074d7bd67d495 Jason Gunthorpe 2023-07-17  170  
7074d7bd67d495 Jason Gunthorpe 2023-07-17  171  int iommufd_hwpt_alloc(struct iommufd_ucmd *ucmd)
7074d7bd67d495 Jason Gunthorpe 2023-07-17  172  {
7074d7bd67d495 Jason Gunthorpe 2023-07-17  173  	struct iommu_hwpt_alloc *cmd = ucmd->cmd;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  174  	struct iommufd_hw_pagetable *hwpt;
b5021cb264e67b Nicolin Chen    2023-10-25  175  	struct iommufd_ioas *ioas = NULL;
b5021cb264e67b Nicolin Chen    2023-10-25  176  	struct iommufd_object *pt_obj;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  177  	struct iommufd_device *idev;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  178  	int rc;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  179  
b5021cb264e67b Nicolin Chen    2023-10-25  180  	if (cmd->__reserved)
7074d7bd67d495 Jason Gunthorpe 2023-07-17  181  		return -EOPNOTSUPP;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  182  
7074d7bd67d495 Jason Gunthorpe 2023-07-17  183  	idev = iommufd_get_device(ucmd, cmd->dev_id);
7074d7bd67d495 Jason Gunthorpe 2023-07-17  184  	if (IS_ERR(idev))
7074d7bd67d495 Jason Gunthorpe 2023-07-17  185  		return PTR_ERR(idev);
7074d7bd67d495 Jason Gunthorpe 2023-07-17  186  
b5021cb264e67b Nicolin Chen    2023-10-25  187  	pt_obj = iommufd_get_object(ucmd->ictx, cmd->pt_id, IOMMUFD_OBJ_ANY);
b5021cb264e67b Nicolin Chen    2023-10-25  188  	if (IS_ERR(pt_obj)) {
b5021cb264e67b Nicolin Chen    2023-10-25  189  		rc = -EINVAL;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  190  		goto out_put_idev;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  191  	}
7074d7bd67d495 Jason Gunthorpe 2023-07-17  192  
b5021cb264e67b Nicolin Chen    2023-10-25  193  	if (pt_obj->type == IOMMUFD_OBJ_IOAS) {
b5021cb264e67b Nicolin Chen    2023-10-25  194  		struct iommufd_hwpt_paging *hwpt_paging;
b5021cb264e67b Nicolin Chen    2023-10-25  195  
b5021cb264e67b Nicolin Chen    2023-10-25  196  		ioas = container_of(pt_obj, struct iommufd_ioas, obj);
7074d7bd67d495 Jason Gunthorpe 2023-07-17 @197  		mutex_lock(&ioas->mutex);
89db31635c87a7 Nicolin Chen    2023-10-25  198  		hwpt_paging = iommufd_hwpt_paging_alloc(ucmd->ictx, ioas, idev,
89db31635c87a7 Nicolin Chen    2023-10-25  199  							cmd->flags, false);
89db31635c87a7 Nicolin Chen    2023-10-25  200  		if (IS_ERR(hwpt_paging)) {
89db31635c87a7 Nicolin Chen    2023-10-25  201  			rc = PTR_ERR(hwpt_paging);
7074d7bd67d495 Jason Gunthorpe 2023-07-17  202  			goto out_unlock;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  203  		}
89db31635c87a7 Nicolin Chen    2023-10-25  204  		hwpt = &hwpt_paging->common;
b5021cb264e67b Nicolin Chen    2023-10-25  205  	} else {
b5021cb264e67b Nicolin Chen    2023-10-25  206  		rc = -EINVAL;
b5021cb264e67b Nicolin Chen    2023-10-25  207  		goto out_put_pt;
b5021cb264e67b Nicolin Chen    2023-10-25  208  	}
7074d7bd67d495 Jason Gunthorpe 2023-07-17  209  
7074d7bd67d495 Jason Gunthorpe 2023-07-17  210  	cmd->out_hwpt_id = hwpt->obj.id;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  211  	rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
7074d7bd67d495 Jason Gunthorpe 2023-07-17  212  	if (rc)
7074d7bd67d495 Jason Gunthorpe 2023-07-17  213  		goto out_hwpt;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  214  	iommufd_object_finalize(ucmd->ictx, &hwpt->obj);
7074d7bd67d495 Jason Gunthorpe 2023-07-17  215  	goto out_unlock;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  216  
7074d7bd67d495 Jason Gunthorpe 2023-07-17  217  out_hwpt:
7074d7bd67d495 Jason Gunthorpe 2023-07-17  218  	iommufd_object_abort_and_destroy(ucmd->ictx, &hwpt->obj);
7074d7bd67d495 Jason Gunthorpe 2023-07-17  219  out_unlock:
b5021cb264e67b Nicolin Chen    2023-10-25  220  	if (ioas)
7074d7bd67d495 Jason Gunthorpe 2023-07-17  221  		mutex_unlock(&ioas->mutex);
b5021cb264e67b Nicolin Chen    2023-10-25  222  out_put_pt:
b5021cb264e67b Nicolin Chen    2023-10-25  223  	iommufd_put_object(pt_obj);
7074d7bd67d495 Jason Gunthorpe 2023-07-17  224  out_put_idev:
7074d7bd67d495 Jason Gunthorpe 2023-07-17  225  	iommufd_put_object(&idev->obj);
7074d7bd67d495 Jason Gunthorpe 2023-07-17 @226  	return rc;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  227  }
e2a4b294784957 Joao Martins    2023-10-24  228  

:::::: The code at line 226 was first introduced by commit
:::::: 7074d7bd67d495cb3f6fe7c7c96b357a3b9d4ec2 iommufd: Add IOMMU_HWPT_ALLOC

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
