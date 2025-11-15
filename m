Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C4B42A96
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Nov 2025 07:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763192798; cv=none; b=XV/W9LYRbL5UZugsW2ZXS79dBDxa87yAhqyVYFfhN+KEDYrBQJ1ojhx3XjvambZk7I30wMLcEKt5wdH+thRVQcf0fWg3wJsIt3pQc0o9Fd45scBunlXO0HlcJJT5EbZV4r6W+wfdtCOgLvAl0dTwVHwO52Do3EMU4McFpGSQubA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763192798; c=relaxed/simple;
	bh=9VFLRqLSOubPReh7Jze1lgXkQMo4lkMqvdKxlUqFU7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=itnvsAOGfwZp/fRZYpeTUGuIWrUG5tADkmgMEegz5tTpVgk30fo5OqkePKeYPYD/sV77hHyvf8Xe/0M1MSuU6ZH3yNC0ARba5PRE34+PhNVPONLZEvl0dwshKk3Cq1K+vjVjqmVVKLTnvsnO9MxuONS3rjQiaE9FcJ4oJ76tom4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eo2Rwz8j; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eo2Rwz8j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763192796; x=1794728796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9VFLRqLSOubPReh7Jze1lgXkQMo4lkMqvdKxlUqFU7U=;
  b=Eo2Rwz8jV0TZKO6neAFerlOImRt3stdOoR3lhx6/BwBqxObFWKdnim6K
   1+eDjZnelzfvXGEqFio6/zZrqFe7CnFn7zBLtEQjlIbVIfyK3ySSVzuds
   M2NIvV51npbDsCfseoGiwerr6rhKVph3rez0+DYdOfit+PuofF+CKm7VV
   kfJgiI1Oqmjk8IBBRMZ4qFyeQuStmCVzjz4TmU36anEybpHrTyyaXOFDB
   c/Vs1M3zv1OWZtGXZdsnnGL/ZewqnNhgUGmeFLULm88qd6/+XqrIZQYmE
   XIjuMe3Z3fN8WTAhVQ8I38Xj6ztRX7KDbPtEGIIEs0KfJRRMIC1LhkgKf
   A==;
X-CSE-ConnectionGUID: uzhV5akyRMytA6palULl1g==
X-CSE-MsgGUID: 82AB3IU8T82iuvnk4oLH8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65162323"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="65162323"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 23:46:35 -0800
X-CSE-ConnectionGUID: eq/d7LnhSo6ZyFaoeicviQ==
X-CSE-MsgGUID: tNMqfdhfTkWMK1NbbHGw4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="195127326"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Nov 2025 23:46:34 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKAzQ-0007nD-0l;
	Sat, 15 Nov 2025 07:46:32 +0000
Date: Sat, 15 Nov 2025 15:45:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [frank-w-bpi-r2-4.14:6.18-rc_new 42/108]
 drivers/net/phy/as21xxx.c:1176 aeon_c45_an_config_aneg() error:
 uninitialized symbol 'changed'.
Message-ID: <202511151513.Hnqzn6wc-lkp@intel.com>
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
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-rc_new
head:   eb43ba8536a5d22d51b0f384a239728b30ede362
commit: d16e92f56bf7e04bc87f39d34d70b47969767b11 [42/108] net: phy: as21: try the driver from mtk-sdk
:::::: branch date: 4 days ago
:::::: commit date: 6 days ago
config: nios2-randconfig-r071-20251114 (https://download.01.org/0day-ci/archive/20251115/202511151513.Hnqzn6wc-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511151513.Hnqzn6wc-lkp@intel.com/

New smatch warnings:
drivers/net/phy/as21xxx.c:1176 aeon_c45_an_config_aneg() error: uninitialized symbol 'changed'.

Old smatch warnings:
drivers/net/phy/as21xxx.c:549 aeon_ipc_send_cmd() warn: unsigned 'val' is never less than zero.
drivers/net/phy/as21xxx.c:557 aeon_ipc_send_cmd() warn: unsigned 'val' is never less than zero.

vim +/changed +1176 drivers/net/phy/as21xxx.c

830877d89edcd83 Christian Marangi 2025-05-17  1148  
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1149  static int aeon_c45_an_config_aneg(struct phy_device *phydev)
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1150  {
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1151  	int changed, ret;
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1152  	u32 adv;
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1153  	linkmode_and(phydev->advertising, phydev->advertising,
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1154  		     phydev->supported);
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1155  	//changed = genphy_config_eee_advert(phydev);
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1156  	adv = linkmode_adv_to_mii_adv_t(phydev->advertising);
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1157  	ret = phy_modify_mmd(phydev, MDIO_MMD_AN, MDIO_AN_ADVERTISE,
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1158  				  ADVERTISE_ALL | ADVERTISE_100BASE4 |
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1159  					  ADVERTISE_PAUSE_CAP |
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1160  					  ADVERTISE_PAUSE_ASYM,
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1161  				  adv);
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1162  	if (ret < 0)
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1163  		return ret;
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1164  	if (ret > 0)
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1165  		changed = 1;
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1166  	adv = linkmode_adv_to_mii_10gbt_adv_t(phydev->advertising);
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1167  	ret = phy_modify_mmd(phydev, MDIO_MMD_AN, MDIO_AN_10GBT_CTRL,
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1168  				  MDIO_AN_10GBT_CTRL_ADV10G |
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1169  					  MDIO_AN_10GBT_CTRL_ADV5G |
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1170  					  MDIO_AN_10GBT_CTRL_ADV2_5G,
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1171  				  adv);
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1172  	if (ret < 0)
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1173  		return ret;
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1174  	if (ret > 0)
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1175  		changed = 1;
d16e92f56bf7e04 Frank Wunderlich  2025-10-11 @1176  	return changed;
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1177  }
830877d89edcd83 Christian Marangi 2025-05-17  1178  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
