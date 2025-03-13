Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117C5259C
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Mar 2025 11:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741865852; cv=none; b=I3bI9Y0zmJfDBelxIgx2DnvU55aqPrrhD/gspwjBisFTiUNg/rqk2LsoOUsfCsIP4WvfJS5jBy5UZJCGWCHJeMIIZZmpH1Jayvh6n9j1xLZmHt6nkC/z8RJJVXTKyTuI7veRHIyRLLPbi0vXAFYGkiKxiXJ4fptm59i/jzmcp90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741865852; c=relaxed/simple;
	bh=BMaTkcNzgydjEATuUvEvoetUQcEwkF7SD5Lxqvy8dWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dqtcp68S+OV/F6WxsJI1QcwW0qQV6vuRuBO4rPisnRJZ+600hVKAeEaoT2/qBG37sfAIuiRPw/rkXiy7WVMHCwkL0673fQ4E5lzmOHVbbFQNTKLUjUTKxjNznnMMk1xYuAzD276zhFQFbw2rQ/zIyb3RyEsk9WM9y4QWuW6QWw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bsx7VQ5B; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bsx7VQ5B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741865850; x=1773401850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BMaTkcNzgydjEATuUvEvoetUQcEwkF7SD5Lxqvy8dWI=;
  b=Bsx7VQ5Bl0G2RkkHqXSzeemvdQMmNT35YMFes+T6YK0+KB/87VUdHNIO
   u1qJEckLFTagUYPLYjnKBwkNco4kPvs12bmfMdw5SGquPlKEIyyoY+rKt
   OQNUbklt1IYmrlRaIWkmOY+meParws7vZqXKXHa6cis4RqovR+tQ0X46R
   HjJAm+utWkawHKVcMzSgtFIMhkQgCVJDiqf/azSipsuLkidhzyN2pxWV6
   NXVEku8u0DinY2hJoeOv1xjgX5NeDMYsQ6SuL1MHqybBFYdBcsTByOonm
   1nTGoq5xsyORj6NU70qRxBIHILDMrW4oPFmGd7HMeixN3vz/4mH1W8Y5i
   Q==;
X-CSE-ConnectionGUID: RVPuTIdcQlaHdXnjs/vzxQ==
X-CSE-MsgGUID: zOPlFTp+Sfyf4WPOvWTS/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="65434668"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="65434668"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 04:37:29 -0700
X-CSE-ConnectionGUID: emPn3EOgSY+h870Q3iTyWQ==
X-CSE-MsgGUID: 5NBGMhtsRdaAZXen2K5zHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="151770615"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 13 Mar 2025 04:37:28 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsgsP-0009M8-2p;
	Thu, 13 Mar 2025 11:37:25 +0000
Date: Thu, 13 Mar 2025 19:37:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 2813/2813]
 drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1248
 ngbe_phy_get_advertised_pause() error: uninitialized symbol 'value'.
Message-ID: <202503131911.zfoTxnvn-lkp@intel.com>
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
TO: kernel@openeuler.org

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c2f6be994ae124fea938cd77272722cffb1a3c26
commit: a5961b4bc6ce09a70902686ecc848a47493a9251 [2813/2813] openeuler: net: ngbe: add ngbe module support
:::::: branch date: 9 hours ago
:::::: commit date: 2 years, 3 months ago
config: x86_64-randconfig-161-20250313 (https://download.01.org/0day-ci/archive/20250313/202503131911.zfoTxnvn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503131911.zfoTxnvn-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1248 ngbe_phy_get_advertised_pause() error: uninitialized symbol 'value'.
drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1260 ngbe_phy_get_advertised_pause_m88e1512() error: uninitialized symbol 'value'.
drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1287 ngbe_phy_get_lp_advertised_pause() error: uninitialized symbol 'value'.
drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1291 ngbe_phy_get_lp_advertised_pause() warn: mask and shift to zero: expr='value >> 10'
drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1304 ngbe_phy_get_lp_advertised_pause_m88e1512() error: uninitialized symbol 'value'.
drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:1222 ngbe_fc_autoneg() error: uninitialized symbol 'link_up'.
drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4324 ngbe_write_ee_hostif32() warn: inconsistent indenting
drivers/net/ethernet/netswift/ngbe/ngbe_ethtool.c:1245 ngbe_link_test() error: uninitialized symbol 'link_up'.
drivers/net/ethernet/netswift/ngbe/ngbe_ethtool.c:1905 ngbe_diag_test() warn: inconsistent indenting
drivers/net/ethernet/netswift/ngbe/ngbe_main.c:1850 ngbe_request_msix_irqs() warn: 'entry->vector' from request_irq() not released on lines: 1850.
drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3931 ngbe_setup_all_rx_resources() warn: inconsistent indenting
drivers/net/ethernet/netswift/ngbe/ngbe_main.c:5084 ngbe_reset_subtask() warn: inconsistent indenting

Old smatch warnings:
drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1264 ngbe_phy_get_advertised_pause_m88e1512() error: uninitialized symbol 'value'.
drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1308 ngbe_phy_get_lp_advertised_pause_m88e1512() error: uninitialized symbol 'value'.
drivers/net/ethernet/netswift/ngbe/ngbe_main.c:5313 ngbe_tso() warn: inconsistent indenting

vim +/value +1248 drivers/net/ethernet/netswift/ngbe/ngbe_phy.c

a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1241  
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1242  s32 ngbe_phy_get_advertised_pause(struct ngbe_hw *hw, u8 *pause_bit)
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1243  {
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1244  	u16 value;
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1245  	s32 status = 0;
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1246  
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1247  	status = TCALL(hw, phy.ops.read_reg, 4, 0, &value);
a5961b4bc6ce09a Duanqiang Wen 2022-12-01 @1248  	*pause_bit = (u8)((value >> 10) & 0x3);
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1249  	return status;
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1250  }
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1251  
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1252  s32 ngbe_phy_get_advertised_pause_m88e1512(struct ngbe_hw *hw, u8 *pause_bit)
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1253  {
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1254  	u16 value;
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1255  	s32 status = 0;
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1256  
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1257  	if (hw->phy.type == ngbe_phy_m88e1512) {
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1258  		status = TCALL(hw, phy.ops.write_reg_mdi, 22, 0, 0);
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1259  		status = TCALL(hw, phy.ops.read_reg_mdi, 4, 0, &value);
a5961b4bc6ce09a Duanqiang Wen 2022-12-01 @1260  		*pause_bit = (u8)((value >> 10) & 0x3);
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1261  	} else {
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1262  		status = TCALL(hw, phy.ops.write_reg_mdi, 22, 0, 1);
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1263  		status = TCALL(hw, phy.ops.read_reg_mdi, 4, 0, &value);
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1264  		*pause_bit = (u8)((value >> 7) & 0x3);
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1265  	}
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1266  	return status;
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1267  }
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1268  
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1269  s32 ngbe_phy_get_advertised_pause_yt8521s(struct ngbe_hw *hw, u8 *pause_bit)
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1270  {
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1271  	u16 value;
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1272  	s32 status = 0;
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1273  
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1274  	status = ngbe_phy_read_reg_sds_mii_yt8521s(hw, 0x04, 0, &value);
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1275  	*pause_bit = (u8)((value >> 7) & 0x3);
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1276  	return status;
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1277  }
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1278  
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1279  s32 ngbe_phy_get_lp_advertised_pause(struct ngbe_hw *hw, u8 *pause_bit)
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1280  {
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1281  	u16 value;
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1282  	s32 status = 0;
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1283  
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1284  	status = TCALL(hw, phy.ops.read_reg, 0x1d, 0xa43, &value);
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1285  
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1286  	status = TCALL(hw, phy.ops.read_reg, 0x1, 0, &value);
a5961b4bc6ce09a Duanqiang Wen 2022-12-01 @1287  	value = (value >> 5) & 0x1;
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1288  
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1289  	/* if AN complete then check lp adv pause */
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1290  	status = TCALL(hw, phy.ops.read_reg, 5, 0, &value);
a5961b4bc6ce09a Duanqiang Wen 2022-12-01 @1291  	*pause_bit = (u8)((value >> 10) & 0x3);
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1292  	return status;
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1293  }
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1294  
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1295  s32 ngbe_phy_get_lp_advertised_pause_m88e1512(struct ngbe_hw *hw,
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1296  												u8 *pause_bit)
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1297  {
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1298  	u16 value;
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1299  	s32 status = 0;
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1300  
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1301  	if (hw->phy.type == ngbe_phy_m88e1512) {
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1302  		status = TCALL(hw, phy.ops.write_reg_mdi, 22, 0, 0);
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1303  		status = TCALL(hw, phy.ops.read_reg_mdi, 5, 0, &value);
a5961b4bc6ce09a Duanqiang Wen 2022-12-01 @1304  		*pause_bit = (u8)((value >> 10) & 0x3);
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1305  	} else {
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1306  		status = TCALL(hw, phy.ops.write_reg_mdi, 22, 0, 1);
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1307  		status = TCALL(hw, phy.ops.read_reg_mdi, 5, 0, &value);
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1308  		*pause_bit = (u8)((value >> 7) & 0x3);
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1309  	}
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1310  	return status;
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1311  }
a5961b4bc6ce09a Duanqiang Wen 2022-12-01  1312  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
