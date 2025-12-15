Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7562020DD48
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 18:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765824003; cv=none; b=WbcXcRdMJ4gO6ldfqL0tptkoEYMuS0wY7X6p69e6Ri3YsqtV/d2rSNBBFy7+SHlsy5TgjuXRy8/sIiUvaIoqV0a2aLRp5mAWlHFPZa8TkrTG6buS5Wihetw4aXDSwhPaK77xuUXXjlk7o+CqJoKrU5/1ry3iukLFmOyDR3irsHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765824003; c=relaxed/simple;
	bh=IJ2Ba3LZQA81Ppijpu/UAqsp2khxNYYOAspiNMi0vXI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mLsRg7V5SchHKKe3s+ji7UZZbpsFKSrN+sARBpnW7hzfJBROKKz+/LMQs6vOZA9I8e3CMNCKcNP4RlzCMPbxFv8CmXR7cQ7CGYWCAokM40Z4t4I/KpiWMxnRUvKeJDscbQJmOX2OSt7O00wZdXBGsdJEAmOeT9/5LMpxV97U6Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F9+Wa8nE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F9+Wa8nE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765824002; x=1797360002;
  h=date:from:to:subject:message-id:mime-version;
  bh=IJ2Ba3LZQA81Ppijpu/UAqsp2khxNYYOAspiNMi0vXI=;
  b=F9+Wa8nEbTMhyk6ZZRZQkBnO2QD3Uszg3/dwlRLVjIfSEffjaKry9Fg0
   +8w9j1EoZtpOLDFxiLqhcqzbM+mBeO8mW7YDrd/1duuaAlMzib2jAl4/W
   i91u/cIsH7i27ctT0rmJUyvJ6uSG5J5HEowpkmERxEF6p06bYrFwbasGY
   waoCcj2CEEUC4opigVYZpLAkshEQ+kJd2OpTE7VLQPZqjlvS06eEm0Ois
   AiGawwN4lRqN1Sg9p9y0f50Ga85fZlcd+S4XOZrwFd7DPgagnabumKLnR
   VCVnQ7FT3Jh5BxNVg3FIhs7cIHIM+UKWK32Ujqs08GKUwR+Q1n31+u6i4
   Q==;
X-CSE-ConnectionGUID: yQ308ETITfmUV7X6c3dikg==
X-CSE-MsgGUID: mr9FuCfKTnClsZUowJ2oXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67488988"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="67488988"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 10:40:01 -0800
X-CSE-ConnectionGUID: Jhn8tssaTTWX78wrylEU3Q==
X-CSE-MsgGUID: AJXRVarITB26tY9rkvHQtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="235188635"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 15 Dec 2025 10:40:00 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVDUE-000000002jM-1vRr
	for oe-kbuild@lists.linux.dev;
	Mon, 15 Dec 2025 18:39:58 +0000
Date: Mon, 15 Dec 2025 19:39:02 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [melver:ctx-analysis/dev 1/35] checkpatch: ERROR:SPACING: space
 required before that '-' (ctx:OxV)
Message-ID: <202512151936.BMy1v7lo-lkp@intel.com>
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
TO: elver@google.com

Hi Marco,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git ctx-analysis/dev
head:   982f41984aa2e06402a8080e95499ae6c10a4e74
commit: 72a1167b7fe4408e6addda2d178b9b242eb1b228 [1/35] compiler_types: Move lock checking attributes to compiler-context-analysis.h
:::::: branch date: 84 minutes ago
:::::: commit date: 8 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251215/202512151936.BMy1v7lo-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before that '-' (ctx:OxV)
#45: FILE: include/linux/compiler-context-analysis.h:14:
+# define __cond_acquires(x)	__attribute__((context(x,0,-1)))
                            	                           ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#48: FILE: include/linux/compiler-context-analysis.h:17:
+# define __release(x)		__context__(x,-1)
                      		              ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
