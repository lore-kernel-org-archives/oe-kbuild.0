Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2897A8825
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Oct 2023 07:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lN6JY4TK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698304088; x=1729840088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UuNlhRLWwvbWLTOqQLwujqB60sEZAGwU+OcBBCd8VxE=;
  b=lN6JY4TKkWA8V+/SpeXvoSH39k5kIcQqbmGvr83rwartE3hWx3ByDaKw
   qu3OZOR5Utm3R/tdRBQYctj0mJXgaLmoah0j0gWrJOjedakJN/Y/mVd1Y
   7sUsizAblUheqL8Zvvb02JWfGogCjfpPnIUaiphRK8S/KWWSvGZfcwXJ3
   yPrKkfkyUIDUwTzohWqQ433mS7ze2YvblR4VckwBkqyGsFDelfVGYyXIh
   NXRxQ4kpxYd3OgsiWZFu9LQV3ZKcuFHC3p9hCmWnbxZyQOVwzzKRh8oq+
   BOwZ5zkG2STIw+080LiEfDTkZvizSfwneQinvmx2twe/7H7mx0ZTKpqyj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="390333861"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="390333861"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 00:08:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="752612178"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="752612178"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 26 Oct 2023 00:08:06 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvuTM-0009Zt-0R;
	Thu, 26 Oct 2023 07:08:04 +0000
Date: Thu, 26 Oct 2023 15:08:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/7] RAS: Add Address Translation support for MI200
Message-ID: <202310261444.Z20oGCyr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231025073339.630093-2-muralimk@amd.com>
References: <20231025073339.630093-2-muralimk@amd.com>
TO: Muralidhara M K <muralimk@amd.com>
TO: linux-edac@vger.kernel.org
TO: x86@kernel.org
CC: linux-kernel@vger.kernel.org
CC: bp@alien8.de
CC: mchehab@kernel.org
CC: Muralidhara M K <muralidhara.mk@amd.com>
CC: Yazen Ghannam <yazen.ghannam@amd.com>

Hi Muralidhara,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ras/edac-for-next]
[also build test WARNING on tip/master linus/master tip/auto-latest v6.6-rc7 next-20231025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Muralidhara-M-K/RAS-Add-Address-Translation-support-for-MI200/20231025-154756
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git edac-for-next
patch link:    https://lore.kernel.org/r/20231025073339.630093-2-muralimk%40amd.com
patch subject: [PATCH 1/7] RAS: Add Address Translation support for MI200
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: x86_64-randconfig-071-20231026 (https://download.01.org/0day-ci/archive/20231026/202310261444.Z20oGCyr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310261444.Z20oGCyr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310261444.Z20oGCyr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ras/amd/atl/map.c:416:5: warning: no previous prototype for 'get_umc_to_cs_mapping' [-Wmissing-prototypes]
     416 | int get_umc_to_cs_mapping(struct addr_ctx *ctx)
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/get_umc_to_cs_mapping +416 drivers/ras/amd/atl/map.c

ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  403  
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  404  /* UMC to CS mapping for MI200 die[0]s */
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  405  u8 umc_to_cs_mapping_mi200_die0[] = { 28, 20, 24, 16, 12, 4, 8, 0,
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  406  					6, 30, 2, 26, 22, 14, 18, 10,
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  407  					19, 11, 15, 7, 3, 27, 31, 23,
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  408  					9, 1, 5, 29, 25, 17, 21, 13};
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  409  
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  410  /* UMC to CS mapping for MI200 die[1]s */
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  411  u8 umc_to_cs_mapping_mi200_die1[] = { 19, 11, 15, 7, 3, 27, 31, 23,
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  412  					9, 1, 5, 29, 25, 17, 21, 13,
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  413  					28, 20, 24, 16, 12, 4, 8, 0,
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  414  					6, 30, 2, 26, 22, 14, 18, 10};
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  415  
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25 @416  int get_umc_to_cs_mapping(struct addr_ctx *ctx)
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  417  {
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  418  	if (ctx->inst_id >= sizeof(umc_to_cs_mapping_mi200_die0))
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  419  		return -EINVAL;
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  420  
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  421  	/*
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  422  	 * MI200 has 2 dies and are enumerated alternatively
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  423  	 * die0's are enumerated as node 2, 4, 6 and 8
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  424  	 * die1's are enumerated as node 1, 3, 5 and 7
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  425  	 */
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  426  	if (ctx->node_id % 2)
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  427  		ctx->inst_id = umc_to_cs_mapping_mi200_die1[ctx->inst_id];
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  428  	else
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  429  		ctx->inst_id = umc_to_cs_mapping_mi200_die0[ctx->inst_id];
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  430  
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  431  	return 0;
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  432  }
ea0e1d9c3eaf5d Muralidhara M K 2023-10-25  433  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
