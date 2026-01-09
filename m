Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434F572631
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Jan 2026 21:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767993287; cv=none; b=cTf5MI6sz9axh5YKFveGFj4eQTdRW9JuLEg8td/jw7r+xTG2Yw1Hs2Bm27ZDAwHH+W2ka2W3q0pDnQBUThgYXiNs2qq+BkQn+MuDEJWawFjS43lp48t9qnrnrB7ibLvZA9LbqXNVZROGDf2nyMo/UG7R5/aXRCG/mJfoGQw5hj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767993287; c=relaxed/simple;
	bh=Ph5LmAQBXap6JzSbwG+/RIMhaGsA7HFqS21934OIcK0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rlcB6kuM7uyn2xUqY76PaRe46E0CESDxgX+NatnSOURD/h88eGl2iBAwrTN2tLcd5+w0PbAHAOxaZOV9z831OQkUs0/tXsxp5bDgym5D1JlCC5CnBV0Al7HqoTtg3HXp3cb80pXKiVGF2nfSQB5X8f1YXTgGCZUQ4uAcod399xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cBuqdHtR; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cBuqdHtR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767993286; x=1799529286;
  h=date:from:to:cc:subject:message-id;
  bh=Ph5LmAQBXap6JzSbwG+/RIMhaGsA7HFqS21934OIcK0=;
  b=cBuqdHtRWniV3kbOquqguHybwYp+0ENQTlxH2m3Dt/kd0O4PkH9M+eWm
   QjgQOQ5s28Q34/BYFf1PcwGNKG5tO5kRCnLOx1GCNg836zuIQCw7klxYO
   3kJagn3Z0LajalVy+eR28I/r/0ILONIyXJ5iD2oSDtargjHXFty6WMeB3
   dXu+b6cFpaaMPFUKHs8U/YrhzT5s4yGq3EUmk9gxZ5lwyLj/NS3o9X0Kt
   SH9fuJPAwUWqXTJfrm7utspi7dmDqunZxvYn8oFrbgj/yIbTtm+f+YWBt
   mXyl66oyCd3KiKlIJdIggRwKtnZqKMSRzuA1ZMS7Ae1Nm/mbC4RtctdIU
   w==;
X-CSE-ConnectionGUID: m/YZqROeQ1qDLWW18f+a6A==
X-CSE-MsgGUID: qCziYbFvSDaHNuj2rj6kSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="56930546"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="56930546"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 13:14:46 -0800
X-CSE-ConnectionGUID: guqW0nZYTBi7Y6MCWDhuHA==
X-CSE-MsgGUID: xL6d1oY9RYWCRoNEXu+2OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="234765401"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Jan 2026 13:14:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veJog-000000007je-31LD;
	Fri, 09 Jan 2026 21:14:42 +0000
Date: Sat, 10 Jan 2026 05:14:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 4538/5095] lib/tests/glob_kunit.c:121:1:
 sparse: sparse: bad integer constant expression
Message-ID: <202601100548.UvlgFjxH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/tests/glob_kunit.c:121:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kir Chou <note351@hotmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
commit: 64d0dc4b74f71c987a80162860e45c46745b50a0 [4538/5095] lib/glob: convert selftest to KUnit
:::::: branch date: 17 hours ago
:::::: commit date: 2 days ago
config: microblaze-randconfig-r123-20260109 (https://download.01.org/0day-ci/archive/20260110/202601100548.UvlgFjxH-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601100548.UvlgFjxH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601100548.UvlgFjxH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/tests/glob_kunit.c:121:1: sparse: sparse: bad integer constant expression
   lib/tests/glob_kunit.c:121:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   lib/tests/glob_kunit.c:122:1: sparse: sparse: bad integer constant expression
   lib/tests/glob_kunit.c:122:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   lib/tests/glob_kunit.c:122:1: sparse: sparse: bad integer constant expression
   lib/tests/glob_kunit.c:122:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +121 lib/tests/glob_kunit.c

64d0dc4b74f71c Kir Chou 2026-01-07  119  
64d0dc4b74f71c Kir Chou 2026-01-07  120  kunit_test_suite(glob_test_suite);
64d0dc4b74f71c Kir Chou 2026-01-07 @121  MODULE_DESCRIPTION("Test cases for glob functions");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
