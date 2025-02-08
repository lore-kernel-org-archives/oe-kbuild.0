Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02AD4437A
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Feb 2025 06:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738995856; cv=none; b=JnMyWFz/aY97Trf8uUFvIEBli+BzF2xi18iB0/nX6Da4SP7xpYGyEo5LE2c9//XPps73kDYt5922sQdnZyUcmdLSU0Vfh3aJML2vYGBFikjw3RPtnUf+FF/ViMkmPC3DwbEecTb+uf/nLYAFlPt6dGnhoqA/BREqbkKmZNEUa/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738995856; c=relaxed/simple;
	bh=Cn76rHTO/2TtZLx7KPTICw+jP+LE+aP/92nR6ZfoAJc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eYYgusL1CsGUkojQ6kinJ0YR0ESVZS6oyMTyICbuHlQM79HX9MtqjeuUWrqg+zn3RU70isP4m6AsDUGkLJ6L1l11Ou1HniLvxjNco0bIcDqlUrH3RzcAwPz6mXG+C5dH/dG8WmEabiFNXQKDtD99d3A4Dt8B5EiJ0tkOWZtzX9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OeefOg8R; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OeefOg8R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738995855; x=1770531855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cn76rHTO/2TtZLx7KPTICw+jP+LE+aP/92nR6ZfoAJc=;
  b=OeefOg8RviWD0W4JFO9ArzeohJCelqAMFMzOEEKp2ynsv64qAfDi2f9k
   pPjLdRAXhrzYwmx1UPcPVruXEHW2tVrfOJqC6dsFyL1/KX1hY9TzwoKmL
   m2K/Uq7ZjUZCLEnhIu91VCQbaLESNVte8GtPcXKYRpmDKVtwI9W7VxaYE
   dM6Vr4nWhuOvR6Yr3BtCzJQWd+83z6jEx5cRc17PetWuveVyCkn3opY0f
   pnFaSBHhOmaBu88L9tsAt7JyDnuhjHZf1cPF0wbBrIkGPZuhKcberAoPW
   jZcPkvv5BVJvBFVnTbU2LSIxBwkcDwy4DRBMppFvvt0OJ3EvBJFtt4dX7
   Q==;
X-CSE-ConnectionGUID: ICEBOIMKTDiVxh3iBZ5lrg==
X-CSE-MsgGUID: wHg2F7wuTHC1GwOfkWWCMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="62116110"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="62116110"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 22:24:14 -0800
X-CSE-ConnectionGUID: p0pAD3ZlQ0C0c+c3ubhmWA==
X-CSE-MsgGUID: PZQgXw2SQNOPbUrEcUwaaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="116725335"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Feb 2025 22:24:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgeG9-000zeB-1k;
	Sat, 08 Feb 2025 06:24:09 +0000
Date: Sat, 8 Feb 2025 14:23:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [djiang:cxl/fwctl 8/26] drivers/fwctl/mlx5/main.c:277:16-17: WARNING
 kvmalloc is used to allocate this memory at line 256
Message-ID: <202502081426.rdLK0kD9-lkp@intel.com>
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
TO: Saeed Mahameed <saeedm@nvidia.com>
CC: Dave Jiang <dave.jiang@intel.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   2ad713178275250c08fd3df6682dff12d01ff33c
commit: 57f4835341028d751c1e25fef0d8978cc19bb1d9 [8/26] fwctl/mlx5: Support for communicating with mlx5 fw
:::::: branch date: 7 hours ago
:::::: commit date: 15 hours ago
config: s390-randconfig-r064-20250208 (https://download.01.org/0day-ci/archive/20250208/202502081426.rdLK0kD9-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202502081426.rdLK0kD9-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/fwctl/mlx5/main.c:277:16-17: WARNING kvmalloc is used to allocate this memory at line 256

vim +277 drivers/fwctl/mlx5/main.c

57f4835341028d Saeed Mahameed 2025-02-06  227  
57f4835341028d Saeed Mahameed 2025-02-06  228  static void *mlx5ctl_fw_rpc(struct fwctl_uctx *uctx, enum fwctl_rpc_scope scope,
57f4835341028d Saeed Mahameed 2025-02-06  229  			    void *rpc_in, size_t in_len, size_t *out_len)
57f4835341028d Saeed Mahameed 2025-02-06  230  {
57f4835341028d Saeed Mahameed 2025-02-06  231  	struct mlx5ctl_dev *mcdev =
57f4835341028d Saeed Mahameed 2025-02-06  232  		container_of(uctx->fwctl, struct mlx5ctl_dev, fwctl);
57f4835341028d Saeed Mahameed 2025-02-06  233  	struct mlx5ctl_uctx *mfd =
57f4835341028d Saeed Mahameed 2025-02-06  234  		container_of(uctx, struct mlx5ctl_uctx, uctx);
57f4835341028d Saeed Mahameed 2025-02-06  235  	void *rpc_out;
57f4835341028d Saeed Mahameed 2025-02-06  236  	int ret;
57f4835341028d Saeed Mahameed 2025-02-06  237  
57f4835341028d Saeed Mahameed 2025-02-06  238  	if (in_len < MLX5_ST_SZ_BYTES(mbox_in_hdr) ||
57f4835341028d Saeed Mahameed 2025-02-06  239  	    *out_len < MLX5_ST_SZ_BYTES(mbox_out_hdr))
57f4835341028d Saeed Mahameed 2025-02-06  240  		return ERR_PTR(-EMSGSIZE);
57f4835341028d Saeed Mahameed 2025-02-06  241  
57f4835341028d Saeed Mahameed 2025-02-06  242  	mlx5ctl_dbg(mcdev, "[UID %d] cmdif: opcode 0x%x inlen %zu outlen %zu\n",
57f4835341028d Saeed Mahameed 2025-02-06  243  		    mfd->uctx_uid, MLX5_GET(mbox_in_hdr, rpc_in, opcode),
57f4835341028d Saeed Mahameed 2025-02-06  244  		    in_len, *out_len);
57f4835341028d Saeed Mahameed 2025-02-06  245  
57f4835341028d Saeed Mahameed 2025-02-06  246  	if (!mlx5ctl_validate_rpc(rpc_in, scope))
57f4835341028d Saeed Mahameed 2025-02-06  247  		return ERR_PTR(-EBADMSG);
57f4835341028d Saeed Mahameed 2025-02-06  248  
57f4835341028d Saeed Mahameed 2025-02-06  249  	/*
57f4835341028d Saeed Mahameed 2025-02-06  250  	 * mlx5_cmd_do() copies the input message to its own buffer before
57f4835341028d Saeed Mahameed 2025-02-06  251  	 * executing it, so we can reuse the allocation for the output.
57f4835341028d Saeed Mahameed 2025-02-06  252  	 */
57f4835341028d Saeed Mahameed 2025-02-06  253  	if (*out_len <= in_len) {
57f4835341028d Saeed Mahameed 2025-02-06  254  		rpc_out = rpc_in;
57f4835341028d Saeed Mahameed 2025-02-06  255  	} else {
57f4835341028d Saeed Mahameed 2025-02-06 @256  		rpc_out = kvzalloc(*out_len, GFP_KERNEL);
57f4835341028d Saeed Mahameed 2025-02-06  257  		if (!rpc_out)
57f4835341028d Saeed Mahameed 2025-02-06  258  			return ERR_PTR(-ENOMEM);
57f4835341028d Saeed Mahameed 2025-02-06  259  	}
57f4835341028d Saeed Mahameed 2025-02-06  260  
57f4835341028d Saeed Mahameed 2025-02-06  261  	/* Enforce the user context for the command */
57f4835341028d Saeed Mahameed 2025-02-06  262  	MLX5_SET(mbox_in_hdr, rpc_in, uid, mfd->uctx_uid);
57f4835341028d Saeed Mahameed 2025-02-06  263  	ret = mlx5_cmd_do(mcdev->mdev, rpc_in, in_len, rpc_out, *out_len);
57f4835341028d Saeed Mahameed 2025-02-06  264  
57f4835341028d Saeed Mahameed 2025-02-06  265  	mlx5ctl_dbg(mcdev,
57f4835341028d Saeed Mahameed 2025-02-06  266  		    "[UID %d] cmdif: opcode 0x%x status 0x%x retval %pe\n",
57f4835341028d Saeed Mahameed 2025-02-06  267  		    mfd->uctx_uid, MLX5_GET(mbox_in_hdr, rpc_in, opcode),
57f4835341028d Saeed Mahameed 2025-02-06  268  		    MLX5_GET(mbox_out_hdr, rpc_out, status), ERR_PTR(ret));
57f4835341028d Saeed Mahameed 2025-02-06  269  
57f4835341028d Saeed Mahameed 2025-02-06  270  	/*
57f4835341028d Saeed Mahameed 2025-02-06  271  	 * -EREMOTEIO means execution succeeded and the out is valid,
57f4835341028d Saeed Mahameed 2025-02-06  272  	 * but an error code was returned inside out. Everything else
57f4835341028d Saeed Mahameed 2025-02-06  273  	 * means the RPC did not make it to the device.
57f4835341028d Saeed Mahameed 2025-02-06  274  	 */
57f4835341028d Saeed Mahameed 2025-02-06  275  	if (ret && ret != -EREMOTEIO) {
57f4835341028d Saeed Mahameed 2025-02-06  276  		if (rpc_out != rpc_in)
57f4835341028d Saeed Mahameed 2025-02-06 @277  			kfree(rpc_out);
57f4835341028d Saeed Mahameed 2025-02-06  278  		return ERR_PTR(ret);
57f4835341028d Saeed Mahameed 2025-02-06  279  	}
57f4835341028d Saeed Mahameed 2025-02-06  280  	return rpc_out;
57f4835341028d Saeed Mahameed 2025-02-06  281  }
57f4835341028d Saeed Mahameed 2025-02-06  282  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
