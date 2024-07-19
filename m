Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A47A1459FA
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Jul 2024 16:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721406338; cv=none; b=GSIyVjP90rOKAlDgvI6t5HfaCKvyqYzMmyKsCPmvZ4ieUt00Pa7hPviYR7SFcO6cLOmj0RI8BbC4P7MWecuzIYg8+1lZm2SQ1geo/5DfnAMh1Ih5Rq+yzalR+d3CQKvQdCyJ5ngEG8f68fJiD/WgX9iaSutyqCeVug85clVvAI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721406338; c=relaxed/simple;
	bh=6yH00IoA6ospUFT1ky8HUewRLnCkGcaGxFvl341bTFM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UPVBCFcaCPqP0MmC1T5qfQgtDtB19T9IwjsROhrGp6YWaKVEmOI1vNVpD2Vyz13aeDCXzg5eHJZXOkfUWHDMXouzY84X8yJ450HRk+EGqoT8M2tr3/VtBJ31RJXB6mWPSg02pNr4L2lYDRr9VdY+33V3YCnl5oZj/8vgowEywTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0v+j85A; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0v+j85A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721406336; x=1752942336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6yH00IoA6ospUFT1ky8HUewRLnCkGcaGxFvl341bTFM=;
  b=J0v+j85AMnQ2x8jxCV3blLXDxhUvSR39kynFOCKYkG8szPsYx7LcpKYd
   5NNxHMRYlqmHAXII7HnAcO9cL2C8+7AJz/PaFwtVG7Wx2QJQYwpHQ7Jvg
   Xj2AgSnKL9U1MQfbP2DNHfTXlCliqSjO/kmzUCJnHuqq5m9M5eAwnNgjg
   8cICw7LOypZ/9aVjc/Ys2FqZtZAwa6EzFOHzoiPrRUf+GuDkVz2xX/X8h
   U2Q/HgDCenrgATozNawMDNchCWOy3Jw9HMYKDVFIx1ghkfzgpLs5BhGMk
   CPAwlVTxbQu0LzXfYy6dqE05NFoS0f5HPyi8NV+Ex7CLBjtOCptw02plH
   A==;
X-CSE-ConnectionGUID: KxMYkMZ5QdeZCY0Cuzle/Q==
X-CSE-MsgGUID: jkyLEELJQYmYdimX/YuEGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="19175982"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; 
   d="scan'208";a="19175982"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 09:25:33 -0700
X-CSE-ConnectionGUID: 7aBszBr8S3WRyZyUzNpCeQ==
X-CSE-MsgGUID: AzCdTLAIRAyKvWb8pzOajA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; 
   d="scan'208";a="56007047"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Jul 2024 09:25:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUqQD-000iNF-2m;
	Fri, 19 Jul 2024 16:25:29 +0000
Date: Sat, 20 Jul 2024 00:25:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 3/4] clk: samsung: clk-pll: Add support for pll_531x
Message-ID: <202407200028.5AADGhmj-lkp@intel.com>
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
In-Reply-To: <20240707231331.3433340-4-sunyeal.hong@samsung.com>
References: <20240707231331.3433340-4-sunyeal.hong@samsung.com>
TO: Sunyeal Hong <sunyeal.hong@samsung.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Sylwester Nawrocki <s.nawrocki@samsung.com>
TO: Chanwoo Choi <cw00.choi@samsung.com>
TO: Alim Akhtar <alim.akhtar@samsung.com>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-samsung-soc@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Sunyeal Hong <sunyeal.hong@samsung.com>

Hi Sunyeal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on pinctrl-samsung/for-next krzk-dt/for-next linus/master v6.10 next-20240719]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sunyeal-Hong/dt-bindings-clock-add-Exynos-Auto-v920-SoC-CMU-bindings/20240708-072150
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20240707231331.3433340-4-sunyeal.hong%40samsung.com
patch subject: [PATCH v2 3/4] clk: samsung: clk-pll: Add support for pll_531x
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: arc-randconfig-r071-20240719 (https://download.01.org/0day-ci/archive/20240720/202407200028.5AADGhmj-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407200028.5AADGhmj-lkp@intel.com/

smatch warnings:
drivers/clk/samsung/clk-pll.c:1292 samsung_pll531x_recalc_rate() warn: mask and shift to zero: expr='fdiv >> 31'

vim +1292 drivers/clk/samsung/clk-pll.c

5c788df7a25de7 Sunyeal Hong 2024-07-08  1276  
5c788df7a25de7 Sunyeal Hong 2024-07-08  1277  static unsigned long samsung_pll531x_recalc_rate(struct clk_hw *hw,
5c788df7a25de7 Sunyeal Hong 2024-07-08  1278  						 unsigned long parent_rate)
5c788df7a25de7 Sunyeal Hong 2024-07-08  1279  {
5c788df7a25de7 Sunyeal Hong 2024-07-08  1280  	struct samsung_clk_pll *pll = to_clk_pll(hw);
5c788df7a25de7 Sunyeal Hong 2024-07-08  1281  	u32 mdiv, pdiv, sdiv, pll_con0, pll_con8;
5c788df7a25de7 Sunyeal Hong 2024-07-08  1282  	s32 fdiv;
5c788df7a25de7 Sunyeal Hong 2024-07-08  1283  	u64 fout = parent_rate;
5c788df7a25de7 Sunyeal Hong 2024-07-08  1284  
5c788df7a25de7 Sunyeal Hong 2024-07-08  1285  	pll_con0 = readl_relaxed(pll->con_reg);
5c788df7a25de7 Sunyeal Hong 2024-07-08  1286  	pll_con8 = readl_relaxed(pll->con_reg + 20);
5c788df7a25de7 Sunyeal Hong 2024-07-08  1287  	mdiv = (pll_con0 >> PLL531X_MDIV_SHIFT) & PLL531X_MDIV_MASK;
5c788df7a25de7 Sunyeal Hong 2024-07-08  1288  	pdiv = (pll_con0 >> PLL531X_PDIV_SHIFT) & PLL531X_PDIV_MASK;
5c788df7a25de7 Sunyeal Hong 2024-07-08  1289  	sdiv = (pll_con0 >> PLL531X_SDIV_SHIFT) & PLL531X_SDIV_MASK;
5c788df7a25de7 Sunyeal Hong 2024-07-08  1290  	fdiv = (s32)(pll_con8 & PLL531X_FDIV_MASK);
5c788df7a25de7 Sunyeal Hong 2024-07-08  1291  
5c788df7a25de7 Sunyeal Hong 2024-07-08 @1292  	if (fdiv >> 31)
5c788df7a25de7 Sunyeal Hong 2024-07-08  1293  		mdiv--;
5c788df7a25de7 Sunyeal Hong 2024-07-08  1294  
5c788df7a25de7 Sunyeal Hong 2024-07-08  1295  	fout *= ((u64)mdiv << 24) + (fdiv >> 8);
5c788df7a25de7 Sunyeal Hong 2024-07-08  1296  	do_div(fout, (pdiv << sdiv));
5c788df7a25de7 Sunyeal Hong 2024-07-08  1297  	fout >>= 24;
5c788df7a25de7 Sunyeal Hong 2024-07-08  1298  
5c788df7a25de7 Sunyeal Hong 2024-07-08  1299  	return (unsigned long)fout;
5c788df7a25de7 Sunyeal Hong 2024-07-08  1300  }
5c788df7a25de7 Sunyeal Hong 2024-07-08  1301  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
