Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949535661
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Dec 2025 17:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766596607; cv=none; b=CuCAoaseSmTO2xPJPBtzRfFW/flOS9evcUXKY1rtk+sQAV1pLkT2eB+5YAJUYL6PpTD8S/6gQHtxLRXFMXdlen7gYy/NJA6Y4mG3RL71K0+yEVEudc2SkJrcWCi6topYPdGTIKkUEHw+RREh3oEfDZy/0ynI9hS9IQjuaLN5f6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766596607; c=relaxed/simple;
	bh=VDe/x0ApCehtQc+aDG3w84Ee54+E8pJ70hWcGFSdjNo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XaJrk7jyzHfyStRcLFIIB+SrUkoViORhUSdWruK3h7Ktc/OX/GuyxJbxWdczyHeWdEJfXYuzivnwl0fy2RqvDMGSSO9BF8R7XBKZhJlLBKMShZ8jUv0b49HHWv+pBTv27DQ2rmtq3QgTQ1jOFDAk+s0m3zUToXBP0jGkAAatbEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WEk6DJN1; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WEk6DJN1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766596605; x=1798132605;
  h=date:from:to:cc:subject:message-id;
  bh=VDe/x0ApCehtQc+aDG3w84Ee54+E8pJ70hWcGFSdjNo=;
  b=WEk6DJN1h0tV3rJAQEPnUXBVP/77aoB042cKeEqmXxyeuSWpnQCLAum7
   p+kYM5CgVDqeESf4ff+igkE0Ld1U3n1xxu29+XCRs30SdLZqGUAULQhZn
   pB4N34XDm38vFBg88/mjQ9wOS6ItvzyyihS3BSTwly5xtoOqdJdw/UEL3
   TRSS6x2jtg0UtmvtvqZfwz8llwDBHYMcCYKzmPneRasWk/qzBtZFWJsi3
   RbAn/KngPO1CQi0LCI95Yf++Gops/6YCHD03K2/Uvi8kD3INYjJEqGd5B
   hdH4xjx6ascbnLWCVzETuHQx1Jzw+GDRveSeMc6rL2KzKeW6qMfnm0NNV
   A==;
X-CSE-ConnectionGUID: r2GqL19tQ0qmHSPglc0upA==
X-CSE-MsgGUID: kjS6DKQ7QHKTmyhwGbspug==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68369016"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68369016"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 09:16:44 -0800
X-CSE-ConnectionGUID: H0evF4rPT0iQz/LjjED++Q==
X-CSE-MsgGUID: a8YpqluUSZK7Bh6/N+Vkkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="199963841"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 24 Dec 2025 09:16:43 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYSTZ-000000003Jh-0t5e;
	Wed, 24 Dec 2025 17:16:41 +0000
Date: Thu, 25 Dec 2025 01:16:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [phy:fixes 1/11]
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c:133 tca_blk_typec_switch_set()
 error: 'imx_phy' dereferencing possible ERR_PTR()
Message-ID: <202512250113.vV7HBTGz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Vinod Koul <vkoul@kernel.org>
CC: Kishon <kishon@ti.com>
TO: Franz Schnyder <franz.schnyder@toradex.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>
CC: Xu Yang <xu.yang_2@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git fixes
head:   b246caa68037aa495390a60d080acaeb84f45fff
commit: 49ccab4bedd4779899246107dc19fb01c5b6fea3 [1/11] phy: fsl-imx8mq-usb: fix typec orientation switch when built as module
:::::: branch date: 10 hours ago
:::::: commit date: 29 hours ago
config: arm-randconfig-r072-20251224 (https://download.01.org/0day-ci/archive/20251225/202512250113.vV7HBTGz-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512250113.vV7HBTGz-lkp@intel.com/

smatch warnings:
drivers/phy/freescale/phy-fsl-imx8mq-usb.c:133 tca_blk_typec_switch_set() error: 'imx_phy' dereferencing possible ERR_PTR()

vim +/imx_phy +133 drivers/phy/freescale/phy-fsl-imx8mq-usb.c

efe81bea891586 Li Jun  2018-11-15  124  
b58f0f86fd6156 Xu Yang 2024-12-04  125  
b58f0f86fd6156 Xu Yang 2024-12-04  126  static void tca_blk_orientation_set(struct tca_blk *tca,
b58f0f86fd6156 Xu Yang 2024-12-04  127  				enum typec_orientation orientation);
b58f0f86fd6156 Xu Yang 2024-12-04  128  
b58f0f86fd6156 Xu Yang 2024-12-04  129  static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
b58f0f86fd6156 Xu Yang 2024-12-04  130  				enum typec_orientation orientation)
b58f0f86fd6156 Xu Yang 2024-12-04  131  {
b58f0f86fd6156 Xu Yang 2024-12-04  132  	struct imx8mq_usb_phy *imx_phy = typec_switch_get_drvdata(sw);
b58f0f86fd6156 Xu Yang 2024-12-04 @133  	struct tca_blk *tca = imx_phy->tca;
b58f0f86fd6156 Xu Yang 2024-12-04  134  	int ret;
b58f0f86fd6156 Xu Yang 2024-12-04  135  
b58f0f86fd6156 Xu Yang 2024-12-04  136  	if (tca->orientation == orientation)
b58f0f86fd6156 Xu Yang 2024-12-04  137  		return 0;
b58f0f86fd6156 Xu Yang 2024-12-04  138  
b58f0f86fd6156 Xu Yang 2024-12-04  139  	ret = clk_prepare_enable(imx_phy->clk);
b58f0f86fd6156 Xu Yang 2024-12-04  140  	if (ret)
b58f0f86fd6156 Xu Yang 2024-12-04  141  		return ret;
b58f0f86fd6156 Xu Yang 2024-12-04  142  
b58f0f86fd6156 Xu Yang 2024-12-04  143  	tca_blk_orientation_set(tca, orientation);
b58f0f86fd6156 Xu Yang 2024-12-04  144  	clk_disable_unprepare(imx_phy->clk);
b58f0f86fd6156 Xu Yang 2024-12-04  145  
b58f0f86fd6156 Xu Yang 2024-12-04  146  	return 0;
b58f0f86fd6156 Xu Yang 2024-12-04  147  }
b58f0f86fd6156 Xu Yang 2024-12-04  148  

:::::: The code at line 133 was first introduced by commit
:::::: b58f0f86fd6156d7b084257f5c91ceaf7d760927 phy: fsl-imx8mq-usb: add tca function driver for imx95

:::::: TO: Xu Yang <xu.yang_2@nxp.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
