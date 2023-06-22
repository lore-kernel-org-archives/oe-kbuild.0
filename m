Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86905239
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jun 2023 11:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687434819; x=1718970819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0OdBAEKBa8wnNQ2r5rvVH2SwS5QujgujStoMx9b5HU8=;
  b=nk+xLb76My+WM9MfQt0ZcDmTIRQWlz6Zunr1/ssHCdM91Cijb0CneWi2
   12CT8UWEOs3gJxkmf1xbK3pJ5G879Zt/EOew+OHTrmWRBeu/eFqbHUu3N
   syyvU0ZrbLS6u8GjX5AcnOs+NB2Q439ATREVlukTMeUUkbwrsDsVh1QKL
   +pDeaBc7yn9HEHniqktt8OUnvdKnmMKeZ8WR0wMoypUK81ststOtVtjq1
   Sg92jgYfBRLV9LOeqyCONA871U1HcQKh4xnzcYHLSQCdYM4I/4Vom4iT6
   Jb7f7FV3tf6iTzEnYUU9vYvnsqFCwTdelZ0zMcepa90IP1XEgpupf1M/9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="362999290"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="362999290"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:53:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="714875663"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="714875663"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 22 Jun 2023 04:53:37 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCIsa-0007Wt-2x;
	Thu, 22 Jun 2023 11:53:36 +0000
Date: Thu, 22 Jun 2023 19:52:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [chrome-os:chromeos-5.4 4/4] drivers/acpi/bus.c:353
 acpi_bus_osc_negotiate_platform_control() error: double free of
 'context.ret.pointer'
Message-ID: <202306221923.mwOcdWFL-lkp@intel.com>
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

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.4
head:   6ea2c698b4de69c715cc8e5f066515ed0cbbe5b8
commit: 6ea2c698b4de69c715cc8e5f066515ed0cbbe5b8 [4/4] UPSTREAM: ACPI: Pass the same capabilities to the _OSC regardless of the query flag
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: x86_64-randconfig-m001-20230621 (https://download.01.org/0day-ci/archive/20230622/202306221923.mwOcdWFL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306221923.mwOcdWFL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306221923.mwOcdWFL-lkp@intel.com/

smatch warnings:
drivers/acpi/bus.c:353 acpi_bus_osc_negotiate_platform_control() error: double free of 'context.ret.pointer'

vim +353 drivers/acpi/bus.c

5c2832e91a3ed4 Srinivas Pandruvada 2016-11-22  322  
de966cf4a4fa8d Tim Chen            2016-11-29  323  	if (IS_ENABLED(CONFIG_SCHED_MC_PRIO))
8b533a0eeefc58 Srinivas Pandruvada 2016-11-22  324  		capbuf[OSC_SUPPORT_DWORD] |= OSC_SB_CPC_DIVERSE_HIGH_SUPPORT;
8b533a0eeefc58 Srinivas Pandruvada 2016-11-22  325  
f69d46ce65ee64 Mika Westerberg     2020-02-18  326  	if (IS_ENABLED(CONFIG_USB4))
f69d46ce65ee64 Mika Westerberg     2020-02-18  327  		capbuf[OSC_SUPPORT_DWORD] |= OSC_SB_NATIVE_USB4_SUPPORT;
f69d46ce65ee64 Mika Westerberg     2020-02-18  328  
eccddd32ced0df Huang Ying          2011-07-13  329  	if (!ghes_disable)
b938a229c85a56 Bjorn Helgaas       2013-09-05  330  		capbuf[OSC_SUPPORT_DWORD] |= OSC_SB_APEI_SUPPORT;
3563ff964fdc36 Shaohua Li          2009-10-29  331  	if (ACPI_FAILURE(acpi_get_handle(NULL, "\\_SB", &handle)))
3563ff964fdc36 Shaohua Li          2009-10-29  332  		return;
3770a69658552f Mario Limonciello   2020-10-26  333  
3770a69658552f Mario Limonciello   2020-10-26  334  	if (ACPI_FAILURE(acpi_run_osc(handle, &context)))
3770a69658552f Mario Limonciello   2020-10-26  335  		return;
3770a69658552f Mario Limonciello   2020-10-26  336  
3770a69658552f Mario Limonciello   2020-10-26  337  	kfree(context.ret.pointer);
3770a69658552f Mario Limonciello   2020-10-26  338  
6ea2c698b4de69 Linux Patches Robot 2023-06-17  339  	/* Now run _OSC again with query flag clear */
3770a69658552f Mario Limonciello   2020-10-26  340  	capbuf[OSC_QUERY_DWORD] = 0;
3770a69658552f Mario Limonciello   2020-10-26  341  
3770a69658552f Mario Limonciello   2020-10-26  342  	if (ACPI_FAILURE(acpi_run_osc(handle, &context)))
3770a69658552f Mario Limonciello   2020-10-26  343  		return;
3770a69658552f Mario Limonciello   2020-10-26  344  
3770a69658552f Mario Limonciello   2020-10-26  345  	capbuf_ret = context.ret.pointer;
eccddd32ced0df Huang Ying          2011-07-13  346  	osc_sb_apei_support_acked =
b938a229c85a56 Bjorn Helgaas       2013-09-05  347  		capbuf_ret[OSC_SUPPORT_DWORD] & OSC_SB_APEI_SUPPORT;
a36a7fecfe6071 Sudeep Holla        2016-07-21  348  	osc_pc_lpi_support_confirmed =
a36a7fecfe6071 Sudeep Holla        2016-07-21  349  		capbuf_ret[OSC_SUPPORT_DWORD] & OSC_SB_PCLPI_SUPPORT;
f69d46ce65ee64 Mika Westerberg     2020-02-18  350  	osc_sb_native_usb4_support_confirmed =
f69d46ce65ee64 Mika Westerberg     2020-02-18  351  		capbuf_ret[OSC_SUPPORT_DWORD] & OSC_SB_NATIVE_USB4_SUPPORT;
f69d46ce65ee64 Mika Westerberg     2020-02-18  352  
f69d46ce65ee64 Mika Westerberg     2020-02-18 @353  	kfree(context.ret.pointer);
f69d46ce65ee64 Mika Westerberg     2020-02-18  354  }
f69d46ce65ee64 Mika Westerberg     2020-02-18  355  

:::::: The code at line 353 was first introduced by commit
:::::: f69d46ce65ee648ea23c869527d90c1ab19f2c75 UPSTREAM: ACPI: Add support for native USB4 control _OSC

:::::: TO: Mika Westerberg <mika.westerberg@linux.intel.com>
:::::: CC: Daniel Campello <campello@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
