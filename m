Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3847E
	for <oe-kbuild@lists.linux.dev>; Sat, 27 May 2023 08:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685174938; x=1716710938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D12+/hvL/6ULRSd5atH1Bpo2B45MfhpaAsh7i1+9wIw=;
  b=EXBfq3h6sNVoc6wx/IrgEOnbqzqt0NITbx5YjieDQYQ1LBOssqAGod+Q
   Wn4+X5X7UJWzar2m9TW7uSM8EQBeZdwr6a2WUas6YPy5v9s9GKf4hYQiZ
   raSgkKqQY8mkpsBWaady153zs1CbR2VEGrb64NVAVjY/I44zGlveqn8Uj
   IzkrCbVZzDVggimLpsswwhR7hVS0aD95o3iVAsntyy6435rMi4eTSpexi
   6NZEkqaTGY2NnHNWBSN4le/mlVKL6rczHy2SNikK5cNBmDE1urki+hU1w
   64JzF/UHtfd7G85LqhiJzDX2sRm9Fm9jXM9WSojCNhHyhPaEmfDn2XlGv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="343874870"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="343874870"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 01:08:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="736258247"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="736258247"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 May 2023 01:08:56 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2oyu-000Jr4-0C;
	Sat, 27 May 2023 08:08:56 +0000
Date: Sat, 27 May 2023 16:08:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [chrome-os:chromeos-6.1 117/436]
 drivers/gpu/drm/i915/display/intel_tc.c:906 xelpdp_tc_phy_hpd_live_status()
 error: uninitialized symbol 'pica_isr'.
Message-ID: <202305271605.Pw3eOK7l-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   8afca9e8ea0e9d56aae454c80b7ceeb8747186d4
commit: 495e867c1ebf690aa05925c357559d12868388d8 [117/436] FROMGIT: drm/i915/mtl: TypeC HPD live status query
:::::: branch date: 18 hours ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-m021-20230526 (https://download.01.org/0day-ci/archive/20230527/202305271605.Pw3eOK7l-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305271605.Pw3eOK7l-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/display/intel_tc.c:906 xelpdp_tc_phy_hpd_live_status() error: uninitialized symbol 'pica_isr'.
drivers/gpu/drm/i915/display/intel_tc.c:911 xelpdp_tc_phy_hpd_live_status() error: uninitialized symbol 'pch_isr'.

Old smatch warnings:
drivers/gpu/drm/i915/display/intel_tc.c:433 icl_tc_phy_hpd_live_status() error: uninitialized symbol 'fia_isr'.
drivers/gpu/drm/i915/display/intel_tc.c:445 icl_tc_phy_hpd_live_status() error: uninitialized symbol 'pch_isr'.
drivers/gpu/drm/i915/display/intel_tc.c:669 tgl_tc_phy_init() error: uninitialized symbol 'val'.
drivers/gpu/drm/i915/display/intel_tc.c:718 adlp_tc_phy_hpd_live_status() error: uninitialized symbol 'cpu_isr'.
drivers/gpu/drm/i915/display/intel_tc.c:723 adlp_tc_phy_hpd_live_status() error: uninitialized symbol 'pch_isr'.

vim +/pica_isr +906 drivers/gpu/drm/i915/display/intel_tc.c

48c622db6184f9 Imre Deak   2023-03-23  884  
ca62cd09e8d61e Mika Kahola 2023-04-28  885  /*
ca62cd09e8d61e Mika Kahola 2023-04-28  886   * XELPDP TC PHY handlers
ca62cd09e8d61e Mika Kahola 2023-04-28  887   * ----------------------
ca62cd09e8d61e Mika Kahola 2023-04-28  888   */
495e867c1ebf69 Imre Deak   2023-04-28  889  static u32 xelpdp_tc_phy_hpd_live_status(struct intel_tc_port *tc)
495e867c1ebf69 Imre Deak   2023-04-28  890  {
495e867c1ebf69 Imre Deak   2023-04-28  891  	struct drm_i915_private *i915 = tc_to_i915(tc);
495e867c1ebf69 Imre Deak   2023-04-28  892  	struct intel_digital_port *dig_port = tc->dig_port;
495e867c1ebf69 Imre Deak   2023-04-28  893  	enum hpd_pin hpd_pin = dig_port->base.hpd_pin;
495e867c1ebf69 Imre Deak   2023-04-28  894  	u32 pica_isr_bits = i915->display.hotplug.hpd[hpd_pin];
495e867c1ebf69 Imre Deak   2023-04-28  895  	u32 pch_isr_bit = i915->display.hotplug.pch_hpd[hpd_pin];
495e867c1ebf69 Imre Deak   2023-04-28  896  	intel_wakeref_t wakeref;
495e867c1ebf69 Imre Deak   2023-04-28  897  	u32 pica_isr;
495e867c1ebf69 Imre Deak   2023-04-28  898  	u32 pch_isr;
495e867c1ebf69 Imre Deak   2023-04-28  899  	u32 mask = 0;
495e867c1ebf69 Imre Deak   2023-04-28  900  
495e867c1ebf69 Imre Deak   2023-04-28  901  	with_intel_display_power(i915, POWER_DOMAIN_DISPLAY_CORE, wakeref) {
495e867c1ebf69 Imre Deak   2023-04-28  902  		pica_isr = intel_de_read(i915, PICAINTERRUPT_ISR);
495e867c1ebf69 Imre Deak   2023-04-28  903  		pch_isr = intel_de_read(i915, SDEISR);
495e867c1ebf69 Imre Deak   2023-04-28  904  	}
495e867c1ebf69 Imre Deak   2023-04-28  905  
495e867c1ebf69 Imre Deak   2023-04-28 @906  	if (pica_isr & (pica_isr_bits & XELPDP_DP_ALT_HOTPLUG_MASK))
495e867c1ebf69 Imre Deak   2023-04-28  907  		mask |= BIT(TC_PORT_DP_ALT);
495e867c1ebf69 Imre Deak   2023-04-28  908  	if (pica_isr & (pica_isr_bits & XELPDP_TBT_HOTPLUG_MASK))
495e867c1ebf69 Imre Deak   2023-04-28  909  		mask |= BIT(TC_PORT_TBT_ALT);
495e867c1ebf69 Imre Deak   2023-04-28  910  
495e867c1ebf69 Imre Deak   2023-04-28 @911  	if (tc->legacy_port && (pch_isr & pch_isr_bit))
495e867c1ebf69 Imre Deak   2023-04-28  912  		mask |= BIT(TC_PORT_LEGACY);
495e867c1ebf69 Imre Deak   2023-04-28  913  
495e867c1ebf69 Imre Deak   2023-04-28  914  	return mask;
495e867c1ebf69 Imre Deak   2023-04-28  915  }
495e867c1ebf69 Imre Deak   2023-04-28  916  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
