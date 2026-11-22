Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795343093;
	b=f5F3JZlPzPnDjmd0iZ14hGXmaz9Nsi2lxWGoqoqi+uwdXZrRl2muQU4sRUAh2n4GuZCn
	 gs+cUIk9EO+W7vJYEHs4QfE7Hfv2wnBu1JpcXK5DSYKYH5xMgkw90yo+Y1La/cZr7NuWL
	 gWdXdT8wKgg4hwFqCNifgNctrZE1VZm4/74AtJm7qEVFLNAxotEw9EIlSOCrHHl+TIOr2
	 RngAALQ5Bmb6BM6fKnPZFD4OT/eqmmGpLsiUjRuPVmvp4mVQ0WsGHigZIw73cpSs4Kzbc
	 iyixUAOoP7D/weFbgIbdzV7HlJkn4GFHuFmhYfB1znCAoykC4rA8dCqERhe3tW0mzBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343093;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=uUymx2gvbB1g9LpFII/3WKud2WQ7WTVU5KHeJ82S0iQ=;
	b=V9VLHvTFfK1jlNijCRLVr9I+Y3ZVoFvCSfZnouEMAgLElliSblpy8R+XUiXkSkK8AroG
	 8ZucV2elXPVyPVkDfcWfqn1BYO0QcraOqM8cQ+rHYBDkTV63tg6Ooa7kzucKumbZgP5vi
	 eACzqSwKhmyu/5ONtHVVZdttDn7MehMR3qL9jKw+zV6vZwAdd7O4HBCktjl2i1XCjQcAx
	 9rD2YjS2+y+6/2LnWJVI9Hthtc1eszysk6aoQlQVOELK2zp6XvyxlD3rh4x6htMVj1iDp
	 BwsboX+3QmYhdY7AQTYQ7xXjtoFg3svI2QY0UIOmxAtxHVpaVaCyB9SNOEikQI3OtOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=elBCdZeG;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2828606A320
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 10:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2828606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=elBCdZeG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795343092; x=1826879092;
  h=date:from:to:cc:subject:message-id;
  bh=6J+rz2nlX1CsKCN+7GWYfMpQ3m4vsPj9SXstUr7pt+U=;
  b=elBCdZeGckhSH2fW4AeEUM2fEjhD/Q7i5G4YtJpl6xOIIvy7xlvEgXIl
   pxKazWPGPza9vpQ63o1D+5VZzgepTudT7tfSu9QZ9zfLZ4ojAbBlTE/yi
   6odhHDmvmrqOWNr4j7wXKxd49UoZEeQ5E6gfnHw++wx/sjjNtD+r51lsJ
   C67ksty3TSyzho2krDPRNS2cfB8e4viwSQ+4iWRG1mgmHSJQZtEGhv7By
   m08vCzjIEuafnojSIwrqSy4dp14XCUPOpsJMOEp9nPcqKtTkhFEhGkWPx
   byp/f7EavtCjN5JwLwbSGLO6qVF8j5fKO5lQ9WgUuz86PBGX8WXSDCURP
   A==;
X-CSE-ConnectionGUID: LVnj6eOGRBe49mJ5tFfKyA==
X-CSE-MsgGUID: OFMSIQJKSUKz6b1JvTHRkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4075185"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4075185"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 02:24:52 -0800
X-CSE-ConnectionGUID: DW6lD0q7QrSdIxhmf8N3JA==
X-CSE-MsgGUID: ggLcbmoeTLqQ2tQenEW6xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11641678"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 22 Nov 2026 02:24:51 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xV4kY-000000004Xh-1hXw;
	Sun, 22 Nov 2026 10:24:46 +0000
Date: Sun, 22 Nov 2026 11:24:07 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ERROR: modpost: lib/zstd/zstd_decompress.ko: symbol
 '__st_r13_to_r22' undefined!
Message-ID: <20261122111656.SAlv1A4Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jani Nikula <jani.nikula@intel.com>
CC: Nicolas Schier <nsc@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

Hi Jani,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4843f6873f7c4835e62f2c73ba0fd538e57a2f22
commit: d900723d78adec229996aefbab0dcaa66a177b77 modpost: use mod_warn() and mod_error(), clean up logging
date:   3 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 3 months ago
config: arc-randconfig-r2305-20261122 (https://download.01.org/0day-ci/archive/20261122/20261122111656.SAlv1A4Q-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122111656.SAlv1A4Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d900723d78ad ("modpost: use mod_warn() and mod_error(), clean up logging")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261122111656.SAlv1A4Q-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: lib/zstd/zstd_decompress.ko: symbol '__ld_r13_to_r23_ret' undefined!
>> ERROR: modpost: lib/zstd/zstd_decompress.ko: symbol '__st_r13_to_r22' undefined!
>> ERROR: modpost: lib/zstd/zstd_decompress.ko: symbol '__ld_r13_to_r16_ret' undefined!
>> ERROR: modpost: lib/zstd/zstd_decompress.ko: symbol '__ld_r13_to_r21_ret' undefined!
>> ERROR: modpost: lib/zstd/zstd_decompress.ko: symbol '__ld_r13_to_r19_ret' undefined!
>> ERROR: modpost: lib/zstd/zstd_decompress.ko: symbol '__ld_r13_to_r22_ret' undefined!
>> ERROR: modpost: lib/zstd/zstd_decompress.ko: symbol '__st_r13_to_r15' undefined!
>> ERROR: modpost: lib/zstd/zstd_decompress.ko: symbol '__st_r13_to_r16' undefined!
>> ERROR: modpost: lib/zstd/zstd_decompress.ko: symbol '__st_r13_to_r24' undefined!
>> ERROR: modpost: lib/zstd/zstd_decompress.ko: symbol '__st_r13_to_r21' undefined!
WARNING: modpost: suppressed 9 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
