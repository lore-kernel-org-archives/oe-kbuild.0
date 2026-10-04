Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521712AD35
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Oct 2026 05:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791092137; cv=none; b=LSCtXna2/UEIg4cLAa5GouV55Rm+xAtCjyIRVcnYnTDKbdlzWLiwL/Ab6JB1EeEVw2yFroDQ79W9G15cv2HEVkiB9VAJY1eQEjAt+X7A0qq8Lr9o8usQnqN5bA1ZZRnRDqM6SkSZdOisRYB3AUyZ2BBFD6/eWvDE5oDtAD+rE0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791092137; c=relaxed/simple;
	bh=3fnaE0BZUQu81CNze1XE8wyOk6YiAgvCZNaXgJCZRko=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JLYut4e3f+PLdkQSZN5gGtT9VmLh4hOEVSH/vtALB750cYZaRsgjzFbTD68js9tcRAe3QU/0CwT/Gga7A6AuA3MFGStY2vBNXcoPsiUyvh9vx0Sh2dJ+SbprecHDfIluJEb9nOwWubJNRPNWFM/itfiItB5u21cDFAsWMbiVr8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HvKBrWdX; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HvKBrWdX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791092135; x=1822628135;
  h=date:from:to:cc:subject:message-id;
  bh=3fnaE0BZUQu81CNze1XE8wyOk6YiAgvCZNaXgJCZRko=;
  b=HvKBrWdXAOEeGYBoe19EANDgkkD2hiMdwTuC0YgwTrrtUPrevqNqiBYE
   4HrCqKpQskmnxd/tJcKXCiwrBp2KXUKL1xtRDlEm9ETrTlu9sG83dugMG
   h7ZZZuYeDy+0AU5RsOXpwEVf8owf4Ko+eiEFcFQpQKSpnpNX9e4s0P4yQ
   OCcFBYZSE1AfXYoQKtIcx+jWbBSTw5dHfFSZqIaQfiG2t6TVy27U771AH
   WWQb82d7lun+HxQ5zBMlSmopeD0fJpv8FM/N+VrLV/iOrEDiTEaDiqIp7
   fc7G4XQpoCJO6mcGYkBpQ02+xK0nZC5Eq05K4ArSJWVVyIGE3luQ64LSJ
   Q==;
X-CSE-ConnectionGUID: QSWNWssnQpWMmAjOxgK9ow==
X-CSE-MsgGUID: xp/jjKrSSXeAOkknpHCq2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="103168226"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="103168226"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 22:35:34 -0700
X-CSE-ConnectionGUID: aN/utgEOT7Cu7im5TiJpPQ==
X-CSE-MsgGUID: Zqz1ax3sQx6f/h7f2vY3XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="314554038"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 03 Oct 2026 22:35:33 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDEsl-000000000Cx-10RA;
	Sun, 04 Oct 2026 05:35:31 +0000
Date: Sun, 04 Oct 2026 07:35:03 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/clk/berlin/sl261x-pll.c:104 sl261x_pll_register()
 warn: variable dereferenced before check 'dev' (see line 97)
Message-ID: <202610040708.FiQ4iMQR-lkp@intel.com>
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
date:   5 days ago
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-r2200-20261003 (https://download.01.org/0day-ci/archive/20261004/202610040708.FiQ4iMQR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610040708.FiQ4iMQR-lkp@intel.com/

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
