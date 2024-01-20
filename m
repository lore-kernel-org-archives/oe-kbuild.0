Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F88DDC1
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Jan 2024 16:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705769752; cv=none; b=BgURnvHFOcST2YcjDBHGPQKR0i8cBoANBkgsYpQEqFRShjrxyz+S8nYdgnmQkFunRtH6Te+wYyy353Ck7xioJzcX2JtvHfIeVZKDA1rbge/WQBz7McqohpW1n6Bhr3iQjFAXZPg+iwb89ir2fAsDRdFsWy+Yt3qI/54xx7PxpGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705769752; c=relaxed/simple;
	bh=AJ41oQa0S8UE9BLgQ/V9J81gv60H7DlDVIBNFygbgIo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bMz5/YGNI9lFGm4nN18AV/GM6YvRaJdO57/2rcyoHPUJ38xHENmJNx7pX6VStZIymqb4cpZS6Cvm0ctzGwGIffU55LyJu48ybqFTll/8jybrCCtInDViKQZ1U8/DBOqP3flwyMx3Aa3HqWe8zddLDF4drTMm6sVer4JUfBzXg00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A1xHtJ8a; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A1xHtJ8a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705769749; x=1737305749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AJ41oQa0S8UE9BLgQ/V9J81gv60H7DlDVIBNFygbgIo=;
  b=A1xHtJ8a308LtygOXXDs7bj6BCEZTWCcYYpkwVk+1au1C9G/9oVO1jjl
   BlVPVhALke3F8YbOLidwDDFNoNB8Rfdk28PMbp/Kb2SWDWeFPqA6xPkUI
   WTHZ4RtEVS51vfpZS0u0rENj+1r2Sy/vCTVk/Z2faM+ltpHi89Z/edfUP
   9EqzLa4eI2lRSRD/xL+R6vakLW7bHabQ9fu3FlSP+z2h43NNWLN6HcY72
   CEyHJgkBtF+l2IQu86IRk1Y71CvdanJpJiRMm5ZbZE2aFEYNYZSNfTkCC
   TQegcvuYB6mrZZhQQIGxfPvdsxiGw5K+RMZ2zdGit8MxMHPP+FXxIWcD5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="8051723"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="8051723"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 08:55:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="922984"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Jan 2024 08:55:47 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rREdE-0005Hm-2l;
	Sat, 20 Jan 2024 16:55:44 +0000
Date: Sun, 21 Jan 2024 00:55:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/clk/rockchip/clk-pll.c:912:2-8: WARNING: do_div() does a
 64-by-32 division, please consider using div64_u64 instead.
Message-ID: <202401210007.174n0NM0-lkp@intel.com>
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
TO: Elaine Zhang <zhangqing@rock-chips.com>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Sebastian Reichel <sebastian.reichel@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d64bf433c53cab2f48a3fff7a1f2a696bc5229a
commit: 8f6594494b1cb0ad14493795b436413cfe64a0f8 clk: rockchip: add pll type for RK3588
date:   1 year, 2 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 1 year, 2 months ago
config: arm-randconfig-r062-20240117 (https://download.01.org/0day-ci/archive/20240121/202401210007.174n0NM0-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401210007.174n0NM0-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/rockchip/clk-pll.c:912:2-8: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

vim +912 drivers/clk/rockchip/clk-pll.c

8f6594494b1cb0 Elaine Zhang 2022-10-18  895  
8f6594494b1cb0 Elaine Zhang 2022-10-18  896  static unsigned long rockchip_rk3588_pll_recalc_rate(struct clk_hw *hw, unsigned long prate)
8f6594494b1cb0 Elaine Zhang 2022-10-18  897  {
8f6594494b1cb0 Elaine Zhang 2022-10-18  898  	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
8f6594494b1cb0 Elaine Zhang 2022-10-18  899  	struct rockchip_pll_rate_table cur;
8f6594494b1cb0 Elaine Zhang 2022-10-18  900  	u64 rate64 = prate, postdiv;
8f6594494b1cb0 Elaine Zhang 2022-10-18  901  
8f6594494b1cb0 Elaine Zhang 2022-10-18  902  	rockchip_rk3588_pll_get_params(pll, &cur);
8f6594494b1cb0 Elaine Zhang 2022-10-18  903  
8f6594494b1cb0 Elaine Zhang 2022-10-18  904  	rate64 *= cur.m;
8f6594494b1cb0 Elaine Zhang 2022-10-18  905  	do_div(rate64, cur.p);
8f6594494b1cb0 Elaine Zhang 2022-10-18  906  
8f6594494b1cb0 Elaine Zhang 2022-10-18  907  	if (cur.k) {
8f6594494b1cb0 Elaine Zhang 2022-10-18  908  		/* fractional mode */
8f6594494b1cb0 Elaine Zhang 2022-10-18  909  		u64 frac_rate64 = prate * cur.k;
8f6594494b1cb0 Elaine Zhang 2022-10-18  910  
8f6594494b1cb0 Elaine Zhang 2022-10-18  911  		postdiv = cur.p * 65535;
8f6594494b1cb0 Elaine Zhang 2022-10-18 @912  		do_div(frac_rate64, postdiv);
8f6594494b1cb0 Elaine Zhang 2022-10-18  913  		rate64 += frac_rate64;
8f6594494b1cb0 Elaine Zhang 2022-10-18  914  	}
8f6594494b1cb0 Elaine Zhang 2022-10-18  915  	rate64 = rate64 >> cur.s;
8f6594494b1cb0 Elaine Zhang 2022-10-18  916  
8f6594494b1cb0 Elaine Zhang 2022-10-18  917  	return (unsigned long)rate64;
8f6594494b1cb0 Elaine Zhang 2022-10-18  918  }
8f6594494b1cb0 Elaine Zhang 2022-10-18  919  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
