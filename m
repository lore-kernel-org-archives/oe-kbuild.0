Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057191A9B4D
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Dec 2024 23:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734735750; cv=none; b=ewZRhwDJAFTTWbG/Og/2yr5NU+qOxhFQYJSO/D67tpm+wIRql3HqYSLQdNcrVMgalwtCrk9phdtAcFI0ZgfdlRJUH6rV5oyza4ClIcFaKEHn3Gco0meLsJSCdyF4qLDgy2kxy7AAQPVUCN22jVRBjiIZitrB5+Aysee7sJyHefs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734735750; c=relaxed/simple;
	bh=qQgh5UhEXtnqXSky3drP/VkqdsNQ3JC3xT6Vp+Hvbt4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MLd2ZFWOSV2FMc5uPGSsz2IzjEaajFEHA4X82vWVTFGGitI9pA20yS36ijnZf+78lqE/IT/azG84YpNe9ry3s8FScUHYzV3TT+IVXs+KPwM6EqsLh19oGS3jx+sWPwsFHT9G6E2MmB4UkafoRNAJpCoEDxQJHATqx+cRSP1XZZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OLqDReH+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OLqDReH+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734735747; x=1766271747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qQgh5UhEXtnqXSky3drP/VkqdsNQ3JC3xT6Vp+Hvbt4=;
  b=OLqDReH+5M+dnNvD0qfWXibgj0uFABHP+XxPQTUIfusyfg35g2tKeFBG
   RS7Rd9JOj3pbp6aLGcmtK4+ItzuJQqj6SIkUdOcKBMm0GEGjwTS6p+/2e
   uqPwtcCJ0Be3yORBXsFO0DEKlNC8pTdxkDn4et2j8PEcCLhaIV3sFt5FW
   vaAZiTuIDiFRRaVyTwKEX8GM/dRPpDBoszfFVlwucAnZiFEGyfq8mdp+G
   4xKwTgoN5rUno4FZ9A7bzklBXgRxfpvDnqvtlOTLuVFFYGY2ICYSvP5y9
   CHIfW3+8tX9sx6HZI7kV/1hWOuDlEwYTrWzJ0j9JRgxaTOZPxggx4JG9Z
   A==;
X-CSE-ConnectionGUID: CHaZmirbT+awLZIzs6nqMg==
X-CSE-MsgGUID: FEogAMW6TcKDH03dEI+nJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35007758"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="35007758"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 15:02:27 -0800
X-CSE-ConnectionGUID: sQruJSGmSTutNo3EtlDW3w==
X-CSE-MsgGUID: vcThJn2hTJWY4rrXQzXlPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102745713"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Dec 2024 15:02:25 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOm0l-0001iz-01;
	Fri, 20 Dec 2024 23:02:23 +0000
Date: Sat, 21 Dec 2024 07:01:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:520
 mt7996_mcu_rx_thermal_notify() warn: potential spectre issue
 'dev->mt76.phys' [r] (local cap)
Message-ID: <202412210602.eFKbEQFt-lkp@intel.com>
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
TO: Howard Hsu <howard-yh.hsu@mediatek.com>
CC: Felix Fietkau <nbd@nbd.name>
CC: Shayne Chen <shayne.chen@mediatek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e9b8ffafd20ad21357a789cc58ffaa162b3ad074
commit: 21f290884bc1c911aa9a0875c1d9a1e6fb9e0308 wifi: mt76: connac: add thermal protection support for mt7996
date:   1 year ago
:::::: branch date: 4 hours ago
:::::: commit date: 1 year ago
config: x86_64-randconfig-161-20241215 (https://download.01.org/0day-ci/archive/20241221/202412210602.eFKbEQFt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412210602.eFKbEQFt-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:520 mt7996_mcu_rx_thermal_notify() warn: potential spectre issue 'dev->mt76.phys' [r] (local cap)
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:521 mt7996_mcu_rx_thermal_notify() warn: possible spectre second half.  'mphy'

Old smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:347 mt7996_mcu_rx_radar_detected() warn: potential spectre issue 'dev->mt76.phys' [r] (local cap)
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:349 mt7996_mcu_rx_radar_detected() warn: possible spectre second half.  'mphy'
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:429 mt7996_mcu_ie_countdown() warn: potential spectre issue 'dev->mt76.phys' [r] (local cap)
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:436 mt7996_mcu_ie_countdown() warn: possible spectre second half.  'mphy'
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:441 mt7996_mcu_ie_countdown() warn: possible spectre second half.  'mphy'
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:584 mt7996_mcu_wed_rro_event() warn: potential spectre issue 'dev->mt76.wcid' [r] (local cap)
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:591 mt7996_mcu_wed_rro_event() warn: potential spectre issue 'wcid->aggr' [r] (local cap)
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:2331 mt7996_mcu_beacon_mbss() warn: potential spectre issue 'sub_elem->data' [r] (local cap)
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:2323 mt7996_mcu_beacon_mbss() warn: potential spectre issue 'elem->data' [r] (local cap)

vim +520 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c

adde3eed4a75fe3 Yi-Chia Hsieh 2023-09-21  499  
21f290884bc1c91 Howard Hsu    2023-10-23  500  static void
21f290884bc1c91 Howard Hsu    2023-10-23  501  mt7996_mcu_rx_thermal_notify(struct mt7996_dev *dev, struct sk_buff *skb)
21f290884bc1c91 Howard Hsu    2023-10-23  502  {
21f290884bc1c91 Howard Hsu    2023-10-23  503  #define THERMAL_NOTIFY_TAG 0x4
21f290884bc1c91 Howard Hsu    2023-10-23  504  #define THERMAL_NOTIFY 0x2
21f290884bc1c91 Howard Hsu    2023-10-23  505  	struct mt76_phy *mphy = &dev->mt76.phy;
21f290884bc1c91 Howard Hsu    2023-10-23  506  	struct mt7996_mcu_thermal_notify *n;
21f290884bc1c91 Howard Hsu    2023-10-23  507  	struct mt7996_phy *phy;
21f290884bc1c91 Howard Hsu    2023-10-23  508  
21f290884bc1c91 Howard Hsu    2023-10-23  509  	n = (struct mt7996_mcu_thermal_notify *)skb->data;
21f290884bc1c91 Howard Hsu    2023-10-23  510  
21f290884bc1c91 Howard Hsu    2023-10-23  511  	if (le16_to_cpu(n->tag) != THERMAL_NOTIFY_TAG)
21f290884bc1c91 Howard Hsu    2023-10-23  512  		return;
21f290884bc1c91 Howard Hsu    2023-10-23  513  
21f290884bc1c91 Howard Hsu    2023-10-23  514  	if (n->event_id != THERMAL_NOTIFY)
21f290884bc1c91 Howard Hsu    2023-10-23  515  		return;
21f290884bc1c91 Howard Hsu    2023-10-23  516  
21f290884bc1c91 Howard Hsu    2023-10-23  517  	if (n->band_idx > MT_BAND2)
21f290884bc1c91 Howard Hsu    2023-10-23  518  		return;
21f290884bc1c91 Howard Hsu    2023-10-23  519  
21f290884bc1c91 Howard Hsu    2023-10-23 @520  	mphy = dev->mt76.phys[n->band_idx];
21f290884bc1c91 Howard Hsu    2023-10-23 @521  	if (!mphy)
21f290884bc1c91 Howard Hsu    2023-10-23  522  		return;
21f290884bc1c91 Howard Hsu    2023-10-23  523  
21f290884bc1c91 Howard Hsu    2023-10-23  524  	phy = (struct mt7996_phy *)mphy->priv;
21f290884bc1c91 Howard Hsu    2023-10-23  525  	phy->throttle_state = n->duty_percent;
21f290884bc1c91 Howard Hsu    2023-10-23  526  }
21f290884bc1c91 Howard Hsu    2023-10-23  527  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
