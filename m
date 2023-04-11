Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E802F29;
	Tue, 11 Apr 2023 10:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681209643; x=1712745643;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   mime-version:in-reply-to;
  bh=vWuPhEow+bv1xLCoUjFGBZbl4l4kxf+h+NuTflIQOm8=;
  b=IgJLAYOcPQK0hqOwUV9Q/mt1eAHhcC4BhTdetb657cz5DAjkr+m89SaY
   fheB4ydDO8xNeY2aw9StxpokaSw666z+YPnOekYMKr82Ja4/ZBPAzLiG6
   QZ+pa6xc7HDHwuwMnngiBsvYKCADc3mdqs0YM9BDxR1TADVEI9xenpKid
   HhkW/GApyAm5F2vNFuHkDZghuBK9T9KDyr3aAQk3tmdr8Nama/T4V22Xq
   OrclksyEAktRcQtILezc/tCpwzJlUjaT7d4ehQB0FPm6gzoaLxbIFfaZu
   H01fyKc6PMjB6FbgXXESJXP1dmkuQ7OrlZaySbxGOK/eGdqMrKylK64aA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="332268298"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="332268298"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 03:40:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="832298824"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="832298824"
Received: from ideak-desk.fi.intel.com ([10.237.72.58])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 03:40:23 -0700
Date: Tue, 11 Apr 2023 13:40:20 +0300
From: Imre Deak <imre.deak@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mika Kahola <mika.kahola@intel.com>
Subject: Re: [linux-next:master 8027/9787]
 drivers/gpu/drm/i915/display/intel_tc.c:424 icl_tc_phy_hpd_live_status()
 error: uninitialized symbol 'fia_isr'.
Message-ID: <ZDU5FCt8jQJhio/G@ideak-desk.fi.intel.com>
Reply-To: imre.deak@intel.com
References: <9b05194d-0f98-40ef-a067-a8d6b05c586f@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b05194d-0f98-40ef-a067-a8d6b05c586f@kili.mountain>

On Fri, Apr 07, 2023 at 11:57:10AM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   e134c93f788fb93fd6a3ec3af9af850a2048c7e6
> commit: 8979918af711b057620c7c5f9d29a0043f927753 [8027/9787] drm/i915/tc: Get power ref for reading the HPD live status register
> config: i386-randconfig-m031-20230403 (https://download.01.org/0day-ci/archive/20230407/202304070402.p78bkshq-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Link: https://lore.kernel.org/r/202304070402.p78bkshq-lkp@intel.com/
> 
> New smatch warnings:
> drivers/gpu/drm/i915/display/intel_tc.c:424 icl_tc_phy_hpd_live_status() error: uninitialized symbol 'fia_isr'.
> drivers/gpu/drm/i915/display/intel_tc.c:436 icl_tc_phy_hpd_live_status() error: uninitialized symbol 'pch_isr'.
> drivers/gpu/drm/i915/display/intel_tc.c:709 adlp_tc_phy_hpd_live_status() error: uninitialized symbol 'cpu_isr'.
> drivers/gpu/drm/i915/display/intel_tc.c:714 adlp_tc_phy_hpd_live_status() error: uninitialized symbol 'pch_isr'.
> 
> Old smatch warnings:
> drivers/gpu/drm/i915/display/intel_tc.c:660 tgl_tc_phy_init() error: uninitialized symbol 'val'.
> 
> vim +/fia_isr +424 drivers/gpu/drm/i915/display/intel_tc.c
> 
> 3eafcddf766b6b Imre Deak     2023-03-23  409  static u32 icl_tc_phy_hpd_live_status(struct intel_tc_port *tc)
> c905eb28bd3f43 Imre Deak     2019-06-28  410  {
> 3eafcddf766b6b Imre Deak     2023-03-23  411  	struct drm_i915_private *i915 = tc_to_i915(tc);
> 3eafcddf766b6b Imre Deak     2023-03-23  412  	struct intel_digital_port *dig_port = tc->dig_port;
> 5a4dd6f0e84654 Jani Nikula   2022-08-24  413  	u32 isr_bit = i915->display.hotplug.pch_hpd[dig_port->base.hpd_pin];
> 8979918af711b0 Imre Deak     2023-03-23  414  	intel_wakeref_t wakeref;
> 8979918af711b0 Imre Deak     2023-03-23  415  	u32 fia_isr;
> 8979918af711b0 Imre Deak     2023-03-23  416  	u32 pch_isr;
> c905eb28bd3f43 Imre Deak     2019-06-28  417  	u32 mask = 0;
> c905eb28bd3f43 Imre Deak     2019-06-28  418  
> 8979918af711b0 Imre Deak     2023-03-23  419  	with_intel_display_power(i915, tc_phy_cold_off_domain(tc), wakeref) {
> 8979918af711b0 Imre Deak     2023-03-23  420  		fia_isr = intel_de_read(i915, PORT_TX_DFLEXDPSP(tc->phy_fia));
> 8979918af711b0 Imre Deak     2023-03-23  421  		pch_isr = intel_de_read(i915, SDEISR);
> 
> What's the story with with_intel_display_power()?  I guess it must
> always be true.  I've asked about it several times before but no one
> ever responds to my emails about it.

Yes, it's guaranteed that the block inside with_intel_display_power() {}
will run.

> 8979918af711b0 Imre Deak     2023-03-23  422  	}
> c905eb28bd3f43 Imre Deak     2019-06-28  423  
> 8979918af711b0 Imre Deak     2023-03-23 @424  	if (fia_isr == 0xffffffff) {
> c4d162618216f7 Wambui Karuga 2020-01-30  425  		drm_dbg_kms(&i915->drm,
> c4d162618216f7 Wambui Karuga 2020-01-30  426  			    "Port %s: PHY in TCCOLD, nothing connected\n",
> 3eafcddf766b6b Imre Deak     2023-03-23  427  			    tc->port_name);
> 424f109f5c5d9c Imre Deak     2019-06-28  428  		return mask;
> 424f109f5c5d9c Imre Deak     2019-06-28  429  	}
> 424f109f5c5d9c Imre Deak     2019-06-28  430  
> 8979918af711b0 Imre Deak     2023-03-23  431  	if (fia_isr & TC_LIVE_STATE_TBT(tc->phy_fia_idx))
> c905eb28bd3f43 Imre Deak     2019-06-28  432  		mask |= BIT(TC_PORT_TBT_ALT);
> 8979918af711b0 Imre Deak     2023-03-23  433  	if (fia_isr & TC_LIVE_STATE_TC(tc->phy_fia_idx))
> c905eb28bd3f43 Imre Deak     2019-06-28  434  		mask |= BIT(TC_PORT_DP_ALT);
> c905eb28bd3f43 Imre Deak     2019-06-28  435  
> 8979918af711b0 Imre Deak     2023-03-23 @436  	if (pch_isr & isr_bit)
> c905eb28bd3f43 Imre Deak     2019-06-28  437  		mask |= BIT(TC_PORT_LEGACY);
> c905eb28bd3f43 Imre Deak     2019-06-28  438  
> c905eb28bd3f43 Imre Deak     2019-06-28  439  	return mask;
> c905eb28bd3f43 Imre Deak     2019-06-28  440  }
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
> 
