Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA1BBA3D
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Sep 2025 07:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759218142; cv=none; b=o+mQngX0JDBZS2qW+XFueaPtzhPWoq4cT1UoXCCtcFfSg9brvfSHqxFPPuTtwptSkbGVh9PxDIiybvs1AcECX2gpwBRybGAohSlRg5zvCGYuEqZ4oTr+gUf9h6GoCG0z4TiBXUYKzaG69WIdgjwVSiwDWN7oeBLWdcKtAvc32bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759218142; c=relaxed/simple;
	bh=CP9Mw/RH+ClW0oTMlJ1NfcPbXkuOw49rexRIYo2pQXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lyfh1A64UcnGKAEft0YZTFc/CGxYm1pcEUy7TBnbkV9IFGZkRYdBmXKGcFQqLu4YOt+R23p5BoZKSbLUqQosFBDS1jRvfTkVkGBIx2BLSUmlHTkYBT5271H0pTue/y2IaWqMpwb0AkSt+AXditR54nZN3htgcAWWk8webqlq3VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ead/gYwx; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ead/gYwx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759218141; x=1790754141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CP9Mw/RH+ClW0oTMlJ1NfcPbXkuOw49rexRIYo2pQXk=;
  b=ead/gYwxnkMjPBr6cvGpONBYgcG8Hr8xP3AsbrB+U3LuXbc192o8ZrWL
   4kLg6VKaIk5IEClUDdjMm6c9teGVE+DBkQ7OhNme8R7TAFI9S+LoJoA4s
   s/DIAsCMt0KZBnTHs8R2pfkh6aUs69M4X6tmQRyJybH+CSK26vnfbCk+7
   wOML0zRSsEeqrjQZ/6PobxtME9cGdD8tKmfGZQm1t69oJY09Me2TLMUxW
   qL9VDVMwubFNmIovhK4MT5SEtx4cpsSl02EE32scJizxiiJMnQVlQmjgR
   jMHV2nc9gdYzdSFqNjtomBUyuC+WLfBaEiBnofhE3xT0SfOTvtkFGntOV
   g==;
X-CSE-ConnectionGUID: +t0iJjHeQIqnY0G5qWdxFQ==
X-CSE-MsgGUID: 5euvGcjOREWnGctDdsUsVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="65106374"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="65106374"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 00:42:21 -0700
X-CSE-ConnectionGUID: qIZra9hXSQex0KJWBuuJsQ==
X-CSE-MsgGUID: AN4fh7O4TxqFDNegKPs4XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="209167360"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Sep 2025 00:42:17 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3V03-000111-05;
	Tue, 30 Sep 2025 07:42:15 +0000
Date: Tue, 30 Sep 2025 15:41:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4809/12880]
 drivers/net/wireless/marvell/mwifiex/sta_ioctl.c:186
 mwifiex_dnld_dt_txpwr_table() warn: '"marvell,00_txpwrlimit"'
 75601405979029504 can't fit into 255 'txpwr[0]'
Message-ID: <202509301550.jmpi2ih3-lkp@intel.com>
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
TO: Stefan Kerkmann <s.kerkmann@pengutronix.de>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3b9b1f8df454caa453c7fb07689064edb2eda90a
commit: 7b6f16a258065f85793fb2597a290041c1e3d201 [4809/12880] wifi: mwifiex: add rgpower table loading support
:::::: branch date: 16 hours ago
:::::: commit date: 4 weeks ago
config: loongarch-randconfig-r072-20250929 (https://download.01.org/0day-ci/archive/20250930/202509301550.jmpi2ih3-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509301550.jmpi2ih3-lkp@intel.com/

smatch warnings:
drivers/net/wireless/marvell/mwifiex/sta_ioctl.c:186 mwifiex_dnld_dt_txpwr_table() warn: '"marvell,00_txpwrlimit"' 75601405979029504 can't fit into 255 'txpwr[0]'

vim +186 drivers/net/wireless/marvell/mwifiex/sta_ioctl.c

7c6fa2a843c5ac drivers/net/wireless/mwifiex/sta_ioctl.c         Amitkumar Karwar 2011-08-10  182  
7b6f16a258065f drivers/net/wireless/marvell/mwifiex/sta_ioctl.c Stefan Kerkmann  2025-08-04  183  static void mwifiex_dnld_dt_txpwr_table(struct mwifiex_private *priv)
b58df4461921da drivers/net/wireless/mwifiex/sta_ioctl.c         Bing Zhao        2014-01-08  184  {
b58df4461921da drivers/net/wireless/mwifiex/sta_ioctl.c         Bing Zhao        2014-01-08  185  	if (priv->adapter->dt_node) {
b58df4461921da drivers/net/wireless/mwifiex/sta_ioctl.c         Bing Zhao        2014-01-08 @186  		char txpwr[] = {"marvell,00_txpwrlimit"};
b58df4461921da drivers/net/wireless/mwifiex/sta_ioctl.c         Bing Zhao        2014-01-08  187  
b58df4461921da drivers/net/wireless/mwifiex/sta_ioctl.c         Bing Zhao        2014-01-08  188  		memcpy(&txpwr[8], priv->adapter->country_code, 2);
b58df4461921da drivers/net/wireless/mwifiex/sta_ioctl.c         Bing Zhao        2014-01-08  189  		mwifiex_dnld_dt_cfgdata(priv, priv->adapter->dt_node, txpwr);
b58df4461921da drivers/net/wireless/mwifiex/sta_ioctl.c         Bing Zhao        2014-01-08  190  	}
b58df4461921da drivers/net/wireless/mwifiex/sta_ioctl.c         Bing Zhao        2014-01-08  191  }
b58df4461921da drivers/net/wireless/mwifiex/sta_ioctl.c         Bing Zhao        2014-01-08  192  

:::::: The code at line 186 was first introduced by commit
:::::: b58df4461921dad57707fbedee11e6f79f58b1e6 mwifiex: use a function to replace two copies of a code fragment

:::::: TO: Bing Zhao <bzhao@marvell.com>
:::::: CC: John W. Linville <linville@tuxdriver.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
