Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6113B7746
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Aug 2026 09:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786266340; cv=none; b=GJWj19kS6XO4XlJY8HEIJGyWWErLxyQxJLmgPzftemgNaCBpzN6SNV8GVXRADM9cAfbPsVD89kGTvcWZpZEoC9jPzsoXp/W7Gdw4ZPjR3Orw/WhKy4DACN7Mr0O3hw8YvCdtva2WXK3PE88nCLRHP6xPn8Hgy57zHAcEc0VKQCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786266340; c=relaxed/simple;
	bh=oZapo5ldc1AkigsFw+WKsl9nSzYBmY3jLA1JinsaDpo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AxVkgKP14nxY4NsUcLVrzyAjngPem3FWuww/B74dphxrnV1Gxi5Si3jOdd+Y0Vv5daASZPgUUlOHVzZ3OWQzyJqSSidhfwWvSdpJsFUCQ+gII6D0uJUVnJCsJE4y0/cvRuxbR78b8P67XV1lXagoAgj2sQA/BQMLgR58Dre7m9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i3q97BtF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i3q97BtF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786266339; x=1817802339;
  h=date:from:to:cc:subject:message-id;
  bh=oZapo5ldc1AkigsFw+WKsl9nSzYBmY3jLA1JinsaDpo=;
  b=i3q97BtFxgloHfnrq/+RXu6nZzLVHm4U9/RcwoxE8myUGFkeW7ulAD4t
   IoNrkqfdgXMgwQmB9FieFoKwWZQ4HmQtOW4FC9HbVo9xg4QHU4EZmwk6J
   zqiWO7aaeWXgfu5G8lZZKTdFytIa8tHdOXlZTxdAdJWAiDsYDDoZ/AE0D
   9E72FMD9q5Vs3R5EIgct9TYkKzu05gGTYOs3eeU0BlvS0hISj/D2GY2ko
   c0gOsGGGJnzImRiBjGJ7dHCBZfNHJSRD/71R04wOS113JnIUoeM3jW9GB
   KUvmYzjU/APUHv7fGFHKxUXthc2V2aY+2kuZS2HbUalMvEHhBR4dts4id
   Q==;
X-CSE-ConnectionGUID: VaIDf7/ET1qp+gdzA24WeA==
X-CSE-MsgGUID: 4BgqjMMlREaV7d3HGGXLBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="97961221"
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="97961221"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 02:05:31 -0700
X-CSE-ConnectionGUID: V4CMwmXXRBmML9HZBCpJVQ==
X-CSE-MsgGUID: NPaTlgpdSY6GuAf0QtiMGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="258911415"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Aug 2026 02:05:28 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wszTC-00000000Ljx-2Gd1;
	Sun, 09 Aug 2026 09:05:26 +0000
Date: Sun, 09 Aug 2026 17:04:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:883
 mes_v12_1_inv_tlbs_pasid() error: buffer overflow 'mes->master_xcc_ids' 16 <=
 s32max
Message-ID: <202608091630.ocwLHj6J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Shaoyun Liu <shaoyun.liu@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Prike Liang <Prike.Liang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   06cf61899d6498b33e4b7c87d99d5bd471ccc375
commit: d0c989a0aad3ff047b72c89c91969a535f72dd2e drm/amd/amdgpu : Use the MES INV_TLBS API for tlb invalidation on gfx12_1
date:   7 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-141-20260806 (https://download.01.org/0day-ci/archive/20260809/202608091630.ocwLHj6J-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d0c989a0aad3 ("drm/amd/amdgpu : Use the MES INV_TLBS API for tlb invalidation on gfx12_1")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608091630.ocwLHj6J-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:883 mes_v12_1_inv_tlbs_pasid() error: buffer overflow 'mes->master_xcc_ids' 16 <= s32max

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:288 mes_v12_1_add_hw_queue() error: buffer overflow 'mes->master_xcc_ids' 16 <= s32max
drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:349 mes_v12_1_remove_hw_queue() error: buffer overflow 'mes->master_xcc_ids' 16 <= s32max
drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1382 mes_v12_1_kiq_enable_queue() error: buffer overflow 'adev->mes.ring' 16 <= s32max
drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1680 mes_v12_1_kiq_dequeue_sched() error: buffer overflow 'adev->mes.ring' 16 <= s32max
drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1768 mes_v12_1_kiq_hw_fini() error: buffer overflow 'adev->mes.ring' 16 <= s32max
drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1771 mes_v12_1_kiq_hw_fini() error: buffer overflow 'adev->mes.ring' 16 <= s32max
drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1776 mes_v12_1_kiq_hw_fini() error: buffer overflow 'adev->mes.ring' 16 <= s32max
drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1828 mes_v12_1_xcc_hw_init() error: buffer overflow 'adev->mes.ring' 16 <= s32max
drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1886 mes_v12_1_xcc_hw_init() error: buffer overflow 'adev->mes.ring' 16 <= s32max

vim +883 drivers/gpu/drm/amd/amdgpu/mes_v12_1.c

d0c989a0aad3ff Shaoyun Liu 2025-07-31  873  
d0c989a0aad3ff Shaoyun Liu 2025-07-31  874  static int mes_v12_1_inv_tlbs_pasid(struct amdgpu_mes *mes,
d0c989a0aad3ff Shaoyun Liu 2025-07-31  875  				    struct mes_inv_tlbs_pasid_input *input)
d0c989a0aad3ff Shaoyun Liu 2025-07-31  876  {
d0c989a0aad3ff Shaoyun Liu 2025-07-31  877  	union MESAPI__INV_TLBS mes_inv_tlbs;
d0c989a0aad3ff Shaoyun Liu 2025-07-31  878  	int xcc_id = input->xcc_id;
d0c989a0aad3ff Shaoyun Liu 2025-07-31  879  	int inst = MES_PIPE_INST(xcc_id, AMDGPU_MES_SCHED_PIPE);
d0c989a0aad3ff Shaoyun Liu 2025-07-31  880  	int ret;
d0c989a0aad3ff Shaoyun Liu 2025-07-31  881  
d0c989a0aad3ff Shaoyun Liu 2025-07-31  882  	if (mes->enable_coop_mode)
d0c989a0aad3ff Shaoyun Liu 2025-07-31 @883  		xcc_id = mes->master_xcc_ids[inst];
d0c989a0aad3ff Shaoyun Liu 2025-07-31  884  
d0c989a0aad3ff Shaoyun Liu 2025-07-31  885  	memset(&mes_inv_tlbs, 0, sizeof(mes_inv_tlbs));
d0c989a0aad3ff Shaoyun Liu 2025-07-31  886  
d0c989a0aad3ff Shaoyun Liu 2025-07-31  887  	mes_inv_tlbs.header.type = MES_API_TYPE_SCHEDULER;
d0c989a0aad3ff Shaoyun Liu 2025-07-31  888  	mes_inv_tlbs.header.opcode = MES_SCH_API_INV_TLBS;
d0c989a0aad3ff Shaoyun Liu 2025-07-31  889  	mes_inv_tlbs.header.dwsize = API_FRAME_SIZE_IN_DWORDS;
d0c989a0aad3ff Shaoyun Liu 2025-07-31  890  
d0c989a0aad3ff Shaoyun Liu 2025-07-31  891  	mes_inv_tlbs.invalidate_tlbs.inv_sel = 0;
d0c989a0aad3ff Shaoyun Liu 2025-07-31  892  	mes_inv_tlbs.invalidate_tlbs.flush_type = input->flush_type;
d0c989a0aad3ff Shaoyun Liu 2025-07-31  893  	mes_inv_tlbs.invalidate_tlbs.inv_sel_id = input->pasid;
d0c989a0aad3ff Shaoyun Liu 2025-07-31  894  
d0c989a0aad3ff Shaoyun Liu 2025-07-31  895  	/*convert amdgpu_mes_hub_id to mes expected hub_id */
d0c989a0aad3ff Shaoyun Liu 2025-07-31  896  	ret = mes_v12_inv_tlb_convert_hub_id(input->hub_id);
d0c989a0aad3ff Shaoyun Liu 2025-07-31  897  	if (ret < 0)
d0c989a0aad3ff Shaoyun Liu 2025-07-31  898  		return -EINVAL;
d0c989a0aad3ff Shaoyun Liu 2025-07-31  899  	mes_inv_tlbs.invalidate_tlbs.hub_id = ret;
d0c989a0aad3ff Shaoyun Liu 2025-07-31  900  	return mes_v12_1_submit_pkt_and_poll_completion(mes, xcc_id, AMDGPU_MES_KIQ_PIPE,
d0c989a0aad3ff Shaoyun Liu 2025-07-31  901  			&mes_inv_tlbs, sizeof(mes_inv_tlbs),
d0c989a0aad3ff Shaoyun Liu 2025-07-31  902  			offsetof(union MESAPI__INV_TLBS, api_status));
d0c989a0aad3ff Shaoyun Liu 2025-07-31  903  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
