Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797B03C342F
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Oct 2026 04:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791864578; cv=none; b=C/iM7fdkAps/uWZWCRU9ykYtD+bwnS8YhAxj7mXHwszFjDDalqpjIWD8oQaeJnqi8fmzl3vjFh1JTvCeoebnNQlDrg5Hg7LOnfgBffdRUkiLWYDou9JG04+fKKAZnXRCOLVdAZ5CvKYHLDu5bHhGPalrq+JTR7CP0kKVBZJ4tvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791864578; c=relaxed/simple;
	bh=gu+DdmlUHxAP7iuuA4unsw/NleWniaGCvZZhITvxPG0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HnXbrMtw1IYUQvIJGE5s9l3rPa2IbQmiQjcjR2UoySjgoD4XX3vU19jtEsGomxnpt5cLkQcfJFUUK85ComPaP4I4d0cZulXDzAkCVWyixCe1W3YcdCUUG4OAZVsI4fjTDt5B3x8nznmcjjTfu9+ZpDZlpfyJAMGURXCZ7o1uIDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kXNm3ZIX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kXNm3ZIX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791864577; x=1823400577;
  h=date:from:to:cc:subject:message-id;
  bh=gu+DdmlUHxAP7iuuA4unsw/NleWniaGCvZZhITvxPG0=;
  b=kXNm3ZIXvRasov17MmKHjZ9OiaDnycQwgKZFoiKmc2B4j5vsG4E85nxp
   VsgUXIQ3WQ8PGRQRAJHFS9qD7MVtJbZ2aJiO6bXFZmKS6gAHm/doraI6L
   RrZcgFCQoYA9dpRJIpS7DJ5xezZ7hVAH6pbjqktQ/gIsTt/fS5c4cmDGr
   noPgfrqknAz4N7fHUba/qq1gjIvVBIcbOz+h9RCcjTEsUxNyXZMO4C6AQ
   kx/kVUtO/A3qaKm49VzEV+c3nhcejMHbvI9FmvW3lIklg9pgwqxM3+KVs
   9b/ABnS/5i/nh+edtkvs5lDPfRtdevky0QDVrlthFCDGMRUXaHQk94oEN
   g==;
X-CSE-ConnectionGUID: ySPAPZMnTAOKivcJFJlE3A==
X-CSE-MsgGUID: MCavxhjbS+mpLpJotlh/Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="468237"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="468237"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 21:09:36 -0700
X-CSE-ConnectionGUID: lw+wr+sLRs2g9sYIOUgyCA==
X-CSE-MsgGUID: /P6IP0xlR4Oc/wINW3JMWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1388372"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 12 Oct 2026 21:09:34 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGTpU-00000000AND-1eFq;
	Tue, 13 Oct 2026 04:09:32 +0000
Date: Tue, 13 Oct 2026 06:09:18 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kkdwivedi:coroutine 1/19] arch/arm/mach-mxs/mach-mxs.c:149
 mxs_get_ocotp() warn: 'ocotp_base' from of_iomap() not released on lines:
 149.
Message-ID: <202610130510.dfDBWM0r-lkp@intel.com>
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
TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>

tree:   https://github.com/kkdwivedi/linux coroutine
head:   0813a9d05d658bcd6b8f960368b4c046e24ae1c9
commit: 87bfa22937000db29a9a09ec826ab7227eaf9e8c [1/19] bpf: Reject BTF ids with the same address in tracing_multi link
:::::: branch date: 9 hours ago
:::::: commit date: 19 hours ago
config: arm-randconfig-r2202-20261012 (https://download.01.org/0day-ci/archive/20261013/202610130510.dfDBWM0r-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610130510.dfDBWM0r-lkp@intel.com/

smatch warnings:
arch/arm/mach-mxs/mach-mxs.c:149 mxs_get_ocotp() warn: 'ocotp_base' from of_iomap() not released on lines: 149.

vim +/ocotp_base +149 arch/arm/mach-mxs/mach-mxs.c

1bff2d76ac88d5 Shawn Guo 2013-03-29   85  
1bff2d76ac88d5 Shawn Guo 2013-03-29   86  static const u32 *mxs_get_ocotp(void)
1bff2d76ac88d5 Shawn Guo 2013-03-29   87  {
1bff2d76ac88d5 Shawn Guo 2013-03-29   88  	struct device_node *np;
1bff2d76ac88d5 Shawn Guo 2013-03-29   89  	void __iomem *ocotp_base;
1bff2d76ac88d5 Shawn Guo 2013-03-29   90  	int timeout = 0x400;
1bff2d76ac88d5 Shawn Guo 2013-03-29   91  	size_t i;
1bff2d76ac88d5 Shawn Guo 2013-03-29   92  	static int once;
1bff2d76ac88d5 Shawn Guo 2013-03-29   93  
1bff2d76ac88d5 Shawn Guo 2013-03-29   94  	if (once)
1bff2d76ac88d5 Shawn Guo 2013-03-29   95  		return ocotp_words;
1bff2d76ac88d5 Shawn Guo 2013-03-29   96  
1bff2d76ac88d5 Shawn Guo 2013-03-29   97  	np = of_find_compatible_node(NULL, NULL, "fsl,ocotp");
1bff2d76ac88d5 Shawn Guo 2013-03-29   98  	ocotp_base = of_iomap(np, 0);
1bff2d76ac88d5 Shawn Guo 2013-03-29   99  	WARN_ON(!ocotp_base);
1bff2d76ac88d5 Shawn Guo 2013-03-29  100  
1bff2d76ac88d5 Shawn Guo 2013-03-29  101  	mutex_lock(&ocotp_mutex);
1bff2d76ac88d5 Shawn Guo 2013-03-29  102  
1bff2d76ac88d5 Shawn Guo 2013-03-29  103  	/*
1bff2d76ac88d5 Shawn Guo 2013-03-29  104  	 * clk_enable(hbus_clk) for ocotp can be skipped
1bff2d76ac88d5 Shawn Guo 2013-03-29  105  	 * as it must be on when system is running.
1bff2d76ac88d5 Shawn Guo 2013-03-29  106  	 */
1bff2d76ac88d5 Shawn Guo 2013-03-29  107  
1bff2d76ac88d5 Shawn Guo 2013-03-29  108  	/* try to clear ERROR bit */
1bff2d76ac88d5 Shawn Guo 2013-03-29  109  	__mxs_clrl(BM_OCOTP_CTRL_ERROR, ocotp_base);
1bff2d76ac88d5 Shawn Guo 2013-03-29  110  
1bff2d76ac88d5 Shawn Guo 2013-03-29  111  	/* check both BUSY and ERROR cleared */
1bff2d76ac88d5 Shawn Guo 2013-03-29  112  	while ((__raw_readl(ocotp_base) &
1bff2d76ac88d5 Shawn Guo 2013-03-29  113  		(BM_OCOTP_CTRL_BUSY | BM_OCOTP_CTRL_ERROR)) && --timeout)
1bff2d76ac88d5 Shawn Guo 2013-03-29  114  		cpu_relax();
1bff2d76ac88d5 Shawn Guo 2013-03-29  115  
1bff2d76ac88d5 Shawn Guo 2013-03-29  116  	if (unlikely(!timeout))
1bff2d76ac88d5 Shawn Guo 2013-03-29  117  		goto error_unlock;
1bff2d76ac88d5 Shawn Guo 2013-03-29  118  
1bff2d76ac88d5 Shawn Guo 2013-03-29  119  	/* open OCOTP banks for read */
1bff2d76ac88d5 Shawn Guo 2013-03-29  120  	__mxs_setl(BM_OCOTP_CTRL_RD_BANK_OPEN, ocotp_base);
1bff2d76ac88d5 Shawn Guo 2013-03-29  121  
1bff2d76ac88d5 Shawn Guo 2013-03-29  122  	/* approximately wait 32 hclk cycles */
1bff2d76ac88d5 Shawn Guo 2013-03-29  123  	udelay(1);
1bff2d76ac88d5 Shawn Guo 2013-03-29  124  
1bff2d76ac88d5 Shawn Guo 2013-03-29  125  	/* poll BUSY bit becoming cleared */
1bff2d76ac88d5 Shawn Guo 2013-03-29  126  	timeout = 0x400;
1bff2d76ac88d5 Shawn Guo 2013-03-29  127  	while ((__raw_readl(ocotp_base) & BM_OCOTP_CTRL_BUSY) && --timeout)
1bff2d76ac88d5 Shawn Guo 2013-03-29  128  		cpu_relax();
1bff2d76ac88d5 Shawn Guo 2013-03-29  129  
1bff2d76ac88d5 Shawn Guo 2013-03-29  130  	if (unlikely(!timeout))
1bff2d76ac88d5 Shawn Guo 2013-03-29  131  		goto error_unlock;
1bff2d76ac88d5 Shawn Guo 2013-03-29  132  
1bff2d76ac88d5 Shawn Guo 2013-03-29  133  	for (i = 0; i < OCOTP_WORD_COUNT; i++)
1bff2d76ac88d5 Shawn Guo 2013-03-29  134  		ocotp_words[i] = __raw_readl(ocotp_base + OCOTP_WORD_OFFSET +
1bff2d76ac88d5 Shawn Guo 2013-03-29  135  						i * 0x10);
1bff2d76ac88d5 Shawn Guo 2013-03-29  136  
1bff2d76ac88d5 Shawn Guo 2013-03-29  137  	/* close banks for power saving */
1bff2d76ac88d5 Shawn Guo 2013-03-29  138  	__mxs_clrl(BM_OCOTP_CTRL_RD_BANK_OPEN, ocotp_base);
1bff2d76ac88d5 Shawn Guo 2013-03-29  139  
1bff2d76ac88d5 Shawn Guo 2013-03-29  140  	once = 1;
1bff2d76ac88d5 Shawn Guo 2013-03-29  141  
1bff2d76ac88d5 Shawn Guo 2013-03-29  142  	mutex_unlock(&ocotp_mutex);
1bff2d76ac88d5 Shawn Guo 2013-03-29  143  
1bff2d76ac88d5 Shawn Guo 2013-03-29  144  	return ocotp_words;
1bff2d76ac88d5 Shawn Guo 2013-03-29  145  
1bff2d76ac88d5 Shawn Guo 2013-03-29  146  error_unlock:
1bff2d76ac88d5 Shawn Guo 2013-03-29  147  	mutex_unlock(&ocotp_mutex);
1bff2d76ac88d5 Shawn Guo 2013-03-29  148  	pr_err("%s: timeout in reading OCOTP\n", __func__);
1bff2d76ac88d5 Shawn Guo 2013-03-29 @149  	return NULL;
1bff2d76ac88d5 Shawn Guo 2013-03-29  150  }
1bff2d76ac88d5 Shawn Guo 2013-03-29  151  

:::::: The code at line 149 was first introduced by commit
:::::: 1bff2d76ac88d59e45d2ba0d1103be210a9eca11 ARM: mxs: move mxs_get_ocotp() into mach-mxs.c

:::::: TO: Shawn Guo <shawn.guo@linaro.org>
:::::: CC: Shawn Guo <shawn.guo@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
