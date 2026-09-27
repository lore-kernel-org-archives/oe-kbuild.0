Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA3D184540
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Sep 2026 17:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790530418; cv=none; b=DFEexyW09Z6qsPtwtqU2v3jkSCA96RQs65tPE9X4QAgxPtV0ZOxHTlTUZ0SunDntUKr1UpRw5n8sZEiZ9XHzkROl13lKuZ7IP8kj6aOT4vKZP0v/TQLZk2pHyJYUL+xh78TQcNYeenkvTdQEjBNCg/9a2DTU6xb3R7QbNPoLa/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790530418; c=relaxed/simple;
	bh=e6qIa5usyDzf9vaTGjis/wDmIEydG1qRauiTRUIWmGU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dXXf0sTwCAkcsqQNZpaF5gU9MApkuC8d97rwriaiX2ZXMqkfsjea6glV7cpr4d1wwHkgEIQv4hZlzHamaGzZsYBc6nNZVX9X9shMh09ezpJmxAHrrLAT/x3TKyK27TVSotp9nvfM4ecBzq8lH2+tQhiZnzq7ma1GIdqB4l+dcyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jbRott9C; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jbRott9C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790530417; x=1822066417;
  h=date:from:to:cc:subject:message-id;
  bh=e6qIa5usyDzf9vaTGjis/wDmIEydG1qRauiTRUIWmGU=;
  b=jbRott9CwjgGaCn3Se42b8FMKmbgCGMRncM93T54hyZCuOktjr1FuuRK
   IbGA0xbftBhUIUVzEW6S6eXUdAASXYPBeG/cGGYGV48DPvKB3jPdCo0Yk
   uCOJWy79qalw6mKRkPr1I/aZRIjSPM485s0RFl5MYWenpAeXy1gORYjfR
   2MHIS5yJfTwb81X1GwegPZHFv4LiuMnIXMqEu7H2N+z2+/VIfXwY+Ld/G
   iXecupHEHCaQKHWBtd/bM3C8BFaEYPtDdIq1MrrsSnVfJYYIY6fuG4VUg
   XVpXBMvYVxDev8QzUX6LUSMkdk058umJeOYS225UUKNc/GgJJEJRaQI3E
   g==;
X-CSE-ConnectionGUID: ciM2ADBqSs2v8WLOHHuMwg==
X-CSE-MsgGUID: DULqw7nnTw+DElOHB1Ts3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="78802556"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="78802556"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 10:33:36 -0700
X-CSE-ConnectionGUID: r+3qrcq8S+eACJnSs9Xfpg==
X-CSE-MsgGUID: ONaHmWkOSVGdufzr/5GtkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="273950518"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 27 Sep 2026 10:33:34 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAskl-000000000dn-3ZVw;
	Sun, 27 Sep 2026 17:33:31 +0000
Date: Sun, 27 Sep 2026 19:33:08 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 5544/10910]
 drivers/net/ethernet/freescale/enetc/enetc_vf.c:575:7-15: opportunity for
 str_on_off(tx_pause)
Message-ID: <202609271940.Ov227ysy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Wei Fang <wei.fang@nxp.com>
CC: Paolo Abeni <pabeni@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: 36a16ed591b3565b5c5da547221923ead5a3eb6e [5544/10910] net: enetc: add PSI-to-VSI link status notification support for VF
:::::: branch date: 2 days ago
:::::: commit date: 12 days ago
config: sparc-randconfig-r2107-20260927 (https://download.01.org/0day-ci/archive/20260927/202609271940.Ov227ysy-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609271940.Ov227ysy-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/freescale/enetc/enetc_vf.c:575:7-15: opportunity for str_on_off(tx_pause)

vim +575 drivers/net/ethernet/freescale/enetc/enetc_vf.c

36a16ed591b356 Wei Fang 2026-09-09  548  
36a16ed591b356 Wei Fang 2026-09-09  549  static void enetc_vf_msg_handle_link_status(struct enetc_si *si, u8 status)
36a16ed591b356 Wei Fang 2026-09-09  550  {
36a16ed591b356 Wei Fang 2026-09-09  551  	bool tx_pause = !!(status & ENETC_CLASS_CODE_TX_PAUSE_EN);
36a16ed591b356 Wei Fang 2026-09-09  552  	bool link_down = !!(status & ENETC_CLASS_CODE_LINK_DOWN);
36a16ed591b356 Wei Fang 2026-09-09  553  	struct enetc_ndev_priv *priv = netdev_priv(si->ndev);
36a16ed591b356 Wei Fang 2026-09-09  554  	struct net_device *ndev = si->ndev;
36a16ed591b356 Wei Fang 2026-09-09  555  
36a16ed591b356 Wei Fang 2026-09-09  556  	rtnl_lock();
36a16ed591b356 Wei Fang 2026-09-09  557  	if (!netif_running(ndev))
36a16ed591b356 Wei Fang 2026-09-09  558  		goto unlock_rtnl;
36a16ed591b356 Wei Fang 2026-09-09  559  
36a16ed591b356 Wei Fang 2026-09-09  560  	if (link_down) {
36a16ed591b356 Wei Fang 2026-09-09  561  		if (netif_carrier_ok(ndev)) {
36a16ed591b356 Wei Fang 2026-09-09  562  			netif_carrier_off(ndev);
36a16ed591b356 Wei Fang 2026-09-09  563  			netdev_info(ndev, "Link is Down\n");
36a16ed591b356 Wei Fang 2026-09-09  564  		}
36a16ed591b356 Wei Fang 2026-09-09  565  
36a16ed591b356 Wei Fang 2026-09-09  566  		goto unlock_rtnl;
36a16ed591b356 Wei Fang 2026-09-09  567  	}
36a16ed591b356 Wei Fang 2026-09-09  568  
36a16ed591b356 Wei Fang 2026-09-09  569  	/* Link is up */
36a16ed591b356 Wei Fang 2026-09-09  570  	enetc_set_congestion_mode(priv, tx_pause);
36a16ed591b356 Wei Fang 2026-09-09  571  
36a16ed591b356 Wei Fang 2026-09-09  572  	if (!netif_carrier_ok(ndev)) {
36a16ed591b356 Wei Fang 2026-09-09  573  		netif_carrier_on(ndev);
36a16ed591b356 Wei Fang 2026-09-09  574  		netdev_info(ndev, "Link is Up, tx pause %s\n",
36a16ed591b356 Wei Fang 2026-09-09 @575  			    tx_pause ? "on" : "off");
36a16ed591b356 Wei Fang 2026-09-09  576  	}
36a16ed591b356 Wei Fang 2026-09-09  577  
36a16ed591b356 Wei Fang 2026-09-09  578  unlock_rtnl:
36a16ed591b356 Wei Fang 2026-09-09  579  	rtnl_unlock();
36a16ed591b356 Wei Fang 2026-09-09  580  }
36a16ed591b356 Wei Fang 2026-09-09  581  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
