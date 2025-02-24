Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4401F5FA
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Feb 2025 21:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740431082; cv=none; b=KkSFnXMK2mPY0b/rwcWiVk8XlV3IU/3DxqCjpuXb/ifhTPJWSsJ14ck1Yu4n3FXOjn2Mcr/9qFogfbUY840PzpQKZDTTeJugLDEwhKuEK5+RbxtNk3NLhnWbsrmA97O6jvnxtQa636zekNho6KUF9Fzp9fIwzKfV1uDdFKwhefM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740431082; c=relaxed/simple;
	bh=hH63CFaeaJt4aNfR6rTdBnr2WjBA7L3KHcFZCZWoU7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ozgTdobxL0TGhUIXO3Dxy3lI94w2RhbpSGjMq58G6acgvIqdTKyRBqJLyz2eaVGocSsBCSjBc0Wz6FeK13dlGW8Hz7JXh3tDwJ67BOszVfEaeHyJjgFARAvJDSersYSPWeahKOnpdItc+HifIbDpuil1w6tjaQQ57+s3LXhh5Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMuq9sKx; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMuq9sKx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740431080; x=1771967080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hH63CFaeaJt4aNfR6rTdBnr2WjBA7L3KHcFZCZWoU7s=;
  b=VMuq9sKxohkYsHrG5ElVdfZLLWYpj/Jp1YttE3eL4dC9y24YSW5R1Ved
   7aQUfuRyTFXabaJ8i7murXdH6lYmoyG1s6+83rxM0/CFqYj6MnR+/dkPk
   A9jhb/XH0fbASHNOWiESE03gN/+So66V9mmuR/f+CoSahMGOJCQw+oP7y
   ReWzL8R+MS4JPyiod4LvmfQtMM4wXAonTYs+bOPWkVg+8UMT9sWhkHZjA
   NOtWDlSPRvis2XiAZOCllPhSiHTXVGMXcWfn8pLxeHfRxmHHd1Z4naLt7
   snMbv4WjFIaQv/1jWtSPQ+MB1vBLvKOcHWYKnD3d0QhPb2yQ3//MuxkBG
   w==;
X-CSE-ConnectionGUID: zNt5Y5P4TQi1bDlDZdN0vw==
X-CSE-MsgGUID: NMu2qobGRE2wICFZITL1/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="45119883"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="45119883"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 13:04:40 -0800
X-CSE-ConnectionGUID: a42x06DNQvu3rh8mE18boQ==
X-CSE-MsgGUID: nmXjC/mFSrK8/EdNLFG3fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="121267657"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 24 Feb 2025 13:04:39 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmfct-0009Kl-1u;
	Mon, 24 Feb 2025 21:04:32 +0000
Date: Tue, 25 Feb 2025 05:04:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/phy/xilinx/phy-zynqmp.c:822:5-35: opportunity for
 str_yes_no(pll_status & PLL_STATUS_LOCKED)
Message-ID: <202502250559.0GF4hhUq-lkp@intel.com>
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
TO: Sean Anderson <sean.anderson@linux.dev>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d082ecbc71e9e0bf49883ee4afd435a77a5101b6
commit: 04490b621ab16d09ce5b7c62b2c8cc9fdb871421 phy: zynqmp: Add debugfs support
date:   8 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 8 months ago
config: mips-randconfig-r052-20250224 (https://download.01.org/0day-ci/archive/20250225/202502250559.0GF4hhUq-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202502250559.0GF4hhUq-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/phy/xilinx/phy-zynqmp.c:822:5-35: opportunity for str_yes_no(pll_status & PLL_STATUS_LOCKED)

vim +822 drivers/phy/xilinx/phy-zynqmp.c

4a33bea003144e2 Anurag Kumar Vulisha 2020-06-29  799  
04490b621ab16d0 Sean Anderson        2024-06-28  800  /*
04490b621ab16d0 Sean Anderson        2024-06-28  801   * DebugFS
04490b621ab16d0 Sean Anderson        2024-06-28  802   */
04490b621ab16d0 Sean Anderson        2024-06-28  803  
04490b621ab16d0 Sean Anderson        2024-06-28  804  static int xpsgtr_status_read(struct seq_file *seq, void *data)
04490b621ab16d0 Sean Anderson        2024-06-28  805  {
04490b621ab16d0 Sean Anderson        2024-06-28  806  	struct device *dev = seq->private;
04490b621ab16d0 Sean Anderson        2024-06-28  807  	struct xpsgtr_phy *gtr_phy = dev_get_drvdata(dev);
04490b621ab16d0 Sean Anderson        2024-06-28  808  	struct clk *clk;
04490b621ab16d0 Sean Anderson        2024-06-28  809  	u32 pll_status;
04490b621ab16d0 Sean Anderson        2024-06-28  810  
04490b621ab16d0 Sean Anderson        2024-06-28  811  	mutex_lock(&gtr_phy->phy->mutex);
04490b621ab16d0 Sean Anderson        2024-06-28  812  	pll_status = xpsgtr_read_phy(gtr_phy, L0_PLL_STATUS_READ_1);
04490b621ab16d0 Sean Anderson        2024-06-28  813  	clk = gtr_phy->dev->clk[gtr_phy->refclk];
04490b621ab16d0 Sean Anderson        2024-06-28  814  
04490b621ab16d0 Sean Anderson        2024-06-28  815  	seq_printf(seq, "Lane:            %u\n", gtr_phy->lane);
04490b621ab16d0 Sean Anderson        2024-06-28  816  	seq_printf(seq, "Protocol:        %s\n",
04490b621ab16d0 Sean Anderson        2024-06-28  817  		   xpsgtr_icm_str[gtr_phy->protocol]);
04490b621ab16d0 Sean Anderson        2024-06-28  818  	seq_printf(seq, "Instance:        %u\n", gtr_phy->instance);
04490b621ab16d0 Sean Anderson        2024-06-28  819  	seq_printf(seq, "Reference clock: %u (%pC)\n", gtr_phy->refclk, clk);
04490b621ab16d0 Sean Anderson        2024-06-28  820  	seq_printf(seq, "Reference rate:  %lu\n", clk_get_rate(clk));
04490b621ab16d0 Sean Anderson        2024-06-28  821  	seq_printf(seq, "PLL locked:      %s\n",
04490b621ab16d0 Sean Anderson        2024-06-28 @822  		   pll_status & PLL_STATUS_LOCKED ? "yes" : "no");
04490b621ab16d0 Sean Anderson        2024-06-28  823  
04490b621ab16d0 Sean Anderson        2024-06-28  824  	mutex_unlock(&gtr_phy->phy->mutex);
04490b621ab16d0 Sean Anderson        2024-06-28  825  	return 0;
04490b621ab16d0 Sean Anderson        2024-06-28  826  }
04490b621ab16d0 Sean Anderson        2024-06-28  827  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
