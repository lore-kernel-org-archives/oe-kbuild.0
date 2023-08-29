Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2D615499
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Aug 2023 13:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693315640; x=1724851640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LUIM71F4Y2LCzvUWV82HnE+b8SpTs71fhtkwQRrPxAU=;
  b=ebc50jIMOrQtANhNbNrRMQiXF1vHVcdjlwgMEgN8RW/KpjXS8SXBE8A+
   nUWMbtW88BkoSZOQUFw0fxs6o/epQQld31qXh7Akn0YqBKwhvzK5+y4rT
   ysxy/tx6CxivzBcYQnF1TE2pgQUMfQ2yuHICxArmteSjznSQbla7NzMbe
   YloEsIModlw5uX+kr1s9ZlYFAaFF10tUhl0yHKpU2wlmv3JfcfxsduUqU
   CYAueWNR41HWYfhp9OFC9AKzxRV/+/q55okg9SEQv7Jf02SfOVcAd6vwi
   4xk1JqSAOfoLQog4Mkz647k6MPTnTjS28JRB0FWUrLFF/WGvO/7vjp/pv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="375326451"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="375326451"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 06:27:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="1069465727"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="1069465727"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 29 Aug 2023 06:27:18 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaykM-0008lP-2h;
	Tue, 29 Aug 2023 13:27:12 +0000
Date: Tue, 29 Aug 2023 21:26:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 55/79] drivers/rtc/rtc-tps6594.c:442:2-9:
 line 442 is redundant because platform_get_irq() already prints an error
Message-ID: <202308292152.ooBO6m5F-lkp@intel.com>
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
CC: vigneshr@ti.com
CC: nm@ti.com
CC: Vignesh Raghavendra <vigneshr@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   dd944f14304d2ce6d26c9cdc3d2d2d6d373a322c
commit: 2b13d2f1be636addc928fef814e6fdad9cd2c21f [55/79] rtc: tps6594: add driver for TPS6594 PMIC RTC
:::::: branch date: 7 days ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-102-20230829 (https://download.01.org/0day-ci/archive/20230829/202308292152.ooBO6m5F-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230829/202308292152.ooBO6m5F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202308292152.ooBO6m5F-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/rtc/rtc-tps6594.c:442:2-9: line 442 is redundant because platform_get_irq() already prints an error

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
