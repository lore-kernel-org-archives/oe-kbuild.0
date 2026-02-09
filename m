Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3912F3793DC
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Feb 2026 13:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770645194; cv=none; b=XJR7Yg+2KYjKbFi3RynqFXXjwPAT2LaWqOgJ8qUrUM2dgve1dPByD/SiYHoU//Y5BvQchFoiwTu5fR1TFaXj9AvC1pbdQ4gAuMNiO0xLuSfV4kfHLmqx64IT3RlsIGLowWjYRfyeHXGYu1cn69dcQHNZtlOO2O5YCb6Bikg2eng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770645194; c=relaxed/simple;
	bh=lrFRE2dLmxxEAzZ6oB+DUw7WDwggjC/AOeTZeDJQAfM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=et5yWruc51HYJ8xiAlT4xPUhMWAZVMzMDgJomrQfqTas4Qqwd2F8DXSA76E9cw4eHv4GUHQhrcnK+DHpr/RjoT4+pTsxVWRDFPIvmL2Lpj4Jge4BTZXjeMO3SK8pTgJSDi1AikoDkl2l1IUIreg0tof2w+vUdQhIhxgOJ3FaEsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GwC8gcQF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GwC8gcQF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770645195; x=1802181195;
  h=date:from:to:cc:subject:message-id;
  bh=lrFRE2dLmxxEAzZ6oB+DUw7WDwggjC/AOeTZeDJQAfM=;
  b=GwC8gcQFypJoeK9LdjLlxoohGl38GQd6WlOj1s777qgfd7DEoH6d+h/H
   zYVNX9DQXtX5BEffSfIHVGCWdMeRQ9OY9SKvr7KDbZAvFgvM4/hDxlE8F
   oBJGa1KumDqnEXdw9kUCwdxoClZupZME8/vDqpEQPxEi4jwLWy5uQweNi
   eK1SJwycZxQqk/FKe2CqKQZ1zfO7kR8d7ORR5J4AL/JkAzMm9eiwS23eJ
   FbEaXb37FmW2PEr1nFUdRik7l0E+Q2DkXdAryMzD8/OjUKycdppMOqSDY
   Yoy5m4olfjwuhs4W96lQ4Opnsy0Tfyra1sjkD04gjB5xeoYJ7HqymaaGL
   Q==;
X-CSE-ConnectionGUID: g/Mkuv1/Q4OIAUnaynECmw==
X-CSE-MsgGUID: 8OTLj8f5S/y929Ib6bBYAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="75603635"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="75603635"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 05:53:14 -0800
X-CSE-ConnectionGUID: jX2ChIulRJ24sUmWP1mJpg==
X-CSE-MsgGUID: LLRiBsI7SHuP44Xr7UhCXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="215773967"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Feb 2026 05:53:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpRhO-00000000nQW-2XCx;
	Mon, 09 Feb 2026 13:53:10 +0000
Date: Mon, 09 Feb 2026 21:52:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 5928/12094]
 drivers/soc/rockchip/grf.c:220:1-33: WARNING: Function
 "for_each_matching_node_and_match" should have of_node_put() before return
 around line 234.
Message-ID: <202602092119.liE6zRbE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Shawn Lin <shawn.lin@rock-chips.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9845cf73f7db6094c0d8419d6adb848028f4a921
commit: 75fb63ae031211e9264ac888fabc2ca9cd3fcccf [5928/12094] soc: rockchip: grf: Support multiple grf to be handled
:::::: branch date: 4 days ago
:::::: commit date: 3 weeks ago
config: openrisc-randconfig-r061-20260209 (https://download.01.org/0day-ci/archive/20260209/202602092119.liE6zRbE-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202602092119.liE6zRbE-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/soc/rockchip/grf.c:220:1-33: WARNING: Function "for_each_matching_node_and_match" should have of_node_put() before return around line 234.

vim +/for_each_matching_node_and_match +220 drivers/soc/rockchip/grf.c

4c58063d4258f6 Heiko Stuebner 2016-11-17  211  
4c58063d4258f6 Heiko Stuebner 2016-11-17  212  static int __init rockchip_grf_init(void)
4c58063d4258f6 Heiko Stuebner 2016-11-17  213  {
4c58063d4258f6 Heiko Stuebner 2016-11-17  214  	const struct rockchip_grf_info *grf_info;
4c58063d4258f6 Heiko Stuebner 2016-11-17  215  	const struct of_device_id *match;
4c58063d4258f6 Heiko Stuebner 2016-11-17  216  	struct device_node *np;
4c58063d4258f6 Heiko Stuebner 2016-11-17  217  	struct regmap *grf;
4c58063d4258f6 Heiko Stuebner 2016-11-17  218  	int ret, i;
4c58063d4258f6 Heiko Stuebner 2016-11-17  219  
75fb63ae031211 Shawn Lin      2026-01-16 @220  	for_each_matching_node_and_match(np, rockchip_grf_dt_match, &match) {
75fb63ae031211 Shawn Lin      2026-01-16  221  		if (!of_device_is_available(np))
75fb63ae031211 Shawn Lin      2026-01-16  222  			continue;
4c58063d4258f6 Heiko Stuebner 2016-11-17  223  		if (!match || !match->data) {
4c58063d4258f6 Heiko Stuebner 2016-11-17  224  			pr_err("%s: missing grf data\n", __func__);
9b59588d8be91c Miaoqian Lin   2022-05-16  225  			of_node_put(np);
4c58063d4258f6 Heiko Stuebner 2016-11-17  226  			return -EINVAL;
4c58063d4258f6 Heiko Stuebner 2016-11-17  227  		}
4c58063d4258f6 Heiko Stuebner 2016-11-17  228  
4c58063d4258f6 Heiko Stuebner 2016-11-17  229  		grf_info = match->data;
4c58063d4258f6 Heiko Stuebner 2016-11-17  230  
4c58063d4258f6 Heiko Stuebner 2016-11-17  231  		grf = syscon_node_to_regmap(np);
4c58063d4258f6 Heiko Stuebner 2016-11-17  232  		if (IS_ERR(grf)) {
4c58063d4258f6 Heiko Stuebner 2016-11-17  233  			pr_err("%s: could not get grf syscon\n", __func__);
4c58063d4258f6 Heiko Stuebner 2016-11-17 @234  			return PTR_ERR(grf);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
