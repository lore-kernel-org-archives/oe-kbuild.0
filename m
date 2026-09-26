Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC04F54707C
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Sep 2026 00:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790383729; cv=none; b=COhznTE4lJ/K039N7eGzr7qGwcqvRXdA+WWs9jDFHGUatJfoOc9Ir3wjIzyaokfSrdUgAslWSRThJw41aLljIBNZZlFApowd26sActq8kaHJ/KX75wBWwxTW3goPWLRznPUmy4lpyOfcFZX0hncQClm6en1pqxe9w0IcP0fmacE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790383729; c=relaxed/simple;
	bh=Mu730tvdhuK9/0dLNJ6ihkKmRR3MIW1aH8HeNqcSvKg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lp4db72pIjrA14NIlMt8HSsCUIi9D71S2y3Vi5JvoCd6qUEcDpvu4N2oqEty3a0WTb6AdNrrzuRA+7tQZcJreZD3oTIkXyxBt75XF1M22bVxZt8faZ82zTzazFrFiVRga3uo99t4Fl2kx68bfr3B/3d2NklVCXrgXAszfv1+Eg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bT/L/6vP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bT/L/6vP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790383727; x=1821919727;
  h=date:from:to:cc:subject:message-id;
  bh=Mu730tvdhuK9/0dLNJ6ihkKmRR3MIW1aH8HeNqcSvKg=;
  b=bT/L/6vPJ3tWHneGs1/RV6cyjjs7dAMtt0gveiP5GDjc59D3t9TjAYbz
   qenWEvWzWAoW7jTMS+hLCTgUGx7+o8w0vk/oYuM7YUkZouxH5aw8/e/gL
   Tyd7VNcfBUWD+DntVoBpC0q8HkY/EcAV/+2kG1YivPh+TVyZivTDtZLXu
   nDrb1oxNkUlZSMRuB9NiJqAz7BOyp+ljJbfdoklbTKLchZw+JBcUIwkK/
   GIbBEFBtIWRJqJzykby6alL9SCX1wRiLcN+DjWrV6QC6Dt5H1YOQmZ4ey
   UETHJJt05+9aFWQLWlVDUWXxUaSJ6nWkL6t5kapoJuD8tZmxqpDE8mxcG
   Q==;
X-CSE-ConnectionGUID: eRbjQsEbQE2R+SyMm/855w==
X-CSE-MsgGUID: 4ac7imiLS+ysT63BrwG2fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="112959927"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="112959927"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 17:48:46 -0700
X-CSE-ConnectionGUID: duRTKJhNRb2yjx90NKdotw==
X-CSE-MsgGUID: RIKW/5tPSKm1za5dzXmcNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="274554093"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 25 Sep 2026 17:48:45 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAGao-0000000008h-1r7y;
	Sat, 26 Sep 2026 00:48:42 +0000
Date: Sat, 26 Sep 2026 02:48:05 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/can/dummy_can.c:135:7-25: opportunity for
 str_on_off(enabled & BIT ( idx ))
Message-ID: <202609260204.Gv7wfeyU-lkp@intel.com>
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
head:   6812ce4e4379ffc99c52401ec28f0d7ffbc36206
commit: 816cf430e84b4628dba665491e78ce081a468fcb can: add dummy_can driver
date:   10 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 10 months ago
config: powerpc64-randconfig-r2101-20260925 (https://download.01.org/0day-ci/archive/20260926/202609260204.Gv7wfeyU-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7e4b8ae111298941e0c31052a7124ab36f5365b5)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 816cf430e84b ("can: add dummy_can driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609260204.Gv7wfeyU-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/can/dummy_can.c:135:7-25: opportunity for str_on_off(enabled & BIT ( idx ))

vim +135 drivers/net/can/dummy_can.c

816cf430e84b46 Vincent Mailhol 2025-11-26  116  
816cf430e84b46 Vincent Mailhol 2025-11-26  117  static void dummy_can_print_ctrlmode(struct net_device *dev)
816cf430e84b46 Vincent Mailhol 2025-11-26  118  {
816cf430e84b46 Vincent Mailhol 2025-11-26  119  	struct dummy_can *priv = netdev_priv(dev);
816cf430e84b46 Vincent Mailhol 2025-11-26  120  	struct can_priv *can_priv = &priv->can;
816cf430e84b46 Vincent Mailhol 2025-11-26  121  	unsigned long supported = can_priv->ctrlmode_supported;
816cf430e84b46 Vincent Mailhol 2025-11-26  122  	u32 enabled = can_priv->ctrlmode;
816cf430e84b46 Vincent Mailhol 2025-11-26  123  
816cf430e84b46 Vincent Mailhol 2025-11-26  124  	netdev_dbg(dev, "Control modes:\n");
816cf430e84b46 Vincent Mailhol 2025-11-26  125  	netdev_dbg(dev, "\tsupported: 0x%08x\n", (u32)supported);
816cf430e84b46 Vincent Mailhol 2025-11-26  126  	netdev_dbg(dev, "\tenabled: 0x%08x\n", enabled);
816cf430e84b46 Vincent Mailhol 2025-11-26  127  
816cf430e84b46 Vincent Mailhol 2025-11-26  128  	if (supported) {
816cf430e84b46 Vincent Mailhol 2025-11-26  129  		int idx;
816cf430e84b46 Vincent Mailhol 2025-11-26  130  
816cf430e84b46 Vincent Mailhol 2025-11-26  131  		netdev_dbg(dev, "\tlist:");
816cf430e84b46 Vincent Mailhol 2025-11-26  132  		for_each_set_bit(idx, &supported, BITS_PER_TYPE(u32))
816cf430e84b46 Vincent Mailhol 2025-11-26  133  			netdev_dbg(dev, "\t\t%s: %s\n",
816cf430e84b46 Vincent Mailhol 2025-11-26  134  				   can_get_ctrlmode_str(BIT(idx)),
816cf430e84b46 Vincent Mailhol 2025-11-26 @135  				   enabled & BIT(idx) ? "on" : "off");
816cf430e84b46 Vincent Mailhol 2025-11-26  136  	}
816cf430e84b46 Vincent Mailhol 2025-11-26  137  }
816cf430e84b46 Vincent Mailhol 2025-11-26  138  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
