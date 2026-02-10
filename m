Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8ACB26ED3E
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 05:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770702933; cv=none; b=lAMX+MgWqJG4SYcMwCdowPmmDdByYw5cC7U8tK5G484rLcjp3lrWV6qyG8GggcvC/b5oJvGg94BA+YU/qLkDJtoR9GO920SWcgXqZOzC0PQYRTVZf7joMvjEUhTpYQ2p+kSOTJ6LONfN6Bb5zh6m0/83weVpNTKEXPvGYiOUMhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770702933; c=relaxed/simple;
	bh=zEDfSdh1KPJqrv1rHuiALbd4UYgLoN55bU0AQo4i8jU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kRmSrigqxu3EguL0d2aWCdZsEsmC1RGc5ovr7CT33G71mGj7+9sk23+iO34NYryzUSMaUz6YAJRg4DN7E/mp680PMcjZoIQ2TNu9G18ZJilGHkxuR0c4fDRT8ZESjK6JLIC4WDpmW4fDpD2O1QNDB6n5zKxfPW7rqNZS4paO1LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KRtGNvQr; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KRtGNvQr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770702932; x=1802238932;
  h=date:from:to:cc:subject:message-id;
  bh=zEDfSdh1KPJqrv1rHuiALbd4UYgLoN55bU0AQo4i8jU=;
  b=KRtGNvQrFQvue5W9engnwkZe/WOZLsAYgOFfM11bbsvCmx4+to7cpvRh
   PKR14wvkexNnYhOznXBl+IyLDWgdwb4pe/couy05Q/w3DJqbHCiIU5ygt
   eSPMGLHwTGZITwaz/15RB82L1TGIIcKa8q4AMLqa12/pIYs11CdTE3q2R
   8Ke/Gusr6pWwj0xmXD8B/XNg/SQnOMdAez0jKTbSkdJZdzS85P9SN/Wj+
   md6UNRDS2UyIubHksVyurLUS9QGaAPPxf1UzoKn/96Msu8vPPazJiJOr5
   VtsgTiOTGDYMrXNPBhCR3ku9iX0UQIo5Th1L59gzmhNxu94k/q6oHFNC5
   g==;
X-CSE-ConnectionGUID: oD/emAyxRDqAX3Rr/C6oXA==
X-CSE-MsgGUID: 1SfhW3YLQPiJsV0f0mNcMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82552832"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82552832"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 21:55:26 -0800
X-CSE-ConnectionGUID: 2G2EuYqxQPCppc4PhZDzxQ==
X-CSE-MsgGUID: AKVY0+n7Qp++tk1E4WXq4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211845857"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Feb 2026 21:55:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpgiY-00000000ogY-0JvU;
	Tue, 10 Feb 2026 05:55:22 +0000
Date: Tue, 10 Feb 2026 13:54:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5665/12313] drivers/of/unittest.c:1701
 of_unittest_parse_interrupt_map() warn: bitwise AND condition is false here
Message-ID: <202602101359.TShamc7y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: "Rob Herring (Arm)" <robh@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   132737e360b4c0daa7f473faf0f55cb04ee3e15c
commit: a9811aeb42f85bd423725996ef7dce5cd51f8ff7 [5665/12313] of: unittest: Add a test case for for_each_of_imap_item iterator
:::::: branch date: 13 hours ago
:::::: commit date: 4 weeks ago
config: riscv-randconfig-r072-20260209 (https://download.01.org/0day-ci/archive/20260210/202602101359.TShamc7y-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602101359.TShamc7y-lkp@intel.com/

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
