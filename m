Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4BB23D7C2
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Oct 2026 02:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791252920; cv=none; b=cmrhphLDChdgbzoyTsDzXuEACT5lkK8p0ehpKnhmKJ0tKvPfBSgqDI0ydADLJqwuZ1ULs0Wxry3/D8MAg2jh4PURt+Qy8dgo68w/vr9RUoS2dFXLAJp2mfTVHcfJcHnyel/qUNPEsR1OteMEcpygEmtha2EBj6pufR0qr01lC5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791252920; c=relaxed/simple;
	bh=kQZSrRYUBeT8Xe121oKS2786W/L6KX/vmL9vRpsLJ6Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lM5ovMP/hkxSjTmjsIxD3fQfoX9HU1aQJtorcr5Z5cN9iNZynYRLVCKNtd+2ABb0T7hVyW45oTE187SqJ8UTaEfpmdkDy3WMdPys0oQTXifupbheKosGaKfaf+ovoVcv/KX8Vcwni24sBTKVPic0ilLqD68iv1tlWyfFdQpy6p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yv0kQDRf; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yv0kQDRf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791252916; x=1822788916;
  h=date:from:to:cc:subject:message-id;
  bh=kQZSrRYUBeT8Xe121oKS2786W/L6KX/vmL9vRpsLJ6Y=;
  b=Yv0kQDRfl/fvdb57sV6xZWDgXYpg17iyiUlJCXpfc4ww6zXyV4kzFIhY
   zilQMoD4kCR3CJsZoQq38FSECXl46hpq53VlDobuxYc44V2c2BWbZKRMm
   bAyWcYcrewNiwQV5UpdyhHY+Y40lbiTONJ850eyXzOSZbRgMV2ns9J0L5
   yqqLQBygWjoQU3/sZC3k+FoD/QlRLQ2UdXozvVgAlETbLMJ6hpxxRgtXL
   LBUSX9ZOQrHT+09iJ0AmTVWUQMJcdlbNYUkWVK2h0HDs7Vj90S2Xlgugg
   hjiMZwg3wRXoCz2KIkxwoe2j6uwPpQYUag+HYN52gvE44+lt/aTeX90Tm
   w==;
X-CSE-ConnectionGUID: nPTS2AD5TrylLMCEdcGCVg==
X-CSE-MsgGUID: ZCnOO+7ySZGrZnRJ1BWalg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="90968171"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="90968171"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 19:15:14 -0700
X-CSE-ConnectionGUID: QoYasOJORDuiam4CryVdkg==
X-CSE-MsgGUID: sd9bC1XwQmmJGUHBxD/2JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="1017933"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 05 Oct 2026 19:15:12 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDuhy-000000000aA-0oXH;
	Tue, 06 Oct 2026 02:15:10 +0000
Date: Tue, 06 Oct 2026 04:15:05 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/wireless/realtek/rtw89/rtw8852c.c:2062:32-33:
 WARNING opportunity for max()
Message-ID: <202610060455.pNejDA8w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Bitterblue Smith <rtl8821cerfe2@gmail.com>
CC: "Ping-Ke Shih" <pkshih@realtek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   67f0943b394d920b6c142aad8c6af94340342ae7
commit: 0d971ffdae584ea4a5b413318b4945b3d273a75a wifi: rtw89: Enable the new rtw89_8852cu module
date:   11 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 11 months ago
config: powerpc64-randconfig-r2104-20261005 (https://download.01.org/0day-ci/archive/20261006/202610060455.pNejDA8w-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 195c81658995a4b7531c30a12c5aef6cf2bbd671)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0d971ffdae58 ("wifi: rtw89: Enable the new rtw89_8852cu module")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610060455.pNejDA8w-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/wireless/realtek/rtw89/rtw8852c.c:2062:32-33: WARNING opportunity for max()

vim +2062 drivers/net/wireless/realtek/rtw89/rtw8852c.c

a9ffae8d3f9d26 Yuan-Han Zhang  2022-03-17  2042  
af0cac159b1c96 Ping-Ke Shih    2022-04-21  2043  static void rtw8852c_set_txpwr_ref(struct rtw89_dev *rtwdev,
50191eace88c41 Kuan-Chung Chen 2024-11-11  2044  				   enum rtw89_phy_idx phy_idx, s16 pwr_ofst)
af0cac159b1c96 Ping-Ke Shih    2022-04-21  2045  {
af0cac159b1c96 Ping-Ke Shih    2022-04-21  2046  	static const u32 addr[RF_PATH_NUM_8852C] = {0x5800, 0x7800};
50191eace88c41 Kuan-Chung Chen 2024-11-11  2047  	u16 ofst_dec[RF_PATH_NUM_8852C];
af0cac159b1c96 Ping-Ke Shih    2022-04-21  2048  	const u32 mask = 0x7FFFFFF;
af0cac159b1c96 Ping-Ke Shih    2022-04-21  2049  	const u8 ofst_ofdm = 0x4;
af0cac159b1c96 Ping-Ke Shih    2022-04-21  2050  	const u8 ofst_cck = 0x8;
af0cac159b1c96 Ping-Ke Shih    2022-04-21  2051  	s16 ref_ofdm = 0;
af0cac159b1c96 Ping-Ke Shih    2022-04-21  2052  	s16 ref_cck = 0;
af0cac159b1c96 Ping-Ke Shih    2022-04-21  2053  	u32 val;
af0cac159b1c96 Ping-Ke Shih    2022-04-21  2054  	u8 i;
af0cac159b1c96 Ping-Ke Shih    2022-04-21  2055  
af0cac159b1c96 Ping-Ke Shih    2022-04-21  2056  	rtw89_debug(rtwdev, RTW89_DBG_TXPWR, "[TXPWR] set txpwr reference\n");
af0cac159b1c96 Ping-Ke Shih    2022-04-21  2057  
af0cac159b1c96 Ping-Ke Shih    2022-04-21  2058  	rtw89_mac_txpwr_write32_mask(rtwdev, phy_idx, R_AX_PWR_RATE_CTRL,
af0cac159b1c96 Ping-Ke Shih    2022-04-21  2059  				     GENMASK(27, 10), 0x0);
af0cac159b1c96 Ping-Ke Shih    2022-04-21  2060  
50191eace88c41 Kuan-Chung Chen 2024-11-11  2061  	ofst_dec[RF_PATH_A] = pwr_ofst > 0 ? 0 : abs(pwr_ofst);
50191eace88c41 Kuan-Chung Chen 2024-11-11 @2062  	ofst_dec[RF_PATH_B] = pwr_ofst > 0 ? pwr_ofst : 0;
af0cac159b1c96 Ping-Ke Shih    2022-04-21  2063  
50191eace88c41 Kuan-Chung Chen 2024-11-11  2064  	rtw89_debug(rtwdev, RTW89_DBG_TXPWR, "[TXPWR] set bb ofdm txpwr ref\n");
50191eace88c41 Kuan-Chung Chen 2024-11-11  2065  	for (i = 0; i < RF_PATH_NUM_8852C; i++) {
50191eace88c41 Kuan-Chung Chen 2024-11-11  2066  		val = rtw8852c_bb_cal_txpwr_ref(rtwdev, phy_idx, ref_ofdm, ofst_dec[i]);
50191eace88c41 Kuan-Chung Chen 2024-11-11  2067  		rtw89_phy_write32_idx(rtwdev, addr[i] + ofst_ofdm, mask, val, phy_idx);
50191eace88c41 Kuan-Chung Chen 2024-11-11  2068  	}
af0cac159b1c96 Ping-Ke Shih    2022-04-21  2069  
af0cac159b1c96 Ping-Ke Shih    2022-04-21  2070  	rtw89_debug(rtwdev, RTW89_DBG_TXPWR, "[TXPWR] set bb cck txpwr ref\n");
50191eace88c41 Kuan-Chung Chen 2024-11-11  2071  	for (i = 0; i < RF_PATH_NUM_8852C; i++) {
50191eace88c41 Kuan-Chung Chen 2024-11-11  2072  		val = rtw8852c_bb_cal_txpwr_ref(rtwdev, phy_idx, ref_cck, ofst_dec[i]);
50191eace88c41 Kuan-Chung Chen 2024-11-11  2073  		rtw89_phy_write32_idx(rtwdev, addr[i] + ofst_cck, mask, val, phy_idx);
50191eace88c41 Kuan-Chung Chen 2024-11-11  2074  	}
af0cac159b1c96 Ping-Ke Shih    2022-04-21  2075  }
af0cac159b1c96 Ping-Ke Shih    2022-04-21  2076  

:::::: The code at line 2062 was first introduced by commit
:::::: 50191eace88c4163c8990984a8a156f09f226d39 wifi: rtw89: handle different TX power between RF path

:::::: TO: Kuan-Chung Chen <damon.chen@realtek.com>
:::::: CC: Ping-Ke Shih <pkshih@realtek.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
