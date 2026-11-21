Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795256900;
	b=JGK1XKQTnXx597LXuVz4RqPOtaFqIvo+Zdb2q+vgp3/e1Vt0UBr3R4Jrhr2Rl9yRq9/D
	 i91FYnDwAi2B9ogq+DpXgrpZvGzIQxLJRrKtNQdbqO2o59iN7SnJWfAlpF3ySgXRO/jUc
	 qQE7P+6oSeviJtyQZszllOZdwLJoLzMBM//kmSjm0kXwfSFh3Qst4uv6kHCldW4HWwmBn
	 pX0AxJcRAj8wSFybqkfLCKT2xsQd+DMqST+DLyl7e+xTgjEfIJD8OYvvjvZmE6kQleNt2
	 ZfUUu2CfzEEkvfWVd/8Ow2Knex/obhhZXm9ix/k2hI89+5eabLsl+gNUv+Y+PtxwxZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795256900;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=ENw+8CnwTON6sHOmixXEAaGacW50XrYA2qpXJRgVWuA=;
	b=sBVaITIU6UGtoWZGECHw4O2P2kfJc6MAEPskaUdiztynNi9+qt2UcP/Ji/hwIWm+F+Z6
	 YcnkwgWU/gArBhWYqQ95Xt2/qkh5/oeaCM2nR75tlsGgcf/H03sR6RpqAo339mkuInI7e
	 ema7GEUZEJoQsSF13U+S96+u8iLekRRYzMCVjNBUGzM+Ohy9AAVU3OnxNsouDTU++nD9X
	 NeLDbryvv3/xhdvaOLf3/LR+82vEdSswR5R+wn/yrYCRtVRFl4ouVqwE8g249wlv7mGly
	 xFhsvjCnyo6w9Ubd/dWg6MjzYaSkGW8N3yArCq+cCg0Sq1t04uNwO6WumC1WbclgWig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g7cAe3qR;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A47606A325
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 10:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83A47606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g7cAe3qR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795256898; x=1826792898;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HED4HRjH3/e1PZJCp9wI1l2ZZqt309RsMeWeMQOM9YM=;
  b=g7cAe3qRM37+yQy7EPY3pQEs5AYculm9gwliLY9A2n4aVtbVB2ThtaU/
   ZV0INS/yRyx6t5pcu/Sg6COYvjlEu7bZT5UN0D0mWwQKjE41ifDCZDCNo
   mBZ/vrl9ysZbjOzJm6jtb7V+qp7XjU6iM3ujDR5gV6c3LoYERFSVyKS8I
   XrJwSCYph0m3e2JidjcwevU0UPOONbwjIFZ+Ed83YTl0gAZzRB+Gar1t8
   /bE25Pl7aFp0rb0th2WN5nsNKhapT/RtksJvCeHGbtClIHzWbYgulqzc9
   Kv2GU3az0ZMD7tsIsCTAIMZWtUiW1DFLS/S+llY/HlgDgDwr3hABY84tD
   A==;
X-CSE-ConnectionGUID: ZzqLajl+Qyirfg3FVsWbEQ==
X-CSE-MsgGUID: BjEFGIyJQAKWora+sYXlXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4037572"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4037572"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 02:28:17 -0800
X-CSE-ConnectionGUID: vlg7Hj7tTrqYvaC/fOXbHw==
X-CSE-MsgGUID: MmMK0IX7Q5WkYr164bTT1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="10903432"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Nov 2026 02:28:17 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUiKM-00000001Jtz-1hQN;
	Sat, 21 Nov 2026 10:28:14 +0000
Date: Sat, 21 Nov 2026 18:27:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RFC wireless-next 1/4] wifi: b43: 11ac chanspec for the
 AC microcode
Message-ID: <202611211858.oiGGCs8R-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261112175640.40603-2-gonsolo@gmail.com>
References: <20261112175640.40603-2-gonsolo@gmail.com>
TO: Andreas Wendleder <gonsolo@gmail.com>

Hi Andreas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Wendleder/wifi-b43-11ac-chanspec-for-the-AC-microcode/20261112-185637
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20261112175640.40603-2-gonsolo%40gmail.com
patch subject: [PATCH RFC wireless-next 1/4] wifi: b43: 11ac chanspec for the AC microcode
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20261121/202611211858.oiGGCs8R-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/202611211858.oiGGCs8R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611211858.oiGGCs8R-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/broadcom/b43/phy_common.c: In function 'b43_switch_channel':
>> drivers/net/wireless/broadcom/b43/phy_common.c:442:13: error: implicit declaration of function 'b43_ucode_is_ac' [-Wimplicit-function-declaration]
     442 |         if (b43_ucode_is_ac(dev))
         |             ^~~~~~~~~~~~~~~


vim +/b43_ucode_is_ac +442 drivers/net/wireless/broadcom/b43/phy_common.c

d7012183113b1b drivers/net/wireless/broadcom/b43/phy_common.c Andreas Wendleder 2026-11-12  426  
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  427  int b43_switch_channel(struct b43_wldev *dev, unsigned int new_channel)
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  428  {
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  429  	struct b43_phy *phy = &(dev->phy);
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  430  	u16 channelcookie, savedcookie;
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  431  	int err;
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  432  
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  433  	/* First we set the channel radio code to prevent the
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  434  	 * firmware from sending ghost packets.
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  435  	 */
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  436  	channelcookie = new_channel;
57fbcce37be7c1 drivers/net/wireless/broadcom/b43/phy_common.c Johannes Berg     2016-04-12  437  	if (b43_current_band(dev->wl) == NL80211_BAND_5GHZ)
106cb09a145a5c drivers/net/wireless/b43/phy_common.c          Rafał Miłecki     2010-10-06  438  		channelcookie |= B43_SHM_SH_CHAN_5GHZ;
106cb09a145a5c drivers/net/wireless/b43/phy_common.c          Rafał Miłecki     2010-10-06  439  	/* FIXME: set 40Mhz flag if required */
106cb09a145a5c drivers/net/wireless/b43/phy_common.c          Rafał Miłecki     2010-10-06  440  	if (0)
106cb09a145a5c drivers/net/wireless/b43/phy_common.c          Rafał Miłecki     2010-10-06  441  		channelcookie |= B43_SHM_SH_CHAN_40MHZ;
d7012183113b1b drivers/net/wireless/broadcom/b43/phy_common.c Andreas Wendleder 2026-11-12 @442  	if (b43_ucode_is_ac(dev))
d7012183113b1b drivers/net/wireless/broadcom/b43/phy_common.c Andreas Wendleder 2026-11-12  443  		channelcookie = b43_ac_chanspec(dev, new_channel);
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  444  	savedcookie = b43_shm_read16(dev, B43_SHM_SHARED, B43_SHM_SH_CHAN);
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  445  	b43_shm_write16(dev, B43_SHM_SHARED, B43_SHM_SH_CHAN, channelcookie);
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  446  
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  447  	/* Now try to switch the PHY hardware channel. */
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  448  	err = phy->ops->switch_channel(dev, new_channel);
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  449  	if (err)
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  450  		goto err_restore_cookie;
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  451  
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  452  	/* Wait for the radio to tune to the channel and stabilize. */
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  453  	msleep(8);
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  454  
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  455  	return 0;
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  456  
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  457  err_restore_cookie:
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  458  	b43_shm_write16(dev, B43_SHM_SHARED,
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  459  			B43_SHM_SH_CHAN, savedcookie);
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  460  
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  461  	return err;
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  462  }
ef1a628d83fc04 drivers/net/wireless/b43/phy_common.c          Michael Buesch    2008-08-27  463  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
