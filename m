Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777321A9F97
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 04:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764389226; cv=none; b=OXHGyoLsXYecVfhWfI5GWhFkHlWyMmauqs+wGpu0WBtU5jwo8E0kMmRZF2ZTY42E9qQcybAjPkeQWppvgKIjPdywSg7D7qVrvMbStqaVXlrlurpUad2p9QOa340p5BW8vmnBrOcalXrIMTmsNxZSxX69m9jTQ+Rs9mOcMBfXlwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764389226; c=relaxed/simple;
	bh=2n3Z3YkCiXENgySAfBjWoolO3vfi016Vk7d7uPHtBB0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rBxYUf7iMdGxV+Q1vIrB4Jun/a/zeH0s9P7P6DJkEmJforW/sBJHIGntQi0exvV+EgMA7MefFzvwG+MGfyZYjAKi5dS+mFX7Sgbxk/c6+LGGxiRibJLDM6cd2HOWVqCCHt9RDdBefbLY72D5RyrhErXKhqf1oZeaR5chavbNDR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JeWSp6wn; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JeWSp6wn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764389224; x=1795925224;
  h=date:from:to:subject:message-id:mime-version;
  bh=2n3Z3YkCiXENgySAfBjWoolO3vfi016Vk7d7uPHtBB0=;
  b=JeWSp6wnXPAH66r875vz+M7M/UmPlIyReEDMNHfz66xWBWwhn04pH3UM
   0FYzh3Y7mn4QOEnSULmpHfzDbkCtCx1cDaG6a603MFb5XCG/s12TU6WdN
   D/kAMZaRs3r/pD8YUUfviu/GWMqJzPb/uiwmTf6DsXJI2IE4G++G4+eFh
   sTbmDwW3glZ/oG3HbhV1g3HLPuczzHKmGpm38/3IeO5eFYcAl3XmzBArG
   hfaARvkpRtzp4vWr8Z0UzseqIXgkj90wXEYe0nkjljDOqLYKPzhysrYfp
   a9+1LEvSNKzqyr/y5VzH56A9o6R+Q4rbV7Nea7tZMOnepJqd2fwC8AUYk
   Q==;
X-CSE-ConnectionGUID: uT2eqit3QC+LKSR+0Pp6Yw==
X-CSE-MsgGUID: hjbf0V9dSMKMF25KSR/uOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="70023991"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="70023991"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 20:07:04 -0800
X-CSE-ConnectionGUID: o1juyDgqSqyzCf4twqlSyA==
X-CSE-MsgGUID: neZaTsX6T5iGTQ00mBIiiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="224533621"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 28 Nov 2025 20:07:03 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPCEf-000000002DH-0W4b
	for oe-kbuild@lists.linux.dev;
	Sat, 29 Nov 2025 04:07:01 +0000
Date: Sat, 29 Nov 2025 05:06:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-hotfixes-unstable 47/47] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'Koen Koning koen.koning@intel.com'
Message-ID: <202511290532.H9DYSNnh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-hotfixes-unstable
head:   74e4e99d88bfbd6b8d1dc8ba9da703bcefa9485a
commit: 74e4e99d88bfbd6b8d1dc8ba9da703bcefa9485a [47/47] idr: fix idr_alloc() returning an ID out of range
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251129/202511290532.H9DYSNnh-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Koen Koning koen.koning@intel.com'
#17: 
Reported-by: Koen Koning koen.koning@intel.com

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Peter Senna Tschudin peter.senna@linux.intel.com'
#18: 
Reported-by: Peter Senna Tschudin peter.senna@linux.intel.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
