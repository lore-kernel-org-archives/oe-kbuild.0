Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D55D171C9
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Nov 2025 14:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762698777; cv=none; b=ZKy7Fu/v1Wu9QAPVRvtLfuDBFYQoJNQszceqwg7VhM2MmxRsCBBA7DbP9UZyVx7gTFjKXr5ZZVYPO1s8fECChq+uAudS3w5rERl0P3I0joXx8jZ9dIiBEy4n2vLTHHEyZY59Ig86cQfwIK7E8VJlx0lcAGUtDRE4HvnKxMT7Vmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762698777; c=relaxed/simple;
	bh=kFaAlWkx/Pf3O80GyPTKcb2pKgguBGw11uxhmbYiSxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=orHZL/8X+C3QSagmlJyJrEMBwgd8Lr/02WkKmyouXHDm5etTWPyvabFXA64UfjFuuGcs1T6Jo2UTTLCaTdp44trhHBMc/Ak9AO75+Uc1y5UZIXY2umv4YQ5bC+wFLoTUpSjq5Fdo3cBaMfJH10k4NVg3bxXU2bc04XZ/31ntczQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TlFpdMfu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TlFpdMfu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762698776; x=1794234776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kFaAlWkx/Pf3O80GyPTKcb2pKgguBGw11uxhmbYiSxE=;
  b=TlFpdMfuIGz+plpcj2W8y6y0vHsSGAUwmM6TNodVIiHDR0PHkOee0gY0
   cSSkS/i3hZl2cn3VHg4GSoscS4916zVcm3W2zabWpj5q22nAmiziTYzfT
   JKWOYFbAKTob/VDU8au9gg8+MjzMVufKcAy1Tr3ts1v3tvkTNdDzOVGZB
   hfsUionUr9C960pjk3NF7CiWirvtwR96VdB4rAnaZGJNgvtU8mWY6YZwy
   c7T61jfqDliubHZkgL4O10h+FRnhy4HteBx07kOS2XiqfbsYyewW+7802
   Kio8ehRfJ9bOGIQDEGeWl3aWKnnX+lgCqJFkIxJ8NnXijvp1LMSxfcFnX
   w==;
X-CSE-ConnectionGUID: Kd+vWpDmRASSw7PmWaCvTQ==
X-CSE-MsgGUID: MyP5zlY5SPSivch7IfPC2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="82169814"
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="82169814"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 06:32:56 -0800
X-CSE-ConnectionGUID: bYxfD5YSTQe7WrIPq5CQuQ==
X-CSE-MsgGUID: vkt45GPDTFWv73KRd8dDYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="193484383"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Nov 2025 06:32:53 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vI6TL-00024B-2T;
	Sun, 09 Nov 2025 14:32:51 +0000
Date: Sun, 9 Nov 2025 22:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/clk/zynqmp/divider.c:140 zynqmp_clk_divider_determine_rate()
 error: uninitialized symbol 'bestdiv'.
Message-ID: <202511092201.t8NglRub-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Brian Masney <bmasney@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   439fc29dfd3b9c072dfff292d91cfa2f6cfb702b
commit: 0f9cf96a01fd8cb690292a5c24fbfda5c6dd47b2 clk: zynqmp: divider: convert from round_rate() to determine_rate()
date:   9 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 9 weeks ago
config: arm64-randconfig-r072-20251109 (https://download.01.org/0day-ci/archive/20251109/202511092201.t8NglRub-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b9ea93cd5c37fb6d606502fd01208dd48330549d)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511092201.t8NglRub-lkp@intel.com/

New smatch warnings:
drivers/clk/zynqmp/divider.c:140 zynqmp_clk_divider_determine_rate() error: uninitialized symbol 'bestdiv'.

Old smatch warnings:
drivers/clk/zynqmp/divider.c:96 zynqmp_clk_divider_recalc_rate() error: uninitialized symbol 'div'.
drivers/clk/zynqmp/divider.c:98 zynqmp_clk_divider_recalc_rate() error: uninitialized symbol 'div'.
drivers/clk/zynqmp/divider.c:142 zynqmp_clk_divider_determine_rate() error: uninitialized symbol 'bestdiv'.

vim +/bestdiv +140 drivers/clk/zynqmp/divider.c

3fde0e16d016ec Jolly Shah       2018-10-08  112  
3fde0e16d016ec Jolly Shah       2018-10-08  113  /**
3fde0e16d016ec Jolly Shah       2018-10-08  114   * zynqmp_clk_divider_round_rate() - Round rate of divider clock
3fde0e16d016ec Jolly Shah       2018-10-08  115   * @hw:			handle between common and hardware-specific interfaces
3fde0e16d016ec Jolly Shah       2018-10-08  116   * @rate:		rate of clock to be set
3fde0e16d016ec Jolly Shah       2018-10-08  117   * @prate:		rate of parent clock
3fde0e16d016ec Jolly Shah       2018-10-08  118   *
3fde0e16d016ec Jolly Shah       2018-10-08  119   * Return: 0 on success else error+reason
3fde0e16d016ec Jolly Shah       2018-10-08  120   */
0f9cf96a01fd8c Brian Masney     2025-08-28  121  static int zynqmp_clk_divider_determine_rate(struct clk_hw *hw,
0f9cf96a01fd8c Brian Masney     2025-08-28  122  					     struct clk_rate_request *req)
3fde0e16d016ec Jolly Shah       2018-10-08  123  {
3fde0e16d016ec Jolly Shah       2018-10-08  124  	struct zynqmp_clk_divider *divider = to_zynqmp_clk_divider(hw);
3fde0e16d016ec Jolly Shah       2018-10-08  125  	const char *clk_name = clk_hw_get_name(hw);
3fde0e16d016ec Jolly Shah       2018-10-08  126  	u32 clk_id = divider->clk_id;
3fde0e16d016ec Jolly Shah       2018-10-08  127  	u32 div_type = divider->div_type;
3fde0e16d016ec Jolly Shah       2018-10-08  128  	u32 bestdiv;
3fde0e16d016ec Jolly Shah       2018-10-08  129  	int ret;
1fe15be1fb6135 Jay Buddhabhatti 2023-11-29  130  	u8 width;
3fde0e16d016ec Jolly Shah       2018-10-08  131  
3fde0e16d016ec Jolly Shah       2018-10-08  132  	/* if read only, just return current value */
3fde0e16d016ec Jolly Shah       2018-10-08  133  	if (divider->flags & CLK_DIVIDER_READ_ONLY) {
0667a8d144bc83 Rajan Vaja       2020-04-24  134  		ret = zynqmp_pm_clock_getdivider(clk_id, &bestdiv);
3fde0e16d016ec Jolly Shah       2018-10-08  135  
3fde0e16d016ec Jolly Shah       2018-10-08  136  		if (ret)
4917394e0c765e Michael Tretter  2022-01-19  137  			pr_debug("%s() get divider failed for %s, ret = %d\n",
3fde0e16d016ec Jolly Shah       2018-10-08  138  				 __func__, clk_name, ret);
3fde0e16d016ec Jolly Shah       2018-10-08  139  		if (div_type == TYPE_DIV1)
3fde0e16d016ec Jolly Shah       2018-10-08 @140  			bestdiv = bestdiv & 0xFFFF;
3fde0e16d016ec Jolly Shah       2018-10-08  141  		else
3fde0e16d016ec Jolly Shah       2018-10-08  142  			bestdiv  = bestdiv >> 16;
3fde0e16d016ec Jolly Shah       2018-10-08  143  
34bbe036170785 Tejas Patel      2019-12-04  144  		if (divider->flags & CLK_DIVIDER_POWER_OF_TWO)
34bbe036170785 Tejas Patel      2019-12-04  145  			bestdiv = 1 << bestdiv;
34bbe036170785 Tejas Patel      2019-12-04  146  
0f9cf96a01fd8c Brian Masney     2025-08-28  147  		req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, bestdiv);
0f9cf96a01fd8c Brian Masney     2025-08-28  148  
0f9cf96a01fd8c Brian Masney     2025-08-28  149  		return 0;
3fde0e16d016ec Jolly Shah       2018-10-08  150  	}
3fde0e16d016ec Jolly Shah       2018-10-08  151  
1fe15be1fb6135 Jay Buddhabhatti 2023-11-29  152  	width = fls(divider->max_div);
4ebd92d2e228ce Rajan Vaja       2019-12-04  153  
0f9cf96a01fd8c Brian Masney     2025-08-28  154  	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
0f9cf96a01fd8c Brian Masney     2025-08-28  155  				       NULL, width, divider->flags);
0541e0217ac8da Rajan Vaja       2020-03-02  156  
0f9cf96a01fd8c Brian Masney     2025-08-28  157  	if (divider->is_frac && (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) &&
0f9cf96a01fd8c Brian Masney     2025-08-28  158  	    (req->rate % req->best_parent_rate))
0f9cf96a01fd8c Brian Masney     2025-08-28  159  		req->best_parent_rate = req->rate;
3fde0e16d016ec Jolly Shah       2018-10-08  160  
0f9cf96a01fd8c Brian Masney     2025-08-28  161  	return 0;
3fde0e16d016ec Jolly Shah       2018-10-08  162  }
3fde0e16d016ec Jolly Shah       2018-10-08  163  

:::::: The code at line 140 was first introduced by commit
:::::: 3fde0e16d016ecb273f0fa404b5d56b947fc0576 drivers: clk: Add ZynqMP clock driver

:::::: TO: Jolly Shah <jolly.shah@xilinx.com>
:::::: CC: Michal Simek <michal.simek@xilinx.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
