Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285108;
	b=jqbfJFlmcTdmOotcAoVtC/dXz7GYJr3ahaDMt06oo5EwkL3FyQO7l5v0DOO7nmEQFhoN
	 UnrlQ2zlvabrED9GZpmLNh0Kq7XcgnDZNymtfshI0mskowWP/bv+Y7zy2wceto58k1QOc
	 2Lr5OWCMXA0+WHrUC3HW2/RMQk9BQLAS5O+kqaBojKGGZt8It0rYf17oQ/OHlCCZG3gVy
	 NV6F7l+Y1zXBULzFM3tm5mCN4gBjnoQfUkJpai0kY1GqG5WknxrMrT7HUm9KYhxE+kwey
	 w0LyDy+c1YisWhXr8mfp3fGEZ/QYBq7tI4PZ0EhTJnTyWteJTJh5x3LQYY1FS0D6qpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285108;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=1bsfi6ToaIEshd9V411IhkDHELpbV6e3UtlqPFH1YUg=;
	b=KS8FZRRRWRC9YAJ/1ldv3xkxrt4vy9VlF8S/H+lh9k2tx0+Esi/1KlXVFPzgU0RzesCV
	 auPQ7Y+1RvWDsUIX/kxRPGQ2Mm4B5YfUnih1NaXlYrgxbaV4Zib2gfrxdagPQsJtsQiEf
	 9WE1kg8WtR4LSZRZrT/rt1yIUe5azqV6sG3pozJOqoXlntud+2Qhj/I7Qb5xbYkHjKYyX
	 zE1z8VUacEOhhDqIuJbwUm/4y///3VZs8M1kWoc/1atfIEE+xbNCK+5nb8oIcz7zaG7k4
	 Pc2Pq6XVUJgLtPC2qtqFs8ETas6GUVvsytpTH2CyZyx2KvrmVbIgSCLqktO3af6vCvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e0tbsk5g;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB29606A32C
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 18:18:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FB29606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e0tbsk5g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795285109; x=1826821109;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xUU5BfWZFcwI9JVmfEbgLgOxqnZ9A8zEsOuV1VTVchI=;
  b=e0tbsk5g4jTOiDkBWJ772cpqbP5HLShcQel+tAVfyMUHX/nRLgd6Y/IQ
   /FPxUGmUodSPSkv85PoKK6EZbHJctXMYCe5WgchhtUyCCvhUncWX56GkD
   oTunbBQXGxyIsQmtS3L/b+3MYwK+ccrf7GTVi5bpx5TzmS7trEnt24U1T
   JqRheh7i4UMO35B5iwTyTeeTM3TR/3hfIFbhaYKx67UPl8V0LcFtqkVau
   zobFPYsYutKu15+RxJtt3kxkeipRUssGlkRj0zmXemjmOjIkHfpzslCQd
   oOA8zoQwgsnuF4vY/eORP9BR391AkvXQ24z9xJTF+6J0nUSb7RcfwNjYx
   A==;
X-CSE-ConnectionGUID: 8oJZIuEdRh2W1hEXaypE9g==
X-CSE-MsgGUID: Ah1PXvUIQz6/DB/RTk6Khw==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4241702"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4241702"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 10:18:28 -0800
X-CSE-ConnectionGUID: aWYciScPTQSu+ypj1YLBew==
X-CSE-MsgGUID: 23Epvv/9TJetcM0Eif5YfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="10844824"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Nov 2026 10:18:27 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUpfN-00000001KQE-017g;
	Sat, 21 Nov 2026 18:18:25 +0000
Date: Sun, 22 Nov 2026 02:17:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RFC wireless-next 4/4] wifi: b43: A-MPDU for the AC
 microcode
Message-ID: <202611220239.VV63dQYO-lkp@intel.com>
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
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20261122/202611220239.VV63dQYO-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/202611220239.VV63dQYO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611220239.VV63dQYO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/broadcom/b43/main.c:44:
   drivers/net/wireless/broadcom/b43/xmit.h: In function 'b43_txhdr_size':
   drivers/net/wireless/broadcom/b43/xmit.h:202:13: error: implicit declaration of function 'b43_ucode_is_ac' [-Wimplicit-function-declaration]
     202 |         if (b43_ucode_is_ac(dev))
         |             ^~~~~~~~~~~~~~~
   drivers/net/wireless/broadcom/b43/main.c: In function 'b43_setup_bands':
>> drivers/net/wireless/broadcom/b43/main.c:5409:13: error: implicit declaration of function 'b43_is_ac_core'; did you mean 'b43_is_cck_rate'? [-Wimplicit-function-declaration]
    5409 |         if (b43_is_ac_core(dev))
         |             ^~~~~~~~~~~~~~
         |             b43_is_cck_rate


vim +5409 drivers/net/wireless/broadcom/b43/main.c

e4d6b7951812d9 drivers/net/wireless/b43/main.c          Michael Buesch    2007-09-18  5381  
bb1eeff12d4cd6 drivers/net/wireless/b43/main.c          Michael Buesch    2008-02-09  5382  static int b43_setup_bands(struct b43_wldev *dev,
96c755a3923748 drivers/net/wireless/b43/main.c          Michael Buesch    2008-01-06  5383  			   bool have_2ghz_phy, bool have_5ghz_phy)
e4d6b7951812d9 drivers/net/wireless/b43/main.c          Michael Buesch    2007-09-18  5384  {
e4d6b7951812d9 drivers/net/wireless/b43/main.c          Michael Buesch    2007-09-18  5385  	struct ieee80211_hw *hw = dev->wl->hw;
3695b9324ee9bb drivers/net/wireless/b43/main.c          Rafał Miłecki     2014-07-08  5386  	struct b43_phy *phy = &dev->phy;
3695b9324ee9bb drivers/net/wireless/b43/main.c          Rafał Miłecki     2014-07-08  5387  	bool limited_2g;
b453fda6bad14d drivers/net/wireless/b43/main.c          Rafał Miłecki     2014-07-23  5388  	bool limited_5g;
3695b9324ee9bb drivers/net/wireless/b43/main.c          Rafał Miłecki     2014-07-08  5389  
3695b9324ee9bb drivers/net/wireless/b43/main.c          Rafał Miłecki     2014-07-08  5390  	/* We don't support all 2 GHz channels on some devices */
c11082f0c00acd drivers/net/wireless/b43/main.c          Rafał Miłecki     2014-07-19  5391  	limited_2g = phy->radio_ver == 0x2057 &&
c11082f0c00acd drivers/net/wireless/b43/main.c          Rafał Miłecki     2014-07-19  5392  		     (phy->radio_rev == 9 || phy->radio_rev == 14);
b453fda6bad14d drivers/net/wireless/b43/main.c          Rafał Miłecki     2014-07-23  5393  	limited_5g = phy->radio_ver == 0x2057 &&
b453fda6bad14d drivers/net/wireless/b43/main.c          Rafał Miłecki     2014-07-23  5394  		     phy->radio_rev == 9;
e4d6b7951812d9 drivers/net/wireless/b43/main.c          Michael Buesch    2007-09-18  5395  
bb1eeff12d4cd6 drivers/net/wireless/b43/main.c          Michael Buesch    2008-02-09  5396  	if (have_2ghz_phy)
57fbcce37be7c1 drivers/net/wireless/broadcom/b43/main.c Johannes Berg     2016-04-12  5397  		hw->wiphy->bands[NL80211_BAND_2GHZ] = limited_2g ?
3695b9324ee9bb drivers/net/wireless/b43/main.c          Rafał Miłecki     2014-07-08  5398  			&b43_band_2ghz_limited : &b43_band_2GHz;
bb1eeff12d4cd6 drivers/net/wireless/b43/main.c          Michael Buesch    2008-02-09  5399  	if (dev->phy.type == B43_PHYTYPE_N) {
bb1eeff12d4cd6 drivers/net/wireless/b43/main.c          Michael Buesch    2008-02-09  5400  		if (have_5ghz_phy)
57fbcce37be7c1 drivers/net/wireless/broadcom/b43/main.c Johannes Berg     2016-04-12  5401  			hw->wiphy->bands[NL80211_BAND_5GHZ] = limited_5g ?
b453fda6bad14d drivers/net/wireless/b43/main.c          Rafał Miłecki     2014-07-23  5402  				&b43_band_5GHz_nphy_limited :
b453fda6bad14d drivers/net/wireless/b43/main.c          Rafał Miłecki     2014-07-23  5403  				&b43_band_5GHz_nphy;
bb1eeff12d4cd6 drivers/net/wireless/b43/main.c          Michael Buesch    2008-02-09  5404  	} else {
bb1eeff12d4cd6 drivers/net/wireless/b43/main.c          Michael Buesch    2008-02-09  5405  		if (have_5ghz_phy)
57fbcce37be7c1 drivers/net/wireless/broadcom/b43/main.c Johannes Berg     2016-04-12  5406  			hw->wiphy->bands[NL80211_BAND_5GHZ] = &b43_band_5GHz_aphy;
bb1eeff12d4cd6 drivers/net/wireless/b43/main.c          Michael Buesch    2008-02-09  5407  	}
bb1eeff12d4cd6 drivers/net/wireless/b43/main.c          Michael Buesch    2008-02-09  5408  
2decf2ceb04dae drivers/net/wireless/broadcom/b43/main.c Andreas Wendleder 2026-11-12 @5409  	if (b43_is_ac_core(dev))
2decf2ceb04dae drivers/net/wireless/broadcom/b43/main.c Andreas Wendleder 2026-11-12  5410  		ieee80211_hw_set(hw, AMPDU_AGGREGATION);
2decf2ceb04dae drivers/net/wireless/broadcom/b43/main.c Andreas Wendleder 2026-11-12  5411  
bb1eeff12d4cd6 drivers/net/wireless/b43/main.c          Michael Buesch    2008-02-09  5412  	dev->phy.supports_2ghz = have_2ghz_phy;
bb1eeff12d4cd6 drivers/net/wireless/b43/main.c          Michael Buesch    2008-02-09  5413  	dev->phy.supports_5ghz = have_5ghz_phy;
e4d6b7951812d9 drivers/net/wireless/b43/main.c          Michael Buesch    2007-09-18  5414  
e4d6b7951812d9 drivers/net/wireless/b43/main.c          Michael Buesch    2007-09-18  5415  	return 0;
e4d6b7951812d9 drivers/net/wireless/b43/main.c          Michael Buesch    2007-09-18  5416  }
e4d6b7951812d9 drivers/net/wireless/b43/main.c          Michael Buesch    2007-09-18  5417  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
