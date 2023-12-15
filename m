Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975AE1A5B0
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Dec 2023 10:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iCLzEdPs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702636725; x=1734172725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8V5/KWT0qHfAVoNiHU53PQIMZ4REGSvq5XJmVk53N9k=;
  b=iCLzEdPsUV5544hi7AC0bN66p6eETeC9uLRX3j7z222/J5z3TS77L9sO
   js2zPvxNVYsXeoLDSVT5Ls4ZgatALkantkPlaW0zq2Ozwl3U9h9Jr9ZqT
   WEwIxRzaEO6OFszSeJNlX0lXADVltF9DY3CA0hcTk3M4GlAoRsDqwso5s
   pqkdSiSkt82eaARoIFI42160lopdCLO+awu/aDVqMXAgqTUNEWkAv75Wc
   okENTC16LV+TaRHxJt0v71K7VHS7w70k/Z842er1E8AG0z/BqBA21orSz
   s3vJuKXHMuVH2Z9bUQqD1n5mZ94gKPrH201mvJFRw9+ViQSMEWm2LqkgK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="385676813"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="385676813"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 02:38:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="778222961"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="778222961"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 15 Dec 2023 02:38:43 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rE5ab-000NOq-0m;
	Fri, 15 Dec 2023 10:38:41 +0000
Date: Fri, 15 Dec 2023 18:36:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [esmil:jh7110 36/43] drivers/gpu/drm/verisilicon/vs_dc.c:731:15-16:
 WARNING opportunity for swap()
Message-ID: <202312151854.SXMjpEOs-lkp@intel.com>
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
TO: Keith Zhao <keith.zhao@starfivetech.com>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>

tree:   https://github.com/esmil/linux jh7110
head:   bebe83d360486029c861b78d6f751aa6d857adf9
commit: 5ef253a52e2113e8685c7222ca98fa1d9362445e [36/43] drm/vs: Add KMS crtc&plane
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-r061-20231215 (https://download.01.org/0day-ci/archive/20231215/202312151854.SXMjpEOs-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312151854.SXMjpEOs-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/verisilicon/vs_dc.c:731:15-16: WARNING opportunity for swap()

vim +731 drivers/gpu/drm/verisilicon/vs_dc.c

5ef253a52e2113 Keith Zhao 2023-12-04  711  
5ef253a52e2113 Keith Zhao 2023-12-04  712  static void update_scale(struct drm_plane_state *state, struct dc_hw_roi *roi,
5ef253a52e2113 Keith Zhao 2023-12-04  713  			 struct dc_hw_scale *scale)
5ef253a52e2113 Keith Zhao 2023-12-04  714  {
5ef253a52e2113 Keith Zhao 2023-12-04  715  	int dst_w = drm_rect_width(&state->dst);
5ef253a52e2113 Keith Zhao 2023-12-04  716  	int dst_h = drm_rect_height(&state->dst);
5ef253a52e2113 Keith Zhao 2023-12-04  717  	int src_w, src_h, temp;
5ef253a52e2113 Keith Zhao 2023-12-04  718  
5ef253a52e2113 Keith Zhao 2023-12-04  719  	scale->enable = false;
5ef253a52e2113 Keith Zhao 2023-12-04  720  
5ef253a52e2113 Keith Zhao 2023-12-04  721  	if (roi->enable) {
5ef253a52e2113 Keith Zhao 2023-12-04  722  		src_w = roi->width;
5ef253a52e2113 Keith Zhao 2023-12-04  723  		src_h = roi->height;
5ef253a52e2113 Keith Zhao 2023-12-04  724  	} else {
5ef253a52e2113 Keith Zhao 2023-12-04  725  		src_w = drm_rect_width(&state->src) >> 16;
5ef253a52e2113 Keith Zhao 2023-12-04  726  		src_h = drm_rect_height(&state->src) >> 16;
5ef253a52e2113 Keith Zhao 2023-12-04  727  	}
5ef253a52e2113 Keith Zhao 2023-12-04  728  
5ef253a52e2113 Keith Zhao 2023-12-04  729  	if (drm_rotation_90_or_270(state->rotation)) {
5ef253a52e2113 Keith Zhao 2023-12-04  730  		temp = src_w;
5ef253a52e2113 Keith Zhao 2023-12-04 @731  		src_w = src_h;
5ef253a52e2113 Keith Zhao 2023-12-04  732  		src_h = temp;
5ef253a52e2113 Keith Zhao 2023-12-04  733  	}
5ef253a52e2113 Keith Zhao 2023-12-04  734  
5ef253a52e2113 Keith Zhao 2023-12-04  735  	if (src_w != dst_w) {
5ef253a52e2113 Keith Zhao 2023-12-04  736  		scale->scale_factor_x = calc_factor(src_w, dst_w);
5ef253a52e2113 Keith Zhao 2023-12-04  737  		scale->enable = true;
5ef253a52e2113 Keith Zhao 2023-12-04  738  	} else {
5ef253a52e2113 Keith Zhao 2023-12-04  739  		scale->scale_factor_x = 1 << 16;
5ef253a52e2113 Keith Zhao 2023-12-04  740  	}
5ef253a52e2113 Keith Zhao 2023-12-04  741  	if (src_h != dst_h) {
5ef253a52e2113 Keith Zhao 2023-12-04  742  		scale->scale_factor_y = calc_factor(src_h, dst_h);
5ef253a52e2113 Keith Zhao 2023-12-04  743  		scale->enable = true;
5ef253a52e2113 Keith Zhao 2023-12-04  744  	} else {
5ef253a52e2113 Keith Zhao 2023-12-04  745  		scale->scale_factor_y = 1 << 16;
5ef253a52e2113 Keith Zhao 2023-12-04  746  	}
5ef253a52e2113 Keith Zhao 2023-12-04  747  }
5ef253a52e2113 Keith Zhao 2023-12-04  748  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
