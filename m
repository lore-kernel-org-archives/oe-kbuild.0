Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF671EB31
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Oct 2024 02:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729563567; cv=none; b=lSSOTw8w4+abpXjac3Pg2g+W2tTNcSm3lPZ2PrALiNhffq3QKIq6XmuRppXEtB3pUMsCEYWz9uLtZNdROZxFUCay4dE1HkT2zYFx/h84E4S2bWzg8+IS5Xf/ib4KTcr4eZUpJYRURINaLS2Q1748O0zf5wYHCKZzp8dLBsWR7NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729563567; c=relaxed/simple;
	bh=zvacXZGOjIqAYBWDpLnhPOJVF9y3KXuVwYZsLmHtFi0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hN4pfjsl2XCaJcOI2FyUGJQkNFI4Fab7ThJ241ux0MjWF3BkKOvN4/ZsIfKW4hjg81fuI89HwFOm/E5DLbj5XQQIDw7sfzbkn3yHflalCcYYCg0FmdWvhbCBvA1ldTqcZt37C1xzR8fHou4s9Mbm7OXTEAayOEsQjK23o7KKcpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hTGOUGya; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hTGOUGya"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729563565; x=1761099565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zvacXZGOjIqAYBWDpLnhPOJVF9y3KXuVwYZsLmHtFi0=;
  b=hTGOUGyasvRmesOHVREMYRTWkbj53Z1RIDMCa6rBq7Jv42OYlBdj/SM6
   h5dnltwsj8bsKhikWupXHArFuMZq5skkrT8O7LUOhQp28p3Mqn8Pxivle
   YpBS3Rz68wN0zzHJTCJa+vVMx1aSb3DWffNvEHpgW6QpdH7MFp1IqaVsD
   RyMdTpTG3ccSnSCv2Yg63b3f6N2Zv02DmlqdH79wTKWGtrcHqJ+60Y6I+
   gdNWIOKOObhV2EaaOf8GHGP7FDiIXRVu8b435P+Zc6iXvbD7q4LIUKYZe
   Ki331L2Wgy6aQ7Zduh3+oMi+czxbLBVSMOdAUWuUEmvb6scYJX6Rj34BU
   g==;
X-CSE-ConnectionGUID: IlwgG/WLRSeRc5g7/5T6Og==
X-CSE-MsgGUID: TUkdw9hoRp+gqLhJQOUDSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29173098"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="29173098"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 19:19:24 -0700
X-CSE-ConnectionGUID: Bt1Z/CR1RTKc6ywHo+O+dA==
X-CSE-MsgGUID: RUlMvSpYSeq0cyzydDJ0kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="79348531"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Oct 2024 19:08:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t34JY-000Sv8-0M;
	Tue, 22 Oct 2024 02:08:04 +0000
Date: Tue, 22 Oct 2024 10:07:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/iommu/iommufd/hw_pagetable.c:226:1-7: preceding lock on line
 197
Message-ID: <202410221009.PVaONXAs-lkp@intel.com>
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
head:   c2ee9f594da826bea183ed14f2cc029c719bf4da
commit: b5021cb264e67baf051569a41debe277c279952b iommufd: Share iommufd_hwpt_alloc with IOMMUFD_OBJ_HWPT_NESTED
date:   12 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 12 months ago
config: s390-randconfig-r062-20241022 (https://download.01.org/0day-ci/archive/20241022/202410221009.PVaONXAs-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410221009.PVaONXAs-lkp@intel.com/

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
