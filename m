Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5811525763
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Nov 2024 18:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732818850; cv=none; b=nBRVQ4xmSRPiNa6tb72XFZchL6gzX+VJJEZxtQhF3dWX8jSwIJ9D7t8ToEGBecWIjt4SypBYpd3OnRUV6tTQxuMLRtUMtGVt/O6oRsvibtVMvVLZA6x83R8siTW6H+4OeYhi/wiJiQO/mngy/tJ8B4jV6k1svYjrTSeHtXYqdtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732818850; c=relaxed/simple;
	bh=PYws/dZwqZdNWwQB/QxEs2UHgXiJYngQqlHH5OHITwM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FqkElh4a7EqjtbqFk1YhnzSSHFl2Xd7wTtPkGgSkTp9pqrRWHdWo/FNXxB/l/Sle5748b1+EPyyx28txG2vo0KBhC3DXSihCmuSFQz9q4lMSBFPf8VzMNCCHcrGoCOwsa2gmuAYxruyUuu97eBzfUAlce+jL+UZ7nRkDQQ+27Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n7nqrgXh; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n7nqrgXh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732818848; x=1764354848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PYws/dZwqZdNWwQB/QxEs2UHgXiJYngQqlHH5OHITwM=;
  b=n7nqrgXhTCgfZmp+9yuGFBmAFu3a96HKwdk0SVeYNyQv1At05NGr19w3
   q4ctme4dvKeyS1yoUrEZ+uYh5SrP1rWcYS91Bo8YmW+IWmU1XcHgBlteF
   r48UGXve63adEaj1wlF9l2L+FQ16AIs4ko3SJNOuYvzCd+3bY69Ttse2N
   od3UJw06gH8Yu26MvSk3oIyDRNuRRsQZpAwNGDSbqqwxy3NlnkU1g4Pp3
   k28kowLU6XOPLjftaucWHtLAmFkr7V/xd8D2dGLMaEYcAoxH1VW8kKYrR
   y9ChEaU4a3SiTpZVu+wuX6/9rYexZEOv/5idqCbtiI2M+q4+psJAFqXxz
   g==;
X-CSE-ConnectionGUID: kmgewHYVQYm0TFSESmPFPA==
X-CSE-MsgGUID: n7HGnPs7QyqLX+rIEyq+Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="32426582"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="32426582"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 10:34:07 -0800
X-CSE-ConnectionGUID: 0TsDkzHuT+Kr/y0Kgea73Q==
X-CSE-MsgGUID: i8W4HP4sQ3+8t2tBqI6lGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="92762721"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Nov 2024 10:34:06 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGjL2-0009uT-1J;
	Thu, 28 Nov 2024 18:34:04 +0000
Date: Fri, 29 Nov 2024 02:33:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/phy/phylink.c:1800:49-51: opportunity for str_up_down(up)
Message-ID: <202411290222.b0BTiQYr-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Serge Semin <fancer.lancer@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b86545e02e8c22fb89218f29d381fa8e8b91d815
commit: f6bb3e9d98c2e8d70587d5ddaf9426ef30d7865c net: pcs: xpcs: Add Synopsys DW xPCS platform device driver
date:   5 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-051-20241120 (https://download.01.org/0day-ci/archive/20241129/202411290222.b0BTiQYr-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411290222.b0BTiQYr-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/phy/phylink.c:1800:49-51: opportunity for str_up_down(up)
   drivers/net/phy/phylink.c:2121:39-41: opportunity for str_up_down(up)

vim +1800 drivers/net/phy/phylink.c

653a180957a85c Michael Sit Wei Hong  2023-03-30  1777  
a307593a644443 Doug Berger           2020-05-18  1778  static void phylink_phy_change(struct phy_device *phydev, bool up)
9525ae83959b60 Russell King          2017-07-25  1779  {
9525ae83959b60 Russell King          2017-07-25  1780  	struct phylink *pl = phydev->phylink;
33faac8e03ac24 Russell King          2020-02-15  1781  	bool tx_pause, rx_pause;
33faac8e03ac24 Russell King          2020-02-15  1782  
33faac8e03ac24 Russell King          2020-02-15  1783  	phy_get_pause(phydev, &tx_pause, &rx_pause);
9525ae83959b60 Russell King          2017-07-25  1784  
9525ae83959b60 Russell King          2017-07-25  1785  	mutex_lock(&pl->state_mutex);
9525ae83959b60 Russell King          2017-07-25  1786  	pl->phy_state.speed = phydev->speed;
9525ae83959b60 Russell King          2017-07-25  1787  	pl->phy_state.duplex = phydev->duplex;
ae0e4bb2a0e0e4 Sean Anderson         2022-09-20  1788  	pl->phy_state.rate_matching = phydev->rate_matching;
9525ae83959b60 Russell King          2017-07-25  1789  	pl->phy_state.pause = MLO_PAUSE_NONE;
33faac8e03ac24 Russell King          2020-02-15  1790  	if (tx_pause)
33faac8e03ac24 Russell King          2020-02-15  1791  		pl->phy_state.pause |= MLO_PAUSE_TX;
33faac8e03ac24 Russell King          2020-02-15  1792  	if (rx_pause)
33faac8e03ac24 Russell King          2020-02-15  1793  		pl->phy_state.pause |= MLO_PAUSE_RX;
9525ae83959b60 Russell King          2017-07-25  1794  	pl->phy_state.interface = phydev->interface;
9525ae83959b60 Russell King          2017-07-25  1795  	pl->phy_state.link = up;
9525ae83959b60 Russell King          2017-07-25  1796  	mutex_unlock(&pl->state_mutex);
9525ae83959b60 Russell King          2017-07-25  1797  
9525ae83959b60 Russell King          2017-07-25  1798  	phylink_run_resolve(pl);
9525ae83959b60 Russell King          2017-07-25  1799  
ae0e4bb2a0e0e4 Sean Anderson         2022-09-20 @1800  	phylink_dbg(pl, "phy link %s %s/%s/%s/%s/%s\n", up ? "up" : "down",
9525ae83959b60 Russell King          2017-07-25  1801  		    phy_modes(phydev->interface),
9525ae83959b60 Russell King          2017-07-25  1802  		    phy_speed_to_str(phydev->speed),
d34869b44a174b Russell King (Oracle  2021-07-20  1803) 		    phy_duplex_to_str(phydev->duplex),
ae0e4bb2a0e0e4 Sean Anderson         2022-09-20  1804  		    phy_rate_matching_to_str(phydev->rate_matching),
d34869b44a174b Russell King (Oracle  2021-07-20  1805) 		    phylink_pause_to_str(pl->phy_state.pause));
9525ae83959b60 Russell King          2017-07-25  1806  }
9525ae83959b60 Russell King          2017-07-25  1807  

:::::: The code at line 1800 was first introduced by commit
:::::: ae0e4bb2a0e0e434e9f98fb4994093ec2ee71997 net: phylink: Adjust link settings based on rate matching

:::::: TO: Sean Anderson <sean.anderson@seco.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
