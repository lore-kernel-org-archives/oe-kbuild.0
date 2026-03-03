Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1BA3EFD2D
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Mar 2026 11:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772538080; cv=none; b=KQFdszphJ0NmtyxNnNe58853CjcqVWEQ/GeP52W0u24BUbyFxON7BvCUqP5l7YDLK2qUrnluNj5bheI4T+U4Q4qD2gyqQi9iZelMnGyh27GpKttzyioegpLX167wPUYxSql7VrQ6y1Vqqs7qIAiow1vBqL15BiaKxkBwbxRXHSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772538080; c=relaxed/simple;
	bh=bdzCsbG5nLZLe+yvcw8ptMxdNFKR9dYHV/rkk9HTQOw=;
	h=Date:From:To:Subject:Message-ID; b=UABlFEgr1NKZqT6roZqNuQvtLoJVYmRjwG5pWm10y67sOqCjPK2aML9Jaes3eL35Rt0xsbISns/6uYARWOIwivtHGq8N6rliDXerFRQVtAd8Nae4pM8V3LZbH3Xlz4f3TlV8g6eWcqy3DzmwY/FlOy7XMqqyHbLiBSU29aFt2gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KKjAGWv8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KKjAGWv8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772538078; x=1804074078;
  h=date:from:to:subject:message-id;
  bh=bdzCsbG5nLZLe+yvcw8ptMxdNFKR9dYHV/rkk9HTQOw=;
  b=KKjAGWv8UZUg49vZVN90o9CJyDOIOHREWKBEJrK2i8DYFVT02fsCWRox
   WDKyt8AEtfxrQoqsJqaDX0EViAGZVlKCQjwGIRZuy+iFxW8iKnVeHToZ6
   BKeMKNlS7MQgWJJr3aMEDfDIe2q1wOcnBTPD1RK3jnPlbis0QOr5orEQq
   gfoaA7d3/MQKKZU7sWzN429dJUHIT4/dQtT70uhyOPEGs4pnOgJ+z7eeZ
   vgAPmNSMHNhUDNtFqHmuApF5rzsbgOwHB897+y/85rL2ux9IEMZQPyHwd
   JaPGm5/Otmk2/Yn/GKWDa7e9CgNr7qy1X1+cvq1SSQ2UBJ5yxKeg6liC0
   Q==;
X-CSE-ConnectionGUID: etaBPFNVR5qGBMhK+y+ZOA==
X-CSE-MsgGUID: QbUUkgIdQLayxWn8/sOYeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="90969090"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="90969090"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 03:41:18 -0800
X-CSE-ConnectionGUID: cDRQ+dLrRjWcQfxW48stGg==
X-CSE-MsgGUID: OG8W0tDoTb+unSUM1rs18w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="222130866"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 03 Mar 2026 03:41:16 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxO7m-000000001RZ-1O40
	for oe-kbuild@lists.linux.dev;
	Tue, 03 Mar 2026 11:41:14 +0000
Date: Tue, 03 Mar 2026 12:40:45 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [wireless-next:main 25/28] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'unnamed:deepseek-v3.2 coccinelle'
Message-ID: <202603031254.iFRewHwI-lkp@intel.com>
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
TO: Kexin Sun <kexinsun@smail.nju.edu.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
head:   5d048bbed1bb2bbef612dad0bb9c177c434e63a4
commit: b8a57b979a7c2069081ed0bf88a727b17d85ac96 [25/28] wifi: mac80211: update outdated comment
:::::: branch date: 37 minutes ago
:::::: commit date: 26 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260303/202603031254.iFRewHwI-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'unnamed:deepseek-v3.2 coccinelle'
#15: 
Assisted-by: unnamed:deepseek-v3.2 coccinelle

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
