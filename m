Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C79112E57
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Oct 2023 21:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VpBrgFXH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698787475; x=1730323475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CTmYw6i6YguKvv9QtqqUtdzZcLeBxe5rQgJxj6Hi8Vw=;
  b=VpBrgFXHb8RiV5aVozmHlndrSBi02ftZwl9aCqqH99gvi8v5GIAQKm7v
   WJ5TxlopMxc9zIQO1V5kErIH0HcRA2Qn4RXQ9G1kcbBbc0SH+AqxG6+eD
   3TmNLVAHcrLt8lTUUI8OPOjnuc52YmOWkkmr9m9RBKsxoMHvAUe4Za/78
   neQ5xrDFZX+NfBaFGeA0SSU60dVZ4KAjHrtVFDyizvuUD2Pjgb8l+9tMm
   uZLRJQ7RC3n6JBUqdtnISRbMgfDurkhaUkXSYHqblac6x9k096imhPAJb
   81bv09mEfEqLklyz6G72leh/i1Y2/4tbkmNoDYvFkIGwMtIVkZzpOgwVg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="385557307"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="385557307"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 14:24:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="934242430"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="934242430"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 31 Oct 2023 14:24:31 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxwDt-0000Oe-0Q;
	Tue, 31 Oct 2023 21:24:29 +0000
Date: Wed, 1 Nov 2023 05:23:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:999 vcn_v4_0_start_dpg_mode()
 warn: Function too hairy.  No more merges.
Message-ID: <202311010519.GHDVfXnC-lkp@intel.com>
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
TO: Lijo Lazar <lijo.lazar@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5a6a09e97199d6600d31383055f9d43fbbcbe86f
commit: fd91d38b5275959a5b0804d4b4dbc5a4c0a8aac9 drm/amdgpu: Use logical ids for VCN/JPEG v4.0.3
date:   5 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-141-20231031 (https://download.01.org/0day-ci/archive/20231101/202311010519.GHDVfXnC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231101/202311010519.GHDVfXnC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311010519.GHDVfXnC-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:999 vcn_v4_0_start_dpg_mode() warn: Function too hairy.  No more merges.

vim +999 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c

0422c34c7d1e1d Tao Zhou     2022-11-29   894  
8da1170a16e4d4 Leo Liu      2022-04-13   895  /**
8da1170a16e4d4 Leo Liu      2022-04-13   896   * vcn_v4_0_start_dpg_mode - VCN start with dpg mode
8da1170a16e4d4 Leo Liu      2022-04-13   897   *
8da1170a16e4d4 Leo Liu      2022-04-13   898   * @adev: amdgpu_device pointer
8da1170a16e4d4 Leo Liu      2022-04-13   899   * @inst_idx: instance number index
8da1170a16e4d4 Leo Liu      2022-04-13   900   * @indirect: indirectly write sram
8da1170a16e4d4 Leo Liu      2022-04-13   901   *
8da1170a16e4d4 Leo Liu      2022-04-13   902   * Start VCN block with dpg mode
8da1170a16e4d4 Leo Liu      2022-04-13   903   */
8da1170a16e4d4 Leo Liu      2022-04-13   904  static int vcn_v4_0_start_dpg_mode(struct amdgpu_device *adev, int inst_idx, bool indirect)
8da1170a16e4d4 Leo Liu      2022-04-13   905  {
8da1170a16e4d4 Leo Liu      2022-04-13   906  	volatile struct amdgpu_vcn4_fw_shared *fw_shared = adev->vcn.inst[inst_idx].fw_shared.cpu_addr;
8da1170a16e4d4 Leo Liu      2022-04-13   907  	struct amdgpu_ring *ring;
8da1170a16e4d4 Leo Liu      2022-04-13   908  	uint32_t tmp;
8da1170a16e4d4 Leo Liu      2022-04-13   909  
8da1170a16e4d4 Leo Liu      2022-04-13   910  	/* disable register anti-hang mechanism */
8da1170a16e4d4 Leo Liu      2022-04-13   911  	WREG32_P(SOC15_REG_OFFSET(VCN, inst_idx, regUVD_POWER_STATUS), 1,
8da1170a16e4d4 Leo Liu      2022-04-13   912  		~UVD_POWER_STATUS__UVD_POWER_STATUS_MASK);
8da1170a16e4d4 Leo Liu      2022-04-13   913  	/* enable dynamic power gating mode */
8da1170a16e4d4 Leo Liu      2022-04-13   914  	tmp = RREG32_SOC15(VCN, inst_idx, regUVD_POWER_STATUS);
8da1170a16e4d4 Leo Liu      2022-04-13   915  	tmp |= UVD_POWER_STATUS__UVD_PG_MODE_MASK;
8da1170a16e4d4 Leo Liu      2022-04-13   916  	tmp |= UVD_POWER_STATUS__UVD_PG_EN_MASK;
8da1170a16e4d4 Leo Liu      2022-04-13   917  	WREG32_SOC15(VCN, inst_idx, regUVD_POWER_STATUS, tmp);
8da1170a16e4d4 Leo Liu      2022-04-13   918  
8da1170a16e4d4 Leo Liu      2022-04-13   919  	if (indirect)
8da1170a16e4d4 Leo Liu      2022-04-13   920  		adev->vcn.inst[inst_idx].dpg_sram_curr_addr = (uint32_t *)adev->vcn.inst[inst_idx].dpg_sram_cpu_addr;
8da1170a16e4d4 Leo Liu      2022-04-13   921  
8da1170a16e4d4 Leo Liu      2022-04-13   922  	/* enable clock gating */
8da1170a16e4d4 Leo Liu      2022-04-13   923  	vcn_v4_0_disable_clock_gating_dpg_mode(adev, 0, inst_idx, indirect);
8da1170a16e4d4 Leo Liu      2022-04-13   924  
8da1170a16e4d4 Leo Liu      2022-04-13   925  	/* enable VCPU clock */
8da1170a16e4d4 Leo Liu      2022-04-13   926  	tmp = (0xFF << UVD_VCPU_CNTL__PRB_TIMEOUT_VAL__SHIFT);
8da1170a16e4d4 Leo Liu      2022-04-13   927  	tmp |= UVD_VCPU_CNTL__CLK_EN_MASK | UVD_VCPU_CNTL__BLK_RST_MASK;
8da1170a16e4d4 Leo Liu      2022-04-13   928  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
8da1170a16e4d4 Leo Liu      2022-04-13   929  		VCN, inst_idx, regUVD_VCPU_CNTL), tmp, 0, indirect);
8da1170a16e4d4 Leo Liu      2022-04-13   930  
8da1170a16e4d4 Leo Liu      2022-04-13   931  	/* disable master interupt */
8da1170a16e4d4 Leo Liu      2022-04-13   932  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
8da1170a16e4d4 Leo Liu      2022-04-13   933  		VCN, inst_idx, regUVD_MASTINT_EN), 0, 0, indirect);
8da1170a16e4d4 Leo Liu      2022-04-13   934  
8da1170a16e4d4 Leo Liu      2022-04-13   935  	/* setup regUVD_LMI_CTRL */
8da1170a16e4d4 Leo Liu      2022-04-13   936  	tmp = (UVD_LMI_CTRL__WRITE_CLEAN_TIMER_EN_MASK |
8da1170a16e4d4 Leo Liu      2022-04-13   937  		UVD_LMI_CTRL__REQ_MODE_MASK |
8da1170a16e4d4 Leo Liu      2022-04-13   938  		UVD_LMI_CTRL__CRC_RESET_MASK |
8da1170a16e4d4 Leo Liu      2022-04-13   939  		UVD_LMI_CTRL__MASK_MC_URGENT_MASK |
8da1170a16e4d4 Leo Liu      2022-04-13   940  		UVD_LMI_CTRL__DATA_COHERENCY_EN_MASK |
8da1170a16e4d4 Leo Liu      2022-04-13   941  		UVD_LMI_CTRL__VCPU_DATA_COHERENCY_EN_MASK |
8da1170a16e4d4 Leo Liu      2022-04-13   942  		(8 << UVD_LMI_CTRL__WRITE_CLEAN_TIMER__SHIFT) |
8da1170a16e4d4 Leo Liu      2022-04-13   943  		0x00100000L);
8da1170a16e4d4 Leo Liu      2022-04-13   944  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
8da1170a16e4d4 Leo Liu      2022-04-13   945  		VCN, inst_idx, regUVD_LMI_CTRL), tmp, 0, indirect);
8da1170a16e4d4 Leo Liu      2022-04-13   946  
8da1170a16e4d4 Leo Liu      2022-04-13   947  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
8da1170a16e4d4 Leo Liu      2022-04-13   948  		VCN, inst_idx, regUVD_MPC_CNTL),
8da1170a16e4d4 Leo Liu      2022-04-13   949  		0x2 << UVD_MPC_CNTL__REPLACEMENT_MODE__SHIFT, 0, indirect);
8da1170a16e4d4 Leo Liu      2022-04-13   950  
8da1170a16e4d4 Leo Liu      2022-04-13   951  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
8da1170a16e4d4 Leo Liu      2022-04-13   952  		VCN, inst_idx, regUVD_MPC_SET_MUXA0),
8da1170a16e4d4 Leo Liu      2022-04-13   953  		((0x1 << UVD_MPC_SET_MUXA0__VARA_1__SHIFT) |
8da1170a16e4d4 Leo Liu      2022-04-13   954  		 (0x2 << UVD_MPC_SET_MUXA0__VARA_2__SHIFT) |
8da1170a16e4d4 Leo Liu      2022-04-13   955  		 (0x3 << UVD_MPC_SET_MUXA0__VARA_3__SHIFT) |
8da1170a16e4d4 Leo Liu      2022-04-13   956  		 (0x4 << UVD_MPC_SET_MUXA0__VARA_4__SHIFT)), 0, indirect);
8da1170a16e4d4 Leo Liu      2022-04-13   957  
8da1170a16e4d4 Leo Liu      2022-04-13   958  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
8da1170a16e4d4 Leo Liu      2022-04-13   959  		VCN, inst_idx, regUVD_MPC_SET_MUXB0),
8da1170a16e4d4 Leo Liu      2022-04-13   960  		 ((0x1 << UVD_MPC_SET_MUXB0__VARB_1__SHIFT) |
8da1170a16e4d4 Leo Liu      2022-04-13   961  		 (0x2 << UVD_MPC_SET_MUXB0__VARB_2__SHIFT) |
8da1170a16e4d4 Leo Liu      2022-04-13   962  		 (0x3 << UVD_MPC_SET_MUXB0__VARB_3__SHIFT) |
8da1170a16e4d4 Leo Liu      2022-04-13   963  		 (0x4 << UVD_MPC_SET_MUXB0__VARB_4__SHIFT)), 0, indirect);
8da1170a16e4d4 Leo Liu      2022-04-13   964  
8da1170a16e4d4 Leo Liu      2022-04-13   965  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
8da1170a16e4d4 Leo Liu      2022-04-13   966  		VCN, inst_idx, regUVD_MPC_SET_MUX),
8da1170a16e4d4 Leo Liu      2022-04-13   967  		((0x0 << UVD_MPC_SET_MUX__SET_0__SHIFT) |
8da1170a16e4d4 Leo Liu      2022-04-13   968  		 (0x1 << UVD_MPC_SET_MUX__SET_1__SHIFT) |
8da1170a16e4d4 Leo Liu      2022-04-13   969  		 (0x2 << UVD_MPC_SET_MUX__SET_2__SHIFT)), 0, indirect);
8da1170a16e4d4 Leo Liu      2022-04-13   970  
8da1170a16e4d4 Leo Liu      2022-04-13   971  	vcn_v4_0_mc_resume_dpg_mode(adev, inst_idx, indirect);
8da1170a16e4d4 Leo Liu      2022-04-13   972  
8da1170a16e4d4 Leo Liu      2022-04-13   973  	tmp = (0xFF << UVD_VCPU_CNTL__PRB_TIMEOUT_VAL__SHIFT);
8da1170a16e4d4 Leo Liu      2022-04-13   974  	tmp |= UVD_VCPU_CNTL__CLK_EN_MASK;
8da1170a16e4d4 Leo Liu      2022-04-13   975  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
8da1170a16e4d4 Leo Liu      2022-04-13   976  		VCN, inst_idx, regUVD_VCPU_CNTL), tmp, 0, indirect);
8da1170a16e4d4 Leo Liu      2022-04-13   977  
8da1170a16e4d4 Leo Liu      2022-04-13   978  	/* enable LMI MC and UMC channels */
8da1170a16e4d4 Leo Liu      2022-04-13   979  	tmp = 0x1f << UVD_LMI_CTRL2__RE_OFLD_MIF_WR_REQ_NUM__SHIFT;
8da1170a16e4d4 Leo Liu      2022-04-13   980  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
8da1170a16e4d4 Leo Liu      2022-04-13   981  		VCN, inst_idx, regUVD_LMI_CTRL2), tmp, 0, indirect);
8da1170a16e4d4 Leo Liu      2022-04-13   982  
0422c34c7d1e1d Tao Zhou     2022-11-29   983  	vcn_v4_0_enable_ras(adev, inst_idx, indirect);
0422c34c7d1e1d Tao Zhou     2022-11-29   984  
8da1170a16e4d4 Leo Liu      2022-04-13   985  	/* enable master interrupt */
8da1170a16e4d4 Leo Liu      2022-04-13   986  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
8da1170a16e4d4 Leo Liu      2022-04-13   987  		VCN, inst_idx, regUVD_MASTINT_EN),
8da1170a16e4d4 Leo Liu      2022-04-13   988  		UVD_MASTINT_EN__VCPU_EN_MASK, 0, indirect);
8da1170a16e4d4 Leo Liu      2022-04-13   989  
8da1170a16e4d4 Leo Liu      2022-04-13   990  
8da1170a16e4d4 Leo Liu      2022-04-13   991  	if (indirect)
8da1170a16e4d4 Leo Liu      2022-04-13   992  		psp_update_vcn_sram(adev, inst_idx, adev->vcn.inst[inst_idx].dpg_sram_gpu_addr,
8da1170a16e4d4 Leo Liu      2022-04-13   993  			(uint32_t)((uintptr_t)adev->vcn.inst[inst_idx].dpg_sram_curr_addr -
8da1170a16e4d4 Leo Liu      2022-04-13   994  				(uintptr_t)adev->vcn.inst[inst_idx].dpg_sram_cpu_addr));
8da1170a16e4d4 Leo Liu      2022-04-13   995  
8da1170a16e4d4 Leo Liu      2022-04-13   996  	ring = &adev->vcn.inst[inst_idx].ring_enc[0];
8da1170a16e4d4 Leo Liu      2022-04-13   997  
bb4f196b47b655 Ruijing Dong 2022-05-31   998  	WREG32_SOC15(VCN, inst_idx, regUVD_RB_BASE_LO, ring->gpu_addr);
bb4f196b47b655 Ruijing Dong 2022-05-31  @999  	WREG32_SOC15(VCN, inst_idx, regUVD_RB_BASE_HI, upper_32_bits(ring->gpu_addr));
bb4f196b47b655 Ruijing Dong 2022-05-31  1000  	WREG32_SOC15(VCN, inst_idx, regUVD_RB_SIZE, ring->ring_size / 4);
8da1170a16e4d4 Leo Liu      2022-04-13  1001  
8da1170a16e4d4 Leo Liu      2022-04-13  1002  	tmp = RREG32_SOC15(VCN, inst_idx, regVCN_RB_ENABLE);
bb4f196b47b655 Ruijing Dong 2022-05-31  1003  	tmp &= ~(VCN_RB_ENABLE__RB1_EN_MASK);
8da1170a16e4d4 Leo Liu      2022-04-13  1004  	WREG32_SOC15(VCN, inst_idx, regVCN_RB_ENABLE, tmp);
bb4f196b47b655 Ruijing Dong 2022-05-31  1005  	fw_shared->sq.queue_mode |= FW_QUEUE_RING_RESET;
bb4f196b47b655 Ruijing Dong 2022-05-31  1006  	WREG32_SOC15(VCN, inst_idx, regUVD_RB_RPTR, 0);
bb4f196b47b655 Ruijing Dong 2022-05-31  1007  	WREG32_SOC15(VCN, inst_idx, regUVD_RB_WPTR, 0);
8da1170a16e4d4 Leo Liu      2022-04-13  1008  
8da1170a16e4d4 Leo Liu      2022-04-13  1009  	tmp = RREG32_SOC15(VCN, inst_idx, regUVD_RB_RPTR);
8da1170a16e4d4 Leo Liu      2022-04-13  1010  	WREG32_SOC15(VCN, inst_idx, regUVD_RB_WPTR, tmp);
8da1170a16e4d4 Leo Liu      2022-04-13  1011  	ring->wptr = RREG32_SOC15(VCN, inst_idx, regUVD_RB_WPTR);
8da1170a16e4d4 Leo Liu      2022-04-13  1012  
bb4f196b47b655 Ruijing Dong 2022-05-31  1013  	tmp = RREG32_SOC15(VCN, inst_idx, regVCN_RB_ENABLE);
bb4f196b47b655 Ruijing Dong 2022-05-31  1014  	tmp |= VCN_RB_ENABLE__RB1_EN_MASK;
bb4f196b47b655 Ruijing Dong 2022-05-31  1015  	WREG32_SOC15(VCN, inst_idx, regVCN_RB_ENABLE, tmp);
bb4f196b47b655 Ruijing Dong 2022-05-31  1016  	fw_shared->sq.queue_mode &= ~(FW_QUEUE_RING_RESET | FW_QUEUE_DPG_HOLD_OFF);
bb4f196b47b655 Ruijing Dong 2022-05-31  1017  
8da1170a16e4d4 Leo Liu      2022-04-13  1018  	WREG32_SOC15(VCN, inst_idx, regVCN_RB1_DB_CTRL,
8da1170a16e4d4 Leo Liu      2022-04-13  1019  			ring->doorbell_index << VCN_RB1_DB_CTRL__OFFSET__SHIFT |
8da1170a16e4d4 Leo Liu      2022-04-13  1020  			VCN_RB1_DB_CTRL__EN_MASK);
bb4f196b47b655 Ruijing Dong 2022-05-31  1021  
8da1170a16e4d4 Leo Liu      2022-04-13  1022  	return 0;
8da1170a16e4d4 Leo Liu      2022-04-13  1023  }
8da1170a16e4d4 Leo Liu      2022-04-13  1024  

:::::: The code at line 999 was first introduced by commit
:::::: bb4f196b47b6554ba89f02ec60246f0c643a4bf8 drm/amdgpu/vcn: support unified queue only in vcn4

:::::: TO: Ruijing Dong <ruijing.dong@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
