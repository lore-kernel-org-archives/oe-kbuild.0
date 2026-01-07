Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669161E0B9C
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Jan 2026 04:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767761726; cv=none; b=l5nT2ptpyUXOUhWnwXCP1aaooPH/DQxLHLl4jAHDkgQw6tmJZO2ruJiQhLxnVyiqvYTY/Ra3QdBDtDbpKvHVgUkycUT9mk7WZX2BPgomTzy5EU8G0JJya4ArBesqo26okJBw9XNR1Dj2RyAS8K2XUR/IKXcHQBni7L0lUx4PNCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767761726; c=relaxed/simple;
	bh=7pDswHykwRamCV6wTodQzWkF5tdaHVJTLGVjL51zU4U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B1Bl36V+Tn77An3M01e/tYALcOJPXhSeaOSC8HZ6FfWA2qDqTm+8ceMtAdJiqdA3F0gaNj6O5JptkaGg0IOVvvMp84MKHRCFGZAA4pZK5TPPjdUMW8iTPelq/17sxgub81fJ8xNd/yUuLwzQ88Imxfc/5TwJ/1lVR5eDEcTZ8oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DqP/8BWP; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DqP/8BWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767761725; x=1799297725;
  h=date:from:to:cc:subject:message-id;
  bh=7pDswHykwRamCV6wTodQzWkF5tdaHVJTLGVjL51zU4U=;
  b=DqP/8BWPHY8npqmQR5ipGAdDHut0p3IDkuhTIs7SY0ddF8FSzdZHojGK
   0c42dz0aRhmcq+4lIdPZNZCuke6ZoWTbaX6wftNMOS1RmMkEfaS9PxS2k
   4y41Y9PsHJxID8SgIJRasCPuU3pO3HKPIihnFLU69AC5EBuuMKrAJJFVD
   kVjPNDlIB5zo3jS5062p34E4H5asGcjmB6uU/xgt6BvteKISYby/DG2wu
   QRNS0u8jFxRdd81en15yqYEb/upvhq6X6NdKFju8fD1gOexizDrGymcZe
   ExiA4QrqO2ZF8JPlz+00CpYgIh5CdDEW5T+MhehCtn+eSdcc2FnDFGZEb
   Q==;
X-CSE-ConnectionGUID: RQquZpAXS5am14qoeV6VfQ==
X-CSE-MsgGUID: VDE+fTB+SAaekRalZ0ss0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="72976234"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="72976234"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 20:55:24 -0800
X-CSE-ConnectionGUID: wigIcWEOR0+kFPj+/gUipQ==
X-CSE-MsgGUID: t+dD1gV/TT6ljLYhJsmrRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="203272071"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 06 Jan 2026 20:55:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdLZn-000000003TZ-2qbP;
	Wed, 07 Jan 2026 04:55:19 +0000
Date: Wed, 07 Jan 2026 12:55:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [glemco:staging_rv_mon_kunit 23/29]
 kernel/trace/rv/monitors/boost/boost.c:254:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202601071233.EZG6CFgX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/trace/rv/monitors/boost/boost.c:254:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Gabriele Monaco <gmonaco@redhat.com>

Hi Gabriele,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_mon_kunit
head:   aa87c6b5e8020a853fbc2444ded06a93a7fc1493
commit: ad03d89dd5a100dd72dc46322621d23e788d34f4 [23/29] fixup dl server models
:::::: branch date: 21 hours ago
:::::: commit date: 5 days ago
config: openrisc-randconfig-r122-20260107 (https://download.01.org/0day-ci/archive/20260107/202601071233.EZG6CFgX-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260107/202601071233.EZG6CFgX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601071233.EZG6CFgX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/rv/monitors/boost/boost.c:254:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/monitors/boost/boost.c:254:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
>> kernel/trace/rv/monitors/boost/boost.c:254:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/monitors/boost/boost.c:254:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   kernel/trace/rv/monitors/boost/boost.c:255:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/monitors/boost/boost.c:255:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   kernel/trace/rv/monitors/boost/boost.c:256:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/monitors/boost/boost.c:256:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"

vim +254 kernel/trace/rv/monitors/boost/boost.c

13161c403ad0c1 Gabriele Monaco 2025-10-29  253  
13161c403ad0c1 Gabriele Monaco 2025-10-29 @254  MODULE_LICENSE("GPL");

:::::: The code at line 254 was first introduced by commit
:::::: 13161c403ad0c1ac5fa0a25fb5503b6a47abb99b rv: Add dl_server specific monitors

:::::: TO: Gabriele Monaco <gmonaco@redhat.com>
:::::: CC: Gabriele Monaco <gmonaco@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
