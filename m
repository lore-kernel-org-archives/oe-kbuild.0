Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED8F171A4
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 11:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="atD1YUzN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700048080; x=1731584080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=evKxE8IuyeB5F+dOTAI9jA3Y1yESJ8AEwlnWUtt5irM=;
  b=atD1YUzNu4B5SCy99xS2U7IxdIUfGP7xGH4fN5pf1KEM+PhXyzYFFEtY
   6JPEbkVqDhwIoGa3Ed+QhATusb6SrEhWDzoo7F5/OiJmOhM1WH32nw6bU
   B8Hx95hpSTbk9i9JiXvyDpyAopadej6wa1RAbBzT0BF3526tPqXDrkMuB
   Xi3F6KmamLiMaE50/yEdbgt8WYygJUDsRnAZ/9ydp5PVpqu+V3FVEkN2G
   u0ZZeKFWwK4zyY7l556LHfcyMtp1nGxsoCBUkYkIelIe4ZkR079hEwXwW
   O9Ii2lInwUhsBkYVJHGpFv+//f+muI+nuyCXPnpaycp+YnUsDOnieDRNr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="389712302"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; 
   d="scan'208";a="389712302"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 03:34:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="799817995"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; 
   d="scan'208";a="799817995"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 15 Nov 2023 03:34:37 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3EAE-0000HI-2O;
	Wed, 15 Nov 2023 11:34:34 +0000
Date: Wed, 15 Nov 2023 19:33:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:923
 vcn_v4_0_5_start_dpg_mode() warn: Function too hairy.  No more merges.
Message-ID: <202311151936.mbSxaOu3-lkp@intel.com>
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
TO: Saleemkhan Jamadar <saleemkhan.jamadar@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 547aad32edac17a3ec4989d8aad2426d0cbeb590 drm/amdgpu: add VCN4 ip block support
date:   3 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-141-20231115 (https://download.01.org/0day-ci/archive/20231115/202311151936.mbSxaOu3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231115/202311151936.mbSxaOu3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311151936.mbSxaOu3-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:923 vcn_v4_0_5_start_dpg_mode() warn: Function too hairy.  No more merges.

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:445 vcn_v4_0_5_mc_resume_dpg_mode() warn: Function too hairy.  No more merges.

vim +923 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c

547aad32edac17 Saleemkhan Jamadar 2023-06-13  821  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  822  /**
547aad32edac17 Saleemkhan Jamadar 2023-06-13  823   * vcn_v4_0_5_start_dpg_mode - VCN start with dpg mode
547aad32edac17 Saleemkhan Jamadar 2023-06-13  824   *
547aad32edac17 Saleemkhan Jamadar 2023-06-13  825   * @adev: amdgpu_device pointer
547aad32edac17 Saleemkhan Jamadar 2023-06-13  826   * @inst_idx: instance number index
547aad32edac17 Saleemkhan Jamadar 2023-06-13  827   * @indirect: indirectly write sram
547aad32edac17 Saleemkhan Jamadar 2023-06-13  828   *
547aad32edac17 Saleemkhan Jamadar 2023-06-13  829   * Start VCN block with dpg mode
547aad32edac17 Saleemkhan Jamadar 2023-06-13  830   */
547aad32edac17 Saleemkhan Jamadar 2023-06-13  831  static int vcn_v4_0_5_start_dpg_mode(struct amdgpu_device *adev, int inst_idx, bool indirect)
547aad32edac17 Saleemkhan Jamadar 2023-06-13  832  {
547aad32edac17 Saleemkhan Jamadar 2023-06-13  833  	volatile struct amdgpu_vcn4_fw_shared *fw_shared = adev->vcn.inst[inst_idx].fw_shared.cpu_addr;
547aad32edac17 Saleemkhan Jamadar 2023-06-13  834  	struct amdgpu_ring *ring;
547aad32edac17 Saleemkhan Jamadar 2023-06-13  835  	uint32_t tmp;
547aad32edac17 Saleemkhan Jamadar 2023-06-13  836  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  837  	/* disable register anti-hang mechanism */
547aad32edac17 Saleemkhan Jamadar 2023-06-13  838  	WREG32_P(SOC15_REG_OFFSET(VCN, inst_idx, regUVD_POWER_STATUS), 1,
547aad32edac17 Saleemkhan Jamadar 2023-06-13  839  		~UVD_POWER_STATUS__UVD_POWER_STATUS_MASK);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  840  	/* enable dynamic power gating mode */
547aad32edac17 Saleemkhan Jamadar 2023-06-13  841  	tmp = RREG32_SOC15(VCN, inst_idx, regUVD_POWER_STATUS);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  842  	tmp |= UVD_POWER_STATUS__UVD_PG_MODE_MASK;
547aad32edac17 Saleemkhan Jamadar 2023-06-13  843  	tmp |= UVD_POWER_STATUS__UVD_PG_EN_MASK;
547aad32edac17 Saleemkhan Jamadar 2023-06-13  844  	WREG32_SOC15(VCN, inst_idx, regUVD_POWER_STATUS, tmp);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  845  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  846  	if (indirect)
547aad32edac17 Saleemkhan Jamadar 2023-06-13  847  		adev->vcn.inst[inst_idx].dpg_sram_curr_addr =
547aad32edac17 Saleemkhan Jamadar 2023-06-13  848  					(uint32_t *)adev->vcn.inst[inst_idx].dpg_sram_cpu_addr;
547aad32edac17 Saleemkhan Jamadar 2023-06-13  849  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  850  	/* enable clock gating */
547aad32edac17 Saleemkhan Jamadar 2023-06-13  851  	vcn_v4_0_5_disable_clock_gating_dpg_mode(adev, 0, inst_idx, indirect);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  852  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  853  	/* enable VCPU clock */
547aad32edac17 Saleemkhan Jamadar 2023-06-13  854  	tmp = (0xFF << UVD_VCPU_CNTL__PRB_TIMEOUT_VAL__SHIFT);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  855  	tmp |= UVD_VCPU_CNTL__CLK_EN_MASK | UVD_VCPU_CNTL__BLK_RST_MASK;
547aad32edac17 Saleemkhan Jamadar 2023-06-13  856  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
547aad32edac17 Saleemkhan Jamadar 2023-06-13  857  		VCN, inst_idx, regUVD_VCPU_CNTL), tmp, 0, indirect);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  858  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  859  	/* disable master interrupt */
547aad32edac17 Saleemkhan Jamadar 2023-06-13  860  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
547aad32edac17 Saleemkhan Jamadar 2023-06-13  861  		VCN, inst_idx, regUVD_MASTINT_EN), 0, 0, indirect);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  862  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  863  	/* setup regUVD_LMI_CTRL */
547aad32edac17 Saleemkhan Jamadar 2023-06-13  864  	tmp = (UVD_LMI_CTRL__WRITE_CLEAN_TIMER_EN_MASK |
547aad32edac17 Saleemkhan Jamadar 2023-06-13  865  		UVD_LMI_CTRL__REQ_MODE_MASK |
547aad32edac17 Saleemkhan Jamadar 2023-06-13  866  		UVD_LMI_CTRL__CRC_RESET_MASK |
547aad32edac17 Saleemkhan Jamadar 2023-06-13  867  		UVD_LMI_CTRL__MASK_MC_URGENT_MASK |
547aad32edac17 Saleemkhan Jamadar 2023-06-13  868  		UVD_LMI_CTRL__DATA_COHERENCY_EN_MASK |
547aad32edac17 Saleemkhan Jamadar 2023-06-13  869  		UVD_LMI_CTRL__VCPU_DATA_COHERENCY_EN_MASK |
547aad32edac17 Saleemkhan Jamadar 2023-06-13  870  		(8 << UVD_LMI_CTRL__WRITE_CLEAN_TIMER__SHIFT) |
547aad32edac17 Saleemkhan Jamadar 2023-06-13  871  		0x00100000L);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  872  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
547aad32edac17 Saleemkhan Jamadar 2023-06-13  873  		VCN, inst_idx, regUVD_LMI_CTRL), tmp, 0, indirect);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  874  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  875  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
547aad32edac17 Saleemkhan Jamadar 2023-06-13  876  		VCN, inst_idx, regUVD_MPC_CNTL),
547aad32edac17 Saleemkhan Jamadar 2023-06-13  877  		0x2 << UVD_MPC_CNTL__REPLACEMENT_MODE__SHIFT, 0, indirect);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  878  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  879  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
547aad32edac17 Saleemkhan Jamadar 2023-06-13  880  		VCN, inst_idx, regUVD_MPC_SET_MUXA0),
547aad32edac17 Saleemkhan Jamadar 2023-06-13  881  		((0x1 << UVD_MPC_SET_MUXA0__VARA_1__SHIFT) |
547aad32edac17 Saleemkhan Jamadar 2023-06-13  882  		 (0x2 << UVD_MPC_SET_MUXA0__VARA_2__SHIFT) |
547aad32edac17 Saleemkhan Jamadar 2023-06-13  883  		 (0x3 << UVD_MPC_SET_MUXA0__VARA_3__SHIFT) |
547aad32edac17 Saleemkhan Jamadar 2023-06-13  884  		 (0x4 << UVD_MPC_SET_MUXA0__VARA_4__SHIFT)), 0, indirect);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  885  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  886  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
547aad32edac17 Saleemkhan Jamadar 2023-06-13  887  		VCN, inst_idx, regUVD_MPC_SET_MUXB0),
547aad32edac17 Saleemkhan Jamadar 2023-06-13  888  		 ((0x1 << UVD_MPC_SET_MUXB0__VARB_1__SHIFT) |
547aad32edac17 Saleemkhan Jamadar 2023-06-13  889  		 (0x2 << UVD_MPC_SET_MUXB0__VARB_2__SHIFT) |
547aad32edac17 Saleemkhan Jamadar 2023-06-13  890  		 (0x3 << UVD_MPC_SET_MUXB0__VARB_3__SHIFT) |
547aad32edac17 Saleemkhan Jamadar 2023-06-13  891  		 (0x4 << UVD_MPC_SET_MUXB0__VARB_4__SHIFT)), 0, indirect);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  892  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  893  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
547aad32edac17 Saleemkhan Jamadar 2023-06-13  894  		VCN, inst_idx, regUVD_MPC_SET_MUX),
547aad32edac17 Saleemkhan Jamadar 2023-06-13  895  		((0x0 << UVD_MPC_SET_MUX__SET_0__SHIFT) |
547aad32edac17 Saleemkhan Jamadar 2023-06-13  896  		 (0x1 << UVD_MPC_SET_MUX__SET_1__SHIFT) |
547aad32edac17 Saleemkhan Jamadar 2023-06-13  897  		 (0x2 << UVD_MPC_SET_MUX__SET_2__SHIFT)), 0, indirect);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  898  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  899  	vcn_v4_0_5_mc_resume_dpg_mode(adev, inst_idx, indirect);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  900  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  901  	tmp = (0xFF << UVD_VCPU_CNTL__PRB_TIMEOUT_VAL__SHIFT);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  902  	tmp |= UVD_VCPU_CNTL__CLK_EN_MASK;
547aad32edac17 Saleemkhan Jamadar 2023-06-13  903  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
547aad32edac17 Saleemkhan Jamadar 2023-06-13  904  		VCN, inst_idx, regUVD_VCPU_CNTL), tmp, 0, indirect);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  905  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  906  	/* enable LMI MC and UMC channels */
547aad32edac17 Saleemkhan Jamadar 2023-06-13  907  	tmp = 0x1f << UVD_LMI_CTRL2__RE_OFLD_MIF_WR_REQ_NUM__SHIFT;
547aad32edac17 Saleemkhan Jamadar 2023-06-13  908  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
547aad32edac17 Saleemkhan Jamadar 2023-06-13  909  		VCN, inst_idx, regUVD_LMI_CTRL2), tmp, 0, indirect);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  910  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  911  	/* enable master interrupt */
547aad32edac17 Saleemkhan Jamadar 2023-06-13  912  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
547aad32edac17 Saleemkhan Jamadar 2023-06-13  913  		VCN, inst_idx, regUVD_MASTINT_EN),
547aad32edac17 Saleemkhan Jamadar 2023-06-13  914  		UVD_MASTINT_EN__VCPU_EN_MASK, 0, indirect);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  915  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  916  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  917  	if (indirect)
547aad32edac17 Saleemkhan Jamadar 2023-06-13  918  		amdgpu_vcn_psp_update_sram(adev, inst_idx, 0);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  919  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  920  	ring = &adev->vcn.inst[inst_idx].ring_enc[0];
547aad32edac17 Saleemkhan Jamadar 2023-06-13  921  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  922  	WREG32_SOC15(VCN, inst_idx, regUVD_RB_BASE_LO, ring->gpu_addr);
547aad32edac17 Saleemkhan Jamadar 2023-06-13 @923  	WREG32_SOC15(VCN, inst_idx, regUVD_RB_BASE_HI, upper_32_bits(ring->gpu_addr));
547aad32edac17 Saleemkhan Jamadar 2023-06-13  924  	WREG32_SOC15(VCN, inst_idx, regUVD_RB_SIZE, ring->ring_size / 4);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  925  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  926  	tmp = RREG32_SOC15(VCN, inst_idx, regVCN_RB_ENABLE);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  927  	tmp &= ~(VCN_RB_ENABLE__RB1_EN_MASK);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  928  	WREG32_SOC15(VCN, inst_idx, regVCN_RB_ENABLE, tmp);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  929  	fw_shared->sq.queue_mode |= FW_QUEUE_RING_RESET;
547aad32edac17 Saleemkhan Jamadar 2023-06-13  930  	WREG32_SOC15(VCN, inst_idx, regUVD_RB_RPTR, 0);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  931  	WREG32_SOC15(VCN, inst_idx, regUVD_RB_WPTR, 0);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  932  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  933  	tmp = RREG32_SOC15(VCN, inst_idx, regUVD_RB_RPTR);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  934  	WREG32_SOC15(VCN, inst_idx, regUVD_RB_WPTR, tmp);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  935  	ring->wptr = RREG32_SOC15(VCN, inst_idx, regUVD_RB_WPTR);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  936  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  937  	tmp = RREG32_SOC15(VCN, inst_idx, regVCN_RB_ENABLE);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  938  	tmp |= VCN_RB_ENABLE__RB1_EN_MASK;
547aad32edac17 Saleemkhan Jamadar 2023-06-13  939  	WREG32_SOC15(VCN, inst_idx, regVCN_RB_ENABLE, tmp);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  940  	fw_shared->sq.queue_mode &= ~(FW_QUEUE_RING_RESET | FW_QUEUE_DPG_HOLD_OFF);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  941  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  942  	WREG32_SOC15(VCN, inst_idx, regVCN_RB1_DB_CTRL,
547aad32edac17 Saleemkhan Jamadar 2023-06-13  943  			ring->doorbell_index << VCN_RB1_DB_CTRL__OFFSET__SHIFT |
547aad32edac17 Saleemkhan Jamadar 2023-06-13  944  			VCN_RB1_DB_CTRL__EN_MASK);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  945  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  946  	return 0;
547aad32edac17 Saleemkhan Jamadar 2023-06-13  947  }
547aad32edac17 Saleemkhan Jamadar 2023-06-13  948  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
