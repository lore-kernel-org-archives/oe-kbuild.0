Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9224E1CD2C
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Dec 2025 23:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764633333; cv=none; b=eONrt1ZW9gO3FRevpNT/4h3yO7jDBWp4ZOUBV8QuLlQ5igzKVwAWnb8JOWT4dOYGqsRhAscfzUV2mGmheKYm3vcNxI9pC99b8TFxLPrb6+zu1MmFXnOwUKJSijukw5bAZKqAgN1gLoJm7lPdtem0h9n6PT3XVPZNP0fJqIWP2T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764633333; c=relaxed/simple;
	bh=JzAZb/4PoTuDpDZuxK9P67De+eNCWzcN30uOvNxR6AA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=imsjOFt0pwjibshb6s5gejRXBNV0D9gMhLIaHC9GlW8WKI74ET7gAkZnTdmfwkxwU4kkzDgA/3TEeXsoHla1DfZAv/bXTOA/R4XcmnNevyr6mQIP0Wjw2cfPiBtC7bigJP5ZKH+vP+F/+Dtg13rcvi1Kt8eUC6GV5ceSmrPp2ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d1PHAkKW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d1PHAkKW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764633331; x=1796169331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JzAZb/4PoTuDpDZuxK9P67De+eNCWzcN30uOvNxR6AA=;
  b=d1PHAkKWlAS3exfW5BcjA0WJv96QlUh/LqdmPGmkJSb/5K2YkP42P0/w
   MjqL72z/AKYVjS+/5lV2gs+vyx/TxbUgoALvSQDsoN2PC1TXSVU7ynAcR
   8pVBYk1+wWe+lzQ6qnxVEfxQ7kybMNlvVjbl02XnjByoF1X706F26Zuff
   EmCo8O4dafpClx/wYZLmpg5nvZcMm9j/rvzsxzgt7KI1bb271UfvnFdKY
   yh2EH3QDlHqFhZUoWdSMZvrONuqcNVmhZVRRF4ex2U1PlkaVrFpfxO7We
   eSelqvKLkCtRHXrF09EBE0wBVkNhA7RL0L2B+Y3kRV98W1mWVhR9VP/a4
   Q==;
X-CSE-ConnectionGUID: WgHfDkCuRUiHUz4sv2gl2A==
X-CSE-MsgGUID: MQrYEK2+RAacHhebm0S1oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66474005"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="66474005"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 15:55:30 -0800
X-CSE-ConnectionGUID: gtqFb4cmS6GvS8KbbBKtzA==
X-CSE-MsgGUID: KoTbiYxiTHeKJbdDcJG47g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="194411125"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 01 Dec 2025 15:55:30 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQDjs-000000002mN-04AN;
	Mon, 01 Dec 2025 23:55:28 +0000
Date: Tue, 2 Dec 2025 00:55:02 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ld.lld: error: undefined symbol: devm_clk_register
Message-ID: <202512020030.AsUoy1EK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Peter-Novak/clk-hisilicon-fix-compile-testing/20251201-054942, commit: a5bd6f8973e4a0aa13b3e1d43790a85fe6bcefe6"
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Peter Novak <seimun018r@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Peter-Novak/clk-hisilicon-fix-compile-testing/20251201-054942
head:   a5bd6f8973e4a0aa13b3e1d43790a85fe6bcefe6
commit: a5bd6f8973e4a0aa13b3e1d43790a85fe6bcefe6 clk: hisilicon: fix compile testing
date:   26 hours ago
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512020030.AsUoy1EK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020030.AsUoy1EK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512020030.AsUoy1EK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_clk_register
   >>> referenced by clk-hisi-phase.c:119 (drivers/clk/hisilicon/clk-hisi-phase.c:119)
   >>>               drivers/clk/hisilicon/clk-hisi-phase.o:(clk_register_hisi_phase) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: clk_register
   >>> referenced by clkgate-separated.c:109 (drivers/clk/hisilicon/clkgate-separated.c:109)
   >>>               drivers/clk/hisilicon/clkgate-separated.o:(hisi_register_clkgate_sep) in archive vmlinux.a
   >>> referenced by clkdivider-hi6220.c:149 (drivers/clk/hisilicon/clkdivider-hi6220.c:149)
   >>>               drivers/clk/hisilicon/clkdivider-hi6220.o:(hi6220_register_clkdiv) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: clk_register_mux_table
   >>> referenced by clk.c:160 (drivers/clk/hisilicon/clk.c:160)
   >>>               drivers/clk/hisilicon/clk.o:(hisi_clk_register_mux) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: clk_register_clkdev
   >>> referenced by clk.c:173 (drivers/clk/hisilicon/clk.c:173)
   >>>               drivers/clk/hisilicon/clk.o:(hisi_clk_register_mux) in archive vmlinux.a
   >>> referenced by clk.c:235 (drivers/clk/hisilicon/clk.c:235)
   >>>               drivers/clk/hisilicon/clk.o:(hisi_clk_register_divider) in archive vmlinux.a
   >>> referenced by clk.c:272 (drivers/clk/hisilicon/clk.c:272)
   >>>               drivers/clk/hisilicon/clk.o:(hisi_clk_register_gate) in archive vmlinux.a
   >>> referenced 2 more times
--
>> ld.lld: error: undefined symbol: clk_unregister_mux
   >>> referenced by clk.c:182 (drivers/clk/hisilicon/clk.c:182)
   >>>               drivers/clk/hisilicon/clk.o:(hisi_clk_register_mux) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: clk_register_divider_table
   >>> referenced by clk.c:220 (drivers/clk/hisilicon/clk.c:220)
   >>>               drivers/clk/hisilicon/clk.o:(hisi_clk_register_divider) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: clk_unregister_divider
   >>> referenced by clk.c:244 (drivers/clk/hisilicon/clk.c:244)
   >>>               drivers/clk/hisilicon/clk.o:(hisi_clk_register_divider) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: clk_register_gate
   >>> referenced by clk.c:258 (drivers/clk/hisilicon/clk.c:258)
   >>>               drivers/clk/hisilicon/clk.o:(hisi_clk_register_gate) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: clk_unregister_gate
   >>> referenced by clk.c:281 (drivers/clk/hisilicon/clk.c:281)
   >>>               drivers/clk/hisilicon/clk.o:(hisi_clk_register_gate) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: divider_round_rate_parent
   >>> referenced by clk-provider.h:1445 (./include/linux/clk-provider.h:1445)
   >>>               drivers/clk/hisilicon/clkdivider-hi6220.o:(hi6220_clkdiv_determine_rate) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: clk_register_fixed_rate
   >>> referenced by clk.c:98 (drivers/clk/hisilicon/clk.c:98)
   >>>               drivers/clk/hisilicon/clk.o:(hisi_clk_register_fixed_rate) in archive vmlinux.a
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
