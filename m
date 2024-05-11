Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1AF657D9
	for <oe-kbuild@lists.linux.dev>; Sat, 11 May 2024 22:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715465068; cv=none; b=EoaEYQJo6LgctD3goQys//YrqHid2nWtd/1chY1RGjBLkUivd3LwnfkUFQZmQmPTQpGT8Q04P4PSdrhuvM+aPapwdFT0CxsgPZGgT8oeZw7QVITF8pW7uMExPFfkFsnXX2Wv6+a2MiNMP7D3iVY3lzFn4zMb63ifuNP93MHkmpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715465068; c=relaxed/simple;
	bh=e/Bq4Qfar8pZ54kInVVaS+3CMD9OWqPveiXmBMpPvsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TF7MUPzOYxqAIWUlFQ5cZ0L2vCAlfXUDPRIO5lx6vIFCkdLvXAwLqLNex/xoqLFa0aEi2YXUyRWtUnafFxpZ+4n47kuFBAcmPcfBj2CNb0t/W/XUY9WFa7A0z87MmgXXdRjtQhLDjSvYSpNxsUWMGwYvBLnAPDNK7sYgPzua8dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MVw0yRcc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MVw0yRcc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715465067; x=1747001067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e/Bq4Qfar8pZ54kInVVaS+3CMD9OWqPveiXmBMpPvsM=;
  b=MVw0yRccYTMMBi3F4rFbcQ9WbOkDredxIpFtd1R06Nk1d19MCMFT7jx0
   tlu3eNRdrifgBkZMM/w/mdhqhucQW6LjtStrbxtrY+K3v8hx3MZafE+Ao
   +peZK0sTElSsguTnwjfu+WaBa/5ll4CgG0mGVagcq8vjyid9JJtVrrbf0
   8woSOVnmvlQW/ZVhxGAJPQPKuZ8J62BYa5x7sSUNsjsrSGllKTBYaAdLy
   JSsNQTsXQEmrauabquHMgS2VcYZIksgGRKVi3aNurArcHHaX6QsYMHzfi
   fEqGNLYK0V/GPlZlANmV7Q+YmnzdwG98IVmwsUyZ3n+HBV9cjW/i1C7y4
   g==;
X-CSE-ConnectionGUID: 4+AMQSoxRVuQUoAJogq9vg==
X-CSE-MsgGUID: MkVy+v5YTOuD6uHJ5F7afA==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="11375903"
X-IronPort-AV: E=Sophos;i="6.08,154,1712646000"; 
   d="scan'208";a="11375903"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 15:04:27 -0700
X-CSE-ConnectionGUID: YWhyBI5XSXCJ8WVWp7w01w==
X-CSE-MsgGUID: JxZMP5CjTJ63lDO37/btYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,154,1712646000"; 
   d="scan'208";a="30080695"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 May 2024 15:04:25 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5upK-0007sj-2u;
	Sat, 11 May 2024 22:04:22 +0000
Date: Sun, 12 May 2024 06:04:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/of/unittest.c:1195 of_unittest_reg() error: uninitialized
 symbol 'addr'.
Message-ID: <202405120620.HFCq9U8K-lkp@intel.com>
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
head:   cf87f46fd34d6c19283d9625a7822f20d90b64a4
commit: 7b937cc243e5b1df8780a0aa743ce800df6c68d1 of: Create of_root if no dtb provided by firmware
date:   9 weeks ago
:::::: branch date: 24 hours ago
:::::: commit date: 9 weeks ago
config: sparc-randconfig-r081-20240512 (https://download.01.org/0day-ci/archive/20240512/202405120620.HFCq9U8K-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405120620.HFCq9U8K-lkp@intel.com/

New smatch warnings:
drivers/of/unittest.c:1195 of_unittest_reg() error: uninitialized symbol 'addr'.

Old smatch warnings:
drivers/of/unittest.c:854 of_unittest_changeset() error: potential null dereference 'n1'.  (__of_node_dup returns null)
drivers/of/unittest.c:855 of_unittest_changeset() error: potential null dereference 'n2'.  (__of_node_dup returns null)
drivers/of/unittest.c:856 of_unittest_changeset() error: potential null dereference 'n21'.  (__of_node_dup returns null)
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
