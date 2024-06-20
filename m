Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B551BA89E
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Jun 2024 18:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718907979; cv=none; b=a0CPAL2BIqaU/Ft08mGCmHnYN3gJTkvG+lXQMujGcVQEu1dc4ZvHKhMyg+BMsACTyBo/dK+a5xGsN+benjKFpV3FsmQBFnRSTEwCX+cR5FmRzS39xs37n6ye7Okwsh1HAiEx+Qx8hML7JXqi1I1VjtUTFlPrBg+AyKtgw9wYPq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718907979; c=relaxed/simple;
	bh=4HwjGFqgyC8oipp7xJ6y2DR1D9qFM7zq6rCO/QEJ82Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p31M3tjQrr6+QE3s/pjMaXvlW2fPhxko5+y9hn1+UE+XnZNhfTgmSPwLpl8fNVQUEpoIEevfm+9Tw5e1EBbzMXpr7LovK8ugaT1jpdduf1z/P90vRB/MEcFXO3VTxpLRP8A6SLyZ5PWHBOls3iL2J4KJVOljOpC1xLwH+DyQO1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MMzHI3nx; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MMzHI3nx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718907977; x=1750443977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4HwjGFqgyC8oipp7xJ6y2DR1D9qFM7zq6rCO/QEJ82Q=;
  b=MMzHI3nx1wwgR7XrPiZ2JhaHol3Teo2wONEffC4rrAHcjEPF8+zO6OuK
   qX5Fm9LTsFwu0gcRsCSUnKdT/E4YgtMsZVWgUmszbcvkXviR1P0X3VZAV
   QxlbN+BYbwBck1inZcttMSf0W3odl95bbx2KAM5DNsLrcw4DvlH8KuHJb
   v56cJ9+L16/6zDpNN9D4a7YCE30vbczJzSclH4rLn+dU4/l6cbz13rGfL
   PMEMeyqHicFJ39FfCzDkynpcSf3BFswFzf69bM0vmrJEqEncw/RvpGKVO
   uAW2Gvp0snW3YCwAUl7LxDkf3KA1TMqoUpbt66D/YKBPLe0F0xpIFE+i7
   w==;
X-CSE-ConnectionGUID: Kw8w0OrbRx2ww2f75UtpYg==
X-CSE-MsgGUID: eJK4Kke2Se2Lh+RnK1NNlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="16056332"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="16056332"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 11:26:17 -0700
X-CSE-ConnectionGUID: cAMt3IRhS6WexTNEDOz4rA==
X-CSE-MsgGUID: kg4LqPCwSq2KixYzrsnaNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="46784969"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Jun 2024 11:26:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKMU9-0007pV-26;
	Thu, 20 Jun 2024 18:26:13 +0000
Date: Fri, 21 Jun 2024 02:26:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7139/7397]
 drivers/net/ethernet/pensando/ionic/ionic_ethtool.c:882 ionic_set_tunable()
 warn: impossible condition '((null)) => (0-u32max > u32max)'
Message-ID: <202406210218.cbxWxwGs-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Brett Creeley <brett.creeley@amd.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Shannon Nelson <shannon.nelson@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b992b79ca8bc336fa8e2c80990b5af80ed8f36fd
commit: f703d56c03050b5d8f9bea6842569798b5407386 [7139/7397] ionic: Use an u16 for rx_copybreak
:::::: branch date: 2 hours ago
:::::: commit date: 17 hours ago
config: x86_64-randconfig-161-20240620 (https://download.01.org/0day-ci/archive/20240621/202406210218.cbxWxwGs-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406210218.cbxWxwGs-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/pensando/ionic/ionic_ethtool.c:882 ionic_set_tunable() warn: impossible condition '((null)) => (0-u32max > u32max)'

vim +882 drivers/net/ethernet/pensando/ionic/ionic_ethtool.c

aa3198819bea60f Shannon Nelson 2019-09-03  871  
8c15440bce31afd Shannon Nelson 2019-09-03  872  static int ionic_set_tunable(struct net_device *dev,
8c15440bce31afd Shannon Nelson 2019-09-03  873  			     const struct ethtool_tunable *tuna,
8c15440bce31afd Shannon Nelson 2019-09-03  874  			     const void *data)
8c15440bce31afd Shannon Nelson 2019-09-03  875  {
8c15440bce31afd Shannon Nelson 2019-09-03  876  	struct ionic_lif *lif = netdev_priv(dev);
f703d56c03050b5 Brett Creeley  2024-06-18  877  	u32 rx_copybreak;
8c15440bce31afd Shannon Nelson 2019-09-03  878  
8c15440bce31afd Shannon Nelson 2019-09-03  879  	switch (tuna->id) {
8c15440bce31afd Shannon Nelson 2019-09-03  880  	case ETHTOOL_RX_COPYBREAK:
f703d56c03050b5 Brett Creeley  2024-06-18  881  		rx_copybreak = *(u32 *)data;
f703d56c03050b5 Brett Creeley  2024-06-18 @882  		if (rx_copybreak > IONIC_MAX_RX_COPYBREAK) {
f703d56c03050b5 Brett Creeley  2024-06-18  883  			netdev_err(dev, "Max supported rx_copybreak size: %u\n",
f703d56c03050b5 Brett Creeley  2024-06-18  884  				   IONIC_MAX_RX_COPYBREAK);
f703d56c03050b5 Brett Creeley  2024-06-18  885  			return -EINVAL;
f703d56c03050b5 Brett Creeley  2024-06-18  886  		}
f703d56c03050b5 Brett Creeley  2024-06-18  887  		lif->rx_copybreak = (u16)rx_copybreak;
8c15440bce31afd Shannon Nelson 2019-09-03  888  		break;
8c15440bce31afd Shannon Nelson 2019-09-03  889  	default:
8c15440bce31afd Shannon Nelson 2019-09-03  890  		return -EOPNOTSUPP;
8c15440bce31afd Shannon Nelson 2019-09-03  891  	}
8c15440bce31afd Shannon Nelson 2019-09-03  892  
8c15440bce31afd Shannon Nelson 2019-09-03  893  	return 0;
8c15440bce31afd Shannon Nelson 2019-09-03  894  }
8c15440bce31afd Shannon Nelson 2019-09-03  895  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
