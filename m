Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250FA8BE3
	for <oe-kbuild@lists.linux.dev>; Tue,  9 May 2023 13:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683637528; x=1715173528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IuvZc7W7nKKsr12PAJt2CgPS5Seu/dgpzXPqI6HaJPc=;
  b=oHDMqtt7wtMnbWxHMELgUgoW7193ADsvaEHTy1GlGkdQhSy/7wi1mQKc
   CdseQtYPTsYyNaQM/90lNUxsVLRj3QTSTkc5xvfhWqHQt+KLV6Lf1AoKs
   ImpayIkzmDHzWx34fvaFws1YxSgz8tJJiUhz9gM8DUj4cILNJSOJqi7sE
   8iJSf/Q5dYmfKSPW/wpvrVPlDnLJQED/NiPxeoDQwEqsScGZ+Q4HfxD2J
   2lDu8izu+v2uNxqNgRl50+/gO26Y08JWZ47iSIK2WL4kOKnZfbL6RC3g5
   p07iGifM/NSDnYkL368+9/bTDBAnCWKm3L2Y9PUTKrhhBkoWEgVJ2ALZF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="413187322"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="413187322"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 06:05:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="823082779"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="823082779"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 May 2023 06:05:03 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwN1b-0002AG-0i;
	Tue, 09 May 2023 13:05:03 +0000
Date: Tue, 9 May 2023 21:04:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 955/1512]
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:658 amdgpu_gfx_enable_kgq() warn:
 inconsistent returns '&kiq->ring_lock'.
Message-ID: <202305092002.VnRkluOB-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alex Deucher <alexander.deucher@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47cba14ce6fc4f314bd814d07269d0c8de1e4ae6
commit: 9bfa241d12896ef661116467774280d9cf680ea1 [955/1512] drm/amdgpu: add [en/dis]able_kgq() functions
:::::: branch date: 10 hours ago
:::::: commit date: 4 days ago
config: ia64-randconfig-m031-20230507 (https://download.01.org/0day-ci/archive/20230509/202305092002.VnRkluOB-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305092002.VnRkluOB-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:658 amdgpu_gfx_enable_kgq() warn: inconsistent returns '&kiq->ring_lock'.

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:133 amdgpu_gfx_parse_disable_cu() warn: potential spectre issue 'mask' [w]
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:623 amdgpu_gfx_enable_kcq() warn: inconsistent returns '&kiq->ring_lock'.

vim +658 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c

849aca9f9c033a Hawking Zhang 2019-03-05  625  
9bfa241d12896e Alex Deucher  2023-04-24  626  int amdgpu_gfx_enable_kgq(struct amdgpu_device *adev, int xcc_id)
9bfa241d12896e Alex Deucher  2023-04-24  627  {
9bfa241d12896e Alex Deucher  2023-04-24  628  	struct amdgpu_kiq *kiq = &adev->gfx.kiq[xcc_id];
9bfa241d12896e Alex Deucher  2023-04-24  629  	struct amdgpu_ring *kiq_ring = &kiq->ring;
9bfa241d12896e Alex Deucher  2023-04-24  630  	int r, i, j;
9bfa241d12896e Alex Deucher  2023-04-24  631  
9bfa241d12896e Alex Deucher  2023-04-24  632  	if (!kiq->pmf || !kiq->pmf->kiq_map_queues)
9bfa241d12896e Alex Deucher  2023-04-24  633  		return -EINVAL;
9bfa241d12896e Alex Deucher  2023-04-24  634  
9bfa241d12896e Alex Deucher  2023-04-24  635  	spin_lock(&kiq->ring_lock);
9bfa241d12896e Alex Deucher  2023-04-24  636  	/* No need to map kcq on the slave */
9bfa241d12896e Alex Deucher  2023-04-24  637  	if (amdgpu_gfx_is_master_xcc(adev, xcc_id)) {
9bfa241d12896e Alex Deucher  2023-04-24  638  		r = amdgpu_ring_alloc(kiq_ring, kiq->pmf->map_queues_size *
9bfa241d12896e Alex Deucher  2023-04-24  639  						adev->gfx.num_gfx_rings);
9bfa241d12896e Alex Deucher  2023-04-24  640  		if (r) {
9bfa241d12896e Alex Deucher  2023-04-24  641  			DRM_ERROR("Failed to lock KIQ (%d).\n", r);
9bfa241d12896e Alex Deucher  2023-04-24  642  			spin_unlock(&adev->gfx.kiq[0].ring_lock);
9bfa241d12896e Alex Deucher  2023-04-24  643  			return r;
9bfa241d12896e Alex Deucher  2023-04-24  644  		}
9bfa241d12896e Alex Deucher  2023-04-24  645  
9bfa241d12896e Alex Deucher  2023-04-24  646  		for (i = 0; i < adev->gfx.num_gfx_rings; i++) {
9bfa241d12896e Alex Deucher  2023-04-24  647  			j = i + xcc_id * adev->gfx.num_gfx_rings;
9bfa241d12896e Alex Deucher  2023-04-24  648  			kiq->pmf->kiq_map_queues(kiq_ring,
9bfa241d12896e Alex Deucher  2023-04-24  649  						 &adev->gfx.gfx_ring[i]);
9bfa241d12896e Alex Deucher  2023-04-24  650  		}
9bfa241d12896e Alex Deucher  2023-04-24  651  	}
9bfa241d12896e Alex Deucher  2023-04-24  652  
9bfa241d12896e Alex Deucher  2023-04-24  653  	r = amdgpu_ring_test_helper(kiq_ring);
9bfa241d12896e Alex Deucher  2023-04-24  654  	spin_unlock(&kiq->ring_lock);
9bfa241d12896e Alex Deucher  2023-04-24  655  	if (r)
9bfa241d12896e Alex Deucher  2023-04-24  656  		DRM_ERROR("KCQ enable failed\n");
9bfa241d12896e Alex Deucher  2023-04-24  657  
9bfa241d12896e Alex Deucher  2023-04-24 @658  	return r;
9bfa241d12896e Alex Deucher  2023-04-24  659  }
9bfa241d12896e Alex Deucher  2023-04-24  660  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
