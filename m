Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364D6246797
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jan 2026 16:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768668971; cv=none; b=VIJlR+Yw9jbhsyAFaGfxXKtWsLEZ1hc7NWY+5Um4oKtUX4o2WNJf8xYyJquLcJG2HLjdgvHoMti6Ewyl6Gf9I9bzAq89ydB41t3iAyzsMa0494WpPcMKYac9zZIwiw30Mirw9zG4ydtee0ybH0Ja+OVtqDKkkympQXzfwjO/T/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768668971; c=relaxed/simple;
	bh=YrPTjzn5g/KNeVC23y65Z3gV5tI7XUWnnF+jQDC6x0U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PsgDtHeOg+WZUCR4iYjLpUgA1OVGsxgQdC5OghP+PuRXr7X6I2ew6D+DQPT8xf00k0DwRzVrC95Y+SxPlt1Do15p9MIka/CWCDY3B8wyzgX31IBDfHQc/iCGee0lf0w9W1a9Ua3bgwvsEunkW7B30cgc4g9+Fmr8YoHb8RaJcrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jXpbCyJM; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jXpbCyJM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768668970; x=1800204970;
  h=date:from:to:cc:subject:message-id;
  bh=YrPTjzn5g/KNeVC23y65Z3gV5tI7XUWnnF+jQDC6x0U=;
  b=jXpbCyJMX2KXiXx0WzlJkUd4hk9ZkosRj+ti2bljlIQKDj+w9r5cdO3z
   BIgNBGSn+06TduTIyxYe+tFECnb0r9m5IGmKOT+PlJMCmN35L70hK5Pef
   MRs2GRyK2WoU5BOEwvCyqp2F3MTUDceKceJeG4tKU72QrCrnmamt5WbYp
   wjvYYCTrue0nfQNA1Ah7+0b10TN94LkP1zAi0fhW4d/vQ22KFoRme0Zd8
   XFgAHyFq/65/8k9WIPznVrvFUOHhbQa+7r1Bs6Au3R37WHdEwdi/V5dDY
   fO4p2Z+eXiN+lU2wHwSX7WN+/WwCp3mYm5a9wugJaDS2zjn7MyDAa+APt
   w==;
X-CSE-ConnectionGUID: T/D+c97KQYygYprtX0RZYA==
X-CSE-MsgGUID: TCmjfZ4vSuKFj8M0eUrJ1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="69865025"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="69865025"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 08:56:09 -0800
X-CSE-ConnectionGUID: ZEUWg7nMTxic2MDSznL1Hw==
X-CSE-MsgGUID: AA8WJbABT4qCAgIWy7Lg/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="205105598"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Jan 2026 08:56:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh9an-00000000M3y-2Kcf;
	Sat, 17 Jan 2026 16:56:05 +0000
Date: Sun, 18 Jan 2026 00:55:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 3939/6849]
 drivers/net/wireless/ath/ath12k/wifi7/core.c:67:1: sparse: sparse: bad
 integer constant expression
Message-ID: <202601180043.7nEPctQo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/wireless/ath/ath12k/wifi7/core.c:67:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
commit: 4ea5bebe17bad6b1991fa632f2121062066b6dcc [3939/6849] Merge tag 'ath-next-20260105' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath
:::::: branch date: 27 hours ago
:::::: commit date: 9 days ago
config: parisc-randconfig-r132-20260117 (https://download.01.org/0day-ci/archive/20260118/202601180043.7nEPctQo-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601180043.7nEPctQo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601180043.7nEPctQo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/ath/ath12k/wifi7/core.c:67:1: sparse: sparse: bad integer constant expression
   drivers/net/wireless/ath/ath12k/wifi7/core.c:67:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/net/wireless/ath/ath12k/wifi7/core.c:68:1: sparse: sparse: bad integer constant expression
   drivers/net/wireless/ath/ath12k/wifi7/core.c:68:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/net/wireless/ath/ath12k/wifi7/core.c:68:1: sparse: sparse: bad integer constant expression
   drivers/net/wireless/ath/ath12k/wifi7/core.c:68:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +67 drivers/net/wireless/ath/ath12k/wifi7/core.c

387b587a861cf7 drivers/net/wireless/ath/ath12k/core_wifi7.c Kiran Venkatappa 2025-08-12  66  
387b587a861cf7 drivers/net/wireless/ath/ath12k/core_wifi7.c Kiran Venkatappa 2025-08-12 @67  MODULE_DESCRIPTION("Driver support for Qualcomm Technologies 802.11be WLAN devices");

:::::: The code at line 67 was first introduced by commit
:::::: 387b587a861cf7864df93c99c123877d28100bb3 wifi: ath12k: Move Wi-Fi 7 specific init routines to dedicated file

:::::: TO: Kiran Venkatappa <quic_kiranv@quicinc.com>
:::::: CC: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
