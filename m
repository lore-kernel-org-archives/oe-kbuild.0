Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473E518CC08
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Dec 2024 14:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734878174; cv=none; b=F+Jbyrf6cy3c2SAdvlySL8bFKZ2yXGGZb7OHpeGnod0mwiCtA5BOrDMEsGH8hLVUame4i9TZJdDXUeVfy80LFkzPHYF1cgZB7PxT5M6eXlYgpdm3q8JT+ksnHytj6u4Z8TypV8Y7FM2VQ0+4j4LfTy1i8NnGGoNo7kLiiNIfpgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734878174; c=relaxed/simple;
	bh=anGVPjQ+wAVeCWlUMQtN2xxZI2bMuXlKRjF6YzjEIYI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NPUvznmyePnJ/XyrNHHw7ahcYiMUs9VEPYWXlUvV6Xf3RkqMPzbRsJNL2d2NJmkrtbVfQTUqYKOO1JJ8WY9jmSE3lQqKPwLJtIeJgLQjhjG7RtvkqZBdQY5n2v/5jW7eWKYGk0U6N9HROf6XKFdzSaBjTZ4LDOHnzHe0wCy7r70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CACyavVJ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CACyavVJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734878173; x=1766414173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=anGVPjQ+wAVeCWlUMQtN2xxZI2bMuXlKRjF6YzjEIYI=;
  b=CACyavVJQgYxJq4dC0Xx9DjA61ptq16x0jgNXY7oLZyEcI+GDdZosLD9
   WpqKuLZDaefnsQUS5r4mNFqMxvh3n3VRQijLZYEO7i/a0QpTYVYJtFOwL
   zynurgt9BMW6Oic/9rOFjbExxuAWJGenXk7x11YPaBv6wh9ZQmrHl29JZ
   hsgjzzuoxI+3vsYIaWDk8PvDziIdqrcRKG+dYLhTpIm7JbIP/AJWKDK9K
   UlJTDe8YFG2qDHnNvZ8SA96HQ/9fuqB35u8E8b1paBxyg9/NtLQbbrPcp
   gKKuLHEETygjG5kDOHIZtsvjRK54QuIXdQh/L8llbk9SmxfH9A9kOsHEY
   Q==;
X-CSE-ConnectionGUID: ekw3QP3LTliMOYIOi/piww==
X-CSE-MsgGUID: pMAF66FDRC2uqCCuUJ5KoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="39043619"
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="39043619"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 06:36:12 -0800
X-CSE-ConnectionGUID: rVQGohoQQlS4GYwHjvWMWQ==
X-CSE-MsgGUID: qg3TQXpdTgO91zBQFHilcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="99042816"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Dec 2024 06:36:10 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPN3w-00030N-14;
	Sun, 22 Dec 2024 14:36:08 +0000
Date: Sun, 22 Dec 2024 22:35:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:520
 mt7996_mcu_rx_thermal_notify() warn: potential spectre issue
 'dev->mt76.phys' [r] (local cap)
Message-ID: <202412222222.ukBztDet-lkp@intel.com>
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
head:   48f506ad0b683d3e7e794efa60c5785c4fdc86fa
commit: 21f290884bc1c911aa9a0875c1d9a1e6fb9e0308 wifi: mt76: connac: add thermal protection support for mt7996
date:   1 year, 1 month ago
:::::: branch date: 15 hours ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-randconfig-161-20241215 (https://download.01.org/0day-ci/archive/20241222/202412222222.ukBztDet-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412222222.ukBztDet-lkp@intel.com/

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
