Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282263234
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Sep 2024 03:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727061578; cv=none; b=XifNoMOK0+d6EjYrhzJSTUqvzt1bWCoVbonn3+eSmxRGpOxfwPKU48Exa0k9EpD6A4yoGf6LA/us4ihTi+r/CBL4yIf29SUa/RB6cWLeQxYXC++zJVptxBs1uJvsQcxATQ6pLwVB35K1E/fn5Jh+j/pJfx6DDprD8Rqc3ZsWa/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727061578; c=relaxed/simple;
	bh=f0UxFIEVVa1ti6R5jbcDQqbXRA7BhRV7QhrZwhIYzp0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QGKVDJz1zFZ9jpHFbuXSvcOH7maqWkcul0W5/bWRWPN8wufDwwWEZiAlvFFNKqIT6MICFoUx58yHjVUkXWZ9WnQLvcDVtxIrQ79/NohsDGUszpkwXP2IdDQ9OM5hX8/fwJ/jb6i0lNLCFXl3PlLo8Jl382rKJxV1lR8+blm+Rv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TtY2aNQ0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TtY2aNQ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727061576; x=1758597576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f0UxFIEVVa1ti6R5jbcDQqbXRA7BhRV7QhrZwhIYzp0=;
  b=TtY2aNQ0+vMBuxre5/2ae4OBHd93okz7aNaUdj/SwhcomRjC8buR0ooc
   c+modXil/DfvjGU6t/fKKGyYAg78X7uEzk2GabXwVnDs2zjAXjK8uN5Km
   YKFl1vrAWbl+Gs9/HubwYpoNwhlQmawkxaFX820oWJO5zeyAy3s+cCiw2
   wdm1nW1MmFRJ+WL8+ypoNV3W60bGenItWK7X5M6JolDmSZ3vv+NnqHfLL
   WfYmw3hJ9G9GjntWr1hohWuYIOa22cshKasKlxA0BA9T41b5Kkj/JiJ5j
   dnXiXWMGcKZvby3QG28PbJ+zrnZo1l+mXgQBTKM5TJ8u5nJcvquQ5/U42
   w==;
X-CSE-ConnectionGUID: 3pIgAgVfRgOqGeihgITJTA==
X-CSE-MsgGUID: t6dzCgSEQfKbqvEnABNoug==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="37363192"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="37363192"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 20:19:36 -0700
X-CSE-ConnectionGUID: s9zwE4vUTN+mKuqGb8MwoA==
X-CSE-MsgGUID: WOoI+zkZQVi7lAvc10RAvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="70526100"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Sep 2024 20:19:34 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssZbo-000GrK-0N;
	Mon, 23 Sep 2024 03:19:32 +0000
Date: Mon, 23 Sep 2024 11:18:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/of/unittest.c:1195 of_unittest_reg() error: uninitialized
 symbol 'addr'.
Message-ID: <202409231114.oQGOzohw-lkp@intel.com>
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
TO: Frank Rowand <frowand.list@gmail.com>
CC: Rob Herring <robh@kernel.org>
CC: Stephen Boyd <sboyd@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   de5cb0dcb74c294ec527eddfe5094acfdb21ff21
commit: 7b937cc243e5b1df8780a0aa743ce800df6c68d1 of: Create of_root if no dtb provided by firmware
date:   7 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 months ago
config: sparc-randconfig-r071-20240923 (https://download.01.org/0day-ci/archive/20240923/202409231114.oQGOzohw-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409231114.oQGOzohw-lkp@intel.com/

New smatch warnings:
drivers/of/unittest.c:1195 of_unittest_reg() error: uninitialized symbol 'addr'.

Old smatch warnings:
drivers/of/unittest.c:854 of_unittest_changeset() error: potential null dereference 'n1'.  (__of_node_dup returns null)
drivers/of/unittest.c:855 of_unittest_changeset() error: potential null dereference 'n2'.  (__of_node_dup returns null)
drivers/of/unittest.c:856 of_unittest_changeset() error: potential null dereference 'n21'.  (__of_node_dup returns null)
drivers/of/unittest.c:1007 of_unittest_pci_dma_ranges() warn: iterator 'i' not incremented
drivers/of/unittest.c:1283 of_unittest_parse_interrupts() warn: bitwise AND condition is false here
drivers/of/unittest.c:1360 of_unittest_parse_interrupts_extended() warn: bitwise AND condition is false here
drivers/of/unittest.c:1522 of_unittest_platform_populate() warn: bitwise AND condition is false here
drivers/of/unittest.c:3715 of_unittest_overlay_high_level() error: uninitialized symbol 'overlay_base_symbols'.

vim +/addr +1195 drivers/of/unittest.c

3d5089c4263d35 Rob Herring 2023-03-28  1179  
ff61bacd77f258 Rob Herring 2023-03-28  1180  static void __init of_unittest_reg(void)
ff61bacd77f258 Rob Herring 2023-03-28  1181  {
ff61bacd77f258 Rob Herring 2023-03-28  1182  	struct device_node *np;
ff61bacd77f258 Rob Herring 2023-03-28  1183  	int ret;
ff61bacd77f258 Rob Herring 2023-03-28  1184  	u64 addr, size;
ff61bacd77f258 Rob Herring 2023-03-28  1185  
ff61bacd77f258 Rob Herring 2023-03-28  1186  	np = of_find_node_by_path("/testcase-data/address-tests/bus@80000000/device@1000");
ff61bacd77f258 Rob Herring 2023-03-28  1187  	if (!np) {
ff61bacd77f258 Rob Herring 2023-03-28  1188  		pr_err("missing testcase data\n");
ff61bacd77f258 Rob Herring 2023-03-28  1189  		return;
ff61bacd77f258 Rob Herring 2023-03-28  1190  	}
ff61bacd77f258 Rob Herring 2023-03-28  1191  
ff61bacd77f258 Rob Herring 2023-03-28  1192  	ret = of_property_read_reg(np, 0, &addr, &size);
ff61bacd77f258 Rob Herring 2023-03-28  1193  	unittest(!ret, "of_property_read_reg(%pOF) returned error %d\n",
ff61bacd77f258 Rob Herring 2023-03-28  1194  		np, ret);
ff61bacd77f258 Rob Herring 2023-03-28 @1195  	unittest(addr == 0x1000, "of_property_read_reg(%pOF) untranslated address (%llx) incorrect\n",
ff61bacd77f258 Rob Herring 2023-03-28  1196  		np, addr);
ff61bacd77f258 Rob Herring 2023-03-28  1197  
ff61bacd77f258 Rob Herring 2023-03-28  1198  	of_node_put(np);
ff61bacd77f258 Rob Herring 2023-03-28  1199  }
ff61bacd77f258 Rob Herring 2023-03-28  1200  

:::::: The code at line 1195 was first introduced by commit
:::::: ff61bacd77f258bd2ed145efb69e5449b115d4fe of/address: Add of_property_read_reg() helper

:::::: TO: Rob Herring <robh@kernel.org>
:::::: CC: Rob Herring <robh@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
