Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122F5374169
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Sep 2026 08:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789201246; cv=none; b=aFDk+veyYHIqt0k1NxLwnqR5QY351/lYYtaQJXwhD6nsytBmMQDeJXsf4DPRgta0JCS0sBwQLVjAMD3U2b+aawXb2Q1Vy86kl+rd3BUQrZruGr/kKyadvLhYOSdXLRV0QnugbjwzVPzK0sAwTWybuNZ8NrZlo+6rcjxoQqzOdyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789201246; c=relaxed/simple;
	bh=tEhnD0cLCwJz4zEePIZLxyAnq5IJW+SUincwYPoGTRY=;
	h=Date:From:To:Subject:Message-ID; b=qUgiHEAFe3PTOGZ72L9fRNKiSoOK3HsFPOjWZN2Lcp77ZE/2LpUJ9C0uLHg9Cub2ORnX6TlKitYt/Dy32yYW4c53pOGHeobFrYYYmeAymJWtULzUGjDLONIo58ym4UXs5N2ffMB1YoEqzrFh8TMH5FGBPY/3+Zj2X1HEgqByApc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QyvNGsb2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QyvNGsb2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789201244; x=1820737244;
  h=date:from:to:subject:message-id;
  bh=tEhnD0cLCwJz4zEePIZLxyAnq5IJW+SUincwYPoGTRY=;
  b=QyvNGsb2M5oB9pern5eTLDfVKqoiIMZtHN0FqiKsoCfTMe+HDQ3kqF7t
   vMm1CIe+qHUhsxsBdLspcvCXk+CLt6B81J6SQM7r5RWAWf1wOWlfLBikm
   v5d38CU226ps/f2KorlGnoP/MtRBez/kOKmqJF42KNzjy3jxtYSgu1dvz
   rG6OOThIcU0QT7ftFe9xMEaTLSvHX3mzeV/Sq6n9fVKE+GGD4UqDwGgkf
   smZdKrTRoXS7Tj7QSeDvJxsJ1+O69tdX56/gD9Sl/UxX0mfRaevtwmIp9
   Mbxp35O7N4qDpSmvBTTtkyJ9/dswZr3B1tMORazAcemLEsK+1fBCkqrQD
   Q==;
X-CSE-ConnectionGUID: 2CnqLBo2Rvmeu5s0zAlg6A==
X-CSE-MsgGUID: cdlGNQ+4QUKVwcFS0XXJqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="100808232"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="100808232"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 01:20:43 -0700
X-CSE-ConnectionGUID: JaX6/gszRmqmA9ru2yBwHQ==
X-CSE-MsgGUID: HK5kTqeGRqmnkknJqs1RYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="302032025"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 12 Sep 2026 01:20:43 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5IyU-0000000011j-3mY3
	for oe-kbuild@lists.linux.dev;
	Sat, 12 Sep 2026 08:20:38 +0000
Date: Sat, 12 Sep 2026 10:20:00 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/080-wifi 39/46] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202609121023.HRaJK6PE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/080-wifi
head:   423344419b5ba83783b44e2531fe2b32de9e4f42
commit: fd5ed61da794514d4b35957b3549514e9ca5163f [39/46] [brcmfmac] Support new join parameter structure versions
:::::: branch date: 10 hours ago
:::::: commit date: 4 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20260912/202609121023.HRaJK6PE-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#780: FILE: drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h:710:
+	__le32 active_time; /* -1 use default, dwell time per channel for
+				 * active scanning

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#783: FILE: drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h:713:
+	__le32 passive_time; /* -1 use default, dwell time per channel
+				 * for passive scanning

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#786: FILE: drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h:716:
+	__le32 home_time; /* -1 use default, dwell time for the home
+				 * channel between channel scans

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
