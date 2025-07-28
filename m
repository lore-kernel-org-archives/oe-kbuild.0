Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2205827056B
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Jul 2025 15:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753716012; cv=none; b=aVkhomRdYX5fWZhW8CSr0ydsNO6eEdTGjC9j8AqDUZMxjNQV/Iw+n5vpKB9OSP0H2wv+r5B6vNtCah9CHdcAXAiR3kELJtbr976Y8it1c0nj3+rVyWJA5PFKKe/IDy56cqpjJZzKoH6tQAgx/C1/U5xAjhBL2V/xSyujqVgOySU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753716012; c=relaxed/simple;
	bh=ffZjG0bVrzZFcUZdWUrpeLysZRCE94g4E5KAxXm8Sa8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N4T+foAgYNCggh++Q99W0QPb42S2bsuiK7Y6ecMH82tNrpTfFiVk3N9AtSXbKUgs3G4hH4VgT/WuCius6Fkij0BI5G1ksPxVj0G8MxXy9hl8WO0zU2vXNoBDne2EVSTWaSsTYIqOx7nFumfx/8NaLySmuGdFNX1LtGez4Q+hp9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZz97nJw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZz97nJw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753716012; x=1785252012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ffZjG0bVrzZFcUZdWUrpeLysZRCE94g4E5KAxXm8Sa8=;
  b=iZz97nJw9Tt/PgliQvm6Z6/KSaGnMOlYhY8ADmxuIpwPgJq5xEy7ARG8
   PL4uj/0+CS8lgbUkb1QaxX7Ua8nf+VizNXrEdeAejfZ2BLJWDw0n4X1Mf
   /4zVBvIvesZFzgNT8+VES9TI9qP2vHXnh38PEQWAIDBi/lZipitt0Zn1J
   APotNdu6ZHPDGANVsU9p0XxZoDAClev7S5YLl54X6DssZjO7G8ofu+9L+
   Q1Ue7b1uotGi3Qiv96fXiBMUMprXQ9/kyq6IuS3zXT03VxViHLHvJQiRL
   gNTnDhbJXHC8+7wLQ4m9cTc9yCeu00q4oP+otxXphXLQTucJDaI3bPL+j
   A==;
X-CSE-ConnectionGUID: nKPgScF3R3iTcgiq+rXyOw==
X-CSE-MsgGUID: NZniOo2RQ6KtN00J7towrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="59772270"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="59772270"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 08:20:11 -0700
X-CSE-ConnectionGUID: DFROEfi8SiC7zlYI3yyEDA==
X-CSE-MsgGUID: ndRN1QEJRJWQqcXOaEHpOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161703294"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Jul 2025 08:20:09 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugPe2-0000X1-2i;
	Mon, 28 Jul 2025 15:20:06 +0000
Date: Mon, 28 Jul 2025 23:19:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [chrome-os:chromeos-6.6 320/320]
 drivers/net/wireless/realtek/rtw89/rtw8852bt_rfk.c:1896:6-32: opportunity
 for str_on_off(rtwdev -> is_tssi_mode [ path ])
Message-ID: <202507282341.drTGfLWA-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

Hi Ping-Ke,

First bad commit (maybe != root cause):

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   32c99cd5db842851e5acd8b583738b7848afc5fd
commit: 3d6c0d0fe1eac2100870a57c34988bb47ac181ff [320/320] UPSTREAM: wifi: rtw89: 8852bt: add 8852BE-VT to Makefile and Kconfig
:::::: branch date: 13 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-102-20250728 (https://download.01.org/0day-ci/archive/20250728/202507282341.drTGfLWA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202507282341.drTGfLWA-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/wireless/realtek/rtw89/rtw8852bt_rfk.c:1896:6-32: opportunity for str_on_off(rtwdev -> is_tssi_mode [ path ])
>> drivers/net/wireless/realtek/rtw89/rtw8852bt_rfk.c:1897:6-21: opportunity for str_on_off(rtwdev -> dbcc_en)

vim +1896 drivers/net/wireless/realtek/rtw89/rtw8852bt_rfk.c

76fb99e9e8468c Ping-Ke Shih 2024-06-21  1880  
76fb99e9e8468c Ping-Ke Shih 2024-06-21  1881  static void _dpk_information(struct rtw89_dev *rtwdev, enum rtw89_phy_idx phy,
76fb99e9e8468c Ping-Ke Shih 2024-06-21  1882  			     enum rtw89_rf_path path)
76fb99e9e8468c Ping-Ke Shih 2024-06-21  1883  {
76fb99e9e8468c Ping-Ke Shih 2024-06-21  1884  	const struct rtw89_chan *chan = rtw89_chan_get(rtwdev, RTW89_SUB_ENTITY_0);
76fb99e9e8468c Ping-Ke Shih 2024-06-21  1885  	struct rtw89_dpk_info *dpk = &rtwdev->dpk;
76fb99e9e8468c Ping-Ke Shih 2024-06-21  1886  
76fb99e9e8468c Ping-Ke Shih 2024-06-21  1887  	u8 kidx = dpk->cur_idx[path];
76fb99e9e8468c Ping-Ke Shih 2024-06-21  1888  
76fb99e9e8468c Ping-Ke Shih 2024-06-21  1889  	dpk->bp[path][kidx].band = chan->band_type;
76fb99e9e8468c Ping-Ke Shih 2024-06-21  1890  	dpk->bp[path][kidx].ch = chan->channel;
76fb99e9e8468c Ping-Ke Shih 2024-06-21  1891  	dpk->bp[path][kidx].bw = chan->band_width;
76fb99e9e8468c Ping-Ke Shih 2024-06-21  1892  
76fb99e9e8468c Ping-Ke Shih 2024-06-21  1893  	rtw89_debug(rtwdev, RTW89_DBG_RFK,
76fb99e9e8468c Ping-Ke Shih 2024-06-21  1894  		    "[DPK] S%d[%d] (PHY%d): TSSI %s/ DBCC %s/ %s/ CH%d/ %s\n",
76fb99e9e8468c Ping-Ke Shih 2024-06-21  1895  		    path, dpk->cur_idx[path], phy,
76fb99e9e8468c Ping-Ke Shih 2024-06-21 @1896  		    rtwdev->is_tssi_mode[path] ? "on" : "off",
76fb99e9e8468c Ping-Ke Shih 2024-06-21 @1897  		    rtwdev->dbcc_en ? "on" : "off",
76fb99e9e8468c Ping-Ke Shih 2024-06-21  1898  		    dpk->bp[path][kidx].band == 0 ? "2G" :
76fb99e9e8468c Ping-Ke Shih 2024-06-21  1899  		    dpk->bp[path][kidx].band == 1 ? "5G" : "6G",
76fb99e9e8468c Ping-Ke Shih 2024-06-21  1900  		    dpk->bp[path][kidx].ch,
76fb99e9e8468c Ping-Ke Shih 2024-06-21  1901  		    dpk->bp[path][kidx].bw == 0 ? "20M" :
76fb99e9e8468c Ping-Ke Shih 2024-06-21  1902  		    dpk->bp[path][kidx].bw == 1 ? "40M" : "80M");
76fb99e9e8468c Ping-Ke Shih 2024-06-21  1903  }
76fb99e9e8468c Ping-Ke Shih 2024-06-21  1904  

:::::: The code at line 1896 was first introduced by commit
:::::: 76fb99e9e8468c10e2936d313dfe1e7214c951ef UPSTREAM: wifi: rtw89: 8852bt: rfk: add DPK

:::::: TO: Ping-Ke Shih <pkshih@realtek.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
