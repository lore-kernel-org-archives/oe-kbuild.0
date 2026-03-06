Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA55835BDA5
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Mar 2026 10:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772792218; cv=none; b=Zf2g/CeeT/n3mo5Dlv9fi8RiO5urjYiuY2mb3YHPcHyGyvk+tnRtA8TXoShgJncsnvFE2oViW3ddZJu9BjrnqEsr+5bbMV1SJCGSP66j/wFxPRoaGFjwAXlfoaH0osQhEaeHBIgaMEmUEUoOlJk6mVuzvvZI+zz2cHH120SuHFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772792218; c=relaxed/simple;
	bh=eEuKme+Pc3jGm76lPnCNxiV+bg4KFdSWD/4y5ju5+kQ=;
	h=Date:From:To:Subject:Message-ID; b=hg3EadIvD69IjUkQ942hkVpTtJuIahFBDYKpfDx1v/qHb0wrXiCGeP1xAZQ+Hp79MfYnU/xR3fNHdFoxg88avBvPDksF6gbQACbBZrd0kKFGBG9P9l5hiZc7p33BrtXUjKUamsofSeQ6AVPOSciBGw8KDSezF8XDTJOz/WOs/MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NAfl4vbz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NAfl4vbz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772792217; x=1804328217;
  h=date:from:to:subject:message-id;
  bh=eEuKme+Pc3jGm76lPnCNxiV+bg4KFdSWD/4y5ju5+kQ=;
  b=NAfl4vbzONYZtDwqJXKqPbM5hZ5seUpf3xLEAEyCJimjZu5Yge2Z0A5L
   61hWE6w78yLba1SUAMfsVRzPP7JgHleejhaGtK7YSO66Kr4ghjkcnNX1X
   bTvvxYTbmgnlOa2Mz7eSh0LlDRnXFfAdWZ/xOScGrtetLAdG+JTu0xqx8
   ecHnkqcWC1QVDhXkAuK1IejOk3k+F2d1UbA9NQ3Fp1ZrbNPwzQKtb68cy
   N713iQP6rrRll9d4v0H0IsFZVN9ERb1Cevig/E+NkxJOPppZoLuLISR55
   WDGeXjhfDPDYQOWVdC/yqmSjUf82WnXm5rk7F/yOxG+0kxwmYiE8DQI/y
   w==;
X-CSE-ConnectionGUID: sNns5gecQte+u1sErcGorw==
X-CSE-MsgGUID: a76ynmfDS4+X8Q3DhgIMjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73944966"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="73944966"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 02:16:57 -0800
X-CSE-ConnectionGUID: /YePKbaAQqOnJpGKETfBpQ==
X-CSE-MsgGUID: SsDUJ4V/RSWEXindqP2XWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="217169453"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 06 Mar 2026 02:16:55 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vySEn-000000002EP-2V5d
	for oe-kbuild@lists.linux.dev;
	Fri, 06 Mar 2026 10:16:53 +0000
Date: Fri, 06 Mar 2026 11:15:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [conor:tsu 3/10] checkpatch: WARNING:REPEATED_WORD: Possible
 repeated word: 'represents'
Message-ID: <202603061131.x4pVymuT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git tsu
head:   d02eccea1850fca7b84d1f0cb36842a36d72863a
commit: d02da7a66bd7eadebc7d6236ef38637791eb3ed2 [3/10] net: macb: rework usrio refclk selection code
:::::: branch date: 34 minutes ago
:::::: commit date: 34 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260306/202603061131.x4pVymuT-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'represents'
#28: 
Change the new capability flag so that it actually represents represents

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
