Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2183750BE
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Oct 2026 06:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791010135; cv=none; b=Sy/I0lQOsexIbKHWBeV/5WeEbga9Eau9u3ntEDwh56MQMOO9VTjWJB65A5lWdcHrOMPraIqFCDf97tqSUvj0SiqhjmwpewiF+ZQlQ3b0w3g/F0Lmu/pZevcXkRXfqTSIA+Ry6JGRYWsfqrXqczSIJ4f4sotGmuW3xocn9g+pmJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791010135; c=relaxed/simple;
	bh=fNKGYfvy8+XtABGC28VstY1Lu54OhU29Ghq6PTlVj2A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VOMGYEytJNr3766sb1VDmEyc8nGNBcjGYQAVK6xmH+5eEfheC2TvJdpKqPdDhYR8IeBy+aHRykAp6JpVcK6aKSt5ECTU+AmPb3LgNiEnCKZMIfui+CEGDPXeCJIzDV886Xf7lgRJCD9LMzPe6qCq/IJezXVTxhrTwYby9iI1qWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hOaoVsOn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hOaoVsOn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791010132; x=1822546132;
  h=date:from:to:cc:subject:message-id;
  bh=fNKGYfvy8+XtABGC28VstY1Lu54OhU29Ghq6PTlVj2A=;
  b=hOaoVsOnwfGEiWapuTrayWgB4De1wlimK1VO+/gKjpl2syUUkqzdQPi4
   qrDKPJkS2KqbeVyoCXVRa5xfz8jxfpm6GoaAwahbHLDaBvpARKPvrztR6
   NxAiuEJdTGIYGz6g7MMSz+OPIIk9WMISMBcIpcb41YwhX0VjsLOPmSRxt
   zJui6/DaBB2ch1nF7QdPD8F/qtn3nBwn5PIX7xmv6rWDZD/cJQVSCAgoJ
   tldq5BU2NUihDlwW6Jm8Fzvy9YvrfxWyklnnzpsBFtsG+n8iDUhZE0zBh
   rbaqd+XS7ny6aQn//jxCKbMJINP8f1rIVBpNR9ooLcw5FBdEh1bycKap+
   Q==;
X-CSE-ConnectionGUID: 4ZIbOgGDQLqQRXixFG1TaA==
X-CSE-MsgGUID: p6VztWjZS3ygazFU73ZohA==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="113547894"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="113547894"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 23:48:51 -0700
X-CSE-ConnectionGUID: ShlklncwQzOC6G4pUdxDSg==
X-CSE-MsgGUID: E3haG/r3QV2c2us6t/JGng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="275591869"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 02 Oct 2026 23:48:50 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCtY8-000000000yd-14tY;
	Sat, 03 Oct 2026 06:48:48 +0000
Date: Sat, 03 Oct 2026 08:48:43 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/clk/berlin/sl261x-pll.c:104 sl261x_pll_register()
 warn: variable dereferenced before check 'dev' (see line 97)
Message-ID: <202610030856.PzJHeUDc-lkp@intel.com>
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
TO: Jisheng Zhang <jszhang@kernel.org>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jisheng-Zhang/dt-bindings-serial-snps-dw-apb-uart-Add-Synaptics-sl261x-uart/20260929-141358
head:   66f26b6f0baa133e1c8c3a8afb0ef81b5001f027
commit: 03cf77522edc07004a0c25816d9f56083b2049e7 clk: berlin: add Synaptics SL261X SoC clocks and plls
date:   4 days ago
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-r2200-20261003 (https://download.01.org/0day-ci/archive/20261003/202610030856.PzJHeUDc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610030856.PzJHeUDc-lkp@intel.com/

smatch warnings:
drivers/clk/berlin/sl261x-pll.c:104 sl261x_pll_register() warn: variable dereferenced before check 'dev' (see line 97)

vim +/dev +104 drivers/clk/berlin/sl261x-pll.c

03cf77522edc07 Jisheng Zhang 2026-09-29   93  
03cf77522edc07 Jisheng Zhang 2026-09-29   94  int sl261x_pll_register(struct device *dev, void __iomem *ctrl,
03cf77522edc07 Jisheng Zhang 2026-09-29   95  			const char *out, const char *outf)
03cf77522edc07 Jisheng Zhang 2026-09-29   96  {
03cf77522edc07 Jisheng Zhang 2026-09-29  @97  	struct device_node *np = dev->of_node;
03cf77522edc07 Jisheng Zhang 2026-09-29   98  	struct clk_parent_data parent = {};
03cf77522edc07 Jisheng Zhang 2026-09-29   99  	struct clk_init_data init = {};
03cf77522edc07 Jisheng Zhang 2026-09-29  100  	struct sl261x_pll *pll;
03cf77522edc07 Jisheng Zhang 2026-09-29  101  	struct clk *input;
03cf77522edc07 Jisheng Zhang 2026-09-29  102  	int ret;
03cf77522edc07 Jisheng Zhang 2026-09-29  103  
03cf77522edc07 Jisheng Zhang 2026-09-29 @104  	if (!dev || !ctrl || !out || !outf)
03cf77522edc07 Jisheng Zhang 2026-09-29  105  		return -EINVAL;
03cf77522edc07 Jisheng Zhang 2026-09-29  106  
03cf77522edc07 Jisheng Zhang 2026-09-29  107  	input = of_clk_get(np, 0);
03cf77522edc07 Jisheng Zhang 2026-09-29  108  	if (IS_ERR(input))
03cf77522edc07 Jisheng Zhang 2026-09-29  109  		return dev_err_probe(dev, PTR_ERR(input),
03cf77522edc07 Jisheng Zhang 2026-09-29  110  				     "failed to get PLL reference clock\n");
03cf77522edc07 Jisheng Zhang 2026-09-29  111  	parent.hw = __clk_get_hw(input);
03cf77522edc07 Jisheng Zhang 2026-09-29  112  	ret = devm_add_action_or_reset(dev, sl261x_pll_put_clk, input);
03cf77522edc07 Jisheng Zhang 2026-09-29  113  	if (ret)
03cf77522edc07 Jisheng Zhang 2026-09-29  114  		return ret;
03cf77522edc07 Jisheng Zhang 2026-09-29  115  
03cf77522edc07 Jisheng Zhang 2026-09-29  116  	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
03cf77522edc07 Jisheng Zhang 2026-09-29  117  	if (!pll)
03cf77522edc07 Jisheng Zhang 2026-09-29  118  		return -ENOMEM;
03cf77522edc07 Jisheng Zhang 2026-09-29  119  	pll->ctrl = ctrl;
03cf77522edc07 Jisheng Zhang 2026-09-29  120  
03cf77522edc07 Jisheng Zhang 2026-09-29  121  	init.name = out;
03cf77522edc07 Jisheng Zhang 2026-09-29  122  	init.ops = &sl261x_pllout_ops;
03cf77522edc07 Jisheng Zhang 2026-09-29  123  	init.parent_data = &parent;
03cf77522edc07 Jisheng Zhang 2026-09-29  124  	init.num_parents = 1;
03cf77522edc07 Jisheng Zhang 2026-09-29  125  	init.flags = CLK_GET_RATE_NOCACHE;
03cf77522edc07 Jisheng Zhang 2026-09-29  126  	pll->pllout.init = &init;
03cf77522edc07 Jisheng Zhang 2026-09-29  127  
03cf77522edc07 Jisheng Zhang 2026-09-29  128  	ret = devm_clk_hw_register(dev, &pll->pllout);
03cf77522edc07 Jisheng Zhang 2026-09-29  129  	if (ret)
03cf77522edc07 Jisheng Zhang 2026-09-29  130  		return dev_err_probe(dev, ret, "failed to register pllout\n");
03cf77522edc07 Jisheng Zhang 2026-09-29  131  
03cf77522edc07 Jisheng Zhang 2026-09-29  132  	init.name = outf;
03cf77522edc07 Jisheng Zhang 2026-09-29  133  	init.ops = &sl261x_plloutf_ops;
03cf77522edc07 Jisheng Zhang 2026-09-29  134  	pll->plloutf.init = &init;
03cf77522edc07 Jisheng Zhang 2026-09-29  135  
03cf77522edc07 Jisheng Zhang 2026-09-29  136  	ret = devm_clk_hw_register(dev, &pll->plloutf);
03cf77522edc07 Jisheng Zhang 2026-09-29  137  	if (ret)
03cf77522edc07 Jisheng Zhang 2026-09-29  138  		return dev_err_probe(dev, ret, "failed to register plloutf\n");
03cf77522edc07 Jisheng Zhang 2026-09-29  139  
03cf77522edc07 Jisheng Zhang 2026-09-29  140  	return 0;
03cf77522edc07 Jisheng Zhang 2026-09-29  141  }
03cf77522edc07 Jisheng Zhang 2026-09-29  142  EXPORT_SYMBOL_GPL(sl261x_pll_register);
03cf77522edc07 Jisheng Zhang 2026-09-29  143  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
