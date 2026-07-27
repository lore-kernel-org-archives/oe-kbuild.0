Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DD5351C2F
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Jul 2026 02:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785118551; cv=none; b=d3eWeYGnIWkzM7eegGp4mYtv/ZoC3Oqq2RLkFp2F3DNUI2hDeJk8g4lELt0B4iqO78hYMOPGSopIVkoJi+f+qF6/5jHOp8pi3xr+ewCjbHcigCwLYZSGpsgvNK8xlb0SZRoobSr6bs6im5acKbFH8d0jgk2wAjvmocd/cyRU0ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785118551; c=relaxed/simple;
	bh=eqncbyKvaypgO7owHdxikLBbAb/xuQsUTwjTGre6eKA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pzp++MriCI3nQdv7m2GMK/ZQeOTFBrkXox/+JIeLESOkIjFJ+2+xtRYhUKnz3D2cVqf2nUI+IDB/dK1IgKdBSPWjWy81vO+BxqjPDg8ddLORxJTp/Wrk7iWAdFEpnqF2TMa3ed5c4t17cbdGnuixIiocBCarcCElCfIMxxq/tAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bhmogCQC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bhmogCQC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785118548; x=1816654548;
  h=date:from:to:cc:subject:message-id;
  bh=eqncbyKvaypgO7owHdxikLBbAb/xuQsUTwjTGre6eKA=;
  b=bhmogCQChmF8pnNkAaOTZd3+fCjsODWzmYsh2R6FcENbwH9acMTpNsy8
   kK+hnPxyV1DIDaZ4uAjS90cMUtAD/KHFb/G9gEbm6gGi4PLOrGrqMeHHY
   J1ur/jr1mXXJcjQRtZR6tSzP2VqldVFhwML1XtLTy50uqdC4oG2+PM7WG
   8DS36WifHhoWRoynbSyB0zl1iCqdzSFjmp6Nse/vW9+ofmUsBK6tBTDOu
   YV0QzgXULD36fBt0UImbf9pSn4FLdA4t0u/4tZyyKsR4BrxIhmse8wim6
   ZC+5MphCl71TBjUI58gTuKbwNcyn/ZPYnnkvDnvQ6YxTRAGBM9oz/akYx
   g==;
X-CSE-ConnectionGUID: TTFG/ajkRbGj8OWHJhOmrw==
X-CSE-MsgGUID: HrG/VC5ZTYGKetW0Fnn3lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11857"; a="85767778"
X-IronPort-AV: E=Sophos;i="6.25,187,1779174000"; 
   d="scan'208";a="85767778"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 19:15:47 -0700
X-CSE-ConnectionGUID: zWTRIsiuQG+kpKCdARRVHw==
X-CSE-MsgGUID: pwUN8A7aTr+7SemdPWbh4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,187,1779174000"; 
   d="scan'208";a="263574359"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 26 Jul 2026 19:15:46 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woAsT-00000000crV-00VT;
	Mon, 27 Jul 2026 02:15:39 +0000
Date: Mon, 27 Jul 2026 10:15:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/netfs/fscache_cookie.o: error: objtool:
 __fscache_relinquish_cookie+0xbc: can't find jump dest instruction at
 .text.__fscache_relinquish_cookie+0x268
Message-ID: <202607271026.iTrcAuhf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>

Hi Josh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0ce37745d4bfbc493f718169c3974898ffec8ee7
commit: 1fd1dc41724319406b0aff221a352a400b0ddfc5 objtool: Fix ERROR_INSN() error message
date:   5 months ago
:::::: branch date: 2 days ago
:::::: commit date: 5 months ago
config: powerpc-randconfig-r113-20260727 (https://download.01.org/0day-ci/archive/20260727/202607271026.iTrcAuhf-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260727/202607271026.iTrcAuhf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1fd1dc417243 ("objtool: Fix ERROR_INSN() error message")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607271026.iTrcAuhf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/netfs/fscache_cookie.o: error: objtool: __fscache_relinquish_cookie+0xbc: can't find jump dest instruction at .text.__fscache_relinquish_cookie+0x268

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
