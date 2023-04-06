Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37CBD2F7
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Apr 2023 20:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680813379; x=1712349379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=deP3uO7loVJMRRNZ3ermgzH7BCy/HEsYXO4VlFsSIHE=;
  b=CXMyMAC3Zg8glTWktWCBoc+DjAjU70zICFZMtwc+JCLztsp65zQYx2Z/
   Bj5st1+EK89aQ1fvr+q2yLLCMyK6b2tJJufApvfOgEYJCpKO0RQPGIBVx
   wMyzi8CZWMKq8uIe704mM7Z5bbJwksGRebv8U5f9Cz4uWOSnR/LAtBlKr
   7ARzfY3e4MjYe9zv39dZOTGQAF94jGHGGAHlFRwlnXoia+SG+63JgGZ3/
   UxjBXr7vsaxcnQKRCw24IGMh8uzrY2627yQVoPutG65nKl89JYm7aQEWC
   J5U31XrsvidbcLfywzeFv1bngHH/Lv9lnXFNnADUbQiMtEeTL6YPE4Pl7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="326907152"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="326907152"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 13:36:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="664630711"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="664630711"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Apr 2023 13:36:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkWL4-000RkQ-1K;
	Thu, 06 Apr 2023 20:36:10 +0000
Date: Fri, 7 Apr 2023 04:35:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8027/9787]
 drivers/gpu/drm/i915/display/intel_tc.c:424 icl_tc_phy_hpd_live_status()
 error: uninitialized symbol 'fia_isr'.
Message-ID: <202304070402.p78bkshq-lkp@intel.com>
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
TO: Imre Deak <imre.deak@intel.com>
CC: Mika Kahola <mika.kahola@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e134c93f788fb93fd6a3ec3af9af850a2048c7e6
commit: 8979918af711b057620c7c5f9d29a0043f927753 [8027/9787] drm/i915/tc: Get power ref for reading the HPD live status register
:::::: branch date: 15 hours ago
:::::: commit date: 4 days ago
config: i386-randconfig-m031-20230403 (https://download.01.org/0day-ci/archive/20230407/202304070402.p78bkshq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304070402.p78bkshq-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/display/intel_tc.c:424 icl_tc_phy_hpd_live_status() error: uninitialized symbol 'fia_isr'.
drivers/gpu/drm/i915/display/intel_tc.c:436 icl_tc_phy_hpd_live_status() error: uninitialized symbol 'pch_isr'.
drivers/gpu/drm/i915/display/intel_tc.c:709 adlp_tc_phy_hpd_live_status() error: uninitialized symbol 'cpu_isr'.
drivers/gpu/drm/i915/display/intel_tc.c:714 adlp_tc_phy_hpd_live_status() error: uninitialized symbol 'pch_isr'.

Old smatch warnings:
drivers/gpu/drm/i915/display/intel_tc.c:660 tgl_tc_phy_init() error: uninitialized symbol 'val'.

vim +/fia_isr +424 drivers/gpu/drm/i915/display/intel_tc.c

16cf693e31bdb4 Imre Deak     2023-03-23  408  
3eafcddf766b6b Imre Deak     2023-03-23  409  static u32 icl_tc_phy_hpd_live_status(struct intel_tc_port *tc)
c905eb28bd3f43 Imre Deak     2019-06-28  410  {
3eafcddf766b6b Imre Deak     2023-03-23  411  	struct drm_i915_private *i915 = tc_to_i915(tc);
3eafcddf766b6b Imre Deak     2023-03-23  412  	struct intel_digital_port *dig_port = tc->dig_port;
5a4dd6f0e84654 Jani Nikula   2022-08-24  413  	u32 isr_bit = i915->display.hotplug.pch_hpd[dig_port->base.hpd_pin];
8979918af711b0 Imre Deak     2023-03-23  414  	intel_wakeref_t wakeref;
8979918af711b0 Imre Deak     2023-03-23  415  	u32 fia_isr;
8979918af711b0 Imre Deak     2023-03-23  416  	u32 pch_isr;
c905eb28bd3f43 Imre Deak     2019-06-28  417  	u32 mask = 0;
c905eb28bd3f43 Imre Deak     2019-06-28  418  
8979918af711b0 Imre Deak     2023-03-23  419  	with_intel_display_power(i915, tc_phy_cold_off_domain(tc), wakeref) {
8979918af711b0 Imre Deak     2023-03-23  420  		fia_isr = intel_de_read(i915, PORT_TX_DFLEXDPSP(tc->phy_fia));
8979918af711b0 Imre Deak     2023-03-23  421  		pch_isr = intel_de_read(i915, SDEISR);
8979918af711b0 Imre Deak     2023-03-23  422  	}
c905eb28bd3f43 Imre Deak     2019-06-28  423  
8979918af711b0 Imre Deak     2023-03-23 @424  	if (fia_isr == 0xffffffff) {
c4d162618216f7 Wambui Karuga 2020-01-30  425  		drm_dbg_kms(&i915->drm,
c4d162618216f7 Wambui Karuga 2020-01-30  426  			    "Port %s: PHY in TCCOLD, nothing connected\n",
3eafcddf766b6b Imre Deak     2023-03-23  427  			    tc->port_name);
424f109f5c5d9c Imre Deak     2019-06-28  428  		return mask;
424f109f5c5d9c Imre Deak     2019-06-28  429  	}
424f109f5c5d9c Imre Deak     2019-06-28  430  
8979918af711b0 Imre Deak     2023-03-23  431  	if (fia_isr & TC_LIVE_STATE_TBT(tc->phy_fia_idx))
c905eb28bd3f43 Imre Deak     2019-06-28  432  		mask |= BIT(TC_PORT_TBT_ALT);
8979918af711b0 Imre Deak     2023-03-23  433  	if (fia_isr & TC_LIVE_STATE_TC(tc->phy_fia_idx))
c905eb28bd3f43 Imre Deak     2019-06-28  434  		mask |= BIT(TC_PORT_DP_ALT);
c905eb28bd3f43 Imre Deak     2019-06-28  435  
8979918af711b0 Imre Deak     2023-03-23 @436  	if (pch_isr & isr_bit)
c905eb28bd3f43 Imre Deak     2019-06-28  437  		mask |= BIT(TC_PORT_LEGACY);
c905eb28bd3f43 Imre Deak     2019-06-28  438  
c905eb28bd3f43 Imre Deak     2019-06-28  439  	return mask;
c905eb28bd3f43 Imre Deak     2019-06-28  440  }
c905eb28bd3f43 Imre Deak     2019-06-28  441  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
