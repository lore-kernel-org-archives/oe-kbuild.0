Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31645174D1
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Jun 2023 21:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687297483; x=1718833483;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GfUCCtje7kEtS06Swpbmn8FYeTYrjH50Qvjr6LfashU=;
  b=hW37PP8Goj9iuSgcEESN5jN40mhvzrMnah+oKqW+lHHcT3smZqtou1GY
   +xBybqifb6KADLcpVUxO5KUGUOemDjbEnmoBeiYxrhjQ7n30c1020uEu/
   2VvqIRm3f28zdW94f8aiRoG2MMuy90+3Qiw/vecUgqblUA10zrA6u6Krv
   Jt4dBHOQgnkp2P4/jY8cZRdCIgjRV/y9I4ygzPeFizV7kjTSyhZo+R03N
   /YF+LHe3Ih0QlLxWIrf2A8+Mvjmuk9Avcjt77/qWgeX8E1rAziKjFX9Rv
   zVSwNPtARZ9EWBx0bTM2ZAO34griLP63HqBLVC0HA4DHOdDzKveyoOxQD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="423658097"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="423658097"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 14:44:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="714205536"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="714205536"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Jun 2023 14:44:40 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBj9T-0006Gy-2o;
	Tue, 20 Jun 2023 21:44:39 +0000
Date: Wed, 21 Jun 2023 05:44:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] drm/amd/amdgpu: =?utf-8?Q?Use_?=
 =?utf-8?B?4oCcX19wYWNrZWTigJw=?= instead of "pragma pack()"
Message-ID: <202306210527.Oxvd2Jlz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230620085543.576733-1-suhui@nfschina.com>
References: <20230620085543.576733-1-suhui@nfschina.com>
TO: Su Hui <suhui@nfschina.com>
TO: alexander.deucher@amd.com
TO: christian.koenig@amd.com
TO: Xinhui.Pan@amd.com
TO: airlied@gmail.com
TO: daniel@ffwll.ch
CC: Su Hui <suhui@nfschina.com>
CC: Jane.Jian@amd.com
CC: David.Francis@amd.com
CC: kernel-janitors@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: amd-gfx@lists.freedesktop.org
CC: Likun.Gao@amd.com
CC: dan.carpenter@linaro.org

Hi Su,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.4-rc7 next-20230620]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Su-Hui/drm-amd-amdgpu-Use-__packed-instead-of-pragma-pack/20230620-165739
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230620085543.576733-1-suhui%40nfschina.com
patch subject: [PATCH] drm/amd/amdgpu: Use “__packed“ instead of "pragma pack()"
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: mips-randconfig-m031-20230620 (https://download.01.org/0day-ci/archive/20230621/202306210527.Oxvd2Jlz-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306210527.Oxvd2Jlz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306210527.Oxvd2Jlz-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:5914 amdgpu_pci_slot_reset() error: uninitialized symbol 'memsize'.
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2244 amdgpu_fill_buffer() error: uninitialized symbol 'r'.
drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c:55 amdgpu_benchmark_do_move() error: uninitialized symbol 'r'.
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:534 amdgpu_vram_mgr_new() error: uninitialized symbol 'cur_size'.
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:534 amdgpu_vram_mgr_new() error: uninitialized symbol 'size'.
drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1274 amdgpu_ras_query_error_count() error: uninitialized symbol 'ret'.
drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c:141 amdgpu_securedisplay_debugfs_write() error: uninitialized symbol 'phy_id'.
drivers/gpu/drm/amd/amdgpu/aldebaran.c:103 aldebaran_mode2_suspend_ip() error: uninitialized symbol 'r'.
drivers/gpu/drm/amd/amdgpu/aldebaran.c:385 aldebaran_mode2_restore_hwcontext() error: uninitialized symbol 'r'.
drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c:96 sienna_cichlid_mode2_suspend_ip() error: uninitialized symbol 'r'.
drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.c:95 smu_v13_0_10_mode2_suspend_ip() error: uninitialized symbol 'r'.
drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c:612 mmhub_v2_0_update_medium_grain_clock_gating() error: uninitialized symbol 'def'.
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1183 amdgpu_gfx_cp_init_microcode() error: uninitialized symbol 'ucode_fw'.
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1184 amdgpu_gfx_cp_init_microcode() error: uninitialized symbol 'fw_size'.
drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:594 sdma_v4_0_init_microcode() error: uninitialized symbol 'ret'.
drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:251 sdma_v5_0_init_microcode() error: uninitialized symbol 'ret'.
drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:1021 sdma_v5_0_ring_test_ring() error: uninitialized symbol 'index'.
drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c:905 sdma_v6_0_ring_test_ring() error: uninitialized symbol 'index'.
drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:145 sdma_v4_4_2_init_microcode() error: uninitialized symbol 'ret'.
drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:1390 sdma_v4_4_2_sw_init() error: uninitialized symbol 'r'.
drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:855 sdma_v5_2_ring_test_ring() error: uninitialized symbol 'index'.
drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:361 vcn_v3_0_hw_init() error: uninitialized symbol 'r'.
drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c:222 vcn_v4_0_3_hw_init() error: uninitialized symbol 'r'.
drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:281 vcn_v4_0_hw_init() error: uninitialized symbol 'r'.
drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c:592 amdgpu_amdkfd_get_xgmi_bandwidth_mbytes() error: uninitialized symbol 'peer_adev'.
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:1011 vangogh_get_dpm_ultimate_freq() error: uninitialized symbol 'mclk_mask'.
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:1016 vangogh_get_dpm_ultimate_freq() error: uninitialized symbol 'soc_mask'.
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:1021 vangogh_get_dpm_ultimate_freq() error: uninitialized symbol 'fclk_mask'.
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:1026 vangogh_get_dpm_ultimate_freq() error: uninitialized symbol 'vclk_mask'.
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:1031 vangogh_get_dpm_ultimate_freq() error: uninitialized symbol 'dclk_mask'.
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.c:1085 smu_v13_0_0_get_od_setting_limits() error: uninitialized symbol 'od_min_setting'.
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.c:1087 smu_v13_0_0_get_od_setting_limits() error: uninitialized symbol 'od_max_setting'.
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_7_ppt.c:1076 smu_v13_0_7_get_od_setting_limits() error: uninitialized symbol 'od_min_setting'.
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_7_ppt.c:1078 smu_v13_0_7_get_od_setting_limits() error: uninitialized symbol 'od_max_setting'.
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:121 __smu_cmn_poll_stat() error: uninitialized symbol 'reg'.
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:187 smu_get_mclk() error: uninitialized symbol 'clk_freq'.
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:201 smu_get_sclk() error: uninitialized symbol 'clk_freq'.

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:1344 amdgpu_device_resize_fb_bar() warn: impossible condition '(res->start > 4294967296) => (0-u32max > 4294967296)'
drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2307 amdgpu_ras_recovery_init() warn: Please consider using kzalloc instead of kmalloc
drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2579 amdgpu_ras_init() warn: Please consider using kzalloc instead of kmalloc
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:134 amdgpu_gfx_parse_disable_cu() warn: potential spectre issue 'mask' [w]
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:614 amdgpu_gfx_enable_kcq() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1879 sdma_v4_0_sw_init() error: uninitialized symbol 'r'.
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.c:2580 smu_v13_0_0_check_ecc_table_support() warn: missing error code? 'ret'

vim +/memsize +5914 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c

c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5875  
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5876  /**
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5877   * amdgpu_pci_slot_reset - Called when PCI slot has been reset.
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5878   * @pdev: PCI device struct
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5879   *
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5880   * Description: This routine is called by the pci error recovery
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5881   * code after the PCI slot has been reset, just before we
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5882   * should resume normal operations.
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5883   */
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5884  pci_ers_result_t amdgpu_pci_slot_reset(struct pci_dev *pdev)
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5885  {
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5886  	struct drm_device *dev = pci_get_drvdata(pdev);
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5887  	struct amdgpu_device *adev = drm_to_adev(dev);
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5888  	int r, i;
04442bf70debb1 Lijo Lazar        2021-03-16  5889  	struct amdgpu_reset_context reset_context;
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5890  	u32 memsize;
7ac71382e90aba Andrey Grodzovsky 2020-08-24  5891  	struct list_head device_list;
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5892  
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5893  	DRM_INFO("PCI error: slot reset callback!!\n");
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5894  
04442bf70debb1 Lijo Lazar        2021-03-16  5895  	memset(&reset_context, 0, sizeof(reset_context));
04442bf70debb1 Lijo Lazar        2021-03-16  5896  
7ac71382e90aba Andrey Grodzovsky 2020-08-24  5897  	INIT_LIST_HEAD(&device_list);
655ce9cb13b596 shaoyunl          2021-03-04  5898  	list_add_tail(&adev->reset_list, &device_list);
7ac71382e90aba Andrey Grodzovsky 2020-08-24  5899  
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5900  	/* wait for asic to come out of reset */
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5901  	msleep(500);
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5902  
7ac71382e90aba Andrey Grodzovsky 2020-08-24  5903  	/* Restore PCI confspace */
c1dd4aa624076c Andrey Grodzovsky 2020-08-24  5904  	amdgpu_device_load_pci_state(pdev);
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5905  
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5906  	/* confirm  ASIC came out of reset */
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5907  	for (i = 0; i < adev->usec_timeout; i++) {
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5908  		memsize = amdgpu_asic_get_config_memsize(adev);
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5909  
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5910  		if (memsize != 0xffffffff)
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5911  			break;
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5912  		udelay(1);
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5913  	}
362c7b91c1b00e Andrey Grodzovsky 2020-08-24 @5914  	if (memsize == 0xffffffff) {
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5915  		r = -ETIME;
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5916  		goto out;
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5917  	}
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5918  
04442bf70debb1 Lijo Lazar        2021-03-16  5919  	reset_context.method = AMD_RESET_METHOD_NONE;
04442bf70debb1 Lijo Lazar        2021-03-16  5920  	reset_context.reset_req_dev = adev;
04442bf70debb1 Lijo Lazar        2021-03-16  5921  	set_bit(AMDGPU_NEED_FULL_RESET, &reset_context.flags);
04442bf70debb1 Lijo Lazar        2021-03-16  5922  	set_bit(AMDGPU_SKIP_HW_RESET, &reset_context.flags);
04442bf70debb1 Lijo Lazar        2021-03-16  5923  
7afefb81b72cbc Andrey Grodzovsky 2021-05-21  5924  	adev->no_hw_access = true;
04442bf70debb1 Lijo Lazar        2021-03-16  5925  	r = amdgpu_device_pre_asic_reset(adev, &reset_context);
7afefb81b72cbc Andrey Grodzovsky 2021-05-21  5926  	adev->no_hw_access = false;
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5927  	if (r)
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5928  		goto out;
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5929  
04442bf70debb1 Lijo Lazar        2021-03-16  5930  	r = amdgpu_do_asic_reset(&device_list, &reset_context);
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5931  
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5932  out:
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5933  	if (!r) {
c1dd4aa624076c Andrey Grodzovsky 2020-08-24  5934  		if (amdgpu_device_cache_pci_state(adev->pdev))
c1dd4aa624076c Andrey Grodzovsky 2020-08-24  5935  			pci_restore_state(adev->pdev);
c1dd4aa624076c Andrey Grodzovsky 2020-08-24  5936  
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5937  		DRM_INFO("PCIe error recovery succeeded\n");
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5938  	} else {
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5939  		DRM_ERROR("PCIe error recovery failed, err:%d", r);
e923be9934a9c5 Andrey Grodzovsky 2022-01-25  5940  		amdgpu_device_unset_mp1_state(adev);
e923be9934a9c5 Andrey Grodzovsky 2022-01-25  5941  		amdgpu_device_unlock_reset_domain(adev->reset_domain);
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5942  	}
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5943  
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5944  	return r ? PCI_ERS_RESULT_DISCONNECT : PCI_ERS_RESULT_RECOVERED;
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5945  }
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5946  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
