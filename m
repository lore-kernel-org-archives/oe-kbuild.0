Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A98332ED0
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Dec 2025 15:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764604581; cv=none; b=ApPHj3g5IskFRf5kw7HTni4OTDQtpfUzBaH0m298woD+3EKDZTgLoQjg3sUQM6BeEizjpDrHYJyy/P5WBRZJL1W3eDoX6lBnhYivgAKw3Kah006oFNbgPOkaOIY7983OW5Ab44lw40IFxBw+c7ZTZjfJVel4ko7PzX7xs4lOs1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764604581; c=relaxed/simple;
	bh=rV+Nt4dmC2cW/DMKVFbQk5YwovYZ6KhxIDTsxdWJ6xw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PLfaf24uCEybg65ylkTf/EFcRVuxeisDrwVRx69QLIZAmVFLQrIwq1MmMo//Z9YPbzVsHs9dELwjzIPWj2NT9lPHYVQH6QsQg/QS4SawTJVjRV1jmroGkwcV5FIBfOgPPArMicAux84/l5zuwcfJF0bDclQL66lq/gATPGr/HQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i15TCUDX; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i15TCUDX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764604575; x=1796140575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rV+Nt4dmC2cW/DMKVFbQk5YwovYZ6KhxIDTsxdWJ6xw=;
  b=i15TCUDXAI+llK6oEWRNGsCVOKIk3aB9o6c5FWbTJiMKjYFnhDK2Y57n
   FNN1kd1FdXAsM2k6r8SifZVh8axczHWp0CWZO5xJ4Q4H9kRcB2SlsHJ2C
   LqFkwIv/AwonjRgzcGj4mXjzWcf/RCSEEpJP7eFn4n+QtDjtnW/busW/o
   N3o4XSMqBFlb7/FjHCPL6qb4LRei+RvwSAu+V0YDMuVLCYJxw2fei5ecI
   HEk+15/kwGT6xkI1jX0gZuwHE0/69wWADtcTq6npoW3wsKu8AvQon7cj5
   0znyaUaVQtIm4i53BcCzvpIDv4X+u8QmAdryNr9lJ3SJrqIVtGI7p11T2
   Q==;
X-CSE-ConnectionGUID: VkzbLRWmREGAb0Kr2KyqyA==
X-CSE-MsgGUID: BadfS5MJSLWJCzGge5A5LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="70160462"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="70160462"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 07:56:09 -0800
X-CSE-ConnectionGUID: tTxaPfnRS0el2pLqcCkwOg==
X-CSE-MsgGUID: Qa1iQID6QcqrApB92WeUDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="193766484"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 Dec 2025 07:56:10 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQ6Fz-000000008tB-24wu;
	Mon, 01 Dec 2025 15:56:07 +0000
Date: Mon, 1 Dec 2025 23:55:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] clk: hisilicon: fix compile testing
Message-ID: <202512012342.fSDxFDZP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251130214720.394745-1-seimun018r@gmail.com>
References: <20251130214720.394745-1-seimun018r@gmail.com>
TO: Peter Novak <seimun018r@gmail.com>
TO: sboyd@kernel.org
TO: mturquette@baylibre.com
CC: linux-clk@vger.kernel.org
CC: Peter Novak <seimun018r@gmail.com>

Hi Peter,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on linus/master v6.18 next-20251201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Novak/clk-hisilicon-fix-compile-testing/20251201-054942
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20251130214720.394745-1-seimun018r%40gmail.com
patch subject: [PATCH] clk: hisilicon: fix compile testing
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20251201/202512012342.fSDxFDZP-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512012342.fSDxFDZP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512012342.fSDxFDZP-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_fixed_rate':
>> (.text+0x174): undefined reference to `clk_register_fixed_rate'
>> alpha-linux-ld: (.text+0x178): undefined reference to `clk_register_fixed_rate'
>> alpha-linux-ld: (.text+0x214): undefined reference to `clk_unregister_fixed_rate'
   alpha-linux-ld: (.text+0x230): undefined reference to `clk_unregister_fixed_rate'
   alpha-linux-ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_fixed_factor':
>> (.text+0x2a8): undefined reference to `clk_register_fixed_factor'
>> alpha-linux-ld: (.text+0x2ac): undefined reference to `clk_register_fixed_factor'
>> alpha-linux-ld: (.text+0x348): undefined reference to `clk_unregister_fixed_factor'
   alpha-linux-ld: (.text+0x364): undefined reference to `clk_unregister_fixed_factor'
   alpha-linux-ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_mux':
>> (.text+0x410): undefined reference to `clk_register_mux_table'
>> alpha-linux-ld: (.text+0x42c): undefined reference to `clk_register_mux_table'
>> alpha-linux-ld: (.text+0x45c): undefined reference to `clk_register_clkdev'
   alpha-linux-ld: (.text+0x464): undefined reference to `clk_register_clkdev'
>> alpha-linux-ld: (.text+0x504): undefined reference to `clk_unregister_mux'
   alpha-linux-ld: (.text+0x520): undefined reference to `clk_unregister_mux'
   alpha-linux-ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_divider':
>> (.text+0x6c8): undefined reference to `clk_register_divider_table'
>> alpha-linux-ld: (.text+0x6dc): undefined reference to `clk_register_divider_table'
   alpha-linux-ld: (.text+0x70c): undefined reference to `clk_register_clkdev'
   alpha-linux-ld: (.text+0x710): undefined reference to `clk_register_clkdev'
>> alpha-linux-ld: (.text+0x7a4): undefined reference to `clk_unregister_divider'
   alpha-linux-ld: (.text+0x7bc): undefined reference to `clk_unregister_divider'
   alpha-linux-ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_gate':
>> (.text+0x84c): undefined reference to `clk_register_gate'
>> alpha-linux-ld: (.text+0x85c): undefined reference to `clk_register_gate'
   alpha-linux-ld: (.text+0x88c): undefined reference to `clk_register_clkdev'
   alpha-linux-ld: (.text+0x890): undefined reference to `clk_register_clkdev'
>> alpha-linux-ld: (.text+0x924): undefined reference to `clk_unregister_gate'
   alpha-linux-ld: (.text+0x93c): undefined reference to `clk_unregister_gate'
   alpha-linux-ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_gate_sep':
>> (.text+0xa08): undefined reference to `clk_register_clkdev'
   alpha-linux-ld: (.text+0xa0c): undefined reference to `clk_register_clkdev'
   alpha-linux-ld: drivers/clk/hisilicon/clk.o: in function `hi6220_clk_register_divider':
>> (.init.text+0xe0): undefined reference to `clk_register_clkdev'
>> alpha-linux-ld: (.init.text+0xe4): undefined reference to `clk_register_clkdev'
   alpha-linux-ld: drivers/clk/hisilicon/clkgate-separated.o: in function `hisi_register_clkgate_sep':
>> (.text+0x230): undefined reference to `clk_register'
   alpha-linux-ld: (.text+0x27c): undefined reference to `clk_register'
   alpha-linux-ld: drivers/clk/hisilicon/clkdivider-hi6220.o: in function `hi6220_clkdiv_set_rate':
   (.text+0xc): undefined reference to `divider_get_val'
   alpha-linux-ld: (.text+0x38): undefined reference to `divider_get_val'
   alpha-linux-ld: drivers/clk/hisilicon/clkdivider-hi6220.o: in function `hi6220_clkdiv_recalc_rate':
   (.text+0x12c): undefined reference to `divider_recalc_rate'
   alpha-linux-ld: (.text+0x148): undefined reference to `divider_recalc_rate'
   alpha-linux-ld: drivers/clk/hisilicon/clkdivider-hi6220.o: in function `hi6220_clkdiv_determine_rate':
   (.text+0x17c): undefined reference to `clk_hw_get_parent'
   alpha-linux-ld: (.text+0x1ac): undefined reference to `clk_hw_get_parent'
   alpha-linux-ld: (.text+0x1c8): undefined reference to `divider_round_rate_parent'
   alpha-linux-ld: (.text+0x1dc): undefined reference to `divider_round_rate_parent'
   alpha-linux-ld: drivers/clk/hisilicon/clkdivider-hi6220.o: in function `hi6220_register_clkdiv':
   (.text+0x31c): undefined reference to `clk_register'
   alpha-linux-ld: (.text+0x378): undefined reference to `clk_register'
   alpha-linux-ld: drivers/clk/hisilicon/clk-hisi-phase.o: in function `clk_register_hisi_phase':
   (.text+0x268): undefined reference to `devm_clk_register'
   alpha-linux-ld: (.text+0x2b4): undefined reference to `devm_clk_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
