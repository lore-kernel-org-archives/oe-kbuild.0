Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8145A30171C
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Jul 2026 17:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783100050; cv=none; b=NsCBB5XfZfws8cbh2NmQZJwfJtzesG4ppAJRaQ+CfrG5NWIZUTkY1MlT7x6NghMI2WP2FN3pSHDFYJB+1GbDUGnMPpKbPPkWVWwRucXMyPtF8NFpJodvQrK9FwB1zkk+499jduL82UcSom49NPypVyQJWIHvDbqWqFKFMQ7dsMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783100050; c=relaxed/simple;
	bh=FSvbig3IwnKJjIP87lzttegfAONmF9Rgut5YVRbQgFo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yfrdjb/jaD3HqkK+Z8Q+SxNlOoQNwdesP/+T94fn8HyQs0Ykm+YGYLZTqL9txxQfsZ0L/8HIng/vJIVuJd40zzPAAa6Ll0ggT0BHXRFuYhTYMHSjzPG0gaM/PA+Z72doEZaj4A6KKg0gQimrTCh5hU3yAX06mXf20ynAX6QenPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Za8VFVjj; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Za8VFVjj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783100048; x=1814636048;
  h=date:from:to:cc:subject:message-id;
  bh=FSvbig3IwnKJjIP87lzttegfAONmF9Rgut5YVRbQgFo=;
  b=Za8VFVjjLGYKLv4OSr5uJCgJUjOX+vX2Z+8sdF21HMretnR9FE9VnBqT
   LSez15WTT1aOdj+EcDudWD5zOB21vE38rB8T/QKmPx0+b0joFVRlQC4wI
   jEjl7TYsLTSg2m/gqWsPujDQQeDld1YISVEKgRDWmBE6a6B67VNCC1X9J
   4cMFslOp7wVHyZRzTT/enAb7KyQUA1+FF+VRgFP7oYMG+82a3cz8Rukp0
   fQRLXZxdJoynFFkp83rV7YwycNVwRhJOHChVb6sCAvDfIRzgPBft3P9DP
   d8FOI+4eTPce1Hwp5D2V0ci97z4F6iS0RjbLgIGzv/2D0slCEV2/b8X83
   A==;
X-CSE-ConnectionGUID: eyLTo9dvT6Oj6CT2y2iQUw==
X-CSE-MsgGUID: LrVyIV46ShGlvy2ncn10+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="95011740"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="95011740"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 10:34:08 -0700
X-CSE-ConnectionGUID: dETIBqS+TxqBUiWOxTgpJg==
X-CSE-MsgGUID: eUjdGyTTRKWe6RzyscOKjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253293401"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 03 Jul 2026 10:34:06 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfhjh-00000000COn-13z1;
	Fri, 03 Jul 2026 17:32:00 +0000
Date: Sat, 04 Jul 2026 01:23:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c:1316:4-22:
 opportunity for str_true_false(ring -> use_doorbell)
Message-ID: <202607040148.gEDzLYM5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Likun Gao <Likun.Gao@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2c9a99135da931377240942d44f3dea104cedb8
commit: 4ed5116aacf6126ef9c7bc8cd7367ed6797e5c8f drm/amdgpu: Add sdma v7_1_0 support
date:   7 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 7 months ago
config: loongarch-randconfig-r062-20260703 (https://download.01.org/0day-ci/archive/20260704/202607040148.gEDzLYM5-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4ed5116aacf6 ("drm/amdgpu: Add sdma v7_1_0 support")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607040148.gEDzLYM5-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c:1316:4-22: opportunity for str_true_false(ring -> use_doorbell)

vim +1316 drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c

4ed5116aacf612 Likun Gao 2025-01-07  1290  
4ed5116aacf612 Likun Gao 2025-01-07  1291  static int sdma_v7_1_sw_init(struct amdgpu_ip_block *ip_block)
4ed5116aacf612 Likun Gao 2025-01-07  1292  {
4ed5116aacf612 Likun Gao 2025-01-07  1293  	struct amdgpu_ring *ring;
4ed5116aacf612 Likun Gao 2025-01-07  1294  	int r, i;
4ed5116aacf612 Likun Gao 2025-01-07  1295  	struct amdgpu_device *adev = ip_block->adev;
4ed5116aacf612 Likun Gao 2025-01-07  1296  	uint32_t reg_count = ARRAY_SIZE(sdma_reg_list_7_1);
4ed5116aacf612 Likun Gao 2025-01-07  1297  	uint32_t *ptr;
4ed5116aacf612 Likun Gao 2025-01-07  1298  	u32 xcc_id;
4ed5116aacf612 Likun Gao 2025-01-07  1299  
4ed5116aacf612 Likun Gao 2025-01-07  1300  	/* SDMA trap event */
4ed5116aacf612 Likun Gao 2025-01-07  1301  	r = amdgpu_irq_add_id(adev, SOC21_IH_CLIENTID_GFX,
4ed5116aacf612 Likun Gao 2025-01-07  1302  			      GFX_11_0_0__SRCID__SDMA_TRAP,
4ed5116aacf612 Likun Gao 2025-01-07  1303  			      &adev->sdma.trap_irq);
4ed5116aacf612 Likun Gao 2025-01-07  1304  	if (r)
4ed5116aacf612 Likun Gao 2025-01-07  1305  		return r;
4ed5116aacf612 Likun Gao 2025-01-07  1306  
4ed5116aacf612 Likun Gao 2025-01-07  1307  	for (i = 0; i < adev->sdma.num_instances; i++) {
4ed5116aacf612 Likun Gao 2025-01-07  1308  		ring = &adev->sdma.instance[i].ring;
4ed5116aacf612 Likun Gao 2025-01-07  1309  		ring->ring_obj = NULL;
4ed5116aacf612 Likun Gao 2025-01-07  1310  		ring->use_doorbell = true;
4ed5116aacf612 Likun Gao 2025-01-07  1311  		ring->me = i;
4ed5116aacf612 Likun Gao 2025-01-07  1312  		xcc_id = adev->sdma.instance[i].xcc_id;
4ed5116aacf612 Likun Gao 2025-01-07  1313  
4ed5116aacf612 Likun Gao 2025-01-07  1314  		DRM_DEBUG("SDMA%d.%d use_doorbell being set to: [%s]\n",
4ed5116aacf612 Likun Gao 2025-01-07  1315  				xcc_id, i % adev->sdma.num_inst_per_xcc,
4ed5116aacf612 Likun Gao 2025-01-07 @1316  				ring->use_doorbell?"true":"false");
4ed5116aacf612 Likun Gao 2025-01-07  1317  
4ed5116aacf612 Likun Gao 2025-01-07  1318  		ring->doorbell_index =
4ed5116aacf612 Likun Gao 2025-01-07  1319  			(adev->doorbell_index.sdma_engine[i] << 1); // get DWORD offset
4ed5116aacf612 Likun Gao 2025-01-07  1320  
4ed5116aacf612 Likun Gao 2025-01-07  1321  		ring->vm_hub = AMDGPU_GFXHUB(xcc_id);
4ed5116aacf612 Likun Gao 2025-01-07  1322  		sprintf(ring->name, "sdma%d.%d", xcc_id,
4ed5116aacf612 Likun Gao 2025-01-07  1323  				i % adev->sdma.num_inst_per_xcc);
4ed5116aacf612 Likun Gao 2025-01-07  1324  		r = amdgpu_ring_init(adev, ring, 1024,
4ed5116aacf612 Likun Gao 2025-01-07  1325  				     &adev->sdma.trap_irq,
4ed5116aacf612 Likun Gao 2025-01-07  1326  				     AMDGPU_SDMA_IRQ_INSTANCE0 + i,
4ed5116aacf612 Likun Gao 2025-01-07  1327  				     AMDGPU_RING_PRIO_DEFAULT, NULL);
4ed5116aacf612 Likun Gao 2025-01-07  1328  		if (r)
4ed5116aacf612 Likun Gao 2025-01-07  1329  			return r;
4ed5116aacf612 Likun Gao 2025-01-07  1330  	}
4ed5116aacf612 Likun Gao 2025-01-07  1331  
4ed5116aacf612 Likun Gao 2025-01-07  1332  	adev->sdma.supported_reset =
4ed5116aacf612 Likun Gao 2025-01-07  1333  		amdgpu_get_soft_full_reset_mask(&adev->sdma.instance[0].ring);
4ed5116aacf612 Likun Gao 2025-01-07  1334  	if (!amdgpu_sriov_vf(adev) &&
4ed5116aacf612 Likun Gao 2025-01-07  1335  	    !adev->debug_disable_gpu_ring_reset)
4ed5116aacf612 Likun Gao 2025-01-07  1336  		adev->sdma.supported_reset |= AMDGPU_RESET_TYPE_PER_QUEUE;
4ed5116aacf612 Likun Gao 2025-01-07  1337  
4ed5116aacf612 Likun Gao 2025-01-07  1338  	r = amdgpu_sdma_sysfs_reset_mask_init(adev);
4ed5116aacf612 Likun Gao 2025-01-07  1339  	if (r)
4ed5116aacf612 Likun Gao 2025-01-07  1340  		return r;
4ed5116aacf612 Likun Gao 2025-01-07  1341  	/* Allocate memory for SDMA IP Dump buffer */
4ed5116aacf612 Likun Gao 2025-01-07  1342  	ptr = kcalloc(adev->sdma.num_instances * reg_count, sizeof(uint32_t), GFP_KERNEL);
4ed5116aacf612 Likun Gao 2025-01-07  1343  	if (ptr)
4ed5116aacf612 Likun Gao 2025-01-07  1344  		adev->sdma.ip_dump = ptr;
4ed5116aacf612 Likun Gao 2025-01-07  1345  	else
4ed5116aacf612 Likun Gao 2025-01-07  1346  		DRM_ERROR("Failed to allocated memory for SDMA IP Dump\n");
4ed5116aacf612 Likun Gao 2025-01-07  1347  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
