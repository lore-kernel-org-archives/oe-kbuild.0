Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3469C1891D1
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Sep 2024 18:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725907069; cv=none; b=GOBHnuItFCiVZZ3H87OGmT9RZWEOnF/XHRB4S2RS0GKyBNcdv8zwcoFoT9fqIkcGkIwZ9JxaoRIDsmzHzRM91ZhozMLIGSKBS49Z/NC5wAAjt0PTonBNtXGGCsKKnjWf4K28s2L2fx6ZGShu+dTgT84Xnn1kLV/+0XOyCO5SeuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725907069; c=relaxed/simple;
	bh=FQkBin4S3D2P+osPjtFWhZcnXj1u0Cxx3chToatv1zM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fMm7n26e/+s1WzQ3YfQlkgiNrcX9jfYk2aRs2hD1kGCNa8FDbkgBuR0VBIchkmcrlfZI1HpQy6Vvs4fYd/+/PlcwFuWnaov9GNto3YZHn4S/PqPZsrnZKKPICvfiz9bFBrvK3ahkOkptyVWhzZcXendlbQSmimmzgXmI3vzVa0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nh2GesT5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nh2GesT5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725907067; x=1757443067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FQkBin4S3D2P+osPjtFWhZcnXj1u0Cxx3chToatv1zM=;
  b=nh2GesT5eae0XiuOVZYjRRy4GLhYwx3vlG55XIKt+EgMC3hnDUN/u6SK
   M9KWH5vLIICpd7sudWLQmZhFe8Hxxumz6+TMeSoCX/oeYsmekiENRvJVo
   ECTlH2olV/2xGQy1jDpQKwSGZxLKUgQ5i1l80ZMpeBjeYDRJb5frMgXi7
   0G8kmLYniXesX/lyvshsMcjeCOLmTe7UhWzzI8n95I4enC9U/oVQ1dLhJ
   vrEkhJX9ujcCIFEkKx+UPC6CVjEx6HwpQaYjM4gRc00+rQdkKyVYGq+Qe
   cItSApj1cgPeQo+j9NCTILGeqz3oLexBgDpS/EOawa6BXrX+GhIDlFMki
   A==;
X-CSE-ConnectionGUID: sM16aXS6TZ+pu8aXnTYs7A==
X-CSE-MsgGUID: JiMq8GoFT2+uuD2b1fRTXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="28364119"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="28364119"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 11:37:47 -0700
X-CSE-ConnectionGUID: ZFzpVVAGRP22gOC5OuObVg==
X-CSE-MsgGUID: ljQULL9lQqWNuPDNEExSeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="66777475"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Sep 2024 11:37:45 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snjGh-000F5M-0R;
	Mon, 09 Sep 2024 18:37:43 +0000
Date: Tue, 10 Sep 2024 02:36:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:1273 vcn_v3_0_start() warn:
 Function too hairy.  No more merges.
Message-ID: <202409100258.wR2bh3l9-lkp@intel.com>
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
TO: Victor Lu <victorchengchi.lu@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Zhigang Luo <zhigang.luo@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bc83b4d1f08695e85e85d36f7b803da58010161d
commit: 8ed49dd1d3a7448744d57e1da2062b074cba2e49 drm/amdgpu: Add RLCG interface driver implementation for gfx v9.4.3 (v3)
date:   1 year, 2 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 1 year, 2 months ago
config: microblaze-randconfig-r073-20240909 (https://download.01.org/0day-ci/archive/20240910/202409100258.wR2bh3l9-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409100258.wR2bh3l9-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:1273 vcn_v3_0_start() warn: Function too hairy.  No more merges.

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:1022 vcn_v3_0_start_dpg_mode() warn: Function too hairy.  No more merges.

vim +1273 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c

ec2d0577b466c2 Boyuan Zhang                2020-03-27  1093  
cf14826cdfb5c9 Leo Liu                     2019-11-15  1094  static int vcn_v3_0_start(struct amdgpu_device *adev)
cf14826cdfb5c9 Leo Liu                     2019-11-15  1095  {
e42dd87e70e66a Sonny Jiang                 2020-11-27  1096  	volatile struct amdgpu_fw_shared *fw_shared;
cf14826cdfb5c9 Leo Liu                     2019-11-15  1097  	struct amdgpu_ring *ring;
cf14826cdfb5c9 Leo Liu                     2019-11-15  1098  	uint32_t rb_bufsz, tmp;
cf14826cdfb5c9 Leo Liu                     2019-11-15  1099  	int i, j, k, r;
cf14826cdfb5c9 Leo Liu                     2019-11-15  1100  
cf14826cdfb5c9 Leo Liu                     2019-11-15  1101  	if (adev->pm.dpm_enabled)
cf14826cdfb5c9 Leo Liu                     2019-11-15  1102  		amdgpu_dpm_enable_uvd(adev, true);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1103  
cf14826cdfb5c9 Leo Liu                     2019-11-15  1104  	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
cf14826cdfb5c9 Leo Liu                     2019-11-15  1105  		if (adev->vcn.harvest_config & (1 << i))
cf14826cdfb5c9 Leo Liu                     2019-11-15  1106  			continue;
cf14826cdfb5c9 Leo Liu                     2019-11-15  1107  
ec2d0577b466c2 Boyuan Zhang                2020-03-27  1108  		if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG){
ec2d0577b466c2 Boyuan Zhang                2020-03-27  1109  			r = vcn_v3_0_start_dpg_mode(adev, i, adev->vcn.indirect_sram);
ec2d0577b466c2 Boyuan Zhang                2020-03-27  1110  			continue;
ec2d0577b466c2 Boyuan Zhang                2020-03-27  1111  		}
ec2d0577b466c2 Boyuan Zhang                2020-03-27  1112  
fedac0155a1c28 Leo Liu                     2019-11-27  1113  		/* disable VCN power gating */
fedac0155a1c28 Leo Liu                     2019-11-27  1114  		vcn_v3_0_disable_static_power_gating(adev, i);
fedac0155a1c28 Leo Liu                     2019-11-27  1115  
cf14826cdfb5c9 Leo Liu                     2019-11-15  1116  		/* set VCN status busy */
cf14826cdfb5c9 Leo Liu                     2019-11-15  1117  		tmp = RREG32_SOC15(VCN, i, mmUVD_STATUS) | UVD_STATUS__UVD_BUSY;
cf14826cdfb5c9 Leo Liu                     2019-11-15  1118  		WREG32_SOC15(VCN, i, mmUVD_STATUS, tmp);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1119  
fedac0155a1c28 Leo Liu                     2019-11-27  1120  		/*SW clock gating */
fedac0155a1c28 Leo Liu                     2019-11-27  1121  		vcn_v3_0_disable_clock_gating(adev, i);
fedac0155a1c28 Leo Liu                     2019-11-27  1122  
cf14826cdfb5c9 Leo Liu                     2019-11-15  1123  		/* enable VCPU clock */
cf14826cdfb5c9 Leo Liu                     2019-11-15  1124  		WREG32_P(SOC15_REG_OFFSET(VCN, i, mmUVD_VCPU_CNTL),
cf14826cdfb5c9 Leo Liu                     2019-11-15  1125  			UVD_VCPU_CNTL__CLK_EN_MASK, ~UVD_VCPU_CNTL__CLK_EN_MASK);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1126  
cf14826cdfb5c9 Leo Liu                     2019-11-15  1127  		/* disable master interrupt */
cf14826cdfb5c9 Leo Liu                     2019-11-15  1128  		WREG32_P(SOC15_REG_OFFSET(VCN, i, mmUVD_MASTINT_EN), 0,
cf14826cdfb5c9 Leo Liu                     2019-11-15  1129  			~UVD_MASTINT_EN__VCPU_EN_MASK);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1130  
d6b0185b8dc738 Leo Liu                     2020-01-28  1131  		/* enable LMI MC and UMC channels */
d6b0185b8dc738 Leo Liu                     2020-01-28  1132  		WREG32_P(SOC15_REG_OFFSET(VCN, i, mmUVD_LMI_CTRL2), 0,
d6b0185b8dc738 Leo Liu                     2020-01-28  1133  			~UVD_LMI_CTRL2__STALL_ARB_UMC_MASK);
d6b0185b8dc738 Leo Liu                     2020-01-28  1134  
d6b0185b8dc738 Leo Liu                     2020-01-28  1135  		tmp = RREG32_SOC15(VCN, i, mmUVD_SOFT_RESET);
d6b0185b8dc738 Leo Liu                     2020-01-28  1136  		tmp &= ~UVD_SOFT_RESET__LMI_SOFT_RESET_MASK;
d6b0185b8dc738 Leo Liu                     2020-01-28  1137  		tmp &= ~UVD_SOFT_RESET__LMI_UMC_SOFT_RESET_MASK;
d6b0185b8dc738 Leo Liu                     2020-01-28  1138  		WREG32_SOC15(VCN, i, mmUVD_SOFT_RESET, tmp);
d6b0185b8dc738 Leo Liu                     2020-01-28  1139  
cf14826cdfb5c9 Leo Liu                     2019-11-15  1140  		/* setup mmUVD_LMI_CTRL */
cf14826cdfb5c9 Leo Liu                     2019-11-15  1141  		tmp = RREG32_SOC15(VCN, i, mmUVD_LMI_CTRL);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1142  		WREG32_SOC15(VCN, i, mmUVD_LMI_CTRL, tmp |
cf14826cdfb5c9 Leo Liu                     2019-11-15  1143  			UVD_LMI_CTRL__WRITE_CLEAN_TIMER_EN_MASK	|
cf14826cdfb5c9 Leo Liu                     2019-11-15  1144  			UVD_LMI_CTRL__MASK_MC_URGENT_MASK |
cf14826cdfb5c9 Leo Liu                     2019-11-15  1145  			UVD_LMI_CTRL__DATA_COHERENCY_EN_MASK |
cf14826cdfb5c9 Leo Liu                     2019-11-15  1146  			UVD_LMI_CTRL__VCPU_DATA_COHERENCY_EN_MASK);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1147  
cf14826cdfb5c9 Leo Liu                     2019-11-15  1148  		/* setup mmUVD_MPC_CNTL */
cf14826cdfb5c9 Leo Liu                     2019-11-15  1149  		tmp = RREG32_SOC15(VCN, i, mmUVD_MPC_CNTL);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1150  		tmp &= ~UVD_MPC_CNTL__REPLACEMENT_MODE_MASK;
cf14826cdfb5c9 Leo Liu                     2019-11-15  1151  		tmp |= 0x2 << UVD_MPC_CNTL__REPLACEMENT_MODE__SHIFT;
cf14826cdfb5c9 Leo Liu                     2019-11-15  1152  		WREG32_SOC15(VCN, i, mmUVD_MPC_CNTL, tmp);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1153  
cf14826cdfb5c9 Leo Liu                     2019-11-15  1154  		/* setup UVD_MPC_SET_MUXA0 */
cf14826cdfb5c9 Leo Liu                     2019-11-15  1155  		WREG32_SOC15(VCN, i, mmUVD_MPC_SET_MUXA0,
cf14826cdfb5c9 Leo Liu                     2019-11-15  1156  			((0x1 << UVD_MPC_SET_MUXA0__VARA_1__SHIFT) |
cf14826cdfb5c9 Leo Liu                     2019-11-15  1157  			(0x2 << UVD_MPC_SET_MUXA0__VARA_2__SHIFT) |
cf14826cdfb5c9 Leo Liu                     2019-11-15  1158  			(0x3 << UVD_MPC_SET_MUXA0__VARA_3__SHIFT) |
cf14826cdfb5c9 Leo Liu                     2019-11-15  1159  			(0x4 << UVD_MPC_SET_MUXA0__VARA_4__SHIFT)));
cf14826cdfb5c9 Leo Liu                     2019-11-15  1160  
cf14826cdfb5c9 Leo Liu                     2019-11-15  1161  		/* setup UVD_MPC_SET_MUXB0 */
cf14826cdfb5c9 Leo Liu                     2019-11-15  1162  		WREG32_SOC15(VCN, i, mmUVD_MPC_SET_MUXB0,
cf14826cdfb5c9 Leo Liu                     2019-11-15  1163  			((0x1 << UVD_MPC_SET_MUXB0__VARB_1__SHIFT) |
cf14826cdfb5c9 Leo Liu                     2019-11-15  1164  			(0x2 << UVD_MPC_SET_MUXB0__VARB_2__SHIFT) |
cf14826cdfb5c9 Leo Liu                     2019-11-15  1165  			(0x3 << UVD_MPC_SET_MUXB0__VARB_3__SHIFT) |
cf14826cdfb5c9 Leo Liu                     2019-11-15  1166  			(0x4 << UVD_MPC_SET_MUXB0__VARB_4__SHIFT)));
cf14826cdfb5c9 Leo Liu                     2019-11-15  1167  
cf14826cdfb5c9 Leo Liu                     2019-11-15  1168  		/* setup mmUVD_MPC_SET_MUX */
cf14826cdfb5c9 Leo Liu                     2019-11-15  1169  		WREG32_SOC15(VCN, i, mmUVD_MPC_SET_MUX,
cf14826cdfb5c9 Leo Liu                     2019-11-15  1170  			((0x0 << UVD_MPC_SET_MUX__SET_0__SHIFT) |
cf14826cdfb5c9 Leo Liu                     2019-11-15  1171  			(0x1 << UVD_MPC_SET_MUX__SET_1__SHIFT) |
cf14826cdfb5c9 Leo Liu                     2019-11-15  1172  			(0x2 << UVD_MPC_SET_MUX__SET_2__SHIFT)));
cf14826cdfb5c9 Leo Liu                     2019-11-15  1173  
cf14826cdfb5c9 Leo Liu                     2019-11-15  1174  		vcn_v3_0_mc_resume(adev, i);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1175  
cf14826cdfb5c9 Leo Liu                     2019-11-15  1176  		/* VCN global tiling registers */
cf14826cdfb5c9 Leo Liu                     2019-11-15  1177  		WREG32_SOC15(VCN, i, mmUVD_GFX10_ADDR_CONFIG,
cf14826cdfb5c9 Leo Liu                     2019-11-15  1178  			adev->gfx.config.gb_addr_config);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1179  
cf14826cdfb5c9 Leo Liu                     2019-11-15  1180  		/* unblock VCPU register access */
cf14826cdfb5c9 Leo Liu                     2019-11-15  1181  		WREG32_P(SOC15_REG_OFFSET(VCN, i, mmUVD_RB_ARB_CTRL), 0,
cf14826cdfb5c9 Leo Liu                     2019-11-15  1182  			~UVD_RB_ARB_CTRL__VCPU_DIS_MASK);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1183  
cf14826cdfb5c9 Leo Liu                     2019-11-15  1184  		/* release VCPU reset to boot */
cf14826cdfb5c9 Leo Liu                     2019-11-15  1185  		WREG32_P(SOC15_REG_OFFSET(VCN, i, mmUVD_VCPU_CNTL), 0,
cf14826cdfb5c9 Leo Liu                     2019-11-15  1186  			~UVD_VCPU_CNTL__BLK_RST_MASK);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1187  
cf14826cdfb5c9 Leo Liu                     2019-11-15  1188  		for (j = 0; j < 10; ++j) {
cf14826cdfb5c9 Leo Liu                     2019-11-15  1189  			uint32_t status;
cf14826cdfb5c9 Leo Liu                     2019-11-15  1190  
cf14826cdfb5c9 Leo Liu                     2019-11-15  1191  			for (k = 0; k < 100; ++k) {
cf14826cdfb5c9 Leo Liu                     2019-11-15  1192  				status = RREG32_SOC15(VCN, i, mmUVD_STATUS);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1193  				if (status & 2)
cf14826cdfb5c9 Leo Liu                     2019-11-15  1194  					break;
cf14826cdfb5c9 Leo Liu                     2019-11-15  1195  				mdelay(10);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1196  			}
cf14826cdfb5c9 Leo Liu                     2019-11-15  1197  			r = 0;
cf14826cdfb5c9 Leo Liu                     2019-11-15  1198  			if (status & 2)
cf14826cdfb5c9 Leo Liu                     2019-11-15  1199  				break;
cf14826cdfb5c9 Leo Liu                     2019-11-15  1200  
cf14826cdfb5c9 Leo Liu                     2019-11-15  1201  			DRM_ERROR("VCN[%d] decode not responding, trying to reset the VCPU!!!\n", i);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1202  			WREG32_P(SOC15_REG_OFFSET(VCN, i, mmUVD_VCPU_CNTL),
cf14826cdfb5c9 Leo Liu                     2019-11-15  1203  				UVD_VCPU_CNTL__BLK_RST_MASK,
cf14826cdfb5c9 Leo Liu                     2019-11-15  1204  				~UVD_VCPU_CNTL__BLK_RST_MASK);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1205  			mdelay(10);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1206  			WREG32_P(SOC15_REG_OFFSET(VCN, i, mmUVD_VCPU_CNTL), 0,
cf14826cdfb5c9 Leo Liu                     2019-11-15  1207  				~UVD_VCPU_CNTL__BLK_RST_MASK);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1208  
cf14826cdfb5c9 Leo Liu                     2019-11-15  1209  			mdelay(10);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1210  			r = -1;
cf14826cdfb5c9 Leo Liu                     2019-11-15  1211  		}
cf14826cdfb5c9 Leo Liu                     2019-11-15  1212  
cf14826cdfb5c9 Leo Liu                     2019-11-15  1213  		if (r) {
cf14826cdfb5c9 Leo Liu                     2019-11-15  1214  			DRM_ERROR("VCN[%d] decode not responding, giving up!!!\n", i);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1215  			return r;
cf14826cdfb5c9 Leo Liu                     2019-11-15  1216  		}
cf14826cdfb5c9 Leo Liu                     2019-11-15  1217  
cf14826cdfb5c9 Leo Liu                     2019-11-15  1218  		/* enable master interrupt */
cf14826cdfb5c9 Leo Liu                     2019-11-15  1219  		WREG32_P(SOC15_REG_OFFSET(VCN, i, mmUVD_MASTINT_EN),
cf14826cdfb5c9 Leo Liu                     2019-11-15  1220  			UVD_MASTINT_EN__VCPU_EN_MASK,
cf14826cdfb5c9 Leo Liu                     2019-11-15  1221  			~UVD_MASTINT_EN__VCPU_EN_MASK);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1222  
cf14826cdfb5c9 Leo Liu                     2019-11-15  1223  		/* clear the busy bit of VCN_STATUS */
cf14826cdfb5c9 Leo Liu                     2019-11-15  1224  		WREG32_P(SOC15_REG_OFFSET(VCN, i, mmUVD_STATUS), 0,
cf14826cdfb5c9 Leo Liu                     2019-11-15  1225  			~(2 << UVD_STATUS__VCPU_REPORT__SHIFT));
cf14826cdfb5c9 Leo Liu                     2019-11-15  1226  
cf14826cdfb5c9 Leo Liu                     2019-11-15  1227  		WREG32_SOC15(VCN, i, mmUVD_LMI_RBC_RB_VMID, 0);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1228  
cf14826cdfb5c9 Leo Liu                     2019-11-15  1229  		ring = &adev->vcn.inst[i].ring_dec;
cf14826cdfb5c9 Leo Liu                     2019-11-15  1230  		/* force RBC into idle state */
cf14826cdfb5c9 Leo Liu                     2019-11-15  1231  		rb_bufsz = order_base_2(ring->ring_size);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1232  		tmp = REG_SET_FIELD(0, UVD_RBC_RB_CNTL, RB_BUFSZ, rb_bufsz);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1233  		tmp = REG_SET_FIELD(tmp, UVD_RBC_RB_CNTL, RB_BLKSZ, 1);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1234  		tmp = REG_SET_FIELD(tmp, UVD_RBC_RB_CNTL, RB_NO_FETCH, 1);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1235  		tmp = REG_SET_FIELD(tmp, UVD_RBC_RB_CNTL, RB_NO_UPDATE, 1);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1236  		tmp = REG_SET_FIELD(tmp, UVD_RBC_RB_CNTL, RB_RPTR_WR_EN, 1);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1237  		WREG32_SOC15(VCN, i, mmUVD_RBC_RB_CNTL, tmp);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1238  
b6065ebf55ff2f Ruijing Dong                2022-03-02  1239  		fw_shared = adev->vcn.inst[i].fw_shared.cpu_addr;
e42dd87e70e66a Sonny Jiang                 2020-11-27  1240  		fw_shared->multi_queue.decode_queue_mode |= cpu_to_le32(FW_QUEUE_RING_RESET);
e42dd87e70e66a Sonny Jiang                 2020-11-27  1241  
cf14826cdfb5c9 Leo Liu                     2019-11-15  1242  		/* programm the RB_BASE for ring buffer */
cf14826cdfb5c9 Leo Liu                     2019-11-15  1243  		WREG32_SOC15(VCN, i, mmUVD_LMI_RBC_RB_64BIT_BAR_LOW,
cf14826cdfb5c9 Leo Liu                     2019-11-15  1244  			lower_32_bits(ring->gpu_addr));
cf14826cdfb5c9 Leo Liu                     2019-11-15  1245  		WREG32_SOC15(VCN, i, mmUVD_LMI_RBC_RB_64BIT_BAR_HIGH,
cf14826cdfb5c9 Leo Liu                     2019-11-15  1246  			upper_32_bits(ring->gpu_addr));
cf14826cdfb5c9 Leo Liu                     2019-11-15  1247  
cf14826cdfb5c9 Leo Liu                     2019-11-15  1248  		/* Initialize the ring buffer's read and write pointers */
cf14826cdfb5c9 Leo Liu                     2019-11-15  1249  		WREG32_SOC15(VCN, i, mmUVD_RBC_RB_RPTR, 0);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1250  
b2576c3bf4ce9b Sonny Jiang                 2021-01-31  1251  		WREG32_SOC15(VCN, i, mmUVD_SCRATCH2, 0);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1252  		ring->wptr = RREG32_SOC15(VCN, i, mmUVD_RBC_RB_RPTR);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1253  		WREG32_SOC15(VCN, i, mmUVD_RBC_RB_WPTR,
cf14826cdfb5c9 Leo Liu                     2019-11-15  1254  			lower_32_bits(ring->wptr));
b2576c3bf4ce9b Sonny Jiang                 2021-01-31  1255  		fw_shared->rb.wptr = lower_32_bits(ring->wptr);
e42dd87e70e66a Sonny Jiang                 2020-11-27  1256  		fw_shared->multi_queue.decode_queue_mode &= cpu_to_le32(~FW_QUEUE_RING_RESET);
e42dd87e70e66a Sonny Jiang                 2020-11-27  1257  
1d789535a03679 Alex Deucher                2021-10-04  1258  		if (adev->ip_versions[UVD_HWIP][0] != IP_VERSION(3, 0, 33)) {
e42dd87e70e66a Sonny Jiang                 2020-11-27  1259  			fw_shared->multi_queue.encode_generalpurpose_queue_mode |= cpu_to_le32(FW_QUEUE_RING_RESET);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1260  			ring = &adev->vcn.inst[i].ring_enc[0];
cf14826cdfb5c9 Leo Liu                     2019-11-15  1261  			WREG32_SOC15(VCN, i, mmUVD_RB_RPTR, lower_32_bits(ring->wptr));
cf14826cdfb5c9 Leo Liu                     2019-11-15  1262  			WREG32_SOC15(VCN, i, mmUVD_RB_WPTR, lower_32_bits(ring->wptr));
cf14826cdfb5c9 Leo Liu                     2019-11-15  1263  			WREG32_SOC15(VCN, i, mmUVD_RB_BASE_LO, ring->gpu_addr);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1264  			WREG32_SOC15(VCN, i, mmUVD_RB_BASE_HI, upper_32_bits(ring->gpu_addr));
cf14826cdfb5c9 Leo Liu                     2019-11-15  1265  			WREG32_SOC15(VCN, i, mmUVD_RB_SIZE, ring->ring_size / 4);
e42dd87e70e66a Sonny Jiang                 2020-11-27  1266  			fw_shared->multi_queue.encode_generalpurpose_queue_mode &= cpu_to_le32(~FW_QUEUE_RING_RESET);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1267  
e42dd87e70e66a Sonny Jiang                 2020-11-27  1268  			fw_shared->multi_queue.encode_lowlatency_queue_mode |= cpu_to_le32(FW_QUEUE_RING_RESET);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1269  			ring = &adev->vcn.inst[i].ring_enc[1];
cf14826cdfb5c9 Leo Liu                     2019-11-15  1270  			WREG32_SOC15(VCN, i, mmUVD_RB_RPTR2, lower_32_bits(ring->wptr));
cf14826cdfb5c9 Leo Liu                     2019-11-15  1271  			WREG32_SOC15(VCN, i, mmUVD_RB_WPTR2, lower_32_bits(ring->wptr));
cf14826cdfb5c9 Leo Liu                     2019-11-15  1272  			WREG32_SOC15(VCN, i, mmUVD_RB_BASE_LO2, ring->gpu_addr);
cf14826cdfb5c9 Leo Liu                     2019-11-15 @1273  			WREG32_SOC15(VCN, i, mmUVD_RB_BASE_HI2, upper_32_bits(ring->gpu_addr));
cf14826cdfb5c9 Leo Liu                     2019-11-15  1274  			WREG32_SOC15(VCN, i, mmUVD_RB_SIZE2, ring->ring_size / 4);
e42dd87e70e66a Sonny Jiang                 2020-11-27  1275  			fw_shared->multi_queue.encode_lowlatency_queue_mode &= cpu_to_le32(~FW_QUEUE_RING_RESET);
cf14826cdfb5c9 Leo Liu                     2019-11-15  1276  		}
f703d4b6f20688 Veerabadhran Gopalakrishnan 2021-03-11  1277  	}
cf14826cdfb5c9 Leo Liu                     2019-11-15  1278  
cf14826cdfb5c9 Leo Liu                     2019-11-15  1279  	return 0;
cf14826cdfb5c9 Leo Liu                     2019-11-15  1280  }
cf14826cdfb5c9 Leo Liu                     2019-11-15  1281  

:::::: The code at line 1273 was first introduced by commit
:::::: cf14826cdfb5c9fe10f98210d040b9d7486c381d drm/amdgpu: add VCN3.0 support for Sienna_Cichlid

:::::: TO: Leo Liu <leo.liu@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
