Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176A0139CFF
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Nov 2024 23:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730764556; cv=none; b=AxHPbvR0OjdTmwTNt38SrFKlAnIa8jiwb576/aDx3k3neJ6eI6wnWatbO9AVuHJB03noRbG9+b52mDyLGy4pEZuru6yxfAvu0fOqipzJWdWyCw9nfcG7ukF1yYLyeo7duB/iUh2dowFzdaMrK1Nyr+4f9tvIRCJzVD9tbQj/Xmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730764556; c=relaxed/simple;
	bh=RWiUYvzkHdvBWYjm6xv4fdfcBmYxvsKns1mi4jMSp74=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FqdMdF1DwJ/+6yxqqro4WNBpXl8OQjekibpujUTBDsOi8WYXx6SicRskeRve2WrMAi8XwUPL2ZTaYTnF2pGuOLzQf8f8xT6ac0jGFvMOTlSMqJawBZtlWgJSgkMa02SzXeBQH8QcZjVXYdJkFOKboTzdcScoFPG6xdJ80OQKePM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dc13oAJq; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dc13oAJq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730764554; x=1762300554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RWiUYvzkHdvBWYjm6xv4fdfcBmYxvsKns1mi4jMSp74=;
  b=Dc13oAJqflxpWWaLLOSMx5Q4iwroUHJO8V3zzw3BV1ySPqyodl/rfsRP
   j9Vb9O7CJ7xQMPorjKsN1rkOtRsBfHLcdpnLFGZO55dynxG/YWcjLG/6k
   mVCaU6dFGvMbkNgi5UpY96Of0VcNZ/A1xH/LxmovF6niHcmQjQamZ2B3c
   uxcpAI71ucUDbPh2eqGsBziZTpYI5NQ9T5juwihB96KlkY6pGudELEX33
   NxsAE5oehYgo9QwAL1bF5S4m8O1z4ndSPqMLuH3RwU1Hjd72W0xExdip7
   fhggE3vmSDc6Z9iax6LcuV694EsdM65V/2WeRTsl0FME1jbRvIw+y+HYm
   w==;
X-CSE-ConnectionGUID: 9Q49BvL2TYe9eNvi2o2yiQ==
X-CSE-MsgGUID: 65o9zYeEQoiimsptEON6JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41072122"
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="41072122"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 15:55:53 -0800
X-CSE-ConnectionGUID: Gi2QoPFlT6S/6t+laKXcLg==
X-CSE-MsgGUID: mFfkwqyYTMGzZeskr7wgjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="88379774"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Nov 2024 15:55:52 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t86vF-000lPk-2X;
	Mon, 04 Nov 2024 23:55:49 +0000
Date: Tue, 5 Nov 2024 07:54:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:520
 mt7996_mcu_rx_thermal_notify() warn: potential spectre issue
 'dev->mt76.phys' [r] (local cap)
Message-ID: <202411050743.JuIBGjfQ-lkp@intel.com>
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
head:   557329bcecc2f55e134db8974953b32b69db9d15
commit: 21f290884bc1c911aa9a0875c1d9a1e6fb9e0308 wifi: mt76: connac: add thermal protection support for mt7996
date:   11 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 11 months ago
config: sh-randconfig-r073-20241104 (https://download.01.org/0day-ci/archive/20241105/202411050743.JuIBGjfQ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411050743.JuIBGjfQ-lkp@intel.com/

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

adde3eed4a75fe Yi-Chia Hsieh 2023-09-21  499  
21f290884bc1c9 Howard Hsu    2023-10-23  500  static void
21f290884bc1c9 Howard Hsu    2023-10-23  501  mt7996_mcu_rx_thermal_notify(struct mt7996_dev *dev, struct sk_buff *skb)
21f290884bc1c9 Howard Hsu    2023-10-23  502  {
21f290884bc1c9 Howard Hsu    2023-10-23  503  #define THERMAL_NOTIFY_TAG 0x4
21f290884bc1c9 Howard Hsu    2023-10-23  504  #define THERMAL_NOTIFY 0x2
21f290884bc1c9 Howard Hsu    2023-10-23  505  	struct mt76_phy *mphy = &dev->mt76.phy;
21f290884bc1c9 Howard Hsu    2023-10-23  506  	struct mt7996_mcu_thermal_notify *n;
21f290884bc1c9 Howard Hsu    2023-10-23  507  	struct mt7996_phy *phy;
21f290884bc1c9 Howard Hsu    2023-10-23  508  
21f290884bc1c9 Howard Hsu    2023-10-23  509  	n = (struct mt7996_mcu_thermal_notify *)skb->data;
21f290884bc1c9 Howard Hsu    2023-10-23  510  
21f290884bc1c9 Howard Hsu    2023-10-23  511  	if (le16_to_cpu(n->tag) != THERMAL_NOTIFY_TAG)
21f290884bc1c9 Howard Hsu    2023-10-23  512  		return;
21f290884bc1c9 Howard Hsu    2023-10-23  513  
21f290884bc1c9 Howard Hsu    2023-10-23  514  	if (n->event_id != THERMAL_NOTIFY)
21f290884bc1c9 Howard Hsu    2023-10-23  515  		return;
21f290884bc1c9 Howard Hsu    2023-10-23  516  
21f290884bc1c9 Howard Hsu    2023-10-23  517  	if (n->band_idx > MT_BAND2)
21f290884bc1c9 Howard Hsu    2023-10-23  518  		return;
21f290884bc1c9 Howard Hsu    2023-10-23  519  
21f290884bc1c9 Howard Hsu    2023-10-23 @520  	mphy = dev->mt76.phys[n->band_idx];
21f290884bc1c9 Howard Hsu    2023-10-23 @521  	if (!mphy)
21f290884bc1c9 Howard Hsu    2023-10-23  522  		return;
21f290884bc1c9 Howard Hsu    2023-10-23  523  
21f290884bc1c9 Howard Hsu    2023-10-23  524  	phy = (struct mt7996_phy *)mphy->priv;
21f290884bc1c9 Howard Hsu    2023-10-23  525  	phy->throttle_state = n->duty_percent;
21f290884bc1c9 Howard Hsu    2023-10-23  526  }
21f290884bc1c9 Howard Hsu    2023-10-23  527  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
