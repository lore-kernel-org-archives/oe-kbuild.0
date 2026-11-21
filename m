Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795280718;
	b=yY7SjV5E9xSqmZkvVvExCi1Wk0UL9s3AtNQ+cYrhy5/P33TjMmcQ/3RHsdowwd2sg7KQ
	 zQFKOsT5uhIJTuJ307aKHFelevRFohI/KuLz0HSBv+Jf0rde7Ujx7/U2IAv5bNA/HPnZ9
	 icTGxLKrQiWZcjj83MHOkhOfHdTbGxakE2cik4k52FX0ByZQL7NEDDzXmLerAA3rfMx7c
	 NaUIq++7OKyRPkErO7+DxmJ4E7lYizr+pUYkCC9nTXmwl9FY6cEh9Za89dt/8WPLgz6gU
	 TFJhM4bB2q81nDmTL4g34OrAGHzg80X/F60pvHkpGwCVK/GJYNg71dyysdL+LYlImAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795280718;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=9nse68J7HCSaGj66FrQveVSu2w+Gs1tkGu99R2arX+k=;
	b=ETNRNU3Askk7ePi/CI4Wk1KS6HG+Q99vJz733/mJ35KaeeJ7R883GVqFDjB/Yt5AbJeO
	 qq1Ly4LtUZm0MuVr+os3fZo9nqP30R2sHWNHUm8ARLpCkCw64A7Pv9VTdtXCh8p/6TYQC
	 oa299IBdyzCfL7JGmdIfbB50pu7L01lm2e36SvTthCYCYhRFrrngdb5i5Jd0207HGqDde
	 p5JbPIFFL8qaVZpnJd+F2OIrU4rIbOYflxwIBY+d9Y2H7t2LtfZKPyw5AGeq2FGCFYyGZ
	 LLw7Gfb+GHKsmZmNtR+NuLgKyVDVpqRmySUj3x6ey2ADvg7GFCiTxfH0f6ciAbuotew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KlkQLyYw;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B980606A320
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 17:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B980606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KlkQLyYw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795280718; x=1826816718;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KSlxRfKsf4fWMb9YD9srRMBAWzfGFQmcYMIgHHtWd7s=;
  b=KlkQLyYwnpNTjY6Z5tWSTCeVxu1Hs98k9MgXWL5XLjmLeCg1I/TL/huZ
   9f6qCs4NmyrPfPFiD10+bUTwPRGaN+k2obTgC3gUR0B6Lk1Hm+U79VPH7
   OxNQL5Kyim8/FBOE+VZcjrvcXAYGRM6gwjzarRJYTUEhygxGrbjYxfwqA
   xlH6RizEZzLsPbSjEEGhlaZv5IANmJpPkoNZjJfi8L3DZT9qp0iYhqrOa
   y/cLk3J188YSCILPXwjvEdHDXFv7dBSPXk9c+Wa4fkxzbymZQOxfRzjLN
   WdTvsA9YlkEIWacN40GE9UhXM6ydzKNj8hfH93ZYkAo/CDh5RczDaqu7q
   w==;
X-CSE-ConnectionGUID: 0xDPPBgkRmuhH3iMJkE2JA==
X-CSE-MsgGUID: 61ER4I3PSoqC9h3OWnqlSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4180474"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4180474"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 09:05:17 -0800
X-CSE-ConnectionGUID: WDwihs0rT0evN8Df5aUk9w==
X-CSE-MsgGUID: NzMFNzI5TZOGyC2EO8LyFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="11208549"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Nov 2026 09:05:16 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUoWY-00000001KKl-0hGu;
	Sat, 21 Nov 2026 17:05:14 +0000
Date: Sun, 22 Nov 2026 01:04:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RFC wireless-next 1/4] wifi: b43: 11ac chanspec for the
 AC microcode
Message-ID: <202611220014.qAoTWLEz-lkp@intel.com>
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
CC: llvm@lists.linux.dev
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
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20261122/202611220014.qAoTWLEz-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/202611220014.qAoTWLEz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611220014.qAoTWLEz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/broadcom/b43/phy_common.c:24:
   In file included from drivers/net/wireless/broadcom/b43/b43.h:7:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/net/wireless/broadcom/b43/phy_common.c:442:6: error: call to undeclared function 'b43_ucode_is_ac'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     442 |         if (b43_ucode_is_ac(dev))
         |             ^
   1 warning and 1 error generated.


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
