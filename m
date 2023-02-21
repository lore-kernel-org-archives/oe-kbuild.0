Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7332E3FE1
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Feb 2023 13:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676986454; x=1708522454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0IYtxIvl54zosAFqi2fwKFE1bIlQllQF9JVThSOggaE=;
  b=jm7P70K+ZXDXXa/nkXC69f5Vkym8IezUCtoonwULnH3//UC0zS9Uc+u5
   iY7rJ1sGFhMMPdXHvWd7aBhav8cbt8fIhEjhQWAxb2eUrFg7j8n30qe8t
   2+zi32k5R3kxyuOYXgg8tKz58g7GIVDgkQEtmIkdXqmQvhqmubV/hs3zS
   J6araWShONYbEyjnut6jEPUGHNkKPb9JwEZHN8zDAh1eqslM8B7DlSiiS
   q/PvoS0rfkgg/ab05lh5tzEHVV69tK4ZrRaJKOWag8xQ3hQmDKOmlA6vr
   OP4Z1eTfbn2XByqB05tA3xSnKcgA2Yor/rImxTW7zSsMi18cZHaP/Bn4z
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="333991214"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="333991214"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 05:34:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="649178992"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="649178992"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 21 Feb 2023 05:34:12 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUSmZ-000Eo9-0M;
	Tue, 21 Feb 2023 13:34:11 +0000
Date: Tue, 21 Feb 2023 21:34:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1866/13664] drivers/gpu/drm/i915/i915_hwmon.c:383
 hwm_power_max_read() error: uninitialized symbol 'r'.
Message-ID: <202302212146.aYzIN9SV-lkp@intel.com>
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
TO: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: Anshuman Gupta <anshuman.gupta@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   465461cf48465b8a0a54025db5ae2b3df7a04577
commit: d2c3c8c3d3833c45c09be671da48f9d46b79e347 [1866/13664] drm/i915/hwmon: Display clamped PL1 limit
:::::: branch date: 7 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230221/202302212146.aYzIN9SV-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302212146.aYzIN9SV-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/i915_hwmon.c:383 hwm_power_max_read() error: uninitialized symbol 'r'.

Old smatch warnings:
drivers/gpu/drm/i915/i915_hwmon.c:97 hwm_field_read_and_scale() error: uninitialized symbol 'reg_value'.
drivers/gpu/drm/i915/i915_hwmon.c:156 hwm_energy() error: uninitialized symbol 'reg_val'.
drivers/gpu/drm/i915/i915_hwmon.c:180 hwm_power1_max_interval_show() error: uninitialized symbol 'r'.
drivers/gpu/drm/i915/i915_hwmon.c:335 hwm_in_read() error: uninitialized symbol 'reg_value'.

vim +/r +383 drivers/gpu/drm/i915/i915_hwmon.c

99f55efb79114f Dale B Stimson 2022-10-13  361  
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  362  /*
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  363   * HW allows arbitrary PL1 limits to be set but silently clamps these values to
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  364   * "typical but not guaranteed" min/max values in rg.pkg_power_sku. Follow the
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  365   * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  366   * clamped values when read. Write/read I1 also follows the same pattern.
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  367   */
99f55efb79114f Dale B Stimson 2022-10-13  368  static int
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  369  hwm_power_max_read(struct hwm_drvdata *ddat, long *val)
99f55efb79114f Dale B Stimson 2022-10-13  370  {
99f55efb79114f Dale B Stimson 2022-10-13  371  	struct i915_hwmon *hwmon = ddat->hwmon;
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  372  	intel_wakeref_t wakeref;
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  373  	u64 r, min, max;
99f55efb79114f Dale B Stimson 2022-10-13  374  
99f55efb79114f Dale B Stimson 2022-10-13  375  	*val = hwm_field_read_and_scale(ddat,
99f55efb79114f Dale B Stimson 2022-10-13  376  					hwmon->rg.pkg_rapl_limit,
99f55efb79114f Dale B Stimson 2022-10-13  377  					PKG_PWR_LIM_1,
99f55efb79114f Dale B Stimson 2022-10-13  378  					hwmon->scl_shift_power,
99f55efb79114f Dale B Stimson 2022-10-13  379  					SF_POWER);
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  380  
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  381  	with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  382  		r = intel_uncore_read64(ddat->uncore, hwmon->rg.pkg_power_sku);
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15 @383  	min = REG_FIELD_GET(PKG_MIN_PWR, r);
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  384  	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  385  	max = REG_FIELD_GET(PKG_MAX_PWR, r);
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  386  	max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  387  
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  388  	if (min && max)
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  389  		*val = clamp_t(u64, *val, min, max);
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  390  
99f55efb79114f Dale B Stimson 2022-10-13  391  	return 0;
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  392  }
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  393  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
