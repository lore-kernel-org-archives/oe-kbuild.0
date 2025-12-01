Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9340F23B61B
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Dec 2025 23:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764631653; cv=none; b=LziwF5jw7cngH4+oG4sb/jD8O9Mnt7gLEjBEJ3jD9dTVYsz51BccR83i9LfJhogm7UHMGosuFIMm1C8pR/E1uopHjeNwLTdw3cp9kbrXkORGRkYILKUfwZpTKwTaRo1dRcVDNMgHvLVf2tsX//u66KyoF+WDWCmqrjcEiMxCerY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764631653; c=relaxed/simple;
	bh=aaH9HFa7tuqwWFBBjGUfeuVXt1EVJjdDuL0clcay8jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b5KkQgBiBq3jZcsLk9/lqtPklMCBdC8QOkZ5KWxSJHpVWnJTFdWmj9ZuapEiWhSFfcyzmTWxq/4x16ZvdIEkhPtMzdO72LFV+aTeFkVag4953jp11G4cNYcCZqnDgamZypJrn2wFhdhnHAhPOc3ZLnwRKcEsVSPVNOMqRySFecE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TosNLk/a; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TosNLk/a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764631651; x=1796167651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aaH9HFa7tuqwWFBBjGUfeuVXt1EVJjdDuL0clcay8jQ=;
  b=TosNLk/awD2nwwyS/OBK5wJOMSvk2QVuSUmW2QVCOuXp0nf5iP+zKgI5
   kCd0bwHO9KtKqGaabJ0SqOlgysyOwJWsTP4qNRhlKTf/itA0ZCKrny+tL
   anCL+0Zb9TWgDJCHzeL/X+77BrxM+LsUameeN5ETIeTvjIqsNJRw5XIKX
   odOQbQIXRZ4krnfZR54f/+LbjQtQahq9Xt/ERj3NC6XdaczcXMlb11rxM
   HVEgYyKu8qU0hsvuBRAGXqRLwCRUsWcCLdrxDoKUy1V8vkUuQUQ/eIxo8
   3yVsSW0sHP2on5EQEBg6QdpznqW+j1xyuDE+Di6fXzuRU113YSFh55FE2
   Q==;
X-CSE-ConnectionGUID: bQxINDx4QTak7AYRI86A7w==
X-CSE-MsgGUID: 2cSHYyUWQnq6HOR1CjVTVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66624438"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="66624438"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 15:27:31 -0800
X-CSE-ConnectionGUID: vAXXtDYgTQ+E5nCkqQKrFA==
X-CSE-MsgGUID: 6vuvdH5eTheA0I+k6QOZxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="193879935"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 01 Dec 2025 15:27:30 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQDIl-000000002lz-35Ew;
	Mon, 01 Dec 2025 23:27:27 +0000
Date: Tue, 2 Dec 2025 00:27:23 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: s390-linux-ld: drivers/clk/hisilicon/clk.c:114:undefined reference
 to `clk_unregister_fixed_rate'
Message-ID: <202512020039.zQcFAqne-lkp@intel.com>
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
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512020039.zQcFAqne-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020039.zQcFAqne-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512020039.zQcFAqne-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_fixed_rate':
   drivers/clk/hisilicon/clk.c:98:(.text+0x1a6): undefined reference to `clk_register_fixed_rate'
>> s390-linux-ld: drivers/clk/hisilicon/clk.c:114:(.text+0x2a6): undefined reference to `clk_unregister_fixed_rate'
   s390-linux-ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_fixed_factor':
   drivers/clk/hisilicon/clk.c:128:(.text+0x370): undefined reference to `clk_register_fixed_factor'
>> s390-linux-ld: drivers/clk/hisilicon/clk.c:144:(.text+0x46e): undefined reference to `clk_unregister_fixed_factor'
   s390-linux-ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_mux':
   drivers/clk/hisilicon/clk.c:160:(.text+0x5f0): undefined reference to `clk_register_mux_table'
>> s390-linux-ld: drivers/clk/hisilicon/clk.c:173:(.text+0x624): undefined reference to `clk_register_clkdev'
>> s390-linux-ld: drivers/clk/hisilicon/clk.c:182:(.text+0x71c): undefined reference to `clk_unregister_mux'
   s390-linux-ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_divider':
   drivers/clk/hisilicon/clk.c:220:(.text+0x976): undefined reference to `clk_register_divider_table'
   s390-linux-ld: drivers/clk/hisilicon/clk.c:235:(.text+0x9aa): undefined reference to `clk_register_clkdev'
>> s390-linux-ld: drivers/clk/hisilicon/clk.c:244:(.text+0xa9c): undefined reference to `clk_unregister_divider'
   s390-linux-ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_gate':
   drivers/clk/hisilicon/clk.c:258:(.text+0xbaa): undefined reference to `clk_register_gate'
   s390-linux-ld: drivers/clk/hisilicon/clk.c:272:(.text+0xbde): undefined reference to `clk_register_clkdev'
>> s390-linux-ld: drivers/clk/hisilicon/clk.c:281:(.text+0xcce): undefined reference to `clk_unregister_gate'
   s390-linux-ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_gate_sep':
   drivers/clk/hisilicon/clk.c:309:(.text+0xe12): undefined reference to `clk_register_clkdev'
   s390-linux-ld: drivers/clk/hisilicon/clk.o: in function `hi6220_clk_register_divider':
   drivers/clk/hisilicon/clk.c:339:(.init.text+0x186): undefined reference to `clk_register_clkdev'
   s390-linux-ld: drivers/clk/hisilicon/clkgate-separated.o: in function `hisi_register_clkgate_sep':
   drivers/clk/hisilicon/clkgate-separated.c:109:(.text+0x4a6): undefined reference to `clk_register'
   s390-linux-ld: drivers/clk/hisilicon/clkdivider-hi6220.o: in function `hi6220_clkdiv_set_rate':
   drivers/clk/hisilicon/clkdivider-hi6220.c:77:(.text+0xa0): undefined reference to `divider_get_val'
   s390-linux-ld: drivers/clk/hisilicon/clkdivider-hi6220.o: in function `divider_round_rate':
   ./include/linux/clk-provider.h:1445:(.text+0x210): undefined reference to `clk_hw_get_parent'
>> s390-linux-ld: ./include/linux/clk-provider.h:1445:(.text+0x23a): undefined reference to `divider_round_rate_parent'
   s390-linux-ld: drivers/clk/hisilicon/clkdivider-hi6220.o: in function `hi6220_clkdiv_recalc_rate':
   drivers/clk/hisilicon/clkdivider-hi6220.c:54:(.text+0x35e): undefined reference to `divider_recalc_rate'
   s390-linux-ld: drivers/clk/hisilicon/clkdivider-hi6220.o: in function `hi6220_register_clkdiv':
   drivers/clk/hisilicon/clkdivider-hi6220.c:149:(.text+0x5b0): undefined reference to `clk_register'
   s390-linux-ld: drivers/clk/hisilicon/clk-hisi-phase.o: in function `clk_register_hisi_phase':
   drivers/clk/hisilicon/clk-hisi-phase.c:119:(.text+0x424): undefined reference to `devm_clk_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
