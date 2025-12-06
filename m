Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA451991CB
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Dec 2025 11:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765020122; cv=none; b=h81TwCinrfKYPWQOOZTYrtAtY4NOnSWMx1FYWZl++FRJleEXkQNQufezif0va9Umr9H2Ala5Niu41Fej9x5rgQhqyhcmql8SxyGmg+FW7hCUUW0FPA/gSpPoVvjDyVLh9maVK3GTUG+ks4NLCiS7twEl1aK1eAteBKoCHqeeJyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765020122; c=relaxed/simple;
	bh=Xf82pzK0SylzWep5M7nbPp/SbVUWZUxvW+vc1pm2E8Q=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b7REQllKfYcRkZdlhtx17Yy0y08/itiFDFjsVKyG4V41tQrPL2GwKo60H/AkEuEAzsrmKkCSasRPHb74x30yE+ulEtVXvhgBfNQvHOn8K0KehKMVwNmXO9z8XmieHXQ79egcT0c2LOpyla5lSVz0p6OJ+F2PtZtnt+H1NUU6N+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HzfUrTsc; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HzfUrTsc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765020120; x=1796556120;
  h=date:from:to:subject:message-id:mime-version;
  bh=Xf82pzK0SylzWep5M7nbPp/SbVUWZUxvW+vc1pm2E8Q=;
  b=HzfUrTscjuFdAs11gTNDAA82hKPsG7j0oiIVCSPmIOHlffp/KkQdIyRN
   qSv+zdMIpI3wybFRxg7C6tndtayDShXhnL8vd2lTJuOtvMqDpMJ+wqq+o
   yCBAID9VWJTnsn+dOpKd2cGW0yOVpa8+5H94yAeYIGUZx76LDBMxCqOP9
   LfPMged75M+pjjDFkFiF1F0dGWDMtAONAy8Soqr1/CpwV1Hf1ynCC4jR+
   Jbw8Bfdtt6g/FU9wxp3UjO/QXEIXz0uoSIHD0PKn2n3kp4brxxNuDWGpM
   +Y+HYR9Wp6R8IIpkZjip/3DnRmkgTcmsMSJPD7Kx733htUvPgmlxQtJoF
   Q==;
X-CSE-ConnectionGUID: md/littrQfG3hH/SqDiJww==
X-CSE-MsgGUID: tUh1c+KIQZmny+xZ2K+42Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66037511"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="66037511"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 03:22:00 -0800
X-CSE-ConnectionGUID: /QoERlXFSoWoYGfqmdfAUQ==
X-CSE-MsgGUID: hTg/lbgTTDak1948YvsLgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="194571470"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 06 Dec 2025 03:21:59 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRqMP-0000000015d-0Vso
	for oe-kbuild@lists.linux.dev;
	Sat, 06 Dec 2025 11:21:57 +0000
Date: Sat, 6 Dec 2025 12:21:09 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [mingo-tip:WIP.sched/flat 19/30] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'use'
Message-ID: <202512061243.AosltlSd-lkp@intel.com>
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
TO: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.sched/flat
head:   a9e4ff7145df4680ae7248b450e4814be8f9256d
commit: 5fe1c96fb67797cb81a42c1da208cef08ab32b39 [19/30] sched/fair: Introduce and use the vruntime_cmp() and vruntime_op() wrappers for wrapped-signed aritmetics
:::::: branch date: 32 minutes ago
:::::: commit date: 32 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251206/202512061243.AosltlSd-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'use'
#30: 
In the vruntime_cmp() and vruntime_op() macros use Use __builtin_strcmp(),

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
