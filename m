Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BCB125C7
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Jun 2023 14:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687358054; x=1718894054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+7H0Z0yf/YE7/d8OWgE3Cz3UH3fz8DLva56Ra+padHw=;
  b=oFy6X5yKXkqC7gTlFpMRgTMHkmy5WJtfy4CMXmIa1BB5CdY7YGf2vOcj
   ajrS3BImtNhzD9lutHiLK+jj5BTXsmciT3+Ce16hR8c5uxWMK281/BJ/l
   og9bpCD1nXDSAXn2dW/UUziW87jaJQLivw6xy7W6fUafO1ZQ28f2YBlkk
   0dasFCHO9e01KQnvQLQZmxfbFoEKQGYRGkDIl+/Cgh681imzkd3XJiNqG
   9vKvM1D8ALpwF75z2//56UYtltYSzUC7xjKbUh+14a0ENMqrWNwyNRqwe
   bmizjGoHBIJeMAY/5fpVaghoz/KgiuB+T6DADr2hEtW35jV0vEUpHec0d
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="339806630"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="339806630"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 07:34:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="708725278"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="708725278"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 21 Jun 2023 07:34:09 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qByuO-0006tD-30;
	Wed, 21 Jun 2023 14:34:08 +0000
Date: Wed, 21 Jun 2023 22:33:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jimc:dd-fix-2i 14/18] drivers/gpu/drm/drm_print.c:72:1: sparse:
 sparse: symbol with external linkage has initializer
Message-ID: <202306212236.GVs74ID5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/gpu/drm/drm_print.c:72:1: sparse: sparse: symbol with external linkage has initializer"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jim Cromie <jim.cromie@gmail.com>

Hi Jim,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/jimc/linux.git dd-fix-2i
head:   706822e871c197cefca034dce9582e0fc916732b
commit: ef232594f3c9aad7f5e0025231dc669570c3548a [14/18] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: i386-randconfig-s002-20230620 (https://download.01.org/0day-ci/archive/20230621/202306212236.GVs74ID5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306212236.GVs74ID5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306212236.GVs74ID5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_print.c:72:1: sparse: sparse: symbol with external linkage has initializer
   drivers/gpu/drm/drm_print.c:59:1: sparse: sparse: symbol 'drm_debug_classes_classnames' was not declared. Should it be static?

vim +72 drivers/gpu/drm/drm_print.c

f158936b60a787 Jim Cromie 2022-09-11  54  
f158936b60a787 Jim Cromie 2022-09-11  55  #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
f158936b60a787 Jim Cromie 2022-09-11  56  module_param_named(debug, __drm_debug, ulong, 0600);
f158936b60a787 Jim Cromie 2022-09-11  57  #else
164636c3874a28 Jim Cromie 2022-12-21  58  /* classnames must match value-symbols of enum drm_debug_category */
164636c3874a28 Jim Cromie 2022-12-21  59  DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
164636c3874a28 Jim Cromie 2022-12-21  60  		    DRM_UT_CORE,
f158936b60a787 Jim Cromie 2022-09-11  61  		    "DRM_UT_CORE",
f158936b60a787 Jim Cromie 2022-09-11  62  		    "DRM_UT_DRIVER",
f158936b60a787 Jim Cromie 2022-09-11  63  		    "DRM_UT_KMS",
f158936b60a787 Jim Cromie 2022-09-11  64  		    "DRM_UT_PRIME",
f158936b60a787 Jim Cromie 2022-09-11  65  		    "DRM_UT_ATOMIC",
f158936b60a787 Jim Cromie 2022-09-11  66  		    "DRM_UT_VBL",
f158936b60a787 Jim Cromie 2022-09-11  67  		    "DRM_UT_STATE",
f158936b60a787 Jim Cromie 2022-09-11  68  		    "DRM_UT_LEASE",
f158936b60a787 Jim Cromie 2022-09-11  69  		    "DRM_UT_DP",
f158936b60a787 Jim Cromie 2022-09-11  70  		    "DRM_UT_DRMRES");
f158936b60a787 Jim Cromie 2022-09-11  71  
c3109b624b9d04 Jim Cromie 2023-06-09 @72  DRM_CLASSMAP_PARAM_REF(debug, __drm_debug, drm_debug_classes, p);
c3109b624b9d04 Jim Cromie 2023-06-09  73  

:::::: The code at line 72 was first introduced by commit
:::::: c3109b624b9d040f1002ae267886572688fd2d93 dyndbg-API: promote DYNDBG_CLASSMAP_PARAM to API

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
