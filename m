Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5CF4B5C1
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Nov 2024 15:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732116979; cv=none; b=taM1eo97rsGuKZuE2QoxfQhehVM5Y+LPwdHbt0vr4gCr1/LYZuiUJwvokeYGeYbkjo49t8+ado873GGrjYtU4j6QegY1guD/FN+JbwPxCHTwm4KIcDrowxuisyLk7r4mjZFDHRcbNikgEyPhl0CjoSaX816+ygsjJ3E1WWzibDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732116979; c=relaxed/simple;
	bh=34SX+ppTuSnzXM6pgYRJwCI+lwnE6MaHOPAXN+5kHZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C1ZLJrYjRTJtKt3rnauW9L/jDNscjj8C51yjUA8emq7cYhG9saCar9AgOUhadsrNx9CL0hwo/F30qtdSSt+rLRSDs9YBoPJXARrBaRUNz4sR9tBWjM8zVpehjW6C8EYzofXQC/MIrUr+5ABk5ID4llbpnMu75HdUqyuo7hNDYdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UkzJLa2M; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UkzJLa2M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732116977; x=1763652977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=34SX+ppTuSnzXM6pgYRJwCI+lwnE6MaHOPAXN+5kHZQ=;
  b=UkzJLa2MKAEHFdjdh10NBc3GyW/ergfYTW8+xLSZzRBBZ+jNSMRWxDPH
   8xln+dpRDntTAIjh2kFCcNZvwhtz0jyztNnSgb9yhcFySGekQajSzs2R1
   ozH1udn85AMbuqQWRPUndtg8zo5Txh9zzmw4t7CsL9MKGazdkw3aJDsKM
   anxOobj2NuYdAIazn7LeWNVNaaqChqdXGhLhLDuSjh1aR3b6xkWJG/nTk
   RTDmBJY4mdhQ94Rl86bBOATA92XOaLpYKJaYXGTMuI6AuZ809KGlTBvNw
   drmUuMvQG2727ccrvgiStu4EM2wLdbCQQRV6frWt69g8hR2a9Is57Yrmz
   A==;
X-CSE-ConnectionGUID: o5XePIE/RT+DTC10HYW8kw==
X-CSE-MsgGUID: T026j0+OTDulC4INf53gbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="35044951"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="35044951"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 07:36:06 -0800
X-CSE-ConnectionGUID: EUQ3pfCiTOeWtu9a9kuKLQ==
X-CSE-MsgGUID: O0xPPUMnSzK1+rozpHRYZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="94012257"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Nov 2024 07:36:05 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDmkN-0000y5-0K;
	Wed, 20 Nov 2024 15:36:03 +0000
Date: Wed, 20 Nov 2024 23:35:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [jgunthorpe:fwctl 15/23] drivers/fwctl/mlx5/main.c:283:16-17:
 WARNING kvmalloc is used to allocate this memory at line 262
Message-ID: <202411202350.h8oi7ELB-lkp@intel.com>
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
CC: Jason Gunthorpe <jgg@ziepe.ca>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://github.com/jgunthorpe/linux fwctl
head:   e4450fb1459bf712009c7cb1461643287e0f9e75
commit: d93b0384d6d34af7521dad0473b2071a952584b3 [15/23] fwctl/mlx5: Support for communicating with mlx5 fw
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: sparc64-randconfig-r051-20241120 (https://download.01.org/0day-ci/archive/20241120/202411202350.h8oi7ELB-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411202350.h8oi7ELB-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/fwctl/mlx5/main.c:283:16-17: WARNING kvmalloc is used to allocate this memory at line 262

vim +283 drivers/fwctl/mlx5/main.c

d93b0384d6d34a Saeed Mahameed 2024-04-24  228  
d93b0384d6d34a Saeed Mahameed 2024-04-24  229  static void *mlx5ctl_fw_rpc(struct fwctl_uctx *uctx, enum fwctl_rpc_scope scope,
d93b0384d6d34a Saeed Mahameed 2024-04-24  230  			    void *rpc_in, size_t in_len, size_t *out_len)
d93b0384d6d34a Saeed Mahameed 2024-04-24  231  {
d93b0384d6d34a Saeed Mahameed 2024-04-24  232  	struct mlx5ctl_dev *mcdev =
d93b0384d6d34a Saeed Mahameed 2024-04-24  233  		container_of(uctx->fwctl, struct mlx5ctl_dev, fwctl);
d93b0384d6d34a Saeed Mahameed 2024-04-24  234  	struct mlx5ctl_uctx *mfd =
d93b0384d6d34a Saeed Mahameed 2024-04-24  235  		container_of(uctx, struct mlx5ctl_uctx, uctx);
d93b0384d6d34a Saeed Mahameed 2024-04-24  236  	void *rpc_out;
d93b0384d6d34a Saeed Mahameed 2024-04-24  237  	int ret;
d93b0384d6d34a Saeed Mahameed 2024-04-24  238  
d93b0384d6d34a Saeed Mahameed 2024-04-24  239  	if (in_len < MLX5_ST_SZ_BYTES(mbox_in_hdr) ||
d93b0384d6d34a Saeed Mahameed 2024-04-24  240  	    *out_len < MLX5_ST_SZ_BYTES(mbox_out_hdr))
d93b0384d6d34a Saeed Mahameed 2024-04-24  241  		return ERR_PTR(-EMSGSIZE);
d93b0384d6d34a Saeed Mahameed 2024-04-24  242  
d93b0384d6d34a Saeed Mahameed 2024-04-24  243  	/* FIXME: Requires device support for more scopes */
d93b0384d6d34a Saeed Mahameed 2024-04-24  244  	if (scope != FWCTL_RPC_CONFIGURATION &&
d93b0384d6d34a Saeed Mahameed 2024-04-24  245  	    scope != FWCTL_RPC_DEBUG_READ_ONLY)
d93b0384d6d34a Saeed Mahameed 2024-04-24  246  		return ERR_PTR(-EOPNOTSUPP);
d93b0384d6d34a Saeed Mahameed 2024-04-24  247  
d93b0384d6d34a Saeed Mahameed 2024-04-24  248  	mlx5ctl_dbg(mcdev, "[UID %d] cmdif: opcode 0x%x inlen %zu outlen %zu\n",
d93b0384d6d34a Saeed Mahameed 2024-04-24  249  		    mfd->uctx_uid, MLX5_GET(mbox_in_hdr, rpc_in, opcode),
d93b0384d6d34a Saeed Mahameed 2024-04-24  250  		    in_len, *out_len);
d93b0384d6d34a Saeed Mahameed 2024-04-24  251  
d93b0384d6d34a Saeed Mahameed 2024-04-24  252  	if (!mlx5ctl_validate_rpc(rpc_in, scope))
d93b0384d6d34a Saeed Mahameed 2024-04-24  253  		return ERR_PTR(-EBADMSG);
d93b0384d6d34a Saeed Mahameed 2024-04-24  254  
d93b0384d6d34a Saeed Mahameed 2024-04-24  255  	/*
d93b0384d6d34a Saeed Mahameed 2024-04-24  256  	 * mlx5_cmd_do() copies the input message to its own buffer before
d93b0384d6d34a Saeed Mahameed 2024-04-24  257  	 * executing it, so we can reuse the allocation for the output.
d93b0384d6d34a Saeed Mahameed 2024-04-24  258  	 */
d93b0384d6d34a Saeed Mahameed 2024-04-24  259  	if (*out_len <= in_len) {
d93b0384d6d34a Saeed Mahameed 2024-04-24  260  		rpc_out = rpc_in;
d93b0384d6d34a Saeed Mahameed 2024-04-24  261  	} else {
d93b0384d6d34a Saeed Mahameed 2024-04-24 @262  		rpc_out = kvzalloc(*out_len, GFP_KERNEL);
d93b0384d6d34a Saeed Mahameed 2024-04-24  263  		if (!rpc_out)
d93b0384d6d34a Saeed Mahameed 2024-04-24  264  			return ERR_PTR(-ENOMEM);
d93b0384d6d34a Saeed Mahameed 2024-04-24  265  	}
d93b0384d6d34a Saeed Mahameed 2024-04-24  266  
d93b0384d6d34a Saeed Mahameed 2024-04-24  267  	/* Enforce the user context for the command */
d93b0384d6d34a Saeed Mahameed 2024-04-24  268  	MLX5_SET(mbox_in_hdr, rpc_in, uid, mfd->uctx_uid);
d93b0384d6d34a Saeed Mahameed 2024-04-24  269  	ret = mlx5_cmd_do(mcdev->mdev, rpc_in, in_len, rpc_out, *out_len);
d93b0384d6d34a Saeed Mahameed 2024-04-24  270  
d93b0384d6d34a Saeed Mahameed 2024-04-24  271  	mlx5ctl_dbg(mcdev,
d93b0384d6d34a Saeed Mahameed 2024-04-24  272  		    "[UID %d] cmdif: opcode 0x%x status 0x%x retval %pe\n",
d93b0384d6d34a Saeed Mahameed 2024-04-24  273  		    mfd->uctx_uid, MLX5_GET(mbox_in_hdr, rpc_in, opcode),
d93b0384d6d34a Saeed Mahameed 2024-04-24  274  		    MLX5_GET(mbox_out_hdr, rpc_out, status), ERR_PTR(ret));
d93b0384d6d34a Saeed Mahameed 2024-04-24  275  
d93b0384d6d34a Saeed Mahameed 2024-04-24  276  	/*
d93b0384d6d34a Saeed Mahameed 2024-04-24  277  	 * -EREMOTEIO means execution succeeded and the out is valid,
d93b0384d6d34a Saeed Mahameed 2024-04-24  278  	 * but an error code was returned inside out. Everything else
d93b0384d6d34a Saeed Mahameed 2024-04-24  279  	 * means the RPC did not make it to the device.
d93b0384d6d34a Saeed Mahameed 2024-04-24  280  	 */
d93b0384d6d34a Saeed Mahameed 2024-04-24  281  	if (ret && ret != -EREMOTEIO) {
d93b0384d6d34a Saeed Mahameed 2024-04-24  282  		if (rpc_out != rpc_in)
d93b0384d6d34a Saeed Mahameed 2024-04-24 @283  			kfree(rpc_out);
d93b0384d6d34a Saeed Mahameed 2024-04-24  284  		return ERR_PTR(ret);
d93b0384d6d34a Saeed Mahameed 2024-04-24  285  	}
d93b0384d6d34a Saeed Mahameed 2024-04-24  286  	return rpc_out;
d93b0384d6d34a Saeed Mahameed 2024-04-24  287  }
d93b0384d6d34a Saeed Mahameed 2024-04-24  288  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
