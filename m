Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216E51F5617
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Dec 2025 00:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765241392; cv=none; b=AtAJJ43r6dGAxfqgcGAOkrGN0OD43u4fZCrnx9bLqLVoWuzIZsHvbG4gQztqvJyjnBkHibKi9FZTtzJ2A7WWUUV2C6hVM1xLzvTr0zNPRRNS7IZl4BD3MPmghUg7sdJZ53Vc6OXOraHJON1ZyTS/pawsLmveM1ekDn8eqrP1UcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765241392; c=relaxed/simple;
	bh=rSt+099X7WD26fhsTw8SkQOw0OQgOw4AObi4ZHDXHAU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qd88POYkAaQ/lUPD+iK8qXsIKaoOL/Wxj9M84vXww5yLZ1CP+n9iW9Z2YWWBbb8/bVnjyO3kxXZGz7qjYjtydUzpkX8GImy6cpyIZaGktfvsW+WqEURpqfosrqIGm/vAQiZlF7XuM4LZc1ms77s0BPWa+N1U+Jt7pmiECi7Bs7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hMNC+zEn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hMNC+zEn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765241391; x=1796777391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rSt+099X7WD26fhsTw8SkQOw0OQgOw4AObi4ZHDXHAU=;
  b=hMNC+zEnQNAW5vwZRxnFeHMWNwwMVfihsEVfWkZTcAl4EVxUt+78Vn/b
   AOItfXoMyASUtDF2wK3XzwItTfVHZ8rjBjebJf526YBsTAStciuPDmDl3
   y/kw+I/SxxtzlFqs/5w07/Ih59dgswdff5e1wNgwzkEfd+bN9CpqnKxhg
   sxjPIUM673Pd8wkIdSDh93FLuaNG6+qd7a6A1kPzb5AcVDZZD2FrJFGTB
   TwobaLM4l+EtmkYZSM2qy5mazerhZNYwwxXdWaLYL01K5uWNlyS0t+Pkn
   8NUXFISgmAIy17XmZgS5e10CDhIHU9GRrCxfYMPSrAwFcTZJZgYD7OQwV
   g==;
X-CSE-ConnectionGUID: uGuhRA51RNCxwxuKAVhDVQ==
X-CSE-MsgGUID: 0DmvQ1BnQO27ouk38kPSJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="54736585"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="54736585"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 16:49:50 -0800
X-CSE-ConnectionGUID: 5zzTCltPQVW16mGO9LJIJw==
X-CSE-MsgGUID: lvTHRTRHStmIQz9TOhMcFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="200261575"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Dec 2025 16:49:49 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSlvG-0000000015Q-0LqS;
	Tue, 09 Dec 2025 00:49:46 +0000
Date: Tue, 9 Dec 2025 08:49:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/wireless/realtek/rtw89/rtw8852b_common.c:1256:32-33:
 WARNING opportunity for max()
Message-ID: <202512090808.P8F1VQJQ-lkp@intel.com>
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
TO: Bitterblue Smith <rtl8821cerfe2@gmail.com>
CC: "Ping-Ke Shih" <pkshih@realtek.com>

Hi Bitterblue,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a110f942672c8995dc1cacb5a44c6730856743aa
commit: 4b295f4fdc80e9b13bd2ca05f4c9434fa0857cab wifi: rtw89: Enable the new rtw89_8852bu module
date:   5 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-r052-20251208 (https://download.01.org/0day-ci/archive/20251209/202512090808.P8F1VQJQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 000e46219ba1ee53fc42d35e00c314c2807e8b14)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512090808.P8F1VQJQ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/wireless/realtek/rtw89/rtw8852b_common.c:1256:32-33: WARNING opportunity for max()

vim +1256 drivers/net/wireless/realtek/rtw89/rtw8852b_common.c

5a72e198a6e965 Ping-Ke Shih    2024-06-07  1235  
28b921020babf6 Zong-Zhe Yang   2025-03-26  1236  /* @pwr_ofst (unit: 1/8 dBm): power of path A minus power of path B */
5a72e198a6e965 Ping-Ke Shih    2024-06-07  1237  static void rtw8852bx_set_txpwr_ref(struct rtw89_dev *rtwdev,
50191eace88c41 Kuan-Chung Chen 2024-11-11  1238  				    enum rtw89_phy_idx phy_idx, s16 pwr_ofst)
5a72e198a6e965 Ping-Ke Shih    2024-06-07  1239  {
5a72e198a6e965 Ping-Ke Shih    2024-06-07  1240  	static const u32 addr[RF_PATH_NUM_8852BX] = {0x5800, 0x7800};
5a72e198a6e965 Ping-Ke Shih    2024-06-07  1241  	const u32 mask = B_DPD_TSSI_CW | B_DPD_PWR_CW | B_DPD_REF;
50191eace88c41 Kuan-Chung Chen 2024-11-11  1242  	u16 ofst_dec[RF_PATH_NUM_8852BX];
5a72e198a6e965 Ping-Ke Shih    2024-06-07  1243  	const u8 ofst_ofdm = 0x4;
5a72e198a6e965 Ping-Ke Shih    2024-06-07  1244  	const u8 ofst_cck = 0x8;
5a72e198a6e965 Ping-Ke Shih    2024-06-07  1245  	const s16 ref_ofdm = 0;
5a72e198a6e965 Ping-Ke Shih    2024-06-07  1246  	const s16 ref_cck = 0;
5a72e198a6e965 Ping-Ke Shih    2024-06-07  1247  	u32 val;
5a72e198a6e965 Ping-Ke Shih    2024-06-07  1248  	u8 i;
5a72e198a6e965 Ping-Ke Shih    2024-06-07  1249  
5a72e198a6e965 Ping-Ke Shih    2024-06-07  1250  	rtw89_debug(rtwdev, RTW89_DBG_TXPWR, "[TXPWR] set txpwr reference\n");
5a72e198a6e965 Ping-Ke Shih    2024-06-07  1251  
5a72e198a6e965 Ping-Ke Shih    2024-06-07  1252  	rtw89_mac_txpwr_write32_mask(rtwdev, phy_idx, R_AX_PWR_RATE_CTRL,
5a72e198a6e965 Ping-Ke Shih    2024-06-07  1253  				     B_AX_PWR_REF, 0x0);
5a72e198a6e965 Ping-Ke Shih    2024-06-07  1254  
50191eace88c41 Kuan-Chung Chen 2024-11-11  1255  	ofst_dec[RF_PATH_A] = pwr_ofst > 0 ? 0 : abs(pwr_ofst);
50191eace88c41 Kuan-Chung Chen 2024-11-11 @1256  	ofst_dec[RF_PATH_B] = pwr_ofst > 0 ? pwr_ofst : 0;
5a72e198a6e965 Ping-Ke Shih    2024-06-07  1257  
50191eace88c41 Kuan-Chung Chen 2024-11-11  1258  	rtw89_debug(rtwdev, RTW89_DBG_TXPWR, "[TXPWR] set bb ofdm txpwr ref\n");
50191eace88c41 Kuan-Chung Chen 2024-11-11  1259  	for (i = 0; i < RF_PATH_NUM_8852BX; i++) {
50191eace88c41 Kuan-Chung Chen 2024-11-11  1260  		val = rtw8852bx_bb_cal_txpwr_ref(rtwdev, phy_idx, ref_ofdm, ofst_dec[i]);
50191eace88c41 Kuan-Chung Chen 2024-11-11  1261  		rtw89_phy_write32_idx(rtwdev, addr[i] + ofst_ofdm, mask, val, phy_idx);
50191eace88c41 Kuan-Chung Chen 2024-11-11  1262  	}
5a72e198a6e965 Ping-Ke Shih    2024-06-07  1263  
5a72e198a6e965 Ping-Ke Shih    2024-06-07  1264  	rtw89_debug(rtwdev, RTW89_DBG_TXPWR, "[TXPWR] set bb cck txpwr ref\n");
50191eace88c41 Kuan-Chung Chen 2024-11-11  1265  	for (i = 0; i < RF_PATH_NUM_8852BX; i++) {
50191eace88c41 Kuan-Chung Chen 2024-11-11  1266  		val = rtw8852bx_bb_cal_txpwr_ref(rtwdev, phy_idx, ref_cck, ofst_dec[i]);
50191eace88c41 Kuan-Chung Chen 2024-11-11  1267  		rtw89_phy_write32_idx(rtwdev, addr[i] + ofst_cck, mask, val, phy_idx);
50191eace88c41 Kuan-Chung Chen 2024-11-11  1268  	}
5a72e198a6e965 Ping-Ke Shih    2024-06-07  1269  }
5a72e198a6e965 Ping-Ke Shih    2024-06-07  1270  

:::::: The code at line 1256 was first introduced by commit
:::::: 50191eace88c4163c8990984a8a156f09f226d39 wifi: rtw89: handle different TX power between RF path

:::::: TO: Kuan-Chung Chen <damon.chen@realtek.com>
:::::: CC: Ping-Ke Shih <pkshih@realtek.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
