Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC0323A1
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Feb 2023 16:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676823222; x=1708359222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NcmdSxAwgcXFAiFHPtrQunkAX+XZ0zFjpiaQS4MuHaA=;
  b=IafsGYCvo1YP5mqLrvaqouDq1Ip2MAmeUT89mif1/mESCqMCtGpm515l
   E+dFCZH+4WoGDWxU6fMsubvd24Ej7tyInScD8xb6jlXs3OxRWMpdpV2Aa
   mrw6EoSk/r4vQTx3LUoOc/ByxDFSIeFBGLe7BYUeU+2lcZ4CHIYTt3bD2
   hMxve+CGcXg5RX8aZE0mD2alsfI2O4egbdb8E3PcimB+IyX/0CWDp+ku2
   Z+FXvKWnChyzHa3YEtouFnaoUMcyUjAZxkParfvCJvvyvtYn8ybn96bXl
   i++TMDoNXXu1O/H8VYo1Yg8yJRf6tFU6Yji8EnfhYBT4WuFcm+/IzbFIi
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="320377641"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="320377641"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 08:13:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="701443353"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="701443353"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Feb 2023 08:13:39 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTmJm-000DMH-2j;
	Sun, 19 Feb 2023 16:13:38 +0000
Date: Mon, 20 Feb 2023 00:13:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/i915/i915_perf.c:3127
 i915_perf_oa_timestamp_frequency() error: uninitialized symbol 'reg'.
Message-ID: <202302200054.2DiygIhV-lkp@intel.com>
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
TO: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: John Harrison <John.C.Harrison@Intel.com>
CC: Ashutosh Dixit <ashutosh.dixit@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   925cf0457d7e62ce08878ffb789189ac08ca8677
commit: bc7ed4d30815bc434c1e49dc6784164b352d167c drm/i915/perf: Apply Wa_18013179988
date:   4 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230220/202302200054.2DiygIhV-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302200054.2DiygIhV-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/i915_perf.c:3127 i915_perf_oa_timestamp_frequency() error: uninitialized symbol 'reg'.

Old smatch warnings:
drivers/gpu/drm/i915/gem/i915_gem_object.h:194 __i915_gem_object_lock() error: we previously assumed 'ww' could be null (see line 183)

vim +/reg +3127 drivers/gpu/drm/i915/i915_perf.c

4b4e973d5eb892 Chris Wilson          2020-03-02  3111  
bc7ed4d30815bc Umesh Nerlige Ramappa 2022-10-26  3112  /*
bc7ed4d30815bc Umesh Nerlige Ramappa 2022-10-26  3113   * OA timestamp frequency = CS timestamp frequency in most platforms. On some
bc7ed4d30815bc Umesh Nerlige Ramappa 2022-10-26  3114   * platforms OA unit ignores the CTC_SHIFT and the 2 timestamps differ. In such
bc7ed4d30815bc Umesh Nerlige Ramappa 2022-10-26  3115   * cases, return the adjusted CS timestamp frequency to the user.
bc7ed4d30815bc Umesh Nerlige Ramappa 2022-10-26  3116   */
bc7ed4d30815bc Umesh Nerlige Ramappa 2022-10-26  3117  u32 i915_perf_oa_timestamp_frequency(struct drm_i915_private *i915)
bc7ed4d30815bc Umesh Nerlige Ramappa 2022-10-26  3118  {
bc7ed4d30815bc Umesh Nerlige Ramappa 2022-10-26  3119  	/* Wa_18013179988:dg2 */
bc7ed4d30815bc Umesh Nerlige Ramappa 2022-10-26  3120  	if (IS_DG2(i915)) {
bc7ed4d30815bc Umesh Nerlige Ramappa 2022-10-26  3121  		intel_wakeref_t wakeref;
bc7ed4d30815bc Umesh Nerlige Ramappa 2022-10-26  3122  		u32 reg, shift;
bc7ed4d30815bc Umesh Nerlige Ramappa 2022-10-26  3123  
bc7ed4d30815bc Umesh Nerlige Ramappa 2022-10-26  3124  		with_intel_runtime_pm(to_gt(i915)->uncore->rpm, wakeref)
bc7ed4d30815bc Umesh Nerlige Ramappa 2022-10-26  3125  			reg = intel_uncore_read(to_gt(i915)->uncore, RPM_CONFIG0);
bc7ed4d30815bc Umesh Nerlige Ramappa 2022-10-26  3126  
bc7ed4d30815bc Umesh Nerlige Ramappa 2022-10-26 @3127  		shift = REG_FIELD_GET(GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK,
bc7ed4d30815bc Umesh Nerlige Ramappa 2022-10-26  3128  				      reg);
bc7ed4d30815bc Umesh Nerlige Ramappa 2022-10-26  3129  
bc7ed4d30815bc Umesh Nerlige Ramappa 2022-10-26  3130  		return to_gt(i915)->clock_frequency << (3 - shift);
bc7ed4d30815bc Umesh Nerlige Ramappa 2022-10-26  3131  	}
bc7ed4d30815bc Umesh Nerlige Ramappa 2022-10-26  3132  
bc7ed4d30815bc Umesh Nerlige Ramappa 2022-10-26  3133  	return to_gt(i915)->clock_frequency;
bc7ed4d30815bc Umesh Nerlige Ramappa 2022-10-26  3134  }
bc7ed4d30815bc Umesh Nerlige Ramappa 2022-10-26  3135  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
