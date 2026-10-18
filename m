Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698A13BD638
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Oct 2026 07:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309959; cv=none; b=Kg4fRIezLCnN8XoqaYcEa6PtrYv/lGNOOYeXWQsTp0Ey9nceOEEV+kqAGVO7u/tNJoskwZoSx/ga/OjA3tRce3C2cbpAWrRZ/InpbPOvVh0VDkr4cGRKAU4sfpKLSibnhKHl2bg0pBWW5yuoxgkP5CTMX1U69no3v4GrCageks4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309959; c=relaxed/simple;
	bh=ox2HGylzLJwLCESmQeHi9PVlXxBjFbvVdsPzb736RNQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p418KbJ8gdetI+XEph/2ri42Uk8GZny5I01YMBLxOhAavOW85wKPpPXTdFTrfVe7MIx5tzom8NMVkOXBkItlMq0QLPogcxsH598r13Gfwfpdu6paGOfqsTZoWaf/+vxvYhnvsnfGXmePgPlJb5wafA3njib1rxXBoCFD6xpYqSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nOhFykOx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nOhFykOx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309957; x=1823845957;
  h=date:from:to:cc:subject:message-id;
  bh=ox2HGylzLJwLCESmQeHi9PVlXxBjFbvVdsPzb736RNQ=;
  b=nOhFykOxgqdnbj9zgvHXqQx5C+YGlvzapygHrgpdnu+e7S9sMS/IlRqR
   8EN7q0Ym1n2ZgpFdI1UeF3cUowmqdL9Rvc61UlNJJA3a/m5ljMg/+duTW
   4zpaB9URcCjaoi5kl2krB4bnEujACFqCZeQg4v8DOW65TZFJcxCnBFg2I
   cVMCZsP4Lyd76/aku3jEjFRSSONn7Fk4bsLXmwWBM/4UMZQ3uc7v1rLCz
   +acYhZJ8Lc4xWeaWE60RU3f5eyLc2NNLbpjhxJklVTCt8A2CF3SoMr6wj
   AYyovJWae1fY1aHxJF7iRLYK4Sjj399sx1qvRrN6Np/PZzULsqblMsM5H
   w==;
X-CSE-ConnectionGUID: cFQqjjqhTEGXQOFHr3jhmg==
X-CSE-MsgGUID: K41Rky3YRKm9TfgjnR2whw==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="916666"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="916666"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:35 -0700
X-CSE-ConnectionGUID: QiWWtjB2SumySN3BCVuvHA==
X-CSE-MsgGUID: kfp3LC3UTqybTl4TnV6WRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2340765"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Oct 2026 00:52:33 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh1-000000004v1-1Y5l;
	Sun, 18 Oct 2026 07:52:31 +0000
Date: Sun, 18 Oct 2026 09:43:36 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12-kminext 1/1]
 drivers/misc/pci_endpoint_test.c:292 pci_endpoint_test_bar() warn: signedness
 bug returning '(-61)'
Message-ID: <202610170051.ZaPQhbIG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   a42b417921ddca2df90dc3d8cb746eda8cdb6d63
commit: f615e8d2dec6746127d4667c3cae81bfd6a1ed3a [1/1] misc: pci_endpoint_test: Give disabled BARs a distinct error code
:::::: branch date: 27 hours ago
:::::: commit date: 1 year, 5 months ago
config: i386-randconfig-2200-20261016 (https://download.01.org/0day-ci/archive/20261017/202610170051.ZaPQhbIG-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610170051.ZaPQhbIG-lkp@intel.com/

smatch warnings:
drivers/misc/pci_endpoint_test.c:292 pci_endpoint_test_bar() warn: signedness bug returning '(-61)'

vim +292 drivers/misc/pci_endpoint_test.c

2a35703a6a00e87 Niklas Cassel          2024-03-22  281  
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  282  static bool pci_endpoint_test_bar(struct pci_endpoint_test *test,
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  283  				  enum pci_barno barno)
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  284  {
2a35703a6a00e87 Niklas Cassel          2024-03-22  285  	int j, bar_size, buf_size, iters, remain;
2a35703a6a00e87 Niklas Cassel          2024-03-22  286  	void *write_buf __free(kfree) = NULL;
2a35703a6a00e87 Niklas Cassel          2024-03-22  287  	void *read_buf __free(kfree) = NULL;
cda370ec6d1f7b2 Kishon Vijay Abraham I 2017-08-18  288  	struct pci_dev *pdev = test->pdev;
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  289  
f615e8d2dec6746 Niklas Cassel          2025-01-23  290  	bar_size = pci_resource_len(pdev, barno);
f615e8d2dec6746 Niklas Cassel          2025-01-23  291  	if (!bar_size)
f615e8d2dec6746 Niklas Cassel          2025-01-23 @292  		return -ENODATA;
f615e8d2dec6746 Niklas Cassel          2025-01-23  293  
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  294  	if (!test->bar[barno])
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  295  		return false;
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  296  
834b9051992580a Kishon Vijay Abraham I 2017-08-18  297  	if (barno == test->test_reg_bar)
2a35703a6a00e87 Niklas Cassel          2024-03-22  298  		bar_size = 0x4;
834b9051992580a Kishon Vijay Abraham I 2017-08-18  299  
2a35703a6a00e87 Niklas Cassel          2024-03-22  300  	/*
2a35703a6a00e87 Niklas Cassel          2024-03-22  301  	 * Allocate a buffer of max size 1MB, and reuse that buffer while
2a35703a6a00e87 Niklas Cassel          2024-03-22  302  	 * iterating over the whole BAR size (which might be much larger).
2a35703a6a00e87 Niklas Cassel          2024-03-22  303  	 */
2a35703a6a00e87 Niklas Cassel          2024-03-22  304  	buf_size = min(SZ_1M, bar_size);
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  305  
2a35703a6a00e87 Niklas Cassel          2024-03-22  306  	write_buf = kmalloc(buf_size, GFP_KERNEL);
2a35703a6a00e87 Niklas Cassel          2024-03-22  307  	if (!write_buf)
2a35703a6a00e87 Niklas Cassel          2024-03-22  308  		return false;
2a35703a6a00e87 Niklas Cassel          2024-03-22  309  
2a35703a6a00e87 Niklas Cassel          2024-03-22  310  	read_buf = kmalloc(buf_size, GFP_KERNEL);
2a35703a6a00e87 Niklas Cassel          2024-03-22  311  	if (!read_buf)
2a35703a6a00e87 Niklas Cassel          2024-03-22  312  		return false;
2a35703a6a00e87 Niklas Cassel          2024-03-22  313  
2a35703a6a00e87 Niklas Cassel          2024-03-22  314  	iters = bar_size / buf_size;
2a35703a6a00e87 Niklas Cassel          2024-03-22  315  	for (j = 0; j < iters; j++)
2a35703a6a00e87 Niklas Cassel          2024-03-22  316  		if (pci_endpoint_test_bar_memcmp(test, barno, buf_size * j,
2a35703a6a00e87 Niklas Cassel          2024-03-22  317  						 write_buf, read_buf, buf_size))
2a35703a6a00e87 Niklas Cassel          2024-03-22  318  			return false;
2a35703a6a00e87 Niklas Cassel          2024-03-22  319  
2a35703a6a00e87 Niklas Cassel          2024-03-22  320  	remain = bar_size % buf_size;
2a35703a6a00e87 Niklas Cassel          2024-03-22  321  	if (remain)
2a35703a6a00e87 Niklas Cassel          2024-03-22  322  		if (pci_endpoint_test_bar_memcmp(test, barno, buf_size * iters,
2a35703a6a00e87 Niklas Cassel          2024-03-22  323  						 write_buf, read_buf, remain))
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  324  			return false;
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  325  
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  326  	return true;
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  327  }
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  328  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
