Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4491F7085
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Feb 2025 14:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738505097; cv=none; b=bsiEPUlNFVOjwurfHlddw1uqub9VowU1TiFSbTdnMGQuBgC042UbShBoaj2kwL2ju9EwgYsdNefGjuvLFQIQCwIstYneDzf+AwxghhTDIytMis8qVEI9LjoVd1TPs2pB8cfjKE0Gf91YtHaHUOnrXsPGybvmRaJuemKSFiBTAuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738505097; c=relaxed/simple;
	bh=6PYjmxWpcAN8Um06ZhtjNj9iMjXnuu3Vcv+ohXvMwYo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AM2yieWXCh39avFxJSIOvKILZGfxt6F9UHYlocpVsyfbYV1mwFDGq5n649ezk6Dh7TLrV1kE7hXNjxqpccB1FcTPqHIR3ET1VpyvQZvpommDk8wvyXjjVafR8qERor5A+H8fB+jIsFGAiKzLqQiHVEN/46g7xAwIF0KPCq7+IXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xwtj/SKX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xwtj/SKX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738505096; x=1770041096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6PYjmxWpcAN8Um06ZhtjNj9iMjXnuu3Vcv+ohXvMwYo=;
  b=Xwtj/SKXDt15XvN80Ji4lf0LVvrDpUgQtScrTG1X2bNjmx8OkWSu99g9
   7qa3YUKR579mU5pUB7GpAVi5aqcvgqFqZyojqy9ZG+AugYlrZvSMhhHDq
   jwCRje2pLhjSRbX/W7LFMlABCLsZnZSfcpebIiRWabPc8/4fUzxGy2V4r
   ReFfifSjNe+BwIHvJQib+D72efCy4WAQKGBE9Vt4BF11XsJdFdFYLq+Wm
   CweZH5cC/cr95ZwbpavzXI2XJ3gJfWnEg2laHIbrQ5VPocBlkUAd2X6Nq
   r68ZXTSXMqeNfkx3iWtpXqNMPodrX73xFhwRWAGA0zKZ7neAx+YZ9aiP7
   g==;
X-CSE-ConnectionGUID: MCvx4y73QtiVH9I2WPMMsg==
X-CSE-MsgGUID: hRtTnIhQTu6ITZKPLgk4/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="38915377"
X-IronPort-AV: E=Sophos;i="6.13,254,1732608000"; 
   d="scan'208";a="38915377"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 06:04:54 -0800
X-CSE-ConnectionGUID: GSYVoi5eQ4qisn7+j/7ZFw==
X-CSE-MsgGUID: Yo4gUvuvSOykNMCBg8MWbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115207254"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Feb 2025 06:04:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teaag-000pk1-0S;
	Sun, 02 Feb 2025 14:04:50 +0000
Date: Sun, 2 Feb 2025 22:04:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/of/unittest.c:1195 of_unittest_reg() error: uninitialized
 symbol 'addr'.
Message-ID: <202502022102.D4ESrh5e-lkp@intel.com>
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
head:   a86bf2283d2c9769205407e2b54777c03d012939
commit: 7b937cc243e5b1df8780a0aa743ce800df6c68d1 of: Create of_root if no dtb provided by firmware
date:   11 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 11 months ago
config: sparc64-randconfig-r073-20250202 (https://download.01.org/0day-ci/archive/20250202/202502022102.D4ESrh5e-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502022102.D4ESrh5e-lkp@intel.com/

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
