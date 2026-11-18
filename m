Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990178;
	b=b9o59vmCHO4snzjeIp8nJcqd0rQOqIh3q09ZEmN9aWDvlry+OzqSCk62jdXui7m6YMtp
	 W5C1n9PjaM04EKKXDNlHXa/2uyYxMoXBH5czwnPnYZNP9GrHpZckSL3W0TzLnfF5rYnCT
	 QVEZeskAo04uv/jARB/5bP2w+G4C+4tLpZMPE0BIdbhfzA1Fb7p9t8mdGj+8h/EgxmC4j
	 4GvocfDQAWyvV5NIYFC6qUCcmmgYQchmrlAS043vyaAFO99m9rFcL7ED72l+SvvFzGdbu
	 fcBt+1A3Zvgx9oSf0pRNm4eSgPaNwofoawaY69UuczNi5mp+e0M+LDChNAh6dPgdaSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990178;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=K6D618Lufh77b+uk6Xc/TBhcvtpTDA22m6wJ4RWA6jY=;
	b=bK477AAGUMIDVR9mJlScxaEytVBX2iMO9uPQ5u3dmk/oCGiFoP7A12TTfbo1nFwp1I7g
	 ARJqKjlNGPwTiNUInOmLdDugZ9UnfwAj/V67aNyXh7wSb2a7XDQ2th1Wv7HK3tC72KeSq
	 usHtwcM++TaFmRI8BS43rD0yq/8QEy3MPAThVEAoWnbge9SgYv3bH6N37HmJH3vSBQ6uf
	 lx88VV/7OyxR9XkbAj9AoiE+I9WBxDTv9EZ/hrQUG4ALhV1rkYYYcjq9uZ4sPpiDhV6se
	 9r8du7k7lP97Q5+FO5bqSC5ZBunL8gP07XhQDKeL+ktgS0iX2bT8MmVB4EC0JLxLhWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LpI3tW73;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E60606A32F
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Nov 2026 08:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30E60606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LpI3tW73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794990177; x=1826526177;
  h=date:from:to:cc:subject:message-id;
  bh=J8m6ufcvR8/EYo4VB4gyc65L4j4C2xweSWfpHIkJtgg=;
  b=LpI3tW73DJfTPddpSbblLdHzwL9qUOX9GH4i7NWfkQi4k2vxYJimkU5u
   GadpjP5BcAFYdE98XIEMLlZEGfPCfxx1mfrlau47NOGgLCW8jJekHrd4K
   /e5TH50y/dSMIsmQDEiXPMLMSNvIBNJ/dTEy9RT7GsICcR9eSOVZhMKX1
   6B6S1xZfQBbEjeWfMKyBYnVEnUr+hfyiZsuGOoGM459WYE61zu3c0Mfkc
   JLWjGPb1ZW+KbwzBlYFQqCamrJE7nhHwzSnUdfh4ok5XZIaSH4hosFF+K
   wAko1pvF55/Xwr38CLY6M87txzGf/W3Td6vTJHnFznjGdsIauf2SU4utc
   A==;
X-CSE-ConnectionGUID: skNzidSeSFyA8hUwreUeiQ==
X-CSE-MsgGUID: JrMAGbSERQOUl+p0VJBaUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3674387"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3674387"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:22:57 -0800
X-CSE-ConnectionGUID: Sb1hq3cbSUSP+jzOvh8NjA==
X-CSE-MsgGUID: cU1oaBISTTi1Ut89E7ZJlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="12029506"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 18 Nov 2026 00:22:55 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTawO-000000003MU-1OxH;
	Wed, 18 Nov 2026 08:22:52 +0000
Date: Wed, 18 Nov 2026 09:22:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5839/8636]
 drivers/clk/socfpga/clk-agilex.c:552 agilex_clkmgr_setup() warn: 'base' from
 of_iomap() not released on lines: 546.
Message-ID: <20261118091616.P50O9Puo-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
CC: Brian Masney <masneyb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7cfbf79c66c63e807ea452abf0546e6f6d6833a6
commit: 0b95e3ec699a85148badc68d03db8dfca14533fa [5839/8636] clk: socfpga: agilex: register the SP timer clocks early
:::::: branch date: 9 hours ago
:::::: commit date: 6 days ago
config: loongarch-randconfig-2200-20261118 (https://download.01.org/0day-ci/archive/20261118/20261118091616.P50O9Puo-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261118091616.P50O9Puo-lkp@intel.com/

New smatch warnings:
drivers/clk/socfpga/clk-agilex.c:552 agilex_clkmgr_setup() warn: 'base' from of_iomap() not released on lines: 546.

Old smatch warnings:
drivers/clk/socfpga/clk-agilex.c:635 agilex_clkmgr_init() warn: 'clk_data' can also be NULL
drivers/clk/socfpga/clk-agilex.c:656 n5x_clkmgr_init() warn: 'clk_data' can also be NULL

vim +/base +552 drivers/clk/socfpga/clk-agilex.c

80c6b7a0894ffd Dinh Nguyen      2020-05-12  525  
0b95e3ec699a85 Adrian Ng Ho Yin 2026-11-10  526  /*
0b95e3ec699a85 Adrian Ng Ho Yin 2026-11-10  527   * The registered clocks keep using the mapping and clk_data, so neither is
0b95e3ec699a85 Adrian Ng Ho Yin 2026-11-10  528   * released once the early clocks have been registered.
0b95e3ec699a85 Adrian Ng Ho Yin 2026-11-10  529   */
0b95e3ec699a85 Adrian Ng Ho Yin 2026-11-10  530  static int
0b95e3ec699a85 Adrian Ng Ho Yin 2026-11-10  531  agilex_clkmgr_setup(struct device_node *np,
0b95e3ec699a85 Adrian Ng Ho Yin 2026-11-10  532  		    void (*register_early)(struct stratix10_clock_data *))
a0f9819cbe9952 Dinh Nguyen      2021-02-12  533  {
a0f9819cbe9952 Dinh Nguyen      2021-02-12  534  	struct stratix10_clock_data *clk_data;
ba7e258425acd8 Dinh Nguyen      2021-03-02  535  	void __iomem *base;
ba7e258425acd8 Dinh Nguyen      2021-03-02  536  
0b95e3ec699a85 Adrian Ng Ho Yin 2026-11-10  537  	base = of_iomap(np, 0);
0b95e3ec699a85 Adrian Ng Ho Yin 2026-11-10  538  	if (!base) {
0b95e3ec699a85 Adrian Ng Ho Yin 2026-11-10  539  		pr_err("%s: failed to map clock registers\n", __func__);
0b95e3ec699a85 Adrian Ng Ho Yin 2026-11-10  540  		return -ENOMEM;
0b95e3ec699a85 Adrian Ng Ho Yin 2026-11-10  541  	}
ba7e258425acd8 Dinh Nguyen      2021-03-02  542  
0b95e3ec699a85 Adrian Ng Ho Yin 2026-11-10  543  	clk_data = agilex_clk_data_alloc(base);
0b95e3ec699a85 Adrian Ng Ho Yin 2026-11-10  544  	if (!clk_data) {
0b95e3ec699a85 Adrian Ng Ho Yin 2026-11-10  545  		iounmap(base);
ba7e258425acd8 Dinh Nguyen      2021-03-02  546  		return -ENOMEM;
0b95e3ec699a85 Adrian Ng Ho Yin 2026-11-10  547  	}
ba7e258425acd8 Dinh Nguyen      2021-03-02  548  
0b95e3ec699a85 Adrian Ng Ho Yin 2026-11-10  549  	register_early(clk_data);
0b95e3ec699a85 Adrian Ng Ho Yin 2026-11-10  550  	agilex_clk_data = clk_data;
0b95e3ec699a85 Adrian Ng Ho Yin 2026-11-10  551  
0b95e3ec699a85 Adrian Ng Ho Yin 2026-11-10 @552  	return 0;
0b95e3ec699a85 Adrian Ng Ho Yin 2026-11-10  553  }
0b95e3ec699a85 Adrian Ng Ho Yin 2026-11-10  554  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
