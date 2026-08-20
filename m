Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AEE38D400
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Aug 2026 05:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787205310; cv=none; b=hLwkX4//N9/3OZP+gbg9uq/Cto+piMf635Acqlwblch5oMSf2ofmbOhJXVh+CPK6ZuM058PawlooReFcT+GNtklYQJ5pT+cLu6ui9msfQDa1VTGUSz6pE9ns2uQi51VB2WMMeryyfRM3lmnVsfzwPJwx+zAjqfCccRsrs9NEHic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787205310; c=relaxed/simple;
	bh=Xe+wLkyAWPR1Yb1z6Ao2x9ew5DvhvHOexqFvQz9uoCM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mmGPwSidTknvHQkqftuG7Ea330Y+XEJlWgHGJkdiPfpC2KRtcG6koRrLSuhFoSUIlkcpQqzMg1lqC3oOPveTiw3Tz/SdeZYszyJIdbLxiLIxd/Ojcw+U4klSvMbMHFkJeAD2Ksr/kaMj0oDiUAjNehOcZ//xg4cMn/m+YuZrwlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I8k2tIbG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I8k2tIbG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787205309; x=1818741309;
  h=date:from:to:cc:subject:message-id;
  bh=Xe+wLkyAWPR1Yb1z6Ao2x9ew5DvhvHOexqFvQz9uoCM=;
  b=I8k2tIbGGHk54715jpQe3sGLsZKubWJLJ7bY0MOu8RTQQ06/GQMNLhad
   o7F84MA8yi80t4VweOOqApkJeN5N73Qn0gsSTbkqaqWUqrDHCpr5DPQya
   2DWzhncpSGnIbhudw9LwVSXwhWjcLsl3HJCaZoqbJSyg+dzwr8XB2Bm1L
   tD521xlnORi11lPOJlxw5ecMPx7V8vi3pJSf51M2zWd8/yZZSyQli0HFu
   SyJzpaGyMhfqzLdW/YMEjvoo0IJdjEPiBoaXw8ffLSvDNKox4JjRqd3cz
   IJp1Dh/q4RyIw/BOgR8GwQlNSp5Pz2tq2jZQbUANFfQMw+Qr50OuJmsIe
   Q==;
X-CSE-ConnectionGUID: 1MoJfsMRTZ+J2JyhPEcGCQ==
X-CSE-MsgGUID: thqRJoqLSFK6Zp4FAChvAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87494926"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="87494926"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 22:55:06 -0700
X-CSE-ConnectionGUID: gEr0alwQRh2thjpSL0e/1A==
X-CSE-MsgGUID: 6i7RMMLCQQCheCdXNZtefA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Aug 2026 22:55:05 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwvjz-00000000i0i-0AsB;
	Thu, 20 Aug 2026 05:55:03 +0000
Date: Thu, 20 Aug 2026 13:54:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/marvell/mwifiex/sta_ioctl.c:186
 mwifiex_dnld_dt_txpwr_table() warn: '"marvell,00_txpwrlimit"' 65433600 can't
 fit into 255 'txpwr[0]'
Message-ID: <202608201341.jZNWWwer-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Stefan Kerkmann <s.kerkmann@pengutronix.de>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cb8a75eec0877810b50aa1c5a833f929525cd2ee
commit: 7b6f16a258065f85793fb2597a290041c1e3d201 wifi: mwifiex: add rgpower table loading support
date:   12 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/20260820/202608201341.jZNWWwer-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7b6f16a25806 ("wifi: mwifiex: add rgpower table loading support")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608201341.jZNWWwer-lkp@intel.com/

smatch warnings:
drivers/net/wireless/marvell/mwifiex/sta_ioctl.c:186 mwifiex_dnld_dt_txpwr_table() warn: '"marvell,00_txpwrlimit"' 65433600 can't fit into 255 'txpwr[0]'

vim +186 drivers/net/wireless/marvell/mwifiex/sta_ioctl.c

7c6fa2a843c5ac0 drivers/net/wireless/mwifiex/sta_ioctl.c         Amitkumar Karwar 2011-08-10  182  
7b6f16a258065f8 drivers/net/wireless/marvell/mwifiex/sta_ioctl.c Stefan Kerkmann  2025-08-04  183  static void mwifiex_dnld_dt_txpwr_table(struct mwifiex_private *priv)
b58df4461921dad drivers/net/wireless/mwifiex/sta_ioctl.c         Bing Zhao        2014-01-08  184  {
b58df4461921dad drivers/net/wireless/mwifiex/sta_ioctl.c         Bing Zhao        2014-01-08  185  	if (priv->adapter->dt_node) {
b58df4461921dad drivers/net/wireless/mwifiex/sta_ioctl.c         Bing Zhao        2014-01-08 @186  		char txpwr[] = {"marvell,00_txpwrlimit"};
b58df4461921dad drivers/net/wireless/mwifiex/sta_ioctl.c         Bing Zhao        2014-01-08  187  
b58df4461921dad drivers/net/wireless/mwifiex/sta_ioctl.c         Bing Zhao        2014-01-08  188  		memcpy(&txpwr[8], priv->adapter->country_code, 2);
b58df4461921dad drivers/net/wireless/mwifiex/sta_ioctl.c         Bing Zhao        2014-01-08  189  		mwifiex_dnld_dt_cfgdata(priv, priv->adapter->dt_node, txpwr);
b58df4461921dad drivers/net/wireless/mwifiex/sta_ioctl.c         Bing Zhao        2014-01-08  190  	}
b58df4461921dad drivers/net/wireless/mwifiex/sta_ioctl.c         Bing Zhao        2014-01-08  191  }
b58df4461921dad drivers/net/wireless/mwifiex/sta_ioctl.c         Bing Zhao        2014-01-08  192  

:::::: The code at line 186 was first introduced by commit
:::::: b58df4461921dad57707fbedee11e6f79f58b1e6 mwifiex: use a function to replace two copies of a code fragment

:::::: TO: Bing Zhao <bzhao@marvell.com>
:::::: CC: John W. Linville <linville@tuxdriver.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
