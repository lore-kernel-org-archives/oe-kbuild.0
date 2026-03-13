Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF080394789
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Mar 2026 12:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773405285; cv=none; b=b1s4c15GI6liUROuNsMUnofqSyz96iNsSNaoZIOgxxI48sVkzQEqRorcrHaKcKXkrhjliKSzUnMvclXjgAfl5517y9bYt6GYSI1HkCJK1eD5Y9q27WxBE3M9+Lp17xUP+BnEKV4jgWLrCv/71XqvaeBbRony26J0ZhPrlva8WzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773405285; c=relaxed/simple;
	bh=fkKSuKw0SSfyxRqMaERHI/uJ/5yUGzKkt8JtIgNsdHs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DnHL9HAqOsZZBrOWv5L4GHk4hdPDzBJTQI6MD91FEmF44v9bgXBZzyRarO+x7z6yAbkJhiFKjwkuQ8ABZsmxDjUdg8Qs8mhpaoFuHsjYSSEnzaO/hc4MT5SwBSWIcbzPIrGfZotyVUh51ULUU5dys91S8bj+BgCPulPsX5R9SU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gjj70mvt; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gjj70mvt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773405282; x=1804941282;
  h=date:from:to:cc:subject:message-id;
  bh=fkKSuKw0SSfyxRqMaERHI/uJ/5yUGzKkt8JtIgNsdHs=;
  b=gjj70mvtZUh3EcvBFzf1Q3EsWgwWZSDLSUm3L2a8B47hn1hxL9l8ZIf+
   ZhwAjMzeXXwqywyuu9F9vkkusKZfv0gWPgclKlYpikA9x5sR8iYPAMrky
   0KqpGL74UU0NqWB97dTESPBsCxEnL5lhQiN+KNdjzzfXSUqCtJVPxKFDq
   xcJSA+bfJYcj+UpmegZoL3Aq7qCk1egDU5O/9dLB9E5sbfjn+8T0GZisj
   w9mB6LuRt5Kx1qiwu6UyvnZPqyTgGD6w87QynZRZ2pO4abbvbYRTn0PR3
   XHybPx+Yf3OQhEt0MAbORe5WwjprBJEJHQpscfXcPY+LA/4r+gU7sommE
   w==;
X-CSE-ConnectionGUID: 8F0+ndpKTRCd6PtGjMlApQ==
X-CSE-MsgGUID: riNgRvo6RFeofM5tpFJoOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85990765"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="85990765"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 05:34:42 -0700
X-CSE-ConnectionGUID: lO5/IrxlSYaLcfjS2n9ITQ==
X-CSE-MsgGUID: ZsrMkBkHTi6nwDw5g0z7Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="217577981"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Mar 2026 05:34:40 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w11iv-000000003p3-3LPo;
	Fri, 13 Mar 2026 12:34:37 +0000
Date: Fri, 13 Mar 2026 20:34:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/can/dummy_can.c:135:7-25: opportunity for
 str_on_off(enabled & BIT ( idx ))
Message-ID: <202603132012.pFMvHAlX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Vincent Mailhol <mailhol@kernel.org>
CC: "Marc Kleine-Budde" <mkl@pengutronix.de>
CC: Oliver Hartkopp <socketcan@hartkopp.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   80234b5ab240f52fa45d201e899e207b9265ef91
commit: 816cf430e84b4628dba665491e78ce081a468fcb can: add dummy_can driver
date:   4 months ago
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: m68k-randconfig-r054-20260313 (https://download.01.org/0day-ci/archive/20260313/202603132012.pFMvHAlX-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202603132012.pFMvHAlX-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/can/dummy_can.c:135:7-25: opportunity for str_on_off(enabled & BIT ( idx ))

vim +135 drivers/net/can/dummy_can.c

816cf430e84b462 Vincent Mailhol 2025-11-26  116  
816cf430e84b462 Vincent Mailhol 2025-11-26  117  static void dummy_can_print_ctrlmode(struct net_device *dev)
816cf430e84b462 Vincent Mailhol 2025-11-26  118  {
816cf430e84b462 Vincent Mailhol 2025-11-26  119  	struct dummy_can *priv = netdev_priv(dev);
816cf430e84b462 Vincent Mailhol 2025-11-26  120  	struct can_priv *can_priv = &priv->can;
816cf430e84b462 Vincent Mailhol 2025-11-26  121  	unsigned long supported = can_priv->ctrlmode_supported;
816cf430e84b462 Vincent Mailhol 2025-11-26  122  	u32 enabled = can_priv->ctrlmode;
816cf430e84b462 Vincent Mailhol 2025-11-26  123  
816cf430e84b462 Vincent Mailhol 2025-11-26  124  	netdev_dbg(dev, "Control modes:\n");
816cf430e84b462 Vincent Mailhol 2025-11-26  125  	netdev_dbg(dev, "\tsupported: 0x%08x\n", (u32)supported);
816cf430e84b462 Vincent Mailhol 2025-11-26  126  	netdev_dbg(dev, "\tenabled: 0x%08x\n", enabled);
816cf430e84b462 Vincent Mailhol 2025-11-26  127  
816cf430e84b462 Vincent Mailhol 2025-11-26  128  	if (supported) {
816cf430e84b462 Vincent Mailhol 2025-11-26  129  		int idx;
816cf430e84b462 Vincent Mailhol 2025-11-26  130  
816cf430e84b462 Vincent Mailhol 2025-11-26  131  		netdev_dbg(dev, "\tlist:");
816cf430e84b462 Vincent Mailhol 2025-11-26  132  		for_each_set_bit(idx, &supported, BITS_PER_TYPE(u32))
816cf430e84b462 Vincent Mailhol 2025-11-26  133  			netdev_dbg(dev, "\t\t%s: %s\n",
816cf430e84b462 Vincent Mailhol 2025-11-26  134  				   can_get_ctrlmode_str(BIT(idx)),
816cf430e84b462 Vincent Mailhol 2025-11-26 @135  				   enabled & BIT(idx) ? "on" : "off");
816cf430e84b462 Vincent Mailhol 2025-11-26  136  	}
816cf430e84b462 Vincent Mailhol 2025-11-26  137  }
816cf430e84b462 Vincent Mailhol 2025-11-26  138  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
