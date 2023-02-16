Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1B03C3B
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Feb 2023 11:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676546428; x=1708082428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tefHaCF2NuThgU7Yd9l6bgaYLGpKjHGKpjYAPbDeFSQ=;
  b=OQefitFJ1Ecks2Jd3WGl0X/fDf0bUHEDVwjjn059BvyaNUElroCOH78G
   qdzG/nRelhJyG6lZ+kc1ECxwb9N0bkqQ63CsFMi8YMEbxhjiZnIynH/oS
   aF3oEmA5qr/ZQxELF6yB/kyAkSCBLAVSORyIzbqb9yn/bN3qNPMuUjzlV
   t9cGPJCl337kFY0LvmUMfk2Ff8ympQl4S8iAP+trEkdI8vKDV8bBGe3/z
   kORcSit2Ru+/MX/rAZkWv9NvTgTDAHcC0ksGpoNFUoCg9HnXnh2t1Y3Vx
   mhLiwhUooBXOg+YGawECRc8JLOx3hObGrDQSQqlnoNkFyBjjZYhRvSuEY
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="359120888"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="359120888"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 03:20:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="702524240"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="702524240"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 16 Feb 2023 03:20:25 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pScJM-000ADd-1x;
	Thu, 16 Feb 2023 11:20:24 +0000
Date: Thu, 16 Feb 2023 19:19:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/i915/i915_hwmon.c:77 hwm_field_read_and_scale()
 error: uninitialized symbol 'reg_value'.
Message-ID: <202302161953.dLDVJrzK-lkp@intel.com>
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
CC: Andi Shyti <andi.shyti@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   033c40a89f55525139fd5b6342281b09b97d05bf
commit: 99f55efb79114f7bc38e9c769f06f5bacb5e9d21 drm/i915/hwmon: Power PL1 limit and TDP setting
date:   4 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230216/202302161953.dLDVJrzK-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302161953.dLDVJrzK-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/i915_hwmon.c:77 hwm_field_read_and_scale() error: uninitialized symbol 'reg_value'.

Old smatch warnings:
drivers/gpu/drm/i915/i915_hwmon.c:132 hwm_in_read() error: uninitialized symbol 'reg_value'.

vim +/reg_value +77 drivers/gpu/drm/i915/i915_hwmon.c

99f55efb79114f Dale B Stimson 2022-10-13  60  
99f55efb79114f Dale B Stimson 2022-10-13  61  /*
99f55efb79114f Dale B Stimson 2022-10-13  62   * This function's return type of u64 allows for the case where the scaling
99f55efb79114f Dale B Stimson 2022-10-13  63   * of the field taken from the 32-bit register value might cause a result to
99f55efb79114f Dale B Stimson 2022-10-13  64   * exceed 32 bits.
99f55efb79114f Dale B Stimson 2022-10-13  65   */
99f55efb79114f Dale B Stimson 2022-10-13  66  static u64
99f55efb79114f Dale B Stimson 2022-10-13  67  hwm_field_read_and_scale(struct hwm_drvdata *ddat, i915_reg_t rgadr,
99f55efb79114f Dale B Stimson 2022-10-13  68  			 u32 field_msk, int nshift, u32 scale_factor)
99f55efb79114f Dale B Stimson 2022-10-13  69  {
99f55efb79114f Dale B Stimson 2022-10-13  70  	struct intel_uncore *uncore = ddat->uncore;
99f55efb79114f Dale B Stimson 2022-10-13  71  	intel_wakeref_t wakeref;
99f55efb79114f Dale B Stimson 2022-10-13  72  	u32 reg_value;
99f55efb79114f Dale B Stimson 2022-10-13  73  
99f55efb79114f Dale B Stimson 2022-10-13  74  	with_intel_runtime_pm(uncore->rpm, wakeref)
99f55efb79114f Dale B Stimson 2022-10-13  75  		reg_value = intel_uncore_read(uncore, rgadr);
99f55efb79114f Dale B Stimson 2022-10-13  76  
99f55efb79114f Dale B Stimson 2022-10-13 @77  	reg_value = REG_FIELD_GET(field_msk, reg_value);
99f55efb79114f Dale B Stimson 2022-10-13  78  
99f55efb79114f Dale B Stimson 2022-10-13  79  	return mul_u64_u32_shr(reg_value, scale_factor, nshift);
99f55efb79114f Dale B Stimson 2022-10-13  80  }
99f55efb79114f Dale B Stimson 2022-10-13  81  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
