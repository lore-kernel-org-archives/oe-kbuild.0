Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214ECC8FD
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jan 2024 06:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705906245; cv=none; b=pG46wIgD7xd7XPkL32fv72c8hJoSb8RmNtgnCGCOa5LygZos2gSktUjO9QLSJKx/6bRToeuAQXNHrWIZK7V/c7hKppFZBfiN1/PsG9OQeuHJCGjQGxWpEqKcZ8MSB0QJ6LzUUnCbjpewDV9q9Nw6vkiy1fbO+wF93vMzp0K7EMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705906245; c=relaxed/simple;
	bh=OPNKS2oIE4L8KR4WT707Ci/fL5vH9yLj5Y7t3G4GWog=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=okq+xD0uI+rfppUIX9R79FbQdl8u8BCwNOpDwiSQlH41FXBJ3H9TadACrcgd5T7bEtsAATvC2LOol2C8UK7Eu2LUkPgZMQHh2YxHzH9UQP9MeQQyzoV2u80kaREute9xjUodd1x3e8SbsG7uG5Guegi7GzopTbmBCizeEL59DDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kWKkqnjR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kWKkqnjR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705906243; x=1737442243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OPNKS2oIE4L8KR4WT707Ci/fL5vH9yLj5Y7t3G4GWog=;
  b=kWKkqnjRrcOPIlhPk0gdcLxApUUX6yDxbnXGMBBqW233MUL5BEW9qqdk
   zTCTlbgNVpIcqa8juHg4rg8Oe6a2k2EzUU+gMaTa5/Qi5rw0ZTndiibAI
   dD3oUrwzhjTEQisHPylMBUlBlCSC+EVKz53O1y4YSZHO+ztwsWoKx8BCO
   8IKf0vguTXsNqsbSB4qpIc30NhT/YO1ZatxffTrjN8r+nrm5SMiGdiDDT
   ch/WoHElBA5n/e8Nz0y1quJHrfGaLQQ4uogXQtlTy8j7fimAKXIFFKLaX
   zvNPbnHVvzEyWjpeih80xgHy5eUWu0DiHExsImkWCYfsueEeovJu+hgF4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="1007458"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="1007458"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 22:50:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="904748167"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="904748167"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Jan 2024 22:50:41 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRo8k-0006Sq-2T;
	Mon, 22 Jan 2024 06:50:38 +0000
Date: Mon, 22 Jan 2024 14:50:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:520
 mt7996_mcu_rx_thermal_notify() warn: potential spectre issue
 'dev->mt76.phys' [r] (local cap)
Message-ID: <202401221402.HTdN0wtQ-lkp@intel.com>
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
head:   6613476e225e090cc9aad49be7fa504e290dd33d
commit: 21f290884bc1c911aa9a0875c1d9a1e6fb9e0308 wifi: mt76: connac: add thermal protection support for mt7996
date:   7 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-161-20240120 (https://download.01.org/0day-ci/archive/20240122/202401221402.HTdN0wtQ-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401221402.HTdN0wtQ-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:520 mt7996_mcu_rx_thermal_notify() warn: potential spectre issue 'dev->mt76.phys' [r] (local cap)
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:521 mt7996_mcu_rx_thermal_notify() warn: possible spectre second half.  'mphy'

Old smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:347 mt7996_mcu_rx_radar_detected() warn: potential spectre issue 'dev->mt76.phys' [r] (local cap)
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:349 mt7996_mcu_rx_radar_detected() warn: possible spectre second half.  'mphy'
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:429 mt7996_mcu_ie_countdown() warn: potential spectre issue 'dev->mt76.phys' [r] (local cap)
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:436 mt7996_mcu_ie_countdown() warn: possible spectre second half.  'mphy'
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:441 mt7996_mcu_ie_countdown() warn: possible spectre second half.  'mphy'
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:584 mt7996_mcu_wed_rro_event() warn: potential spectre issue 'dev->mt76.wcid' [w] (local cap)
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:591 mt7996_mcu_wed_rro_event() warn: potential spectre issue 'wcid->aggr' [w] (local cap)
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
