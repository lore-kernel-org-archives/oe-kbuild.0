Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587A13CAE79
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 11:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438465; cv=none; b=TCLBWN4ySmkQNUfdqIMs+FbEDA2arM/fN5H1+0dgSgLUK4jZ6VMF7UXqd5mrfKIj2p89X4kS60GVSAg+clCw2jY8v2HmD+TC6hww/cIuo6eQqC8UZTrEChIYcmi89kd6VyBZlRc4j+dx8gyiCSc7G7WkicNdq8ouDn2H0BO6Lz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438465; c=relaxed/simple;
	bh=qvHHicjs56tiriJIWrzzekf27YCHbq7wTCsUMMPvVbw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GuKDvpsDTiTwHB4V41zv4nI1u0XACJ4rq9sY6QvjU/D0fd8l/rMVFQMPcLZ1PjcKRPFato7Tvtds73qUD4PU52yTcBwTctVGigwr8fOVFex7kdCrTLJIanDNA8n5KFaxBkDI0awz8vMVtfLOuFM0VkVrLAmgwF1ET1+zeTlJJ4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QLS8Pq2r; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QLS8Pq2r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774438464; x=1805974464;
  h=date:from:to:cc:subject:message-id;
  bh=qvHHicjs56tiriJIWrzzekf27YCHbq7wTCsUMMPvVbw=;
  b=QLS8Pq2rlS2Tk0+ZmD3WRSz42dXF5WLJPp8fohZD7yp7nebdyrXrLnqr
   geYAYOJO68WhRprZSkGnxY5Prc+UAuKuWUqxiV0aeCJj7b66gIby2WMdS
   gYIEiRPdulz4c32vauzg3OMWoJsaK8SrCQ1kRdndwHEL7OrNlKTUpV0q8
   FiUvzpXhzPfZjtDyfAsbO8pAaIogPrTSFVPXJQPn1DLXZIWqGpl5lwKHJ
   fEqC+U1JMhpxWWaCKbap/hDfumM5mmI8on4ZpgysE0JafG1RGWnDWfa7m
   0gsHhMoRun6OH07CiCcrmc7OxpHQhGK9Aphn6PQf9w4SFM/kGtarFkCJ2
   w==;
X-CSE-ConnectionGUID: PSjA4ETcSZWd5v+Np2OGNw==
X-CSE-MsgGUID: UwbZ/ojuSUGpLEQHleEhtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75586208"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75586208"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 04:34:23 -0700
X-CSE-ConnectionGUID: d5y+R/cIQim4RsMoNJX/gg==
X-CSE-MsgGUID: VNn0eLgSSU+da/WUnzsXRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="218083510"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Mar 2026 04:33:28 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5MUG-000000006k7-404S;
	Wed, 25 Mar 2026 11:33:24 +0000
Date: Wed, 25 Mar 2026 19:32:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/of/unittest.c:1666 of_unittest_irq_refcount() warn:
 bitwise AND condition is false here
Message-ID: <202603251949.lhGr6twD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Zijun Hu <quic_zijuhu@quicinc.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bbeb83d3182abe0d245318e274e8531e5dd7a948
commit: 65f4be07ad1010f41dbe329398da881a38051c98 of: unittest: Add a case to test if API of_irq_parse_one() leaks refcount
date:   1 year, 1 month ago
:::::: branch date: 12 hours ago
:::::: commit date: 1 year, 1 month ago
config: openrisc-randconfig-r073-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251949.lhGr6twD-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603251949.lhGr6twD-lkp@intel.com/

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
