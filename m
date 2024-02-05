Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516DDB642
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Feb 2024 05:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707109696; cv=none; b=TF6CZ2wrvjOMIBRS0j+sBzrTDVdKWCyuMiE8+LbvEGdSVG2b9axcccJBK4Dpc31ypDACXDBt1yAH+yLOXYS9BZT7pIhZ95OG8qFSn7CCTo8Oks1nWrxyoMW+lDXHyGgSa0sH1tnpoz47J+nOjmvSUepmeghp9NEwQ9wvJbVIWII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707109696; c=relaxed/simple;
	bh=cgvc34429Ot+lhIqbvBn+rY+6rMNRhjX9nERNmP+D6c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZEls2fobseJn+KHWFcM7dgdNFD6CVg5lqDXsbHHRh9O4Xn0hvJBT0oxOzVJgjcRndE4HTSuvqdXUsajJpbwnCAEmJ9Zv+2IdEcG/GtxJFfITXPWI+0yn87Dqg32RHc6MTcYCFIu0MLyxzNqTrXhbKGlHsFePV5JrDqgMEenU3oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IgVgr4QC; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgVgr4QC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707109695; x=1738645695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cgvc34429Ot+lhIqbvBn+rY+6rMNRhjX9nERNmP+D6c=;
  b=IgVgr4QC0IT/WxUggyKG0KRxFXy661nLJg5wvxS7ZG3aWqKyNrhkRCFu
   5pGiQp1t5MiiIdrirWxRCJwtC1z7NfyXEY7u8XLrrtNuWW1RCT9SriXPn
   qQnNCltPkVRgUlshppxp3fI2wixreHSxeej2q0TI1O0QW5vvSlRHKFWUQ
   nK26PzLubuUY0W2BTkdZN8ugjyuiCm+0UazZ06lC0kv9RDzHSXep3tUdd
   N4WcgnqqW9i+jf/v3rzDE5LcTbyntZecTKkfNQuiwoomsPRSZcYVdUDSr
   EYdGeqA7kPdIykabiqDs78GUtYIqvf/8ZjzLXrfJx/8yjbLLxukQrD5NT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="17867563"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="17867563"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 21:08:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="909195221"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="909195221"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 04 Feb 2024 21:08:12 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWrDF-00009m-31;
	Mon, 05 Feb 2024 05:08:09 +0000
Date: Mon, 5 Feb 2024 13:07:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: net-procfs.c:(.ref.text+0x60): relocation truncated to fit:
 R_AARCH64_CALL26 against undefined symbol `wext_proc_exit'
Message-ID: <202402051349.XPu1hxff-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Mark Salyzyn <salyzyn@google.com>

tree:   https://github.com/ambarus/linux-0day syzkaller-id-5ecbc557fcdb8a2864e876f690ef377db999c50f
head:   caa714448992ba4eb583735a4acb26917fbc67a8
commit: 8a167346a33aa28c6e422739e69abc87f57f81bc ANDROID: net: enable wireless core features with GKI_LEGACY_WEXT_ALLCONFIG
date:   4 years, 5 months ago
:::::: branch date: 1 year, 2 months ago
:::::: commit date: 4 years, 5 months ago
config: arm64-randconfig-001-20240117 (https://download.01.org/0day-ci/archive/20240205/202402051349.XPu1hxff-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402051349.XPu1hxff-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402051349.XPu1hxff-lkp@intel.com/

Note: the ambarus/syzkaller-id-5ecbc557fcdb8a2864e876f690ef377db999c50f HEAD caa714448992ba4eb583735a4acb26917fbc67a8 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: net/socket.o: in function `sock_ioctl':
   socket.c:(.text+0x32cc): undefined reference to `wext_handle_ioctl'
   socket.c:(.text+0x32cc): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `wext_handle_ioctl'
   aarch64-linux-ld: net/socket.o: in function `compat_sock_ioctl':
   socket.c:(.text+0x497c): undefined reference to `compat_wext_handle_ioctl'
   socket.c:(.text+0x497c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `compat_wext_handle_ioctl'
   aarch64-linux-ld: net/core/net-procfs.o: in function `dev_proc_net_exit':
   net-procfs.c:(.ref.text+0x60): undefined reference to `wext_proc_exit'
>> net-procfs.c:(.ref.text+0x60): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `wext_proc_exit'
   aarch64-linux-ld: net/core/net-procfs.o: in function `dev_proc_net_init':
   net-procfs.c:(.init.text+0x100): undefined reference to `wext_proc_init'
>> net-procfs.c:(.init.text+0x100): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `wext_proc_init'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
