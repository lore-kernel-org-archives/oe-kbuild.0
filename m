Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36FD257D
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Feb 2025 03:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739245325; cv=none; b=A1GyMBoA2U9wmzGReixEw4x1aYQ6UJsoUBajlqUoRChW88E6AcZIGZTCpGb/CjgN6wPl+WBm0WYrOWi4nxKiGzNii/F0n1cmwXGqCtWICPe50w0nVJnv1Kl5ubhzHwoJnfQ228nCgnPYAmDaz5XdvRSo3qXnWEUEDWYyMT+eUeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739245325; c=relaxed/simple;
	bh=3MXh6f5yqG1I2QadBzwjj4f32y/TnbEUbg15Ta1xlmU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ShndReWX9CkjY/0Tyvxy4wdPcm8bYjZWj/AEGrIagMCuvPfvTLnyF3B4l79XPdjoTl7OCVusZWJ17SEdUUrwAkarg6dFD6rTiUzdPzMh52/s76fH1ipGVz3HV7Vk3FJGoHdsxvodRW7iSvKnBZhcYSO7t/YL/gSE+Tqq7gcqTbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z6HFcIR6; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z6HFcIR6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739245323; x=1770781323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3MXh6f5yqG1I2QadBzwjj4f32y/TnbEUbg15Ta1xlmU=;
  b=Z6HFcIR6hP6C/cyZpT7MgVe4GrAmtlvWLr0WjcONOTZrz8+0rUYGkoMw
   rt7WE+ccTSXqIzj7hueXJ7UBx0zZJSrK4MjJQxqR8b9HSzfjSbQdvVYzq
   QtDR2bAnyyQLS6QBqhPo+4r35WqWH6FhsTila0yu1mfl/7HnLmGFlLlEf
   J/GD/PkkfK79ZhhxRWJqqw/Cf6fFRyICGFA3XN303S2UtdRU8rIAgdqNj
   qaNxDfIWzLRxh59i3DedDCi9+QfhI2b2Q9F/rpii8999dx5xwoNzqi7Y8
   lRzGv11BJr5kMSEOFehPRWjFaNU9O1WM43XEl8xiXAGqKKZ7A/nvLGdA7
   w==;
X-CSE-ConnectionGUID: lCWnV81ZSkCWzzogHIao6A==
X-CSE-MsgGUID: wJ9pku4rRq+nuXIwwmgGBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="42689560"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="42689560"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 19:42:02 -0800
X-CSE-ConnectionGUID: MMrL2MOrRr6pmPJuJi1i2Q==
X-CSE-MsgGUID: 3uP0TeUjSrGCz6BEFy5VTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143286251"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Feb 2025 19:42:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thh9r-0013jN-0h;
	Tue, 11 Feb 2025 03:41:59 +0000
Date: Tue, 11 Feb 2025 11:41:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 1/9] of: unittest: Add a case to test if API
 of_irq_parse_one() leaks refcount
Message-ID: <202502111101.wvFYNHt4-lkp@intel.com>
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
In-Reply-To: <20250209-of_irq_fix-v2-1-93e3a2659aa7@quicinc.com>
References: <20250209-of_irq_fix-v2-1-93e3a2659aa7@quicinc.com>
TO: Zijun Hu <zijun_hu@icloud.com>
TO: Rob Herring <robh@kernel.org>
TO: Saravana Kannan <saravanak@google.com>
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: Marc Zyngier <maz@kernel.org>
TO: Stefan Wiehler <stefan.wiehler@nokia.com>
TO: Tony Lindgren <tony@atomide.com>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Benjamin Herrenschmidt <benh@kernel.crashing.org>
TO: Julia Lawall <julia.lawall@inria.fr>
CC: Zijun Hu <zijun_hu@icloud.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Zijun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 40fc0083a9dbcf2e81b1506274cb541f84d022ed]

url:    https://github.com/intel-lab-lkp/linux/commits/Zijun-Hu/of-unittest-Add-a-case-to-test-if-API-of_irq_parse_one-leaks-refcount/20250209-210337
base:   40fc0083a9dbcf2e81b1506274cb541f84d022ed
patch link:    https://lore.kernel.org/r/20250209-of_irq_fix-v2-1-93e3a2659aa7%40quicinc.com
patch subject: [PATCH v2 1/9] of: unittest: Add a case to test if API of_irq_parse_one() leaks refcount
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: um-randconfig-r072-20250211 (https://download.01.org/0day-ci/archive/20250211/202502111101.wvFYNHt4-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502111101.wvFYNHt4-lkp@intel.com/

New smatch warnings:
drivers/of/unittest.c:1666 of_unittest_irq_refcount() warn: bitwise AND condition is false here

Old smatch warnings:
drivers/of/unittest.c:860 of_unittest_changeset() error: potential null dereference 'n1'.  (__of_node_dup returns null)
drivers/of/unittest.c:861 of_unittest_changeset() error: potential null dereference 'n2'.  (__of_node_dup returns null)
drivers/of/unittest.c:862 of_unittest_changeset() error: potential null dereference 'n21'.  (__of_node_dup returns null)
drivers/of/unittest.c:1506 of_unittest_parse_interrupts() warn: bitwise AND condition is false here
drivers/of/unittest.c:1583 of_unittest_parse_interrupts_extended() warn: bitwise AND condition is false here
drivers/of/unittest.c:1789 of_unittest_platform_populate() warn: bitwise AND condition is false here

vim +1666 drivers/of/unittest.c

79d9701559a9f3 drivers/of/selftest.c Grant Likely 2013-09-19  1656  
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1657  #if IS_ENABLED(CONFIG_OF_DYNAMIC)
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1658  static void __init of_unittest_irq_refcount(void)
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1659  {
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1660  	struct of_phandle_args args;
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1661  	struct device_node *intc0, *int_ext0;
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1662  	unsigned int ref_c0, ref_c1, ref_c2;
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1663  	int rc;
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1664  	bool passed;
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1665  
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09 @1666  	if (of_irq_workarounds & OF_IMAP_OLDWORLD_MAC)
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1667  		return;
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1668  
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1669  	intc0 = of_find_node_by_path("/testcase-data/interrupts/intc0");
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1670  	int_ext0 = of_find_node_by_path("/testcase-data/interrupts/interrupts-extended0");
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1671  	if (!intc0 || !int_ext0) {
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1672  		pr_err("missing testcase data\n");
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1673  		goto out;
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1674  	}
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1675  
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1676  	/* Test refcount for API of_irq_parse_one() */
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1677  	passed = true;
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1678  	ref_c0 = OF_KREF_READ(intc0);
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1679  	ref_c1 = ref_c0 + 1;
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1680  	memset(&args, 0, sizeof(args));
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1681  	rc = of_irq_parse_one(int_ext0, 0, &args);
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1682  	ref_c2 = OF_KREF_READ(intc0);
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1683  	of_node_put(args.np);
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1684  
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1685  	passed &= !rc;
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1686  	passed &= (args.np == intc0);
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1687  	passed &= (args.args_count == 1);
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1688  	passed &= (args.args[0] == 1);
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1689  	passed &= (ref_c1 == ref_c2);
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1690  	unittest(passed, "IRQ refcount case #1 failed, original(%u) expected(%u) got(%u)\n",
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1691  		 ref_c0, ref_c1, ref_c2);
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1692  
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1693  out:
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1694  	of_node_put(int_ext0);
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1695  	of_node_put(intc0);
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1696  }
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1697  #else
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1698  static inline void __init of_unittest_irq_refcount(void) { }
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1699  #endif
86ad4e0f0baac9 drivers/of/unittest.c Zijun Hu     2025-02-09  1700  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
