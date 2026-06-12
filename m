Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDAB296BBA
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jun 2026 17:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781286432; cv=none; b=CCLtO7XJrTPIFwzt8+5/6WKOKCuV3N2NcxFRpiHsdKADJKbDuwzzkI58r4fGwgMPNy/8AgAsD18s6TTH1saVzWw+bDCqBAGA6pzpId6uIK9OwQEcN657xICv0xsoj/Y8Zk1wTlRne7/+YKcTFsnWVc8gf1AO/a/OJ1wNkTiohVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781286432; c=relaxed/simple;
	bh=aG6KMf10TQXTBQRdQEJchZ9vQgS2/D6n4+f0/Dx45dU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fTF0ePCmsUitazIG+cqyqw+xDQuqZcx/lW0ZPpS2qfq9S5saM0sF6c1XbNO+aEM1F/O2r9ZiBftfkWOll9Ys+JZCf43uspT9s/SxbVQds/Yq6t7uBswIEIo55Aq2jOLbWcdQ3Vta8geoVaRFuONCJ3Qbj0mZKH+MWZLP0su225Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iqsRqQU1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iqsRqQU1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781286431; x=1812822431;
  h=date:from:to:cc:subject:message-id;
  bh=aG6KMf10TQXTBQRdQEJchZ9vQgS2/D6n4+f0/Dx45dU=;
  b=iqsRqQU1QHPb9BPpG0SQmA9oVLZjvRmBRgkIyvMlznrEklRoeViWyAhR
   UY8n+Ehk2h8e1lvA1tPmkSFEDbgll8OuUYRw86mDoanFhOvL9uyigGgew
   eQpunAQx9ITp0qy7timqwWMNVP8kMcOiScKz2CRfiXT4hyXijPNMRttvm
   cuDhkoTf3nMufS4hkwC4bSHOj8/Tx50z1hW4jISr5RijqBqX0uuB/C3Ts
   vpCqa2cdiOUmbOA+sGnC9vWH9APwbdpQyWMtt1s7AFBGnft5Fi+oJWVS9
   DI3/7Sk+TDV6C/WRr/+f/lSCcxRrBbgwCaQenMNQVhogjCtwYgfe0izwM
   Q==;
X-CSE-ConnectionGUID: iL8T/b3kTFmkCZoohIfhuQ==
X-CSE-MsgGUID: dGP6XyBATQGiVE9ZRonBGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="82312363"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="82312363"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 10:47:10 -0700
X-CSE-ConnectionGUID: cZo3f1ISSOa3ps3FSPQrEg==
X-CSE-MsgGUID: dYkAZZW0RAagR5ed4jDj8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="242733291"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Jun 2026 10:47:08 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY5yD-00000000P9N-47oM;
	Fri, 12 Jun 2026 17:47:05 +0000
Date: Sat, 13 Jun 2026 01:46:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [geert-renesas-devel:renesas-drivers-for-v6.20 3/6]
 drivers/of/unittest.c:1701 of_unittest_parse_interrupt_map() warn: bitwise
 AND condition is false here
Message-ID: <202606130103.yIeRERLX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-renesas-soc@vger.kernel.org
TO: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: "Rob Herring (Arm)" <robh@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v6.20
head:   49261f479d45714692587ff0abe0c5279c6068d6
commit: a9811aeb42f85bd423725996ef7dce5cd51f8ff7 [3/6] of: unittest: Add a test case for for_each_of_imap_item iterator
:::::: branch date: 5 months ago
:::::: commit date: 5 months ago
config: csky-randconfig-r073-20260611 (https://download.01.org/0day-ci/archive/20260613/202606130103.yIeRERLX-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606130103.yIeRERLX-lkp@intel.com/

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
