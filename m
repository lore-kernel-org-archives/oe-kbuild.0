Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07C6AD29
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Apr 2023 17:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680800407; x=1712336407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=otzMfCskpANdBSCwGr6KKgnmaHNdN3c45PuBDvdYJtI=;
  b=MAOP55lVRdhAQ+V+u3HashSYA4urUmnj05x3Tn50Bqbu2byeH4usdLjf
   jCBNNAj+vbK5ZEpuCGAF2JTQT7jHA+Gvl+JY731FleDtzdqpfv2EBKtwe
   BEgIL6wHXvUypQxOTd63o3rqXp8TDj8Ab1Pj2USyMAw4DRoqvlNX3yufu
   D2PIjMSGCyHxz/KYN8v/UyB92AAlchzgsqHUtMYZ9nhhdU+6qlvTasauM
   sW7pK2TVDURm78M85sqk/ccgZVKCDHUm/kUFYDefyQCgQP8xaW3vEoyBa
   +C1DhB2Xxs49O2LXoAIZCf896yYXaRYmEmp7QyBK7Kpih0G8EArOPVgSQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="370620313"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="370620313"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 10:00:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="719773130"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="719773130"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Apr 2023 10:00:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkSxr-000RXM-2B;
	Thu, 06 Apr 2023 16:59:59 +0000
Date: Fri, 7 Apr 2023 00:59:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8025/9787]
 drivers/gpu/drm/i915/display/intel_tc.c:655 tgl_tc_phy_init() error:
 uninitialized symbol 'val'.
Message-ID: <202304070003.L1w2IMCz-lkp@intel.com>
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
commit: c55b73f391a726a45cc014464ba7ebea5f1d7386 [8025/9787] drm/i915/tc: Add TC PHY hook to init the PHY
:::::: branch date: 12 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-m031-20230403 (https://download.01.org/0day-ci/archive/20230407/202304070003.L1w2IMCz-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304070003.L1w2IMCz-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/intel_tc.c:655 tgl_tc_phy_init() error: uninitialized symbol 'val'.

vim +/val +655 drivers/gpu/drm/i915/display/intel_tc.c

16cf693e31bdb4 Imre Deak 2023-03-23  645  
c55b73f391a726 Imre Deak 2023-03-23  646  static void tgl_tc_phy_init(struct intel_tc_port *tc)
c55b73f391a726 Imre Deak 2023-03-23  647  {
c55b73f391a726 Imre Deak 2023-03-23  648  	struct drm_i915_private *i915 = tc_to_i915(tc);
c55b73f391a726 Imre Deak 2023-03-23  649  	intel_wakeref_t wakeref;
c55b73f391a726 Imre Deak 2023-03-23  650  	u32 val;
c55b73f391a726 Imre Deak 2023-03-23  651  
c55b73f391a726 Imre Deak 2023-03-23  652  	with_intel_display_power(i915, tc_phy_cold_off_domain(tc), wakeref)
c55b73f391a726 Imre Deak 2023-03-23  653  		val = intel_de_read(i915, PORT_TX_DFLEXDPSP(FIA1));
c55b73f391a726 Imre Deak 2023-03-23  654  
c55b73f391a726 Imre Deak 2023-03-23 @655  	drm_WARN_ON(&i915->drm, val == 0xffffffff);
c55b73f391a726 Imre Deak 2023-03-23  656  
c55b73f391a726 Imre Deak 2023-03-23  657  	tc_phy_load_fia_params(tc, val & MODULAR_FIA_MASK);
c55b73f391a726 Imre Deak 2023-03-23  658  }
c55b73f391a726 Imre Deak 2023-03-23  659  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
