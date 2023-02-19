Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555192F4B
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Feb 2023 19:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676835047; x=1708371047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TFU0jcjfW261edmXnI8qwCTRo+6/4vmWEtedUhSITK4=;
  b=FrPJIi257ghpx4xZAfks3bkR2DrPLSr6DPOIgzsnZWnUv6rmi/x17BXW
   j3PWeMgDdl2NWD13BEsWj+EQwCcrrEJXt7xEM618cIWMkiLnEYh2n5Wjn
   BtxFjcIng4BX35c1MAyGv4vThyaO9aablhvOfSET1KSbpoNu4tlKuotbJ
   nDeqyRlFxmFwnvm2dr4Xh6OaymPMNaL7SlN4YPo7tMNOJg05HvAXid9H0
   Nclyed8D1/6MYB7Imlqg+gxOzIRAAg5aDiMm1IVa5enkLrWKLZwKFj9S2
   sAlD8ToVn/5Hb8lgZrc+1cnP4+gIw+SDwI3wVDtG5bo0AQIsjZyKmY4gr
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="359739482"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="359739482"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 11:30:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="759954887"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="759954887"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Feb 2023 11:30:43 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTpOV-000DQu-0j;
	Sun, 19 Feb 2023 19:30:43 +0000
Date: Mon, 20 Feb 2023 03:29:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c:693
 intel_guc_slpc_override_gucrc_mode() error: uninitialized symbol 'ret'.
Message-ID: <202302200326.p13UtHQ6-lkp@intel.com>
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
TO: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: John Harrison <John.C.Harrison@Intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: Ashutosh Dixit <ashutosh.dixit@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   925cf0457d7e62ce08878ffb789189ac08ca8677
commit: 01e7427467857861d1aaa7cd05598dfcb631c5b5 drm/i915/guc: Support OA when Wa_16011777198 is enabled
date:   4 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230220/202302200326.p13UtHQ6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302200326.p13UtHQ6-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c:693 intel_guc_slpc_override_gucrc_mode() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c:435 intel_guc_slpc_set_max_freq() error: uninitialized symbol 'ret'.

vim +/ret +693 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c

025cb07bebfaf9 Vinay Belgaumkar 2021-07-30  666  
01e74274678578 Vinay Belgaumkar 2022-10-26  667  /**
01e74274678578 Vinay Belgaumkar 2022-10-26  668   * intel_guc_slpc_override_gucrc_mode() - override GUCRC mode
01e74274678578 Vinay Belgaumkar 2022-10-26  669   * @slpc: pointer to intel_guc_slpc.
01e74274678578 Vinay Belgaumkar 2022-10-26  670   * @mode: new value of the mode.
01e74274678578 Vinay Belgaumkar 2022-10-26  671   *
01e74274678578 Vinay Belgaumkar 2022-10-26  672   * This function will override the GUCRC mode.
01e74274678578 Vinay Belgaumkar 2022-10-26  673   *
01e74274678578 Vinay Belgaumkar 2022-10-26  674   * Return: 0 on success, non-zero error code on failure.
01e74274678578 Vinay Belgaumkar 2022-10-26  675   */
01e74274678578 Vinay Belgaumkar 2022-10-26  676  int intel_guc_slpc_override_gucrc_mode(struct intel_guc_slpc *slpc, u32 mode)
01e74274678578 Vinay Belgaumkar 2022-10-26  677  {
01e74274678578 Vinay Belgaumkar 2022-10-26  678  	int ret;
01e74274678578 Vinay Belgaumkar 2022-10-26  679  	struct drm_i915_private *i915 = slpc_to_i915(slpc);
01e74274678578 Vinay Belgaumkar 2022-10-26  680  	intel_wakeref_t wakeref;
01e74274678578 Vinay Belgaumkar 2022-10-26  681  
01e74274678578 Vinay Belgaumkar 2022-10-26  682  	if (mode >= SLPC_GUCRC_MODE_MAX)
01e74274678578 Vinay Belgaumkar 2022-10-26  683  		return -EINVAL;
01e74274678578 Vinay Belgaumkar 2022-10-26  684  
01e74274678578 Vinay Belgaumkar 2022-10-26  685  	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
01e74274678578 Vinay Belgaumkar 2022-10-26  686  		ret = slpc_set_param(slpc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
01e74274678578 Vinay Belgaumkar 2022-10-26  687  		if (ret)
01e74274678578 Vinay Belgaumkar 2022-10-26  688  			drm_err(&i915->drm,
01e74274678578 Vinay Belgaumkar 2022-10-26  689  				"Override gucrc mode %d failed %d\n",
01e74274678578 Vinay Belgaumkar 2022-10-26  690  				mode, ret);
01e74274678578 Vinay Belgaumkar 2022-10-26  691  	}
01e74274678578 Vinay Belgaumkar 2022-10-26  692  
01e74274678578 Vinay Belgaumkar 2022-10-26 @693  	return ret;
01e74274678578 Vinay Belgaumkar 2022-10-26  694  }
01e74274678578 Vinay Belgaumkar 2022-10-26  695  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
