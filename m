Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A7A15D1
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Jul 2025 07:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752910368; cv=none; b=MsswnjB7AdRIRQlt2vJfNDfBfjlBkQMTqw0zGez7KtRNcRpuNe8jkE6mYZYSX+mkHNCbX58XECFrqSyUOrF/OgZdc7g4b0Gcnvw0WImRbWp0J2UBw2gNsrROaEis6aMyIWBdX7mvJyUAb59b3BvLQlexfCWSdjuS4TaA2w8toRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752910368; c=relaxed/simple;
	bh=zYfyGF2pEoUbQgRV3sKk7MXEmVT6vDR3JjmH/NlzRoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eY32V5z9v3VlBj8jDce+lAyRfu/L9ZEu8mCUjObAH0z7U8MdCBFZe+k3k+kR+LNYyC6t36XjC3xN7BgvQKwoXwUycI9yrcFK2mxrL3wqK6p3mNrHd79gF58kFdlzAAQYDjvOMTG4X6KYLTSYEC29Q3OvWA/tVwXlCuS48GwtiEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IahYckaK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IahYckaK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752910367; x=1784446367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zYfyGF2pEoUbQgRV3sKk7MXEmVT6vDR3JjmH/NlzRoM=;
  b=IahYckaKQszoGIINtsFvsxQzLqJ+8yB2w0WsnTvNwABZgFnaqezV+s8T
   J+oqX/Lf89FGlcMPeomfRCIi9t+cDL701VC92kZCM+6E9GY1TDng4XIlV
   NnPj4aaMT9LSlGGoQUvFc5MyXSmD+5r3X2gI856iGpE09DPdJrs1CMuQD
   7YcuSnja+BMZu5pvd9lZbQjxE7aUcf+tStOZrjudQqJs27XLhXj7Qp+eT
   8jDsmHtGZoVWVadjIV1yVvccLBNiqJMvh1zis2sPzvvRS4Xxfwk+QKs4P
   NpE8htxX3iASZBnxX7ZfWLcOkLUhp7CNPlmi31h9msobDZGO+eDfC5u0P
   A==;
X-CSE-ConnectionGUID: VD2k30kBRSWmeV+kE4SQ8A==
X-CSE-MsgGUID: 6/BQKr2HSUeC8n8mxTGmBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="59010256"
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="59010256"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 00:32:46 -0700
X-CSE-ConnectionGUID: SsVqDmjrQHaFgmXAOYO8qA==
X-CSE-MsgGUID: oY1C442bRK6gyiSjD89rLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="195481926"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Jul 2025 00:32:44 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ud23m-000FJZ-2R;
	Sat, 19 Jul 2025 07:32:42 +0000
Date: Sat, 19 Jul 2025 15:32:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] i2c: spacemit: configure ILCR for accurate SCL
 frequency
Message-ID: <202507191525.xti6Z0zL-lkp@intel.com>
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
In-Reply-To: <20250718-k1-i2c-ilcr-v2-1-b4c68f13dcb1@linux.spacemit.com>
References: <20250718-k1-i2c-ilcr-v2-1-b4c68f13dcb1@linux.spacemit.com>
TO: Troy Mitchell <troy.mitchell@linux.spacemit.com>
TO: Andi Shyti <andi.shyti@kernel.org>
TO: Yixun Lan <dlan@gentoo.org>
CC: linux-i2c@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: spacemit@lists.linux.dev
CC: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Hi Troy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 733923397fd95405a48f165c9b1fbc8c4b0a4681]

url:    https://github.com/intel-lab-lkp/linux/commits/Troy-Mitchell/i2c-spacemit-configure-ILCR-for-accurate-SCL-frequency/20250718-090843
base:   733923397fd95405a48f165c9b1fbc8c4b0a4681
patch link:    https://lore.kernel.org/r/20250718-k1-i2c-ilcr-v2-1-b4c68f13dcb1%40linux.spacemit.com
patch subject: [PATCH v2] i2c: spacemit: configure ILCR for accurate SCL frequency
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: arc-randconfig-r073-20250719 (https://download.01.org/0day-ci/archive/20250719/202507191525.xti6Z0zL-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507191525.xti6Z0zL-lkp@intel.com/

smatch warnings:
drivers/i2c/busses/i2c-k1.c:180 spacemit_i2c_clk_set_rate() error: uninitialized symbol 'max_lv'.
drivers/i2c/busses/i2c-k1.c:186 spacemit_i2c_clk_set_rate() error: uninitialized symbol 'mask'.
drivers/i2c/busses/i2c-k1.c:187 spacemit_i2c_clk_set_rate() error: uninitialized symbol 'shift'.

vim +/max_lv +180 drivers/i2c/busses/i2c-k1.c

dc25e6192792e0 Troy Mitchell 2025-07-18  161  
dc25e6192792e0 Troy Mitchell 2025-07-18  162  static int spacemit_i2c_clk_set_rate(struct clk_hw *hw, unsigned long rate,
dc25e6192792e0 Troy Mitchell 2025-07-18  163  				     unsigned long parent_rate)
dc25e6192792e0 Troy Mitchell 2025-07-18  164  {
dc25e6192792e0 Troy Mitchell 2025-07-18  165  	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
dc25e6192792e0 Troy Mitchell 2025-07-18  166  	u32 lv, lcr, mask, shift, max_lv;
dc25e6192792e0 Troy Mitchell 2025-07-18  167  
dc25e6192792e0 Troy Mitchell 2025-07-18  168  	lv = DIV_ROUND_UP(parent_rate, rate);
dc25e6192792e0 Troy Mitchell 2025-07-18  169  
dc25e6192792e0 Troy Mitchell 2025-07-18  170  	if (i2c->mode == SPACEMIT_MODE_STANDARD) {
dc25e6192792e0 Troy Mitchell 2025-07-18  171  		mask = SPACEMIT_LCR_LV_STANDARD_MASK;
dc25e6192792e0 Troy Mitchell 2025-07-18  172  		shift = SPACEMIT_LCR_LV_STANDARD_SHIFT;
dc25e6192792e0 Troy Mitchell 2025-07-18  173  		max_lv = SPACEMIT_LCR_LV_STANDARD_MAX_VALUE;
dc25e6192792e0 Troy Mitchell 2025-07-18  174  	} else if (i2c->mode == SPACEMIT_MODE_FAST) {
dc25e6192792e0 Troy Mitchell 2025-07-18  175  		mask = SPACEMIT_LCR_LV_FAST_MASK;
dc25e6192792e0 Troy Mitchell 2025-07-18  176  		shift = SPACEMIT_LCR_LV_FAST_SHIFT;
dc25e6192792e0 Troy Mitchell 2025-07-18  177  		max_lv = SPACEMIT_LCR_LV_FAST_MAX_VALUE;
dc25e6192792e0 Troy Mitchell 2025-07-18  178  	}
dc25e6192792e0 Troy Mitchell 2025-07-18  179  
dc25e6192792e0 Troy Mitchell 2025-07-18 @180  	if (!lv || lv > max_lv) {
dc25e6192792e0 Troy Mitchell 2025-07-18  181  		dev_err(i2c->dev, "set scl clock failed: lv 0x%x", lv);
dc25e6192792e0 Troy Mitchell 2025-07-18  182  		return -EINVAL;
dc25e6192792e0 Troy Mitchell 2025-07-18  183  	}
dc25e6192792e0 Troy Mitchell 2025-07-18  184  
dc25e6192792e0 Troy Mitchell 2025-07-18  185  	lcr = readl(i2c->base + SPACEMIT_ILCR);
dc25e6192792e0 Troy Mitchell 2025-07-18 @186  	lcr &= ~mask;
dc25e6192792e0 Troy Mitchell 2025-07-18 @187  	lcr |= lv << shift;
dc25e6192792e0 Troy Mitchell 2025-07-18  188  	writel(lcr, i2c->base + SPACEMIT_ILCR);
dc25e6192792e0 Troy Mitchell 2025-07-18  189  
dc25e6192792e0 Troy Mitchell 2025-07-18  190  	return 0;
dc25e6192792e0 Troy Mitchell 2025-07-18  191  }
dc25e6192792e0 Troy Mitchell 2025-07-18  192  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
