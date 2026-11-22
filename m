Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795323048;
	b=5MgdtzKnZTEYCu0UCw3v2Q346Uli4cdUFNWn+80kop+8BwDV8hvRcmYfQ7zqG6LdOsU5
	 tHzyQLk5a7DBtwnjZsNQzqeyPEzHg6rjDmXVzrn4kMtUXqUxJCPmq+1Ujd4gS+PEFrgkZ
	 8lYIU5mcO3NlyWvVSp3AOZEkB19mFmyzU6fcqi66vg5gT4+njtxmw3o6gJRFd9cPMHhjR
	 3Vx8d1M4fwcVywPqfSqvB6tPPoyGvrmgrSGIlp0BXKdueEfPHch8maObiBZILRo9UFVZ6
	 kAE6M5O1A5UgzbfJ1y5DkEYlxq27rg0VZ20M7g1Ryy/SP/7JkoTxopbiCCKpoD/EG+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795323048;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=HhdT82ZQ7t9BCB2jBjSyGi+BunOPROPzYaWSu3vH+GM=;
	b=pydr5F6NJNfNgFRO09Oeg7rdq1XPUt2Y8JVj27gKo3TgRmiOkMDM5u7PKLDOoqSt7LYR
	 Cg4o8Sqs7QH9VEobkiXkVI2sOvUolHBS9KbGXbgaKCH7ihnGpvgNSQhwEuPlVKXLBpjVS
	 OBtKjhUhZd+JkfZTdGWXcyyf8n4C0/M6y9CekJYHSUzPPhr3T727hPNXB5WGHdB8H7X8c
	 z1MA6dMP/JgBfM2gug4txvUmPeOTGNTWvfk7gP6GQZnGH1tIzUSF0VkFaFEtcF5xWqSTq
	 c0u1zm9quvNDUgse+zsOsDgStMcl58D6w0CKF+Rfs72yVNQC9XTNFlHU7pKh5TP3Q2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wsan4eom;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8749A606A320
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 04:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8749A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wsan4eom
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795323048; x=1826859048;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FBWSZTlCTRj5aZsEmAU8jIVYo9syAZyS4iBE3Zzy3m0=;
  b=Wsan4eomQzN5EsZX8xsfbf9/ncCwTHKRWMqNU2YtjJrU7MFzqswW0G5h
   gV3NPXq7B0IY7+reS+mCX+0oMtgbdpGsnlijdUcLrGMYqH0bF6A4CR9Gs
   TmqY7g6MPzfIEVWWLaU6N1AajvHfRbCD/EO09LMuO/qmshfJrBOWdgVSU
   m6FR0D5fvf0Ti+AewfdjVNkIGXhqD/Mga0mjlRpOhldzrZKj93PzfuXCx
   Q4uYCesL7pEQV7nhPOSXUVhMYFahnzuErcs3UlCfXRGJZZR5V0tSpnPlr
   HuHMbL7pSh0WHURxT87vh3V5FzGp159Z8MA6NiJ83LoSr48wE5BRmyUSB
   g==;
X-CSE-ConnectionGUID: zNDXP4H7RbKPd3dPPtJgvA==
X-CSE-MsgGUID: 8+8qyZXwS2yj6jTAAJ1L3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4154578"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4154578"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 20:50:47 -0800
X-CSE-ConnectionGUID: ltVaxO7nQxuUZgsVPwyuJw==
X-CSE-MsgGUID: ne6MQbvuTp2p42sUmJsmWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11344853"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Nov 2026 20:50:46 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUzXH-00000001L2R-2Rso;
	Sun, 22 Nov 2026 04:50:43 +0000
Date: Sun, 22 Nov 2026 12:49:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RFC wireless-next 4/4] wifi: b43: A-MPDU for the AC
 microcode
Message-ID: <202611221214.jUrqBylV-lkp@intel.com>
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
:::::: Manual check reason: "same reports for this branch"
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261112175640.40603-5-gonsolo@gmail.com>
References: <20261112175640.40603-5-gonsolo@gmail.com>
TO: Andreas Wendleder <gonsolo@gmail.com>

Hi Andreas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Wendleder/wifi-b43-11ac-chanspec-for-the-AC-microcode/20261112-185637
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20261112175640.40603-5-gonsolo%40gmail.com
patch subject: [PATCH RFC wireless-next 4/4] wifi: b43: A-MPDU for the AC microcode
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20261122/202611221214.jUrqBylV-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/202611221214.jUrqBylV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611221214.jUrqBylV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/broadcom/b43/main.c:25:
   In file included from include/linux/if_arp.h:22:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from drivers/net/wireless/broadcom/b43/main.c:44:
   drivers/net/wireless/broadcom/b43/xmit.h:202:6: error: call to undeclared function 'b43_ucode_is_ac'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     202 |         if (b43_ucode_is_ac(dev))
         |             ^
   drivers/net/wireless/broadcom/b43/main.c:1346:7: error: call to undeclared function 'b43_ucode_is_ac'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1346 |                 if (b43_ucode_is_ac(dev)) {
         |                     ^
   drivers/net/wireless/broadcom/b43/main.c:1444:7: error: call to undeclared function 'b43_ucode_is_ac'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1444 |                 if (b43_ucode_is_ac(dev)) {
         |                     ^
   drivers/net/wireless/broadcom/b43/main.c:5271:27: error: call to undeclared function 'b43_ucode_is_ac'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5271 |         if (!wl->current_dev || !b43_ucode_is_ac(wl->current_dev))
         |                                  ^
>> drivers/net/wireless/broadcom/b43/main.c:5409:6: error: call to undeclared function 'b43_is_ac_core'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5409 |         if (b43_is_ac_core(dev))
         |             ^
   1 warning and 5 errors generated.


vim +/b43_is_ac_core +5409 drivers/net/wireless/broadcom/b43/main.c

e4d6b7951812d98 drivers/net/wireless/b43/main.c          Michael Buesch    2007-09-18  5381  
bb1eeff12d4cd6c drivers/net/wireless/b43/main.c          Michael Buesch    2008-02-09  5382  static int b43_setup_bands(struct b43_wldev *dev,
96c755a39237483 drivers/net/wireless/b43/main.c          Michael Buesch    2008-01-06  5383  			   bool have_2ghz_phy, bool have_5ghz_phy)
e4d6b7951812d98 drivers/net/wireless/b43/main.c          Michael Buesch    2007-09-18  5384  {
e4d6b7951812d98 drivers/net/wireless/b43/main.c          Michael Buesch    2007-09-18  5385  	struct ieee80211_hw *hw = dev->wl->hw;
3695b9324ee9bb8 drivers/net/wireless/b43/main.c          Rafał Miłecki     2014-07-08  5386  	struct b43_phy *phy = &dev->phy;
3695b9324ee9bb8 drivers/net/wireless/b43/main.c          Rafał Miłecki     2014-07-08  5387  	bool limited_2g;
b453fda6bad14d1 drivers/net/wireless/b43/main.c          Rafał Miłecki     2014-07-23  5388  	bool limited_5g;
3695b9324ee9bb8 drivers/net/wireless/b43/main.c          Rafał Miłecki     2014-07-08  5389  
3695b9324ee9bb8 drivers/net/wireless/b43/main.c          Rafał Miłecki     2014-07-08  5390  	/* We don't support all 2 GHz channels on some devices */
c11082f0c00acde drivers/net/wireless/b43/main.c          Rafał Miłecki     2014-07-19  5391  	limited_2g = phy->radio_ver == 0x2057 &&
c11082f0c00acde drivers/net/wireless/b43/main.c          Rafał Miłecki     2014-07-19  5392  		     (phy->radio_rev == 9 || phy->radio_rev == 14);
b453fda6bad14d1 drivers/net/wireless/b43/main.c          Rafał Miłecki     2014-07-23  5393  	limited_5g = phy->radio_ver == 0x2057 &&
b453fda6bad14d1 drivers/net/wireless/b43/main.c          Rafał Miłecki     2014-07-23  5394  		     phy->radio_rev == 9;
e4d6b7951812d98 drivers/net/wireless/b43/main.c          Michael Buesch    2007-09-18  5395  
bb1eeff12d4cd6c drivers/net/wireless/b43/main.c          Michael Buesch    2008-02-09  5396  	if (have_2ghz_phy)
57fbcce37be7c1d drivers/net/wireless/broadcom/b43/main.c Johannes Berg     2016-04-12  5397  		hw->wiphy->bands[NL80211_BAND_2GHZ] = limited_2g ?
3695b9324ee9bb8 drivers/net/wireless/b43/main.c          Rafał Miłecki     2014-07-08  5398  			&b43_band_2ghz_limited : &b43_band_2GHz;
bb1eeff12d4cd6c drivers/net/wireless/b43/main.c          Michael Buesch    2008-02-09  5399  	if (dev->phy.type == B43_PHYTYPE_N) {
bb1eeff12d4cd6c drivers/net/wireless/b43/main.c          Michael Buesch    2008-02-09  5400  		if (have_5ghz_phy)
57fbcce37be7c1d drivers/net/wireless/broadcom/b43/main.c Johannes Berg     2016-04-12  5401  			hw->wiphy->bands[NL80211_BAND_5GHZ] = limited_5g ?
b453fda6bad14d1 drivers/net/wireless/b43/main.c          Rafał Miłecki     2014-07-23  5402  				&b43_band_5GHz_nphy_limited :
b453fda6bad14d1 drivers/net/wireless/b43/main.c          Rafał Miłecki     2014-07-23  5403  				&b43_band_5GHz_nphy;
bb1eeff12d4cd6c drivers/net/wireless/b43/main.c          Michael Buesch    2008-02-09  5404  	} else {
bb1eeff12d4cd6c drivers/net/wireless/b43/main.c          Michael Buesch    2008-02-09  5405  		if (have_5ghz_phy)
57fbcce37be7c1d drivers/net/wireless/broadcom/b43/main.c Johannes Berg     2016-04-12  5406  			hw->wiphy->bands[NL80211_BAND_5GHZ] = &b43_band_5GHz_aphy;
bb1eeff12d4cd6c drivers/net/wireless/b43/main.c          Michael Buesch    2008-02-09  5407  	}
bb1eeff12d4cd6c drivers/net/wireless/b43/main.c          Michael Buesch    2008-02-09  5408  
2decf2ceb04dae6 drivers/net/wireless/broadcom/b43/main.c Andreas Wendleder 2026-11-12 @5409  	if (b43_is_ac_core(dev))
2decf2ceb04dae6 drivers/net/wireless/broadcom/b43/main.c Andreas Wendleder 2026-11-12  5410  		ieee80211_hw_set(hw, AMPDU_AGGREGATION);
2decf2ceb04dae6 drivers/net/wireless/broadcom/b43/main.c Andreas Wendleder 2026-11-12  5411  
bb1eeff12d4cd6c drivers/net/wireless/b43/main.c          Michael Buesch    2008-02-09  5412  	dev->phy.supports_2ghz = have_2ghz_phy;
bb1eeff12d4cd6c drivers/net/wireless/b43/main.c          Michael Buesch    2008-02-09  5413  	dev->phy.supports_5ghz = have_5ghz_phy;
e4d6b7951812d98 drivers/net/wireless/b43/main.c          Michael Buesch    2007-09-18  5414  
e4d6b7951812d98 drivers/net/wireless/b43/main.c          Michael Buesch    2007-09-18  5415  	return 0;
e4d6b7951812d98 drivers/net/wireless/b43/main.c          Michael Buesch    2007-09-18  5416  }
e4d6b7951812d98 drivers/net/wireless/b43/main.c          Michael Buesch    2007-09-18  5417  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
