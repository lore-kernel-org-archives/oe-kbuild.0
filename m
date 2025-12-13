Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0290323AE87
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 06:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765605613; cv=none; b=Ob4cXdPLbrLW04l1HFhGGzVeolBa2kjzaoASSwAgPgklP2QDz08QeCT2kFGls59gyhasJHdPbktTQS/Txq+aj4VlnK3bz1v5/EzEuO/mtB1RLhuM6v1+BklEoPsqErjgINtzshUfxop5LlY/aS2F2BmhDjIrcwZ2BX+0p7m7SL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765605613; c=relaxed/simple;
	bh=6dEBlIfUkmzA8TLgjo0yNfC359lH4aUOwL1hnE20AI4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gSLmbnnj6xux6a/zQEYZkXfvJWOOz/W4RJUCxneZL2td1Cp2A8sevdeF3CyKQhsuADw67NOMJkeq7XLeLI79+cNexoUIrIxFuPY0TwpGToiADl3Lf809cvNTxg7VFtvg46AlaU+3rPX6ZTqVNrXtLMpvFuxsT1dxjjHFReBGtOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ioJwrWUr; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ioJwrWUr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765605610; x=1797141610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6dEBlIfUkmzA8TLgjo0yNfC359lH4aUOwL1hnE20AI4=;
  b=ioJwrWUrs8zfgKuGblL181IvZa613U+hWK5cLnV2OFydqBHa1dzJMxxo
   X+zjLDfvbj6UjUwsH5yKSnaMnppVu2TC2M/g23MDE7twXPxM6hNy9H3ur
   MKI373tn9to1r3k8OT3QaBt/g3xkVTNlWcNnRQYjgIaX1euzAFZSkDYdD
   Z4hLrsdHgbS8oLVCMn8aNWynTPTidXNklrEcRB4ll3DpfABksfPYYmyDd
   ev2nh1tUHbU84rR3SJ2SfS+Enf0JirMC4v9Ph0U/uQrkNaziYFrd4yv9t
   rfe7YdUrkJYK43xdU1jXY/MImSfUGA3FlNrQe0CuAEzHlBdA2nDKNzsMI
   w==;
X-CSE-ConnectionGUID: uUuTeyKCRT+HJyyXBE5QFA==
X-CSE-MsgGUID: sumfIlJgQgeTUu6qART55Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67479173"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="67479173"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 22:00:08 -0800
X-CSE-ConnectionGUID: CkPDWAn5RWa6HquOuoli3g==
X-CSE-MsgGUID: k4orUrF4QCGeMh1orTHg0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="201749927"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Dec 2025 22:00:07 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUIfk-0000000078e-1NbR;
	Sat, 13 Dec 2025 06:00:04 +0000
Date: Sat, 13 Dec 2025 13:59:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/of/unittest.c:1666 of_unittest_irq_refcount() warn: bitwise
 AND condition is false here
Message-ID: <202512131330.HE1OE4Zo-lkp@intel.com>
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
TO: Zijun Hu <quic_zijuhu@quicinc.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9551a26f17d9445eed497bd7c639d48dfc3c0af4
commit: 65f4be07ad1010f41dbe329398da881a38051c98 of: unittest: Add a case to test if API of_irq_parse_one() leaks refcount
date:   10 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 10 months ago
config: microblaze-randconfig-r073-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131330.HE1OE4Zo-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131330.HE1OE4Zo-lkp@intel.com/

New smatch warnings:
drivers/of/unittest.c:1666 of_unittest_irq_refcount() warn: bitwise AND condition is false here

Old smatch warnings:
drivers/of/unittest.c:860 of_unittest_changeset() error: potential null dereference 'n1'.  (__of_node_dup returns null)
drivers/of/unittest.c:861 of_unittest_changeset() error: potential null dereference 'n2'.  (__of_node_dup returns null)
drivers/of/unittest.c:862 of_unittest_changeset() error: potential null dereference 'n21'.  (__of_node_dup returns null)
drivers/of/unittest.c:1506 of_unittest_parse_interrupts() warn: bitwise AND condition is false here
drivers/of/unittest.c:1583 of_unittest_parse_interrupts_extended() warn: bitwise AND condition is false here
drivers/of/unittest.c:1789 of_unittest_platform_populate() warn: bitwise AND condition is false here
drivers/of/unittest.c:3972 of_unittest_overlay_high_level() error: uninitialized symbol 'overlay_base_symbols'.

vim +1666 drivers/of/unittest.c

79d9701559a9f3 drivers/of/selftest.c Grant Likely 2013-09-19  1656  
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1657  #if IS_ENABLED(CONFIG_OF_DYNAMIC)
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1658  static void __init of_unittest_irq_refcount(void)
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1659  {
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1660  	struct of_phandle_args args;
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1661  	struct device_node *intc0, *int_ext0;
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1662  	unsigned int ref_c0, ref_c1, ref_c2;
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1663  	int rc;
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1664  	bool passed;
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1665  
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09 @1666  	if (of_irq_workarounds & OF_IMAP_OLDWORLD_MAC)
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1667  		return;
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1668  
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1669  	intc0 = of_find_node_by_path("/testcase-data/interrupts/intc0");
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1670  	int_ext0 = of_find_node_by_path("/testcase-data/interrupts/interrupts-extended0");
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1671  	if (!intc0 || !int_ext0) {
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1672  		pr_err("missing testcase data\n");
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1673  		goto out;
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1674  	}
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1675  
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1676  	/* Test refcount for API of_irq_parse_one() */
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1677  	passed = true;
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1678  	ref_c0 = OF_KREF_READ(intc0);
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1679  	ref_c1 = ref_c0 + 1;
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1680  	memset(&args, 0, sizeof(args));
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1681  	rc = of_irq_parse_one(int_ext0, 0, &args);
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1682  	ref_c2 = OF_KREF_READ(intc0);
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1683  	of_node_put(args.np);
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1684  
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1685  	passed &= !rc;
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1686  	passed &= (args.np == intc0);
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1687  	passed &= (args.args_count == 1);
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1688  	passed &= (args.args[0] == 1);
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1689  	passed &= (ref_c1 == ref_c2);
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1690  	unittest(passed, "IRQ refcount case #1 failed, original(%u) expected(%u) got(%u)\n",
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1691  		 ref_c0, ref_c1, ref_c2);
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1692  
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1693  out:
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1694  	of_node_put(int_ext0);
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1695  	of_node_put(intc0);
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1696  }
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1697  #else
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1698  static inline void __init of_unittest_irq_refcount(void) { }
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1699  #endif
65f4be07ad1010 drivers/of/unittest.c Zijun Hu     2025-02-09  1700  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
