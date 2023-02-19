Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409327FA
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Feb 2023 05:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676785709; x=1708321709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tm4AF5kJev8cSlg2M+8JDOEWuXFFMTwD25eoK6+wLfw=;
  b=iTlTwy6j8lxUxZLnAqvtgELaAzEEd+J3AKT1vqHQS1B8zVTOW5Jzg4Wf
   8/5MazixcnxjBzdZ6ijZAUL00S9+ii7D7k2s6Yj0zz3flyx+qIADmjnTG
   lkkeULkB05g8T0m/A5LImNXjDe08JQiERGz5VREHbBNEMAhzjY1HUiGn0
   nXzJHPaYJvmgUi/Ceyk6lvPq2ynh539WqAkyr4Q+tS/lUC8AwP41uqfBg
   S/0C/S81n27KYgqHha6KjL0KalF+heLVd0pCLwAEFo55g/jMno//qBPr8
   6hoDtxWESux4YQTrfmNBDKKsjtxQWhltE3ehcqlSdYjYJG0+H3GX8Ai2f
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="333586894"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="333586894"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 21:48:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="620813989"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="620813989"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Feb 2023 21:48:27 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTcYk-000D4j-2C;
	Sun, 19 Feb 2023 05:48:26 +0000
Date: Sun, 19 Feb 2023 13:47:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/i915/i915_hwmon.c:148 hwm_energy() error:
 uninitialized symbol 'reg_val'.
Message-ID: <202302191320.2yQgBLSj-lkp@intel.com>
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
TO: Dale B Stimson <dale.b.stimson@intel.com>
CC: Anshuman Gupta <anshuman.gupta@intel.com>
CC: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>
CC: Badal Nilawar <badal.nilawar@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   925cf0457d7e62ce08878ffb789189ac08ca8677
commit: c41b8bdcc2973ca10c6f5c5c60d007a41f080a89 drm/i915/hwmon: Show device level energy usage
date:   4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230219/202302191320.2yQgBLSj-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302191320.2yQgBLSj-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/i915_hwmon.c:148 hwm_energy() error: uninitialized symbol 'reg_val'.

Old smatch warnings:
drivers/gpu/drm/i915/i915_hwmon.c:87 hwm_field_read_and_scale() error: uninitialized symbol 'reg_value'.
drivers/gpu/drm/i915/i915_hwmon.c:191 hwm_in_read() error: uninitialized symbol 'reg_value'.

vim +/reg_val +148 drivers/gpu/drm/i915/i915_hwmon.c

99f55efb79114f Dale B Stimson 2022-10-13  110  
c41b8bdcc2973c Dale B Stimson 2022-10-13  111  /*
c41b8bdcc2973c Dale B Stimson 2022-10-13  112   * hwm_energy - Obtain energy value
c41b8bdcc2973c Dale B Stimson 2022-10-13  113   *
c41b8bdcc2973c Dale B Stimson 2022-10-13  114   * The underlying energy hardware register is 32-bits and is subject to
c41b8bdcc2973c Dale B Stimson 2022-10-13  115   * overflow. How long before overflow? For example, with an example
c41b8bdcc2973c Dale B Stimson 2022-10-13  116   * scaling bit shift of 14 bits (see register *PACKAGE_POWER_SKU_UNIT) and
c41b8bdcc2973c Dale B Stimson 2022-10-13  117   * a power draw of 1000 watts, the 32-bit counter will overflow in
c41b8bdcc2973c Dale B Stimson 2022-10-13  118   * approximately 4.36 minutes.
c41b8bdcc2973c Dale B Stimson 2022-10-13  119   *
c41b8bdcc2973c Dale B Stimson 2022-10-13  120   * Examples:
c41b8bdcc2973c Dale B Stimson 2022-10-13  121   *    1 watt:  (2^32 >> 14) /    1 W / (60 * 60 * 24) secs/day -> 3 days
c41b8bdcc2973c Dale B Stimson 2022-10-13  122   * 1000 watts: (2^32 >> 14) / 1000 W / 60             secs/min -> 4.36 minutes
c41b8bdcc2973c Dale B Stimson 2022-10-13  123   *
c41b8bdcc2973c Dale B Stimson 2022-10-13  124   * The function significantly increases overflow duration (from 4.36
c41b8bdcc2973c Dale B Stimson 2022-10-13  125   * minutes) by accumulating the energy register into a 'long' as allowed by
c41b8bdcc2973c Dale B Stimson 2022-10-13  126   * the hwmon API. Using x86_64 128 bit arithmetic (see mul_u64_u32_shr()),
c41b8bdcc2973c Dale B Stimson 2022-10-13  127   * a 'long' of 63 bits, SF_ENERGY of 1e6 (~20 bits) and
c41b8bdcc2973c Dale B Stimson 2022-10-13  128   * hwmon->scl_shift_energy of 14 bits we have 57 (63 - 20 + 14) bits before
c41b8bdcc2973c Dale B Stimson 2022-10-13  129   * energy1_input overflows. This at 1000 W is an overflow duration of 278 years.
c41b8bdcc2973c Dale B Stimson 2022-10-13  130   */
c41b8bdcc2973c Dale B Stimson 2022-10-13  131  static void
c41b8bdcc2973c Dale B Stimson 2022-10-13  132  hwm_energy(struct hwm_drvdata *ddat, long *energy)
c41b8bdcc2973c Dale B Stimson 2022-10-13  133  {
c41b8bdcc2973c Dale B Stimson 2022-10-13  134  	struct intel_uncore *uncore = ddat->uncore;
c41b8bdcc2973c Dale B Stimson 2022-10-13  135  	struct i915_hwmon *hwmon = ddat->hwmon;
c41b8bdcc2973c Dale B Stimson 2022-10-13  136  	struct hwm_energy_info *ei = &ddat->ei;
c41b8bdcc2973c Dale B Stimson 2022-10-13  137  	intel_wakeref_t wakeref;
c41b8bdcc2973c Dale B Stimson 2022-10-13  138  	i915_reg_t rgaddr;
c41b8bdcc2973c Dale B Stimson 2022-10-13  139  	u32 reg_val;
c41b8bdcc2973c Dale B Stimson 2022-10-13  140  
c41b8bdcc2973c Dale B Stimson 2022-10-13  141  	rgaddr = hwmon->rg.energy_status_all;
c41b8bdcc2973c Dale B Stimson 2022-10-13  142  
c41b8bdcc2973c Dale B Stimson 2022-10-13  143  	mutex_lock(&hwmon->hwmon_lock);
c41b8bdcc2973c Dale B Stimson 2022-10-13  144  
c41b8bdcc2973c Dale B Stimson 2022-10-13  145  	with_intel_runtime_pm(uncore->rpm, wakeref)
c41b8bdcc2973c Dale B Stimson 2022-10-13  146  		reg_val = intel_uncore_read(uncore, rgaddr);
c41b8bdcc2973c Dale B Stimson 2022-10-13  147  
c41b8bdcc2973c Dale B Stimson 2022-10-13 @148  	if (reg_val >= ei->reg_val_prev)
c41b8bdcc2973c Dale B Stimson 2022-10-13  149  		ei->accum_energy += reg_val - ei->reg_val_prev;
c41b8bdcc2973c Dale B Stimson 2022-10-13  150  	else
c41b8bdcc2973c Dale B Stimson 2022-10-13  151  		ei->accum_energy += UINT_MAX - ei->reg_val_prev + reg_val;
c41b8bdcc2973c Dale B Stimson 2022-10-13  152  	ei->reg_val_prev = reg_val;
c41b8bdcc2973c Dale B Stimson 2022-10-13  153  
c41b8bdcc2973c Dale B Stimson 2022-10-13  154  	*energy = mul_u64_u32_shr(ei->accum_energy, SF_ENERGY,
c41b8bdcc2973c Dale B Stimson 2022-10-13  155  				  hwmon->scl_shift_energy);
c41b8bdcc2973c Dale B Stimson 2022-10-13  156  	mutex_unlock(&hwmon->hwmon_lock);
c41b8bdcc2973c Dale B Stimson 2022-10-13  157  }
c41b8bdcc2973c Dale B Stimson 2022-10-13  158  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
