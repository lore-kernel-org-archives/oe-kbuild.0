Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA417B
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Apr 2023 00:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680826893; x=1712362893;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oKcMql25QV+hRVRWsbClRinC6Tg0CGc/8OZerGtjC7I=;
  b=ll7CdXItTpXdNYoKXdwuvNrLOx13k6mqIWDCBKjYzSU8LJrBRH7YDCiu
   Oi2Stoy6EAfTDTBqB+xGgD1BLsnCQMWlfidnjrPlalCu+zcJppYWi1Pjd
   vA+1btPg7feKtcnUFmKt4yjs2K9IsWkss0jO3yR8sdxwgLUkajKovhYtE
   qbn3qOwsXMKmkBcz86ry5MRIUXAdEDThjgLLOLwCQy7QvA3Cf0q8TrjP5
   CHIzi/5K+y1DMvN9I64p9dZzD6sCgL2S5cvhgH0Ibbzn1biQF0vBffHMV
   Qwmz/00cNiRjCPeB6PlPo0nEJQ6iyb8T7fHjF0TlCYVpoa3fcIIwuAP8a
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="340367832"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="340367832"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 17:21:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="680852073"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="680852073"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 06 Apr 2023 17:21:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkZqw-000RvW-0f;
	Fri, 07 Apr 2023 00:21:18 +0000
Date: Fri, 7 Apr 2023 08:21:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8323/9787] drivers/gpu/drm/i915/i915_hwmon.c:411
 hwm_power_max_write() error: uninitialized symbol 'nval'.
Message-ID: <202304070849.iw9UGiVy-lkp@intel.com>
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
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e134c93f788fb93fd6a3ec3af9af850a2048c7e6
commit: 4ed22f1e52426635873416007d2c12e09615165f [8323/9787] drm/i915/hwmon: Use 0 to designate disabled PL1 power limit
:::::: branch date: 19 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-m031-20230403 (https://download.01.org/0day-ci/archive/20230407/202304070849.iw9UGiVy-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304070849.iw9UGiVy-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/i915_hwmon.c:411 hwm_power_max_write() error: uninitialized symbol 'nval'.

Old smatch warnings:
drivers/gpu/drm/i915/i915_hwmon.c:97 hwm_field_read_and_scale() error: uninitialized symbol 'reg_value'.
drivers/gpu/drm/i915/i915_hwmon.c:142 hwm_energy() error: uninitialized symbol 'reg_val'.
drivers/gpu/drm/i915/i915_hwmon.c:166 hwm_power1_max_interval_show() error: uninitialized symbol 'r'.
drivers/gpu/drm/i915/i915_hwmon.c:325 hwm_in_read() error: uninitialized symbol 'reg_value'.
drivers/gpu/drm/i915/i915_hwmon.c:370 hwm_power_max_read() error: uninitialized symbol 'r'.

vim +/nval +411 drivers/gpu/drm/i915/i915_hwmon.c

d2c3c8c3d3833c4 Ashutosh Dixit 2022-12-15  393  
f99926383bd62d2 Ashutosh Dixit 2023-02-16  394  static int
f99926383bd62d2 Ashutosh Dixit 2023-02-16  395  hwm_power_max_write(struct hwm_drvdata *ddat, long val)
f99926383bd62d2 Ashutosh Dixit 2023-02-16  396  {
f99926383bd62d2 Ashutosh Dixit 2023-02-16  397  	struct i915_hwmon *hwmon = ddat->hwmon;
4ed22f1e5242663 Ashutosh Dixit 2023-03-31  398  	intel_wakeref_t wakeref;
f99926383bd62d2 Ashutosh Dixit 2023-02-16  399  	u32 nval;
f99926383bd62d2 Ashutosh Dixit 2023-02-16  400  
4ed22f1e5242663 Ashutosh Dixit 2023-03-31  401  	/* Disable PL1 limit and verify, because the limit cannot be disabled on all platforms */
4ed22f1e5242663 Ashutosh Dixit 2023-03-31  402  	if (val == PL1_DISABLE) {
4ed22f1e5242663 Ashutosh Dixit 2023-03-31  403  		mutex_lock(&hwmon->hwmon_lock);
4ed22f1e5242663 Ashutosh Dixit 2023-03-31  404  		with_intel_runtime_pm(ddat->uncore->rpm, wakeref) {
4ed22f1e5242663 Ashutosh Dixit 2023-03-31  405  			intel_uncore_rmw(ddat->uncore, hwmon->rg.pkg_rapl_limit,
4ed22f1e5242663 Ashutosh Dixit 2023-03-31  406  					 PKG_PWR_LIM_1_EN, 0);
4ed22f1e5242663 Ashutosh Dixit 2023-03-31  407  			nval = intel_uncore_read(ddat->uncore, hwmon->rg.pkg_rapl_limit);
4ed22f1e5242663 Ashutosh Dixit 2023-03-31  408  		}
4ed22f1e5242663 Ashutosh Dixit 2023-03-31  409  		mutex_unlock(&hwmon->hwmon_lock);
4ed22f1e5242663 Ashutosh Dixit 2023-03-31  410  
4ed22f1e5242663 Ashutosh Dixit 2023-03-31 @411  		if (nval & PKG_PWR_LIM_1_EN)
4ed22f1e5242663 Ashutosh Dixit 2023-03-31  412  			return -ENODEV;
4ed22f1e5242663 Ashutosh Dixit 2023-03-31  413  		return 0;
4ed22f1e5242663 Ashutosh Dixit 2023-03-31  414  	}
4ed22f1e5242663 Ashutosh Dixit 2023-03-31  415  
f99926383bd62d2 Ashutosh Dixit 2023-02-16  416  	/* Computation in 64-bits to avoid overflow. Round to nearest. */
f99926383bd62d2 Ashutosh Dixit 2023-02-16  417  	nval = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_power, SF_POWER);
6fd3d8bf89fc652 Ashutosh Dixit 2023-02-16  418  	nval = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, nval);
f99926383bd62d2 Ashutosh Dixit 2023-02-16  419  
f99926383bd62d2 Ashutosh Dixit 2023-02-16  420  	hwm_locked_with_pm_intel_uncore_rmw(ddat, hwmon->rg.pkg_rapl_limit,
6fd3d8bf89fc652 Ashutosh Dixit 2023-02-16  421  					    PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1,
6fd3d8bf89fc652 Ashutosh Dixit 2023-02-16  422  					    nval);
f99926383bd62d2 Ashutosh Dixit 2023-02-16  423  	return 0;
f99926383bd62d2 Ashutosh Dixit 2023-02-16  424  }
f99926383bd62d2 Ashutosh Dixit 2023-02-16  425  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
