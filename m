Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A77520F9
	for <oe-kbuild@lists.linux.dev>; Mon,  8 May 2023 17:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683565421; x=1715101421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ALxKTp8L1GJPIOgd3NRCEA+GBK74NViM0qilidopR+4=;
  b=gMyps+lyizGJmU4eI3oucEvp1LrxtHd8UaKqqTmhkexy+cBhlmh5aIV+
   ViWUuzWhfSYfvioOHcI+bVS7uNnMwJmxzXUrviB5SMP2f1uC+S7kXmlO7
   32wPt7hf2RPojq1qMBdLxK80MBCzBvwiEMxKiHxOdfqp6H+PU4QE9Ji6b
   z1xJRGjkyOiC7HUo1XY9DmTqho8VkEmpidK4yLWyK/z0xHtH2cg/jeWsW
   D79TIT0aPNrI9qslbU0Xa4rDje6e7DGw5T32Rueji8Rj3wTraZSd5q3NZ
   IDo8FpRx2ZTar3s5cyp0hZ8tHYRa7iLUX2V1NfTLZbwBfBfIsX5nvwVGn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="377799258"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="377799258"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 10:03:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="763472820"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="763472820"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 08 May 2023 10:03:38 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pw4Gv-0001Kd-0F;
	Mon, 08 May 2023 17:03:37 +0000
Date: Tue, 9 May 2023 01:02:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 547/1074]
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:495:2-8: preceding lock on line 491
Message-ID: <202305090004.4HEjK3qT-lkp@intel.com>
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
TO: Le Ma <le.ma@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   52025ebbb518a2d876b8aba191b348ffb1cf368b
commit: def799c6596d078112095c24c25e162cb5102d90 [547/1074] drm/amdgpu: add multi-xcc support to amdgpu_gfx interfaces (v4)
:::::: branch date: 13 hours ago
:::::: commit date: 3 weeks ago
config: alpha-randconfig-c042-20230507 (https://download.01.org/0day-ci/archive/20230509/202305090004.4HEjK3qT-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202305090004.4HEjK3qT-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:495:2-8: preceding lock on line 491
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:558:2-8: preceding lock on line 551

vim +495 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c

d23ee13fba23a3 Rex Zhu    2018-07-30  480  
def799c6596d07 Le Ma      2022-05-24  481  int amdgpu_gfx_disable_kcq(struct amdgpu_device *adev, int xcc_id)
ba0c13b7747ba0 Rex Zhu    2018-08-22  482  {
def799c6596d07 Le Ma      2022-05-24  483  	struct amdgpu_kiq *kiq = &adev->gfx.kiq[xcc_id];
ba0c13b7747ba0 Rex Zhu    2018-08-22  484  	struct amdgpu_ring *kiq_ring = &kiq->ring;
18ee4ce63e0f32 Jack Xiao  2022-04-13  485  	int i, r = 0;
def799c6596d07 Le Ma      2022-05-24  486  	int j;
ba0c13b7747ba0 Rex Zhu    2018-08-22  487  
ba0c13b7747ba0 Rex Zhu    2018-08-22  488  	if (!kiq->pmf || !kiq->pmf->kiq_unmap_queues)
ba0c13b7747ba0 Rex Zhu    2018-08-22  489  		return -EINVAL;
ba0c13b7747ba0 Rex Zhu    2018-08-22  490  
def799c6596d07 Le Ma      2022-05-24 @491  	spin_lock(&kiq->ring_lock);
ba0c13b7747ba0 Rex Zhu    2018-08-22  492  	if (amdgpu_ring_alloc(kiq_ring, kiq->pmf->unmap_queues_size *
5a8cd98e6e335a Nirmoy Das 2021-03-12  493  					adev->gfx.num_compute_rings)) {
277bd3371f1140 Le Ma      2022-05-24  494  		spin_unlock(&adev->gfx.kiq[0].ring_lock);
ba0c13b7747ba0 Rex Zhu    2018-08-22 @495  		return -ENOMEM;
5a8cd98e6e335a Nirmoy Das 2021-03-12  496  	}
ba0c13b7747ba0 Rex Zhu    2018-08-22  497  
def799c6596d07 Le Ma      2022-05-24  498  	for (i = 0; i < adev->gfx.num_compute_rings; i++) {
def799c6596d07 Le Ma      2022-05-24  499  		j = i + xcc_id * adev->gfx.num_compute_rings;
19191961659c52 Jack Xiao  2019-01-08  500  		kiq->pmf->kiq_unmap_queues(kiq_ring, &adev->gfx.compute_ring[i],
19191961659c52 Jack Xiao  2019-01-08  501  					   RESET_QUEUES, 0, 0);
def799c6596d07 Le Ma      2022-05-24  502  	}
18ee4ce63e0f32 Jack Xiao  2022-04-13  503  
277bd3371f1140 Le Ma      2022-05-24  504  	if (adev->gfx.kiq[0].ring.sched.ready && !adev->job_hang)
5a8cd98e6e335a Nirmoy Das 2021-03-12  505  		r = amdgpu_ring_test_helper(kiq_ring);
def799c6596d07 Le Ma      2022-05-24  506  	spin_unlock(&kiq->ring_lock);
ba0c13b7747ba0 Rex Zhu    2018-08-22  507  
5a8cd98e6e335a Nirmoy Das 2021-03-12  508  	return r;
ba0c13b7747ba0 Rex Zhu    2018-08-22  509  }
ba0c13b7747ba0 Rex Zhu    2018-08-22  510  

:::::: The code at line 495 was first introduced by commit
:::::: ba0c13b7747ba0157603414366bbe5a00a2f32cd drm/amdgpu: Add common gfx func Disable kcq via kiq

:::::: TO: Rex Zhu <Rex.Zhu@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
