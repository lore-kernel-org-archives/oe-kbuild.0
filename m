Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C3F17C8
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Sep 2023 01:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694396067; x=1725932067;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tK4cdu+KaSbTVbTMlFds/a0CN0BmZYq6X/k6BdHNZGw=;
  b=NOzas7FXEusg+NDxK5MyLUtjVQkv+gvs7Ox2OkHmRJIeKHs2z63mY2hp
   aQZmrWfv33Iy/2uWUWa324ewhApRqiObsfb7tsC/iirlBqchlQP/ExzQG
   tVNHZCZYiWZV8Y/Tq2Zz8DdPBrNTQvyL+PPH3ntiHAtCotjbWnVhNys6A
   jeBAV9MlAsETtu4e4ElPNvFgeF7oJC7ge3oGupSkacLExATCa58tQxlMZ
   8jkGKi8MaHMHTihh0YinDPeYI++1cO/4nE8r3kZw1nkpXxHpOFFm0Swry
   wclyaowDKBgmz0Mce0CoZ4qRTLy5XB9pQKi7kd8Wdt7Rj9WMEuEY3MhVN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="357420167"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="357420167"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 18:34:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="858124884"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="858124884"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Sep 2023 18:34:25 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfVol-0005ew-0f;
	Mon, 11 Sep 2023 01:34:23 +0000
Date: Mon, 11 Sep 2023 09:33:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/i915/display/intel_display_types.h:1932:24: sparse:
 sparse: unreplaced symbol '<noident>'
Message-ID: <202309110901.1gT0MpV5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/gpu/drm/i915/display/intel_display_types.h:1932:24: sparse: sparse: unreplaced symbol '<noident>'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Matt Roper <matthew.d.roper@intel.com>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
commit: 58bc2453ab8a4b5e1f2969e09c12ab69b8aaaf98 drm/i915: Define multicast registers as a new type
date:   11 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-061-20230909 (https://download.01.org/0day-ci/archive/20230911/202309110901.1gT0MpV5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309110901.1gT0MpV5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309110901.1gT0MpV5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/i915/display/intel_cdclk.c: note: in included file:
>> drivers/gpu/drm/i915/display/intel_display_types.h:1932:24: sparse: sparse: unreplaced symbol '<noident>'
>> drivers/gpu/drm/i915/display/intel_display_types.h:1932:24: sparse: sparse: unreplaced symbol '<noident>'
>> drivers/gpu/drm/i915/display/intel_display_types.h:1932:24: sparse: sparse: unreplaced symbol '<noident>'
>> drivers/gpu/drm/i915/display/intel_display_types.h:1932:24: sparse: sparse: unreplaced symbol '<noident>'
--
   drivers/gpu/drm/i915/display/intel_psr.c: note: in included file:
>> drivers/gpu/drm/i915/display/intel_display_types.h:1932:24: sparse: sparse: unreplaced symbol '<noident>'
>> drivers/gpu/drm/i915/display/intel_display_types.h:1932:24: sparse: sparse: unreplaced symbol '<noident>'
>> drivers/gpu/drm/i915/display/intel_display_types.h:1932:24: sparse: sparse: unreplaced symbol '<noident>'
>> drivers/gpu/drm/i915/display/intel_display_types.h:1932:24: sparse: sparse: unreplaced symbol '<noident>'
>> drivers/gpu/drm/i915/display/intel_display_types.h:1932:24: sparse: sparse: unreplaced symbol '<noident>'
>> drivers/gpu/drm/i915/display/intel_display_types.h:1932:24: sparse: sparse: unreplaced symbol '<noident>'
>> drivers/gpu/drm/i915/display/intel_display_types.h:1932:24: sparse: sparse: unreplaced symbol '<noident>'
>> drivers/gpu/drm/i915/display/intel_display_types.h:1932:24: sparse: sparse: unreplaced symbol '<noident>'
--
   drivers/gpu/drm/i915/display/intel_ddi.c: note: in included file:
>> drivers/gpu/drm/i915/display/intel_display_types.h:1932:24: sparse: sparse: unreplaced symbol '<noident>'
--
   drivers/gpu/drm/i915/display/intel_pps.c: note: in included file:
>> drivers/gpu/drm/i915/display/intel_display_types.h:1932:24: sparse: sparse: unreplaced symbol '<noident>'
>> drivers/gpu/drm/i915/display/intel_display_types.h:1932:24: sparse: sparse: unreplaced symbol '<noident>'
>> drivers/gpu/drm/i915/display/intel_display_types.h:1932:24: sparse: sparse: unreplaced symbol '<noident>'
--
   drivers/gpu/drm/i915/i915_irq.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_trace.h):
>> drivers/gpu/drm/i915/display/intel_display_types.h:1932:24: sparse: sparse: unreplaced symbol '<noident>'
>> drivers/gpu/drm/i915/i915_irq.c:2607:9: sparse: sparse: unreplaced symbol '<noident>'
   drivers/gpu/drm/i915/i915_irq.c:2615:16: sparse: sparse: unreplaced symbol '<noident>'
   drivers/gpu/drm/i915/i915_irq.c:2620:9: sparse: sparse: unreplaced symbol '<noident>'
   drivers/gpu/drm/i915/i915_irq.c:2620:9: sparse: sparse: unreplaced symbol '<noident>'
   drivers/gpu/drm/i915/i915_irq.c:2680:9: sparse: sparse: unreplaced symbol '<noident>'
   drivers/gpu/drm/i915/i915_irq.c:2688:16: sparse: sparse: unreplaced symbol '<noident>'
   drivers/gpu/drm/i915/i915_irq.c:2693:9: sparse: sparse: unreplaced symbol '<noident>'
   drivers/gpu/drm/i915/i915_irq.c:2693:9: sparse: sparse: unreplaced symbol '<noident>'
   drivers/gpu/drm/i915/i915_irq.c:2755:9: sparse: sparse: unreplaced symbol '<noident>'
   drivers/gpu/drm/i915/i915_irq.c:2758:15: sparse: sparse: unreplaced symbol '<noident>'
   drivers/gpu/drm/i915/i915_irq.c:2762:9: sparse: sparse: unreplaced symbol '<noident>'
   drivers/gpu/drm/i915/i915_irq.c:2769:9: sparse: sparse: unreplaced symbol '<noident>'
   drivers/gpu/drm/i915/i915_irq.c:2769:9: sparse: sparse: unreplaced symbol '<noident>'
   drivers/gpu/drm/i915/i915_irq.c:2769:9: sparse: sparse: unreplaced symbol '<noident>'
>> drivers/gpu/drm/i915/i915_irq.c:2607:9: sparse: sparse: unreplaced symbol '<noident>'
   drivers/gpu/drm/i915/i915_irq.c:2615:16: sparse: sparse: unreplaced symbol '<noident>'
   drivers/gpu/drm/i915/i915_irq.c:2680:9: sparse: sparse: unreplaced symbol '<noident>'
   drivers/gpu/drm/i915/i915_irq.c:2688:16: sparse: sparse: unreplaced symbol '<noident>'
   drivers/gpu/drm/i915/i915_irq.c:2755:9: sparse: sparse: unreplaced symbol '<noident>'
   drivers/gpu/drm/i915/i915_irq.c:2758:15: sparse: sparse: unreplaced symbol '<noident>'
   drivers/gpu/drm/i915/i915_irq.c:2762:9: sparse: sparse: unreplaced symbol '<noident>'
   drivers/gpu/drm/i915/i915_irq.c:2620:9: sparse: sparse: unreplaced symbol '<noident>'
   drivers/gpu/drm/i915/i915_irq.c:2693:9: sparse: sparse: unreplaced symbol '<noident>'
   drivers/gpu/drm/i915/i915_irq.c:2769:9: sparse: sparse: unreplaced symbol '<noident>'
--
   drivers/gpu/drm/i915/display/intel_display_debugfs.c: note: in included file:
>> drivers/gpu/drm/i915/display/intel_display_types.h:1932:24: sparse: sparse: unreplaced symbol '<noident>'
>> drivers/gpu/drm/i915/display/intel_display_types.h:1932:24: sparse: sparse: unreplaced symbol '<noident>'
>> drivers/gpu/drm/i915/display/intel_display_types.h:1932:24: sparse: sparse: unreplaced symbol '<noident>'

vim +1932 drivers/gpu/drm/i915/display/intel_display_types.h

ecdfd84f3228cc drivers/gpu/drm/i915/display/intel_display_types.h Ville Syrjälä 2019-12-04  1923  
14aa521c5eb615 drivers/gpu/drm/i915/intel_drv.h                   Ville Syrjälä 2018-07-05  1924  static inline bool intel_encoder_is_dp(struct intel_encoder *encoder)
14aa521c5eb615 drivers/gpu/drm/i915/intel_drv.h                   Ville Syrjälä 2018-07-05  1925  {
14aa521c5eb615 drivers/gpu/drm/i915/intel_drv.h                   Ville Syrjälä 2018-07-05  1926  	switch (encoder->type) {
14aa521c5eb615 drivers/gpu/drm/i915/intel_drv.h                   Ville Syrjälä 2018-07-05  1927  	case INTEL_OUTPUT_DP:
14aa521c5eb615 drivers/gpu/drm/i915/intel_drv.h                   Ville Syrjälä 2018-07-05  1928  	case INTEL_OUTPUT_EDP:
14aa521c5eb615 drivers/gpu/drm/i915/intel_drv.h                   Ville Syrjälä 2018-07-05  1929  		return true;
14aa521c5eb615 drivers/gpu/drm/i915/intel_drv.h                   Ville Syrjälä 2018-07-05  1930  	case INTEL_OUTPUT_DDI:
14aa521c5eb615 drivers/gpu/drm/i915/intel_drv.h                   Ville Syrjälä 2018-07-05  1931  		/* Skip pure HDMI/DVI DDI encoders */
b7d02c3a124d9b drivers/gpu/drm/i915/display/intel_display_types.h Ville Syrjälä 2019-12-04 @1932  		return i915_mmio_reg_valid(enc_to_intel_dp(encoder)->output_reg);
14aa521c5eb615 drivers/gpu/drm/i915/intel_drv.h                   Ville Syrjälä 2018-07-05  1933  	default:
14aa521c5eb615 drivers/gpu/drm/i915/intel_drv.h                   Ville Syrjälä 2018-07-05  1934  		return false;
14aa521c5eb615 drivers/gpu/drm/i915/intel_drv.h                   Ville Syrjälä 2018-07-05  1935  	}
14aa521c5eb615 drivers/gpu/drm/i915/intel_drv.h                   Ville Syrjälä 2018-07-05  1936  }
14aa521c5eb615 drivers/gpu/drm/i915/intel_drv.h                   Ville Syrjälä 2018-07-05  1937  

:::::: The code at line 1932 was first introduced by commit
:::::: b7d02c3a124d9be9cdd4982505d1ac00de4c70f2 drm/i915: Pass intel_encoder to enc_to_*()

:::::: TO: Ville Syrjälä <ville.syrjala@linux.intel.com>
:::::: CC: Ville Syrjälä <ville.syrjala@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
