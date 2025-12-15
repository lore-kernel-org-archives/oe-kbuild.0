Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FC513C8EA
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 02:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765764486; cv=none; b=AopOpzoxFz+EyzAwXwSAsxh1t7kn9xKcDqJdqXsnAlqAVwqhFnQ7dsQDfdpauBxaaldnxoS2jbJinjqU5Euexolk9mKoIEaq+wr0TF692jwpc+1nJES0BdVa3eYtxPMRhdwWNkLbu818BsvIx7Xtc54mkKLw+1SdXpLJgmrXBdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765764486; c=relaxed/simple;
	bh=vcjaRdN6uQM19JYdHvQjGfiyLlgxl+lyQZX0ZLOWyu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=apvbYytIZW4hn3OnegyIKtgCiKmj2179sHieBITj+vPCPZTOjcdzF1rzkvpYx+Q1QzsU6sF4xmeet8WeG9DAKHimj8zOr6ImShn0owRXSrsqTmkH/yaioRxK0r4WgZEsXvuRFe+DL6uX5yNV3c4VljFwiCI8N2qQHzlIYTKcS6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GYB5xAkn; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GYB5xAkn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765764484; x=1797300484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vcjaRdN6uQM19JYdHvQjGfiyLlgxl+lyQZX0ZLOWyu8=;
  b=GYB5xAknKrJiAMVBFaNUcEX75CfFAepVZIXTXMvl7vJt7wHm8QZMfM4H
   HSP8Iu42ZII8dI3bAMWfYwMFgwhe8ZXygtOLPudhZwzZv3p88HUWgi21M
   SeFhQs/DbDIfiQL4zx/77fF1MpE5AhegtocbCyorZcM1FIDZnRh+dgyX9
   kQmE6xTFvEnbmksjq0xwfZsRz7RORpOeOrkD+FZEI3+MlPm0ABr/ShkpU
   R1tEQ+QjjvvYTl9f7EG/H8g/hqkWSCiilvfGiWaG7CWrgbtuXeZaolh0/
   I/pHWqsFpa9k5uwqcOWGrrP8Ns3RC8QgAJ72b5JGes9AwTfPmcRBDKKDa
   A==;
X-CSE-ConnectionGUID: lz66/YXySuuXn/kqcAv8Ag==
X-CSE-MsgGUID: KuXdLAU9ReKaQ1ZvAKmlZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="77977764"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="77977764"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 18:08:03 -0800
X-CSE-ConnectionGUID: geqLVvO/QhOdNm/oRut8Zw==
X-CSE-MsgGUID: 8Iaw2MY3ScuYqEU7oKmClQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="197493158"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Dec 2025 18:08:01 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUy0F-000000009bz-2Krw;
	Mon, 15 Dec 2025 02:07:59 +0000
Date: Mon, 15 Dec 2025 10:07:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:654
 kfd_build_sysfs_node_entry() warn: Calling kobject_put|get with
 state->initialized unset from line: 647
Message-ID: <202512150958.GIPyFUHm-lkp@intel.com>
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
TO: Xuemei Liu <liu.xuemei1@zte.com.cn>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Felix Kuehling <felix.kuehling@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 4e696906e9a82d4cab75f3083fabd65433c77e20 drm/amdkfd: enable kfd on RISCV systems
date:   6 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 6 months ago
config: riscv-randconfig-r072-20251212 (https://download.01.org/0day-ci/archive/20251215/202512150958.GIPyFUHm-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512150958.GIPyFUHm-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:654 kfd_build_sysfs_node_entry() warn: Calling kobject_put|get with state->initialized unset from line: 647
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:3739 dqm_debugfs_hqds() warn: passing freed memory 'dump' (line 3718)

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:708 kfd_build_sysfs_node_entry() warn: Calling kobject_put|get with state->initialized unset from line: 702
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:729 kfd_build_sysfs_node_entry() warn: Calling kobject_put|get with state->initialized unset from line: 723
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:750 kfd_build_sysfs_node_entry() warn: Calling kobject_put|get with state->initialized unset from line: 744
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:771 kfd_build_sysfs_node_entry() warn: Calling kobject_put|get with state->initialized unset from line: 765
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:853 kfd_topology_update_sysfs() warn: Calling kobject_put|get with state->initialized unset from line: 845
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:1384 kfd_build_p2p_node_entry() warn: Calling kobject_put|get with state->initialized unset from line: 1377
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:2058 kfd_topology_add_device() error: we previously assumed 'dev' could be null (see line 2051)
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:3760 dqm_debugfs_hqds() warn: passing freed memory 'dump' (line 3718)

vim +654 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c

5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  628  
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  629  static int kfd_build_sysfs_node_entry(struct kfd_topology_device *dev,
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  630  		uint32_t id)
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  631  {
0f28cca87e9afc Ramesh Errabolu     2022-05-26  632  	struct kfd_iolink_properties *p2plink;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  633  	struct kfd_iolink_properties *iolink;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  634  	struct kfd_cache_properties *cache;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  635  	struct kfd_mem_properties *mem;
f475734729843d Amber Lin           2017-12-08  636  	struct kfd_perf_properties *perf;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  637  	int ret;
f475734729843d Amber Lin           2017-12-08  638  	uint32_t i, num_attrs;
f475734729843d Amber Lin           2017-12-08  639  	struct attribute **attrs;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  640  
32fa821958755a Felix Kuehling      2017-08-15  641  	if (WARN_ON(dev->kobj_node))
32fa821958755a Felix Kuehling      2017-08-15  642  		return -EEXIST;
32fa821958755a Felix Kuehling      2017-08-15  643  
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  644  	/*
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  645  	 * Creating the sysfs folders
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  646  	 */
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  647  	dev->kobj_node = kfd_alloc_struct(dev->kobj_node);
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  648  	if (!dev->kobj_node)
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  649  		return -ENOMEM;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  650  
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  651  	ret = kobject_init_and_add(dev->kobj_node, &node_type,
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  652  			sys_props.kobj_nodes, "%d", id);
20eca0123a3530 Qiushi Wu           2020-06-13  653  	if (ret < 0) {
20eca0123a3530 Qiushi Wu           2020-06-13 @654  		kobject_put(dev->kobj_node);
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  655  		return ret;
20eca0123a3530 Qiushi Wu           2020-06-13  656  	}
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  657  
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  658  	dev->kobj_mem = kobject_create_and_add("mem_banks", dev->kobj_node);
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  659  	if (!dev->kobj_mem)
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  660  		return -ENOMEM;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  661  
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  662  	dev->kobj_cache = kobject_create_and_add("caches", dev->kobj_node);
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  663  	if (!dev->kobj_cache)
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  664  		return -ENOMEM;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  665  
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  666  	dev->kobj_iolink = kobject_create_and_add("io_links", dev->kobj_node);
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  667  	if (!dev->kobj_iolink)
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  668  		return -ENOMEM;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  669  
0f28cca87e9afc Ramesh Errabolu     2022-05-26  670  	dev->kobj_p2plink = kobject_create_and_add("p2p_links", dev->kobj_node);
0f28cca87e9afc Ramesh Errabolu     2022-05-26  671  	if (!dev->kobj_p2plink)
0f28cca87e9afc Ramesh Errabolu     2022-05-26  672  		return -ENOMEM;
0f28cca87e9afc Ramesh Errabolu     2022-05-26  673  
f475734729843d Amber Lin           2017-12-08  674  	dev->kobj_perf = kobject_create_and_add("perf", dev->kobj_node);
f475734729843d Amber Lin           2017-12-08  675  	if (!dev->kobj_perf)
f475734729843d Amber Lin           2017-12-08  676  		return -ENOMEM;
f475734729843d Amber Lin           2017-12-08  677  
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  678  	/*
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  679  	 * Creating sysfs files for node properties
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  680  	 */
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  681  	dev->attr_gpuid.name = "gpu_id";
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  682  	dev->attr_gpuid.mode = KFD_SYSFS_FILE_MODE;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  683  	sysfs_attr_init(&dev->attr_gpuid);
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  684  	dev->attr_name.name = "name";
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  685  	dev->attr_name.mode = KFD_SYSFS_FILE_MODE;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  686  	sysfs_attr_init(&dev->attr_name);
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  687  	dev->attr_props.name = "properties";
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  688  	dev->attr_props.mode = KFD_SYSFS_FILE_MODE;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  689  	sysfs_attr_init(&dev->attr_props);
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  690  	ret = sysfs_create_file(dev->kobj_node, &dev->attr_gpuid);
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  691  	if (ret < 0)
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  692  		return ret;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  693  	ret = sysfs_create_file(dev->kobj_node, &dev->attr_name);
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  694  	if (ret < 0)
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  695  		return ret;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  696  	ret = sysfs_create_file(dev->kobj_node, &dev->attr_props);
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  697  	if (ret < 0)
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  698  		return ret;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  699  
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  700  	i = 0;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  701  	list_for_each_entry(mem, &dev->mem_props, list) {
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  702  		mem->kobj = kzalloc(sizeof(struct kobject), GFP_KERNEL);
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  703  		if (!mem->kobj)
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  704  			return -ENOMEM;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  705  		ret = kobject_init_and_add(mem->kobj, &mem_type,
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  706  				dev->kobj_mem, "%d", i);
20eca0123a3530 Qiushi Wu           2020-06-13  707  		if (ret < 0) {
20eca0123a3530 Qiushi Wu           2020-06-13  708  			kobject_put(mem->kobj);
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  709  			return ret;
20eca0123a3530 Qiushi Wu           2020-06-13  710  		}
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  711  
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  712  		mem->attr.name = "properties";
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  713  		mem->attr.mode = KFD_SYSFS_FILE_MODE;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  714  		sysfs_attr_init(&mem->attr);
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  715  		ret = sysfs_create_file(mem->kobj, &mem->attr);
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  716  		if (ret < 0)
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  717  			return ret;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  718  		i++;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  719  	}
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  720  
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  721  	i = 0;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  722  	list_for_each_entry(cache, &dev->cache_props, list) {
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  723  		cache->kobj = kzalloc(sizeof(struct kobject), GFP_KERNEL);
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  724  		if (!cache->kobj)
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  725  			return -ENOMEM;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  726  		ret = kobject_init_and_add(cache->kobj, &cache_type,
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  727  				dev->kobj_cache, "%d", i);
20eca0123a3530 Qiushi Wu           2020-06-13  728  		if (ret < 0) {
20eca0123a3530 Qiushi Wu           2020-06-13  729  			kobject_put(cache->kobj);
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  730  			return ret;
20eca0123a3530 Qiushi Wu           2020-06-13  731  		}
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  732  
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  733  		cache->attr.name = "properties";
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  734  		cache->attr.mode = KFD_SYSFS_FILE_MODE;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  735  		sysfs_attr_init(&cache->attr);
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  736  		ret = sysfs_create_file(cache->kobj, &cache->attr);
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  737  		if (ret < 0)
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  738  			return ret;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  739  		i++;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  740  	}
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  741  
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  742  	i = 0;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  743  	list_for_each_entry(iolink, &dev->io_link_props, list) {
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  744  		iolink->kobj = kzalloc(sizeof(struct kobject), GFP_KERNEL);
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  745  		if (!iolink->kobj)
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  746  			return -ENOMEM;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  747  		ret = kobject_init_and_add(iolink->kobj, &iolink_type,
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  748  				dev->kobj_iolink, "%d", i);
20eca0123a3530 Qiushi Wu           2020-06-13  749  		if (ret < 0) {
20eca0123a3530 Qiushi Wu           2020-06-13  750  			kobject_put(iolink->kobj);
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  751  			return ret;
20eca0123a3530 Qiushi Wu           2020-06-13  752  		}
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  753  
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  754  		iolink->attr.name = "properties";
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  755  		iolink->attr.mode = KFD_SYSFS_FILE_MODE;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  756  		sysfs_attr_init(&iolink->attr);
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  757  		ret = sysfs_create_file(iolink->kobj, &iolink->attr);
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  758  		if (ret < 0)
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  759  			return ret;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  760  		i++;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  761  	}
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  762  
0f28cca87e9afc Ramesh Errabolu     2022-05-26  763  	i = 0;
0f28cca87e9afc Ramesh Errabolu     2022-05-26  764  	list_for_each_entry(p2plink, &dev->p2p_link_props, list) {
0f28cca87e9afc Ramesh Errabolu     2022-05-26  765  		p2plink->kobj = kzalloc(sizeof(struct kobject), GFP_KERNEL);
0f28cca87e9afc Ramesh Errabolu     2022-05-26  766  		if (!p2plink->kobj)
0f28cca87e9afc Ramesh Errabolu     2022-05-26  767  			return -ENOMEM;
0f28cca87e9afc Ramesh Errabolu     2022-05-26  768  		ret = kobject_init_and_add(p2plink->kobj, &iolink_type,
0f28cca87e9afc Ramesh Errabolu     2022-05-26  769  				dev->kobj_p2plink, "%d", i);
0f28cca87e9afc Ramesh Errabolu     2022-05-26  770  		if (ret < 0) {
0f28cca87e9afc Ramesh Errabolu     2022-05-26  771  			kobject_put(p2plink->kobj);
0f28cca87e9afc Ramesh Errabolu     2022-05-26  772  			return ret;
0f28cca87e9afc Ramesh Errabolu     2022-05-26  773  		}
0f28cca87e9afc Ramesh Errabolu     2022-05-26  774  
0f28cca87e9afc Ramesh Errabolu     2022-05-26  775  		p2plink->attr.name = "properties";
0f28cca87e9afc Ramesh Errabolu     2022-05-26  776  		p2plink->attr.mode = KFD_SYSFS_FILE_MODE;
1f9d1ff1c3c1d0 Mukul Joshi         2022-12-20  777  		sysfs_attr_init(&p2plink->attr);
0f28cca87e9afc Ramesh Errabolu     2022-05-26  778  		ret = sysfs_create_file(p2plink->kobj, &p2plink->attr);
0f28cca87e9afc Ramesh Errabolu     2022-05-26  779  		if (ret < 0)
0f28cca87e9afc Ramesh Errabolu     2022-05-26  780  			return ret;
0f28cca87e9afc Ramesh Errabolu     2022-05-26  781  		i++;
0f28cca87e9afc Ramesh Errabolu     2022-05-26  782  	}
0f28cca87e9afc Ramesh Errabolu     2022-05-26  783  
f475734729843d Amber Lin           2017-12-08  784  	/* All hardware blocks have the same number of attributes. */
3f866f5f04d364 Gustavo A. R. Silva 2018-01-18  785  	num_attrs = ARRAY_SIZE(perf_attr_iommu);
f475734729843d Amber Lin           2017-12-08  786  	list_for_each_entry(perf, &dev->perf_props, list) {
f475734729843d Amber Lin           2017-12-08  787  		perf->attr_group = kzalloc(sizeof(struct kfd_perf_attr)
f475734729843d Amber Lin           2017-12-08  788  			* num_attrs + sizeof(struct attribute_group),
f475734729843d Amber Lin           2017-12-08  789  			GFP_KERNEL);
f475734729843d Amber Lin           2017-12-08  790  		if (!perf->attr_group)
f475734729843d Amber Lin           2017-12-08  791  			return -ENOMEM;
f475734729843d Amber Lin           2017-12-08  792  
f475734729843d Amber Lin           2017-12-08  793  		attrs = (struct attribute **)(perf->attr_group + 1);
f475734729843d Amber Lin           2017-12-08  794  		if (!strcmp(perf->block_name, "iommu")) {
f475734729843d Amber Lin           2017-12-08  795  		/* Information of IOMMU's num_counters and counter_ids is shown
f475734729843d Amber Lin           2017-12-08  796  		 * under /sys/bus/event_source/devices/amd_iommu. We don't
f475734729843d Amber Lin           2017-12-08  797  		 * duplicate here.
f475734729843d Amber Lin           2017-12-08  798  		 */
f475734729843d Amber Lin           2017-12-08  799  			perf_attr_iommu[0].data = perf->max_concurrent;
f475734729843d Amber Lin           2017-12-08  800  			for (i = 0; i < num_attrs; i++)
f475734729843d Amber Lin           2017-12-08  801  				attrs[i] = &perf_attr_iommu[i].attr.attr;
f475734729843d Amber Lin           2017-12-08  802  		}
f475734729843d Amber Lin           2017-12-08  803  		perf->attr_group->name = perf->block_name;
f475734729843d Amber Lin           2017-12-08  804  		perf->attr_group->attrs = attrs;
f475734729843d Amber Lin           2017-12-08  805  		ret = sysfs_create_group(dev->kobj_perf, perf->attr_group);
f475734729843d Amber Lin           2017-12-08  806  		if (ret < 0)
f475734729843d Amber Lin           2017-12-08  807  			return ret;
f475734729843d Amber Lin           2017-12-08  808  	}
f475734729843d Amber Lin           2017-12-08  809  
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  810  	return 0;
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  811  }
5b5c4e40a37e85 Evgeny Pinchuk      2014-07-16  812  

:::::: The code at line 654 was first introduced by commit
:::::: 20eca0123a35305e38b344d571cf32768854168c drm/amdkfd: Fix reference count leaks.

:::::: TO: Qiushi Wu <wu000273@umn.edu>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
