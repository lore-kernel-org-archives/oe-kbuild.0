Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F9752F26E
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Sep 2026 17:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790790549; cv=none; b=CmhjER12UnXWMIbgIxRPGRaSbWzH8p+b6Wct2og8PkfhYMG3Xy/sxdqzV6PlDRn98pKOglThuPwoCo0nwd1WT7cP1DAnNlxyw6VdFODf62O/2Vr+rpKEPEnGN3xk6kpa7xVjbx5VPurKVw5CwEpMyJQRNXbAujjjrTs1WZr+yZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790790549; c=relaxed/simple;
	bh=+SwFuy9yO4Mfa0NpHHcrMzdQKuxAlqtzTiHuXSCXlKw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gi+KkeZIUCkefX0Z+YmNQdD85YCe28utrFeI1LfkA8GQQt2M8LgujOFfxJk8/DGOx06+pJlHUjx2ayJyN75WTpaf05CjlZ8lb9DFp313DMcvuR7AIITCyDVhBnRxtf0gqFz2XIhodgcpmWH8guW5l+vELCe7xBrLCFm8cEZqFiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yv1Oh4QA; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yv1Oh4QA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790790546; x=1822326546;
  h=date:from:to:cc:subject:message-id;
  bh=+SwFuy9yO4Mfa0NpHHcrMzdQKuxAlqtzTiHuXSCXlKw=;
  b=Yv1Oh4QAXOoY8pLPuL8NbkxaZg/sDtfIWUJYS7c4ThOQu8FCr5YBGMsG
   1/QT5/5wZjEM3k7/FRZ4z2DgAYupe25bm/lUGT1fQ7SdVXpLxlrQ3yIdf
   GVO1ZfAuA+ekdcPwMtEaQlwyCO0Hl9FGNMbV9nCWDN39K7mkjUksi0g1Z
   xfMmy+St1m5InCfJZf7+gWYGfswxUd5x7fiBf2L/OgNSwccKP9KkLusag
   a+dkySFyNebi3G3KvKinurkyVJUwqqef5mdNjKjGOvBJk3INekilEmF5P
   o8UCOv8iOxBpedJ5imT2P/PaleqtcTg81mKZ/1hQM8petKOA0SLA2ySkK
   w==;
X-CSE-ConnectionGUID: YmtJLu8NTkyums2Am59AQQ==
X-CSE-MsgGUID: 5GjAQ3UNTyKxHUMXxNLJ7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91633868"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="91633868"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:49:06 -0700
X-CSE-ConnectionGUID: U7Tn9BFJRTSNXUmRkphp1g==
X-CSE-MsgGUID: zznxOjxwS5afajTis0cm1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="303685110"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 30 Sep 2026 10:49:04 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xByQQ-000000001x3-41ZR;
	Wed, 30 Sep 2026 17:49:02 +0000
Date: Wed, 30 Sep 2026 19:48:32 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [chrome-os:chromeos-5.10 7/7]
 drivers/mmc/core/block.c:2035:54-75: opportunity for str_on_off(snap ->
 enhanced_strobe)
Message-ID: <202609301917.3iG9bEYj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   968d160d78834f5248a3edbafe10ea3cf35fc7dd
commit: 2e11830dabe66c3d5e88c419b7c0307ce0ce84d7 [7/7] CHROMIUM: mmc: block: dump registers and bus state on critical I/O errors
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: x86_64-randconfig-2102-20260930 (https://download.01.org/0day-ci/archive/20260930/202609301917.3iG9bEYj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609301917.3iG9bEYj-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/mmc/core/block.c:2035:54-75: opportunity for str_on_off(snap -> enhanced_strobe)

vim +2035 drivers/mmc/core/block.c

511ce378e16f07 Baolin Wang       2020-02-12  2020  
2e11830dabe66c Athira Palliprath 2026-09-16  2021  static void mmc_print_snapshot_entry(const struct mmc_bus_snapshot *snap,
2e11830dabe66c Athira Palliprath 2026-09-16  2022  				     const char *tag, int idx)
2e11830dabe66c Athira Palliprath 2026-09-16  2023  {
2e11830dabe66c Athira Palliprath 2026-09-16  2024  	pr_emerg("MMC_SNAP [%d] [%s] Time: %llu ns\n"
2e11830dabe66c Athira Palliprath 2026-09-16  2025  		 "  -> Registers   : OCR: 0x%08x | RCA: 0x%04x | State: 0x%08x\n"
2e11830dabe66c Athira Palliprath 2026-09-16  2026  		 "  -> CID         : %08x%08x%08x%08x\n"
2e11830dabe66c Athira Palliprath 2026-09-16  2027  		 "  -> CSD         : %08x%08x%08x%08x\n"
2e11830dabe66c Athira Palliprath 2026-09-16  2028  		 "  -> Electrical  : Clk: %u Hz | Width: %d-bit | Timing: %d | ES: %s\n"
2e11830dabe66c Athira Palliprath 2026-09-16  2029  		 "  -> Power/Bus   : VDD: 0x%02x | SigVolt: %d (%s) | PwrMode: %d (%s) | DrvType: %d\n",
2e11830dabe66c Athira Palliprath 2026-09-16  2030  		 idx, tag,
2e11830dabe66c Athira Palliprath 2026-09-16  2031  		 (unsigned long long)snap->timestamp,
2e11830dabe66c Athira Palliprath 2026-09-16  2032  		 snap->ocr, snap->rca, snap->state,
2e11830dabe66c Athira Palliprath 2026-09-16  2033  		 snap->raw_cid[0], snap->raw_cid[1], snap->raw_cid[2], snap->raw_cid[3],
2e11830dabe66c Athira Palliprath 2026-09-16  2034  		 snap->raw_csd[0], snap->raw_csd[1], snap->raw_csd[2], snap->raw_csd[3],
2e11830dabe66c Athira Palliprath 2026-09-16 @2035  		 snap->clock, (1 << snap->bus_width), snap->timing, snap->enhanced_strobe ? "on" : "off",
2e11830dabe66c Athira Palliprath 2026-09-16  2036  		 snap->vdd,
2e11830dabe66c Athira Palliprath 2026-09-16  2037  		 snap->signal_voltage,
2e11830dabe66c Athira Palliprath 2026-09-16  2038  		 snap->signal_voltage == 1 ? "1.8V" : (snap->signal_voltage == 2 ? "1.2V" : "3.3V"),
2e11830dabe66c Athira Palliprath 2026-09-16  2039  		 snap->power_mode,
2e11830dabe66c Athira Palliprath 2026-09-16  2040  		 snap->power_mode == 2 ? "On" : (snap->power_mode == 1 ? "Up" : "Off"),
2e11830dabe66c Athira Palliprath 2026-09-16  2041  		 snap->drv_type);
2e11830dabe66c Athira Palliprath 2026-09-16  2042  }
2e11830dabe66c Athira Palliprath 2026-09-16  2043  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
