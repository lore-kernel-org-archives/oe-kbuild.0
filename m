Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E04D384
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Sep 2023 01:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694568872; x=1726104872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u5wFWimqNup/GIOPEfnx+7OJorhLVC5bBWdFusRlIpY=;
  b=hiKXRVb7VZnVsB/CcQkc8zAfO3dwCsdlUL5JFSGkfMdaQZFnkGrUFvzD
   GbOdNetdZxBGcqMez94GHuEez1ohYiM8buFLIE+LfXhwP6xyol8kqefq5
   Z4mKh3/UNyaTQ8pbKN9WbDmEWLmBayojE3jUXOXmmw/fR3RjcPFDZMzpP
   BrztEmN6OuZcvFuohYQjGUBlI8zPjSVOpRfwci1pMas9+5ZDH8TxT7xZn
   leWmm5etua7ZCvg4EBjFAh1jDH9/zDL+vrOqfOETIyq+HPAr+KQzcuT6x
   EgGpBWCuAPo+ZhnePr47KVng+cvBfB9+JVXSa0+08baQM2/nZx6bLnaO4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="368806414"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="368806414"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 18:34:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="990715361"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="990715361"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 12 Sep 2023 18:34:29 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgElv-0000ZZ-2B;
	Wed, 13 Sep 2023 01:34:27 +0000
Date: Wed, 13 Sep 2023 09:34:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [Intel-gfx] [PATCH v3 19/29] drm/i915/xe2lpd: Read pin
 assignment from IOM
Message-ID: <202309130932.j4thdtBS-lkp@intel.com>
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
In-Reply-To: <20230912044837.1672060-20-lucas.demarchi@intel.com>
References: <20230912044837.1672060-20-lucas.demarchi@intel.com>
TO: Lucas De Marchi <lucas.demarchi@intel.com>
TO: intel-xe@lists.freedesktop.org
TO: intel-gfx@lists.freedesktop.org
CC: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>
CC: Luca Coelho <luciano.coelho@intel.com>

Hi Lucas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-De-Marchi/drm-i915-xelpdp-Add-XE_LPDP_FEATURES/20230912-125100
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230912044837.1672060-20-lucas.demarchi%40intel.com
patch subject: [Intel-gfx] [PATCH v3 19/29] drm/i915/xe2lpd: Read pin assignment from IOM
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: x86_64-randconfig-161-20230912 (https://download.01.org/0day-ci/archive/20230913/202309130932.j4thdtBS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230913/202309130932.j4thdtBS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309130932.j4thdtBS-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/display/intel_tc.c:304 lnl_tc_port_get_max_lane_count() error: uninitialized symbol 'val'.

Old smatch warnings:
drivers/gpu/drm/i915/display/intel_tc.c:327 mtl_tc_port_get_max_lane_count() error: uninitialized symbol 'pin_mask'.
drivers/gpu/drm/i915/display/intel_tc.c:500 icl_tc_phy_hpd_live_status() error: uninitialized symbol 'fia_isr'.
drivers/gpu/drm/i915/display/intel_tc.c:512 icl_tc_phy_hpd_live_status() error: uninitialized symbol 'pch_isr'.
drivers/gpu/drm/i915/display/intel_tc.c:736 tgl_tc_phy_init() error: uninitialized symbol 'val'.
drivers/gpu/drm/i915/display/intel_tc.c:785 adlp_tc_phy_hpd_live_status() error: uninitialized symbol 'cpu_isr'.
drivers/gpu/drm/i915/display/intel_tc.c:790 adlp_tc_phy_hpd_live_status() error: uninitialized symbol 'pch_isr'.
drivers/gpu/drm/i915/display/intel_tc.c:973 xelpdp_tc_phy_hpd_live_status() error: uninitialized symbol 'pica_isr'.
drivers/gpu/drm/i915/display/intel_tc.c:978 xelpdp_tc_phy_hpd_live_status() error: uninitialized symbol 'pch_isr'.

vim +/val +304 drivers/gpu/drm/i915/display/intel_tc.c

3b51be4e4061bd Clinton A Taylor 2019-09-26  292  
636a73ea93158b Luca Coelho      2023-09-11  293  static int lnl_tc_port_get_max_lane_count(struct intel_digital_port *dig_port)
636a73ea93158b Luca Coelho      2023-09-11  294  {
636a73ea93158b Luca Coelho      2023-09-11  295  	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
636a73ea93158b Luca Coelho      2023-09-11  296  	enum tc_port tc_port = intel_port_to_tc(i915, dig_port->base.port);
636a73ea93158b Luca Coelho      2023-09-11  297  	intel_wakeref_t wakeref;
636a73ea93158b Luca Coelho      2023-09-11  298  	u32 val, pin_assignment;
636a73ea93158b Luca Coelho      2023-09-11  299  
636a73ea93158b Luca Coelho      2023-09-11  300  	with_intel_display_power(i915, POWER_DOMAIN_DISPLAY_CORE, wakeref)
636a73ea93158b Luca Coelho      2023-09-11  301  		val = intel_de_read(i915, TCSS_DDI_STATUS(tc_port));
636a73ea93158b Luca Coelho      2023-09-11  302  
636a73ea93158b Luca Coelho      2023-09-11  303  	pin_assignment =
636a73ea93158b Luca Coelho      2023-09-11 @304  		REG_FIELD_GET(TCSS_DDI_STATUS_PIN_ASSIGNMENT_MASK, val);
636a73ea93158b Luca Coelho      2023-09-11  305  
636a73ea93158b Luca Coelho      2023-09-11  306  	switch (pin_assignment) {
636a73ea93158b Luca Coelho      2023-09-11  307  	default:
636a73ea93158b Luca Coelho      2023-09-11  308  		MISSING_CASE(pin_assignment);
636a73ea93158b Luca Coelho      2023-09-11  309  		fallthrough;
636a73ea93158b Luca Coelho      2023-09-11  310  	case DP_PIN_ASSIGNMENT_D:
636a73ea93158b Luca Coelho      2023-09-11  311  		return 2;
636a73ea93158b Luca Coelho      2023-09-11  312  	case DP_PIN_ASSIGNMENT_C:
636a73ea93158b Luca Coelho      2023-09-11  313  	case DP_PIN_ASSIGNMENT_E:
636a73ea93158b Luca Coelho      2023-09-11  314  		return 4;
636a73ea93158b Luca Coelho      2023-09-11  315  	}
636a73ea93158b Luca Coelho      2023-09-11  316  }
636a73ea93158b Luca Coelho      2023-09-11  317  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
