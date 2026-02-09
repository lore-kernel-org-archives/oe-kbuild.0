Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83023859DE
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Feb 2026 17:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770656876; cv=none; b=UO1sta4OgRQRRA865zMcAvhaIYAstw/ewgfqy22tuF+O8wM7uzH4uzTEluTtc+dfQmaTrE91LcHpvnAwO01wuUNVCcToZCnVxXXtxIL6YZHg/VcWg9lH/dNtVdIrAqt61kSMRYjmp5BjxLE4++Auf8KwdVbzdS6i70dApc0f7ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770656876; c=relaxed/simple;
	bh=ZESEHgfwDjlRW7FIZ5gme3h3RjxuoCLG0F0TSPAgNqw=;
	h=Date:From:To:Subject:Message-ID; b=A81TbGX8CsyNvUca9L0Jtrw9f0V7f8bxd636wR1zsHRmWWWAr7P9W8GphlyWL2zY7duNDkHRF1FD33pbfMxFY6hA0BD4YdXP1yuwDL97kEBQI+/VqGDjQUhXJoLRV78LsiLde8fNGRMPX8EnQbwWliQ14SW+RWKwvzDXiC+i9PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AnhgmVwX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AnhgmVwX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770656876; x=1802192876;
  h=date:from:to:subject:message-id;
  bh=ZESEHgfwDjlRW7FIZ5gme3h3RjxuoCLG0F0TSPAgNqw=;
  b=AnhgmVwXxX8MnEbkMtOTZtfmtRBrnxU6EoGIsoc6FFBfxm1EwUzeJaM9
   MeafbUg7GyobrrxG6sZHaq2cddAF97x80ARaRn6aP7fkpmjRyx5Wx/GlO
   aa11O2HaTG+ehUfBDPXJppzXOCVspgpZp7A9Y5ioTJ96i6sfm4qRKZzXN
   V2Nv4fm7nS3hPRStDZ/6xGKUTIg6zorcW3IafQv9gx+3nCXP/vMxStwJu
   jx8ScHDVWw1Zf2XstHnNtyY5hIs/uRyDzcwCJ7BGrr1Ua2Zzdgbe3l5Gq
   5g9foSTWRAXFjTkvf3yiDa4cGAM547YQEqqqMHK7Fx3M52y7bRW8A7Veq
   A==;
X-CSE-ConnectionGUID: 7iZ/XdQ6SiiwiyCXiIDMQw==
X-CSE-MsgGUID: nXZIitphTvuuZ5HXcVUPqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71492586"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="71492586"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 09:07:56 -0800
X-CSE-ConnectionGUID: loBf0RHCSIC3QlVU7HEEUw==
X-CSE-MsgGUID: 1w1yBqYnTQegbj0e4k+dYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="234588784"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 09 Feb 2026 09:07:55 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpUjo-000000000KD-2gDX
	for oe-kbuild@lists.linux.dev;
	Mon, 09 Feb 2026 17:07:52 +0000
Date: Mon, 09 Feb 2026 18:07:02 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [gdamjan:v6.19/imx471 3/5] checkpatch: ERROR:SPACING: space
 required before the open parenthesis '('
Message-ID: <202602091841.HswmeUMH-lkp@intel.com>
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
TO: Serin Yeh <serin.yeh@intel.com>

tree:   https://github.com/gdamjan/linux v6.19/imx471
head:   103cd095452bd7b6091b71ab56cfd41af826e6cf
commit: 7bdc415a14aa3dae7319a71be9e1fdb3b2f565ca [3/5] Add IMX471 mirror/flip functions for fitting camera module's orientation In order to meet Sony's init table and flip function, also modify registers as a better settings.
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260209/202602091841.HswmeUMH-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#125: FILE: drivers/media/i2c/imx471.c:451:
+	if(ret)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
