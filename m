Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B857F4A4EEA
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Sep 2026 19:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790105828; cv=none; b=qiGKX2bpobpduC7W91OF631UIuMeNxKCXlRr6eyK7zSN2K0gEnvZA4s/CxA+0aitzcaExFBv/3A7PCNoP0K9Ik5lYAvA62tTfaBLVYetuGKSMYi3hJXICp7WuVPggFJS04hQskHqPiBE/aPq/1nfEcwAhmdOTUWmBvMUjYT9RQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790105828; c=relaxed/simple;
	bh=4NJrQdK7tZD+5I3TQCasw2u0lEadNxyR8dN/9oL8y5U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RtOLWdZXQUGWe+krsVk0X8D1SgJNC5BFZXZxiHSYLgrx7uPk7p0sjhvLpRT5jNIMfbvfGmgB98HTC3eHslExNEA2zb7lly3dwHwVl9q25nsvdz6F5ZseSQCJP1FAexLWBbwu7OKNo1Z7UJyelr3+cTUFlFxAPYki96xW2JDH02M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S2onME9g; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S2onME9g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790105826; x=1821641826;
  h=date:from:to:cc:subject:message-id;
  bh=4NJrQdK7tZD+5I3TQCasw2u0lEadNxyR8dN/9oL8y5U=;
  b=S2onME9gEW/ILu8BXsiO7QM4t1LvVR6DyPHMxlYflapr1LLHNSiXk2d+
   CtGqW4oeX19WygMvFuvzwZOR+LNTQaFJ24FzU9xk3KE1rcMEnq0SxI/tP
   WbS+E8AlloHL51MinhSQss1/gIqH30mWiQvVSsrH2EqCmFhdUOm6S/0t6
   RsJD2h/EkWBeM+dE4DEhjdM60CqlMuJTDNVsubYGcfYtOpuUx3bo5mdvS
   0X0qD6umw0FNglWuvw22eSqXq5Q5Z0TBbbLpsYWT3RhlWyY8dXvMALwAi
   Lv1l2FbQwtja0U327Ta7n+Eq6ecIPhX/O15QZmIx/ba9v4LdkwwVZSnDM
   g==;
X-CSE-ConnectionGUID: TFGmcC8cT7+RaMaNtBSX7w==
X-CSE-MsgGUID: WrfJRdHUR+WdYLxdTcJV+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="94572148"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="94572148"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 12:37:04 -0700
X-CSE-ConnectionGUID: RRbunVMnSsCmK6WnS2gyEw==
X-CSE-MsgGUID: zbavr8WzQmuZ/xnQHCUoSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="278032146"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Sep 2026 12:37:03 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x96IW-00000000Fzo-3JSw;
	Tue, 22 Sep 2026 19:37:00 +0000
Date: Wed, 23 Sep 2026 03:36:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse:
 sparse: an expression is expected before ')'
Message-ID: <202609230301.OKmfzyIt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: an expression is expected before ')'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe2ec83746e501645709761605c2464a44fd2929
commit: 4cffecaf127ae10ada4da0636f87e0170e347402 drm/xe/pf: Prepare for new threshold KLVs
date:   9 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-1301-20260922 (https://download.01.org/0day-ci/archive/20260923/202609230301.OKmfzyIt-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609230301.OKmfzyIt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4cffecaf127a ("drm/xe/pf: Prepare for new threshold KLVs")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609230301.OKmfzyIt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: an expression is expected before ')'
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: got ,
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: an expression is expected before ')'
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: got ,
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: an expression is expected before ')'
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: got ,
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: an expression is expected before ')'
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: got ,
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: an expression is expected before ')'
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: got ,
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: an expression is expected before ')'
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: undefined identifier '__VA_OPT__'
--
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: an expression is expected before ')'
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: Expected ) in expression
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: got }
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: an expression is expected before ')'
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: Expected ) in expression
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: got }
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: an expression is expected before ')'
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: Expected ) in expression
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: got }
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: an expression is expected before ')'
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: Expected ) in expression
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: got }
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: an expression is expected before ')'
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: Expected ) in expression
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: got }
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: an expression is expected before ')'
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: Expected ) in expression
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: undefined identifier '__VA_OPT__'

vim +310 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c

c4f5ded082bb943 Michal Wajdeczko 2024-05-14  287  
e42a51fb9c0f386 Michal Wajdeczko 2024-04-23  288  static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigned int vfid)
e42a51fb9c0f386 Michal Wajdeczko 2024-04-23  289  {
e42a51fb9c0f386 Michal Wajdeczko 2024-04-23  290  	xe_gt_assert(gt, gt == extract_gt(parent));
e42a51fb9c0f386 Michal Wajdeczko 2024-04-23  291  	xe_gt_assert(gt, vfid == extract_vfid(parent));
e42a51fb9c0f386 Michal Wajdeczko 2024-04-23  292  
e42a51fb9c0f386 Michal Wajdeczko 2024-04-23  293  	debugfs_create_file_unsafe(vfid ? "doorbells_quota" : "doorbells_spare",
e42a51fb9c0f386 Michal Wajdeczko 2024-04-23  294  				   0644, parent, parent, &dbs_fops);
e42a51fb9c0f386 Michal Wajdeczko 2024-04-23  295  	debugfs_create_file_unsafe(vfid ? "contexts_quota" : "contexts_spare",
e42a51fb9c0f386 Michal Wajdeczko 2024-04-23  296  				   0644, parent, parent, &ctxs_fops);
e42a51fb9c0f386 Michal Wajdeczko 2024-04-23  297  	debugfs_create_file_unsafe("exec_quantum_ms", 0644, parent, parent,
e42a51fb9c0f386 Michal Wajdeczko 2024-04-23  298  				   &exec_quantum_fops);
e42a51fb9c0f386 Michal Wajdeczko 2024-04-23  299  	debugfs_create_file_unsafe("preempt_timeout_us", 0644, parent, parent,
e42a51fb9c0f386 Michal Wajdeczko 2024-04-23  300  				   &preempt_timeout_fops);
9d6aabe126b4a27 Michal Wajdeczko 2024-11-06  301  	debugfs_create_file_unsafe("sched_priority", 0644, parent, parent,
9d6aabe126b4a27 Michal Wajdeczko 2024-11-06  302  				   &sched_priority_fops);
c4f5ded082bb943 Michal Wajdeczko 2024-05-14  303  
c4f5ded082bb943 Michal Wajdeczko 2024-05-14  304  	/* register all threshold attributes */
4cffecaf127ae10 Michal Wajdeczko 2025-12-16  305  #define register_threshold_attribute(TAG, NAME, VER...) ({				\
4cffecaf127ae10 Michal Wajdeczko 2025-12-16  306  	if (IF_ARGS(GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, VER), true, VER))		\
c4f5ded082bb943 Michal Wajdeczko 2024-05-14  307  		debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent,	\
4cffecaf127ae10 Michal Wajdeczko 2025-12-16  308  					   &NAME##_fops);				\
4cffecaf127ae10 Michal Wajdeczko 2025-12-16  309  });
c4f5ded082bb943 Michal Wajdeczko 2024-05-14 @310  	MAKE_XE_GUC_KLV_THRESHOLDS_SET(register_threshold_attribute)
c4f5ded082bb943 Michal Wajdeczko 2024-05-14  311  #undef register_threshold_attribute
e42a51fb9c0f386 Michal Wajdeczko 2024-04-23  312  }
e42a51fb9c0f386 Michal Wajdeczko 2024-04-23  313  

:::::: The code at line 310 was first introduced by commit
:::::: c4f5ded082bb9433b180dbfbb8352f92e319149b drm/xe/pf: Allow configuration of VF thresholds over debugfs

:::::: TO: Michal Wajdeczko <michal.wajdeczko@intel.com>
:::::: CC: Michal Wajdeczko <michal.wajdeczko@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
