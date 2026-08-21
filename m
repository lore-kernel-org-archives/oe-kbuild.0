Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63A02750E6
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Aug 2026 17:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787334721; cv=none; b=l1nhiS3S1D4JW2gtLnwQNdX3Sl7iTcCn7GN+JD07errZYLULqvhtzAFv++2zJri3l7BkEB3LbLoEHwFisJFY+NxpcgKMkpg7xUjVOl5OzZgwRMivuw0mjeWyCs4DNJ0oreI44TrSxH92jcRJZtYOnPLnHPAsTTpJ8p8carTZ1h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787334721; c=relaxed/simple;
	bh=paJ7pNvltl6hCZerNaiZ1LEYmxapY9R1A8JnJFWqha4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IyVW/+AWHY14icGUZ4DrCmZu7YkWu4HMOSb8FZUPIYEE47lnm7eT/WPbNXwaDDDyqXAO2FB6DE4yY20H7BFPGi/o0mlyYXIu9BS9HpUyQGtyWcnCRx82+W2ORF+CR0j4WJ+IXP2q5bnLP88tHGEGtGZzJySacGH7ecJ+WPgD/3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HeUFgpLl; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HeUFgpLl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787334720; x=1818870720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=paJ7pNvltl6hCZerNaiZ1LEYmxapY9R1A8JnJFWqha4=;
  b=HeUFgpLlzYXGj1j44C4OijH88RPKSYuL/dnNEion70IZqqWPzJa/tHXx
   mzdLc2NSeVM4LAiUYX64Tj2R+YYy8bjMUJSJXn7ekesG6CNOqW7iQrJKL
   eh7dRrNoyWEckWPEQFsF+6sYXcVfSKdX8MRLg1B7f2KpUlUNb6XP7vQKu
   Aub+WS7L0raKl6pfsgGEGU2soyFY1R0P5zE4e1EabC8g2SbGXmPffBmHJ
   8ck28BxMkjUJAClBW0hYld672rqaPiHbXww8KzhXpL1oP/Ek37Z/j8jRp
   lhJmWAMVtSnNXmNjEkxscFdibwRZsgFJ/U9m3WMGaikvh6lGbiD+OeDyr
   A==;
X-CSE-ConnectionGUID: DqDAtWr9T5mmgp/Tq9cZIA==
X-CSE-MsgGUID: 2wNzgPbLTem1YF8KTwHzEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="105427094"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="105427094"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 10:51:59 -0700
X-CSE-ConnectionGUID: qNiAtOWCRkiSjfjSwTrUHw==
X-CSE-MsgGUID: PU8JbSyKTwuNTP3tx48A8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="263757924"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Aug 2026 10:51:58 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxTPH-00000000qHd-3lkk;
	Fri, 21 Aug 2026 17:51:55 +0000
Date: Sat, 22 Aug 2026 01:51:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net] net: amd-xgbe: support receiving packets with bad FCS
Message-ID: <202608220122.kg89130y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260812091616.35811-1-aslan.jnn@gmail.com>
References: <20260812091616.35811-1-aslan.jnn@gmail.com>
TO: James <aslan.jnn@gmail.com>
TO: Raju Rangoju <Raju.Rangoju@amd.com>
TO: Prashanth Kumar K R <PrashanthKumar.K.R@amd.com>
CC: netdev@vger.kernel.org
CC: Thomas.Lendacky@amd.com
CC: James Nugraha <aslan.jnn@gmail.com>

Hi James,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/James/net-amd-xgbe-support-receiving-packets-with-bad-FCS/20260812-091616
base:   net/main
patch link:    https://lore.kernel.org/r/20260812091616.35811-1-aslan.jnn%40gmail.com
patch subject: [PATCH net] net: amd-xgbe: support receiving packets with bad FCS
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: powerpc-randconfig-r123-20260821 (https://download.01.org/0day-ci/archive/20260822/202608220122.kg89130y-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608220122.kg89130y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608220122.kg89130y-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/amd/xgbe/xgbe-drv.c:2022:17: sparse: sparse: dubious: !x & y
   drivers/net/ethernet/amd/xgbe/xgbe-drv.c: note: in included file (through include/linux/tcp.h):
   include/linux/skbuff.h:2904:28: sparse: sparse: unsigned value that used to be signed checked against zero?
   include/linux/skbuff.h:2904:28: sparse: signed value source
--
>> drivers/net/ethernet/amd/xgbe/xgbe-dev.c:3403:9: sparse: sparse: dubious: !x & y

vim +2022 drivers/net/ethernet/amd/xgbe/xgbe-drv.c

1a510ccf5869a9 Lendacky, Thomas 2017-08-18  1977  
c5aa9e3b815645 Lendacky, Thomas 2014-06-05  1978  static int xgbe_set_features(struct net_device *netdev,
c5aa9e3b815645 Lendacky, Thomas 2014-06-05  1979  			     netdev_features_t features)
c5aa9e3b815645 Lendacky, Thomas 2014-06-05  1980  {
c5aa9e3b815645 Lendacky, Thomas 2014-06-05  1981  	struct xgbe_prv_data *pdata = netdev_priv(netdev);
c5aa9e3b815645 Lendacky, Thomas 2014-06-05  1982  	struct xgbe_hw_if *hw_if = &pdata->hw_if;
5a1edf2f430d12 James Nugraha    2026-08-12  1983  	netdev_features_t rxhash, rxcsum, rxvlan, rxvlan_filter, rxall;
5b9dfe299e5560 Lendacky, Thomas 2014-11-04  1984  	int ret = 0;
c5aa9e3b815645 Lendacky, Thomas 2014-06-05  1985  
5b9dfe299e5560 Lendacky, Thomas 2014-11-04  1986  	rxhash = pdata->netdev_features & NETIF_F_RXHASH;
801c62d945c612 Lendacky, Thomas 2014-06-24  1987  	rxcsum = pdata->netdev_features & NETIF_F_RXCSUM;
801c62d945c612 Lendacky, Thomas 2014-06-24  1988  	rxvlan = pdata->netdev_features & NETIF_F_HW_VLAN_CTAG_RX;
801c62d945c612 Lendacky, Thomas 2014-06-24  1989  	rxvlan_filter = pdata->netdev_features & NETIF_F_HW_VLAN_CTAG_FILTER;
5a1edf2f430d12 James Nugraha    2026-08-12  1990  	rxall = pdata->netdev_features & NETIF_F_RXALL;
c5aa9e3b815645 Lendacky, Thomas 2014-06-05  1991  
5b9dfe299e5560 Lendacky, Thomas 2014-11-04  1992  	if ((features & NETIF_F_RXHASH) && !rxhash)
5b9dfe299e5560 Lendacky, Thomas 2014-11-04  1993  		ret = hw_if->enable_rss(pdata);
5b9dfe299e5560 Lendacky, Thomas 2014-11-04  1994  	else if (!(features & NETIF_F_RXHASH) && rxhash)
5b9dfe299e5560 Lendacky, Thomas 2014-11-04  1995  		ret = hw_if->disable_rss(pdata);
5b9dfe299e5560 Lendacky, Thomas 2014-11-04  1996  	if (ret)
5b9dfe299e5560 Lendacky, Thomas 2014-11-04  1997  		return ret;
5b9dfe299e5560 Lendacky, Thomas 2014-11-04  1998  
f04dd30f1bef1e Vishal Badole    2025-04-24  1999  	if ((features & NETIF_F_RXCSUM) && !rxcsum) {
f04dd30f1bef1e Vishal Badole    2025-04-24  2000  		hw_if->enable_sph(pdata);
f04dd30f1bef1e Vishal Badole    2025-04-24  2001  		hw_if->enable_vxlan(pdata);
c5aa9e3b815645 Lendacky, Thomas 2014-06-05  2002  		hw_if->enable_rx_csum(pdata);
f04dd30f1bef1e Vishal Badole    2025-04-24  2003  		schedule_work(&pdata->restart_work);
f04dd30f1bef1e Vishal Badole    2025-04-24  2004  	} else if (!(features & NETIF_F_RXCSUM) && rxcsum) {
f04dd30f1bef1e Vishal Badole    2025-04-24  2005  		hw_if->disable_sph(pdata);
f04dd30f1bef1e Vishal Badole    2025-04-24  2006  		hw_if->disable_vxlan(pdata);
c5aa9e3b815645 Lendacky, Thomas 2014-06-05  2007  		hw_if->disable_rx_csum(pdata);
f04dd30f1bef1e Vishal Badole    2025-04-24  2008  		schedule_work(&pdata->restart_work);
f04dd30f1bef1e Vishal Badole    2025-04-24  2009  	}
c5aa9e3b815645 Lendacky, Thomas 2014-06-05  2010  
801c62d945c612 Lendacky, Thomas 2014-06-24  2011  	if ((features & NETIF_F_HW_VLAN_CTAG_RX) && !rxvlan)
c5aa9e3b815645 Lendacky, Thomas 2014-06-05  2012  		hw_if->enable_rx_vlan_stripping(pdata);
801c62d945c612 Lendacky, Thomas 2014-06-24  2013  	else if (!(features & NETIF_F_HW_VLAN_CTAG_RX) && rxvlan)
c5aa9e3b815645 Lendacky, Thomas 2014-06-05  2014  		hw_if->disable_rx_vlan_stripping(pdata);
801c62d945c612 Lendacky, Thomas 2014-06-24  2015  
801c62d945c612 Lendacky, Thomas 2014-06-24  2016  	if ((features & NETIF_F_HW_VLAN_CTAG_FILTER) && !rxvlan_filter)
801c62d945c612 Lendacky, Thomas 2014-06-24  2017  		hw_if->enable_rx_vlan_filtering(pdata);
801c62d945c612 Lendacky, Thomas 2014-06-24  2018  	else if (!(features & NETIF_F_HW_VLAN_CTAG_FILTER) && rxvlan_filter)
801c62d945c612 Lendacky, Thomas 2014-06-24  2019  		hw_if->disable_rx_vlan_filtering(pdata);
c5aa9e3b815645 Lendacky, Thomas 2014-06-05  2020  
5a1edf2f430d12 James Nugraha    2026-08-12  2021  	if ((features & NETIF_F_RXALL) != rxall)
5a1edf2f430d12 James Nugraha    2026-08-12 @2022  		XGMAC_IOWRITE_BITS(pdata, MAC_RCR, DCRCC,
5a1edf2f430d12 James Nugraha    2026-08-12  2023  				   !!(features & NETIF_F_RXALL));
5a1edf2f430d12 James Nugraha    2026-08-12  2024  
c5aa9e3b815645 Lendacky, Thomas 2014-06-05  2025  	pdata->netdev_features = features;
c5aa9e3b815645 Lendacky, Thomas 2014-06-05  2026  
c5aa9e3b815645 Lendacky, Thomas 2014-06-05  2027  	DBGPR("<--xgbe_set_features\n");
c5aa9e3b815645 Lendacky, Thomas 2014-06-05  2028  
c5aa9e3b815645 Lendacky, Thomas 2014-06-05  2029  	return 0;
c5aa9e3b815645 Lendacky, Thomas 2014-06-05  2030  }
c5aa9e3b815645 Lendacky, Thomas 2014-06-05  2031  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
