Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6B030DEAB
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 10:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398477; cv=none; b=T8COdRB5fKVoKaRQn3W9QgKVe5jRS/ubPgQEK1tyY/fc7fu6EbbWV9ijN6enRNYTiIl0YcPFQHX4UXfUNWSX0RYhYqqeGBtNKaAFtHzPhuIlWa+kXKSnaHvBuBJjZUOc65aTdAcAqDKH2yo47mQpgkGnGB/sNR24gvuZTbjJvu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398477; c=relaxed/simple;
	bh=QxeBiZz7Gke8AjpwqTxePE7ym9rSy971udxew/1hLk0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k+PBAwfs8pAoHNuuGM1+tqBV4fVxUTGk7inLS1soLJMQDVU3XxkZ6ueGq2gWMwBLskv29EfA8AsXrRUF2GR+DpqFUJ0cEXK5EO1KUr3LvIvgGdK16i9kGukRVHhhF8yH+oQ3ThNjWiWCPiwjZc1M0pJRqx6kdtney3TQzzt7I08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U06Bu+7g; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U06Bu+7g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766398475; x=1797934475;
  h=date:from:to:cc:subject:message-id;
  bh=QxeBiZz7Gke8AjpwqTxePE7ym9rSy971udxew/1hLk0=;
  b=U06Bu+7g1vNuIdWKmat+960X7yLBxh6gp5yvck8tvmq3ENLGBdKccro3
   PADk9fw0E/iLcpcS5sOoQO214rY8W4IrAuspNtS1exyxxUmu64zpTClG8
   PTyVV06/G1wT9zpjYuQCFASz9LMxdcG6yVNoMYlwb/SEPykPSaHNgdVJd
   k9N1FOZdtadAWD4ywiU3Q9pZ552j5sdaTxiDt1zsQaaTcDb6Doudewb7C
   SmcEmaGogqc8QXzmT1hZVQx5LekxHUvEZ88K22AFqOgKzR1n3DUahUUKh
   dlLjCqNcg3jSayAGo82mUJCv3Y/McoFrmTzWc/lqOq44yfuxqrgYEH6T/
   Q==;
X-CSE-ConnectionGUID: RDjpvONGTFu0XEkPF2epQw==
X-CSE-MsgGUID: 0isIO/S0T3OLjmc6Qu1OLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68327063"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="68327063"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 02:14:35 -0800
X-CSE-ConnectionGUID: ix1beSrqQyGflfgM9hSz2A==
X-CSE-MsgGUID: h48epVKCRm6A98XCKBdrmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199794653"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 22 Dec 2025 02:14:34 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXcvm-000000000NV-237w;
	Mon, 22 Dec 2025 10:14:23 +0000
Date: Mon, 22 Dec 2025 18:14:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-nonmm-unstable 72/76]
 lib/tests/list-private-test.c:75:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202512221854.BGNwvTMt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/tests/list-private-test.c:75:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: David Hildenbrand <david@kernel.org>
TO: Pasha Tatashin <pasha.tatashin@soleen.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: David Gow <davidgow@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   b0c0ca960cc8d2661ca90c7a5ad22b92bcf3351b
commit: 167e34d7ff48fb64838594b29fc470951390461f [72/76] list: add kunit test for private list primitives
:::::: branch date: 14 hours ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-r122-20251221 (https://download.01.org/0day-ci/archive/20251222/202512221854.BGNwvTMt-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221854.BGNwvTMt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512221854.BGNwvTMt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/tests/list-private-test.c:75:1: sparse: sparse: bad integer constant expression
   lib/tests/list-private-test.c:75:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   lib/tests/list-private-test.c:76:1: sparse: sparse: bad integer constant expression
   lib/tests/list-private-test.c:76:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   lib/tests/list-private-test.c:76:1: sparse: sparse: bad integer constant expression
   lib/tests/list-private-test.c:76:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +75 lib/tests/list-private-test.c

167e34d7ff48fb Pasha Tatashin 2025-12-18  74  
167e34d7ff48fb Pasha Tatashin 2025-12-18 @75  MODULE_DESCRIPTION("KUnit compilation test for private list primitives");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
