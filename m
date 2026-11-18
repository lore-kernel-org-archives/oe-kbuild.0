Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795045263;
	b=XhD2UfuQwFIYU2zdxGJTmrepbaizPsCwkMFyl+Du2uTfEKR3VnnckDrxSFI6aVSTFVWK
	 He5wU9r1jLOePLedMsRSVjV9/tvKXL+/AeK1ceBTL/io621/qi/MI9/3TKcmyzNITGvGl
	 oCcqgvkwfPANCXLA+LVpchuUzWYgqfv6l1gFiWmXr4R9+Ob2tYhtgEEPIMl0c1BAZkpPV
	 mEj++78C8iGq/9iV5zPELUptUlA/psiEgp2C7DGdnW1fn2Rz7xEZmgiE3/yfC8rHiRLIR
	 laJ+sh7/qqgifAhvhz7VmITGqcTC1YCTaOujsB+KHIYUHFgBHwReLVD2nqfR/QgxnYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045263;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=bKl2mSOhir/HIQfLLqyXuca1WDpEWmUYjVqLYbwDXQA=;
	b=gBiK9yWYaJbfslZI3aqyqHqlhJDHcPZEWto1pWovRkeJwMPAPBywj4lBuvH19MeZ2Gpk
	 gRoKSD5CdafQgYZNaJhzoypkhstQBbAT4QMVQKC8xsL+G16PpSjrmMy0GN5OIMHfJo8RE
	 99IAnYtdKOshi+CjkHqCD22cqXxqIYZAYc53hZj09G/Qtb26txPlAUNN3yZkxf3rBPzYl
	 RQT+1PirXSiXjfVMTSDcS878z62Y8iMv7dkTwP79TSljccwMZxZDthNo3ua68KTNZd/eD
	 yXmY/FdPeKivdr/yuoaw37NVfLLV3CkTIatAfnLdMInp2gENQ4P9lhYcYvddlbZZr9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kpVkQfdI;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5AF606A320
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Nov 2026 23:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F5AF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kpVkQfdI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795045263; x=1826581263;
  h=date:from:to:cc:subject:message-id;
  bh=VCxXqcmXEdp8ocgWfOHjZdDOPaOhWB9C0NLh98yqNdI=;
  b=kpVkQfdIQpR4JGqALsERtzQP/7xBihB/u4xVWSEjfIOtvkzDB5irp8vb
   EaXb+3O0mAiE3nosbulDvMbISqXy9A2wF5DD3jIj2sXBnm9htfewUGV99
   PWIqWpvKZBcSwctwXXysCKagC4/fc0yizY2HkAAS0EwdLkhMTMqYbc13Z
   2KwkfP4o0o2+q49wWJWGvO215oWSB6bfxcVhXVBpNAx08DA4oK0C8bl6O
   BraQqMUiODYwqkaTFu9f2nxgZ+nj7V/tpUq9ifBRhLHndpsBuqZqpQDQf
   4ghfBMTeg0xzXYd3gJPc6ynpbMruGgiOTyFLFF0WBtd6H9LkhIpooRhHT
   g==;
X-CSE-ConnectionGUID: wKYf9+ChR5WjkADUY5YjWg==
X-CSE-MsgGUID: a820ngnqQm6YuBXUtZ2oIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3958482"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3958482"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 15:41:03 -0800
X-CSE-ConnectionGUID: j2ti6s8PT2ye+4/gBhwuZQ==
X-CSE-MsgGUID: OErlHg9XRwCe8Y4hRAwWTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="12013854"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 18 Nov 2026 15:41:01 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTpGs-000000003WT-2jv6;
	Wed, 18 Nov 2026 23:40:58 +0000
Date: Thu, 19 Nov 2026 00:40:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-6.1-lts 200/200]
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:907
 amdgpu_discovery_sysfs_ips() warn: Calling kobject_put|get with
 state->initialized unset from line: 883
Message-ID: <20261119003026.vH2yT8Lf-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-6.1-lts
head:   32c8e7bb8f634f61dd3c764ccd86ac57794bb9f5
commit: 1d7dd4f230867231abfc5cc413dae5260e06fdb2 [200/200] drm/amdgpu: fix IP instance memory leak on kobject add failure
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2200-20261118 (https://download.01.org/0day-ci/archive/20261119/20261119003026.vH2yT8Lf-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 51d7f08b16b68285b1a400f413215b69f07a65e3)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261119003026.vH2yT8Lf-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:907 amdgpu_discovery_sysfs_ips() warn: Calling kobject_put|get with state->initialized unset from line: 883

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:329 amdgpu_discovery_init() warn: assigning (-10) to unsigned variable 'size'
drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1005 amdgpu_discovery_sysfs_init() warn: Calling kobject_put|get with state->initialized unset from line: 974
drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1136 amdgpu_discovery_reg_base_init() error: testing array offset 'adev->vcn.num_vcn_inst' after use.
drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1465 amdgpu_discovery_get_vcn_info() error: buffer overflow 'adev->vcn.vcn_codec_disable_mask' 2 <= 3

vim +907 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c

a6c40b178092f41 Luben Tuikov 2022-02-03  824  
a6c40b178092f41 Luben Tuikov 2022-02-03  825  static int amdgpu_discovery_sysfs_ips(struct amdgpu_device *adev,
a6c40b178092f41 Luben Tuikov 2022-02-03  826  				      struct ip_die_entry *ip_die_entry,
a6c40b178092f41 Luben Tuikov 2022-02-03  827  				      const size_t _ip_offset, const int num_ips)
a6c40b178092f41 Luben Tuikov 2022-02-03  828  {
a6c40b178092f41 Luben Tuikov 2022-02-03  829  	int ii, jj, kk, res;
a6c40b178092f41 Luben Tuikov 2022-02-03  830  
a6c40b178092f41 Luben Tuikov 2022-02-03  831  	DRM_DEBUG("num_ips:%d", num_ips);
a6c40b178092f41 Luben Tuikov 2022-02-03  832  
a6c40b178092f41 Luben Tuikov 2022-02-03  833  	/* Find all IPs of a given HW ID, and add their instance to
a6c40b178092f41 Luben Tuikov 2022-02-03  834  	 * #die/#hw_id/#instance/<attributes>
a6c40b178092f41 Luben Tuikov 2022-02-03  835  	 */
a6c40b178092f41 Luben Tuikov 2022-02-03  836  	for (ii = 0; ii < HW_ID_MAX; ii++) {
a6c40b178092f41 Luben Tuikov 2022-02-03  837  		struct ip_hw_id *ip_hw_id = NULL;
a6c40b178092f41 Luben Tuikov 2022-02-03  838  		size_t ip_offset = _ip_offset;
a6c40b178092f41 Luben Tuikov 2022-02-03  839  
a6c40b178092f41 Luben Tuikov 2022-02-03  840  		for (jj = 0; jj < num_ips; jj++) {
a6c40b178092f41 Luben Tuikov 2022-02-03  841  			struct ip *ip;
a6c40b178092f41 Luben Tuikov 2022-02-03  842  			struct ip_hw_instance *ip_hw_instance;
a6c40b178092f41 Luben Tuikov 2022-02-03  843  
a6c40b178092f41 Luben Tuikov 2022-02-03  844  			ip = (struct ip *)(adev->mman.discovery_bin + ip_offset);
a6c40b178092f41 Luben Tuikov 2022-02-03  845  			if (amdgpu_discovery_validate_ip(ip) ||
a6c40b178092f41 Luben Tuikov 2022-02-03  846  			    le16_to_cpu(ip->hw_id) != ii)
a6c40b178092f41 Luben Tuikov 2022-02-03  847  				goto next_ip;
a6c40b178092f41 Luben Tuikov 2022-02-03  848  
f0d540989597d04 Luben Tuikov 2022-02-16  849  			DRM_DEBUG("match:%d @ ip_offset:%zu", ii, ip_offset);
a6c40b178092f41 Luben Tuikov 2022-02-03  850  
a6c40b178092f41 Luben Tuikov 2022-02-03  851  			/* We have a hw_id match; register the hw
a6c40b178092f41 Luben Tuikov 2022-02-03  852  			 * block if not yet registered.
a6c40b178092f41 Luben Tuikov 2022-02-03  853  			 */
a6c40b178092f41 Luben Tuikov 2022-02-03  854  			if (!ip_hw_id) {
a6c40b178092f41 Luben Tuikov 2022-02-03  855  				ip_hw_id = kzalloc(sizeof(*ip_hw_id), GFP_KERNEL);
a6c40b178092f41 Luben Tuikov 2022-02-03  856  				if (!ip_hw_id)
a6c40b178092f41 Luben Tuikov 2022-02-03  857  					return -ENOMEM;
a6c40b178092f41 Luben Tuikov 2022-02-03  858  				ip_hw_id->hw_id = ii;
a6c40b178092f41 Luben Tuikov 2022-02-03  859  
a6c40b178092f41 Luben Tuikov 2022-02-03  860  				kobject_set_name(&ip_hw_id->hw_id_kset.kobj, "%d", ii);
a6c40b178092f41 Luben Tuikov 2022-02-03  861  				ip_hw_id->hw_id_kset.kobj.kset = &ip_die_entry->ip_kset;
a6c40b178092f41 Luben Tuikov 2022-02-03  862  				ip_hw_id->hw_id_kset.kobj.ktype = &ip_hw_id_ktype;
a6c40b178092f41 Luben Tuikov 2022-02-03  863  				res = kset_register(&ip_hw_id->hw_id_kset);
a6c40b178092f41 Luben Tuikov 2022-02-03  864  				if (res) {
a6c40b178092f41 Luben Tuikov 2022-02-03  865  					DRM_ERROR("Couldn't register ip_hw_id kset");
a6c40b178092f41 Luben Tuikov 2022-02-03  866  					kfree(ip_hw_id);
a6c40b178092f41 Luben Tuikov 2022-02-03  867  					return res;
a6c40b178092f41 Luben Tuikov 2022-02-03  868  				}
a6c40b178092f41 Luben Tuikov 2022-02-03  869  				if (hw_id_names[ii]) {
a6c40b178092f41 Luben Tuikov 2022-02-03  870  					res = sysfs_create_link(&ip_die_entry->ip_kset.kobj,
a6c40b178092f41 Luben Tuikov 2022-02-03  871  								&ip_hw_id->hw_id_kset.kobj,
a6c40b178092f41 Luben Tuikov 2022-02-03  872  								hw_id_names[ii]);
a6c40b178092f41 Luben Tuikov 2022-02-03  873  					if (res) {
a6c40b178092f41 Luben Tuikov 2022-02-03  874  						DRM_ERROR("Couldn't create IP link %s in IP Die:%s\n",
a6c40b178092f41 Luben Tuikov 2022-02-03  875  							  hw_id_names[ii],
a6c40b178092f41 Luben Tuikov 2022-02-03  876  							  kobject_name(&ip_die_entry->ip_kset.kobj));
a6c40b178092f41 Luben Tuikov 2022-02-03  877  					}
a6c40b178092f41 Luben Tuikov 2022-02-03  878  				}
a6c40b178092f41 Luben Tuikov 2022-02-03  879  			}
a6c40b178092f41 Luben Tuikov 2022-02-03  880  
a6c40b178092f41 Luben Tuikov 2022-02-03  881  			/* Now register its instance.
a6c40b178092f41 Luben Tuikov 2022-02-03  882  			 */
a6c40b178092f41 Luben Tuikov 2022-02-03  883  			ip_hw_instance = kzalloc(struct_size(ip_hw_instance,
a6c40b178092f41 Luben Tuikov 2022-02-03  884  							     base_addr,
a6c40b178092f41 Luben Tuikov 2022-02-03  885  							     ip->num_base_address),
a6c40b178092f41 Luben Tuikov 2022-02-03  886  						 GFP_KERNEL);
a6c40b178092f41 Luben Tuikov 2022-02-03  887  			if (!ip_hw_instance) {
a6c40b178092f41 Luben Tuikov 2022-02-03  888  				DRM_ERROR("no memory for ip_hw_instance");
a6c40b178092f41 Luben Tuikov 2022-02-03  889  				return -ENOMEM;
a6c40b178092f41 Luben Tuikov 2022-02-03  890  			}
a6c40b178092f41 Luben Tuikov 2022-02-03  891  			ip_hw_instance->hw_id = le16_to_cpu(ip->hw_id); /* == ii */
a6c40b178092f41 Luben Tuikov 2022-02-03  892  			ip_hw_instance->num_instance = ip->number_instance;
a6c40b178092f41 Luben Tuikov 2022-02-03  893  			ip_hw_instance->major = ip->major;
a6c40b178092f41 Luben Tuikov 2022-02-03  894  			ip_hw_instance->minor = ip->minor;
a6c40b178092f41 Luben Tuikov 2022-02-03  895  			ip_hw_instance->revision = ip->revision;
4d7ba312dd1f94c Luben Tuikov 2022-02-14  896  			ip_hw_instance->harvest = ip->harvest;
a6c40b178092f41 Luben Tuikov 2022-02-03  897  			ip_hw_instance->num_base_addresses = ip->num_base_address;
a6c40b178092f41 Luben Tuikov 2022-02-03  898  
a6c40b178092f41 Luben Tuikov 2022-02-03  899  			for (kk = 0; kk < ip_hw_instance->num_base_addresses; kk++)
a6c40b178092f41 Luben Tuikov 2022-02-03  900  				ip_hw_instance->base_addr[kk] = ip->base_address[kk];
a6c40b178092f41 Luben Tuikov 2022-02-03  901  
a6c40b178092f41 Luben Tuikov 2022-02-03  902  			kobject_init(&ip_hw_instance->kobj, &ip_hw_instance_ktype);
a6c40b178092f41 Luben Tuikov 2022-02-03  903  			ip_hw_instance->kobj.kset = &ip_hw_id->hw_id_kset;
a6c40b178092f41 Luben Tuikov 2022-02-03  904  			res = kobject_add(&ip_hw_instance->kobj, NULL,
a6c40b178092f41 Luben Tuikov 2022-02-03  905  					  "%d", ip_hw_instance->num_instance);
1d7dd4f23086723 Guangshuo Li 2026-09-20  906  			if (res)
1d7dd4f23086723 Guangshuo Li 2026-09-20 @907  				kobject_put(&ip_hw_instance->kobj);
a6c40b178092f41 Luben Tuikov 2022-02-03  908  next_ip:
73bce7a423c3bb7 Lijo Lazar   2022-04-08  909  			ip_offset += struct_size(ip, base_address, ip->num_base_address);
a6c40b178092f41 Luben Tuikov 2022-02-03  910  		}
a6c40b178092f41 Luben Tuikov 2022-02-03  911  	}
a6c40b178092f41 Luben Tuikov 2022-02-03  912  
a6c40b178092f41 Luben Tuikov 2022-02-03  913  	return 0;
a6c40b178092f41 Luben Tuikov 2022-02-03  914  }
a6c40b178092f41 Luben Tuikov 2022-02-03  915  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
