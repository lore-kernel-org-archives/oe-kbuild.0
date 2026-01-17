Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE47253B42
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jan 2026 21:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768684822; cv=none; b=aq1TUrvTRO1RGAFIfUEvI3gnOgE1z2VtGfZMZMFB6yHpfmJT705whJ+8D/5tafl864fwK0NGJI7OGBvoM9HpPz0ZpUGUpGCwv8wNuYNe4UKonhCwDKDKSe8xi3S06ORVywM+oK95ehTK/q4Pn/8tczCxwiLbpUyasVUI0JLFhBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768684822; c=relaxed/simple;
	bh=wB0SgXXAdIW8iEep3P0HsOpFZJ5NY72Y2SY/kFcwnyw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZOKjUA2b+vmEKjafEyR+MaN67nsr7kKKAYdAauuzbzrWreeImSQnjMMu8wJtqSLO+sdyDDR+gsLTT5vI9RdUSzstJ1xUWj6smxseZPqtjLGBwNYb+BkBUgLyYsIU/oTg5mXgc3nOQe/WmArnIFQ4QrZgeOZ5HQhLIOvcujW2I60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UKhvD8jp; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKhvD8jp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768684819; x=1800220819;
  h=date:from:to:cc:subject:message-id;
  bh=wB0SgXXAdIW8iEep3P0HsOpFZJ5NY72Y2SY/kFcwnyw=;
  b=UKhvD8jp7EuDI1EJ5hhA0IsX1+nruRtjL8WPQmAZhnoWls9vOdtSmNi0
   CxiHvuh0kMyVQLiOsFzcwHBibwZTaCpuqULct3Shga1HrJKveH0E8WuAG
   EEso+oXcR83P0nBdwJcntXjKUUkJROSRK9RYdaVToYV616hBMe+U7At8k
   qgVP4VkhgkMLWp9WqCjHllEivRhzrchBb2C2xSVvZGuxWXzrx7nm6+OcC
   MzZsXnxRh10AhrCghahk+GlS06FrpslnJqjn/QexJf3lly/1y6fHJ8niD
   u0BMs8tRin5uIjsHksKeehCnW80+p1b4oP6S5/7ATOad4GeKUTCEOzvLO
   A==;
X-CSE-ConnectionGUID: tPLkui6tT+qsS1dECTeLoQ==
X-CSE-MsgGUID: nH9j4wFNRQKhJO2yENXPFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="73806236"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="73806236"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 13:20:19 -0800
X-CSE-ConnectionGUID: Ps6ahrXpQwSNu5hORi/2xw==
X-CSE-MsgGUID: ySiGb0bVTV62aeYbgVayEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="210539165"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Jan 2026 13:20:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhDiR-00000000MEC-2gVj;
	Sat, 17 Jan 2026 21:20:15 +0000
Date: Sun, 18 Jan 2026 05:19:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-nonmm-unstable 97/158]
 lib/tests/liveupdate.c:156:1: sparse: sparse: bad integer constant expression
Message-ID: <202601180507.eJetLj26-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/tests/liveupdate.c:156:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: David Hildenbrand <david@kernel.org>
TO: Pasha Tatashin <pasha.tatashin@soleen.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   dcaca77bf6d52becda62f4837a3b03bcce1a0766
commit: 30bcf37b0bb7d238b549d33ee3621724d0d2653b [97/158] tests/liveupdate: add in-kernel liveupdate test
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: x86_64-randconfig-r133-20260118 (https://download.01.org/0day-ci/archive/20260118/202601180507.eJetLj26-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601180507.eJetLj26-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601180507.eJetLj26-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/tests/liveupdate.c:156:1: sparse: sparse: bad integer constant expression
   lib/tests/liveupdate.c:156:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
>> lib/tests/liveupdate.c:156:1: sparse: sparse: bad integer constant expression
   lib/tests/liveupdate.c:156:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   lib/tests/liveupdate.c:157:1: sparse: sparse: bad integer constant expression
   lib/tests/liveupdate.c:157:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   lib/tests/liveupdate.c:158:1: sparse: sparse: bad integer constant expression
   lib/tests/liveupdate.c:158:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"

vim +156 lib/tests/liveupdate.c

30bcf37b0bb7d2 Pasha Tatashin 2025-12-18  155  
30bcf37b0bb7d2 Pasha Tatashin 2025-12-18 @156  MODULE_LICENSE("GPL");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
