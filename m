Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DFE2AE8B
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Jan 2025 20:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738097191; cv=none; b=UjT+9tMDiD7qeXvREXZmtOGIY56kx8MV9jSm3cr92J5YoXQLJ5klmatKDYKrBXFAI2HefI+3wYw9VADhPpN3nXUTn1sEl1uQUDylZzbDt5A49UqWEN/87CV3oBMpd4bkheYr471vAvwH3SoDuCnpDysIUk4vRFxUeRPHv0iFfw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738097191; c=relaxed/simple;
	bh=rRSu3qXZUU8WkJZiigUJrYDl3efGrTRRbVKWlX0ee30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Iu5UCgTXf4O0cltQ6hH0nZjDtdFjFMYNEgVyoxglOBFb5RTC8cd27zpLAosRBBlz8S4BrjFJ8GHZxms9g6FiFii2OyC2pOWiVkZCL6qpC++yr9qPh8cMOFUN+ONLeirD2yoGI7z2iRc02b4QWsniHIInCHXX0YQwkLrqGRwZSJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T6QHzwgp; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6QHzwgp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738097189; x=1769633189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rRSu3qXZUU8WkJZiigUJrYDl3efGrTRRbVKWlX0ee30=;
  b=T6QHzwgp9mGSmBu4Nga7Fj35mErnhBUmD59YCnL0DT/n03nGgSbotft9
   88MgpYulKKm4aubxaYbVIxbpv2KG9oHyLkgwSAtM1dQ7r/fGmW3/9jFpT
   Cyj3NRJ2pJU2oysISiBzdZq8DZOOrzQquhHoDUXP/1B7pGs5qttGY18jX
   H/yI6KBoEi77Wi3aB2bT5YIptL41n7xLk150SbXX59JKD/R50w+QqP1GU
   A4Wd1xy8C0ZPl30zD9lNoh3ge1hybyiKiz6dow9m9FLLgTMT9xk0OoB31
   WnayKdOsE3+OXjBoeecUyoJkw8dNOWBuTOMomT5Fh644sqCftCKoPSNTU
   A==;
X-CSE-ConnectionGUID: Gii3lPAKTlG4E593pSMtxQ==
X-CSE-MsgGUID: VwtOSE7iTHST3pv9sohjag==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="37844661"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="37844661"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 12:46:28 -0800
X-CSE-ConnectionGUID: UqRpxAfHQJSizd//ZO4EPg==
X-CSE-MsgGUID: rV3blx8aTuOzeJ9ZD5w+Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="108725334"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Jan 2025 12:46:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcsTZ-000iBv-2t;
	Tue, 28 Jan 2025 20:46:25 +0000
Date: Wed, 29 Jan 2025 04:46:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/3] clk: Introduce clk_set_spread_spectrum
Message-ID: <202501290426.C0eOwFDB-lkp@intel.com>
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
In-Reply-To: <20250124-clk-ssc-v1-1-2d39f6baf2af@nxp.com>
References: <20250124-clk-ssc-v1-1-2d39f6baf2af@nxp.com>
TO: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Russell King <linux@armlinux.org.uk>
TO: Sudeep Holla <sudeep.holla@arm.com>
TO: Cristian Marussi <cristian.marussi@arm.com>
CC: linux-clk@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: arm-scmi@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Dario Binacchi <dario.binacchi@amarulasolutions.com>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Sascha Hauer <s.hauer@pengutronix.de>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: Fabio Estevam <festevam@gmail.com>
CC: imx@lists.linux.dev
CC: Peng Fan <peng.fan@nxp.com>

Hi Peng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5ffa57f6eecefababb8cbe327222ef171943b183]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/clk-Introduce-clk_set_spread_spectrum/20250124-212050
base:   5ffa57f6eecefababb8cbe327222ef171943b183
patch link:    https://lore.kernel.org/r/20250124-clk-ssc-v1-1-2d39f6baf2af%40nxp.com
patch subject: [PATCH 1/3] clk: Introduce clk_set_spread_spectrum
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-r072-20250128 (https://download.01.org/0day-ci/archive/20250129/202501290426.C0eOwFDB-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501290426.C0eOwFDB-lkp@intel.com/

New smatch warnings:
drivers/clk/clk.c:2828 clk_set_spread_spectrum() warn: inconsistent returns 'clk'.

Old smatch warnings:
drivers/clk/clk.c:4211 clk_hw_create_clk() warn: passing zero to 'ERR_CAST'

vim +/clk +2828 drivers/clk/clk.c

4935b22c46ea5e James Hogan 2013-07-29  2792  
26268b725cb020 Peng Fan    2025-01-24  2793  int clk_set_spread_spectrum(struct clk *clk, unsigned int modfreq,
26268b725cb020 Peng Fan    2025-01-24  2794  			    unsigned int spreadpercent, unsigned int method,
26268b725cb020 Peng Fan    2025-01-24  2795  			    bool enable)
26268b725cb020 Peng Fan    2025-01-24  2796  {
26268b725cb020 Peng Fan    2025-01-24  2797  	struct clk_spread_spectrum clk_ss;
26268b725cb020 Peng Fan    2025-01-24  2798  	struct clk_core *core;
26268b725cb020 Peng Fan    2025-01-24  2799  	int ret = 0;
26268b725cb020 Peng Fan    2025-01-24  2800  
26268b725cb020 Peng Fan    2025-01-24  2801  	if (!clk || !clk->core)
26268b725cb020 Peng Fan    2025-01-24  2802  		return 0;
26268b725cb020 Peng Fan    2025-01-24  2803  
26268b725cb020 Peng Fan    2025-01-24  2804  	clk_ss.modfreq = modfreq;
26268b725cb020 Peng Fan    2025-01-24  2805  	clk_ss.spreadpercent = spreadpercent;
26268b725cb020 Peng Fan    2025-01-24  2806  	clk_ss.method = method;
26268b725cb020 Peng Fan    2025-01-24  2807  	clk_ss.enable = enable;
26268b725cb020 Peng Fan    2025-01-24  2808  
26268b725cb020 Peng Fan    2025-01-24  2809  	clk_prepare_lock();
26268b725cb020 Peng Fan    2025-01-24  2810  
26268b725cb020 Peng Fan    2025-01-24  2811  	core = clk->core;
26268b725cb020 Peng Fan    2025-01-24  2812  
26268b725cb020 Peng Fan    2025-01-24  2813  	if (core->prepare_count) {
26268b725cb020 Peng Fan    2025-01-24  2814  		ret = -EBUSY;
26268b725cb020 Peng Fan    2025-01-24  2815  		goto fail;
26268b725cb020 Peng Fan    2025-01-24  2816  	}
26268b725cb020 Peng Fan    2025-01-24  2817  
26268b725cb020 Peng Fan    2025-01-24  2818  	ret = clk_pm_runtime_get(core);
26268b725cb020 Peng Fan    2025-01-24  2819  	if (ret)
26268b725cb020 Peng Fan    2025-01-24  2820  		goto fail;
26268b725cb020 Peng Fan    2025-01-24  2821  
26268b725cb020 Peng Fan    2025-01-24  2822  	if (core->ops->set_spread_spectrum)
26268b725cb020 Peng Fan    2025-01-24  2823  		ret = core->ops->set_spread_spectrum(core->hw, &clk_ss);
26268b725cb020 Peng Fan    2025-01-24  2824  
26268b725cb020 Peng Fan    2025-01-24  2825  	clk_pm_runtime_put(core);
26268b725cb020 Peng Fan    2025-01-24  2826  	clk_prepare_unlock();
26268b725cb020 Peng Fan    2025-01-24  2827  fail:
26268b725cb020 Peng Fan    2025-01-24 @2828  	return ret;
26268b725cb020 Peng Fan    2025-01-24  2829  }
26268b725cb020 Peng Fan    2025-01-24  2830  EXPORT_SYMBOL_GPL(clk_set_spread_spectrum);
26268b725cb020 Peng Fan    2025-01-24  2831  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
