Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675747;
	b=D2BKeV9OTdvf8sasrj5s4b3gOTFzjdKQyq2QH7a14v547jUZvrP8zO7DyM5OHZfh5yE3
	 qBrXJD9tudMZwYwyjIWYTdP8jHbD3SSDLsjnJZHIWKo2PZLv3/PrnW8eIAI88hPNMmsEF
	 eaBz51Rdu85Whgwqsa9RGh9LmokhFR4T0jruEqSdO2n9++T94A62A2pyPXsGIAV9S5Iik
	 NmAZRObKpcqLFRvZs71wL8Qr+pv/WVrVy1Rq710GiogyFyINTjXT9xU3t86i0uG2c0q+5
	 K5qkEQfJSdUjA0kb6qqOIx3sLOtJ6IAoMQ+/wGKhvfxg6674I0sU/lhBdpGzTS3pH8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675747;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=sW0Lsmfm7f09QH89YH4SlYzS4F0ofDQ+TW1KFThadcE=;
	b=QLoCcg3XYPYW5lj1AiVkFNJ0pWpiGlmwdMwPtnMyYa0mLj0wcGWIknNi9g7rhikl6a16
	 G3rfHgZxE8MmhjQ1o2uR4Y66f+q8ES6eemcLLbEzAR99XDfZw9D3hDJPVJovwgYg8T3sN
	 E9wb7tlJ5vBT97HVAiodo+E6+6iardXxgemW+ki/+/pFNRDW1ecDKIP2sbh5ZOJKUq1ap
	 lLOFkY6Uvu4XxBqHOOgHFyDKtwt+CWkrWKGE8JTHX2ZnSAhbNYeIh+6EpX/1ojKoCVV2C
	 Pw8k71xt6gIwDirRpwWj/HViGzPkVnm35LbFdi6BJMovVT2cT8GrP3rsGNsuGeUqY0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="X7j6+W/C";
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9416B606A335
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 06:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9416B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X7j6+W/C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795675737; x=1827211737;
  h=date:from:to:cc:subject:message-id;
  bh=NQsIAJaPE/ybtu0tBHm3LbGtzSX60cAqHZPuHtRlMN8=;
  b=X7j6+W/C7I4lkGcCUxdeUWynrimaKxt3wce6fy2YDu8m3Ej7CjUen6EJ
   tWgmlKNciCjWzmSO9AEW69ZBVVg3NL9mKdVU3SBe1Y1G3K8LLxd6HP0BM
   mgJP1f3lPDCUxohFWG49b0cM+MLmQKtLKY0qT/WYLY8g32EJLyclrDWM9
   LOA5m8xZ2fRW7Zqqia0zVs8Oa6e0UqP+H39oM64kMcNzw9E/rGu//NgJ2
   fQ4wdTK+N2dlh9BscqKry4RQviJG5hT4ue24K7N072PHn1kLQmo5GNSh6
   kSN7EYeXnps8Ik5+Gj7nTeeji58eiKA8tj4KTUIyi5K+Rgobr+US7Q/0R
   A==;
X-CSE-ConnectionGUID: WbpB4T2VRc2Jj8ntMkcJFA==
X-CSE-MsgGUID: TiAlu9IjTOuRbMfOpXpXgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4583791"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4583791"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 22:36:19 -0800
X-CSE-ConnectionGUID: lAtLEQA6Q+GZ2WB4bNOSXA==
X-CSE-MsgGUID: wQeADU73Sku8hp76WYceiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12237164"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 25 Nov 2026 22:35:55 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWT5E-000000000G3-2Z3a;
	Thu, 26 Nov 2026 06:35:52 +0000
Date: Thu, 26 Nov 2026 07:35:41 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/wireless/realtek/rtw89/coex.c:10187:31-32:
 WARNING opportunity for max()
Message-ID: <20261126072708.a4V1cI0V-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Ching-Te Ku" <ku920601@realtek.com>
CC: "Ping-Ke Shih" <pkshih@realtek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   40212b29a6f718d4e7fb3275cede181cb8e137cf
commit: 235a6ff568c36ece70a5081885bb3230d38c4e78 wifi: rtw89: coex: compute WL/BT cross-talk interference maps
date:   7 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-2103-20261124 (https://download.01.org/0day-ci/archive/20261126/20261126072708.a4V1cI0V-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 235a6ff568c3 ("wifi: rtw89: coex: compute WL/BT cross-talk interference maps")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261126072708.a4V1cI0V-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/wireless/realtek/rtw89/coex.c:10187:31-32: WARNING opportunity for max()
   drivers/net/wireless/realtek/rtw89/coex.c:10199:31-32: WARNING opportunity for max()

vim +10187 drivers/net/wireless/realtek/rtw89/coex.c

e3ec7017f6a20d1 Ping-Ke Shih 2021-10-11  10141  
235a6ff568c36ec Ching-Te Ku  2026-10-04  10142  static bool _update_wl_rssi_status(struct rtw89_dev *rtwdev)
235a6ff568c36ec Ching-Te Ku  2026-10-04  10143  {
235a6ff568c36ec Ching-Te Ku  2026-10-04  10144  	struct rtw89_btc *btc = &rtwdev->btc;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10145  	struct rtw89_btc_cx *cx = &btc->cx;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10146  	struct rtw89_btc_wl_info *wl = &cx->wl;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10147  	struct rtw89_btc_dm *dm = &btc->dm;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10148  	struct rtw89_btc_bt_link_info *b;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10149  	u8 i, j, ant_iso, th, rssi, nxt, bt_enable;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10150  	u8 wl_rf_band = RTW89_BAND_2G, cnt = 0;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10151  	bool status_change = false;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10152  	s8 bt_pin;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10153  	s32 val;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10154  
235a6ff568c36ec Ching-Te Ku  2026-10-04  10155  	/* Update WL RSSI (search the min value between all role/HW-band) */
235a6ff568c36ec Ching-Te Ku  2026-10-04  10156  	rssi = 110; /* unit: % */
235a6ff568c36ec Ching-Te Ku  2026-10-04  10157  	for (i = 0; i < RTW89_BE_BTC_WL_MAX_ROLE_NUMBER; i++) {
235a6ff568c36ec Ching-Te Ku  2026-10-04  10158  		for (j = 0; j < RTW89_MAC_NUM; j++) {
235a6ff568c36ec Ching-Te Ku  2026-10-04  10159  			if (!wl->rlink_info[i][j].active ||
235a6ff568c36ec Ching-Te Ku  2026-10-04  10160  			    wl->rlink_info[i][j].connected == MLME_NO_LINK)
235a6ff568c36ec Ching-Te Ku  2026-10-04  10161  				continue;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10162  
235a6ff568c36ec Ching-Te Ku  2026-10-04  10163  			if (wl->rlink_info[i][j].stat.rssi < rssi) { /* find min */
235a6ff568c36ec Ching-Te Ku  2026-10-04  10164  				rssi = wl->rlink_info[i][j].stat.rssi;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10165  				wl_rf_band = wl->rlink_info[i][j].band;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10166  				cnt++;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10167  			}
235a6ff568c36ec Ching-Te Ku  2026-10-04  10168  		}
235a6ff568c36ec Ching-Te Ku  2026-10-04  10169  	}
235a6ff568c36ec Ching-Te Ku  2026-10-04  10170  
235a6ff568c36ec Ching-Te Ku  2026-10-04  10171  	if (cnt == 0) /* no wifi link exist */
235a6ff568c36ec Ching-Te Ku  2026-10-04  10172  		wl->rssi = 0;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10173  	else
235a6ff568c36ec Ching-Te Ku  2026-10-04  10174  		wl->rssi = rssi;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10175  
235a6ff568c36ec Ching-Te Ku  2026-10-04  10176  	/* SIR state: compare WL_RSSI with each BT-Tx interference */
235a6ff568c36ec Ching-Te Ku  2026-10-04  10177  	for (i = BTC_BT_1ST; i <= BTC_BT_EXT; i++) {
235a6ff568c36ec Ching-Te Ku  2026-10-04  10178  		switch (i) {
235a6ff568c36ec Ching-Te Ku  2026-10-04  10179  		case BTC_BT_1ST:
235a6ff568c36ec Ching-Te Ku  2026-10-04  10180  		default:
235a6ff568c36ec Ching-Te Ku  2026-10-04  10181  			bt_enable = cx->bt0.enable.now;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10182  			ant_iso = cx->bt0.ant_iso_to_wl;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10183  			if (wl_rf_band != RTW89_BAND_2G) /* find same rf-band */
235a6ff568c36ec Ching-Te Ku  2026-10-04  10184  				b = &cx->bt0.link_info_56g;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10185  			else
235a6ff568c36ec Ching-Te Ku  2026-10-04  10186  				b = &cx->bt0.link_info;
235a6ff568c36ec Ching-Te Ku  2026-10-04 @10187  			if (b->bt_txpwr_desc.le_dbm > b->bt_txpwr_desc.br_dbm)
235a6ff568c36ec Ching-Te Ku  2026-10-04  10188  				bt_pin = b->bt_txpwr_desc.le_dbm;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10189  			else
235a6ff568c36ec Ching-Te Ku  2026-10-04  10190  				bt_pin = b->bt_txpwr_desc.br_dbm;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10191  			break;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10192  		case BTC_BT_2ND:
235a6ff568c36ec Ching-Te Ku  2026-10-04  10193  			bt_enable = cx->bt1.enable.now;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10194  			ant_iso = cx->bt1.ant_iso_to_wl;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10195  			if (wl_rf_band != RTW89_BAND_2G) /* find same rf-band */
235a6ff568c36ec Ching-Te Ku  2026-10-04  10196  				b = &cx->bt0.link_info_56g;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10197  			else
235a6ff568c36ec Ching-Te Ku  2026-10-04  10198  				b = &cx->bt0.link_info;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10199  			if (b->bt_txpwr_desc.le_dbm > b->bt_txpwr_desc.br_dbm)
235a6ff568c36ec Ching-Te Ku  2026-10-04  10200  				bt_pin = b->bt_txpwr_desc.le_dbm;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10201  			else
235a6ff568c36ec Ching-Te Ku  2026-10-04  10202  				bt_pin = b->bt_txpwr_desc.br_dbm;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10203  			break;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10204  		case BTC_BT_EXT:
235a6ff568c36ec Ching-Te Ku  2026-10-04  10205  			bt_enable = !!cx->bt_ext.func_type;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10206  			ant_iso = cx->bt_ext.ant_iso_to_wl;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10207  			bt_pin = cx->bt_ext.max_tx_pwr;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10208  			break;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10209  		}
235a6ff568c36ec Ching-Te Ku  2026-10-04  10210  
235a6ff568c36ec Ching-Te Ku  2026-10-04  10211  		val = 110 + bt_pin - ant_iso - dm->sir_thres;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10212  		if (!bt_enable || val <= 0)
235a6ff568c36ec Ching-Te Ku  2026-10-04  10213  			th = 0;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10214  		else if (val >= 110)
235a6ff568c36ec Ching-Te Ku  2026-10-04  10215  			th = 110;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10216  		else
235a6ff568c36ec Ching-Te Ku  2026-10-04  10217  			th = (u8)val;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10218  
235a6ff568c36ec Ching-Te Ku  2026-10-04  10219  		dm->tdd_rssi_thres = th;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10220  
235a6ff568c36ec Ching-Te Ku  2026-10-04  10221  		nxt = _update_rssi_state(rtwdev, dm->sir_state[i], wl->rssi, th);
235a6ff568c36ec Ching-Te Ku  2026-10-04  10222  
235a6ff568c36ec Ching-Te Ku  2026-10-04  10223  		if (nxt != dm->sir_state[i]) {
235a6ff568c36ec Ching-Te Ku  2026-10-04  10224  			dm->sir_state[i] = nxt;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10225  			status_change = true;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10226  		}
235a6ff568c36ec Ching-Te Ku  2026-10-04  10227  	}
235a6ff568c36ec Ching-Te Ku  2026-10-04  10228  
235a6ff568c36ec Ching-Te Ku  2026-10-04  10229  	return status_change;
235a6ff568c36ec Ching-Te Ku  2026-10-04  10230  }
235a6ff568c36ec Ching-Te Ku  2026-10-04  10231  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
