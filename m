Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2525E1E8826
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Oct 2026 07:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791013271; cv=none; b=HBPkD+3Om19+kT/gyiN9Ur2L4fzzmAjypJmcBs8VJpw2v/YBK/daLBzo0EYn1JzcjuCjddOsh+3Y3uqHYF58nDkBVl78Vn2FeCvawLfzKMA+xnxWUVmmpthj57Gr7G2Dm0U5srspm4pP3CWbP2e7XbqJ9EP1kW3d+h1Dq/XIxO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791013271; c=relaxed/simple;
	bh=xvbYYczrd9nKgeFSgW1FaWOuZk+Qf/r8kaOYU9t0xBg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F1+PRhqJZocS3gahFpJ32kXOIQPwca6Yeqsgyj0L9e5c9a7I5uqDzFA7P1h3V/cVLqikZYjSpaaGXlrfP5abZ4vvhlaRa0TV6f+eJfF41aZF3N4P3Z21c+Tkj+C8oz/PW2qdfX7c7sfJXsxQsXJHEzOJamkzFYTjg8rZfm37ZIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KX7lBpIU; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KX7lBpIU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791013266; x=1822549266;
  h=date:from:to:cc:subject:message-id;
  bh=xvbYYczrd9nKgeFSgW1FaWOuZk+Qf/r8kaOYU9t0xBg=;
  b=KX7lBpIUMSkBpGUKXGpdZlIfS5mEecBNa+oxEoWybQoIc66TFmkKssnP
   Es0jzYW6957KrINBkL6OR/DHvtyULjlH7oyljofQ0RGBSxGKpkOpru4kg
   0MZPsYiV3G59eh/8eHScc0O57m4cUgUlbpC/Ypvs379XXGjsCT45wF92l
   vKfWXDYHGE60LQa6oStcHUl80ZlScoxhmcBR3idvCrsDkl3yq6Xp4EoL8
   O2sAdShHGNiB8nqw54Z80hb76SZHIeD+0zm0RFqSHmF++G1elRUvmRWsF
   vuRevDhDT+a+DviCYF5w9eLrBvHLExojWaPFGN35D8chrXKKoCKcUZkeX
   Q==;
X-CSE-ConnectionGUID: deIupfAARbGsrR8K7sKidw==
X-CSE-MsgGUID: r6Eo8fKdRmyiOO6rgc3CtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="91792757"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="91792757"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 00:41:05 -0700
X-CSE-ConnectionGUID: T0lfsjyZSm2iW83zCB5Xpw==
X-CSE-MsgGUID: GYZ90TZTTP2zwW+HTVQzZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="274511660"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 03 Oct 2026 00:41:04 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCuMg-000000000zJ-1ZME;
	Sat, 03 Oct 2026 07:41:02 +0000
Date: Sat, 03 Oct 2026 09:40:16 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/korina.c:1235 korina_open() warn:
 'lp->rx_irq' from request_irq() not released on lines: 1229.
Message-ID: <202610030925.IEUthiBx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Yang Wen <anmuxixixi@gmail.com>
CC: Namjae Jeon <linkinjeon@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e767a4ea70a3992c37ed604157d32f0dfbf9b1e3
commit: 27af3392196ddfa4c212f4c883b9964a6dcd5f95 exfat: fix truncated volume labels returned by FS_IOC_GETFSLABEL
date:   8 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 8 weeks ago
config: m68k-randconfig-r2202-20261003 (https://download.01.org/0day-ci/archive/20261003/202610030925.IEUthiBx-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 27af3392196d ("exfat: fix truncated volume labels returned by FS_IOC_GETFSLABEL")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610030925.IEUthiBx-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/korina.c:1235 korina_open() warn: 'lp->rx_irq' from request_irq() not released on lines: 1229.

vim +1235 drivers/net/ethernet/korina.c

ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli   2008-03-19  1197  
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli   2008-03-19  1198  static int korina_open(struct net_device *dev)
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli   2008-03-19  1199  {
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli   2008-03-19  1200  	struct korina_private *lp = netdev_priv(dev);
e3152ab901bcec drivers/net/korina.c          Francois Romieu    2008-04-20  1201  	int ret;
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli   2008-03-19  1202  
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli   2008-03-19  1203  	/* Initialize */
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli   2008-03-19  1204  	ret = korina_init(dev);
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli   2008-03-19  1205  	if (ret < 0) {
f16aea4d201018 drivers/net/korina.c          Phil Sutter        2009-08-12  1206  		printk(KERN_ERR "%s: cannot open device\n", dev->name);
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli   2008-03-19  1207  		goto out;
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli   2008-03-19  1208  	}
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli   2008-03-19  1209  
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli   2008-03-19  1210  	/* Install the interrupt handler
7ce103b4cbb20b drivers/net/ethernet/korina.c Roman Yeryomin     2017-09-17  1211  	 * that handles the Done Finished */
a0607fd3a25ba1 drivers/net/korina.c          Joe Perches        2009-11-18  1212  	ret = request_irq(lp->rx_irq, korina_rx_dma_interrupt,
2414fe16ddf557 drivers/net/ethernet/korina.c Michael Opdenacker 2013-09-07  1213  			0, "Korina ethernet Rx", dev);
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli   2008-03-19  1214  	if (ret < 0) {
f16aea4d201018 drivers/net/korina.c          Phil Sutter        2009-08-12  1215  		printk(KERN_ERR "%s: unable to get Rx DMA IRQ %d\n",
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli   2008-03-19  1216  			dev->name, lp->rx_irq);
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli   2008-03-19  1217  		goto err_release;
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli   2008-03-19  1218  	}
a0607fd3a25ba1 drivers/net/korina.c          Joe Perches        2009-11-18  1219  	ret = request_irq(lp->tx_irq, korina_tx_dma_interrupt,
2414fe16ddf557 drivers/net/ethernet/korina.c Michael Opdenacker 2013-09-07  1220  			0, "Korina ethernet Tx", dev);
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli   2008-03-19  1221  	if (ret < 0) {
f16aea4d201018 drivers/net/korina.c          Phil Sutter        2009-08-12  1222  		printk(KERN_ERR "%s: unable to get Tx DMA IRQ %d\n",
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli   2008-03-19  1223  			dev->name, lp->tx_irq);
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli   2008-03-19  1224  		goto err_free_rx_irq;
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli   2008-03-19  1225  	}
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli   2008-03-19  1226  
4d5ef9f0f58804 drivers/net/korina.c          Florian Fainelli   2009-05-28  1227  	mod_timer(&lp->media_check_timer, jiffies + 1);
751c2e47550274 drivers/net/korina.c          Francois Romieu    2008-04-20  1228  out:
751c2e47550274 drivers/net/korina.c          Francois Romieu    2008-04-20  1229  	return ret;
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli   2008-03-19  1230  
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli   2008-03-19  1231  err_free_rx_irq:
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli   2008-03-19  1232  	free_irq(lp->rx_irq, dev);
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli   2008-03-19  1233  err_release:
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli   2008-03-19  1234  	korina_free_ring(dev);
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli   2008-03-19 @1235  	goto out;
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli   2008-03-19  1236  }
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli   2008-03-19  1237  

:::::: The code at line 1235 was first introduced by commit
:::::: ef11291bcd5f963c72e7ba5952be3e3c97463d2c Add support the Korina (IDT RC32434) Ethernet MAC

:::::: TO: Florian Fainelli <florian.fainelli@telecomint.eu>
:::::: CC: Jeff Garzik <jeff@garzik.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
