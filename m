Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A724718C5
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Sep 2026 19:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790709192; cv=none; b=V9ucO1cXS3tNzKWxu7/X0ze+uxNwmPpcGARQNElYTV1MslbGdn4jrxgigEHBcYy27Iwn1XLcz7VAZTdTHyKnpKn1iNKXST/rdXQpUmsgEy+rtaIlWLUcvLL1E389xkuWWWwu/56iRDe80zKR4EolraoAxkTvHPk1BzhCYrzOBd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790709192; c=relaxed/simple;
	bh=7zJwHFxO6taphCBZf5nWW9u2AKJbxDe8XJ7BpVY/MaE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ryX3ab91L51ImyTlOmKAlI0PyYa21ZC0QOOIzQZyQWFKzsZ9G3nG5mSw+BN+yPYBDj2BR+btOfHk55Q03pdNkc//WkZhWrnA5FfbT7hxQ7YdtRIu03mLRUB6qm/tDpRVVaija1iNdjjiCV9Y9s+dzaG1l3l774zHu7EJnUdyaQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XcIZA0kQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XcIZA0kQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790709188; x=1822245188;
  h=date:from:to:cc:subject:message-id;
  bh=7zJwHFxO6taphCBZf5nWW9u2AKJbxDe8XJ7BpVY/MaE=;
  b=XcIZA0kQ4PuDMq3WzsUQHOaypNNNZn8b4PvTDbv48IE+rLgZ3SSFfXDx
   5WMFpzUnRnWX6tWQapEtjQzsmN8bodNbYFvXWNnAZ+P68QlOpoNpHjL8g
   9ehfr/Ki1IB5DioF2vIzSZXbNrCJ1mxWhEJcd+TOKFlNJGhjfMSLV6EA8
   8MLxCRjMfrkDco1Qe6zPKooMi1u9+uO9kXp5iBzgq05bRlt5VRwK8CqRy
   ObTAxm87T2Kn/QzWqhI9nNWZ4HPJ87defYdSyaK/dKxUyag7j9BzQc7+N
   NomYHE2xT38S+DOJ/eUgHi9ubh11+QtgbZRV3mMDTu8nBfAV5aBZ3hHle
   A==;
X-CSE-ConnectionGUID: vghQLVyoRLKEauO4BapxvA==
X-CSE-MsgGUID: a0tPABTEQEWRZ3dgrQ/yww==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90481951"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="90481951"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 12:13:07 -0700
X-CSE-ConnectionGUID: xWr1gdSBTOudGHjaWJsiJA==
X-CSE-MsgGUID: 9dAEDz44RJ+JUXCKSzjJYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="274570177"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Sep 2026 12:13:06 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBdGB-00000000PhP-3kKO;
	Tue, 29 Sep 2026 19:13:03 +0000
Date: Wed, 30 Sep 2026 03:12:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/dsa/motorcomm/chip.c:4500:2: warning: variable
 'ctrl' is uninitialized when used here
Message-ID: <202609300309.dYcjWGg9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Kyle-Switch/net-dsa-motorcomm-initialize-dsa_switch-based-on-chipid/20260929-105407, commit: 6dee6eb3082287bee0e5a28b0e83b5ddab25482b"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Kyle Switch <kyle.switch@motor-comm.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Kyle-Switch/net-dsa-motorcomm-initialize-dsa_switch-based-on-chipid/20260929-105407
head:   17230188d88553553a3648a5296554ff1e98926a
commit: 6dee6eb3082287bee0e5a28b0e83b5ddab25482b net: dsa: motorcomm: Add support for Motorcomm YT922x
date:   16 hours ago
:::::: branch date: 12 hours ago
:::::: commit date: 16 hours ago
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260930/202609300309.dYcjWGg9-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609300309.dYcjWGg9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609300309.dYcjWGg9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/dsa/motorcomm/chip.c:4500:2: warning: variable 'ctrl' is uninitialized when used here [-Wuninitialized]
    4500 |         ctrl |= ps;
         |         ^~~~
   drivers/net/dsa/motorcomm/chip.c:4495:10: note: initialize the variable 'ctrl' to silence this warning
    4495 |         u32 ctrl;
         |                 ^
         |                  = 0
   1 warning generated.


vim +/ctrl +4500 drivers/net/dsa/motorcomm/chip.c

6dee6eb3082287 Kyle Switch 2026-09-29  4487  
6dee6eb3082287 Kyle Switch 2026-09-29  4488  static int
6dee6eb3082287 Kyle Switch 2026-09-29  4489  yt922x_port_up(struct yt921x_priv *priv, int port, unsigned int mode,
6dee6eb3082287 Kyle Switch 2026-09-29  4490  	       phy_interface_t interface, int speed, int duplex,
6dee6eb3082287 Kyle Switch 2026-09-29  4491  	       bool tx_pause, bool rx_pause)
6dee6eb3082287 Kyle Switch 2026-09-29  4492  {
6dee6eb3082287 Kyle Switch 2026-09-29  4493  	int ps = ethtool_speed_to_yt921x(speed);
6dee6eb3082287 Kyle Switch 2026-09-29  4494  	u32 mask;
6dee6eb3082287 Kyle Switch 2026-09-29  4495  	u32 ctrl;
6dee6eb3082287 Kyle Switch 2026-09-29  4496  	int res;
6dee6eb3082287 Kyle Switch 2026-09-29  4497  
6dee6eb3082287 Kyle Switch 2026-09-29  4498  	if (ps == YT921X_SPEED_INVALID)
6dee6eb3082287 Kyle Switch 2026-09-29  4499  		return -EINVAL;
6dee6eb3082287 Kyle Switch 2026-09-29 @4500  	ctrl |= ps;
6dee6eb3082287 Kyle Switch 2026-09-29  4501  
6dee6eb3082287 Kyle Switch 2026-09-29  4502  	if (duplex == DUPLEX_FULL)
6dee6eb3082287 Kyle Switch 2026-09-29  4503  		ctrl |= YT922X_PORT_DUPLEX_FULL;
6dee6eb3082287 Kyle Switch 2026-09-29  4504  	if (tx_pause)
6dee6eb3082287 Kyle Switch 2026-09-29  4505  		ctrl |= YT922X_PORT_TX_PAUSE;
6dee6eb3082287 Kyle Switch 2026-09-29  4506  	if (rx_pause)
6dee6eb3082287 Kyle Switch 2026-09-29  4507  		ctrl |= YT922X_PORT_RX_PAUSE;
6dee6eb3082287 Kyle Switch 2026-09-29  4508  	ctrl |= YT922X_PORT_RX_MAC_EN | YT922X_PORT_TX_MAC_EN |
6dee6eb3082287 Kyle Switch 2026-09-29  4509  			YT922X_PORT_CFG_TX_EN | YT922X_PORT_LINK |
6dee6eb3082287 Kyle Switch 2026-09-29  4510  			YT922X_PORT_CFG_RX_EN;
6dee6eb3082287 Kyle Switch 2026-09-29  4511  	ctrl &= ~(YT922X_PORT_FC_AN | YT922X_PORT_LINK_AN);
6dee6eb3082287 Kyle Switch 2026-09-29  4512  	res = yt921x_reg_write(priv, YT922X_PORTn_CTRL(port), ctrl);
6dee6eb3082287 Kyle Switch 2026-09-29  4513  	if (res)
6dee6eb3082287 Kyle Switch 2026-09-29  4514  		return res;
6dee6eb3082287 Kyle Switch 2026-09-29  4515  
6dee6eb3082287 Kyle Switch 2026-09-29  4516  	/* force op */
6dee6eb3082287 Kyle Switch 2026-09-29  4517  	mask = YT922X_PORT_FORCE_OP;
6dee6eb3082287 Kyle Switch 2026-09-29  4518  	res = yt921x_reg_set_bits(priv, YT922X_PORTn_CTRL(port), mask);
6dee6eb3082287 Kyle Switch 2026-09-29  4519  	if (res)
6dee6eb3082287 Kyle Switch 2026-09-29  4520  		return res;
6dee6eb3082287 Kyle Switch 2026-09-29  4521  
6dee6eb3082287 Kyle Switch 2026-09-29  4522  	/* enable en_phy */
6dee6eb3082287 Kyle Switch 2026-09-29  4523  	res = yt921x_reg_set_bits(priv, YT922X_EN_PHY_VALUE, BIT(port));
6dee6eb3082287 Kyle Switch 2026-09-29  4524  	if (res)
6dee6eb3082287 Kyle Switch 2026-09-29  4525  		return res;
6dee6eb3082287 Kyle Switch 2026-09-29  4526  	res = yt921x_reg_set_bits(priv, YT922X_EN_PHY_OVERWRITE, BIT(port));
6dee6eb3082287 Kyle Switch 2026-09-29  4527  	if (res)
6dee6eb3082287 Kyle Switch 2026-09-29  4528  		return res;
6dee6eb3082287 Kyle Switch 2026-09-29  4529  
6dee6eb3082287 Kyle Switch 2026-09-29  4530  	return 0;
6dee6eb3082287 Kyle Switch 2026-09-29  4531  }
6dee6eb3082287 Kyle Switch 2026-09-29  4532  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
