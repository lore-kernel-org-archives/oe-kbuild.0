Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FADA19446
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Sep 2023 21:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695330693; x=1726866693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e0SVPdTDvsWDXvBvjvEjwBdf+jluQTgSgom37pK7vmQ=;
  b=AHiu7EsAy9Xh2Cr6op8WcKeZkFOHoIj+2re7rLEKAcrRtu1dWWu3jdaZ
   X80goLzSc/JxNXCzH8i/Dp/1stYcTuqdi3gs3X5oOe85o3RTTIBign82c
   jQBBB1zcAxqSA3HkezwayISO0jw9u4Y5AwT3gCdczXr4C0Proh0meM6yo
   lwEVMI4hRv0kS0rDz7kO2Fpj7gS521mDYQQUfQp2vBPHc2FGyKCw81QVh
   HWSWAvcumnNul2dWoK82s8Mbbs4yaGMz8sKQk0pyk7K1Itg1PzHXYoMhU
   S9h1noc1tKCqgTKvEk4zqGxLo81B7dXIJPOjdDFo2byIFx0V6CeSfYza1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="447144809"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="447144809"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 14:11:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="870992757"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="870992757"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 21 Sep 2023 14:11:31 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjQxM-0000PT-2A;
	Thu, 21 Sep 2023 21:11:28 +0000
Date: Fri, 22 Sep 2023 05:11:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6444/6975]
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c:209 amdgpu_mca_smu_get_mca_entry()
 warn: variable dereferenced before check 'mca_funcs' (see line 200)
Message-ID: <202309220545.myjJqr8V-lkp@intel.com>
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
TO: Yang Wang <kevinyang.wang@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   940fcc189c51032dd0282cbee4497542c982ac59
commit: 7ff607e27233861b3f83e658317b3fb18b047229 [6444/6975] drm/amdgpu: add amdgpu smu mca dump feature support
:::::: branch date: 18 hours ago
:::::: commit date: 29 hours ago
config: i386-randconfig-141-20230921 (https://download.01.org/0day-ci/archive/20230922/202309220545.myjJqr8V-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230922/202309220545.myjJqr8V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309220545.myjJqr8V-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c:209 amdgpu_mca_smu_get_mca_entry() warn: variable dereferenced before check 'mca_funcs' (see line 200)

vim +/mca_funcs +209 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c

7ff607e2723386 Yang Wang 2023-09-05  188  
7ff607e2723386 Yang Wang 2023-09-05  189  int amdgpu_mca_smu_get_mca_entry(struct amdgpu_device *adev, enum amdgpu_mca_error_type type,
7ff607e2723386 Yang Wang 2023-09-05  190  				 int idx, struct mca_bank_entry *entry)
7ff607e2723386 Yang Wang 2023-09-05  191  {
7ff607e2723386 Yang Wang 2023-09-05  192  	const struct amdgpu_mca_smu_funcs *mca_funcs = adev->mca.mca_funcs;
7ff607e2723386 Yang Wang 2023-09-05  193  	int count;
7ff607e2723386 Yang Wang 2023-09-05  194  
7ff607e2723386 Yang Wang 2023-09-05  195  	switch (type) {
7ff607e2723386 Yang Wang 2023-09-05  196  	case AMDGPU_MCA_ERROR_TYPE_UE:
7ff607e2723386 Yang Wang 2023-09-05  197  		count = mca_funcs->max_ue_count;
7ff607e2723386 Yang Wang 2023-09-05  198  		break;
7ff607e2723386 Yang Wang 2023-09-05  199  	case AMDGPU_MCA_ERROR_TYPE_CE:
7ff607e2723386 Yang Wang 2023-09-05 @200  		count = mca_funcs->max_ce_count;
7ff607e2723386 Yang Wang 2023-09-05  201  		break;
7ff607e2723386 Yang Wang 2023-09-05  202  	default:
7ff607e2723386 Yang Wang 2023-09-05  203  		return -EINVAL;
7ff607e2723386 Yang Wang 2023-09-05  204  	}
7ff607e2723386 Yang Wang 2023-09-05  205  
7ff607e2723386 Yang Wang 2023-09-05  206  	if (idx >= count)
7ff607e2723386 Yang Wang 2023-09-05  207  		return -EINVAL;
7ff607e2723386 Yang Wang 2023-09-05  208  
7ff607e2723386 Yang Wang 2023-09-05 @209  	if (mca_funcs && mca_funcs->mca_get_mca_entry)
7ff607e2723386 Yang Wang 2023-09-05  210  		return mca_funcs->mca_get_mca_entry(adev, type, idx, entry);
7ff607e2723386 Yang Wang 2023-09-05  211  
7ff607e2723386 Yang Wang 2023-09-05  212  	return -EOPNOTSUPP;
7ff607e2723386 Yang Wang 2023-09-05  213  }
7ff607e2723386 Yang Wang 2023-09-05  214  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
