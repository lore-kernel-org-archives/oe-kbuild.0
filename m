Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0313A480DD7
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Jan 2026 12:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768998628; cv=none; b=VE/ocDpsZpB+zSYdO3fLkmEb79litPm4/QSeE2G/VIcZXwqDejDjxt/PHSk4CptjlMdImSlP1qzO0T9pblUuKxpVJKTFCzFpxP9jrbZpenRkNzxxZw3UNRKWJdplJXtpm6xguYnRYlSzCKncHrqpE3vgDrHyEwZWSgo8hbpaP0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768998628; c=relaxed/simple;
	bh=X5HmN3ATREOMK5RHi2btadpvge9pkRs3u+ga3jtzblA=;
	h=Date:From:To:Subject:Message-ID; b=JQ1cbMRZGNUI5RKY0i26UHWnrmBshX2Hw9fsRGC7a3n7bmIcZYBlnSFPxUPTASDaeSOTCnFp+K8aLBeoKMBtijJs6AQ9sFPUpb/6+vEGr2VYGQcOwTLLnKf/uYUfxeTtvjaizvKKqv4FSb7YkVI0ll6JBujkEJwvGjC0Wcp8f7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bDNWMG0I; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bDNWMG0I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768998627; x=1800534627;
  h=date:from:to:subject:message-id;
  bh=X5HmN3ATREOMK5RHi2btadpvge9pkRs3u+ga3jtzblA=;
  b=bDNWMG0I8+E/oN9bJFQk99T7h0vTwy8P5XGo1zNsTgySDiyDAtolt25O
   r+dRcvMGvwSoHbJMAL4fKLyAQsM+GLb2fPzj/d863LDaOQGHo8pOd1FGM
   +Q+fzg8l98moQznK4gBL0ljh1UMGPtaWcGxWB2MvtGEBLGYtN3R7aFb+8
   jGGYiXqfJ6W5CUD43LiocolzHVWmWlZIEtFfQ9iYO0q8pnfL/LMTFWd/E
   PeRYBqKpDyHe64loZT9ompq2mJwCDBB6Edju9NPRaDQeMRaLsMd1/vsBB
   Dcvvb749ooqh/kS29EWHLO4E1IlkYDpH6GvNoPzKdjx969rT47p19C9jW
   A==;
X-CSE-ConnectionGUID: antbhwkdSFeYbjkhANv8qw==
X-CSE-MsgGUID: hvshQOa+SuuADgRK/VDb/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="69241211"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="69241211"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 04:30:26 -0800
X-CSE-ConnectionGUID: vUoeTNduSEKfvzaJAtZgXw==
X-CSE-MsgGUID: Ylx+y3ESRt6sse4wtT0J+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="206498536"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 21 Jan 2026 04:30:26 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viXLr-000000000HN-0HwO
	for oe-kbuild@lists.linux.dev;
	Wed, 21 Jan 2026 12:30:23 +0000
Date: Wed, 21 Jan 2026 13:30:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [djwong-xfs:fuse-service-container 39/91] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'code'
Message-ID: <202601211351.whHauqL6-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-service-container
head:   7c9264079abdd8c696eaf2f52de323ec31015a30
commit: e6b929af79a62e5ce46e25a81e2a623fea36d5ac [39/91] fuse: make debugging configurable at runtime
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260121/202601211351.whHauqL6-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'code'
#28: FILE: fs/fuse/Kconfig:104:
+	  Say N here if you don't want any debugging code code compiled in at

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
