Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EF5222580
	for <oe-kbuild@lists.linux.dev>; Sat,  2 May 2026 00:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777682950; cv=none; b=GM3tCHZXGp1fhHD799fugYnBy/AmUO7vCXAWfo/5r1dfUAfqwPaeZKgnOD44uYlSn40sWDGiPiZUhSQw/EycVXAxp6u6GN4Rx77d8AJZ2DmrQaWjjvLLZIV0lueR7Jql9J1j4YBcpUMV8MFID8XtLxqgkr/ipm0iUdvYL6VW96E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777682950; c=relaxed/simple;
	bh=daa38shKHDhse2XTRfBvybCg+5GMd1MqyEWN5rOm0N0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GogAhsX8eJd6bLxV5+epu8IMb8/rOhiMZ7LC0992ar3T0bZhuwovfjuQ0L/Q43xwO8s4UZukrA+eogdTaYMbArmmFW9901czkExpuMIKev+L6Rtu8sb/XBy4wyV6Pw9XJsfSOaFtFbt3U12dJZzTL7Q+Vztr866Cgx1jitLkciE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dR2PNkY4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dR2PNkY4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777682947; x=1809218947;
  h=date:from:to:cc:subject:message-id;
  bh=daa38shKHDhse2XTRfBvybCg+5GMd1MqyEWN5rOm0N0=;
  b=dR2PNkY4HvXmy3uHoHTJV+Oq35pbqUCJzj3SKkXWxy21hv8ILSLSQT/j
   xdsr9xUati+C8XYkYVguZ2RykXzHwC7OlSjzVn5j4lDkzrHWBzFGR5Y8K
   3hPzu3i57cMsGxg7NF4/wIwX1UEFduS2j+tniUhFbqa8SF1f69GsbtCVJ
   J9JmBxm28KIHB09tWlAcPSfyB6M1b5sF0oqhWIcNqbOkRJBGI072H4Ljo
   iKhLbw532Lryyhv4iECGhtoSXoMMGk1lGmBCpuiptkvx6ADXNFoVvL38C
   C3XvkmEl8znnl2XmcE2afYy88RZbxBAmquqDYPXThmErtj9APU1cRfXA5
   w==;
X-CSE-ConnectionGUID: qLwGLH6DQ0mII1mDuf+obw==
X-CSE-MsgGUID: ze0I4xSZS4ytBQZS4aG43g==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78542908"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="78542908"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 17:49:07 -0700
X-CSE-ConnectionGUID: 3CK+aU4kT8urQ8Sj3xLatQ==
X-CSE-MsgGUID: 4ErrpnImSbaq1J6GnQrtYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="239976726"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 01 May 2026 17:49:06 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIyXX-0000000011d-34eb;
	Sat, 02 May 2026 00:49:03 +0000
Date: Sat, 02 May 2026 08:48:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android-mainline-desktop 147/147]
 drivers/net/wireless/realtek/rtw89/mac.c:5534 rtw89_mac_c2h_tx_rpt() warn:
 potential spectre issue 'tx_rpt->skbs' [r]
Message-ID: <202605020801.FWwVhl6t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   e219c7b2963b321b2f079858ca8c70c9639e1cb3
commit: 816e849ef83aaf989035545d4a927b50a3d03525 [147/147] wifi: rtw89: handle IEEE80211_TX_CTL_REQ_TX_STATUS frames for USB
:::::: branch date: 6 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-161-20260427 (https://download.01.org/0day-ci/archive/20260502/202605020801.FWwVhl6t-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 816e849ef83a ("wifi: rtw89: handle IEEE80211_TX_CTL_REQ_TX_STATUS frames for USB")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605020801.FWwVhl6t-lkp@intel.com/

smatch warnings:
drivers/net/wireless/realtek/rtw89/mac.c:5534 rtw89_mac_c2h_tx_rpt() warn: potential spectre issue 'tx_rpt->skbs' [r]
drivers/net/wireless/realtek/rtw89/mac.c:5537 rtw89_mac_c2h_tx_rpt() warn: possible spectre second half.  'skb'

vim +5534 drivers/net/wireless/realtek/rtw89/mac.c

ef9dff4cb49121 Zong-Zhe Yang  2022-11-29  5490  
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5491  static void
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5492  rtw89_mac_c2h_tx_rpt(struct rtw89_dev *rtwdev, struct sk_buff *c2h, u32 len)
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5493  {
816e849ef83aaf Fedor Pchelkin 2025-11-04  5494  	struct rtw89_tx_rpt *tx_rpt = &rtwdev->tx_rpt;
816e849ef83aaf Fedor Pchelkin 2025-11-04  5495  	struct rtw89_tx_skb_data *skb_data;
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5496  	u8 sw_define, tx_status, txcnt;
816e849ef83aaf Fedor Pchelkin 2025-11-04  5497  	struct sk_buff *skb;
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5498  
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5499  	if (rtwdev->chip->chip_id == RTL8922A) {
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5500  		const struct rtw89_c2h_mac_tx_rpt_v2 *rpt_v2;
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5501  
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5502  		rpt_v2 = (const struct rtw89_c2h_mac_tx_rpt_v2 *)c2h->data;
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5503  		sw_define = le32_get_bits(rpt_v2->w12,
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5504  					  RTW89_C2H_MAC_TX_RPT_W12_SW_DEFINE_V2);
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5505  		tx_status = le32_get_bits(rpt_v2->w12,
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5506  					  RTW89_C2H_MAC_TX_RPT_W12_TX_STATE_V2);
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5507  		txcnt = le32_get_bits(rpt_v2->w14,
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5508  				      RTW89_C2H_MAC_TX_RPT_W14_DATA_TX_CNT_V2);
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5509  	} else {
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5510  		const struct rtw89_c2h_mac_tx_rpt *rpt;
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5511  
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5512  		rpt = (const struct rtw89_c2h_mac_tx_rpt *)c2h->data;
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5513  		sw_define = le32_get_bits(rpt->w2, RTW89_C2H_MAC_TX_RPT_W2_SW_DEFINE);
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5514  		tx_status = le32_get_bits(rpt->w2, RTW89_C2H_MAC_TX_RPT_W2_TX_STATE);
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5515  		if (rtwdev->chip->chip_id == RTL8852C)
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5516  			txcnt = le32_get_bits(rpt->w5,
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5517  					      RTW89_C2H_MAC_TX_RPT_W5_DATA_TX_CNT_V1);
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5518  		else
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5519  			txcnt = le32_get_bits(rpt->w5,
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5520  					      RTW89_C2H_MAC_TX_RPT_W5_DATA_TX_CNT);
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5521  	}
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5522  
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5523  	rtw89_debug(rtwdev, RTW89_DBG_TXRX,
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5524  		    "C2H TX RPT: sn %d, tx_status %d, txcnt %d\n",
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5525  		    sw_define, tx_status, txcnt);
816e849ef83aaf Fedor Pchelkin 2025-11-04  5526  
816e849ef83aaf Fedor Pchelkin 2025-11-04  5527  	/* claim sw_define is not over size of tx_rpt->skbs[] */
816e849ef83aaf Fedor Pchelkin 2025-11-04  5528  	static_assert(hweight32(RTW89_MAX_TX_RPTS_MASK) ==
816e849ef83aaf Fedor Pchelkin 2025-11-04  5529  		      hweight32(RTW89_C2H_MAC_TX_RPT_W12_SW_DEFINE_V2) &&
816e849ef83aaf Fedor Pchelkin 2025-11-04  5530  		      hweight32(RTW89_MAX_TX_RPTS_MASK) ==
816e849ef83aaf Fedor Pchelkin 2025-11-04  5531  		      hweight32(RTW89_C2H_MAC_TX_RPT_W2_SW_DEFINE));
816e849ef83aaf Fedor Pchelkin 2025-11-04  5532  
816e849ef83aaf Fedor Pchelkin 2025-11-04  5533  	scoped_guard(spinlock_irqsave, &tx_rpt->skb_lock) {
816e849ef83aaf Fedor Pchelkin 2025-11-04 @5534  		skb = tx_rpt->skbs[sw_define];
816e849ef83aaf Fedor Pchelkin 2025-11-04  5535  
816e849ef83aaf Fedor Pchelkin 2025-11-04  5536  		/* skip if no skb (normally shouldn't happen) */
816e849ef83aaf Fedor Pchelkin 2025-11-04 @5537  		if (!skb) {
816e849ef83aaf Fedor Pchelkin 2025-11-04  5538  			rtw89_debug(rtwdev, RTW89_DBG_TXRX,
816e849ef83aaf Fedor Pchelkin 2025-11-04  5539  				    "C2H TX RPT: no skb found in queue\n");
816e849ef83aaf Fedor Pchelkin 2025-11-04  5540  			return;
816e849ef83aaf Fedor Pchelkin 2025-11-04  5541  		}
816e849ef83aaf Fedor Pchelkin 2025-11-04  5542  
816e849ef83aaf Fedor Pchelkin 2025-11-04  5543  		skb_data = RTW89_TX_SKB_CB(skb);
816e849ef83aaf Fedor Pchelkin 2025-11-04  5544  
816e849ef83aaf Fedor Pchelkin 2025-11-04  5545  		/* skip if TX attempt has failed and retry limit has not been
816e849ef83aaf Fedor Pchelkin 2025-11-04  5546  		 * reached yet
816e849ef83aaf Fedor Pchelkin 2025-11-04  5547  		 */
816e849ef83aaf Fedor Pchelkin 2025-11-04  5548  		if (tx_status != RTW89_TX_DONE &&
816e849ef83aaf Fedor Pchelkin 2025-11-04  5549  		    txcnt != skb_data->tx_pkt_cnt_lmt)
816e849ef83aaf Fedor Pchelkin 2025-11-04  5550  			return;
816e849ef83aaf Fedor Pchelkin 2025-11-04  5551  
816e849ef83aaf Fedor Pchelkin 2025-11-04  5552  		tx_rpt->skbs[sw_define] = NULL;
816e849ef83aaf Fedor Pchelkin 2025-11-04  5553  		rtw89_tx_rpt_tx_status(rtwdev, skb, tx_status);
816e849ef83aaf Fedor Pchelkin 2025-11-04  5554  	}
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5555  }
c33c6a1b6f72ae Fedor Pchelkin 2025-11-04  5556  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
