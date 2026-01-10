Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872F923B638
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 12:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768046637; cv=none; b=EDYzrIr/5UccRtmqjTQAAOSehDFupZNgGX6eN/e86mCJcHWXREYKH8WP6NpMHivPdBSOS/99f/VFJKsCT+b6wuycZOVKVaGMPm4RV28+CHXHrypgjTeBaZya3iNdIotns77IJ5VNCBpSzX/3jUyuuvPNQ/tgOIfnwDKgz7kB0Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768046637; c=relaxed/simple;
	bh=AXZnIOWjCz0Hc2Cgix/Y46dX3M4zTScaBhj17jCbFVs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SD5k9Ogl74+dx4xyHn/+W8OjVc8NUOaMLJwGb09XiKYPknsbltuJsYNSs2TeLDBZFIgP2YgkFt/5jNsTxLfcGWpeBHcj8b5tOiB466aZzfYEJiETJtM8U9S5oLSp9Ua06ae98+jtuudoaplsClJHRxZVRLDUoN5juokvkKgbBII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kNxYqult; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kNxYqult"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768046634; x=1799582634;
  h=date:from:to:cc:subject:message-id;
  bh=AXZnIOWjCz0Hc2Cgix/Y46dX3M4zTScaBhj17jCbFVs=;
  b=kNxYqulttX/N8yg0TqACTO2J8W0M+ovkzY4YwXOUoGibp+lwOYd7eJsB
   LuBLyN2+wEpKgJuo7M6gKkmpzsa7B5ypQThDNnFNPNO1P8vnVNNLlIlt7
   BIpZCkiTyleHiVtXslCC9G5kquuLfPNnM86UnbQBe6C7kj+ecGyZAIo0n
   SNale7RZHfgatPeABvi+azhPOZb1Z4h25cxIqZMndCO6COw2wM/EIacQF
   yR3NgEcBBcxK03tYgEVE0jcf+cwJyqJegJmPCJ4CfXTaV0y2/K3RIx4U1
   dxCBP1VsKH+5MIBIsPb6J9HsnWl5qj11iwPEPC15ZwrFvjm97N76WDn8v
   A==;
X-CSE-ConnectionGUID: B44nazhmS5Ojf/neLd7xew==
X-CSE-MsgGUID: y5x/dqq1SHeN1XBZO35GVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69386378"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="69386378"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 04:03:54 -0800
X-CSE-ConnectionGUID: kI7TrUX2ToqSeykv7BgzSA==
X-CSE-MsgGUID: KXpiXnJFT1O+Q5Cl/sVEgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="207827869"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Jan 2026 04:03:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veXh8-000000008cs-45iU;
	Sat, 10 Jan 2026 12:03:50 +0000
Date: Sat, 10 Jan 2026 20:03:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ebiggers:wip-aes 2/53]
 lib/crypto/tests/mldsa_kunit.c:436:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601101941.XTccLEle-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/crypto/tests/mldsa_kunit.c:436:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Eric Biggers <ebiggers@kernel.org>
CC: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-aes
head:   237c28fcac1381425254d1af768fb806678910bd
commit: ff08ac38bcf2445e5b247c482e94ab3aca573382 [2/53] lib/crypto: tests: Add KUnit tests for ML-DSA verification
:::::: branch date: 9 hours ago
:::::: commit date: 5 days ago
config: sh-randconfig-r113-20260110 (https://download.01.org/0day-ci/archive/20260110/202601101941.XTccLEle-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601101941.XTccLEle-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601101941.XTccLEle-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/crypto/mldsa.c:651:1: sparse: sparse: bad integer constant expression
   lib/crypto/mldsa.c:651:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   lib/crypto/mldsa.c:652:1: sparse: sparse: bad integer constant expression
   lib/crypto/mldsa.c:652:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> lib/crypto/tests/mldsa_kunit.c:436:1: sparse: sparse: bad integer constant expression
   lib/crypto/tests/mldsa_kunit.c:436:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   lib/crypto/tests/mldsa_kunit.c:437:1: sparse: sparse: bad integer constant expression
   lib/crypto/tests/mldsa_kunit.c:437:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"
   lib/crypto/tests/mldsa_kunit.c:438:1: sparse: sparse: bad integer constant expression
   lib/crypto/tests/mldsa_kunit.c:438:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +436 lib/crypto/tests/mldsa_kunit.c

ff08ac38bcf244 Eric Biggers 2025-12-14  435  
ff08ac38bcf244 Eric Biggers 2025-12-14 @436  MODULE_DESCRIPTION("KUnit tests and benchmark for ML-DSA");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
