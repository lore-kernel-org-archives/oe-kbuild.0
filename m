Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD092188
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Sep 2023 07:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694416365; x=1725952365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CSFo8vtAzrdbsB33ilUVtL/8VAiwm1L9DE7mPftRjvw=;
  b=lZA9UU419dMcHnkvXvGPjnxnRm7zn54DajxkLXI0rwf5hY5JRnbCLszo
   nCesl+MGENrFeJwqT1NaEHCSxNJQigJFKZGgVXxozxyl7NR7VhyAyXck9
   nSJWSKvw48BF8JEFimgh0Xz/0Tr5IGAUvoYJ8ZXHeZ5QoHYn8CWF3O+kz
   kVmZRJQ/oi29nmYClg8biC5F9Q+7KihuDNBtO0SP1UJMm8l99flY3ZX21
   DVxlQfa2NXTRp1QM60XYtBrB8kXVtVA17nwvFLNXddzJ0wa8NIM104uzg
   g8DgWxfuZgCtrNqTI1WytrS5mw/tqgwcqNum16n7R09RaWvNmt9X835Hr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="375369842"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="375369842"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 00:12:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="989983022"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="989983022"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 11 Sep 2023 00:12:39 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfb65-0005vc-0N;
	Mon, 11 Sep 2023 07:12:37 +0000
Date: Mon, 11 Sep 2023 15:11:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [drm-drm-intel:drm-intel-next 1/4]
 drivers/gpu/drm/i915/display/intel_tc.c:302 mtl_tc_port_get_max_lane_count()
 error: uninitialized symbol 'pin_mask'.
Message-ID: <202309111544.O7U3IUHM-lkp@intel.com>
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
TO: Luca Coelho <luciano.coelho@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Suraj Kandpal <suraj.kandpal@intel.com>

tree:   git://anongit.freedesktop.org/drm/drm-intel drm-intel-next
head:   da1bc5cc3b55af2d785c6dd02c3b461f89f51adf
commit: 98090e0bf51addd6d3ddedb6c3685b47a7ca0724 [1/4] drm/i915/tc: rename mtl_tc_port_get_pin_assignment_mask()
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20230911 (https://download.01.org/0day-ci/archive/20230911/202309111544.O7U3IUHM-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230911/202309111544.O7U3IUHM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309111544.O7U3IUHM-lkp@intel.com/

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
98090e0bf51add Luca Coelho      2023-08-25  293  static int mtl_tc_port_get_max_lane_count(struct intel_digital_port *dig_port)
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

:::::: The code at line 302 was first introduced by commit
:::::: dac6ce66db3e3bdb5dc66f6713929b125612ef01 drm/i915/mtl: Pin assignment for TypeC

:::::: TO: Anusha Srivatsa <anusha.srivatsa@intel.com>
:::::: CC: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
