Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9FA285CAD
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 08:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774686182; cv=none; b=BG6ejbX5ZAJQF3rJj8cENzyVo924YvVoqiEPp3znDiG0bU8FC4hdMGJClDccKO02CXM7d4DIDXmm+XIhiGrn3iDY2rlPmuIvF41CZ3O0kyen1HNn0d5iwIgxlB3jCfX9J4MY/tXPEHPqUOjdyIGjEABUGpBTgKs9RyubnQxG9uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774686182; c=relaxed/simple;
	bh=g8soto3o7nYDnP5nmL/7k+GgQsxrJZPNxU5+eaFtTks=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lz+lJDAGGMx2dwoTrAi7AbT7ljwgoDOt4wVNDCmxEKMIQf/heikwe0Y9VFh+/fyOVJaQC3lZbRBxeXYbyNuxJD8qOxsBJAqiQ1DziEZ8ij0eXPKYfUjbTyz00DS9+oEoEC8DljnaQANhHpcYexkP0Tts8sD5EYBALp4r3B53Sjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJ7ugrfv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJ7ugrfv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774686180; x=1806222180;
  h=date:from:to:cc:subject:message-id;
  bh=g8soto3o7nYDnP5nmL/7k+GgQsxrJZPNxU5+eaFtTks=;
  b=JJ7ugrfvK3PMBzi2cK+0R6nncRD26BoyJT7l2yv+WVHJ1fHv3C/fKaON
   +bAJjXhW/SaQF4pxf9l6K77Wss2B/OVcY2YWLe6yKQtlST0dAudnKYyC1
   vsWRcX6HyFObmRQyMSLMjCEMvTOhFiXZMuxcIXwwsRlw0vUGp2h60WiDX
   LQxLHtK44w9ZBcV/zeEvg0JnjOLilTT7tdyiIMKKf+FsmC3F8cglTxnPB
   HiBKxcy0akY463AAHKca3XP8svP500RXOw6HL3VvhBjv9RtH5RlZvosC8
   +gTfWpZp9QaahoCCmrGZHZRQFGBZOL7dmaPz0HCHda9ZXOzEjXgkF0q6Q
   w==;
X-CSE-ConnectionGUID: E0S/pVv4SoCytzmKOgJ1yQ==
X-CSE-MsgGUID: CFezHCg6SCKdbaNffnbyKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75719889"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="75719889"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 01:23:00 -0700
X-CSE-ConnectionGUID: BjLD983ORjSS7NOQ0YlOFg==
X-CSE-MsgGUID: UEFsqx3/SAuKnzPSVAQlrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="229598451"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Mar 2026 01:22:59 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6OwZ-00000000BDt-3ThL;
	Sat, 28 Mar 2026 08:22:55 +0000
Date: Sat, 28 Mar 2026 16:22:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6827/10350]
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:476 mt7996_mcu_ie_countdown()
 warn: possible spectre second half.  'cdata.mphy'
Message-ID: <202603281603.mK55mStI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Shayne Chen <shayne.chen@mediatek.com>
CC: Felix Fietkau <nbd@nbd.name>
CC: Peter Chiu <chui-hao.chiu@mediatek.com>
CC: StanleyYP Wang <StanleyYP.Wang@mediatek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3b058d1aeeeff27a7289529c4944291613b364e9
commit: 20743b0b64d91927d1a9346341f3ecdc527c8776 [6827/10350] wifi: mt76: mt7996: extend CSA and CCA support for MLO
:::::: branch date: 10 hours ago
:::::: commit date: 5 days ago
config: riscv-randconfig-r073-20260328 (https://download.01.org/0day-ci/archive/20260328/202603281603.mK55mStI-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603281603.mK55mStI-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:476 mt7996_mcu_ie_countdown() warn: possible spectre second half.  'cdata.mphy'

Old smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:475 mt7996_mcu_ie_countdown() warn: potential spectre issue 'dev->mt76.phys' [r] (local cap)
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:698 mt7996_mcu_rx_thermal_notify() warn: potential spectre issue 'dev->mt76.phys' [r] (local cap)
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:699 mt7996_mcu_rx_thermal_notify() warn: possible spectre second half.  'mphy'
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:766 mt7996_mcu_wed_rro_event() warn: potential spectre issue 'wcid->aggr' [r] (local cap)
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:2757 mt7996_mcu_beacon_mbss() warn: potential spectre issue 'sub_elem->data' [r] (local cap)
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:2749 mt7996_mcu_beacon_mbss() warn: potential spectre issue 'elem->data' [r] (local cap)

vim +476 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c

20743b0b64d919 Shayne Chen 2025-12-15  455  
20743b0b64d919 Shayne Chen 2025-12-15  456  static void
20743b0b64d919 Shayne Chen 2025-12-15  457  mt7996_mcu_ie_countdown(struct mt7996_dev *dev, struct sk_buff *skb)
20743b0b64d919 Shayne Chen 2025-12-15  458  {
20743b0b64d919 Shayne Chen 2025-12-15  459  #define UNI_EVENT_IE_COUNTDOWN_CSA 0
20743b0b64d919 Shayne Chen 2025-12-15  460  #define UNI_EVENT_IE_COUNTDOWN_BCC 1
20743b0b64d919 Shayne Chen 2025-12-15  461  	struct header {
20743b0b64d919 Shayne Chen 2025-12-15  462  		u8 band;
20743b0b64d919 Shayne Chen 2025-12-15  463  		u8 rsv[3];
20743b0b64d919 Shayne Chen 2025-12-15  464  	};
20743b0b64d919 Shayne Chen 2025-12-15  465  	struct mt7996_mcu_rxd *rxd = (struct mt7996_mcu_rxd *)skb->data;
20743b0b64d919 Shayne Chen 2025-12-15  466  	const char *data = (char *)&rxd[1], *tail;
20743b0b64d919 Shayne Chen 2025-12-15  467  	struct header *hdr = (struct header *)data;
20743b0b64d919 Shayne Chen 2025-12-15  468  	struct tlv *tlv = (struct tlv *)(data + 4);
20743b0b64d919 Shayne Chen 2025-12-15  469  	struct mt7996_mcu_countdown_notify *event;
20743b0b64d919 Shayne Chen 2025-12-15  470  	struct mt7996_mcu_countdown_data cdata;
20743b0b64d919 Shayne Chen 2025-12-15  471  
20743b0b64d919 Shayne Chen 2025-12-15  472  	if (hdr->band >= ARRAY_SIZE(dev->mt76.phys))
20743b0b64d919 Shayne Chen 2025-12-15  473  		return;
20743b0b64d919 Shayne Chen 2025-12-15  474  
20743b0b64d919 Shayne Chen 2025-12-15  475  	cdata.mphy = dev->mt76.phys[hdr->band];
20743b0b64d919 Shayne Chen 2025-12-15 @476  	if (!cdata.mphy)
8234324ae90948 Peter Chiu  2023-08-31  477  		return;
8234324ae90948 Peter Chiu  2023-08-31  478  
20743b0b64d919 Shayne Chen 2025-12-15  479  	tail = skb->data + skb->len;
20743b0b64d919 Shayne Chen 2025-12-15  480  	data += sizeof(*hdr);
20743b0b64d919 Shayne Chen 2025-12-15  481  	while (data + sizeof(*tlv) < tail && le16_to_cpu(tlv->len)) {
20743b0b64d919 Shayne Chen 2025-12-15  482  		event = (struct mt7996_mcu_countdown_notify *)tlv->data;
20743b0b64d919 Shayne Chen 2025-12-15  483  
20743b0b64d919 Shayne Chen 2025-12-15  484  		cdata.omac_idx = event->omac_idx;
20743b0b64d919 Shayne Chen 2025-12-15  485  
20743b0b64d919 Shayne Chen 2025-12-15  486  		switch (le16_to_cpu(tlv->tag)) {
20743b0b64d919 Shayne Chen 2025-12-15  487  		case UNI_EVENT_IE_COUNTDOWN_CSA:
20743b0b64d919 Shayne Chen 2025-12-15  488  			ieee80211_iterate_active_interfaces_atomic(mt76_hw(dev),
20743b0b64d919 Shayne Chen 2025-12-15  489  					IEEE80211_IFACE_ITER_RESUME_ALL,
20743b0b64d919 Shayne Chen 2025-12-15  490  					mt7996_mcu_csa_finish, &cdata);
20743b0b64d919 Shayne Chen 2025-12-15  491  			break;
20743b0b64d919 Shayne Chen 2025-12-15  492  		case UNI_EVENT_IE_COUNTDOWN_BCC:
20743b0b64d919 Shayne Chen 2025-12-15  493  			ieee80211_iterate_active_interfaces_atomic(mt76_hw(dev),
20743b0b64d919 Shayne Chen 2025-12-15  494  					IEEE80211_IFACE_ITER_RESUME_ALL,
20743b0b64d919 Shayne Chen 2025-12-15  495  					mt7996_mcu_cca_finish, &cdata);
20743b0b64d919 Shayne Chen 2025-12-15  496  			break;
20743b0b64d919 Shayne Chen 2025-12-15  497  		default:
20743b0b64d919 Shayne Chen 2025-12-15  498  			break;
20743b0b64d919 Shayne Chen 2025-12-15  499  		}
20743b0b64d919 Shayne Chen 2025-12-15  500  
20743b0b64d919 Shayne Chen 2025-12-15  501  		data += le16_to_cpu(tlv->len);
20743b0b64d919 Shayne Chen 2025-12-15  502  		tlv = (struct tlv *)data;
20743b0b64d919 Shayne Chen 2025-12-15  503  	}
98686cd21624c7 Shayne Chen 2022-11-22  504  }
98686cd21624c7 Shayne Chen 2022-11-22  505  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
