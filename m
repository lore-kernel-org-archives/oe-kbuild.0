Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A01B1EB3D
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Sep 2024 05:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725601710; cv=none; b=FPmbdO/9EWzqHV1vlnkoomwcDcU8+ncY1RXP7myJdR4AKDxbIZx6Y81oEwaZpbmaX079J2WZzx2x1QtqG7go4BeNrEmKz+f9dWk1YOxfIu6/ntbWwf/nFlErmT2uC6jbgWbDp/+/wuhwOXX+6PNY624VA42qPiWJXLu4/bdg21c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725601710; c=relaxed/simple;
	bh=F7yBD4T1GnLrY+zQ5JdDGJ99A2cApAtI9RJJ4v5RBKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yg6zA/L6Z60VpE9wFdWVcLNrBqaRwypj//n/TuCCCNw77ipKNa362+fTq1PhIXnnBZmiXV+oF2gL54PkIoG9EssTjmz3z2wn3xCwyKC6n+6bnsvtnqjKmeaXhGzbHRrbzLCMin+O/z9fbxa5ozUJ6NtWCJ86sFLV7an2HZRp3+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jC2xSEnS; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jC2xSEnS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725601708; x=1757137708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F7yBD4T1GnLrY+zQ5JdDGJ99A2cApAtI9RJJ4v5RBKQ=;
  b=jC2xSEnSoWSqzEW6y/l6r9Tviem7bvzcAflFukfBClhsaiiaAysok3zo
   eIww4rf8yhMt/6aibA6M4KTR5W5tsFK5lsyhryI2/HWG00WrrK+z1FdIJ
   k3u1WWHQDMxOPmTo/Zt5xfJbt97mhxCEYn2Yod/ykiJdlRuVhwMwgaNGr
   vi6PqnGVbNra6udddpW+INM0i/um4VVHwe38op6ydBbVrt7WcqgtEbzCB
   BRBS+GNvhAmld7o+lWjfkJOI1y4fjF0fpYmveIBBLTYYcXnioClguhE70
   75opsKoBjq+xH9kYYDCCWCwQd0pgTiZqjwdxl8sHYn7vDLVDabQBXo6CG
   w==;
X-CSE-ConnectionGUID: AZ5JohCzSuelqQaK5a5uYA==
X-CSE-MsgGUID: y4Ov0AIOSbK0CPjuRLu3+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24216757"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="24216757"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 22:48:28 -0700
X-CSE-ConnectionGUID: 1IkCkrpTSHKlo3uE27zosQ==
X-CSE-MsgGUID: EJvnQRFESNu7BoYTy5/fKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="65899075"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Sep 2024 22:48:26 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smRpY-000Aix-1T;
	Fri, 06 Sep 2024 05:48:24 +0000
Date: Fri, 6 Sep 2024 13:48:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [agd5f:drm-next 62/72] drivers/gpu/drm/amd/amdgpu/mes_v11_0.c:417
 mes_v11_0_reset_queue_mmio() warn: if statement not indented
Message-ID: <202409061339.LRi6Ti5b-lkp@intel.com>
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
TO: Jiadong Zhu <Jiadong.Zhu@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   7a199557643e993d4e7357860624b8aa5d8f4340
commit: 178ad0e280c088f5abfa61793cb992fa120d1830 [62/72] drm/amdgpu/mes11: implement mmio queue reset for gfx11
:::::: branch date: 11 hours ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20240905 (https://download.01.org/0day-ci/archive/20240906/202409061339.LRi6Ti5b-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409061339.LRi6Ti5b-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/mes_v11_0.c:417 mes_v11_0_reset_queue_mmio() warn: if statement not indented

vim +417 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c

028c3fb37e705b8 Jack Xiao   2022-04-13  363  
178ad0e280c088f Jiadong Zhu 2024-07-04  364  static int mes_v11_0_reset_queue_mmio(struct amdgpu_mes *mes, uint32_t queue_type,
178ad0e280c088f Jiadong Zhu 2024-07-04  365  				      uint32_t me_id, uint32_t pipe_id,
178ad0e280c088f Jiadong Zhu 2024-07-04  366  				      uint32_t queue_id, uint32_t vmid)
178ad0e280c088f Jiadong Zhu 2024-07-04  367  {
178ad0e280c088f Jiadong Zhu 2024-07-04  368  	struct amdgpu_device *adev = mes->adev;
178ad0e280c088f Jiadong Zhu 2024-07-04  369  	uint32_t value;
178ad0e280c088f Jiadong Zhu 2024-07-04  370  	int i, r = 0;
178ad0e280c088f Jiadong Zhu 2024-07-04  371  
178ad0e280c088f Jiadong Zhu 2024-07-04  372  	amdgpu_gfx_rlc_enter_safe_mode(adev, 0);
178ad0e280c088f Jiadong Zhu 2024-07-04  373  
178ad0e280c088f Jiadong Zhu 2024-07-04  374  	if (queue_type == AMDGPU_RING_TYPE_GFX) {
178ad0e280c088f Jiadong Zhu 2024-07-04  375  		dev_info(adev->dev, "reset gfx queue (%d:%d:%d: vmid:%d)\n",
178ad0e280c088f Jiadong Zhu 2024-07-04  376  			 me_id, pipe_id, queue_id, vmid);
178ad0e280c088f Jiadong Zhu 2024-07-04  377  
178ad0e280c088f Jiadong Zhu 2024-07-04  378  		mutex_lock(&adev->gfx.reset_sem_mutex);
178ad0e280c088f Jiadong Zhu 2024-07-04  379  		gfx_v11_0_request_gfx_index_mutex(adev, true);
178ad0e280c088f Jiadong Zhu 2024-07-04  380  		/* all se allow writes */
178ad0e280c088f Jiadong Zhu 2024-07-04  381  		WREG32_SOC15(GC, 0, regGRBM_GFX_INDEX,
178ad0e280c088f Jiadong Zhu 2024-07-04  382  			     (uint32_t)(0x1 << GRBM_GFX_INDEX__SE_BROADCAST_WRITES__SHIFT));
178ad0e280c088f Jiadong Zhu 2024-07-04  383  		value = REG_SET_FIELD(0, CP_VMID_RESET, RESET_REQUEST, 1 << vmid);
178ad0e280c088f Jiadong Zhu 2024-07-04  384  		if (pipe_id == 0)
178ad0e280c088f Jiadong Zhu 2024-07-04  385  			value = REG_SET_FIELD(value, CP_VMID_RESET, PIPE0_QUEUES, 1 << queue_id);
178ad0e280c088f Jiadong Zhu 2024-07-04  386  		else
178ad0e280c088f Jiadong Zhu 2024-07-04  387  			value = REG_SET_FIELD(value, CP_VMID_RESET, PIPE1_QUEUES, 1 << queue_id);
178ad0e280c088f Jiadong Zhu 2024-07-04  388  		WREG32_SOC15(GC, 0, regCP_VMID_RESET, value);
178ad0e280c088f Jiadong Zhu 2024-07-04  389  		gfx_v11_0_request_gfx_index_mutex(adev, false);
178ad0e280c088f Jiadong Zhu 2024-07-04  390  		mutex_unlock(&adev->gfx.reset_sem_mutex);
178ad0e280c088f Jiadong Zhu 2024-07-04  391  
178ad0e280c088f Jiadong Zhu 2024-07-04  392  		mutex_lock(&adev->srbm_mutex);
178ad0e280c088f Jiadong Zhu 2024-07-04  393  		soc21_grbm_select(adev, me_id, pipe_id, queue_id, 0);
178ad0e280c088f Jiadong Zhu 2024-07-04  394  		/* wait till dequeue take effects */
178ad0e280c088f Jiadong Zhu 2024-07-04  395  		for (i = 0; i < adev->usec_timeout; i++) {
178ad0e280c088f Jiadong Zhu 2024-07-04  396  			if (!(RREG32_SOC15(GC, 0, regCP_GFX_HQD_ACTIVE) & 1))
178ad0e280c088f Jiadong Zhu 2024-07-04  397  				break;
178ad0e280c088f Jiadong Zhu 2024-07-04  398  			udelay(1);
178ad0e280c088f Jiadong Zhu 2024-07-04  399  		}
178ad0e280c088f Jiadong Zhu 2024-07-04  400  		if (i >= adev->usec_timeout) {
178ad0e280c088f Jiadong Zhu 2024-07-04  401  			dev_err(adev->dev, "failed to wait on gfx hqd deactivate\n");
178ad0e280c088f Jiadong Zhu 2024-07-04  402  			r = -ETIMEDOUT;
178ad0e280c088f Jiadong Zhu 2024-07-04  403  		}
178ad0e280c088f Jiadong Zhu 2024-07-04  404  
178ad0e280c088f Jiadong Zhu 2024-07-04  405  		soc21_grbm_select(adev, 0, 0, 0, 0);
178ad0e280c088f Jiadong Zhu 2024-07-04  406  		mutex_unlock(&adev->srbm_mutex);
178ad0e280c088f Jiadong Zhu 2024-07-04  407  	} else if (queue_type == AMDGPU_RING_TYPE_COMPUTE) {
178ad0e280c088f Jiadong Zhu 2024-07-04  408  		dev_info(adev->dev, "reset compute queue (%d:%d:%d)\n",
178ad0e280c088f Jiadong Zhu 2024-07-04  409  			 me_id, pipe_id, queue_id);
178ad0e280c088f Jiadong Zhu 2024-07-04  410  		mutex_lock(&adev->srbm_mutex);
178ad0e280c088f Jiadong Zhu 2024-07-04  411  		soc21_grbm_select(adev, me_id, pipe_id, queue_id, 0);
178ad0e280c088f Jiadong Zhu 2024-07-04  412  		WREG32_SOC15(GC, 0, regCP_HQD_DEQUEUE_REQUEST, 0x2);
178ad0e280c088f Jiadong Zhu 2024-07-04  413  		WREG32_SOC15(GC, 0, regSPI_COMPUTE_QUEUE_RESET, 0x1);
178ad0e280c088f Jiadong Zhu 2024-07-04  414  
178ad0e280c088f Jiadong Zhu 2024-07-04  415  		/* wait till dequeue take effects */
178ad0e280c088f Jiadong Zhu 2024-07-04  416  		for (i = 0; i < adev->usec_timeout; i++) {
178ad0e280c088f Jiadong Zhu 2024-07-04 @417  			if (!(RREG32_SOC15(GC, 0, regCP_HQD_ACTIVE) & 1))
178ad0e280c088f Jiadong Zhu 2024-07-04  418  			break;
178ad0e280c088f Jiadong Zhu 2024-07-04  419  			udelay(1);
178ad0e280c088f Jiadong Zhu 2024-07-04  420  		}
178ad0e280c088f Jiadong Zhu 2024-07-04  421  		if (i >= adev->usec_timeout) {
178ad0e280c088f Jiadong Zhu 2024-07-04  422  			dev_err(adev->dev, "failed to wait on hqd deactivate\n");
178ad0e280c088f Jiadong Zhu 2024-07-04  423  			r = -ETIMEDOUT;
178ad0e280c088f Jiadong Zhu 2024-07-04  424  		}
178ad0e280c088f Jiadong Zhu 2024-07-04  425  		soc21_grbm_select(adev, 0, 0, 0, 0);
178ad0e280c088f Jiadong Zhu 2024-07-04  426  		mutex_unlock(&adev->srbm_mutex);
178ad0e280c088f Jiadong Zhu 2024-07-04  427  	}
178ad0e280c088f Jiadong Zhu 2024-07-04  428  
178ad0e280c088f Jiadong Zhu 2024-07-04  429  	amdgpu_gfx_rlc_exit_safe_mode(adev, 0);
178ad0e280c088f Jiadong Zhu 2024-07-04  430  	return r;
178ad0e280c088f Jiadong Zhu 2024-07-04  431  }
178ad0e280c088f Jiadong Zhu 2024-07-04  432  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
