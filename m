Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55566326955
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Dec 2025 18:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765392170; cv=none; b=PjshhC6xTC3jV7scZWfEZ7sSLi8AsUofUGk+Ulef31wAfXXXPnth5q7jIfKhs8UioXzKqQEpvwPx2L1vRAc8FUPmvNbqIeS2tLY54nkIfJWOqyrqM6Iuog4IS4XoWUL9CiTC/WJaHVL+vtwtgSO1jDTspgk4H3Xg0ibfzW0LZvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765392170; c=relaxed/simple;
	bh=xmmn13zTcVkHQ+AN7Q4SKZfO28YUGK2FOw/jvyVfPfM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NaMZFy0rd7OhkwqrCnfI8kwSquo0/rMlOAkwEJEBBnLOetDWNFDItrbwbNolYFdwCIwOQbT29jbswj+vdnAVqMSPMSv9AmSgwu04yf+UAYWcnxeN09TMY8CvTbV2/h/Jp9QHRu8mHOvulnqBthdoUQztV9AuhOivLHWViRNPuOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VqbTTvbv; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VqbTTvbv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765392169; x=1796928169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xmmn13zTcVkHQ+AN7Q4SKZfO28YUGK2FOw/jvyVfPfM=;
  b=VqbTTvbv3EvMD2Y2HWXTlHlXBjkdDBwWcFVAJFXjENgqAyBPOLyIzo2Z
   OdDdNPgIP6IudyvrXfX42CW7q0hfCiqZMNypv9fE34KCoOsYdRroWysU3
   POYjwm3Yyw+ZnAbccJD26iPWDA/DZZK2uluCMYk2j/zGPfHbl+NxIyq2T
   kAO6QR40F06ELLKbcE3CUY56kbLFUzVWcw5M2uG2Bj0FX6f6GhsgK1eNs
   HwsRxp/Q3oVAaFzvvs9IZuUfjd8HoXrbakMOR25yQqJcCp3kbx/ZUBrc1
   /SQzscP+c/efBA1/mQalYqt7WIQxrCIqVevU/OdNR94O4/nDqje/5TkfR
   Q==;
X-CSE-ConnectionGUID: Rak1+HC0Q+CVggauICafkA==
X-CSE-MsgGUID: KtqzOBN9Q16Kwk+aovVLpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="70994418"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="70994418"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 10:42:48 -0800
X-CSE-ConnectionGUID: 8LHI2/UzQKuAL4JEauEpeg==
X-CSE-MsgGUID: 0q/rYPjCTSCLPLv8miYWnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="197081776"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Dec 2025 10:42:46 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTP9A-000000003eL-0Cii;
	Wed, 10 Dec 2025 18:42:44 +0000
Date: Thu, 11 Dec 2025 02:41:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 39/39]
 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:2009
 kfd_topology_add_device() warn: inconsistent returns 'global
 &topology_lock'.
Message-ID: <202512110217.auM1jJmR-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   3fe930d3788d26f7593523d883615b9eabe61f40
commit: 0ac954ec7f6c6dd6b7e94340599ba4b788d056d5 [39/39] drm/amdkfd: Fix the warning of array-index-out-of-bounds
:::::: branch date: 25 hours ago
:::::: commit date: 2 years, 8 months ago
config: arm64-randconfig-r073-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110217.auM1jJmR-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512110217.auM1jJmR-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:2009 kfd_topology_add_device() warn: inconsistent returns 'global &topology_lock'.

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:735 kfd_build_sysfs_node_entry() warn: Calling kobject_put|get with state->initialized unset from line: 729
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:756 kfd_build_sysfs_node_entry() warn: Calling kobject_put|get with state->initialized unset from line: 750
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:777 kfd_build_sysfs_node_entry() warn: Calling kobject_put|get with state->initialized unset from line: 771
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:798 kfd_build_sysfs_node_entry() warn: Calling kobject_put|get with state->initialized unset from line: 792
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:1377 kfd_build_p2p_node_entry() warn: Calling kobject_put|get with state->initialized unset from line: 1370
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:1408 kfd_create_indirect_link_prop() warn: can 'gpu_link' even be NULL?

vim +2009 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c

0ac954ec7f6c6dd Ma Jun                 2022-11-02  1808  
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1809  int kfd_topology_add_device(struct kfd_dev *gpu)
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1810  {
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1811  	uint32_t gpu_id;
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1812  	struct kfd_topology_device *dev;
f7ce2fade6e143a Flora Cui              2017-12-08  1813  	struct kfd_cu_info cu_info;
4f449311e9aa177 Harish Kasiviswanathan 2017-12-08  1814  	int res = 0;
4f449311e9aa177 Harish Kasiviswanathan 2017-12-08  1815  	struct list_head temp_topology_device_list;
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1816  	void *crat_image = NULL;
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1817  	size_t image_size = 0;
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1818  	int proximity_domain;
b7675b7bbc3c4c6 Graham Sider           2021-11-11  1819  	int i;
b7675b7bbc3c4c6 Graham Sider           2021-11-11  1820  	const char *asic_name = amdgpu_asic_name[gpu->adev->asic_type];
4f449311e9aa177 Harish Kasiviswanathan 2017-12-08  1821  
4f449311e9aa177 Harish Kasiviswanathan 2017-12-08  1822  	INIT_LIST_HEAD(&temp_topology_device_list);
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1823  
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1824  	gpu_id = kfd_generate_gpu_id(gpu);
79775b627dc49df Kent Russell           2017-08-15  1825  	pr_debug("Adding new GPU (ID: 0x%x) to topology\n", gpu_id);
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1826  
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1827  	/* Check to see if this gpu device exists in the topology_device_list.
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1828  	 * If so, assign the gpu to that device,
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1829  	 * else create a Virtual CRAT for this gpu device and then parse that
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1830  	 * CRAT to create a new topology device. Once created assign the gpu to
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1831  	 * that topology device
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1832  	 */
0ac954ec7f6c6dd Ma Jun                 2022-11-02  1833  	down_write(&topology_lock);
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1834  	dev = kfd_assign_gpu(gpu);
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1835  	if (!dev) {
46d18d510d78318 Mukul Joshi            2022-04-06  1836  		proximity_domain = ++topology_crat_proximity_domain;
46d18d510d78318 Mukul Joshi            2022-04-06  1837  
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1838  		res = kfd_create_crat_image_virtual(&crat_image, &image_size,
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1839  						    COMPUTE_UNIT_GPU, gpu,
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1840  						    proximity_domain);
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1841  		if (res) {
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1842  			pr_err("Error creating VCRAT for GPU (ID: 0x%x)\n",
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1843  			       gpu_id);
46d18d510d78318 Mukul Joshi            2022-04-06  1844  			topology_crat_proximity_domain--;
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1845  			return res;
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1846  		}
0ac954ec7f6c6dd Ma Jun                 2022-11-02  1847  
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1848  		res = kfd_parse_crat_table(crat_image,
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1849  					   &temp_topology_device_list,
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1850  					   proximity_domain);
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1851  		if (res) {
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1852  			pr_err("Error parsing VCRAT for GPU (ID: 0x%x)\n",
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1853  			       gpu_id);
46d18d510d78318 Mukul Joshi            2022-04-06  1854  			topology_crat_proximity_domain--;
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1855  			goto err;
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1856  		}
4f449311e9aa177 Harish Kasiviswanathan 2017-12-08  1857  
4f449311e9aa177 Harish Kasiviswanathan 2017-12-08  1858  		kfd_topology_update_device_list(&temp_topology_device_list,
4f449311e9aa177 Harish Kasiviswanathan 2017-12-08  1859  			&topology_device_list);
4f449311e9aa177 Harish Kasiviswanathan 2017-12-08  1860  
0ac954ec7f6c6dd Ma Jun                 2022-11-02  1861  		dev = kfd_assign_gpu(gpu);
0ac954ec7f6c6dd Ma Jun                 2022-11-02  1862  		if (WARN_ON(!dev)) {
0ac954ec7f6c6dd Ma Jun                 2022-11-02  1863  			res = -ENODEV;
0ac954ec7f6c6dd Ma Jun                 2022-11-02  1864  			goto err;
0ac954ec7f6c6dd Ma Jun                 2022-11-02  1865  		}
0ac954ec7f6c6dd Ma Jun                 2022-11-02  1866  
0ac954ec7f6c6dd Ma Jun                 2022-11-02  1867  		/* Fill the cache affinity information here for the GPUs
0ac954ec7f6c6dd Ma Jun                 2022-11-02  1868  		 * using VCRAT
0ac954ec7f6c6dd Ma Jun                 2022-11-02  1869  		 */
0ac954ec7f6c6dd Ma Jun                 2022-11-02  1870  		kfd_fill_cache_non_crat_info(dev, gpu);
0ac954ec7f6c6dd Ma Jun                 2022-11-02  1871  
8eabaf54cfb34d1 Kent Russell           2017-08-15  1872  		/* Update the SYSFS tree, since we added another topology
8eabaf54cfb34d1 Kent Russell           2017-08-15  1873  		 * device
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1874  		 */
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1875  		res = kfd_topology_update_sysfs();
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1876  		if (!res)
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1877  			sys_props.generation_count++;
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1878  		else
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1879  			pr_err("Failed to update GPU (ID: 0x%x) to sysfs topology. res=%d\n",
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1880  						gpu_id, res);
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1881  	}
0ac954ec7f6c6dd Ma Jun                 2022-11-02  1882  	up_write(&topology_lock);
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1883  
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1884  	dev->gpu_id = gpu_id;
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1885  	gpu->id = gpu_id;
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1886  
0f28cca87e9afc2 Ramesh Errabolu        2022-05-26  1887  	kfd_dev_create_p2p_links();
0f28cca87e9afc2 Ramesh Errabolu        2022-05-26  1888  
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1889  	/* TODO: Move the following lines to function
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1890  	 *	kfd_add_non_crat_information
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1891  	 */
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1892  
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1893  	/* Fill-in additional information that is not available in CRAT but
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1894  	 * needed for the topology
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1895  	 */
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1896  
574c4183ef75117 Graham Sider           2021-10-19  1897  	amdgpu_amdkfd_get_cu_info(dev->gpu->adev, &cu_info);
c181159a5b1e1e7 Yong Zhao              2019-08-01  1898  
b7675b7bbc3c4c6 Graham Sider           2021-11-11  1899  	for (i = 0; i < KFD_TOPOLOGY_PUBLIC_NAME_SIZE-1; i++) {
b7675b7bbc3c4c6 Graham Sider           2021-11-11  1900  		dev->node_props.name[i] = __tolower(asic_name[i]);
b7675b7bbc3c4c6 Graham Sider           2021-11-11  1901  		if (asic_name[i] == '\0')
b7675b7bbc3c4c6 Graham Sider           2021-11-11  1902  			break;
b7675b7bbc3c4c6 Graham Sider           2021-11-11  1903  	}
b7675b7bbc3c4c6 Graham Sider           2021-11-11  1904  	dev->node_props.name[i] = '\0';
c181159a5b1e1e7 Yong Zhao              2019-08-01  1905  
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1906  	dev->node_props.simd_arrays_per_engine =
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1907  		cu_info.num_shader_arrays_per_engine;
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1908  
f0dc99a6f742bce Graham Sider           2021-11-17  1909  	dev->node_props.gfx_target_version = gpu->device_info.gfx_target_version;
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1910  	dev->node_props.vendor_id = gpu->pdev->vendor;
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1911  	dev->node_props.device_id = gpu->pdev->device;
c6d1ec4134edc16 Joseph Greathouse      2020-04-16  1912  	dev->node_props.capability |=
02274fc0f672598 Graham Sider           2021-11-05  1913  		((dev->gpu->adev->rev_id << HSA_CAP_ASIC_REVISION_SHIFT) &
c6d1ec4134edc16 Joseph Greathouse      2020-04-16  1914  			HSA_CAP_ASIC_REVISION_MASK);
babe2ef342c4829 Heiner Kallweit        2019-04-24  1915  	dev->node_props.location_id = pci_dev_id(gpu->pdev);
3e58e95acef5a49 Ori Messinger          2019-08-21  1916  	dev->node_props.domain = pci_domain_nr(gpu->pdev->bus);
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1917  	dev->node_props.max_engine_clk_fcompute =
574c4183ef75117 Graham Sider           2021-10-19  1918  		amdgpu_amdkfd_get_max_engine_clock_in_mhz(dev->gpu->adev);
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1919  	dev->node_props.max_engine_clk_ccompute =
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1920  		cpufreq_quick_get_max(0) / 1000;
7c9b717196b1afd Oak Zeng               2018-03-15  1921  	dev->node_props.drm_render_minor =
7c9b717196b1afd Oak Zeng               2018-03-15  1922  		gpu->shared_resources.drm_render_minor;
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1923  
0c1690e38b5e688 Shaoyun Liu            2018-07-06  1924  	dev->node_props.hive_id = gpu->hive_id;
ee2f17f4d02b145 Amber Lin              2021-11-18  1925  	dev->node_props.num_sdma_engines = kfd_get_num_sdma_engines(gpu);
14568cf6583e9d8 Oak Zeng               2019-02-08  1926  	dev->node_props.num_sdma_xgmi_engines =
ee2f17f4d02b145 Amber Lin              2021-11-18  1927  					kfd_get_num_xgmi_sdma_engines(gpu);
bb71c74db3c554a Huang Rui              2019-12-16  1928  	dev->node_props.num_sdma_queues_per_engine =
cc009e613de6560 Mukul Joshi            2022-04-26  1929  				gpu->device_info.num_sdma_queues_per_engine -
cc009e613de6560 Mukul Joshi            2022-04-26  1930  				gpu->device_info.num_reserved_sdma_queues_per_engine;
29633d0e204df1e Joseph Greathouse      2020-01-15  1931  	dev->node_props.num_gws = (dev->gpu->gws &&
29e764621bbcd4a Oak Zeng               2019-05-03  1932  		dev->gpu->dqm->sched_policy != KFD_SCHED_POLICY_NO_HWS) ?
02274fc0f672598 Graham Sider           2021-11-05  1933  		dev->gpu->adev->gds.gws_size : 0;
e6945304187deae Yong Zhao              2020-01-30  1934  	dev->node_props.num_cp_queues = get_cp_queues_num(dev->gpu->dqm);
0c1690e38b5e688 Shaoyun Liu            2018-07-06  1935  
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1936  	kfd_fill_mem_clk_max_info(dev);
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1937  	kfd_fill_iolink_non_crat_info(dev);
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1938  
7eb0502ac0538ea Graham Sider           2021-11-10  1939  	switch (dev->gpu->adev->asic_type) {
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1940  	case CHIP_KAVERI:
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1941  	case CHIP_HAWAII:
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1942  	case CHIP_TONGA:
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1943  		dev->node_props.capability |= ((HSA_CAP_DOORBELL_TYPE_PRE_1_0 <<
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1944  			HSA_CAP_DOORBELL_TYPE_TOTALBITS_SHIFT) &
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1945  			HSA_CAP_DOORBELL_TYPE_TOTALBITS_MASK);
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1946  		break;
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1947  	case CHIP_CARRIZO:
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1948  	case CHIP_FIJI:
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1949  	case CHIP_POLARIS10:
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1950  	case CHIP_POLARIS11:
846a44d7e918a40 Gang Ba                2018-09-05  1951  	case CHIP_POLARIS12:
ed81cd6e0e9f37c Kent Russell           2019-03-21  1952  	case CHIP_VEGAM:
42aa8793d795f18 Felix Kuehling         2017-12-08  1953  		pr_debug("Adding doorbell packet type capability\n");
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1954  		dev->node_props.capability |= ((HSA_CAP_DOORBELL_TYPE_1_0 <<
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1955  			HSA_CAP_DOORBELL_TYPE_TOTALBITS_SHIFT) &
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1956  			HSA_CAP_DOORBELL_TYPE_TOTALBITS_MASK);
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1957  		break;
e4804a39ba5f72f Graham Sider           2021-10-28  1958  	default:
e4804a39ba5f72f Graham Sider           2021-10-28  1959  		if (KFD_GC_VERSION(dev->gpu) >= IP_VERSION(9, 0, 1))
389056e5fef477c Felix Kuehling         2018-04-10  1960  			dev->node_props.capability |= ((HSA_CAP_DOORBELL_TYPE_2_0 <<
389056e5fef477c Felix Kuehling         2018-04-10  1961  				HSA_CAP_DOORBELL_TYPE_TOTALBITS_SHIFT) &
389056e5fef477c Felix Kuehling         2018-04-10  1962  				HSA_CAP_DOORBELL_TYPE_TOTALBITS_MASK);
e4804a39ba5f72f Graham Sider           2021-10-28  1963  		else
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1964  			WARN(1, "Unexpected ASIC family %u",
7eb0502ac0538ea Graham Sider           2021-11-10  1965  			     dev->gpu->adev->asic_type);
7639a8c420f04ca Ben Goz                2015-06-07  1966  	}
7639a8c420f04ca Ben Goz                2015-06-07  1967  
1ae99eab34f90c3 Oak Zeng               2019-06-10  1968  	/*
1ae99eab34f90c3 Oak Zeng               2019-06-10  1969  	 * Overwrite ATS capability according to needs_iommu_device to fix
1ae99eab34f90c3 Oak Zeng               2019-06-10  1970  	 * potential missing corresponding bit in CRAT of BIOS.
1ae99eab34f90c3 Oak Zeng               2019-06-10  1971  	 */
6127896f4a27257 Huang Rui              2020-08-18  1972  	if (dev->gpu->use_iommu_v2)
1ae99eab34f90c3 Oak Zeng               2019-06-10  1973  		dev->node_props.capability |= HSA_CAP_ATS_PRESENT;
1ae99eab34f90c3 Oak Zeng               2019-06-10  1974  	else
1ae99eab34f90c3 Oak Zeng               2019-06-10  1975  		dev->node_props.capability &= ~HSA_CAP_ATS_PRESENT;
1ae99eab34f90c3 Oak Zeng               2019-06-10  1976  
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1977  	/* Fix errors in CZ CRAT.
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1978  	 * simd_count: Carrizo CRAT reports wrong simd_count, probably
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1979  	 *		because it doesn't consider masked out CUs
70f372bffcc84c9 Philip Cox             2017-12-08  1980  	 * max_waves_per_simd: Carrizo reports wrong max_waves_per_simd
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1981  	 */
7eb0502ac0538ea Graham Sider           2021-11-10  1982  	if (dev->gpu->adev->asic_type == CHIP_CARRIZO) {
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1983  		dev->node_props.simd_count =
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1984  			cu_info.simd_per_cu * cu_info.cu_active_number;
70f372bffcc84c9 Philip Cox             2017-12-08  1985  		dev->node_props.max_waves_per_simd = 10;
70f372bffcc84c9 Philip Cox             2017-12-08  1986  	}
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1987  
5436ab94cd94600 Stanley.Yang           2020-08-17  1988  	/* kfd only concerns sram ecc on GFX and HBM ecc on UMC */
0dee45a25a63f7d Eric Huang             2019-01-11  1989  	dev->node_props.capability |=
56c5977eae8799c Graham Sider           2021-10-19  1990  		((dev->gpu->adev->ras_enabled & BIT(AMDGPU_RAS_BLOCK__GFX)) != 0) ?
0dee45a25a63f7d Eric Huang             2019-01-11  1991  		HSA_CAP_SRAM_EDCSUPPORTED : 0;
56c5977eae8799c Graham Sider           2021-10-19  1992  	dev->node_props.capability |=
56c5977eae8799c Graham Sider           2021-10-19  1993  		((dev->gpu->adev->ras_enabled & BIT(AMDGPU_RAS_BLOCK__UMC)) != 0) ?
0dee45a25a63f7d Eric Huang             2019-01-11  1994  		HSA_CAP_MEM_EDCSUPPORTED : 0;
0dee45a25a63f7d Eric Huang             2019-01-11  1995  
046e674b961594e Graham Sider           2021-11-09  1996  	if (KFD_GC_VERSION(dev->gpu) != IP_VERSION(9, 0, 1))
56c5977eae8799c Graham Sider           2021-10-19  1997  		dev->node_props.capability |= (dev->gpu->adev->ras_enabled != 0) ?
0dee45a25a63f7d Eric Huang             2019-01-11  1998  			HSA_CAP_RASEVENTNOTIFY : 0;
0dee45a25a63f7d Eric Huang             2019-01-11  1999  
56c5977eae8799c Graham Sider           2021-10-19  2000  	if (KFD_IS_SVM_API_SUPPORTED(dev->gpu->adev->kfd.dev))
4c166eb95decf03 Philip Yang            2020-12-09  2001  		dev->node_props.capability |= HSA_CAP_SVMAPI_SUPPORTED;
4c166eb95decf03 Philip Yang            2020-12-09  2002  
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  2003  	kfd_debug_print_topology();
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  2004  
4f449311e9aa177 Harish Kasiviswanathan 2017-12-08  2005  	if (!res)
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  2006  		kfd_notify_gpu_change(gpu_id, 1);
4f449311e9aa177 Harish Kasiviswanathan 2017-12-08  2007  err:
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  2008  	kfd_destroy_crat_image(crat_image);
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16 @2009  	return res;
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  2010  }
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  2011  

:::::: The code at line 2009 was first introduced by commit
:::::: 5b5c4e40a37e858e2bff8cd91be8e972256392c4 amdkfd: Add topology module to amdkfd

:::::: TO: Evgeny Pinchuk <evgeny.pinchuk@amd.com>
:::::: CC: Oded Gabbay <oded.gabbay@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
