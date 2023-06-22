Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2573815AE5
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jun 2023 13:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687442323; x=1718978323;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3A4c0db2luuGO+FRDlqjzwSx+cfzdwBUpjx00F5Wz+E=;
  b=TZo2f25BAfFbWgv+CKHbR3k4UI6HnC2Renr3B3FbJqgAhoBFWG//Mw7K
   W2kmgty0EhXLo0qadHAYzsPjUeQ/1EITELi8iGx28JaQBcenyiYRTEfBA
   5s58JF/eupMO8N2iG2u3hQCtD6tIXhOQZAKAEauF+XYdUGfUJ3+DHBSJg
   ifufNlf5uZUpijqdPw9D9dzfbDICb0NQGJmyTBa5nqSurE1lwv7J6Iwk3
   Dr7t9H62xV+zr0ciQzxMgr2C5MSl7Y8B4jSJ0uhej5VaTXqIgUJ6xEh1n
   LwDUxaXSeLyQkHpfbh4EvV3IKa1f29+Yzia6qP9tXdi3EKPt0++ODFhUy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="390237912"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="390237912"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 06:58:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="718091253"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="718091253"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 22 Jun 2023 06:58:39 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCKpa-0007Zn-2S;
	Thu, 22 Jun 2023 13:58:38 +0000
Date: Thu, 22 Jun 2023 21:57:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7316/11867]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:1673
 amdgpu_dm_init() error: we previously assumed 'adev->dm.dc' could be null
 (see line 1669)
Message-ID: <202306222109.GOpiisJ1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Aurabindo Pillai <aurabindo.pillai@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Harry Wentland <harry.wentland@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c87d46a9e8ebd2f2c3960927b1d21687096d1109
commit: 9788d087caffd8358d6e14349ee69d9385666719 [7316/11867] drm/amd/display: improve the message printed when loading DC
:::::: branch date: 8 hours ago
:::::: commit date: 13 days ago
config: mips-randconfig-m031-20230620 (https://download.01.org/0day-ci/archive/20230622/202306222109.GOpiisJ1-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306222109.GOpiisJ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306222109.GOpiisJ1-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:1673 amdgpu_dm_init() error: we previously assumed 'adev->dm.dc' could be null (see line 1669)

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:1905 amdgpu_dm_fini() error: we previously assumed 'adev->dm.dc' could be null (see line 1889)
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6079 create_stream_for_sink() error: we previously assumed 'aconnector->dc_sink' could be null (see line 5971)
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:8708 amdgpu_dm_atomic_commit_tail() error: we previously assumed 'aconnector->dc_link' could be null (see line 8689)
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:8961 dm_force_atomic_commit() error: 'crtc_state' dereferencing possible ERR_PTR()

vim +1673 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

57b9f3384c64e3 Fangzhi Zuo         2022-07-06  1531  
7578ecda14d521 Alex Deucher        2017-10-10  1532  static int amdgpu_dm_init(struct amdgpu_device *adev)
4562236b3bc0a2 Harry Wentland      2017-09-12  1533  {
4562236b3bc0a2 Harry Wentland      2017-09-12  1534  	struct dc_init_data init_data;
52704fcaf74bc9 Bhawanpreet Lakha   2019-05-24  1535  	struct dc_callback_init init_params;
743b9786b14ae0 Nicholas Kazlauskas 2019-10-24  1536  	int r;
52704fcaf74bc9 Bhawanpreet Lakha   2019-05-24  1537  
4a580877bdcb83 Luben Tuikov        2020-08-24  1538  	adev->dm.ddev = adev_to_drm(adev);
4562236b3bc0a2 Harry Wentland      2017-09-12  1539  	adev->dm.adev = adev;
4562236b3bc0a2 Harry Wentland      2017-09-12  1540  
4562236b3bc0a2 Harry Wentland      2017-09-12  1541  	/* Zero all the fields */
4562236b3bc0a2 Harry Wentland      2017-09-12  1542  	memset(&init_data, 0, sizeof(init_data));
52704fcaf74bc9 Bhawanpreet Lakha   2019-05-24  1543  	memset(&init_params, 0, sizeof(init_params));
4562236b3bc0a2 Harry Wentland      2017-09-12  1544  
ead08b95fa50f4 Stylon Wang         2022-11-10  1545  	mutex_init(&adev->dm.dpia_aux_lock);
674e78acae0dfb Nicholas Kazlauskas 2018-12-05  1546  	mutex_init(&adev->dm.dc_lock);
6ce8f316673f61 Nicholas Kazlauskas 2019-07-11  1547  	mutex_init(&adev->dm.audio_lock);
674e78acae0dfb Nicholas Kazlauskas 2018-12-05  1548  
4562236b3bc0a2 Harry Wentland      2017-09-12  1549  	if(amdgpu_dm_irq_init(adev)) {
4562236b3bc0a2 Harry Wentland      2017-09-12  1550  		DRM_ERROR("amdgpu: failed to initialize DM IRQ support.\n");
4562236b3bc0a2 Harry Wentland      2017-09-12  1551  		goto error;
4562236b3bc0a2 Harry Wentland      2017-09-12  1552  	}
4562236b3bc0a2 Harry Wentland      2017-09-12  1553  
4562236b3bc0a2 Harry Wentland      2017-09-12  1554  	init_data.asic_id.chip_family = adev->family;
4562236b3bc0a2 Harry Wentland      2017-09-12  1555  
2dc31ca1895c16 Aly-Tawfik          2020-02-25  1556  	init_data.asic_id.pci_revision_id = adev->pdev->revision;
4562236b3bc0a2 Harry Wentland      2017-09-12  1557  	init_data.asic_id.hw_internal_rev = adev->external_rev_id;
dae66a04459271 Charlene Liu        2021-09-20  1558  	init_data.asic_id.chip_id = adev->pdev->device;
4562236b3bc0a2 Harry Wentland      2017-09-12  1559  
770d13b19fdf36 Christian König     2018-01-12  1560  	init_data.asic_id.vram_width = adev->gmc.vram_width;
4562236b3bc0a2 Harry Wentland      2017-09-12  1561  	/* TODO: initialize init_data.asic_id.vram_type here!!!! */
4562236b3bc0a2 Harry Wentland      2017-09-12  1562  	init_data.asic_id.atombios_base_address =
4562236b3bc0a2 Harry Wentland      2017-09-12  1563  		adev->mode_info.atom_context->bios;
4562236b3bc0a2 Harry Wentland      2017-09-12  1564  
4562236b3bc0a2 Harry Wentland      2017-09-12  1565  	init_data.driver = adev;
4562236b3bc0a2 Harry Wentland      2017-09-12  1566  
4562236b3bc0a2 Harry Wentland      2017-09-12  1567  	adev->dm.cgs_device = amdgpu_cgs_create_device(adev);
4562236b3bc0a2 Harry Wentland      2017-09-12  1568  
4562236b3bc0a2 Harry Wentland      2017-09-12  1569  	if (!adev->dm.cgs_device) {
4562236b3bc0a2 Harry Wentland      2017-09-12  1570  		DRM_ERROR("amdgpu: failed to create cgs device.\n");
4562236b3bc0a2 Harry Wentland      2017-09-12  1571  		goto error;
4562236b3bc0a2 Harry Wentland      2017-09-12  1572  	}
4562236b3bc0a2 Harry Wentland      2017-09-12  1573  
4562236b3bc0a2 Harry Wentland      2017-09-12  1574  	init_data.cgs_device = adev->dm.cgs_device;
4562236b3bc0a2 Harry Wentland      2017-09-12  1575  
4562236b3bc0a2 Harry Wentland      2017-09-12  1576  	init_data.dce_environment = DCE_ENV_PRODUCTION_DRV;
4562236b3bc0a2 Harry Wentland      2017-09-12  1577  
1d789535a03679 Alex Deucher        2021-10-04  1578  	switch (adev->ip_versions[DCE_HWIP][0]) {
c08182f2483f94 Alex Deucher        2021-09-29  1579  	case IP_VERSION(2, 1, 0):
91adec9e07097e Mario Limonciello   2021-11-02  1580  		switch (adev->dm.dmcub_fw_version) {
91adec9e07097e Mario Limonciello   2021-11-02  1581  		case 0: /* development */
91adec9e07097e Mario Limonciello   2021-11-02  1582  		case 0x1: /* linux-firmware.git hash 6d9f399 */
91adec9e07097e Mario Limonciello   2021-11-02  1583  		case 0x01000000: /* linux-firmware.git hash 9a0b0f4 */
91adec9e07097e Mario Limonciello   2021-11-02  1584  			init_data.flags.disable_dmcu = false;
91adec9e07097e Mario Limonciello   2021-11-02  1585  			break;
91adec9e07097e Mario Limonciello   2021-11-02  1586  		default:
71c0fd9221a4f7 Roman Li            2020-10-08  1587  			init_data.flags.disable_dmcu = true;
91adec9e07097e Mario Limonciello   2021-11-02  1588  		}
60fb100b3d1676 Alex Deucher        2020-01-08  1589  		break;
fd546bc5ad909f Alex Deucher        2022-02-21  1590  	case IP_VERSION(2, 0, 3):
fd546bc5ad909f Alex Deucher        2022-02-21  1591  		init_data.flags.disable_dmcu = true;
fd546bc5ad909f Alex Deucher        2022-02-21  1592  		break;
fd546bc5ad909f Alex Deucher        2022-02-21  1593  	default:
fd546bc5ad909f Alex Deucher        2022-02-21  1594  		break;
fd546bc5ad909f Alex Deucher        2022-02-21  1595  	}
fd546bc5ad909f Alex Deucher        2022-02-21  1596  
fd546bc5ad909f Alex Deucher        2022-02-21  1597  	switch (adev->asic_type) {
fd546bc5ad909f Alex Deucher        2022-02-21  1598  	case CHIP_CARRIZO:
fd546bc5ad909f Alex Deucher        2022-02-21  1599  	case CHIP_STONEY:
fd546bc5ad909f Alex Deucher        2022-02-21  1600  		init_data.flags.gpu_vm_support = true;
fd546bc5ad909f Alex Deucher        2022-02-21  1601  		break;
fd546bc5ad909f Alex Deucher        2022-02-21  1602  	default:
fd546bc5ad909f Alex Deucher        2022-02-21  1603  		switch (adev->ip_versions[DCE_HWIP][0]) {
559f591dab57f3 Alex Deucher        2021-08-03  1604  		case IP_VERSION(1, 0, 0):
559f591dab57f3 Alex Deucher        2021-08-03  1605  		case IP_VERSION(1, 0, 1):
a7f520bfd0551f Alex Deucher        2022-02-21  1606  			/* enable S/G on PCO and RV2 */
a7f520bfd0551f Alex Deucher        2022-02-21  1607  			if ((adev->apu_flags & AMD_APU_IS_RAVEN2) ||
a7f520bfd0551f Alex Deucher        2022-02-21  1608  			    (adev->apu_flags & AMD_APU_IS_PICASSO))
a7f520bfd0551f Alex Deucher        2022-02-21  1609  				init_data.flags.gpu_vm_support = true;
a7f520bfd0551f Alex Deucher        2022-02-21  1610  			break;
c4029779c627ed Alex Deucher        2023-02-09  1611  		case IP_VERSION(2, 1, 0):
c08182f2483f94 Alex Deucher        2021-09-29  1612  		case IP_VERSION(3, 0, 1):
8f56a0fe1f3c1a Alex Deucher        2023-02-09  1613  		case IP_VERSION(3, 1, 2):
8f56a0fe1f3c1a Alex Deucher        2023-02-09  1614  		case IP_VERSION(3, 1, 3):
69ed0c5d44d720 Alex Deucher        2023-01-31  1615  		case IP_VERSION(3, 1, 4):
512e8475d2a9db Alex Deucher        2023-02-09  1616  		case IP_VERSION(3, 1, 5):
0fe382fb82dc6c Alex Deucher        2022-03-09  1617  		case IP_VERSION(3, 1, 6):
1ebcaebdb51514 Nicholas Kazlauskas 2021-05-19  1618  			init_data.flags.gpu_vm_support = true;
1ebcaebdb51514 Nicholas Kazlauskas 2021-05-19  1619  			break;
60fb100b3d1676 Alex Deucher        2020-01-08  1620  		default:
60fb100b3d1676 Alex Deucher        2020-01-08  1621  			break;
60fb100b3d1676 Alex Deucher        2020-01-08  1622  		}
c08182f2483f94 Alex Deucher        2021-09-29  1623  		break;
c08182f2483f94 Alex Deucher        2021-09-29  1624  	}
bf0207e1727031 Alex Deucher        2023-02-09  1625  	if (init_data.flags.gpu_vm_support &&
bf0207e1727031 Alex Deucher        2023-02-09  1626  	    (amdgpu_sg_display == 0))
bf0207e1727031 Alex Deucher        2023-02-09  1627  		init_data.flags.gpu_vm_support = false;
6e227308a91db5 Harry Wentland      2017-10-30  1628  
a7f520bfd0551f Alex Deucher        2022-02-21  1629  	if (init_data.flags.gpu_vm_support)
a7f520bfd0551f Alex Deucher        2022-02-21  1630  		adev->mode_info.gpu_vm_support = true;
a7f520bfd0551f Alex Deucher        2022-02-21  1631  
04b94af4e348ac Alex Deucher        2018-11-06  1632  	if (amdgpu_dc_feature_mask & DC_FBC_MASK)
04b94af4e348ac Alex Deucher        2018-11-06  1633  		init_data.flags.fbc_support = true;
04b94af4e348ac Alex Deucher        2018-11-06  1634  
d99f38aed1a03f Alex Deucher        2019-08-22  1635  	if (amdgpu_dc_feature_mask & DC_MULTI_MON_PP_MCLK_SWITCH_MASK)
d99f38aed1a03f Alex Deucher        2019-08-22  1636  		init_data.flags.multi_mon_pp_mclk_switch = true;
d99f38aed1a03f Alex Deucher        2019-08-22  1637  
eaf56410ccb06f Leo Li              2019-10-21  1638  	if (amdgpu_dc_feature_mask & DC_DISABLE_FRACTIONAL_PWM_MASK)
eaf56410ccb06f Leo Li              2019-10-21  1639  		init_data.flags.disable_fractional_pwm = true;
a51482458dafb8 Zhan Liu            2021-06-14  1640  
a51482458dafb8 Zhan Liu            2021-06-14  1641  	if (amdgpu_dc_feature_mask & DC_EDP_NO_POWER_SEQUENCING)
a51482458dafb8 Zhan Liu            2021-06-14  1642  		init_data.flags.edp_no_power_sequencing = true;
eaf56410ccb06f Leo Li              2019-10-21  1643  
123202744955e6 Aurabindo Pillai    2021-12-07  1644  	if (amdgpu_dc_feature_mask & DC_DISABLE_LTTPR_DP1_4A)
123202744955e6 Aurabindo Pillai    2021-12-07  1645  		init_data.flags.allow_lttpr_non_transparent_mode.bits.DP1_4A = true;
123202744955e6 Aurabindo Pillai    2021-12-07  1646  	if (amdgpu_dc_feature_mask & DC_DISABLE_LTTPR_DP2_0)
123202744955e6 Aurabindo Pillai    2021-12-07  1647  		init_data.flags.allow_lttpr_non_transparent_mode.bits.DP2_0 = true;
123202744955e6 Aurabindo Pillai    2021-12-07  1648  
7aba117ac9e01d Jarif Aftab         2021-11-16  1649  	init_data.flags.seamless_boot_edp_requested = false;
78ad75f8d77a1a Thomas Lim          2019-05-07  1650  
1edf5ae1fdaffb Zhan Liu            2021-11-08  1651  	if (check_seamless_boot_capability(adev)) {
7aba117ac9e01d Jarif Aftab         2021-11-16  1652  		init_data.flags.seamless_boot_edp_requested = true;
1edf5ae1fdaffb Zhan Liu            2021-11-08  1653  		init_data.flags.allow_seamless_boot_optimization = true;
1edf5ae1fdaffb Zhan Liu            2021-11-08  1654  		DRM_INFO("Seamless boot condition check passed\n");
1edf5ae1fdaffb Zhan Liu            2021-11-08  1655  	}
1edf5ae1fdaffb Zhan Liu            2021-11-08  1656  
a820190204aef0 Leung, Martin       2022-05-13  1657  	init_data.flags.enable_mipi_converter_optimization = true;
a820190204aef0 Leung, Martin       2022-05-13  1658  
e5028e9fd3bc7c Harry Wentland      2022-02-01  1659  	init_data.dcn_reg_offsets = adev->reg_offset[DCE_HWIP][0];
2a93292fb7860b Aurabindo Pillai    2022-04-04  1660  	init_data.nbio_reg_offsets = adev->reg_offset[NBIO_HWIP][0];
e5028e9fd3bc7c Harry Wentland      2022-02-01  1661  
0dd79532340568 Zhan Liu            2021-03-08  1662  	INIT_LIST_HEAD(&adev->dm.da_list);
57b9f3384c64e3 Fangzhi Zuo         2022-07-06  1663  
57b9f3384c64e3 Fangzhi Zuo         2022-07-06  1664  	retrieve_dmi_info(&adev->dm);
57b9f3384c64e3 Fangzhi Zuo         2022-07-06  1665  
4562236b3bc0a2 Harry Wentland      2017-09-12  1666  	/* Display Core create. */
4562236b3bc0a2 Harry Wentland      2017-09-12  1667  	adev->dm.dc = dc_create(&init_data);
4562236b3bc0a2 Harry Wentland      2017-09-12  1668  
423788c7a866cb Ernst Sjöstrand     2017-11-07 @1669  	if (adev->dm.dc) {
9788d087caffd8 Aurabindo Pillai    2023-05-05  1670  		DRM_INFO("Display Core v%s initialized on %s\n", DC_VER,
bf7fda0b3736f9 Rodrigo Siqueira    2023-04-25  1671  			 dce_version_to_string(adev->dm.dc->ctx->dce_version));
423788c7a866cb Ernst Sjöstrand     2017-11-07  1672  	} else {
9788d087caffd8 Aurabindo Pillai    2023-05-05 @1673  		DRM_INFO("Display Core v%s failed to initialize on %s\n", DC_VER,
9788d087caffd8 Aurabindo Pillai    2023-05-05  1674  			 dce_version_to_string(adev->dm.dc->ctx->dce_version));
423788c7a866cb Ernst Sjöstrand     2017-11-07  1675  		goto error;
423788c7a866cb Ernst Sjöstrand     2017-11-07  1676  	}
4562236b3bc0a2 Harry Wentland      2017-09-12  1677  
8a791dabea1816 Harry Wentland      2020-05-01  1678  	if (amdgpu_dc_debug_mask & DC_DISABLE_PIPE_SPLIT) {
8a791dabea1816 Harry Wentland      2020-05-01  1679  		adev->dm.dc->debug.force_single_disp_pipe_split = false;
8a791dabea1816 Harry Wentland      2020-05-01  1680  		adev->dm.dc->debug.pipe_split_policy = MPC_SPLIT_AVOID;
8a791dabea1816 Harry Wentland      2020-05-01  1681  	}
8a791dabea1816 Harry Wentland      2020-05-01  1682  
f99d8762501df5 Harry Wentland      2020-05-07  1683  	if (adev->asic_type != CHIP_CARRIZO && adev->asic_type != CHIP_STONEY)
f99d8762501df5 Harry Wentland      2020-05-07  1684  		adev->dm.dc->debug.disable_stutter = amdgpu_pp_feature_mask & PP_STUTTER_MODE ? false : true;
3ce51649cdf23a Alex Deucher        2021-10-20  1685  	if (dm_should_disable_stutter(adev->pdev))
3ce51649cdf23a Alex Deucher        2021-10-20  1686  		adev->dm.dc->debug.disable_stutter = true;
f99d8762501df5 Harry Wentland      2020-05-07  1687  
8a791dabea1816 Harry Wentland      2020-05-01  1688  	if (amdgpu_dc_debug_mask & DC_DISABLE_STUTTER)
8a791dabea1816 Harry Wentland      2020-05-01  1689  		adev->dm.dc->debug.disable_stutter = true;
8a791dabea1816 Harry Wentland      2020-05-01  1690  
2665f63a736463 Mikita Lipski       2021-10-20  1691  	if (amdgpu_dc_debug_mask & DC_DISABLE_DSC) {
8a791dabea1816 Harry Wentland      2020-05-01  1692  		adev->dm.dc->debug.disable_dsc = true;
2665f63a736463 Mikita Lipski       2021-10-20  1693  	}
8a791dabea1816 Harry Wentland      2020-05-01  1694  
8a791dabea1816 Harry Wentland      2020-05-01  1695  	if (amdgpu_dc_debug_mask & DC_DISABLE_CLOCK_GATING)
8a791dabea1816 Harry Wentland      2020-05-01  1696  		adev->dm.dc->debug.disable_clock_gate = true;
8a791dabea1816 Harry Wentland      2020-05-01  1697  
cfb979f7173636 Aurabindo Pillai    2022-06-28  1698  	if (amdgpu_dc_debug_mask & DC_FORCE_SUBVP_MCLK_SWITCH)
cfb979f7173636 Aurabindo Pillai    2022-06-28  1699  		adev->dm.dc->debug.force_subvp_mclk_switch = true;
cfb979f7173636 Aurabindo Pillai    2022-06-28  1700  
792a0cdde34d41 Leo Li              2022-07-06  1701  	adev->dm.dc->debug.visual_confirm = amdgpu_dc_visual_confirm;
792a0cdde34d41 Leo Li              2022-07-06  1702  
d1bc26cb5cd51f Fangzhi Zuo         2022-10-20  1703  	/* TODO: Remove after DP2 receiver gets proper support of Cable ID feature */
d1bc26cb5cd51f Fangzhi Zuo         2022-10-20  1704  	adev->dm.dc->debug.ignore_cable_id = true;
d1bc26cb5cd51f Fangzhi Zuo         2022-10-20  1705  
3d8fcc6740c9f9 Wenjing Liu         2023-01-26  1706  	/* TODO: There is a new drm mst change where the freedom of
3d8fcc6740c9f9 Wenjing Liu         2023-01-26  1707  	 * vc_next_start_slot update is revoked/moved into drm, instead of in
3d8fcc6740c9f9 Wenjing Liu         2023-01-26  1708  	 * driver. This forces us to make sure to get vc_next_start_slot updated
3d8fcc6740c9f9 Wenjing Liu         2023-01-26  1709  	 * in drm function each time without considering if mst_state is active
3d8fcc6740c9f9 Wenjing Liu         2023-01-26  1710  	 * or not. Otherwise, next time hotplug will give wrong start_slot
3d8fcc6740c9f9 Wenjing Liu         2023-01-26  1711  	 * number. We are implementing a temporary solution to even notify drm
3d8fcc6740c9f9 Wenjing Liu         2023-01-26  1712  	 * mst deallocation when link is no longer of MST type when uncommitting
3d8fcc6740c9f9 Wenjing Liu         2023-01-26  1713  	 * the stream so we will have more time to work on a proper solution.
3d8fcc6740c9f9 Wenjing Liu         2023-01-26  1714  	 * Ideally when dm_helpers_dp_mst_stop_top_mgr message is triggered, we
3d8fcc6740c9f9 Wenjing Liu         2023-01-26  1715  	 * should notify drm to do a complete "reset" of its states and stop
3d8fcc6740c9f9 Wenjing Liu         2023-01-26  1716  	 * calling further drm mst functions when link is no longer of an MST
3d8fcc6740c9f9 Wenjing Liu         2023-01-26  1717  	 * type. This could happen when we unplug an MST hubs/displays. When
3d8fcc6740c9f9 Wenjing Liu         2023-01-26  1718  	 * uncommit stream comes later after unplug, we should just reset
3d8fcc6740c9f9 Wenjing Liu         2023-01-26  1719  	 * hardware states only.
3d8fcc6740c9f9 Wenjing Liu         2023-01-26  1720  	 */
3d8fcc6740c9f9 Wenjing Liu         2023-01-26  1721  	adev->dm.dc->debug.temp_mst_deallocation_sequence = true;
3d8fcc6740c9f9 Wenjing Liu         2023-01-26  1722  
e3834491b92a10 Fangzhi Zuo         2023-01-16  1723  	if (adev->dm.dc->caps.dp_hdmi21_pcon_support)
e3834491b92a10 Fangzhi Zuo         2023-01-16  1724  		DRM_INFO("DP-HDMI FRL PCON supported\n");
e3834491b92a10 Fangzhi Zuo         2023-01-16  1725  
743b9786b14ae0 Nicholas Kazlauskas 2019-10-24  1726  	r = dm_dmub_hw_init(adev);
743b9786b14ae0 Nicholas Kazlauskas 2019-10-24  1727  	if (r) {
743b9786b14ae0 Nicholas Kazlauskas 2019-10-24  1728  		DRM_ERROR("DMUB interface failed to initialize: status=%d\n", r);
743b9786b14ae0 Nicholas Kazlauskas 2019-10-24  1729  		goto error;
743b9786b14ae0 Nicholas Kazlauskas 2019-10-24  1730  	}
743b9786b14ae0 Nicholas Kazlauskas 2019-10-24  1731  
bb6785c1212988 Nicholas Kazlauskas 2020-01-10  1732  	dc_hardware_init(adev->dm.dc);
bb6785c1212988 Nicholas Kazlauskas 2020-01-10  1733  
8e794421bc9815 Wayne Lin           2021-07-23  1734  	adev->dm.hpd_rx_offload_wq = hpd_rx_irq_create_workqueue(adev->dm.dc);
8e794421bc9815 Wayne Lin           2021-07-23  1735  	if (!adev->dm.hpd_rx_offload_wq) {
8e794421bc9815 Wayne Lin           2021-07-23  1736  		DRM_ERROR("amdgpu: failed to create hpd rx offload workqueue.\n");
8e794421bc9815 Wayne Lin           2021-07-23  1737  		goto error;
8e794421bc9815 Wayne Lin           2021-07-23  1738  	}
8e794421bc9815 Wayne Lin           2021-07-23  1739  
3ca001aff08785 Aaron Liu           2021-08-23  1740  	if ((adev->flags & AMD_IS_APU) && (adev->asic_type >= CHIP_CARRIZO)) {
e6cd859dc65f19 Alex Deucher        2020-10-27  1741  		struct dc_phy_addr_space_config pa_config;
e6cd859dc65f19 Alex Deucher        2020-10-27  1742  
c0fb85ae02b62b Yifan Zhang         2020-08-31  1743  		mmhub_read_system_context(adev, &pa_config);
c0fb85ae02b62b Yifan Zhang         2020-08-31  1744  
c0fb85ae02b62b Yifan Zhang         2020-08-31  1745  		// Call the DC init_memory func
c0fb85ae02b62b Yifan Zhang         2020-08-31  1746  		dc_setup_system_context(adev->dm.dc, &pa_config);
0b08c54bb7a370 Yifan Zhang         2020-10-20  1747  	}
c0fb85ae02b62b Yifan Zhang         2020-08-31  1748  
4562236b3bc0a2 Harry Wentland      2017-09-12  1749  	adev->dm.freesync_module = mod_freesync_create(adev->dm.dc);
4562236b3bc0a2 Harry Wentland      2017-09-12  1750  	if (!adev->dm.freesync_module) {
4562236b3bc0a2 Harry Wentland      2017-09-12  1751  		DRM_ERROR(
4562236b3bc0a2 Harry Wentland      2017-09-12  1752  		"amdgpu: failed to initialize freesync_module.\n");
4562236b3bc0a2 Harry Wentland      2017-09-12  1753  	} else
f1ad2f5efd29dc Harry Wentland      2017-09-12  1754  		DRM_DEBUG_DRIVER("amdgpu: freesync_module init done %p.\n",
4562236b3bc0a2 Harry Wentland      2017-09-12  1755  				adev->dm.freesync_module);
4562236b3bc0a2 Harry Wentland      2017-09-12  1756  
e277adc5a06cfc Leo (Sunpeng  Li    2018-02-02  1757) 	amdgpu_dm_init_color_mod();
e277adc5a06cfc Leo (Sunpeng  Li    2018-02-02  1758) 
ea3b4242bc9ca1 Qingqing Zhuo       2021-02-09  1759  	if (adev->dm.dc->caps.max_links > 0) {
09a5df6c444cf0 Nicholas Kazlauskas 2021-08-03  1760  		adev->dm.vblank_control_workqueue =
09a5df6c444cf0 Nicholas Kazlauskas 2021-08-03  1761  			create_singlethread_workqueue("dm_vblank_control_workqueue");
09a5df6c444cf0 Nicholas Kazlauskas 2021-08-03  1762  		if (!adev->dm.vblank_control_workqueue)
ea3b4242bc9ca1 Qingqing Zhuo       2021-02-09  1763  			DRM_ERROR("amdgpu: failed to initialize vblank_workqueue.\n");
ea3b4242bc9ca1 Qingqing Zhuo       2021-02-09  1764  	}
ea3b4242bc9ca1 Qingqing Zhuo       2021-02-09  1765  
c08182f2483f94 Alex Deucher        2021-09-29  1766  	if (adev->dm.dc->caps.max_links > 0 && adev->family >= AMDGPU_FAMILY_RV) {
e50dc17163d9a4 Bhawanpreet Lakha   2019-12-12  1767  		adev->dm.hdcp_workqueue = hdcp_create_workqueue(adev, &init_params.cp_psp, adev->dm.dc);
52704fcaf74bc9 Bhawanpreet Lakha   2019-05-24  1768  
52704fcaf74bc9 Bhawanpreet Lakha   2019-05-24  1769  		if (!adev->dm.hdcp_workqueue)
52704fcaf74bc9 Bhawanpreet Lakha   2019-05-24  1770  			DRM_ERROR("amdgpu: failed to initialize hdcp_workqueue.\n");
52704fcaf74bc9 Bhawanpreet Lakha   2019-05-24  1771  		else
52704fcaf74bc9 Bhawanpreet Lakha   2019-05-24  1772  			DRM_DEBUG_DRIVER("amdgpu: hdcp_workqueue init done %p.\n", adev->dm.hdcp_workqueue);
52704fcaf74bc9 Bhawanpreet Lakha   2019-05-24  1773  
52704fcaf74bc9 Bhawanpreet Lakha   2019-05-24  1774  		dc_init_callbacks(adev->dm.dc, &init_params);
96a3b32e67236f Bhawanpreet Lakha   2019-06-24  1775  	}
11d526f1972f48 Stylon Wang         2022-07-07  1776  	if (dc_is_dmub_outbox_supported(adev->dm.dc)) {
81927e2808be5a Jude Shih           2021-04-20  1777  		init_completion(&adev->dm.dmub_aux_transfer_done);
81927e2808be5a Jude Shih           2021-04-20  1778  		adev->dm.dmub_notify = kzalloc(sizeof(struct dmub_notification), GFP_KERNEL);
81927e2808be5a Jude Shih           2021-04-20  1779  		if (!adev->dm.dmub_notify) {
81927e2808be5a Jude Shih           2021-04-20  1780  			DRM_INFO("amdgpu: fail to allocate adev->dm.dmub_notify");
81927e2808be5a Jude Shih           2021-04-20  1781  			goto error;
81927e2808be5a Jude Shih           2021-04-20  1782  		}
e27c41d5b0681c Jude Shih           2021-07-25  1783  
e27c41d5b0681c Jude Shih           2021-07-25  1784  		adev->dm.delayed_hpd_wq = create_singlethread_workqueue("amdgpu_dm_hpd_wq");
e27c41d5b0681c Jude Shih           2021-07-25  1785  		if (!adev->dm.delayed_hpd_wq) {
e27c41d5b0681c Jude Shih           2021-07-25  1786  			DRM_ERROR("amdgpu: failed to create hpd offload workqueue.\n");
e27c41d5b0681c Jude Shih           2021-07-25  1787  			goto error;
e27c41d5b0681c Jude Shih           2021-07-25  1788  		}
e27c41d5b0681c Jude Shih           2021-07-25  1789  
81927e2808be5a Jude Shih           2021-04-20  1790  		amdgpu_dm_outbox_init(adev);
e27c41d5b0681c Jude Shih           2021-07-25  1791  		if (!register_dmub_notify_callback(adev, DMUB_NOTIFICATION_AUX_REPLY,
e27c41d5b0681c Jude Shih           2021-07-25  1792  			dmub_aux_setconfig_callback, false)) {
e27c41d5b0681c Jude Shih           2021-07-25  1793  			DRM_ERROR("amdgpu: fail to register dmub aux callback");
e27c41d5b0681c Jude Shih           2021-07-25  1794  			goto error;
e27c41d5b0681c Jude Shih           2021-07-25  1795  		}
e27c41d5b0681c Jude Shih           2021-07-25  1796  		if (!register_dmub_notify_callback(adev, DMUB_NOTIFICATION_HPD, dmub_hpd_callback, true)) {
e27c41d5b0681c Jude Shih           2021-07-25  1797  			DRM_ERROR("amdgpu: fail to register dmub hpd callback");
e27c41d5b0681c Jude Shih           2021-07-25  1798  			goto error;
e27c41d5b0681c Jude Shih           2021-07-25  1799  		}
c40a09e56fa3d1 Nicholas Kazlauskas 2021-11-04  1800  		if (!register_dmub_notify_callback(adev, DMUB_NOTIFICATION_HPD_IRQ, dmub_hpd_callback, true)) {
c40a09e56fa3d1 Nicholas Kazlauskas 2021-11-04  1801  			DRM_ERROR("amdgpu: fail to register dmub hpd callback");
c40a09e56fa3d1 Nicholas Kazlauskas 2021-11-04  1802  			goto error;
c40a09e56fa3d1 Nicholas Kazlauskas 2021-11-04  1803  		}
81927e2808be5a Jude Shih           2021-04-20  1804  	}
81927e2808be5a Jude Shih           2021-04-20  1805  
11d526f1972f48 Stylon Wang         2022-07-07  1806  	/* Enable outbox notification only after IRQ handlers are registered and DMUB is alive.
11d526f1972f48 Stylon Wang         2022-07-07  1807  	 * It is expected that DMUB will resend any pending notifications at this point, for
11d526f1972f48 Stylon Wang         2022-07-07  1808  	 * example HPD from DPIA.
11d526f1972f48 Stylon Wang         2022-07-07  1809  	 */
11d526f1972f48 Stylon Wang         2022-07-07  1810  	if (dc_is_dmub_outbox_supported(adev->dm.dc))
11d526f1972f48 Stylon Wang         2022-07-07  1811  		dc_enable_dmub_outbox(adev->dm.dc);
11d526f1972f48 Stylon Wang         2022-07-07  1812  
1c43a48b44a544 Stylon Wang         2022-10-24  1813  	if (amdgpu_dm_initialize_drm_device(adev)) {
1c43a48b44a544 Stylon Wang         2022-10-24  1814  		DRM_ERROR(
1c43a48b44a544 Stylon Wang         2022-10-24  1815  		"amdgpu: failed to initialize sw for display support.\n");
1c43a48b44a544 Stylon Wang         2022-10-24  1816  		goto error;
1c43a48b44a544 Stylon Wang         2022-10-24  1817  	}
1c43a48b44a544 Stylon Wang         2022-10-24  1818  
f74367e492ba24 Alex Deucher        2020-07-10  1819  	/* create fake encoders for MST */
f74367e492ba24 Alex Deucher        2020-07-10  1820  	dm_dp_create_fake_mst_encoders(adev);
f74367e492ba24 Alex Deucher        2020-07-10  1821  
4562236b3bc0a2 Harry Wentland      2017-09-12  1822  	/* TODO: Add_display_info? */
4562236b3bc0a2 Harry Wentland      2017-09-12  1823  
4562236b3bc0a2 Harry Wentland      2017-09-12  1824  	/* TODO use dynamic cursor width */
4a580877bdcb83 Luben Tuikov        2020-08-24  1825  	adev_to_drm(adev)->mode_config.cursor_width = adev->dm.dc->caps.max_cursor_size;
4a580877bdcb83 Luben Tuikov        2020-08-24  1826  	adev_to_drm(adev)->mode_config.cursor_height = adev->dm.dc->caps.max_cursor_size;
4562236b3bc0a2 Harry Wentland      2017-09-12  1827  
4a580877bdcb83 Luben Tuikov        2020-08-24  1828  	if (drm_vblank_init(adev_to_drm(adev), adev->dm.display_indexes_num)) {
4562236b3bc0a2 Harry Wentland      2017-09-12  1829  		DRM_ERROR(
4562236b3bc0a2 Harry Wentland      2017-09-12  1830  		"amdgpu: failed to initialize sw for display support.\n");
4562236b3bc0a2 Harry Wentland      2017-09-12  1831  		goto error;
4562236b3bc0a2 Harry Wentland      2017-09-12  1832  	}
4562236b3bc0a2 Harry Wentland      2017-09-12  1833  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
