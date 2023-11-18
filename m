Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503FD101E4
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Nov 2023 07:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwtXDDfg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700292358; x=1731828358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tux0KiArmfptn4eNL95HnbDr1F1QcCvJyQsFRe9cA1I=;
  b=dwtXDDfgRyAzNqBOslJmFLf53apUWwbQclo5FtI8GQq5zSWI9IO2Hgfn
   YR9c5mqGoymE2u/XK8PXZ8gYsDQbzlgn83lZLtojN+njgtNQjNkMgUOQP
   GSkbYvvg4Opsl5tbhFylvjkWJtjFlwcJwGqLcl2YDDOjVL6WMXPQq16vI
   mtcBNP2DHsKZRJdV8VMnMVWCWq67wa5lBEAELcdKtuPZ/Wk8eD7OMT7XM
   iLLSSx/BcN7YAJgm/K1SAviEMjqt33wsA8H07mFlxvT1jhFaVmJ3Ekiud
   LCN4RR05GrDU4QHo54ymgt8wU2udWZNoX95uWwTV9HGS6LDLz34d19GN6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="376459588"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="376459588"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 23:25:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="800690133"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="800690133"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 17 Nov 2023 23:25:44 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4Fi1-0003eM-0t;
	Sat, 18 Nov 2023 07:25:41 +0000
Date: Sat, 18 Nov 2023 15:25:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c:536
 vcn_v2_5_mc_resume_dpg_mode() warn: Function too hairy.  No more merges.
Message-ID: <202311181540.6ivQOMsl-lkp@intel.com>
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
TO: Maximilian Luz <luzmaximilian@gmail.com>
CC: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   791c8ab095f71327899023223940dd52257a4173
commit: 39e2ba648a6ee4519a5f0aa4cb995f8c97c5db6f platform/surface: aggregator_registry: Add support for tablet-mode switch on Surface Pro 9
date:   8 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-161-20231118 (https://download.01.org/0day-ci/archive/20231118/202311181540.6ivQOMsl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231118/202311181540.6ivQOMsl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311181540.6ivQOMsl-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c:536 vcn_v2_5_mc_resume_dpg_mode() warn: Function too hairy.  No more merges.

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c:931 vcn_v2_5_start_dpg_mode() warn: Function too hairy.  No more merges.

vim +536 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c

cbead2bdfcf1dd Leo Liu           2019-04-15  450  
db32fec96620b3 kernel test robot 2020-06-18  451  static void vcn_v2_5_mc_resume_dpg_mode(struct amdgpu_device *adev, int inst_idx, bool indirect)
d2a2c64f53718a James Zhu         2019-12-18  452  {
d2a2c64f53718a James Zhu         2019-12-18  453  	uint32_t size = AMDGPU_GPU_PAGE_ALIGN(adev->vcn.fw->size + 4);
d2a2c64f53718a James Zhu         2019-12-18  454  	uint32_t offset;
d2a2c64f53718a James Zhu         2019-12-18  455  
d2a2c64f53718a James Zhu         2019-12-18  456  	/* cache window 0: fw */
d2a2c64f53718a James Zhu         2019-12-18  457  	if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) {
0c0dab86d97925 James Zhu         2020-01-13  458  		if (!indirect) {
4d319ed6566e47 Boyuan Zhang      2020-03-30  459  			WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d2 Boyuan Zhang      2020-04-28  460  				VCN, 0, mmUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW),
d2a2c64f53718a James Zhu         2019-12-18  461  				(adev->firmware.ucode[AMDGPU_UCODE_ID_VCN + inst_idx].tmr_mc_addr_lo), 0, indirect);
4d319ed6566e47 Boyuan Zhang      2020-03-30  462  			WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d2 Boyuan Zhang      2020-04-28  463  				VCN, 0, mmUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH),
d2a2c64f53718a James Zhu         2019-12-18  464  				(adev->firmware.ucode[AMDGPU_UCODE_ID_VCN + inst_idx].tmr_mc_addr_hi), 0, indirect);
4d319ed6566e47 Boyuan Zhang      2020-03-30  465  			WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d2 Boyuan Zhang      2020-04-28  466  				VCN, 0, mmUVD_VCPU_CACHE_OFFSET0), 0, 0, indirect);
0c0dab86d97925 James Zhu         2020-01-13  467  		} else {
4d319ed6566e47 Boyuan Zhang      2020-03-30  468  			WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d2 Boyuan Zhang      2020-04-28  469  				VCN, 0, mmUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW), 0, 0, indirect);
4d319ed6566e47 Boyuan Zhang      2020-03-30  470  			WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d2 Boyuan Zhang      2020-04-28  471  				VCN, 0, mmUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH), 0, 0, indirect);
4d319ed6566e47 Boyuan Zhang      2020-03-30  472  			WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d2 Boyuan Zhang      2020-04-28  473  				VCN, 0, mmUVD_VCPU_CACHE_OFFSET0), 0, 0, indirect);
0c0dab86d97925 James Zhu         2020-01-13  474  		}
d2a2c64f53718a James Zhu         2019-12-18  475  		offset = 0;
d2a2c64f53718a James Zhu         2019-12-18  476  	} else {
4d319ed6566e47 Boyuan Zhang      2020-03-30  477  		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d2 Boyuan Zhang      2020-04-28  478  			VCN, 0, mmUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW),
d2a2c64f53718a James Zhu         2019-12-18  479  			lower_32_bits(adev->vcn.inst[inst_idx].gpu_addr), 0, indirect);
4d319ed6566e47 Boyuan Zhang      2020-03-30  480  		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d2 Boyuan Zhang      2020-04-28  481  			VCN, 0, mmUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH),
d2a2c64f53718a James Zhu         2019-12-18  482  			upper_32_bits(adev->vcn.inst[inst_idx].gpu_addr), 0, indirect);
d2a2c64f53718a James Zhu         2019-12-18  483  		offset = size;
4d319ed6566e47 Boyuan Zhang      2020-03-30  484  		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d2 Boyuan Zhang      2020-04-28  485  			VCN, 0, mmUVD_VCPU_CACHE_OFFSET0),
d2a2c64f53718a James Zhu         2019-12-18  486  			AMDGPU_UVD_FIRMWARE_OFFSET >> 3, 0, indirect);
d2a2c64f53718a James Zhu         2019-12-18  487  	}
d2a2c64f53718a James Zhu         2019-12-18  488  
0c0dab86d97925 James Zhu         2020-01-13  489  	if (!indirect)
4d319ed6566e47 Boyuan Zhang      2020-03-30  490  		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d2 Boyuan Zhang      2020-04-28  491  			VCN, 0, mmUVD_VCPU_CACHE_SIZE0), size, 0, indirect);
0c0dab86d97925 James Zhu         2020-01-13  492  	else
4d319ed6566e47 Boyuan Zhang      2020-03-30  493  		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d2 Boyuan Zhang      2020-04-28  494  			VCN, 0, mmUVD_VCPU_CACHE_SIZE0), 0, 0, indirect);
d2a2c64f53718a James Zhu         2019-12-18  495  
d2a2c64f53718a James Zhu         2019-12-18  496  	/* cache window 1: stack */
0c0dab86d97925 James Zhu         2020-01-13  497  	if (!indirect) {
4d319ed6566e47 Boyuan Zhang      2020-03-30  498  		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d2 Boyuan Zhang      2020-04-28  499  			VCN, 0, mmUVD_LMI_VCPU_CACHE1_64BIT_BAR_LOW),
d2a2c64f53718a James Zhu         2019-12-18  500  			lower_32_bits(adev->vcn.inst[inst_idx].gpu_addr + offset), 0, indirect);
4d319ed6566e47 Boyuan Zhang      2020-03-30  501  		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d2 Boyuan Zhang      2020-04-28  502  			VCN, 0, mmUVD_LMI_VCPU_CACHE1_64BIT_BAR_HIGH),
d2a2c64f53718a James Zhu         2019-12-18  503  			upper_32_bits(adev->vcn.inst[inst_idx].gpu_addr + offset), 0, indirect);
4d319ed6566e47 Boyuan Zhang      2020-03-30  504  		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d2 Boyuan Zhang      2020-04-28  505  			VCN, 0, mmUVD_VCPU_CACHE_OFFSET1), 0, 0, indirect);
0c0dab86d97925 James Zhu         2020-01-13  506  	} else {
4d319ed6566e47 Boyuan Zhang      2020-03-30  507  		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d2 Boyuan Zhang      2020-04-28  508  			VCN, 0, mmUVD_LMI_VCPU_CACHE1_64BIT_BAR_LOW), 0, 0, indirect);
4d319ed6566e47 Boyuan Zhang      2020-03-30  509  		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d2 Boyuan Zhang      2020-04-28  510  			VCN, 0, mmUVD_LMI_VCPU_CACHE1_64BIT_BAR_HIGH), 0, 0, indirect);
4d319ed6566e47 Boyuan Zhang      2020-03-30  511  		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d2 Boyuan Zhang      2020-04-28  512  			VCN, 0, mmUVD_VCPU_CACHE_OFFSET1), 0, 0, indirect);
0c0dab86d97925 James Zhu         2020-01-13  513  	}
4d319ed6566e47 Boyuan Zhang      2020-03-30  514  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d2 Boyuan Zhang      2020-04-28  515  		VCN, 0, mmUVD_VCPU_CACHE_SIZE1), AMDGPU_VCN_STACK_SIZE, 0, indirect);
d2a2c64f53718a James Zhu         2019-12-18  516  
d2a2c64f53718a James Zhu         2019-12-18  517  	/* cache window 2: context */
4d319ed6566e47 Boyuan Zhang      2020-03-30  518  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d2 Boyuan Zhang      2020-04-28  519  		VCN, 0, mmUVD_LMI_VCPU_CACHE2_64BIT_BAR_LOW),
d2a2c64f53718a James Zhu         2019-12-18  520  		lower_32_bits(adev->vcn.inst[inst_idx].gpu_addr + offset + AMDGPU_VCN_STACK_SIZE), 0, indirect);
4d319ed6566e47 Boyuan Zhang      2020-03-30  521  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d2 Boyuan Zhang      2020-04-28  522  		VCN, 0, mmUVD_LMI_VCPU_CACHE2_64BIT_BAR_HIGH),
d2a2c64f53718a James Zhu         2019-12-18  523  		upper_32_bits(adev->vcn.inst[inst_idx].gpu_addr + offset + AMDGPU_VCN_STACK_SIZE), 0, indirect);
4d319ed6566e47 Boyuan Zhang      2020-03-30  524  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d2 Boyuan Zhang      2020-04-28  525  		VCN, 0, mmUVD_VCPU_CACHE_OFFSET2), 0, 0, indirect);
4d319ed6566e47 Boyuan Zhang      2020-03-30  526  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d2 Boyuan Zhang      2020-04-28  527  		VCN, 0, mmUVD_VCPU_CACHE_SIZE2), AMDGPU_VCN_CONTEXT_SIZE, 0, indirect);
d2a2c64f53718a James Zhu         2019-12-18  528  
d2a2c64f53718a James Zhu         2019-12-18  529  	/* non-cache window */
4d319ed6566e47 Boyuan Zhang      2020-03-30  530  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d2 Boyuan Zhang      2020-04-28  531  		VCN, 0, mmUVD_LMI_VCPU_NC0_64BIT_BAR_LOW),
b6065ebf55ff2f Ruijing Dong      2022-03-02  532  		lower_32_bits(adev->vcn.inst[inst_idx].fw_shared.gpu_addr), 0, indirect);
4d319ed6566e47 Boyuan Zhang      2020-03-30  533  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d2 Boyuan Zhang      2020-04-28  534  		VCN, 0, mmUVD_LMI_VCPU_NC0_64BIT_BAR_HIGH),
b6065ebf55ff2f Ruijing Dong      2022-03-02  535  		upper_32_bits(adev->vcn.inst[inst_idx].fw_shared.gpu_addr), 0, indirect);
4d319ed6566e47 Boyuan Zhang      2020-03-30 @536  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d2 Boyuan Zhang      2020-04-28  537  		VCN, 0, mmUVD_VCPU_NONCACHE_OFFSET0), 0, 0, indirect);
4d319ed6566e47 Boyuan Zhang      2020-03-30  538  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d2 Boyuan Zhang      2020-04-28  539  		VCN, 0, mmUVD_VCPU_NONCACHE_SIZE0),
c97e3076eb7ace James Zhu         2020-03-29  540  		AMDGPU_GPU_PAGE_ALIGN(sizeof(struct amdgpu_fw_shared)), 0, indirect);
d2a2c64f53718a James Zhu         2019-12-18  541  
d2a2c64f53718a James Zhu         2019-12-18  542  	/* VCN global tiling registers */
4d319ed6566e47 Boyuan Zhang      2020-03-30  543  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d2 Boyuan Zhang      2020-04-28  544  		VCN, 0, mmUVD_GFX8_ADDR_CONFIG), adev->gfx.config.gb_addr_config, 0, indirect);
d2a2c64f53718a James Zhu         2019-12-18  545  }
d2a2c64f53718a James Zhu         2019-12-18  546  

:::::: The code at line 536 was first introduced by commit
:::::: 4d319ed6566e478c7b055c7b0d10f4466e23e1f1 drm/amdgpu: rename macro for VCN2.0 2.5 and 3.0

:::::: TO: Boyuan Zhang <boyuan.zhang@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
