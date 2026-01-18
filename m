Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2017623EA94
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 17:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768755606; cv=none; b=EbznqTCG6f/UxtfoIzHhCs2nOhGSpLWXLlAdH1Al7fQhNjy6qWR+ovuRKmWAwCKdVQjK6nJAsIXoyLdDk2ftODROb5FpGbbLfOao9hTGl4XDEfM++eE4i10/ZKhbUalNPmKjFnkph1MaNbM6mx9NShW033YzzLepcneLJQoIzJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768755606; c=relaxed/simple;
	bh=IDHG70WtMN0JDspavhPK23haFILLDqQoQGjJfRQk+PE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C9F4KhCAofzjm9AJLhUPVLjU/822VZAsglaw0SYMMpBvW7pF7nKq5j/kMNzGISYki4xVJsJJsbvjIR6XvARBWYYrDo6mC8FpjvWiQFFmYRkOgHImB0hVh0Gnr7A0F71dzY+inyxDOGCOaSPen3RI9FGH7CawhCNs9HqGAcdC4N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D1RViR4u; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D1RViR4u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768755604; x=1800291604;
  h=date:from:to:cc:subject:message-id;
  bh=IDHG70WtMN0JDspavhPK23haFILLDqQoQGjJfRQk+PE=;
  b=D1RViR4uqIUlGXuMX8tP0jkEYlKQsfRHPcvwZYdiS06q/6wZgPBmUxvM
   36d3tS0cdjxkh53ExGKnZcrfYgvwFP6cRHEceeuWKv+tziui3sFdDCYW4
   1f0GLdFHqjkPJBHJxzQGCSsRPguY7Q6UhHx5y2FI4wPks7B9HIDVh3UH8
   yp+3NcR5CMEOppdP10RCJ0fxcIcJrl6GMXA0ZfaCDqbzO79Q8AENhPubg
   Bk2Gv4WUBNw0QJ3AurCsCVp/pzkO9vKXttAh8QYXkFt0YZ3McUgPOSRBC
   N02ZhxIwnK8WTAGf1PFKftCKqQXHtl/GYbp99NKO7C7/F7g8KdcDq1He2
   w==;
X-CSE-ConnectionGUID: lBr9/CbgRZ2jOMhSW0c5rQ==
X-CSE-MsgGUID: VJttjtbWSkelDGgS/asbKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="87400024"
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; 
   d="scan'208";a="87400024"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 09:00:03 -0800
X-CSE-ConnectionGUID: CuZi8KQzTyKPZT1lcS4qYw==
X-CSE-MsgGUID: qdN3n4zEQ3SMbEA6WxseOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; 
   d="scan'208";a="243229596"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jan 2026 09:00:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhW88-00000000N7I-0e8c;
	Sun, 18 Jan 2026 17:00:00 +0000
Date: Mon, 19 Jan 2026 00:59:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 5904/6849]
 mm/tests/lazy_mmu_mode_kunit.c:70:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601190040.6mOkKwgU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/tests/lazy_mmu_mode_kunit.c:70:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kevin Brodsky <kevin.brodsky@arm.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Yeoreum Yun <yeoreum.yun@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
commit: 850392029608e14651b5b3529c06fd7d0c637727 [5904/6849] mm: add basic tests for lazy_mmu
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-123-20260118 (https://download.01.org/0day-ci/archive/20260119/202601190040.6mOkKwgU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601190040.6mOkKwgU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601190040.6mOkKwgU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/tests/lazy_mmu_mode_kunit.c:70:1: sparse: sparse: bad integer constant expression
   mm/tests/lazy_mmu_mode_kunit.c:70:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   mm/tests/lazy_mmu_mode_kunit.c:71:1: sparse: sparse: bad integer constant expression
   mm/tests/lazy_mmu_mode_kunit.c:71:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +70 mm/tests/lazy_mmu_mode_kunit.c

850392029608e1 Kevin Brodsky 2025-12-15  69  
850392029608e1 Kevin Brodsky 2025-12-15 @70  MODULE_DESCRIPTION("Tests for the lazy MMU mode");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
