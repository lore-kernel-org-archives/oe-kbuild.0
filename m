Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7B3AD38
	for <oe-kbuild@lists.linux.dev>; Sat, 27 May 2023 11:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685186223; x=1716722223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c+4fTB7toar8IrcNaV4J5uceyGSkhD5xWv3hGe9A+Sk=;
  b=VZ8RWUfWr48s8BuXsEeExet9QOCmzlS4sUH5MXfzUOsCK/ziF4d9eUjy
   ZgcRfT0oYPj0T0730ldwLwtVpYeJ59m0AF/nLj2hbFet1mwWrtFNaqHDH
   lCDGqnygTWnnngbuDYZgc17LG+TrMYfl/23ja0xkAcu/JmKUbuJcnC8Fp
   92w9mjHqnTf5ilVNT7RY2q/iD0qbjxsuQNSa4REjDVSUhIy5gf/6ateTO
   ux50lATuSDjMUQ0vDMylNWxPZeZyFlAwAtl3th+TkCmSrcPnFejaq/CB2
   x3ff0w+3zU+U61AY4eCuiglER2JZLHbEM8UYLhwGFlZpwHRjaNXRA/3Jx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="420146460"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="420146460"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 04:17:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="699682506"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="699682506"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 27 May 2023 04:17:00 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2ruu-000JvK-1E;
	Sat, 27 May 2023 11:17:00 +0000
Date: Sat, 27 May 2023 19:16:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [chrome-os:chromeos-6.1 118/436]
 drivers/gpu/drm/i915/display/intel_tc.c:297
 mtl_tc_port_get_pin_assignment_mask() error: uninitialized symbol
 'pin_mask'.
Message-ID: <202305271942.WvtM20Wr-lkp@intel.com>
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
head:   4358529660afffbab2b93e8b33c44438be081c91
commit: 80178755a0b5c4a9507f27483b0e4369b55d8af0 [118/436] FROMGIT: drm/i915/mtl: Pin assignment for TypeC
:::::: branch date: 3 hours ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-m021-20230526 (https://download.01.org/0day-ci/archive/20230527/202305271942.WvtM20Wr-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305271942.WvtM20Wr-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/display/intel_tc.c:297 mtl_tc_port_get_pin_assignment_mask() error: uninitialized symbol 'pin_mask'.

Old smatch warnings:
drivers/gpu/drm/i915/display/intel_tc.c:461 icl_tc_phy_hpd_live_status() error: uninitialized symbol 'fia_isr'.
drivers/gpu/drm/i915/display/intel_tc.c:473 icl_tc_phy_hpd_live_status() error: uninitialized symbol 'pch_isr'.
drivers/gpu/drm/i915/display/intel_tc.c:697 tgl_tc_phy_init() error: uninitialized symbol 'val'.
drivers/gpu/drm/i915/display/intel_tc.c:746 adlp_tc_phy_hpd_live_status() error: uninitialized symbol 'cpu_isr'.
drivers/gpu/drm/i915/display/intel_tc.c:751 adlp_tc_phy_hpd_live_status() error: uninitialized symbol 'pch_isr'.
drivers/gpu/drm/i915/display/intel_tc.c:934 xelpdp_tc_phy_hpd_live_status() error: uninitialized symbol 'pica_isr'.
drivers/gpu/drm/i915/display/intel_tc.c:939 xelpdp_tc_phy_hpd_live_status() error: uninitialized symbol 'pch_isr'.

vim +/pin_mask +297 drivers/gpu/drm/i915/display/intel_tc.c

3b51be4e4061bd Clinton A Taylor 2019-09-26  287  
80178755a0b5c4 Anusha Srivatsa  2023-04-28  288  static int mtl_tc_port_get_pin_assignment_mask(struct intel_digital_port *dig_port)
80178755a0b5c4 Anusha Srivatsa  2023-04-28  289  {
80178755a0b5c4 Anusha Srivatsa  2023-04-28  290  	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
80178755a0b5c4 Anusha Srivatsa  2023-04-28  291  	intel_wakeref_t wakeref;
80178755a0b5c4 Anusha Srivatsa  2023-04-28  292  	u32 pin_mask;
80178755a0b5c4 Anusha Srivatsa  2023-04-28  293  
80178755a0b5c4 Anusha Srivatsa  2023-04-28  294  	with_intel_display_power(i915, POWER_DOMAIN_DISPLAY_CORE, wakeref)
80178755a0b5c4 Anusha Srivatsa  2023-04-28  295  		pin_mask = intel_tc_port_get_pin_assignment_mask(dig_port);
80178755a0b5c4 Anusha Srivatsa  2023-04-28  296  
80178755a0b5c4 Anusha Srivatsa  2023-04-28 @297  	switch (pin_mask) {
80178755a0b5c4 Anusha Srivatsa  2023-04-28  298  	default:
80178755a0b5c4 Anusha Srivatsa  2023-04-28  299  		MISSING_CASE(pin_mask);
80178755a0b5c4 Anusha Srivatsa  2023-04-28  300  		fallthrough;
80178755a0b5c4 Anusha Srivatsa  2023-04-28  301  	case DP_PIN_ASSIGNMENT_D:
80178755a0b5c4 Anusha Srivatsa  2023-04-28  302  		return 2;
80178755a0b5c4 Anusha Srivatsa  2023-04-28  303  	case DP_PIN_ASSIGNMENT_C:
80178755a0b5c4 Anusha Srivatsa  2023-04-28  304  	case DP_PIN_ASSIGNMENT_E:
80178755a0b5c4 Anusha Srivatsa  2023-04-28  305  		return 4;
80178755a0b5c4 Anusha Srivatsa  2023-04-28  306  	}
80178755a0b5c4 Anusha Srivatsa  2023-04-28  307  }
80178755a0b5c4 Anusha Srivatsa  2023-04-28  308  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
