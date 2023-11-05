Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6104DEC3
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Nov 2023 02:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m2FMizPl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699150955; x=1730686955;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FypDP4DVg1YgwyXWlPQBXKndXSEoZLd3fCeEQzysuko=;
  b=m2FMizPlNpZzVyEuPz1Ry/koBp1dVe8SnQ64FnKNJRfAr0SLu3fcBJdM
   v5XIJJBqhvojaKnjPXmUKvgpMwAif+F+p76t3yT3+2sfh9KfHWr/r/NB2
   nMO2SsXI9d22rDksOd6Mt40YZNR/fLcuqNQOXpB0/SNhN2XUfZWQ1fbBf
   +skdiwYCsagbI/KWZuMQ4BSdIknA6WRLgQlj6hotJwERQilGPSIotDU4a
   q/WaqKvLCVDbSljD22iaIfQHN+Z/sLcDHEqm3vSfKPTEDxUop6d0IADMR
   0BnBjVEa5EXsM5lOHEPUKjmowxrcJljbbpx5R3Ke8qZe9zq+ZzMKi5v5c
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="368455433"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="368455433"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 19:22:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="3113662"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Nov 2023 19:22:33 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzSmV-0004vO-0T;
	Sun, 05 Nov 2023 02:22:31 +0000
Date: Sun, 5 Nov 2023 10:21:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/acpi/arm64/gtdt.c:355:19: sparse: sparse: cast to non-scalar
Message-ID: <202311051055.S47mfYBP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/acpi/arm64/gtdt.c:355:19: sparse: sparse: cast to non-scalar"
:::::: Manual check reason: "Committer is Greg Kroah-Hartman, remote is linus!"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aea6bf908d730b01bd264a8821159db9463c111c
commit: 52c4d11f1dce60453ab2a75fd7103118cedb2b58 resource: Convert DEFINE_RES_NAMED() to be compound literal
date:   12 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 12 months ago
config: arm64-randconfig-r122-20231102 (https://download.01.org/0day-ci/archive/20231105/202311051055.S47mfYBP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231105/202311051055.S47mfYBP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311051055.S47mfYBP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/acpi/arm64/gtdt.c:355:19: sparse: sparse: cast to non-scalar
>> drivers/acpi/arm64/gtdt.c:355:19: sparse: sparse: cast from non-scalar

vim +355 drivers/acpi/arm64/gtdt.c

ca9ae5ec4ef0ed Fu Wei       2017-04-01  324  
ca9ae5ec4ef0ed Fu Wei       2017-04-01  325  /*
ca9ae5ec4ef0ed Fu Wei       2017-04-01  326   * Initialize a SBSA generic Watchdog platform device info from GTDT
ca9ae5ec4ef0ed Fu Wei       2017-04-01  327   */
ca9ae5ec4ef0ed Fu Wei       2017-04-01  328  static int __init gtdt_import_sbsa_gwdt(struct acpi_gtdt_watchdog *wd,
ca9ae5ec4ef0ed Fu Wei       2017-04-01  329  					int index)
ca9ae5ec4ef0ed Fu Wei       2017-04-01  330  {
ca9ae5ec4ef0ed Fu Wei       2017-04-01  331  	struct platform_device *pdev;
1ecd5b12925224 Marc Zyngier 2021-04-21  332  	int irq;
ca9ae5ec4ef0ed Fu Wei       2017-04-01  333  
ca9ae5ec4ef0ed Fu Wei       2017-04-01  334  	/*
ca9ae5ec4ef0ed Fu Wei       2017-04-01  335  	 * According to SBSA specification the size of refresh and control
ca9ae5ec4ef0ed Fu Wei       2017-04-01  336  	 * frames of SBSA Generic Watchdog is SZ_4K(Offset 0x000 – 0xFFF).
ca9ae5ec4ef0ed Fu Wei       2017-04-01  337  	 */
ca9ae5ec4ef0ed Fu Wei       2017-04-01  338  	struct resource res[] = {
ca9ae5ec4ef0ed Fu Wei       2017-04-01  339  		DEFINE_RES_MEM(wd->control_frame_address, SZ_4K),
ca9ae5ec4ef0ed Fu Wei       2017-04-01  340  		DEFINE_RES_MEM(wd->refresh_frame_address, SZ_4K),
1ecd5b12925224 Marc Zyngier 2021-04-21  341  		{},
ca9ae5ec4ef0ed Fu Wei       2017-04-01  342  	};
ca9ae5ec4ef0ed Fu Wei       2017-04-01  343  	int nr_res = ARRAY_SIZE(res);
ca9ae5ec4ef0ed Fu Wei       2017-04-01  344  
ca9ae5ec4ef0ed Fu Wei       2017-04-01  345  	pr_debug("found a Watchdog (0x%llx/0x%llx gsi:%u flags:0x%x).\n",
ca9ae5ec4ef0ed Fu Wei       2017-04-01  346  		 wd->refresh_frame_address, wd->control_frame_address,
ca9ae5ec4ef0ed Fu Wei       2017-04-01  347  		 wd->timer_interrupt, wd->timer_flags);
ca9ae5ec4ef0ed Fu Wei       2017-04-01  348  
ca9ae5ec4ef0ed Fu Wei       2017-04-01  349  	if (!(wd->refresh_frame_address && wd->control_frame_address)) {
ca9ae5ec4ef0ed Fu Wei       2017-04-01  350  		pr_err(FW_BUG "failed to get the Watchdog base address.\n");
ca9ae5ec4ef0ed Fu Wei       2017-04-01  351  		return -EINVAL;
ca9ae5ec4ef0ed Fu Wei       2017-04-01  352  	}
ca9ae5ec4ef0ed Fu Wei       2017-04-01  353  
1ecd5b12925224 Marc Zyngier 2021-04-21  354  	irq = map_gt_gsi(wd->timer_interrupt, wd->timer_flags);
1ecd5b12925224 Marc Zyngier 2021-04-21 @355  	res[2] = (struct resource)DEFINE_RES_IRQ(irq);
ca9ae5ec4ef0ed Fu Wei       2017-04-01  356  	if (irq <= 0) {
ca9ae5ec4ef0ed Fu Wei       2017-04-01  357  		pr_warn("failed to map the Watchdog interrupt.\n");
ca9ae5ec4ef0ed Fu Wei       2017-04-01  358  		nr_res--;
ca9ae5ec4ef0ed Fu Wei       2017-04-01  359  	}
ca9ae5ec4ef0ed Fu Wei       2017-04-01  360  
ca9ae5ec4ef0ed Fu Wei       2017-04-01  361  	/*
ca9ae5ec4ef0ed Fu Wei       2017-04-01  362  	 * Add a platform device named "sbsa-gwdt" to match the platform driver.
ca9ae5ec4ef0ed Fu Wei       2017-04-01  363  	 * "sbsa-gwdt": SBSA(Server Base System Architecture) Generic Watchdog
ca9ae5ec4ef0ed Fu Wei       2017-04-01  364  	 * The platform driver can get device info below by matching this name.
ca9ae5ec4ef0ed Fu Wei       2017-04-01  365  	 */
ca9ae5ec4ef0ed Fu Wei       2017-04-01  366  	pdev = platform_device_register_simple("sbsa-gwdt", index, res, nr_res);
ca9ae5ec4ef0ed Fu Wei       2017-04-01  367  	if (IS_ERR(pdev)) {
1ecd5b12925224 Marc Zyngier 2021-04-21  368  		if (irq > 0)
ca9ae5ec4ef0ed Fu Wei       2017-04-01  369  			acpi_unregister_gsi(wd->timer_interrupt);
ca9ae5ec4ef0ed Fu Wei       2017-04-01  370  		return PTR_ERR(pdev);
ca9ae5ec4ef0ed Fu Wei       2017-04-01  371  	}
ca9ae5ec4ef0ed Fu Wei       2017-04-01  372  
ca9ae5ec4ef0ed Fu Wei       2017-04-01  373  	return 0;
ca9ae5ec4ef0ed Fu Wei       2017-04-01  374  }
ca9ae5ec4ef0ed Fu Wei       2017-04-01  375  

:::::: The code at line 355 was first introduced by commit
:::::: 1ecd5b129252249b9bc03d7645a7bda512747277 ACPI: GTDT: Don't corrupt interrupt mappings on watchdow probe failure

:::::: TO: Marc Zyngier <maz@kernel.org>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
