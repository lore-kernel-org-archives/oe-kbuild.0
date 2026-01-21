Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7940E30FF33
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Jan 2026 09:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768986412; cv=none; b=JjT3/g26tn0IWGl7QoCBj4XwM/bCachG8Anuw9nTYBV5mqPNppSJzn9hmL9wjOdBYy7zqsz/m0KjBEWwrhk9cTqr5CEHmWCjfdCFDJWDiaUtCiKRQ2iy3KZrHjq4ubcCUtTE0tieNFQ3n+RT/yM4+nKaActHbxIFthCmvnqZsLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768986412; c=relaxed/simple;
	bh=d/GvmDo3hxGV/731ruBD1p/OxIg53Sfc601omsBaf94=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lDl2Cil0S7VJpIPm29R/30lTQdbiSVBBjyqGC8zdzm1gAFJfvKZtREmCzTS6dQX1Q0qJ232PrqJFgPxQ94ZxGF6BpmsrShLZNXhQbIMkoFwGs+8Zg93zMqf8cGsMC4ipG3jWV2iRuRmjGRf6OKZMTi56wUIWZYt9fl7e/qXw4WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DomYJajm; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DomYJajm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768986407; x=1800522407;
  h=date:from:to:cc:subject:message-id;
  bh=d/GvmDo3hxGV/731ruBD1p/OxIg53Sfc601omsBaf94=;
  b=DomYJajm+x5gVgxhRJYPN8jOL650lWz/PlugQZ/zml+TXUK+/B0+1FN1
   9RwDeLFpZgL1uQiNAFQ7BXJhzyBu/Ij5BrAhltrE3oKqxzKFyeBaTZLlZ
   5ySIyrGQuqTQndlk0zfnz3nSnZFpk7PGNlC6voEdqth6nlEr7L9tFFKRr
   6MA4jxwtH6qSYsJYM/l2cxCzP711e9O80qydXqhjJr47sZLbfMCN3hgZo
   g9rsUijzfBui4lbUwMmDCQF9H+egStKtX9Ml+OpI/QLu2h4kcg+o0m6iA
   OcHVEJk9233rZQ2lXg+4UImv0HgaUDDt5IvrMQ0rCPxFkQUo8vuRa6N2F
   A==;
X-CSE-ConnectionGUID: kHsQjATHQVa0VlAYFNuVSw==
X-CSE-MsgGUID: FOUiWwBYSpmnV1u+hy31XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70262886"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="70262886"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 01:06:46 -0800
X-CSE-ConnectionGUID: Z6gxNzPGSOW+wKxnfN1gTQ==
X-CSE-MsgGUID: XQonJgOFQyOP6AoRXaBtMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="206211261"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Jan 2026 01:06:46 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viUAk-00000000QC6-36va;
	Wed, 21 Jan 2026 09:06:42 +0000
Date: Wed, 21 Jan 2026 17:06:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2141/8302]
 drivers/phy/apple/atc.c:2292:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601211737.81DOR2q0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/phy/apple/atc.c:2292:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sven Peter <sven@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>
CC: Janne Grunau <j@jannau.net>
CC: Hector Martin <marcan@marcan.st>
CC: Philipp Zabel <p.zabel@pengutronix.de>
CC: Neal Gompa <neal@gompa.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   053966c344dbd346e71305f530e91ea77916189f
commit: 8e98ca1e74db2ae051c9b545d42b879efa5a2f6c [2141/8302] phy: apple: Add Apple Type-C PHY
:::::: branch date: 16 hours ago
:::::: commit date: 4 weeks ago
config: sparc-randconfig-r111-20260121 (https://download.01.org/0day-ci/archive/20260121/202601211737.81DOR2q0-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601211737.81DOR2q0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601211737.81DOR2q0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/apple/atc.c:2292:1: sparse: sparse: bad integer constant expression
   drivers/phy/apple/atc.c:2292:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/phy/apple/atc.c:2293:1: sparse: sparse: bad integer constant expression
   drivers/phy/apple/atc.c:2293:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/phy/apple/atc.c:2294:1: sparse: sparse: bad integer constant expression
   drivers/phy/apple/atc.c:2294:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/phy/apple/atc.c:2294:1: sparse: sparse: bad integer constant expression
   drivers/phy/apple/atc.c:2294:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/soc/apple/tunable.c:78:1: sparse: sparse: bad integer constant expression
   drivers/soc/apple/tunable.c:78:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
>> drivers/soc/apple/tunable.c:78:1: sparse: sparse: bad integer constant expression
   drivers/soc/apple/tunable.c:78:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/soc/apple/tunable.c:79:1: sparse: sparse: bad integer constant expression
   drivers/soc/apple/tunable.c:79:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/soc/apple/tunable.c:80:1: sparse: sparse: bad integer constant expression
   drivers/soc/apple/tunable.c:80:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"

vim +2292 drivers/phy/apple/atc.c

8e98ca1e74db2a Sven Peter 2025-12-14  2291  
8e98ca1e74db2a Sven Peter 2025-12-14 @2292  MODULE_AUTHOR("Sven Peter <sven@kernel.org>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
