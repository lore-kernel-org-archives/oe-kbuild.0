Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A11301012
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 18:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761762441; cv=none; b=ZdbEJq4/WXqz9RX3JVkblLZ5ulM/FwWCueNDjdGdvcXo8FzUZ3PYdqv63ddX7W1Y0qK+zm41Sl6IjicYBuy4zS9PCHRhp8S3pQSOHPQM1DXGoejYvtUqn36/die+Lf9Xzp76qywft5E27fClXUIGdljLUdZPjwFdWvCBM+oFw98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761762441; c=relaxed/simple;
	bh=bQanZqX02uIa05FuFud3uwZol/HEVbd1Egcfrg0jmYs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EyPy6Sdq+GHcVR7XijwYtlWugJ7lwFIHpj8HVATHdq8o5bnPtO58b/LybwWfg6xvzrtcBIX865HldsEYXJvN4saJu/YEsvT3qDwKixtrj/MNa3UT9+4N/FzoV+ewQsljyb3LwnWen9qfJL1WLKkuDng3IQEJ6Y3guGzW5+d0AS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eljmIInb; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eljmIInb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761762439; x=1793298439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bQanZqX02uIa05FuFud3uwZol/HEVbd1Egcfrg0jmYs=;
  b=eljmIInbI8gBiTLF5LZpmUPT86IcYRTpIQ4QrDjXQWzAvsvNmjPKPNk4
   3tnSI5ebtegXpx1b89m57iGUk0tn6Mj7KUYIS25ErlHGYdLth9G6M/K/T
   o74p29kKKq93N+OvBzaJNLQv0TbFzs0EFYO/a087FNHzaK+g9yciZr9f4
   SD84TT+g6J8UFMx98XI2jhfPUkkxsjWID/RTs0CdzJcrGkmwgtxNoLIgt
   hieWCv5ldBhqz1Ao/kuYJrsd57BwH6CGCJk2/RCFR3dpZsY5XINo4yM2H
   IBI0yHV+klb+1yLEosBlEGeTium9owqtp4MeTe5wo2MBRfyrC3Ffbb36u
   A==;
X-CSE-ConnectionGUID: xSWPW2OBS3C0B0P0dtrt/g==
X-CSE-MsgGUID: QvvFtORQRb+esRmDKHlMBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="81523102"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="81523102"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 11:27:18 -0700
X-CSE-ConnectionGUID: lDgemXYGQOGDE00wbKGJAw==
X-CSE-MsgGUID: vlYzwbimQOeNXWDtEXqs5w==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 29 Oct 2025 11:27:17 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEAt9-000L1A-0T;
	Wed, 29 Oct 2025 18:27:15 +0000
Date: Thu, 30 Oct 2025 02:14:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c:544
 vcn_v5_0_1_start_dpg_mode() warn: Function too hairy.  No more merges.
Message-ID: <202510300211.XAOTQ3rY-lkp@intel.com>
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
TO: Sonny Jiang <sonjiang@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
commit: 346492f30ce3581bf5324c4ae417eab8537dc998 drm/amdgpu: Add VCN_5_0_1 support
date:   11 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-161-20251028 (https://download.01.org/0day-ci/archive/20251030/202510300211.XAOTQ3rY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510300211.XAOTQ3rY-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c:544 vcn_v5_0_1_start_dpg_mode() warn: Function too hairy.  No more merges.

vim +544 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c

346492f30ce358 Sonny Jiang 2024-10-12  443  
346492f30ce358 Sonny Jiang 2024-10-12  444  /**
346492f30ce358 Sonny Jiang 2024-10-12  445   * vcn_v5_0_1_start_dpg_mode - VCN start with dpg mode
346492f30ce358 Sonny Jiang 2024-10-12  446   *
346492f30ce358 Sonny Jiang 2024-10-12  447   * @adev: amdgpu_device pointer
346492f30ce358 Sonny Jiang 2024-10-12  448   * @inst_idx: instance number index
346492f30ce358 Sonny Jiang 2024-10-12  449   * @indirect: indirectly write sram
346492f30ce358 Sonny Jiang 2024-10-12  450   *
346492f30ce358 Sonny Jiang 2024-10-12  451   * Start VCN block with dpg mode
346492f30ce358 Sonny Jiang 2024-10-12  452   */
346492f30ce358 Sonny Jiang 2024-10-12  453  static int vcn_v5_0_1_start_dpg_mode(struct amdgpu_device *adev, int inst_idx, bool indirect)
346492f30ce358 Sonny Jiang 2024-10-12  454  {
346492f30ce358 Sonny Jiang 2024-10-12  455  	volatile struct amdgpu_vcn4_fw_shared *fw_shared =
346492f30ce358 Sonny Jiang 2024-10-12  456  		adev->vcn.inst[inst_idx].fw_shared.cpu_addr;
346492f30ce358 Sonny Jiang 2024-10-12  457  	struct amdgpu_ring *ring;
346492f30ce358 Sonny Jiang 2024-10-12  458  	int vcn_inst;
346492f30ce358 Sonny Jiang 2024-10-12  459  	uint32_t tmp;
346492f30ce358 Sonny Jiang 2024-10-12  460  
346492f30ce358 Sonny Jiang 2024-10-12  461  	vcn_inst = GET_INST(VCN, inst_idx);
346492f30ce358 Sonny Jiang 2024-10-12  462  
346492f30ce358 Sonny Jiang 2024-10-12  463  	/* disable register anti-hang mechanism */
346492f30ce358 Sonny Jiang 2024-10-12  464  	WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst, regUVD_POWER_STATUS), 1,
346492f30ce358 Sonny Jiang 2024-10-12  465  		~UVD_POWER_STATUS__UVD_POWER_STATUS_MASK);
346492f30ce358 Sonny Jiang 2024-10-12  466  
346492f30ce358 Sonny Jiang 2024-10-12  467  	/* enable dynamic power gating mode */
346492f30ce358 Sonny Jiang 2024-10-12  468  	tmp = RREG32_SOC15(VCN, vcn_inst, regUVD_POWER_STATUS);
346492f30ce358 Sonny Jiang 2024-10-12  469  	tmp |= UVD_POWER_STATUS__UVD_PG_MODE_MASK;
346492f30ce358 Sonny Jiang 2024-10-12  470  	WREG32_SOC15(VCN, vcn_inst, regUVD_POWER_STATUS, tmp);
346492f30ce358 Sonny Jiang 2024-10-12  471  
346492f30ce358 Sonny Jiang 2024-10-12  472  	if (indirect) {
346492f30ce358 Sonny Jiang 2024-10-12  473  		adev->vcn.inst[inst_idx].dpg_sram_curr_addr =
346492f30ce358 Sonny Jiang 2024-10-12  474  			(uint32_t *)adev->vcn.inst[inst_idx].dpg_sram_cpu_addr;
346492f30ce358 Sonny Jiang 2024-10-12  475  		/* Use dummy register 0xDEADBEEF passing AID selection to PSP FW */
346492f30ce358 Sonny Jiang 2024-10-12  476  		WREG32_SOC24_DPG_MODE(inst_idx, 0xDEADBEEF,
346492f30ce358 Sonny Jiang 2024-10-12  477  				adev->vcn.inst[inst_idx].aid_id, 0, true);
346492f30ce358 Sonny Jiang 2024-10-12  478  	}
346492f30ce358 Sonny Jiang 2024-10-12  479  
346492f30ce358 Sonny Jiang 2024-10-12  480  	/* enable VCPU clock */
346492f30ce358 Sonny Jiang 2024-10-12  481  	tmp = (0xFF << UVD_VCPU_CNTL__PRB_TIMEOUT_VAL__SHIFT);
346492f30ce358 Sonny Jiang 2024-10-12  482  	tmp |= UVD_VCPU_CNTL__CLK_EN_MASK | UVD_VCPU_CNTL__BLK_RST_MASK;
346492f30ce358 Sonny Jiang 2024-10-12  483  	WREG32_SOC24_DPG_MODE(inst_idx, SOC24_DPG_MODE_OFFSET(
346492f30ce358 Sonny Jiang 2024-10-12  484  		VCN, 0, regUVD_VCPU_CNTL), tmp, 0, indirect);
346492f30ce358 Sonny Jiang 2024-10-12  485  
346492f30ce358 Sonny Jiang 2024-10-12  486  	/* disable master interrupt */
346492f30ce358 Sonny Jiang 2024-10-12  487  	WREG32_SOC24_DPG_MODE(inst_idx, SOC24_DPG_MODE_OFFSET(
346492f30ce358 Sonny Jiang 2024-10-12  488  		VCN, 0, regUVD_MASTINT_EN), 0, 0, indirect);
346492f30ce358 Sonny Jiang 2024-10-12  489  
346492f30ce358 Sonny Jiang 2024-10-12  490  	/* setup regUVD_LMI_CTRL */
346492f30ce358 Sonny Jiang 2024-10-12  491  	tmp = (UVD_LMI_CTRL__WRITE_CLEAN_TIMER_EN_MASK |
346492f30ce358 Sonny Jiang 2024-10-12  492  		UVD_LMI_CTRL__REQ_MODE_MASK |
346492f30ce358 Sonny Jiang 2024-10-12  493  		UVD_LMI_CTRL__CRC_RESET_MASK |
346492f30ce358 Sonny Jiang 2024-10-12  494  		UVD_LMI_CTRL__MASK_MC_URGENT_MASK |
346492f30ce358 Sonny Jiang 2024-10-12  495  		UVD_LMI_CTRL__DATA_COHERENCY_EN_MASK |
346492f30ce358 Sonny Jiang 2024-10-12  496  		UVD_LMI_CTRL__VCPU_DATA_COHERENCY_EN_MASK |
346492f30ce358 Sonny Jiang 2024-10-12  497  		(8 << UVD_LMI_CTRL__WRITE_CLEAN_TIMER__SHIFT) |
346492f30ce358 Sonny Jiang 2024-10-12  498  		0x00100000L);
346492f30ce358 Sonny Jiang 2024-10-12  499  	WREG32_SOC24_DPG_MODE(inst_idx, SOC24_DPG_MODE_OFFSET(
346492f30ce358 Sonny Jiang 2024-10-12  500  		VCN, 0, regUVD_LMI_CTRL), tmp, 0, indirect);
346492f30ce358 Sonny Jiang 2024-10-12  501  
346492f30ce358 Sonny Jiang 2024-10-12  502  	vcn_v5_0_1_mc_resume_dpg_mode(adev, inst_idx, indirect);
346492f30ce358 Sonny Jiang 2024-10-12  503  
346492f30ce358 Sonny Jiang 2024-10-12  504  	tmp = (0xFF << UVD_VCPU_CNTL__PRB_TIMEOUT_VAL__SHIFT);
346492f30ce358 Sonny Jiang 2024-10-12  505  	tmp |= UVD_VCPU_CNTL__CLK_EN_MASK;
346492f30ce358 Sonny Jiang 2024-10-12  506  	WREG32_SOC24_DPG_MODE(inst_idx, SOC24_DPG_MODE_OFFSET(
346492f30ce358 Sonny Jiang 2024-10-12  507  		VCN, 0, regUVD_VCPU_CNTL), tmp, 0, indirect);
346492f30ce358 Sonny Jiang 2024-10-12  508  
346492f30ce358 Sonny Jiang 2024-10-12  509  	/* enable LMI MC and UMC channels */
346492f30ce358 Sonny Jiang 2024-10-12  510  	tmp = 0x1f << UVD_LMI_CTRL2__RE_OFLD_MIF_WR_REQ_NUM__SHIFT;
346492f30ce358 Sonny Jiang 2024-10-12  511  	WREG32_SOC24_DPG_MODE(inst_idx, SOC24_DPG_MODE_OFFSET(
346492f30ce358 Sonny Jiang 2024-10-12  512  		VCN, 0, regUVD_LMI_CTRL2), tmp, 0, indirect);
346492f30ce358 Sonny Jiang 2024-10-12  513  
346492f30ce358 Sonny Jiang 2024-10-12  514  	/* enable master interrupt */
346492f30ce358 Sonny Jiang 2024-10-12  515  	WREG32_SOC24_DPG_MODE(inst_idx, SOC24_DPG_MODE_OFFSET(
346492f30ce358 Sonny Jiang 2024-10-12  516  		VCN, 0, regUVD_MASTINT_EN),
346492f30ce358 Sonny Jiang 2024-10-12  517  		UVD_MASTINT_EN__VCPU_EN_MASK, 0, indirect);
346492f30ce358 Sonny Jiang 2024-10-12  518  
346492f30ce358 Sonny Jiang 2024-10-12  519  	if (indirect)
346492f30ce358 Sonny Jiang 2024-10-12  520  		amdgpu_vcn_psp_update_sram(adev, inst_idx, AMDGPU_UCODE_ID_VCN0_RAM);
346492f30ce358 Sonny Jiang 2024-10-12  521  
346492f30ce358 Sonny Jiang 2024-10-12  522  	ring = &adev->vcn.inst[inst_idx].ring_enc[0];
346492f30ce358 Sonny Jiang 2024-10-12  523  
346492f30ce358 Sonny Jiang 2024-10-12  524  	WREG32_SOC15(VCN, vcn_inst, regUVD_RB_BASE_LO, lower_32_bits(ring->gpu_addr));
346492f30ce358 Sonny Jiang 2024-10-12  525  	WREG32_SOC15(VCN, vcn_inst, regUVD_RB_BASE_HI, upper_32_bits(ring->gpu_addr));
346492f30ce358 Sonny Jiang 2024-10-12  526  	WREG32_SOC15(VCN, vcn_inst, regUVD_RB_SIZE, ring->ring_size / sizeof(uint32_t));
346492f30ce358 Sonny Jiang 2024-10-12  527  
346492f30ce358 Sonny Jiang 2024-10-12  528  	tmp = RREG32_SOC15(VCN, vcn_inst, regVCN_RB_ENABLE);
346492f30ce358 Sonny Jiang 2024-10-12  529  	tmp &= ~(VCN_RB_ENABLE__RB1_EN_MASK);
346492f30ce358 Sonny Jiang 2024-10-12  530  	WREG32_SOC15(VCN, vcn_inst, regVCN_RB_ENABLE, tmp);
346492f30ce358 Sonny Jiang 2024-10-12  531  	fw_shared->sq.queue_mode |= FW_QUEUE_RING_RESET;
346492f30ce358 Sonny Jiang 2024-10-12  532  	WREG32_SOC15(VCN, vcn_inst, regUVD_RB_RPTR, 0);
346492f30ce358 Sonny Jiang 2024-10-12  533  	WREG32_SOC15(VCN, vcn_inst, regUVD_RB_WPTR, 0);
346492f30ce358 Sonny Jiang 2024-10-12  534  
346492f30ce358 Sonny Jiang 2024-10-12  535  	tmp = RREG32_SOC15(VCN, vcn_inst, regUVD_RB_RPTR);
346492f30ce358 Sonny Jiang 2024-10-12  536  	WREG32_SOC15(VCN, vcn_inst, regUVD_RB_WPTR, tmp);
346492f30ce358 Sonny Jiang 2024-10-12  537  	ring->wptr = RREG32_SOC15(VCN, vcn_inst, regUVD_RB_WPTR);
346492f30ce358 Sonny Jiang 2024-10-12  538  
346492f30ce358 Sonny Jiang 2024-10-12  539  	tmp = RREG32_SOC15(VCN, vcn_inst, regVCN_RB_ENABLE);
346492f30ce358 Sonny Jiang 2024-10-12  540  	tmp |= VCN_RB_ENABLE__RB1_EN_MASK;
346492f30ce358 Sonny Jiang 2024-10-12  541  	WREG32_SOC15(VCN, vcn_inst, regVCN_RB_ENABLE, tmp);
346492f30ce358 Sonny Jiang 2024-10-12  542  	fw_shared->sq.queue_mode &= ~(FW_QUEUE_RING_RESET | FW_QUEUE_DPG_HOLD_OFF);
346492f30ce358 Sonny Jiang 2024-10-12  543  
346492f30ce358 Sonny Jiang 2024-10-12 @544  	WREG32_SOC15(VCN, vcn_inst, regVCN_RB1_DB_CTRL,
346492f30ce358 Sonny Jiang 2024-10-12  545  		ring->doorbell_index << VCN_RB1_DB_CTRL__OFFSET__SHIFT |
346492f30ce358 Sonny Jiang 2024-10-12  546  		VCN_RB1_DB_CTRL__EN_MASK);
346492f30ce358 Sonny Jiang 2024-10-12  547  	/* Read DB_CTRL to flush the write DB_CTRL command. */
346492f30ce358 Sonny Jiang 2024-10-12  548  	RREG32_SOC15(VCN, vcn_inst, regVCN_RB1_DB_CTRL);
346492f30ce358 Sonny Jiang 2024-10-12  549  
346492f30ce358 Sonny Jiang 2024-10-12  550  	return 0;
346492f30ce358 Sonny Jiang 2024-10-12  551  }
346492f30ce358 Sonny Jiang 2024-10-12  552  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
