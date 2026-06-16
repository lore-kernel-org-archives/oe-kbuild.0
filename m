Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535FF37C91E
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Jun 2026 02:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781578285; cv=none; b=g8pxQSrUvP6cjGIkku2SlptCoDY/8Gmy/cPx3jhQzhHk1jcQ9chE7DUOxsj0jFtN2MwcK9bL2ULFsV4I+ZVx3GC+kRzV2CK8KZk9MGWXJXQbRQCwgH+QHLdbRQjXr/f5CpZa/6IuP82IT+RUJmTfeBPAxwRC8zhidRYxFe+1/rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781578285; c=relaxed/simple;
	bh=F8dSmJQeT+hqBW891rHVuZRpx6sO6iwGQWukfjU9xUA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mSs748u3Hpf16xFNd+PiMsYlfUX6myv4UBk5E+xIRHD2CtaoOMm/tm9SahFsxoBi0jQkw80On6FYO2BkXfNG5D6qHq3kvFutLxpWr+IS3Hu1FinDDpeMIFIU869njyqfUyYJUkWnovfyvqYQMHY3+tmFH+yZxQpXjybyEjtsJKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JndHMIGO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JndHMIGO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781578284; x=1813114284;
  h=date:from:to:cc:subject:message-id;
  bh=F8dSmJQeT+hqBW891rHVuZRpx6sO6iwGQWukfjU9xUA=;
  b=JndHMIGObqtw5ZIw8NLcNuRTnId+3JvEVsc2e9fOphHQ0IIzArg6Cb4D
   dtT9B3bcnUsRB/2UR70gA4hFap9Krg+ti9V4LcsBwYe5PC5GkfTokJc/J
   QKmMVoVE06Soy03/ZkMsBCuXRo0sWfPxAC2vigkB7xwkt/nJX5xC7cO3r
   w+lQRK2xo4zc+VCZ1MOXiCHbasOTU1LDIu11FT6S9onOadjWfU7nePwik
   b5ffQ8N31u0N738yJg+BzIgD52g/K2rcHPdGw7l+z0a3wLzIIBjfMZBMZ
   zT2DHPE7IQXp3vvthZ4TbxLvySESbP37AzMmW+5iqI2WmSWkSZj/43NtT
   A==;
X-CSE-ConnectionGUID: x+l+c6AFSXaCObgRKGdslA==
X-CSE-MsgGUID: qE2Une0ZT7aeEK2vIbtCmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="93716941"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="93716941"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 19:51:23 -0700
X-CSE-ConnectionGUID: pNrcbgbSQvyZKNhrXTwmdw==
X-CSE-MsgGUID: Ccdilqw8S7yStJKmw+CvMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="246747410"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Jun 2026 19:51:21 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZJtW-00000000SeH-2I3I;
	Tue, 16 Jun 2026 02:51:18 +0000
Date: Tue, 16 Jun 2026 10:50:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/of/unittest.c:1701 of_unittest_parse_interrupt_map()
 warn: bitwise AND condition is false here
Message-ID: <202606161001.UDQvPtia-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: "Rob Herring (Arm)" <robh@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e0611827f3349d0a2ac121c023a6d3260dcecdb
commit: a9811aeb42f85bd423725996ef7dce5cd51f8ff7 of: unittest: Add a test case for for_each_of_imap_item iterator
date:   5 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 5 months ago
config: csky-randconfig-r073-20260611 (https://download.01.org/0day-ci/archive/20260616/202606161001.UDQvPtia-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a9811aeb42f8 ("of: unittest: Add a test case for for_each_of_imap_item iterator")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606161001.UDQvPtia-lkp@intel.com/

New smatch warnings:
drivers/of/unittest.c:1701 of_unittest_parse_interrupt_map() warn: bitwise AND condition is false here

Old smatch warnings:
drivers/of/unittest.c:860 of_unittest_changeset() error: potential null dereference 'n1'.  (__of_node_dup returns null)
drivers/of/unittest.c:861 of_unittest_changeset() error: potential null dereference 'n2'.  (__of_node_dup returns null)
drivers/of/unittest.c:862 of_unittest_changeset() error: potential null dereference 'n21'.  (__of_node_dup returns null)
drivers/of/unittest.c:1506 of_unittest_parse_interrupts() warn: bitwise AND condition is false here
drivers/of/unittest.c:1583 of_unittest_parse_interrupts_extended() warn: bitwise AND condition is false here
drivers/of/unittest.c:1782 of_unittest_irq_refcount() warn: bitwise AND condition is false here
drivers/of/unittest.c:1926 of_unittest_platform_populate() warn: bitwise AND condition is false here

vim +1701 drivers/of/unittest.c

a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1692) 
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1693) static void __init of_unittest_parse_interrupt_map(void)
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1694) {
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1695) 	const struct of_unittest_expected_imap_item *expected_item;
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1696) 	struct device_node *imap_np, *expected_parent_np;
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1697) 	struct of_imap_parser imap_parser;
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1698) 	struct of_imap_item imap_item;
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1699) 	int count, ret, i;
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1700) 
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14 @1701) 	if (of_irq_workarounds & (OF_IMAP_NO_PHANDLE | OF_IMAP_OLDWORLD_MAC))
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1702) 		return;
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1703) 
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1704) 	imap_np = of_find_node_by_path("/testcase-data/interrupts/intmap2");
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1705) 	if (!imap_np) {
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1706) 		pr_err("missing testcase data\n");
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1707) 		return;
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1708) 	}
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1709) 
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1710) 	ret = of_imap_parser_init(&imap_parser, imap_np, &imap_item);
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1711) 	if (unittest(!ret, "of_imap_parser_init(%pOF) returned error %d\n",
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1712) 		     imap_np, ret))
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1713) 		goto end;
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1714) 
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1715) 	expected_item = of_unittest_expected_imap_items;
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1716) 	count = 0;
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1717) 
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1718) 	for_each_of_imap_item(&imap_parser, &imap_item) {
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1719) 		if (unittest(count < ARRAY_SIZE(of_unittest_expected_imap_items),
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1720) 			     "imap item number %d not expected. Max number %zu\n",
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1721) 			     count, ARRAY_SIZE(of_unittest_expected_imap_items) - 1)) {
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1722) 			of_node_put(imap_item.parent_args.np);
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1723) 			goto end;
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1724) 		}
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1725) 
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1726) 		expected_parent_np = of_find_node_by_path(expected_item->parent_path);
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1727) 		if (unittest(expected_parent_np,
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1728) 			     "missing dependent testcase data (%s)\n",
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1729) 			     expected_item->parent_path)) {
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1730) 			of_node_put(imap_item.parent_args.np);
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1731) 			goto end;
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1732) 		}
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1733) 
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1734) 		unittest(imap_item.child_imap_count == expected_item->child_imap_count,
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1735) 			 "imap[%d] child_imap_count = %u, expected %u\n",
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1736) 			 count, imap_item.child_imap_count,
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1737) 			 expected_item->child_imap_count);
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1738) 
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1739) 		for (i = 0; i < expected_item->child_imap_count; i++)
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1740) 			unittest(imap_item.child_imap[i] == expected_item->child_imap[i],
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1741) 				 "imap[%d] child_imap[%d] = %u, expected %u\n",
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1742) 				 count, i, imap_item.child_imap[i],
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1743) 				 expected_item->child_imap[i]);
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1744) 
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1745) 		unittest(imap_item.parent_args.np == expected_parent_np,
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1746) 			 "imap[%d] parent np = %pOF, expected %pOF\n",
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1747) 			 count, imap_item.parent_args.np, expected_parent_np);
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1748) 
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1749) 		unittest(imap_item.parent_args.args_count == expected_item->parent_args_count,
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1750) 			 "imap[%d] parent param_count = %d, expected %d\n",
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1751) 			 count, imap_item.parent_args.args_count,
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1752) 			 expected_item->parent_args_count);
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1753) 
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1754) 		for (i = 0; i < expected_item->parent_args_count; i++)
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1755) 			unittest(imap_item.parent_args.args[i] == expected_item->parent_args[i],
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1756) 				 "imap[%d] parent param[%d] = %u, expected %u\n",
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1757) 				 count, i, imap_item.parent_args.args[i],
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1758) 				 expected_item->parent_args[i]);
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1759) 
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1760) 		of_node_put(expected_parent_np);
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1761) 		count++;
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1762) 		expected_item++;
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1763) 	}
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1764) 
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1765) 	unittest(count == ARRAY_SIZE(of_unittest_expected_imap_items),
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1766) 		 "Missing items. %d parsed, expected %zu\n",
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1767) 		 count, ARRAY_SIZE(of_unittest_expected_imap_items));
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1768) end:
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1769) 	of_node_put(imap_np);
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1770) }
a9811aeb42f85b Herve Codina (Schneider Electric  2026-01-14  1771) 

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
