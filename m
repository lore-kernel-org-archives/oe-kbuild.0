Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E30EC2
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Jul 2023 11:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690199630; x=1721735630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gBPSUY5AkwWmL81mixox4ji76iBQQ9dbui9C3+DlSoY=;
  b=KqSHvninWbgHZnP6zRTQ4W2L0VHIikNUFNSEblPliBhyJZNiKZ+5gbB9
   nBKNDumGgjE9oNuDj74J004nyHY34hfbPf5k3CojTLhIup8NvWoyBAUIy
   jk+eBAHH+1J8Mwb7NWSYGffHdSi4e6ge5K+uM6dlrF+m1TbWXUPoEeqMe
   Cp9b5DsbkCxRaGmGdmWapqwprHG8hnXmoFRtyyIL/ay2dggZygg6EoD3g
   ic2jfh5g+5+o9mG85ZkWrJoxxeoug/lpT9PPW0R/zeUa5+IYs8q95JhLr
   zrWBQfbhKy4QT62TvMjtgUnnDJLscCE1g4Xdfig0JwOzmlQcIvgw9PzY3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="398323747"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="398323747"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 04:53:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="849606458"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="849606458"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 24 Jul 2023 04:53:47 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNu88-0009i4-20;
	Mon, 24 Jul 2023 11:53:39 +0000
Date: Mon, 24 Jul 2023 19:52:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [Intel-gfx] [PATCH v3 1/4] drm/i915/tc: rename
 mtl_tc_port_get_pin_assignment_mask()
Message-ID: <202307241905.LxO34zfF-lkp@intel.com>
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
In-Reply-To: <20230721111121.369227-2-luciano.coelho@intel.com>
References: <20230721111121.369227-2-luciano.coelho@intel.com>
TO: Luca Coelho <luciano.coelho@intel.com>
TO: intel-gfx@lists.freedesktop.org

Hi Luca,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Luca-Coelho/drm-i915-tc-rename-mtl_tc_port_get_pin_assignment_mask/20230721-191250
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230721111121.369227-2-luciano.coelho%40intel.com
patch subject: [Intel-gfx] [PATCH v3 1/4] drm/i915/tc: rename mtl_tc_port_get_pin_assignment_mask()
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-m001-20230723 (https://download.01.org/0day-ci/archive/20230724/202307241905.LxO34zfF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307241905.LxO34zfF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307241905.LxO34zfF-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/display/intel_tc.c:302 mtl_tc_port_get_max_lane_count() error: uninitialized symbol 'pin_mask'.

Old smatch warnings:
drivers/gpu/drm/i915/display/intel_tc.c:466 icl_tc_phy_hpd_live_status() error: uninitialized symbol 'fia_isr'.
drivers/gpu/drm/i915/display/intel_tc.c:478 icl_tc_phy_hpd_live_status() error: uninitialized symbol 'pch_isr'.
drivers/gpu/drm/i915/display/intel_tc.c:702 tgl_tc_phy_init() error: uninitialized symbol 'val'.
drivers/gpu/drm/i915/display/intel_tc.c:751 adlp_tc_phy_hpd_live_status() error: uninitialized symbol 'cpu_isr'.
drivers/gpu/drm/i915/display/intel_tc.c:756 adlp_tc_phy_hpd_live_status() error: uninitialized symbol 'pch_isr'.
drivers/gpu/drm/i915/display/intel_tc.c:939 xelpdp_tc_phy_hpd_live_status() error: uninitialized symbol 'pica_isr'.
drivers/gpu/drm/i915/display/intel_tc.c:944 xelpdp_tc_phy_hpd_live_status() error: uninitialized symbol 'pch_isr'.

vim +/pin_mask +302 drivers/gpu/drm/i915/display/intel_tc.c

3b51be4e4061bd Clinton A Taylor 2019-09-26  292  
665f47ea29e686 Luca Coelho      2023-07-21  293  static int mtl_tc_port_get_max_lane_count(struct intel_digital_port *dig_port)
dac6ce66db3e3b Anusha Srivatsa  2023-04-28  294  {
dac6ce66db3e3b Anusha Srivatsa  2023-04-28  295  	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
dac6ce66db3e3b Anusha Srivatsa  2023-04-28  296  	intel_wakeref_t wakeref;
dac6ce66db3e3b Anusha Srivatsa  2023-04-28  297  	u32 pin_mask;
dac6ce66db3e3b Anusha Srivatsa  2023-04-28  298  
dac6ce66db3e3b Anusha Srivatsa  2023-04-28  299  	with_intel_display_power(i915, POWER_DOMAIN_DISPLAY_CORE, wakeref)
dac6ce66db3e3b Anusha Srivatsa  2023-04-28  300  		pin_mask = intel_tc_port_get_pin_assignment_mask(dig_port);
dac6ce66db3e3b Anusha Srivatsa  2023-04-28  301  
dac6ce66db3e3b Anusha Srivatsa  2023-04-28 @302  	switch (pin_mask) {
dac6ce66db3e3b Anusha Srivatsa  2023-04-28  303  	default:
dac6ce66db3e3b Anusha Srivatsa  2023-04-28  304  		MISSING_CASE(pin_mask);
dac6ce66db3e3b Anusha Srivatsa  2023-04-28  305  		fallthrough;
dac6ce66db3e3b Anusha Srivatsa  2023-04-28  306  	case DP_PIN_ASSIGNMENT_D:
dac6ce66db3e3b Anusha Srivatsa  2023-04-28  307  		return 2;
dac6ce66db3e3b Anusha Srivatsa  2023-04-28  308  	case DP_PIN_ASSIGNMENT_C:
dac6ce66db3e3b Anusha Srivatsa  2023-04-28  309  	case DP_PIN_ASSIGNMENT_E:
dac6ce66db3e3b Anusha Srivatsa  2023-04-28  310  		return 4;
dac6ce66db3e3b Anusha Srivatsa  2023-04-28  311  	}
dac6ce66db3e3b Anusha Srivatsa  2023-04-28  312  }
dac6ce66db3e3b Anusha Srivatsa  2023-04-28  313  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
