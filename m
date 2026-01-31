Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42502DCBE3
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Jan 2026 00:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769818514; cv=none; b=lXJScx++RikE4xqfYkJeO+b4N2dwYx4Bl0iLfd4eTMmKiJNhsVYp1aH/Yoh3MhOO/ksgpVwBo/QXZ/0AlewZtGAtWRjBHdCHOzKWY8Zi3c4Tp8vYW+9KCVNsCau370i+kdwE6af/WInjy3UsIYkHHye0Xu5KKOaLvCxwCMkdyRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769818514; c=relaxed/simple;
	bh=goVcVAwWP/jZ40u0IIZi2CVnFF38UDQEskJora1fDxc=;
	h=Date:From:To:Subject:Message-ID; b=HQeO6AW5Epz7hYRiE4ZsXne+N0xRibN7c5Z6pZxMPgvpYO9Q0iU+779W7XFhhMZzlmrDYg7tXNuJq6EItAUL7H4fGSZyAagFxMzwqkTiv96ly+Tb1ytL0fR9bukZG4qINYPgDYK1HV+uiPkTjeQ2tibILlyzbAgF0iCP7oySVKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lGO6CMFj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lGO6CMFj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769818512; x=1801354512;
  h=date:from:to:subject:message-id;
  bh=goVcVAwWP/jZ40u0IIZi2CVnFF38UDQEskJora1fDxc=;
  b=lGO6CMFj1JO6hqj5xL0fM3wj+4uBXLaiZYUrJ8OpM+RBen3UdWVSdZRf
   gd6gu1Zv0Ml2fLmVeLQCbbA3m8cuOkWigWIrhDhDAbgEE2IQDZa5h8+BN
   inRK3ivCGesWmFIUcH2u++Q89NcqYC4bomzDqZ77TkB/mt/eSFFgkQcwB
   6Y9F/1/2hQLpaaZkkhW4snsCHMeI0wKNAYxZsYExgaTx04aSpbxxEEcRs
   tIT4ITucuC0vKwZ/2Npzug5KW7QGhZypxrfCHoEM9/F6KIBj+SerMZsku
   pDD2pgSGqyIJIO+hxy9bVA7XLwLcYxR0FUAyZXFb1rhJd49dFqfucUE6M
   w==;
X-CSE-ConnectionGUID: 7aBXaepvRrGrdUfIuLSxkg==
X-CSE-MsgGUID: GW1barnPSHS78l3WoohtcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="93729192"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="93729192"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 16:15:12 -0800
X-CSE-ConnectionGUID: /AgrfNq2TUuKGFtn+ipY+Q==
X-CSE-MsgGUID: xE/Yb3+XRce9EG5mpCyH5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="208776136"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 30 Jan 2026 16:15:11 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlydo-000000002bD-2rCQ
	for oe-kbuild@lists.linux.dev;
	Sat, 31 Jan 2026 00:15:08 +0000
Date: Sat, 31 Jan 2026 01:15:02 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cornelisnetworks:for-upstream-20260130-1 20/23] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'it'
Message-ID: <202601310148.Zxfc3Qi7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>

tree:   https://github.com/cornelisnetworks/linux.git for-upstream-20260130-1
head:   8613a3fd5b6e088624accc0967f5a063f0dd02eb
commit: 1826785ed4ec429259af7f8a6ecb9e6e997a25db [20/23] RDMA/hfi2: Support ipoib
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260131/202601310148.Zxfc3Qi7-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'it'
#1669: FILE: drivers/infiniband/hw/hfi2/netdev_rx.c:398:
+ * When at least one device has called it it increments atomic counter.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
