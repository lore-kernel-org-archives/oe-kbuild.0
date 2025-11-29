Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4859611CBA
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 05:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764394087; cv=none; b=KKUh63+Rl6oF+UMVLx0YzrYohb2QXEI40wy1HdEhDyLO5EAEBRj0f2Y/+92Hs5RcEWTvCbEzzZ72ii/teOcGceKNPqxS/6rNXqGpfBp3E36XC7F/Bc3uKroH/chqLDLSZ9zwdME0kJWsAM1XhCUVIcqKjyd0BWQEtJVPZGr3a1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764394087; c=relaxed/simple;
	bh=hQshIk8daGeZcgMj1zFOZTEQ6JKbeuLyzw0s/kRpC64=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oRjJ9vDNKKGlgXdKOHx2+rcaZlT5hLLU0meZuhosi5BAd7zWCbV7bueMoYOje4zoMjXi9tiowQ1mAj+5XyXd+J+hP1ofVXn1Kv0AUMhCCHFfiBVxQRbHQI2ZM23ljVC2kvIFLcxqk4FEldp1SmRELibpBZDrTM8DdpZS40sBFok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MfHQUGpg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MfHQUGpg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764394085; x=1795930085;
  h=date:from:to:subject:message-id:mime-version;
  bh=hQshIk8daGeZcgMj1zFOZTEQ6JKbeuLyzw0s/kRpC64=;
  b=MfHQUGpgWnw50aPrg8xEnaBz+leMP1Ko249n0vxZ5/rsxA5yN5gcVITT
   vamhaQEe72770Ue+oCGcHiA9b2Fi4K6z4JT78BUhxrG3clea+7MOuM9vY
   SPLIgLkuZGop84biCqSqYnNBKBJv+e8QFS5/kb6G/VLoV7IROZFNh18VR
   B20+JijLB9dVD3ceTDgLrosGs1tRBF6u8EmQIsr/lOzTtaimJwkgf6AFw
   5vl+uMBwHqmiuUXUEZFhoP41dbKJGsnEn7JMKnf2sQDVvjYtFim04SI76
   urE6z0NZ5eY9u6q1yhmj2yS3N5FgKC64D7DnVcCzSOYrXOnV5U816aIiy
   A==;
X-CSE-ConnectionGUID: h0RO1DQqSPy6IgT+DrF6DQ==
X-CSE-MsgGUID: SmHSxxPPTpe8lD/mm1FsEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="77876822"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="77876822"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 21:28:04 -0800
X-CSE-ConnectionGUID: JXQ07Oq3RsenT2AGPHvy5A==
X-CSE-MsgGUID: DK6j5HakTbawUV3st4axcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="197926433"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 28 Nov 2025 21:28:03 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPDV3-000000002E9-2xgB
	for oe-kbuild@lists.linux.dev;
	Sat, 29 Nov 2025 05:28:01 +0000
Date: Sat, 29 Nov 2025 06:27:46 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sj:damon/next 101/102] checkpatch: WARNING:REPEATED_WORD: Possible
 repeated word: 'is'
Message-ID: <202511290619.LO76yGtH-lkp@intel.com>
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
TO: SeongJae Park <sj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   09441df640d26cf9228bc68c256ebf1f0e28669d
commit: 5e3fefed6d95bbe0b2505ad80309debcf09bc439 [101/102] mm/damon: add data structures for access check control
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251129/202511290619.LO76yGtH-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'is'
#45: FILE: include/linux/damon.h:862:
+ * @matching:	Whether is is for condition-matching reports.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
